Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D39B3D12D5C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 01:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WQPzy0N+8ZxF67al3PRXl+HWHNq+Kg7e2aFNzXSp8GM=; b=vrYH2l87MvDRW5oyPERxQZuRMM
	Uc8d4T7fSfOKLdp+h5h9PVriX0AfD7qrtdlHHgLMkfjhSQMbHTOOHWd5CW0QMuJb0HFaG5wLhHkHa
	cr4HDmWNuP9jp1bWZa5OaVcRENzuetNvlTZd7fu6VBGDMHvin4YjIU50oWTfAJzU3J92IqsP+pLDz
	Duy6CHcuB12zgcf99HcontU1lMsuIWeRDA2LhqvzF7Vp55y0K9kbyjzY+9SQRkpnP9khT3yVBpLIV
	oHcX10XdvtIgsWg7UaTmBjAIuGEhxIgK7oqEtJ0t1TPsWipaVosGjXBkNy0yrInObK7mBUsYYDxhh
	Iv6M5PYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAIn4-0000000Fz5a-19NI;
	Mon, 11 Nov 2024 01:00:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAIaq-0000000FwwI-3sax
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 00:47:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B8BF1CDD;
	Sun, 10 Nov 2024 16:48:18 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 927413F66E;
	Sun, 10 Nov 2024 16:47:46 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Icenowy Zheng <uwu@icenowy.me>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] clk: sunxi-ng: add support for the A523/T527 PRCM CCU
Date: Mon, 11 Nov 2024 00:47:22 +0000
Message-ID: <20241111004722.10130-8-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241111004722.10130-1-andre.przywara@arm.com>
References: <20241111004722.10130-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_164749_080134_F0049527 
X-CRM114-Status: GOOD (  19.84  )
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

The A523/T527 SoCs have clock/reset controls in the PRCM part, like many
previous SoCs. For a change, the whole PRCM is documented in the A523
manual, including the system bus tree, so we can describe all those
clocks correctly based on that. There layout seems to be derived from
the H6 and H616 PRCM CCUs, though there are more clocks, and many clocks
have subtly changed.

Describe all the mod and gate clocks, including the three bus clocks
(R_AHB, R_APB0, and R_APB1).

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/clk/sunxi-ng/Kconfig             |   5 +
 drivers/clk/sunxi-ng/Makefile            |   2 +
 drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c | 245 +++++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun55i-a523-r.h |  14 ++
 4 files changed, 266 insertions(+)
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun55i-a523-r.h

diff --git a/drivers/clk/sunxi-ng/Kconfig b/drivers/clk/sunxi-ng/Kconfig
index 04efbda847cf9..5830a9d87bf25 100644
--- a/drivers/clk/sunxi-ng/Kconfig
+++ b/drivers/clk/sunxi-ng/Kconfig
@@ -57,6 +57,11 @@ config SUN55I_A523_CCU
 	default y
 	depends on ARM64 || COMPILE_TEST
 
+config SUN55I_A523_R_CCU
+	tristate "Support for the Allwinner A523/T527 PRCM CCU"
+	default y
+	depends on ARM64 || COMPILE_TEST
+
 config SUN4I_A10_CCU
 	tristate "Support for the Allwinner A10/A20 CCU"
 	default y
diff --git a/drivers/clk/sunxi-ng/Makefile b/drivers/clk/sunxi-ng/Makefile
index 01a887f7824bb..82e471036de69 100644
--- a/drivers/clk/sunxi-ng/Makefile
+++ b/drivers/clk/sunxi-ng/Makefile
@@ -34,6 +34,7 @@ obj-$(CONFIG_SUN50I_H6_CCU)	+= sun50i-h6-ccu.o
 obj-$(CONFIG_SUN50I_H6_R_CCU)	+= sun50i-h6-r-ccu.o
 obj-$(CONFIG_SUN50I_H616_CCU)	+= sun50i-h616-ccu.o
 obj-$(CONFIG_SUN55I_A523_CCU)	+= sun55i-a523-ccu.o
