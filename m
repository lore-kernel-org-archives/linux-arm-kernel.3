Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31831C71157
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Jun 2025 09:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nbvig/jTFwQDaN0Eob9TynhtIAx7cn0+vcLA6cVezeQ=; b=JQ7WxKRZBnd7nks4ARjvCyq9SI
	EFte0pVSVWvXCxzbT3lSxh5W/i7R2i+a50z5icYH/xCXxTmit18HK3WeoVa5FVGgg1Z6LoxJ2bc1A
	VK/4POFtZA551Gnnk4saMYoWpNzvUlCXRwJSzCc876tGNpRxGrtiVZftt+JOOcawpTsyyyoMFzBZD
	x9kW3Njytp/a/GoR6jBib093IkYJF7LYMvBA16eOnx4cPI9c9GBKl1j+DUdTxoc+6nf91obtBmMUW
	PHsKVuJNTWz1OP2L3vW0AzEtdHloaeDG62auNjc13vCNl05hdsDVbmMTRjj8TibbrrJGoox4gWhDP
	le7rL4cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSui7-0000000HJTO-2u2a;
	Sat, 21 Jun 2025 09:40:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSuft-0000000HJ9o-1Oly
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Jun 2025 09:38:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6D8D3629FE;
	Sat, 21 Jun 2025 09:38:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CD82EC4CEF5;
	Sat, 21 Jun 2025 09:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750498690;
	bh=Jn69V99WqEMOeUUnu6IwBq79MixrN7CmMJy0Wm7f0as=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MWJPqmOomMv9hxomgr/bcPKjEGj7CAq2O3fEV1Oko2BDR2IJtP1E7KYbPk2QdzrwR
	 mepXaKf2LTwOce0L5iT/tfS37lbN0w5NkQHFg+GX4ZsWfErDHqf1tMN2bncnY7HXcg
	 SEs4G0TjzWWag2Q3WhdpDUHbjJqe02WqyT6HGJsm1PIJaW/kaNWXv7qlBzg21LV0CP
	 RTBWABl2hg2QZxndN1A24VlyQv8AoeR9Hj8a6dz7PU8kfpEUFuOu+WzpRDLjYumKWk
	 ZY9j3EuRNQQ5yIZ+moWAoynaQHmXg3FaP0LjPQCfFLkMISC2/TVAw30c/NxNvH38eq
	 cJhxmamY+RU4Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C00A6C7EE2E;
	Sat, 21 Jun 2025 09:38:10 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Sat, 21 Jun 2025 11:37:27 +0200
Subject: [PATCH RESEND v4 3/5] media: i2c: imx214: Make use of CCS PLL
 calculator
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250621-imx214_ccs_pll-v4-3-12178e5eb989@apitzsch.eu>
References: <20250621-imx214_ccs_pll-v4-0-12178e5eb989@apitzsch.eu>
In-Reply-To: <20250621-imx214_ccs_pll-v4-0-12178e5eb989@apitzsch.eu>
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750498689; l=13278;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=IN79pUdjeGsEClGOvVxEAma4R+7i5s6SAxPLcUDcj2U=;
 b=MipVLZP0gimoLX+0jDNWVoTOKUEIzfBmQyIzkSCcZErKTCjU4orWuP5BV2OdNtdDa8qd5AaMl
 AUJRJ5KZnO8AFQv0ZSKEIVShubtiWzpG8KxCtOQRiFHvshXPPmC89hs
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
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
Reply-To: git@apitzsch.eu
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: André Apitzsch <git@apitzsch.eu>

Calculate PLL parameters based on clock frequency and link frequency.

Acked-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/i2c/Kconfig  |   1 +
 drivers/media/i2c/imx214.c | 213 ++++++++++++++++++++++++++++++++++++---------
 2 files changed, 175 insertions(+), 39 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index e68202954a8fd4711d108cf295d5771246fbc406..08db8abeea218080b0bf5bfe6cf82f1c0b100c4a 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -141,6 +141,7 @@ config VIDEO_IMX214
 	depends on GPIOLIB
 	select REGMAP_I2C
 	select V4L2_CCI_I2C
+	select VIDEO_CCS_PLL
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
 	  IMX214 camera.
diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index c564c9ca82488dddd6b8f549749042ae44363c0d..fd03650a5b2bbdbbc677d5797380285f1832baa5 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -20,6 +20,8 @@
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
+#include "ccs-pll.h"
+
 /* Chip ID */
 #define IMX214_REG_CHIP_ID		CCI_REG16(0x0016)
 #define IMX214_CHIP_ID			0x0214
@@ -34,7 +36,6 @@
 #define IMX214_DEFAULT_LINK_FREQ	600000000
 /* Keep wrong link frequency for backward compatibility */
 #define IMX214_DEFAULT_LINK_FREQ_LEGACY	480000000
-#define IMX214_DEFAULT_PIXEL_RATE ((IMX214_DEFAULT_LINK_FREQ * 8LL) / 10)
 #define IMX214_FPS 30
 
 /* V-TIMING internal */
@@ -84,6 +85,7 @@
 #define IMX214_CSI_DATA_FORMAT_RAW10	0x0A0A
 #define IMX214_CSI_DATA_FORMAT_COMP6	0x0A06
 #define IMX214_CSI_DATA_FORMAT_COMP8	0x0A08
+#define IMX214_BITS_PER_PIXEL_MASK	0xFF
 
 #define IMX214_REG_CSI_LANE_MODE	CCI_REG8(0x0114)
 #define IMX214_CSI_2_LANE_MODE		1
@@ -249,6 +251,10 @@ struct imx214 {
 	struct clk *xclk;
 	struct regmap *regmap;
 
+	struct ccs_pll pll;
+
+	struct v4l2_fwnode_endpoint bus_cfg;
+
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 
@@ -758,16 +764,22 @@ static int imx214_configure_pll(struct imx214 *imx214)
 {
 	int ret = 0;
 
-	cci_write(imx214->regmap, IMX214_REG_VTPXCK_DIV, 5, &ret);
-	cci_write(imx214->regmap, IMX214_REG_VTSYCK_DIV, 2, &ret);
-	cci_write(imx214->regmap, IMX214_REG_PREPLLCK_VT_DIV, 3, &ret);
-	cci_write(imx214->regmap, IMX214_REG_PLL_VT_MPY, 150, &ret);
-	cci_write(imx214->regmap, IMX214_REG_OPPXCK_DIV, 10, &ret);
-	cci_write(imx214->regmap, IMX214_REG_OPSYCK_DIV, 1, &ret);
+	cci_write(imx214->regmap, IMX214_REG_VTPXCK_DIV,
+		  imx214->pll.vt_bk.pix_clk_div, &ret);
+	cci_write(imx214->regmap, IMX214_REG_VTSYCK_DIV,
+		  imx214->pll.vt_bk.sys_clk_div, &ret);
+	cci_write(imx214->regmap, IMX214_REG_PREPLLCK_VT_DIV,
+		  imx214->pll.vt_fr.pre_pll_clk_div, &ret);
+	cci_write(imx214->regmap, IMX214_REG_PLL_VT_MPY,
+		  imx214->pll.vt_fr.pll_multiplier, &ret);
+	cci_write(imx214->regmap, IMX214_REG_OPPXCK_DIV,
+		  imx214->pll.op_bk.pix_clk_div, &ret);
+	cci_write(imx214->regmap, IMX214_REG_OPSYCK_DIV,
+		  imx214->pll.op_bk.sys_clk_div, &ret);
 	cci_write(imx214->regmap, IMX214_REG_PLL_MULT_DRIV,
 		  IMX214_PLL_SINGLE, &ret);
 	cci_write(imx214->regmap, IMX214_REG_EXCK_FREQ,
-		  IMX214_EXCK_FREQ(IMX214_DEFAULT_CLK_FREQ / 1000000), &ret);
+		  IMX214_EXCK_FREQ(imx214->pll.ext_clk_freq_hz / 1000000), &ret);
 
 	return ret;
 }
