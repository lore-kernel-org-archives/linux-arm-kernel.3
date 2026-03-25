Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99127FEC11B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 11:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+Rx2IQCvwov3GJ7ZURYBsCiWagSaHTJegn14XzXDvvM=; b=0y50xKgqs0v6mn93nPK4aKvDlG
	hCM5nR2tSNhVE34YDu9cEgIFqMI/nZe88KrDmnZ7jKyYV70CT8LL5A8u92g0qONf0sdGReW2kgPvo
	qRYzIPZVlH9l00SM9MMA1lajCCvGIuD5ACb7eMKvrbDLeJ2OF+T/ysWpjK4Gj0Cw9R8AHi+bkJKfL
	Fr0b+2b/1sSfKjYzmdCLnwdpnvMXWhw8oT7bPvxRKJ4jgIf+ZBtG8gOcGje5iXlDHIea6O6uppBbJ
	t8GD8w8UKqksphR7oCbDdgOVR8jECvcON6wZJyE9oxI/gOLYTvNe+82KIxj8lEqto76ipX6bwGKKb
	4Uk6c6fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5LyY-00000003C8G-0axK;
	Wed, 25 Mar 2026 11:00:38 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5LyV-00000003C7v-2shd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 11:00:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L+M3m9DTXUfVQL4OgjXLtNQ3B00pPBnOEdGrvdVoSMI5UtVqJKBpGfopqUIF2MJrhkH0RvihN0P+/gqgHCyYgaZMNZEwuFSZh0rhzHrDW9rpIjhbFRHSl8BsltOGUkHSEurZqPMRG4aWOmUoNbrADfTeM6DuAeUgcdhZZn2X04Nh0QV/dteRNXuHoX3pd2EOnw6CAgRC08yrpef5IKTrIIJw5+rUptdyCN/L+hEbTrTPeNQWvrwvptAPunl72EnOfSuad6j1EtznU4IEQPILiKyqj0i1JISYxsrcIYuZjItO+nOS6lHKUyRxmRnDLj0EWiMwXq9qQMvaDKQPD3U0IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Rx2IQCvwov3GJ7ZURYBsCiWagSaHTJegn14XzXDvvM=;
 b=B9M/zYinEw2C+1T7/yxIW/pJA/rswPuJBIJmGeJFjTmx32le5yHJpeXUZ7GjXAuaxOhzAPcfyKYfv7Xr1kCRl7ULoszW3NZyGlNvKHKJ21B+aI1VwddKIJJOCsWB+t0KpUO7XB3uyiycOGnc5sPf0dbY3eMU0pJ29xqk+VSubUeGCRgPakdlaJonlm7DQqXrgwBKzJ3xGHeqK4G7z61boT+upe87MY9r58Us9CfvZjyrkjnSeUJnn0vuTznsHbwgmCsjOUO/PmAQaFoyG1PvuAdSAHuXROgJnJKG2bTvviXiPxrKh197PZIoOntW5iK6I0PSBfdSny8rrH3dZSBvsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Rx2IQCvwov3GJ7ZURYBsCiWagSaHTJegn14XzXDvvM=;
 b=A6U6NgfjPiEcCr1ZLY1hK4M3F/KkUWwdLEtUSOTCKt4psX8mjcvbdFQtpqB/qVENNGpISrTExkdZVlUZhVDamCCF6JIbVNclV2EZVb0XX4Gwd62fXt1biLWIVRCna3Eu+kVIwFB082jrJqIKAnJDpfMsaFabQkR3dSjaK+5ThieIyP3x965o3853TK9f7Nx1cvhXdrdlKFTd86uOZkNCafugYC90oUnPnsAmSzFjQetT5HceY30Vf+7bGeVPMcGqcWPW0wr19ivAhmSoHK3wP2Oa7ryFHcvwv/tuIOCVy4KheirfOXpNWT98vF6Y+hAYP2TcQGd9tuEyo5xnVPJTzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by GVXPR04MB12268.eurprd04.prod.outlook.com
 (2603:10a6:150:2c7::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Wed, 25 Mar
 2026 11:00:31 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 11:00:29 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com,
	hongxing.zhu@nxp.com,
	l.stach@pengutronix.de
Cc: imx@lists.linux.dev,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/8] PCI: imx6: Integrate pwrctrl API and update device trees
Date: Wed, 25 Mar 2026 19:00:50 +0800
Message-Id: <20260325110058.2854742-1-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA1PR01CA0174.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::12) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|GVXPR04MB12268:EE_
X-MS-Office365-Filtering-Correlation-Id: e67006a5-e74e-4e8c-1646-08de8a5dba61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|52116014|376014|1800799024|7416014|366016|921020|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: u6ojp85SKYg648pFWbp+4s6sMX81rpDOuyH2/owkYQiiKkikjOovSBnHiW4ykrAvtfs6E02zu4PvC0GmMKIoHN4mD1ro+4v6P80tPE6L0KvuUJEHzEkO6aLbWNxQ9rar6kztNYGgoF1iCBRlnuVF4rF/rxTq8Siw444xqKF9hhulCyZ1C44uZrUhKNgyGEKtbF6xwONYAb4fv2/yVRa/kJ/KerTmuh/54JkTi3yjo1fCQ04tkPG69FB2JVarY3hmgJ1l0kvnOFdFGOlHtOypuDXHLMnG0KPigoR1hyZwNjWVk7Eo4f3PbfDGo4mNiDsKBhplDXQZPMa+8NhR+1GVLFEc3IGxYdr5iKGPLNyd+EjT7/N1zhwilmsHfa09SmJ/9LpaGHDBmZAH+xX81Fx7a/4iHuXPv8+uOVkijXqS7sKYjc7vawWlnBzbhoBS6mxEmOG/S844k48vc5DxmFGZ4H19l5/oR9VdsgN2/B4zlHLrA0RYp35uTqxpxP/3zUDMZb0/JCNOUOuro1ZD/iZMij6R/mKsfiMDLsn3Qeq4EpUXA1tTAFnSTwWhtODyZVJ6z+jA8pTnukUMH+yxEy9JEWxRjQzYLVySvvP6FK/AaVrmfSG0QWLfXJxy0xHsIFDyXr1MEx6Nah9HDC2a5qEPH1QyaI53BdZ2eLSTMdIBbL0s3oPKYoYT7QrCJY73NwXaOAcoefAfQ3AROuwrs6yduoHjLDnPlsLjnMk4A9HEb68gPRBXCNELdhN70sEMJxxmgRRt5fAzeUcQdu9LkFZJUdxIb14edivZlpFRTxWNJCOSbL0+hqvB+nmfYNyoiN6g
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(1800799024)(7416014)(366016)(921020)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TAjd5hNmYOxzHwle+SpO70e6ehxWZfmxh5bi0NnLufyqHFJQms9sqbloNHfB?=
 =?us-ascii?Q?Ieqw3yTFtksypsAARosHOn+o8Tev6K6oe8Btp96pGT1nV+apWu/jiK/s9N/P?=
 =?us-ascii?Q?/O9EnUOhjdJflPCfK0TlxZB7RHNpaLTBfoufNQawREJ+ayDeKSy4DETAyZ71?=
 =?us-ascii?Q?Z71ZpT3DR1KMUwANp89OlZNwQMO7tWRnE8R3pzipphbai+TVGwa8+/frT7n9?=
 =?us-ascii?Q?QRxJU7PDqYPuTuptknfrPRfg2Dd4CcLmxDvCm3LqM+Scpnt2j3QXMm2iYepm?=
 =?us-ascii?Q?OCwaxugmww6Yu87DywLYQ36Ch2LbwtQ9QkudX5trrKpJrNZQpHRyFmm3rZzQ?=
 =?us-ascii?Q?N267+MEwGs3USNwdXzv9xWWIAmrYt0zm3GXe5ibA4U0XvacunVGwWm1cILCc?=
 =?us-ascii?Q?u3JVQvpBUOcVOa1CYCO8pGCOfc47B19gH3HZksjYliXpcBC3oDhMojhV8axB?=
 =?us-ascii?Q?me88O1FLuI48rAd2lFuixzJ9NgGDBsMx7bU46w/jk5h677L86RGqF0M73OW9?=
 =?us-ascii?Q?wZL/WhuR0eUa5+yIZpwyd0rf1HpR4l/PKdD5A/OsnwrOHwqJyBbO8inEO6tu?=
 =?us-ascii?Q?4f2XkAzqPGKqvZ1FentDpibCRGpkl43019yqcCSgji0c0dvBRnyeAF2VagTq?=
 =?us-ascii?Q?+vn+kpjUX6e8hpoGu7UiYYB/0d797jtsF1OTg1PmQPmy2spHA04YPHY4paDa?=
 =?us-ascii?Q?qzup+GymF0c2UTwNx2Rabj3eYk2FaOWFnd6rQS4sCiQWANfmtl8l/ggpxv7I?=
 =?us-ascii?Q?ctsbq7ejgMjo1UvsNS49Hk6un7rLMIXs+wIuO+0rheo4ksZH5Zu6jIsk/b+1?=
 =?us-ascii?Q?hGJGa8aZ0aN65TZTVsyknTYqQVucs2CB3wPzhfiFgokMKXWiBCfZGJyY7LH+?=
 =?us-ascii?Q?yF4NNDpCp95HmRqtCJl+saLE8x8oUS4sEHd+mgFvyLWVaPFKvPhuAGKQTJ/F?=
 =?us-ascii?Q?6jutzXhuSHrxcquOq+CfFCDfZCqUuO17nSQidTRS/jUoEtM1QFj4nnEQHNgE?=
 =?us-ascii?Q?1V2YmuCNVOj8z3vGQBvSHVhxBkxf5WfBIXWRcrZU1xlWPZvkHb9TQFe4Tpyx?=
 =?us-ascii?Q?bM40FawvAg+Q0HmCCjQJl7E9YKg6qPNgNnVOgnZil0IiCWU+6T40eDqJ3JSi?=
 =?us-ascii?Q?6h5/7QIMyU/tSLlP4RWWtYNpNgh1yivUjwVJIdZ/L/1p29mdK4TjiBwadLmP?=
 =?us-ascii?Q?6qp3LBjnTkVU4G49lJzTrkQuG+qur8pDr4KFc4nDAGXJmxgeoE/54c2/2Rml?=
 =?us-ascii?Q?e0QYl4J4VkShYP906/P6ECoQF5/ACPr1n7M959YqBQ9AGf3FI+DiFjmXQnuN?=
 =?us-ascii?Q?JQ1n5g4I7fnCRiNY+kbchEOP9oPmfJp6n0zmCDPniHJPjFku6gBgJdc0zVto?=
 =?us-ascii?Q?LlI8l8me+nGif7vMzibNgwRssv2s94dNGxSUqgg1sxGiwDVBPedYML0jU4JL?=
 =?us-ascii?Q?OhHU0d1fELB6GOJbkCapmdoFZRFasifMdFmCbCdPwuY4WEIqZX6jgLJar5Lz?=
 =?us-ascii?Q?keNpaFFASuPkAiHSUYxEKAGu35s3JvgGlL13M7B0Oc84FGzYkmMSdeneLTAI?=
 =?us-ascii?Q?h4736x7bW2SOTNWPsYIzY0V2BAtprsEEPLGZHVVmpaFv7Ww/TiModzlqTFGw?=
 =?us-ascii?Q?a8jL1GH2HlEQvDPBfT6VK3u3zpSTN25KtxZdPvA6UyFXZmfdLwS/tiYjqtZh?=
 =?us-ascii?Q?TN/tpVs1RzaYEY0jKnHMyA9BW1msmkXf9YtUUZPJ9B+tg1dZWHBGQBAVCJyh?=
 =?us-ascii?Q?dzhCCfvEMg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e67006a5-e74e-4e8c-1646-08de8a5dba61
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 11:00:29.9367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DydnBbiIXtE5AsIBzTW6d6VDOSCJjV8roSfdYzK8ta/Gn+EiCOpF4lA6xaieCj7BmbxlxtmZL4XQlcnSNDGdpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12268
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_040035_771515_A0E53FBC 
X-CRM114-Status: GOOD (  12.10  )
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