+obj-$(CONFIG_SUN55I_A523_R_CCU)	+= sun55i-a523-r-ccu.o
 obj-$(CONFIG_SUN4I_A10_CCU)	+= sun4i-a10-ccu.o
 obj-$(CONFIG_SUN5I_CCU)		+= sun5i-ccu.o
 obj-$(CONFIG_SUN6I_A31_CCU)	+= sun6i-a31-ccu.o
@@ -60,6 +61,7 @@ sun50i-h6-ccu-y			+= ccu-sun50i-h6.o
 sun50i-h6-r-ccu-y		+= ccu-sun50i-h6-r.o
 sun50i-h616-ccu-y		+= ccu-sun50i-h616.o
 sun55i-a523-ccu-y		+= ccu-sun55i-a523.o
+sun55i-a523-r-ccu-y		+= ccu-sun55i-a523-r.o
 sun4i-a10-ccu-y			+= ccu-sun4i-a10.o
 sun5i-ccu-y			+= ccu-sun5i.o
 sun6i-a31-ccu-y			+= ccu-sun6i-a31.o
diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c b/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
new file mode 100644
index 0000000000000..ab439742179cc
--- /dev/null
+++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
@@ -0,0 +1,245 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024 Arm Ltd.
+ * Based on the D1 CCU driver:
+ *   Copyright (c) 2020 huangzhenwei@allwinnertech.com
+ *   Copyright (C) 2021 Samuel Holland <samuel@sholland.org>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#include "ccu_common.h"
+#include "ccu_reset.h"
+
+#include "ccu_gate.h"
+#include "ccu_mp.h"
+
+#include "ccu-sun55i-a523-r.h"
+
+static const struct clk_parent_data r_ahb_apb_parents[] = {
+	{ .fw_name = "hosc" },
+	{ .fw_name = "losc" },
+	{ .fw_name = "iosc" },
+	{ .fw_name = "pll-periph" },
+	{ .fw_name = "pll-audio" },
+};
+static SUNXI_CCU_M_DATA_WITH_MUX(r_ahb_clk, "r-ahb",
+				 r_ahb_apb_parents, 0x000,
+				 0, 5,	/* M */
+				 24, 3,	/* mux */
+				 0);
+
+static SUNXI_CCU_M_DATA_WITH_MUX(r_apb0_clk, "r-apb0",
+				 r_ahb_apb_parents, 0x00c,
+				 0, 5,	/* M */
+				 24, 3,	/* mux */
+				 0);
+
+static SUNXI_CCU_M_DATA_WITH_MUX(r_apb1_clk, "r-apb1",
+				 r_ahb_apb_parents, 0x010,
+				 0, 5,	/* M */
+				 24, 3,	/* mux */
+				 0);
+
+static SUNXI_CCU_P_DATA_WITH_MUX_GATE(r_cpu_timer0, "r-timer0",
+				      r_ahb_apb_parents, 0x100,
+				      1, 3,	/* P */
+				      4, 3,	/* mux */
+				      BIT(0),
+				      0);
+static SUNXI_CCU_P_DATA_WITH_MUX_GATE(r_cpu_timer1, "r-timer1",
+				      r_ahb_apb_parents, 0x104,
+				      1, 3,	/* P */
+				      4, 3,	/* mux */
+				      BIT(0),
+				      0);
+static SUNXI_CCU_P_DATA_WITH_MUX_GATE(r_cpu_timer2, "r-timer2",
+				      r_ahb_apb_parents, 0x108,
+				      1, 3,	/* P */
+				      4, 3,	/* mux */
+				      BIT(0),
+				      0);
+
+static SUNXI_CCU_GATE_HW(bus_r_timer_clk, "bus-r-timer", &r_ahb_clk.common.hw,
+			 0x11c, BIT(0), 0);
+static SUNXI_CCU_GATE_HW(bus_r_twd_clk,	"bus-r-twd", &r_apb0_clk.common.hw,
+			 0x12c, BIT(0), 0);
+
+static const struct clk_parent_data r_pwmctrl_parents[] = {
+	{ .fw_name = "hosc" },
+	{ .fw_name = "losc" },
+	{ .fw_name = "iosc" },
+};
+static SUNXI_CCU_MUX_DATA_WITH_GATE(r_pwmctrl_clk, "r-pwmctrl",
+				  r_pwmctrl_parents, 0x130,
+				  24, 1,	/* mux */
+				  BIT(31),
+				  0);
+static SUNXI_CCU_GATE_HW(bus_r_pwmctrl_clk, "bus-r-pwmctrl",
+			 &r_apb0_clk.common.hw, 0x13c, BIT(0), 0);
+
+/* SPI clock is /M/N (same as new MMC?) */
+static SUNXI_CCU_GATE_HW(bus_r_spi_clk, "bus-r-spi",
+			 &r_ahb_clk.common.hw, 0x15c, BIT(0), 0);
+static SUNXI_CCU_GATE_HW(bus_r_spinlock_clk, "bus-r-spinlock",
+			 &r_ahb_clk.common.hw, 0x16c, BIT(0), 0);
+static SUNXI_CCU_GATE_HW(bus_r_msgbox_clk, "bus-r-msgbox",
+			 &r_ahb_clk.common.hw, 0x17c, BIT(0), 0);
+static SUNXI_CCU_GATE_HW(bus_r_uart0_clk, "bus-r-uart0",
+			 &r_apb1_clk.common.hw, 0x18c, BIT(0), 0);
+static SUNXI_CCU_GATE_HW(bus_r_uart1_clk, "bus-r-uart1",
+			 &r_apb1_clk.common.hw, 0x18c, BIT(1), 0);
+static SUNXI_CCU_GATE_HW(bus_r_i2c0_clk, "bus-r-i2c0",
+			 &r_apb1_clk.common.hw, 0x19c, BIT(0), 0);
+static SUNXI_CCU_GATE_HW(bus_r_i2c1_clk, "bus-r-i2c1",
+			 &r_apb1_clk.common.hw, 0x19c, BIT(1), 0);
+static SUNXI_CCU_GATE_HW(bus_r_i2c2_clk, "bus-r-i2c2",
+			 &r_apb1_clk.common.hw, 0x19c, BIT(2), 0);
+static SUNXI_CCU_GATE_HW(bus_r_ppu0_clk, "bus-r-ppu0",
+			 &r_apb0_clk.common.hw, 0x1ac, BIT(0), 0);
+static SUNXI_CCU_GATE_HW(bus_r_ppu1_clk, "bus-r-ppu1",
+			 &r_apb0_clk.common.hw, 0x1ac, BIT(1), 0);
+static SUNXI_CCU_GATE_HW(bus_r_cpu_bist_clk, "bus-r-cpu-bist",
+			 &r_apb0_clk.common.hw, 0x1bc, BIT(0), 0);
+
+static const struct clk_parent_data r_ir_rx_parents[] = {
+	{ .fw_name = "losc" },
+	{ .fw_name = "hosc" },
+};
+static SUNXI_CCU_M_DATA_WITH_MUX_GATE(r_ir_rx_clk, "r-ir-rx",
+				      r_ir_rx_parents, 0x1c0,
+				      0, 5,	/* M */
+				      24, 2,	/* mux */
+				      BIT(31),	/* gate */
+				      0);
+static SUNXI_CCU_GATE_HW(bus_r_ir_rx_clk, "bus-r-ir-rx",
+			 &r_apb0_clk.common.hw, 0x1cc, BIT(0), 0);
+
+static SUNXI_CCU_GATE_HW(bus_r_dma_clk, "bus-r-dma",
+			 &r_apb0_clk.common.hw, 0x1dc, BIT(0), 0);
+static SUNXI_CCU_GATE_HW(bus_r_rtc_clk, "bus-r-rtc",
+			 &r_apb0_clk.common.hw, 0x20c, BIT(0), 0);
+static SUNXI_CCU_GATE_HW(bus_r_cpucfg_clk, "bus-r-cpucfg",
+			 &r_apb0_clk.common.hw, 0x22c, BIT(0), 0);
+
+static struct ccu_common *sun55i_a523_r_ccu_clks[] = {
+	&r_ahb_clk.common,
+	&r_apb0_clk.common,
+	&r_apb1_clk.common,
+	&r_cpu_timer0.common,
+	&r_cpu_timer1.common,
+	&r_cpu_timer2.common,
+	&bus_r_timer_clk.common,
+	&bus_r_twd_clk.common,
+	&r_pwmctrl_clk.common,
+	&bus_r_pwmctrl_clk.common,
+	&bus_r_spi_clk.common,
+	&bus_r_spinlock_clk.common,
+	&bus_r_msgbox_clk.common,
+	&bus_r_uart0_clk.common,
+	&bus_r_uart1_clk.common,
+	&bus_r_i2c0_clk.common,
+	&bus_r_i2c1_clk.common,
+	&bus_r_i2c2_clk.common,
+	&bus_r_ppu0_clk.common,
+	&bus_r_ppu1_clk.common,
+	&bus_r_cpu_bist_clk.common,
+	&r_ir_rx_clk.common,
+	&bus_r_ir_rx_clk.common,
+	&bus_r_dma_clk.common,
+	&bus_r_rtc_clk.common,
+	&bus_r_cpucfg_clk.common,
+};
+
+static struct clk_hw_onecell_data sun55i_a523_r_hw_clks = {
+	.num	= CLK_NUMBER,
+	.hws	= {
+		[CLK_R_AHB]		= &r_ahb_clk.common.hw,
+		[CLK_R_APB0]		= &r_apb0_clk.common.hw,
+		[CLK_R_APB1]		= &r_apb1_clk.common.hw,
+		[CLK_R_TIMER0]		= &r_cpu_timer0.common.hw,
+		[CLK_R_TIMER1]		= &r_cpu_timer1.common.hw,
+		[CLK_R_TIMER2]		= &r_cpu_timer2.common.hw,
+		[CLK_BUS_R_TIMER]	= &bus_r_timer_clk.common.hw,
+		[CLK_BUS_R_TWD]		= &bus_r_twd_clk.common.hw,
+		[CLK_R_PWMCTRL]		= &r_pwmctrl_clk.common.hw,
+		[CLK_BUS_R_PWMCTRL]	= &bus_r_pwmctrl_clk.common.hw,
+		[CLK_BUS_R_SPI]		= &bus_r_spi_clk.common.hw,
+		[CLK_BUS_R_SPINLOCK]	= &bus_r_spinlock_clk.common.hw,
+		[CLK_BUS_R_MSGBOX]	= &bus_r_msgbox_clk.common.hw,
+		[CLK_BUS_R_UART0]	= &bus_r_uart0_clk.common.hw,
+		[CLK_BUS_R_UART1]	= &bus_r_uart1_clk.common.hw,
+		[CLK_BUS_R_I2C0]	= &bus_r_i2c0_clk.common.hw,
+		[CLK_BUS_R_I2C1]	= &bus_r_i2c1_clk.common.hw,
+		[CLK_BUS_R_I2C2]	= &bus_r_i2c2_clk.common.hw,
+		[CLK_BUS_R_PPU0]	= &bus_r_ppu0_clk.common.hw,
+		[CLK_BUS_R_PPU1]	= &bus_r_ppu1_clk.common.hw,
+		[CLK_BUS_R_CPU_BIST]	= &bus_r_cpu_bist_clk.common.hw,
+		[CLK_R_IR_RX]		= &r_ir_rx_clk.common.hw,
+		[CLK_BUS_R_IR_RX]	= &bus_r_ir_rx_clk.common.hw,
+		[CLK_BUS_R_DMA]		= &bus_r_dma_clk.common.hw,
+		[CLK_BUS_R_RTC]		= &bus_r_rtc_clk.common.hw,
+		[CLK_BUS_R_CPUCFG]	= &bus_r_cpucfg_clk.common.hw,
+	},
+};
+
+static struct ccu_reset_map sun55i_a523_r_ccu_resets[] = {
+	[RST_BUS_R_TIMER]	= { 0x11c, BIT(16) },
+	[RST_BUS_R_TWD]		= { 0x12c, BIT(16) },
+	[RST_BUS_R_PWMCTRL]	= { 0x13c, BIT(16) },
+	[RST_BUS_R_SPI]		= { 0x15c, BIT(16) },
+	[RST_BUS_R_SPINLOCK]	= { 0x16c, BIT(16) },
+	[RST_BUS_R_MSGBOX]	= { 0x17c, BIT(16) },
+	[RST_BUS_R_UART0]	= { 0x18c, BIT(16) },
+	[RST_BUS_R_UART1]	= { 0x18c, BIT(17) },
+	[RST_BUS_R_I2C0]	= { 0x19c, BIT(16) },
+	[RST_BUS_R_I2C1]	= { 0x19c, BIT(17) },
+	[RST_BUS_R_I2C2]	= { 0x19c, BIT(18) },
+	[RST_BUS_R_PPU1]	= { 0x1ac, BIT(17) },
+	[RST_BUS_R_IR_RX]	= { 0x1cc, BIT(16) },
+	[RST_BUS_R_RTC]		= { 0x20c, BIT(16) },
+	[RST_BUS_R_CPUCFG]	= { 0x22c, BIT(16) },
+};
+
+static const struct sunxi_ccu_desc sun55i_a523_r_ccu_desc = {
+	.ccu_clks	= sun55i_a523_r_ccu_clks,
+	.num_ccu_clks	= ARRAY_SIZE(sun55i_a523_r_ccu_clks),
+
+	.hw_clks	= &sun55i_a523_r_hw_clks,
+
+	.resets		= sun55i_a523_r_ccu_resets,
+	.num_resets	= ARRAY_SIZE(sun55i_a523_r_ccu_resets),
+};
+
+static int sun55i_a523_r_ccu_probe(struct platform_device *pdev)
+{
+	void __iomem *reg;
+
+	reg = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(reg))
+		return PTR_ERR(reg);
+
+	return devm_sunxi_ccu_probe(&pdev->dev, reg, &sun55i_a523_r_ccu_desc);
+}
+
+static const struct of_device_id sun55i_a523_r_ccu_ids[] = {
+	{ .compatible = "allwinner,sun55i-a523-r-ccu" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, sun55i_a523_r_ccu_ids);
+
+static struct platform_driver sun55i_a523_r_ccu_driver = {
+	.probe	= sun55i_a523_r_ccu_probe,
+	.driver	= {
+		.name			= "sun55i-a523-r-ccu",
+		.suppress_bind_attrs	= true,
+		.of_match_table		= sun55i_a523_r_ccu_ids,
+	},
+};
+module_platform_driver(sun55i_a523_r_ccu_driver);
+
+MODULE_IMPORT_NS(SUNXI_CCU);
+MODULE_DESCRIPTION("Support for the Allwinner A523 PRCM CCU");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.h b/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.h
new file mode 100644
index 0000000000000..d50f46ac4f3fe
--- /dev/null
+++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2024 Arm Ltd.
+ */
+
+#ifndef _CCU_SUN55I_A523_R_H
+#define _CCU_SUN55I_A523_R_H
+
+#include <dt-bindings/clock/sun55i-a523-r-ccu.h>
+#include <dt-bindings/reset/sun55i-a523-r-ccu.h>
+
+#define CLK_NUMBER	(CLK_BUS_R_CPUCFG + 1)
+
+#endif /* _CCU_SUN55I_A523_R_H */
-- 
2.46.2


