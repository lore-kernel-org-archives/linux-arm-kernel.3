Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1694C55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 15:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j5nh9wI+SxViivxp8vBbz2aOyup8dw395+YjQclJAos=; b=PBktRpzsXJQPgL8fOV445lD1jB
	22GH8LTT4bE7q/ltdrMqI0CjoGfzOzv7vryod/BpM9ZgPSGyzzOLVdI2j6qDoi/5D9FAnacKVpQUn
	JXigRSOieL9rYiiomAkUitA6aYWa5ewfbPFOpKUt82sWZ47rxwHUbLtdMste0Cmghv4Jm/GqX2DzR
	EGOC8J9kXhZk9XdQkMQtgWNBMcMtawU85kHU0oeO+ZlE+8eikveLhkAyBUXfNJpOLzzGeY2AkpfPk
	TcG2K+d6pS5ZCvQCdl4u+UrUAneTjjXTkW5H+bHr4RWyOmb1Ad+R6cfLZuvYKO5vLv1yw1ITtzmZc
	4GnbudSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrdQp-00000004AWL-09K2;
	Wed, 05 Aug 2026 15:21:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrdQn-00000004AVK-1YZB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 15:21:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 242A243878;
	Wed,  5 Aug 2026 15:21:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 759041F000E9;
	Wed,  5 Aug 2026 15:21:17 +0000 (UTC)
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
Subject: [PATCH v3 4/6] pmdomain: renesas: Add R-Car X5H MDLC driver
Date: Wed,  5 Aug 2026 17:20:52 +0200
Message-ID: <89e6a71b35703f10e12f520af1f389b5f40f4b35.1785941595.git.geert+renesas@glider.be>
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

Add a minimal Module Controller driver for the R-Car X5H (R8A78000) SoC.
For now this just supports the always-on power domains, and dummy module
clocks and resets for the serial console (which is enabled by the boot
loader).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - Replace <linux/mod_devicetable.h> by more specific
    <linux/device-id/of.h> in v7.2-rc2,
  - Add a comment to document only always-on domains are supported,
  - Consistently use /* sentinel */ for zero sentinels,
  - Drop trailing commas from sentinels,

v2:
  - Spin off from "pmdomain: renesas: Add R-Car X5H MDLC SCMI remapping
    driver",
  - Add default support not using SCMI,
  - Drop all SCMI remapping support,
  - Document use of -1 as a sentinel,
  - Rename struct r8a78000_mdlc_info to mdlc_info,
  - Print HW IDs in hexadecimal,
  - Reduce log level for unsupported MDLC instances from warn to dbg,
---
 drivers/pmdomain/renesas/Kconfig         |   4 +
 drivers/pmdomain/renesas/Makefile        |   1 +
 drivers/pmdomain/renesas/r8a78000-mdlc.c | 330 +++++++++++++++++++++++
 drivers/soc/renesas/Kconfig              |   1 +
 4 files changed, 336 insertions(+)
 create mode 100644 drivers/pmdomain/renesas/r8a78000-mdlc.c

diff --git a/drivers/pmdomain/renesas/Kconfig b/drivers/pmdomain/renesas/Kconfig
index b507c3e0d723efc6..f2f52d3c29a083f1 100644
--- a/drivers/pmdomain/renesas/Kconfig
+++ b/drivers/pmdomain/renesas/Kconfig
@@ -13,6 +13,10 @@ config SYSC_RMOBILE
 	bool "System Controller support for R-Mobile" if COMPILE_TEST
 
 # SoC
+config MDLC_R8A78000
+	bool "Module Controller support for R8A78000 (R-Car X5H)" if COMPILE_TEST
+	select RESET_CONTROLLER
+
 config SYSC_R8A7742
 	bool "System Controller support for R8A7742 (RZ/G1H)" if COMPILE_TEST
 	select SYSC_RCAR
