Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E493CA1015
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 19:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bW1yhK8B6z5onyJWCdzz1MdADZW8et6P9G498R7//Vw=; b=LYid5+TzP/rwAG9056scY8htog
	fNiIH9BUM1NqEvKQqc0yjeAdC1mgH32Y2odOGz/56yLlJPqS7Ilz3QsmCP9nMZQu4lF17qKAbA4R6
	ULPDXavq8s01ODHsa1oKVI32Fb1DNRlQXsD2eiUgP4z/mUnLWOeY7r6Bz0Da2rdAGMf3VbQh056XY
	0dgUxkHeTJYVOb0pMvV2UYVTz6iZWpKlvs5oKhEzd2BHBQR5qWnIsDS6RP/2mbumaoBqvIXbL8IhH
	5Rv5xvIZwEgjlLAmAlsUkOs5M4Yne3cU9NFnPP/XnFbIq7jYWF0Fhtj8GQGev/JSXNR03laixB8w8
	QWhhcNXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuFzM-0000000E141-1zVk;
	Thu, 04 Sep 2025 19:51:20 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuAsc-0000000CBdZ-1nQs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 14:24:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KoMvocSZcyVgfLNWQwgMlw/Tt00FJNm5YoCimNCtUpGq0R43Ti97Em9GAR6/OLkcu4KQ6jJ80051zWtNV1NxcFmW0MvESTONi/OQmQKhNycn5yQxXTRUAeAECE9izRUNZGKA1CFOYlvACV+K9jAsskqs68RWFZa3ad+NJiBQWrQBLPR2mP/2zV06pLKjxjySBRWzUUkHIql/yTcAqfgO5nWynIM0B96sJUlUKvoLK7902uba8HvWKyFQo79p2M6cmYMidNZ+VTx/af0/YBo1U3m+dMDtDi4BnSHzegEvh47zeTQo4pUBNvpGlqfuvDtMbhn8Zh6UNdEDsdqH0EhtTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bW1yhK8B6z5onyJWCdzz1MdADZW8et6P9G498R7//Vw=;
 b=j9s8+jl1wRMcBmIhV2cPo/bQzWknvSPi8p18DEdHhMUsDg4SQZ1qt2GPrJwvhoCVvdBtUpER5M2Iwx3roF6pwEAdwXXxlaFUIf4RJB96D//LjhJFYccfYAnIn4V4kCRLW4VMG/q11vgiSrbC9M5+A1PhO2joJ4nwVGOldgTL6wRzycuYwLlp40qhICTFnrYRJHHF7MZY9nXGDilR1ovoslr4m4Kmjhpqamsm1v9fX3kJ1AuJj0xNBvrwsocLZXah5GPiFZpHuP3f/2mOfAa/3RF2JEkkqI2s12f+TBJHcpH2N/+hJa2zG+p51up8kUwVHneskmVFJ3ZCPttTOz56dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bW1yhK8B6z5onyJWCdzz1MdADZW8et6P9G498R7//Vw=;
 b=bqymQPYLpifEjL2EI85ioNLXXgCBoO1fjqOF1MI4JruUIuNuBNPhfWh2cUXRnurnfSfxzgQMJrSfe+JGlVsQ15bWl9rXbZry17e2ZhvFQP1zWC2Ug/QCV09Vt296CmFgMQ7+Ud6cO3wIuRohIAlFvksC/c2eAR1TL3tutiP0XManayaT3NwKTT1hIbhFup1qdu1VAse5/d4a+PMvmAa3I2lb/wgncbj8NG2+nLVE45hXDF7l6g6jd5GLA6qQelO7Xx5GhFB4HM1g+jjqXSO1iXgebVbhlupl0kP2jNxbgRSRSm6DpuRvHBapRb2QN6Mi1Ub4SRffdvVwK7ryJIwRNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by PAVPR08MB8992.eurprd08.prod.outlook.com (2603:10a6:102:325::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 14:23:55 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%4]) with mapi id 15.20.9094.017; Thu, 4 Sep 2025
 14:23:55 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andreas Gnau <andreas.gnau@iopsys.eu>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH RESEND v5 06/13] spi: airoha: fix reading/writing of flashes with more than one plane per lun
