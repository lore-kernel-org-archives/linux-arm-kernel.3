Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB1BCC982C5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:Cc:
	To:In-Reply-To:Message-Id:Content-Transfer-Encoding:MIME-Version:Subject:Date
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bmBWlwguqF60g6xfs3Ym5CMVdbFcGCxxpChAPcpJ5dQ=; b=uCiBKBJuu1T7Cm+N5nJXRadOzz
	H/D/4YEcrRE/bZj2Fh7JqbXHK++8tC7NRLLMM0GCD5/DW587Eq5rPTdGPx/cYufaxAna7BDC0TyfO
	fNKuP4biq7vaCrPh3jchDeKwHcJ90vgiQfaxJ5CSalkUZFCbN6bTbGEHM1s5k8KrNHC3gkmS0GiO4
	9nSuxVce2eSwXQIvJWsASbBLdfqQUDpquAmBDlhuTAuaoa8wdpK+WOc0HvOrCtQxOFMmPdN/B04iI
	ddrhwsKXcVE6GIj21w5tGFIF9rrpedjgGygzWVJl5OEFEhTbJIAkFbY6lsUA4csEOTctfhfs8Tr8y
	U1rxox/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VAU-00000007CzK-3PCA;
	Tue, 15 Sep 2026 15:33:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6V9J-00000007Axg-3INe;
	Tue, 15 Sep 2026 15:32:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:Cc:To:
	In-Reply-To:Message-Id:Content-Transfer-Encoding:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=bmBWlwguqF60g6xfs3Ym5CMVdbFcGCxxpChAPcpJ5dQ=; b=Zl3m6FSjRLI9pfCzs41q2luCOk
	8P+6JfFQEDIMZdRsgrHaOOTViYdWSmAp4n24ScNJvugiuXBBo2Je1nS9hV7G4p9g3x3Mr5eMo4rbm
	N0MlkXMeCstns/VYjMa/hhg7RDrQjrpzZr5J8owqzgb1IcISiwaATULrf/Db5qIk9Lq5qKj7xSYeN
	nqSqZs9hlxf9KEn/P+7NFzpWRs13Q0QR/r+sjzi2wstdp1ovTJfRfv/++WfMwTmjtixDutd5T5tv3
	q2nrCo2FO+u1bG0IoQ/YMpkZJCv2mMWs9oIXVp9szgTqXEab7jM0UT2N+rQV7ndjXKoR1C01pvwGU
	yuK2GdZA==;
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6V9G-00000006wd5-2JtJ;
	Tue, 15 Sep 2026 15:32:44 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260915153241euoutp0186ed4e41ba24101c50919e503212e004~ViF1vTK4h0097300973euoutp01i;
	Tue, 15 Sep 2026 15:32:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260915153241euoutp0186ed4e41ba24101c50919e503212e004~ViF1vTK4h0097300973euoutp01i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789486361;
	bh=bmBWlwguqF60g6xfs3Ym5CMVdbFcGCxxpChAPcpJ5dQ=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=V4/2jDXglAb++yJ23FsuRgRv4CgSZ92DR+2haBrB9VPANoILNpKaVJrgXI5nlYs1X
	 Vy0GdEakSrbjgxQ3qPg9tDIWx3Ik+YbkEAX834KIygOxgAH50jH/iXWuI8sKjFE66B
	 lzkJV88Q1KoIKCbvLTbhdidnKVH11hqdgC7epPSs=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260915153241eucas1p292a3312a0ca8aed99cc416c0e01c3b66~ViF1JTluy2816828168eucas1p25;
	Tue, 15 Sep 2026 15:32:41 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260915153238eusmtip197fbcf8485a837a60ae232d052f7f39c~ViFyp3p_w0555305553eusmtip1x;
	Tue, 15 Sep 2026 15:32:38 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Tue, 15 Sep 2026 17:32:23 +0200
