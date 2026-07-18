Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA1CC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jul 2026 11:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iX+mNcsLzoRlbFysdi2lELSN0lTLQ6Chr+xxoRDbP5k=; b=SBLhiTbjHQcXA0iviPVNp6bcl6
	TVeGf58pyTYSnkjMe2F/jPCuz9GDBsail/yowjP5Zp8FTbu3r+payWmNMvK6eBq8uBwBAuh411A8O
	tGCN2cgFvCy1AR5YcW/HSmLU49lSPeeA4jDW+KNy4Q5fGGtplN3Tf7qx/IksxbrueOtV5gY/zZ4sK
	uObNkPt1uyiKT9xW9brOlH4JSs377UDFhyTbRRHupbN6VeckhKEsjV2zS000+KKXR+S5RHSKe5RUD
	kphuju6cTFVIyUs6RuY1hZXILh4Uaixb5BshXkYRVmLQMfcg2YJrA7hUffRL4HuzxBM/f5JPoaUD5
	ZPIP04uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl33c-000000042pL-1Kxw;
	Sat, 18 Jul 2026 11:18:12 +0000
Received: from out-182.mta1.migadu.com ([95.215.58.182])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl33Z-000000042mm-22Bx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jul 2026 11:18:11 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mieulab.com; s=key1;
	t=1784373487;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iX+mNcsLzoRlbFysdi2lELSN0lTLQ6Chr+xxoRDbP5k=;
	b=QPMlD6/O5/Lsvl23y5B4KKBWFZMRIMHic9yi0aOgL8KgoVFqgXC765fppxcTzX/tAlZUsr
	BWmeHq/uIjJkvjHNlG5xgqUxgd3zu2rdQTWLl2lf1zNyKnN0u/SiWuyif8GwCxVFXtKoHT
	MZe52lPofJxNEZXBlPHi3XNOH084F5Ypk64LgnlrFGH6icm/iT7OZ8CCBwihHJYoeXv6o1
	SlpEy/+K9RSVS9PVcvnkisHCpnMRoNvz0VilZU6fQeiIIg4dCNPIKm2mqYjWEsutAfRXVD
	FOAHNBF3fxg7NA4KcP094WBjg1jNl53PkRL7V/dmUYUXuQ9xsBLLOYMYX1XQ0w==
From: Zinan Zhou <zinan@mieulab.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Zinan Zhou <zinan@mieulab.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/2] drm/meson: add GXLX2 HDMI register support
Date: Sat, 18 Jul 2026 20:15:27 +0900
Message-ID: <20260718111527.119231-3-zinan@mieulab.com>
In-Reply-To: <20260718111527.119231-1-zinan@mieulab.com>
References: <20260718111527.119231-1-zinan@mieulab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_041809_670076_957EE8D7 
X-CRM114-Status: GOOD (  19.76  )
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

GXLX2 combines a GXL-like display pipeline and HDMI PHY with directly
mapped DesignWare and TOP registers. Reusing the indirect GX callbacks
returns an invalid HDMI controller ID and prevents the HDMI component from
binding.

Add GXLX2 match data using the existing direct register callbacks, while
retaining the GXL PHY initialization values. Do not enable APB3
fail-on-error through the legacy indirect control-register offsets for a
direct-register device. Add the compatible to the VPU component match list
and use the GXLX2-specific HHI_HDMI_PHY_CNTL0 value for the 297 MHz
pixel-clock bucket.

The register layout and the 297 MHz value were determined by analysis of
the HG680-LC vendor kernel. Public Amlogic-derived source independently
documents the direct access mechanism and the ordinary GXL PHY values; no
vendor code is copied by this change.

