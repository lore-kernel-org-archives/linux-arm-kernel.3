Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6F9C55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 15:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gP94Acq26/NUphi6CKuuHTjPRCwi+cKGUmfJz5x1v7g=; b=jHG2es6weQja9GhYT9RJ01IxAV
	c+AzQSXGNrK4yNUZUZKpyyHhGXZcFmAT9wt5N1AytrVtV3IxeFzrNLe4W3ZQXlYJjAn61131ZNqUD
	RbxI7HRAMvntoPwPKovYDS+3MNDr54ARDNAa3ahm9rrX9aQKODnrslwcdI1p68cm76iX50HsXSnD/
	SjLP27reRjKd/O2tilVLclxVMT5JEQrKSkm7NEIzBMj69C5YbhgYAj8caRgniQCYCW37IM354FvbT
	76CcA60eUpOMg43MLElplDC4O4cR/LVwHfAZaLaHcD6jyhALpmKjmKTkLwZno00O/NTJMhSsQTCqW
	P4EED5kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrdQk-00000004ATy-3plu;
	Wed, 05 Aug 2026 15:21:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrdQj-00000004AT9-3j8g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 15:21:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 500DD60A5A;
	Wed,  5 Aug 2026 15:21:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 756421F00A3A;
	Wed,  5 Aug 2026 15:21:13 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 3/6] clk: renesas: Add R-Car X5H CPG driver
Date: Wed,  5 Aug 2026 17:20:51 +0200
Message-ID: <3f981753722de1ba871667be63460e89d299d635.1785941595.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785941595.git.geert+renesas@glider.be>
References: <cover.1785941595.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Add a minimal Clock Pulse Generator driver for the R-Car X5H (R8A78000)
SoC.  For now this supports just the few fixed-rate clocks that are
needed by the current minimal DTS.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - Add fixed-rate clocks to kerneldoc of r8a78000_cpg_priv.map,
  - Use devm_clk_hw_register_fixed_rate(), drop unregister_fixed_clks(),
  - Drop fill_clk_map(), as it is not really needed until SCMI remapping
    support is added later,
  - Replace <linux/mod_devicetable.h> by more specific
    <linux/device-id/of.h> in v7.2-rc2,

v2:
  - Spin off from "clk: renesas: Add R-Car X5H CPG SCMI remapping
    driver",
  - Add default support not using SCMI,
  - Drop all SCMI remapping support,
  - Document use of -1 as a sentinel,
  - Document use of FIXED_CLK() IDs.
---
 drivers/clk/renesas/Kconfig        |   4 +
 drivers/clk/renesas/Makefile       |   1 +
 drivers/clk/renesas/r8a78000-cpg.c | 166 +++++++++++++++++++++++++++++
 3 files changed, 171 insertions(+)
 create mode 100644 drivers/clk/renesas/r8a78000-cpg.c

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index 0203ecbb38825f13..f0482bdfc4616cfa 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -34,6 +34,7 @@ config CLK_RENESAS
 	select CLK_R8A779F0 if ARCH_R8A779F0
 	select CLK_R8A779G0 if ARCH_R8A779G0
 	select CLK_R8A779H0 if ARCH_R8A779H0
+	select CLK_R8A78000 if ARCH_R8A78000
 	select CLK_R9A06G032 if ARCH_R9A06G032
 	select CLK_R9A07G043 if ARCH_R9A07G043
 	select CLK_R9A07G044 if ARCH_R9A07G044
@@ -176,6 +177,9 @@ config CLK_R8A779H0
 	bool "R-Car V4M clock support" if COMPILE_TEST
 	select CLK_RCAR_GEN4_CPG
 
+config CLK_R8A78000
+	bool "R-Car X5H clock support" if COMPILE_TEST
+
 config CLK_R9A06G032
 	bool "RZ/N1D clock support" if COMPILE_TEST
 
diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
index bd2bed91ab291d72..4f76f8c402ffe9a3 100644
--- a/drivers/clk/renesas/Makefile
+++ b/drivers/clk/renesas/Makefile
@@ -31,6 +31,7 @@ obj-$(CONFIG_CLK_R8A779A0)		+= r8a779a0-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A779F0)		+= r8a779f0-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A779G0)		+= r8a779g0-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A779H0)		+= r8a779h0-cpg-mssr.o
+obj-$(CONFIG_CLK_R8A78000)		+= r8a78000-cpg.o
 obj-$(CONFIG_CLK_R9A06G032)		+= r9a06g032-clocks.o
 obj-$(CONFIG_CLK_R9A07G043)		+= r9a07g043-cpg.o
 obj-$(CONFIG_CLK_R9A07G044)		+= r9a07g044-cpg.o
