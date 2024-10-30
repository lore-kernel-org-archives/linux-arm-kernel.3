Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C43D5CC96
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 11:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q5jMJgoG95XOAacDcXbjb/TlnRn6Yww+ugS+rzM6glY=; b=J8ZJUQmx3cguXGizEuZijN2ToF
	ps3Jz5IYbtc/KLS8v9c9pokX4RgvC82wY7mDgxZtGUarfFE5Dwk0bS0nZkl0RhUTYNxmwHfBse+7g
	+AVMM+rwFv1EE3B1ijDyMCsU0RpXl0kfWJvBUvZVmx5URBVmh7+5V63Ma0LVxapewRPnwkKMNWceP
	zvg6D4GB6SKarP5P+3p0UjaZ/QxvUwd3W55iyYOjuXJwDIOz3PJRbox6BLQ5hQJPt8nqChYhCdkwX
	2ZGSJPi8aPnDleXyv+ixzWaK+atvBzHYmqM5whB/SIqAc0fWyRWWsVLx5jBkNx5//Q5rZ5w9iByau
	C+ddFp3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t66lR-000000007A9-0yOe;
	Wed, 30 Oct 2024 11:21:25 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t66SN-000000003g3-1dob
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 11:01:44 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-431548bd1b4so59884435e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 04:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730286102; x=1730890902; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q5jMJgoG95XOAacDcXbjb/TlnRn6Yww+ugS+rzM6glY=;
        b=MAGijbzwl5uc0Ql0MN/5bOAB+HMlWQKvf65srPgayjLkQ0h2F2nychC/EVOS5fdrXT
         w20PYUEmentlUGNnVKWITamOjj3BzBKVctdO2LkbzP3AkCJhOMYhDgw08tAgFDYu88hC
         8zk/klDrETHSDtyuKLuE06SQ19a7tHekWUOHe1kFlX+kz/BYDv2SC75QfiPNcpvu3Xnh
         cfWqRGpXS2j9FUkVXuRNNY+Kwyq3Y9gPlvYDpeelUgbv5B/x5Ubiw5CC602utHvspY18
         LopXHykTr8+Zhp43dpwKzJ9Khu6AVk62JdYB1WAyrcDlTgP/gezVQd5yAonlOivWMi9o
         QsEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730286102; x=1730890902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q5jMJgoG95XOAacDcXbjb/TlnRn6Yww+ugS+rzM6glY=;
        b=FvKaZ9dXZPJH+uRZFlgXhn1hPcwSnx/v3zmRzfpFdZr5/XYvP554+kQ8090LtFtanA
         jxkCIQvpjTA8QaWDyLfeBKNkZ696GBSpTarHTAy5QxEXB7zEstCl/8rFtxm3s49v0eq5
         HnX8V7JJiI6ww0447NN8LEA382m/g3OzQRQoRK+ZDHrWkfbjSLF9PjM2tOAc88xUK3AW
         7tJr7t0+4PUGBJiOknZA9Hfi3jfva+ICfV4WgQXZ58pAIEq79P+1coZwTFfjREXGN7Wz
         9NLzefQdS+TxhKupN/HHGd/gi7lvX7hq3ULnu3TwHKfKLB+3pgWPIyWb1SHgtvLKgK0L
         UOQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKgSi6LOwerzae5AdcIIBAhYu6pVaFAHKcTMQtOTK0B/WK5KYJl5s9cEVJ2xYtIln+KhnEDAn72qZ/3Va+asKO@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7a3foQsr83B9zY6BzvAdDvXlRRnZMtYJypE94MMbKc8YX9f1B
	w//R6VWdqxeavt4mrjaIIytg3DPyIq1nWxr28T9uKNs8Qi7DhOcqn15riv+iAc0=
