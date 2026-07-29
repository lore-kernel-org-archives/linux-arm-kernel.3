Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 324E9C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 10:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o/GVNhFdB/BeYw3ohLo/Bxmxi5PlcXI4mV+PDhw0MWU=; b=W59TwRQK3LjTVsJGhAQXz4bO4g
	pXSBjVclMIDjI5DJdFfceZR2X4yKe4CM0N3cqdDpwYUy2/ODmN7d2USchpxPm28BC227U3wg5qgPG
	lyQiGxZ0N13ykHPZMmUC7IBZcGAWs/U75FvsZnwFXh33w13yZqs0cuZ7DN1TQMaN0nD5rCfJ8bbaA
	kqXxMvtUiebgKKId1hCMvRO8YmsIfCxw5A39O5hPnex8l7jIbRr2nA5O7BzXjwewaY1ilbfLEcJb+
	vtoWHFue9nE7J78mYfdtqLUKsnVZCdMXeKLAJUdRRWkJpPtn9RbCoJdsXJdfBjWUrbcQwlKjUCSdm
	17NVCwNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp19t-00000007U9T-1s2t;
	Wed, 29 Jul 2026 10:05:05 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp18U-00000007SFS-1qyo;
	Wed, 29 Jul 2026 10:03:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785319416;
	bh=JjK8pa9skMKrbL9WvATZeCl7TfsvD3UbnhThFaSduHw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=auT1ZZwRPMSt+IWV+gemhofscL1fT9CweM4R8BDnzWf9eFZqFFYr+t15YhtbSuKbY
	 Cun6ryRVaiXV8iVJ+HQQDskht1ktIz24QSy2WUArIFP0JIi/kC8zl3MAUWcZwboGmK
	 3zZjalW9GMZAbUPE0f3x8zlIR5MeuF/PYs5ivrWkdQyRrZ+FvsN2Bla/JFBPJMmWSO
	 goAFhE5rsNBgDNdYscUXv5AO0FCcu0cWgZbRRQJ9AKGyNAXpvGW2k1/GeW2OJUUAjg
	 Y00SJBn3t/0x6ysQWRe35E9/mwY6XjleKtModBSFSm3PRsl4EuX/du+r/FORS33pyy
	 NJ2U/4tmu5C4Q==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4FF3A17E0048;
	Wed, 29 Jul 2026 12:03:35 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 29 Jul 2026 12:03:06 +0200
Subject: [PATCH v4 22/24] clk: mediatek: Add MT8189 i2c clock support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-mt8189-clocks-system-base-v4-22-e356b813a64c@collabora.com>
References: <20260729-mt8189-clocks-system-base-v4-0-e356b813a64c@collabora.com>
In-Reply-To: <20260729-mt8189-clocks-system-base-v4-0-e356b813a64c@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Edward-JW Yang <edward-jw.yang@mediatek.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, Irving-CH Lin <irving-ch.lin@mediatek.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785319388; l=6586;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=JjK8pa9skMKrbL9WvATZeCl7TfsvD3UbnhThFaSduHw=;
 b=H28ohhh7RmR7WBb8oMfyUyztVHPGms3HrZRDLmXfEUIM8ou8B8ao0TbzjHj/hb+Y/sHZxVL80
 G2N4fWhJ8w+D+lGWvS5aVJGo0c4kf7h9gPaKCIayitvTDp2UX8o6v72
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_030338_698841_15520819 
X-CRM114-Status: GOOD (  18.36  )
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

Add support for the MT8189 i2c clock controller,
which provides clock gate control for i2c.

Co-developed-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
Co-developed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/clk/mediatek/Kconfig          |  13 ++++
 drivers/clk/mediatek/Makefile         |   1 +
 drivers/clk/mediatek/clk-mt8189-iic.c | 122 ++++++++++++++++++++++++++++++++++
 3 files changed, 136 insertions(+)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 245d3b83b5d3..bba631138b07 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -859,6 +859,19 @@ config COMMON_CLK_MT8189_DVFSRC
 	  vcore dvfs clocks. If you want to control its clocks, say Y or M
 	  to include this driver in your kernel build.
 
+config COMMON_CLK_MT8189_IIC
+	tristate "Clock driver for MediaTek MT8189 iic"
+	depends on COMMON_CLK_MT8189
+	default COMMON_CLK_MT8189
+	help
+	  Enable this option to support the clock framework for MediaTek MT8189
+	  integrated circuits (iic). This driver is responsible for managing
+	  clock sources, dividers, and gates specifically designed for MT8189
+	  SoCs. Enabling this driver ensures that the system can correctly
+	  manage clock frequencies and power for various components within
+	  the MT8189 chipset, improving the overall performance and power
+	  efficiency of the device.
+
 config COMMON_CLK_MT8192
 	tristate "Clock driver for MediaTek MT8192"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 4dbfc9ac83ba..bfc075023d9b 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -128,6 +128,7 @@ obj-$(CONFIG_COMMON_CLK_MT8189) += clk-mt8189-apmixedsys.o clk-mt8189-topckgen.o
 obj-$(CONFIG_COMMON_CLK_MT8189_BUS) += clk-mt8189-bus.o
 obj-$(CONFIG_COMMON_CLK_MT8189_DBGAO) += clk-mt8189-dbgao.o
 obj-$(CONFIG_COMMON_CLK_MT8189_DVFSRC) += clk-mt8189-dvfsrc.o
