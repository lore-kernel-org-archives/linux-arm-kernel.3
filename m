Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D52EC1426
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 10:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jvoHrnlqo3I9NPKShcFte8Zu67RcbntFfDaOovs5hDo=; b=q5dmEX82UuuP0CIuPTLSKR1BG3
	xP2NkJlZa//q0doM+TrBbW8pa99hao7JDQy+CFzjHGvVVEd/4ILpdwEUX9jRRSRRn6Re7KmgMF9rB
	kxLF8a/guN76LIEClswa4GxvPU6HHh2EC57QuCa3xlXCQvx2YnyYVmuWjFxM+OQUmPRvT1PC+5QLP
	EODBGyNYwPiSkC/RJX9b7e1GUps4hwvfo8CzbFK6YcgXRF94ZDjwLt5v5GauONDFWJE4nJOHxmmOs
	v7ATNZ0CY0CzRADVYEhF2EM9hXmpWTdBwWm5Nf/ij3ZH43ElTfFGWy2sxYUoNF6noMgA3DIF59zmV
	B3q4gOcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxN5i-0000000EyE5-2QHu;
	Tue, 03 Mar 2026 10:35:02 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxN5g-0000000EyAd-0pgZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 10:35:01 +0000
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1vxN5D-0004MP-7B; Tue, 03 Mar 2026 11:34:31 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Tue, 03 Mar 2026 11:34:27 +0100
Subject: [PATCH v11 2/3] drm/bridge: imx: Add i.MX93 parallel display
 format configuration support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-v6-18-topic-imx93-parallel-display-v11-2-1b03733c8461@pengutronix.de>
References: <20260303-v6-18-topic-imx93-parallel-display-v11-0-1b03733c8461@pengutronix.de>
In-Reply-To: <20260303-v6-18-topic-imx93-parallel-display-v11-0-1b03733c8461@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
 Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 luca.ceresoli@bootlin.com, Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de, 
 Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_023500_427581_27345604 
X-CRM114-Status: GOOD (  24.52  )
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

From: Liu Ying <victor.liu@nxp.com>

NXP i.MX93 mediamix blk-ctrl contains one DISPLAY_MUX register which
configures parallel display format by using the "PARALLEL_DISP_FORMAT"
field. Add a DRM bridge driver to support the display format configuration.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
[m.felsch@pengutronix.de: port to v7.0-rc1]
[m.felsch@pengutronix.de: add review feedback (Alexander)]
[m.felsch@pengutronix.de: fix to short Kconfig description (checkpath)]
[m.felsch@pengutronix.de: use "GPL" instead of "GPL v2" (checkpatch)]
[m.felsch@pengutronix.de: add bus-width support]
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/gpu/drm/bridge/imx/Kconfig      |  11 ++
 drivers/gpu/drm/bridge/imx/Makefile     |   1 +
 drivers/gpu/drm/bridge/imx/imx93-pdfc.c | 225 ++++++++++++++++++++++++++++++++
 3 files changed, 237 insertions(+)

diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
index b9028a5e5a065c3237b404111d8df57e8e017f9d..47829300a4486a090514ebe914b7667a703039a9 100644
--- a/drivers/gpu/drm/bridge/imx/Kconfig
+++ b/drivers/gpu/drm/bridge/imx/Kconfig
@@ -99,4 +99,15 @@ config DRM_IMX93_MIPI_DSI
 	  Choose this to enable MIPI DSI controller found in Freescale i.MX93
 	  processor.
 
+config DRM_IMX93_PARALLEL_DISP_FMT_CONVERTER
+	tristate "NXP i.MX91/i.MX93 parallel display format converter"
+	depends on OF
+	select DRM_KMS_HELPER
+	help
+	  On i.MX93 and i.MX91 SoCs the parallel display format output is
+	  controlled via the MEDIAMIX BLK-CTRL DISPLAY_MUX.
+
+	  Say 'Y' or 'M' if you use the parallel display output path on a
+	  i.MX93 or i.MX91 SoC.
+
 endif # ARCH_MXC || COMPILE_TEST
diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
index 8d01fda25451aaa1bf51a068da18948094327116..da57fde2d813b88cdde89115ca801b4cfc69afbd 100644
--- a/drivers/gpu/drm/bridge/imx/Makefile
+++ b/drivers/gpu/drm/bridge/imx/Makefile
@@ -9,3 +9,4 @@ obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) += imx8qxp-pixel-combiner.o
 obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK) += imx8qxp-pixel-link.o
 obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK_TO_DPI) += imx8qxp-pxl2dpi.o
 obj-$(CONFIG_DRM_IMX93_MIPI_DSI) += imx93-mipi-dsi.o
