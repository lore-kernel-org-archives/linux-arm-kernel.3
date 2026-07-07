Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC87C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 11:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=46/VNZFp3U7lX0DHcmkSUcjB+64JP1BFSo42KlGZ9co=; b=1EFT/oJWhB68beuyiw6JhVwUPQ
	nBnloulpZUGfdLVRaD6gCUQ3dl42H/7+HOgoQIggNWDFWx2y1AXmaIpZtB0j2eMqdKL9qQzz/FGFP
	wRmDAbanZjzi/I0iRBMv8hZNSyHPVcVGSG5sk8XHvXpil4TbhcIbv4yLPMwFspU8Z14et2HxzQM02
	j3H4QQbVYGfSoi4/mrk3o591ZmA2ESxPPYy5VasQw9nISqwYro8dS+W/2a54YaYIk9VSRxqNm1lfo
	zSY2h7LsrInWEVo0vfI0W1Vlj2LR1KmueNg0+wBA4hLzxViLrSHKJaQcCjjb6az7rvwqebsR96tNk
	APEXIyIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh3Y6-0000000EoNR-3H0S;
	Tue, 07 Jul 2026 11:01:10 +0000
Received: from mail-francesouthazon11011055.outbound.protection.outlook.com ([40.107.130.55] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh3Y4-0000000EoKT-1OdM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 11:01:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IxOdW6YYP0fh4w7SlqjId1LurpnbImAosnB3E+K9IrKK/Xhn6Q7Uy9u3WIv4NW9Rg6gWhozCnpW37fBcc+RazmPPlMZI5qEspi1pnL+TfMnOY8uzqjZM0ewioFdAGWkx9a/GBYf22n3rIG2/6ykLoE3/YvhVA6VeMtyHKGx94+Xof6MmrtRDnMmbo5lgjb2I3XHUbLik6K4OotffreCtKiiQsaB39Ag0eNfSLpOHecWhuqG5TYRYdIANgmPpfqJA04E2mR2i6Zp+NNE7cor5SK24d6igT0t/E7O7FaLIreMioTXzUQ13UwYha2wtMK1QeQNIjfMGYphT/pqkHjpnGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=46/VNZFp3U7lX0DHcmkSUcjB+64JP1BFSo42KlGZ9co=;
 b=o2VbtNdV3Q/TbGE4QjHOq066ssunVDZ6dJLtHos6XKfbrlITzIjtAY9gOiQN7LNz1mxS2uW7C7I74YQWxxpd6JVpvBRZq2VFZtGMXAqtgb74mFxuzoFgoElqFYiI9YXhN4mEft9Vu3MJEbRZqee2+hGHf2zClEKgeE6X5tadSKqblDo0orNt6k+Ah8+muaLOz/HiqkfP4lR6sapjkkkkdTEYraSegOAP1Hd2fS3K0u7g5X8BZOgwbF70b3NNq6DXfOP4k/BrzI+/l4OJOwLcUHRDiF4xL/I/8+Fytjl5aLfmuOANsAsGSiZQpAnMiTgQyrPDNyd5xSV595foi5hXeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=46/VNZFp3U7lX0DHcmkSUcjB+64JP1BFSo42KlGZ9co=;
 b=H+S4vECr47XE8eHhJVzDv6tM5Ia/aKzSoSNW6JkIUv5lt2WxiYI/VxbmvA/NBt2AMqbUiSZY8lDYnYjvA1zv9qkVbhe3WVZv3rIgPiCMlN15nGXDL0jjHXA7lUP1Gyn1k3ipnB0+U5shVJy2BMOgb/PsAM95mM1jRiPBEqjBREXe2NsWieiFM9KpOf+xBGI8VJjkcMAI79hf4RjzHJ31lzjxIa5ulXWOfEYX8uhhbO8tMbq9ZblPyAzbs/q8/Lq+Aco3pObfrTLUiroiO+cOHdIspDrxaq6lj5dCR/RQ7FzQjNVVTerILw6f7LCBJKPFi+DN/WxVcLKwuotULNHf/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU2PR04MB9180.eurprd04.prod.outlook.com (2603:10a6:10:2f7::6)
 by PA1PR04MB10673.eurprd04.prod.outlook.com (2603:10a6:102:480::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 7 Jul 2026
 11:01:01 +0000
Received: from DU2PR04MB9180.eurprd04.prod.outlook.com
 ([fe80::f94c:ce27:1558:fb05]) by DU2PR04MB9180.eurprd04.prod.outlook.com
 ([fe80::f94c:ce27:1558:fb05%6]) with mapi id 15.21.0181.008; Tue, 7 Jul 2026
 11:01:01 +0000
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
Subject: [PATCH v5 8/8] mmc: sdhci-esdhc-imx: fix resume error handling
Date: Tue,  7 Jul 2026 19:03:03 +0800
Message-Id: <20260707110303.3779799-9-ziniu.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260707110303.3779799-1-ziniu.wang_1@oss.nxp.com>
References: <20260707110303.3779799-1-ziniu.wang_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR02CA0133.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::30) To DU2PR04MB9180.eurprd04.prod.outlook.com
 (2603:10a6:10:2f7::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB9180:EE_|PA1PR04MB10673:EE_
X-MS-Office365-Filtering-Correlation-Id: de883a93-e0b1-4005-a06d-08dedc17086f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|23010399003|376014|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: JNZjVp6vkWSFHEitux6xkJ625iHFhmA339spF/lDpW9F4dFYSdHVPEAM8JuqjeB/TywJHilEdxvutQTD5T7RiGW1zBaQ+PPFy3VpmG+lrGmpCw31OwBR0kCYj+CBIG47kiIBawBGWGyAjZmdFbhmfzeROxRT9W6AMAcDxLeB0h5YSSpvsqiLRHilHADcZnLqHQPwxQdrRIO5DrEEeOOX+t2oP62LG/efcCw/L8/3YTvJdurZYZFxT1OJxFFVXAAizvBg4Bw14jFtXz36aLsP5X0CP2/izBBuyjxLeIkhBlndSQyxyPY4DaItra+UnuQcErJY+NZ7Kk8a6ziWbX/5hE9rAcMpPBfHbTcZxuqkTbS2DnUhXyY/jkajsZSgNiXOvapBLVTLcnKNqX0MGPgi7Nf5yclz7xFPrtSwCfSoeneaLoO6ksqJMPYNGjahljuGC3Tj/AR0Bq308eASZ0smsX0X4z3pQdar5GbmvCBINgl1SDmDIpUWSLP46dE+5SUDxrU1Qq1vj+9KCwCxnji2ENls4qqTvzBfD9Xk3dCnH7RI7evy/F4cKhSmcfjQoG/cIBEKkdb7DPIqrqFVlKxf8YwKhNA0fj0B8DE8QVvZPYU55wY8tgLX8v1tsaSOFxsC9Dfjhh0ms/LyAef3RdPxTYitlX6WzVH3AIDy3qyOdTE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB9180.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(23010399003)(376014)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rbOnQAU9jU3tzQhS4cy4M0yVrn8TJlxwF2OY+nc8R2KUlHT/1yBm7Z9v1NsO?=
 =?us-ascii?Q?L/hxawoH/l1gBIZjw4q+q+NmOM7VOC0NHtfnyRWXf5x0Vfh1duyl3DNgfP1r?=
 =?us-ascii?Q?zgL5Jny9ARgrImHHgNwBxaYlVPGNwRuG1+kCzD45xFLxbi0LxRd8wOSSmRhX?=
 =?us-ascii?Q?C/RanLCBTN/fGcyQlHIMJGGTsd98Y1HRENtcl6gK+LNBZt7/7K+/dnpo0yHG?=
 =?us-ascii?Q?HhSEI21ncaVNaUl19Hykm6j4MIqeHqBPo5yctQ/0jv8ShGgfEIeE8C8S7k8l?=
 =?us-ascii?Q?EYmTwPGW8wMgbXFQxV31qFQyuK4NrEUelUfY8KRADs472MI6ZgUTDVwwaAGT?=
 =?us-ascii?Q?IfzF3oVnZx+K3AwI302cqyfatpHsahVZUD8chYbV8nNkK2UqmG4y1z6DFFiC?=
 =?us-ascii?Q?Opo780PQy8TTsuME4GoPCKEgFMg0+Y+JnuRf952UcJlXC+RaKbw+HaOfPWp4?=
 =?us-ascii?Q?vkNQJzfvmUS5Qwsra9BTptsmcgY5sbfVfEeP21aZ11KKnSWKBJQG/WACWLxs?=
 =?us-ascii?Q?FYOe39rDvbpv3fI62xxo5zHdV8w0i850jQx4IYYZ6sxQ5lZKieN6ExsY+dv+?=
 =?us-ascii?Q?WHMuTEw3sbJgWleCaRy8AfOU7UAT3pNoIlHwcYgmO0DHJ3KOF71O2WmvJjzr?=
 =?us-ascii?Q?PZJR6q0ZBfRpvDPMXhE5DhAXFMIVj0mrZYoTo8OiZg7eibh2P165rFwSA6Gk?=
 =?us-ascii?Q?iLOl0k8/1YtX9qlyYUpKznbdTDH7TB1BELD+hLI7GkbLCZUPwfAfiKb1F7JV?=
 =?us-ascii?Q?AVhqVy4TdWNPheZtBeN5uIqhLg2wzzceeUKmJAuhRFF0k/YpwUzZ1QoKYLBv?=
 =?us-ascii?Q?KdVLDPplhwJyljuSEIx970usTzB2B86GiU20DIZ/7wtz8MmGig/TNhzxdogb?=
 =?us-ascii?Q?Jd314evDUw8t8qhf2H4b9Aas4FzP07kxwjzQvha+T599UUn3vp/Q5Lwpr97R?=
 =?us-ascii?Q?bieaZ0X68JB6ZtM8yHm/w5fD8BnltM7eywngEALqFswAKhnWiScOhUJMgo70?=
 =?us-ascii?Q?7cBpWEidU5f+hDthg1hJqZCrpByueQFyRaxCCrHtmFaDmso3NtnRe5EsEAry?=
 =?us-ascii?Q?Rp1VLsBC2njg2+KFYg0kmjaM7tAv+O/4p1RLjjFCu1hCpXJ4DH4KPCeDXsK1?=
 =?us-ascii?Q?SA1ar54FOJ5Szs9F1309H0P9bYitsM7oktJYRMLafPrZnYqhJ1o7dlsQbv0u?=
 =?us-ascii?Q?ONWIKisLBSC630/IIAIoTPNGcIUMKye7zk7VDc4dkVKfRini1VPP81/v2R1+?=
 =?us-ascii?Q?I81AG+te/LAreq4ft0Ersktu4jcV3j1EWyRRDj8JQd+RzBNVu7E2jurW82Ve?=
 =?us-ascii?Q?yguiJGiY8VzZittCYrN0HqMpOnQkJlylQ/QCUV30mcVanF6wuK7pFtbSJ4oe?=
 =?us-ascii?Q?4qJvpodPPrGxG4yJDq6Uv3cPtGYKo438CRbn+ASH8QXB+OUtBYctcztFJkHL?=
 =?us-ascii?Q?W6mF2yZTg/g1kJaHwloefsn6jwRoQoFzf7/yFumA7qVRPQFHKvJxCaCAexIP?=
 =?us-ascii?Q?LzScMZvKW2sAkEXPW7ZLSrJdtN/RtzhWv7QDBfCyfB3A4GsquY6NNvq+SrXE?=
 =?us-ascii?Q?mfN6oamHhfsHcCs7EI4dGe8a4x8qQq56GrmOQSD16sOKjk9r1ohZXf2MLoGL?=
 =?us-ascii?Q?vqoBVw8bHfSL+fjziiweABFHV3agTqGNOLDld82YgPutnvNJWqE2Z3GkFL+U?=
 =?us-ascii?Q?rAJWCH3jAxwTsIpB6rqWPwdgqVWLTMJ+wmNFflrr2rmFHz24G9Mm66ddWHPx?=
 =?us-ascii?Q?J6AzYmGSqKq/4ECX0dWqH1Q49UnIZLlS0higR7gLzjyyT3bXGdgkAgbzTcQr?=
X-MS-Exchange-AntiSpam-MessageData-1: 2TPRZZ9+iUz3+Q==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de883a93-e0b1-4005-a06d-08dedc17086f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB9180.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 11:01:01.8116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fJJaKugj6saYqrHgcCKXwfBxiPqngAGlybnEg/rGIh+7ZBpOPB0C0ceWsbwXuYm5x2MSGu0prpwTcqW2SqnkHy4lKDHc9usFY7tzILbHN3tX0ozDwHSM5JxCp+ypD2e8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10673
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_040108_381281_72FECC07 
X-CRM114-Status: GOOD (  13.14  )
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

Check pm_runtime_force_resume() return value in resume. If it fails
(clock enable failure), return immediately since accessing hardware
registers on an unclocked device would cause a kernel panic.

The early return intentionally skips enable_irq() and
sdhci_disable_irq_wakeups() because the IRQ handler reads
SDHCI_INT_STATUS, which would also fault without clocks. The PM runtime
usage counter leak only affects this already-broken device instance and
is an acceptable tradeoff to preserve system stability.

Remove the return value check for mmc_gpio_set_cd_wake(host->mmc, false)
since disable_irq_wake() called internally always returns 0.

Also return 0 explicitly on the success path instead of propagating
stale return values.

Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>
---
 drivers/mmc/host/sdhci-esdhc-imx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
index 6cb84690fde4..f4bfb14423e4 100644
--- a/drivers/mmc/host/sdhci-esdhc-imx.c
+++ b/drivers/mmc/host/sdhci-esdhc-imx.c
@@ -2126,12 +2126,12 @@ static int sdhci_esdhc_resume(struct device *dev)
 			dev_warn(dev, "Failed to restore pinctrl state\n");
 	}
 
-	pm_runtime_force_resume(dev);
-
-	ret = mmc_gpio_set_cd_wake(host->mmc, false);
+	ret = pm_runtime_force_resume(dev);
 	if (ret)
 		return ret;
 
+	mmc_gpio_set_cd_wake(host->mmc, false);
+
 	/* re-initialize hw state in case it's lost in low power mode */
 	sdhci_esdhc_imx_hwinit(host);
 
@@ -2158,7 +2158,7 @@ static int sdhci_esdhc_resume(struct device *dev)
 
 	pm_runtime_put_autosuspend(dev);
 
-	return ret;
+	return 0;
 }
 
 static int sdhci_esdhc_runtime_suspend(struct device *dev)
-- 
2.34.1