X-Google-Smtp-Source: AGHT+IFmFwJJ0ufsoUOu1khJaP/6/a9dAYPQCY28++3H8CGwqztdgu3NntxDTlQgRgR/516shIZFpA==
X-Received: by 2002:a05:600c:35d3:b0:42c:c401:6d8b with SMTP id 5b1f17b1804b1-4319ac7832dmr131351465e9.7.1730286101965;
        Wed, 30 Oct 2024 04:01:41 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd99edebsm17956935e9.45.2024.10.30.04.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 04:01:41 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alexandre.belloni@bootlin.com,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v5 03/10] clk: renesas: clk-vbattb: Add VBATTB clock driver
Date: Wed, 30 Oct 2024 13:01:13 +0200
Message-Id: <20241030110120.332802-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_040143_595462_9802FA88 
X-CRM114-Status: GOOD (  32.35  )
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The VBATTB IP of the Renesas RZ/G3S SoC controls the clock that is used
by the RTC. The input to the VBATTB could be a 32KHz crystal
or an external clock device.

The HW block diagram for the clock generator is as follows:

           +----------+ XC   `\
RTXIN  --->|          |----->| \       +----+  VBATTCLK
           | 32K clock|      |  |----->|gate|----------->
           | osc      | XBYP |  |      +----+
RTXOUT --->|          |----->| /
           +----------+      ,

After discussions w/ Stephen Boyd the clock tree associated with this
hardware block was exported in Linux as:

vbattb-xtal
   xbyp
   xc
      mux
         vbattbclk

where:
- input-xtal is the input clock (connected to RTXIN, RTXOUT pins)
- xc, xbyp are mux inputs
- mux is the internal mux
- vbattclk is the gate clock that feeds in the end the RTC

to allow selecting the input of the MUX though assigned-clock DT
properties, using the already existing clock drivers and avoid adding
other DT properties. If the crystal is connected on RTXIN,
RTXOUT pins the XC will be selected as mux input. If an external clock
device is connected on RTXIN, RTXOUT pins the XBYP will be selected as
mux input.

The load capacitance of the internal crystal can be configured
with renesas,vbattb-load-nanofarads DT property.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- collected tags

Changes in v4:
- dropped oscillator from patch description
- s/on-board/internal in patch description
- updated dt-binding included file name in the driver as it has been
  renamed to include/dt-bindings/clock/renesas,r9a08g045-vbattb.h
- dropped the "_BIT" from driver macros
- used "quartz-load-femtofarads" dt property instead of adding a new one
- register the "vbattclk" as critical clock as this feeds the RTC counter
  logic and it needs to stay on from the moment the RTC is configured;
  along with it, added a comment to express this.

Changes in v3:
- updated patch description
- dropped dependency on MFD_RENESAS_VBATTB as now there is no
  driver built under this flag
- dropped include/clk.h
- added pm_runtime and reset control support
- updated register offsets
- registered 4 clocks: xc, xbyp, mux, vbattclk using generic
  clock drivers
- added MODULE_DEVICE_TABLE()

Changes in v2:
- updated patch description
- added vendor name in Kconfig flag
- used cleanup.h lock helpers
- dropped the MFD code
- updated registers offsets
- added vbattb_clk_update_bits() and used it where possible
- added vbattb_clk_need_bypass() to detect the bypass setup necessity
- changed the compatible and driver names


 drivers/clk/renesas/Kconfig      |   4 +
 drivers/clk/renesas/Makefile     |   1 +
 drivers/clk/renesas/clk-vbattb.c | 205 +++++++++++++++++++++++++++++++
 3 files changed, 210 insertions(+)
 create mode 100644 drivers/clk/renesas/clk-vbattb.c

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index 76791a1c50ac..4e835a3f1ab4 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -237,6 +237,10 @@ config CLK_RZV2H
 	bool "RZ/V2H(P) family clock support" if COMPILE_TEST
 	select RESET_CONTROLLER
 
+config CLK_RENESAS_VBATTB
+	bool "Renesas VBATTB clock controller"
+	select RESET_CONTROLLER
+
 # Generic
 config CLK_RENESAS_CPG_MSSR
 	bool "CPG/MSSR clock support" if COMPILE_TEST
diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
index 23d2e26051c8..82efaa835ac7 100644
--- a/drivers/clk/renesas/Makefile
+++ b/drivers/clk/renesas/Makefile
@@ -53,3 +53,4 @@ obj-$(CONFIG_CLK_RZV2H)			+= rzv2h-cpg.o
 obj-$(CONFIG_CLK_RENESAS_CPG_MSSR)	+= renesas-cpg-mssr.o
 obj-$(CONFIG_CLK_RENESAS_CPG_MSTP)	+= clk-mstp.o
 obj-$(CONFIG_CLK_RENESAS_DIV6)		+= clk-div6.o
+obj-$(CONFIG_CLK_RENESAS_VBATTB)	+= clk-vbattb.o
diff --git a/drivers/clk/renesas/clk-vbattb.c b/drivers/clk/renesas/clk-vbattb.c
new file mode 100644
index 000000000000..ff9d1ead455c
--- /dev/null
+++ b/drivers/clk/renesas/clk-vbattb.c
@@ -0,0 +1,205 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * VBATTB clock driver
+ *
+ * Copyright (C) 2024 Renesas Electronics Corp.
+ */
+
+#include <linux/cleanup.h>
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/mod_devicetable.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/reset.h>
+
+#include <dt-bindings/clock/renesas,r9a08g045-vbattb.h>
+
+#define VBATTB_BKSCCR			0x1c
+#define VBATTB_BKSCCR_SOSEL		6
+#define VBATTB_SOSCCR2			0x24
+#define VBATTB_SOSCCR2_SOSTP2		0
+#define VBATTB_XOSCCR			0x30
+#define VBATTB_XOSCCR_OUTEN		16
+#define VBATTB_XOSCCR_XSEL		GENMASK(1, 0)
+#define VBATTB_XOSCCR_XSEL_4_PF		0x0
+#define VBATTB_XOSCCR_XSEL_7_PF		0x1
+#define VBATTB_XOSCCR_XSEL_9_PF		0x2
+#define VBATTB_XOSCCR_XSEL_12_5_PF	0x3
+
+/**
+ * struct vbattb_clk - VBATTB clock data structure
+ * @base: base address
+ * @lock: lock
+ */
+struct vbattb_clk {
+	void __iomem *base;
+	spinlock_t lock;
+};
+
+static int vbattb_clk_validate_load_capacitance(u32 *reg_lc, u32 of_lc)
+{
+	switch (of_lc) {
+	case 4000:
+		*reg_lc = VBATTB_XOSCCR_XSEL_4_PF;
+		break;
+	case 7000:
+		*reg_lc = VBATTB_XOSCCR_XSEL_7_PF;
+		break;
+	case 9000:
+		*reg_lc = VBATTB_XOSCCR_XSEL_9_PF;
+		break;
+	case 12500:
+		*reg_lc = VBATTB_XOSCCR_XSEL_12_5_PF;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void vbattb_clk_action(void *data)
+{
+	struct device *dev = data;
+	struct reset_control *rstc = dev_get_drvdata(dev);
+	int ret;
+
+	ret = reset_control_assert(rstc);
+	if (ret)
+		dev_err(dev, "Failed to de-assert reset!");
+
+	ret = pm_runtime_put_sync(dev);
+	if (ret < 0)
+		dev_err(dev, "Failed to runtime suspend!");
+
+	of_clk_del_provider(dev->of_node);
+}
+
+static int vbattb_clk_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct clk_parent_data parent_data = {};
+	struct clk_hw_onecell_data *clk_data;
+	const struct clk_hw *parent_hws[2];
+	struct device *dev = &pdev->dev;
+	struct reset_control *rstc;
+	struct vbattb_clk *vbclk;
+	u32 of_lc, reg_lc;
+	struct clk_hw *hw;
+	/* 4 clocks are exported: VBATTB_XC, VBATTB_XBYP, VBATTB_MUX, VBATTB_VBATTCLK. */
+	u8 num_clks = 4;
+	int ret;
+
+	/* Default to 4pF as this is not needed if external clock device is connected. */
+	of_lc = 4000;
+	of_property_read_u32(np, "quartz-load-femtofarads", &of_lc);
+
+	ret = vbattb_clk_validate_load_capacitance(&reg_lc, of_lc);
+	if (ret)
+		return ret;
+
+	vbclk = devm_kzalloc(dev, sizeof(*vbclk), GFP_KERNEL);
+	if (!vbclk)
+		return -ENOMEM;
+
+	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, num_clks), GFP_KERNEL);
+	if (!clk_data)
+		return -ENOMEM;
+	clk_data->num = num_clks;
+
+	vbclk->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(vbclk->base))
+		return PTR_ERR(vbclk->base);
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
+	rstc = devm_reset_control_get_shared(dev, NULL);
+	if (IS_ERR(rstc))
+		return PTR_ERR(rstc);
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return ret;
+
+	ret = reset_control_deassert(rstc);
+	if (ret) {
+		pm_runtime_put_sync(dev);
+		return ret;
+	}
+
+	dev_set_drvdata(dev, rstc);
+	ret = devm_add_action_or_reset(dev, vbattb_clk_action, dev);
+	if (ret)
+		return ret;
+
+	spin_lock_init(&vbclk->lock);
+
+	parent_data.fw_name = "rtx";
+	hw = devm_clk_hw_register_gate_parent_data(dev, "xc", &parent_data, 0,
+						   vbclk->base + VBATTB_SOSCCR2,
+						   VBATTB_SOSCCR2_SOSTP2,
+						   CLK_GATE_SET_TO_DISABLE, &vbclk->lock);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+	clk_data->hws[VBATTB_XC] = hw;
+
+	hw = devm_clk_hw_register_fixed_factor_fwname(dev, np, "xbyp", "rtx", 0, 1, 1);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+	clk_data->hws[VBATTB_XBYP] = hw;
+
+	parent_hws[0] = clk_data->hws[VBATTB_XC];
+	parent_hws[1] = clk_data->hws[VBATTB_XBYP];
+	hw = devm_clk_hw_register_mux_parent_hws(dev, "mux", parent_hws, 2, 0,
+						 vbclk->base + VBATTB_BKSCCR,
+						 VBATTB_BKSCCR_SOSEL,
+						 1, 0, &vbclk->lock);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+	clk_data->hws[VBATTB_MUX] = hw;
+
+	/* Set load capacitance before registering the VBATTCLK clock. */
+	scoped_guard(spinlock, &vbclk->lock) {
+		u32 val = readl_relaxed(vbclk->base + VBATTB_XOSCCR);
+
+		val &= ~VBATTB_XOSCCR_XSEL;
+		val |= reg_lc;
+		writel_relaxed(val, vbclk->base + VBATTB_XOSCCR);
+	}
+
+	/* This feeds the RTC counter clock and it needs to stay on. */
+	hw = devm_clk_hw_register_gate_parent_hw(dev, "vbattclk", hw, CLK_IS_CRITICAL,
+						 vbclk->base + VBATTB_XOSCCR,
+						 VBATTB_XOSCCR_OUTEN, 0,
+						 &vbclk->lock);
+
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+	clk_data->hws[VBATTB_VBATTCLK] = hw;
+
+	return of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_data);
+}
+
+static const struct of_device_id vbattb_clk_match[] = {
+	{ .compatible = "renesas,r9a08g045-vbattb" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, vbattb_clk_match);
+
+static struct platform_driver vbattb_clk_driver = {
+	.driver		= {
+		.name	= "renesas-vbattb-clk",
+		.of_match_table = vbattb_clk_match,
+	},
+	.probe = vbattb_clk_probe,
+};
+module_platform_driver(vbattb_clk_driver);
+
+MODULE_DESCRIPTION("Renesas VBATTB Clock Driver");
+MODULE_AUTHOR("Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>");
+MODULE_LICENSE("GPL");
-- 
2.39.2