@@ -872,9 +884,6 @@ static const struct v4l2_ctrl_ops imx214_ctrl_ops = {
 
 static int imx214_ctrls_init(struct imx214 *imx214)
 {
-	static const s64 link_freq[] = {
-		IMX214_DEFAULT_LINK_FREQ
-	};
 	static const struct v4l2_area unit_size = {
 		.width = 1120,
 		.height = 1120,
@@ -895,15 +904,14 @@ static int imx214_ctrls_init(struct imx214 *imx214)
 	if (ret)
 		return ret;
 
-	imx214->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, NULL,
-					       V4L2_CID_PIXEL_RATE, 0,
-					       IMX214_DEFAULT_PIXEL_RATE, 1,
-					       IMX214_DEFAULT_PIXEL_RATE);
+	imx214->pixel_rate =
+		v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_PIXEL_RATE, 1,
+				  INT_MAX, 1, 1);
 
 	imx214->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, NULL,
 						   V4L2_CID_LINK_FREQ,
-						   ARRAY_SIZE(link_freq) - 1,
-						   0, link_freq);
+						   imx214->bus_cfg.nr_of_link_frequencies - 1,
+						   0, imx214->bus_cfg.link_frequencies);
 	if (imx214->link_freq)
 		imx214->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
@@ -1006,6 +1014,7 @@ static int imx214_start_streaming(struct imx214 *imx214)
 	const struct v4l2_mbus_framefmt *fmt;
 	struct v4l2_subdev_state *state;
 	const struct imx214_mode *mode;
+	int bit_rate_mbps;
 	int ret;
 
 	ret = cci_multi_reg_write(imx214->regmap, mode_table_common,
@@ -1021,8 +1030,10 @@ static int imx214_start_streaming(struct imx214 *imx214)
 		return ret;
 	}
 
+	bit_rate_mbps = (imx214->pll.pixel_rate_csi / 1000000)
+			* imx214->pll.bits_per_pixel;
 	ret = cci_write(imx214->regmap, IMX214_REG_REQ_LINK_BIT_RATE,
-			IMX214_LINK_BIT_RATE_MBPS(4800), NULL);
+			IMX214_LINK_BIT_RATE_MBPS(bit_rate_mbps), NULL);
 	if (ret) {
 		dev_err(imx214->dev, "failed to configure link bit rate\n");
 		return ret;
@@ -1105,6 +1116,109 @@ static int imx214_s_stream(struct v4l2_subdev *subdev, int enable)
 	return ret;
 }
 
