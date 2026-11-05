Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54964606EE82
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FiAAQhqO;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SMRnEtbN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3HowhnkH9/yh2Hkezd1sZo6YDXVK8OfDpdi/Ule/gx0=; b=FiAAQhqOCI8lmm6EfD8qbLx8ko
	SWE46ifRKktXo6z7wlZyJ+GJNa06FPDhF8CXLVPW2PS+QzKa6G9QEGQgLNEWugMAeFGWO78rtEEJv
	ay8Xv6uWqo5FRVfMrP3YA4M+lBr2mqowLsRYvhcUZloL6S+tneafUiUZRtAvVjhtQUO5q4aGK8e5v
	M0fLwqXOV39VHN7vcW4hRKvJ3pcs0qA3Gj1rD3tUG0ojoDc7jTG129/YR5ymf9JZjeGgLM+nFJWG2
	WErvbRpiE7Bf0R7Pz0gEHO6bS9PVHOXk9lgUKB1BPYoFGXV4y1nCOLnJUuAK2Euy8TpmtS+1feeWR
	pnBLpUTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvJO-00000008ZPe-1JY8;
	Thu, 05 Nov 2026 11:07:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvJF-00000008ZKK-0IzT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 11:07:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 754E060F0B;
	Thu,  5 Nov 2026 11:07:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793876828;
	b=J5kMPOl0jNuUZSBBYxpQLPC+VnQfCsv2ZGheuQjjq5x6WKXU8R5rWBmoktM4QuLtvoqM
	 BazC21Hi5deSxCSkRo1y1gAo+XgpOB3RyVpnwp0cIZfdsk7kjJtsdDLZfEJ2qrLcNOHmP
	 dtqOiAUG9jmATHEblPODqPgwVYU80xYPzzT61Iz2x7ao5tKoMiMQx4PzUvi/0bdJXuKOd
	 RsYyxJGTFz3CgCBx+JqFdVkwgUWp5YzQK8V3APrBdXjnHVQqBlwBMriJtEhl8gj7sr9Mq
	 8bOF/a+rhK4lAx8RmxymHyRoaWBbzksr8cmic9MpFo7VzdlyxJvS3ho7JvR+mhQADIA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793876828;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=3HowhnkH9/yh2Hkezd1sZo6YDXVK8OfDpdi/Ule/gx0=;
	b=FoTFSYF2iV+HmbmLin2695hUgmjftJtjOyJZOCL8sWOFso8nbKLScEv8QVhPsMAm6IBr
	 +c4FnRSP4y0yusN9q/G/omoYtpWsGdan0HGLoW7YExosU0BNIhMOJgpXMyHSNZgkC2C56
	 T7HsemQRnhwdhCfMGMsRa+JNNISAEr9i635BgGMVdS70OToLhy82Cw7rmNUdIL+Vw61mU
	 WYGkqKDil3tiTbuwhc8dcYfLSTNcCx6ahJ4XM54fl4EZVB+cSim/lwTq0BW9A4fsnUfyM
	 Da8QhTJA+RUikVn8XNO6II4St8GgUbCqJNVbtfBADzApTmAhR73/X27WyD25t8twoZQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D7FE31F000C1;
	Thu,  5 Nov 2026 11:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793876828;
	bh=3HowhnkH9/yh2Hkezd1sZo6YDXVK8OfDpdi/Ule/gx0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=SMRnEtbNu+uhhJ3JuNx7YaB9hUTCL+Gg9I8hsN8DHHfi9tL4xhKqq6dM8HdkpOdEg
	 SYCvrc1Om+aPfAXDM6hxlbfpTNFMgEMZKqOBi1PX6pwhH6d9xZyFpW4bzEwndZVTco
	 ugiuUUS8tRB50qFm6K0ppZqhVNmFlBo9hbPbWocIjjphHJf3eIDZzh4Y9+dzXS+Eag
	 LUwLBLz1wfmjTVISqu9Y1HGHnae8t9QhmKLmI9G4zd+ftfwIiSrLPsDfyg1HLtLcU1
	 6s3eY169m6dBierF4/98JFb5ER/gaiKNiRJSzy93z5XqQwvcwUAB5BuytzxOxZcoXo
	 pIPdXW/vFOJOw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 63FF94720B;
	Thu,  5 Nov 2026 11:07:05 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Thu, 05 Nov 2026 19:06:37 +0800
