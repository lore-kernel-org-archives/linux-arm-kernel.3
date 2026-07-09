Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1EA3C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 13:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CavFiKSwUhGNGqn+cczlrzOrn0/LpIKMvM53+AdO948=; b=t9JrnT71c1ISNo67BiTQJ/K3Qu
	7Pl48qzVN8/s2KyT9ITZm+HApfByno4lF40ZDYdc6TYWUnFHBYvBAVEg8X+Lsmt+bcZzndcI910on
	t2tUahf6hLjUcz29qUONZsoNQKIDBFMVFR+9rnZh2rX0B9crCVeHNqhDTChvotrmk54LTuzC7n7f8
	FgF0PVD9HZlW/lKCHtyt4i1is/guqxbal5MStbEhhPhH2hUTKeviofQhq2opGgakKKFwrkxoWVuxz
	7wCTIN/mdedFKGqglkaP5xUX4sl+XqOoy8CblxGOPHgzAFFr6KLXQu1droxH61L+Wqej4ZVpLXtjh
	0VhPRotg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whp2F-00000002bSa-2dJO;
	Thu, 09 Jul 2026 13:43:27 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whp25-00000002b6e-3Kwd;
	Thu, 09 Jul 2026 13:43:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783604594;
	bh=n9wUOpobDjDzuRSQD9VUQ/Ag4R9g26eowejTg9uByGA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UNO41fIapEU036wJQ5L4rzcqZdzsv3wB/z/Hke5/Dq+tstTyYbYQtAKWRKRsrkuKi
	 STfFs7wgmQCsgRTpF+AQGxPtNUCojaCzoWLYZv31udrv1LPDBWzegcSfoSZmcIoB7C
	 NXqktd9KPRfkt+5iVaB5Ohn82xJoWi+b4uLx9B9GXD1twNBZ8n6XvwL0pHPYCOR+0Q
	 PA+yGsdRLvZAM819IqobfhBRgQd1Emfj+ihDKQdZqg9OfGLKKMMyzJfgGkjQ6onzdJ
	 WL/UXbjjjM7YKLLs8btcw9kir6TP+P572BSCRKhtDMv8QdSKNHaQutj00pS7GZURQy
	 GSAj2YxGyh2sA==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1C86D17E0DFB;
	Thu, 09 Jul 2026 15:43:13 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 09 Jul 2026 15:42:55 +0200
Subject: [PATCH v2 15/18] clk: mediatek: Add MT8189 dvfsrc clock support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-mt8189-clocks-system-base-v2-15-2926da3db6cf@collabora.com>
References: <20260709-mt8189-clocks-system-base-v2-0-2926da3db6cf@collabora.com>
In-Reply-To: <20260709-mt8189-clocks-system-base-v2-0-2926da3db6cf@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Edward-JW Yang <edward-jw.yang@mediatek.com>, 
 Richard Cochran <richardcochran@gmail.com>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, Irving-CH Lin <irving-ch.lin@mediatek.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783604575; l=4468;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=n9wUOpobDjDzuRSQD9VUQ/Ag4R9g26eowejTg9uByGA=;
 b=NbjrGeRay0bb8sDeOYK8PTOGuVpF9gp6ppmQz775ib9qpOzZ5Tb6sHMjXM83/EORoO3T3YrnB
 CfqpxEEQG2SBa+i7altXGb9u3gx5WC6xyyroBTF2femKUSnXPdl3H/A
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_064318_767790_C4D96BB0 
X-CRM114-Status: GOOD (  17.28  )
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

Add support for the MT8189 dvfsrc clock controller,
which provides clock gate control for dram dvfs.

Co-developed-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
Co-developed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/clk/mediatek/Kconfig             | 10 ++++++
 drivers/clk/mediatek/Makefile            |  1 +
 drivers/clk/mediatek/clk-mt8189-dvfsrc.c | 58 ++++++++++++++++++++++++++++++++
 3 files changed, 69 insertions(+)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 635b0109ec07..245d3b83b5d3 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -849,6 +849,16 @@ config COMMON_CLK_MT8189_DBGAO
 	  vcore debug system clocks. If you want to control its clocks, say Y or M
 	  to include this driver in your kernel build.
 
+config COMMON_CLK_MT8189_DVFSRC
+	tristate "Clock driver for MediaTek MT8189 dvfsrc"
+	depends on COMMON_CLK_MT8189
+	default COMMON_CLK_MT8189
+	help
+	  Enable this to support the clock management for the dvfsrc
+	  on MediaTek MT8189 SoCs. This includes enabling and disabling
+	  vcore dvfs clocks. If you want to control its clocks, say Y or M
+	  to include this driver in your kernel build.
+
 config COMMON_CLK_MT8192
 	tristate "Clock driver for MediaTek MT8192"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 6ab6df7ebf2a..4dbfc9ac83ba 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -127,6 +127,7 @@ obj-$(CONFIG_COMMON_CLK_MT8189) += clk-mt8189-apmixedsys.o clk-mt8189-topckgen.o
 				   clk-mt8189-vlpckgen.o clk-mt8189-vlpcfg.o
 obj-$(CONFIG_COMMON_CLK_MT8189_BUS) += clk-mt8189-bus.o
 obj-$(CONFIG_COMMON_CLK_MT8189_DBGAO) += clk-mt8189-dbgao.o
+obj-$(CONFIG_COMMON_CLK_MT8189_DVFSRC) += clk-mt8189-dvfsrc.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192-apmixedsys.o clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8189-dvfsrc.c b/drivers/clk/mediatek/clk-mt8189-dvfsrc.c
new file mode 100644
index 000000000000..37b81dc0b882
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8189-dvfsrc.c
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025-2026 MediaTek Inc.
+ *                    Qiqi Wang <qiqi.wang@mediatek.com>
+ *                    Irving-CH Lin <irving-ch.lin@mediatek.com>
+ * Copyright (C) 2026 Collabora Ltd.
+ *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+ *                    Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+
+#include "clk-mtk.h"
+#include "clk-gate.h"
+
+#include <dt-bindings/clock/mediatek,mt8189-clk.h>
+
+static const struct mtk_gate_regs dvfsrc_top_cg_regs = {
+	.set_ofs = 0x0,
+	.clr_ofs = 0x0,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_DVFSRC_TOP_FLAGS(_id, _name, _parent, _shift, _flags)		\
+	GATE_MTK_FLAGS(_id, _name, _parent, &dvfsrc_top_cg_regs, _shift,	\
+		       &mtk_clk_gate_ops_no_setclr_inv, _flags)
+
+static const struct mtk_gate dvfsrc_top_clks[] = {
+	GATE_DVFSRC_TOP_FLAGS(CLK_DVFSRC_TOP_DVFSRC_EN, "dvfsrc_dvfsrc_en",
+			      "clk26m", 0, CLK_IS_CRITICAL),
+};
+
+static const struct mtk_clk_desc dvfsrc_top_mcd = {
+	.clks = dvfsrc_top_clks,
+	.num_clks = ARRAY_SIZE(dvfsrc_top_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8189_dvfsrc[] = {
+	{ .compatible = "mediatek,mt8189-dvfsrc-top", .data = &dvfsrc_top_mcd },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8189_dvfsrc);
+
+static struct platform_driver clk_mt8189_dvfsrc_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt8189-dvfsrc",
+		.of_match_table = of_match_clk_mt8189_dvfsrc,
+	},
+};
+module_platform_driver(clk_mt8189_dvfsrc_drv);
+
+MODULE_DESCRIPTION("MediaTek MT8189 dvfsrc clocks driver");
+MODULE_LICENSE("GPL");

-- 
2.55.0


