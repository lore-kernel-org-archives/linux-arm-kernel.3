Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6628FCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 00:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C5URRzs2ii0/hlIQnyjv8OTdhueSH9pR7nTLvTrFBpY=; b=vJob4wsGkyzdspJj90DmuHcTlE
	X7UutdxCUwLB750kItt5YJTIeFQ7JWw4DHC+Kdo9GFbaLKN94JXIfaFiMtq/nGbQhvuD/K/iCHohK
	GvYrXUHzcLyw+pwM2lki+XHf7KLof9i47uqOGZQnDL/pD0jyk50XtHfbXBNFZs0DmK29tmSYMsUJB
	vreIL2mejJUruBC2NcqQ3nXfNnPk2xEoEMd7MrDMoncrlDSMyGoEJhwP3hOHi2dvap0Tu915Di3F5
	f9m5meYFyG8xleNfDmem3Lq5ku6SCOTh5rrOcFbfmxSYcxR3CWbivW6cawNl6NaswE+gtFHQZpwTM
	GfckHhaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umiJu-00000000trk-0ZOo;
	Fri, 15 Aug 2025 00:29:22 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umh7Z-00000000lW6-3BRe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 23:12:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jucQqBzi43J80IodEzGVYf9X5c3W69ZGkvv3VmrPh4tZVu7n6d+JHkdvs2tHHOO2ES+ea0yx7uCw1SRFE06fkB4oEcoukTq0yKkfJ93f17yCNSBpFf1czdYASqclHtDF3tj7G2SYMv2sQARmOqKWfbHxyD5bOlwVtoUHZWxVuPAo6aI0l3uIEhzP5CNTP7RTDGX30FRwW13UDfvuaTfbVokoP1roIWzXb3SY4GdzmA6xf3EEBOH4G9ZT7MtVBnRS6Ge6N9wiUbj4z61SG2WC6Gch6Zs7jVtQcJf1+c9eeOfO5tv0RNgjz4ZaFQmKQGtLAyk8US2IlRiSQircc+Ow0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C5URRzs2ii0/hlIQnyjv8OTdhueSH9pR7nTLvTrFBpY=;
 b=RWwXp2jnUj1OEMya9cRmXF+VKd+PbW/NpJJf/06wyNSDsdR/6rU4tlz+cOWW5zwxQaqeiHx+pDXQ/VfNHb1xMstHJkbanv8bB15RtTJ/mMXjYy5khkZM0vYR6o8QtsgJAx69/Sf7uBbsQ6bB9qT+FmzPTGl/Ncvb94huFp6rhgicnY/kR+76CaSfky/2ShZBi80WGjulFnfPCdKFj4znpmAN6wdMPxfT+9s8h77wajlxGKIdl/pqYUZk2ATW76Zq+AkNEBITO5xCWd5znrODFghLrdttW5B6tSFTm/Pl3fX1UXGHL7BSORjdzABmM59/JqS5vvZJiCKgPFVmCtYgwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5URRzs2ii0/hlIQnyjv8OTdhueSH9pR7nTLvTrFBpY=;
 b=G6Nurrfs0Xf2xcl+77EqGlk9XUYYM9HqSJbQJLkIvfn7YBNwXqUh8RXJo3K7iktLhPP42IjHJoaQO1XZC00ZC7nNRTV49fBs61QwUywJMCIHg4H5r1qhAeyuUicQnWhFefrPfklMCNCfVi+osr0eBRxlICF2uSe7p6+tenTpvMrs6RHCFe5Pf/JtomYIx+zuJe46EZjZd8UEkIlPMK8Y6yw3aveqBySSZuIwK/ySdiwYbATzI8GMDnGiuoMam3lzAJUgDvFXS/UHoGu+PPMOuwXRSWti1Sf08+bx3QCNEyq2ZRZmMnDmyESb9EJ03s94KMyPn1KdCUfHv9XewFKT4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by PA4PR08MB6032.eurprd08.prod.outlook.com (2603:10a6:102:e4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Thu, 14 Aug
 2025 23:12:24 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%4]) with mapi id 15.20.8989.018; Thu, 14 Aug 2025
 23:12:24 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH 07/13] spi: airoha: support of dualio/quadio flash reading commands