+obj-$(CONFIG_DRM_IMX93_PARALLEL_DISP_FMT_CONVERTER) += imx93-pdfc.o
diff --git a/drivers/gpu/drm/bridge/imx/imx93-pdfc.c b/drivers/gpu/drm/bridge/imx/imx93-pdfc.c
new file mode 100644
index 0000000000000000000000000000000000000000..27a54424319838517b206ab7d7447538aa1489eb
--- /dev/null
+++ b/drivers/gpu/drm/bridge/imx/imx93-pdfc.c
@@ -0,0 +1,225 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Copyright 2022-2025 NXP
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/media-bus-format.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_bridge.h>
+
+#define IMX93_DISPLAY_MUX_REG		0x60
+#define PARALLEL_DISP_FORMAT		GENMASK(10, 8)
+#define FORMAT_RGB888_TO_RGB888		FIELD_PREP(PARALLEL_DISP_FORMAT, 0)
+#define FORMAT_RGB888_TO_RGB666		FIELD_PREP(PARALLEL_DISP_FORMAT, 1)
+#define FORMAT_RGB565_TO_RGB565		FIELD_PREP(PARALLEL_DISP_FORMAT, 2)
+
+struct imx93_pdfc {
+	struct drm_bridge bridge;
+	struct device *dev;
+	struct regmap *regmap;
+	u32 phy_bus_width;
+};
+
+static struct imx93_pdfc *bridge_to_imx93_pdfc(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct imx93_pdfc, bridge);
+}
+
+static int
+imx93_pdfc_bridge_attach(struct drm_bridge *bridge, struct drm_encoder *encoder,
+			 enum drm_bridge_attach_flags flags)
+{
+	return drm_bridge_attach(bridge->encoder, bridge->next_bridge, bridge, flags);
+}
+
+static void imx93_pdfc_bridge_atomic_enable(struct drm_bridge *bridge,
+					    struct drm_atomic_state *state)
+{
+	struct imx93_pdfc *pdfc = bridge_to_imx93_pdfc(bridge);
+	const struct drm_bridge_state *bridge_state;
+	unsigned int mask = PARALLEL_DISP_FORMAT;
+	unsigned int val;
+
+	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
+
+	switch (bridge_state->output_bus_cfg.format) {
+	case MEDIA_BUS_FMT_RGB888_1X24:
+	case MEDIA_BUS_FMT_FIXED:
+		val = FORMAT_RGB888_TO_RGB888;
+		if (pdfc->phy_bus_width == 18) {
+			/*
+			 * Can be valid if physical bus limitation exists,
+			 * therefore use dev_dbg().
+			 */
+			dev_dbg(pdfc->dev, "Truncate two LSBs from each color\n");
+			val = FORMAT_RGB888_TO_RGB666;
+		}
+		break;
+	case MEDIA_BUS_FMT_RGB666_1X18:
+		val = FORMAT_RGB888_TO_RGB666;
+		break;
+	case MEDIA_BUS_FMT_RGB565_1X16:
+		val = FORMAT_RGB565_TO_RGB565;
+		break;
+	}
+
+	regmap_update_bits(pdfc->regmap, IMX93_DISPLAY_MUX_REG, mask, val);
+}
+
+/* TODO: Add YUV formats */
+static const u32 imx93_pdfc_bus_output_fmts[] = {
+	MEDIA_BUS_FMT_FIXED,
+	MEDIA_BUS_FMT_RGB888_1X24,
+	MEDIA_BUS_FMT_RGB666_1X18,
+	MEDIA_BUS_FMT_RGB565_1X16,
+};
+
+static bool imx93_pdfc_bus_output_fmt_supported(u32 fmt)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(imx93_pdfc_bus_output_fmts); i++) {
+		if (imx93_pdfc_bus_output_fmts[i] == fmt)
+			return true;
+	}
+
+	return false;
+}
+
+static u32 *
+imx93_pdfc_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+					    struct drm_bridge_state *bridge_state,
+					    struct drm_crtc_state *crtc_state,
+					    struct drm_connector_state *conn_state,
+					    u32 output_fmt,
+					    unsigned int *num_input_fmts)
+{
+	struct imx93_pdfc *pdfc = bridge_to_imx93_pdfc(bridge);
+	u32 *input_fmts;
+
+	*num_input_fmts = 0;
+
+	input_fmts = kmalloc_obj(*input_fmts);
+	if (!input_fmts)
+		return NULL;
+
+	*num_input_fmts = 1;
+
+	if (!imx93_pdfc_bus_output_fmt_supported(output_fmt)) {
+		dev_dbg(pdfc->dev, "No valid output bus-fmt detected, fallback to MEDIA_BUS_FMT_RGB888_1X24\n");
+		input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
+		return input_fmts;
+	}
+
+	switch (output_fmt) {
+	case MEDIA_BUS_FMT_RGB888_1X24:
+	case MEDIA_BUS_FMT_RGB565_1X16:
+		input_fmts[0] = output_fmt;
+		break;
+	case MEDIA_BUS_FMT_RGB666_1X18:
+	case MEDIA_BUS_FMT_FIXED:
+		input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
+		break;
+	}
+
+	return input_fmts;
+}
+
+static int imx93_pdfc_bridge_atomic_check(struct drm_bridge *bridge,
+					  struct drm_bridge_state *bridge_state,
+					  struct drm_crtc_state *crtc_state,
+					  struct drm_connector_state *conn_state)
+{
+	struct imx93_pdfc *pdfc = bridge_to_imx93_pdfc(bridge);
+	u32 format = bridge_state->output_bus_cfg.format;
+
+	if (imx93_pdfc_bus_output_fmt_supported(format))
+		return 0;
+
+	dev_warn(pdfc->dev, "Unsupported output bus format: 0x%x\n", format);
+
+	return -EINVAL;
+}
+
+static const struct drm_bridge_funcs funcs = {
+	.attach			= imx93_pdfc_bridge_attach,
+	.atomic_enable		= imx93_pdfc_bridge_atomic_enable,
+	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
+	.atomic_get_input_bus_fmts	= imx93_pdfc_bridge_atomic_get_input_bus_fmts,
+	.atomic_check		= imx93_pdfc_bridge_atomic_check,
+	.atomic_reset		= drm_atomic_helper_bridge_reset,
+};
+
+static int imx93_pdfc_bridge_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct drm_bridge *next_bridge;
+	struct imx93_pdfc *pdfc;
+	struct device_node *ep;
+	int err;
+
+	pdfc = devm_drm_bridge_alloc(dev, struct imx93_pdfc, bridge, &funcs);
+	if (IS_ERR(pdfc))
+		return PTR_ERR(pdfc);
+
+	pdfc->regmap = syscon_node_to_regmap(dev->of_node->parent);
+	if (IS_ERR(pdfc->regmap))
+		return dev_err_probe(dev, PTR_ERR(pdfc->regmap),
+				     "failed to get regmap\n");
+
+	/* No limits per default */
+	pdfc->phy_bus_width = 24;
+
+	/* Get output ep (port1/endpoint) */
+	ep = of_graph_get_endpoint_by_regs(dev->of_node, 1, -1);
+	if (ep) {
+		err = of_property_read_u32(ep, "bus-width", &pdfc->phy_bus_width);
+		of_node_put(ep);
+
+		/* bus-width is optional but it must have valid data if present */
+		if (err && err != -EINVAL)
+			return dev_err_probe(dev, err,
+					     "failed to query bus-width\n");
+	}
+
+	next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
+	if (IS_ERR(next_bridge))
+		return dev_err_probe(dev, PTR_ERR(next_bridge),
+				     "failed to get next bridge\n");
+	pdfc->dev = dev;
+	pdfc->bridge.of_node = dev->of_node;
+	pdfc->bridge.type = DRM_MODE_CONNECTOR_DPI;
+	pdfc->bridge.next_bridge = next_bridge;
+
+	return devm_drm_bridge_add(dev, &pdfc->bridge);
+}
+
+static const struct of_device_id imx93_pdfc_dt_ids[] = {
+	{ .compatible = "nxp,imx93-pdfc", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, imx93_pdfc_dt_ids);
+
+static struct platform_driver imx93_pdfc_bridge_driver = {
+	.probe	= imx93_pdfc_bridge_probe,
+	.driver	= {
+		.of_match_table = imx93_pdfc_dt_ids,
+		.name = "imx93_pdfc",
+	},
+};
+module_platform_driver(imx93_pdfc_bridge_driver);
+
+MODULE_DESCRIPTION("NXP i.MX93 parallel display format configuration driver");
+MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
+MODULE_LICENSE("GPL");

-- 
2.47.3


