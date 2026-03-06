Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5649F01812
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 08:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fBlOfnmWBK4QHq82YF5U1aVXSuD5P0SQ9nMAVaPgVnE=; b=pfyKFB4WfUUVI3BWF0x2tpnXKa
	DsSJiqtl1WMD93f0qhigVHeW6ISwt+3CY8kDnMmkuOfncvPmb4BsyUsjsSE3q7vIthabOGvJEGuTK
	Kk+FN873CbBWVzUDmKTrGaEcaIBqLxZ7CWeAZM97yJO5mwto4zLD2MHz3Z1/dY48S/xcIcgPeFGLe
	fBLopZcYRDXxG6n3yeyFIeaYTQydSNxWwo+4FDPECq//q0nUUSzhYL/qrw5F9KYK67UhJMEQvVf+j
	pSt6jvJn7Ts9yj2iYzMGT84j3skrBHQU8VxAYmSK2rnDstQuv5idKVpy7UL112Rati4c8qkFDkQRX
	euBUDEjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQtv-00000003Hx7-0ZcL;
	Fri, 06 Mar 2026 08:51:15 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQts-00000003HvJ-3R0y;
	Fri, 06 Mar 2026 08:51:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E+jCEs6ciKKQ27yyw3kPx4a3jMlJxhFLH+Ua8//qL+Wz659oHDKSdTFAIJ5c2N4HzHIVd7Uzaz7zHWleWpuQT5MTvKZq1ZQRcQ3/T9ynXmMW2zzzgV0+CgP/96qJUVWRfpK0Gjb3idpErcyDKfN1GJEePiEdsFD+IXrghkQnlErRpw3x5T08go3aVKnB62JmF458b9myFugnfCoA8/+o9M2vQNA3ycSXtfgDyp2/rttSafQTy6RSJrdL3OVFv5M/ylVGFBHdP2+sbO/wBSfZppyaBE5+3k8hPuRc9PVvpRULO03IMrKP3q+hziiJTwHgpiA0j8vFiG/cTCid9wLT1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fBlOfnmWBK4QHq82YF5U1aVXSuD5P0SQ9nMAVaPgVnE=;
 b=UD6amkPZ6YIfWk4Ab3X2aORycf11/xhckkiTc8qydZ5m880ma2XYPPqnrBOpJXx+uJlbDYQxcwX798eXoB8QcLmJ/pguiQm4i4+oPMrojxjmbnPDD0OuVVLSfO+rkJCp8cHAWdZpqNxgbD01ixXiTay0XUuouGUz8SSBGORrZeWi1k69MhWCI1rD8XNwskSAthi/d+fW3hu1V1qiYn/I7TzPAn5wq+uoOWtcvrncXFlaIGHKEl4KcnJ1eHxRMp2ul1xPNidf+UVgFW3HFNqLsnctqED47WHKWFWGNO6+bUCbgNgly856Aleib3vsiwlymaySKggWHfOU/VLxOT4/mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBlOfnmWBK4QHq82YF5U1aVXSuD5P0SQ9nMAVaPgVnE=;
 b=HoB1h8uXPBXCmjtwsmv80sxIPPg9xH0eyGrZki8dmNiElyAhrU/bXU2pHkYw2clKHlo5Fs22kjUfnsA1GsoXdiosUMusrjYEfcgQcubHWdnJ4eb1iR83k/JRcXyeYvYX2hbh6WPK1qhqZzb617kznRuEmGVueb8Q2KOgyvgZGkvfGgu1pq/lxFInmIbWlZ4zFffso0Uf2iTkHh2pfcd/RKI2Rmz0oEQPEKVmtD0511wof3xSi/a9syUu55Sz5Z3e9g9HlVV3EzFhrVchwlOc/LuwF3mhMbs1rUdMzTudUtDF8dvimMMM+BhFekdLwN5JCzDw3QchLuqMn5L7wzKVmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::16)
 by DB9PR04MB8122.eurprd04.prod.outlook.com (2603:10a6:10:25d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Fri, 6 Mar
 2026 08:51:09 +0000
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f]) by AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f%3]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 08:51:06 +0000
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
Subject: [PATCH v5 3/4] clocksource/drivers/timer-mediatek: Convert timer-mediatek to a loadable module
Date: Fri,  6 Mar 2026 17:50:20 +0900
Message-Id: <20260306085021.1231032-4-zhipeng.wang_1@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: eff31a14-a6cb-4de0-a9a8-08de7b5d8176
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|376014|52116014|366016|7416014|38350700014;
X-Microsoft-Antispam-Message-Info: X4kPxyRAUW8ZaXmNzbG51CN0l4LzG9PqO8+l8SeQpwTtuQjwSrx17IHan5zv5iUqxLp8aL+UhNe4ShnnoYVERJ9njTCcldvfWwysgVhvOuFXvft3H3GcNFiaR2dYqbWIrJ0uHd3pQwJukbcVx/ZTxm3KKQdw6wDT7gOFIj/BEMBfErX+cR4VQRWhVur7MZuGOt34b0k4cD7WAJLXbSDxlG5+CTSDWl5oeVKxVinVE2Omp99+DT1lJMZzn05HXbEJn+74+mher0ncKXEZnUimvAimbyN3shprHQhX55Ed+c57/TcqY3T8UL0bN9ea2yM1iSAiL241tsMFGBthiudYHQ1kyoUPfpku2IwxIa0oVGe0eh8dGQgT6CjslbxEnzYs9/m3JdMbtBk4KToGyej8B3/swpuXchZZwsDWqX1d3HkEUGPSZVGyQ8gT3J0vmhznvoFV+hbyFsZ/T/QI/SMMEo3+O27Yikmv8mM4QxBCRb+T5FJt5lY6q/5rn2GR1XE/7F4yyve6a8eF6/FACV0FsudRnqneCyOkFu8Pk6W6GGn3rjQJh5pjjXXZAOBDpA5Yi0eE7DN9zjDSmVaZYNiM1XmDEvWNSjCjibXnJOnDJEZCBzoYwoWfrPSIEYEkv0bwo66ADT086mXiKnF/QLL1vUkxHGnFeQbp+vQJKDNLkNsgb13u1c1LvstHd/SyKayewQ+01R49i4d1Tg4ti4XhBF18kgRGn4XF6DtC+Ckjq+3bk1Navmm4x9ZDebnnpeFL2sOd+Ej7digZTlFp7PfdwpP96gQ8uJ22FTmaZ85c3ow=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8420.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(52116014)(366016)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5bGAkAjJAVCwo7ChOsptuZ8uFF8ji6u5MT/2z7pAQ1s6aCU3MimG0EKCHHGX?=
 =?us-ascii?Q?9YUBVjis8LYYQnAFZTJPOCo1XW9hQm38oB2282LHYPq3PvP6modzxlnOUREw?=
 =?us-ascii?Q?GJzOuz33xmH8KO/Vd2N6kXsxJMGvcJwSr7eIaGIsx+WNUdcysiofN2PpXw8Y?=
 =?us-ascii?Q?zIoS1Cq5kI2YO3FTWwOAx74vsoc/2Rr8pzFOAk4sbLgfDCx+E6C82k4grWMw?=
 =?us-ascii?Q?SEQwme/MYtf9jgjRdBzJBuvHeOWGP7s/pFkZr1lpnSFQ24mgaGuWAWpr6rKc?=
 =?us-ascii?Q?A++TfHIZZ4v5k6o/Pqi1b0SWc1o4HmtGzNTMLnfp7ZjZI0XYnUZQqhf9QZpY?=
 =?us-ascii?Q?zsd2Gk4zUUQQQrC0t5XwvKG+XZUI5N43GLeMvIgoDqSDLWTN6Hc5awU1iXtJ?=
 =?us-ascii?Q?O5mUBxBRlu6ch1SEMBjbfe5C9N+v4tlpZKIXIXwSRvQYCSFRXMs0xw3Vz0Le?=
 =?us-ascii?Q?5gBzxQJkiEn+453lUyEjV8wb6Ih3aUaI3BDR6XVREh+TUhBkxKciVpas0hCh?=
 =?us-ascii?Q?vUwhQp4Et9aHpV1pd4s5U3IogtjuxnjB59BDN8zQ2Lf/tlS8i8+iVAW7SUPZ?=
 =?us-ascii?Q?tApkFDHvbveb0uVQ9H5scfSVDyeIKCylUX+VfbKwXoRFaOXt7nid5dAuLMVu?=
 =?us-ascii?Q?J+7lMQTi+6NbCrPklCw+RD9oAtIO9gstTNqcIIm94DBC143R8eOkT8xSSU19?=
 =?us-ascii?Q?zYDv1kSH7+p/9Mckbnh9eQV5SE5cu5tuXIzOrNSzXoBeWq4hpn5vn2zTpkl8?=
 =?us-ascii?Q?4H8fPMQFGhtqayrup7AVdThLJt93JbGypTORzD3vbxCI9jw6IT2eBZ8XdlgI?=
 =?us-ascii?Q?xDTCjq5/RcrXfSBNXhOxzGy0sUPFVzOSHg6Mx5go/9Svv6v5byhu2DLLOePj?=
 =?us-ascii?Q?1ZQiFjp3EApD/kcmJAONwO++IKk13QBgLPrJyL535f2D9jMiARpD1tuVfEGb?=
 =?us-ascii?Q?vMdkpgW5LVDV6byYn4084k2zCZbK5moi+m3DeXx5TA6lr7IAQj5YMUd076os?=
 =?us-ascii?Q?OH3jsvoSPAoD8m0XHRjNNTOVQC8a5V0HfcEks7mwWcBl7ZHCj22/puRSZbxz?=
 =?us-ascii?Q?mOaT/dI7AAu9Rl9hH05jkG3Ekh/rALfWg0he0Lixs+jCv4WQ+M73lT3D8PW3?=
 =?us-ascii?Q?QwSKr4oxI7gDJFbnQPH5FvxXEzuuyGlEXzrp3+w0tu9MydLSiiMlXbRASeGO?=
 =?us-ascii?Q?7IpEE4ie/zAvZEn2CM3dQ5bJQySs+lYsKFuA0Ly+5q+rrVRU112roM9soB9f?=
 =?us-ascii?Q?5jMBXL8uPTl0laz1epIPb3OYxdp+htE/4nyPAKqxGu/oXoskp2XTwZfrpzHd?=
 =?us-ascii?Q?+Rt/6bsVrRwen/BSl7M7YALqvdrY855e4rW0EXLPgdWyLZAkcvh3dvitf9Gn?=
 =?us-ascii?Q?a3nYckndPENV/mL8rf9zE1AzNiQvCsMLYncFk2CMkR6ZQpIfowmRPYMu7Ipg?=
 =?us-ascii?Q?AlBmRt1rAUZGn6aHw2jw9amOQo5gi1AY8z3G+0kvP5t4HO1swxWe7grQXenc?=
 =?us-ascii?Q?CirHjYX21UNta2pbrmaKjQJE/I2gLq/Cv6RhQrUEa/h8HDp5RY/uFeAs8rQO?=
 =?us-ascii?Q?gdhBmMh1/Rd+7Jrf4MHSqs0wq3lmBBVvpoF6R8M8z8e2gYYSratYZKZb5/zF?=
 =?us-ascii?Q?WrkFDxeGReCOOcTa+7dzC1T6OsPlasquNV/mVz6xxl6zjWFgDYJmtyNX6qjR?=
 =?us-ascii?Q?s9u1fuybA5tCHhfrzPgbcjCPrK91JYPXSqfikErO+rk0E1KtWBjq6j9oDuIy?=
 =?us-ascii?Q?4VcZfYwIAg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eff31a14-a6cb-4de0-a9a8-08de7b5d8176
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8420.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 08:51:06.9245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3njjXWjnbPNU5VSXkSz4GmPQXHBUv3i6SnjgWye4geqz/CBjWtDqvNdpaVrUYosaIUeFE4BDtWSlKZb3N+sk6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_005112_856045_B84517FA 
X-CRM114-Status: GOOD (  16.19  )
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


