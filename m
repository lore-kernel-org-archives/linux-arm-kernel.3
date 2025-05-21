Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D0B0C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 03:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xxcFMNZpuXp1TXcGUinEBNiWatzMG1aE0Md54Tw5KH8=; b=a0XQJ5sD6IjIAIHw3NhSAmH/lw
	0uW9fyNsAPOg2N/DzCRkpC2EfF46yKC1Vk+m2ruxgTU1sFgayt4h1JE2P+yssjvKoaI4tVPsMNFTo
	sa8CT+SXzJK/T43ivMbMmVaBt2GIQ6muoBALCapMlwO2kd1GKBIPNpLhBRejWh09LRFNBjQOzx1Ik
	w7aL8UtX2P6+CAFf16z78h2pfopn4KW6L31sQQecgEEYWsOXQp3a6qxtMlNPKrnXL9LqxoJE86lHy
	KuriaeLOoNB9iVVkDBwF+BMR4u+TR6Sqysm4hfMvPhbJIhbAL6Ej1art+WTVsmry8EjYyCSsk2F+O
	56F4jqvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHaKE-0000000EhHM-1PVE;
	Wed, 21 May 2025 03:41:02 +0000
Received: from mail-westeuropeazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c201::7] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHa9r-0000000EgV8-2alU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 03:30:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hGKrVL86W4B9gkvDDVDvJjXZg052YEcTGx4dhViGoMlwBL0X9RvgOaeYdp3XHMfezifwPUkMVnBF7RqPSIBCVuCiRgARjIWJ3DdhOykTX0VC+ctnPf63dE/oIBMiXX7w0Ll/5WKvc3hLQmclUoqKVUqHpJr5I1qRUNKp3ZZjayA7DxmJtY7Xpc048DYK4BbNYR+eoLIh76DMp0mbmkdoZyAPJHQusETHcND5uaaAOR16XEK3t73X8pnppOUMW+V2Uq21sbOpcemqKPukSHXmyznGJwhewOViEmgDlw4OJH7tdG/YZMGucI2dLTwg3FstQRGbcd7vUZvtmjTmJKA0sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xxcFMNZpuXp1TXcGUinEBNiWatzMG1aE0Md54Tw5KH8=;
 b=OciFyFB2USn12yuw3wwPMsMKKpL7xh7XX08bnoT8rpkJhDr5sPYNkQ1Bb03H4OCmHyZC4H/SX9qcgQUMLnDDiXWL0OHUR60+T8RY2XaDtFvQbPEtxCsnLFppQaly5NMEiyQpMlkFCT9oDRRoH8LTvk+aySUVmRvMm47yruwcFTqcN+JqdEkVi3Vq16LZAzVi9tED63MEZjkuqC8uVIF+dGS+/Atr9WuwxvX7iyNw48F8kMHfaNM6qzKhrZZUatl2ktG9UxCJix63mg2TsYR57JgsrUwCafUhVCj1EhKOk4L4Uc9r0xXpSn9mLVM/RNmCYD7AVJaA0WtmnMUyAeq5+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xxcFMNZpuXp1TXcGUinEBNiWatzMG1aE0Md54Tw5KH8=;
 b=dsH6RfmnALSj2PMQ0DnF9x7yEbCZ9njqWmmkfkgvE6+a/HibSKDw25YrheljOxOz0yfe2oTu14LPoeudAeLtn0ZzNPMp0vvL4PQUEHJap62UFmIcF9Ev53oA4Fg9qKqS19DZCh/Ov6R3/l1r8QBTEoe8fIcAFrrAj3IuY7m+QgaI4pKGI4zb3+JqOKzkEQt/IjKYpL3FHnoJ4Fg489XjTPyUGBb/SZWKrTzvotzj2bnaG9Ed78oM+zTvAntpg7de/ET+gwQTS7rYru0XJpTpbd/4S28U4h4C4q/Cm9SfgO+9pqUC788ud81QnJlgJAY8TgjnLAubr821hNzg0hf6Fw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8567.eurprd04.prod.outlook.com (2603:10a6:10:2d6::21)
 by DB9PR04MB8171.eurprd04.prod.outlook.com (2603:10a6:10:24f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Wed, 21 May
 2025 03:30:15 +0000
Received: from DU2PR04MB8567.eurprd04.prod.outlook.com
 ([fe80::4db:3dc0:c292:493a]) by DU2PR04MB8567.eurprd04.prod.outlook.com
 ([fe80::4db:3dc0:c292:493a%3]) with mapi id 15.20.8769.019; Wed, 21 May 2025
 03:30:15 +0000
From: ziniu.wang_1@nxp.com
To: haibo.chen@nxp.com,
	adrian.hunter@intel.com,
	ulf.hansson@linaro.org,
	linux-mmc@vger.kernel.org
Cc: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	s32@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mmc: sdhci-esdhc-imx: do not change pinctrl state in suspend if function irq is wakeup source
Date: Wed, 21 May 2025 11:31:34 +0800
Message-Id: <20250521033134.112671-1-ziniu.wang_1@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR02CA0074.eurprd02.prod.outlook.com
 (2603:10a6:208:154::15) To DU2PR04MB8567.eurprd04.prod.outlook.com
 (2603:10a6:10:2d6::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8567:EE_|DB9PR04MB8171:EE_
X-MS-Office365-Filtering-Correlation-Id: 26501c5f-c4df-4904-6b2e-08dd9817cd23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6RSobgC6EJ3GrmyQ/xjhGHKpXohrbcJcToQ38kXukSglnhHUuFliCuHWKyK/?=
 =?us-ascii?Q?/n1aZ79hq+rfqqevCMs422q2mHT83xtRTRW7PORsG1XBO6VVN5FJlXo70MCd?=
 =?us-ascii?Q?xeZcZnWBhOAQlp3Cd2QCNahjfV7ifyqffUYFwQZ1f5oUBCNofLLpLcizNg6o?=
 =?us-ascii?Q?/PKhg+xACz9BecTomWGZ/ncAzMtwk4nGZNh6VHqdRmtmFNTA0L52GHfayeNM?=
 =?us-ascii?Q?crk0PL3XKla45jXt9NHIocHLx23slQoBbCKknMkhiC02unpfLqskj8fgZ7kU?=
 =?us-ascii?Q?1fbdg6ba2n8ssqd9zznxw24hm6BFPL/2p4+M0gEfXjSiqD/HGzxbHzQ1ygHj?=
 =?us-ascii?Q?LLaBjc7exB/dR8qzpnnjWSu98ZO0SRtsBhXuQLkfN6Okp9h5VN42Wi+p0bbJ?=
 =?us-ascii?Q?g6Mf+VZOA3X8FKtAKJ4pJwvp7IDmNlUqFqalRTUMmyZ6FYO4TeMoU7VWth2e?=
 =?us-ascii?Q?OG5ZXUYelceKlDPdHt4hm62FjsHls4/TDiDFX/T/RZPftYp0/R84v4UiSwZ5?=
 =?us-ascii?Q?nv25W2Jiit9ECjx494qll43PTlPFsw+KBc1PLVY/1kOHT1rEs76R5F+vemIr?=
 =?us-ascii?Q?7lDBva0EvzIj0DCm/syO5HnFfYfMavv82qAtTfb0xjGIcGup61r55PBsVcUy?=
 =?us-ascii?Q?NsMzyv0/6HMxxngJmtalatySh2S3JvlA6n+9bJStGJ5itFLkjiWtHDLMMgk1?=
 =?us-ascii?Q?iuIaVT3gZ8FVfZaAXdd9KeMjWq4O5wkxuA9go60f8fy0ofC9+i8w9rTn5xig?=
 =?us-ascii?Q?WU9/vcibTEBLxfvdhiFeetuDqBnVmrWeuKKAO2QRkGSnBEDSRMkmFiB1B7S6?=
 =?us-ascii?Q?jfprrtsQvJLVMx37Gk9Hh4yTXnvuTIjt2TXKKT+zlwaYrk/vXmcF4HJde8Hm?=
 =?us-ascii?Q?Sg0zF7ztR5tb8IxUrE20LpsiXc/TDxTyfAu4wHmiEVcjgDQc4a9afPRUWOPU?=
 =?us-ascii?Q?ZEkgAha3XGSWSnbrympEGro11MZyYaV7tsf9vGW8QGqKNl2fXWBAa4bCo8cs?=
 =?us-ascii?Q?k/Cp/a8YxgQUmgJ53G0yzLB497ixQAOKWJqSGu0zcS7AkztrC/r8FZkwqesO?=
 =?us-ascii?Q?yOvTJDZb+40mgvtZfNy5ACqs7HangqjjNIf3OsCv1+1bv8lD+1VAYo7hLIkK?=
 =?us-ascii?Q?ho6VC3ih5QlBz9dU9ojCdq7c39VcLFMnEZ4yZe+vlTbBmvPSIoeeCt2R5tkQ?=
 =?us-ascii?Q?aoDfyx6RVvnLTS4EhkxPDYqw0feZQQ/8d5sXv5EKfJ3Ajm8Xq/vyTNYPPlc1?=
 =?us-ascii?Q?IuL9eCnthmxTDBMXDwGdFeOrkC62b4co1gY3kbuas1AsE/ymzxSRWq/Vsp/E?=
 =?us-ascii?Q?x702GpJTwzE1fleXbBAZl2GMPWA8AU73mVLvgLTQ9rw43Mdr2AetMYSkA7eG?=
 =?us-ascii?Q?7nos7QJPbDsbz8NW/SCe3BVuOmKAF9huEeIZN2JAo/0rJslfswgEp8m+Zn1A?=
 =?us-ascii?Q?2h4loFcLTKiVgAqQFJTj4SyGkQzgMDzMRv5GQ23sWGiyToqroMOaPQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8567.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HxmWEcM37JANOADrxhJwYxqof/iTspFiVikrueitSAToP1DbzFVMmPRKENnj?=
 =?us-ascii?Q?/9KbDo1Uulp3lytlqE7hw8MBkiZQkLb92ddah6jAW7xEG1OuQ8grM5IRR5ol?=
 =?us-ascii?Q?22KB8u34Y2XkCplkLAClqEIrWp9h7kpOyhoVPOkruEi4ApS+fsKyhBUU5J/P?=
 =?us-ascii?Q?WRMPO35iZUo9DHPtQcRLOBf4mvIOrN2bZPydkBkL8Jzn2cy1ivhseZtPzUfW?=
 =?us-ascii?Q?LfUiFSIy2woG/zpRl4GeBX+CkHNioKUiQzhdIlsEU6meYaxb+Pfm7M+4NEoC?=
 =?us-ascii?Q?yTcnlvOhmJXRpNiPsPh8uShocQI/saaW4RliLIDob1ZSx84/R/6GR7G79J31?=
 =?us-ascii?Q?MkrYeU2S7kRAnTkFrTA1ni9xnumMTtWnZtJmAzpeEmb6HHS/QbMxh4Tk7mUf?=
 =?us-ascii?Q?wQIzuKAUE0rXkfrYUvuhovL0jJSgP5o7DhTfZF0xFZXZl+8XTAaWjSm6ukP4?=
 =?us-ascii?Q?qyTttlB+fHs5hupuPT9OTwAEtx8WlJUZ33U+QFc1o5fWPzif5k8n+Y6zon+9?=
 =?us-ascii?Q?nkt9rs1/eaYLsYsTMq6etHG8/CCKDCN87Aa9QoVvCqlvdf/26RVVWZ8FXnND?=
 =?us-ascii?Q?3/4gPSNA64KDSgWsRjaTd+tkim+EvQRi9UOfazTslYa4CNHdxQhu2AsxoDGS?=
 =?us-ascii?Q?kIwb2M6fyWsUmSE/c5q06dPYx/8Mkl8AFFISxuR8zSarJ8j+VC09Mx6Tcx9n?=
 =?us-ascii?Q?RPCDJRiSifofV8fMUpBDjWQ6zWIzmmc7+s/ggxP5hgt+NxOgdCO+Y/MALyhq?=
 =?us-ascii?Q?5WTVYvej1LXd2nMO5ntgvUXvMbN6C2ZOJikkQpeTRJllJQJrkSPZPe/m0FGx?=
 =?us-ascii?Q?QY2fm7qfAWH6qZSr1ADmj6WJu4SZ2NuI5y5GJQ6nrh/7KkqFD+wKmM0Rmojo?=
 =?us-ascii?Q?bVCliSUErSBuFJVFsCgtXpKeyaIwr84F1VBUt/nkxFdDvnTcocFiLvEQyc9w?=
 =?us-ascii?Q?zHXzmB4PV7YP059WzZ1RAsALsqNAW7HpX6VIw4nfDBK3c2cRJr7Hsj5dbpxI?=
 =?us-ascii?Q?XISF8FZt3Pe2HuXLuKwW5hFBGhxCouEOVWqdzNy7QXvmJgRqLxdsAAramCNN?=
 =?us-ascii?Q?tVTeDArnWFPo3japRbkpfoiTyVuwecU4GI7ARyKOT/O5B+2tzMOtms8AlUhW?=
 =?us-ascii?Q?vciJ3nxVzBOe3xAcyzknwYTvnXmmqWYkFy5R4hxcmFTid8/T6a1vOO7XbB62?=
 =?us-ascii?Q?PSSzaGvO3G13ZsRDsYDkp3INHq+sVMR7+plmqevHYu3MMPgh/bKcSqMoi0by?=
 =?us-ascii?Q?GhFvjCBWwuSKISz1PWtWfqoRncfhMjiQQ/2dAScGNkYw4Qpgdigb4n6InZSV?=
 =?us-ascii?Q?wIUXQBExcOZQj5/0Oq5pvZf1b4jEWRiCOiGOw1wV5yvRF000diMRODAPnt6N?=
 =?us-ascii?Q?4WfGByAzTRDIraRtYVobcDRmJSCxVa60LUGA7AayBb+gwkFoezbIWMjrvIkb?=
 =?us-ascii?Q?oKNcCG8s6iD6MVgd9EpwcALo7fAabKl3i1bV5cKEd+E8FfruIti8kvDC1r67?=
 =?us-ascii?Q?7XrFqwJUH7Itj1doZs/hRTJpHyAsuGyya2W7+DEX+1u/Dz40rgRfroPMhKUl?=
 =?us-ascii?Q?DbS338PpaMBNde9xgRExNBB70slrixythXdtCarF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26501c5f-c4df-4904-6b2e-08dd9817cd23
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8567.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 03:30:15.4046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n7du9u21PjzopHqa+8OCPUM8JiCmOXwnb6uUEv0uIDIFI24T2V+BEvUafJScuR5U5GP5tQNmxXgUm6hqI71o5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_203019_675185_1340BE0F 
X-CRM114-Status: GOOD (  16.10  )
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

From: Haibo Chen <haibo.chen@nxp.com>

pinctrl sleep state may config the pin mux to certain function to save
power in system PM. But if usdhc is setting as wakeup source, like
the card interrupt(SDIO) or card insert interrupt, it depends on the
related pin mux configured to usdhc function pad.
e.g. To support card interrupt(SDIO interrupt), it need the pin is
config as usdhc DATA[1] function pin.

Find the issue on imx93-11x11-evk board, SDIO WiFi in band interrupt
can't wakeup system because the pinctrl sleep state config the DATA[1]
pin as GPIO function.

For this case, do not change the pinctrl state in suspend.

Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>
---
 drivers/mmc/host/sdhci-esdhc-imx.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
index 5f1c45b2bd5d..f206b562a6e3 100644
--- a/drivers/mmc/host/sdhci-esdhc-imx.c
+++ b/drivers/mmc/host/sdhci-esdhc-imx.c
@@ -2057,12 +2057,20 @@ static int sdhci_esdhc_suspend(struct device *dev)
 		ret = sdhci_enable_irq_wakeups(host);
 		if (!ret)
 			dev_warn(dev, "Failed to enable irq wakeup\n");
+	} else {
+		/*
+		 * For the device which works as wakeup source, no need
+		 * to change the pinctrl to sleep state.
+		 * e.g. For SDIO device, the interrupt share with data pin,
+		 * but the pinctrl sleep state may config the data pin to
+		 * other function like GPIO function to save power in PM,
+		 * which finally block the SDIO wakeup function.
+		 */
+		ret = pinctrl_pm_select_sleep_state(dev);
+		if (ret)
+			return ret;
 	}
 
-	ret = pinctrl_pm_select_sleep_state(dev);
-	if (ret)
-		return ret;
-
 	ret = mmc_gpio_set_cd_wake(host->mmc, true);
 
 	/*
-- 
2.34.1


