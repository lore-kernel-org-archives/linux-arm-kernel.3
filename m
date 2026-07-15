Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 407BFC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 07:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MdLDYkWyWiJ2CTqf35B3bvhbjM7PIcSppgnmNL/kALM=; b=kqhjkDW3p49KzQEWiK3h6YWldc
	yMUUJbTXqH5NG527OlirBTClb/X6X/dBEYmmZMlFNV7nOMLb8nL3NGV4dewkfx3oOAf5HenPyQeiy
	Uhu6W2VuRribKNiIhPnGRdoWUDZNGYvzW8iQsetSWoGfHv5HxCGceW+9tdmXkOQ6v0ywkkjEgPLu+
	HD0HK7mbI7Zi/iaw2sTdDbBkH8L/qcNDd8MopzdBbp8O6CpMkuWVLGf/Yu8I25l1GsniVZ2/F9W8a
	3a+ttBku27Qf3ufQ2luYdFmBuYHxaPJU/TS2fUISUnbBcBgFxcBs4bZSTzXT7QWFKALfc/TL25gf1
	M/0a6Q4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjtqj-0000000Dzcp-24lv;
	Wed, 15 Jul 2026 07:16:09 +0000
Received: from mail-westeuropeazon11011065.outbound.protection.outlook.com ([52.101.70.65] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjtqd-0000000Dzal-2pAy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 07:16:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=evG21JFY+J2RAXpO8tIJU58/aM5o464ogLl6ILeklx1LFarghTge5x/IpTA+rMVpoZYEb+G7hLPcjy11WzTnLsywn99koIgRn9uBUj0Q2IQJgjEhCpaQn7anSPwBl0fGqf7W+qDyENZyaqLZ2JCKElutHKyET7w29Qe9s0eXrLjFrNS7Hyz6QyF2gPxXlnlX4ynqf0jC2qb0GDva1o+rwxUk/90cNhBfXj/AocZWjWdQyFje9dIwclY0C+gpQADU0qXn+NqGKXi5IlmRDCdJ0mBKGY2OACqfvbCrZooXWVSPu/t2MVSVZbxIzRcGR6aZAFzOjaoHWU/038CS8bRxDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MdLDYkWyWiJ2CTqf35B3bvhbjM7PIcSppgnmNL/kALM=;
 b=VWPUJnWZngmeHBWpT08YmgUDcKChUJB+S9zQhoym/xmN2YOGwfc68mt5hve9GGXsukYHSIX7ivLTjD8Odrn0AUhlD5RvHP0YUUfOSa8zHickKU8TZqHC3NHtKQjk+oV5i7wNzXO3c3nSRAkkJ18S5wzPXolE4Q6cyx5WHGFkIKiYF9+YY3oUQ0xsfF45Fpq01U7BycFmC6EDDcYdE2a5JeBTiw6BXCqHekoMIAlD+3TyCzMitMsi2dHaVYyg9bonBG+LeZVl4DHF3BRxFJguiP6Q/Y3eoMgBQFY1dCnn7uQ7kMP+Z267YCKmlfhQgxYftnegM+LW/a6DiLkaNZ7aBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MdLDYkWyWiJ2CTqf35B3bvhbjM7PIcSppgnmNL/kALM=;
 b=QNppkCeV0ajOqfoJqWJGH8VvPvRud0+JHV5zsQMcjkF9FQokQMzYpOQ8TV/N0DQIm4CsKJi8b+ykbuMLPD6sohT5HRoq4nr8Ld224MFV03EASGNMTD5TIjOMHkH/IdXB9FGcuvICbrLqccZT19ttSxh9f/zOGIiuwuoi0IFLBViib+gPbWFMr08kGMPgmF7C6kJAR8LZU9H2R+15HOOwq+VYPkr+RGFjMA8fXvTnFfYTjILZiSgziUxrfNacpPL+FTSj+4UAFix9V3Esjim53/lGzCDNuVwLt8EGhSKAE/f97qKNBorstFrulmMxK/IoUdWDDKi2iybgZcmGT/dNBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by MI3PR04MB12681.eurprd04.prod.outlook.com (2603:10a6:290:7e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Wed, 15 Jul
 2026 07:16:00 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%5]) with mapi id 15.21.0181.016; Wed, 15 Jul 2026
 07:16:00 +0000
From: ziniu.wang_1@oss.nxp.com
To: adrian.hunter@intel.com,
	ulfh@kernel.org,
	haibo.chen@nxp.com,
	Frank.Li@nxp.com
Cc: s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-mmc@vger.kernel.org,
	s32@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/8] mmc: sdhci-esdhc-imx: remove unnecessary mmc_card_wake_sdio_irq check for tuning save/restore
Date: Wed, 15 Jul 2026 15:18:11 +0800
Message-Id: <20260715071818.272318-2-ziniu.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260715071818.272318-1-ziniu.wang_1@oss.nxp.com>
References: <20260715071818.272318-1-ziniu.wang_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0048.apcprd02.prod.outlook.com
 (2603:1096:4:196::23) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|MI3PR04MB12681:EE_