Subject: [PATCH v4 15/20] drm/bridge: starfive: Add JH7110 HDMI controller
 driver
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-jh7110-clean-send-v4-15-f0e4fd6f2cc8@samsung.com>
In-Reply-To: <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
To: Vinod Koul <vkoul@kernel.org>,  Neil Armstrong
	<neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,  Krzysztof
	Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>, Andrzej
	Hajda <andrzej.hajda@intel.com>,  Robert Foss <rfoss@kernel.org>,  Laurent
	Pinchart <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,  Luca Ceresoli
	<luca.ceresoli@bootlin.com>,  Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,  Lee Jones <lee@kernel.org>, Andy
	Yan <andy.yan@rock-chips.com>,  Philipp Zabel <p.zabel@pengutronix.de>, 
	Emil Renner Berthing <kernel@esmil.dk>,  Hal Feng
	<hal.feng@starfivetech.com>,  Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>,  Paul
	Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,  Dominique
	Belhachemi <db@domibel.de>, Brian Masney <bmasney+clk@redhat.com>,  Jerome
	Brunet <jbrunet+clk@baylibre.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	mfd@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org,  Marek Szyprowski
	<m.szyprowski@samsung.com>,  Maud Spierings <maud_spierings@murena.io>, 
	Graham Markall <hello@big-grey.co.uk>,  Icenowy Zheng
	<zhengxingda@iscas.ac.cn>,  Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Joshua Peisach <jpeisach@ubuntu.com>,  =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>,  Michal Wilczynski
	<m.wilczynski@samsung.com>
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20260915153241eucas1p292a3312a0ca8aed99cc416c0e01c3b66
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260915153241eucas1p292a3312a0ca8aed99cc416c0e01c3b66
X-EPHeader: CA
X-CMS-RootMailID: 20260915153241eucas1p292a3312a0ca8aed99cc416c0e01c3b66
References: <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
	<CGME20260915153241eucas1p292a3312a0ca8aed99cc416c0e01c3b66@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_163242_887215_C95FFE58 
X-CRM114-Status: GOOD (  33.04  )
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

Add the HDMI controller (bridge) driver for the StarFive JH7110.

This driver binds to the starfive,jh7110-inno-hdmi-controller node. It
gets its register access, module and bus clocks from voutcrg, and
consumes the pixel clock and the PHY from its hdmi_phy sibling.

The driver calls the generic inno_hdmi_probe function, which picks up
the regmap shared with the PHY from the parent device and registers a
DRM bridge. The .enable hook is responsible for setting the PHY's pixel
clock rate via clk_set_rate() and powering on the PHY via
phy_power_on().

The DC8200 has two panels, each exposing a DP and a DPI interface, and a
mux in the video output system controller picks which of them drives the
HDMI transmitter. It comes out of reset on panel 0 / DPI, which happens
to be what the default wiring needs, so nothing has had to program it so
far. Derive it from the port graph instead, taking the panel from the
remote port number and the interface from the remote endpoint number, so
that a board describing a different output is honoured.

The generic driver holds the clock it looks up as the register access
clock enabled for its lifetime, and derives the DDC divider from that
clock's rate, so point it at the system clock. Naming the pixel clock
there instead would keep the PHY pre-PLL powered from probe onwards and
size the divider from the wrong rate.

The PHY can only generate the discrete set of pixel clocks described by
its pre-PLL table, so .mode_valid rejects any mode clk_round_rate()
cannot satisfy. Without it such a mode would be advertised to userspace
and the modeset would appear to succeed while the display stayed blank.

.enable returns early when the rate is unsupported or the PHY fails to
power on, so track whether the pixel clock was actually enabled and let
.disable tear down only what was brought up, otherwise the clock
refcount underflows.

The clocks and the reset are torn down through devm rather than from
.remove, so that they outlive the bridge that inno_hdmi_probe() adds with
devm_drm_bridge_add(). Releasing them in .remove runs before devres
unwinds and would leave the bridge registered with its clocks already
gated.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/gpu/drm/bridge/Kconfig            |  11 ++
 drivers/gpu/drm/bridge/Makefile           |   1 +
 drivers/gpu/drm/bridge/jh7110-inno-hdmi.c | 297 ++++++++++++++++++++++++++++++
 3 files changed, 309 insertions(+)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 4a57d49b4c6d3ab4b965228835b372d191647197..75b1cf6727d5a32310dcf9fe5734d95e14eea8fe 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -359,6 +359,17 @@ config DRM_SOLOMON_SSD2825
 	  Say M here if you want to support this hardware as a module.
 	  The module will be named "ssd2825".
 
