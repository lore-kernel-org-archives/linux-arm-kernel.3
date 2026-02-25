Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C20FD45F1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 21:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WIhPlzVB2eNCFFyPytfMKuAAalHWKWIeGDeY2sjzLX4=; b=w6KAWBZ6QqkEs7DrDRoCFP0guE
	dwGdeaNl7ZE7ZWSs8q6yk84jws9gFXbV8dDmIq64piwjeWx+bDGMbLia0aiy7K5/tHT4tCTS2W3x2
	OlfMAP0yhd5OQQY1s4ot9z3XasR07EaA5eIOOcNO86Hv37IdoLvVGYBhUsW7wJYdxyyA7iA/QJzha
	/B6iy6H4G6Y93mluYRmnwfVdH4gbEYFiOlCa2fQDGd5AKA3kbFB04m6fR59KG2z6CPZmMUhQIs7jm
	Ewc3h9vBbUbFVSLGHgaCfWifula20Sd4sYT2Yv/PtdDOqvSItno4eaRqfzTeGLgZg4bEeD5Kk8+Rk
	Nxgdpidg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvMe1-00000004vyG-3nAW;
	Wed, 25 Feb 2026 21:42:09 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvMdv-00000004vuQ-1ZVg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 21:42:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HqGom4H1sOd3i+nH9knUJZRkbXp1cHu1mAMN1VU0won/Z7t4+Lx+T2MxPZHLKQFSSNpG0FJzDuyFtkQ0ItrAXEjoMba5DbCWyXUT5+rgHm1rJ5scLaJLK56jmGwGlh0vrLcbrR8GqsswTjX/q88bi6ZBZR6d888Ia977sb3nXI4GMPlKY/AKmzM0S75XQu1+OJeXYan/6x7qfU/6/tejkOLRGbDGfcVk4D7ZsowCC//cUIZsPhErH3OHebVBOUJ/jnHIQH9pzuSf7KyqzS5KYkrnIf2nBugunQMJF/YD5aJcnKUF5/IBzMRe/PS/tlEJBPGRULAJilje7sICPfxofg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WIhPlzVB2eNCFFyPytfMKuAAalHWKWIeGDeY2sjzLX4=;
 b=UBKuuL/be/jvImOwdEiV6P7BYn9vS14kpEMvkdh9UJPNynXoRmTogI3eS0MWEZrel7mVxfVSkX5iPphDpuvZS2V1B/8F2QOTa/qd/vMpQPbTZ9s8tSk1Gc1QXP6biqqIzKrb9mOzLtTDFxDx9l5BGtLLil+6XkH78cfpVPUWhABSVczt9N8uvs5l/lyAnzqI7ZHLsTJBp2SCrMZxzOmNSEqWRyV/iHzi06VjCDy/0RhsWqNf7fherw1Y83IEDmu2Mmjm+0lVnh1NHFmR4KGo2xBBfzJLMBSGacgUUiQcrmtJig0/vGzY4ImPmXHctpaNAbONGq3H471N0SdrvWyK/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WIhPlzVB2eNCFFyPytfMKuAAalHWKWIeGDeY2sjzLX4=;
 b=i5bNU6hfJLw6pNEEL0vFiZZKkULFX5pySyuY5ig0bQgCn64zz8ILzZwiDm6lMt9pfsQ+rusm/irj3IQWVTmxjBUv65fyoYiusOx9Dz2kkoiOFW4n9xN9AcNx2d9q0qFcg+bw1FkZK61zrXTYOlxrecg2zBIZwMUQGBf3yTxqGYzxrgMmKP7BlqysiblHbqIHrvLD/z0ZU2XULGLfdO/29TnBAymKp5SaOSA6Sp8MC4DocnNWdQrOdA9S2Uvxik8Ijc6onRDPzmbM3D9CllLxqR/bWOWkZJsLnsZ8jUEFLFhDaLP4f3DdmLbaGS0AFxjUmxqjN/4d0erZDZdR9a97Jw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM8PR04MB7346.eurprd04.prod.outlook.com (2603:10a6:20b:1d9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Wed, 25 Feb
 2026 21:41:58 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 21:41:58 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 25 Feb 2026 16:41:38 -0500
Subject: [PATCH v3 02/13] dmaengine: mxs-dma: Fix missing return value from
 of_dma_controller_register()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-mxsdma-module-v3-2-8f798b13baa6@nxp.com>
References: <20260225-mxsdma-module-v3-0-8f798b13baa6@nxp.com>
In-Reply-To: <20260225-mxsdma-module-v3-0-8f798b13baa6@nxp.com>
To: Rob Herring <robh@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Saravana Kannan <saravanak@kernel.org>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Shawn Guo <shawn.guo@freescale.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772055708; l=765;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=6oXoEVjw/s7KtenPfEUTRRX/JemT9wDDItCXEAwBMYU=;
 b=ZT7DT+KZxIwr0JG4PhVUhQv9VPIXYyA5QM8OC+BVhsUtShUPFj5eZlDsyzV/jVZXBE+WcM/JH
 1/1Xj1pqOicBPFd8i7KM/Th1xcq1uk/jqFETjfs6uzRAwMQ2+Sp4Z08
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH0PR07CA0052.namprd07.prod.outlook.com
 (2603:10b6:510:e::27) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM8PR04MB7346:EE_
X-MS-Office365-Filtering-Correlation-Id: 52c102da-b1f9-41f7-9f2a-08de74b6b3f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 606ethjBZ1SorBJQQcNinIO9u3be+Gx7PElxUK3gAYhO8nQGuD0HWL+l4m/fqfd5Q9MOWuQHVNi5tc9pK30oCbsM6UTL7aalAeap4zlHqgSCue4KKpdVnxjI3koa95C/V8/UnhQIQMEz75+Yg1H6UYjGzCBHuOPhQ1RDQDEKh9JHE412rTBDpx42v94X9Q55fa8U0isMV7iw6tYDOnfuV/0OXua8EGAfVOW7bOFwxg2DrU0xDFsu1WzLYOr6X8x45yn0pEp386E2+DqB9maprLDW34i2PqCmU295XMQ9nAD5bSuqri6Mna4GzswkzyZANKJpmNf57EtDma6aTPj36KgLaKr09njMkTwsoWQA00PVDDYYzkL3U2sVAlisCB2v+EAcH8XQDheuH5V52d02p3VHxIxzb/XjPoBzrBhlHPX/Sit34jRFfK9aSalsZrOQTWQ6u/LBc5DFB9VSCs96atcEkt5tggHkXG8OzHDZSKKoixjto23ht966eBW7/lWxclaE/cMhacN/M9+/RB0+kMdXuNLJyO0T/KdURorJCFZYc0AcdPYrjD8/fv4YXw6KSBe9rUD892RH+Uezron87WpgQN7d/6hZUnDv3As5w/R5t39XsGQ5wesvOacKrbQ+y9I0FESeE8Xi/g/5vws8VpEIH9TgQv2TlXCg//gGUmSB1s9/nSQQ9AcZVru5zOfLvCyBe9in65WIkx9pqmYycNZO+K5fB2+jXXFf6vm8egKvpu0aPsh9RBpWHoSGbZVFC1xISQWWb5WT894WHKKugopj79RJsTG/XiDqJeUZwu0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1ZtSzV1WE9aczhVTVRkcW1LNWdsOVg2MjNEYXJhRHFBSTNhVXBDcUQyWmN4?=
 =?utf-8?B?cGxsUk5NMHYxaGNNL1ZpOTFDeXNnQXZ2dUdFZTgrMHJPUzJkMG9UOW9oMXJ1?=
 =?utf-8?B?Y0s5aElMOFJPSTBHN0F5azNZR0NFc21YNnVvcVNxQ0E0cTQrWFZMbldUdHZj?=
 =?utf-8?B?djdCbW91WFFTWTljeExrSVpaa3c1SFlkc1pTcG5TU3RueVhnS3cvUVFrS2Qv?=
 =?utf-8?B?Y0tFbFNrRDQ4OHM0MGV3dGxkWVptT1pjL1lXdEcrb2Nuazl6YjNPOWtZUjF5?=
 =?utf-8?B?NzlXcWkwSm0welZpamxkZTVOL1RZV3gvUjUwbEVoR2RleVYxSGNFZm9vazJo?=
 =?utf-8?B?QTVVT3lteWRkL3dIbUZPMk9QOUxGUE93Q1YvR3J2OWwzSk5ac2ZTeWFML1FL?=
 =?utf-8?B?OVE4WDlRRmZ2dnlsNU5wYWdQQldxZTM3Z1RWR0JFQUc4VHQybjY1MDlWZFp6?=
 =?utf-8?B?ejVoWVV0NitJNnRCMGhHM081WU5TU2NiUGtQa2pJdjZoTkhGOGhqL2FEZ1VZ?=
 =?utf-8?B?Wm1pMXZMcm9BQ1VQNjlLQzRrQ0d3VXlPL3EyOXVFTDFWRmVWUVBuOEdMTEFN?=
 =?utf-8?B?RmtqTDUyb3dXRFFxR2svUVdudTExUFNEREJmNGZYdWsybDdqU0haQVJ0d1Bm?=
 =?utf-8?B?OFduNTRMZURHbjErRlgyV2NqQWExMzlNaXpZbGJSUVRxcEloL2M2cCtNak5K?=
 =?utf-8?B?dG9IYUVTNzdHT1EyKzVQbnJwRlVjRW1iNlZrdDBpbGFiaVUrNzZyRlJobXpJ?=
 =?utf-8?B?N1ZBa2wyWDFYc2NadWVKUTFWdWNSeGg5a25kaFZ4WVdaL2dwMk4weVdkT3Rj?=
 =?utf-8?B?bEJGa1ZDQ2NIT0JuSU9sM25SUFFYenFmMFdueTZQWVZEc0FsaHFzOXd1U2M1?=
 =?utf-8?B?aS8rS0VkRmIxc0VGZ1FISkoyKzVLa2habUszVXV2cUhOTmhxWlppV013ZGlj?=
 =?utf-8?B?VmlxKzcrZ3lWQnJhQW1YeXljZ21lVk5NTDJJMU5qR05CRlZsdFZxOWU0UEFu?=
 =?utf-8?B?OXE5K1kzYUMwb0lpenoyeGhXMFdaVkVSUnZocTFrbDRmN0tINURmMGYyY05u?=
 =?utf-8?B?YjFTbFZnU0hmMWxZd1I3eUtCeUNQNExDbzBvS2FMdEpKSmdxRmtCdzhCK0hM?=
 =?utf-8?B?U0YwUW5lQWVTSWdrQ0xqZVpocmVyeEd6amtRNndHRlFaYWtmTjBuYWhhTUtB?=
 =?utf-8?B?VWxKMTI0M1NGRGVmNXJUL0g4Y3RQYXc0UG9xWjBvUlZkOFFyaUp5WHNzUDJZ?=
 =?utf-8?B?RmtGZzNONzI1NDJLUGFxYldYWmh4S3lGUFYvQmliRzExRFhWVFZuckNXbVlk?=
 =?utf-8?B?bWRkMkR3Rnh2N0RuSVRWeTdBempXSXk1YnMrNlN3RjRsSTdNT3Y1bExnd0xG?=
 =?utf-8?B?YjFUS2pQWjJ1TzdCYTlva0pmV1pJUldXVXBzYmhLUlZFK3Y5ZktCTzdwUGRH?=
 =?utf-8?B?Um9kaEdJUzRxbVliRVJVQWs2Q3RnZlB1VWNFb2tqdCsweFY3UTQvNWJSWGRt?=
 =?utf-8?B?cXZxd210UUQ4bFBKK0NkRDJwb0c2UTR3dTNvV0V5V1doWGZTdXJaaTNSZkZD?=
 =?utf-8?B?OEh0WFZtNnYwS2h4NE84M2JqSzRCRjhzK2V1TUNibUYvZHBSTVppUXEzTk5q?=
 =?utf-8?B?L0dvV1UrTExEUHZPcWdVNUprSkpXaStpekNiQlFLVlU0RjY1ZDNpL2x1UkVN?=
 =?utf-8?B?RGdyRERzcVU0SHl4V2Z5MFBQYkdOQlIwdHI5d2hFSExENUhiWFZkcWpvTElr?=
 =?utf-8?B?QUFQUXVZMTZjNHBvTGRHMmgyYU5odE5TeDBxZ2dMRG9iVkVqM3FvenhkSTN3?=
 =?utf-8?B?ODJGc083eDQ1Tlg1WUM0ZURzd1hmdkI5bkZsUmlXbUtuVFU4eUtOUWgvWk96?=
 =?utf-8?B?N1VQSExjVlgzWUE2UzhBSlgzOVVZZDAvbXo0SGRZSHgrOUhSMDFxaDEzckFQ?=
 =?utf-8?B?dkNKaDltdS9QdWgwMVdqS3ZsREJ4S3RHQkdGbnJvM3FrQWw0b0Z5TWpqS1gx?=
 =?utf-8?B?dVBRQmZPRTgyWXM3MnM5a3FTTldjZmRBM3FCL3c4L2NiaEszTnR6MUJZMDJI?=
 =?utf-8?B?ejZTbnVLd3BzQnJQa3AxSVpBajQ2REhLMXYrWlFPN2k5MlhEL0ZXdXlHQkhU?=
 =?utf-8?B?TEYvN3VGaGhXcFFKSzRDelBoR3hBM2h4WmF5b3ZCL3JvUnhXOGFPc3lZTkRn?=
 =?utf-8?B?a2Q3STR3NjBxZkJsRWRweUVGU1FGVkpwK3B2NW9td1dMUEV0Ry9PU1pheFlM?=
 =?utf-8?B?VitWeU1pRHJDanJGWklTYWJHWS9qbDRQQ3ZKOG5mTDlLMVJTMTNSZjJ6eWVM?=
 =?utf-8?B?Y24wVnRXcnZCeklKYkgyRDRQSFpjWkE0MTQ5MThVQWxXMWM2R1FCZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52c102da-b1f9-41f7-9f2a-08de74b6b3f5
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 21:41:58.7146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ohflYVburAEWJ8vtIbRhW3AUArS4WlvL558YqPwPHfoxGst8jt1DP2DFejtLvzPuiruGEnqg6C2csSwYx3EQUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7346
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_134203_983062_4803667B 
X-CRM114-Status: GOOD (  10.55  )
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

Propagate the return value of of_dma_controller_register() in probe()
instead of ignoring it.

Fixes: a580b8c5429a6 ("dmaengine: mxs-dma: add dma support for i.MX23/28")
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/mxs-dma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/mxs-dma.c b/drivers/dma/mxs-dma.c
index cfb9962417ef68e976ae03c3c6f3054dc89bd1e6..53f572b6b6fc62c6cb2496f0da281887f8fc3280 100644
--- a/drivers/dma/mxs-dma.c
+++ b/drivers/dma/mxs-dma.c
@@ -824,6 +824,7 @@ static int mxs_dma_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(mxs_dma->dma_device.dev,
 			"failed to register controller\n");
+		return ret;
 	}
 
 	dev_info(mxs_dma->dma_device.dev, "initialized\n");

-- 
2.43.0