+static int imx214_pll_calculate(struct imx214 *imx214, struct ccs_pll *pll,
+				unsigned int link_freq)
+{
+	struct ccs_pll_limits limits = {
+		.min_ext_clk_freq_hz = 6000000,
+		.max_ext_clk_freq_hz = 27000000,
+
+		.vt_fr = {
+			.min_pre_pll_clk_div = 1,
+			.max_pre_pll_clk_div = 15,
+			/* Value is educated guess as we don't have a spec */
+			.min_pll_ip_clk_freq_hz = 6000000,
+			/* Value is educated guess as we don't have a spec */
+			.max_pll_ip_clk_freq_hz = 12000000,
+			.min_pll_multiplier = 12,
+			.max_pll_multiplier = 1200,
+			.min_pll_op_clk_freq_hz = 338000000,
+			.max_pll_op_clk_freq_hz = 1200000000,
+		},
+		.vt_bk = {
+			.min_sys_clk_div = 2,
+			.max_sys_clk_div = 4,
+			.min_pix_clk_div = 5,
+			.max_pix_clk_div = 10,
+			.min_pix_clk_freq_hz = 30000000,
+			.max_pix_clk_freq_hz = 120000000,
+		},
+		.op_bk = {
+			.min_sys_clk_div = 1,
+			.max_sys_clk_div = 2,
+			.min_pix_clk_div = 6,
+			.max_pix_clk_div = 10,
+			.min_pix_clk_freq_hz = 30000000,
+			.max_pix_clk_freq_hz = 120000000,
+		},
+
+		.min_line_length_pck_bin = IMX214_PPL_DEFAULT,
+		.min_line_length_pck = IMX214_PPL_DEFAULT,
+	};
+	unsigned int num_lanes = imx214->bus_cfg.bus.mipi_csi2.num_data_lanes;
+
+	/*
+	 * There are no documented constraints on the sys clock frequency, for
+	 * either branch. Recover them based on the PLL output clock frequency
+	 * and sys_clk_div limits on one hand, and the pix clock frequency and
+	 * the pix_clk_div limits on the other hand.
+	 */
+	limits.vt_bk.min_sys_clk_freq_hz =
+		max(limits.vt_fr.min_pll_op_clk_freq_hz / limits.vt_bk.max_sys_clk_div,
+		    limits.vt_bk.min_pix_clk_freq_hz * limits.vt_bk.min_pix_clk_div);
+	limits.vt_bk.max_sys_clk_freq_hz =
+		min(limits.vt_fr.max_pll_op_clk_freq_hz / limits.vt_bk.min_sys_clk_div,
+		    limits.vt_bk.max_pix_clk_freq_hz * limits.vt_bk.max_pix_clk_div);
+
+	limits.op_bk.min_sys_clk_freq_hz =
+		max(limits.vt_fr.min_pll_op_clk_freq_hz / limits.op_bk.max_sys_clk_div,
+		    limits.op_bk.min_pix_clk_freq_hz * limits.op_bk.min_pix_clk_div);
+	limits.op_bk.max_sys_clk_freq_hz =
+		min(limits.vt_fr.max_pll_op_clk_freq_hz / limits.op_bk.min_sys_clk_div,
+		    limits.op_bk.max_pix_clk_freq_hz * limits.op_bk.max_pix_clk_div);
+
+	memset(pll, 0, sizeof(*pll));
+
+	pll->bus_type = CCS_PLL_BUS_TYPE_CSI2_DPHY;
+	pll->op_lanes = num_lanes;
+	pll->vt_lanes = num_lanes;
+	pll->csi2.lanes = num_lanes;
+
+	pll->binning_horizontal = 1;
+	pll->binning_vertical = 1;
+	pll->scale_m = 1;
+	pll->scale_n = 1;
+	pll->bits_per_pixel =
+		IMX214_CSI_DATA_FORMAT_RAW10 & IMX214_BITS_PER_PIXEL_MASK;
+	pll->flags = CCS_PLL_FLAG_LANE_SPEED_MODEL;
+	pll->link_freq = link_freq;
+	pll->ext_clk_freq_hz = clk_get_rate(imx214->xclk);
+
+	return ccs_pll_calculate(imx214->dev, &limits, pll);
+}
+
+static int imx214_pll_update(struct imx214 *imx214)
+{
+	u64 link_freq;
+	int ret;
+
+	link_freq = imx214->bus_cfg.link_frequencies[imx214->link_freq->val];
+	ret = imx214_pll_calculate(imx214, &imx214->pll, link_freq);
+	if (ret) {
+		dev_err(imx214->dev, "PLL calculations failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = v4l2_ctrl_s_ctrl_int64(imx214->pixel_rate,
+				     imx214->pll.pixel_rate_pixel_array);
+	if (ret) {
+		dev_err(imx214->dev, "failed to set pixel rate\n");
+		return ret;
+	}
+
+	return 0;
+}
+
 static int imx214_get_frame_interval(struct v4l2_subdev *subdev,
 				     struct v4l2_subdev_state *sd_state,
 				     struct v4l2_subdev_frame_interval *fival)
@@ -1211,12 +1325,10 @@ static int imx214_identify_module(struct imx214 *imx214)
 	return 0;
 }
 
-static int imx214_parse_fwnode(struct device *dev)
+static int imx214_parse_fwnode(struct device *dev, struct imx214 *imx214)
 {
+	struct v4l2_fwnode_endpoint *bus_cfg = &imx214->bus_cfg;
 	struct fwnode_handle *endpoint;
-	struct v4l2_fwnode_endpoint bus_cfg = {
-		.bus_type = V4L2_MBUS_CSI2_DPHY,
-	};
 	unsigned int i;
 	int ret;
 
@@ -1224,42 +1336,52 @@ static int imx214_parse_fwnode(struct device *dev)
 	if (!endpoint)
 		return dev_err_probe(dev, -EINVAL, "endpoint node not found\n");
 
-	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &bus_cfg);
+	bus_cfg->bus_type = V4L2_MBUS_CSI2_DPHY;
+	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, bus_cfg);
+	fwnode_handle_put(endpoint);
 	if (ret) {
 		dev_err_probe(dev, ret, "parsing endpoint node failed\n");
-		goto done;
+		goto error;
 	}
 
 	/* Check the number of MIPI CSI2 data lanes */