+config DRM_STARFIVE_JH7110_INNO_HDMI
+	tristate "Starfive JH7110 Innosilicon HDMI bridge"
+	depends on OF
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	select DRM_INNO_HDMI
+	help
+	  Enable support for the StarFive JH7110 specific implementation
+	  of the Innosilicon HDMI controller.
+	  This driver acts as a glue layer between the JH7110 HDMI subsystem
+	  parent driver and the generic Innosilicon HDMI bridge driver.
+
 config DRM_THINE_THC63LVD1024
 	tristate "Thine THC63LVD1024 LVDS decoder bridge"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index 15cc821d85b7ea6f3cdc313f3e521b028de567d7..5d843f4ad7ed50b28cb75286c5e22789d91a0836 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -30,6 +30,7 @@ obj-$(CONFIG_DRM_SIL_SII8620) += sil-sii8620.o
 obj-$(CONFIG_DRM_SII902X) += sii902x.o
 obj-$(CONFIG_DRM_SII9234) += sii9234.o
 obj-$(CONFIG_DRM_SIMPLE_BRIDGE) += simple-bridge.o
+obj-$(CONFIG_DRM_STARFIVE_JH7110_INNO_HDMI) += jh7110-inno-hdmi.o
 obj-$(CONFIG_DRM_SOLOMON_SSD2825) += ssd2825.o
 obj-$(CONFIG_DRM_THEAD_TH1520_DW_HDMI) += th1520-dw-hdmi.o
 obj-$(CONFIG_DRM_THINE_THC63LVD1024) += thc63lvd1024.o