Note: This patch set depends on my previous patch set [1] which adds
Root Port device tree nodes and support parsing the reset property in
new Root Port binding in pci-imx6 driver.

This series integrates the PCI pwrctrl framework into the pci-imx6
driver and updates i.MX EVK board device trees to support it.

Patches 2-8 update device trees for i.MX EVK boards which maintained
by NXP to move power supply properties from the PCIe controller node
to the Root Port child node, which is required for pwrctrl framework.
Affected boards:
- i.MX6Q/DL SABRESD
- i.MX6SX SDB
- i.MX8MM EVK
- i.MX8MP EVK
- i.MX8MQ EVK
- i.MX8DXL/QM/QXP EVK
- i.MX95 15x15/19x19 EVK

The driver maintains legacy regulator handling for device trees that
haven't been updated yet. Both old and new device tree structures are
supported.

[1] https://lore.kernel.org/all/20260318062916.2747472-1-sherry.sun@nxp.com/

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
Sherry Sun (8):
  PCI: imx6: Integrate new pwrctrl API for pci-imx6
  arm: dts: imx6qdl-sabresd: Move power supply property to Root Port
    node
  arm: dts: imx6sx-sdb: Move power supply property to Root Port node
  arm64: dts: imx8mm-evk: Move power supply property to Root Port node
  arm64: dts: imx8mp-evk: Move power supply properties to Root Port node
  arm64: dts: imx8mq-evk: Move power supply properties to Root Port node
  arm64: dts: imx8dxl/qm/qxp: Move power supply properties to Root Port
    node
  arm64: dts: imx95: Move power supply properties to Root Port node

 .../arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi     |  2 +-
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts |  4 ++--
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi |  2 +-
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts  |  4 ++--
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts  |  4 ++--
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts  |  4 ++--
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts |  4 ++--
 .../boot/dts/freescale/imx95-15x15-evk.dts    |  4 ++--
 .../boot/dts/freescale/imx95-19x19-evk.dts    |  8 +++----
 drivers/pci/controller/dwc/Kconfig            |  1 +
 drivers/pci/controller/dwc/pci-imx6.c         | 23 ++++++++++++++++++-
 12 files changed, 42 insertions(+), 20 deletions(-)

-- 
2.37.1


