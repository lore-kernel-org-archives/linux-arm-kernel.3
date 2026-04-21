Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE3CF94CA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 18:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0JHyUy5md4BcwUxsdT/wH6YR0Epcdfhoyhm8tX8spc0=; b=SPrIETH/33hStpRgyZiKIDVNlS
	zRO6qmyvuKm2FXYSM/c2XgorDpaa2sWRF9WTt8pCXefy+PuIdEgeN2va55IrVoHrK64PINfRhIt39
	RKgzewWTs/ax0LyNcpZpvf4lXTUQkeVL//znlMK9ep/fd/+oC2ypJ/aaVpkkh07w3aSpq+2NeKs5a
	iiEuAv8jWFQVYIi1ibMWAU30RJngqWAxNmH5m5U33FMxb65CUr+NudkEtoCb7HEpEuCe0S7o74cJr
	4flzbVQoIrwt8hCNautOaVjiuU1swpT32Y90kUAYOoeoOCrTx8UJMg7o55jrSVmdtkkOMZy5a3pgJ
	jxbF16eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFFai-000000091Cj-13lE;
	Tue, 21 Apr 2026 18:12:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFFag-000000091BP-2DBF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 18:12:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BBB5560582;
	Tue, 21 Apr 2026 18:12:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAD1BC2BCB0;
	Tue, 21 Apr 2026 18:12:48 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Ulf Hansson <ulfh@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 11/14] clk: renesas: Add R-Car X5H CPG SCMI remapping driver
Date: Tue, 21 Apr 2026 20:11:44 +0200
Message-ID: <e30eecc4219fa940f6baa5ebd80cf7d1cfeb08f5.1776793163.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1776793163.git.geert+renesas@glider.be>
References: <cover.1776793163.git.geert+renesas@glider.be>
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

Add a proof-of-concept Clock Pulse Generator driver for the R-Car X5H
(R8A78000) SoC, using tables to remap from hardware clock IDs to SCMI
clock IDs.

Some SCMI clocks do not support the SCMI CLOCK_ATTRIBUTES command, and
are thus not usable from Linux.  Register a bunch of fixed-rate clocks,
and use them as replacements for SCMI clocks that are known to be
unusable.

For now this contains preliminary support for SCP FW SDKv4.28.0,
v4.31.0, and v4.32.0.  As SCMI clock IDs are identical for SDKv4.31.0
and v4.32.0, r8a78000_cpg_fw_4_31_0[] applies to both of them.