X-MS-Office365-Filtering-Correlation-Id: 828b91d7-17f4-42ff-3b3b-08dee240ec84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|19092799006|1800799024|56012099006|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: pj3MKpbfDJxBFcV/YvYapVRLxxNOIFEvZasxmt5RgRy9lmD665if0Hgcgtmn76YyIvtxN5iFKXS72nb9/f87D0ZsESCVcYXSCndU9xcprA/cdji65o25kvc6T/eOKgxvQHdIoU2b4vCjsSD3qhbdO9C1a0bycKHxmwHvKXUeUk+NxE1rxe7nDtfuaqnT3p1Ei8OsM2PNBzIZYLaW5bo5BikWIb9+fgMKTbjItapysRDzFPtXl4KpToTdlifoIt23geAA0nx8cNHKDINWjhvBEskHiebnCZ+ZTHdIteYH9ujR4v9UyoMADTbmlVyxyO+evcTyIqYJxLbwee/ciUHLx+vGYcTNvE1xDvmn9qiL+FGmDi0saLXHjQERSyMEsCJ7OnyLuejxCn8XVNbmQmASnvC57t96E449Cf41OdJmPx2Axsb3FK7E8IJFDOfFwVV6bO8uiKrEUVnpt4KSKezcalGLOWjnVdeYaz5U3smnDa7PiEh8t06aIp9BUCx8lA9t+uNOO22ky2FAX0ah+stjz0Ell1zv4t3Qs/NV6bV+R1VP+xbAALluBVeuFr8/YMCo/s/qsGH5tfSYwqwDWcLrR+fso612zOXPIHTucmBX+lmFtQ9R2II4kvBK7D/wqg9Sclefo0/Ls01YCU7RAvGYYLMk0MhtNwghT7GDLzkzViU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(19092799006)(1800799024)(56012099006)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0baVeW5tJCobgzVFbDOLUyTnr2BFgiivRpF15v9/idBIT5opRTU8QBDmhVNI?=
 =?us-ascii?Q?EL/fE0EX5sAhQcGR9s6bOxbLHwLUoL4oWhvtSZGY7OdmsCEFwruKC2G1sinl?=
 =?us-ascii?Q?cy3450FgoGghb4RPCaUSOyh5m6HU/tWZiA4hsaWUmVrnpMDR4f0ENmpGpF4m?=
 =?us-ascii?Q?VJkPoj3cHK7hIkav0nurGizLXi083CIAMzgdT4WmKmDPNT/Tu4Y/2pc3cetz?=
 =?us-ascii?Q?hJFmmynrLL7/tqaiswDqqWpFFYiffTSa6cv4JDiSFLUJYSB80RndP+ZCIZpu?=
 =?us-ascii?Q?XmIXWIujZj0Ndkd4xQH1N9UaRg7YC4qp4XtHIYmHvH6p0taRfQpdH2RoFdxM?=
 =?us-ascii?Q?NO1YgjH97aZYY0inLp9WVqECHJH+KKPO4LxxiGNyQb8h1cTLCWM+FARGSX5O?=
 =?us-ascii?Q?nnaYPcSAEXjmrkqL9LmV4CqNpHOIXsaIJle72PfxaIjgcjmTtXHOht9uHMeX?=
 =?us-ascii?Q?U5If74j1aBmD5h41A4WJ46+VlL4ubZQYcPHk1dOy+Zdy116p8uLUx8TKdVVT?=
 =?us-ascii?Q?HYsjDFlodfCaG6sws43jEYPqsaWl91aExfX9wWf+On9j0zem7HPpz6K8rTAb?=
 =?us-ascii?Q?XP3EInrJrztRXio+kwrMpBjbmbpsNsPIdqgl1WDrCEg9tgHYk7EbigipWysv?=
 =?us-ascii?Q?mSnLRqY40+TSpfL/WnVcweXcPzSk7CKeGMvKkjXSd8P2B8/oyFXEsZ+17Slt?=
 =?us-ascii?Q?l4SXfWnOd8Dq23/xwt+oCa4Qj7WMdMEM+XlsIhWJX9ThByuqnBqCjQdsj1gk?=
 =?us-ascii?Q?sap5LVzV7ml/ytMRaVQOYQrhZny2Sxb76odJ5AxW7rzUokBZDXYkNHpDkxJ/?=
 =?us-ascii?Q?slp2/kzLHO2bgSgmIjk4Yhuo7/rVBe2km/dKR/pfiN1o5MbGrTWMh69barpB?=
 =?us-ascii?Q?IxXVq1TO7gvmQnpif8DYxbH5aoJtunkL8elVO7I1+jqVpqFbKO9mYdQaiVix?=
 =?us-ascii?Q?yQDO42fiMe2X+pbHiGiIWtx8fg19YaZ6QXXFVqB7m2tyA2RO1rqY2O0cPvjJ?=
 =?us-ascii?Q?FB8H2bKfyV0sw6IwC/Rlg4bl+PS1xGWYUvC6jjTwZdYHvD/Eel1vwJOuBIXL?=
 =?us-ascii?Q?tNBcueg9lR0+qaUJY11Pdv3n66QdOXBHGFaz9yCdobklPEhot9c9NgNBX5DF?=
 =?us-ascii?Q?AK8EDgDdrz8Kxwctdv7sYPQSP1HWJXtawfM1t5mPuhwiyFT69AT5hEPcUs4m?=
 =?us-ascii?Q?t8FUKHC4IniJc9bKOu4qjnlKeFgCXi3y6YluHzu6E0jfx3HlDEOV12CqdyxO?=
 =?us-ascii?Q?woiVNl1YqEJKPfybcHxD2MXhDCGxUt7wtWERgOle4Zy6roo+14ZEnBBbIzxj?=
 =?us-ascii?Q?FpWqYyeKiwgrK9FsWYtRoLJ+o5xQMIVFHpAWmcZ3josrerT0JbfVVHdYiT9L?=
 =?us-ascii?Q?kxFaglhcCPXGVZ0W1ydZRheu8aFzh7RAu0ddSswEd7FY80j9T5eJPQF44CBr?=
 =?us-ascii?Q?8jGhT0TPOQqy893aXbY745A4lzd9hvX8/QKFGcuw+gas7OVCTV1SjuDexvqk?=
 =?us-ascii?Q?shohNxtamzbJygSLox59xLuq8GRH8Dagv3Hw/owj7xZBbyb/Tf1XqA1drW4W?=
 =?us-ascii?Q?OQerGatznN2Zh9i4OLPWqYxk3hrdH7geaUXfC2yJp5hQFYewcDO6NkqtrMBk?=
 =?us-ascii?Q?SkAsaqb3cFzi53wawz8bzV1H0pOShM2F9ARZjbTH4AXVa0QpEPDd31yegwmH?=
 =?us-ascii?Q?WI/QixorFY9Q+UHWPmoRl2eVn9Psup5KG/ufGnbeL9dmJA3hYvTkucWTr188?=
 =?us-ascii?Q?Lk3VphD8EIiZRyvV9LG2VInp9vewtIgtJ4CYk0dNXo2CdkNKpgpj?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 828b91d7-17f4-42ff-3b3b-08dee240ec84
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 07:16:00.8505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9OWyIYKxt5W3j64fcan8iyzzAlcNjcDPG0lkZLH9Kinp0AIj7/v4BxkTE57blNia2KxmzyUoJu6T7WHBOE8PMZYMhyuN872oi7bHYSDVkI8Vw1wxvOTKH3s4tfrekVut
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI3PR04MB12681
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_001603_721315_5060894A 
X-CRM114-Status: GOOD (  14.13  )
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

