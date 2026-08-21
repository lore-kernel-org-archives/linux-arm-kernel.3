Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F4FC5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 10:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8IR63uYHoQnWziWT9UlOpZ/D5RKxGF+KWJ07GGqpmO8=; b=AKlJLnaVtHg3a+wAbi18J1FYsH
	o+F9L6NQlOOvyLUYORIBReGtL4p5rWkfmQNPf2GtXzCT8wt/HWbn3HmFAbWApoMZmAKGGHjFEQjJc
	ojtEvOuWZsfQCfMKg1/BenJwwfHUFOVG1mbv1lpxU0D4TOfFiS3vGJUnOTidfcFGnoeZWSaKUeSkg
	tjKoCouVq0g0kuKflQ1WWQV6PJ4rMDNqb9kOV+mixmHx5VZFUiFpEDqnkbMm9UHrcLZmdqQfzZLd8
	fr5ML9GdYj4zvMgn8GKTwEiqHHxB54LJRkpjKIKKYQ1IlXNu7vgBhoNpV0kBtarpVI8N8Qsu8FYf0
	zSqEPtsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxMDK-0000000D2qS-1dyA;
	Fri, 21 Aug 2026 10:11:06 +0000
Received: from mail-francecentralazon11013021.outbound.protection.outlook.com ([40.107.162.21] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxMDI-0000000D2q6-0Uw4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 10:11:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OuZCMW64WZuVnwwEy964UKSvlvs+yEb+rKLyzQ2tmZY9qUiKBq5BPbGUVaRjldPJ59SOqiS5P7/xRIUGtLv5rh3csfNCA4fMX/g0FP+xPuTtY7sTrLiIWXCGswVE8Vw4nIurd1j+ohKHBWcnKZVr0zhzB5ybgJJL2+aMe3REHD2Ssb7uO658kiwpGHAaz9QBkFe6fTXfdb9B1ofHbbfW89qMD4xNigvlp2SsVUrYYp54OXR0ryiTQFidsCKL2n89qih9OxnHyBcdjBV83VgBsW3RWFWDcg12kq28dJ2B4bEX4RGz67G5PkrzqfjDJTI7amVcyce1DjFC+sK3gcZL9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8IR63uYHoQnWziWT9UlOpZ/D5RKxGF+KWJ07GGqpmO8=;
 b=jSebZTLM5w+yoR7V9FxN/kKdvlqzhcf5++IgK3xnuQTmy9JvYIl7zDtJmIWqn5r+s+aORYLKXMyLDaSLGJ59PVltzwgbW3xKmBE5Ab8mTr+4FFvzaIOEceLEsrXGpGg+GfgpZ/FDl+bWhiUKNwyWuJFuSbov1bk8gbcitQbiL9Q+ixpgoNAZDTPoLl6LCqDmXRimNzm7b8ymQAyn9XSaJY+KTYjH2phux+D0F7bbFQ/OxsIXdXZNueXxU5Ko4JBqD/2Gdg3wEb5poESt8IzH5qpENzjTryjEuEwgaH/SGTuYr2EVzLR6depmCThDXe1SnldXweBQwmODnbiblCeVdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8IR63uYHoQnWziWT9UlOpZ/D5RKxGF+KWJ07GGqpmO8=;
 b=llhtG/q3BWeeCTHQEKYMfZyA3NOQ8FyabGB2sNVsoeHcf0GxG0ANA66jIkwKw0KZBURfEYEIWLx7MZfcR0hHc/GrYhCLAE/6uQ2Dig7jmqsXNMt50aJrrA3UI6MS2fKgS9TGk+491GBK5/qhSca8WkS4Wc2oI4MU0CyHLGgcSB5CZC7FSBDHOzzbyqgsk+xrN+AQOG4xUQ76u3d1Pxs38h6Mpvrd2RTrEN4MqrDILeVMsoveCAbUXr+l0Y4MzY+NA58b1tBodfwEqz9pOhl8IOGhoZnm0+lXpGhIGIgjLITHLh/gsDY4SZH2VY3aqdCEF7BPx5K8+qUv1PG6pDE1cA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com (2603:10a6:10:113::9)
 by AM8PR04MB7971.eurprd04.prod.outlook.com (2603:10a6:20b:234::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 10:10:59 +0000
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5]) by DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5%6]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 10:10:59 +0000
From: Zhipeng.wang_1@oss.nxp.com
To: Thomas Gleixner <tglx@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Radu Rendec <radu@rendec.net>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jindong Yue <jindong.yue@nxp.com>,
	xuegang.liu@nxp.com,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 0/9] irqchip/imx-irqsteer: Allow building as module
