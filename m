Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 405C2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 04:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gvH2OEhEv2g+GkSYTINHghPKZJlwzTs/Gkp7x7ReNBg=; b=HGJAlIdXsPqytT67lcEvl5CXGC
	DJd1AifB4xr0oaE5gCO1NzSWsZ2gHNP2Vu2NmZ1AmVF7aaIHleYx1+2uyKQsQyWJq7EUYVeoaW86k
	8HxNywQlw6/Nh6A/fhc5QXSUjejlKqxAhzcfcg+huFoYj/tMEHDoVxbx7hS/Y4hJRx4tmbsq2Qoym
	aObvywEaLs/cEkvFA96ElvEAzr+Fu+itL0XsFGwgluer1M1q6ykzrRkb8Ujv6Rk56u05vAlJU45PO
	gkD4sgTdsm3H+pQwUAlMVt34oQtwMzA8GkztdQIqVc67za6H//yQjMOcKCUhBimy6jaq0m9t9RPMX
	9Ijo1Qfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj8Pb-0000000867g-2iab;
	Mon, 13 Jul 2026 04:36:59 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj8PZ-0000000865Z-3vXZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 04:36:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TFmdJkHnA7I92xOpBmiJIOvGLUoq0lDlHpT/kdxm3g6xgz+Xt7Ll4Kp1y2AIN9pfq6rXXIgNsAx0RhM9+GncCvAKhh+Hw4ca1IeHb+jt5+NCIGVU3ihLDRnf3CvuwQ24yV8uWsrxoiAtcWDWCXY3zCLn2Ua6nymipy6H/iFsMlmcWZPn+caWdq6DRxoFSAqmO8Y2W0YJObHFfjtMxP8qFL5+lYS4ZAnJPch0vJhXK2jL6nByuPCxfcct9gMf/IqXG1ELfrtVEqkDB3ndqCkEZrEfxAKF/Uu/UjUAXONI5cUd3vcKuMlDEadkEZfevMSHhw9KBYEuv/R+dohjtGAQRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gvH2OEhEv2g+GkSYTINHghPKZJlwzTs/Gkp7x7ReNBg=;
 b=gjHD2n97F07JN8wjBHr6A4b1GyodTlwOq258jJZL9keSqNgaTIhgP8pJjj74hWkA64cnzTmLAAQQT+UgLvrmM8FYivV33fRR9sT4XFslo66zs8xdl1Zb35FX3RUXGPSh25rW+ThKpnLw1DnHMe9u+jKZvq0TFjQcsPoJguZvs319l3frD0zafbJXwKNmQnvHrAZeBvPDW/54M2rgHeLI8Epabahy+DGlFurRPyQCjAarPDW4XrTxye4p/ia1/HQPn83d6/Bg4LLQaCLFHEgIKrkx6ttQT5RLqH/6HT2c+jK3w0J9qM59U7LbkeUOWCJLgt2QAp48OHFrIVuBrOlc6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gvH2OEhEv2g+GkSYTINHghPKZJlwzTs/Gkp7x7ReNBg=;
 b=HU49DooPwjYolNM87A9Fq7V/+lhQn4BEuLudZPBQoLUFPwyV3CD//a3Um3Qe7uxrVyL3zFZVwo6vsfQp1VY0PByw6T/NwIPynhoRB7ARtZo+siuOF8Ybwj5TO8M6SHjarlUeHNk1GWYitA+xjWOwCdzOKx/EcxRwb1iqRfvozopV3M8OmdZjlk8YMcOBJdkIlTpkxw4oBHhIzMrbgRSxGFr889rf+36ttjA5kXCABwEmQJyUVboCZQfON9wj/WfcQI0MAylIRP23lqG9MtD9ZwXiQICOGsi6ycNYHMWJX00wQiDyy4EYH/AabtJbEngtM+xUi1eU9WO9tm9QHa4JYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU2PR04MB9180.eurprd04.prod.outlook.com (2603:10a6:10:2f7::6)
 by VI2PR04MB10666.eurprd04.prod.outlook.com (2603:10a6:800:27f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.22; Mon, 13 Jul
 2026 04:36:53 +0000
Received: from DU2PR04MB9180.eurprd04.prod.outlook.com
 ([fe80::f94c:ce27:1558:fb05]) by DU2PR04MB9180.eurprd04.prod.outlook.com
 ([fe80::f94c:ce27:1558:fb05%6]) with mapi id 15.21.0181.014; Mon, 13 Jul 2026
 04:36:53 +0000
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
Subject: [PATCH v6 5/8] mmc: sdhci-esdhc-imx: disable irq during suspend to fix unhandled interrupt
Date: Mon, 13 Jul 2026 12:39:01 +0800
Message-Id: <20260713043904.4144172-6-ziniu.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260713043904.4144172-1-ziniu.wang_1@oss.nxp.com>
References: <20260713043904.4144172-1-ziniu.wang_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0220.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f3::16) To DU2PR04MB9180.eurprd04.prod.outlook.com
 (2603:10a6:10:2f7::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB9180:EE_|VI2PR04MB10666:EE_
X-MS-Office365-Filtering-Correlation-Id: f8206a3a-9b4e-49b5-1faa-08dee0985d0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|19092799006|11063799006|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Nb9wNQYE1mCa68YSXxdS8zS/MRshVW7alw9SmBkV0zFGEuBIcOYIoj0FfeM4kGagCgU9LfSutARGvX1LAtBVZuSFAoMoUUTfjTr4o1IX+H5ZGZc8qcXVpuzBT+FHrkIVa++9U417MCRE8N+1laAVjlnisxq2FiPSpM/+RQ5uss5Fitc8TjGwSrtFke5PVwBNKDOqbqcuEmx8yxm0KJbFJZDHQ5JBh3VBavG2iBuPlLKeatjpyJiSpsMH+xLDaYe9GhPHUkhjovPYx93URUQh6cYJUher29cxbckFrzldB5MmWuk6b6kEaVttxrb1kcjG55ZqXDD/UiVzvjVOuBmeaqlHfP0ohFVY5IdYlXkmlJ3vAU7DRFzcmAX6FtAXGHawRmVYx7If/+pFXDcDK/AhZjuSbKU/BpOfcy/g7PSPGM6m4GSo8NOscNnhf4PLm86owLY4TPEKHmlBJ3U9rAkquAC+97K42p4RLmjv7lQkaMIpBqJ2b93WhnsJD+2z3ATL/MIY7Z80iZpiyuqQFFNfWfD5sq6Zpkk6HAWq2XGU3zqhr7uzJEC5HCfkX/qOXacWsWwm4BT+ZIzUBEdaS8+Y9wGQjGVBwmvRHPx38zhyqUCT/6havHz0Eezyo1pUuPm80dnOsFUUyovHVA4ktJxPOfIFqTsTcnPzyF6tjRbYbBc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB9180.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(19092799006)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8FiEti2ZznBtu+ZLwI9D5Ni3lGlBLkpxVzBXeqtHpj9odqosHjHpwhx3fL9q?=
 =?us-ascii?Q?8fc85FXcp8y23leUzRNq+PpWd+UPzHS30IqfPZ36rHEHleNHEBZVtKe++IR2?=
 =?us-ascii?Q?Bdn8UdofJpSqiGs6CrT/m2s0TaOcIcRmocQKQj0KN/aWWiTDGbYeu/ZC/1C8?=
 =?us-ascii?Q?d5EbwAVyN56Lh3gb4akbkfkkl7y1biRQRoRVeCh9jxB1UgAjDLlz+ld8QaxD?=
 =?us-ascii?Q?pu9OtfBFaUNkmmTxkyObUxaV+uel2+nyyyifTixLV45cjLTonuz1GDJPY2j4?=
 =?us-ascii?Q?bmjOrs/Ej2L8+ex+K706JP/Zm29M5YIGiX5bScAJ32jVGJ1K4I81tiqwk3em?=
 =?us-ascii?Q?z3C5Tvvjg/MzHScj8DhP92XAz+YglvbkfZ8n178OyOEKrEncRZT3OZij8H3I?=
 =?us-ascii?Q?eVlqAv9MvDwyZUNe2YQcYNnmXjcnyODPA8OBPBT9jILHVhvC+TAGWi1QhEQz?=
 =?us-ascii?Q?+DK1T4GP2SSOlTSSA3E2BzY4r88m6lq387QM/TO/VjMF3utNKXCMdQtvo++p?=
 =?us-ascii?Q?Xgh2Gp3kCoCFVrqAGPNXtR25RRUN1u+0gKcvNgmuRIKVkSBAO0xlY0k5Z5KI?=
 =?us-ascii?Q?5xkCCRgh3Ah5arfQ4Xm2bzu+HQw1yQOMAXCIvd8idDotTIIZiAjvMSbhB0f5?=
 =?us-ascii?Q?LjIvsk3JckdCa4gA55V/dkIKxDkxlC6uDDr8RAN48oiIxwdlMtgxkLEwfoBh?=
 =?us-ascii?Q?9AKbsS1gSasiNgos8kp1viOdekupapN9S46N8WhGbJ3/QsZc6ZESDWhPPIMo?=
 =?us-ascii?Q?C7ivCnfKaaJKv1XRR8Reobaz9GFnTZDTz8kpla44vvD3oO9RCqtQg5sd1Jfp?=
 =?us-ascii?Q?jdM3rb7Cf64YjobpFlsqNR0FNWobF/gsIb6btxc4eLHRTPUtRLI+ait7Kext?=
 =?us-ascii?Q?1TtkYIYswdedpXDr3ebWPgNNPsp+L74hEbIkE2jYzyDkw44/++gpRbK2ZTj4?=
 =?us-ascii?Q?G/rwGePEXb1mQI7VNizmtr2h2J1aWLlrdIpBErpBJNbKszWZGuXidLwD6IjC?=
 =?us-ascii?Q?1MH+AcZqIKKMiF86nVQhVaoKykQR30gi7+w9+bp0E0peWgfdeJLjV70v3hmd?=
 =?us-ascii?Q?0DcEU0xSQR0cyyFqqcEXzSqByJfKdUCqttKF/Wdu0kZ/K97XQTFt9EJLPBvt?=
 =?us-ascii?Q?eNeSOf1DbBXEKcjj9C5BUgCYfHRv4TeRuJDALHslygMNZ6Ut3cyWlYx/XNoO?=
 =?us-ascii?Q?7wSjZuHWoqM4HoZQ2nfZpY5VbEzu17QpqrfpoYc3zcWuIMA79lbjJUgmEFZh?=
 =?us-ascii?Q?SvOK1n3Xwhjmcrp8jJtzHkEfjArOUS8vYczJ0aeIlw1caEsTq1htoB2T2Cvk?=
 =?us-ascii?Q?T+wRGWIgWD/s8RnJT7sJDpXQ8860s0afL5cDpX4WlmDSuhj0tjwRZtC9x+JR?=
 =?us-ascii?Q?jJiudMvq4OJXcYAcc4YGhmo9qIUSpJDSFx69YKcKLcpnrdnFl0hVIizvbnNR?=
 =?us-ascii?Q?S9OUiT07OawWX1IQu9tKSNBn68HvfFOVNvRAE59j9qhzSImCYFhWkrl+HjHE?=
 =?us-ascii?Q?lmRvJb7OHlyLAz5MQYqYu13owv7BJGeR8pT/G9kTyLFfDTWxYnRiFN1+5pKF?=
 =?us-ascii?Q?YiOLPRTulV+EIc6+0ynLLKBlrXWXZZAelngRYTUdU5sbUQxYjUd6THYapppf?=
 =?us-ascii?Q?ZQPIAoxjVK7di7dpmW642WLY9k7vthREdAV45gw1St063MnO3WgjQAsL8cNa?=
 =?us-ascii?Q?wFWa6aOvz1K2w0Qm3zC23yHSZSiLyOdCu9JbScxODD/9oRRJ0uhnS1i1fDH0?=
 =?us-ascii?Q?Z1K2YXV1tFrYzAe2eYIr+sFjHwXAuZC9M/Vmon6lySxQNFdJH3NZvY9LCgrh?=
X-MS-Exchange-AntiSpam-MessageData-1: F0TwdD2OKA5qkQ==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8206a3a-9b4e-49b5-1faa-08dee0985d0e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB9180.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 04:36:53.5126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: opIsz/NEYVlGqVfVJl83VPvmMw8dO7ESkPtKXj6wIZtHX6Mp341sIiUAAiqI5oNIWDoOlRRVSwge72dZOz0vacu+djwYKJmhY2R+m5acZCZnCpn5fIqXBtAMY1YOyerC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10666
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_213657_985156_F8ED093A 
X-CRM114-Status: GOOD (  15.11  )
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

When using WIFI out-of-band wakeup, an "irq xxx: nobody cared" warning
occurs. This happens because the usdhc interrupt is not disabled during
system suspend when device_may_wakeup() returns false.

The sequence of events leading to this issue:
1. System enters suspend without disabling usdhc interrupt
(because device_may_wakeup() returns false for usdhc device)
2. WIFI out-of-band wakeup triggers system resume via GPIO interrupt
3. WIFI sends a Card interrupt before usdhc has fully resumed
4. usdhc is still in runtime suspend state and cannot handle the
interrupt properly
5. The unhandled interrupt triggers "nobody cared" warning

Fix this by unconditionally disabling the usdhc interrupt during suspend
and re-enabling it during resume, regardless of the wakeup capability.
This ensures no interrupts are processed during the suspend/resume
transition.

Fixes: 676a83855614 ("mmc: host: sdhci-esdhc-imx: refactor the system PM logic")
Reviewed-by: Haibo Chen <haibo.chen@nxp.com>
Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>
---
 drivers/mmc/host/sdhci-esdhc-imx.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
index a54da5757acc..d980dea9cad1 100644
--- a/drivers/mmc/host/sdhci-esdhc-imx.c
+++ b/drivers/mmc/host/sdhci-esdhc-imx.c
@@ -2077,9 +2077,10 @@ static int sdhci_esdhc_suspend(struct device *dev)
 	if (mmc_card_keep_power(host->mmc) && esdhc_is_usdhc(imx_data))
 		sdhc_esdhc_tuning_save(host);
 
+	/* The irqs of imx are not shared. It is safe to disable */
+	disable_irq(host->irq);
+
 	if (device_may_wakeup(dev)) {
-		/* The irqs of imx are not shared. It is safe to disable */
-		disable_irq(host->irq);
 		ret = sdhci_enable_irq_wakeups(host);
 		if (!ret)
 			dev_warn(dev, "Failed to enable irq wakeup\n");
@@ -2130,10 +2131,10 @@ static int sdhci_esdhc_resume(struct device *dev)
 	/* re-initialize hw state in case it's lost in low power mode */
 	sdhci_esdhc_imx_hwinit(host);
 
-	if (host->irq_wake_enabled) {
+	if (host->irq_wake_enabled)
 		sdhci_disable_irq_wakeups(host);
-		enable_irq(host->irq);
-	}
+
+	enable_irq(host->irq);
 
 	/*
 	 * restore the saved tuning delay value for the device which keep
-- 
2.34.1