Date: Fri, 15 Aug 2025 02:12:04 +0300
Message-ID: <20250814231210.4174427-8-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250814231210.4174427-1-mikhail.kshevetskiy@iopsys.eu>
References: <20250814231210.4174427-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0190.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::15) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|PA4PR08MB6032:EE_
X-MS-Office365-Filtering-Correlation-Id: 7eee35d2-d22a-47c1-37e7-08dddb880751
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1OYXNlF9aTcJ3+sVw2yBXEjE9/FATQS/H3Em7D5N8y+16R5eUy5H1YWvkpNO?=
 =?us-ascii?Q?P9Gb1qAgm+Z4BmAMd66Yry5ljL8k39KhkS7xz/S2girR+wdaOBNfu4Tzb2s8?=
 =?us-ascii?Q?FlJxilZ8MBNlHRblvf8MpSOSs34Q5XJ12W2pXbwCLahSN4IRH6u5WlLousU/?=
 =?us-ascii?Q?C6sPfwhfFDRA9+V9XlN6a0S+Nt2kKPW/An2GErBVLa2UVP4d0CfXT8fGYeZF?=
 =?us-ascii?Q?9WFBmbJ8fElXF/cEPjO2gonZqJzltwsAQ9scvkDdmV3mQ3OjR1oyY09vXIKM?=
 =?us-ascii?Q?dT5B1yi1gn+hXtnJBQfMhF1s42WC7g2fNMCR34MA79U/HGgNmXgXxEvhAA3R?=
 =?us-ascii?Q?ENw9KFo0V4DyzUbmKtL65Au4BhfVx5zts5Ao5L0GsLPPkV5srl/MBPJWkDMm?=
 =?us-ascii?Q?SFSII53VSajncq4cXZ1UFyl/xh2ocV244Pn9lPGHKciQAvBzxaKbwjj/kEu7?=
 =?us-ascii?Q?qhkKy44x+Up2QcKxoB5z5NomldZpJDNI76dq05Kg7lBZUSkywkoRYXX2fcz3?=
 =?us-ascii?Q?M+Vt3XxfAOCEzqp1CVUPU7sgw7fsAoy5XkIr8rjlOYBkQeKHv65u1dea5WdR?=
 =?us-ascii?Q?MRY3ITLUe5tGuzpp5gFF97XhzrUbYc7cFx0b0gTItU1bgXWIWyDPUmJARKDE?=
 =?us-ascii?Q?fuiFh+PnpOMwATSCGBLyEoz2fm2g28WOL1l/Jge+ipRygL33bBx/bZFiDeA7?=
 =?us-ascii?Q?AKupTLLw0Uz+8raEbK63W5IFcPYMwEP9Keoe7Nc/xmxX/RNuG4Busc54ln5Z?=
 =?us-ascii?Q?PjV0bj9WglHZORjTqAaS8MmEXgW5ufL8X/NO4EUlAvVSm8m/AkPC3qPXvgko?=
 =?us-ascii?Q?HVr9i+nf/OBC4djDJQioEmF773YcLMzCtmCajbidNdp8S0Aw+SUATOK0FCB6?=
 =?us-ascii?Q?oMoeVr226ec+Jg4cD38gOfT1kJrBQIosvoQjWb2bMYczvvyclHGnaDkRkSIy?=
 =?us-ascii?Q?9d7DSQguze0p8MgjHJQbC2Z41j78lZH6kyC7MqmrS78gc2DtYU8c5tR0GkzS?=
 =?us-ascii?Q?5ON4tU5qNO0hu/59UBqQzyKhIzWN3dRFDEACeqUaBoCy7hLcED7FCfcFk7tP?=
 =?us-ascii?Q?M5FYQh1uJwCVXbIOJvTyfBfi96Viz1XBl/tD0GlfkTTI08joH0pEvekg6naZ?=
 =?us-ascii?Q?zNQyadM0zDOmuto9aJFUJKuO8P2zoG4eY1CmjS6Wn/9xNhCbjsy3Z6VY1VQG?=
 =?us-ascii?Q?Y/w+dNP7BMhsaV6wlZ/XD7TJs6bP9P/XqWLcT7s5n0s0AqrABxdd8+i6TxcX?=
 =?us-ascii?Q?inRs7z4cQaP/5NbXBGJNx8nAcuTSGMBnQ700cYGjDHuaP8WjQoUZ/oJL8554?=
 =?us-ascii?Q?F071fH4ghyq3TlJrQrRZIhrMtVBqD6Zc2FBDscn07IkUtBr23to6sos6vb7p?=
 =?us-ascii?Q?u9eB+tKnpN5GE5xOz1cJN02m9xJVkycl7hPz2wqe2jt0ZaOpfCr9qgY5XJkV?=
 =?us-ascii?Q?yVnRAhTVoEYftEPVfvBcdqlJUYHbDDDhKhlI4BDx0ujmWP3fbUEAqQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f6CjGhxjHc+Jca6qEqSddoWhFTgOaMsUCtCtKpzXh1CWHSS/OA6lIhh6U89H?=
 =?us-ascii?Q?Tnq+AxJl0nosh6fb7SSPZGvJKIOGmunuE+ubWksGvczh09mNPQ29/Iz5a4/z?=
 =?us-ascii?Q?LBEFW9iLRBnKXipnguQw6tsi/3OXtGorT6ZnnNdmgNsgydGI+GJG866qpmPR?=
 =?us-ascii?Q?mCm9oN9fnpKH3bIj+1hk9ozwNpmEvS2iB2dtKffG+sDCLt7hcDMnlZr9oQoQ?=
 =?us-ascii?Q?0ootKkuoS4cPvlsSpSTnewt3wVSGgr5VqXUndOd0w5DjvkYVcoTHs8clM1EP?=
 =?us-ascii?Q?LaX5v5UFfgeE2I8tAVrr923RPMgK70yf8d+G4z8RuH6jJhJcq6dSu3/tGV8Z?=
 =?us-ascii?Q?7vGI9zGL54WdJcxU9DEoopVYlPzeqefMSD3oFYiPTUvofuA/lhKrRnKrMPqC?=
 =?us-ascii?Q?V70K+G7czOZ4eISyHLTZC0jCm2FzRAwTNWmbKhf1YV3C2poyBfyCuR0XIvAA?=
 =?us-ascii?Q?xeR2lrt1DANyDuHixEp1b4ISiscLn5FP+mgM4mYKaikap9P31HxLs7yBczet?=
 =?us-ascii?Q?Hz/StkiENvkXn/iUSH8PvfLu8Qt+wVZXW3mvi8kMiuQQ/TJy1NapDRMuyWDE?=
 =?us-ascii?Q?0bmT4Ow3OduaH5Q9yiri+dyZjPe1pVf3Gg5+1EmxtWIzp+uDFG3Zq1C22UIf?=
 =?us-ascii?Q?wvtYS3X2gXDdvVLgQPLsHPjKJVmbRMVtl5EgmJrKxbXxujUCU/s70ma91UIJ?=
 =?us-ascii?Q?+X3tcNwV31Os7pzSfAy7uzfQSeLBek0FsfTHZiOjoEcL4DNvyXlJI+LYymg3?=
 =?us-ascii?Q?ZSkl/Gw77J+71zVQqHlIYvufktDTSV6l5SPHNSVvFcQY2WKOqykgkewxKfI7?=
 =?us-ascii?Q?FFckKApqvGnvJQpSy90nidDvqqxBRRnUogYfi+pmGwhb9k2jdwNLX5GbE1iP?=
 =?us-ascii?Q?ImbUXxBjwYx2FV4GuLrOBS3nlkDlaOz8WswcGFb+hF/DUUGkHY0LLyoLRC3L?=
 =?us-ascii?Q?ME3/WeFEL714D4iT8VMjQW+cyK1aF/qftf4/cXj5rz8gFa6fZwpZKMQ6knDf?=
 =?us-ascii?Q?4fDSl17DIQlLOGcVF/faRV+xnIWQ07UCHzje+O8PrAz/GWxLyeCqsbqMyFdm?=
 =?us-ascii?Q?vVdYm45yVZe0dk7kcxmxP2Yd268a9xtMv35KJEwY5BEOLKvA2J80IlYG26eL?=
 =?us-ascii?Q?64YZmywWSE6VcqVijXOfznAPCSWB8mufOoM4oLf8RYljCMM6P8Jn9W//5WsN?=
 =?us-ascii?Q?bcg4ckZYrPdndo45uKfn8anAbSpCdCEIxz1unXOYnTyGjIgidX66lIgY7+9Q?=
 =?us-ascii?Q?RhRxDeCojCRP5zDMGlNkNU1as63zdNGofpTyuEytA4obMuCgHNBXDQogQ3qY?=
 =?us-ascii?Q?erC3TOobNiB1kZ0rB/HZQylpSo9cjRbC2wmYK3IUYK70iz/gld1eOScURg2v?=
 =?us-ascii?Q?eHW3zh8CTBTlQXb/L3IXjZQFY/CCl6Vz8pr5DNB4ZQvc86szXEvcViXVlXo2?=
 =?us-ascii?Q?vpGCmOheW8v9Zt/IdoI0ZTi3dB7KkDqpMAvQGsHPtJ869KlFCKkCsG2Frl1r?=
 =?us-ascii?Q?sLpLlKoMBZSRASA9BojmF/AtMDXMkOXpBDkWG9DXrf03f64NwQkZvcwe+MoV?=
 =?us-ascii?Q?e73xche6yho4UeKCnmaESipCtjn4ZVebOfOe0kPCUfTkx4iRklzHdam2uYUz?=
 =?us-ascii?Q?3w=3D=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eee35d2-d22a-47c1-37e7-08dddb880751
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 23:12:24.2886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JMlS721Vtt6D+kMiEy1shOyPJfg133NqrvpkcqldTO29df1zZy1azxjeDjgRPJE3kj2sz6zn9bpjvxHExGgiCQgNcPrcB6AgtL9vgOXQMVw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_161233_798971_13C68213 
X-CRM114-Status: GOOD (  13.85  )
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

