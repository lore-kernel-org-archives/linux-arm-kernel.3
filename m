Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB85C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 11:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SyQJA5xjU+hcNzwr4JLe0N3IQyMaJG9zyOHM49l+bxM=; b=rGUEWVsq5SkHeudvOqOtDipEFU
	Hcne8HwJxPpQNuEHAYXM7lzw4o+V1F8vUbA3Kq3gjdq1VEEU56JhELwRoPXrXRjq7UjvIPgCH6fON
	QPyrGlYwQcKopqCXpYa76NxT4voGrNvPJJepNdjKEzNjPU56yDFw6pgpVJNiFXqhDr2kHD4yOzWaV
	F4TbGfg9DdWyLoqpMnuGsJ34N29KHUpcuRgXpLi5K3bBKT53gZKEshWUgHSfk/bhbwxUIpti/HLMP
	whmqJH9V5ttZ7R20GxQyIyA2wJ04FckKhJ+l27DM7NPETWnTYSk2I34+g2Iq4RDvSkSWMcRqJDdxF
	QBAlnPWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh3Xv-0000000EoDR-04yu;
	Tue, 07 Jul 2026 11:00:59 +0000
Received: from mail-westeuropeazon11013013.outbound.protection.outlook.com ([52.101.72.13] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh3Xs-0000000EoAK-1jhK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 11:00:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CKAPvOTCnjU6Ajdlbi6Mgjpd5M5Vck2MfwFv6wDMQ8jFPGTMbqjbg79x9rEOsR9sBCresG6FmYBuA4k6pgoNTX/T78DmoPrG0uF+vjA7vvi2UUrnPTbdobSrWbYnMIZPsBeAVUR3p1nlEvLxos2+ZDOMflEzka0e9p8ymTbxHJjaxPRbcYVN6jQZxQLCkO5CYjI1WWnTyRPAny3LRQDSOm/cGZGoxshydstGPz3VkOi5e0bMyHSIya+aTC7Erh3DQWc8SNVrL3qfhrE01a9/izItux2bnGKj9aZ4QKl2aSSaxjobgv6R/gTgZY565mLbBXwGuxkka+JMwOrXLhKuqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SyQJA5xjU+hcNzwr4JLe0N3IQyMaJG9zyOHM49l+bxM=;
 b=xolP7yQW8SdkwtaWJkugFSHHjp6ictwOzq023+RpNLqy6XOKv5528fnCNYwFUoFjTEYEZVc39T8iEmZ841V0KuA7D11egoUZdxb4Fuf+gjNuBu60XNmiu2+ZKF8XZAQrdjTw1DJYXIpHAD86Ej8od8aQ4YtnmUUtq3lKY5OdWfHc+CUcdV1muGTaEAyW6g8vNrbV+HZ05obJxW7gLusxUb1N9LjvtKSbhZMn5eYD0AlqJZvluIACFAhmSkvn8I8clE4LKx8m9Y6GffFOWL0yM1fdoRUljyN3EyBfVTEJkYU2ZyrU7ojoErcxCpLWF40er/b6RIHRylwndH9vGVDGow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SyQJA5xjU+hcNzwr4JLe0N3IQyMaJG9zyOHM49l+bxM=;
 b=pKmTKdLeTNGRcz1uIQtSdSrqxOZUe8npp6G/P2P0t+DIclYX4BI8SoUljD/2F/pBkYwGitCtwuDZpmGNczl8keQWoyJNNwxNvRi2BnrIE1zFVDQD5R/wPFtdRF+wE+aT72bsY8Ci3wYt2GgZa3dM7pdF0ZBbfiaY1r+rntE331YQuMW0tRFd5HqC24O6+TeAhSyh57cpBwRhkOn3wsHY0Hz7eyrk2AOq4ASfAPSEJMvktkynhpk/bjlu/WS2cpM6LeWcIopEXBTGXsVs8MEnuDxwQabCixk+Wdxe5RldaAE/9Wul4Rh/zvOIJIRPYeweklefEfV60ZHmsQYQ5rMsmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU2PR04MB9180.eurprd04.prod.outlook.com (2603:10a6:10:2f7::6)
 by PA1PR04MB10673.eurprd04.prod.outlook.com (2603:10a6:102:480::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 7 Jul 2026
 11:00:51 +0000
Received: from DU2PR04MB9180.eurprd04.prod.outlook.com
 ([fe80::f94c:ce27:1558:fb05]) by DU2PR04MB9180.eurprd04.prod.outlook.com
 ([fe80::f94c:ce27:1558:fb05%6]) with mapi id 15.21.0181.008; Tue, 7 Jul 2026
 11:00:51 +0000
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
Subject: [PATCH v5 6/8] mmc: sdhci-esdhc-imx: use pm_runtime_resume_and_get() in suspend
Date: Tue,  7 Jul 2026 19:03:01 +0800
Message-Id: <20260707110303.3779799-7-ziniu.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260707110303.3779799-1-ziniu.wang_1@oss.nxp.com>
References: <20260707110303.3779799-1-ziniu.wang_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0346.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::10) To DU2PR04MB9180.eurprd04.prod.outlook.com
 (2603:10a6:10:2f7::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB9180:EE_|PA1PR04MB10673:EE_
X-MS-Office365-Filtering-Correlation-Id: fda36f1d-caa4-4ba1-019d-08dedc17021c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|23010399003|376014|56012099006|5023799004|11063799006|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: Vj9ZBiU7l5aPLAGD8dTMNfa1CjWH4iU0q0IynNCT3yCi7ijhi7fbSGqircIfT+1AgyZ+fj4t4Nj2s4idRoesp/ve3nf1aJO4v3aZO1DdmP7R5Jlpqk4djy3IOdW5/mcLsLUrWTTI/CbZmfJc/5LwiI5VqjrohAdC41uhqV98/bNhnRa3BIGbEYXLCYffyAODV8PJbwe5vLtF4OGBnNSqH2PCcdU/XH8nv5faezOetnNdtzkRBjHKzxbGgqxfrnRYl4PcF1RRl3iZBkahINcY0pzNJ+itp0ak1Jo21fxm9P3srIkpGXZKrnxsagMbyL5NWtzYTMuFgb8Bng/YAGVxYYuzsyioKivS1z+XYpgNmOvSK+r953KA/MO6coUC2f2LiPvUeLmKSX6G4cJP7o0XAUQyS+7z4I2JRcc+C/vNljVm/j7HKNR/15ueK8Ec+qc7BzRKViXJzDFvQiSvB1m3yrAda9iVEDwD7exeaqnGvVN7hSsyx8WaSPNigOlA12BUYMkwdn977ChxgOVre5hkG5k5TQ02huUTwf7rQSxOtzvqYByeCopO28Rca75DHStM5LqFV8OJVEcMENo6OI+SQHjpUrcs6mGLP03CCAT68kfE/y4cADbuzXweGUj3up57MugzJMk46r6s5CJVy/8r/FUg+MUCohXZtSZITsCi4Ic=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB9180.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(23010399003)(376014)(56012099006)(5023799004)(11063799006)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x2gbhQQ0ARoXT2/iMruN4nhswyoaukpVTQmrV+ML3H21Owukwg8g4QFzsWbO?=
 =?us-ascii?Q?jSipEWjRNSFmvwkQwII2JkpMXWZzz51HXGN2y61UXuBUoNwJbj1RBxR8nBEe?=
 =?us-ascii?Q?0XpMV/X4r/uEsBfAAnqeV28PBrub+QrbjLBizRA3wqnufU/2I1E57C6+apRy?=
 =?us-ascii?Q?rbAnOG7hTSEMw990NQywXWt+hPhQQNswkxeshLKZzEJCl5urTyP+HSBbR9EM?=
 =?us-ascii?Q?s71YEd3cvhl1LueQLzBBp2MKVCmGreD9XBCQq2U0iENPBYk70WnDKeSf/s3Z?=
 =?us-ascii?Q?wfczH/HtK6P5n7eWT/h4HZ9Lzlx4kHgaLGTB9REsStoJ7SWEFBnmNQmxhncm?=
 =?us-ascii?Q?tyWwlKrYlu4Q8+g+169SW+cS0MseG5k8BN5V2JDJcXxaZwbNiZcoBLHSW+Fg?=
 =?us-ascii?Q?94sWX9+0Ke3rn4t8st70tFEpW15ZkElz2d7LDjUQKoJK1li+Zj5jpPo3C2a2?=
 =?us-ascii?Q?W1rSG/4iFYJz+KMhfXRtrO8WLZqIg2FhxBLonqbwi5yTSlGovNsSfahFDUHZ?=
 =?us-ascii?Q?k24RoeWLRMKkyjeEZGrvoSy2x3Wa7O/pUIigqYm6b1/rs6pDXq4Oyx6CdQWu?=
 =?us-ascii?Q?UcVgvFBDQ/1XMDWtluICkxDDhK97ZD0UPedtN2nCNYa57ePKWhZ0bM2Y5mXD?=
 =?us-ascii?Q?yJ7UAvu+RaxJN8kRr28Ee9cQAO4jVq7sk4zXtUAttjQdoWyDEf7+9UI4B4lx?=
 =?us-ascii?Q?1wQgtgkbC8wkezjdKJo9H/cZpbnKExdy4CybvbBaAmciPz3ukLxn/KAuATib?=
 =?us-ascii?Q?sOEwZut7y2MX516mf+n4SdZxycIRsTNA79vg8pr2IUHPMx4RSuv9WdQIQ6xX?=
 =?us-ascii?Q?gjZlYODr3SQcBJ0e7Hw4A0NPE4SiWzNchr5FyhuIl0YSuGbZD91jSdY/cx0U?=
 =?us-ascii?Q?6h3yq/dwj05tqo9/41Sd9wkkGnQyoGKutOnLThHruDWD5bD1EUuN9qEJS/RD?=
 =?us-ascii?Q?V4ZqUl6Q91Fl1tyJlIJGaw25+uL/YPv3mStEEJYAvu2ByrfM9v4rXIS+41M+?=
 =?us-ascii?Q?7O3CwNyZM+qsDOPyQ7flNgl68tpNxKk9x9EaP69i55/ThawBLx4lLGm1zy1G?=
 =?us-ascii?Q?iI/9Q+RzTSzbvmC2IBQS2PiC57yk8YqpqfR71zs8fTZB9q4E3Y4Urwpw0IBl?=
 =?us-ascii?Q?AxTCT+vM9UG1ZhzGg2WXGRJU01Wg2OBns7YjS1yi/sxTBbl1wgIw/mbTISBF?=
 =?us-ascii?Q?kFd0kJ5drlyKMToBr7czqdah0fesYg7zR2bcXuBfUdCrFn94O4Y1a6oluMvt?=
 =?us-ascii?Q?SrqB2yNajacIkBYtn8VYylFklpCsBrxU8joBlU4K34sM4iOKMPLiE6/djUhz?=
 =?us-ascii?Q?M2A0t/N6Yiqk616Ed2+k9F6xvBrUMa4kgOpNRtY5VLTFknq03yR5b7yqP3BR?=
 =?us-ascii?Q?SGwwcUyTk7lA2LhGAOFaME3pu9NMYv/3QftzscJDFsaF4gRwsXYX1oQbTane?=
 =?us-ascii?Q?XYYE17A75FqSJa7X1kLZFHvuD0sq20sT7KJatx039zqfAx8pgMOljwlIolmn?=
 =?us-ascii?Q?InwCADOfO0Sa41hPGK7Cd9cj6YaoX+CDv+0ZcgjmTJXP1MJjMys7AVXCHk4M?=
 =?us-ascii?Q?8u2rLNI1ggthpmlQp9c2AW0f4btWnfWgWi4yImmekidmqjhWCttrjatRozVw?=
 =?us-ascii?Q?pIpUeXt3yJ3eyPe/udD+9p4bUkOdWIm31PXe6Lk3HqeXfZuC2v7SN9C/zP2g?=
 =?us-ascii?Q?QFG2hpIMN9Wod1kBSGiNhSLtmOljFxfETG65U1XEUV1o911YUwRBft757Rvi?=
 =?us-ascii?Q?euD6CfGQ6eCmDw/cZ6oMVw+NhhKKw6VnxBuMcKQ0yN74a4DiyUbFGViJ/xqU?=
X-MS-Exchange-AntiSpam-MessageData-1: SEWnAjYyMEHMOg==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fda36f1d-caa4-4ba1-019d-08dedc17021c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB9180.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 11:00:51.4032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bIkWfZn+gUyRaEuxUOiPODeiz7q2pN0SF3l+kNTFAcRbLSEY0gD0dpoW2+Kc9lm86nZqNrCCp/HBUtLl7ss1OJxeGWYtAXtvF3BE3lHZADH3M9acaIQwOc7XpyMeqshj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10673
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_040056_463499_3E4CF094 
X-CRM114-Status: GOOD (  12.37  )
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

Replace pm_runtime_get_sync() with pm_runtime_resume_and_get() to
simplify error handling. pm_runtime_resume_and_get() automatically
drops the usage counter on failure, avoiding the need for a separate
pm_runtime_put_noidle() call. If it fails, the device is unclocked and
accessing hardware registers would cause a kernel panic, so return the
error immediately.

Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>
---
 drivers/mmc/host/sdhci-esdhc-imx.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
index d980dea9cad1..7818f351a58a 100644
--- a/drivers/mmc/host/sdhci-esdhc-imx.c
+++ b/drivers/mmc/host/sdhci-esdhc-imx.c
@@ -2061,7 +2061,9 @@ static int sdhci_esdhc_suspend(struct device *dev)
 	 * 2, make sure the pm_runtime_force_resume() in sdhci_esdhc_resume() really
 	 *    invoke its ->runtime_resume callback (needs_force_resume = 1).
 	 */
-	pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return ret;
 
 	if ((imx_data->socdata->flags & ESDHC_FLAG_STATE_LOST_IN_LPMODE) &&
 		(host->tuning_mode != SDHCI_TUNING_MODE_1)) {
-- 
2.34.1