Subject: [PATCH v11 3/5] clk: ambarella: add CV75 RCT clock controller
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261105-cv75-soc-v11-3-aa6ee0b2380d@ambarella.com>
References: <20261105-cv75-soc-v11-0-aa6ee0b2380d@ambarella.com>
In-Reply-To: <20261105-cv75-soc-v11-0-aa6ee0b2380d@ambarella.com>
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org, 
 Brian Masney <masneyb@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 devicetree@vger.kernel.org, Long Zhao <longzhao@ambarella.com>, 
 Long Zhao <zl020895@163.com>, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793876823; l=12170;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=olfUTqL0qfyKHGlvP+Zm0Fq0/6JP6mdcJ3lXaZD8kWM=;
 b=umiLef7K36j/olukAgmjW7+9h7XtRwNgrQCVqtjrvs0a63bmYlhFjBggtPEBL04tnGSL/ldO1
 O4S3M6oQbjPCq+fk/9w8gkNCHJowtvJwKjJ3UgDzSfaBeLxdUzrpyFM
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: longzhao@ambarella.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Long Zhao <longzhao@ambarella.com>

Add a table-driven CCF driver for the CV75 root clock tree. Register
the core PLL, AHB/APB fixed factors and UART0 composite clock, with
osc supplied via clk_parent_data.

Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 drivers/clk/Kconfig              |   1 +
 drivers/clk/Makefile             |   1 +
 drivers/clk/ambarella/Kconfig    |   8 +
 drivers/clk/ambarella/Makefile   |   3 +
 drivers/clk/ambarella/clk-cv75.c | 361 +++++++++++++++++++++++++++++++++++++++
 5 files changed, 374 insertions(+)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 1717ce75a907..fbbf4963716c 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -506,6 +506,7 @@ config COMMON_CLK_RPMI
 	  the RISC-V platform management interface (RPMI) specification.
 
 source "drivers/clk/actions/Kconfig"
+source "drivers/clk/ambarella/Kconfig"
 source "drivers/clk/analogbits/Kconfig"
 source "drivers/clk/aspeed/Kconfig"
 source "drivers/clk/bcm/Kconfig"
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index cc108a75a900..30d823ee606f 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -112,6 +112,7 @@ obj-$(CONFIG_COMMON_CLK_XGENE)		+= clk-xgene.o
 
 # please keep this section sorted lexicographically by directory path name
 obj-y					+= actions/
+obj-y					+= ambarella/
 obj-y					+= analogbits/
 obj-y					+= aspeed/
 obj-$(CONFIG_COMMON_CLK_AT91)		+= at91/