Airoha snfi spi controller supports acceleration of DUAL/QUAD
operations, but does not supports DUAL_IO/QUAD_IO operations.
Luckily DUAL/QUAD operations do the same as DUAL_IO/QUAD_IO ones,
so we can issue corresponding DUAL/QUAD operation instead of
DUAL_IO/QUAD_IO one.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/spi/spi-airoha-snfi.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/spi/spi-airoha-snfi.c b/drivers/spi/spi-airoha-snfi.c
index 89bc09d3faf7..38f2397d1bc4 100644
--- a/drivers/spi/spi-airoha-snfi.c
+++ b/drivers/spi/spi-airoha-snfi.c
@@ -147,6 +147,8 @@
 #define SPI_NFI_CUS_SEC_SIZE_EN			BIT(16)
 
 #define REG_SPI_NFI_RD_CTL2			0x0510
+#define SPI_NFI_DATA_READ_CMD			GENMASK(7, 0)
+
 #define REG_SPI_NFI_RD_CTL3			0x0514
 
 #define REG_SPI_NFI_PG_CTL1			0x0524
@@ -179,7 +181,9 @@
 #define SPI_NAND_OP_READ_FROM_CACHE_SINGLE	0x03
 #define SPI_NAND_OP_READ_FROM_CACHE_SINGLE_FAST	0x0b
 #define SPI_NAND_OP_READ_FROM_CACHE_DUAL	0x3b
