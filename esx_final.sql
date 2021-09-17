SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;



DROP TABLE IF EXISTS `accounts`;
CREATE TABLE IF NOT EXISTS `accounts` (
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `money` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `addon_account`;
CREATE TABLE IF NOT EXISTS `addon_account` (
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
('bank_savings', 'Bank Savings', 0),
('caution', 'caution', 0),
('property_black_money', 'Dirty Money Property', 0),
('society_ambulance', 'EMS', 1),
('society_banker', 'Banker', 1),
('society_cardealer', 'Cardealer', 1),
('society_mechanic', 'Mechanic', 1),
('society_police', 'Police', 1),
('society_realestateagent', 'Agent immobilier', 1),
('society_taxi', 'Taxi', 1);

DROP TABLE IF EXISTS `addon_account_data`;
CREATE TABLE IF NOT EXISTS `addon_account_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `money` int(11) NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  KEY `index_addon_account_data_account_name` (`account_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
(1, 'society_cardealer', 0, NULL),
(2, 'society_police', 0, NULL),
(3, 'society_ambulance', 0, NULL),
(4, 'society_mechanic', 0, NULL),
(5, 'society_taxi', 0, NULL);

DROP TABLE IF EXISTS `addon_inventory`;
CREATE TABLE IF NOT EXISTS `addon_inventory` (
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
('property', 'Property', 0),
('society_ambulance', 'EMS', 1),
('society_cardealer', 'Cardealer', 1),
('society_mechanic', 'Mechanic', 1),
('society_police', 'Police', 1),
('society_taxi', 'Taxi', 1);

DROP TABLE IF EXISTS `addon_inventory_items`;
CREATE TABLE IF NOT EXISTS `addon_inventory_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`),
  KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`),
  KEY `index_addon_inventory_inventory_name` (`inventory_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `billing`;
CREATE TABLE IF NOT EXISTS `billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `cardealer_vehicles`;
CREATE TABLE IF NOT EXISTS `cardealer_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `datastore`;
CREATE TABLE IF NOT EXISTS `datastore` (
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
('property', 'Property', 0),
('society_ambulance', 'EMS', 1),
('society_mechanic', 'Mechanic', 1),
('society_police', 'Police', 1),
('society_taxi', 'Taxi', 1),
('user_ears', 'Ears', 0),
('user_glasses', 'Glasses', 0),
('user_helmet', 'Helmet', 0),
('user_mask', 'Mask', 0);

DROP TABLE IF EXISTS `datastores`;
CREATE TABLE IF NOT EXISTS `datastores` (
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `datastore_data`;
CREATE TABLE IF NOT EXISTS `datastore_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  KEY `index_datastore_data_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
(1, 'society_police', NULL, '{}'),
(2, 'society_ambulance', NULL, '{}'),
(3, 'society_mechanic', NULL, '{}'),
(4, 'society_taxi', NULL, '{}');

DROP TABLE IF EXISTS `fine_types`;
CREATE TABLE IF NOT EXISTS `fine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `fine_types` (label, amount, category) VALUES
	('Misuse of a horn', 30, 0),
	('Illegally Crossing a continuous Line', 40, 0),
	('Driving on the wrong side of the road', 250, 0),
	('Illegal U-Turn', 250, 0),
	('Illegally Driving Off-road', 170, 0),
	('Refusing a Lawful Command', 30, 0),
	('Illegally Stopping a Vehicle', 150, 0),
	('Illegal Parking', 70, 0),
	('Failing to Yield to the right', 70, 0),
	('Failure to comply with Vehicle Information', 90, 0),
	('Failing to stop at a Stop Sign ', 105, 0),
	('Failing to stop at a Red Light', 130, 0),
	('Illegal Passing', 100, 0),
	('Driving an illegal Vehicle', 100, 0),
	('Driving without a License', 1500, 0),
	('Hit and Run', 800, 0),
	('Exceeding Speeds Over < 5 mph', 90, 0),
	('Exceeding Speeds Over 5-15 mph', 120, 0),
	('Exceeding Speeds Over 15-30 mph', 180, 0),
	('Exceeding Speeds Over > 30 mph', 300, 0),
	('Impeding traffic flow', 110, 1),
	('Public Intoxication', 90, 1),
	('Disorderly conduct', 90, 1),
	('Obstruction of Justice', 130, 1),
	('Insults towards Civilans', 75, 1),
	('Disrespecting of an LEO', 110, 1),
	('Verbal Threat towards a Civilan', 90, 1),
	('Verbal Threat towards an LEO', 150, 1),
	('Providing False Information', 250, 1),
	('Attempt of Corruption', 1500, 1),
	('Brandishing a weapon in city Limits', 120, 2),
	('Brandishing a Lethal Weapon in city Limits', 300, 2),
	('No Firearms License', 600, 2),
	('Possession of an Illegal Weapon', 700, 2),
	('Possession of Burglary Tools', 300, 2),
	('Grand Theft Auto', 1800, 2),
	('Intent to Sell/Distrube of an illegal Substance', 1500, 2),
	('Frabrication of an Illegal Substance', 1500, 2),
	('Possession of an Illegal Substance ', 650, 2),
	('Kidnapping of a Civilan', 1500, 2),
	('Kidnapping of an LEO', 2000, 2),
	('Robbery', 650, 2),
	('Armed Robbery of a Store', 650, 2),
	('Armed Robbery of a Bank', 1500, 2),
	('Assault on a Civilian', 2000, 3),
	('Assault of an LEO', 2500, 3),
	('Attempt of Murder of a Civilian', 3000, 3),
	('Attempt of Murder of an LEO', 5000, 3),
	('Murder of a Civilian', 10000, 3),
	('Murder of an LEO', 30000, 3),
	('Involuntary manslaughter', 1800, 3),
	('Fraud', 2000, 2);

DROP TABLE IF EXISTS `inventories`;
CREATE TABLE IF NOT EXISTS `inventories` (
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `items` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `inventories` (`name`, `owner`, `items`) VALUES
('test', NULL, '\"something\"');

DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` int(11) NOT NULL,
  `rare` int(11) NOT NULL,
  `can_remove` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
('alive_chicken', 'Living chicken', 1, 0, 1),
('bandage', 'Bandage', 2, 0, 1),
('beer', 'Beer', 1, 0, 0),
('blowpipe', 'Blowtorch', 2, 0, 1),
('bread', 'Bread', 1, 0, 1),
('cannabis', 'Cannabis', 3, 0, 1),
('carokit', 'Body Kit', 3, 0, 1),
('carotool', 'Tools', 2, 0, 1),
('clothe', 'Cloth', 1, 0, 1),
('copper', 'Copper', 1, 0, 1),
('cutted_wood', 'Cut wood', 1, 0, 1),
('diamond', 'Diamond', 1, 0, 1),
('essence', 'Gas', 1, 0, 1),
('fabric', 'Fabric', 1, 0, 1),
('fish', 'Fish', 1, 0, 1),
('fixkit', 'Repair Kit', 3, 0, 1),
('fixtool', 'Repair Tools', 2, 0, 1),
('gazbottle', 'Gas Bottle', 2, 0, 1),
('gold', 'Gold', 1, 0, 1),
('iron', 'Iron', 1, 0, 1),
('marijuana', 'Marijuana', 2, 0, 1),
('medikit', 'Medikit', 2, 0, 1),
('packaged_chicken', 'Chicken fillet', 1, 0, 1),
('packaged_plank', 'Packaged wood', 1, 0, 1),
('petrol', 'Oil', 1, 0, 1),
('petrol_raffin', 'Processed oil', 1, 0, 1),
('phone', 'Phone', 1, 0, 1),
('slaughtered_chicken', 'Slaughtered chicken', 1, 0, 1),
('stone', 'Stone', 1, 0, 1),
('washed_stone', 'Washed stone', 1, 0, 1),
('water', 'Water', 1, 0, 1),
('wood', 'Wood', 1, 0, 1),
('parkingcard', 'Parking Card', 0, 0, 0),
('wool', 'Wool', 1, 0, 1);

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('ambulance', 'EMS', 0),
('banker', 'Banker', 0),
('cardealer', 'Cardealer', 0),
('fisherman', 'Fisherman', 0),
('fueler', 'Fueler', 0),
('lumberjack', 'Lumberjack', 0),
('mechanic', 'Mechanic', 0),
('miner', 'Miner', 0),
('police', 'LSPD', 0),
('realestateagent', 'Real Estate Agent', 0),
('reporter', 'Reporter', 0),
('slaughterer', 'Butcher', 0),
('tailor', 'Tailor', 0),
('taxi', 'Taxi', 0),
('unemployed', 'Unemployed', 0);

DROP TABLE IF EXISTS `job_grades`;
CREATE TABLE IF NOT EXISTS `job_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `skin_female` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `job_name` (`job_name`),
  KEY `grade` (`grade`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(1, 'unemployed', 0, 'unemployed', 'Unemployed', 200, '{}', '{}'),
(2, 'ambulance', 0, 'ambulance', 'Paramedic', 20, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(3, 'ambulance', 1, 'doctor', 'Doctor', 40, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(4, 'ambulance', 2, 'chief_doctor', 'Chief doctor', 60, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(5, 'ambulance', 3, 'boss', 'Surgeon', 80, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(6, 'banker', 0, 'advisor', 'Advisor', 10, '{}', '{}'),
(7, 'banker', 1, 'banker', 'Banker', 20, '{}', '{}'),
(8, 'banker', 2, 'business_banker', 'Investment banker', 30, '{}', '{}'),
(9, 'banker', 3, 'trader', 'Trader', 40, '{}', '{}'),
(10, 'banker', 4, 'boss', 'Boss', 0, '{}', '{}'),
(11, 'lumberjack', 0, 'employee', 'Employee', 0, '{}', '{}'),
(12, 'fisherman', 0, 'employee', 'Employee', 0, '{}', '{}'),
(13, 'fueler', 0, 'employee', 'Employee', 0, '{}', '{}'),
(14, 'reporter', 0, 'employee', 'Employee', 0, '{}', '{}'),
(15, 'tailor', 0, 'employee', 'Employee', 0, '{\"mask_1\":0,\"arms\":1,\"glasses_1\":0,\"hair_color_2\":4,\"makeup_1\":0,\"face\":19,\"glasses\":0,\"mask_2\":0,\"makeup_3\":0,\"skin\":29,\"helmet_2\":0,\"lipstick_4\":0,\"sex\":0,\"torso_1\":24,\"makeup_2\":0,\"bags_2\":0,\"chain_2\":0,\"ears_1\":-1,\"bags_1\":0,\"bproof_1\":0,\"shoes_2\":0,\"lipstick_2\":0,\"chain_1\":0,\"tshirt_1\":0,\"eyebrows_3\":0,\"pants_2\":0,\"beard_4\":0,\"torso_2\":0,\"beard_2\":6,\"ears_2\":0,\"hair_2\":0,\"shoes_1\":36,\"tshirt_2\":0,\"beard_3\":0,\"hair_1\":2,\"hair_color_1\":0,\"pants_1\":48,\"helmet_1\":-1,\"bproof_2\":0,\"eyebrows_4\":0,\"eyebrows_2\":0,\"decals_1\":0,\"age_2\":0,\"beard_1\":5,\"shoes\":10,\"lipstick_1\":0,\"eyebrows_1\":0,\"glasses_2\":0,\"makeup_4\":0,\"decals_2\":0,\"lipstick_3\":0,\"age_1\":0}', '{\"mask_1\":0,\"arms\":5,\"glasses_1\":5,\"hair_color_2\":4,\"makeup_1\":0,\"face\":19,\"glasses\":0,\"mask_2\":0,\"makeup_3\":0,\"skin\":29,\"helmet_2\":0,\"lipstick_4\":0,\"sex\":1,\"torso_1\":52,\"makeup_2\":0,\"bags_2\":0,\"chain_2\":0,\"ears_1\":-1,\"bags_1\":0,\"bproof_1\":0,\"shoes_2\":1,\"lipstick_2\":0,\"chain_1\":0,\"tshirt_1\":23,\"eyebrows_3\":0,\"pants_2\":0,\"beard_4\":0,\"torso_2\":0,\"beard_2\":6,\"ears_2\":0,\"hair_2\":0,\"shoes_1\":42,\"tshirt_2\":4,\"beard_3\":0,\"hair_1\":2,\"hair_color_1\":0,\"pants_1\":36,\"helmet_1\":-1,\"bproof_2\":0,\"eyebrows_4\":0,\"eyebrows_2\":0,\"decals_1\":0,\"age_2\":0,\"beard_1\":5,\"shoes\":10,\"lipstick_1\":0,\"eyebrows_1\":0,\"glasses_2\":0,\"makeup_4\":0,\"decals_2\":0,\"lipstick_3\":0,\"age_1\":0}'),
(16, 'miner', 0, 'employee', 'Employee', 0, '{\"tshirt_2\":1,\"ears_1\":8,\"glasses_1\":15,\"torso_2\":0,\"ears_2\":2,\"glasses_2\":3,\"shoes_2\":1,\"pants_1\":75,\"shoes_1\":51,\"bags_1\":0,\"helmet_2\":0,\"pants_2\":7,\"torso_1\":71,\"tshirt_1\":59,\"arms\":2,\"bags_2\":0,\"helmet_1\":0}', '{}'),
(17, 'slaughterer', 0, 'employee', 'Employee', 0, '{\"age_1\":0,\"glasses_2\":0,\"beard_1\":5,\"decals_2\":0,\"beard_4\":0,\"shoes_2\":0,\"tshirt_2\":0,\"lipstick_2\":0,\"hair_2\":0,\"arms\":67,\"pants_1\":36,\"skin\":29,\"eyebrows_2\":0,\"shoes\":10,\"helmet_1\":-1,\"lipstick_1\":0,\"helmet_2\":0,\"hair_color_1\":0,\"glasses\":0,\"makeup_4\":0,\"makeup_1\":0,\"hair_1\":2,\"bproof_1\":0,\"bags_1\":0,\"mask_1\":0,\"lipstick_3\":0,\"chain_1\":0,\"eyebrows_4\":0,\"sex\":0,\"torso_1\":56,\"beard_2\":6,\"shoes_1\":12,\"decals_1\":0,\"face\":19,\"lipstick_4\":0,\"tshirt_1\":15,\"mask_2\":0,\"age_2\":0,\"eyebrows_3\":0,\"chain_2\":0,\"glasses_1\":0,\"ears_1\":-1,\"bags_2\":0,\"ears_2\":0,\"torso_2\":0,\"bproof_2\":0,\"makeup_2\":0,\"eyebrows_1\":0,\"makeup_3\":0,\"pants_2\":0,\"beard_3\":0,\"hair_color_2\":4}', '{\"age_1\":0,\"glasses_2\":0,\"beard_1\":5,\"decals_2\":0,\"beard_4\":0,\"shoes_2\":0,\"tshirt_2\":0,\"lipstick_2\":0,\"hair_2\":0,\"arms\":72,\"pants_1\":45,\"skin\":29,\"eyebrows_2\":0,\"shoes\":10,\"helmet_1\":-1,\"lipstick_1\":0,\"helmet_2\":0,\"hair_color_1\":0,\"glasses\":0,\"makeup_4\":0,\"makeup_1\":0,\"hair_1\":2,\"bproof_1\":0,\"bags_1\":0,\"mask_1\":0,\"lipstick_3\":0,\"chain_1\":0,\"eyebrows_4\":0,\"sex\":1,\"torso_1\":49,\"beard_2\":6,\"shoes_1\":24,\"decals_1\":0,\"face\":19,\"lipstick_4\":0,\"tshirt_1\":9,\"mask_2\":0,\"age_2\":0,\"eyebrows_3\":0,\"chain_2\":0,\"glasses_1\":5,\"ears_1\":-1,\"bags_2\":0,\"ears_2\":0,\"torso_2\":0,\"bproof_2\":0,\"makeup_2\":0,\"eyebrows_1\":0,\"makeup_3\":0,\"pants_2\":0,\"beard_3\":0,\"hair_color_2\":4}'),
(18, 'mechanic', 0, 'recrue', 'Recruit', 12, '{}', '{}'),
(19, 'mechanic', 1, 'novice', 'beginner', 24, '{}', '{}'),
(20, 'mechanic', 2, 'experimente', 'experienced', 36, '{}', '{}'),
(21, 'mechanic', 3, 'chief', 'Leader', 48, '{}', '{}'),
(22, 'mechanic', 4, 'boss', 'Boss', 0, '{}', '{}'),
(23, 'police', 0, 'recruit', 'Recruit', 20, '{}', '{}'),
(24, 'police', 1, 'officer', 'Officier', 40, '{}', '{}'),
(25, 'police', 2, 'sergeant', 'Sergent', 60, '{}', '{}'),
(26, 'police', 3, 'lieutenant', 'Lieutenant', 85, '{}', '{}'),
(27, 'police', 4, 'boss', 'Commandant', 100, '{}', '{}'),
(28, 'realestateagent', 0, 'location', 'Employee', 10, '{}', '{}'),
(29, 'realestateagent', 1, 'vendeur', 'Seller', 25, '{}', '{}'),
(30, 'realestateagent', 2, 'gestion', 'Management', 40, '{}', '{}'),
(31, 'realestateagent', 3, 'boss', 'Boss', 0, '{}', '{}'),
(32, 'taxi', 0, 'recrue', 'Recruit', 12, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":32,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":31,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":0,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":27,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(33, 'taxi', 1, 'novice', 'Novice', 24, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":32,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":31,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":0,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":27,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(34, 'taxi', 2, 'experimente', 'Experienced', 36, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":26,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":57,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":4,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":11,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(35, 'taxi', 3, 'uber', 'Uber', 48, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":26,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":57,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":4,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":11,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(36, 'taxi', 4, 'boss', 'Boss', 0, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":29,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":31,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":4,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":1,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":4,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(37, 'cardealer', 0, 'recruit', 'Recruit', 10, '{}', '{}'),
(38, 'cardealer', 1, 'novice', 'Novice', 25, '{}', '{}'),
(39, 'cardealer', 2, 'experienced', 'Experienced', 40, '{}', '{}'),
(40, 'cardealer', 3, 'boss', 'Boss', 0, '{}', '{}');

DROP TABLE IF EXISTS `licenses`;
CREATE TABLE IF NOT EXISTS `licenses` (
  `type` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `licenses` (`type`, `label`) VALUES
('boat', 'Boat License'),
('dmv', 'Traffic Laws'),
('drive', 'Drivers license'),
('drive_bike', 'Motorcycle licence'),
('drive_truck', 'Truck license'),
('weapon', 'Weapon License'),
('weed_processing', 'Weed Processing License'),
('aircraft', 'Aircraft License'),
('boating', 'Boating License');

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` (`id`, `module`, `last`) VALUES
(1, 'skin', 0),
(2, 'society', 0);

DROP TABLE IF EXISTS `owned_properties`;
CREATE TABLE IF NOT EXISTS `owned_properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `rented` int(11) NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `owned_vehicles` (
	`owner` varchar(40) NOT NULL,
	`plate` varchar(12) NOT NULL,
	`vehicle` longtext NOT NULL,
	`type` VARCHAR(20) NOT NULL DEFAULT 'car',
	`job` VARCHAR(20) NOT NULL DEFAULT 'civ',
	`category` VARCHAR(50) DEFAULT NULL,
	`name` varchar(60) NOT NULL DEFAULT 'Unknown',
	`fuel` int(11) NOT NULL DEFAULT '100',
	`stored` TINYINT(1) NOT NULL DEFAULT '0',
	`image` longtext DEFAULT NULL,

	PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `properties`;
CREATE TABLE IF NOT EXISTS `properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entering` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inside` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `outside` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ipls` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '[]',
  `gateway` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_single` int(11) DEFAULT NULL,
  `is_room` int(11) DEFAULT NULL,
  `is_gateway` int(11) DEFAULT NULL,
  `room_menu` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
(1, 'WhispymoundDrive', '2677 Whispymound Drive', '{\"y\":564.89,\"z\":182.959,\"x\":119.384}', '{\"x\":117.347,\"y\":559.506,\"z\":183.304}', '{\"y\":557.032,\"z\":183.301,\"x\":118.037}', '{\"y\":567.798,\"z\":182.131,\"x\":119.249}', '[]', NULL, 1, 1, 0, '{\"x\":118.748,\"y\":566.573,\"z\":175.697}', 1500000),
(2, 'NorthConkerAvenue2045', '2045 North Conker Avenue', '{\"x\":372.796,\"y\":428.327,\"z\":144.685}', '{\"x\":373.548,\"y\":422.982,\"z\":144.907}', '{\"y\":420.075,\"z\":145.904,\"x\":372.161}', '{\"x\":372.454,\"y\":432.886,\"z\":143.443}', '[]', NULL, 1, 1, 0, '{\"x\":377.349,\"y\":429.422,\"z\":137.3}', 1500000),
(3, 'RichardMajesticApt2', 'Richard Majestic, Apt 2', '{\"y\":-379.165,\"z\":37.961,\"x\":-936.363}', '{\"y\":-365.476,\"z\":113.274,\"x\":-913.097}', '{\"y\":-367.637,\"z\":113.274,\"x\":-918.022}', '{\"y\":-382.023,\"z\":37.961,\"x\":-943.626}', '[]', NULL, 1, 1, 0, '{\"x\":-927.554,\"y\":-377.744,\"z\":112.674}', 1700000),
(4, 'NorthConkerAvenue2044', '2044 North Conker Avenue', '{\"y\":440.8,\"z\":146.702,\"x\":346.964}', '{\"y\":437.456,\"z\":148.394,\"x\":341.683}', '{\"y\":435.626,\"z\":148.394,\"x\":339.595}', '{\"x\":350.535,\"y\":443.329,\"z\":145.764}', '[]', NULL, 1, 1, 0, '{\"x\":337.726,\"y\":436.985,\"z\":140.77}', 1500000),
(5, 'WildOatsDrive', '3655 Wild Oats Drive', '{\"y\":502.696,\"z\":136.421,\"x\":-176.003}', '{\"y\":497.817,\"z\":136.653,\"x\":-174.349}', '{\"y\":495.069,\"z\":136.666,\"x\":-173.331}', '{\"y\":506.412,\"z\":135.0664,\"x\":-177.927}', '[]', NULL, 1, 1, 0, '{\"x\":-174.725,\"y\":493.095,\"z\":129.043}', 1500000),
(6, 'HillcrestAvenue2862', '2862 Hillcrest Avenue', '{\"y\":596.58,\"z\":142.641,\"x\":-686.554}', '{\"y\":591.988,\"z\":144.392,\"x\":-681.728}', '{\"y\":590.608,\"z\":144.392,\"x\":-680.124}', '{\"y\":599.019,\"z\":142.059,\"x\":-689.492}', '[]', NULL, 1, 1, 0, '{\"x\":-680.46,\"y\":588.6,\"z\":136.769}', 1500000),
(7, 'LowEndApartment', 'Appartement de base', '{\"y\":-1078.735,\"z\":28.4031,\"x\":292.528}', '{\"y\":-1007.152,\"z\":-102.002,\"x\":265.845}', '{\"y\":-1002.802,\"z\":-100.008,\"x\":265.307}', '{\"y\":-1078.669,\"z\":28.401,\"x\":296.738}', '[]', NULL, 1, 1, 0, '{\"x\":265.916,\"y\":-999.38,\"z\":-100.008}', 562500),
(8, 'MadWayneThunder', '2113 Mad Wayne Thunder', '{\"y\":454.955,\"z\":96.462,\"x\":-1294.433}', '{\"x\":-1289.917,\"y\":449.541,\"z\":96.902}', '{\"y\":446.322,\"z\":96.899,\"x\":-1289.642}', '{\"y\":455.453,\"z\":96.517,\"x\":-1298.851}', '[]', NULL, 1, 1, 0, '{\"x\":-1287.306,\"y\":455.901,\"z\":89.294}', 1500000),
(9, 'HillcrestAvenue2874', '2874 Hillcrest Avenue', '{\"x\":-853.346,\"y\":696.678,\"z\":147.782}', '{\"y\":690.875,\"z\":151.86,\"x\":-859.961}', '{\"y\":688.361,\"z\":151.857,\"x\":-859.395}', '{\"y\":701.628,\"z\":147.773,\"x\":-855.007}', '[]', NULL, 1, 1, 0, '{\"x\":-858.543,\"y\":697.514,\"z\":144.253}', 1500000),
(10, 'HillcrestAvenue2868', '2868 Hillcrest Avenue', '{\"y\":620.494,\"z\":141.588,\"x\":-752.82}', '{\"y\":618.62,\"z\":143.153,\"x\":-759.317}', '{\"y\":617.629,\"z\":143.153,\"x\":-760.789}', '{\"y\":621.281,\"z\":141.254,\"x\":-750.919}', '[]', NULL, 1, 1, 0, '{\"x\":-762.504,\"y\":618.992,\"z\":135.53}', 1500000),
(11, 'TinselTowersApt12', 'Tinsel Towers, Apt 42', '{\"y\":37.025,\"z\":42.58,\"x\":-618.299}', '{\"y\":58.898,\"z\":97.2,\"x\":-603.301}', '{\"y\":58.941,\"z\":97.2,\"x\":-608.741}', '{\"y\":30.603,\"z\":42.524,\"x\":-620.017}', '[]', NULL, 1, 1, 0, '{\"x\":-622.173,\"y\":54.585,\"z\":96.599}', 1700000),
(12, 'MiltonDrive', 'Milton Drive', '{\"x\":-775.17,\"y\":312.01,\"z\":84.658}', NULL, NULL, '{\"x\":-775.346,\"y\":306.776,\"z\":84.7}', '[]', NULL, 0, 0, 1, NULL, 0),
(13, 'Modern1Apartment', 'Appartement Moderne 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_01_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.661,\"y\":327.672,\"z\":210.396}', 1300000),
(14, 'Modern2Apartment', 'Appartement Moderne 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_01_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.735,\"y\":326.757,\"z\":186.313}', 1300000),
(15, 'Modern3Apartment', 'Appartement Moderne 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_01_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.386,\"y\":330.782,\"z\":195.08}', 1300000),
(16, 'Mody1Apartment', 'Appartement Mode 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_02_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.615,\"y\":327.878,\"z\":210.396}', 1300000),
(17, 'Mody2Apartment', 'Appartement Mode 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_02_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.297,\"y\":327.092,\"z\":186.313}', 1300000),
(18, 'Mody3Apartment', 'Appartement Mode 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_02_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.303,\"y\":330.932,\"z\":195.085}', 1300000),
(19, 'Vibrant1Apartment', 'Appartement Vibrant 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_03_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.885,\"y\":327.641,\"z\":210.396}', 1300000),
(20, 'Vibrant2Apartment', 'Appartement Vibrant 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_03_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.607,\"y\":327.344,\"z\":186.313}', 1300000),
(21, 'Vibrant3Apartment', 'Appartement Vibrant 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_03_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.525,\"y\":330.851,\"z\":195.085}', 1300000),
(22, 'Sharp1Apartment', 'Appartement Persan 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_04_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.527,\"y\":327.89,\"z\":210.396}', 1300000),
(23, 'Sharp2Apartment', 'Appartement Persan 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_04_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.642,\"y\":326.497,\"z\":186.313}', 1300000),
(24, 'Sharp3Apartment', 'Appartement Persan 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_04_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.503,\"y\":331.318,\"z\":195.085}', 1300000),
(25, 'Monochrome1Apartment', 'Appartement Monochrome 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_05_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.289,\"y\":328.086,\"z\":210.396}', 1300000),
(26, 'Monochrome2Apartment', 'Appartement Monochrome 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_05_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.692,\"y\":326.762,\"z\":186.313}', 1300000),
(27, 'Monochrome3Apartment', 'Appartement Monochrome 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_05_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.094,\"y\":330.976,\"z\":195.085}', 1300000),
(28, 'Seductive1Apartment', 'Appartement Séduisant 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_06_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.263,\"y\":328.104,\"z\":210.396}', 1300000),
(29, 'Seductive2Apartment', 'Appartement Séduisant 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_06_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.655,\"y\":326.611,\"z\":186.313}', 1300000),
(30, 'Seductive3Apartment', 'Appartement Séduisant 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_06_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.3,\"y\":331.414,\"z\":195.085}', 1300000),
(31, 'Regal1Apartment', 'Appartement Régal 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_07_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.956,\"y\":328.257,\"z\":210.396}', 1300000),
(32, 'Regal2Apartment', 'Appartement Régal 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_07_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.545,\"y\":326.659,\"z\":186.313}', 1300000),
(33, 'Regal3Apartment', 'Appartement Régal 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_07_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.087,\"y\":331.429,\"z\":195.123}', 1300000),
(34, 'Aqua1Apartment', 'Appartement Aqua 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_08_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.187,\"y\":328.47,\"z\":210.396}', 1300000),
(35, 'Aqua2Apartment', 'Appartement Aqua 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_08_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.658,\"y\":326.563,\"z\":186.313}', 1300000),
(36, 'Aqua3Apartment', 'Appartement Aqua 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_08_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.287,\"y\":331.084,\"z\":195.086}', 1300000),
(37, 'IntegrityWay', '4 Integrity Way', '{\"x\":-47.804,\"y\":-585.867,\"z\":36.956}', NULL, NULL, '{\"x\":-54.178,\"y\":-583.762,\"z\":35.798}', '[]', NULL, 0, 0, 1, NULL, 0),
(38, 'IntegrityWay28', '4 Integrity Way - Apt 28', NULL, '{\"x\":-31.409,\"y\":-594.927,\"z\":79.03}', '{\"x\":-26.098,\"y\":-596.909,\"z\":79.03}', NULL, '[]', 'IntegrityWay', 0, 1, 0, '{\"x\":-11.923,\"y\":-597.083,\"z\":78.43}', 1700000),
(39, 'IntegrityWay30', '4 Integrity Way - Apt 30', NULL, '{\"x\":-17.702,\"y\":-588.524,\"z\":89.114}', '{\"x\":-16.21,\"y\":-582.569,\"z\":89.114}', NULL, '[]', 'IntegrityWay', 0, 1, 0, '{\"x\":-26.327,\"y\":-588.384,\"z\":89.123}', 1700000),
(40, 'DellPerroHeights', 'Dell Perro Heights', '{\"x\":-1447.06,\"y\":-538.28,\"z\":33.74}', NULL, NULL, '{\"x\":-1440.022,\"y\":-548.696,\"z\":33.74}', '[]', NULL, 0, 0, 1, NULL, 0),
(41, 'DellPerroHeightst4', 'Dell Perro Heights - Apt 28', NULL, '{\"x\":-1452.125,\"y\":-540.591,\"z\":73.044}', '{\"x\":-1455.435,\"y\":-535.79,\"z\":73.044}', NULL, '[]', 'DellPerroHeights', 0, 1, 0, '{\"x\":-1467.058,\"y\":-527.571,\"z\":72.443}', 1700000),
(42, 'DellPerroHeightst7', 'Dell Perro Heights - Apt 30', NULL, '{\"x\":-1451.562,\"y\":-523.535,\"z\":55.928}', '{\"x\":-1456.02,\"y\":-519.209,\"z\":55.929}', NULL, '[]', 'DellPerroHeights', 0, 1, 0, '{\"x\":-1457.026,\"y\":-530.219,\"z\":55.937}', 1700000),
(43, 'MazeBankBuilding', 'Maze Bank Building', '{\"x\":-79.18,\"y\":-795.92,\"z\":43.35}', NULL, NULL, '{\"x\":-72.50,\"y\":-786.92,\"z\":43.40}', '[]', NULL, 0, 0, 1, NULL, 0),
(44, 'OldSpiceWarm', 'Old Spice Warm', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_01a\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
(45, 'OldSpiceClassical', 'Old Spice Classical', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_01b\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
(46, 'OldSpiceVintage', 'Old Spice Vintage', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_01c\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
(47, 'ExecutiveRich', 'Executive Rich', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_02b\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
(48, 'ExecutiveCool', 'Executive Cool', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_02c\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
(49, 'ExecutiveContrast', 'Executive Contrast', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_02a\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
(50, 'PowerBrokerIce', 'Power Broker Ice', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_03a\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
(51, 'PowerBrokerConservative', 'Power Broker Conservative', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_03b\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
(52, 'PowerBrokerPolished', 'Power Broker Polished', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_03c\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
(53, 'LomBank', 'Lom Bank', '{\"x\":-1581.36,\"y\":-558.23,\"z\":34.07}', NULL, NULL, '{\"x\":-1583.60,\"y\":-555.12,\"z\":34.07}', '[]', NULL, 0, 0, 1, NULL, 0),
(54, 'LBOldSpiceWarm', 'LB Old Spice Warm', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_01a\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
(55, 'LBOldSpiceClassical', 'LB Old Spice Classical', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_01b\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
(56, 'LBOldSpiceVintage', 'LB Old Spice Vintage', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_01c\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
(57, 'LBExecutiveRich', 'LB Executive Rich', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_02b\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
(58, 'LBExecutiveCool', 'LB Executive Cool', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_02c\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
(59, 'LBExecutiveContrast', 'LB Executive Contrast', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_02a\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
(60, 'LBPowerBrokerIce', 'LB Power Broker Ice', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_03a\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
(61, 'LBPowerBrokerConservative', 'LB Power Broker Conservative', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_03b\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
(62, 'LBPowerBrokerPolished', 'LB Power Broker Polished', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_03c\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
(63, 'MazeBankWest', 'Maze Bank West', '{\"x\":-1379.58,\"y\":-499.63,\"z\":32.22}', NULL, NULL, '{\"x\":-1378.95,\"y\":-502.82,\"z\":32.22}', '[]', NULL, 0, 0, 1, NULL, 0),
(64, 'MBWOldSpiceWarm', 'MBW Old Spice Warm', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_01a\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
(65, 'MBWOldSpiceClassical', 'MBW Old Spice Classical', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_01b\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
(66, 'MBWOldSpiceVintage', 'MBW Old Spice Vintage', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_01c\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
(67, 'MBWExecutiveRich', 'MBW Executive Rich', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_02b\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
(68, 'MBWExecutiveCool', 'MBW Executive Cool', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_02c\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
(69, 'MBWExecutive Contrast', 'MBW Executive Contrast', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_02a\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
(70, 'MBWPowerBrokerIce', 'MBW Power Broker Ice', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_03a\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
(71, 'MBWPowerBrokerConvservative', 'MBW Power Broker Convservative', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_03b\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
(72, 'MBWPowerBrokerPolished', 'MBW Power Broker Polished', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_03c\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
(100, 'MedEndApartment1', 'Medium Apartment 1', '{"y":3107.56,"z":41.49,"x":240.6}', '{"y":-1012.27,"z":-100.2,"x":346.49}', '{"y":-1000.09,"z":-100.2,"x":347.06}', '{"y":3100.77,"z":41.49,"x":240.21}', '[]', NULL, 1, 1, 0, '{"x":345.3,"y":-995.24,"z":-100.2}', 500000),
(101, 'MedEndApartment2', 'Medium Apartment 2', '{"y":3169.1,"z":41.81,"x":246.7}', '{"y":-1012.27,"z":-100.2,"x":346.49}', '{"y":-1000.09,"z":-100.2,"x":347.06}', '{"y":3163.97,"z":41.82,"x":245.83}', '[]', NULL, 1, 1, 0, '{"x":345.3,"y":-995.24,"z":-100.2}', 500000),
(102, 'MedEndApartment3', 'Medium Apartment 3', '{"y":2667.22,"z":39.06,"x":980.38}', '{"y":-1012.27,"z":-100.2,"x":346.49}', '{"y":-1000.09,"z":-100.2,"x":347.06}', '{"y":2668.77,"z":39.06,"x":986.38}', '[]', NULL, 1, 1, 0, '{"x":345.3,"y":-995.24,"z":-100.2}', 500000),
(103, 'MedEndApartment4', 'Medium Apartment 4', '{"y":3031.08,"z":42.89,"x":195.85}', '{"y":-1012.27,"z":-100.2,"x":346.49}', '{"y":-1000.09,"z":-100.2,"x":347.06}', '{"y":3031.39,"z":42.27,"x":200.68}', '[]', NULL, 1, 1, 0, '{"x":345.3,"y":-995.24,"z":-100.2}', 500000),
(104, 'MedEndApartment5', 'Medium Apartment 5', '{"y":4642.17,"z":42.88,"x":1724.43}', '{"y":-1012.27,"z":-100.2,"x":346.49}', '{"y":-1000.09,"z":-100.2,"x":347.06}', '{"y":4637.34,"z":42.31,"x":1724.27}', '[]', NULL, 1, 1, 0, '{"x":345.3,"y":-995.24,"z":-100.2}', 500000),
(105, 'MedEndApartment6', 'Medium Apartment 6', '{"y":4739.73,"z":40.99,"x":1664.98}', '{"y":-1012.27,"z":-100.2,"x":346.49}', '{"y":-1000.09,"z":-100.2,"x":347.06}', '{"y":4740.93,"z":41.08,"x":1670.92}', '[]', NULL, 1, 1, 0, '{"x":345.3,"y":-995.24,"z":-100.2}', 500000),
(106, 'MedEndApartment7', 'Medium Apartment 7', '{"y":6577.19,"z":31.74,"x":12.57}', '{"y":-1012.27,"z":-100.2,"x":346.49}', '{"y":-1000.09,"z":-100.2,"x":347.06}', '{"y":6572.61,"z":31.72,"x":16.93}', '[]', NULL, 1, 1, 0, '{"x":345.3,"y":-995.24,"z":-100.2}', 500000),
(107, 'MedEndApartment8', 'Medium Apartment 8', '{"y":6190.84,"z":30.73,"x":-374.31}', '{"y":-1012.27,"z":-100.2,"x":346.49}', '{"y":-1000.09,"z":-100.2,"x":347.06}', '{"y":6186.58,"z":30.52,"x":-372.65}', '[]', NULL, 1, 1, 0, '{"x":345.3,"y":-995.24,"z":-100.2}', 500000),
(108, 'MedEndApartment9', 'Medium Apartment 9', '{"y":6597.56,"z":30.86,"x":-27.06}', '{"y":-1012.27,"z":-100.2,"x":346.49}', '{"y":-1000.09,"z":-100.2,"x":347.06}', '{"y":6601.55,"z":30.44,"x":-30.55}', '[]', NULL, 1, 1, 0, '{"x":345.3,"y":-995.24,"z":-100.2}', 500000),
(109, 'MedEndApartment10', 'Medium Apartment 10', '{"y":6340.1,"z":28.84,"x":-367.33}', '{"y":-1012.27,"z":-100.2,"x":346.49}', '{"y":-1000.09,"z":-100.2,"x":347.06}', '{"y":6336.97,"z":28.84,"x":-371.3}', '[]', NULL, 1, 1, 0, '{"x":345.3,"y":-995.24,"z":-100.2}', 500000);

DROP TABLE IF EXISTS `rented_vehicles`;
CREATE TABLE IF NOT EXISTS `rented_vehicles` (
  `vehicle` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plate` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `player_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `shops`;
CREATE TABLE IF NOT EXISTS `shops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `store` (`store`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `shops` (`id`, `store`, `item`, `price`) VALUES
(1, 'TwentyFourSeven', 'bread', 30),
(2, 'TwentyFourSeven', 'water', 15),
(3, 'RobsLiquor', 'bread', 30),
(4, 'RobsLiquor', 'water', 15),
(5, 'LTDgasoline', 'bread', 30),
(6, 'LTDgasoline', 'water', 15),
(7, 'TwentyFourSeven', 'beer', 45),
(8, 'RobsLiquor', 'beer', 45),
(9, 'LTDgasoline', 'beer', 45);

DROP TABLE IF EXISTS `society_moneywash`;
CREATE TABLE IF NOT EXISTS `society_moneywash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `society` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `identifier` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accounts` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT 'user',
  `inventory` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `loadout` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '{"x":-269.4,"y":-955.3,"z":31.2,"heading":205.8}',
  `is_dead` int(11) DEFAULT 0,
  `dob` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_male` int(11) DEFAULT 1,
  `accessories` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstname` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dateofbirth` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sex` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `last_property` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skin` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`identifier`),
  UNIQUE KEY `index_users_phone_number` (`phone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `user_contacts`;
CREATE TABLE IF NOT EXISTS `user_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_contacts_identifier_name_number` (`identifier`,`name`,`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `user_licenses`;
CREATE TABLE IF NOT EXISTS `user_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `user_parkings`;
CREATE TABLE IF NOT EXISTS `user_parkings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `garage` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zone` int(11) NOT NULL,
  `vehicle` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `vehicles`;
CREATE TABLE IF NOT EXISTS `vehicles` (
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
('Adder', 'adder', 900000, 'super'),
('Akuma', 'AKUMA', 7500, 'motorcycles'),
('Alpha', 'alpha', 60000, 'sports'),
('Ardent', 'ardent', 1150000, 'sportsclassics'),
('Asea', 'asea', 5500, 'sedans'),
('Autarch', 'autarch', 1955000, 'super'),
('Avarus', 'avarus', 18000, 'motorcycles'),
('Bagger', 'bagger', 13500, 'motorcycles'),
('Baller', 'baller2', 40000, 'suvs'),
('Baller Sport', 'baller3', 60000, 'suvs'),
('Banshee', 'banshee', 70000, 'sports'),
('Banshee 900R', 'banshee2', 255000, 'super'),
('Bati 801', 'bati', 12000, 'motorcycles'),
('Bati 801RR', 'bati2', 19000, 'motorcycles'),
('Bestia GTS', 'bestiagts', 55000, 'sports'),
('BF400', 'bf400', 6500, 'motorcycles'),
('Bf Injection', 'bfinjection', 16000, 'offroad'),
('Bifta', 'bifta', 12000, 'offroad'),
('Bison', 'bison', 45000, 'vans'),
('Blade', 'blade', 15000, 'muscle'),
('Blazer', 'blazer', 6500, 'offroad'),
('Blazer Sport', 'blazer4', 8500, 'offroad'),
('blazer5', 'blazer5', 1755600, 'offroad'),
('Blista', 'blista', 8000, 'compacts'),
('BMX (velo)', 'bmx', 160, 'motorcycles'),
('Bobcat XL', 'bobcatxl', 32000, 'vans'),
('Brawler', 'brawler', 45000, 'offroad'),
('Brioso R/A', 'brioso', 18000, 'compacts'),
('Btype', 'btype', 62000, 'sportsclassics'),
('Btype Hotroad', 'btype2', 155000, 'sportsclassics'),
('Btype Luxe', 'btype3', 85000, 'sportsclassics'),
('Buccaneer', 'buccaneer', 18000, 'muscle'),
('Buccaneer Rider', 'buccaneer2', 24000, 'muscle'),
('Buffalo', 'buffalo', 12000, 'sports'),
('Buffalo S', 'buffalo2', 20000, 'sports'),
('Bullet', 'bullet', 90000, 'super'),
('Burrito', 'burrito3', 19000, 'vans'),
('Camper', 'camper', 42000, 'vans'),
('Carbonizzare', 'carbonizzare', 75000, 'sports'),
('Carbon RS', 'carbonrs', 18000, 'motorcycles'),
('Casco', 'casco', 30000, 'sportsclassics'),
('Cavalcade', 'cavalcade2', 55000, 'suvs'),
('Cheetah', 'cheetah', 375000, 'super'),
('Chimera', 'chimera', 38000, 'motorcycles'),
('Chino', 'chino', 15000, 'muscle'),
('Chino Luxe', 'chino2', 19000, 'muscle'),
('Cliffhanger', 'cliffhanger', 9500, 'motorcycles'),
('Cognoscenti Cabrio', 'cogcabrio', 55000, 'coupes'),
('Cognoscenti', 'cognoscenti', 55000, 'sedans'),
('Comet', 'comet2', 65000, 'sports'),
('Comet 5', 'comet5', 1145000, 'sports'),
('Contender', 'contender', 70000, 'suvs'),
('Coquette', 'coquette', 65000, 'sports'),
('Coquette Classic', 'coquette2', 40000, 'sportsclassics'),
('Coquette BlackFin', 'coquette3', 55000, 'muscle'),
('Cruiser (velo)', 'cruiser', 510, 'motorcycles'),
('Cyclone', 'cyclone', 1890000, 'super'),
('Daemon', 'daemon', 11500, 'motorcycles'),
('Daemon High', 'daemon2', 13500, 'motorcycles'),
('Defiler', 'defiler', 9800, 'motorcycles'),
('Deluxo', 'deluxo', 4721500, 'sportsclassics'),
('Dominator', 'dominator', 35000, 'muscle'),
('Double T', 'double', 28000, 'motorcycles'),
('Dubsta', 'dubsta', 45000, 'suvs'),
('Dubsta Luxuary', 'dubsta2', 60000, 'suvs'),
('Bubsta 6x6', 'dubsta3', 120000, 'offroad'),
('Dukes', 'dukes', 28000, 'muscle'),
('Dune Buggy', 'dune', 8000, 'offroad'),
('Elegy', 'elegy2', 38500, 'sports'),
('Emperor', 'emperor', 8500, 'sedans'),
('Enduro', 'enduro', 5500, 'motorcycles'),
('Entity XF', 'entityxf', 425000, 'super'),
('Esskey', 'esskey', 4200, 'motorcycles'),
('Exemplar', 'exemplar', 32000, 'coupes'),
('F620', 'f620', 40000, 'coupes'),
('Faction', 'faction', 20000, 'muscle'),
('Faction Rider', 'faction2', 30000, 'muscle'),
('Faction XL', 'faction3', 40000, 'muscle'),
('Faggio', 'faggio', 1900, 'motorcycles'),
('Vespa', 'faggio2', 2800, 'motorcycles'),
('Felon', 'felon', 42000, 'coupes'),
('Felon GT', 'felon2', 55000, 'coupes'),
('Feltzer', 'feltzer2', 55000, 'sports'),
('Stirling GT', 'feltzer3', 65000, 'sportsclassics'),
('Fixter (velo)', 'fixter', 225, 'motorcycles'),
('FMJ', 'fmj', 185000, 'super'),
('Fhantom', 'fq2', 17000, 'suvs'),
('Fugitive', 'fugitive', 12000, 'sedans'),
('Furore GT', 'furoregt', 45000, 'sports'),
('Fusilade', 'fusilade', 40000, 'sports'),
('Gargoyle', 'gargoyle', 16500, 'motorcycles'),
('Gauntlet', 'gauntlet', 30000, 'muscle'),
('Gang Burrito', 'gburrito', 45000, 'vans'),
('Burrito', 'gburrito2', 29000, 'vans'),
('Glendale', 'glendale', 6500, 'sedans'),
('Grabger', 'granger', 50000, 'suvs'),
('Gresley', 'gresley', 47500, 'suvs'),
('GT 500', 'gt500', 785000, 'sportsclassics'),
('Guardian', 'guardian', 45000, 'offroad'),
('Hakuchou', 'hakuchou', 31000, 'motorcycles'),
('Hakuchou Sport', 'hakuchou2', 55000, 'motorcycles'),
('Hermes', 'hermes', 535000, 'muscle'),
('Hexer', 'hexer', 12000, 'motorcycles'),
('Hotknife', 'hotknife', 125000, 'muscle'),
('Huntley S', 'huntley', 40000, 'suvs'),
('Hustler', 'hustler', 625000, 'muscle'),
('Infernus', 'infernus', 180000, 'super'),
('Innovation', 'innovation', 23500, 'motorcycles'),
('Intruder', 'intruder', 7500, 'sedans'),
('Issi', 'issi2', 10000, 'compacts'),
('Jackal', 'jackal', 38000, 'coupes'),
('Jester', 'jester', 65000, 'sports'),
('Jester(Racecar)', 'jester2', 135000, 'sports'),
('Journey', 'journey', 6500, 'vans'),
('Kamacho', 'kamacho', 345000, 'offroad'),
('Khamelion', 'khamelion', 38000, 'sports'),
('Kuruma', 'kuruma', 30000, 'sports'),
('Landstalker', 'landstalker', 35000, 'suvs'),
('RE-7B', 'le7b', 325000, 'super'),
('Lynx', 'lynx', 40000, 'sports'),
('Mamba', 'mamba', 70000, 'sports'),
('Manana', 'manana', 12800, 'sportsclassics'),
('Manchez', 'manchez', 5300, 'motorcycles'),
('Massacro', 'massacro', 65000, 'sports'),
('Massacro(Racecar)', 'massacro2', 130000, 'sports'),
('Mesa', 'mesa', 16000, 'suvs'),
('Mesa Trail', 'mesa3', 40000, 'suvs'),
('Minivan', 'minivan', 13000, 'vans'),
('Monroe', 'monroe', 55000, 'sportsclassics'),
('The Liberator', 'monster', 210000, 'offroad'),
('Moonbeam', 'moonbeam', 18000, 'vans'),
('Moonbeam Rider', 'moonbeam2', 35000, 'vans'),
('Nemesis', 'nemesis', 5800, 'motorcycles'),
('Neon', 'neon', 1500000, 'sports'),
('Nightblade', 'nightblade', 35000, 'motorcycles'),
('Nightshade', 'nightshade', 65000, 'muscle'),
('9F', 'ninef', 65000, 'sports'),
('9F Cabrio', 'ninef2', 80000, 'sports'),
('Omnis', 'omnis', 35000, 'sports'),
('Oppressor', 'oppressor', 3524500, 'super'),
('Oracle XS', 'oracle2', 35000, 'coupes'),
('Osiris', 'osiris', 160000, 'super'),
('Panto', 'panto', 10000, 'compacts'),
('Paradise', 'paradise', 19000, 'vans'),
('Pariah', 'pariah', 1420000, 'sports'),
('Patriot', 'patriot', 55000, 'suvs'),
('PCJ-600', 'pcj', 6200, 'motorcycles'),
('Penumbra', 'penumbra', 28000, 'sports'),
('Pfister', 'pfister811', 85000, 'super'),
('Phoenix', 'phoenix', 12500, 'muscle'),
('Picador', 'picador', 18000, 'muscle'),
('Pigalle', 'pigalle', 20000, 'sportsclassics'),
('Prairie', 'prairie', 12000, 'compacts'),
('Premier', 'premier', 8000, 'sedans'),
('Primo Custom', 'primo2', 14000, 'sedans'),
('X80 Proto', 'prototipo', 2500000, 'super'),
('Radius', 'radi', 29000, 'suvs'),
('raiden', 'raiden', 1375000, 'sports'),
('Rapid GT', 'rapidgt', 35000, 'sports'),
('Rapid GT Convertible', 'rapidgt2', 45000, 'sports'),
('Rapid GT3', 'rapidgt3', 885000, 'sportsclassics'),
('Reaper', 'reaper', 150000, 'super'),
('Rebel', 'rebel2', 35000, 'offroad'),
('Regina', 'regina', 5000, 'sedans'),
('Retinue', 'retinue', 615000, 'sportsclassics'),
('Revolter', 'revolter', 1610000, 'sports'),
('riata', 'riata', 380000, 'offroad'),
('Rocoto', 'rocoto', 45000, 'suvs'),
('Ruffian', 'ruffian', 6800, 'motorcycles'),
('Ruiner 2', 'ruiner2', 5745600, 'muscle'),
('Rumpo', 'rumpo', 15000, 'vans'),
('Rumpo Trail', 'rumpo3', 19500, 'vans'),
('Sabre Turbo', 'sabregt', 20000, 'muscle'),
('Sabre GT', 'sabregt2', 25000, 'muscle'),
('Sanchez', 'sanchez', 5300, 'motorcycles'),
('Sanchez Sport', 'sanchez2', 5300, 'motorcycles'),
('Sanctus', 'sanctus', 25000, 'motorcycles'),
('Sandking', 'sandking', 55000, 'offroad'),
('Savestra', 'savestra', 990000, 'sportsclassics'),
('SC 1', 'sc1', 1603000, 'super'),
('Schafter', 'schafter2', 25000, 'sedans'),
('Schafter V12', 'schafter3', 50000, 'sports'),
('Scorcher (velo)', 'scorcher', 280, 'motorcycles'),
('Seminole', 'seminole', 25000, 'suvs'),
('Sentinel', 'sentinel', 32000, 'coupes'),
('Sentinel XS', 'sentinel2', 40000, 'coupes'),
('Sentinel3', 'sentinel3', 650000, 'sports'),
('Seven 70', 'seven70', 39500, 'sports'),
('ETR1', 'sheava', 220000, 'super'),
('Shotaro Concept', 'shotaro', 320000, 'motorcycles'),
('Slam Van', 'slamvan3', 11500, 'muscle'),
('Sovereign', 'sovereign', 22000, 'motorcycles'),
('Stinger', 'stinger', 80000, 'sportsclassics'),
('Stinger GT', 'stingergt', 75000, 'sportsclassics'),
('Streiter', 'streiter', 500000, 'sports'),
('Stretch', 'stretch', 90000, 'sedans'),
('Stromberg', 'stromberg', 3185350, 'sports'),
('Sultan', 'sultan', 15000, 'sports'),
('Sultan RS', 'sultanrs', 65000, 'super'),
('Super Diamond', 'superd', 130000, 'sedans'),
('Surano', 'surano', 50000, 'sports'),
('Surfer', 'surfer', 12000, 'vans'),
('T20', 't20', 300000, 'super'),
('Tailgater', 'tailgater', 30000, 'sedans'),
('Tampa', 'tampa', 16000, 'muscle'),
('Drift Tampa', 'tampa2', 80000, 'sports'),
('Thrust', 'thrust', 24000, 'motorcycles'),
('Tri bike (velo)', 'tribike3', 520, 'motorcycles'),
('Trophy Truck', 'trophytruck', 60000, 'offroad'),
('Trophy Truck Limited', 'trophytruck2', 80000, 'offroad'),
('Tropos', 'tropos', 40000, 'sports'),
('Turismo R', 'turismor', 350000, 'super'),
('Tyrus', 'tyrus', 600000, 'super'),
('Vacca', 'vacca', 120000, 'super'),
('Vader', 'vader', 7200, 'motorcycles'),
('Verlierer', 'verlierer2', 70000, 'sports'),
('Vigero', 'vigero', 12500, 'muscle'),
('Virgo', 'virgo', 14000, 'muscle'),
('Viseris', 'viseris', 875000, 'sportsclassics'),
('Visione', 'visione', 2250000, 'super'),
('Voltic', 'voltic', 90000, 'super'),
('Voltic 2', 'voltic2', 3830400, 'super'),
('Voodoo', 'voodoo', 7200, 'muscle'),
('Vortex', 'vortex', 9800, 'motorcycles'),
('Warrener', 'warrener', 4000, 'sedans'),
('Washington', 'washington', 9000, 'sedans'),
('Windsor', 'windsor', 95000, 'coupes'),
('Windsor Drop', 'windsor2', 125000, 'coupes'),
('Woflsbane', 'wolfsbane', 9000, 'motorcycles'),
('XLS', 'xls', 32000, 'suvs'),
('Yosemite', 'yosemite', 485000, 'muscle'),
('Youga', 'youga', 10800, 'vans'),
('Youga Luxuary', 'youga2', 14500, 'vans'),
('Z190', 'z190', 900000, 'sportsclassics'),
('Zentorno', 'zentorno', 1500000, 'super'),
('Zion', 'zion', 36000, 'coupes'),
('Zion Cabrio', 'zion2', 45000, 'coupes'),
('Zombie', 'zombiea', 9500, 'motorcycles'),
('Zombie Luxuary', 'zombieb', 12000, 'motorcycles'),
('Z-Type', 'ztype', 220000, 'sportsclassics');

DROP TABLE IF EXISTS `vehicle_categories`;
CREATE TABLE IF NOT EXISTS `vehicle_categories` (
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
('compacts', 'Compacts'),
('coupes', 'Coupés'),
('motorcycles', 'Motos'),
('muscle', 'Muscle'),
('offroad', 'Off Road'),
('sedans', 'Sedans'),
('sports', 'Sports'),
('sportsclassics', 'Sports Classics'),
('super', 'Super'),
('suvs', 'SUVs'),
('vans', 'Vans');

DROP TABLE IF EXISTS `vehicle_sold`;
CREATE TABLE IF NOT EXISTS `vehicle_sold` (
  `client` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plate` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `soldby` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `weashops`;
CREATE TABLE IF NOT EXISTS `weashops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `weashops` (`id`, `zone`, `item`, `price`) VALUES
(1, 'GunShop', 'WEAPON_PISTOL', 300),
(2, 'BlackWeashop', 'WEAPON_PISTOL', 500),
(3, 'GunShop', 'WEAPON_FLASHLIGHT', 60),
(4, 'BlackWeashop', 'WEAPON_FLASHLIGHT', 70),
(5, 'GunShop', 'WEAPON_MACHETE', 90),
(6, 'BlackWeashop', 'WEAPON_MACHETE', 110),
(7, 'GunShop', 'WEAPON_NIGHTSTICK', 150),
(8, 'BlackWeashop', 'WEAPON_NIGHTSTICK', 150),
(9, 'GunShop', 'WEAPON_BAT', 100),
(10, 'BlackWeashop', 'WEAPON_BAT', 100),
(11, 'GunShop', 'WEAPON_STUNGUN', 50),
(12, 'BlackWeashop', 'WEAPON_STUNGUN', 50),
(13, 'GunShop', 'WEAPON_MICROSMG', 1400),
(14, 'BlackWeashop', 'WEAPON_MICROSMG', 1700),
(15, 'GunShop', 'WEAPON_PUMPSHOTGUN', 3400),
(16, 'BlackWeashop', 'WEAPON_PUMPSHOTGUN', 3500),
(17, 'GunShop', 'WEAPON_ASSAULTRIFLE', 10000),
(18, 'BlackWeashop', 'WEAPON_ASSAULTRIFLE', 11000),
(19, 'GunShop', 'WEAPON_SPECIALCARBINE', 15000),
(20, 'BlackWeashop', 'WEAPON_SPECIALCARBINE', 16500),
(21, 'GunShop', 'WEAPON_SNIPERRIFLE', 22000),
(22, 'BlackWeashop', 'WEAPON_SNIPERRIFLE', 24000),
(23, 'GunShop', 'WEAPON_FIREWORK', 18000),
(24, 'BlackWeashop', 'WEAPON_FIREWORK', 20000),
(25, 'GunShop', 'WEAPON_GRENADE', 500),
(26, 'BlackWeashop', 'WEAPON_GRENADE', 650),
(27, 'GunShop', 'WEAPON_BZGAS', 200),
(28, 'BlackWeashop', 'WEAPON_BZGAS', 350),
(29, 'GunShop', 'WEAPON_FIREEXTINGUISHER', 100),
(30, 'BlackWeashop', 'WEAPON_FIREEXTINGUISHER', 100),
(31, 'GunShop', 'WEAPON_BALL', 50),
(32, 'BlackWeashop', 'WEAPON_BALL', 50),
(33, 'GunShop', 'WEAPON_SMOKEGRENADE', 100),
(34, 'BlackWeashop', 'WEAPON_SMOKEGRENADE', 100),
(35, 'BlackWeashop', 'WEAPON_APPISTOL', 1100),
(36, 'BlackWeashop', 'WEAPON_CARBINERIFLE', 12000),
(37, 'BlackWeashop', 'WEAPON_HEAVYSNIPER', 30000),
(38, 'BlackWeashop', 'WEAPON_MINIGUN', 45000),
(39, 'BlackWeashop', 'WEAPON_RAILGUN', 50000),
(40, 'BlackWeashop', 'WEAPON_STICKYBOMB', 500);

CREATE TABLE `vs_ambulance_categories` (
	`id` int(11) UNIQUE NOT NULL AUTO_INCREMENT,
	`name` varchar(60) NOT NULL,
	`label` varchar(60) NOT NULL,

	PRIMARY KEY (`name`)
	
);

INSERT INTO `vs_ambulance_categories` (id, name, label) VALUES
	(1, 'ambulance', 'Jr. EMT'),
	(2, 'doctor', 'EMT'),
	(3, 'chief_doctor', 'Sr. EMT'),
	(4, 'boss', 'EMT Supervisor')
;

CREATE TABLE `vs_ambulance` (
	`id` int(11) UNIQUE NOT NULL AUTO_INCREMENT,
	`name` varchar(60) NOT NULL,
	`model` varchar(60) NOT NULL,
	`price` int(11) NOT NULL,
	`category` varchar(60) DEFAULT NULL,
	`image` text DEFAULT NULL,

	PRIMARY KEY (`id`)
);

INSERT INTO `vs_ambulance` (id, name, model, price, category, image) VALUES
	(1, 'Ambulance', 'ambulance', 500, 'ambulance', 'https://wiki.rage.mp/images/thumb/f/f5/Ambulance.png/800px-Ambulance.png'),
	(2, 'Fire Truck', 'firetruk', 750, 'ambulance', 'https://wiki.rage.mp/images/thumb/5/5b/FireTruck.png/800px-FireTruck.png'),
	(3, 'Ambulance', 'ambulance', 500, 'doctor', 'https://wiki.rage.mp/images/thumb/f/f5/Ambulance.png/800px-Ambulance.png'),
	(4, 'Fire Truck', 'firetruk', 750, 'doctor', 'https://wiki.rage.mp/images/thumb/5/5b/FireTruck.png/800px-FireTruck.png'),
	(5, 'Ambulance', 'ambulance', 500, 'chief_doctor', 'https://wiki.rage.mp/images/thumb/f/f5/Ambulance.png/800px-Ambulance.png'),
	(6, 'Fire Truck', 'firetruk', 750, 'chief_doctor', 'https://wiki.rage.mp/images/thumb/5/5b/FireTruck.png/800px-FireTruck.png'),
	(7, 'Ambulance', 'ambulance', 500, 'boss', 'https://wiki.rage.mp/images/thumb/f/f5/Ambulance.png/800px-Ambulance.png'),
	(8, 'Fire Truck', 'firetruk', 750, 'boss', 'https://wiki.rage.mp/images/thumb/5/5b/FireTruck.png/800px-FireTruck.png')
;

CREATE TABLE `vs_police_categories` (
	`id` int(11) UNIQUE NOT NULL AUTO_INCREMENT,
	`name` varchar(60) NOT NULL,
	`label` varchar(60) NOT NULL,

	PRIMARY KEY (`name`)
);

INSERT INTO `vs_police_categories` (id, name, label) VALUES
	(1, 'recruit', 'Recruit'),
	(2, 'officer', 'Officer'),
	(3, 'sergeant', 'Sergeant'),
	(4, 'lieutenant', 'Lieutenant'),
	(5, 'boss', 'Chief')
;

CREATE TABLE `vs_police` (
	`id` int(11) UNIQUE NOT NULL AUTO_INCREMENT,
	`name` varchar(60) NOT NULL,
	`model` varchar(60) NOT NULL,
	`price` int(11) NOT NULL,
	`category` varchar(60) DEFAULT NULL,
	`image` text DEFAULT NULL,

	PRIMARY KEY (`id`)
);

INSERT INTO `vs_police` (id, name, model, price, category, image) VALUES
	(1, 'Police Cruiser', 'police', 500, 'recruit', 'https://wiki.rage.mp/images/thumb/b/bf/Police.png/800px-Police.png'),
	(2, 'Police Cruiser', 'police2', 750, 'recruit', 'https://wiki.rage.mp/images/thumb/c/c9/Police2.png/800px-Police2.png'),
	(3, 'Police Cruiser', 'police', 500, 'officer', 'https://wiki.rage.mp/images/thumb/b/bf/Police.png/800px-Police.png'),
	(4, 'Police Cruiser', 'police2', 750, 'officer', 'https://wiki.rage.mp/images/thumb/c/c9/Police2.png/800px-Police2.png'),
	(5, 'Police Cruiser', 'police', 500, 'sergeant', 'https://wiki.rage.mp/images/thumb/b/bf/Police.png/800px-Police.png'),
	(6, 'Police Cruiser', 'police2', 750, 'sergeant', 'https://wiki.rage.mp/images/thumb/c/c9/Police2.png/800px-Police2.png'),
	(7, 'Police Cruiser', 'police', 500, 'lieutenant', 'https://wiki.rage.mp/images/thumb/b/bf/Police.png/800px-Police.png'),
	(8, 'Police Cruiser', 'police2', 750, 'lieutenant', 'https://wiki.rage.mp/images/thumb/c/c9/Police2.png/800px-Police2.png'),
	(9, 'Police Cruiser', 'police', 500, 'boss', 'https://wiki.rage.mp/images/thumb/b/bf/Police.png/800px-Police.png'),
	(10, 'Police Cruiser', 'police2', 750, 'boss', 'https://wiki.rage.mp/images/thumb/c/c9/Police2.png/800px-Police2.png')
;

CREATE TABLE `vs_division_categories` (
	`id` int(11) UNIQUE NOT NULL AUTO_INCREMENT,
	`name` varchar(60) NOT NULL,
	`label` varchar(60) NOT NULL,

	PRIMARY KEY (`name`)
);

INSERT INTO `vs_division_categories` (id, name, label) VALUES
	(1, 'aviation', 'Aviation')
;

CREATE TABLE `vs_divisions` (
	`id` int(11) UNIQUE NOT NULL AUTO_INCREMENT,
	`name` varchar(60) NOT NULL,
	`model` varchar(60) NOT NULL,
	`price` int(11) NOT NULL,
	`category` varchar(60) DEFAULT NULL,
	`image` text DEFAULT NULL,

	PRIMARY KEY (`id`)
);

INSERT INTO `vs_divisions` (id, name, model, price, category, image) VALUES
	(1, 'Maverick', 'polmav', 1000, 'aviation', 'https://wiki.rage.mp/images/thumb/f/fc/Polmav.png/800px-Polmav.png')
;

CREATE TABLE `vs_mecano_categories` (
	`id` int(11) UNIQUE NOT NULL AUTO_INCREMENT,
	`name` varchar(60) NOT NULL,
	`label` varchar(60) NOT NULL,

	PRIMARY KEY (`name`)
);

INSERT INTO `vs_mecano_categories` (id, name, label) VALUES
	(1, 'recrue', 'Recruit'),
	(2, 'novice', 'Novice'),
	(3, 'experimente', 'Experienced'),
	(4, 'chief', 'Chief'),
	(5, 'boss', 'Boss')
;

CREATE TABLE `vs_mecano` (
	`id` int(11) UNIQUE NOT NULL AUTO_INCREMENT,
	`name` varchar(60) NOT NULL,
	`model` varchar(60) NOT NULL,
	`price` int(11) NOT NULL,
	`category` varchar(60) DEFAULT NULL,
	`image` text DEFAULT NULL,

	PRIMARY KEY (`id`)
);

INSERT INTO `vs_mecano` (id, name, model, price, category, image) VALUES
	(1, 'Flatbed', 'flatbed', 1000, 'recrue', 'https://wiki.rage.mp/images/thumb/c/c2/Flatbed.png/800px-Flatbed.png'),
	(2, 'Tow Truck', 'towtruck', 750, 'recrue', 'https://wiki.rage.mp/images/thumb/5/52/Towtruck.png/800px-Towtruck.png'),
	(3, 'Tow Truck', 'towtruck2', 500, 'recrue', 'https://wiki.rage.mp/images/thumb/3/34/Towtruck2.png/800px-Towtruck2.png'),
	(4, 'Flatbed','flatbed', 1000, 'novice', 'https://wiki.rage.mp/images/thumb/c/c2/Flatbed.png/800px-Flatbed.png'),
	(5, 'Tow Truck', 'towtruck', 750, 'novice', 'https://wiki.rage.mp/images/thumb/5/52/Towtruck.png/800px-Towtruck.png'),
	(6, 'Tow Truck', 'towtruck2', 500, 'novice', 'https://wiki.rage.mp/images/thumb/3/34/Towtruck2.png/800px-Towtruck2.png'),
	(7, 'Flatbed', 'flatbed', 1000, 'experimente', 'https://wiki.rage.mp/images/thumb/c/c2/Flatbed.png/800px-Flatbed.png'),
	(8, 'Tow Truck', 'towtruck', 750, 'experimente', 'https://wiki.rage.mp/images/thumb/5/52/Towtruck.png/800px-Towtruck.png'),
	(9, 'Tow Truck', 'towtruck2', 500, 'experimente', 'https://wiki.rage.mp/images/thumb/3/34/Towtruck2.png/800px-Towtruck2.png'),
	(10, 'Flatbed', 'flatbed', 1000, 'chief', 'https://wiki.rage.mp/images/thumb/c/c2/Flatbed.png/800px-Flatbed.png'),
	(11, 'Tow Truck', 'towtruck', 750, 'chief', 'https://wiki.rage.mp/images/thumb/5/52/Towtruck.png/800px-Towtruck.png'),
	(12, 'Tow Truck', 'towtruck2', 500, 'chief', 'https://wiki.rage.mp/images/thumb/3/34/Towtruck2.png/800px-Towtruck2.png'),
	(13, 'Flatbed', 'flatbed', 1000, 'boss', 'https://wiki.rage.mp/images/thumb/c/c2/Flatbed.png/800px-Flatbed.png'),
	(14, 'Tow Truck', 'towtruck', 750, 'boss', 'https://wiki.rage.mp/images/thumb/5/52/Towtruck.png/800px-Towtruck.png'),
	(15, 'Tow Truck', 'towtruck2', 500, 'boss', 'https://wiki.rage.mp/images/thumb/3/34/Towtruck2.png/800px-Towtruck2.png')
;

CREATE TABLE `vs_aircraft_categories` (
	`id` int(11) UNIQUE NOT NULL AUTO_INCREMENT,
	`name` varchar(60) NOT NULL,
	`label` varchar(60) NOT NULL,

	PRIMARY KEY (`name`)
);

INSERT INTO `vs_aircraft_categories` (id, name, label) VALUES
	(1, 'helis', 'Helicopters'),
	(2, 'planes', 'Planes')
;

CREATE TABLE `vs_aircrafts` (
	`id` int(11) UNIQUE NOT NULL AUTO_INCREMENT,
	`name` varchar(60) NOT NULL,
	`model` varchar(60) NOT NULL,
	`price` int(11) NOT NULL,
	`category` varchar(60) DEFAULT NULL,
	`image` text DEFAULT NULL,

	PRIMARY KEY (`model`)
);

INSERT INTO `vs_aircrafts` (id, name, model, price, category, image) VALUES
	(1, 'Buzzard', 'buzzard2', 500000, 'helis', 'https://wiki.rage.mp/images/thumb/6/6e/Buzzard2.png/800px-Buzzard2.png'),
	(2, 'Frogger', 'frogger', 750000, 'helis', 'https://wiki.rage.mp/images/thumb/2/2d/Frogger.png/800px-Frogger.png'),
	(3, 'Havok', 'havok', 250000, 'helis', 'https://wiki.rage.mp/images/thumb/4/40/Havok.png/800px-Havok.png'),
	(4, 'Maverick', 'maverick', 625000, 'helis', 'https://wiki.rage.mp/images/thumb/7/73/Maverick.png/800px-Maverick.png'),
	(5, 'Sea Sparrow', 'seasparrow', 375000, 'helis', 'https://wiki.rage.mp/images/thumb/d/d5/Seasparrow.png/800px-Seasparrow.png'),
	(6, 'SuperVolito', 'supervolito', 875000, 'helis', 'https://wiki.rage.mp/images/thumb/9/9e/Supervolito.png/800px-Supervolito.png'),
	(7, 'SuperVolito Carbon', 'supervolito2', 875000, 'helis', 'https://wiki.rage.mp/images/thumb/a/a8/Supervolito2.png/800px-Supervolito2.png'),
	(8, 'Swift', 'swift', 875000, 'helis', 'https://wiki.rage.mp/images/thumb/0/00/Swift.png/800px-Swift.png'),
	(9, 'Swift Deluxe', 'swift2', 875000, 'helis', 'https://wiki.rage.mp/images/thumb/5/5f/Swift2.png/800px-Swift2.png'),
	(10, 'Volatus', 'volatus', 875000, 'helis', 'https://wiki.rage.mp/images/thumb/6/65/Volatus.png/800px-Volatus.png'),
	(20, 'Alpha Z1', 'alphaz1', 450000, 'planes', 'https://wiki.rage.mp/images/thumb/4/46/Alphaz1.png/800px-Alphaz1.png'),
	(21, 'Besra', 'besra', 500000, 'planes', 'https://wiki.rage.mp/images/thumb/3/35/Besra.png/800px-Besra.png'),
	(22, 'Cuban 800', 'cuban800', 200000, 'planes', 'https://wiki.rage.mp/images/thumb/6/63/Cuban800.png/800px-Cuban800.png'),
	(23, 'Dodo', 'dodo', 350000, 'planes', 'https://wiki.rage.mp/images/thumb/f/fc/Dodo.png/800px-Dodo.png'),
	(24, 'Duster', 'duster', 100000, 'planes', 'https://wiki.rage.mp/images/thumb/a/a0/Duster.png/800px-Duster.png'),
	(25, 'Howard NX25', 'howard', 450000, 'planes', 'https://wiki.rage.mp/images/thumb/0/09/Howard.png/800px-Howard.png'),
	(26, 'Luxor', 'luxor', 700000, 'planes', 'https://wiki.rage.mp/images/f/f3/Luxor.png'),
	(27, 'Luxor Deluxe', 'luxor2', 750000, 'planes', 'https://wiki.rage.mp/images/thumb/a/a8/Luxor2.png/800px-Luxor2.png'),
	(28, 'Mammatus', 'mammatus', 250000, 'planes', 'https://wiki.rage.mp/images/thumb/a/a7/Mammatus.png/800px-Mammatus.png'),
	(29, 'Ultra Light', 'microlight', 50000, 'planes', 'https://wiki.rage.mp/images/thumb/6/62/Microlight.png/800px-Microlight.png'),
	(30, 'Nimbus', 'nimbus', 600000, 'planes', 'https://wiki.rage.mp/images/thumb/c/c8/Nimbus.png/800px-Nimbus.png'),
	(31, 'Rogue', 'rogue', 450000, 'planes', 'https://wiki.rage.mp/images/thumb/5/59/Rogue.png/800px-Rogue.png'),
	(32, 'Sea Breeze', 'seabreeze', 400000, 'planes', 'https://wiki.rage.mp/images/thumb/a/ae/Seabreeze.png/800px-Seabreeze.png'),
	(33, 'Shamal', 'shamal', 650000, 'planes', 'https://wiki.rage.mp/images/thumb/b/be/Shamal.png/800px-Shamal.png'),
	(34, 'Mallard', 'stunt', 150000, 'planes', 'https://wiki.rage.mp/images/thumb/a/aa/Stunt.png/800px-Stunt.png'),
	(35, 'Velum', 'velum', 300000, 'planes', 'https://wiki.rage.mp/images/c/c3/Velum.png'),
	(36, 'Velum 5-Seater', 'velum2', 300000, 'planes', 'https://wiki.rage.mp/images/thumb/e/e7/Velum2.png/800px-Velum2.png'),
	(37, 'Vestra', 'vestra', 500000, 'planes', 'https://wiki.rage.mp/images/thumb/8/8f/Vestra.png/800px-Vestra.png')
;

CREATE TABLE `vs_boat_categories` (
	`id` int(11) UNIQUE NOT NULL AUTO_INCREMENT,
	`name` varchar(60) NOT NULL,
	`label` varchar(60) NOT NULL,

	PRIMARY KEY (`name`)
);

INSERT INTO `vs_boat_categories` (id, name, label) VALUES
	(1, 'boats', 'Boats'),
	(2, 'subs', 'Submersibles')
;

CREATE TABLE `vs_boats` (
	`id` int(11) UNIQUE NOT NULL AUTO_INCREMENT,
	`name` varchar(60) NOT NULL,
	`model` varchar(60) NOT NULL,
	`price` int(11) NOT NULL,
	`category` varchar(60) DEFAULT NULL,
	`image` text DEFAULT NULL,

	PRIMARY KEY (`model`)
);

INSERT INTO `vs_boats` (id, name, model, price, category, image) VALUES
	(1, 'Dinghy 1', 'dinghy', 15000, 'boats', 'https://wiki.rage.mp/images/thumb/3/39/Dinghy.png/800px-Dinghy.png'),
	(2, 'Dinghy 2', 'dinghy2', 15000, 'boats', 'https://wiki.rage.mp/images/thumb/0/09/Dinghy2.png/800px-Dinghy2.png'),
	(3, 'Dinghy 3', 'dinghy3', 15000, 'boats', 'https://wiki.rage.mp/images/thumb/5/56/Dinghy3.png/800px-Dinghy3.png'),
	(4, 'Dinghy 4', 'dinghy4', 15000, 'boats', 'https://wiki.rage.mp/images/thumb/8/86/Dinghy4.png/800px-Dinghy4.png'),
	(5, 'Jetmax', 'jetmax', 22500, 'boats', 'https://wiki.rage.mp/images/thumb/e/e6/Jetmax.png/800px-Jetmax.png'),
	(6, 'Marquis', 'marquis', 37500, 'boats', 'https://wiki.rage.mp/images/thumb/7/70/Marquis.png/800px-Marquis.png'),
	(7, 'Longfin', 'longfin', 40000, 'boats', 'https://wiki.rage.mp/images/thumb/3/34/0x6EF89CCC.png/800px-0x6EF89CCC.png'),
	(8, 'Seashark', 'seashark', 8000, 'boats', 'https://wiki.rage.mp/images/thumb/e/e7/Seashark.png/800px-Seashark.png'),
	(9, 'Seashark 3', 'seashark3', 8000, 'boats', 'https://wiki.rage.mp/images/thumb/f/f3/Seashark3.png/800px-Seashark3.png'),
	(10, 'Speeder', 'speeder', 35000, 'boats', 'https://wiki.rage.mp/images/thumb/f/f4/Speeder.png/800px-Speeder.png'),
	(11, 'Speeder 2', 'speeder2', 35000, 'boats', 'https://wiki.rage.mp/images/thumb/8/89/Speeder2.png/800px-Speeder2.png'),
	(12, 'Squalo', 'squalo', 25000, 'boats', 'https://wiki.rage.mp/images/thumb/e/ec/Squalo.png/800px-Squalo.png'),
	(13, 'Suntrap', 'suntrap', 27500, 'boats', 'https://wiki.rage.mp/images/thumb/2/27/Suntrap.png/800px-Suntrap.png'),
	(14, 'Toro', 'toro', 30000, 'boats', 'https://wiki.rage.mp/images/thumb/9/94/Toro.png/800px-Toro.png'),
	(15, 'Toro 2', 'toro2', 32500, 'boats', 'https://wiki.rage.mp/images/thumb/d/d7/Toro2.png/800px-Toro2.png'),
	(16, 'Tropic', 'tropic', 20000, 'boats', 'https://wiki.rage.mp/images/thumb/8/86/Tropic.png/800px-Tropic.png'),
	(17, 'Tropic 2', 'tropic2', 20000, 'boats', 'https://wiki.rage.mp/images/thumb/a/a7/Tropic2.png/800px-Tropic2.png'),
	(20, 'Kraken', 'submersible2', 32500, 'subs', 'https://wiki.rage.mp/images/thumb/6/62/Submersible2.png/800px-Submersible2.png'),
	(21, 'Submarine', 'submersible', 30000, 'subs', 'https://wiki.rage.mp/images/3/3c/Submersible.png'),
	(22, 'Avisa', 'avisa', 35000, 'subs', 'https://wiki.rage.mp/images/thumb/1/19/0x9A474B5E.png/800px-0x9A474B5E.png')
;

CREATE TABLE `vs_car_categories` (
	`id` int(11) UNIQUE NOT NULL AUTO_INCREMENT,
	`name` varchar(60) NOT NULL,
	`label` varchar(60) NOT NULL,

	PRIMARY KEY (`name`)
);

INSERT INTO `vs_car_categories` (id, name, label) VALUES
	(1, 'cycles', 'Cycles'),
	(2, 'compacts', 'Compacts'),
	(3, 'coupes', 'Coupes'),
	(4, 'motorcycles', 'Motorcycles'),
	(5, 'muscles', 'Muscles'),
	(6, 'offroads', 'Off-Roads'),
	(7, 'sedans', 'Sedans'),
	(8, 'sports', 'Sports'),
	(9, 'sportsclassics', 'Sports Classics'),
	(10, 'supers', 'Supers'),
	(11, 'suvs', 'SUVs'),
	(12, 'vans', 'Vans')
;

CREATE TABLE `vs_cars` (
	`id` int(11) UNIQUE NOT NULL AUTO_INCREMENT,
	`name` varchar(60) NOT NULL,
	`model` varchar(60) NOT NULL,
	`price` int(11) NOT NULL,
	`category` varchar(60) DEFAULT NULL,
	`image` text DEFAULT NULL,

	PRIMARY KEY (`model`)
);

INSERT INTO `vs_cars` (id, name, model, price, category, image) VALUES
	(1, 'Asbo', 'asbo', 15000, 'compacts', 'https://wiki.rage.mp/images/thumb/c/cb/Asbo.png/800px-Asbo.png'),
	(2, 'Blista', 'blista', 15000, 'compacts', 'https://wiki.rage.mp/images/thumb/5/58/Blista.png/800px-Blista.png'),
	(3, 'Brioso R/A', 'brioso', 17500, 'compacts', 'https://wiki.rage.mp/images/thumb/6/6f/Brioso.png/800px-Brioso.png'),
	(4, 'Brioso 300', 'brioso2', 12500, 'compacts', 'https://wiki.rage.mp/images/thumb/4/41/0x55365079.png/800px-0x55365079.png'),
	(5, 'Club', 'club', 12500, 'compacts', 'https://wiki.rage.mp/images/thumb/5/50/Club.png/800px-Club.png'),
	(6, 'Dilettante', 'dilettante', 15000, 'compacts', 'https://wiki.rage.mp/images/thumb/b/b9/Dilettante.png/800px-Dilettante.png'),
	(7, 'Issi', 'issi2', 15000, 'compacts', 'https://wiki.rage.mp/images/thumb/0/0b/Issi2.png/800px-Issi2.png'),
	(8, 'Issi Classic', 'issi3', 12500, 'compacts', 'https://wiki.rage.mp/images/thumb/7/73/Issi3.png/800px-Issi3.png'),
	(9, 'Kanjo Blista', 'kanjo', 15000, 'compacts', 'https://wiki.rage.mp/images/thumb/2/25/Kanjo.png/800px-Kanjo.png'),
	(10, 'Panto', 'panto', 15000, 'compacts', 'https://wiki.rage.mp/images/thumb/e/e5/Panto.png/800px-Panto.png'),
	(11, 'Prairie', 'prairie', 15000, 'compacts', 'https://wiki.rage.mp/images/thumb/3/3d/Prairie.png/800px-Prairie.png'),
	(12, 'Rhapsody', 'rhapsody', 12500, 'compacts', 'https://wiki.rage.mp/images/thumb/e/e2/Rhapsody.png/800px-Rhapsody.png'),
	(13, 'WeEvil', 'weevil', 12500, 'compacts', 'https://wiki.rage.mp/images/thumb/c/c0/0x61FE4D6A.png/800px-0x61FE4D6A.png'),
	(50, 'Asea', 'asea', 15000, 'sedans', 'https://wiki.rage.mp/images/thumb/c/ce/Asea.png/800px-Asea.png'),
	(51, 'Asterope', 'asterope', 15000, 'sedans', 'https://wiki.rage.mp/images/thumb/0/05/Asterope.png/800px-Asterope.png'),
	(52, 'Cognoscenti S', 'cog55', 50000, 'sedans', 'https://wiki.rage.mp/images/thumb/d/d5/Cog55.png/800px-Cog55.png'),
	(53, 'Cognoscenti S Armored', 'cog552', 75000, 'sedans', 'https://wiki.rage.mp/images/thumb/7/79/Cog552.png/800px-Cog552.png'),
	(54, 'Cognoscenti L', 'cognoscenti', 50000, 'sedans', 'https://wiki.rage.mp/images/thumb/5/51/Cognoscenti.png/800px-Cognoscenti.png'),
	(55, 'Cognoscenti L Armored', 'cognoscenti2', 75000, 'sedans', 'https://wiki.rage.mp/images/thumb/2/2e/Cognoscenti2.png/800px-Cognoscenti2.png'),
	(56, 'Emperor', 'emperor', 12500, 'sedans', 'https://wiki.rage.mp/images/thumb/c/c5/Emperor.png/800px-Emperor.png'),
	(57, 'Emperor 2', 'emperor2', 10000, 'sedans', 'https://wiki.rage.mp/images/thumb/1/16/Emperor2.png/800px-Emperor2.png'),
	(58, 'Fugitive', 'fugitive', 15000, 'sedans', 'https://wiki.rage.mp/images/thumb/7/73/Fugitive.png/800px-Fugitive.png'),
	(59, 'Glendale', 'glendale', 12500, 'sedans', 'https://wiki.rage.mp/images/thumb/b/b2/Glendale.png/800px-Glendale.png'),
	(60, 'Glendale Custom', 'glendale2', 15000, 'sedans', 'https://wiki.rage.mp/images/thumb/b/bd/Glendale2.png/800px-Glendale2.png'),
	(61, 'Ingot', 'ingot', 12500, 'sedans', 'https://wiki.rage.mp/images/thumb/7/74/Ingot.png/800px-Ingot.png'),
	(62, 'Intruder', 'intruder', 15000, 'sedans', 'https://wiki.rage.mp/images/thumb/9/92/Intruder.png/800px-Intruder.png'),
	(63, 'Premier', 'premier', 15000, 'sedans', 'https://wiki.rage.mp/images/thumb/9/9d/Premier.png/800px-Premier.png'),
	(64, 'Primo', 'primo', 12500, 'sedans', 'https://wiki.rage.mp/images/thumb/4/45/Primo.png/800px-Primo.png'),
	(65, 'Primo Custom', 'primo2', 15000, 'sedans', 'https://wiki.rage.mp/images/thumb/3/30/Primo2.png/800px-Primo2.png'),
	(66, 'Regina', 'regina', 12500, 'sedans', 'https://wiki.rage.mp/images/thumb/5/5f/Regina.png/800px-Regina.png'),
	(67, 'Romero Hearse', 'romero', 15000, 'sedans', 'https://wiki.rage.mp/images/thumb/7/73/Romero.png/800px-Romero.png'),
	(68, 'Schafter', 'schafter2', 15000, 'sedans', 'https://wiki.rage.mp/images/thumb/c/cc/Schafter2.png/800px-Schafter2.png'),
	(69, 'Schafter V12 Armored', 'schafter5', 40000, 'sedans', 'https://wiki.rage.mp/images/thumb/2/28/Schafter5.png/800px-Schafter5.png'),
	(70, 'Schafter LWB Armored', 'schafter6', 40000, 'sedans', 'https://wiki.rage.mp/images/thumb/a/a6/Schafter6.png/800px-Schafter6.png'),
	(71, 'Stafford', 'stafford', 25000, 'sedans', 'https://wiki.rage.mp/images/e/e9/Stafford.png'),
	(72, 'Stanier', 'stanier', 12500, 'sedans', 'https://wiki.rage.mp/images/thumb/5/57/Stanier.png/800px-Stanier.png'),
	(73, 'Stratum', 'stratum', 12500, 'sedans', 'https://wiki.rage.mp/images/thumb/b/ba/Stratum.png/800px-Stratum.png'),
	(74, 'Stretch', 'stretch', 50000, 'sedans', 'https://wiki.rage.mp/images/thumb/8/8a/Stretch.png/800px-Stretch.png'),
	(75, 'Super Diamond', 'superd', 50000, 'sedans', 'https://wiki.rage.mp/images/thumb/6/6e/Superd.png/800px-Superd.png'),
	(76, 'Surge', 'surge', 15000, 'sedans', 'https://wiki.rage.mp/images/thumb/1/1a/Surge.png/800px-Surge.png'),
	(77, 'Tailgater', 'tailgater', 15000, 'sedans', 'https://wiki.rage.mp/images/thumb/a/af/Tailgater.png/800px-Tailgater.png'),
	(78, 'Warrener', 'warrener', 12500, 'sedans', 'https://wiki.rage.mp/images/thumb/2/22/Warrener.png/800px-Warrener.png'),
	(79, 'Washington', 'washington', 12500, 'sedans', 'https://wiki.rage.mp/images/thumb/e/e2/Washington.png/800px-Washington.png'),
	(100, 'Baller', 'baller', 22500, 'suvs', 'https://wiki.rage.mp/images/thumb/7/79/Baller.png/800px-Baller.png'),
	(101, 'Baller 2', 'baller2', 25000, 'suvs', 'https://wiki.rage.mp/images/thumb/9/98/Baller2.png/800px-Baller2.png'),
	(102, 'Baller LE', 'baller3', 25000, 'suvs', 'https://wiki.rage.mp/images/thumb/9/9b/Baller3.png/800px-Baller3.png'),
	(103, 'Baller LE LWB', 'baller4', 25000, 'suvs', 'https://wiki.rage.mp/images/thumb/e/e8/Baller4.png/800px-Baller4.png'),
	(104, 'Baller LE Armored', 'baller5', 50000, 'suvs', 'https://wiki.rage.mp/images/thumb/3/34/Baller5.png/800px-Baller5.png'),
	(105, 'Baller LE LWB Armored', 'baller6', 50000, 'suvs', 'https://wiki.rage.mp/images/thumb/8/81/Baller6.png/800px-Baller6.png'),
	(106, 'BeeJay XL', 'bjxl', 22500, 'suvs', 'https://wiki.rage.mp/images/thumb/d/da/Bjxl.png/800px-Bjxl.png'),
	(107, 'Cavalcade', 'cavalcade', 22500, 'suvs', 'https://wiki.rage.mp/images/thumb/9/9e/Cavalcade.png/800px-Cavalcade.png'),
	(108, 'Cavalcade 2', 'cavalcade2', 25000, 'suvs', 'https://wiki.rage.mp/images/thumb/b/bc/Cavalcade2.png/800px-Cavalcade2.png'),
	(109, 'Dubsta', 'dubsta', 45000, 'suvs', 'https://wiki.rage.mp/images/thumb/e/ec/Dubsta.png/800px-Dubsta.png'),
	(110, 'Dubsta Luxuary', 'dubsta2', 45000, 'suvs', 'https://wiki.rage.mp/images/thumb/3/36/Dubsta2.png/800px-Dubsta2.png'),
	(111, 'Fhantom', 'fq2', 22500, 'suvs', 'https://wiki.rage.mp/images/thumb/a/a4/Fq2.png/800px-Fq2.png'),
	(112, 'Grabger', 'granger', 22500, 'suvs', 'https://wiki.rage.mp/images/thumb/4/4d/Granger.png/800px-Granger.png'),
	(113, 'Gresley', 'gresley', 25000, 'suvs', 'https://wiki.rage.mp/images/thumb/d/d6/Gresley.png/800px-Gresley.png'),
	(114, 'Habanero', 'habanero', 22500, 'suvs', 'https://wiki.rage.mp/images/thumb/1/1e/Habanero.png/800px-Habanero.png'),
	(115, 'Huntley S', 'huntley', 25000, 'suvs', 'https://wiki.rage.mp/images/thumb/1/1c/Huntley.png/800px-Huntley.png'),
	(116, 'Landstalker', 'landstalker', 22500, 'suvs', 'https://wiki.rage.mp/images/thumb/7/70/Landstalker.png/800px-Landstalker.png'),
	(117, 'Landstalker XL', 'landstalker2', 25000, 'suvs', 'https://wiki.rage.mp/images/thumb/b/b1/Landstalker2.png/800px-Landstalker2.png'),
	(118, 'Mesa', 'mesa', 22500, 'suvs', 'https://wiki.rage.mp/images/thumb/c/cc/Mesa.png/800px-Mesa.png'),
	(119, 'Novak', 'novak', 25000, 'suvs', 'https://wiki.rage.mp/images/7/76/Novak.png'),
	(120, 'Patriot', 'patriot', 25000, 'suvs', 'https://wiki.rage.mp/images/thumb/1/12/Patriot.png/800px-Patriot.png'),
	(121, 'Patriot Stretch', 'patriot2', 45000, 'suvs', 'https://wiki.rage.mp/images/8/83/Patriot2.png'),
	(122, 'Radius', 'radi', 22500, 'suvs', 'https://wiki.rage.mp/images/thumb/9/9c/Radi.png/800px-Radi.png'),
	(123, 'Rebla GTS', 'rebla', 25000, 'suvs', 'https://wiki.rage.mp/images/thumb/9/94/Rebla.png/800px-Rebla.png'),
	(124, 'Rocoto', 'rocoto', 25000, 'suvs', 'https://wiki.rage.mp/images/thumb/2/23/Rocoto.png/800px-Rocoto.png'),
	(125, 'Seminole', 'seminole', 25000, 'suvs', 'https://wiki.rage.mp/images/thumb/c/cc/Seminole.png/800px-Seminole.png'),
	(126, 'Seminole Frontier', 'seminole2', 22500, 'suvs', 'https://wiki.rage.mp/images/thumb/d/d9/Seminole2.png/800px-Seminole2.png'),
	(127, 'Serrano', 'serrano', 22500, 'suvs', 'https://wiki.rage.mp/images/thumb/a/ac/Serrano.png/800px-Serrano.png'),
	(128, 'Toros', 'toros', 25000, 'suvs', 'https://wiki.rage.mp/images/thumb/f/f1/Toros.png/800px-Toros.png'),
	(129, 'XLS', 'xls', 25000, 'suvs', 'https://wiki.rage.mp/images/thumb/0/0f/Xls.png/800px-Xls.png'),
	(130, 'XLS Armored', 'xls2', 50000, 'suvs', 'https://wiki.rage.mp/images/thumb/3/35/Xls2.png/800px-Xls2.png'),
	(150, 'Cognoscenti Cabrio', 'cogcabrio', 35000, 'coupes', 'https://wiki.rage.mp/images/thumb/1/1b/CogCabrio.png/800px-CogCabrio.png'),
	(151, 'Exemplar', 'exemplar', 35000, 'coupes', 'https://wiki.rage.mp/images/thumb/a/a4/Exemplar.png/800px-Exemplar.png'),
	(152, 'F620', 'f620', 45000, 'coupes', 'https://wiki.rage.mp/images/thumb/2/21/F620.png/800px-F620.png'),
	(153, 'Felon', 'felon', 35000, 'coupes', 'https://wiki.rage.mp/images/thumb/0/04/Felon.png/800px-Felon.png'),
	(154, 'Felon GT', 'felon2', 35000, 'coupes', 'https://wiki.rage.mp/images/thumb/6/6e/Felon2.png/800px-Felon2.png'),
	(155, 'Jackal', 'jackal', 35000, 'coupes', 'https://wiki.rage.mp/images/thumb/7/70/Jackal.png/800px-Jackal.png'),
	(156, 'Oracle XS', 'oracle', 35000, 'coupes', 'https://wiki.rage.mp/images/thumb/1/17/Oracle.png/800px-Oracle.png'),
	(157, 'Oracle', 'oracle2', 35000, 'coupes', 'https://wiki.rage.mp/images/thumb/4/4d/Oracle2.png/800px-Oracle2.png'),
	(158, 'Sentinel', 'sentinel', 35000, 'coupes', 'https://wiki.rage.mp/images/thumb/9/91/Sentinel.png/800px-Sentinel.png'),
	(159, 'Sentinel XS', 'sentinel2', 35000, 'coupes', 'https://wiki.rage.mp/images/thumb/d/dd/Sentinel2.png/800px-Sentinel2.png'),
	(160, 'Windsor', 'windsor', 50000, 'coupes', 'https://wiki.rage.mp/images/thumb/2/2d/Windsor.png/800px-Windsor.png'),
	(161, 'Windsor Drop', 'windsor2', 50000, 'coupes', 'https://wiki.rage.mp/images/thumb/5/57/Windsor2.png/800px-Windsor2.png'),
	(162, 'Zion', 'zion', 35000, 'coupes', 'https://wiki.rage.mp/images/thumb/5/51/Zion.png/800px-Zion.png'),
	(163, 'Zion Cabrio', 'zion2', 35000, 'coupes', 'https://wiki.rage.mp/images/thumb/f/f2/Zion2.png/800px-Zion2.png'),
	(200, 'Blade', 'blade', 15000, 'muscles', 'https://wiki.rage.mp/images/thumb/a/ad/Blade.png/800px-Blade.png'),
	(201, 'Buccaneer', 'buccaneer', 15000, 'muscles', 'https://wiki.rage.mp/images/thumb/d/de/Buccaneer.png/800px-Buccaneer.png'),
	(202, 'Buccaneer Rider', 'buccaneer2', 20000, 'muscles', 'https://wiki.rage.mp/images/thumb/1/16/Buccaneer2.png/800px-Buccaneer2.png'),
	(203, 'Chino', 'chino', 15000, 'muscles', 'https://wiki.rage.mp/images/thumb/4/4d/Chino.png/800px-Chino.png'),
	(204, 'Chino Custom', 'chino2', 20000, 'muscles', 'https://wiki.rage.mp/images/thumb/6/61/Chino2.png/800px-Chino2.png'),
	(205, 'Clique', 'clique', 20000, 'muscles', 'https://wiki.rage.mp/images/thumb/3/3c/Clique.png/800px-Clique.png'),
	(206, 'Coquette BlackFin', 'coquette3', 50000, 'muscles', 'https://wiki.rage.mp/images/thumb/6/67/Coquette3.png/800px-Coquette3.png'),
	(207, 'Deviant', 'deviant', 30000, 'muscles', 'https://wiki.rage.mp/images/thumb/d/d5/Deviant.png/800px-Deviant.png'),
	(208, 'Dominator', 'dominator', 20000, 'muscles', 'https://wiki.rage.mp/images/thumb/6/6e/Dominator.png/800px-Dominator.png'),
	(209, 'Dominator Pisswasser', 'dominator2', 20000, 'muscles', 'https://wiki.rage.mp/images/thumb/5/57/Dominator2.png/800px-Dominator2.png'),
	(210, 'Dominator GTX', 'dominator3', 30000, 'muscles', 'https://wiki.rage.mp/images/thumb/b/ba/Dominator3.png/800px-Dominator3.png'),
	(211, 'Dukes', 'dukes', 15000, 'muscles', 'https://wiki.rage.mp/images/thumb/6/6e/Dukes.png/800px-Dukes.png'),
	(212, 'Dukes Beater', 'dukes3', 15000, 'muscles', 'https://wiki.rage.mp/images/thumb/4/45/Dukes3.png/800px-Dukes3.png'),
	(213, 'Ellie', 'ellie', 30000, 'muscles', 'https://wiki.rage.mp/images/thumb/e/ef/Ellie.png/800px-Ellie.png'),
	(214, 'Faction', 'faction', 15000, 'muscles', 'https://wiki.rage.mp/images/thumb/5/55/Faction.png/800px-Faction.png'),
	(215, 'Faction Custom', 'faction2', 20000, 'muscles', 'https://wiki.rage.mp/images/thumb/4/41/Faction2.png/800px-Faction2.png'),
	(216, 'Faction Custom Donk', 'faction3', 20000, 'muscles', 'https://wiki.rage.mp/images/thumb/a/a8/Faction3.png/800px-Faction3.png'),
	(217, 'Gauntlet', 'gauntlet', 20000, 'muscles', 'https://wiki.rage.mp/images/thumb/7/71/Gauntlet.png/800px-Gauntlet.png'),
	(218, 'Gauntlet Redwood', 'gauntlet2', 20000, 'muscles', 'https://wiki.rage.mp/images/thumb/b/b0/Gauntlet2.png/800px-Gauntlet2.png'),
	(219, 'Gauntlet Classic', 'gauntlet3', 20000, 'muscles', 'https://wiki.rage.mp/images/thumb/8/88/Gauntlet3.png/800px-Gauntlet3.png'),
	(220, 'Gauntlet Hellfire', 'gauntlet4', 30000, 'muscles', 'https://wiki.rage.mp/images/thumb/e/ec/Gauntlet4.png/800px-Gauntlet4.png'),
	(221, 'Gauntlet Classic Custom', 'gauntlet5', 20000, 'muscles', 'https://wiki.rage.mp/images/thumb/d/de/Gauntlet5.png/800px-Gauntlet5.png'),
	(222, 'Hermes', 'hermes', 30000, 'muscles', 'https://wiki.rage.mp/images/thumb/0/0d/Hermes.png/800px-Hermes.png'),
	(223, 'Hotknife', 'hotknife', 30000, 'muscles', 'https://wiki.rage.mp/images/thumb/1/16/Hotknife.png/800px-Hotknife.png'),
	(224, 'Hustler', 'hustler', 30000, 'muscles', 'https://wiki.rage.mp/images/3/3f/Hustler.png'),
	(225, 'Impaler', 'impaler', 15000, 'muscles', 'https://wiki.rage.mp/images/thumb/3/31/Impaler.png/800px-Impaler.png'),
	(226, 'Lurcher', 'lurcher', 15000, 'muscles', 'https://wiki.rage.mp/images/thumb/0/03/Lurcher.png/800px-Lurcher.png'),
	(227, 'Manana Custom', 'manana2', 15000, 'muscles', 'https://wiki.rage.mp/images/thumb/9/9e/Manana2.png/800px-Manana2.png'),
	(228, 'Moonbeam', 'moonbeam', 15000, 'muscles', 'https://wiki.rage.mp/images/thumb/5/5d/Moonbeam.png/800px-Moonbeam.png'),
	(229, 'Moonbeam Custom', 'moonbeam2', 20000, 'muscles', 'https://wiki.rage.mp/images/thumb/c/c1/Moonbeam2.png/800px-Moonbeam2.png'),
	(230, 'Nightshade', 'nightshade', 30000, 'muscles', 'https://wiki.rage.mp/images/thumb/e/ec/Nightshade.png/800px-Nightshade.png'),
	(231, 'Peyote Gasser', 'peyote2', 30000, 'muscles', 'https://wiki.rage.mp/images/thumb/3/35/Peyote2.png/800px-Peyote2.png'),
	(232, 'Phoenix', 'phoenix', 15000, 'muscles', 'https://wiki.rage.mp/images/thumb/5/53/Pheonix.png/800px-Pheonix.png'),
	(233, 'Picador', 'picador', 15000, 'muscles', 'https://wiki.rage.mp/images/thumb/1/15/Picador.png/800px-Picador.png'),
	(234, 'Rat-Loader', 'ratloader', 12500, 'muscles', 'https://wiki.rage.mp/images/thumb/7/7a/Ratloader.png/800px-Ratloader.png'),
	(235, 'Rat-Truck', 'ratloader2', 15000, 'muscles', 'https://wiki.rage.mp/images/thumb/b/b7/Ratloader2.png/800px-Ratloader2.png'),
	(236, 'Ruiner', 'ruiner', 15000, 'muscles', 'https://wiki.rage.mp/images/thumb/b/b4/Ruiner.png/800px-Ruiner.png'),
	(237, 'Sabre Turbo', 'sabregt', 15000, 'muscles', 'https://wiki.rage.mp/images/thumb/0/04/Sabregt.png/800px-Sabregt.png'),
	(238, 'Sabre Turbo Custom', 'sabregt2', 20000, 'muscles', 'https://wiki.rage.mp/images/thumb/b/ba/Sabregt2.png/800px-Sabregt2.png'),
	(239, 'Slamvan', 'slamvan', 15000, 'muscles', 'https://wiki.rage.mp/images/3/39/SlamVan.png'),
	(240, 'Slamvan Lost', 'slamvan2', 15000, 'muscles', 'https://wiki.rage.mp/images/3/3a/SlamVan2.png'),
	(241, 'Slamvan Custom', 'slamvan3', 15000, 'muscles', 'https://wiki.rage.mp/images/thumb/f/fe/Slamvan3.png/800px-Slamvan3.png'),
	(242, 'Stallion', 'stalion', 15000, 'muscles', 'https://wiki.rage.mp/images/thumb/c/ce/Stalion.png/800px-Stalion.png'),
	(243, 'Stallion Burger Shot', 'stalion2', 15000, 'muscles', 'https://wiki.rage.mp/images/thumb/4/4a/Stalion2.png/800px-Stalion2.png'),
	(244, 'Tampa', 'tampa', 15000, 'muscles', 'https://wiki.rage.mp/images/thumb/3/30/Tampa.png/800px-Tampa.png'),
	(245, 'Tulip', 'tulip', 15000, 'muscles', 'https://wiki.rage.mp/images/thumb/c/cf/Tulip.png/800px-Tulip.png'),
	(246, 'Vamos', 'vamos', 15000, 'muscles', 'https://wiki.rage.mp/images/thumb/0/07/Vamos.png/800px-Vamos.png'),
	(247, 'Vigero', 'vigero', 15000, 'muscles', 'https://wiki.rage.mp/images/thumb/2/22/Vigero.png/800px-Vigero.png'),
	(248, 'Virgo', 'virgo', 15000, 'muscles', 'https://wiki.rage.mp/images/thumb/4/41/Virgo.png/800px-Virgo.png'),
	(249, 'Virgo Classic Custom', 'virgo2', 20000, 'muscles', 'https://wiki.rage.mp/images/thumb/8/81/Virgo2.png/800px-Virgo2.png'),
	(250, 'Virgo Classic', 'virgo3', 15000, 'muscles', 'https://wiki.rage.mp/images/thumb/4/4d/Virgo3.png/800px-Virgo3.png'),
	(251, 'Voodoo Custom', 'voodoo', 20000, 'muscles', 'https://wiki.rage.mp/images/thumb/1/1e/Voodoo.png/800px-Voodoo.png'),
	(252, 'Voodoo', 'voodoo2', 12500, 'muscles', 'https://wiki.rage.mp/images/thumb/5/5e/Voodoo2.png/800px-Voodoo2.png'),
	(253, 'Yosemite', 'yosemite', 15000, 'muscles', 'https://wiki.rage.mp/images/thumb/7/7a/Yosemite.png/800px-Yosemite.png'),
	(254, 'Yosemite Drift', 'yosemite2', 20000, 'muscles', 'https://wiki.rage.mp/images/thumb/5/58/Yosemite2.png/800px-Yosemite2.png'),
	(260, 'Roosevelt', 'btype', 40000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/6/64/Btype.png/800px-Btype.png'),
	(261, 'Franken Strange', 'btype3', 50000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/3/34/Btype3.png/800px-Btype3.png'),
	(262, 'Roosevelt Valor', 'btype2', 40000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/9/98/Btype2.png/800px-Btype2.png'),
	(263, 'Casco', 'casco', 40000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/d/d7/Casco.png/800px-Casco.png'),
	(264, 'Cheburek', 'cheburek', 30000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/4/4f/Cheburek.png/800px-Cheburek.png'),
	(265, 'Cheetah Classic', 'cheetah2', 50000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/d/dd/Cheetah2.png/800px-Cheetah2.png'),
	(266, 'Coquette Classic', 'coquette2', 50000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/8/8a/Coquette2.png/800px-Coquette2.png'),
	(267, 'Dynasty', 'dynasty', 30000, 'sportsclassics', 'https://wiki.rage.mp/images/8/88/Dynasty.png'),
	(268, 'Fagaloa', 'fagaloa', 30000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/1/15/Fagaloa.png/800px-Fagaloa.png'),
	(269, 'Stirling GT', 'feltzer3', 40000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/0/0b/Feltzer3.png/800px-Feltzer3.png'),
	(270, 'GT 500', 'gt500', 40000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/8/84/Gt500.png/800px-Gt500.png'),
	(271, 'Infernus Classic', 'infernus2', 50000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/9/91/Infernus2.png/800px-Infernus2.png'),
	(272, 'Mamba', 'mamba', 40000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/c/c0/Mamba.png/800px-Mamba.png'),
	(273, 'Manana', 'manana', 30000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/5/50/Manana.png/800px-Manana.png'),
	(274, 'Michelli GT', 'michelli', 30000, 'sportsclassics', 'https://wiki.rage.mp/images/1/15/Michelli.png'),
	(275, 'Monroe', 'monroe', 40000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/6/64/Monroe.png/800px-Monroe.png'),
	(276, 'Nebula Turbo', 'nebula', 30000, 'sportsclassics', 'https://wiki.rage.mp/images/e/ea/Nebula.png'),
	(277, 'Peyote', 'peyote', 30000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/2/21/Peyote.png/800px-Peyote.png'),
	(278, 'Peyote Gasser', 'peyote3', 35000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/d/d9/Peyote3.png/800px-Peyote3.png'),
	(279, 'Pigalle', 'pigalle', 30000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/7/76/Pigalle.png/800px-Pigalle.png'),
	(280, 'Rapid GT Classic', 'rapidgt3', 35000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/0/09/Rapidgt3.png/800px-Rapidgt3.png'),
	(281, 'Retinue', 'retinue', 30000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/5/53/Retinue.png/800px-Retinue.png'),
	(282, 'Retinue MK II', 'retinue2', 35000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/8/86/Retinue2.png/800px-Retinue2.png'),
	(283, 'Savestra', 'savestra', 35000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/2/26/Savestra.png/800px-Savestra.png'),
	(284, 'Stinger', 'stinger', 35000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/b/b6/Stinger.png/800px-Stinger.png'),
	(285, 'Stinger GT', 'stingergt', 40000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/8/8d/Stingergt.png/800px-Stingergt.png'),
	(287, 'Torero', 'torero', 50000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/5/5f/Torero.png/800px-Torero.png'),
	(288, 'Tornado', 'tornado', 35000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/4/40/Tornado.png/800px-Tornado.png'),
	(289, 'Tornado 2', 'tornado2', 35000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/0/05/Tornado2.png/800px-Tornado2.png'),
	(290, 'Tornado 3', 'tornado3', 30000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/7/7d/Tornado3.png/800px-Tornado3.png'),
	(291, 'Tornado 4', 'tornado4', 30000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/f/fa/Tornado4.png/800px-Tornado4.png'),
	(292, 'Tornado Custom', 'tornado5', 35000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/8/83/Tornado5.png/800px-Tornado5.png'),
	(293, 'Tornado Rat Rod', 'tornado6', 35000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/6/69/Tornado6.png/800px-Tornado6.png'),
	(294, 'Turismo Classic', 'turismo2', 50000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/f/fa/Turismo2.png/800px-Turismo2.png'),
	(295, 'Viseris', 'viseris', 40000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/2/24/Viseris.png/800px-Viseris.png'),
	(296, '190z', 'z190', 40000, 'sportsclassics', 'https://wiki.rage.mp/images/e/e1/Z190.png'),
	(297, 'Zion Classic', 'zion3', 30000, 'sportsclassics', 'https://wiki.rage.mp/images/5/5a/Zion3.png'),
	(298, 'Z-Type', 'ztype', 40000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/5/56/Ztype.png/800px-Ztype.png'),
	(300, 'Alpha', 'alpha', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/a/a8/Alpha.png/800px-Alpha.png'),
	(301, 'Banshee', 'banshee', 75000, 'sports', 'https://wiki.rage.mp/images/thumb/d/d3/Banshee.png/800px-Banshee.png'),
	(302, 'Bestia GTS', 'bestiagts', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/5/5c/Bestiagts.png/800px-Bestiagts.png'),
	(303, 'Blista Compact', 'blista2', 25000, 'sports', 'https://wiki.rage.mp/images/thumb/0/0c/Blista2.png/800px-Blista2.png'),
	(304, 'Blista Go Go Monkey', 'blista3', 25000, 'sports', 'https://wiki.rage.mp/images/thumb/8/8c/Blista3.png/800px-Blista3.png'),
	(305, 'Buffalo', 'buffalo', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/0/0a/Buffalo.png/800px-Buffalo.png'),
	(306, 'Buffalo S', 'buffalo2', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/2/2c/Buffalo2.png/800px-Buffalo2.png'),
	(307, 'Buffalo Sprunk', 'buffalo3', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/6/68/Buffalo3.png/800px-Buffalo3.png'),
	(308, 'Carbonizzare', 'carbonizzare', 75000, 'sports', 'https://wiki.rage.mp/images/thumb/4/43/Carbonizzare.png/800px-Carbonizzare.png'),
	(309, 'Comet', 'comet2', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/c/cb/Comet2.png/800px-Comet2.png'),
	(310, 'Comet Retro Custom', 'comet3', 52500, 'sports', 'https://wiki.rage.mp/images/thumb/b/b6/Comet3.png/800px-Comet3.png'),
	(311, 'Comet Safari', 'comet4', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/f/f1/Comet4.png/800px-Comet4.png'),
	(312, 'Comet SR', 'comet5', 55000, 'sports', 'https://wiki.rage.mp/images/c/ca/Comet5.png'),
	(313, 'Coquette', 'coquette', 75000, 'sports', 'https://wiki.rage.mp/images/thumb/d/d6/Coquette.png/800px-Coquette.png'),
	(314, 'Coquette D10', 'coquette4', 100000, 'sports', 'https://wiki.rage.mp/images/thumb/9/97/Coquette4.png/800px-Coquette4.png'),
	(315, '8F Drafter', 'drafter', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/a/aa/Drafter.png/800px-Drafter.png'),
	(316, 'Elegy Retro Custom', 'elegy', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/e/ea/Elegy.png/800px-Elegy.png'),
	(317, 'Elegy RH8', 'elegy2', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/3/33/Elegy2.png/800px-Elegy2.png'),
	(318, 'Feltzer', 'feltzer2', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/7/7c/Feltzer2.png/800px-Feltzer2.png'),
	(319, 'Flash GT', 'flashgt', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/8/80/Flashgt.png/800px-Flashgt.png'),
	(320, 'Furore GT', 'furoregt', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/c/cb/Furoregt.png/800px-Furoregt.png'),
	(321, 'Fusilade', 'fusilade', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/5/56/Fusilade.png/800px-Fusilade.png'),
	(322, 'Futo', 'futo', 25000, 'sports', 'https://wiki.rage.mp/images/thumb/0/04/Futo.png/800px-Futo.png'),
	(323, 'GB200', 'gb200', 37500, 'sports', 'https://wiki.rage.mp/images/thumb/3/35/Gb200.png/800px-Gb200.png'),
	(324, 'Hotring Sabre', 'hotring', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/2/26/Hotring.png/800px-Hotring.png'),
	(325, 'Imorgon', 'imorgon', 75000, 'sports', 'https://wiki.rage.mp/images/thumb/1/1f/Imorgon.png/800px-Imorgon.png'),
	(326, 'Issi Sport', 'issi7', 37500, 'sports', 'https://wiki.rage.mp/images/thumb/0/04/Issi7.png/727px-Issi7.png'),
	(327, 'Itali GTO', 'italigto', 100000, 'sports', 'https://wiki.rage.mp/images/thumb/8/83/ItaliGTO.png/800px-ItaliGTO.png'),
	(328, 'Itali RSX', 'italirsx', 100000, 'sports', 'https://wiki.rage.mp/images/thumb/1/1a/0xBB78956A.png/800px-0xBB78956A.png'),
	(329, 'Jester', 'jester', 75000, 'sports', 'https://wiki.rage.mp/images/thumb/e/e0/Jester.png/800px-Jester.png'),
	(330, 'Jester (Racecar)', 'jester2', 75000, 'sports', 'https://wiki.rage.mp/images/thumb/3/34/Jester2.png/800px-Jester2.png'),
	(331, 'Jester Classic', 'jester3', 37500, 'sports', 'https://wiki.rage.mp/images/thumb/1/19/Jester3.png/800px-Jester3.png'),
	(332, 'Jugular', 'jugular', 50000, 'sports', 'https://wiki.rage.mp/images/6/69/Jugular.png'),
	(333, 'Khamelion', 'khamelion', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/2/2e/Khamelion.png/800px-Khamelion.png'),
	(334, 'Komoda', 'komoda', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/4/47/Komoda.png/800px-Komoda.png'),
	(335, 'Kuruma', 'kuruma', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/8/8f/Kuruma.png/800px-Kuruma.png'),
	(336, 'Locust', 'locust', 75000, 'sports', 'https://wiki.rage.mp/images/thumb/1/1e/Locust.png/780px-Locust.png'),
	(337, 'Lynx', 'lynx', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/a/a7/Lynx2.png/800px-Lynx2.png'),
	(338, 'Massacro', 'massacro', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/7/78/Massacro.png/800px-Massacro.png'),
	(339, 'Massacro (Racecar)', 'massacro2', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/b/be/Massacro2.png/800px-Massacro2.png'),
	(340, 'Neo', 'neo', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/7/74/Neo.png/800px-Neo.png'),
	(341, 'Neon', 'neon', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/1/17/Neon.png/800px-Neon.png'),
	(342, '9F', 'ninef', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/5/59/Ninef.png/800px-Ninef.png'),
	(343, '9F Cabrio', 'ninef2', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/f/f6/Ninef2.png/800px-Ninef2.png'),
	(344, 'Omnis', 'omnis', 37500, 'sports', 'https://wiki.rage.mp/images/thumb/1/12/Omnis.png/800px-Omnis.png'),
	(345, 'Paragon R', 'paragon', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/1/1e/Paragon.png/800px-Paragon.png'),
	(346, 'Pariah', 'pariah', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/d/df/Pariah.png/800px-Pariah.png'),
	(347, 'Penumbra', 'penumbra', 37500, 'sports', 'https://wiki.rage.mp/images/thumb/9/93/Penumbra.png/800px-Penumbra.png'),
	(348, 'Penumbra FF', 'penumbra2', 37500, 'sports', 'https://wiki.rage.mp/images/thumb/d/dd/Penumbra2.png/800px-Penumbra2.png'),
	(349, 'Raiden', 'raiden', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/5/5f/Raiden.png/800px-Raiden.png'),
	(350, 'Rapid GT', 'rapidgt', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/e/e9/Rapidgt.png/800px-Rapidgt.png'),
	(351, 'Rapid GT 2', 'rapidgt2', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/3/3e/Rapidgt2.png/800px-Rapidgt2.png'),
	(352, 'Raptor', 'raptor', 37500, 'sports', 'https://wiki.rage.mp/images/thumb/0/08/Raptor.png/800px-Raptor.png'),
	(353, 'Revolter', 'revolter', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/2/24/Revolter.png/800px-Revolter.png'),
	(354, 'Ruston', 'ruston', 75000, 'sports', 'https://wiki.rage.mp/images/thumb/b/ba/Ruston.png/800px-Ruston.png'),
	(355, 'Schafter V12', 'schafter3', 25000, 'sports', 'https://wiki.rage.mp/images/thumb/a/a9/Schafter3.png/800px-Schafter3.png'),
	(356, 'Schafter LWB', 'schafter4', 25000, 'sports', 'https://wiki.rage.mp/images/thumb/2/29/Schafter4.png/800px-Schafter4.png'),
	(357, 'Schlagen GT', 'schlagen', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/9/97/Schlagen.png/800px-Schlagen.png'),
	(358, 'Schwartzer', 'schwarzer', 37500, 'sports', 'https://wiki.rage.mp/images/thumb/1/19/Schwarzer.png/800px-Schwarzer.png'),
	(359, 'Sentinel Classic', 'sentinel3', 37500, 'sports', 'https://wiki.rage.mp/images/thumb/0/0f/Sentinel3.png/800px-Sentinel3.png'),
	(360, 'Seven 70', 'seven70', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/6/60/Seven70.png/800px-Seven70.png'),
	(361, 'Specter', 'specter', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/f/f1/Specter.png/800px-Specter.png'),
	(362, 'Specter Custom', 'specter2', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/9/9f/Specter2.png/800px-Specter2.png'),
	(363, 'Streiter', 'streiter', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/8/81/Streiter.png/800px-Streiter.png'),
	(364, 'Sugoi', 'sugoi', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/2/25/Sugoi.png/800px-Sugoi.png'),
	(365, 'Sultan', 'sultan', 25000, 'sports', 'https://wiki.rage.mp/images/thumb/f/f4/Sultan.png/800px-Sultan.png'),
	(366, 'Sultan Classic', 'sultan2', 37500, 'sports', 'https://wiki.rage.mp/images/thumb/5/57/Sultan2.png/800px-Sultan2.png'),
	(367, 'Surano', 'surano', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/9/96/Surano.png/800px-Surano.png'),
	(368, 'Drift Tampa', 'tampa2', 75000, 'sports', 'https://wiki.rage.mp/images/thumb/a/af/Tampa2.png/800px-Tampa2.png'),
	(369, 'Tropos Rallye', 'tropos', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/7/71/Tropos.png/800px-Tropos.png'),
	(370, 'Verlierer', 'verlierer2', 75000, 'sports', 'https://wiki.rage.mp/images/thumb/8/81/Verlierer2.png/800px-Verlierer2.png'),
	(371, 'V-STR', 'vstr', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/4/43/Vstr.png/800px-Vstr.png'),
	(400, 'Adder', 'adder', 250000, 'supers', 'https://wiki.rage.mp/images/thumb/c/c2/Adder.png/800px-Adder.png'),
	(401, 'Autarch', 'autarch', 375000, 'supers', 'https://wiki.rage.mp/images/thumb/3/38/Autarch.png/800px-Autarch.png'),
	(402, 'Banshee 900R', 'banshee2', 250000, 'supers', 'https://wiki.rage.mp/images/thumb/9/9b/Banshee2.png/800px-Banshee2.png'),
	(403, 'Bullet', 'bullet', 250000, 'supers', 'https://wiki.rage.mp/images/thumb/7/7a/Bullet.png/800px-Bullet.png'),
	(404, 'Cheetah', 'cheetah', 250000, 'supers', 'https://wiki.rage.mp/images/thumb/9/9e/Cheetah.png/800px-Cheetah.png'),
	(405, 'Cyclone', 'cyclone', 250000, 'supers', 'https://wiki.rage.mp/images/thumb/7/79/Cyclone.png/800px-Cyclone.png'),
	(406, 'Deveste Eight', 'deveste', 375000, 'supers', 'https://wiki.rage.mp/images/thumb/3/3f/Deveste.png/800px-Deveste.png'),
	(407, 'Emerus', 'emerus', 375000, 'supers', 'https://wiki.rage.mp/images/thumb/0/0a/Emerus.png/790px-Emerus.png'),
	(408, 'Entity XF', 'entityxf', 250000, 'supers', 'https://wiki.rage.mp/images/thumb/6/61/Entityxf.png/800px-Entityxf.png'),
	(409, 'Entity XXR', 'entity2', 300000, 'supers', 'https://wiki.rage.mp/images/thumb/f/f3/Entity2.png/800px-Entity2.png'),
	(410, 'FMJ', 'fmj', 375000, 'supers', 'https://wiki.rage.mp/images/thumb/d/d2/Fmj.png/800px-Fmj.png'),
	(411, 'PR4', 'formula', 500000, 'supers', 'https://wiki.rage.mp/images/thumb/c/cf/Formula.png/800px-Formula.png'),
	(412, 'R88', 'formula2', 500000, 'supers', 'https://wiki.rage.mp/images/thumb/0/03/Formula2.png/800px-Formula2.png'),
	(413, 'Furia', 'furia', 300000, 'supers', 'https://wiki.rage.mp/images/thumb/0/05/Furia.png/800px-Furia.png'),
	(414, 'GP1', 'gp1', 375000, 'supers', 'https://wiki.rage.mp/images/thumb/a/a4/Gp1.png/800px-Gp1.png'),
	(415, 'Infernus', 'infernus', 250000, 'supers', 'https://wiki.rage.mp/images/thumb/d/d2/Infernus.png/800px-Infernus.png'),
	(416, 'Itali GTB', 'italigtb', 375000, 'supers', 'https://wiki.rage.mp/images/thumb/d/dd/Italigtb.png/800px-Italigtb.png'),
	(417, 'Itali GTB Custom', 'italigtb2', 375000, 'supers', 'https://wiki.rage.mp/images/thumb/5/57/Italigtb2.png/800px-Italigtb2.png'),
	(418, 'Krieger', 'krieger', 375000, 'supers', 'https://wiki.rage.mp/images/thumb/f/fc/Krieger.png/732px-Krieger.png'),
	(419, 'RE-7B', 'le7b', 375000, 'supers', 'https://wiki.rage.mp/images/thumb/e/ee/Le7b.png/800px-Le7b.png'),
	(420, 'Nero', 'nero', 300000, 'supers', 'https://wiki.rage.mp/images/thumb/e/ed/Nero.png/800px-Nero.png'),
	(421, 'Nero Custom', 'nero2', 300000, 'supers', 'https://wiki.rage.mp/images/thumb/e/ec/Nero2.png/800px-Nero2.png'),
	(422, 'BR8','openwheel1', 500000, 'supers', 'https://wiki.rage.mp/images/thumb/a/ae/Openwheel1.png/800px-Openwheel1.png'),
	(423, 'DR1','openwheel2', 500000, 'supers', 'https://wiki.rage.mp/images/thumb/4/49/Openwheel2.png/800px-Openwheel2.png'),
	(424, 'Osiris', 'osiris', 300000, 'supers', 'https://wiki.rage.mp/images/thumb/e/e3/Osiris.png/800px-Osiris.png'),
	(425, 'Penetrator', 'penetrator', 250000, 'supers', 'https://wiki.rage.mp/images/thumb/d/d9/Penetrator.png/800px-Penetrator.png'),
	(426, 'Pfister 811', 'pfister811', 300000, 'supers', 'https://wiki.rage.mp/images/thumb/8/8e/Pfister811.png/800px-Pfister811.png'),
	(427, 'X80 Proto', 'prototipo', 375000, 'supers', 'https://wiki.rage.mp/images/thumb/f/fb/Prototipo.png/800px-Prototipo.png'),
	(428, 'Reaper', 'reaper', 375000, 'supers', 'https://wiki.rage.mp/images/thumb/6/6a/Reaper.png/800px-Reaper.png'),
	(429, 'S80RR', 's80', 375000, 'supers', 'https://wiki.rage.mp/images/thumb/a/a2/S80.png/756px-S80.png'),
	(430, 'SC1', 'sc1', 300000, 'supers', 'https://wiki.rage.mp/images/thumb/5/59/Sc1.png/800px-Sc1.png'),
	(431, 'ETR1', 'sheava', 250000, 'supers', 'https://wiki.rage.mp/images/thumb/0/06/Sheava.png/800px-Sheava.png'),
	(432, 'Sultan RS', 'sultanrs', 250000, 'supers', 'https://wiki.rage.mp/images/thumb/8/88/Sultanrs.png/800px-Sultanrs.png'),
	(433, 'T20', 't20', 300000, 'supers', 'https://wiki.rage.mp/images/thumb/7/7d/T20.png/800px-T20.png'),
	(434, 'Taipan', 'taipan', 375000, 'supers', 'https://wiki.rage.mp/images/thumb/8/8a/Taipan.png/800px-Taipan.png'),
	(435, 'Tempesta', 'tempesta', 375000, 'supers', 'https://wiki.rage.mp/images/thumb/8/8a/Tempesta.png/800px-Tempesta.png'),
	(436, 'Tezeract', 'tezeract', 375000, 'supers', 'https://wiki.rage.mp/images/thumb/a/ab/Tezeract.png/800px-Tezeract.png'),
	(437, 'Tigon', 'tigon', 375000, 'supers', 'https://wiki.rage.mp/images/thumb/f/f4/Tigon.png/800px-Tigon.png'),
	(438, 'Thrax', 'thrax', 375000, 'supers', 'https://wiki.rage.mp/images/thumb/4/4f/Thrax.png/670px-Thrax.png'),
	(439, 'Turismo R', 'turismor', 375000, 'supers', 'https://wiki.rage.mp/images/thumb/7/7f/Turismor.png/800px-Turismor.png'),
	(440, 'Tyrant', 'tyrant', 300000, 'supers', 'https://wiki.rage.mp/images/thumb/0/0a/Tyrant.png/800px-Tyrant.png'),
	(441, 'Tyrus', 'tyrus', 375000, 'supers', 'https://wiki.rage.mp/images/thumb/e/e4/Tyrus.png/800px-Tyrus.png'),
	(442, 'Vacca', 'vacca', 300000, 'supers', 'https://wiki.rage.mp/images/thumb/1/14/Vacca.png/800px-Vacca.png'),
	(443, 'Vagner', 'vagner', 375000, 'supers', 'https://wiki.rage.mp/images/thumb/9/92/Vagner.png/800px-Vagner.png'),
	(444, 'Visione', 'visione', 375000, 'supers', 'https://wiki.rage.mp/images/thumb/0/01/Visione.png/800px-Visione.png'),
	(445, 'Voltic', 'voltic', 250000, 'supers', 'https://wiki.rage.mp/images/thumb/e/ef/Voltic.png/800px-Voltic.png'),
	(446, 'XA-21', 'xa21', 375000, 'supers', 'https://wiki.rage.mp/images/thumb/4/4d/Xa21.png/800px-Xa21.png'),
	(447, 'Zentorno', 'zentorno', 375000, 'supers', 'https://wiki.rage.mp/images/thumb/2/2b/Zentorno.png/800px-Zentorno.png'),
	(448, 'Zorrusso', 'zorrusso', 375000, 'supers', 'https://wiki.rage.mp/images/thumb/7/79/Zorrusso.png/660px-Zorrusso.png'),
	(500, 'Akuma', 'akuma', 10000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/1/16/Akuma.png/800px-Akuma.png'),
	(501, 'Avarus', 'avarus', 20000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/1/13/Avarus.png/800px-Avarus.png'),
	(502, 'Bagger', 'bagger', 20000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/6/64/Bagger.png/800px-Bagger.png'),
	(503, 'Bati 801', 'bati', 15000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/c/ce/Bati.png/800px-Bati.png'),
	(504, 'Bati 801RR', 'bati2', 15000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/6/60/Bati2.png/800px-Bati2.png'),
	(505, 'BF400', 'bf400', 7500, 'motorcycles', 'https://wiki.rage.mp/images/thumb/3/3a/BF400.png/800px-BF400.png'),
	(506, 'Blazer', 'blazer', 10000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/3/3e/Blazer.png/800px-Blazer.png'),
	(507, 'Blazer Hot Rod', 'blazer3', 10000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/d/d5/Blazer3.png/800px-Blazer3.png'),
	(508, 'Blazer Sport', 'blazer4', 10000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/5/5f/Blazer4.png/800px-Blazer4.png'),
	(509, 'Caddy', 'caddy', 5000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/9/94/Caddy.png/800px-Caddy.png'),
	(510, 'Caddy 2', 'caddy2', 5000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/2/25/Caddy2.png/800px-Caddy2.png'),
	(511, 'Caddy 3', 'caddy3', 5000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/8/8c/Caddy3.png/800px-Caddy3.png'),
	(512, 'Carbon RS', 'carbonrs', 15000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/d/d3/CarbonRS.png/800px-CarbonRS.png'),
	(513, 'Chimera', 'chimera', 20000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/3/36/Chimera.png/800px-Chimera.png'),
	(514, 'Cliffhanger', 'cliffhanger', 7500, 'motorcycles', 'https://wiki.rage.mp/images/thumb/1/12/Cliffhanger.png/800px-Cliffhanger.png'),
	(515, 'Daemon', 'daemon', 10000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/2/27/Daemon.png/800px-Daemon.png'),
	(516, 'Daemon 2', 'daemon2', 10000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/8/86/Daemon2.png/800px-Daemon2.png'),
	(517, 'Defiler', 'defiler', 10000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/4/41/Defiler.png/800px-Defiler.png'),
	(518, 'Diabolus', 'diablous', 15000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/4/48/Diablous.png/800px-Diablous.png'),
	(519, 'Diabolus Custom', 'diablous2', 15000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/3/3e/Diablous2.png/800px-Diablous2.png'),
	(520, 'Double T', 'double', 15000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/0/01/Double.png/800px-Double.png'),
	(521, 'Enduro', 'enduro', 7500, 'motorcycles', 'https://wiki.rage.mp/images/thumb/f/f3/Enduro.png/800px-Enduro.png'),
	(522, 'Esskey', 'esskey', 7500, 'motorcycles', 'https://wiki.rage.mp/images/thumb/2/24/Esskey.png/800px-Esskey.png'),
	(523, 'Faggio Sport', 'faggio', 2500, 'motorcycles', 'https://wiki.rage.mp/images/thumb/4/4d/Faggio.png/800px-Faggio.png'),
	(524, 'Faggio', 'faggio2', 2500, 'motorcycles', 'https://wiki.rage.mp/images/thumb/2/25/Faggio2.png/800px-Faggio2.png'),
	(525, 'Faggio Mod', 'faggio3', 2500, 'motorcycles', 'https://wiki.rage.mp/images/thumb/a/a6/Faggio3.png/800px-Faggio3.png'),
	(526, 'FCR 1000', 'fcr', 10000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/4/46/Fcr.png/800px-Fcr.png'),
	(527, 'FCR 1000 Custom', 'fcr2', 10000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/d/d5/Fcr2.png/800px-Fcr2.png'),
	(528, 'Gargoyle', 'gargoyle', 15000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/4/44/Gargoyle.png/800px-Gargoyle.png'),
	(529, 'Hakuchou', 'hakuchou', 15000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/2/23/Hakuchou.png/800px-Hakuchou.png'),
	(530, 'Hakuchou Sport', 'hakuchou2', 20000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/8/87/Hakuchou2.png/800px-Hakuchou2.png'),
	(531, 'Hexer', 'hexer', 20000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/5/56/Hexer.png/800px-Hexer.png'),
	(532, 'Innovation', 'innovation', 20000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/4/42/Innovation.png/800px-Innovation.png'),
	(533, 'Lectro', 'lectro', 15000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/0/00/Lectro.png/800px-Lectro.png'),
	(534, 'Manchez', 'manchez', 10000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/3/3c/Manchez.png/800px-Manchez.png'),
	(535, 'Manchez 2', 'manchez2', 10000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/a/a3/0x40C332A3.png/800px-0x40C332A3.png'),
	(536, 'Nemesis', 'nemesis', 10000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/e/e3/Nemesis.png/800px-Nemesis.png'),
	(537, 'Nightblade', 'nightblade', 20000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/c/c1/Nightblade.png/800px-Nightblade.png'),
	(538, 'PCJ 600', 'pcj', 10000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/9/99/Pcj.png/800px-Pcj.png'),
	(539, 'Rat Bike', 'ratbike', 20000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/4/49/Ratbike.png/800px-Ratbike.png'),
	(540, 'Ruffian', 'ruffian', 10000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/f/f6/Ruffian.png/800px-Ruffian.png'),
	(541, 'Sanchez', 'sanchez', 10000, 'motorcycles', 'https://wiki.rage.mp/images/5/52/Sanchez.png'),
	(542, 'Sanchez Sport', 'sanchez2', 10000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/6/6d/Sanchez2.png/800px-Sanchez2.png'),
	(543, 'Sanctus', 'sanctus', 20000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/e/e2/Sanctus.png/800px-Sanctus.png'),
	(544, 'Stryder', 'stryder', 20000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/c/c3/Stryder.png/800px-Stryder.png'),
	(545, 'Sovereign', 'sovereign', 20000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/a/ae/Sovereign.png/800px-Sovereign.png'),
	(546, 'Thrust', 'thrust', 20000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/9/90/Thrust.png/800px-Thrust.png'),
	(547, 'Vader', 'vader', 10000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/d/dc/Vader.png/800px-Vader.png'),
	(548, 'Veto Classic', 'veto', 5000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/1/11/0xCCE5C8FA.png/800px-0xCCE5C8FA.png'),
	(549, 'Veto Modern', 'veto2', 5000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/c/cc/0xA703E4A9.png/800px-0xA703E4A9.png'),
	(550, 'Vindicator', 'vindicator', 20000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/b/bb/Vindicator.png/800px-Vindicator.png'),
	(551, 'Vortex', 'vortex', 10000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/5/52/Vortex.png/800px-Vortex.png'),
	(552, 'Woflsbane', 'wolfsbane', 10000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/c/c6/Wolfsbane.png/800px-Wolfsbane.png'),
	(553, 'Zombie Bobber', 'zombiea', 10000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/7/7f/Zombiea.png/800px-Zombiea.png'),
	(554, 'Zombie Chopper', 'zombieb', 10000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/2/2c/Zombieb.png/800px-Zombieb.png'),
	(555, 'Shotaro', 'shotaro', 30000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/e/e3/Shotaro.png/800px-Shotaro.png'),
	(600, 'Bf Injection', 'bfinjection', 15000, 'offroads', 'https://wiki.rage.mp/images/thumb/3/3d/Bfinject.png/800px-Bfinject.png'),
	(601, 'Bifta', 'bifta', 15000, 'offroads', 'https://wiki.rage.mp/images/thumb/b/b7/Bifta.png/800px-Bifta.png'),
	(602, 'Bison', 'bison', 25000, 'offroads', 'https://wiki.rage.mp/images/f/f6/Bison.png'),
	(603, 'Bison 3', 'bison3', 25000, 'offroads', 'https://wiki.rage.mp/images/7/7f/Bison3.png'),
	(604, 'Bobcat XL', 'bobcatxl', 25000, 'offroads', 'https://wiki.rage.mp/images/d/d8/BobcatXL.png'),
	(605, 'Bodhi', 'bodhi2', 15000, 'offroads', 'https://wiki.rage.mp/images/thumb/c/ce/Bodhi2.png/800px-Bodhi2.png'),
	(606, 'Brawler', 'brawler', 45000, 'offroads', 'https://wiki.rage.mp/images/thumb/f/fa/Brawler.png/800px-Brawler.png'),
	(607, 'Caracara 4x4', 'caracara2', 50000, 'offroads', 'https://wiki.rage.mp/images/3/3b/Caracara2.png'),
	(608, 'Contender', 'contender', 45000, 'offroads', 'https://wiki.rage.mp/images/thumb/2/2e/Contender.png/800px-Contender.png'),
	(609, 'Duneloader', 'dloader', 25000, 'offroads', 'https://wiki.rage.mp/images/thumb/1/1a/Dloader.png/800px-Dloader.png'),
	(610, 'Dubsta 6x6', 'dubsta3', 50000, 'offroads', 'https://wiki.rage.mp/images/thumb/d/d6/Dubsta3.png/800px-Dubsta3.png'),
	(611, 'Dune Buggy', 'dune', 10000, 'offroads', 'https://wiki.rage.mp/images/thumb/c/c6/Dune.png/800px-Dune.png'),
	(612, 'Space Docker', 'dune2', 10000, 'offroads', 'https://wiki.rage.mp/images/thumb/1/10/Dune2.png/800px-Dune2.png'),
	(613, 'Everon', 'everon', 50000, 'offroads', 'https://wiki.rage.mp/images/thumb/8/83/Everon.png/800px-Everon.png'),
	(614, 'Freecrawler', 'freecrawler', 25000, 'offroads', 'https://wiki.rage.mp/images/5/56/Freecrawler.png'),
	(615, 'Guardian', 'guardian', 50000, 'offroads', 'https://wiki.rage.mp/images/thumb/f/fd/Guardian.png/800px-Guardian.png'),
	(616, 'Hellion', 'hellion', 25000, 'offroads', 'https://wiki.rage.mp/images/c/cf/Hellion.png'),
	(617, 'Insurgent', 'insurgent2', 75000, 'offroads', 'https://wiki.rage.mp/images/thumb/2/2c/Insurgent2.png/800px-Insurgent2.png'),
	(618, 'Kalahari', 'kalahari', 20000, 'offroads', 'https://wiki.rage.mp/images/thumb/5/55/Kalahari.png/800px-Kalahari.png'),
	(619, 'Kamacho', 'kamacho', 50000, 'offroads', 'https://wiki.rage.mp/images/thumb/d/d0/Kamacho.png/800px-Kamacho.png'),
	(620, 'Marshall', 'marshall', 210000, 'offroads', 'https://wiki.rage.mp/images/thumb/7/71/Marshall.png/800px-Marshall.png'),
	(621, 'Mesa Trail', 'mesa3', 50000, 'offroads', 'https://wiki.rage.mp/images/thumb/c/c6/Mesa3.png/800px-Mesa3.png'),
	(622, 'Liberator', 'monster', 210000, 'offroads', 'https://wiki.rage.mp/images/thumb/1/13/Monster.png/800px-Monster.png'),
	(623, 'Outlaw', 'outlaw', 15000, 'offroads', 'https://wiki.rage.mp/images/thumb/f/f0/Outlaw.png/800px-Outlaw.png'),
	(624, 'Rancher XL', 'rancherxl', 25000, 'offroads', 'https://wiki.rage.mp/images/thumb/e/ef/Rancherxl.png/800px-Rancherxl.png'),
	(625, 'Rusty Rebel', 'rebel', 15000, 'offroads', 'https://wiki.rage.mp/images/thumb/e/e3/Rebel.png/800px-Rebel.png'),
	(626, 'Rebel', 'rebel2', 25000, 'offroads', 'https://wiki.rage.mp/images/thumb/9/90/Rebel2.png/800px-Rebel2.png'),
	(627, 'Riata', 'riata', 50000, 'offroads', 'https://wiki.rage.mp/images/thumb/4/4d/Riata.png/800px-Riata.png'),
	(628, 'Sadler', 'sadler', 25000, 'offroads', 'https://wiki.rage.mp/images/thumb/3/37/Sadler.png/800px-Sadler.png'),
	(629, 'Sandking XL', 'sandking', 50000, 'offroads', 'https://wiki.rage.mp/images/thumb/6/64/Sandking.png/800px-Sandking.png'),
	(630, 'Sandking SWB', 'sandking2', 50000, 'offroads', 'https://wiki.rage.mp/images/thumb/d/d1/Sandking2.png/800px-Sandking2.png'),
	(631, 'Squaddie', 'squaddie', 75000, 'offroads', 'https://wiki.rage.mp/images/thumb/d/d6/0xF9E67C05.png/800px-0xF9E67C05.png'),
	(632, 'Trophy Truck', 'trophytruck', 75000, 'offroads', 'https://wiki.rage.mp/images/thumb/1/18/Trophytruck.png/800px-Trophytruck.png'),
	(633, 'Desert Raid', 'trophytruck2', 75000, 'offroads', 'https://wiki.rage.mp/images/thumb/8/85/Trophytruck2.png/800px-Trophytruck2.png'),
	(634, 'Vagrant', 'vagrant', 25000, 'offroads', 'https://wiki.rage.mp/images/thumb/8/87/Vagrant.png/800px-Vagrant.png'),
	(635, 'Verus', 'verus', 10000, 'offroads', 'https://wiki.rage.mp/images/thumb/1/10/0x11CBC051.png/780px-0x11CBC051.png'),
	(636, 'Vetir', 'vetir', 75000, 'offroads', 'https://wiki.rage.mp/images/thumb/1/11/0x780FFBD2.png/800px-0x780FFBD2.png'),
	(637, 'Winky', 'winky', 25000, 'offroads', 'https://wiki.rage.mp/images/thumb/b/b2/0xF376F1E6.png/800px-0xF376F1E6.png'),
	(638, 'Yosemite Rancher', 'yosemite3', 25000, 'offroads', 'https://wiki.rage.mp/images/thumb/8/87/Yosemite3.png/800px-Yosemite3.png'),
	(639, 'Zhaba', 'zhaba', 75000, 'offroads', 'https://wiki.rage.mp/images/thumb/a/a2/Zhaba.png/738px-Zhaba.png'),
	(650, 'Burrito', 'burrito3', 20000, 'vans', 'https://wiki.rage.mp/images/8/89/Burrito3.png'),
	(651, 'Camper', 'camper', 25000, 'vans', 'https://wiki.rage.mp/images/b/bd/Camper.png'),
	(652, 'Gang Burrito', 'gburrito', 20000, 'vans', 'https://wiki.rage.mp/images/b/b0/GBurrito.png'),
	(653, 'Gang Burrito 2', 'gburrito2', 20000, 'vans', 'https://wiki.rage.mp/images/f/ff/GBurrito2.png'),
	(654, 'Journey', 'journey', 10000, 'vans', 'https://wiki.rage.mp/images/0/0c/Journey.png'),
	(655, 'Minivan', 'minivan', 15000, 'vans', 'https://wiki.rage.mp/images/1/12/Minivan.png'),
	(656, 'Minivan Custom', 'minivan2', 20000, 'vans', 'https://wiki.rage.mp/images/2/21/Minivan2.png'),
	(657, 'Paradise', 'paradise', 20000, 'vans', 'https://wiki.rage.mp/images/b/b3/Paradise.png'),
	(658, 'Rumpo Trail', 'rumpo3', 25000, 'vans', 'https://wiki.rage.mp/images/7/7a/Rumpo3.png'),
	(659, 'Speedo', 'speedo', 20000, 'vans', 'https://wiki.rage.mp/images/2/2b/Speedo.png'),
	(660, 'Surfer', 'surfer', 20000, 'vans', 'https://wiki.rage.mp/images/d/d7/Surfer.png'),
	(661, 'Surfer 2', 'surfer2', 10000, 'vans', 'https://wiki.rage.mp/images/d/d5/Surfer2.png'),
	(662, 'Youga', 'youga', 20000, 'vans', 'https://wiki.rage.mp/images/d/d5/Youga.png'),
	(663, 'Youga Classic', 'youga2', 20000, 'vans', 'https://wiki.rage.mp/images/thumb/e/e6/Youga2.png/800px-Youga2.png'),
	(664, 'Youga Classic 4x4', 'youga3', 25000, 'vans', 'https://wiki.rage.mp/images/thumb/0/00/Youga3.png/800px-Youga3.png'),
	(685, 'BMX', 'bmx', 150, 'cycles', 'https://wiki.rage.mp/images/thumb/4/40/Bmx.png/800px-Bmx.png'),
	(686, 'Cruiser', 'cruiser', 200, 'cycles', 'https://wiki.rage.mp/images/thumb/6/66/Cruiser.png/800px-Cruiser.png'),
	(687, 'Fixter', 'fixter', 200, 'cycles', 'https://wiki.rage.mp/images/thumb/2/29/Fixter.png/800px-Fixter.png'),
	(688, 'Scorcher', 'scorcher', 350, 'cycles', 'https://wiki.rage.mp/images/thumb/3/34/Scorcher.png/800px-Scorcher.png'),
	(689, 'Race bike Whippet', 'tribike', 500, 'cycles', 'https://wiki.rage.mp/images/thumb/f/fe/TriBike.png/800px-TriBike.png'),
	(690, 'Race bike Endurex', 'tribike2', 500, 'cycles', 'https://wiki.rage.mp/images/thumb/d/dc/TriBike2.png/800px-TriBike2.png'),
	(691, 'Race bike Tri-Cycles', 'tribike3', 500, 'cycles', 'https://wiki.rage.mp/images/thumb/5/5d/TriBike3.png/800px-TriBike3.png')
;

CREATE TABLE `vs_truck_categories` (
	`id` int(11) UNIQUE NOT NULL AUTO_INCREMENT,
	`name` varchar(60) NOT NULL,
	`label` varchar(60) NOT NULL,

	PRIMARY KEY (`name`)
);

INSERT INTO `vs_truck_categories` (id, name, label) VALUES
	(1, 'haul', 'Haulers'),
	(2, 'box', 'Boxed Trucks'),
	(3, 'trans', 'Transport Trucks'),
	(4, 'other', 'Other Trucks')
;

CREATE TABLE `vs_trucks` (
	`id` int(11) UNIQUE NOT NULL AUTO_INCREMENT,
	`name` varchar(60) NOT NULL,
	`model` varchar(60) NOT NULL,
	`price` int(11) NOT NULL,
	`category` varchar(60) DEFAULT NULL,
	`image` text DEFAULT NULL,

	PRIMARY KEY (`model`)
);

INSERT INTO `vs_trucks` (id, name, model, price, category, image) VALUES
	(1, 'Hauler', 'hauler', 100000, 'haul', 'https://wiki.rage.mp/images/thumb/8/83/Hauler.png/800px-Hauler.png'),
	(2, 'Packer', 'packer', 100000, 'haul', 'https://wiki.rage.mp/images/thumb/0/03/Packer.png/800px-Packer.png'),
	(3, 'Phantom', 'phantom', 105000, 'haul', 'https://wiki.rage.mp/images/thumb/e/ec/Phantom.png/800px-Phantom.png'),
	(4, 'Phantom Custom', 'phantom3', 110000, 'haul', 'https://wiki.rage.mp/images/thumb/8/81/Phantom3.png/800px-Phantom3.png'),
	(10, 'Benson', 'benson', 55000, 'box', 'https://wiki.rage.mp/images/thumb/b/bd/Benson.png/800px-Benson.png'),
	(11, 'Boxville 1', 'boxville', 45000, 'box', 'https://wiki.rage.mp/images/0/09/Boxville.png'),
	(12, 'Boxville 2', 'boxville2', 45000, 'box', 'https://wiki.rage.mp/images/f/fe/Boxville2.png'),
	(13, 'Boxville 3', 'boxville3', 45000, 'box', 'https://wiki.rage.mp/images/5/5c/Boxville3.png'),
	(14, 'Boxville 4', 'boxville4', 45000, 'box', 'https://wiki.rage.mp/images/2/29/Boxville4.png'),
	(15, 'Mule 1', 'mule', 40000, 'box', 'https://wiki.rage.mp/images/thumb/e/e7/Mule.png/800px-Mule.png'),
	(16, 'Mule 2', 'mule2', 40000, 'box', 'https://wiki.rage.mp/images/thumb/8/82/Mule2.png/800px-Mule2.png'),
	(17, 'Mule 3', 'mule3', 40000, 'box', 'https://wiki.rage.mp/images/thumb/6/6a/Mule3.png/800px-Mule3.png'),
	(18, 'Pounder', 'pounder', 55000, 'box', 'https://wiki.rage.mp/images/thumb/a/a6/Pounder.png/800px-Pounder.png'),
	(20, 'Airport Bus', 'airbus', 50000, 'trans', 'https://wiki.rage.mp/images/thumb/3/32/Airbus.png/800px-Airbus.png'),
	(21, 'Bus', 'bus', 50000, 'trans', 'https://wiki.rage.mp/images/thumb/4/43/Bus.png/800px-Bus.png'),
	(22, 'Dashound', 'coach', 50000, 'trans', 'https://wiki.rage.mp/images/thumb/9/9d/Coach.png/800px-Coach.png'),
	(23, 'Festival Bus', 'pbus2', 75000, 'trans', 'https://wiki.rage.mp/images/f/f4/Pbus2.png'),
	(24, 'Rental Bus', 'rentalbus', 35000, 'trans', 'https://wiki.rage.mp/images/thumb/4/48/Rentalbus.png/800px-Rentalbus.png'),
	(25, 'Tour Bus', 'tourbus', 35000, 'trans', 'https://wiki.rage.mp/images/thumb/a/ac/Tourbus.png/800px-Tourbus.png'),
	(30, 'Biff', 'biff', 30000, 'other', 'https://wiki.rage.mp/images/thumb/6/62/Biff.png/800px-Biff.png'),
	(31, 'Dozer', 'bulldozer', 20000, 'other', 'https://wiki.rage.mp/images/thumb/f/f5/Bulldozer.png/800px-Bulldozer.png'),
	(32, 'Forklift', 'forklift', 5000, 'other', 'https://wiki.rage.mp/images/thumb/a/ab/Forklift.png/800px-Forklift.png'),
	(33, 'Field Master', 'tractor2', 15000, 'other', 'https://wiki.rage.mp/images/thumb/c/c8/Tractor2.png/800px-Tractor2.png'),
	(34, 'Lawn Mower', 'mower', 1500, 'other', 'https://wiki.rage.mp/images/thumb/a/a5/Mower.png/800px-Mower.png'),
	(35, 'Mixer 1', 'mixer', 30000, 'other', 'https://wiki.rage.mp/images/thumb/4/4d/Mixer.png/800px-Mixer.png'),
	(36, 'Mixer 2', 'mixer2', 30000, 'other', 'https://wiki.rage.mp/images/thumb/e/e7/Mixer2.png/800px-Mixer2.png'),
	(37, 'Rubble', 'rubble', 30000, 'other', 'https://wiki.rage.mp/images/thumb/1/14/Rubble.png/800px-Rubble.png'),
	(38, 'Scrap Truck', 'scrap', 10000, 'other', 'https://wiki.rage.mp/images/thumb/b/b8/Scrap.png/800px-Scrap.png'),
	(39, 'Slamtruck', 'slamtruck', 20000, 'other', 'https://wiki.rage.mp/images/thumb/2/22/0xC1A8A914.png/800px-0xC1A8A914.png'),
	(40, 'Tipper 1', 'tiptruck', 30000, 'other', 'https://wiki.rage.mp/images/thumb/2/2e/TipTruck.png/800px-TipTruck.png'),
	(41, 'Tipper 2', 'tiptruck2', 30000, 'other', 'https://wiki.rage.mp/images/thumb/c/c9/TipTruck2.png/800px-TipTruck2.png')
;

CREATE TABLE `vs_vip_categories` (
	`id` int(11) UNIQUE NOT NULL AUTO_INCREMENT,
	`name` varchar(60) NOT NULL,
	`label` varchar(60) NOT NULL,

	PRIMARY KEY (`name`)
);

INSERT INTO `vs_vip_categories` (id, name, label) VALUES
	(1, 'motorcycles', 'Motos')
;

CREATE TABLE `vs_vips` (
	`id` int(11) UNIQUE NOT NULL AUTO_INCREMENT,
	`name` varchar(60) NOT NULL,
	`model` varchar(60) NOT NULL,
	`price` int(11) NOT NULL,
	`category` varchar(60) DEFAULT NULL,
	`image` text DEFAULT NULL,

	PRIMARY KEY (`model`)
);

INSERT INTO `vs_vips` (id, name, model, price, category, image) VALUES
	(1, 'Shotaro', 'shotaro', 30000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/e/e3/Shotaro.png/800px-Shotaro.png')
;

CREATE TABLE `vs_vipboat_categories` (
	`id` int(11) UNIQUE NOT NULL AUTO_INCREMENT,
	`name` varchar(60) NOT NULL,
	`label` varchar(60) NOT NULL,

	PRIMARY KEY (`name`)
);

INSERT INTO `vs_vipboat_categories` (id, name, label) VALUES
	(1, 'boats', 'Boats')
;

CREATE TABLE `vs_vipboats` (
	`id` int(11) UNIQUE NOT NULL AUTO_INCREMENT,
	`name` varchar(60) NOT NULL,
	`model` varchar(60) NOT NULL,
	`price` int(11) NOT NULL,
	`category` varchar(60) DEFAULT NULL,
	`image` text DEFAULT NULL,

	PRIMARY KEY (`model`)
);

INSERT INTO `vs_vipboats` (id, name, model, price, category, image) VALUES
	(1, 'Tropic Yacht', 'tropic2', 27000, 'boats', 'https://wiki.rage.mp/images/thumb/a/a7/Tropic2.png/800px-Tropic2.png')
;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
