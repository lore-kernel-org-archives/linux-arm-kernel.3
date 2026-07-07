Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 888DBC44500
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 11:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MdLDYkWyWiJ2CTqf35B3bvhbjM7PIcSppgnmNL/kALM=; b=bJhJpE3LxI6TO1l3+KttQoc7zd
	yzvMVAi8XPabpzyuIohUFIqDDW3MC8jEv1ejVaytZWQIdZUNUCmW9XjOiNiTg4yVgNPrGCLo5DRj8
	8PBCLvBGX7uTkgSpVRTG5hXtGwcG+8V9bXoGOP2P+gESp6I5MLialfs8thHpOUVK6DkYtMt2woZBr
	ETPD5vlOm1qNVnKlEokY4eqTyypvDg9ozr/riR77AbElrowoCg8iIkponNCQsJGu1kGq54UKAmGsA
	MHIFu7SBOuCazZXQi+E5b3P/RCfV/4ERl0vDGyOv1PnkX8K7UZi/KBvXo4cqU+lp9kO/5SBXHtXH7
	0q/5SeXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh3XY-0000000EnyW-0in2;
	Tue, 07 Jul 2026 11:00:36 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh3XT-0000000Enwo-227m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 11:00:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ybx9zdAmHx4VkQ2x13A/LDHKya0f2VOFnTQuaVjnwHjtJ4rwp/bylDyG9r6reiTPnEG8ThtrpYgb23IRx/cnWF3bXkTnhJRnzvS4H/VAnHGiZmRVZmSML4tGVQV/tiNPR5ai34eEImp3zADwTPS4C+aPm4zcWRfcTRxuDY1k5tdaTkkRXTlLUNh7M4N+jiIFnhOTgCkpYMIB9JWko97p/v0oFrpkBaMtsK4dL5UQdSBOOx6uYipSQ1c7FZyjv+5f9lWOxvfPTKRk5qU7GamF1VonnXX3U85h6Tr8U2Ro540l6PSiu691fIWGDd4iNBR4TJIB3D1XLREWM4bTJ9A9nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MdLDYkWyWiJ2CTqf35B3bvhbjM7PIcSppgnmNL/kALM=;
 b=Jlnbsub7uNYITFIH06jaZ63dLfQz23ZfsFdil2uOnexBRMIwawb/A9sb9KGoyMC3ug/kYj1TxaTplkNIWB8+FamAzUA1Mx1T6e+HArfQ+zeXRimGxdPDDxJ7cJTkf6yF4HBKP470hJJJ6CA4uVU4E6JVLwdFcn3kZ1udqd8Qon7JfOag+H4USDOa22f62U4tPzp1WELhfZ2WNZH6GF4qLMJZKr5qKM4V0josyEv8+lsPYwxUQ7O5kTvEYZbHuOzb5fO1KVsaH4JhXLv03KswAZqpzodGGhIMx8B4zWTdeN9WHj83t9Fhd03FtOj2uaXss9lwrrGyLU7MNYVu+JUCbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MdLDYkWyWiJ2CTqf35B3bvhbjM7PIcSppgnmNL/kALM=;
 b=Xhy+AB8k7c4qvb2ZsgdMwZLyQkoe+M9B3VhTjGOyUXKORGmxRdIDHThpvVRYRhjlQHfZ/+L38OSmi1nJEN78yi0EU9epRcsWcnXZudwkK8/9zncawYX/1n8A10nh0MyjgwFsuE0KwBB4NWL5uGggJd5pWSUvdFn5uyOhpWlGjuVvodIgqVKWONhfE2ZCPMGiaBSPNFexd1dJ3NKCJf/91g4Hp1PB82ugkFEt9lo6ABWMSPREXVV/Kpq5MmDcuuZ31TpwpJQ7cdMsT+pp7EgNgecF21yPkoYVkUB/SmHIyy4tGJX4X+2TWG8bTtjcBPd9XNqWoLkcUv8u7s0AXgM3TA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU2PR04MB9180.eurprd04.prod.outlook.com (2603:10a6:10:2f7::6)
 by PA1PR04MB10673.eurprd04.prod.outlook.com (2603:10a6:102:480::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 7 Jul 2026
 11:00:25 +0000
Received: from DU2PR04MB9180.eurprd04.prod.outlook.com
 ([fe80::f94c:ce27:1558:fb05]) by DU2PR04MB9180.eurprd04.prod.outlook.com
 ([fe80::f94c:ce27:1558:fb05%6]) with mapi id 15.21.0181.008; Tue, 7 Jul 2026
 11:00:25 +0000
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
Subject: [PATCH v5 1/8] mmc: sdhci-esdhc-imx: remove unnecessary mmc_card_wake_sdio_irq check for tuning save/restore
Date: Tue,  7 Jul 2026 19:02:56 +0800
Message-Id: <20260707110303.3779799-2-ziniu.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260707110303.3779799-1-ziniu.wang_1@oss.nxp.com>
References: <20260707110303.3779799-1-ziniu.wang_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0435.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::14) To DU2PR04MB9180.eurprd04.prod.outlook.com
 (2603:10a6:10:2f7::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB9180:EE_|PA1PR04MB10673:EE_
X-MS-Office365-Filtering-Correlation-Id: 4116daa0-7d54-4010-f6d7-08dedc16f2bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|23010399003|376014|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: wNmUGrX8RHZ0KJv96565IpI1564hcFjq0LYytmJaLY4+VBmCtyoKYgQwLDepuGFlCXmZbqsIGobCsH+RaZf2IOsRYDm9UUrddnPLDaMU/fUc+lYNUjXP6vYX0VNL/kN7GyNCcU4sYQ3MxAco3LHo46+0+5KihGBgToIPIlNtKgt+PAYwatnhaqH7VACjKe04h3CwqetgdIzc5Y3VXrds6dxkZtOHvgju0DFfqeG6BhXiUIdh1/fBFcSLgVNe7unkshrI/tpbeIX8O9gtYANEO0kougorZrPeYDkhxGMsrFui3ukcyl8bY1DYcsIy5fDXcype0moKS34XtVW1ilCemvVQyro591F/XScR6tO5IiHU4C29rcKEue593BBwf1iAqe97SbFQIeGacWil4g2GENxVT2owdQ1iOgi7+D0nMimoiKg0GOVZEicQDNUqDBJ5xQvSWBLvuTM1i/7JhCawkmPZoHr8r8vT32B+GXwV0gb6M76AUm2TtYKZiGHOAvGsWGN6Dvd/yR7kMPROlHHgv2GRGzsIVyLLDrltq+GxuVxzS2v7tysxxbRQiP/AS6K+zSIIiGbL1Juws/6BA4i54wEIdtr0Nh6hfd+YENSvrhvW51QdHMff74DjdcE2AthaKGqi6V4DClqHA3Fgt355xWp79q1GYBE6hXBzgO5R1zM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB9180.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(23010399003)(376014)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?S8+XJmvAMVmwpVq/kULBV9G/bBWaCSytHa2WQtHSjgn6orLVEjqzcu9Cq4ZY?=
 =?us-ascii?Q?SNxROFNahSRj13tYYDPxixgVJYOyho9CHkZXMx9U4crppRmdnmfZZhA2Hrxb?=
 =?us-ascii?Q?sNRwEGEo9fw3agFuyN4KesIDy8JIivQhHeznYSyZfvuui1MzfY24hd6nCv9n?=
 =?us-ascii?Q?mGVAh+/48MQpIExylIHn1tAbFZ7veUDLuFng7dJdphsBT36nIjyn7pxqNgXn?=
 =?us-ascii?Q?nxb0KGZQ8Pbga3NlWYLoRh4kzmgY37onkkMBpGXKRw9qCCLAg3twDCjtbpk+?=
 =?us-ascii?Q?6IZQ620jQEzvJMb/Mf639BaIFzUJSTPTlKSbAX69OL0HeKArHz/3WM91mXwy?=
 =?us-ascii?Q?BYzKyUpJCHeLjg9QLgV9FNzpmjCIQ6eskWdNARpII51kXtydIgnWSogHJFCq?=
 =?us-ascii?Q?7DiJKSGrkaMKEC7hNE7ty6n8xnbfLVnOHd5V/S3NmcdRuqC6FwIfWDf4XyFg?=
 =?us-ascii?Q?tIRFokNolU1nlK/ZZY5i3CqWdQM1gbXii+dWUlBhDGi63OXIvtT5HhjfT4/R?=
 =?us-ascii?Q?bE/dQZIKIjXmSjj6Km1LwualsccuJHuwiKutIzNPPQOhUWUjJYunDFBVPCAt?=
 =?us-ascii?Q?9Kh3zX21ZLmsr75byAxU6axkOQDbNIGscTiLVl5NbXxFDvvZ/HeLwT8a35By?=
 =?us-ascii?Q?xzyiCXLpKQ/PEVom3zMTGgOdzuXTUrZAOhum/YR0g4lKE2fYNFjBe+p04yck?=
 =?us-ascii?Q?r6fggy/wxCXUrMprgKsqYgX9jwqDrBTqLYBPRKxNJwHtTD9xADvl7skdUL5o?=
 =?us-ascii?Q?GQWpE0En7HlltvnAwdFVgdyaRCBM9WhijuVJVyVtHVHqF3I8u2vepV2hWqRG?=
 =?us-ascii?Q?iamQeluVVzcMisbJl03CEmiT2Ybim/qUJXHfDhF0caUIvAxQJvh1MbhBLSRS?=
 =?us-ascii?Q?Z+5AJ8UZdaK3vB0TwFFQMp10SsYmMxsDzH5u/xmXMTxNYJ8Bq6n2jHzO4cYp?=
 =?us-ascii?Q?Bjaf9gGuIqtnMM09Lyjm2bA+JIDnMPdEgjvto5HfWxBX0vbUSRCOCchl27WV?=
 =?us-ascii?Q?tp8HvMTQZhL/bpZq1w8a75fUg+IYhpjYh9aCquSzexnQKLy9aeBm0lPI7wnY?=
 =?us-ascii?Q?8YehxL77f0puJ08DmaTWaBfORKroiSHz5LSME2qMSj+65o5bzPhmi7efnD79?=
 =?us-ascii?Q?WR+UakfAbBeFkvAUa6pfmmv0IwBtaS9m6So5ZjfDBeGyie5QeLjr9oC2Ajet?=
 =?us-ascii?Q?HT3ebQfjqWdcCWBVgIKeUIv+KOcli5HNeP1Dn6rZq+YqQ/8PqTtz4lTmclDz?=
 =?us-ascii?Q?gDZvaEs5ZhSketvQsqIh9Hxe6lBpVyK+PJHxEtU+01X30ewlAKJmWNomRDhX?=
 =?us-ascii?Q?VaaOZxCxng8y0AjIV1eqH4qWV8x1KYev2CO6a81Sjd3PZwkZ7w8N5ukmYipf?=
 =?us-ascii?Q?xYFEE+OCl/HikX6su/6/sQiM8wKgGJnRUOjTubSiNJSKziArFPgmeXNyJ42B?=
 =?us-ascii?Q?dvfDmBbZJ/MhWSZj8ajGTaLFn1svqyqT/EQjDtFu+SsICtWtuUW1yFK0CbwH?=
 =?us-ascii?Q?jFS/SUVnXpVy69xWLIqWIHwQBjyn82+ID/vdJ16leE78yyJwbc/EbYPkP1TQ?=
 =?us-ascii?Q?rcuqfJAedTZgipdLPSJFqkfT6K2STfjvCB+TsnuvVr+b5mAMQ999a2xqWElu?=
 =?us-ascii?Q?XELT9Q9T3VGq4d4E9f8NMO1/y8TeihbgMKaCp9BbApS9AgEqKRj977PggKBA?=
 =?us-ascii?Q?oQ8sRcxFRwvzHplCI17210TujKsHHKu/io3h+9ZlxM5GFjH9hngYtjt7eXUg?=
 =?us-ascii?Q?4kWC7RQmwgM3objlfMwjnAD7u8YPyyorXkiBFnVzjphKXNpQvhkB5jwdIl2y?=
X-MS-Exchange-AntiSpam-MessageData-1: dcXowaDEBXDhLQ==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4116daa0-7d54-4010-f6d7-08dedc16f2bc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB9180.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 11:00:25.4357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7sj57j6bL2EMLLdPR+r3Os2WVrcmkqRniOSDlSrG3BT+lt3Lh8XOoZ1CD1VR3PvyDK2chpgSgkMW20spekXIkwQeSVjJVb5+Fc4ApznCv9hYZ57vGjk+d2vkNmnmTsOm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10673
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_040031_529387_03E6B4EE 
X-CRM114-Status: GOOD (  14.51  )
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


