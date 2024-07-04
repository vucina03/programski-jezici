-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.32-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.7.0.6850
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for kosarkadb
CREATE DATABASE IF NOT EXISTS `kosarkadb` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `kosarkadb`;

-- Dumping structure for table kosarkadb.igraci
CREATE TABLE IF NOT EXISTS `igraci` (
  `igrac_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tim_id` int(10) unsigned NOT NULL,
  `ime` varchar(50) NOT NULL DEFAULT '',
  `prezime` varchar(50) NOT NULL DEFAULT '',
  `broj_dresa` int(10) unsigned NOT NULL,
  `pozicija` int(10) unsigned NOT NULL,
  PRIMARY KEY (`igrac_id`),
  KEY `fk_igraci_tim_id` (`tim_id`),
  CONSTRAINT `fk_igraci_tim_id` FOREIGN KEY (`tim_id`) REFERENCES `timovi` (`tim_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table kosarkadb.igraci: ~5 rows (approximately)
INSERT INTO `igraci` (`igrac_id`, `tim_id`, `ime`, `prezime`, `broj_dresa`, `pozicija`) VALUES
	(1, 1, 'Vanja', 'Marinkovic', 9, 2),
	(2, 1, 'Jaleen', 'Smith', 0, 1),
	(3, 1, 'Sterling', 'Brown', 7, 3),
	(4, 1, 'Chima', 'Moneke', 8, 4),
	(5, 1, 'Tiryque', 'Jones', 4, 5);

-- Dumping structure for table kosarkadb.timovi
CREATE TABLE IF NOT EXISTS `timovi` (
  `tim_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `naziv` varchar(50) NOT NULL,
  `trener` varchar(50) NOT NULL,
  `grad` varchar(50) NOT NULL,
  PRIMARY KEY (`tim_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table kosarkadb.timovi: ~4 rows (approximately)
INSERT INTO `timovi` (`tim_id`, `naziv`, `trener`, `grad`) VALUES
	(1, 'Partizan', 'Zeljko Obradovic', 'Beograd'),
	(2, 'Panathinaikos', 'Ergin Ataman', 'Atina'),
	(3, 'Crvena zvezda', 'Janis Sferopulos', 'Beograd'),
	(4, 'Bayern Munchen', 'Pablo Laso', 'Minhen');

-- Dumping structure for table kosarkadb.utakmice
CREATE TABLE IF NOT EXISTS `utakmice` (
  `utakmica_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domacin_id` int(11) unsigned NOT NULL,
  `gost_id` int(11) unsigned NOT NULL,
  `datum` datetime NOT NULL,
  `rezultat_domacin` int(11) unsigned NOT NULL,
  `rezultat_gost` int(11) unsigned NOT NULL,
  PRIMARY KEY (`utakmica_id`),
  KEY `fk_utakmice_domacin_id` (`domacin_id`),
  KEY `fk_utakmice_gost_id` (`gost_id`),
  CONSTRAINT `fk_utakmice_domacin_id` FOREIGN KEY (`domacin_id`) REFERENCES `timovi` (`tim_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_utakmice_gost_id` FOREIGN KEY (`gost_id`) REFERENCES `timovi` (`tim_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table kosarkadb.utakmice: ~0 rows (approximately)
INSERT INTO `utakmice` (`utakmica_id`, `domacin_id`, `gost_id`, `datum`, `rezultat_domacin`, `rezultat_gost`) VALUES
	(1, 1, 3, '2024-07-02 20:30:00', 85, 78);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
