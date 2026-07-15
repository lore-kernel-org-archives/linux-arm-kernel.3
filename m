Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF08C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 07:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5seD04kAIA01xneD04TT5Ng8/k1WOoLpk3Snyb77S0Y=; b=cI1fPR6vt64csL9UTvPRtKwBxp
	Z6ggd2UG69uuSwbFWnDp6UiFo4w1Z9bLD6V49ss76ln1/xWJI4PCf3RYjyU05GtvY9L0h+Fn4Xonh
	wgqidCRncY7Xvc56P6Ncmxvd3FZhgltfMV4oUoQD8Z0KRcqyp0vp1KZ8vLHmY6jzP/t4y5zrrFJ2t
	6ydXIWYrGYmuXoeZvdhKJkErBiPrxYno5AGkatr+Iv01OAABZNfR7IZVEK2S5bjtzdmvYLjrc/LIe
	Aj87a8ICIFx60XYsym2J6RKlsK/mJ1F0tpmazFQV46RcizNnQzk6hrMKooy8u9HANKmIR4M2/mtC6
	C7IS5Viw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjtr6-0000000DzsI-2DLz;
	Wed, 15 Jul 2026 07:16:32 +0000
Received: from mail-westeuropeazon11010019.outbound.protection.outlook.com ([52.101.69.19] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjtqw-0000000Dzl8-2wXb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 07:16:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BLcJjqzTu897nWRJlHa9gEDCz3siR8s5TJR8cTnzm1TVAfV5DXvdHFp/7cCg1TdbR/Rysw3CECF17BvGCy0kyts+TM6c0rFpfDGbeQtMTYmAP8fiJzWLCTdih6mZ0H6eY030X+6CcgCsrkVOgkQeA28cEx6vcM7jwCtlN3aXwlRu2M7vMc6+PuxGh2CbF0iwDBmF/vd2fE2Xv/osth0724KjqemOTfvzr6JOQ67itH3DeoOd5FUz3mbcW7TD4Wvi+pPsvpPNlgrtuKiXW9bWHVvKwEobkhh4zCV+KKJcP/sX/GQJlJMEZWkaZtbfTu17ESaYyyeDVuJ2xz9iRBqe8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5seD04kAIA01xneD04TT5Ng8/k1WOoLpk3Snyb77S0Y=;
 b=Wyz0Qfm6ThdP0oWbi4uyhYLWGkImaEJYaUUSLjcy77FYT97IMY/sn/C2vqDnbUhVFEN3Eoq1qtX9un4A06mBGJEiK383xIwxch3JcUdKRauCBbNgmdc2aR+Ib3xcieKz2hE5FTpxs1gc3oYOMvWTWtWl2uuFaQm/s6Zh8QrMi9nlzWphirRr6KDAE1evezPsMryUzJLWpY8dyRTFuyRI9LZWIF4t/NR/68poEUegLmE499n+gNEpoTxZ1uFd2NQFEmLetC+iEk7IjldY2l+AX+y/pKQ6UwMb9E9AVF+6bbWxUyNj596EF1UKQAfqeGnjbu5TQlPnycjLy7sjN4P2QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5seD04kAIA01xneD04TT5Ng8/k1WOoLpk3Snyb77S0Y=;
 b=KrpVY/sdHZuUREkaPqEY3Hx1cvzG2hIfUQBt2pA4hb3uyWr2u4VBW7HCiLxVKdJmkgV6aq1G3ZAJBPS43VWsrwqvIWgtVyPjX9WtRNvDeSoNhsci/Svoh/7ITY0v18N4JZNsA0me72MUq2AbCpc0OJxdF6v4SxO0zq1qA6I5O6J8YVt9S3nVbUnnvC9jy0Q1F3ahHdsZBUAe5ZTP1ACZIKuISYCERARrix+ALM6gRterjyFrC1xBFri7cq2e39fH86x2SDZdyXeQHpzy7sdxJH+wXK8OMApBEiLpTZkYTQJfGETYZQl0XuFjbX+rMe+9qiU57/DlXgwXVgD9Pqqmgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by DU4PR04MB10981.eurprd04.prod.outlook.com (2603:10a6:10:58d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Wed, 15 Jul
 2026 07:16:19 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%5]) with mapi id 15.21.0181.016; Wed, 15 Jul 2026
 07:16:18 +0000
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
Subject: [PATCH v7 4/8] mmc: sdhci-esdhc-imx: restore pinctrl before restoring ios timing on resume
Date: Wed, 15 Jul 2026 15:18:14 +0800
Message-Id: <20260715071818.272318-5-ziniu.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260715071818.272318-1-ziniu.wang_1@oss.nxp.com>
References: <20260715071818.272318-1-ziniu.wang_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0059.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b8::14) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|DU4PR04MB10981:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c70ad1a-da27-4dd9-dede-08dee240f750
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|19092799006|376014|6133799003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: PjSeagieoF8UqR4nIJcckD1K821QPyv4yBBnOHpSEWf+UDzKLcCWOoIxUbZGvGO6CrLPESyRkIVvcJ1muhaXfnK7Q488TqIqgiPOuCHjh6eFxZmTcaRyvqhBGGQvpgpMldWAOKn3DQ2dgw6pTHNDidIA/n/CLaFbFFZwYJFFZ7cGRG9JqdRDbM/Dwma7zNXKtPzlrIs+uCAwfqkqOBbY8C2YwJAq2oVM9OFISQbGX5QihzDXj3pRsLIKaPVoAe/GY8agYY8jZNFzdze4sTvwRxoO2eoCW1xiKYzaMgLcmeKVpdbakF7PVVtrn0VXaAp3xHc5pFhF2JdzSnUXu1KSYnITSlNWHXIGORXsiMT+YXJCPVoG9pIBDl1yISmjYzV7jgR8fDgE5STLvBN1uysiv61yvLX1TdMoqJ8PywOzdTg5j2hi4PqmvniC4eo55qGh39iS65k86MhhQk8frV2t8XWZe80vpeDzkAbbAo8WT9WkcSH/Us3cKcayD0BFyNHGJx0VJwOfxE1ehBqhPQ2AIdO/pnuGZeEKqfrJcnhs609tK27bR8PbcCl4h4g+dxTXFGd/HMPRUZHn2zxx50+gfrCLcvk0f5mgFzCB+jChZEy9jTTuXhJY2m0ECJ458ue1SFNoDG6gGSzOFyxcoT3ZmGgEepU0O9DV3Pc+h4LoiCY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(19092799006)(376014)(6133799003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yMrOJMk2qXwwCnTepqVYzivckazNi8L/WfH9GM0HB9YaTbj1tHQ/BjLP2joI?=
 =?us-ascii?Q?YdGD9Ha/ozxRTNSjp4LxQomvBIjnAzTpa7PV5d+dWUm446MEyEsztHHEllk4?=
 =?us-ascii?Q?qvuxRrHhyNIBcChsSvFY/I5xgmCNCog28BY0w0TeNE9CaWutL7v5W1g7D2IM?=
 =?us-ascii?Q?A7/W3HdxJNfb0rhn3xF71RKsz2YK7aH+bk8YdFWgmkaEcOR0u+ma3IpPNst5?=
 =?us-ascii?Q?6/E4eYRYjwp6chshGwmqi4dQViYoQ9py3m8dSNtx7hmoWEH/Sf4LwaqmdSyX?=
 =?us-ascii?Q?+Cz7pQPMbe4QDbF/2ZQC/mYiiGhCLYIDtR17xSI562q7/YNGy+x8+kDVgLcL?=
 =?us-ascii?Q?gggnzodugzBKSI14BP437RKsfYMbGZiBE6GY1/qL+0w+lHKZ/DyBd3CJWKSg?=
 =?us-ascii?Q?HL6ZSbFdddvyiu/DcR9GlKY8BH86W4t7DjVPlhjkepSH8w4jRj0FfnDgSQOX?=
 =?us-ascii?Q?b3YC5VsD72T9oSbvquUeKWVUia23gAMEvgk+tOObGa1dkEi1g5aNHNsKlZdR?=
 =?us-ascii?Q?0p2CdrhjVo3/knPRyG1E1EZpmfObwQqH3EQDYu8DClT64Yq8wZQC01H0kuoR?=
 =?us-ascii?Q?UN6EyrVQAP2s3BWabf+V3O3XTz0j12umnqnStdEXweu2gNsB+mVPXU25be7j?=
 =?us-ascii?Q?e2O+lVpJINm/maQ0OJtxU4Omg6+qKgPmVT6viy5qv+aYS3Rd6a/lE+HdTTZB?=
 =?us-ascii?Q?4fYU9sQjrAuAaQ/MG7vcTfTSdeO/z390V+1SY+6Bt3bkrLAMqKXnG+DjP9Zl?=
 =?us-ascii?Q?v9+LJhR0TMEuMqrRkX1ZlYt164UsPOqWAfyI3Cd2ScDNgskl20K5esQAtCY5?=
 =?us-ascii?Q?+/V+wto69nqBfloCgcCmABwKSOdH/tOY0i5wjv23UbZ+QWo+HPaxkv3Yv/o7?=
 =?us-ascii?Q?Npz56L90sPl3QW3lo58OGcSQX1cTGvqZT6VR2Brx1/S9Q88kv+Fa1b25uQxk?=
 =?us-ascii?Q?PUlK+dSClfD50Lhs8oFyXuzJh6koYzMMQDNvj9UhYTDIoYTGlo63zYIy7ZIN?=
 =?us-ascii?Q?t6yJubXpOtrBTjPjicPUt5RcG8B6/Fr954oUWXDkb6Pu445MWM5MB7QDyfgn?=
 =?us-ascii?Q?+l6bnPxdSuB9Cx5CWQ+Sh/P1KNaDYciw8mreV6m/Hjy0jlpYYQ77IfHoenkt?=
 =?us-ascii?Q?LFv9cIWJ1149ocuJgzrZiVeMeMTvATImVlvNVxXWub8I/3ZawMmtShRybPOZ?=
 =?us-ascii?Q?yQNjw0NeKNVd2cthAQLMZssWu1VMwg6cdR9aHFq+VjTfvTIK5YKfIC1JlrUy?=
 =?us-ascii?Q?DA0xBpPeYUoL4Q5nBiAKYE0ID1i6HmQysfXJfvo+o5VY50WztX8F8mgBHd4N?=
 =?us-ascii?Q?PT4efRvt613gORtGsRHQcfb+ZPZ849GRCLS4MUbI1b0lXSFpe+/0SYfiLCmC?=
 =?us-ascii?Q?OJjCnhDXgrAapk2z9hrIGMRy6pMrNaxc1QH8+6yewCKbBAGldMS4hVILrJ9x?=
 =?us-ascii?Q?U8pqtnuiJXFRILoLeQxDe1rUvQGofWJ+NGHt+wYWWINHB/HrrZcBWTHMsVA3?=
 =?us-ascii?Q?pgVtln5dtt0o+YlfnWKVljoQa5+bGtjUKzEtLotq/DUrKD2QweoowSAHoc0w?=
 =?us-ascii?Q?7gwYSecFhg1X+xaAKPgEZB4BBHzXW84QIO+bjyAgMGc3Vs/JLlPdW2u37c3Y?=
 =?us-ascii?Q?yRIjX/fMxmUuWY6FaoZsAW7DahMk9KK6oGTYdeCDr28xo/qhVRCOkYC95GUj?=
 =?us-ascii?Q?66HrPzTFf6UTNtEdPR5IljeUPmkfUzu4gs0kd0ZViIFhcK/DyB6WSTJXdoxb?=
 =?us-ascii?Q?B7Xfzzevp1qPZe6Yr0YrfiEp3U96p39edweQ9bjVPWsRK+HfUkOz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c70ad1a-da27-4dd9-dede-08dee240f750
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 07:16:18.9465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TgexiD+w3aGGMGWst9e244UeIJkzQ/tnkdCV5vjbtRqQAJRBnG+0kusjoA/+rIyvf1d24U2DUnfPVGMCs2L3ZCDLTZvciweRoR6KIMhAM/3TMH9KaA4r3wE9vdrRL64D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10981
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_001622_749540_D838DC1B 
X-CRM114-Status: GOOD (  13.88  )
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

SDIO devices such as WiFi may keep power during suspend, so the MMC
core skips full card re-initialization on resume and directly restores
the host controller's ios timing to match the card. For DDR mode,
pm_runtime_force_resume() sets DDR_EN before the pin configuration is
restored from sleep state.

This is related to the SoC IP integration: switching pinctrl setting
(changing alt from GPIO to USDHC) impacts the internal loopback path.
If pinctrl configures the pad to GPIO function, once DDR_EN is set, the
DLL delay will be fixed based on the GPIO function loopback path. When
the pinctrl is later changed to USDHC function, the internal loopback
path changes, making the original fixed sample point no longer suitable
for the current loopback path. This causes persistent read CRC errors on
subsequent data transfers.

SD/eMMC running in DDR mode are unaffected as they are fully
re-initialized from legacy timing after resume.

Fix this by restoring the pinctrl state based on current timing mode
using esdhc_change_pinstate() before pm_runtime_force_resume(). This
ensures the correct pin configuration (e.g., 100/200MHz for UHS modes)
is applied before DDR_EN is set. Only restore for non-wakeup devices
since wakeup devices kept their active pin state during suspend.

Fixes: 676a83855614 ("mmc: host: sdhci-esdhc-imx: refactor the system PM logic")
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Haibo Chen <haibo.chen@nxp.com>
Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>
---
 drivers/mmc/host/sdhci-esdhc-imx.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
index ead4685d621a..a54da5757acc 100644
--- a/drivers/mmc/host/sdhci-esdhc-imx.c
+++ b/drivers/mmc/host/sdhci-esdhc-imx.c
@@ -2115,6 +2115,12 @@ static int sdhci_esdhc_resume(struct device *dev)
 	struct pltfm_imx_data *imx_data = sdhci_pltfm_priv(pltfm_host);
 	int ret;
 
+	if (!device_may_wakeup(dev)) {
+		ret = esdhc_change_pinstate(host, host->timing);
+		if (ret)
+			dev_warn(dev, "Failed to restore pinctrl state\n");
+	}
+
 	pm_runtime_force_resume(dev);
 
 	ret = mmc_gpio_set_cd_wake(host->mmc, false);
-- 
2.34.1