+obj-$(CONFIG_COMMON_CLK_MT8189_IIC) += clk-mt8189-iic.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192-apmixedsys.o clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8189-iic.c b/drivers/clk/mediatek/clk-mt8189-iic.c
new file mode 100644
index 000000000000..80a01706791a
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8189-iic.c
@@ -0,0 +1,122 @@
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
+static const struct mtk_gate_regs impe_cg_regs = {
+	.set_ofs = 0x8,
+	.clr_ofs = 0x4,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_IMPE(_id, _name, _parent, _shift)				\
+	GATE_MTK_FLAGS(_id, _name, _parent, &impe_cg_regs, _shift,	\
+		&mtk_clk_gate_ops_setclr, CLK_OPS_PARENT_ENABLE)
+
+static const struct mtk_gate impe_clks[] = {
+	GATE_IMPE(CLK_IMPE_I2C0, "impe_i2c0", "i2c_sel", 0),
+	GATE_IMPE(CLK_IMPE_I2C1, "impe_i2c1", "i2c_sel", 1),
+};
+
+static const struct mtk_clk_desc impe_mcd = {
+	.clks = impe_clks,
+	.num_clks = ARRAY_SIZE(impe_clks),
+};
+
+static const struct mtk_gate_regs impen_cg_regs = {
+	.set_ofs = 0x8,
+	.clr_ofs = 0x4,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_IMPEN(_id, _name, _parent, _shift)				\
+	GATE_MTK_FLAGS(_id, _name, _parent, &impen_cg_regs, _shift,	\
+		&mtk_clk_gate_ops_setclr, CLK_OPS_PARENT_ENABLE)
+
+static const struct mtk_gate impen_clks[] = {
+	GATE_IMPEN(CLK_IMPEN_I2C7, "impen_i2c7", "i2c_sel", 0),
+	GATE_IMPEN(CLK_IMPEN_I2C8, "impen_i2c8", "i2c_sel", 1),
+};
+
+static const struct mtk_clk_desc impen_mcd = {
+	.clks = impen_clks,
+	.num_clks = ARRAY_SIZE(impen_clks),
+};
+
+static const struct mtk_gate_regs imps_cg_regs = {
+	.set_ofs = 0x8,
+	.clr_ofs = 0x4,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_IMPS(_id, _name, _parent, _shift)				\
+	GATE_MTK_FLAGS(_id, _name, _parent, &imps_cg_regs, _shift,	\
+		&mtk_clk_gate_ops_setclr, CLK_OPS_PARENT_ENABLE)
+
+static const struct mtk_gate imps_clks[] = {
+	GATE_IMPS(CLK_IMPS_I2C3, "imps_i2c3", "i2c_sel", 0),
+	GATE_IMPS(CLK_IMPS_I2C4, "imps_i2c4", "i2c_sel", 1),
+	GATE_IMPS(CLK_IMPS_I2C5, "imps_i2c5", "i2c_sel", 2),
+	GATE_IMPS(CLK_IMPS_I2C6, "imps_i2c6", "i2c_sel", 3),
+};
+
+static const struct mtk_clk_desc imps_mcd = {
+	.clks = imps_clks,
+	.num_clks = ARRAY_SIZE(imps_clks),
+};
+
+static const struct mtk_gate_regs impws_cg_regs = {
+	.set_ofs = 0x8,
+	.clr_ofs = 0x4,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_IMPWS(_id, _name, _parent, _shift)				\
+	GATE_MTK_FLAGS(_id, _name, _parent, &impws_cg_regs, _shift,	\
+		&mtk_clk_gate_ops_setclr, CLK_OPS_PARENT_ENABLE)
+
+static const struct mtk_gate impws_clks[] = {
+	GATE_IMPWS(CLK_IMPWS_I2C2, "impws_i2c2", "i2c_sel", 0),
+};
+
+static const struct mtk_clk_desc impws_mcd = {
+	.clks = impws_clks,
+	.num_clks = ARRAY_SIZE(impws_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8189_iic[] = {
+	{ .compatible = "mediatek,mt8189-iic-wrap-e", .data = &impe_mcd },
+	{ .compatible = "mediatek,mt8189-iic-wrap-en", .data = &impen_mcd },
+	{ .compatible = "mediatek,mt8189-iic-wrap-s", .data = &imps_mcd },
+	{ .compatible = "mediatek,mt8189-iic-wrap-ws", .data = &impws_mcd },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8189_iic);
+
+static struct platform_driver clk_mt8189_iic_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt8189-iic",
+		.of_match_table = of_match_clk_mt8189_iic,
+	},
+};
+module_platform_driver(clk_mt8189_iic_drv);
+
+MODULE_DESCRIPTION("MediaTek MT8189 iic clocks driver");
+MODULE_LICENSE("GPL");

-- 
2.55.0