From: Luke Wang <ziniu.wang_1@nxp.com>

The tuning save/restore during system PM is conditioned on
mmc_card_wake_sdio_irq(), but this check is unrelated to whether
tuning values need to be preserved. The actual requirement is that
the card keeps power during suspend and the controller is a uSDHC.

SDIO devices using out-of-band GPIO wakeup maintain power during
suspend but do not set the SDIO IRQ wake flag. In this case the
tuning delay values are not saved/restored.

Remove the unnecessary mmc_card_wake_sdio_irq() condition from both
the suspend save and resume restore paths.

Fixes: c63d25cdc59a ("mmc: sdhci-esdhc-imx: Save tuning value when card stays powered in suspend")
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Haibo Chen <haibo.chen@nxp.com>
Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>
---
 drivers/mmc/host/sdhci-esdhc-imx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
index 18ecddd6df6f..6526d65538de 100644
--- a/drivers/mmc/host/sdhci-esdhc-imx.c
+++ b/drivers/mmc/host/sdhci-esdhc-imx.c
@@ -2064,8 +2064,7 @@ static int sdhci_esdhc_suspend(struct device *dev)
 	 * to save the tuning delay value just in case the usdhc
 	 * lost power during system PM.
 	 */
-	if (mmc_card_keep_power(host->mmc) && mmc_card_wake_sdio_irq(host->mmc) &&
-	    esdhc_is_usdhc(imx_data))
+	if (mmc_card_keep_power(host->mmc) && esdhc_is_usdhc(imx_data))
 		sdhc_esdhc_tuning_save(host);
 
 	if (device_may_wakeup(dev)) {
@@ -2124,8 +2123,7 @@ static int sdhci_esdhc_resume(struct device *dev)
 	 * restore the saved tuning delay value for the device which keep
 	 * power during system PM.
 	 */
-	if (mmc_card_keep_power(host->mmc) && mmc_card_wake_sdio_irq(host->mmc) &&
-	    esdhc_is_usdhc(imx_data))
+	if (mmc_card_keep_power(host->mmc) && esdhc_is_usdhc(imx_data))
 		sdhc_esdhc_tuning_restore(host);
 
 	pm_runtime_put_autosuspend(dev);
-- 
2.34.1


