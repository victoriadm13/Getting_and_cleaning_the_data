# Load the data & assigning names

test <- read.table("test/X_test.txt")
colnames(test) <- features[,2]

test_labels <- read.table("test/y_test.txt")
colnames(test_labels) <- "activity"

subject_test <- read.table("test/subject_test.txt")
colnames(subject_test) <- "subject"

train <- read.table("train/X_train.txt")
colnames(train) <- features[,2]

train_labels <- read.table("train/y_train.txt")
colnames(train_labels) <- "activity"

subject_train <- read.table("train/subject_train.txt")
colnames(subject_train) <- "subject"

features <- read.table("features.txt")

activity <- read.table("activity_labels.txt")
colnames(activity) <- c('id' , 'activity')

# Merging the data

merge_test <- cbind(test, test_labels, subject_test)
merge_train <- cbind(train, train_labels, subject_train) 
merge_all <- rbind(merge_test, merge_train)

## Extracts only the measurements on the mean and standard deviation for each measurement.

colNames <- colnames(merge_all)

mean_std <- grep("-(mean|std)\\(\\)", colNames)

data <- merge_all[,mean_std]

## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

averages <- ddply(merge_all, .(subject, activity), function(x) colMeans(x[,1:66]))