Date: Thu,  4 Sep 2025 17:23:32 +0300
Message-ID: <20250904142339.656346-7-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250904142339.656346-1-mikhail.kshevetskiy@iopsys.eu>
References: <20250904142339.656346-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0047.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::15) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|PAVPR08MB8992:EE_
X-MS-Office365-Filtering-Correlation-Id: 38af31ee-52f9-45a6-f5c6-08ddebbeadd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fDtcw9B85EoZ7gE+5DYy8PNjaAEt6XyWYcBFnvesdjZiSSxOpK8PO4j5g5rk?=
 =?us-ascii?Q?4KlBjzEnf9qFy1sSfSbWmB+K3d9udC2ADULhDhfzqr+LPuC77cVDQ57R8Kt4?=
 =?us-ascii?Q?l/oTDgzgtYRVEAYyoXOxVMJ6drJafN0YmuKSz38VDwv2qhptfbrffey0pozH?=
 =?us-ascii?Q?mi3/lZYAHv27r9sbn3tkVbYpZtW+KYLgJGdbrB/xasfZJCNSKFvVeAnUZJ/u?=
 =?us-ascii?Q?B8aoDWp2dPFiOGn1v2ZvvLF+H2bR86QyPpDeYkePbGpuqJUG6XH8LkKIOCaa?=
 =?us-ascii?Q?9nUAfAovxktVDyigafF6fXyewRowZUBqhGvgUVSNMVid8/+bMHdCYj/zzHHn?=
 =?us-ascii?Q?sNPGp80mCRCEvY+Iti43J1547v6Ukb60mVhG4a9r6q58oYDBiZ7zEn5MGEUV?=
 =?us-ascii?Q?fRPUCDgGTc9fgOyDfMQhB+n0M1POlsxipeeLfErCsvw6LCU8g5sL7caCb5WI?=
 =?us-ascii?Q?krGcXEGhvGXU+sp1f6IONEPQiRRN34YiwXOrEMYXkEyrpQiVMkSzx+WdDRQc?=
 =?us-ascii?Q?CVL7xieMW6eeEnDJNO09MV3p0V9wSW508+leDG0VEWChzmT5GdCt/bmXbAoQ?=
 =?us-ascii?Q?x7SiIJzYZxpi72nPGlcbDBdqZM8JH0q4g2Lt2M3Wpi1046eS2T2l3GDeQLzI?=
 =?us-ascii?Q?MlJ8EkWUCG6Aqa4/yztgEVYSMvkvBrHD5HNvpmRsoDlCwEnwwAc0+YDtFQXD?=
 =?us-ascii?Q?yPDSTYF6TNnXj9juIJlbvDRB0qHkmiNhn8IH3neW2OLbbplCOL0pjQBgPMM/?=
 =?us-ascii?Q?INlXS1139DPpjMCvZ1o8/PWQ3mVpgufj50BXRvx8i9k2otRBZcMx6PPXkF2y?=
 =?us-ascii?Q?QXAvYeJvd+6DekfT89wxHCtIVeilrOKg8EU+lZUrSNmM7aObI4zRJungHSsY?=
 =?us-ascii?Q?i41tcBp4E5+ZSS+St6vjqXo/PXCUdjM4U6cEmNsHUF2xPyNlvteZA+EQ+RmG?=
 =?us-ascii?Q?7LltG9AoK6D/l+lDDmr+b19OS8JIoHOtSNZDq2LPtN/c/3JBvvlFqzOheZ6q?=
 =?us-ascii?Q?gyw++l9n7fgoog5L2heVewZ3/Xv5UjEVbVtDXyBblNb0NafLCyGlGTdlqe1o?=
 =?us-ascii?Q?VyXxCn6iGIkvPmkDIN6RVXOukKABYfobKlm1j++CY6EYu3zTbpt/3WdXRn+M?=
 =?us-ascii?Q?23rsdoHI89rkQUUoIhR6OFQeCMezYmDQ2cSHojCSsp6jDR+lFo2m0FKXVXcg?=
 =?us-ascii?Q?PEOamFIZWUSmkmWwUFx+t1g22SonDD5eK/SE8U06+0q3GtnhaUQPkZzZcvcJ?=
 =?us-ascii?Q?s9nCpKMsWuPK+djH5qGvwn2RD5Alq+KD1I/3U9FrGgKHdTOHT8Vk9kZAqM25?=
 =?us-ascii?Q?hq9BhkAO3TI3TU6CoCQn6wcgRWwTmo7zaVJnYvRZHemca9hn0A/hsZ+eT9Dg?=
 =?us-ascii?Q?AqwtKOCoDV0uq34pohP0/uUyjwiwbglGaauNbVXUCe2n2eAMu4BUsAezn2BX?=
 =?us-ascii?Q?BZWMm8N/NpmphQUFv25oECtMpB/TTYCzfSjZLpBHQH7YM2svs0uW2w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?59oVPBfKXNz6i7ll8+v6z9RTghUQ7bVmpcqNCc00KxdecZVW3zPcz1erDQtm?=
 =?us-ascii?Q?yblp89PO0s0hrmptwsFIRPTbbdqqDzbOuK9L9+p0RTVTn9bQ2VfBDRLV0b/A?=
 =?us-ascii?Q?c/Gj3CsiRshSoaDu62VTJwjqwBYdvqu3km0+eAo19ourOtlEDOTEgHOYmAwm?=
 =?us-ascii?Q?1HslfjUFikjD5/fViWy1lXFb5+43VJX4I/K9uus3ohtWddM9Q0unIJZcVqI8?=
 =?us-ascii?Q?2tT2rruIXK3P+ex8PWyLvmEvRBhFxOcRQeID7OpX535ZnZYZHKKoQVX04Zul?=
 =?us-ascii?Q?cqakalX6sMDIMm53q1SAkRZHeGa9KnosEJ4ANin0e7K9Ef3odrIW4RtjUWC6?=
 =?us-ascii?Q?QZBrt1JgjeDKsv1Kh51xrjNvZrfoxVLmLsHrTXQUoSQz2gT+a+k/N6E9EUE3?=
 =?us-ascii?Q?WaWTHxLozS4mt1reVtbXox1zrVkASszhzPXjvPOPCus2faAItTEGymK3kq1E?=
 =?us-ascii?Q?nwe3jRieOBptW2wlwCi1/yLj8UhOX7HoagvzMTRNMXA05M989HVHxiU1lXJk?=
 =?us-ascii?Q?fvW+S5o46nq0bVbueFHnx947mr7VhzDQ6FwGcXmLEGXketSNITGQfzS73PIf?=
 =?us-ascii?Q?uvjeLRObQvyySOh6LpuZfpqvgkwwIoB/QfUQqneLRxd47iPe3GTlVNuncb/X?=
 =?us-ascii?Q?fYaN2LDRKF6HWYRxx3uLVirP2aSDn2TiFxdMcln0U5m8aDue0/J53uXk4JzT?=
 =?us-ascii?Q?cK+Dpn6ZUrmjwGM1/uuYZThb+Me5bViC0XqjNGhiusTEijqY8qSZdOafJYOo?=
 =?us-ascii?Q?/N14NDdfCCii8YOCSeJ3mNjRJhbkZ3jGUPMFkpSwkvp/xgfY8OnRfTGXE7W2?=
 =?us-ascii?Q?wR5U05XxsruAOXQLD915RCpc0LkUWlTxz11fZd6P1JCnK5/60USmq39ZG+5K?=
 =?us-ascii?Q?moh6lCSd5p+g8GgmzDTT7rYI8li3JDPfMDvAil/wdxp0lxsOaMri5Wf5ymvV?=
 =?us-ascii?Q?gdKISXP8OQ5pEa0109GKvyt6l7mP29aoBwj0nx1fQ6RoCPPF17SDfWbjWMVl?=
 =?us-ascii?Q?K+JgHlxn/99OLrDHSlpQgyt6wjFWMERCzRiCNodTQh28tOOPvjE6yUpGMtAm?=
 =?us-ascii?Q?tncOj2wBIAm/koBtIc5dbyxQsFbTs5KTQ8xZMigK9XVem4zHRryt9SDFd4M/?=
 =?us-ascii?Q?h/j1+gtCVusigMeaN+shVsI0pmFyz4tzV54ESzhuMluwv6cfy9sICHpGzHW+?=
 =?us-ascii?Q?5Ebz+KMrCYzUtLPyG2iT2dEQTp4r1/vtjo0WzwjNCZC2HvHiMVg53p4jclEy?=
 =?us-ascii?Q?NiMCIT57Yih6RZQKX3oDxyJzSU65XpT0uZqkTBNv7HoU74gcCwMRna0jNvVr?=
 =?us-ascii?Q?IVpqqWqxhQEnsuoZ0iUwon0M6vbFr7CwpQrbg005WCD/OCbx8SAZqQQMwgXn?=
 =?us-ascii?Q?7MEPgsgbZeEIKNPqIqtYJXLt9cnhoon2wdv8YoJdWh3LuKPkaHbmU1+2ZsFK?=
 =?us-ascii?Q?k15V3Z/RxpPDxl/jT2C/ZPZkxA57F/+XnXkkjsYeS7EbOqzQj5O8hEmHd35s?=
 =?us-ascii?Q?CrEN80RQu6gKjzL2G9rzjtzHcGN6BFDFhA5EQ/8BZKqpTLgkalsSGroDt6FO?=
 =?us-ascii?Q?6VyBg5QkajdIjGKYGkypjX8ce6cLdq/b60ufzGzmvfCXkk0vJwrPnQoMeHd0?=
 =?us-ascii?Q?mC14Ae/1jquUcjAXjc4eIr0=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 38af31ee-52f9-45a6-f5c6-08ddebbeadd0
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 14:23:55.1565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0vCnU60hSER+9DGzcDoVAGEnGKTmf9DtXwDhXiY45X2Bjy6aWIgU2lFCzJCH3REt/2Jw/zRCcw1ihpVbdjRiS9I/d7Dr+903hoSlT9UXpZc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8992
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_072402_472019_FCE43E77 
X-CRM114-Status: GOOD (  15.71  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Attaching UBI on the flash with more than one plane per lun will lead to
the following error:

[    2.980989] spi-nand spi0.0: Micron SPI NAND was found.
[    2.986309] spi-nand spi0.0: 256 MiB, block size: 128 KiB, page size: 2048, OOB size: 128
[    2.994978] 2 fixed-partitions partitions found on MTD device spi0.0
[    3.001350] Creating 2 MTD partitions on "spi0.0":
[    3.006159] 0x000000000000-0x000000020000 : "bl2"
[    3.011663] 0x000000020000-0x000010000000 : "ubi"
...
[    6.391748] ubi0: attaching mtd1
[    6.412545] ubi0 error: ubi_attach: PEB 0 contains corrupted VID header, and the data does not contain all 0xFF
[    6.422677] ubi0 error: ubi_attach: this may be a non-UBI PEB or a severe VID header corruption which requires manual inspection
[    6.434249] Volume identifier header dump:
[    6.438349]     magic     55424923
[    6.441482]     version   1
[    6.444007]     vol_type  0
[    6.446539]     copy_flag 0
[    6.449068]     compat    0
[    6.451594]     vol_id    0
[    6.454120]     lnum      1
[    6.456651]     data_size 4096
[    6.459442]     used_ebs  1061644134
[    6.462748]     data_pad  0
[    6.465274]     sqnum     0
[    6.467805]     hdr_crc   61169820
[    6.470943] Volume identifier header hexdump:
[    6.475308] hexdump of PEB 0 offset 4096, length 126976
[    6.507391] ubi0 warning: ubi_attach: valid VID header but corrupted EC header at PEB 4
[    6.515415] ubi0 error: ubi_compare_lebs: unsupported on-flash UBI format
[    6.522222] ubi0 error: ubi_attach_mtd_dev: failed to attach mtd1, error -22
[    6.529294] UBI error: cannot attach mtd1

Non dirmap reading works good. Looking to spi_mem_no_dirmap_read() code we'll see:

	static ssize_t spi_mem_no_dirmap_read(struct spi_mem_dirmap_desc *desc,
					      u64 offs, size_t len, void *buf)
	{
		struct spi_mem_op op = desc->info.op_tmpl;
		int ret;

// --- see here ---
		op.addr.val = desc->info.offset + offs;
//-----------------
		op.data.buf.in = buf;
		op.data.nbytes = len;
		ret = spi_mem_adjust_op_size(desc->mem, &op);
		if (ret)
		return ret;

		ret = spi_mem_exec_op(desc->mem, &op);
		if (ret)
			return ret;

		return op.data.nbytes;
	}

The similar happens for spi_mem_no_dirmap_write(). Thus the address
passed to the flash should take in the account the value of
desc->info.offset.

This patch fix dirmap reading/writing of flashes with more than one
plane per lun.

Fixes: a403997c12019 ("spi: airoha: add SPI-NAND Flash controller driver")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/spi/spi-airoha-snfi.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-airoha-snfi.c b/drivers/spi/spi-airoha-snfi.c
index a39c3ab4af5c..5ad3180ac6da 100644
--- a/drivers/spi/spi-airoha-snfi.c
+++ b/drivers/spi/spi-airoha-snfi.c
@@ -726,8 +726,9 @@ static ssize_t airoha_snand_dirmap_read(struct spi_mem_dirmap_desc *desc,
 	if (err)
 		goto error_dma_unmap;
 
-	/* set read addr */
-	err = regmap_write(as_ctrl->regmap_nfi, REG_SPI_NFI_RD_CTL3, 0x0);
+	/* set read addr: zero page offset + descriptor read offset */
+	err = regmap_write(as_ctrl->regmap_nfi, REG_SPI_NFI_RD_CTL3,
+			   desc->info.offset);
 	if (err)
 		goto error_dma_unmap;
 
@@ -860,7 +861,9 @@ static ssize_t airoha_snand_dirmap_write(struct spi_mem_dirmap_desc *desc,
 	if (err)
 		goto error_dma_unmap;
 
-	err = regmap_write(as_ctrl->regmap_nfi, REG_SPI_NFI_PG_CTL2, 0x0);
+	/* set write addr: zero page offset + descriptor write offset */
+	err = regmap_write(as_ctrl->regmap_nfi, REG_SPI_NFI_PG_CTL2,
+			   desc->info.offset);
 	if (err)
 		goto error_dma_unmap;
 
-- 
2.50.1