Suggested-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/Kconfig        |   4 +
 drivers/clk/renesas/Makefile       |   1 +
 drivers/clk/renesas/r8a78000-cpg.c | 335 +++++++++++++++++++++++++++++
 3 files changed, 340 insertions(+)
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
index 0000000000000000..844d909bbee2adbb
--- /dev/null
+++ b/drivers/clk/renesas/r8a78000-cpg.c
@@ -0,0 +1,335 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * R-Car X5H Clock Pulse Generator
+ *
+ * Copyright (C) 2026 Glider bv
+ */
+
+#include <linux/cleanup.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/dev_printk.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/scmi_protocol.h>
+#include <linux/slab.h>
+
+#include <dt-bindings/clock/renesas,r8a78000-cpg.h>
+
+struct clk_map_in {
+	int dt_id;		/* DT binding clock ID */
+	u32 fw_id;		/* SCMI firmware clock ID */
+};
+
+struct clk_map {
+	int dt_id;		/* DT binding clock ID */
+	u32 fw_id;		/* SCMI firmware clock ID */
+	struct clk_hw *hw;
+};
+
+struct fw_map {
+	u32 impl_ver;
+	const struct clk_map_in *map;
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
+#define FIXED_CLK_OFFSET	0x80000000
+#define FIXED_CLK(rate)		FIXED_CLK_OFFSET + FIXED_CLK_ ## rate
+
+/**
+ * struct r8a78000_cpg_priv - Clock Pulse Generator Private Data
+ *
+ * @dev: CPG device
+ * @scmi_clk_np: Device node in DT for the SCMI firmware clock protocol
+ * @map: Mapping from DT clock IDs to SCMI clocks
+ * @fixed_hws: Fixed rate clocks used to replace SCMI clocks that do not
+ *             support the SCMI CLOCK_ATTRIBUTES command
+ */
+struct r8a78000_cpg_priv {
+	struct device *dev;
+	struct device_node *scmi_clk_np;
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
+	if (map->fw_id < FIXED_CLK_OFFSET)
+		dev_dbg(dev, "Mapping DT clock %u to SCMI clock %u\n", id,
+			map->fw_id);
+	else
+		dev_dbg(dev, "Mapping DT clock %u to fixed clock %u\n", id,
+			 map->fw_id - FIXED_CLK_OFFSET);
+
+	hw = map->hw;
+	if (!hw) {
+		/* CLOCK_ATTRIBUTES is not supported */
+		dev_err(dev, "Clock %u is not available\n", id);
+		return ERR_PTR(-ENOENT);
+	}
+
+	dev_dbg(dev, "clock %u is %s at %lu Hz\n", id, clk_hw_get_name(hw),
+		clk_hw_get_rate(hw));
+
+	return hw;
+}
+
+static struct device_node *scmi_find_proto(struct device_node *scmi, u32 proto)
+{
+	for_each_available_child_of_node_scoped(scmi, child) {
+		u32 reg;
+
+		if (of_property_read_u32(child, "reg", &reg))
+			continue;
+
+		if (reg == proto)
+			return_ptr(child);
+	}
+
+	return NULL;
+}
+
+static void unregister_fixed_clks(void *data)
+{
+	struct r8a78000_cpg_priv *priv = data;
+
+	for (unsigned int i = 0; i < ARRAY_SIZE(priv->fixed_hws); i++)
+		clk_hw_unregister_fixed_rate(priv->fixed_hws[i]);
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
+		hw = clk_hw_register_fixed_rate(dev, name, NULL, 0, rate);
+		if (IS_ERR(hw)) {
+			while (i-- > 0)
+				clk_hw_unregister_fixed_rate(priv->fixed_hws[i]);
+			return PTR_ERR(hw);
+		}
+
+		priv->fixed_hws[i] = hw;
+	}
+
+	return devm_add_action_or_reset(dev, unregister_fixed_clks, priv);
+}
+
+static const struct clk_map *fill_clk_map(struct r8a78000_cpg_priv *priv,
+					  const struct clk_map_in *map_in)
+{
+	struct of_phandle_args scmi_spec;
+	struct device *dev = priv->dev;
+	struct clk_map *map;
+	struct clk_hw *hw;
+	struct clk *clk;
+	unsigned int i;
+
+	for (i = 0; map_in[i].dt_id >= 0; i++) { }
+
+	map = devm_kcalloc(dev, i + 1, sizeof(*map), GFP_KERNEL);
+	if (!map)
+		return ERR_PTR(-ENOMEM);
+
+	for (i = 0; ; i++) {
+		map[i].dt_id = map_in[i].dt_id;
+		if (map[i].dt_id < 0)
+			break;
+
+		map[i].fw_id = map_in[i].fw_id;
+		if (map[i].fw_id >= FIXED_CLK_OFFSET) {
+			enum fixed_clk idx = map[i].fw_id - FIXED_CLK_OFFSET;
+
+			map[i].hw = priv->fixed_hws[idx];
+			continue;
+		}
+
+		scmi_spec.np = priv->scmi_clk_np;
+		scmi_spec.args_count = 1;
+		scmi_spec.args[0] = map[i].fw_id;
+
+		clk = of_clk_get_from_provider(&scmi_spec);
+		if (IS_ERR(clk))
+			return dev_err_cast_probe(dev, clk,
+				"Failed to get SCMI clock %u\n",
+				map[i].fw_id);
+
+		hw = __clk_get_hw(clk);
+		if (IS_ERR(hw))
+			return dev_err_cast_probe(dev, hw,
+				"Failed to get SCMI clock hw %u\n",
+				map[i].fw_id);
+
+		if (!hw) {
+			/* CLOCK_ATTRIBUTES is not supported */
+			dev_warn(dev, "SCMI clock %u is NULL\n", map[i].fw_id);
+			continue;
+		}
+
+		dev_dbg(priv->dev, "SCMI clock %u is %s at %lu Hz\n",
+			map[i].fw_id, clk_hw_get_name(hw), clk_hw_get_rate(hw));
+
+		map[i].hw = hw;
+	}
+
+	return map;
+}
+
+static int r8a78000_cpg_probe(struct platform_device *pdev)
+{
+	struct device_node *scmi __free(device_node) = NULL;
+	struct device *dev = &pdev->dev;
+	struct scmi_base_info version;
+	const struct fw_map *fw_map;
+	struct r8a78000_cpg_priv *priv;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = dev;
+
+	scmi = of_parse_phandle(dev->of_node, "firmware", 0);
+	if (!scmi) {
+		dev_err(dev, "Cannot find SCMI firmware node\n");
+		return -ENODEV;
+	}
+
+	priv->scmi_clk_np = scmi_find_proto(scmi, SCMI_PROTOCOL_CLOCK);
+	if (!priv->scmi_clk_np) {
+		dev_err(dev, "Cannot find SCMI clock management protocol\n");
+		return -ENODEV;
+	}
+
+	ret = scmi_get_base_info(scmi, &version);
+	if (ret) {
+		return dev_err_probe(dev, -EPROBE_DEFER,
+				     "SCMI not yet available\n");
+	}
+
+	if (strcmp(version.vendor_id, "Renesas") ||
+	    strcmp(version.sub_vendor_id, "None")) {
+		return dev_err_probe(dev, -ENODEV,
+				     "Unsupported SCMI firmware %s/%s\n",
+				     version.vendor_id, version.sub_vendor_id);
+	}
+
+	for (fw_map = of_device_get_match_data(dev); fw_map->map; fw_map++) {
+		if (fw_map->impl_ver == version.impl_ver)
+			break;
+	}
+
+	if (!fw_map->map) {
+		return dev_err_probe(dev, -ENODEV,
+				     "Unsupported SCMI version 0x%08x\n",
+				     version.impl_ver);
+	}
+
+	ret = register_fixed_clks(priv);
+	if (ret)
+		return ret;
+
+	/*
+	 * We cannot do lazy look-up in r8a78000_clk_get(), as that function is
+	 * called with of_clk_mutex already held.
+	 */
+	priv->map = fill_clk_map(priv, fw_map->map);
+	if (IS_ERR(priv->map))
+		return PTR_ERR(priv->map);
+
+	return devm_of_clk_add_hw_provider(dev, r8a78000_clk_get, priv);
+}
+
+static const struct clk_map_in r8a78000_cpg_fw_4_28_0[] = {
+	{ R8A78000_CPG_SGASYNCD4_PERW_BUS,	FIXED_CLK(266M) },
+	{ R8A78000_CPG_SGASYNCD16_PERW_BUS,	FIXED_CLK(66M) },
+	{ R8A78000_CPG_MSOCK_PERW_BUS,		1671 },
+	{ -1 }
+};
+
+static const struct clk_map_in r8a78000_cpg_fw_4_31_0[] = {
+	{ R8A78000_CPG_SGASYNCD4_PERW_BUS,	FIXED_CLK(266M) },
+	{ R8A78000_CPG_SGASYNCD16_PERW_BUS,	FIXED_CLK(66M) },
+	{ R8A78000_CPG_MSOCK_PERW_BUS,		1667 },
+	{ -1 }
+};
+
+static const struct fw_map r8a78000_cpg_fw_map[] = {
+	{ 0x010a0000, r8a78000_cpg_fw_4_28_0 },	/* SCP FW SDKv4.28.0 */
+	{ 0x010d0000, r8a78000_cpg_fw_4_31_0 },	/* SCP FW SDKv4.31.0 */
+	{ 0x010e0000, r8a78000_cpg_fw_4_31_0 },	/* SCP FW SDKv4.32.0 */
+	{ 0, NULL }
+};
+
+static const struct of_device_id r8a78000_cpg_match[] = {
+	{
+		.compatible = "renesas,r8a78000-cpg",
+		.data = &r8a78000_cpg_fw_map,
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


