Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E839CC4452B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 02:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zrsmfTxWv4l/8hpUClIn6GYjOKWv68sanfDgI0s/IfU=; b=c81sXDrisOn53W7rLA1f/UaV+X
	cf73gcEcGJIrlkN7HF9APQ/PIEM115wGFtD/kWDO61n7vmZgRkG2CvHB+W0yyuHkKnKhbu5PhlYrL
	VMNSTCXsARspkgNMkE/DKHE4UXrejTGx2VG1R5pG4N/EQc5QrJKuUE0HJ09hmGRCWGIrselAbkg0J
	NQXzMXCtT+OcSI+XPIcOAHc9huQ9yNJtGiPQzp1AMevb5u7z7SPwp422UbWzBsukfbUMQUPgkyKYv
	O2V5x2X82qKjJhU0vI0sHN9CL3IEuOxzcZodeyliPmzFD4aEpLGXJazUpi43MjuEQB2MgnW64xn/U
	k9MWPQkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmMoo-0000000Al9R-2CVA;
	Wed, 22 Jul 2026 02:36:22 +0000
Received: from mail-koreacentralazon11013012.outbound.protection.outlook.com ([40.107.44.12] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmMok-0000000Al6z-0VMr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 02:36:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gnocKsjCQRspaPiSmJfBVqHVRHGPa4QWMrNyLaMOMBEH4XrskGN2Aj+ivubKarx44C4tBld7R51JhCov9bD0kMRps1o87wEUAd/GPd0cMSBvLm4hlmdK6i8sfC+gtRthHbhOAT4z2pTeBSfvfQ7jYYAJksNKfCLIyonVxxv+QgJhMLS4meuasuY01NA8yAQDwk33b+R5SNRrb2DCxaazxnejdMIc11GBRIHTO3NCFnlv5YiUmeUXPlRvnKZ2GEw4a0T5aKW3aWLUhjt1dsPqJc5sfFXlPDVaQUEDR+Z/S1ikZacY39Ih157UOSAdyy3HojP/ALttHqKsh6YIO2YoxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zrsmfTxWv4l/8hpUClIn6GYjOKWv68sanfDgI0s/IfU=;
 b=aJ6rAfqd67Nf2RniEZYsUB6ao5EBQnKxche6aPYf9S3SgB3YOe2Y1Qpw2l/KOXaIoNuqWsqIPUEzOgRFfGwyxRGQfApSPkevdfW55hRzzBkP8XP8Ata/O2bgpZyNBjrKF/MEJ5PwXxf2sS4A7LM0iGvwcccyB07PpLzEvv6wfxW193xguGjXTLv6i6EVSEGNC+isdLKjD87S3UFWH6yWN7LhxyzlbGwbLtrJ3fsGFadeh9E/vofQh7WHz8jrMilvDbE7W4zFO2Zk8+hasVx6DpdVggZQ63fNfuuV6yvcWIjrS/Pu6wpbV5aACJ08zdw3YNXUk5tU4xmlnAC9JBWq5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zrsmfTxWv4l/8hpUClIn6GYjOKWv68sanfDgI0s/IfU=;
 b=SXSIJHrUtPmKB3a/dnD+4Z/E+qK39+nDjQU1O274uVLbC/5ovCWUg33/T/VeP7PFzGOECbEiUqfss5sfFJ/qG19Avu5NJ+3Vo3UMZnAzYn4HNcUflNCPapFevv4Kv6goPaQCt43AWTsV0t6C9E7bWIDlxxqdt2fkfo6a+kFUcwKC2nRpTAPqFibk4/d5ixkdDn4MdCoPWcgofwcSPFkrrY0kv2RjH2pcKfkieIG8hqLPuVSsmL+a8JgAJ3oBaCodyZkc+AyufRzsHuhjLqC6BpQlxmNMCOtUfuvyFtahmMPf4BRhGSfJ4PnLaixxSUobD6aB3Ig/jD20snx0xsyMyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by KUXPR06MB8031.apcprd06.prod.outlook.com (2603:1096:d10:4c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 02:35:50 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 02:35:49 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Michal Simek <michal.simek@amd.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Jay Buddhabhatti <jay.buddhabhatti@amd.com>,
	Pan Chuang <panchuang@vivo.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ZYNQ ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] soc: xilinx: Remove redundant dev_err()
Date: Wed, 22 Jul 2026 10:35:23 +0800
Message-Id: <20260722023523.42269-7-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260722023523.42269-1-panchuang@vivo.com>
References: <20260722023523.42269-1-panchuang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0023.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::19) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|KUXPR06MB8031:EE_
X-MS-Office365-Filtering-Correlation-Id: c14770fb-1ecf-4098-e91a-08dee799f142
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|52116014|23010399003|1800799024|22082099003|18002099003|10067099003|56012099006|11063799006|38350700014|6133799003;
X-Microsoft-Antispam-Message-Info: xLC7jXEy3PDY09tKI4SY2w1NrQnfBD/m5PhRYkmxuzxN8uaRgDRSbAk2Ehg5TUHA0pjHkObbOehfJQCDZaNELHQAlo+X+geKYqFTGpDDNP3bPPWR41eQ+AdaA0A7ZW24yIhyR1INbg/Q3XqPmzTgiPM4s/yQWWZVBZKcv9fXwZu9t89IZvSUIv0l7svZyKryczzaLHlCCADF405o+zVNSef/jjBdcbTXpp9/DC4fKDCafO4IFwTRvXIea/vDJxphx9vHfYpfaqjH4ZNpy9slmwdP+C1F2wrP7XyWL5e7/dgYHskA3Py+EI5naPWyUYPYJGcz9DzhpBY3W63gFV544YkPsB9UF5AkG/WKmjvELN8WJE1cqrumr8MapTvjo08Chm+sAUGoiVf75KZHRfKd20cRLEojce89r/IROV+0abOnSaBzccZoWX1cv9yCmW3j7V5u2bD7aSY7IW08DF3BdGHalIYSL8Ktud8zVTP0g357w9EaYCRVA87D9TFO0UWblPpQAbr4ING0PJczA3Lptqng5hdlMFsOipcEoW7u1a6eAzq+/s/VuzVR1egj/bAxYoAbLTSMJfzxb1PLFD5Ct96DFsSYk6qMP2I3IZyj3IJzMjOexUHbLcW4pYzYV5C06+mxm5+5Vpz8gnhlqjuFkzzoyElEyTZqKJmqO3dF1vXZKr5tWWpSkBli6rxIE5695RHGi9DEkFi2LNuYcnmDBvUYcOEhnYvt3m0TPn2U8A8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(23010399003)(1800799024)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006)(38350700014)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J0vAwX/Z54nMPP9BMNsrR2E9ctmHKMTEHthWGCfl4OfVeKli9ZL1gXfJBLkG?=
 =?us-ascii?Q?KrSvzHXCBf0Cky5MEWD0yG/SXGOLurnaxs72ByLMuiAG0tymcqIRh906X9EI?=
 =?us-ascii?Q?Ka8isPFIlmAjPz1JxrKWjsCtjClZ09Dv6RMNBGJGr0X2TRwv0TSxBQ2Pr9l1?=
 =?us-ascii?Q?5tQtveThtAYplCA2pXYyILOcgIXhFd3Sti7ZDkEsmVBHiGqqtoqpCCStMcUW?=
 =?us-ascii?Q?CsgGF+BOlUCzDMWDEMK/LZ9sHGHIg5LhS/NruOPmcHx4caI04v2P5HFT58NJ?=
 =?us-ascii?Q?/0bsHXpiSqxsL45xuhE43RQR2D0vUNae269du3Kj7CkybkssJXbcTxXiE/2Z?=
 =?us-ascii?Q?z1o61BCTk0j6bE8iVLK68cGQ5WMK1GvF9RM2GbxVe3j+O1/m7KmobZBDwP+V?=
 =?us-ascii?Q?+1ffHzk3IT/wELFErai/8WpgiBSj/PSpkfiJbRnSNVT194xjb4hhNkQtZdQJ?=
 =?us-ascii?Q?x5SjZPsN0+AHo72rfmrz420ZpGNTRh0BeQ+CkAJ2XvgSpKvnvBuo3XGxCwx6?=
 =?us-ascii?Q?5d+70hyLRGm3GCbSbiUQ96WXjxhnEbEteLGc0tcGP2p+llCpTUEeRcSjH/6/?=
 =?us-ascii?Q?eumfCNrIIVyldU1B0SsRpvi4NUsa1lJ9AYw4wiXX24lAGw1r1WEWsmdD9m57?=
 =?us-ascii?Q?rN1tBM4KUfZXPZTUJdL8nGnnfc2NgvEtpj/eEs7z5TTXHCQptvw/DRP58kED?=
 =?us-ascii?Q?CTcEE++CuqF07qB1fnv5vVwsTjP0phSbZO/t8TbRQGlDSYJ4TiY5tanmbXtC?=
 =?us-ascii?Q?qPB7B4rfWY27cEnEdSni2/zUBli8ddptE4bQQzQLOeqwZRRg7SxqIHhF/FI5?=
 =?us-ascii?Q?xIzS9PnCEhwLNahjqJuMfek/Rd3ikH8cjWoAmWn4Wc0UdsHmN/XRnRJIn5lv?=
 =?us-ascii?Q?8LAMGHsEq2YZUkBuP0bJR6Nvz/sWTBpunVUDbvvlDEuw2+ewk/d7FYNlmzRa?=
 =?us-ascii?Q?WCEbEF4gJtMztqAlqLrFYPHCtcX83NumbVh/e7Jk5wU48D1r97Z4lPrq7+Az?=
 =?us-ascii?Q?csjE4F+UK+TsANznKN+78pxOiC6Be8uWF7TSy0zdE/CqctDS8qKQHV/eRYwZ?=
 =?us-ascii?Q?q4m4q79iQKXIDd2Z06LfDUbGKDN3nWSmEbCuqOYcodDEwFvHHPKDCYZS8zpf?=
 =?us-ascii?Q?E1AQiKxxtJXNuniNZyRli94TLPbhRts7zt0fhGmz5J/j3WAYc2O4u7rmGLTV?=
 =?us-ascii?Q?zFfVMm4LuK/jddhCpbmMalas5IoSM6zGxP9EB1yNmqLslUdajANzzkprC2GT?=
 =?us-ascii?Q?RvdpNoj8SHGTHmwk424/8I8YwoxpNEjHlmBq3xd6r40MkMNBHv1Z41jNzIJ7?=
 =?us-ascii?Q?MWwW8NTt+NHH1LkPOmnVDJzejeuDqgR+GKZ/wkim81wRUjqcxKjrXXGAVQ4c?=
 =?us-ascii?Q?tt6ztBKAxGsKMFMsyZpWyZh7WmcpInD9w0qgLgCe9VnLZ8pyZM9/ShJDDrX+?=
 =?us-ascii?Q?oq53ryM4uVgM7cIIUjc0jkbmHU7gXN/5YfFTBI87eGfQgc8Ztbtda2eeZQ3K?=
 =?us-ascii?Q?aYOihx2CZVfPXR4ypcaq88H0yA0g6N/Hwro0ax5HimRnpdtSHlJFX2jY0TTk?=
 =?us-ascii?Q?zZVk9bLxEAThPahlOCxDpPFlxOPfMFFFKVG+dSUBPFfImLYqSCpMf9TzzG1I?=
 =?us-ascii?Q?6LFWQPMYvMdn4hKNuUFkeMx/SCfB2krZzfPHPn2DGFlMuqh3HxG+sbjtwCz1?=
 =?us-ascii?Q?zIfm5GGxtNn6/ka38J+RpbD8RtE0PFE4q4rPHciS4A046BlmwrF+iFzC1hnX?=
 =?us-ascii?Q?f16w3JJXOQ=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c14770fb-1ecf-4098-e91a-08dee799f142
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 02:35:49.8605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lsq8XyW+gtHn7MyuDO6cu/MgL8fvuqiGXNrbsx2Ukc9kFjMVcKL4NJMm0lfUkpQRhFssUTIpOB6F3YXckjw24w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR06MB8031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_193618_168354_D534E257 
X-CRM114-Status: GOOD (  10.23  )
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

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_threaded_irq() automatically logs
detailed error messages on failure. Remove the now-redundant
driver-specific dev_err() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Acked-by: Michal Simek <michal.simek@amd.com>
---
 drivers/soc/xilinx/zynqmp_power.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/soc/xilinx/zynqmp_power.c b/drivers/soc/xilinx/zynqmp_power.c
index 370e61ac47d8..54c796afb89e 100644
--- a/drivers/soc/xilinx/zynqmp_power.c
+++ b/drivers/soc/xilinx/zynqmp_power.c
@@ -368,11 +368,8 @@ static int zynqmp_pm_probe(struct platform_device *pdev)
 						IRQF_NO_SUSPEND | IRQF_ONESHOT,
 						dev_name(&pdev->dev),
 						&pdev->dev);
-		if (ret) {
-			dev_err(&pdev->dev, "devm_request_threaded_irq '%d' failed with %d\n",
-				irq, ret);
+		if (ret)
 			return ret;
-		}
 	} else {
 		dev_err(&pdev->dev, "Required property not found in DT node\n");
 		return -ENOENT;
-- 
2.34.1


