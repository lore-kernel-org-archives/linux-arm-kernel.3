Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC85EB7EA1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 08:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fBlOfnmWBK4QHq82YF5U1aVXSuD5P0SQ9nMAVaPgVnE=; b=NCIRaeA4FCSc+HtZEy3Z0lPHMA
	WElcXoFVffyfTJbJ+QGS5QNpgA/PFrygMDTis7lwBuHZyhYUHxYxkhrY6tL6fu/UI74y9n/YhwB2d
	bcC0W6yDr5V9pnp16mls3Z+Bgx2v3QW09kGpUKJDw3fZdMQ60886iptRr57PcQLwxaQ3/iGZC8K4q
	A6mARyDpKylxgz3vsom9e4/u4EzcFQG6CLrwjG1IBYD8+oO+wr/o8BeHtzUW0kZ1LLUAMXhRtfXPc
	PFjH+ygSPjhGV7xmxBu0rUb4ZhAy0aZjWnWORa3fazeO+6Yy9gE/RWu/82QzwFP+Ezibhwu3s3gR1
	L0jKnG+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhMe-0000000Gis6-0CXd;
	Wed, 04 Mar 2026 08:13:52 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhMb-0000000GirK-3Ed1;
	Wed, 04 Mar 2026 08:13:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XD1U75YIQJERTgcKM8SDkrGOF1Kh/d6X+Xjhnc5A9Py8C2HiacPve9etsvHjzdd3YLosbSsHBaWia4wluKfDqIkzSO1bM4shYQKKKFLqULzvg0jt765NLPpXNa6cdSojSPYZLa9/UIS/p4Y94OXj4D+RNJaX8bZlI/PN92lY/b6tgHLgenQlqB3hdPTbO4Q9ntvsOHr90WQptaKYoubXN9xMDwcGD61YyjsTRDP4gfVyStRI/R7h+J6FVZYHePCdDOvrBKcqSvODal7v4uz0Kr5BC9UTSFGGw3fs7GBrPLefYgjfU7/KKc+dJ80ULinwMyBOF1w9sAyCerWlS5NLeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fBlOfnmWBK4QHq82YF5U1aVXSuD5P0SQ9nMAVaPgVnE=;
 b=H3MoTLOL/g7PfFun7ba722cS6eFXjHKOz+6ADbTxTcGGpoRL/WXSjJrjnMiCSpWzDncqZGYQZ/RO6OKCKZDITcHTaBDCnD/YFSWtTg47ZAnXbYWkxLdPOoNi6dJXCebLCDkltTioDebdlmIHMU9e3zal5mTiUxqlOCCUVRaJs2j4NGMeDgMh/lihc/Nr8DXHgY4qWboCIHu4RPP8wLMOsZgZWUR9aQAWDlVx1ms2BWKw4eI9lE0UW4qEHPAbJZthUryAfe2x9N4IvaOT5689FnugXw6Ltkj4/npxG5JCBbOL6DU4MR4AzivBcH1/ehfe0dtql4EmaFnGGsZ8gemikw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBlOfnmWBK4QHq82YF5U1aVXSuD5P0SQ9nMAVaPgVnE=;
 b=KrosxtzgM/rFe7G2RZOhFi5dK72/boKJuZOe9Db3v1m8gGtgiugQoC4PBXc953Fmgv5uDNlKovh/sYNt1TiV+kcl6wdgHb7nat6B9uUVMEQWSTNjkcB4XZSzJszYo9VTcy/9vgCmHCaCp1bXkopybuoypMkc4etuU/xRtrm/qWNqK8ms86ClHvlT9lvVYrKk+TfObXLg6l42WZ+Agdx8oB44gAYt9YK9Yqf9M0kBsKmeNj/eJMkbFLxM6tfZaa8j+8xkxrFZAk/GjMYqzCiDCsHmj5R4Q0Qu3ZGZ5lGdNq90VW+8j7nyYDOf4YMyBKmfWflWe84R2yZA9079ZKjpHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::16)
 by DB8PR04MB6796.eurprd04.prod.outlook.com (2603:10a6:10:11e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 08:13:43 +0000
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f]) by AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f%3]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 08:13:43 +0000
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
Subject: [PATCH v4 3/4] clocksource/drivers/timer-mediatek: Convert timer-mediatek to a loadable module
Date: Wed,  4 Mar 2026 17:12:06 +0900
Message-Id: <20260304081207.4030882-4-zhipeng.wang_1@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260304081207.4030882-1-zhipeng.wang_1@nxp.com>
References: <20260304081207.4030882-1-zhipeng.wang_1@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0117.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::21) To AS8PR04MB8420.eurprd04.prod.outlook.com
 (2603:10a6:20b:3fd::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8420:EE_|DB8PR04MB6796:EE_
X-MS-Office365-Filtering-Correlation-Id: ceaade6d-d905-41b2-e51b-08de79c5f36f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: W0vs+XXpOh+yETKcX/TvJMspGhc1V2wvt+RFxZg2kyw0cluIeSCIWQUaAlBZ0tm1RDeSoMWmesHNpy47DWcyqkcrheQfvsrKR3vCvFPpGVGAZjwpSS5/JK5VOeBMwiu1gLd8peh/BXzS1eDOM9K45dbQWwjFvkCC+OG4T9IbRClsQT+iHovhTpiek7ixEmkiagr3wFBtyezZJtkJ1rj2sPak4GuLVdw9fjRRB+dcwHL5OY238GRdcH17ma1dcLc+ihkKoly9HBvRljC9h7+nH53yyy1U0vdmWwXyGcx+AOeWVAZGeY7WhlQolyPRJZRQCDe3I9TSWe69ZRMkSypLfUlQOC6vQIsVJ0DecGrM+65+XrMQ/HBH1Tzsx46WzG9ky3OJQkYQzKvNNbaQW8TRtURDBTX4ZTvzzoqWI7PY+Re81cxAHChmuQ6WhBXAI5lNv1dVjcnXU/L/SqP1wYthH8FYAQefBrkQwBv1Z7yfxOEZHJxlJK2nEPHhCS5fl8tuhbFFviuQhDJxf7oY0spBphSjYh3xQPKt4wbJyFBM0bpWj2E1hl3hMRt/sQXv6SbJuZWlkixnu1xIWtOAjcGwarabSt38UDIbQnA20J9924Jnfs7Xb1knxzjb+T+jqGEvyberwX+bCkhulq43wd2QQj/mc1YuFDdhVkhlucIMPm3Al+XLQGtiu75PLK7iPCFk6Wp7JFha0ehaDWFKMGAsxUsgi/Qh3Zw0Uz64tVK3Y+/e/QnDFQ7GnTv2qDbPnLRxNzOPyZpRh/QeBtRJWuZYE2untnzcAmSNd72+0Mi0Ia8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8420.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5KolrpnAalabeqswGQkWUn4Nl/88Tg9ff/A3hvrCIfHmf3WBy7kaw8+DtXs8?=
 =?us-ascii?Q?FcXq4tHTLOxtJsylnsVVeTZ9/5rXzkZkqQGroLt5ZL4/Vo8Ow3a7m4uj3+Bw?=
 =?us-ascii?Q?QTT+y8oqWeuKjqGWYR2Wq5a7gQer9aXEXYJ3EyAFmKIP42iMcfmsmcTMJcu1?=
 =?us-ascii?Q?wXxoBUEVZl9H0viMSUZ0NOieP7Q14kbZpf9KsnJkif2O3WLXEROHtpmhKku2?=
 =?us-ascii?Q?x8CLawD/SwsOOLOzQGuhLnX1NOiuX8SB1909J6GguG+BRhc/UBtHGp1by/dd?=
 =?us-ascii?Q?2QOf0nldvbU9gca0y7OSEZ60Q0h7Jmm9FSq+euaJOjBJZIOqrP6YaZ3l0zCG?=
 =?us-ascii?Q?+Jv6yjehQY6REe4nQh4Pxszq+0/fDvlvQ3GlTZx381DhKAgjjvr/2qVAsyff?=
 =?us-ascii?Q?DZUplTtjkuQPtq6W+yIHAAmxCq93mk6z9Gopk5wWZUzg/56eExF5M3uWHI4c?=
 =?us-ascii?Q?bvOwBhesCQ3WJ3NeGvbM7Qqafy7s8qp6u0IdxTMOMg2bmX1qJBVsdbLA46as?=
 =?us-ascii?Q?jjVO8RSqcsTPbURrA+5iAPjwkjUZpANr2p/QWCFp8Y6Q34Iy9SEeL3OjZ+UC?=
 =?us-ascii?Q?GQvQzxnsIzR5M4qnOjQ1KF6BlhSlxszlV2MGjsVxNPRfOtv/2c7eeAj7M5S9?=
 =?us-ascii?Q?G+LQ3Bob+ap5uXGIwVO6ZIgiwwf5kurOKy6nAQUPw+D3Z16/Q9rSot0PVjhG?=
 =?us-ascii?Q?Y+2nTNehGy1vzGylnRzBvjnZE4YvWCmKWOAnygcXp0fmTArHK/img+jhDEwQ?=
 =?us-ascii?Q?cSXjSdiRIrYE+KIUaEa9Wzx7B8zinxbyl75ydoiRRNIr13DNb5ocpq9TO5f9?=
 =?us-ascii?Q?VxJC7t6quUoST+ZxeCNdlDQmFrRFDMoPsA3g0pVDW5a8w/fN4DMWZzhPuoqr?=
 =?us-ascii?Q?ovTwKmt28DD4Xx3IzE9cxSYh3GAf5or+ysRgA9QICa8FXtCzHUm/ysiinlA9?=
 =?us-ascii?Q?vhA5lSJGESampf8aMM3fYelnHiqm2f/8kFnsG6WSHEU6Bqz+b9nyCIR2CC7W?=
 =?us-ascii?Q?Nz8D5NJq5halsI+6y3puf/wVqxaGmNknlfzNFL/YZ43oeyTNrhYBKftmLzOY?=
 =?us-ascii?Q?8Iyxbz18uCA+5jelEN03CWsoqm4Vo9yKMOwgYnnFT82fdT01MuQNz4NFYZHy?=
 =?us-ascii?Q?fFCgq3Fha4chYU6b9H9WV3+KrEwudYgp8evwcvMngC7HtcT4XUBf0/yelKV+?=
 =?us-ascii?Q?BB6b05HGeKJiBsQOS4xt34fOtNA5r4a36+4P4sErEtRoyv1tQmfGkMtd8Zkh?=
 =?us-ascii?Q?papXesfB+6F9k2sM+dznpqTGccCHp646QH2TECNtXQkueqox2XMXuBISXkTm?=
 =?us-ascii?Q?R2sEWvdPzDMFzMOjH0KEgSR42F+VpBG/YtAMFPjKxwuhW14GLPCbmnthvs8Z?=
 =?us-ascii?Q?1chCBxYD72DsmYfYGqpr7JSDejvkBopFPp/mGbCAjGC1R7nWErudqYkel/WJ?=
 =?us-ascii?Q?yCcPNTJ5TbsisYdydXHmfhwizn5H1wHkHsacb7RrWS5aYuVI1VSDAvsA60Xy?=
 =?us-ascii?Q?rjf/XScMzXn/2pk2TaF1zIsCWFQXtqpeJEXH+46Vpil7DKq7t1EjT6/ebqc1?=
 =?us-ascii?Q?+o6WbkzOYrz+pnkFs2cETO5JoLg6+m1Oq4NsNvQ63T6t0Kyq6lVvstcLc18i?=
 =?us-ascii?Q?PGzU8en4TlOMLj6FQTapEHBt9viQUbNC+mqZyVYl9UuBKaaHZf3tCTYHESCU?=
 =?us-ascii?Q?Or2ZqiHwuraFwW6VOiVRAFrsszLUr7VlRhdG/ADTrxQY9skGCO06u74zWZK7?=
 =?us-ascii?Q?atCvxnn9Pg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ceaade6d-d905-41b2-e51b-08de79c5f36f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8420.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 08:13:43.4905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HZJwzA9Dfc/kOzHQ4u7Ud7HwWKeI5+14IbHnUdeEF6WfglTB06/83oUsTDY+WlYHkTSqUEyxdDWp380mjX7l6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6796
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_001349_813615_1DECE3AA 
X-CRM114-Status: GOOD (  17.74  )
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

Convert the timer-mediatek driver into a loadable module so that it
can register an always-on timer as the tick_broadcast_device on
MediaTek SoCs. This helps support GKI(Generic Kernel Image) modular
configurations.

Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
Signed-off-by: Walter Chang <walter.chang@mediatek.com>
Tested-by: Walter Chang <walter.chang@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
---
 drivers/clocksource/Kconfig          |  2 +-
 drivers/clocksource/timer-mediatek.c | 33 ++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index fd9112706545..2112efb85029 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -488,7 +488,7 @@ config SYS_SUPPORTS_SH_CMT
 	bool
 
 config MTK_TIMER
-	bool "Mediatek timer driver" if COMPILE_TEST
+	tristate "MediaTek timer driver"
 	depends on HAS_IOMEM
 	select TIMER_OF
 	select CLKSRC_MMIO
diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
index 7bcb4a3f26fb..4ad4bac6f34b 100644
--- a/drivers/clocksource/timer-mediatek.c
+++ b/drivers/clocksource/timer-mediatek.c
@@ -13,6 +13,9 @@
 #include <linux/clocksource.h>
 #include <linux/interrupt.h>
 #include <linux/irqreturn.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
 #include <linux/sched_clock.h>
 #include <linux/slab.h>
 #include "timer-of.h"
@@ -337,5 +340,35 @@ static int __init mtk_gpt_init(struct device_node *node)
 
 	return 0;
 }
+
+#ifndef MODULE
 TIMER_OF_DECLARE(mtk_mt6577, "mediatek,mt6577-timer", mtk_gpt_init);
 TIMER_OF_DECLARE(mtk_mt6765, "mediatek,mt6765-timer", mtk_syst_init);
+#else
+static int mtk_timer_probe(struct platform_device *pdev)
+{
+	int (*timer_init)(struct device_node *node);
+	struct device_node *np = pdev->dev.of_node;
+
+	timer_init = of_device_get_match_data(&pdev->dev);
+	return timer_init(np);
+}
+
+static const struct of_device_id mtk_timer_match_table[] = {
+	{ .compatible = "mediatek,mt6577-timer", .data = mtk_gpt_init },
+	{ .compatible = "mediatek,mt6765-timer", .data = mtk_syst_init },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver mtk_timer_driver = {
+	.probe = mtk_timer_probe,
+	.driver = {
+		.name = "mediatek-timer",
+		.of_match_table = mtk_timer_match_table,
+	},
+};
+module_platform_driver(mtk_timer_driver);
+
+MODULE_DESCRIPTION("MediaTek Timer driver");
+MODULE_LICENSE("GPL");
+#endif
-- 
2.34.1


