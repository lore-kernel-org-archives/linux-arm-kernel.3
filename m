Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBCFECD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 10:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XeSRdC3DeThks0sTDU8NstsogfKXMUFO5Szntxv1+H0=; b=waMTudy5Ctg71Qp5KIIscYLUI2
	KtvmzE+8SQL6BXrkxq7jE9E6ur+YId1hYN/RPHguPwqi4j8aLY9RvWvWrQJMTJyb2Nip1an1N6aew
	g5svw7c98PYPszmVDIxxpV/DoCDS9FRiG6YiIWHA9+WADD8h2WP6Mol5LsvC29edu2A8D/uu4N5LE
	bGsar+HvCl9eglrMJww3uNpI1ZUMxk5Iy8evLLtTrY0CBc2SVgNvxBJYO9PL+FB7ij/HrQVL3cBZF
	gdDo9BMyKrGlqrExWzzjTPbLtkWeCqtXGU/7fwAYL61v00gkQNimZPD96qFlYqNwPFQBI5vEfIMcJ
	F+KC501Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSB3L-00000003gYE-26n5;
	Wed, 27 May 2026 09:59:55 +0000
Received: from mail-westeuropeazon11011013.outbound.protection.outlook.com ([52.101.70.13] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSB3I-00000003gUe-0Xaa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 09:59:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lYmieTm9PgYKXM7ErhKsKwe6eDgvESojBiHtMfN2pbPV9ZQOE5u8HW8qmkb5pIE+Sc7LvCU7MDnPpfxfl1K4TUsrfsf3m5VjRwBO4YLS/PmzY9R5WpbWO7FSXL168qFHAb135zr+mRZptyRmmLpzKiX7ryR+Aimvxfn0oNnhnRwo5CEt2sYYW2B4H191F74A10g1/3d3dc7Ji0TrzDvi+dZmPAnDyM9lqHtJFPbAuXI0odm24MXaRzwKFMsxt69wcSIUCBab4jK0NK+Ep+VmLpMMeMx3pb+QffZcc645v7ySRSUiOpposuDzrW/eNnk6sUdECSC/Z31rCZHgdMTAoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XeSRdC3DeThks0sTDU8NstsogfKXMUFO5Szntxv1+H0=;
 b=pqPAByqrel5+vErX/jePVCzdwGe0szu/y6E0prziDD2FH89x/d9DQKx8b5rfxnXTknfOf0NPiHKJkWsxFFUpTb1PUijn9V0dHm7F/1iJ0SJ4QebMgrT1by+mOQsQls1S1nS4TRSAnx9FiRq3DLIOAmQdOY51UCfbtEFcfuWsQS7dqEqaBHkpcBxVEMnZMz3+nqF8VZbAh7adT+sT8Yj6H/IF4i065TvxlWebjHuxdiYFiwIQZXPq3IzuBihDbie3sabbXyjUpGOXdebVmXrRk/AsCQ0tsCO3qO70z/CHYJ4T/YiR7yyup5UZhzSq9apHW+OILPxoXqOVbuA6K1vRrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XeSRdC3DeThks0sTDU8NstsogfKXMUFO5Szntxv1+H0=;
 b=O5QRlCmSmay2gZY/6SCoCtPuC6vS0LbhmXGWc4deZOWkRrHf9umZBX3E+BnDJCEl5IHGvu2BMS9c9MiRS+c9dUC4bvBqdoEQ7vctftXDEKAcoLJ/VCOYZ7OG3jcsSOCbLGQapDuHdbldyptPBz3ShpOdoH2QlDSKQ8h1NE0dSYgOeipkeIU2WdK1RRF/9ZY4rrw1eva6eNZkI2tQEUwojojRW8sL0VTpNrDok3X2uVJkhiewzcaS21WDVz9laGCPJ6bHYrQ2me+DWaQcM0S8DEjol6HdClAUO/W3KACrWuHE3s3mUS3RpL4zRcQ/y6DOv1iWUK9ZEpVlB7uj3ZziwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VE1PR04MB7216.eurprd04.prod.outlook.com (2603:10a6:800:1b0::22)
 by AMBPR04MB12205.eurprd04.prod.outlook.com (2603:10a6:20b:758::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 09:59:47 +0000
Received: from VE1PR04MB7216.eurprd04.prod.outlook.com
 ([fe80::a9a5:cf83:dbe8:1f74]) by VE1PR04MB7216.eurprd04.prod.outlook.com
 ([fe80::a9a5:cf83:dbe8:1f74%6]) with mapi id 15.21.0048.019; Wed, 27 May 2026
 09:59:47 +0000
From: wei.fang@oss.nxp.com
To: claudiu.manoil@nxp.com,
	vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	chleroy@kernel.org,
	andrew@lunn.ch,
	olteanv@gmail.com
Cc: wei.fang@nxp.com,
	imx@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next 5/9] net: dsa: netc: initialize the group bitmap of ETT and ECT
Date: Wed, 27 May 2026 18:02:13 +0800
Message-Id: <20260527100217.794987-6-wei.fang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260527100217.794987-1-wei.fang@oss.nxp.com>
References: <20260527100217.794987-1-wei.fang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0001.apcprd02.prod.outlook.com
 (2603:1096:4:194::10) To VE1PR04MB7216.eurprd04.prod.outlook.com
 (2603:10a6:800:1b0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB7216:EE_|AMBPR04MB12205:EE_
X-MS-Office365-Filtering-Correlation-Id: 636c40a2-f7c1-456b-0cc6-08debbd6af41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|19092799006|11063799006|56012099006|6133799003|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info: jJADa85cCzhwB8c5XnsmyVbnr4rf+c+uRm/bjSZpnAEKW0/wIox/wbTU3L1BL2sbdOzkUjeemRZInEXrmyQYa/A2f53IfRCsQxBGRNgdGO2WCNclb3jxbTGxaqGwd/mYp4Cp3XW/sk5RGNQqrveJgXCUq/4NzCsZiRnxNTr3DKq7i27sCzE8tBKoeqDEo3IvsTo9MNtSEBVxvyUep3Osf3mix0c86xqwq4ZcuC1mROsEFzNz/Zc9WkC3P4Et63LZE4saefqSrmTCGUWAbxYEzmDxdj5/UQa2G21vgzC5Y+dY4JXhsL0Ps26Uv7CuJpUD4Kz70/CmL89WyFNhdHJtd88ooyqlq+CSqEIqDCNgzaEwR1MjqCRE80sdj2xbKZu8w9fKBo3fm4yvoOxUVJJVGklIIcy4kMCvh1mMBl1fC10jS3O9CaePLKAhttPXvj7CIUGw2b3jHAV28lZBt4yTwvHVYI1dPwEBoFN6ur9P83rxAQK1DkJWjP5jmjVqw/xNuYNUxqdWluzh+Qu1NNWycT882U8io0r62RrqLmKjlPd3SZkSTUR0r9jN34vkIQjunIjfCuInsHVng9h+C5+mA9Bpd67ZnTWjjjVLQ7/DdHevAfavReV77p7ikDhkrOcDjDeWM9Jdju7ybthbnR6MagD3at/yHsc3IsOk5Lsk5ojh++JuEW/xp9jvPVseZcOFL1OoDZVHraV92SxDRxnd3vkbIExKED96uhgv8P2hAxM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7216.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(19092799006)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bCuq9kuoTlRcqVSPsUp4Tka1rn4qwXjPMwOfV4LMfl6dxzAu4KAazphLg1m+?=
 =?us-ascii?Q?mw7eCIp5gVNfgvTuuGgwHlWPWH7lu7r55fp4xSgx5ckZ37sUb2ghSe/laI9b?=
 =?us-ascii?Q?YG8YcWQEPW1J0u5gqmrsAap2Q7U+WluRcPdfL6YU6biMUR7PuHnJ61bYBquX?=
 =?us-ascii?Q?6BjdA8AHdlxfiUPFQgMPRPa49gdHAmRiYT7G6xIDcKkNQve8VfQnqM9oFzi1?=
 =?us-ascii?Q?EnmvlRk13vz4gCy59gfLXyV0H82ZWahhwd5YE9SY3nKBSPBR5TXdr8miAzpa?=
 =?us-ascii?Q?W7G0pGCKcXV/69lhXYao/pGv6luf8fAd6BdFKclNDxx2tGFydtF63BJM4bVS?=
 =?us-ascii?Q?wbZg7tcaHqfhhDDodf45aKFu7v1wk36tIp+pz6t9ObDf+xNfJTyb3dCsvpci?=
 =?us-ascii?Q?18QUyFphnsSLUdlTxfgx0cJ9wCMYo2OMSHsK8Z3ZFI2EkDjMDf7J0UZ3cg6V?=
 =?us-ascii?Q?z79iYCCQ7Uf0gPSOYgEbrspMqfIu0j9fBTPzdfS7aAIqcVH6elQiocDuFw3C?=
 =?us-ascii?Q?xtQpwKNUz/UsPg+d4bAF61p7BoTnxXjmO5sIEUMuLDUwGkILGOUrqbdN36bs?=
 =?us-ascii?Q?FEhjNgBKJ81fTqwQx1p2SmDnLe3GptRCVuqE4nEYEFqYkDpQyLyp6A/8VNcH?=
 =?us-ascii?Q?NczfKk9asKxnWoEkkLtM1uEZVSx5iNMmkUJz1yo+/6eDQBkIuAcbSVzciJHT?=
 =?us-ascii?Q?/v38sYHubIVba+l3JDo4dU4+xBNfsg68PAsCeUXuCLJCPh3P3NpYiFbqVEbl?=
 =?us-ascii?Q?U4uSU85r3A0UNUnGc6XbXV8IPV/nTmeiVzHf0Vwti4cWVK/tFdp4aUcw72Yq?=
 =?us-ascii?Q?hxQQfuXzmMw6Y37d6+K1G0a9izKzfo9U91Mb5wNzZXY17HCGLeQg5CpGAEIi?=
 =?us-ascii?Q?by9Rff4IIFD+TtGoIWzhk3nBqgr3hII1ReDF0DqH7bW7HNWmTH6owFcZk8tA?=
 =?us-ascii?Q?g5GCYl+hU98lfSprOyoe5u7zpN92rOS+muAi9c96UfhxLpGQ6aYj4vukCxJX?=
 =?us-ascii?Q?OsXPWmwZKb7EbH2xeNCPGzwoOe0DhVCjM3/+LsRq29xCUkuzhQivWm1d/Z6p?=
 =?us-ascii?Q?MBkSsmvIvPDVBwooU/qxOqIepqRvD1SONZq6YA4MxO+4tcOljg+sVjMNiLx6?=
 =?us-ascii?Q?A9gh7FDXdVfLCVj6SjO1cmtjslaRyuLCCLa6UEvHb3lVoj+KMjigtEzX3UTI?=
 =?us-ascii?Q?oInUTqsrishzzdHaS7BMOIhpXtWoRT7ZUIzh+Dvncv6YH7+smnYHBz6vR5m6?=
 =?us-ascii?Q?K6AHRsxl3E1PeaOXQ292AczgLa81ED/b6ZhrQI6ijWat7BEn+ml6ucUdY3Wy?=
 =?us-ascii?Q?fc4rEMJagHE3TOdaDPbPML85YONM359T9O1i7Qsfo9T1J7v6YGszLFMVR8r+?=
 =?us-ascii?Q?OwUBhpu7d/vITXpyXHdlinLimpl6iRsWPWtTvkgYSBdQtx3uT4DRXVslfDdC?=
 =?us-ascii?Q?BPXH2fjKZJeYwcSmwF57vG0NVbpbwgwma8s7AY1rJYYJ2N7/zgJ+rVI4VocO?=
 =?us-ascii?Q?BRbfpr+28jtpjszHmhyv1PbbpYVS70TR13GPaKtKIMbxTbhRSO5qTV+twICi?=
 =?us-ascii?Q?yl+xIrIv8NRGME+Z10eOzPdwhIe37YZXaSh8mn5oOOTNAjRyphfJayVkgGe3?=
 =?us-ascii?Q?zEx7kIRrFcUvY2rBzUyLgQW5hixXMxgVtkHq658bNbwUjVR3hp6A9MWErWkh?=
 =?us-ascii?Q?vG6w474Wv+2v4a/aCcS9WT+aKCaxxS7yONQLr2zZLJblkH0H50MoXrcnmGIL?=
 =?us-ascii?Q?gfHfDkRH6YdCW8Z0cBFqQthpQvigle9uIVn0892G7I50wPU4spWb?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 636c40a2-f7c1-456b-0cc6-08debbd6af41
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7216.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 09:59:47.3091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z46MeSZkgwWTUpvIZolAE+iJcRQTarxu5sONkWNExw+72gJGH1+YwK4XNbK92uEwNoiQT7wlYa3JlWJQ2s8+sVa+vwTx5SHPk+iKeO4nXLmO1/znvV1nhoBuewIpiYo5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB12205
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_025952_176211_A3778997 
X-CRM114-Status: GOOD (  16.88  )
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

From: Wei Fang <wei.fang@nxp.com>

The Egress Treatment Table (ETT) and Egress Count Table (ECT) are both
index tables whose entry IDs are allocated by software. Every num_ports
entries form a group, where each entry in the group corresponds to one
port. To facilitate group allocation and management, initialize the group
index bitmaps for both tables based on hardware capabilities reported by
ETTCAPR and ECTCAPR registers.

The bitmap size per table is calculated as the total number of hardware
entries divided by the number of available ports, which gives the number
of groups available for software allocation. A set bit in the bitmap
represents a group index that has been allocated.

These bitmaps will be used by subsequent patches that add VLAN support.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 drivers/net/dsa/netc/netc_main.c      | 90 ++++++++++++++++++++++++++-
 drivers/net/dsa/netc/netc_switch_hw.h |  6 ++
 include/linux/fsl/ntmp.h              |  7 +++
 3 files changed, 102 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/netc/netc_main.c b/drivers/net/dsa/netc/netc_main.c
index fa7dd307ce13..d4475ad7ed6c 100644
--- a/drivers/net/dsa/netc/netc_main.c
+++ b/drivers/net/dsa/netc/netc_main.c
@@ -323,16 +323,104 @@ static void netc_remove_all_cbdrs(struct netc_switch *priv)
 		ntmp_free_cbdr(&ntmp->ring[i]);
 }
 
+static u32 netc_num_available_ports(struct netc_switch *priv)
+{
+	struct dsa_port *dp;
+	u32 num_ports = 0;
+
+	dsa_switch_for_each_available_port(dp, priv->ds)
+		num_ports++;
+
+	return num_ports;
+}
+
+static int netc_init_ntmp_bitmap_sizes(struct netc_switch *priv)
+{
+	u32 num_ports = netc_num_available_ports(priv);
+	struct netc_switch_regs *regs = &priv->regs;
+	struct ntmp_user *ntmp = &priv->ntmp;
+	u32 val;
+
+	if (!num_ports)
+		return -EINVAL;
+
+	val = netc_base_rd(regs, NETC_ETTCAPR);
+	ntmp->ett_bitmap_size = NETC_GET_NUM_ENTRIES(val) / num_ports;
+	if (!ntmp->ett_bitmap_size)
+		return -EINVAL;
+
+	val = netc_base_rd(regs, NETC_ECTCAPR);
+	ntmp->ect_bitmap_size = NETC_GET_NUM_ENTRIES(val) / num_ports;
+	if (!ntmp->ect_bitmap_size)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int netc_init_ntmp_bitmaps(struct netc_switch *priv)
+{
+	struct ntmp_user *ntmp = &priv->ntmp;
+
+	ntmp->ett_gid_bitmap = bitmap_zalloc(ntmp->ett_bitmap_size,
+					     GFP_KERNEL);
+	if (!ntmp->ett_gid_bitmap)
+		return -ENOMEM;
+
+	ntmp->ect_gid_bitmap = bitmap_zalloc(ntmp->ect_bitmap_size,
+					     GFP_KERNEL);
+	if (!ntmp->ect_gid_bitmap)
+		goto free_ett_gid_bitmap;
+
+	return 0;
+
+free_ett_gid_bitmap:
+	bitmap_free(ntmp->ett_gid_bitmap);
+	ntmp->ett_gid_bitmap = NULL;
+
+	return -ENOMEM;
+}
+
+static void netc_free_ntmp_bitmaps(struct netc_switch *priv)
+{
+	struct ntmp_user *ntmp = &priv->ntmp;
+
+	bitmap_free(ntmp->ect_gid_bitmap);
+	ntmp->ect_gid_bitmap = NULL;
+
+	bitmap_free(ntmp->ett_gid_bitmap);
+	ntmp->ett_gid_bitmap = NULL;
+}
+
 static int netc_init_ntmp_user(struct netc_switch *priv)
 {
+	int err;
+
 	netc_init_ntmp_tbl_versions(priv);
 
-	return netc_init_all_cbdrs(priv);
+	err = netc_init_ntmp_bitmap_sizes(priv);
+	if (err)
+		return err;
+
+	err = netc_init_ntmp_bitmaps(priv);
+	if (err)
+		return err;
+
+	err = netc_init_all_cbdrs(priv);
+	if (err)
+		goto free_ntmp_bitmaps;
+
+	return 0;
+
+free_ntmp_bitmaps:
+	netc_free_ntmp_bitmaps(priv);
+
+	return err;
 }
 
 static void netc_free_ntmp_user(struct netc_switch *priv)
 {
 	netc_remove_all_cbdrs(priv);
+	netc_free_ntmp_bitmaps(priv);
 }
 
 static void netc_switch_dos_default_config(struct netc_switch *priv)
diff --git a/drivers/net/dsa/netc/netc_switch_hw.h b/drivers/net/dsa/netc/netc_switch_hw.h
index 1d976882a6cc..1404ae41c7bc 100644
--- a/drivers/net/dsa/netc/netc_switch_hw.h
+++ b/drivers/net/dsa/netc/netc_switch_hw.h
@@ -36,6 +36,12 @@
 #define  DOSL3CR_SAMEADDR		BIT(0)
 #define  DOSL3CR_IPSAMCC		BIT(1)
 
+#define NETC_ETTCAPR			0x18c4
+#define NETC_ECTCAPR			0x18ec
+/* Index table NUM_ENTRIES mask */
+#define NETC_NUM_ENTRIES		GENMASK(15, 0)
+#define NETC_GET_NUM_ENTRIES(v)		FIELD_GET(NETC_NUM_ENTRIES, (v))
+
 /* Hash table memory capability register, the memory is shared by
  * the following tables:
  *
diff --git a/include/linux/fsl/ntmp.h b/include/linux/fsl/ntmp.h
index e3d4ea015391..b9d4a29abd23 100644
--- a/include/linux/fsl/ntmp.h
+++ b/include/linux/fsl/ntmp.h
@@ -3,6 +3,7 @@
 #ifndef __NETC_NTMP_H
 #define __NETC_NTMP_H
 
+#include <linux/bitmap.h>
 #include <linux/bitops.h>
 #include <linux/if_ether.h>
 
@@ -70,6 +71,12 @@ struct ntmp_user {
 	struct device *dev;
 	struct netc_cbdr *ring;
 	struct netc_tbl_vers tbl;
+
+	/* NTMP table bitmaps for resource management */
+	u32 ett_bitmap_size;
+	u32 ect_bitmap_size;
+	unsigned long *ett_gid_bitmap; /* only valid for switch */
+	unsigned long *ect_gid_bitmap; /* only valid for switch */
 };
 
 struct maft_entry_data {
-- 
2.34.1