An equivalent Linux 6.6 implementation was tested on an HG680-LC with 1080p
HDMI video and two-channel HDMI audio. The Linux 6.12 port boots from eMMC
with working Ethernet, 1080p and native 1440p video, and two-channel HDMI
audio. This port has passed arm64 compilation; 4K30 physical validation of
the 297 MHz branch remains pending.

Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Zinan Zhou <zinan@mieulab.com>
---
 drivers/gpu/drm/meson/meson_drv.c     |  1 +
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 33 +++++++++++++++++++++++----
 2 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 49ff9f1f16d3..5c136743e60c 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -469,6 +469,7 @@ static void meson_drv_shutdown(struct platform_device *pdev)
 static const struct of_device_id components_dev_match[] = {
 	{ .compatible = "amlogic,meson-gxbb-dw-hdmi" },
 	{ .compatible = "amlogic,meson-gxl-dw-hdmi" },
+	{ .compatible = "amlogic,meson-gxlx2-dw-hdmi" },
 	{ .compatible = "amlogic,meson-gxm-dw-hdmi" },
 	{ .compatible = "amlogic,meson-g12a-dw-hdmi" },
 	{}
diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 1004108fb7ca..f02d6a513dd3 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -136,6 +136,8 @@ struct meson_dw_hdmi_data {
 				     unsigned int addr, unsigned int data);
 	u32 cntl0_init;
 	u32 cntl1_init;
+	u32 phy_cntl0_3g;
+	bool uses_direct_regs;
 };
 
 struct meson_dw_hdmi {
@@ -287,7 +289,9 @@ static void meson_hdmi_phy_setup_mode(struct meson_dw_hdmi *dw_hdmi,
 	/* For 420, pixel clock is half unlike venc clock */
 	if (mode_is_420) pixel_clock /= 2;
 
-	if (dw_hdmi_is_compatible(dw_hdmi, "amlogic,meson-gxl-dw-hdmi") ||
+	if (dw_hdmi_is_compatible(dw_hdmi,
+				  "amlogic,meson-gxlx2-dw-hdmi") ||
+	    dw_hdmi_is_compatible(dw_hdmi, "amlogic,meson-gxl-dw-hdmi") ||
 	    dw_hdmi_is_compatible(dw_hdmi, "amlogic,meson-gxm-dw-hdmi")) {
 		if (pixel_clock >= 371250) {
 			/* 5.94Gbps, 3.7125Gbps */
@@ -295,7 +299,8 @@ static void meson_hdmi_phy_setup_mode(struct meson_dw_hdmi *dw_hdmi,
 			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL3, 0x2136315b);
 		} else if (pixel_clock >= 297000) {
 			/* 2.97Gbps */
-			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0, 0x33303382);
+			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0,
+				     dw_hdmi->data->phy_cntl0_3g);
 			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL3, 0x2036315b);
 		} else if (pixel_clock >= 148500) {
 			/* 1.485Gbps */
@@ -586,6 +591,7 @@ static const struct meson_dw_hdmi_data meson_dw_hdmi_gxl_data = {
 	.dwc_write = dw_hdmi_dwc_write,
 	.cntl0_init = 0x0,
 	.cntl1_init = PHY_CNTL1_INIT,
+	.phy_cntl0_3g = 0x33303382,
 };
 
 static const struct meson_dw_hdmi_data meson_dw_hdmi_g12a_data = {
@@ -595,6 +601,19 @@ static const struct meson_dw_hdmi_data meson_dw_hdmi_g12a_data = {
 	.dwc_write = dw_hdmi_g12a_dwc_write,
 	.cntl0_init = 0x000b4242, /* Bandgap */
 	.cntl1_init = PHY_CNTL1_INIT,
+	.uses_direct_regs = true,
+};
+
+/* GXLX2 uses the direct register layout with the older GXL PHY setup. */
+static const struct meson_dw_hdmi_data meson_dw_hdmi_gxlx2_data = {
+	.top_read = dw_hdmi_g12a_top_read,
+	.top_write = dw_hdmi_g12a_top_write,
+	.dwc_read = dw_hdmi_g12a_dwc_read,
+	.dwc_write = dw_hdmi_g12a_dwc_write,
+	.cntl0_init = 0x0,
+	.cntl1_init = PHY_CNTL1_INIT,
+	.phy_cntl0_3g = 0x33353382,
+	.uses_direct_regs = true,
 };
 
 static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
@@ -612,8 +631,8 @@ static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
 	reset_control_reset(meson_dw_hdmi->hdmitx_ctrl);
 	reset_control_reset(meson_dw_hdmi->hdmitx_phy);
 
-	/* Enable APB3 fail on error */
-	if (!meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {
+	/* The APB3 control registers exist only with the indirect interface. */
+	if (!meson_dw_hdmi->data->uses_direct_regs) {
 		writel_bits_relaxed(BIT(15), BIT(15),
 				    meson_dw_hdmi->hdmitx + HDMITX_TOP_CTRL_REG);
 		writel_bits_relaxed(BIT(15), BIT(15),
@@ -769,7 +788,9 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 	dw_plat_data->disable_cec = true;
 	dw_plat_data->output_port = 1;
 
-	if (dw_hdmi_is_compatible(meson_dw_hdmi, "amlogic,meson-gxl-dw-hdmi") ||
+	if (dw_hdmi_is_compatible(meson_dw_hdmi,
+				  "amlogic,meson-gxlx2-dw-hdmi") ||
+	    dw_hdmi_is_compatible(meson_dw_hdmi, "amlogic,meson-gxl-dw-hdmi") ||
 	    dw_hdmi_is_compatible(meson_dw_hdmi, "amlogic,meson-gxm-dw-hdmi") ||
 	    dw_hdmi_is_compatible(meson_dw_hdmi, "amlogic,meson-g12a-dw-hdmi"))
 		dw_plat_data->use_drm_infoframe = true;
@@ -854,6 +875,8 @@ static const struct of_device_id meson_dw_hdmi_of_table[] = {
 	  .data = &meson_dw_hdmi_gxl_data },
 	{ .compatible = "amlogic,meson-gxm-dw-hdmi",
 	  .data = &meson_dw_hdmi_gxl_data },
+	{ .compatible = "amlogic,meson-gxlx2-dw-hdmi",
+	  .data = &meson_dw_hdmi_gxlx2_data },
 	{ .compatible = "amlogic,meson-g12a-dw-hdmi",
 	  .data = &meson_dw_hdmi_g12a_data },
 	{ }
-- 
2.43.0