diff --git a/drivers/clk/renesas/r8a78000-cpg.c b/drivers/clk/renesas/r8a78000-cpg.c
new file mode 100644
index 0000000000000000..7946f9d0b423def1
--- /dev/null
+++ b/drivers/clk/renesas/r8a78000-cpg.c
@@ -0,0 +1,166 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * R-Car X5H Clock Pulse Generator
+ *
+ * Copyright (C) 2026 Glider bv
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/dev_printk.h>
+#include <linux/device-id/of.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#include <dt-bindings/clock/renesas,r8a78000-cpg.h>
+
+struct clk_map {
+	int dt_id;		/* DT binding clock ID or -1 sentinel */
+	u32 fw_id;		/* FIXED_CLK() ID */
+};
+
+enum fixed_clk {
+	FIXED_CLK_66M,
+	FIXED_CLK_266M,
+	NUM_FIXED_CLKS
+};
+
+static const unsigned long fixed_clk_rates[NUM_FIXED_CLKS] = {
+	[FIXED_CLK_66M] = 66666000,
+	[FIXED_CLK_266M] = 266660000,
+};
+
+#define FIXED_CLK(rate)		FIXED_CLK_ ## rate
+
+/**
+ * struct r8a78000_cpg_priv - Clock Pulse Generator Private Data
+ *
+ * @dev: CPG device
+ * @map: Mapping from DT clock IDs to fixed-rate clocks
+ * @fixed_hws: Fixed rate clocks
+ */
+struct r8a78000_cpg_priv {
+	struct device *dev;
+	const struct clk_map *map;
+	struct clk_hw *fixed_hws[NUM_FIXED_CLKS];
+};
+
+static const struct clk_map *clk_map_find(const struct clk_map *map, u32 id)
+{
+	if (!map)
+		return NULL;
+
+	for (; map->dt_id >= 0; map++) {
+		if (map->dt_id == id)
+			return map;
+	}
+
+	return NULL;
+}
+
+static struct clk_hw *r8a78000_clk_get(struct of_phandle_args *spec,
+				      void *data)
+{
+	struct r8a78000_cpg_priv *priv = data;
+	struct device *dev = priv->dev;
+	const struct clk_map *map;
+	struct clk_hw *hw;
+	u32 id;
+
+	if (spec->args_count != 1)
+		return ERR_PTR(-EINVAL);
+
+	id = spec->args[0];
+
+	map = clk_map_find(priv->map, id);
+	if (!map) {
+		dev_err(dev, "Unknown clock %u\n", id);
+		return ERR_PTR(-ENOENT);
+	}
+
+	dev_dbg(dev, "Mapping DT clock %u to fixed clock %u\n", id, map->fw_id);
+
+	hw = priv->fixed_hws[map->fw_id];
+
+	dev_dbg(dev, "clock %u is %s at %lu Hz\n", id, clk_hw_get_name(hw),
+		clk_hw_get_rate(hw));
+
+	return hw;
+}
+
+static int register_fixed_clks(struct r8a78000_cpg_priv *priv)
+{
+	struct device *dev = priv->dev;
+	unsigned long rate;
+	struct clk_hw *hw;
+	const char *name;
+
+	for (unsigned int i = 0; i < ARRAY_SIZE(fixed_clk_rates); i++) {
+		rate = fixed_clk_rates[i];
+		name = devm_kasprintf(dev, GFP_KERNEL, "cpg-%lu", rate);
+		if (!name)
+			return -ENOMEM;
+
+		hw = devm_clk_hw_register_fixed_rate(dev, name, NULL, 0, rate);
+		if (IS_ERR(hw))
+			return PTR_ERR(hw);
+
+		priv->fixed_hws[i] = hw;
+	}
+
+	return 0;
+}
+
+static int r8a78000_cpg_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct r8a78000_cpg_priv *priv;
+	const struct clk_map *map;
+	int ret;
+
+	map = of_device_get_match_data(dev);
+	if (!map)
+		return -ENODEV;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = dev;
+	priv->map = map;
+
+	ret = register_fixed_clks(priv);
+	if (ret)
+		return ret;
+
+	return devm_of_clk_add_hw_provider(dev, r8a78000_clk_get, priv);
+}
+
+static const struct clk_map r8a78000_cpg_default[] = {
+	{ R8A78000_CPG_SGASYNCD4_PERW_BUS,	FIXED_CLK(266M) },
+	{ R8A78000_CPG_SGASYNCD16_PERW_BUS,	FIXED_CLK(66M) },
+	{ -1 }
+};
+
+static const struct of_device_id r8a78000_cpg_match[] = {
+	{
+		.compatible = "renesas,r8a78000-cpg",
+		.data = &r8a78000_cpg_default,
+	},
+	{ /* sentinel */ }
+};
+
+static struct platform_driver r8a78000_cpg_driver = {
+	.probe = r8a78000_cpg_probe,
+	.driver = {
+		.name = "r8a78000-cpg",
+		.of_match_table = r8a78000_cpg_match,
+		.suppress_bind_attrs = true,
+	},
+};
+
+builtin_platform_driver(r8a78000_cpg_driver)
+
+MODULE_DESCRIPTION("R-Car X5H CPG Driver");
-- 
2.43.0