-	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 4) {
+	if (bus_cfg->bus.mipi_csi2.num_data_lanes != 4) {
 		ret = dev_err_probe(dev, -EINVAL,
 				    "only 4 data lanes are currently supported\n");
-		goto done;
+		goto error;
 	}
 
-	if (bus_cfg.nr_of_link_frequencies != 1)
+	if (bus_cfg->nr_of_link_frequencies != 1)
 		dev_warn(dev, "Only one link-frequency supported, please review your DT. Continuing anyway\n");
 
-	for (i = 0; i < bus_cfg.nr_of_link_frequencies; i++) {
-		if (bus_cfg.link_frequencies[i] == IMX214_DEFAULT_LINK_FREQ)
+	for (i = 0; i < bus_cfg->nr_of_link_frequencies; i++) {
+		u64 freq = bus_cfg->link_frequencies[i];
+		struct ccs_pll pll;
+
+		if (!imx214_pll_calculate(imx214, &pll, freq))
 			break;
-		if (bus_cfg.link_frequencies[i] ==
-		    IMX214_DEFAULT_LINK_FREQ_LEGACY) {
+		if (freq == IMX214_DEFAULT_LINK_FREQ_LEGACY) {
 			dev_warn(dev,
 				 "link-frequencies %d not supported, please review your DT. Continuing anyway\n",
 				 IMX214_DEFAULT_LINK_FREQ);
+			freq = IMX214_DEFAULT_LINK_FREQ;
+			if (imx214_pll_calculate(imx214, &pll, freq))
+				continue;
+			bus_cfg->link_frequencies[i] = freq;
 			break;
 		}
 	}
 
-	if (i == bus_cfg.nr_of_link_frequencies)
+	if (i == bus_cfg->nr_of_link_frequencies)
 		ret = dev_err_probe(dev, -EINVAL,
-				    "link-frequencies %d not supported, please review your DT\n",
-				    IMX214_DEFAULT_LINK_FREQ);
+				    "link-frequencies %lld not supported, please review your DT\n",
+				    bus_cfg->nr_of_link_frequencies ?
+				    bus_cfg->link_frequencies[0] : 0);
 
-done:
-	v4l2_fwnode_endpoint_free(&bus_cfg);
-	fwnode_handle_put(endpoint);
+	return 0;
+
+error:
+	v4l2_fwnode_endpoint_free(&imx214->bus_cfg);
 	return ret;
 }
 
@@ -1299,7 +1421,7 @@ static int imx214_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(imx214->regmap),
 				     "failed to initialize CCI\n");
 
-	ret = imx214_parse_fwnode(dev);
+	ret = imx214_parse_fwnode(dev, imx214);
 	if (ret)
 		return ret;
 
@@ -1310,7 +1432,9 @@ static int imx214_probe(struct i2c_client *client)
 	 * Enable power initially, to avoid warnings
 	 * from clk_disable on power_off
 	 */
-	imx214_power_on(imx214->dev);
+	ret = imx214_power_on(imx214->dev);
+	if (ret < 0)
+		goto error_fwnode;
 
 	ret = imx214_identify_module(imx214);
 	if (ret)
@@ -1341,6 +1465,12 @@ static int imx214_probe(struct i2c_client *client)
 	pm_runtime_set_active(imx214->dev);
 	pm_runtime_enable(imx214->dev);
 
+	ret = imx214_pll_update(imx214);
+	if (ret < 0) {
+		dev_err_probe(dev, ret, "failed to update PLL\n");
+		goto error_subdev_cleanup;
+	}
+
 	ret = v4l2_async_register_subdev_sensor(&imx214->sd);
 	if (ret < 0) {
 		dev_err_probe(dev, ret,
@@ -1366,6 +1496,9 @@ static int imx214_probe(struct i2c_client *client)
 error_power_off:
 	imx214_power_off(imx214->dev);
 
+error_fwnode:
+	v4l2_fwnode_endpoint_free(&imx214->bus_cfg);
+
 	return ret;
 }
 
@@ -1378,6 +1511,8 @@ static void imx214_remove(struct i2c_client *client)
 	v4l2_subdev_cleanup(sd);
 	media_entity_cleanup(&imx214->sd.entity);
 	v4l2_ctrl_handler_free(&imx214->ctrls);
+	v4l2_fwnode_endpoint_free(&imx214->bus_cfg);
+
 	pm_runtime_disable(&client->dev);
 	if (!pm_runtime_status_suspended(&client->dev)) {
 		imx214_power_off(imx214->dev);

-- 
2.50.0