diff --git a/drivers/gpu/drm/bridge/jh7110-inno-hdmi.c b/drivers/gpu/drm/bridge/jh7110-inno-hdmi.c
new file mode 100644
index 0000000000000000000000000000000000000000..e9b91787330d7b65558868017bc36ca8f4535998
--- /dev/null
+++ b/drivers/gpu/drm/bridge/jh7110-inno-hdmi.c
@@ -0,0 +1,297 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) StarFive Technology Co., Ltd.
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ * Author: Michal Wilczynski <m.wilczynski@samsung.com>
+ *
+ * HDMI controller (bridge) driver for the StarFive JH7110 HDMI subsystem.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/cleanup.h>
+#include <linux/clk.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+#include <linux/phy/phy.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+
+#include <drm/bridge/inno_hdmi.h>
+#include <drm/drm_modes.h>
+
+/* dom_vout_syscon: HDMI pixel data mapping */
+#define VOUT_SYSCFG_4			0x4
+#define VOUT_HDMI_DP_BIT_DEPTH		BIT(25)
+#define VOUT_HDMI_DP_YUV_MODE		GENMASK(27, 26)
+#define VOUT_HDMI_DP_YUV_MODE_RGB	3
+#define VOUT_HDMI_DPI_BIT_DEPTH		GENMASK(29, 28)
+#define VOUT_HDMI_DPI_BIT_DEPTH_8BIT	0
+#define VOUT_HDMI_DPI_DP_SEL		BIT(30)
+
+/* u2_display_panel_mux feeds HDMI_Ctrl, see the block diagram in 5.1 */
+#define VOUT_SYSCFG_8			0x8
+#define VOUT_HDMI_PANEL_SEL		BIT(4)
+
+enum stf_hdmi_ctrl_clocks { CLK_SYS = 0, CLK_M, CLK_B, CLK_PCLK, CLK_CTRL_NUM };
+
+struct stf_inno_hdmi_controller {
+	struct device *dev;
+	struct clk_bulk_data clks[CLK_CTRL_NUM];
+	struct reset_control *tx_rst;
+	struct phy *phy;
+	bool enabled;
+};
+
+static enum drm_mode_status
+inno_hdmi_starfive_mode_valid(struct device *dev,
+			      const struct drm_display_mode *mode)
+{
+	struct stf_inno_hdmi_controller *ctrl = dev_get_drvdata(dev);
+	unsigned long pixelclk = mode->clock * 1000;
+	long rounded;
+
+	/*
+	 * The PHY can only generate the discrete set of pixel clocks described
+	 * by its pre-PLL table, and clk_round_rate() fails for anything else.
+	 * Reject those modes here: without this the modeset would appear to
+	 * succeed while the PHY never produces a signal.
+	 */
+	rounded = clk_round_rate(ctrl->clks[CLK_PCLK].clk, pixelclk);
+	if (rounded != pixelclk)
+		return MODE_NOCLOCK;
+
+	return MODE_OK;
+}
+
+static void inno_hdmi_starfive_enable(struct device *dev,
+				      struct drm_display_mode *mode)
+{
+	struct stf_inno_hdmi_controller *ctrl = dev_get_drvdata(dev);
+	int ret;
+
+	/*
+	 * 1. Set the pixel clock rate. This calls the PHY driver's .set_rate op.
+	 */
+	ret = clk_set_rate(ctrl->clks[CLK_PCLK].clk, mode->clock * 1000);
+	if (ret) {
+		dev_err(dev, "Failed to set pclk rate %d: %d\n",
+			mode->clock * 1000, ret);
+		return;
+	}
+
+	/*
+	 * 2. Enable the pixel clock. This calls the PHY driver's .prepare op.
+	 */
+	ret = clk_prepare_enable(ctrl->clks[CLK_PCLK].clk);
+	if (ret) {
+		dev_err(dev, "Failed to enable pclk: %d\n", ret);
+		return;
+	}
+
+	/*
+	 * 3. Power on the PHY. This calls the PHY driver's .power_on op,
+	 * which configures the Post-PLL and analog blocks.
+	 */
+	ret = phy_power_on(ctrl->phy);
+	if (ret) {
+		dev_err(dev, "Failed to power on PHY: %d\n", ret);
+		clk_disable_unprepare(ctrl->clks[CLK_PCLK].clk);
+		return;
+	}
+
+	ctrl->enabled = true;
+}
+
+static void inno_hdmi_starfive_disable(struct device *dev)
+{
+	struct stf_inno_hdmi_controller *ctrl = dev_get_drvdata(dev);
+
+	/*
+	 * .enable bails out early if the pixel clock rate is unsupported or
+	 * the PHY fails to power on, leaving pclk and the PHY untouched.
+	 * Only tear down what was actually brought up, otherwise the clock
+	 * refcount underflows.
+	 */
+	if (!ctrl->enabled)
+		return;
+
+	phy_power_off(ctrl->phy);
+	clk_disable_unprepare(ctrl->clks[CLK_PCLK].clk);
+	ctrl->enabled = false;
+}
+
+/*
+ * The DC8200 has two panels, each exposing a DP and a DPI interface, and a mux
+ * in dom_vout_syscon picks which of them drives the HDMI transmitter. Derive
+ * the mux setting from the port graph: the remote port number selects the
+ * DC8200 panel, and the remote endpoint number the interface on that panel
+ * (0 for DPI, 1 for DP). Both drive 8-bit RGB, the only format this driver
+ * currently produces.
+ */
+static int stf_inno_hdmi_setup_mux(struct device *dev)
+{
+	struct of_endpoint endpoint;
+	struct regmap *syscon;
+	u32 mask, val;
+	int ret;
+
+	syscon = syscon_regmap_lookup_by_phandle(dev->of_node,
+						 "starfive,vout-syscon");
+	if (IS_ERR(syscon))
+		return dev_err_probe(dev, PTR_ERR(syscon),
+				     "Failed to get vout syscon\n");
+
+	struct device_node *ep __free(device_node) =
+		of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
+	if (!ep)
+		return dev_err_probe(dev, -ENODEV, "No input endpoint\n");
+
+	struct device_node *remote __free(device_node) =
+		of_graph_get_remote_endpoint(ep);
+	if (!remote)
+		return dev_err_probe(dev, -ENODEV,
+				     "Input endpoint is not connected\n");
+
+	ret = of_graph_parse_endpoint(remote, &endpoint);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to parse the remote endpoint\n");
+
+	if (endpoint.port > 1 || endpoint.id > 1)
+		return dev_err_probe(dev, -EINVAL,
+				     "Unsupported DC8200 output %u/%u\n",
+				     endpoint.port, endpoint.id);
+
+	/* Data mapping: 8-bit RGB on whichever interface is in use. */
+	mask = VOUT_HDMI_DPI_DP_SEL | VOUT_HDMI_DP_BIT_DEPTH |
+	       VOUT_HDMI_DP_YUV_MODE | VOUT_HDMI_DPI_BIT_DEPTH;
+	val = FIELD_PREP(VOUT_HDMI_DPI_DP_SEL, endpoint.id) |
+	      FIELD_PREP(VOUT_HDMI_DP_YUV_MODE, VOUT_HDMI_DP_YUV_MODE_RGB) |
+	      FIELD_PREP(VOUT_HDMI_DPI_BIT_DEPTH, VOUT_HDMI_DPI_BIT_DEPTH_8BIT);
+
+	ret = regmap_update_bits(syscon, VOUT_SYSCFG_4, mask, val);
+	if (ret)
+		return ret;
+
+	/* Which DC8200 panel drives the HDMI transmitter. */
+	return regmap_update_bits(syscon, VOUT_SYSCFG_8, VOUT_HDMI_PANEL_SEL,
+				  FIELD_PREP(VOUT_HDMI_PANEL_SEL,
+					     endpoint.port));
+}
+
+static void stf_inno_hdmi_clk_disable(void *data)
+{
+	struct stf_inno_hdmi_controller *ctrl = data;
+
+	clk_bulk_disable_unprepare(CLK_CTRL_NUM - 1, ctrl->clks);
+}
+
+static void stf_inno_hdmi_rst_assert(void *data)
+{
+	reset_control_assert(data);
+}
+
+static int starfive_inno_hdmi_controller_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct stf_inno_hdmi_controller *ctrl;
+	const struct inno_hdmi_plat_data *plat_data;
+	struct inno_hdmi *inno;
+	int ret;
+
+	ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
+	if (!ctrl)
+		return -ENOMEM;
+
+	ctrl->dev = dev;
+	platform_set_drvdata(pdev, ctrl);
+
+	ctrl->phy = devm_phy_get(dev, NULL);
+	if (IS_ERR(ctrl->phy))
+		return dev_err_probe(dev, PTR_ERR(ctrl->phy), "Failed to get PHY\n");
+
+	ctrl->tx_rst = devm_reset_control_get_exclusive(dev, NULL);
+	if (IS_ERR(ctrl->tx_rst))
+		return dev_err_probe(dev, PTR_ERR(ctrl->tx_rst), "failed to get tx reset\n");
+
+	/* Populate the clock names this controller *consumes* */
+	ctrl->clks[CLK_SYS].id = "pclk";
+	ctrl->clks[CLK_M].id = "mclk";
+	ctrl->clks[CLK_B].id = "bclk";
+	ctrl->clks[CLK_PCLK].id = "pixel"; /* Generated by the PHY */
+
+	ret = devm_clk_bulk_get(dev, CLK_CTRL_NUM, ctrl->clks);
+	if (ret)
+		return dev_err_probe(dev, ret, "Unable to get controller clocks\n");
+
+	/*
+	 * Tear the clocks and the reset down through devm, so that they outlive
+	 * everything registered after them. The bridge is added with
+	 * devm_drm_bridge_add(), and unwinding in the wrong order would leave it
+	 * registered while its clocks are already gated.
+	 *
+	 * The pixel clock is enabled on demand during modeset.
+	 */
+	ret = clk_bulk_prepare_enable(CLK_CTRL_NUM - 1, ctrl->clks);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, stf_inno_hdmi_clk_disable, ctrl);
+	if (ret)
+		return ret;
+
+	ret = reset_control_deassert(ctrl->tx_rst);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, stf_inno_hdmi_rst_assert,
+				       ctrl->tx_rst);
+	if (ret)
+		return ret;
+
+	ret = stf_inno_hdmi_setup_mux(dev);
+	if (ret)
+		return ret;
+
+	plat_data = of_device_get_match_data(dev);
+
+	/* Hand off to the generic library to create the bridge. */
+	inno = inno_hdmi_probe(pdev, plat_data);
+	if (IS_ERR(inno))
+		return PTR_ERR(inno);
+
+	return 0;
+}
+
+static const struct inno_hdmi_plat_ops stf_inno_hdmi_plat_ops = {
+	.enable = inno_hdmi_starfive_enable,
+	.disable = inno_hdmi_starfive_disable,
+	.mode_valid = inno_hdmi_starfive_mode_valid,
+};
+
+static const struct inno_hdmi_plat_data stf_inno_hdmi_plat_data = {
+	.ops = &stf_inno_hdmi_plat_ops,
+};
+
+static const struct of_device_id starfive_hdmi_controller_dt_ids[] = {
+	{ .compatible = "starfive,jh7110-inno-hdmi-controller",
+	  .data = &stf_inno_hdmi_plat_data },
+	{}
+};
+MODULE_DEVICE_TABLE(of, starfive_hdmi_controller_dt_ids);
+
+struct platform_driver starfive_inno_hdmi_controller_driver = {
+	.probe = starfive_inno_hdmi_controller_probe,
+	.driver = {
+		.name = "starfive-inno-hdmi-controller",
+		.of_match_table = starfive_hdmi_controller_dt_ids,
+	},
+};
+module_platform_driver(starfive_inno_hdmi_controller_driver);
+
+MODULE_AUTHOR("Michal Wilczynski <m.wilczynski@samsung.com>");
+MODULE_DESCRIPTION("StarFive INNO HDMI Controller Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


