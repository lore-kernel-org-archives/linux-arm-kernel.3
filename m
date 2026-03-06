Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E61BEF01812
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 08:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ynAS0eWEy3UKmc6VFbP2xJivzKk3iDrWzs5NNMed9wU=; b=QRdxfHvN922b3fGy5kLbcFguKv
	t95kARpV9swfc6a1TmremqCoDgLlYxp9++ecNVT5ezOgNgqIzKOAOD+vFA7KWrTZp3oG9FcZ5SboV
	b9UXKqJ0mZDWxq7tbXegafh5/OW/ElVWaMLY4+ORIsowg5S+ytWGj2/52KYW7UXHzrsAujuaIRGSr
	XuR8KP4kcvqTyxYIIJI5KeVjoAftJW7Wt33xfKARrYcdr1eVvc8PiQ41xFFnA0LwbvflsU5GuaZrQ
	R9MlalAsuw6TwxS+oM+/Uh43U9ZBw0k61+HxLSyer+tLok6uwT2mwvv+TRZdBg5RIW0h1u0HLHZgT
	HCfZqFsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQtm-00000003HsT-2AIc;
	Fri, 06 Mar 2026 08:51:06 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQtk-00000003Hqd-083x;
	Fri, 06 Mar 2026 08:51:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gQrMCwGwfgg/daFMTwxBTNvrsH+qL7Rfu2qJotiTUj1X/YTtNdvyviAK9q56fjeah4df7IzVrGBTMS0j7i3yFsKpUbGxKw3gMK31pOm9Bkq9K9Gn00ix1fsyJjNYw0iguXUn6m6/yMRySNUUkjCpUpSNLnTXTDfIIHU9/ZnTOYhrkQL290dtXUOzskblbTYhe9Xk76icuSSQ8FgavzajLhVn4ppJ4fpiL/NEr5GrfmV4xQ6w9rTyu8E71Hnx7xOO9AfMYAkMMM5yRNJvrsi7/iljfSK0FsRVDN6x0ROuolLNM2wg7MWPn8YVV9I7VWEsA6zYDzPXDFzgUe0rorA18w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ynAS0eWEy3UKmc6VFbP2xJivzKk3iDrWzs5NNMed9wU=;
 b=MWmxUeTgxJTxVOKMlyeOovbjj82O01RoBrjIiRuCE89FdzFfd82SZTaFOg20YzCCza0GglmbABkNdJz0Qe/kBfwLPsqY39va1SDQFqirl9VHm4O0OYndJAahZCpuhp2+SL3BIc/cRLFm4PG9x8wzMaLWeQmJEVYQPj0eEuWA6e+QCbLGibSz9LIYaByo+unloFTZ54VzgP4xPpcvoJlLgPThdCqNBchr3nWs3Yu3mcx1Xh8/IP5QakdC5JgQtebhOtQrBpz/mgZNPkaof4mb9nikLEm9sT3VoBjIqbQgvk4URonqGoX3RtsvgWjmRwgYutUOLSVRCfmb77eBlXntsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ynAS0eWEy3UKmc6VFbP2xJivzKk3iDrWzs5NNMed9wU=;
 b=mvHet6hk/YQwiS+kj4WpnnuTgzgl7RMlSLSHF77g3HJVIvjDGyrsfznFdzuze5Y4d29K44ZiopbrwuhNQHVXaSk8wvv5WdAvdztCPYIGKYApqBEKPHa2COW71PyLxEPe8ISriSGhhRc8Q0sQw6nDdaIy/smcw4WrcMJ/tzldFfCdPP/dirPwXCwFNgvlb4UNl5PUqigTON07wSXZIt2oqV80XXAPesNKmfJVYTuy1JcqTJT2KJ44opleZYNzcaNThPGjIWxDZnjRkZ5AI6YhEfBcwSIE43FC9VHMV2JYzNydASPjf9SaOfNTQqf8QkXo+RVw+WCC/r2aJovDpIKheg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::16)
 by DB9PR04MB8122.eurprd04.prod.outlook.com (2603:10a6:10:25d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Fri, 6 Mar
 2026 08:50:59 +0000
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f]) by AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f%3]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 08:50:59 +0000
From: Zhipeng Wang <zhipeng.wang_1@nxp.com>
To: daniel.lezcano@linaro.org,
	tglx@kernel.org
Cc: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chun-hung.wu@mediatek.com,
	walter.chang@mediatek.com,
	jstultz@google.com,
	amergnat@baylibre.com,
	aisheng.dong@nxp.com,
	jindong.yue@nxp.com,
	xuegang.liu@nxp.com
