Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C5BCDB470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 07:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aVp9khN8DLwFDn+Wm4TGgxdISOenKTKjrwCEaeM4PXY=; b=ouLXUFhsfsH5R60gNpMdLpZBmL
	qkOISphyJ22DgMzmFjDyG6elWdSBUeMpykH/XK8IjekuU0wr6nO8gIwGC5fEP9X3XYh62uHP+U2V5
	XHogv4N17sTGMqS5rHqq09damA0ApBTyDhhBgSd/kwf6l6hJZDlMdvyL4o7SnJuB8Q2EjMj+IcH8y
	pll+gu6ivDJRuc2Ufg+B5Sre8+gPxl6SA17KE/wyDahuK6NDKe4sHcT7DckvxaFmijXQsktzX7he+
	4AQSV/SE/HwxvEFmns0CTatigllDQJOWpFL8S/WSX+l6elqGLM0jjbVoCqpSaeVPrq5ucPnFqJwla
	jIbmbgqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbvdi-00000005pxb-49nL;
	Tue, 23 Jun 2026 07:33:46 +0000
Received: from mail-swedencentralazon11013001.outbound.protection.outlook.com ([52.101.83.1] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbvdf-00000005pvm-0STX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 07:33:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZdCQ2atGD1UKNwccuMiFr3pSuYSMOCnCeC0l3GP2c1CdTWAjprN+D3oMl+nClpWviBGIUczl00BJcL2PMeGcJno/xPo5x0txQ821asyk9Ww3W2l/42VNCXN2trhGqvIx8L4O8IMrOLmC5fc/VunjK6KDu7e6aPHUnhDViEDz2iMCf3tF7EC/JTwK2QP1NZ/oS6ggXuQ74CpruZJol4YVujKhQSfwyiKUynTauNctJCLGGoedypy6rB3Kv5ubtyZ/s7T1V/TnxNtg1886knG0e/Af73opzTi4bP90zg2fuvIC+TrJcrXO+/DbYA4z1bB/56p/Xl6bq8i59a/le4MtoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aVp9khN8DLwFDn+Wm4TGgxdISOenKTKjrwCEaeM4PXY=;
 b=JPqEACWV2ekYUEmj12tPu3+ZWeC2OYzfq3IAPFHGnGu6GJYqcSf/HkCqB+KbCpsVYikbhLVGD0atN1wW2x3c68nEBxY4ZKfsNsIEi307wbH08a0OJXYn2klNi044WbuFGAuf2TH36sCccPfmvUJ+O2/sfAzGBXTRLeKONnexDvy6gzNDl3cUY29yUE54BSrGUgKJchXHk2OVNYNq4UetVmZ/INWAwpLlVycyX3ubCt1ta7F5FeglAn7VPQHM5C6z99lsc1Z8+C2zOUwebKL5MKsxA+UhYPOFAZQ5KbVtDdWyKiOJgdvI6EiP1lw70ueeJirt2MYW/zEeeKbVN1CYlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aVp9khN8DLwFDn+Wm4TGgxdISOenKTKjrwCEaeM4PXY=;
 b=LKpplo7orGbAzSuA8ku/jK3PhE2tq/FNn+3rog4cvQ+1/inVCxQcTbBbPUfqsytPn+yBvRY6aHaMue2k/xOgTzico6RsvKW1a22b7EbP68Qb+dLvYEKK32aZHyLfGIzWlZ2DAU1RaEg3qfI3szggqVed1tIZe0wAv9Q25G34qu2y3Xvvq66QSQbt45UuwHcSXoVTH5fmPtktTr01c3h+ziBYcF1+h3qYVskfIxwSfl6/fmU1fQjE4Hx+rUSPOuvNuM+fBclYkq25W7HVtKgeuPbStZbeiYsaXLLSnnjMcucsNHErMDyb6TQr1YUE4DnT8wLZ+TLptxO2hqeikblK6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU2PR04MB9180.eurprd04.prod.outlook.com (2603:10a6:10:2f7::6)
 by GV1PR04MB10822.eurprd04.prod.outlook.com (2603:10a6:150:205::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.12; Tue, 23 Jun
 2026 07:33:38 +0000
Received: from DU2PR04MB9180.eurprd04.prod.outlook.com
 ([fe80::f94c:ce27:1558:fb05]) by DU2PR04MB9180.eurprd04.prod.outlook.com
 ([fe80::f94c:ce27:1558:fb05%6]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 07:33:38 +0000
From: ziniu.wang_1@oss.nxp.com
To: adrian.hunter@intel.com,
	ulf.hansson@linaro.org,
	haibo.chen@nxp.com
Cc: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-mmc@vger.kernel.org,
	s32@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] mmc: sdhci-esdhc-imx: remove unnecessary mmc_card_wake_sdio_irq check for tuning save/restore
Date: Tue, 23 Jun 2026 15:35:12 +0800
Message-Id: <20260623073515.2658205-2-ziniu.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260623073515.2658205-1-ziniu.wang_1@oss.nxp.com>
References: <20260623073515.2658205-1-ziniu.wang_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P251CA0018.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d3::10) To DU2PR04MB9180.eurprd04.prod.outlook.com
 (2603:10a6:10:2f7::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB9180:EE_|GV1PR04MB10822:EE_
X-MS-Office365-Filtering-Correlation-Id: bdcd73bf-c5b6-41a5-8150-08ded0f9bd9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|19092799006|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: uzryQUkD3gwSI344iehNfg7vDm4LizAaoNSq1MNiXco8KbsFbJjd3Tli8PZGjk3W+x8m+cv7d50bYFBoQdzrSN0rv7RwJPORG2ob7t/QxxeCTa8kGVCOub6VmcAa5rwnWffhLFQuYcs5UpHTL5cXKLzXme+UDLicOFQa+4emOATFFnPAlPQxANESVnoUIGlEcqrosAxvFQlCJnXuTwL47waz0DURUWVnnJyJlQMiHVzmQ3w4fosCGgfqSuwVWDPvjC3HZ6kl/1yZqEdQRr40f/X9ZTGUm2K8xKn47tNaqf6Ozyup49opUfS338QV7IkMgUigWqoziUWRoupCxjQdkMQbatn6E1iCe2lchkoDZ2E7NCCX53lelymPr3UQuODp1xBUdoO+fVGYWyUTOLuogF0t3ai2n82iPYyxqbcTP+zNjrjeqKESoPHaCipAbEjUovg5QB04/0w8J9Kink7KS0JLhqJzuO2I6lBzgg9U3k+keiamrZ3GLlVcCV00gfh3REhufHrPk5jCiKYTL2CQ+MRmC4mCzcYhIWbxgFl5WMuhwMTDPfi9lxzuDeaKuw2AhRaCtLR57+j4aQOOiwRLE3FZUcsRPoiLDKU09PnC/u2yfY3BpY/cCRpkI7oHrV8WYKqRnS5KvSjJBw7JNBwtNz3+UCswFSmJ7egv0fiSbC4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB9180.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(19092799006)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?etDy9vUeXvAt8JacYg1xCxMvQ+Y78V5hLKsrtDPnqrvmBYwYyRM64gDwIWt4?=
 =?us-ascii?Q?VoSqQpaggd0PP5LoM8uFv/EBWEHUdHn/3i6uhb6OOxw/fiA1zsMR5XK/TRhI?=
 =?us-ascii?Q?313AFO4fLfkkcFYoRc3kPDpMYxrX4CP9iXuvDjk62QMQ5z7h8FRbdSj+XQW+?=
 =?us-ascii?Q?/k6IoaY8LX7NhO4oWZ9KehMjqJFIUuoOyC/PVayfwkcaktfWmrgQ8wZSPB4t?=
 =?us-ascii?Q?IfmZjSH7n3UGFqivJorp8XZZfWEbjpndPq4Jknf96znoeDZNROgID+UJYnTl?=
 =?us-ascii?Q?5LoN6CHEf4JsBl6loLceEqJWMoBzySVvrPHea6MX1hwqzC8wrPwJZbqiipg1?=
 =?us-ascii?Q?0Co9EDGgEMn1x1paJdqjvsaLNZ6QzvvQEu8XIrwYY+rnoD2xKfoQ00PK3L91?=
 =?us-ascii?Q?Gbl+N0YkshxwAVmaqDosnPHeyq9oPcBwhDVg26PwOgnZglXgYkhNPnkFCTlh?=
 =?us-ascii?Q?Ub3FwulznF+caZf0R7sDBV2Vjqmpw/MdVGVMKm2WSpzUQbagVc9MimPTvRR4?=
 =?us-ascii?Q?OVGX2Gx8/ZwrenmLUSnokE1Q5eNHj4KvIx9UDmjEMR8UF4kExC650C4kEnVK?=
 =?us-ascii?Q?VBpcwg7ha+GOXhqZP1tuuGrtmshg98yP2au+LhPidojl3L13f6s3+5G53tfN?=
 =?us-ascii?Q?Klpn+ZglTyO9TwHEXLTn80YNzAJEiClqrsiDF1W295EQkAT1GNnTgVilQPgR?=
 =?us-ascii?Q?dPVxOBR9HpK7UghgpVG+gr+6fvE8kV+EtK82JC8tRNzn3iNimMppsy+d2WWm?=
 =?us-ascii?Q?ehX0tT7AjrccHHuL+zh0JstohT254sc4ZyNcus7OoN3QsLPUv1nipL3qmude?=
 =?us-ascii?Q?vJkFMUBO1JB97StMEnUAQ9W/wqwCMjBYPjlloBx1FCiSHl3Jrb2KRYdxod1Q?=
 =?us-ascii?Q?Ydd9kqjb21R2GObtxNHbXa1OVQMMUfVf2AjwjGJ7wp0rqJwINO3yAZ7IbGYU?=
 =?us-ascii?Q?o08Csf/7R5LnfvpVoA+3A700NqboA08g3y3g0tYiE0m8MBVtwnVJuL1j7g+U?=
 =?us-ascii?Q?OmmUQM6aQJELv5PR1WgmeN55P2py52D9a9YV3E1KA53L8WWmtXclrakJzzKv?=
 =?us-ascii?Q?ppMJWmVy+f7wglZ6wbhhO5oBt8JpyDS7L32BKYz79qEzxM4drgFQgCj2dvsP?=
 =?us-ascii?Q?5VJJRdipzdTS2uL9q4I+ric9jqXfVomiXx+sxCssRw1u3BLBGiaoc3P63KO+?=
 =?us-ascii?Q?FsOFdOyc7Yt+6YkOLBlJYTT69T9sfH/OmQgNVzUIL5tp0i8KPU5ten3z+hP/?=
 =?us-ascii?Q?GptXRf9Ju/prbZtIaXVat8Yw2Jj8jT8TYJqm8jkBOCyAP04Px3lW+0QuklQa?=
 =?us-ascii?Q?0D/syHSTncLJFJ9fySr8T76TcT1AvoBfwrAUB2dT/PeNCz8GVPAHC3y06ihC?=
 =?us-ascii?Q?3OTVyPMR99CaopNSOrcTmTukc6eKWbZT/BLoJ8uY1xkv5t00EbimTOaV2Yq0?=
 =?us-ascii?Q?wnLet15WaQXye3Rw19RxHyViWMk1omvoATTLZLUj3v8qTjVs1bCFbaGb8zL9?=
 =?us-ascii?Q?urhbs9G1olfHuJumcEbUKZrgzpi3DGvfkLTwhs/oM5tDiDijVk+/HCWYS65P?=
 =?us-ascii?Q?oBTINiMGYhONr6qD2vCWsbTHingEcAYeb50WOTkswYiIWUV/jyjR2niAVeDm?=
 =?us-ascii?Q?HiKjuWgwv3z3fdusG8WBEKAfSc9bRztIwd4joy11A9CmlagaQ9V0vBXW2z8P?=
 =?us-ascii?Q?h2tZn4kKrlYGnaeUy+Zhf/Rfo57Pk4ExI8361GArH1UT4x7za/mHZE0scmyQ?=
 =?us-ascii?Q?EoXIR+VYom/jk6NeQet+4CEmqEWAXy4A8y4m7+GwW0cKCceewd3T?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdcd73bf-c5b6-41a5-8150-08ded0f9bd9d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB9180.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 07:33:38.2104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZbUkxPSDMCMeEXBBZqHS/bFIAF2ohAlUdhbiRW638+KEqgv5VyttW1XFrryzwfMekQ4sGdBtJjilwUBIVjP4JW5sLv+puz7I0Rhe+6Ci+iPZBxnKA5mD0jlTZYeNfpD6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10822
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_003343_153337_B610072B 
X-CRM114-Status: GOOD (  14.15  )
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


