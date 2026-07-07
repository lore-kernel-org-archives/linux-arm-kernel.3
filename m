Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC94C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 11:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=55+YzZLEUnFYJEqI59kTtYuhrT3z6KAxXnGYyybTfdA=; b=EwvlNxM3jTxDk0XCiOaaM7wDNs
	9m6yDLEbw84abJ5brgscEwA4LaJJLHhw0IVwREsxAMjjA/4igRUhdfZsMQELtMBPzPsFi84JX8R3P
	d3GYiNG4eB/ZHq04yLbTzUZtsSRIdHPxcNVM/uWFTyMwl84gabj8gDOS1ugeW7xpKpvrx7zNiEoVm
	PbzbojzRt8MRyY+8DZEkqPGZZ7vcfLW3FwLlIq/TbuHeT41uweg/dyd+iJnVFMlGl0yLvIQONPJrg
	mkic6o8ez/jAC7WYbPwejKnLHclUiJlDUuH7cEVY3pmMrVayBstCoU0qYOFHVPFQCoBZ7LOwS5eou
	N0RbY+TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh3Xm-0000000Eo62-2iBz;
	Tue, 07 Jul 2026 11:00:50 +0000
Received: from mail-swedencentralazon11013010.outbound.protection.outlook.com ([52.101.83.10] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh3Xk-0000000Eo4c-48I8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 11:00:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GsBhxdJNFmtb+Lddylctu1xGaPYEqmfK85WAr6fluJ0dd9ToLa+WpYmCh73OV/onMDdcza3QihxG3uE61xa5v+S2yeJlbH74cT7ZqcfPV9G2L3oLXHvS34pMnVFcgVY9w73x6d+8jlLLbzMYf3d7wQryI/NVKxU56Tbr6r0cqPtRCu45BKddz5zYak1P/MxklJc1jcEzXHxyOAIdJuXI5+w7LqNhWRMRkRrx+eG4Nex2e4t6oxBKq1ha3jqzLZafLhe7LgMSL9t/+7KcG39rGy690oUX3ccpU7/j8rZ1/ikhvMVWt3C48Wyl9ltp5lfrSep83/EuMa9Yx2qvAtfYDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=55+YzZLEUnFYJEqI59kTtYuhrT3z6KAxXnGYyybTfdA=;
 b=nHg7d+TTm6QLHML5WwfFiYWecOruRKOUiioiQDDe0PrKrTMIE+B747n0qQeRw/piTe3PwuyK/UwYY+2HbRpdG8jHsFN+cf7kk+aKhAj4jwhb+bky0qNGhG8ciEDWcsFj+aG5RpDZtpfQqasvTD0LTGfsgZC3IVMVQznfoxAu5Pgf4PYox2z182aHKFWngSLJEzhyNI4VisIJ38Na69J1BwLDxLCQjBDHMDUBD7PVAIDdeWWHMkybZRIrks5/9UmENHdyNw84KqIGh7LFLP94eUZ89gQ0VONz4ionBHJNEVZSZZDry/0yy3ExqYBCy3D4enLgl5a6XKgkTBUOmcSSRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=55+YzZLEUnFYJEqI59kTtYuhrT3z6KAxXnGYyybTfdA=;
 b=o1VFdgyGSHPoayjPh6jpYDtHmQa0RCpbKF7dGlGVyE2C5WsLc//8nVsnbv2lLn5olmK2HCKYfKhiRucX+LPD7xjj/z0zK1+PCOH+QirSB4z3+trBBuebzJIIr4kUq3YBqr95KixEg/mAgtm/orcf21Cb7z1/qr4fELPXSZuzetcHukz3jzkxr0F8Rmcs6ZAYyPqZ7r3owAiaISo/NY1iCp1GaOeCXZaLFa/cSJ0Rq1y7oJEVCXrtCELnRIZirR7X+FHNH0ZHY49RMpsTvn0E/prIMUAc7Hy0VPXqrEuMdnp7LMfn/V5qTz7xkzHpcoZbc52IHEPKSLxVLajBRtoKXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU2PR04MB9180.eurprd04.prod.outlook.com (2603:10a6:10:2f7::6)
 by PA1PR04MB10673.eurprd04.prod.outlook.com (2603:10a6:102:480::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 7 Jul 2026
 11:00:41 +0000
Received: from DU2PR04MB9180.eurprd04.prod.outlook.com
 ([fe80::f94c:ce27:1558:fb05]) by DU2PR04MB9180.eurprd04.prod.outlook.com
 ([fe80::f94c:ce27:1558:fb05%6]) with mapi id 15.21.0181.008; Tue, 7 Jul 2026
 11:00:41 +0000
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
Subject: [PATCH v5 4/8] mmc: sdhci-esdhc-imx: restore pinctrl before restoring ios timing on resume
Date: Tue,  7 Jul 2026 19:02:59 +0800
Message-Id: <20260707110303.3779799-5-ziniu.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260707110303.3779799-1-ziniu.wang_1@oss.nxp.com>
References: <20260707110303.3779799-1-ziniu.wang_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::8) To DU2PR04MB9180.eurprd04.prod.outlook.com
 (2603:10a6:10:2f7::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB9180:EE_|PA1PR04MB10673:EE_
X-MS-Office365-Filtering-Correlation-Id: 03747e4d-8b27-4447-99bd-08dedc16fc27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|23010399003|376014|56012099006|11063799006|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: ZeR8/CWThtqVp0U1R+aOaRV87aY3pUjrzaGZfkZW8rmBcOyJD0Yo+Z+V5KbA4KByRQ8ZNKUTX/sRU1u2H6L/fpnBxAaQpibBtZ0tIaQ3FU47sEFCM3u7ekhB23WeUsmfYlxGoL2R1QIf4uH1X1VNj4AIOY9bhSCNumVXjha1y2Gz+OYj4+jVwrNmVKjJu1aGRKb9lKJKTVXafFNyYg6LAa1ezLoOUT/xhum985zXz9xgyJ7TIer82J7ky2+K/pyoecBt17cyEcmfDI7YfRGQsHJ1KkJc03X0GcS98uf6Q2ZV3dxRytpEGOiHyxCmJGj0pFhHRYFBUkBOgwBf/k7LWyUdMclfjKkEf/fylm4jCJVy0AeFea0rJY8wplWO+YISOc31IYdtrfo74SIM/Ez64bIdtpR4ZejWy7wxzKtutWaMvN0+LHfrE8ypdHfgRa3dagUqwduWp3eRR+G4La2fCoaSIkspXJLXI3FkZpk00Y/o+E1hHLuMU0xYNQhIJmse9q71cPP3GmT79rNGiOcKKYG6pS7iQeoRwhXHhVE/LORNgt5l/qHBlBo1fdj70vBCXrtJaeJk50s00WyhYc9Oz2dSZfl/hss5ctOOCpaHg7/4lQ/Yb9p9B2Qh3Hyi/GLJzliGFWUCfr0zq4esj68EMFGGVs26K/IyrPt30gO5cn8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB9180.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(23010399003)(376014)(56012099006)(11063799006)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1A68LqrjmpA51eSOdB4nnKrFqXUp0/FvPWZIkHVsikrGXeUXaaDqKKyKqney?=
 =?us-ascii?Q?1UlcjdKDju6EzKJus8M3Kq8o9yGsRd/ZwT0ahVs7n/Fn1Z8OSVhyRZD58CdQ?=
 =?us-ascii?Q?DR1xuWQ2sO/ygJG1BL8RYG5yvy25uRnFeAvT8rYdTCgPbbgf8+TNVoQISi7c?=
 =?us-ascii?Q?nBzk1C+xCm0U9dSvaOKTM3z/iEKpk0UO11FYmDykEfxZQkR9kSC+Z22CZ4Rd?=
 =?us-ascii?Q?LwDswScApcw83CtWXwqDtTYxDyrIJZr2j5rYVtYvCW3ZahgxHSiu7cd7S4Ju?=
 =?us-ascii?Q?q8PzeKfrLER+Cft1pQT7kIKOCX5gDyzO4plI00fh9VKllZxQkM/ly3GVIZeT?=
 =?us-ascii?Q?YJUeoxOvNdNPbdv6LzMsSkLAaCEE8Gj/BFBrCXgnvx5UzOtYyGBLncXy6o3X?=
 =?us-ascii?Q?QcHapgh1gcHQnBrs6i8ApNHnMZyxvsQIMZZfPckInzM1JAPypI3pP+sVZ4eB?=
 =?us-ascii?Q?GMmg+dv+FNHWF0iuulxHJEIENs4PM7DQ2jp+Mt1klhh7Xy+NOpNLpZ2VU9Tl?=
 =?us-ascii?Q?oGWyzHfSUcg2NqeoltCaB0nMrzCNoLiKRab0fkxFM3lTgQ246+wfs4JUdfQr?=
 =?us-ascii?Q?TPXfND2Rox8E4zkHLOsmThjFtDgT6B1PoYnpXQBmYHe8Xkx2P/yynkwUcZFH?=
 =?us-ascii?Q?Oi06+ELOwlt5pmCFF1y/csMoY5cuSI0tPpQMbd8Rf3TOgMtu7gXvgcu/lp8m?=
 =?us-ascii?Q?6/aAdvD7vWCVGem8zb5KeggLYdrWIUhK1UGvXRLNKY4Ix1IZmq/co5ucnPhK?=
 =?us-ascii?Q?f3IDqdcNYCM0PJXvJbCvUUD4SrhVV8KzTNLfSK1zFMS9HkLN7YFECz2uyaxB?=
 =?us-ascii?Q?4tAQildKYJx38FCBFt2P1Qm8DU6hXpxD5TIlPKTQnSiHcTTSM8DbwrVEZsxu?=
 =?us-ascii?Q?LWrh6V8/BULwnCpcyGDu0ZIDrjI64DOsV6y7DttRKK2ZoWHa5BoLPILiuv7D?=
 =?us-ascii?Q?qWAu8uANjpt1FmMZmIOfRWGLaKwo21XuWeVE3qVCtNoR/JxMhrfWKuA/WueC?=
 =?us-ascii?Q?ADgdB4Y32pNXMNpSnX24MCcXNwa71Tj7+jFMp1Zuqb7MUgi29wnvFFvot3CI?=
 =?us-ascii?Q?f0bMkX42Jtme7mHHfWXneSiaYOpTF8v413H6Vu4/ZuP6vDWQt9FOLVBCcHKm?=
 =?us-ascii?Q?6JMk4Lz45DEwyGwJx9f3edB0bnpLUvNkGpIbiJOTBO22NTa6vlyireWL2Xn2?=
 =?us-ascii?Q?feJSiNkQu0SH17LWZz6eD33sya4KFomXOoH/83/DKYsDXptFf7rN0TDtQh73?=
 =?us-ascii?Q?ewP/iGGDqwG+pHl0PCEtT8BJmHDQyZDU2q2QEiucRJaTMQbExtv5x/B/i9wF?=
 =?us-ascii?Q?cPXdhBusw8utGrUItuiI/eAzCsNUpxBOZ1Ebum0BRx9WQFOputSKSiXFNm4K?=
 =?us-ascii?Q?l3iu3OGo9Nm/j6SAjG4DrZA0h5AdjB1GX8ALkcxo1Bk8Ql4BTdivqV1LrtEI?=
 =?us-ascii?Q?ik/vzkKVH+3CPsOwf6g2Jwz6jiyCkttkrYFatm0ozK6TVyj89NyMyiy0GBEX?=
 =?us-ascii?Q?bDyfw4O0S1eikSwoWWEffJgkNo7qCkKjBd84G6m6HA9J92JksmiEyq5dlgII?=
 =?us-ascii?Q?xmS5PML4BbsEiSGaYpMrJQj75uHOdMcTkM4Ehb8Z486QDLazmlraF4nc4igz?=
 =?us-ascii?Q?qAaHcOTsIPds8QOEcs5xHtxNgKTQtaJTGPpf0qgi6Y45C/i2HuGF3lDHRN8x?=
 =?us-ascii?Q?16ArDRjIg4425xwYSTjG8wfDIvSyw9wPiyysYTACN6c6Mp3fSSZOWZTnz59F?=
 =?us-ascii?Q?ZAJi1NhLaMXrh7/asvaD/JB5GCk8RSXbJtLdtv+TUVzQJjD2DrTGHzrBbOpM?=
X-MS-Exchange-AntiSpam-MessageData-1: tKgP65q9l7ovXA==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03747e4d-8b27-4447-99bd-08dedc16fc27
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB9180.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 11:00:41.2698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dKqBa/oSubUdV+CAwEhuBYz8Y7meLK+5RQqaehx0Gel3tUT7wSci1OUptGQ22YsKcVDSzSqvY0VAgIIOVwpCjgtRKgjJJK1+qD/+zqYJfrZOWnNpqiSg//baTJlL3sDE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10673
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_040049_031177_A772A062 
X-CRM114-Status: GOOD (  14.05  )
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


