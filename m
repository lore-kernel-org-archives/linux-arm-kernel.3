Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80230C55175
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 11:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dQTPdvX485YGnWkIltEywiBDunzazmSDkgToZcY4X2A=; b=SpizaBSOvt0soo5kmz9DJRpRZo
	MJvKWufWbV68o2x1CpyurJfc6GcA8IBL0ab813WWfXlvYULgWASuiYaSQBDrpOast6Ye1L7yzNwmm
	KSu758LsTrYK/9hz4WrYrYEloeg8Cmsa6fPt6qN2szeyj4TrVvSqaVoU7YYzMhGP5NP12dpW/jgDI
	P3SSULMUXIZfWaPPVrKO+hS7iMK4yHHW6elF812X61Dwr88ANgdXmvlMEjf0KPbEBhAtQ6BSFKkOE
	J27JxMU8wpFGyh09BgHwFDqi9TBSlF0SDSim/on08oE8aQMr/eTFjWD4giVo3r0v8t7HWgJAEtf5C
	mNylTIwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq7mv-0000000EEDF-3s0d;
	Sat, 01 Aug 2026 11:21:58 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq7mY-0000000EDMy-2KTM;
	Sat, 01 Aug 2026 11:21:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785583292;
	bh=7nxjFDvM8+mIB8eYa2kyDbOfy5LmVW0Q4CN2nrB4Rb4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GhAYig3ioBLh4uHunapbqzDg6xuCRQrrZIfABpCdvcgY2i/76/84fuQFRPmI4LXEm
	 YWotlNSyauQXLzXC6VKqSpYvyF+3Dp04BXy6p1Q8MH1ZJ+jEUVkBFAgDFkpRPvxI3q
	 MBytG3Q9L7K4IhN/TNuLw3L2y1i8HzMJCRzQKEhAoaTWYMyEsbFJ0YxhO1F45kyb0s
	 w396QzxwouTVU/8ovnKnrGsuQCyFZVlJ+xqCClzxdhPw68pwydMkBMKrWavH461QsV
	 Pp/JilhBg/a6YmI0tM7vnvb/gpUZi0IjeWX6plIQ75U09fn/MViZmTiAXUtYzzfUYt
	 yXDCrK1qoHe0g==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 16BC517E094D;
	Sat, 01 Aug 2026 13:21:31 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Sat, 01 Aug 2026 13:21:10 +0200
Subject: [PATCH v5 24/25] clk: mediatek: Add MT8189 scp clock support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-mt8189-clocks-system-base-v5-24-ac4410697cc2@collabora.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785583261; l=5001;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=7nxjFDvM8+mIB8eYa2kyDbOfy5LmVW0Q4CN2nrB4Rb4=;
 b=7rzN4CohhAQmWrUgtYgmbh035eErH0dX4q4l4wqD7BUF7Vy+MPrg140bZWxZYfxW3MdAI5ipD
 tI5xlstSF6ODy2iNKU/tr99jpHpPKxu0NkurmDlij5IYssWXJbQyYSO
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_042134_881731_57CC3B11 
X-CRM114-Status: GOOD (  17.09  )
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

Add support for the MT8189 scp clock controller,
which provides clock gate control for System Control Processor.

Co-developed-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
Co-developed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/clk/mediatek/Kconfig          | 10 +++++
 drivers/clk/mediatek/Makefile         |  1 +
 drivers/clk/mediatek/clk-mt8189-scp.c | 77 +++++++++++++++++++++++++++++++++++
 3 files changed, 88 insertions(+)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index bba631138b07..919a916f1f4f 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -872,6 +872,16 @@ config COMMON_CLK_MT8189_IIC
 	  the MT8189 chipset, improving the overall performance and power
 	  efficiency of the device.
 
+config COMMON_CLK_MT8189_SCP
+	tristate "Clock driver for MediaTek MT8189 scp"
+	depends on COMMON_CLK_MT8189
+	default COMMON_CLK_MT8189
+	help
+	  Enable this to support the clock framework for the System Control
+	  Processor (SCP) in the MediaTek MT8189 SoC. This includes clock
+	  management for SCP-related features, ensuring proper clock
+	  distribution and gating for power efficiency and functionality.
+
 config COMMON_CLK_MT8192
 	tristate "Clock driver for MediaTek MT8192"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index bfc075023d9b..a3a93a16b369 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -129,6 +129,7 @@ obj-$(CONFIG_COMMON_CLK_MT8189_BUS) += clk-mt8189-bus.o
 obj-$(CONFIG_COMMON_CLK_MT8189_DBGAO) += clk-mt8189-dbgao.o
 obj-$(CONFIG_COMMON_CLK_MT8189_DVFSRC) += clk-mt8189-dvfsrc.o
 obj-$(CONFIG_COMMON_CLK_MT8189_IIC) += clk-mt8189-iic.o
+obj-$(CONFIG_COMMON_CLK_MT8189_SCP) += clk-mt8189-scp.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192-apmixedsys.o clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8189-scp.c b/drivers/clk/mediatek/clk-mt8189-scp.c
new file mode 100644
index 000000000000..75197cd98b52
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8189-scp.c
@@ -0,0 +1,77 @@
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
+static const struct mtk_gate_regs scp_cg_regs = {
+	.set_ofs = 0x4,
+	.clr_ofs = 0x8,
+	.sta_ofs = 0x4,
+};
+
+#define GATE_SCP(_id, _name, _parent, _shift)		\
+	GATE_MTK(_id, _name, _parent, &scp_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
+
+static const struct mtk_gate scp_clks[] = {
+	GATE_SCP(CLK_SCP_SET_SPI0, "scp_set_spi0", "clk26m", 0),
+	GATE_SCP(CLK_SCP_SET_SPI1, "scp_set_spi1", "clk26m", 1),
+};
+
+static const struct mtk_clk_desc scp_mcd = {
+	.clks = scp_clks,
+	.num_clks = ARRAY_SIZE(scp_clks),
+};
+
+static const struct mtk_gate_regs scp_iic_cg_regs = {
+	.set_ofs = 0x8,
+	.clr_ofs = 0x4,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_SCP_IIC(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &scp_iic_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
+
+static const struct mtk_gate scp_iic_clks[] = {
+	GATE_SCP_IIC(CLK_SCP_IIC_I2C0_W1S, "scp_iic_i2c0_w1s", "vlp_scp_iic_sel", 0),
+	GATE_SCP_IIC(CLK_SCP_IIC_I2C1_W1S, "scp_iic_i2c1_w1s", "vlp_scp_iic_sel", 1),
+};
+
+static const struct mtk_clk_desc scp_iic_mcd = {
+	.clks = scp_iic_clks,
+	.num_clks = ARRAY_SIZE(scp_iic_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8189_scp[] = {
+	{ .compatible = "mediatek,mt8189-scp-clk", .data = &scp_mcd },
+	{ .compatible = "mediatek,mt8189-scp-i2c-clk", .data = &scp_iic_mcd },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8189_scp);
+
+static struct platform_driver clk_mt8189_scp_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt8189-scp",
+		.of_match_table = of_match_clk_mt8189_scp,
+	},
+};
+module_platform_driver(clk_mt8189_scp_drv);
+
+MODULE_DESCRIPTION("MediaTek MT8189 scp clocks driver");
+MODULE_LICENSE("GPL");

-- 
2.55.0