Date: Fri, 21 Aug 2026 19:10:30 +0900
Message-Id: <20260821101039.4037925-1-Zhipeng.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0009.apcprd06.prod.outlook.com
 (2603:1096:4:186::17) To DB8PR04MB6858.eurprd04.prod.outlook.com
 (2603:10a6:10:113::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6858:EE_|AM8PR04MB7971:EE_
X-MS-Office365-Filtering-Correlation-Id: ba2ea22c-e71d-4351-7f4a-08deff6c7f0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|19092799006|23010399003|18002099003|56012099006|3023799007|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: 4yxKCSPcdO+qb+GCTLwJhEYGAnohyUU7dW4xXK2l4Xeu0rO2aoZwlgI1aepg9Rukh5WiF2maNCSjIu7vLcifLRIjl2D19vYAm2VXgZ6daDllxHEEH6BZku0xOZ6opbImL358m7XBFib8HVZt0doT9N/FnSOk1Y/AG9nmg6Q5P3tN5ah6+pxZHWgEMwCsL7spwCSSyhP7Y4vI3vLYvyn74MiFjoTaGu6zh+D/w7Dk/0cg2QjHD1mFV4SUP4nnmBiMFX0i+V6u49dVBZAoSs6tNcdDtd2U3NG5CSpbJ5qlzlNLoX1HPRY85YKtI7B0jiA7RI4hhPXjh/DPUkzK+P/MAOtBZiq83jFjPeHuUxzGq8hwDSj3eN5oYW28wZqqhxCpEMVdoD53iopxQDtaJdb+SEu53X56rui8NPC2x7wv2QNeTb5tHU+PUUZj+fwA3DwdnFCIG8yjNOM8fditahiL5uQ+DZTMcWScxmY5KeHZyt7FsqTcjBYod9n1AoPQYv4rNkbWIIFWPE26bqoVGw4VwgNCVG3U6AG6RDo+vul4fBDAiNbOltHjjLhMNwDx9Xf3HiurXBeIkrMgG5phBYU5Mn9LDAIwPgLyeHhlL4MSfx9YBpUcnJ1qkNZGr6qAgYEYlHdW72b/Wvp43zP4XPBaKfVbH1grJ4m3rm3SuHenrf8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6858.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(19092799006)(23010399003)(18002099003)(56012099006)(3023799007)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WOk710/mKHa7+MVuiVqaxaGa6i08zSMJ2gkHYbjBU6do+WzRImZAxyxxH1mq?=
 =?us-ascii?Q?4qApQJaaIBSuMB9iN0cRTxoYF4PWGuAxvmPOEiwsOQVyoudG7jZb9dyhOE4M?=
 =?us-ascii?Q?X9w2L9sQx3JGOpnlUl3DUmnVcXJEKMLnKZEf+r6YT/DottB7LkSNfPWaGIp6?=
 =?us-ascii?Q?KUgEPs8VMqVar4gq10+gLgvnVjdJlw+ryCHrih90AVQ1SDDXE0RypzNAcfEa?=
 =?us-ascii?Q?b6wTWYlxCuiOO267xzfO71iDOppMOnBRa0qMDgR2iEc20OPNRymUgSFqrnLv?=
 =?us-ascii?Q?ceVbj33GPFaDqu962HxOVA82BMvjwTgjQkdCdzRlPio5t9ZtA9QkgFHEYGWV?=
 =?us-ascii?Q?UXUknbwesFaMThE9N1TMxDHbSGO3ENPmCBrkth6J5oZH70f/dX4XK0Asno+4?=
 =?us-ascii?Q?u90wvZgh/UiQUZbicBezrGTZnIkXfD61g2rd91U/O3QW1+JOe8tD95kBybaN?=
 =?us-ascii?Q?mQ/S9iI1UIrsEtkWRgtOrx3vKph1VmQ6oQp7PNO1S5IsYAXJs1NNglRi+RFb?=
 =?us-ascii?Q?v2T210PaGfUhzXugTf/uC6eSkS8b8BuJiNoC0lkolJvoRWq0cKitNjPXvqng?=
 =?us-ascii?Q?UEb5YfaGKLPw6wK1QgAkOCwIVJsn/shjgoBukwKbMx+KmPkxk0C1Qt34z5qL?=
 =?us-ascii?Q?jkT4Cy8wbxg8h2g7lQyZuk2H+i7mGlRadGzUTI6UpMB3Kj7F/4kZZbE/63C9?=
 =?us-ascii?Q?Usu5egIXWR9peIKQjk8qPn+9KCqj2VpG98sPEl3VKfBVhNWpdzxkpfoFfnZF?=
 =?us-ascii?Q?HDwzskaTDHdFTlIo22Fr+/gm9D+Y488Fr8w5cwo9N/jKn9IUVXzAlSIDGtw2?=
 =?us-ascii?Q?98GFCeO2eXJbURgfqBROa98Ji+I0FJBL4Uc77DCEvHyxMNAIHH9JJnw1G1uA?=
 =?us-ascii?Q?XKw2SrvEbkSDe6F6aGhNgFypU7IKXURGyznKNe8n+ZsvxEAuEdZUyp3w4l1x?=
 =?us-ascii?Q?H5DCNXMRjJ0DQVvA0kJgEW0QLlmCfvkYmAFtRf2PH9zxuB7B0emF50nQHmO1?=
 =?us-ascii?Q?XI07wsd77PuCSlSD+ZSfAD+xac+y9CXMgoPFjPRrmJLj+k+RQKcEYfgu3zdl?=
 =?us-ascii?Q?2OaW+h+Pvd0OfvGHG3KPoIUQ85rwAg/QkRSUtcIgeneNoY1h/Lcvnziwd25c?=
 =?us-ascii?Q?EwbAuA/PksNRQY/fNbMWjYplPp4OO6JJmZN8r+8qJ9sVXYP/KRozMWeePM+M?=
 =?us-ascii?Q?j7O5ZFc3n1+H0vGf7NAAn7ca1KFDZXQcBEkrDMffPLsMuvQP2AGl6SSjlisI?=
 =?us-ascii?Q?jpXQKJmclVPzYka8BFexny6h6U85hf77tQLFTN2hEoPDxopRtkr4MkuoRhTA?=
 =?us-ascii?Q?ZvdIRy2qqd9bn+Rtu6mM8MBFbxQvg7D/BHA23Wkq1nkRbJItIcoVATNfRJqm?=
 =?us-ascii?Q?a+UCAutavxLn5N5Gxa1kksTqCcruw8j0qKDJ2fwlnFSv7sjBp2SgpNpt46Yw?=
 =?us-ascii?Q?AlppdIlsrm9gSSltkLIu08f1FwOSHCJKxwfHseK+lpc8rbwhWsG2E9swraVK?=
 =?us-ascii?Q?oxDEeCC2px0lHDAMI+AYFNhFAEEFNwKW/JqI5uJDqOtvl1cX++LDfCtZEh9Y?=
 =?us-ascii?Q?uEg0EZ7tYHzDvk3VR7c+q1htfu2pYECCGcoITGxVCT+qKKRsq7MG5GT9Ky2y?=
 =?us-ascii?Q?0vCAk/d4ezaSA2YLXYd/GUnrGKhR5uhEa6omxuexf7ybraoDB9CUN3txpouy?=
 =?us-ascii?Q?jWvjtjKREAZNdT9ynFhYilQ4x451uISwkiCnZOwiQlrbeqya6gSpdEPKdd65?=
 =?us-ascii?Q?5KUfJsChM1pkUKXuvrVx3+hfq27aP8zYl2ipjXv2Px1E6SwW4Zes?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba2ea22c-e71d-4351-7f4a-08deff6c7f0f
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6858.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 10:10:58.9099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pn3VHILwuqngKDNDexpHTU7rKkafGQOT0Hgp/z9Puc2peSDSZKfoO52LWbJQpUZxh1DvH+M9QlQMu0gOTHKRLpRxrPho1oEcDxIQX6st0McTxDNGMMg0XzGoUGNhfdkM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7971
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_031104_153113_8E3BBA36 
X-CRM114-Status: GOOD (  17.20  )
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

From: Zhipeng Wang <zhipeng.wang_1@nxp.com>

Thomas, apologies for the scattered irqsteer patches over the past
weeks. As you asked, this version consolidates everything related to
fixing this into one coherent series: the three separate series/patches
(including Fabio's, which conflicted with mine) are now merged here, the
overlapping runtime-PM work is reconciled, and the patches are split by
concern. No more piecemeal postings.

This series makes the i.MX IRQSTEER driver buildable as a module, along
with the pre-existing bug fixes that become reachable once the driver
can be unbound and reloaded.

What was previously scattered across three series/patches is now one
series:

 - The three patches carrying Fixes: 28528fca4908 ("irqchip/imx-irqsteer:
   Add multi output interrupts support") are now collected here: the
   parent-IRQ-domain leak fix (devm-managed domain), Fabio's IRQ-count
   validation, and the standalone chained_irq_exit() fix that was
   previously sent on its own.
 - Fabio Estevam's IRQ-count validation patch is folded in with his
   authorship preserved; it supersedes the ordering that previously
   validated the count after the domain was created.
 - The clock/runtime-PM rework, the module enablement, and the irqdomain
   helper cleanup are split into separate patches per Thomas' request,
   rather than bundled into one change.

Patch overview:

 1. Call chained_irq_exit() on the handler error path - balances the
    chained IRQ enter/exit on the error path.
 2. Use devm to manage the IRQ domain - devm_irq_domain_instantiate()
    fixes the domain leak on the probe() sanity-check error path.
 3. Validate IRQ count before creating domain (Fabio) - validate before
    allocating so no domain is leaked and no dangling host_data is left.
 4. Dispose of parent IRQ mappings in remove() - only the parent output
    mappings need explicit disposal now that the domain is devres-owned.
 5. Mask all interrupts in probe() - avoid an interrupt storm on reload
    from stale CHANMASK state, without touching registers in remove()
    while runtime-suspended.
 6. Let devres own the clock and runtime PM - devm_clk_get_enabled() +
    devm_pm_runtime_set_active_enabled(). remove() calls
    pm_runtime_resume_and_get() so the devres clock teardown stays
    balanced when the device was runtime-suspended (Frank Li).
 7. Allow building as module - tristate Kconfig + module_platform_driver().
 8. genirq/irqdomain: Add devm_irq_domain_create_linear() - a reusable
    devres helper.
 9. Use devm_irq_domain_create_linear() - switch the driver to the new
    helper.

Changes in v5:
 - Consolidate the three previously-scattered series/patches into one
   series (Thomas Gleixner): the standalone chained_irq_exit() fix and
   Fabio's IRQ-count validation patch are now included here.
 - Fold in Fabio's IRQ-count validation patch with authorship preserved;
   validate the count before creating the domain.
 - remove() calls pm_runtime_resume_and_get() so the devres clock
   teardown does not underflow the clock enable count when the device is
   runtime-suspended (Frank Li).
 - Fabio's "Convert to devm_pm_runtime_enable()" patch
   (https://lore.kernel.org/lkml/20260817190621.335492-1-festevam@gmail.com/)
   is superseded by patch 6, which uses
   devm_pm_runtime_set_active_enabled() (as Frank suggested) and also
   lets devres own the clock; it is credited with Suggested-by.

Changes in v4:
 - New patch: add devm_irq_domain_create_linear() (Frank Li).
 - Use the new devm helper to manage the domain instead of hand-rolling
   an err_domain label; remove() drops irq_domain_remove() (Frank Li).
 - Dispose of the parent mappings only; the child mapping disposal loop
   is removed (Frank Li).
 - Mask interrupts in probe() only; the remove() masking, which could
   touch registers while runtime-suspended, is dropped (Frank Li).

Changes in v3:
 - Split the single v2 patch into separate patches.
 - Add the probe() error-path fix (Sashiko AI).
 - Add CHANMASK masking in probe() (Sashiko AI).
 - Let devres own the clock and runtime PM via devm_clk_get_enabled()
   and devm_pm_runtime_set_active_enabled() (Frank Li).

v4: https://lore.kernel.org/r/20260819090543.585131-1-Zhipeng.wang_1@oss.nxp.com
v3: https://lore.kernel.org/r/20260807072346.1222389-1-Zhipeng.wang_1@oss.nxp.com
v2: https://lore.kernel.org/r/20260728092219.525449-1-Zhipeng.wang_1@oss.nxp.com
v1: https://lore.kernel.org/r/20260724090136.3595894-1-Zhipeng.wang_1@oss.nxp.com
chained_irq_exit() standalone patch:
https://lore.kernel.org/all/20260807072626.1231517-1-Zhipeng.wang_1@oss.nxp.com/

Fabio Estevam (1):
  irqchip/imx-irqsteer: Validate IRQ count before creating domain

Jindong Yue (1):
  irqchip/imx-irqsteer: Allow building as module

Zhipeng Wang (7):
  irqchip/imx-irqsteer: Call chained_irq_exit() on the handler error
    path
  irqchip/imx-irqsteer: Use devm to manage the IRQ domain
  irqchip/imx-irqsteer: Dispose of parent IRQ mappings in remove()
  irqchip/imx-irqsteer: Mask all interrupts in probe()
  irqchip/imx-irqsteer: Let devres own the clock and runtime PM
  genirq/irqdomain: Add devm_irq_domain_create_linear()
  irqchip/imx-irqsteer: Use devm_irq_domain_create_linear()

 drivers/irqchip/Kconfig            |  2 +-
 drivers/irqchip/irq-imx-irqsteer.c | 70 +++++++++++++++++++-----------
 include/linux/irqdomain.h          | 30 +++++++++++++
 3 files changed, 76 insertions(+), 26 deletions(-)


base-commit: bd5f485f3f026225b86573e559af0b7254ef4184
-- 
2.34.1