diff --git a/drivers/pmdomain/renesas/Makefile b/drivers/pmdomain/renesas/Makefile
index 0391e6e67440a786..17849aad37a5ac4f 100644
--- a/drivers/pmdomain/renesas/Makefile
+++ b/drivers/pmdomain/renesas/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 # SoC
+obj-$(CONFIG_MDLC_R8A78000)	+= r8a78000-mdlc.o
 obj-$(CONFIG_SYSC_R8A7742)	+= r8a7742-sysc.o
 obj-$(CONFIG_SYSC_R8A7743)	+= r8a7743-sysc.o
 obj-$(CONFIG_SYSC_R8A7745)	+= r8a7745-sysc.o
diff --git a/drivers/pmdomain/renesas/r8a78000-mdlc.c b/drivers/pmdomain/renesas/r8a78000-mdlc.c
new file mode 100644
index 0000000000000000..5c8acead7cff9bdd
--- /dev/null
+++ b/drivers/pmdomain/renesas/r8a78000-mdlc.c
@@ -0,0 +1,330 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * R-Car X5H Module Controller
+ *
+ * Copyright (C) 2026 Glider bv
+ */
+
+#include <linux/dev_printk.h>
+#include <linux/device-id/of.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_domain.h>
+#include <linux/reset-controller.h>
+#include <linux/slab.h>
+
+#include <dt-bindings/power/renesas,r8a78000-mdlc.h>
+
+struct mod_map {
+	int hw_id;		/* Hardware module ID or -1 sentinel */
+};
+
+struct mdlc_info {
+	u32 base;
+	const struct mod_map *mod_map;
+};
+
+/**
+ * struct r8a78000_mdlc_priv - Module Controller Private Data
+ *
+ * @link: Link into list of MDLC instances
+ * @genpd_data: PM domain provider data
+ * @rcdev: Reset controller entity
+ * @dev: MDLC device
+ * @np: Device node in DT representing the MDLC
+ * @mod_map: Mapping from hardware module IDs
+ */
+struct r8a78000_mdlc_priv {
+	struct hlist_node link;
+	struct genpd_onecell_data genpd_data;
+	struct reset_controller_dev rcdev;
+	struct device *dev;
+	struct device_node *np;
+	const struct mod_map *mod_map;
+};
+
+static struct generic_pm_domain *r8a78000_genpd_always_on;
+static HLIST_HEAD(r8a78000_mdlc_list);
+static DEFINE_MUTEX(r8a78000_mdlc_lock);	/* protects the two above */
+
+static struct generic_pm_domain *r8a78000_genpd_xlate(
+			const struct of_phandle_args *spec, void *data)
+{
+	struct r8a78000_mdlc_priv *priv = container_of(data,
+					struct r8a78000_mdlc_priv, genpd_data);
+	struct device *dev = priv->dev;
+	u32 id;
+
+	if (spec->args_count != 2)
+		return ERR_PTR(-EINVAL);
+
+	id = spec->args[0];
+
+	if (id >= R8A78000_MDLC_PD_AON) {
+		dev_dbg(dev,
+			"Mapping HW power domain 0x%x to always-on domain\n",
+			id);
+		return r8a78000_genpd_always_on;
+	}
+
+	/* For now only always-on domains are supported */
+	dev_err(dev, "Unknown power domain 0x%x\n", id);
+	return ERR_PTR(-ENOENT);
+}
+
+#define rcdev_to_priv(_rcdev)	\
+	container_of(_rcdev, struct r8a78000_mdlc_priv, rcdev)
+
+static const struct mod_map *mod_map_find(const struct mod_map *map, u32 id)
+{
+	if (!map)
+		return NULL;
+
+	for (; map->hw_id >= 0; map++) {
+		if (map->hw_id == id)
+			return map;
+	}
+
+	return NULL;
+}
+
+static int r8a78000_mdlc_reset_xlate(struct reset_controller_dev *rcdev,
+				     const struct of_phandle_args *spec)
+{
+	struct r8a78000_mdlc_priv *priv = rcdev_to_priv(rcdev);
+	struct device *dev = priv->dev;
+	const struct mod_map *map;
+	u32 id;
+
+	if (spec->args_count != 1)
+		return -EINVAL;
+
+	id = spec->args[0];
+
+	map = mod_map_find(priv->mod_map, id);
+	if (!map) {
+		dev_err(dev, "Unknown reset 0x%x\n", id);
+		return -ENOENT;
+	}
+
+	dev_dbg(dev, "Ignoring HW reset 0x%x\n", id);
+	return id;
+}
+
+#define DEFINE_MDLC_RESET_WRAPPER(op)					    \
+	static int r8a78000_mdlc_ ## op(struct reset_controller_dev *rcdev, \
+					unsigned long id)		    \
+	{								    \
+		struct r8a78000_mdlc_priv *priv = rcdev_to_priv(rcdev);	    \
+									    \
+		dev_dbg(priv->dev, "%s: Ignoring\n", __func__);		    \
+		return 0;						    \
+	}
+
+DEFINE_MDLC_RESET_WRAPPER(reset)
+DEFINE_MDLC_RESET_WRAPPER(assert)
+DEFINE_MDLC_RESET_WRAPPER(deassert)
+DEFINE_MDLC_RESET_WRAPPER(status)
+
+static const struct reset_control_ops r8a78000_mdlc_reset_ops = {
+	.reset = r8a78000_mdlc_reset,
+	.assert = r8a78000_mdlc_assert,
+	.deassert = r8a78000_mdlc_deassert,
+	.status = r8a78000_mdlc_status,
+};
+
+static int r8a78000_mdlc_attach_dev(struct generic_pm_domain *domain,
+				    struct device *dev)
+{
+	struct device_node *np = dev->of_node;
+	struct r8a78000_mdlc_priv *priv;
+	struct of_phandle_args pd_spec;
+	const struct mod_map *map;
+	unsigned int id;
+	int ret;
+
+	ret = of_parse_phandle_with_args(np, "power-domains",
+					 "#power-domain-cells", 0, &pd_spec);
+	if (ret < 0)
+		return ret;
+
+	if (pd_spec.args_count != 2) {
+		of_node_put(pd_spec.np);
+		return -EINVAL;
+	}
+
+	scoped_guard(mutex, &r8a78000_mdlc_lock) {
+		hlist_for_each_entry(priv, &r8a78000_mdlc_list, link) {
+			if (priv->np == pd_spec.np)
+				break;
+		}
+	}
+
+	if (!priv) {
+		dev_err(dev, "%s: MDLC %pOF not found\n", __func__, pd_spec.np);
+		of_node_put(pd_spec.np);
+		return -ENODEV;
+	}
+
+	id = pd_spec.args[1];
+	of_node_put(pd_spec.np);
+
+	map = mod_map_find(priv->mod_map, id);
+	if (!map) {
+		dev_err(dev, "Unknown module 0x%x\n", id);
+		return -ENOENT;
+	}
+
+	dev_dbg(dev, "Ignoring HW module 0x%x\n", id);
+	return 0;
+}
+
+static void r8a78000_mdlc_unlink(void *data)
+{
+	struct r8a78000_mdlc_priv *priv = data;
+
+	scoped_guard(mutex, &r8a78000_mdlc_lock) {
+		hlist_del(&priv->link);
+	}
+}
+
+static void r8a78000_genpd_del_provider(void *data)
+{
+	of_genpd_del_provider(data);
+}
+
+static int r8a78000_genpd_always_on_singleton(struct device *dev)
+{
+	struct generic_pm_domain *genpd;
+	int ret;
+
+	guard(mutex)(&r8a78000_mdlc_lock);
+
+	if (r8a78000_genpd_always_on)
+		return 0;
+
+	genpd = kzalloc_obj(*genpd);
+	if (!genpd)
+		return -ENOMEM;
+
+	genpd->name = "always-on";
+	genpd->attach_dev = r8a78000_mdlc_attach_dev;
+
+	ret = pm_genpd_init(genpd, &pm_domain_always_on_gov, false);
+	if (ret) {
+		kfree(genpd);
+		return dev_err_probe(dev, ret,
+				     "Failed to create always-on domain\n");
+	}
+
+	r8a78000_genpd_always_on = genpd;
+	return 0;
+}
+
+static int r8a78000_mdlc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct r8a78000_mdlc_priv *priv;
+	const struct mdlc_info *info;
+	struct resource *res;
+	int ret;
+
+	ret = r8a78000_genpd_always_on_singleton(dev);
+	if (ret)
+		return ret;
+
+	info = of_device_get_match_data(dev);
+	if (!info)
+		return -ENODEV;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = dev;
+	priv->np = np;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -ENODEV;
+
+	for (; info->base; info++) {
+		if (info->base == res->start)
+			break;
+	}
+
+	if (!info->base) {
+		dev_dbg(dev, "Unsupported MDLC instance 0x%pa\n", &res->start);
+		return -ENODEV;
+	}
+
+	priv->mod_map = info->mod_map;
+
+	scoped_guard(mutex, &r8a78000_mdlc_lock) {
+		hlist_add_head(&priv->link, &r8a78000_mdlc_list);
+	}
+
+	ret = devm_add_action_or_reset(dev, r8a78000_mdlc_unlink, priv);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add action\n");
+
+	/* Note that no actual domains are registered, just need translation */
+	priv->genpd_data.xlate = r8a78000_genpd_xlate;
+	ret = of_genpd_add_provider_onecell(np, &priv->genpd_data);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to register genpd provider\n");
+
+	ret = devm_add_action_or_reset(dev, r8a78000_genpd_del_provider, np);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to add unregister action\n");
+
+	priv->rcdev.ops = &r8a78000_mdlc_reset_ops;
+	priv->rcdev.of_node = np;
+	priv->rcdev.of_reset_n_cells = 1;
+	priv->rcdev.of_xlate = r8a78000_mdlc_reset_xlate;
+
+	ret = devm_reset_controller_register(dev, &priv->rcdev);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to register reset controller\n");
+
+	return 0;
+}
+
+static const struct mod_map r8a78000_mdlc_perw_mod_default[] = {
+	{ 0x54 },	/* HSCIF0 */
+	{ -1 }
+};
+
+static const struct mdlc_info r8a78000_mdlc_default[] = {
+	{
+		.base = 0xc05d0000 /* mdlc_perw */,
+		.mod_map = r8a78000_mdlc_perw_mod_default,
+	},
+	{ /* sentinel */ }
+};
+
+static const struct of_device_id r8a78000_mdlc_match[] = {
+	{
+		.compatible = "renesas,r8a78000-mdlc",
+		.data = &r8a78000_mdlc_default,
+	},
+	{ /* sentinel */ }
+};
+
+static struct platform_driver r8a78000_mdlc_driver = {
+	.probe = r8a78000_mdlc_probe,
+	.driver = {
+		.name = "r8a78000-mdlc",
+		.of_match_table = r8a78000_mdlc_match,
+		.suppress_bind_attrs = true,
+	},
+};
+
+builtin_platform_driver(r8a78000_mdlc_driver)
+
+MODULE_DESCRIPTION("R-Car X5H MDLC Driver");
diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index fdf18ed2dfc2186d..eb8ac0d47d9d42b1 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -357,6 +357,7 @@ config ARCH_R8A78000
 	bool "ARM64 Platform support for R8A78000 (R-Car X5H)"
 	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN5
+	select MDLC_R8A78000
 	help
 	  This enables support for the Renesas R-Car X5H SoC.
 
-- 
2.43.0