+#define SPI_NAND_OP_READ_FROM_CACHE_DUALIO	0xbb
 #define SPI_NAND_OP_READ_FROM_CACHE_QUAD	0x6b
+#define SPI_NAND_OP_READ_FROM_CACHE_QUADIO	0xeb
 #define SPI_NAND_OP_WRITE_ENABLE		0x06
 #define SPI_NAND_OP_WRITE_DISABLE		0x04
 #define SPI_NAND_OP_PROGRAM_LOAD_SINGLE		0x02
@@ -656,26 +660,38 @@ static int airoha_snand_dirmap_create(struct spi_mem_dirmap_desc *desc)
 static ssize_t airoha_snand_dirmap_read(struct spi_mem_dirmap_desc *desc,
 					u64 offs, size_t len, void *buf)
 {
-	struct spi_mem_op *op = &desc->info.op_tmpl;
 	struct spi_device *spi = desc->mem->spi;
 	struct airoha_snand_ctrl *as_ctrl;
 	u8 *txrx_buf = spi_get_ctldata(spi);
 	dma_addr_t dma_addr;
-	u32 val, rd_mode;
+	u32 val, rd_mode, opcode;
 	int err;
 
 	as_ctrl = spi_controller_get_devdata(spi->controller);
 
-	switch (op->cmd.opcode) {
+	/*
+	 * DUALIO and QUADIO opcodes are not supported by the spi controller,
+	 * replace them with supported opcodes.
+	 */
+	opcode = desc->info.op_tmpl.cmd.opcode;
+	switch (opcode) {
+	case SPI_NAND_OP_READ_FROM_CACHE_SINGLE:
+	case SPI_NAND_OP_READ_FROM_CACHE_SINGLE_FAST:
+		rd_mode = 0;
+		break;
 	case SPI_NAND_OP_READ_FROM_CACHE_DUAL:
+	case SPI_NAND_OP_READ_FROM_CACHE_DUALIO:
+		opcode = SPI_NAND_OP_READ_FROM_CACHE_DUAL;
 		rd_mode = 1;
 		break;
 	case SPI_NAND_OP_READ_FROM_CACHE_QUAD:
+	case SPI_NAND_OP_READ_FROM_CACHE_QUADIO:
+		opcode = SPI_NAND_OP_READ_FROM_CACHE_QUAD;
 		rd_mode = 2;
 		break;
 	default:
-		rd_mode = 0;
-		break;
+		/* unknown opcode */
+		return -EOPNOTSUPP;
 	}
 
 	err = airoha_snand_set_mode(as_ctrl, SPI_MODE_DMA);
@@ -709,7 +725,7 @@ static ssize_t airoha_snand_dirmap_read(struct spi_mem_dirmap_desc *desc,
 
 	/* set read command */
 	err = regmap_write(as_ctrl->regmap_nfi, REG_SPI_NFI_RD_CTL2,
-			   op->cmd.opcode);
+			   FIELD_PREP(SPI_NFI_DATA_READ_CMD, opcode));
 	if (err)
 		goto error_dma_unmap;
 
-- 
2.50.1