Subject: [PATCH v5 2/4] clocksource/drivers/timer-of: Remove __init markings
Date: Fri,  6 Mar 2026 17:50:19 +0900
Message-Id: <20260306085021.1231032-3-zhipeng.wang_1@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260306085021.1231032-1-zhipeng.wang_1@nxp.com>
References: <20260306085021.1231032-1-zhipeng.wang_1@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0002.apcprd06.prod.outlook.com
 (2603:1096:4:186::10) To AS8PR04MB8420.eurprd04.prod.outlook.com
 (2603:10a6:20b:3fd::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8420:EE_|DB9PR04MB8122:EE_
X-MS-Office365-Filtering-Correlation-Id: 02a36f44-85a7-4fbb-b567-08de7b5d7d48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|376014|52116014|366016|7416014|38350700014;
X-Microsoft-Antispam-Message-Info: tjAGtNcn/WT9V45qJcFAIXK2w/Csg1rTESkCJeGyeJeL6SAxXOPbRuFUoWlEJOxr763qzzQzRyT5rh/6GUHw1jLqmmX2HhK0w6zbfdooZsEoN82s+7L67zOGKnsnyfIZJlpRaTbUKGpNWVE/i/PWxkaJhpOHCIPy6uMRN0R8DCN2JdWv1we2IfEpbxtpKmTYBTLqGkER9UGz9yBIxBVNxEkBMV5uX+Bg9QpS7qdWk5wfOFA4+C03XOAcJsqKFAJOY2rqEaPZWWI7yUlx2RC92JX8CYIkNoOCaiUVazcCpiPfzNe6VbelAZ0HeFQU3TTeGdPe29ZFc3b18lLy+55enYJruo95UakVYfz6QJDd4pp9tylyUUZs+y7eRrvtAWGuaX8zHzC3z0wGlRBVnNYuPWoqfZrP1lWbpaiXLTziL/4ZhPN6zwayK+W6b8aG2KrCF7DeRSLMYrpvjDhpALUzL64tOXq9/8mn8h6SEmKehlwD2CEunVGROV9nn+1qk50pS/nOvzvzs2QD33F+Ei+d1ZwMVi5uCAUDCE/XJ3vQIrjiAGEkaAqvr27LpZTR+u+gXar/Ep3B/wB+P+ZwUzQClS+9PdUU+Q4W+YyjqdO4mcQXB4MKHZPFk4NOqzbF4MkcgpZn1eJnniEQXDbXGIwPn4x4ftmZi7sM7B/pkWZJa8+Z42ROn4XcB3KikiU4n0hn8TMU372QrY8r6KFSilHEi5YnUL08WoWw1jZRjH/AEewM3/ov7a50A7lC2JS6o/IhDPxV+ffPahLZyWIXOb/w/ZZiWCi67IVi/buoFYO1zig=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8420.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(52116014)(366016)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dTrBQo9bBCwd09Yns8KDHzYtxZuRfmgiA+6HwnQLI0Gc3SAk2HdNP94v4rAi?=
 =?us-ascii?Q?Ooh10S+Z/wULEAiDroek9qgcweTywQTdSLSMryCyOKmw/4Vv+e3Vdea7JIAD?=
 =?us-ascii?Q?tYduBIbaVF6e+Cmthtl5qcwoX3xgGEPui1TSsM/lQSywfaNYkjEugiv/B7rA?=
 =?us-ascii?Q?dY6RRjvAlDyeHKVwoT23VSuB7MU4UbnHkHUO3128au7lIiK1/ord/I64tOxX?=
 =?us-ascii?Q?Ib7LsdGRro9yOFE2hlZgwCiYdxj87p1yWx1yXdcHIDjWQOX5CHLZetzNOeC3?=
 =?us-ascii?Q?c4g19I+oxYhKoIju17NgFHIew5vjSRe42ik106GRaiM9ND8b1045VhqkqqLc?=
 =?us-ascii?Q?WdaXhXjL8Sg1rdBNDB70x4Kwl8vgLP4D4HqktDEVwORqrhy/ykxjNg+m43eu?=
 =?us-ascii?Q?gbv/Qd4Vxt7UI0b5zujJrB8vgjbmvOtn/vMUOoX5AUcxE03sJivzEarNu16w?=
 =?us-ascii?Q?en7IZa/FCKwL0O1IiTL+0uBagjGxxqbjEjrLeS74BDKZ1ippXwniCE8x3vfC?=
 =?us-ascii?Q?KV3rDN9nIDX0eMXMiEOjwbSY2LlcOoBHGuQL7TevjIo8s6NQ97VK6bUX1ib9?=
 =?us-ascii?Q?U26aOBv0xkZ8ghjB7dHv9qRCKHRCIUmrK56uDynARW1rp2aJE13eBTUIxPco?=
 =?us-ascii?Q?XAp00vQTdGv3HVXk+HC/KYJrvCIEqL/5ya+BaQHZO0bty6ryeEw/5QnIIL0F?=
 =?us-ascii?Q?ThnsTl64WX8+fYepHflqeHPepaAdU4m3QYzvdgVgOmFnvaa0YHPg1PX1rJjK?=
 =?us-ascii?Q?rNDtGTfqaQ2oEgXgXA84KJoiIvBaL2N2maP6ZVWkWouEGw3YIvJnXgU8juXl?=
 =?us-ascii?Q?Z/Q17IZA7ty5E8aSi256GtwJwF1+QwNLLfH6/z3BVls5SDJMD77Da2JMzsNm?=
 =?us-ascii?Q?X5fCyATdsCLhJzR42AOqc/Bg+BOUXRAULovg2lOPJn9vaqDGMUgf55mX9z5Y?=
 =?us-ascii?Q?w/2P0fxIf+dqbPbaUBWPA0yatoTZEbXawKmEccytOMBm+uHf0VZJVPbIRE15?=
 =?us-ascii?Q?jhkCO8emKFBGdurQDR7KaHQZWsrsL/OP6C/5+zuJ+FJZJ14oUAhMqH3/IfLP?=
 =?us-ascii?Q?6b9KaY+2S9lKF+WTYWpYvX1Q+AZpChOi3MJSlNigj28V+DOwCkJ89X7gdID2?=
 =?us-ascii?Q?JvHkWFRmaVPE8phWa9Y0fsyrqseBvZeVxhPNdtitIECb0/lvxKuEyRfz1nW8?=
 =?us-ascii?Q?8OZIfypSfuc/ceyzVxAk0DFXD6vRPGF/Ql0hzaRwHnsmOpZ3OEVY6TwPlsk9?=
 =?us-ascii?Q?b60B8KlkOBlZiDtw5ceou//uGV7xFJv8QKYrOIWGPWugByUDeQv01NEGsn6F?=
 =?us-ascii?Q?EHHmSh6WiziP6a+rOipjUzty+jdQdNa1sfIly3JdXl1jxtXmO1G7ul73wBBl?=
 =?us-ascii?Q?TTPLxQJN+b4HMedbT2pKfS22km/bs+391Gnbi6bUEQmCvFhbwQNrHi2XiYY9?=
 =?us-ascii?Q?P/WwZgq4JeEINA5WxWQDRrak+I6yQhAB9x9/5INvtxl+bVrqa1sq9Mh31anH?=
 =?us-ascii?Q?+4bjbH9BV9CnWu6CUiQ/TBuAg1c26QBfJiqX9Zo6dlDBYOnzXGn8Ge+TbU5o?=
 =?us-ascii?Q?86DdZPiqHTJqO3KMxopZn4huVzdaNPZty4yrasEKTN6aJz0R87xWMmBXe4b8?=
 =?us-ascii?Q?qvLDzpKQtBslkcH1XiI4BgFHwns99LC4+jNgCBVRbuOoT3oZmew8NSIaXO0y?=
 =?us-ascii?Q?RsYBbvjGoymAdbjZtEVfNlnvra+fv9XyB6fNzLJYYC9Gqq0r8B7SSdgfS7NE?=
 =?us-ascii?Q?TQZIejJzpw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02a36f44-85a7-4fbb-b567-08de7b5d7d48
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8420.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 08:50:59.8989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qbcF+8Fm1qzKt8xpwUHbTPCkr4UnIgpQLnQk3IWuhXlmnJp429MvRCpTBhAmvTIIrey7MeNW68/A/EXhkAc1Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_005104_068585_EA8181B4 
X-CRM114-Status: GOOD (  12.32  )
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

From: Chun-Hung Wu <chun-hung.wu@mediatek.com>

Remove __init markings to allow timer drivers
can be compiled as modules.

Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
Signed-off-by: Walter Chang <walter.chang@mediatek.com>
Acked-by: John Stultz <jstultz@google.com>
Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
---
 drivers/clocksource/timer-of.c | 23 ++++++++++++-----------
 drivers/clocksource/timer-of.h |  6 +++---
 2 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/clocksource/timer-of.c b/drivers/clocksource/timer-of.c
index 420202bf76e4..b7c186dc83da 100644
--- a/drivers/clocksource/timer-of.c
+++ b/drivers/clocksource/timer-of.c
@@ -19,7 +19,7 @@
  *
  * Free the irq resource
  */
-static __init void timer_of_irq_exit(struct of_timer_irq *of_irq)
+static void timer_of_irq_exit(struct of_timer_irq *of_irq)
 {
 	struct timer_of *to = container_of(of_irq, struct timer_of, of_irq);
 
@@ -41,8 +41,8 @@ static __init void timer_of_irq_exit(struct of_timer_irq *of_irq)
  *
  * Returns 0 on success, < 0 otherwise
  */
-static __init int timer_of_irq_init(struct device_node *np,
-				    struct of_timer_irq *of_irq)
+static int timer_of_irq_init(struct device_node *np,
+			     struct of_timer_irq *of_irq)
 {
 	int ret;
 	struct timer_of *to = container_of(of_irq, struct timer_of, of_irq);
@@ -82,7 +82,7 @@ static __init int timer_of_irq_init(struct device_node *np,
  *
  * Disables and releases the refcount on the clk
  */
-static __init void timer_of_clk_exit(struct of_timer_clk *of_clk)
+static void timer_of_clk_exit(struct of_timer_clk *of_clk)
 {
 	of_clk->rate = 0;
 	clk_disable_unprepare(of_clk->clk);
@@ -98,8 +98,8 @@ static __init void timer_of_clk_exit(struct of_timer_clk *of_clk)
  *
  * Returns 0 on success, < 0 otherwise
  */
-static __init int timer_of_clk_init(struct device_node *np,
-				    struct of_timer_clk *of_clk)
+static int timer_of_clk_init(struct device_node *np,
+			     struct of_timer_clk *of_clk)
 {
 	int ret;
 
@@ -137,13 +137,13 @@ static __init int timer_of_clk_init(struct device_node *np,
 	goto out;
 }
 
-static __init void timer_of_base_exit(struct of_timer_base *of_base)
+static void timer_of_base_exit(struct of_timer_base *of_base)
 {
 	iounmap(of_base->base);
 }
 
-static __init int timer_of_base_init(struct device_node *np,
-				     struct of_timer_base *of_base)
+static int timer_of_base_init(struct device_node *np,
+			      struct of_timer_base *of_base)
 {
 	of_base->base = of_base->name ?
 		of_io_request_and_map(np, of_base->index, of_base->name) :
@@ -156,7 +156,7 @@ static __init int timer_of_base_init(struct device_node *np,
 	return 0;
 }
 
-int __init timer_of_init(struct device_node *np, struct timer_of *to)
+int timer_of_init(struct device_node *np, struct timer_of *to)
 {
 	int ret = -EINVAL;
 	int flags = 0;
@@ -200,6 +200,7 @@ int __init timer_of_init(struct device_node *np, struct timer_of *to)
 		timer_of_base_exit(&to->of_base);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(timer_of_init);
 
 /**
  * timer_of_cleanup - release timer_of resources
@@ -208,7 +209,7 @@ int __init timer_of_init(struct device_node *np, struct timer_of *to)
  * Release the resources that has been used in timer_of_init().
  * This function should be called in init error cases
  */
-void __init timer_of_cleanup(struct timer_of *to)
+void timer_of_cleanup(struct timer_of *to)
 {
 	if (to->flags & TIMER_OF_IRQ)
 		timer_of_irq_exit(&to->of_irq);
diff --git a/drivers/clocksource/timer-of.h b/drivers/clocksource/timer-of.h
index 01a2c6b7db06..367d7023c623 100644
--- a/drivers/clocksource/timer-of.h
+++ b/drivers/clocksource/timer-of.h
@@ -65,9 +65,9 @@ static inline unsigned long timer_of_period(struct timer_of *to)
 	return to->of_clk.period;
 }
 
-extern int __init timer_of_init(struct device_node *np,
-				struct timer_of *to);
+extern int timer_of_init(struct device_node *np,
+			 struct timer_of *to);
 
-extern void __init timer_of_cleanup(struct timer_of *to);
+extern void timer_of_cleanup(struct timer_of *to);
 
 #endif
-- 
2.34.1


