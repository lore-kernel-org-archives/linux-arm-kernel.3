Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C4A9C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 13:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nesfrz4QWytVlpWtBmnY20nvXgDfFUQVNPSONx93xYA=; b=ZCZ1oDFKN7W2JYIqsyorg4gqOE
	mQiV4r9y8ND0AyonwAlUKGLOLqktIYhdPf1sBROqTlQFmWsjDfbi5+4e26o//hboVFQMGfUXAU+qx
	wG015Zr6k+WACwajtXc1YNtPs1B4lK9BY1f4PtPxjFhk7I35N6D6UTtYz8o8t6OOE74wUd5VxChg9
	Jgs4xk2ELKfyJ/JwqSUzFItOQ7v0jStP/B1enEClDaCvkwQdZ2s9Q++VMAMq/iGt28LoPyP6UXPE5
	GwbNJlRDRtqG37ZHzzFRXPRzpczdyz3V5vxOtwwKKiyjjAyC/CBKRpwRbU0jETojWCwNCWgJExy9s
	i1nYjy5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whpHr-00000002fJB-1kBb;
	Thu, 09 Jul 2026 13:59:35 +0000
Received: from mail-japanwestazon11012039.outbound.protection.outlook.com ([40.107.75.39] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whpHj-00000002f8t-3vPD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 13:59:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j375kqtaB7Apy27XnFE6gc8cuQO9x2jFUyaBCKjAZD3q3YDvdaEyD2hfsw5tR0wSNPBlkXpn70DQsoGTqOYu+zM1XQcqtllleCbXjgvU8Xfio4ST4ieDFsFFwza25eQw32ZKUJgd7ilqEYXjg3HDR67nUB+UqM58f6h9Pg4G1xqT116WnCbf5Yjes6+D0t2KrOpSzVlyWnZnOali/McE+Kjr/bGVo5cnVsDoU2800UoVSOazNXrPX0tBX9KV+MXh7Jfk35BgodvSniPgrk3/TCIcO4eKhAfFRWgnbxzOQtzQ0ch6lhDNPB+AkJ9ff/nWCM25EKYWbgcjQVbdblYWdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nesfrz4QWytVlpWtBmnY20nvXgDfFUQVNPSONx93xYA=;
 b=ZWHTOQCm2ywGTb7JCIIB1qJSQBvGevvfuRu6jMM65YVsDDxwHKbsokjFzgb72eAjNiPAhxPRK2fLZDzoRTpSgjPPMsKJFegUP/Te/tsrpqBWP2DVslipR8HaEMYTdOTlhKvzZV1BTs884748SvESFENfU9azSIyGLlxCeiXtUaj6mqy0mm7Ti2TI4TI2b/p9a7jBDxrmrojkhyq/FsZgcSh+57jUmT3mv6RlNTIb8i6WPf8zuBZxRi0/EZVASzCVTGoX1g/939EHo4FgtbncIY3NXxXRPnZNYH8tDd6aNbc8erPbPWBb5TohuPT50N5CE4D7oftxgwroXTkUfSUs+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nesfrz4QWytVlpWtBmnY20nvXgDfFUQVNPSONx93xYA=;
 b=IGCNAfQnlCXuA+MVF66lSx93/FFnedWe4zERyQeSfXFQ+Mk2L6fQ8oGlTPurqAf7F1Nf6n0WkkWbnIPX5Sq1OokhtfmoOGONDhxrTXxo34YFbY8fKhO7SBRG1cAvfo+8OlLjJmeEz59JTDURNq3rFYsfgNjM9+pP99nJB4Yy22bwq4Z5GKm8zP40Zga4oS4hIPxaFODjk9d4uYAr0UoUvOSlUE+T3QDS042pLVgik/9IEibvx+0NT/YQN29PAPTs6TCVidlk2Q8VD1pVHiAaSH0gUtaflLd7Mr08bJUQ360OlFojpi9Oee5ReNXdxAeKpMcITIWOXPHInCFR1Ny3lQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by SETPR06MB9093.apcprd06.prod.outlook.com (2603:1096:101:318::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 13:59:14 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 13:59:14 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:PXA2xx/PXA3xx SUPPORT),
	dmaengine@vger.kernel.org (open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 09/26] dmaengine: pxa_dma: Remove redundant dev_err()/dev_err_probe()
Date: Thu,  9 Jul 2026 21:58:13 +0800
Message-Id: <20260709135846.97972-10-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260709135846.97972-1-panchuang@vivo.com>
References: <20260709135846.97972-1-panchuang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0073.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::11) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|SETPR06MB9093:EE_
X-MS-Office365-Filtering-Correlation-Id: 6582dbe9-6cda-40c7-fcd3-08deddc242a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|52116014|38350700014|22082099003|18002099003|11063799006|56012099006|41080700001;
X-Microsoft-Antispam-Message-Info: VDGZdCbRvf08EZuvQE/GSLcQfnPnz8CbkeqHWq34z7hV0X7uuN2lDGNk5y8E+AeSKEFUjxosHwUl9tGluwtbmAwrw/ILNa8pojQR30fr6JsvXQ3GKL66DjfWA+G0LEGg/6hwjRm710QRmWm4KMgrOxeKR+pdKjUP3Ab/1MCjigbdJtzl211bvGJ7tQp5AmwRoagdegEnOdcXM2oxmBpK6PfMecyk59rSU4UNlsOgbhQa8b55/pBzAnFEDMKv9tMckXrXKWsNOeTRvwhFdU8ZNy29UKOUMXTetWpUlxmIlu5zUmcXWd1tqp+f7y1Xi0oEKIs6IlJ3hkgmOXRrFTV9uheSaO5xUB2NGTY+wet2Y/sQfz+Gge122mYb1++PJ/MIe/4NA2K5IDhJR/BCL0ZmWGm0HKVKJu5JEPEiR/VFXEkT/2zXL12W8st7z+b33Xs1bzhxasWqPcIFUfyukzzPoEldUQd8+xdLbdknHDNeQm2B8hegwq/F6qqjYcmp77a66lQaQmcTKRW5DhlHQ6Ky+HYWBXeZ6AYVYQLrmrqZMdXr3p2Q9VFp/WK6RG1lgOuJDx+bsurRYakfpIanXi29GzcKBpUu1frzvlM38X7vIIzqkN4aXZqK36L4sjyq4+lwHwTwp4NifM2WHoV+3r882Bd2xcjKA4ypmOvbSa0z3dCp+Cr71wGJcuDZb6a9hhwDYMv3H8UYSfKjUGjIm24xdzwGdaOREZ8+YKpUpnQCS8pG/oWsOAgRGU+RooH0ZQ+N
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(52116014)(38350700014)(22082099003)(18002099003)(11063799006)(56012099006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZGzoLXqHHNGMoIKyYlgNoKnI1WptU2kImkoVNEYcXTgq6rBF4uZqwKSPBIR1?=
 =?us-ascii?Q?C3wYKJwMHEoE8FQMfKeI0D8z1C78oewDJOC5FjYzqxgRF0mTiOcTVEYz4fNh?=
 =?us-ascii?Q?kCippQnlSTGkd82vUIrmJdFn7ja9o/8qg5+0zT/YKA0jZPhUv1eFsbEWk2ZN?=
 =?us-ascii?Q?76yFbxnpuTB2TXGqYdvW3Eha6gefrB9KYX5cuMQBtjjBjxz3eAKrXoSnHBmk?=
 =?us-ascii?Q?FiXFbdF/LW91DGGiAEoposwK6wTFzzOGo2ffz8O/zIdKB6sKp+0J1m8eIy2n?=
 =?us-ascii?Q?LYrOEX89iJmCwscZmnJv8lymUno/CRXrSI4rIQSVhFMdQaNw613AQklOmjop?=
 =?us-ascii?Q?XpiRuZqqtBjFlXzX/RYf5H4XepAaHn0w10a/vhyhhrgiEDNnIMY6oEXibE68?=
 =?us-ascii?Q?2xm8CACTLqd9Jn4hk8+AUx3p4KCIsDQNBiXqRFc5TaQE12yHVIIZOk0U7lB2?=
 =?us-ascii?Q?KXSuljKE4PAtyvkhqhWTOVOT/ydFxjFRtu+MYKLyz/c7bkeTXi1mxJy+GnZb?=
 =?us-ascii?Q?r8VwzHwBRrWLy18seoSSSqP9vOcTRbwEMHp4bnYnzR+Oje8UWedwsDe2fsgP?=
 =?us-ascii?Q?42/nF6Pn8TPFTe3KeZTcVWGGFnmIxRFn3EBgL8ZoBxpUtp/Tgrbuz5Q1hWiG?=
 =?us-ascii?Q?nLL8J6Razsns8RMpRlN00lhc6ecsqrqrN0w0009PmnjCpoaOHQQD4ftf5bj2?=
 =?us-ascii?Q?F5ocYfye2Os6Qnok54cywkYF5Wv6BprojglCRZg99YSj2tj4Plj5KGrBHRxp?=
 =?us-ascii?Q?F0p3wOb9/T1vVJ3IsTO2i19boaJprY2wAE6R8W1B9jHWi7M/6MFDeKLeXM7V?=
 =?us-ascii?Q?FFtUvsfDbTdnugZuOkynLP+LdHnAQBRQihNm4FqC+lIt9xm59JPPJi1PVsbT?=
 =?us-ascii?Q?bgG5cIizp3KmEsznHCamgZYIwmTIOiosXFSb4Zy7HFGjILLodR1UKYwkx/3/?=
 =?us-ascii?Q?/Qu16CrW/otvfXamEt4VjrfdWzka46tIKjCmfMiTVwEye5OSjwODhDDYlN97?=
 =?us-ascii?Q?nxUi5pEJlXlZNC3uuxk9mAnYO0EFAkPMOcTw5wmqoewkeZmUiV3o2+j4+gi0?=
 =?us-ascii?Q?lYlH1unmkChisi3BCuYNeogV+m/MaV8uLt0/A5UAynDcm9PpAk8Xpsp4iIEe?=
 =?us-ascii?Q?vhO4coxfeo1FhpFSRI7QcLqhp+qLYwwpaHM66C1DXU13oBELxBlIDnO4J9U7?=
 =?us-ascii?Q?YJqG3hLjAEprOWyfW/NTXVNkNsZr45C2/xTxdpNaVG7kAjv4fMw+IUiiZRoA?=
 =?us-ascii?Q?4u+ZOkfjfoEOzcQSfCEqLayR98nhgcN1hFok45iSjgYaK6vQc0pYwIGWPIhB?=
 =?us-ascii?Q?umA/dRGnIHm8DTqltDN0qvUqWIqpGub44R/DxUxUDadgYVtRItKnRcSzCxZ+?=
 =?us-ascii?Q?zHFq2vu4XLWC+2IdiWmEl72Z95vbC4XLBOOg2/ZZSBDTDsfl5g3rLS+wrPY/?=
 =?us-ascii?Q?8BompP2zMCZkH2COs68zU77/8hWaYik3NIwZzWdm389Y6pLvXra68S0L8TkN?=
 =?us-ascii?Q?ywmSkNF5lnSxuhwp5jlTz6GOSVcPW4ul2Rl7YspWvM+OzUvB1DPTw9o1P2k3?=
 =?us-ascii?Q?n6sAEEPaOoPNGXqCK7cK1mEMH+Wwretrbu0qSy8RKIdiFF2+EqdXkn55Jaq5?=
 =?us-ascii?Q?WAKkLlEoJ4J4S1Q8vUg44KYxqT4ZTveU0l3pphdo9l/85hm+8iDPtYhawGSp?=
 =?us-ascii?Q?s076J+qTuuHxowerNgc/YLKaaBEHEe5+Ly7xmf1gGfy3LGxbdBrMrNskzw6a?=
 =?us-ascii?Q?G2HuanGVKw=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6582dbe9-6cda-40c7-fcd3-08deddc242a2
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 13:59:14.6764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FmiX+Hqum48HPb6kGT2xEJDDu6Z5QU+nhUt4vtBNOfAazb1Y6+fOaXo3nYphzpvVO2vJaBROA4/zftvaobFNRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SETPR06MB9093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_065928_002355_741F85CB 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
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

The devm_request_irq() now automatically logs detailed error messages on
failure. This eliminates the need for driver-specific dev_err() and
dev_err_probe() calls that previously printed generic messages.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/dma/pxa_dma.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/dma/pxa_dma.c b/drivers/dma/pxa_dma.c
index fa2ee0b3e09f..7bdcc5e6a3d8 100644
--- a/drivers/dma/pxa_dma.c
+++ b/drivers/dma/pxa_dma.c
@@ -1260,12 +1260,8 @@ static int pxad_init_phys(struct platform_device *op,
 			ret = devm_request_irq(&op->dev, irq0,
 					       pxad_int_handler,
 					       IRQF_SHARED, "pxa-dma", pdev);
-		if (ret) {
-			dev_err(pdev->slave.dev,
-				"%s(): can't request irq %d:%d\n", __func__,
-				irq, ret);
+		if (ret)
 			return ret;
-		}
 	}
 
 	return 0;
-- 
2.34.1