diff --git a/drivers/clk/ambarella/Kconfig b/drivers/clk/ambarella/Kconfig
new file mode 100644
index 000000000000..fb1d91a2954c
--- /dev/null
+++ b/drivers/clk/ambarella/Kconfig
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config CLK_AMBARELLA_CV75
+	bool "Ambarella CV75 RCT clock controller"
+	depends on ARCH_AMBARELLA || COMPILE_TEST
+	default ARCH_AMBARELLA
+	help
+	  Say Y here to enable the Ambarella CV75 RCT clock controller.
diff --git a/drivers/clk/ambarella/Makefile b/drivers/clk/ambarella/Makefile
new file mode 100644
index 000000000000..29555e452441
--- /dev/null
+++ b/drivers/clk/ambarella/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_CLK_AMBARELLA_CV75) += clk-cv75.o
diff --git a/drivers/clk/ambarella/clk-cv75.c b/drivers/clk/ambarella/clk-cv75.c
new file mode 100644
index 000000000000..c23c60c4fd6f
--- /dev/null
+++ b/drivers/clk/ambarella/clk-cv75.c
@@ -0,0 +1,361 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Ambarella CV75 RCT clock controller
+ *
+ * Copyright (C) 2026 Ambarella, Inc.
+ */
+
+#include <linux/array_size.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/clk-provider.h>
+#include <linux/container_of.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/math64.h>
+#include <linux/module.h>
+#include <linux/overflow.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+
+#include <dt-bindings/clock/ambarella,cv75-rct.h>
+
+#define CV75_NUM_CLKS		(CV75_GCLK_APB + 1)
+
+#define PLL_CTRL_BYPASS		BIT(2)
+#define PLL_CTRL_FRAC_MODE	BIT(3)
+#define PLL_CTRL_FORCE_RESET	BIT(4)
+#define PLL_CTRL_POWER_DOWN	BIT(5)
+#define PLL_CTRL_HALT_VCO	BIT(6)
+#define PLL_CTRL_SDIV		GENMASK(15, 12)
+#define PLL_CTRL_SOUT		GENMASK(19, 16)
+#define PLL_CTRL_INTP		GENMASK(30, 24)
+
+#define PLL_CTRL2_VCODIV_DIV2	BIT(8)
+#define PLL_CTRL2_FSDIV_DIV2	BIT(9)
+#define PLL_CTRL2_FSOUT_DIV2	BIT(11)
+#define PLL_CTRL2_BYPASS_HSDIV	BIT(12)
+
+struct cv75_pll_regs {
+	u32 ctrl;
+	u32 frac;
+	u32 ctrl2;
+};
+
+struct cv75_pll_hw {
+	struct clk_hw hw;
+	struct cv75_pll_regs regs;
+};
+
+struct cv75_clk {
+	void __iomem *base;
+	spinlock_t lock;
+	struct cv75_pll_hw core;
+	struct cv75_pll_hw enet;
+	struct cv75_pll_hw sd;
+};
+
+struct cv75_pll {
+	const char *name;
+	struct cv75_pll_hw *hw;
+	unsigned long flags;
+	struct cv75_pll_regs regs;
+	int id;
+};
+
+struct cv75_fixed_factor {
+	const char *name;
+	u32 id;
+	struct u16_fract ratio;
+};
+
+struct cv75_composite {
+	const char *name;
+	const struct clk_parent_data *parents;
+	unsigned long flags;
+	u32 id;
+	u16 mux_reg;
+	u16 div_reg;
+	u8 num_parents;
+	u8 mux_shift;
+	u8 mux_width;
+	u8 div_shift;
+	u8 div_width;
+};
+
+struct cv75_composite_hw {
+	struct clk_mux mux;
+	struct clk_divider div;
+	struct clk_gate gate;
+};
+
+static struct cv75_clk cv75_ccu;
+
+#define CV75_PLL(_id, _name, _ctrl, _frac, _ctrl2, _flags, _hw) {	\
+	.name	= _name,						\
+	.hw	= _hw,							\
+	.flags	= _flags,						\
+	.regs	= {							\
+		.ctrl = _ctrl,						\
+		.frac = _frac,						\
+		.ctrl2 = _ctrl2,					\
+	},								\
+	.id	= _id,							\
+}
+
+static const struct cv75_pll cv75_plls[] = {
+	CV75_PLL(CV75_GCLK_CORE, "core", 0x000, 0x004, 0x100,
+		 0, &cv75_ccu.core),
+	CV75_PLL(-1, "pll_enet", 0x520, 0x524, 0x528,
+		 0, &cv75_ccu.enet),
+	CV75_PLL(-1, "pll_sd", 0x4ac, 0x4b0, 0x4b4,
+		 0, &cv75_ccu.sd),
+};
+
+static const struct cv75_fixed_factor cv75_fixed_factors[] = {
+	{ .id = CV75_GCLK_AHB, .name = "ahb", .ratio = { 1, 2 } },
+	{ .id = CV75_GCLK_APB, .name = "apb", .ratio = { 1, 4 } },
+};
+
+static const struct clk_parent_data cv75_uart_parents[] = {
+	{ .fw_name = "osc" },
+	{ .hw = &cv75_ccu.core.hw },
+	{ .hw = &cv75_ccu.enet.hw },
+	{ .hw = &cv75_ccu.sd.hw },
+};
+
+#define CV75_COMPOSITE(_id, _name, _parents, _mreg, _mshift, _mwidth,	\
+		       _dreg, _dshift, _dwidth, _flags)			\
+{									\
+	.id		= _id,						\
+	.name		= _name,					\
+	.parents	= _parents,					\
+	.num_parents	= ARRAY_SIZE(_parents),				\
+	.mux_reg	= _mreg,					\
+	.mux_shift	= _mshift,					\
+	.mux_width	= _mwidth,					\
+	.div_reg	= _dreg,					\
+	.div_shift	= _dshift,					\
+	.div_width	= _dwidth,					\
+	.flags		= _flags,					\
+}
+
+static const struct cv75_composite cv75_composites[] = {
+	CV75_COMPOSITE(CV75_GCLK_UART0, "uart0", cv75_uart_parents,
+		       0x1c8, 0, 2, 0x038, 0, 24,
+		       CLK_SET_RATE_NO_REPARENT),
+};
+
+#define to_cv75_pll(_hw) container_of(_hw, struct cv75_pll_hw, hw)
+
+static unsigned long cv75_pll_recalc_rate(struct clk_hw *hw,
+					  unsigned long parent_rate)
+{
+	struct cv75_pll_hw *pll = to_cv75_pll(hw);
+	u32 ctrl, ctrl2, frac_val;
+	u32 vcodiv, fsdiv, fsout;
+	u32 intp, sdiv, sout;
+	u64 vco, frac = 0;
+
+	ctrl = readl_relaxed(cv75_ccu.base + pll->regs.ctrl);
+	if (ctrl & (PLL_CTRL_POWER_DOWN | PLL_CTRL_HALT_VCO | PLL_CTRL_FORCE_RESET))
+		return 0;
+
+	if (ctrl & PLL_CTRL_BYPASS)
+		return parent_rate;
+
+	ctrl2 = readl_relaxed(cv75_ccu.base + pll->regs.ctrl2);
+	intp = FIELD_GET(PLL_CTRL_INTP, ctrl) + 1;
+	sdiv = FIELD_GET(PLL_CTRL_SDIV, ctrl) + 1;
+	sout = FIELD_GET(PLL_CTRL_SOUT, ctrl) + 1;
+	vcodiv = (ctrl2 & PLL_CTRL2_VCODIV_DIV2) ? 2 : 1;
+	fsdiv = (ctrl2 & PLL_CTRL2_FSDIV_DIV2) ? 2 : 1;
+	fsout = (ctrl2 & PLL_CTRL2_FSOUT_DIV2) ? 2 : 1;
+
+	vco = (u64)parent_rate * vcodiv * fsdiv * intp * sdiv;
+	if (ctrl & PLL_CTRL_FRAC_MODE) {
+		frac_val = readl_relaxed(cv75_ccu.base + pll->regs.frac);
+		frac = mul_u64_u32_shr((u64)parent_rate * vcodiv * fsdiv * sdiv,
+				       frac_val, 32);
+		vco += frac;
+	}
+
+	if (!(ctrl2 & PLL_CTRL2_BYPASS_HSDIV))
+		vco = div_u64(vco, vcodiv * fsout * sout);
+
+	return vco;
+}
+
+static const struct clk_ops cv75_pll_ops = {
+	.recalc_rate = cv75_pll_recalc_rate,
+};
+
+static int cv75_register_plls(struct device *dev,
+			      struct clk_hw_onecell_data *data)
+{
+	struct clk_parent_data parent_data = { .fw_name = "osc" };
+
+	for (unsigned int i = 0; i < ARRAY_SIZE(cv75_plls); i++) {
+		const struct cv75_pll *desc = &cv75_plls[i];
+		struct cv75_pll_hw *pll = desc->hw;
+		struct clk_init_data init = {};
+		int ret;
+
+		pll->regs = desc->regs;
+
+		init.name = desc->name;
+		init.ops = &cv75_pll_ops;
+		init.parent_data = &parent_data;
+		init.num_parents = 1;
+		init.flags = desc->flags;
+		pll->hw.init = &init;
+
+		ret = devm_clk_hw_register(dev, &pll->hw);
+		if (ret)
+			return ret;
+
+		if (desc->id >= 0)
+			data->hws[desc->id] = &pll->hw;
+	}
+
+	return 0;
+}
+
+static int cv75_register_fixed_factors(struct device *dev,
+				       struct clk_hw_onecell_data *data)
+{
+	for (unsigned int i = 0; i < ARRAY_SIZE(cv75_fixed_factors); i++) {
+		const struct cv75_fixed_factor *f = &cv75_fixed_factors[i];
+		struct clk_hw *hw;
+
+		hw = devm_clk_hw_register_fixed_factor_parent_hw(dev, f->name,
+								 &cv75_ccu.core.hw, 0,
+								 f->ratio.numerator,
+								 f->ratio.denominator);
+		if (IS_ERR(hw))
+			return PTR_ERR(hw);
+
+		data->hws[f->id] = hw;
+	}
+
+	return 0;
+}
+
+static struct clk_hw *cv75_register_composite(struct device *dev,
+					      const struct cv75_composite *c)
+{
+	const struct clk_ops *mux_ops = NULL, *div_ops = NULL, *gate_ops = NULL;
+	struct clk_hw *mux_hw = NULL, *div_hw = NULL, *gate_hw = NULL;
+	struct cv75_composite_hw *comp;
+
+	comp = devm_kzalloc(dev, sizeof(*comp), GFP_KERNEL);
+	if (!comp)
+		return ERR_PTR(-ENOMEM);
+
+	if (c->mux_width) {
+		comp->mux.reg = cv75_ccu.base + c->mux_reg;
+		comp->mux.shift = c->mux_shift;
+		comp->mux.mask = GENMASK(c->mux_width - 1, 0);
+		comp->mux.lock = &cv75_ccu.lock;
+		mux_hw = &comp->mux.hw;
+		mux_ops = &clk_mux_ops;
+	}
+
+	if (c->div_width) {
+		comp->div.reg = cv75_ccu.base + c->div_reg;
+		comp->div.shift = c->div_shift;
+		comp->div.width = c->div_width;
+		comp->div.flags = CLK_DIVIDER_ONE_BASED;
+		comp->div.lock = &cv75_ccu.lock;
+		div_hw = &comp->div.hw;
+		div_ops = &clk_divider_ops;
+
+		comp->gate.reg = cv75_ccu.base + c->div_reg;
+		comp->gate.bit_idx = c->div_shift + c->div_width;
+		comp->gate.flags = CLK_GATE_SET_TO_DISABLE;
+		comp->gate.lock = &cv75_ccu.lock;
+		gate_hw = &comp->gate.hw;
+		gate_ops = &clk_gate_ops;
+	}
+
+	return devm_clk_hw_register_composite_pdata(dev, c->name, c->parents,
+						    c->num_parents,
+						    mux_hw, mux_ops,
+						    div_hw, div_ops,
+						    gate_hw, gate_ops, c->flags);
+}
+
+static int cv75_register_composites(struct device *dev,
+				    struct clk_hw_onecell_data *data)
+{
+	for (unsigned int i = 0; i < ARRAY_SIZE(cv75_composites); i++) {
+		const struct cv75_composite *c = &cv75_composites[i];
+		struct clk_hw *hw;
+
+		hw = cv75_register_composite(dev, c);
+		if (IS_ERR(hw))
+			return PTR_ERR(hw);
+
+		data->hws[c->id] = hw;
+	}
+
+	return 0;
+}
+
+static int cv75_rct_probe(struct platform_device *pdev)
+{
+	struct clk_hw_onecell_data *data;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	cv75_ccu.base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(cv75_ccu.base))
+		return PTR_ERR(cv75_ccu.base);
+
+	data = devm_kzalloc(dev, struct_size(data, hws, CV75_NUM_CLKS), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+	data->num = CV75_NUM_CLKS;
+
+	spin_lock_init(&cv75_ccu.lock);
+
+	ret = cv75_register_plls(dev, data);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register plls\n");
+
+	ret = cv75_register_fixed_factors(dev, data);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register fixed factors\n");
+
+	ret = cv75_register_composites(dev, data);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register composites\n");
+
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, data);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add clock provider\n");
+
+	return 0;
+}
+
+static const struct of_device_id cv75_rct_match[] = {
+	{ .compatible = "ambarella,cv75-rct" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, cv75_rct_match);
+
+static struct platform_driver cv75_rct_driver = {
+	.probe = cv75_rct_probe,
+	.driver = {
+		.name = "ambarella-cv75-rct",
+		.of_match_table = cv75_rct_match,
+		.suppress_bind_attrs = true,
+	},
+};
+builtin_platform_driver(cv75_rct_driver);
+
+MODULE_DESCRIPTION("Ambarella CV75 RCT clock controller");
+MODULE_LICENSE("GPL");

-- 
2.34.1



