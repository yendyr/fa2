-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 28, 2020 at 02:23 PM
-- Server version: 8.0.19
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fa2`
--

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE `areas` (
  `area_code` int NOT NULL,
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `areas`
--

INSERT INTO `areas` (`area_code`, `description`, `inactive`) VALUES
(1, 'Global', 0);

-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

CREATE TABLE `attachments` (
  `id` int UNSIGNED NOT NULL,
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type_no` int NOT NULL DEFAULT '0',
  `trans_no` int NOT NULL DEFAULT '0',
  `unique_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tran_date` date NOT NULL DEFAULT '0000-00-00',
  `filename` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `filesize` int NOT NULL DEFAULT '0',
  `filetype` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `audit_trail`
--

CREATE TABLE `audit_trail` (
  `id` int NOT NULL,
  `type` smallint UNSIGNED NOT NULL DEFAULT '0',
  `trans_no` int UNSIGNED NOT NULL DEFAULT '0',
  `user` smallint UNSIGNED NOT NULL DEFAULT '0',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fiscal_year` int NOT NULL DEFAULT '0',
  `gl_date` date NOT NULL DEFAULT '0000-00-00',
  `gl_seq` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `account_code` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `account_type` smallint NOT NULL DEFAULT '0',
  `bank_account_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `bank_account_number` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `bank_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `bank_address` tinytext COLLATE utf8_unicode_ci,
  `bank_curr_code` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dflt_curr_act` tinyint(1) NOT NULL DEFAULT '0',
  `id` smallint NOT NULL,
  `bank_charge_act` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `last_reconciled_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ending_reconcile_balance` double NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `bank_accounts`
--

INSERT INTO `bank_accounts` (`account_code`, `account_type`, `bank_account_name`, `bank_account_number`, `bank_name`, `bank_address`, `bank_curr_code`, `dflt_curr_act`, `id`, `bank_charge_act`, `last_reconciled_date`, `ending_reconcile_balance`, `inactive`) VALUES
('11111110', 3, 'Kas Kantor', '', '', NULL, 'IDR', 1, 3, '70021170', '0000-00-00 00:00:00', 0, 0),
('11111120', 3, 'Kas Gudang', '', '', NULL, 'IDR', 0, 4, '70021170', '0000-00-00 00:00:00', 0, 0),
('11111121', 3, 'Kas Bon', '', '', NULL, 'IDR', 0, 5, '70021170', '0000-00-00 00:00:00', 0, 0),
('11111210', 3, 'Kas USD', '', '', NULL, 'USD', 0, 6, '70021170', '0000-00-00 00:00:00', 0, 0),
('11111220', 3, 'Kas EUR', '', '', NULL, 'EUR', 0, 7, '70021170', '0000-00-00 00:00:00', 0, 0),
('11113110', 0, 'Deposito IDR - Satu Bulan', '', '', NULL, 'IDR', 0, 8, '70021170', '0000-00-00 00:00:00', 0, 0),
('11113120', 0, 'Deposito IDR - s/d 3 Bulan', '', '', NULL, 'IDR', 0, 9, '70021170', '0000-00-00 00:00:00', 0, 0),
('11113210', 0, 'Deposito USD - Satu Bulan', '', '', NULL, 'USD', 0, 10, '70021170', '0000-00-00 00:00:00', 0, 0),
('11113220', 0, 'Deposito USD - s/d Tiga Bulan', '', '', NULL, 'USD', 0, 11, '70021170', '0000-00-00 00:00:00', 0, 0),
('11121100', 0, 'Deposito diatas 3 bulan s/d satu tahun', '', '', NULL, 'IDR', 0, 12, '70021170', '0000-00-00 00:00:00', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `bank_trans`
--

CREATE TABLE `bank_trans` (
  `id` int NOT NULL,
  `type` smallint DEFAULT NULL,
  `trans_no` int DEFAULT NULL,
  `bank_act` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ref` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `trans_date` date NOT NULL DEFAULT '0000-00-00',
  `amount` double DEFAULT NULL,
  `dimension_id` int NOT NULL DEFAULT '0',
  `dimension2_id` int NOT NULL DEFAULT '0',
  `person_type_id` int NOT NULL DEFAULT '0',
  `person_id` tinyblob,
  `reconciled` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bom`
--

CREATE TABLE `bom` (
  `id` int NOT NULL,
  `parent` char(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `component` char(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `workcentre_added` int NOT NULL DEFAULT '0',
  `loc_code` char(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `quantity` double NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `budget_trans`
--

CREATE TABLE `budget_trans` (
  `id` int NOT NULL,
  `tran_date` date NOT NULL DEFAULT '0000-00-00',
  `account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `amount` double NOT NULL DEFAULT '0',
  `dimension_id` int DEFAULT '0',
  `dimension2_id` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chart_class`
--

CREATE TABLE `chart_class` (
  `cid` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `class_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ctype` tinyint(1) NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `chart_class`
--

INSERT INTO `chart_class` (`cid`, `class_name`, `ctype`, `inactive`) VALUES
('1', 'AKTIVA', 1, 0),
('2', 'HUTANG', 2, 0),
('3', 'MODAL &amp; LABA DITAHAN', 3, 0),
('4', 'PENDAPATAN', 4, 0),
('5', 'HARGA POKOK PENJUALAN', 5, 0),
('6', 'BIAYA', 6, 0),
('7', 'PENDAPATAN DAN BIAYA LAINNYA', 6, 0);

-- --------------------------------------------------------

--
-- Table structure for table `chart_master`
--

CREATE TABLE `chart_master` (
  `account_code` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `account_code2` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `account_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `account_type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `chart_master`
--

INSERT INTO `chart_master` (`account_code`, `account_code2`, `account_name`, `account_type`, `inactive`) VALUES
('11111110', '', 'Kas Kantor', '11111100', 0),
('11111120', '', 'Kas Gudang', '11111100', 0),
('11111121', '', 'Kas BON', '11111100', 0),
('11111210', '', 'Kas USD', '11111200', 0),
('11111220', '', 'Kas EUR', '11111200', 0),
('11111990', '', 'Pos Silang Kas', '11110000', 0),
('11112111', '', 'Bank IDR - 1 - Asset', '11112110', 0),
('11112112', '', 'Bank IDR - 1 - Dalam Transit', '11112110', 0),
('11112211', '', 'Bank Valas - 1 - Asset', '11112210', 0),
('11112212', '', 'Bank Valas - 1 - Dalam Transit', '11112210', 0),
('11113110', '', 'Deposito (IDR) - Satu Bulan', '11113100', 0),
('11113120', '', 'Deposito (IDR) - s/d Tiga Bulan', '11113100', 0),
('11113210', '', 'Deposito (USD) - Satu Bulan', '11113200', 0),
('11113220', '', 'Deposito (USD) - s/d Tiga Bulan', '11113200', 0),
('11119010', '', 'Penerimaan Belum Dialokasi BANK IDR - 1', '11119000', 0),
('11119020', '', 'Penerimaan Belum Dialokasi BANK Valas - 1', '11119000', 0),
('11119030', '', 'Penerimaan Tidak Dikenal', '11119000', 0),
('11121100', '', 'Deposito diatas 3 bulan  s/d satu tahun.', '11121000', 0),
('11122100', '', 'Surat berharga s/d satu tahun', '11122000', 0),
('11131110', '', 'Piutang Penjualan Barang', '11131100', 0),
('11131120', '', 'Piutang Penjualan Jasa', '11131100', 0),
('11131130', '', 'Piutang Belum Difaktur', '11131100', 0),
('11139110', '', 'Cadangan Piutang Tak Tertagih - Penjualan Barang', '11139100', 0),
('11139120', '', 'Cadangan Piutang Tak Tertagih - Penjualan Jasa', '11139100', 0),
('11149100', '', 'Piutang Intercompany', '11149000', 0),
('11149200', '', 'Piutang Affiliasi', '11149000', 0),
('11149300', '', 'Piutang Direksi', '11149000', 0),
('11149400', '', 'Piutang Karyawan Lainnya', '11149000', 0),
('11149900', '', 'Piutang Lain-Lain', '11149000', 0),
('11151100', '', 'Persediaan Barang Dagangan', '11151000', 0),
('11151200', '', 'Persediaan Gudang', '11151000', 0),
('11151300', '', 'Persediaan Dalam Transit', '11151000', 0),
('11152100', '', 'Asset Proyek', '11152000', 0),
('11152200', '', 'Asset Proyek WIP', '11152000', 0),
('11161010', '', 'Uang Muka Pembelian', '11161000', 0),
('11163010', '', 'Uang Muka Jaminan Penjualan', '11163000', 0),
('11163900', '', 'Uang Muka Jaminan Lain-Lain', '11163000', 0),
('11169010', '', 'Uang Muka Karyawan', '11169000', 0),
('11171010', '', 'Asuransi Dibayar Di Muka', '11171000', 0),
('11171020', '', 'Sewa Dibayar Di Muka', '11171000', 0),
('11171030', '', 'Bunga Dibayar Di Muka', '11171000', 0),
('11171900', '', 'Biaya Dibayar Di Muka Lainnya', '11171000', 0),
('11172010', '', 'PPN Masukan Dibayar Dimuka', '11172000', 0),
('11172020', '', 'PPN Masukan Yang Ditangguhkan', '11172000', 0),
('11172030', '', 'PPh - psl 22 Dibayar Dimuka', '11172000', 0),
('11172040', '', 'PPh - psl 23 Dibayar Dimuka', '11172000', 0),
('11172050', '', 'PPh - psl 25 Dibayar Dimuka', '11172000', 0),
('11172060', '', 'PPh - psl 29 Dibayar Dimuka', '11172000', 0),
('11172090', '', 'Fiskal Luar Negeri', '11172000', 0),
('11180010', '', 'Biaya Notul Yang Ditangguhkan', '11180000', 0),
('11180030', '', 'Biaya Yang Ditangguhkan Lainnya', '11180000', 0),
('11190010', '', 'Sewa Yang Masih Harus Diterima', '11190000', 0),
('11190900', '', 'Pendapatan Yang Masih Harus Diterima Lainnya', '11190000', 0),
('12101100', '', 'Aktiva Pajak Tangguhan', '12100000', 0),
('12201110', '', 'Deposito (IDR) - Satu Tahun', '12201100', 0),
('12201120', '', 'Deposito (IDR) - Dua Tahun', '12201100', 0),
('12201210', '', 'Deposito (USD) - Satu Tahun', '12201200', 0),
('12201220', '', 'Deposito (USD) - Dua Tahun', '12201200', 0),
('12202110', '', 'Penyertaan Saham', '12202000', 0),
('12311101', '', 'Tanah - Perl Langsung', '12311100', 0),
('12311102', '', 'Bangunan - Perl Langsung', '12311100', 0),
('12311103', '', 'Mesin dan Peralatan - Perl Langsung', '12311100', 0),
('12311104', '', 'Kendaraan - Perl Langsung', '12311100', 0),
('12311105', '', 'Inventaris Kantor - Perl Langsung', '12311100', 0),
('12311106', '', 'Instalasi &amp; Renovasi', '12311100', 0),
('12311201', '', 'Akm. Penys Bangunan - Perl Langsung', '12311200', 0),
('12311202', '', 'Akm. Penys Mesin - Perl Langsung', '12311200', 0),
('12311203', '', 'Akm. Penys Kendaraan - Perl Langsung', '12311200', 0),
('12311204', '', 'Akm. Penys Inventaris - Perl Langsung', '12311200', 0),
('12311205', '', 'Akm. Penys Instalasi &amp; Renovasi', '12311200', 0),
('12312101', '', 'Bangunan - Aktiva Leasing', '12312100', 0),
('12312102', '', 'Mesin dan Peralatan - Aktiva Leasing', '12312100', 0),
('12312103', '', 'Kendaraan - Aktiva Leasing', '12312100', 0),
('12312104', '', 'Inventaris Kantor - Aktiva Leasing', '12312100', 0),
('12312201', '', 'Akm Penys Bangunan - Aktiva Leasing', '12312200', 0),
('12312202', '', 'Akm Penys Mesin dan Peralatan - Aktiva Leasing', '12312200', 0),
('12312203', '', 'Akm Penys Kendaraan - Aktiva Leasing', '12312200', 0),
('12312204', '', 'Akm Penys Inventaris Kantor - Aktiva Leasing', '12312200', 0),
('12313101', '', 'Renovasi Sewa Bangunan Kantor Electric', '12313000', 0),
('12313102', '', 'Bangunan Gudang Dalam Penyelesaian', '12313000', 0),
('12313103', '', 'Sarana &amp; Prasarana Kantor - Dalam Penyelesaian', '12313000', 0),
('12314101', '', 'Tanah - Properti Invenstasi', '12314100', 0),
('12314102', '', 'Bangunan - Properti Invenstasi', '12314100', 0),
('12314103', '', 'Mesin dan Peralatan - Properti Invenstasi', '12314100', 0),
('12314104', '', 'Kendaraan - Properti Invenstasi', '12314100', 0),
('12314105', '', 'Inventaris Kantor - Properti Invenstasi', '12314100', 0),
('12314201', '', 'Akm. Penys Bangunan - Properti Invenstasi', '12314200', 0),
('12314202', '', 'Akm. Penys Mesin dan Peralatan - Properti Invenstasi', '12314200', 0),
('12314203', '', 'Akm. Penys Kendaraan - Properti Invenstasi', '12314200', 0),
('12314204', '', 'Akm. Penys Inventaris - Properti Invenstasi', '12314200', 0),
('12321100', '', 'HAKI', '12321000', 0),
('12321200', '', 'Goodwill', '12321000', 0),
('12901000', '', 'Akta Pendirian &amp; Perizinan', '12900000', 0),
('12902000', '', 'Hak Atas Tanah', '12900000', 0),
('21101010', '', 'Hutang Bank Jangka Pendek', '21101000', 0),
('21102110', '', 'Hutang Dagang', '21102100', 0),
('21102120', '', 'Hutang Jasa', '21102100', 0),
('21102130', '', 'Terima Barang Belum Difaktur', '21102100', 0),
('21102140', '', 'Seleksi Pembayaran', '21102100', 0),
('21103010', '', 'Gaji Yang Masih Harus Dibayar', '21103000', 0),
('21103020', '', 'Komisi Penjualan Yang Masih Harus Dibayar', '21103000', 0),
('21103030', '', 'Bunga Bank Yang Masih Harus Dibayar', '21103000', 0),
('21103040', '', 'Telepon Yang Masih Harus Dibayar', '21103000', 0),
('21103050', '', 'Listrik &amp; Air Yang Masih Harus Dibayar', '21103000', 0),
('21103060', '', 'Asuransi Yang Masih Harus Dibayar', '21103000', 0),
('21103070', '', 'Biaya Impor Yang Masih Harus Dibayar', '21103000', 0),
('21103900', '', 'Biaya Yang Masih harus Dibayar Lainnya', '21103000', 0),
('21104110', '', 'PPN Keluaran', '21104100', 0),
('21104120', '', 'PPN Keluaran Yang Ditangguhkan', '21104100', 0),
('21104190', '', 'WithHolding (Tax)', '21104100', 0),
('21104210', '', 'Hutang PPh psl 21', '21104200', 0),
('21104220', '', 'Hutang PPh psl 23', '21104200', 0),
('21104230', '', 'Hutang PPh psl 25', '21104200', 0),
('21104240', '', 'Hutang PPh psl 26', '21104200', 0),
('21104250', '', 'Hutang PPh psl 29', '21104200', 0),
('21104260', '', 'Hutang PPh Final psl 4 ayat 2', '21104200', 0),
('21105010', '', 'Uang Muka Penjualan', '21105000', 0),
('21105020', '', 'Sewa Diterima Di Muka', '21105000', 0),
('21105030', '', 'Pendapatan Diterima Di Muka Lainnya', '21105000', 0),
('21106100', '', 'Hutang Intercompany', '21106000', 0),
('21106200', '', 'Hutang Affiliasi', '21106000', 0),
('21106300', '', 'Hutang Direksi', '21106000', 0),
('21106900', '', 'Hutang Jangka Pendek Lain-Lain', '21106000', 0),
('21107010', '', 'Hutang Bank Jangka Panjang-Current', '21107000', 0),
('21107020', '', 'Hutang Leasing', '21107000', 0),
('21107030', '', 'Hutang Jgk Pnj yg akan Jt Tempo 1 th Lainnya', '21107000', 0),
('22001000', '', 'Kewajiban Pajak Tangguhan', '22000000', 0),
('22002000', '', 'Kewajiban diestimasi atas Imbalan Kerja', '22000000', 0),
('22003000', '', 'Hutang Bank Jangka Panjang', '22000000', 0),
('22004000', '', 'Hutang Leasing', '22000000', 0),
('22005000', '', 'Hutang Jangka Panjang Lain-Lain', '22000000', 0),
('31011010', '', 'Modal Disetor - Direksi 1', '31011000', 0),
('31011020', '', 'Modal Disetor - Direksi 2', '31011000', 0),
('32021010', '', 'Agio / Disagio - Direksi 1', '32021000', 0),
('32021020', '', 'Agio / Disagio - Direksi 2', '32021000', 0),
('33031010', '', 'Tanah - Penilaian Kembali', '33031000', 0),
('33031020', '', 'Bangunan - Penilaian Kembali', '33031000', 0),
('33031030', '', 'Mesin dan Peralatan - Penilaian Kembali', '33031000', 0),
('33031040', '', 'Kendaraan - Penilaian Kembali', '33031000', 0),
('33031050', '', 'Inventaris Kantor - Penilaian Kembali', '33031000', 0),
('34041010', '', 'Deviden - Direksi 1', '34041000', 0),
('34041020', '', 'Deviden - Direksi 2', '34041000', 0),
('35051010', '', 'Laba / (Rugi) Ditahan', '35051000', 0),
('35051020', '', 'Laba / (Rugi) Berjalan', '35051000', 0),
('41001000', '', 'Penjualan Barang Usaha', '41000000', 0),
('41002000', '', 'Penjualan Jasa Service', '41000000', 0),
('41003000', '', 'Pendapatan Belum Difaktur', '41000000', 0),
('41004000', '', 'Komisi Penjualan', '41000000', 0),
('42001000', '', 'Diskon Penjualan', '42000000', 0),
('44001000', '', 'Retur Penjualan', '44000000', 0),
('51010000', '', 'HPP Produk', '50000000', 0),
('51020000', '', 'Pembelian Jasa', '50000000', 0),
('51030000', '', 'Penyesuaian HPP', '50000000', 0),
('51040000', '', 'Diskon Pembelian', '50000000', 0),
('51050000', '', 'Selisih Persediaan', '50000000', 0),
('51060000', '', 'Penyesuaian Persediaan', '50000000', 0),
('51070000', '', 'Revaluasi Persediaan', '50000000', 0),
('59010000', '', 'Varian Harga Faktur', '59000000', 0),
('59020000', '', 'Varian Harga Beli', '59000000', 0),
('59030000', '', 'Varian Harga Beli Offset', '59000000', 0),
('61101110', '', 'Biaya Gaji Bulanan', '61100000', 0),
('61101120', '', 'Biaya Upah Harian', '61100000', 0),
('61101130', '', 'Biaya Transport Karyawan', '61100000', 0),
('61101140', '', 'Biaya Uang Makan Karyawan', '61100000', 0),
('61101150', '', 'Biaya Pengobatan', '61100000', 0),
('61101160', '', 'Biaya Lembur', '61100000', 0),
('61101170', '', 'Biaya Asuransi / JAMSOSTEK', '61100000', 0),
('61101180', '', 'Biaya THR Karyawan', '61100000', 0),
('61101190', '', 'Biaya Bonus Karyawan', '61100000', 0),
('61101200', '', 'Biaya Tunjangan PPH 21', '61100000', 0),
('61101210', '', 'Biaya Recruitment &amp; Training', '61100000', 0),
('61101900', '', 'Biaya Karyawan Lainnya', '61100000', 0),
('61201110', '', 'Biaya Iklan &amp; Promosi', '61200000', 0),
('61201120', '', 'Biaya Komisi Penjualan Sales', '61200000', 0),
('61201130', '', 'Biaya Komisi Penjualan Customer', '61200000', 0),
('61201140', '', 'Biaya Isentif Penjualan Sales', '61200000', 0),
('61201150', '', 'Biaya Bonus Penjualan Sales', '61200000', 0),
('61201160', '', 'Biaya Entertainment', '61200000', 0),
('61201170', '', 'Biaya Disain', '61200000', 0),
('61201180', '', 'Biaya Sample', '61200000', 0),
('61201190', '', 'Biaya Trucking/Ekspedisi', '61200000', 0),
('61201900', '', 'Biaya Marketing Lain-lain', '61200000', 0),
('61301110', '', 'Biaya Perbaikan &amp; Perawatan Gedung', '61300000', 0),
('61301120', '', 'Biaya Perbaikan &amp; Perawatan Kendaraan', '61300000', 0),
('61301130', '', 'Biaya Perbaikan &amp; Perawatan Mesin', '61300000', 0),
('61301140', '', 'Biaya Perbaikan &amp; Perawatan Inventaris', '61300000', 0),
('61301900', '', 'Biaya Perbaikan &amp; Perawatan Lainnya', '61300000', 0),
('61401110', '', 'Biaya Telepon - Kantor', '61400000', 0),
('61401120', '', 'Biaya Telepon - Gudang', '61400000', 0),
('61401130', '', 'Biaya FAX - Kantor', '61400000', 0),
('61401140', '', 'Biaya Handphone', '61400000', 0),
('61401150', '', 'Biaya Internet', '61400000', 0),
('61401160', '', 'Biaya Information Technology', '61400000', 0),
('61401900', '', 'Biaya Telekomunikasi Lainnya', '61400000', 0),
('61501110', '', 'Biaya Listrik', '61500000', 0),
('61501120', '', 'Biaya Air', '61500000', 0),
('61601110', '', 'Biaya Sewa Kantor', '61600000', 0),
('61601120', '', 'Biaya Sewa Gudang', '61600000', 0),
('61601130', '', 'Biaya Sewa Kendaraan', '61600000', 0),
('61601140', '', 'Biaya Sewa Alat Berat', '61600000', 0),
('61601900', '', 'Biaya Sewa Lainnya', '61600000', 0),
('61701110', '', 'Biaya Perlengkapan', '61700000', 0),
('61701120', '', 'Biaya Konsultan &amp; Audit', '61700000', 0),
('61701130', '', 'Biaya Iuran &amp; Sumbangan', '61700000', 0),
('61701140', '', 'Biaya Alat Tulis', '61700000', 0),
('61701150', '', 'Biaya Pembelian Rumah Tangga', '61700000', 0),
('61701160', '', 'Biaya Pos &amp; Meterai', '61700000', 0),
('61701170', '', 'Biaya Perizinan', '61700000', 0),
('61701180', '', 'Biaya Surat-surat Kendaraan', '61700000', 0),
('61701190', '', 'Biaya Foto Copy, Penjilidan &amp; Cetakan', '61700000', 0),
('61701200', '', 'Biaya Direksi', '61700000', 0),
('61701210', '', 'Biaya Pajak Bumi &amp; Bangunan', '61700000', 0),
('61701900', '', 'Biaya Kantor Lainnya', '61700000', 0),
('61801110', '', 'Biaya Research &amp; Development', '61800000', 0),
('61801120', '', 'Biaya Laboratorium', '61800000', 0),
('61801900', '', 'Biaya R&amp;D Lainnya', '61800000', 0),
('61901110', '', 'Biaya Bahan Bakar Minyak', '61900000', 0),
('61901120', '', 'Biaya Kuli &amp; Bongkar Kontainer', '61900000', 0),
('61901130', '', 'Biaya Tol &amp; Parkir', '61900000', 0),
('61901140', '', 'Biaya Keamanan', '61900000', 0),
('61901150', '', 'Biaya Angkut &amp; Packing', '61900000', 0),
('61901160', '', 'Biaya Meeting', '61900000', 0),
('61901170', '', 'Biaya Rokok', '61900000', 0),
('61901180', '', 'Biaya Langganan Majalah &amp; Koran', '61900000', 0),
('61901190', '', 'Biaya Rekreasi Karyawan', '61900000', 0),
('61901200', '', 'Biaya Perjalanan Dinas DN', '61900000', 0),
('61901210', '', 'Biaya Perjalanan Dinas LN', '61900000', 0),
('61901211', '', 'Biaya Bunga Leasing', '61900000', 0),
('61901900', '', 'Biaya Umum Lain-lain', '61900000', 0),
('62101110', '', 'Biaya Penyusutan Bangunan', '62100000', 0),
('62101120', '', 'Biaya Penyusutan Kendaraan', '62100000', 0),
('62101130', '', 'Biaya Penyusutan Inventaris', '62100000', 0),
('62101140', '', 'Biaya Penyusutan Mesin dan Peralatan', '62100000', 0),
('62201110', '', 'Biaya Amortisasi HAKI', '62200000', 0),
('62201120', '', 'Biaya Amortisasi Goodwill', '62200000', 0),
('70011110', '', 'Pendapatan Buku Kas', '70011000', 0),
('70011120', '', 'Pendapatan Bunga Bank', '70011000', 0),
('70011130', '', 'Pendapatan Selisih Kurs', '70011000', 0),
('70011140', '', 'Taksiran Pendapatan Selisih Kurs', '70011000', 0),
('70011150', '', 'Laba Revaluasi Bank', '70011000', 0),
('70011160', '', 'Penyesuaian Laba Bank', '70011000', 0),
('70011180', '', 'Pendapatan Diskon Pembayaran', '70011000', 0),
('70011900', '', 'Pendapatan Lain-lain', '70011000', 0),
('70021110', '', 'Biaya Buku Kas', '70021000', 0),
('70021120', '', 'Biaya Bunga Bank', '70021000', 0),
('70021130', '', 'Kerugian Selisih Kurs', '70021000', 0),
('70021140', '', 'Taksiran Kerugian Selisih Kurs', '70021000', 0),
('70021150', '', 'Rugi Revaluasi Bank', '70021000', 0),
('70021160', '', 'Penyesuaian Rugi Bank', '70021000', 0),
('70021170', '', 'Biaya Administrasi Bank', '70021000', 0),
('70021180', '', 'Biaya Pembulatan Pembayaran', '70021000', 0),
('70021190', '', 'Selisih Pembulatan Kurs', '70021000', 0),
('70021200', '', 'Cash Discount Penjualan', '70021000', 0),
('70021210', '', 'Biaya Selisih Kas Kecil', '70021000', 0),
('70021220', '', 'Biaya Piutang Tak Tertagih', '70021000', 0),
('70021910', '', 'Pos Default', '70021000', 0),
('70021920', '', 'Suspense Balancing', '70021000', 0),
('70021930', '', 'Suspense Error', '70021000', 0),
('70021990', '', 'Biaya Lainnya', '70021000', 0),
('80001100', '', 'Pajak Penghasilan Badan', '80000000', 0),
('80001200', '', 'Pajak Tangguhan', '80000000', 0),
('90001110', '', 'Ikhtisar Laba / (Rugi) Ditahan', '90000000', 0),
('90001120', '', 'Selisih Koreksi L/R Berjalan', '90000000', 0),
('90001130', '', 'Komitmen PO', '90000000', 0),
('90001140', '', 'Komitmen SO', '90000000', 0),
('90009000', '', 'Offset Saldo Awal', '90000000', 0);

-- --------------------------------------------------------

--
-- Table structure for table `chart_types`
--

CREATE TABLE `chart_types` (
  `id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `class_id` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '-1',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `chart_types`
--

INSERT INTO `chart_types` (`id`, `name`, `class_id`, `parent`, `inactive`) VALUES
('11000000', 'AKTIVA LANCAR', '1', '', 0),
('11110000', 'KAS DAN SETARA KAS', '1', '11000000', 0),
('11111000', 'KAS', '1', '11110000', 0),
('11111100', 'Kas IDR', '1', '11111000', 0),
('11111200', 'KAS VALAS', '1', '11111000', 0),
('11112000', 'BANK', '1', '11110000', 0),
('11112100', 'BANK IDR', '1', '11112000', 0),
('11112110', 'BANK IDR - 1', '1', '11112100', 0),
('11112200', 'BANK VALAS', '1', '11112000', 0),
('11112210', 'BANK VALAS - 1', '1', '11112200', 0),
('11113000', 'DEPOSITO JANGKA PENDEK', '1', '11110000', 0),
('11113100', 'Deposito IDR', '1', '11113000', 0),
('11113200', 'Deposito VALAS', '1', '11113000', 0),
('11119000', 'PENERIMAAN BELUM TERALOKASI', '1', '11110000', 0),
('11120000', 'INVESTASI JANGKA PENDEK', '1', '11000000', 0),
('11121000', 'DEPOSITO', '1', '11120000', 0),
('11122000', 'SURAT-SURAT BERHARGA', '1', '11120000', 0),
('11130000', 'PIUTANG USAHA', '1', '11000000', 0),
('11131100', 'PIUTANG USAHA', '1', '11130000', 0),
('11139100', 'CADANGAN PIUTANG TAK TERTAGIH', '1', '11130000', 0),
('11149000', 'PIUTANG LAIN-LAIN', '1', '11000000', 0),
('11150000', 'PERSEDIAAN', '1', '11000000', 0),
('11151000', 'PERSEDIAAN UNTUK USAHA', '1', '11150000', 0),
('11152000', 'PERSEDIAAN PROYEK', '1', '11150000', 0),
('11160000', 'UANG MUKA YANG DIBAYAR', '1', '11000000', 0),
('11161000', 'UANG MUKA PEMBELIAN', '1', '11160000', 0),
('11163000', 'UANG MUKA JAMINAN', '1', '11160000', 0),
('11169000', 'UANG MUKA LAINNYA', '1', '11160000', 0),
('11170000', 'BIAYA DAN PAJAK DIBAYAR DIMUKA', '1', '11000000', 0),
('11171000', 'BIAYA DIBAYAR DIMUKA', '1', '11170000', 0),
('11172000', 'PAJAK DIBAYAR DIMUKA', '1', '11170000', 0),
('11180000', 'BIAYA YANG DITANGGUHKAN', '1', '11000000', 0),
('11190000', 'PENDAPATAN YANG MASIH HARUS DITERIMA', '1', '11000000', 0),
('12000000', 'AKTIVA TIDAK LANCAR', '1', '', 0),
('12100000', 'AKTIVA PAJAK TANGGUHAN', '1', '12000000', 0),
('12200000', 'INVESTASI JANGKA PANJANG', '1', '12000000', 0),
('12201000', 'DEPOSITO JANGKA PANJANG', '1', '12200000', 0),
('12201100', 'DEPOSITO (IDR)', '1', '12201000', 0),
('12201200', 'DEPOSITO (VALAS)', '1', '12201000', 0),
('12202000', 'PENYERTAAN', '1', '12200000', 0),
('12300000', 'AKTIVA TETAP', '1', '12000000', 0),
('12310000', 'AKTIVA TETAP BERWUJUD', '1', '12300000', 0),
('12311000', 'AKTIVA PEROLEHAN LANGSUNG', '1', '12310000', 0),
('12311100', 'AKTIVA HARGA PEROLEHAN', '1', '12311000', 0),
('12311200', 'AKUMULASI PENYUSUTAN AKTIVA TETAP', '1', '12311000', 0),
('12312000', 'AKTIVA LEASING', '1', '12310000', 0),
('12312100', 'AKTIVA HARGA PEROLEHAN', '1', '12312000', 0),
('12312200', 'AKUMULASI PENYUSUTAN AKTIVA LEASING', '1', '12312000', 0),
('12313000', 'AKTIVA DALAM PENYELESAIAN', '1', '12310000', 0),
('12314000', 'PROPERTI INVESTASI', '1', '12310000', 0),
('12314100', 'AKTIVA HARGA PEROLEHAN', '1', '12314000', 0),
('12314200', 'AKUMULASI PENYUSUTAN AKTIVA LEASING', '1', '12314000', 0),
('12320000', 'AKTIVA TETAP TIDAK BERWUJUD', '1', '12314200', 0),
('12321000', 'AKTIVA TIDAK BERWUJUD - HARGA PEROLEHAN', '1', '12320000', 0),
('12900000', 'AKTIVA TETAP LAINNYA', '1', '12000000', 0),
('21000000', 'HUTANG JANGKA PENDEK', '2', '', 0),
('21101000', 'HUTANG BANK', '2', '21000000', 0),
('21102000', 'HUTANG USAHA', '2', '21000000', 0),
('21102100', 'HUTANG USAHA', '2', '21102000', 0),
('21103000', 'HUTANG BIAYA', '2', '21000000', 0),
('21104000', 'HUTANG PAJAK', '2', '21000000', 0),
('21104100', 'HUTANG PPN', '2', '21104000', 0),
('21104200', 'HUTANG PPh', '2', '21104000', 0),
('21105000', 'PENDAPATAN DITERIMA DI MUKA', '2', '21000000', 0),
('21106000', 'HUTANG JANGKA PENDEK LAINNYA', '2', '21000000', 0),
('21107000', 'HUTANG JANGKA PANJANG YANG AKAN JT TEMPO 1 TH', '2', '21000000', 0),
('22000000', 'HUTANG JANGKA PANJANG', '2', '', 0),
('31011000', 'MODAL DISETOR', '3', '', 0),
('32021000', 'AGIO / DISAGIO', '3', '', 0),
('33031000', 'PENILAIAN KEMBALI ATAS AKTIVA', '3', '', 0),
('34041000', 'DIVIDEN', '3', '', 0),
('35051000', 'LABA / (RUGI)', '3', '', 0),
('41000000', 'PENJUALAN', '4', '', 0),
('42000000', 'DISKON PENJUALAN', '4', '', 0),
('44000000', 'RETUR PENJUALAN', '4', '', 0),
('50000000', 'HARGA POKOK PENJUALAN', '5', '', 0),
('59000000', 'SELISIH HPP', '5', '', 0),
('61000000', 'BIAYA OPERASIONAL', '6', '', 0),
('61100000', 'BIAYA KARYAWAN', '6', '61000000', 0),
('61200000', 'BIAYA MARKETING', '6', '61000000', 0),
('61300000', 'BIAYA PERBAIKAN &amp; PERAWATAN', '6', '61000000', 0),
('61400000', 'BIAYA FAX &amp; TELEKOMUNIKASI', '6', '61000000', 0),
('61500000', 'BIAYA LISTRIK &amp; AIR', '6', '61000000', 0),
('61600000', 'BIAYA SEWA', '6', '61000000', 0),
('61700000', 'BIAYA KANTOR', '6', '61000000', 0),
('61800000', 'BIAYA R&amp;D', '6', '61000000', 0),
('61900000', 'BIAYA UMUM', '6', '61000000', 0),
('62000000', 'BIAYA PENYUSUTAN &amp; AMORTISASI', '6', '', 0),
('62100000', 'BIAYA PENYUSUTAN', '6', '62000000', 0),
('62200000', 'BIAYA AMORTISASI', '6', '62000000', 0),
('70011000', 'PENDAPATAN LAIN-LAIN', '7', '', 0),
('70021000', 'BIAYA LAIN-LAIN', '7', '', 0),
('80000000', 'PAJAK PENGHASILAN', '6', '', 0),
('90000000', 'MEMO', '6', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `type` int NOT NULL DEFAULT '0',
  `id` int NOT NULL DEFAULT '0',
  `date_` date DEFAULT '0000-00-00',
  `memo_` tinytext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `credit_status`
--

CREATE TABLE `credit_status` (
  `id` int NOT NULL,
  `reason_description` char(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dissallow_invoices` tinyint(1) NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `credit_status`
--

INSERT INTO `credit_status` (`id`, `reason_description`, `dissallow_invoices`, `inactive`) VALUES
(1, 'Good History', 0, 0),
(3, 'No more work until payment received', 1, 0),
(4, 'In liquidation', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `crm_categories`
--

CREATE TABLE `crm_categories` (
  `id` int NOT NULL COMMENT 'pure technical key',
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `description` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `system` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'nonzero for core system usage',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `crm_categories`
--

INSERT INTO `crm_categories` (`id`, `type`, `action`, `name`, `description`, `system`, `inactive`) VALUES
(1, 'cust_branch', 'general', 'General', 'General contact data for customer branch (overrides company setting)', 1, 0),
(2, 'cust_branch', 'invoice', 'Invoices', 'Invoice posting (overrides company setting)', 1, 0),
(3, 'cust_branch', 'order', 'Orders', 'Order confirmation (overrides company setting)', 1, 0),
(4, 'cust_branch', 'delivery', 'Deliveries', 'Delivery coordination (overrides company setting)', 1, 0),
(5, 'customer', 'general', 'General', 'General contact data for customer', 1, 0),
(6, 'customer', 'order', 'Orders', 'Order confirmation', 1, 0),
(7, 'customer', 'delivery', 'Deliveries', 'Delivery coordination', 1, 0),
(8, 'customer', 'invoice', 'Invoices', 'Invoice posting', 1, 0),
(9, 'supplier', 'general', 'General', 'General contact data for supplier', 1, 0),
(10, 'supplier', 'order', 'Orders', 'Order confirmation', 1, 0),
(11, 'supplier', 'delivery', 'Deliveries', 'Delivery coordination', 1, 0),
(12, 'supplier', 'invoice', 'Invoices', 'Invoice posting', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `crm_contacts`
--

CREATE TABLE `crm_contacts` (
  `id` int NOT NULL,
  `person_id` int NOT NULL DEFAULT '0' COMMENT 'foreign key to crm_contacts',
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `entity_id` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crm_persons`
--

CREATE TABLE `crm_persons` (
  `id` int NOT NULL,
  `ref` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `name2` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` tinytext COLLATE utf8_unicode_ci,
  `phone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone2` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` char(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `currency` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `curr_abrev` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `curr_symbol` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `country` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hundreds_name` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `auto_update` tinyint(1) NOT NULL DEFAULT '1',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`currency`, `curr_abrev`, `curr_symbol`, `country`, `hundreds_name`, `auto_update`, `inactive`) VALUES
('Euro', 'EUR', '?', 'Europe', 'Cents', 1, 0),
('Rupiah', 'IDR', 'Rp', 'Indonesia', 'Sen', 1, 0),
('US Dollars', 'USD', '$', 'United States', 'Cents', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cust_allocations`
--

CREATE TABLE `cust_allocations` (
  `id` int NOT NULL,
  `person_id` int DEFAULT NULL,
  `amt` double UNSIGNED DEFAULT NULL,
  `date_alloc` date NOT NULL DEFAULT '0000-00-00',
  `trans_no_from` int DEFAULT NULL,
  `trans_type_from` int DEFAULT NULL,
  `trans_no_to` int DEFAULT NULL,
  `trans_type_to` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cust_branch`
--

CREATE TABLE `cust_branch` (
  `branch_code` int NOT NULL,
  `debtor_no` int NOT NULL DEFAULT '0',
  `br_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `branch_ref` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `br_address` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `area` int DEFAULT NULL,
  `salesman` int NOT NULL DEFAULT '0',
  `default_location` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tax_group_id` int DEFAULT NULL,
  `sales_account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sales_discount_account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `receivables_account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `payment_discount_account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `default_ship_via` int NOT NULL DEFAULT '1',
  `br_post_address` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `group_no` int NOT NULL DEFAULT '0',
  `notes` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `bank_account` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `debtors_master`
--

CREATE TABLE `debtors_master` (
  `debtor_no` int NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `debtor_ref` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `address` tinytext COLLATE utf8_unicode_ci,
  `tax_id` varchar(55) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `curr_code` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sales_type` int NOT NULL DEFAULT '1',
  `dimension_id` int NOT NULL DEFAULT '0',
  `dimension2_id` int NOT NULL DEFAULT '0',
  `credit_status` int NOT NULL DEFAULT '0',
  `payment_terms` int DEFAULT NULL,
  `discount` double NOT NULL DEFAULT '0',
  `pymt_discount` double NOT NULL DEFAULT '0',
  `credit_limit` float NOT NULL DEFAULT '1000',
  `notes` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `debtor_trans`
--

CREATE TABLE `debtor_trans` (
  `trans_no` int UNSIGNED NOT NULL DEFAULT '0',
  `type` smallint UNSIGNED NOT NULL DEFAULT '0',
  `version` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `debtor_no` int UNSIGNED NOT NULL DEFAULT '0',
  `branch_code` int NOT NULL DEFAULT '-1',
  `tran_date` date NOT NULL DEFAULT '0000-00-00',
  `due_date` date NOT NULL DEFAULT '0000-00-00',
  `reference` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tpe` int NOT NULL DEFAULT '0',
  `order_` int NOT NULL DEFAULT '0',
  `ov_amount` double NOT NULL DEFAULT '0',
  `ov_gst` double NOT NULL DEFAULT '0',
  `ov_freight` double NOT NULL DEFAULT '0',
  `ov_freight_tax` double NOT NULL DEFAULT '0',
  `ov_discount` double NOT NULL DEFAULT '0',
  `alloc` double NOT NULL DEFAULT '0',
  `prep_amount` double NOT NULL DEFAULT '0',
  `rate` double NOT NULL DEFAULT '1',
  `ship_via` int DEFAULT NULL,
  `dimension_id` int NOT NULL DEFAULT '0',
  `dimension2_id` int NOT NULL DEFAULT '0',
  `payment_terms` int DEFAULT NULL,
  `tax_included` tinyint UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `debtor_trans_details`
--

CREATE TABLE `debtor_trans_details` (
  `id` int NOT NULL,
  `debtor_trans_no` int DEFAULT NULL,
  `debtor_trans_type` int DEFAULT NULL,
  `stock_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` tinytext COLLATE utf8_unicode_ci,
  `unit_price` double NOT NULL DEFAULT '0',
  `unit_tax` double NOT NULL DEFAULT '0',
  `quantity` double NOT NULL DEFAULT '0',
  `discount_percent` double NOT NULL DEFAULT '0',
  `standard_cost` double NOT NULL DEFAULT '0',
  `qty_done` double NOT NULL DEFAULT '0',
  `src_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dimensions`
--

CREATE TABLE `dimensions` (
  `id` int NOT NULL,
  `reference` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type_` tinyint(1) NOT NULL DEFAULT '1',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `date_` date NOT NULL DEFAULT '0000-00-00',
  `due_date` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exchange_rates`
--

CREATE TABLE `exchange_rates` (
  `id` int NOT NULL,
  `curr_code` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rate_buy` double NOT NULL DEFAULT '0',
  `rate_sell` double NOT NULL DEFAULT '0',
  `date_` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fiscal_year`
--

CREATE TABLE `fiscal_year` (
  `id` int NOT NULL,
  `begin` date DEFAULT '0000-00-00',
  `end` date DEFAULT '0000-00-00',
  `closed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fiscal_year`
--

INSERT INTO `fiscal_year` (`id`, `begin`, `end`, `closed`) VALUES
(1, '2017-01-01', '2017-12-31', 0);

-- --------------------------------------------------------

--
-- Table structure for table `gl_trans`
--

CREATE TABLE `gl_trans` (
  `counter` int NOT NULL,
  `type` smallint NOT NULL DEFAULT '0',
  `type_no` int NOT NULL DEFAULT '0',
  `tran_date` date NOT NULL DEFAULT '0000-00-00',
  `account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `memo_` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `dimension_id` int NOT NULL DEFAULT '0',
  `dimension2_id` int NOT NULL DEFAULT '0',
  `person_type_id` int DEFAULT NULL,
  `person_id` tinyblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `grn_batch`
--

CREATE TABLE `grn_batch` (
  `id` int NOT NULL,
  `supplier_id` int NOT NULL DEFAULT '0',
  `purch_order_no` int DEFAULT NULL,
  `reference` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `delivery_date` date NOT NULL DEFAULT '0000-00-00',
  `loc_code` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rate` double DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `grn_items`
--

CREATE TABLE `grn_items` (
  `id` int NOT NULL,
  `grn_batch_id` int DEFAULT NULL,
  `po_detail_item` int NOT NULL DEFAULT '0',
  `item_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` tinytext COLLATE utf8_unicode_ci,
  `qty_recd` double NOT NULL DEFAULT '0',
  `quantity_inv` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` smallint UNSIGNED NOT NULL,
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `description`, `inactive`) VALUES
(1, 'Kecil', 0),
(2, 'Sedang', 0),
(3, 'Besar', 0);

-- --------------------------------------------------------

--
-- Table structure for table `item_codes`
--

CREATE TABLE `item_codes` (
  `id` int UNSIGNED NOT NULL,
  `item_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `stock_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `category_id` smallint UNSIGNED NOT NULL,
  `quantity` double NOT NULL DEFAULT '1',
  `is_foreign` tinyint(1) NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_tax_types`
--

CREATE TABLE `item_tax_types` (
  `id` int NOT NULL,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `exempt` tinyint(1) NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `item_tax_types`
--

INSERT INTO `item_tax_types` (`id`, `name`, `exempt`, `inactive`) VALUES
(1, 'Penjualan Regular', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `item_tax_type_exemptions`
--

CREATE TABLE `item_tax_type_exemptions` (
  `item_tax_type_id` int NOT NULL DEFAULT '0',
  `tax_type_id` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_units`
--

CREATE TABLE `item_units` (
  `abbr` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `decimals` tinyint NOT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `item_units`
--

INSERT INTO `item_units` (`abbr`, `name`, `decimals`, `inactive`) VALUES
('each', 'Each', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `journal`
--

CREATE TABLE `journal` (
  `type` smallint NOT NULL DEFAULT '0',
  `trans_no` int NOT NULL DEFAULT '0',
  `tran_date` date DEFAULT '0000-00-00',
  `reference` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `source_ref` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `event_date` date DEFAULT '0000-00-00',
  `doc_date` date NOT NULL DEFAULT '0000-00-00',
  `currency` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `amount` double NOT NULL DEFAULT '0',
  `rate` double NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `loc_code` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `location_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `delivery_address` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phone2` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fax` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contact` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fixed_asset` tinyint(1) NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`loc_code`, `location_name`, `delivery_address`, `phone`, `phone2`, `fax`, `email`, `contact`, `fixed_asset`, `inactive`) VALUES
('DEF', 'Default', 'N/A', '', '', '', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `loc_stock`
--

CREATE TABLE `loc_stock` (
  `loc_code` char(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `stock_id` char(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reorder_level` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_terms`
--

CREATE TABLE `payment_terms` (
  `terms_indicator` int NOT NULL,
  `terms` char(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `days_before_due` smallint NOT NULL DEFAULT '0',
  `day_in_following_month` smallint NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payment_terms`
--

INSERT INTO `payment_terms` (`terms_indicator`, `terms`, `days_before_due`, `day_in_following_month`, `inactive`) VALUES
(1, 'Tanggal 15 bulan berikutnya', 0, 17, 0),
(2, 'Akhir bulan berikutnya', 0, 30, 0),
(3, 'Pembayaran dalam 10 hari', 10, 0, 0),
(4, 'Cash Only', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `prices`
--

CREATE TABLE `prices` (
  `id` int NOT NULL,
  `stock_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sales_type_id` int NOT NULL DEFAULT '0',
  `curr_abrev` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `price` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `printers`
--

CREATE TABLE `printers` (
  `id` tinyint UNSIGNED NOT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `queue` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `host` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `port` smallint UNSIGNED NOT NULL,
  `timeout` tinyint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `printers`
--

INSERT INTO `printers` (`id`, `name`, `description`, `queue`, `host`, `port`, `timeout`) VALUES
(1, 'QL500', 'Label printer', 'QL500', 'server', 127, 20),
(2, 'Samsung', 'Main network printer', 'scx4521F', 'server', 515, 5),
(3, 'Local', 'Local print server at user IP', 'lp', '', 515, 10);

-- --------------------------------------------------------

--
-- Table structure for table `print_profiles`
--

CREATE TABLE `print_profiles` (
  `id` smallint UNSIGNED NOT NULL,
  `profile` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `report` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `printer` tinyint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `print_profiles`
--

INSERT INTO `print_profiles` (`id`, `profile`, `report`, `printer`) VALUES
(1, 'Out of office', NULL, 0),
(2, 'Sales Department', NULL, 0),
(3, 'Central', NULL, 2),
(4, 'Sales Department', '104', 2),
(5, 'Sales Department', '105', 2),
(6, 'Sales Department', '107', 2),
(7, 'Sales Department', '109', 2),
(8, 'Sales Department', '110', 2),
(9, 'Sales Department', '201', 2);

-- --------------------------------------------------------

--
-- Table structure for table `purch_data`
--

CREATE TABLE `purch_data` (
  `supplier_id` int NOT NULL DEFAULT '0',
  `stock_id` char(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `price` double NOT NULL DEFAULT '0',
  `suppliers_uom` char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `conversion_factor` double NOT NULL DEFAULT '1',
  `supplier_description` char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purch_orders`
--

CREATE TABLE `purch_orders` (
  `order_no` int NOT NULL,
  `supplier_id` int NOT NULL DEFAULT '0',
  `comments` tinytext COLLATE utf8_unicode_ci,
  `ord_date` date NOT NULL DEFAULT '0000-00-00',
  `reference` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `requisition_no` tinytext COLLATE utf8_unicode_ci,
  `into_stock_location` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `delivery_address` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `total` double NOT NULL DEFAULT '0',
  `prep_amount` double NOT NULL DEFAULT '0',
  `alloc` double NOT NULL DEFAULT '0',
  `tax_included` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purch_order_details`
--

CREATE TABLE `purch_order_details` (
  `po_detail_item` int NOT NULL,
  `order_no` int NOT NULL DEFAULT '0',
  `item_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` tinytext COLLATE utf8_unicode_ci,
  `delivery_date` date NOT NULL DEFAULT '0000-00-00',
  `qty_invoiced` double NOT NULL DEFAULT '0',
  `unit_price` double NOT NULL DEFAULT '0',
  `act_price` double NOT NULL DEFAULT '0',
  `std_cost_unit` double NOT NULL DEFAULT '0',
  `quantity_ordered` double NOT NULL DEFAULT '0',
  `quantity_received` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quick_entries`
--

CREATE TABLE `quick_entries` (
  `id` smallint UNSIGNED NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `usage` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `base_amount` double NOT NULL DEFAULT '0',
  `base_desc` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bal_type` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `quick_entries`
--

INSERT INTO `quick_entries` (`id`, `type`, `description`, `usage`, `base_amount`, `base_desc`, `bal_type`) VALUES
(1, 1, 'Maintenance', NULL, 0, 'Amount', 0),
(2, 4, 'Telp', NULL, 0, 'Amount', 0),
(3, 2, 'Penjualan Cash', NULL, 0, 'Amount', 0);

-- --------------------------------------------------------

--
-- Table structure for table `quick_entry_lines`
--

CREATE TABLE `quick_entry_lines` (
  `id` smallint UNSIGNED NOT NULL,
  `qid` smallint UNSIGNED NOT NULL,
  `amount` double DEFAULT '0',
  `memo` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `dest_id` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dimension_id` smallint UNSIGNED DEFAULT NULL,
  `dimension2_id` smallint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recurrent_invoices`
--

CREATE TABLE `recurrent_invoices` (
  `id` smallint UNSIGNED NOT NULL,
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `order_no` int UNSIGNED NOT NULL,
  `debtor_no` int UNSIGNED DEFAULT NULL,
  `group_no` smallint UNSIGNED DEFAULT NULL,
  `days` int NOT NULL DEFAULT '0',
  `monthly` int NOT NULL DEFAULT '0',
  `begin` date NOT NULL DEFAULT '0000-00-00',
  `end` date NOT NULL DEFAULT '0000-00-00',
  `last_sent` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reflines`
--

CREATE TABLE `reflines` (
  `id` int NOT NULL,
  `trans_type` int NOT NULL,
  `prefix` char(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pattern` varchar(35) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `reflines`
--

INSERT INTO `reflines` (`id`, `trans_type`, `prefix`, `pattern`, `description`, `default`, `inactive`) VALUES
(1, 0, '', '1', '', 1, 0),
(2, 1, '', '1', '', 1, 0),
(3, 2, '', '1', '', 1, 0),
(4, 4, '', '1', '', 1, 0),
(5, 10, '', '1', '', 1, 0),
(6, 11, '', '1', '', 1, 0),
(7, 12, '', '1', '', 1, 0),
(8, 13, '', '1', '', 1, 0),
(9, 16, '', '1', '', 1, 0),
(10, 17, '', '1', '', 1, 0),
(11, 18, '', '1', '', 1, 0),
(12, 20, '', '1', '', 1, 0),
(13, 21, '', '1', '', 1, 0),
(14, 22, '', '1', '', 1, 0),
(15, 25, '', '1', '', 1, 0),
(16, 26, '', '1', '', 1, 0),
(17, 28, '', '1', '', 1, 0),
(18, 29, '', '1', '', 1, 0),
(19, 30, '', '1', '', 1, 0),
(20, 32, '', '1', '', 1, 0),
(21, 35, '', '1', '', 1, 0),
(22, 40, '', '1', '', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `refs`
--

CREATE TABLE `refs` (
  `id` int NOT NULL DEFAULT '0',
  `type` int NOT NULL DEFAULT '0',
  `reference` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salesman`
--

CREATE TABLE `salesman` (
  `salesman_code` int NOT NULL,
  `salesman_name` char(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `salesman_phone` char(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `salesman_fax` char(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `salesman_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `provision` double NOT NULL DEFAULT '0',
  `break_pt` double NOT NULL DEFAULT '0',
  `provision2` double NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `salesman`
--

INSERT INTO `salesman` (`salesman_code`, `salesman_name`, `salesman_phone`, `salesman_fax`, `salesman_email`, `provision`, `break_pt`, `provision2`, `inactive`) VALUES
(1, 'Sales Person', '', '', '', 5, 20000, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sales_orders`
--

CREATE TABLE `sales_orders` (
  `order_no` int NOT NULL,
  `trans_type` smallint NOT NULL DEFAULT '30',
  `version` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `debtor_no` int NOT NULL DEFAULT '0',
  `branch_code` int NOT NULL DEFAULT '0',
  `reference` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `customer_ref` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `comments` tinytext COLLATE utf8_unicode_ci,
  `ord_date` date NOT NULL DEFAULT '0000-00-00',
  `order_type` int NOT NULL DEFAULT '0',
  `ship_via` int NOT NULL DEFAULT '0',
  `delivery_address` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `contact_phone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deliver_to` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `freight_cost` double NOT NULL DEFAULT '0',
  `from_stk_loc` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `delivery_date` date NOT NULL DEFAULT '0000-00-00',
  `payment_terms` int DEFAULT NULL,
  `total` double NOT NULL DEFAULT '0',
  `prep_amount` double NOT NULL DEFAULT '0',
  `alloc` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_details`
--

CREATE TABLE `sales_order_details` (
  `id` int NOT NULL,
  `order_no` int NOT NULL DEFAULT '0',
  `trans_type` smallint NOT NULL DEFAULT '30',
  `stk_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` tinytext COLLATE utf8_unicode_ci,
  `qty_sent` double NOT NULL DEFAULT '0',
  `unit_price` double NOT NULL DEFAULT '0',
  `quantity` double NOT NULL DEFAULT '0',
  `invoiced` double NOT NULL DEFAULT '0',
  `discount_percent` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales_pos`
--

CREATE TABLE `sales_pos` (
  `id` smallint UNSIGNED NOT NULL,
  `pos_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `cash_sale` tinyint(1) NOT NULL,
  `credit_sale` tinyint(1) NOT NULL,
  `pos_location` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `pos_account` smallint UNSIGNED NOT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sales_pos`
--

INSERT INTO `sales_pos` (`id`, `pos_name`, `cash_sale`, `credit_sale`, `pos_location`, `pos_account`, `inactive`) VALUES
(1, 'Default', 1, 1, 'DEF', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sales_types`
--

CREATE TABLE `sales_types` (
  `id` int NOT NULL,
  `sales_type` char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tax_included` int NOT NULL DEFAULT '0',
  `factor` double NOT NULL DEFAULT '1',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sales_types`
--

INSERT INTO `sales_types` (`id`, `sales_type`, `tax_included`, `factor`, `inactive`) VALUES
(1, 'Ritel', 1, 1, 0),
(2, 'Grosir', 0, 0.7, 0);

-- --------------------------------------------------------

--
-- Table structure for table `security_roles`
--

CREATE TABLE `security_roles` (
  `id` int NOT NULL,
  `role` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sections` text COLLATE utf8_unicode_ci,
  `areas` text COLLATE utf8_unicode_ci,
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `security_roles`
--

INSERT INTO `security_roles` (`id`, `role`, `description`, `sections`, `areas`, `inactive`) VALUES
(1, 'Pencarian', 'Pencarian', '768;2816;3072;3328;5632;5888;8192;8448;10752;11008;13312;15872;16128', '257;258;259;260;513;514;515;516;517;518;519;520;521;522;523;524;525;773;774;2822;3073;3075;3076;3077;3329;3330;3331;3332;3333;3334;3335;5377;5633;5640;5889;5890;5891;7937;7938;7939;7940;8193;8194;8450;8451;10497;10753;11009;11010;11012;13313;13315;15617;15618;15619;15620;15621;15622;15623;15624;15625;15626;15873;15882;16129;16130;16131;16132;775', 0),
(2, 'Admin Sistem', 'Admin Sistem', '256;512;768;2816;3072;3328;5376;5632;5888;7936;8192;8448;10496;10752;11008;13056;13312;15616;15872;16128', '257;258;259;260;513;514;515;516;517;518;519;520;521;522;523;524;525;526;769;770;771;772;773;774;2817;2818;2819;2820;2821;2822;2823;3073;3074;3082;3075;3076;3077;3078;3079;3080;3081;3329;3330;3331;3332;3333;3334;3335;5377;5633;5634;5635;5636;5637;5641;5638;5639;5640;5889;5890;5891;7937;7938;7939;7940;8193;8194;8195;8196;8197;8449;8450;8451;10497;10753;10754;10755;10756;10757;11009;11010;11011;11012;13057;13313;13314;13315;15617;15618;15619;15620;15621;15622;15623;15624;15628;15625;15626;15627;15873;15874;15875;15876;15877;15878;15879;15880;15883;15881;15882;16129;16130;16131;16132;775', 0),
(3, 'Mgr Sales', 'Mgr Sales', '768;3072;5632;8192;15872', '773;774;3073;3075;3081;5633;8194;15873;775', 0),
(4, 'Mgr Gudang', 'Mgr Gudang', '2816;3072;3328;5632;5888;8192;8448;10752;11008;13312;15872;16128;768', '775', 0),
(5, 'Mgr Produksi', 'Mgr Produksi', '512;2816;3072;3328;5632;5888;8192;8448;10752;11008;13312;15616;15872;16128;768', '775', 0),
(6, 'Pembelian', 'Pembelian', '512;2816;3072;3328;5376;5632;5888;8192;8448;10752;11008;13312;15616;15872;16128;768', '775', 0),
(7, 'Penagihan', 'Penagihan', '512;768;2816;3072;3328;5632;5888;8192;8448;10752;11008;13312;15616;15872;16128', '521;523;524;771;773;774;2818;2819;2820;2821;2822;2823;3073;3073;3074;3075;3076;3077;3078;3079;3080;3081;3081;3329;3330;3330;3330;3331;3331;3332;3333;3334;3335;5633;5633;5634;5637;5638;5639;5640;5640;5889;5890;5891;8193;8194;8194;8196;8197;8450;8451;10753;10755;11009;11010;11012;13313;13315;15617;15619;15620;15621;15624;15624;15873;15876;15877;15878;15880;15882;16129;16130;16131;16132;775', 0),
(8, 'Pembayaran', 'Pembayaran', '512;2816;3072;3328;5376;5632;5888;8192;8448;10752;11008;13312;15616;15872;16128;768', '775', 0),
(9, 'Akuntan', 'Akuntan Baru', '512;768;2816;3072;3328;5376;5632;5888;8192;8448;10752;11008;13312;15616;15872;16128', '257;258;259;260;521;523;524;771;772;773;774;2818;2819;2820;2821;2822;2823;3073;3074;3075;3076;3077;3078;3079;3080;3081;3329;3330;3331;3332;3333;3334;3335;5377;5633;5634;5635;5637;5638;5639;5640;5889;5890;5891;7937;7938;7939;7940;8193;8194;8196;8197;8449;8450;8451;10497;10753;10755;11009;11010;11012;13313;13315;15617;15618;15619;15620;15621;15624;15873;15876;15877;15878;15880;15882;16129;16130;16131;16132;775', 0),
(10, 'Sub Admin', 'Sub Admin', '512;768;2816;3072;3328;5376;5632;5888;8192;8448;10752;11008;13312;15616;15872;16128', '257;258;259;260;521;523;524;771;772;773;774;2818;2819;2820;2821;2822;2823;3073;3074;3082;3075;3076;3077;3078;3079;3080;3081;3329;3330;3331;3332;3333;3334;3335;5377;5633;5634;5635;5637;5638;5639;5640;5889;5890;5891;7937;7938;7939;7940;8193;8194;8196;8197;8449;8450;8451;10497;10753;10755;11009;11010;11012;13057;13313;13315;15617;15619;15620;15621;15624;15873;15874;15876;15877;15878;15879;15880;15882;16129;16130;16131;16132;775', 0);

-- --------------------------------------------------------

--
-- Table structure for table `shippers`
--

CREATE TABLE `shippers` (
  `shipper_id` int NOT NULL,
  `shipper_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phone` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phone2` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contact` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `address` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shippers`
--

INSERT INTO `shippers` (`shipper_id`, `shipper_name`, `phone`, `phone2`, `contact`, `address`, `inactive`) VALUES
(1, 'Default', '', '', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sql_trail`
--

CREATE TABLE `sql_trail` (
  `id` int UNSIGNED NOT NULL,
  `sql` text COLLATE utf8_unicode_ci NOT NULL,
  `result` tinyint(1) NOT NULL,
  `msg` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_category`
--

CREATE TABLE `stock_category` (
  `category_id` int NOT NULL,
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dflt_tax_type` int NOT NULL DEFAULT '1',
  `dflt_units` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'each',
  `dflt_mb_flag` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'B',
  `dflt_sales_act` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dflt_cogs_act` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dflt_inventory_act` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dflt_adjustment_act` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dflt_wip_act` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dflt_dim1` int DEFAULT NULL,
  `dflt_dim2` int DEFAULT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  `dflt_no_sale` tinyint(1) NOT NULL DEFAULT '0',
  `dflt_no_purchase` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `stock_category`
--

INSERT INTO `stock_category` (`category_id`, `description`, `dflt_tax_type`, `dflt_units`, `dflt_mb_flag`, `dflt_sales_act`, `dflt_cogs_act`, `dflt_inventory_act`, `dflt_adjustment_act`, `dflt_wip_act`, `dflt_dim1`, `dflt_dim2`, `inactive`, `dflt_no_sale`, `dflt_no_purchase`) VALUES
(1, 'Komponen', 1, 'each', 'B', '41001000', '51010000', '11151100', '51060000', '11151000', 0, 0, 0, 1, 0),
(2, 'Jasa', 1, 'each', 'D', '41002000', '51020000', '11151100', '51060000', '11151000', 0, 0, 0, 0, 0),
(3, 'Barang Dagang', 1, 'each', 'B', '41001000', '51010000', '11151100', '51060000', '11151000', 0, 0, 0, 0, 0),
(4, 'Barang Jadi', 1, 'each', 'M', '41001000', '51010000', '11151100', '51060000', '11151000', 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `stock_fa_class`
--

CREATE TABLE `stock_fa_class` (
  `fa_class_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `long_description` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `depreciation_rate` double NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_master`
--

CREATE TABLE `stock_master` (
  `stock_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `category_id` int NOT NULL DEFAULT '0',
  `tax_type_id` int NOT NULL DEFAULT '0',
  `description` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `long_description` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `units` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'each',
  `mb_flag` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'B',
  `sales_account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cogs_account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inventory_account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `adjustment_account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `wip_account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dimension_id` int DEFAULT NULL,
  `dimension2_id` int DEFAULT NULL,
  `purchase_cost` double NOT NULL DEFAULT '0',
  `material_cost` double NOT NULL DEFAULT '0',
  `labour_cost` double NOT NULL DEFAULT '0',
  `overhead_cost` double NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  `no_sale` tinyint(1) NOT NULL DEFAULT '0',
  `no_purchase` tinyint(1) NOT NULL DEFAULT '0',
  `editable` tinyint(1) NOT NULL DEFAULT '0',
  `depreciation_method` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `depreciation_rate` double NOT NULL DEFAULT '0',
  `depreciation_factor` double NOT NULL DEFAULT '0',
  `depreciation_start` date NOT NULL DEFAULT '0000-00-00',
  `depreciation_date` date NOT NULL DEFAULT '0000-00-00',
  `fa_class_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_moves`
--

CREATE TABLE `stock_moves` (
  `trans_id` int NOT NULL,
  `trans_no` int NOT NULL DEFAULT '0',
  `stock_id` char(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` smallint NOT NULL DEFAULT '0',
  `loc_code` char(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tran_date` date NOT NULL DEFAULT '0000-00-00',
  `price` double NOT NULL DEFAULT '0',
  `reference` char(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `qty` double NOT NULL DEFAULT '1',
  `standard_cost` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `supplier_id` int NOT NULL,
  `supp_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `supp_ref` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `supp_address` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `gst_no` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contact` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `supp_account_no` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `website` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `bank_account` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `curr_code` char(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_terms` int DEFAULT NULL,
  `tax_included` tinyint(1) NOT NULL DEFAULT '0',
  `dimension_id` int DEFAULT '0',
  `dimension2_id` int DEFAULT '0',
  `tax_group_id` int DEFAULT NULL,
  `credit_limit` double NOT NULL DEFAULT '0',
  `purchase_account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `payable_account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `payment_discount_account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `notes` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supp_allocations`
--

CREATE TABLE `supp_allocations` (
  `id` int NOT NULL,
  `person_id` int DEFAULT NULL,
  `amt` double UNSIGNED DEFAULT NULL,
  `date_alloc` date NOT NULL DEFAULT '0000-00-00',
  `trans_no_from` int DEFAULT NULL,
  `trans_type_from` int DEFAULT NULL,
  `trans_no_to` int DEFAULT NULL,
  `trans_type_to` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supp_invoice_items`
--

CREATE TABLE `supp_invoice_items` (
  `id` int NOT NULL,
  `supp_trans_no` int DEFAULT NULL,
  `supp_trans_type` int DEFAULT NULL,
  `gl_code` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `grn_item_id` int DEFAULT NULL,
  `po_detail_item_id` int DEFAULT NULL,
  `stock_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` tinytext COLLATE utf8_unicode_ci,
  `quantity` double NOT NULL DEFAULT '0',
  `unit_price` double NOT NULL DEFAULT '0',
  `unit_tax` double NOT NULL DEFAULT '0',
  `memo_` tinytext COLLATE utf8_unicode_ci,
  `dimension_id` int NOT NULL DEFAULT '0',
  `dimension2_id` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supp_trans`
--

CREATE TABLE `supp_trans` (
  `trans_no` int UNSIGNED NOT NULL DEFAULT '0',
  `type` smallint UNSIGNED NOT NULL DEFAULT '0',
  `supplier_id` int UNSIGNED NOT NULL DEFAULT '0',
  `reference` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `supp_reference` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tran_date` date NOT NULL DEFAULT '0000-00-00',
  `due_date` date NOT NULL DEFAULT '0000-00-00',
  `ov_amount` double NOT NULL DEFAULT '0',
  `ov_discount` double NOT NULL DEFAULT '0',
  `ov_gst` double NOT NULL DEFAULT '0',
  `rate` double NOT NULL DEFAULT '1',
  `alloc` double NOT NULL DEFAULT '0',
  `tax_included` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sys_prefs`
--

CREATE TABLE `sys_prefs` (
  `name` varchar(35) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `category` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `length` smallint DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sys_prefs`
--

INSERT INTO `sys_prefs` (`name`, `category`, `type`, `length`, `value`) VALUES
('accounts_alpha', 'glsetup.general', 'tinyint', 1, '0'),
('accumulate_shipping', 'glsetup.customer', 'tinyint', 1, '0'),
('add_pct', 'setup.company', 'int', 5, '-1'),
('allow_negative_prices', 'glsetup.inventory', 'tinyint', 1, '1'),
('allow_negative_stock', 'glsetup.inventory', 'tinyint', 1, '0'),
('alternative_tax_include_on_docs', 'setup.company', 'tinyint', 1, '0'),
('auto_curr_reval', 'setup.company', 'smallint', 6, '1'),
('bank_charge_act', 'glsetup.general', 'varchar', 15, '70021170'),
('base_sales', 'setup.company', 'int', 11, '1'),
('bcc_email', 'setup.company', 'varchar', 100, ''),
('coy_logo', 'setup.company', 'varchar', 100, ''),
('coy_name', 'setup.company', 'varchar', 60, 'HasnaTeknologi'),
('coy_no', 'setup.company', 'varchar', 25, ''),
('creditors_act', 'glsetup.purchase', 'varchar', 15, '21102110'),
('curr_default', 'setup.company', 'char', 3, 'IDR'),
('debtors_act', 'glsetup.sales', 'varchar', 15, '11131110'),
('default_adj_act', 'glsetup.items', 'varchar', 15, '51060000'),
('default_cogs_act', 'glsetup.items', 'varchar', 15, '51010000'),
('default_credit_limit', 'glsetup.customer', 'int', 11, '1000000'),
('default_delivery_required', 'glsetup.sales', 'smallint', 6, '1'),
('default_dim_required', 'glsetup.dims', 'int', 11, '20'),
('default_inv_sales_act', 'glsetup.items', 'varchar', 15, '41001000'),
('default_inventory_act', 'glsetup.items', 'varchar', 15, '11151100'),
('default_loss_on_asset_disposal_act', 'glsetup.items', 'varchar', 15, '5660'),
('default_prompt_payment_act', 'glsetup.sales', 'varchar', 15, '42001000'),
('default_quote_valid_days', 'glsetup.sales', 'smallint', 6, '30'),
('default_receival_required', 'glsetup.purchase', 'smallint', 6, '10'),
('default_sales_act', 'glsetup.sales', 'varchar', 15, '41001000'),
('default_sales_discount_act', 'glsetup.sales', 'varchar', 15, '42001000'),
('default_wip_act', 'glsetup.items', 'varchar', 15, '51030000'),
('default_workorder_required', 'glsetup.manuf', 'int', 11, '20'),
('deferred_income_act', 'glsetup.sales', 'varchar', 15, ''),
('depreciation_period', 'glsetup.company', 'tinyint', 1, '1'),
('domicile', 'setup.company', 'varchar', 55, ''),
('email', 'setup.company', 'varchar', 100, ''),
('exchange_diff_act', 'glsetup.general', 'varchar', 15, '70011130'),
('f_year', 'setup.company', 'int', 11, '1'),
('fax', 'setup.company', 'varchar', 30, ''),
('freight_act', 'glsetup.customer', 'varchar', 15, '61201190'),
('gl_closing_date', 'setup.closing_date', 'date', 8, ''),
('grn_clearing_act', 'glsetup.purchase', 'varchar', 15, '11151300'),
('gst_no', 'setup.company', 'varchar', 25, ''),
('legal_text', 'glsetup.customer', 'tinytext', 0, ''),
('loc_notification', 'glsetup.inventory', 'tinyint', 1, '0'),
('login_tout', 'setup.company', 'smallint', 6, '1800'),
('no_customer_list', 'setup.company', 'tinyint', 1, '0'),
('no_item_list', 'setup.company', 'tinyint', 1, '0'),
('no_supplier_list', 'setup.company', 'tinyint', 1, '0'),
('no_zero_lines_amount', 'glsetup.sales', 'tinyint', 1, '1'),
('past_due_days', 'glsetup.general', 'int', 11, '30'),
('phone', 'setup.company', 'varchar', 30, ''),
('po_over_charge', 'glsetup.purchase', 'int', 11, '10'),
('po_over_receive', 'glsetup.purchase', 'int', 11, '10'),
('postal_address', 'setup.company', 'tinytext', 0, 'N/A'),
('print_invoice_no', 'glsetup.sales', 'tinyint', 1, '0'),
('print_item_images_on_quote', 'glsetup.inventory', 'tinyint', 1, '0'),
('profit_loss_year_act', 'glsetup.general', 'varchar', 15, '90001110'),
('pyt_discount_act', 'glsetup.purchase', 'varchar', 15, '51040000'),
('retained_earnings_act', 'glsetup.general', 'varchar', 15, '35051010'),
('round_to', 'setup.company', 'int', 5, '1'),
('show_po_item_codes', 'glsetup.purchase', 'tinyint', 1, '0'),
('suppress_tax_rates', 'setup.company', 'tinyint', 1, '0'),
('tax_algorithm', 'glsetup.customer', 'tinyint', 1, '1'),
('tax_last', 'setup.company', 'int', 11, '1'),
('tax_prd', 'setup.company', 'int', 11, '1'),
('time_zone', 'setup.company', 'tinyint', 1, '0'),
('use_dimension', 'setup.company', 'tinyint', 1, '1'),
('use_fixed_assets', 'setup.company', 'tinyint', 1, '1'),
('use_manufacturing', 'setup.company', 'tinyint', 1, '1'),
('version_id', 'system', 'varchar', 11, '2.4.1');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int NOT NULL,
  `type` smallint NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tag_associations`
--

CREATE TABLE `tag_associations` (
  `record_id` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `tag_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tax_groups`
--

CREATE TABLE `tax_groups` (
  `id` int NOT NULL,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tax_groups`
--

INSERT INTO `tax_groups` (`id`, `name`, `inactive`) VALUES
(1, 'Tax', 0),
(2, 'Tax Exempt', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tax_group_items`
--

CREATE TABLE `tax_group_items` (
  `tax_group_id` int NOT NULL DEFAULT '0',
  `tax_type_id` int NOT NULL DEFAULT '0',
  `tax_shipping` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tax_group_items`
--

INSERT INTO `tax_group_items` (`tax_group_id`, `tax_type_id`, `tax_shipping`) VALUES
(1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tax_types`
--

CREATE TABLE `tax_types` (
  `id` int NOT NULL,
  `rate` double NOT NULL DEFAULT '0',
  `sales_gl_code` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `purchasing_gl_code` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tax_types`
--

INSERT INTO `tax_types` (`id`, `rate`, `sales_gl_code`, `purchasing_gl_code`, `name`, `inactive`) VALUES
(1, 10, '21104110', '21104110', 'PPN 10%', 0);

-- --------------------------------------------------------

--
-- Table structure for table `trans_tax_details`
--

CREATE TABLE `trans_tax_details` (
  `id` int NOT NULL,
  `trans_type` smallint DEFAULT NULL,
  `trans_no` int DEFAULT NULL,
  `tran_date` date NOT NULL,
  `tax_type_id` int NOT NULL DEFAULT '0',
  `rate` double NOT NULL DEFAULT '0',
  `ex_rate` double NOT NULL DEFAULT '1',
  `included_in_price` tinyint(1) NOT NULL DEFAULT '0',
  `net_amount` double NOT NULL DEFAULT '0',
  `amount` double NOT NULL DEFAULT '0',
  `memo` tinytext COLLATE utf8_unicode_ci,
  `reg_type` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `useronline`
--

CREATE TABLE `useronline` (
  `id` int NOT NULL,
  `timestamp` int NOT NULL DEFAULT '0',
  `ip` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `file` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` smallint NOT NULL,
  `user_id` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `real_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `role_id` int NOT NULL DEFAULT '1',
  `phone` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_format` tinyint(1) NOT NULL DEFAULT '0',
  `date_sep` tinyint(1) NOT NULL DEFAULT '0',
  `tho_sep` tinyint(1) NOT NULL DEFAULT '0',
  `dec_sep` tinyint(1) NOT NULL DEFAULT '0',
  `theme` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `page_size` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A4',
  `prices_dec` smallint NOT NULL DEFAULT '2',
  `qty_dec` smallint NOT NULL DEFAULT '2',
  `rates_dec` smallint NOT NULL DEFAULT '4',
  `percent_dec` smallint NOT NULL DEFAULT '1',
  `show_gl` tinyint(1) NOT NULL DEFAULT '1',
  `show_codes` tinyint(1) NOT NULL DEFAULT '0',
  `show_hints` tinyint(1) NOT NULL DEFAULT '0',
  `last_visit_date` datetime DEFAULT NULL,
  `query_size` tinyint UNSIGNED NOT NULL DEFAULT '10',
  `graphic_links` tinyint(1) DEFAULT '1',
  `pos` smallint DEFAULT '1',
  `print_profile` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `rep_popup` tinyint(1) DEFAULT '1',
  `sticky_doc_date` tinyint(1) DEFAULT '0',
  `startup_tab` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `transaction_days` int NOT NULL DEFAULT '30' COMMENT 'Transaction days',
  `save_report_selections` smallint NOT NULL DEFAULT '0' COMMENT 'Save Report Selection Days',
  `use_date_picker` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Use Date Picker for all Date Values',
  `def_print_destination` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Default Report Destination',
  `def_print_orientation` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Default Report Orientation',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_id`, `password`, `real_name`, `role_id`, `phone`, `email`, `language`, `date_format`, `date_sep`, `tho_sep`, `dec_sep`, `theme`, `page_size`, `prices_dec`, `qty_dec`, `rates_dec`, `percent_dec`, `show_gl`, `show_codes`, `show_hints`, `last_visit_date`, `query_size`, `graphic_links`, `pos`, `print_profile`, `rep_popup`, `sticky_doc_date`, `startup_tab`, `transaction_days`, `save_report_selections`, `use_date_picker`, `def_print_destination`, `def_print_orientation`, `inactive`) VALUES
(1, 'root', '63a9f0ea7bb98050796b649e85481845', 'Administrator', 2, '', 'adm@adm.com', 'C', 0, 0, 0, 0, 'default', 'Letter', 2, 2, 4, 1, 1, 0, 0, '2013-12-02 06:51:15', 10, 1, 1, '1', 1, 0, 'system', 30, 0, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `voided`
--

CREATE TABLE `voided` (
  `type` int NOT NULL DEFAULT '0',
  `id` int NOT NULL DEFAULT '0',
  `date_` date NOT NULL DEFAULT '0000-00-00',
  `memo_` tinytext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `workcentres`
--

CREATE TABLE `workcentres` (
  `id` int NOT NULL,
  `name` char(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `workorders`
--

CREATE TABLE `workorders` (
  `id` int NOT NULL,
  `wo_ref` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `loc_code` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `units_reqd` double NOT NULL DEFAULT '1',
  `stock_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date_` date NOT NULL DEFAULT '0000-00-00',
  `type` tinyint NOT NULL DEFAULT '0',
  `required_by` date NOT NULL DEFAULT '0000-00-00',
  `released_date` date NOT NULL DEFAULT '0000-00-00',
  `units_issued` double NOT NULL DEFAULT '0',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `released` tinyint(1) NOT NULL DEFAULT '0',
  `additional_costs` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wo_costing`
--

CREATE TABLE `wo_costing` (
  `id` int NOT NULL,
  `workorder_id` int NOT NULL DEFAULT '0',
  `cost_type` tinyint(1) NOT NULL DEFAULT '0',
  `trans_type` int NOT NULL DEFAULT '0',
  `trans_no` int NOT NULL DEFAULT '0',
  `factor` double NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wo_issues`
--

CREATE TABLE `wo_issues` (
  `issue_no` int NOT NULL,
  `workorder_id` int NOT NULL DEFAULT '0',
  `reference` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `loc_code` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `workcentre_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wo_issue_items`
--

CREATE TABLE `wo_issue_items` (
  `id` int NOT NULL,
  `stock_id` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `issue_id` int DEFAULT NULL,
  `qty_issued` double DEFAULT NULL,
  `unit_cost` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wo_manufacture`
--

CREATE TABLE `wo_manufacture` (
  `id` int NOT NULL,
  `reference` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `workorder_id` int NOT NULL DEFAULT '0',
  `quantity` double NOT NULL DEFAULT '0',
  `date_` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wo_requirements`
--

CREATE TABLE `wo_requirements` (
  `id` int NOT NULL,
  `workorder_id` int NOT NULL DEFAULT '0',
  `stock_id` char(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `workcentre` int NOT NULL DEFAULT '0',
  `units_req` double NOT NULL DEFAULT '1',
  `unit_cost` double NOT NULL DEFAULT '0',
  `loc_code` char(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `units_issued` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`area_code`),
  ADD UNIQUE KEY `description` (`description`);

--
-- Indexes for table `attachments`
--
ALTER TABLE `attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_no` (`type_no`,`trans_no`);

--
-- Indexes for table `audit_trail`
--
ALTER TABLE `audit_trail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Seq` (`fiscal_year`,`gl_date`,`gl_seq`),
  ADD KEY `Type_and_Number` (`type`,`trans_no`);

--
-- Indexes for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bank_account_name` (`bank_account_name`),
  ADD KEY `bank_account_number` (`bank_account_number`),
  ADD KEY `account_code` (`account_code`);

--
-- Indexes for table `bank_trans`
--
ALTER TABLE `bank_trans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bank_act` (`bank_act`,`ref`),
  ADD KEY `type` (`type`,`trans_no`),
  ADD KEY `bank_act_2` (`bank_act`,`reconciled`),
  ADD KEY `bank_act_3` (`bank_act`,`trans_date`);

--
-- Indexes for table `bom`
--
ALTER TABLE `bom`
  ADD PRIMARY KEY (`parent`,`component`,`workcentre_added`,`loc_code`),
  ADD KEY `component` (`component`),
  ADD KEY `id` (`id`),
  ADD KEY `loc_code` (`loc_code`),
  ADD KEY `parent` (`parent`,`loc_code`),
  ADD KEY `workcentre_added` (`workcentre_added`);

--
-- Indexes for table `budget_trans`
--
ALTER TABLE `budget_trans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Account` (`account`,`tran_date`,`dimension_id`,`dimension2_id`);

--
-- Indexes for table `chart_class`
--
ALTER TABLE `chart_class`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `chart_master`
--
ALTER TABLE `chart_master`
  ADD PRIMARY KEY (`account_code`),
  ADD KEY `account_name` (`account_name`),
  ADD KEY `accounts_by_type` (`account_type`,`account_code`);

--
-- Indexes for table `chart_types`
--
ALTER TABLE `chart_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD KEY `type_and_id` (`type`,`id`);

--
-- Indexes for table `credit_status`
--
ALTER TABLE `credit_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reason_description` (`reason_description`);

--
-- Indexes for table `crm_categories`
--
ALTER TABLE `crm_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `type` (`type`,`action`),
  ADD UNIQUE KEY `type_2` (`type`,`name`);

--
-- Indexes for table `crm_contacts`
--
ALTER TABLE `crm_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`,`action`);

--
-- Indexes for table `crm_persons`
--
ALTER TABLE `crm_persons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ref` (`ref`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`curr_abrev`);

--
-- Indexes for table `cust_allocations`
--
ALTER TABLE `cust_allocations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `person_id` (`person_id`,`trans_type_from`,`trans_no_from`,`trans_type_to`,`trans_no_to`),
  ADD KEY `From` (`trans_type_from`,`trans_no_from`),
  ADD KEY `To` (`trans_type_to`,`trans_no_to`);

--
-- Indexes for table `cust_branch`
--
ALTER TABLE `cust_branch`
  ADD PRIMARY KEY (`branch_code`,`debtor_no`),
  ADD KEY `branch_ref` (`branch_ref`),
  ADD KEY `group_no` (`group_no`);

--
-- Indexes for table `debtors_master`
--
ALTER TABLE `debtors_master`
  ADD PRIMARY KEY (`debtor_no`),
  ADD UNIQUE KEY `debtor_ref` (`debtor_ref`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `debtor_trans`
--
ALTER TABLE `debtor_trans`
  ADD PRIMARY KEY (`type`,`trans_no`,`debtor_no`),
  ADD KEY `debtor_no` (`debtor_no`,`branch_code`),
  ADD KEY `tran_date` (`tran_date`);

--
-- Indexes for table `debtor_trans_details`
--
ALTER TABLE `debtor_trans_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Transaction` (`debtor_trans_type`,`debtor_trans_no`),
  ADD KEY `src_id` (`src_id`);

--
-- Indexes for table `dimensions`
--
ALTER TABLE `dimensions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reference` (`reference`),
  ADD KEY `date_` (`date_`),
  ADD KEY `due_date` (`due_date`),
  ADD KEY `type_` (`type_`);

--
-- Indexes for table `exchange_rates`
--
ALTER TABLE `exchange_rates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `curr_code` (`curr_code`,`date_`);

--
-- Indexes for table `fiscal_year`
--
ALTER TABLE `fiscal_year`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `begin` (`begin`),
  ADD UNIQUE KEY `end` (`end`);

--
-- Indexes for table `gl_trans`
--
ALTER TABLE `gl_trans`
  ADD PRIMARY KEY (`counter`),
  ADD KEY `Type_and_Number` (`type`,`type_no`),
  ADD KEY `dimension_id` (`dimension_id`),
  ADD KEY `dimension2_id` (`dimension2_id`),
  ADD KEY `tran_date` (`tran_date`),
  ADD KEY `account_and_tran_date` (`account`,`tran_date`);

--
-- Indexes for table `grn_batch`
--
ALTER TABLE `grn_batch`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delivery_date` (`delivery_date`),
  ADD KEY `purch_order_no` (`purch_order_no`);

--
-- Indexes for table `grn_items`
--
ALTER TABLE `grn_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `grn_batch_id` (`grn_batch_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `description` (`description`);

--
-- Indexes for table `item_codes`
--
ALTER TABLE `item_codes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `stock_id` (`stock_id`,`item_code`),
  ADD KEY `item_code` (`item_code`);

--
-- Indexes for table `item_tax_types`
--
ALTER TABLE `item_tax_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `item_tax_type_exemptions`
--
ALTER TABLE `item_tax_type_exemptions`
  ADD PRIMARY KEY (`item_tax_type_id`,`tax_type_id`);

--
-- Indexes for table `item_units`
--
ALTER TABLE `item_units`
  ADD PRIMARY KEY (`abbr`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `journal`
--
ALTER TABLE `journal`
  ADD PRIMARY KEY (`type`,`trans_no`),
  ADD KEY `tran_date` (`tran_date`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`loc_code`);

--
-- Indexes for table `loc_stock`
--
ALTER TABLE `loc_stock`
  ADD PRIMARY KEY (`loc_code`,`stock_id`),
  ADD KEY `stock_id` (`stock_id`);

--
-- Indexes for table `payment_terms`
--
ALTER TABLE `payment_terms`
  ADD PRIMARY KEY (`terms_indicator`),
  ADD UNIQUE KEY `terms` (`terms`);

--
-- Indexes for table `prices`
--
ALTER TABLE `prices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `price` (`stock_id`,`sales_type_id`,`curr_abrev`);

--
-- Indexes for table `printers`
--
ALTER TABLE `printers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `print_profiles`
--
ALTER TABLE `print_profiles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `profile` (`profile`,`report`);

--
-- Indexes for table `purch_data`
--
ALTER TABLE `purch_data`
  ADD PRIMARY KEY (`supplier_id`,`stock_id`);

--
-- Indexes for table `purch_orders`
--
ALTER TABLE `purch_orders`
  ADD PRIMARY KEY (`order_no`),
  ADD KEY `ord_date` (`ord_date`);

--
-- Indexes for table `purch_order_details`
--
ALTER TABLE `purch_order_details`
  ADD PRIMARY KEY (`po_detail_item`),
  ADD KEY `order` (`order_no`,`po_detail_item`),
  ADD KEY `itemcode` (`item_code`);

--
-- Indexes for table `quick_entries`
--
ALTER TABLE `quick_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `description` (`description`);

--
-- Indexes for table `quick_entry_lines`
--
ALTER TABLE `quick_entry_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `qid` (`qid`);

--
-- Indexes for table `recurrent_invoices`
--
ALTER TABLE `recurrent_invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `description` (`description`);

--
-- Indexes for table `reflines`
--
ALTER TABLE `reflines`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `prefix` (`trans_type`,`prefix`);

--
-- Indexes for table `refs`
--
ALTER TABLE `refs`
  ADD PRIMARY KEY (`id`,`type`),
  ADD KEY `Type_and_Reference` (`type`,`reference`);

--
-- Indexes for table `salesman`
--
ALTER TABLE `salesman`
  ADD PRIMARY KEY (`salesman_code`),
  ADD UNIQUE KEY `salesman_name` (`salesman_name`);

--
-- Indexes for table `sales_orders`
--
ALTER TABLE `sales_orders`
  ADD PRIMARY KEY (`trans_type`,`order_no`);

--
-- Indexes for table `sales_order_details`
--
ALTER TABLE `sales_order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sorder` (`trans_type`,`order_no`),
  ADD KEY `stkcode` (`stk_code`);

--
-- Indexes for table `sales_pos`
--
ALTER TABLE `sales_pos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pos_name` (`pos_name`);

--
-- Indexes for table `sales_types`
--
ALTER TABLE `sales_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sales_type` (`sales_type`);

--
-- Indexes for table `security_roles`
--
ALTER TABLE `security_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role` (`role`);

--
-- Indexes for table `shippers`
--
ALTER TABLE `shippers`
  ADD PRIMARY KEY (`shipper_id`),
  ADD UNIQUE KEY `name` (`shipper_name`);

--
-- Indexes for table `sql_trail`
--
ALTER TABLE `sql_trail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_category`
--
ALTER TABLE `stock_category`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `description` (`description`);

--
-- Indexes for table `stock_fa_class`
--
ALTER TABLE `stock_fa_class`
  ADD PRIMARY KEY (`fa_class_id`);

--
-- Indexes for table `stock_master`
--
ALTER TABLE `stock_master`
  ADD PRIMARY KEY (`stock_id`);

--
-- Indexes for table `stock_moves`
--
ALTER TABLE `stock_moves`
  ADD PRIMARY KEY (`trans_id`),
  ADD KEY `type` (`type`,`trans_no`),
  ADD KEY `Move` (`stock_id`,`loc_code`,`tran_date`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`supplier_id`),
  ADD KEY `supp_ref` (`supp_ref`);

--
-- Indexes for table `supp_allocations`
--
ALTER TABLE `supp_allocations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `person_id` (`person_id`,`trans_type_from`,`trans_no_from`,`trans_type_to`,`trans_no_to`),
  ADD KEY `From` (`trans_type_from`,`trans_no_from`),
  ADD KEY `To` (`trans_type_to`,`trans_no_to`);

--
-- Indexes for table `supp_invoice_items`
--
ALTER TABLE `supp_invoice_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Transaction` (`supp_trans_type`,`supp_trans_no`,`stock_id`);

--
-- Indexes for table `supp_trans`
--
ALTER TABLE `supp_trans`
  ADD PRIMARY KEY (`type`,`trans_no`,`supplier_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `tran_date` (`tran_date`);

--
-- Indexes for table `sys_prefs`
--
ALTER TABLE `sys_prefs`
  ADD PRIMARY KEY (`name`),
  ADD KEY `category` (`category`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `type` (`type`,`name`);

--
-- Indexes for table `tag_associations`
--
ALTER TABLE `tag_associations`
  ADD UNIQUE KEY `record_id` (`record_id`,`tag_id`);

--
-- Indexes for table `tax_groups`
--
ALTER TABLE `tax_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `tax_group_items`
--
ALTER TABLE `tax_group_items`
  ADD PRIMARY KEY (`tax_group_id`,`tax_type_id`);

--
-- Indexes for table `tax_types`
--
ALTER TABLE `tax_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trans_tax_details`
--
ALTER TABLE `trans_tax_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Type_and_Number` (`trans_type`,`trans_no`),
  ADD KEY `tran_date` (`tran_date`);

--
-- Indexes for table `useronline`
--
ALTER TABLE `useronline`
  ADD PRIMARY KEY (`id`),
  ADD KEY `timestamp` (`timestamp`),
  ADD KEY `ip` (`ip`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `voided`
--
ALTER TABLE `voided`
  ADD UNIQUE KEY `id` (`type`,`id`);

--
-- Indexes for table `workcentres`
--
ALTER TABLE `workcentres`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `workorders`
--
ALTER TABLE `workorders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wo_ref` (`wo_ref`);

--
-- Indexes for table `wo_costing`
--
ALTER TABLE `wo_costing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wo_issues`
--
ALTER TABLE `wo_issues`
  ADD PRIMARY KEY (`issue_no`),
  ADD KEY `workorder_id` (`workorder_id`);

--
-- Indexes for table `wo_issue_items`
--
ALTER TABLE `wo_issue_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wo_manufacture`
--
ALTER TABLE `wo_manufacture`
  ADD PRIMARY KEY (`id`),
  ADD KEY `workorder_id` (`workorder_id`);

--
-- Indexes for table `wo_requirements`
--
ALTER TABLE `wo_requirements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `workorder_id` (`workorder_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `areas`
--
ALTER TABLE `areas`
  MODIFY `area_code` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attachments`
--
ALTER TABLE `attachments`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `audit_trail`
--
ALTER TABLE `audit_trail`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `id` smallint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `bank_trans`
--
ALTER TABLE `bank_trans`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bom`
--
ALTER TABLE `bom`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `budget_trans`
--
ALTER TABLE `budget_trans`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `credit_status`
--
ALTER TABLE `credit_status`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `crm_categories`
--
ALTER TABLE `crm_categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'pure technical key', AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `crm_contacts`
--
ALTER TABLE `crm_contacts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crm_persons`
--
ALTER TABLE `crm_persons`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cust_allocations`
--
ALTER TABLE `cust_allocations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cust_branch`
--
ALTER TABLE `cust_branch`
  MODIFY `branch_code` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `debtors_master`
--
ALTER TABLE `debtors_master`
  MODIFY `debtor_no` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `debtor_trans_details`
--
ALTER TABLE `debtor_trans_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dimensions`
--
ALTER TABLE `dimensions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exchange_rates`
--
ALTER TABLE `exchange_rates`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fiscal_year`
--
ALTER TABLE `fiscal_year`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gl_trans`
--
ALTER TABLE `gl_trans`
  MODIFY `counter` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `grn_batch`
--
ALTER TABLE `grn_batch`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `grn_items`
--
ALTER TABLE `grn_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `item_codes`
--
ALTER TABLE `item_codes`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_tax_types`
--
ALTER TABLE `item_tax_types`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payment_terms`
--
ALTER TABLE `payment_terms`
  MODIFY `terms_indicator` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `prices`
--
ALTER TABLE `prices`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `printers`
--
ALTER TABLE `printers`
  MODIFY `id` tinyint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `print_profiles`
--
ALTER TABLE `print_profiles`
  MODIFY `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `purch_orders`
--
ALTER TABLE `purch_orders`
  MODIFY `order_no` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purch_order_details`
--
ALTER TABLE `purch_order_details`
  MODIFY `po_detail_item` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quick_entries`
--
ALTER TABLE `quick_entries`
  MODIFY `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `quick_entry_lines`
--
ALTER TABLE `quick_entry_lines`
  MODIFY `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recurrent_invoices`
--
ALTER TABLE `recurrent_invoices`
  MODIFY `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reflines`
--
ALTER TABLE `reflines`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `salesman`
--
ALTER TABLE `salesman`
  MODIFY `salesman_code` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sales_order_details`
--
ALTER TABLE `sales_order_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales_pos`
--
ALTER TABLE `sales_pos`
  MODIFY `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sales_types`
--
ALTER TABLE `sales_types`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `security_roles`
--
ALTER TABLE `security_roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `shippers`
--
ALTER TABLE `shippers`
  MODIFY `shipper_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sql_trail`
--
ALTER TABLE `sql_trail`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_category`
--
ALTER TABLE `stock_category`
  MODIFY `category_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `stock_moves`
--
ALTER TABLE `stock_moves`
  MODIFY `trans_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `supplier_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supp_allocations`
--
ALTER TABLE `supp_allocations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supp_invoice_items`
--
ALTER TABLE `supp_invoice_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tax_groups`
--
ALTER TABLE `tax_groups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tax_types`
--
ALTER TABLE `tax_types`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `trans_tax_details`
--
ALTER TABLE `trans_tax_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `useronline`
--
ALTER TABLE `useronline`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` smallint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `workcentres`
--
ALTER TABLE `workcentres`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `workorders`
--
ALTER TABLE `workorders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wo_costing`
--
ALTER TABLE `wo_costing`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wo_issues`
--
ALTER TABLE `wo_issues`
  MODIFY `issue_no` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wo_issue_items`
--
ALTER TABLE `wo_issue_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wo_manufacture`
--
ALTER TABLE `wo_manufacture`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wo_requirements`
--
ALTER TABLE `wo_requirements`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
