Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 818A4C44506
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 14:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TPCgKA/8evMN2+jokM1ZCW9bjomv/a7JzxFbxS6ykM8=; b=yWLJQN0PaJY9ZDrJOnOlWJJJld
	6J7jAr6B288odyl114PyOIT9mUqmA/DOBfWIHu9nN7FXh2XRcr7IuComAEGdbmmfR4MQL7hwFx6WU
	bp/DgxUMZOS165sjKjybANF5repU7UxXD7vFwavDqMHJuWedPKljAP3Ka9kEV30r+aIKaECKc6mEv
	rjS97D0vLhdeU2bw3mRw4sdua3jrhkgRuTHlSvtYWRTrhRISWgcZBrzdoDt5e36SNEghPeYX4RcHQ
	eblzH+olYpTE4gPP2ka2v+HBbO2YnbZKSA5qcDRQzC56lNEswu0mXjFbh/JYCUwlTwIm4IKtHhoTk
	svBIH7Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfIhE-00000004fuy-27ie;
	Thu, 02 Jul 2026 14:47:20 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfIgi-00000004ejC-1kwj;
	Thu, 02 Jul 2026 14:46:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783003605;
	bh=v3yNONXSAXcHWFvJTd8VpBAurXIUE0v+gr4lFAlFseg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iMk0QQEKO/CJpKo5LZIbGiwpoxmNrZB0CE0OpgAWDo58PCfiwK/J/PlRo59T8gm9R
	 uD+hghdblnDfl4MpuRqQo8e69qOOTqrG/woQb9MEvSsvW/HRUKXkfs5cN9/8bWhTKk
	 BclcW96hTrrXQoqYfv8Iyn1o89CehaCuhs6f3nh17hVL2M4V7JW0deAaWA29xW26Hl
	 gZYl0hGiEDUJN3ZJ/ELvdUTgF156xC5AxwZDw7/uAHmvMt1a5l8ZfsfAjjgt2rzuf/
	 S9fJvEzt0iM6BCQaz2imoh6AOXUcPx+V+eESOAaFrg9ktmz0Q+2rPBxznEul7yRG1D
	 E+5NbOYNTmeFA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BCE2F17E360C;
	Thu,  2 Jul 2026 16:46:45 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 02 Jul 2026 17:46:32 +0300
Subject: [PATCH v8 19/39] drm/bridge: dw-hdmi-qp: Add HDMI 2.0 SCDC
 scrambling support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-dw-hdmi-qp-scramb-v8-19-d79890d00b6a@collabora.com>
References: <20260702-dw-hdmi-qp-scramb-v8-0-d79890d00b6a@collabora.com>
In-Reply-To: <20260702-dw-hdmi-qp-scramb-v8-0-d79890d00b6a@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Daniel Stone <daniels@collabora.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Diederik de Haas <diederik@cknow-tech.com>, 
 Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_074648_647172_399F0D4F 
X-CRM114-Status: GOOD (  19.18  )
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

Enable HDMI 2.0 display modes (e.g. 4K@60Hz) by implementing SCDC
scrambling and high TMDS clock ratio management for TMDS character
rates exceeding the 340 MHz HDMI 1.4b limit.

Reject modes requiring TMDS rates above 600 MHz since those require
HDMI 2.1 FRL which is not yet supported.  In no_hpd configurations,
further restrict to 340 MHz because SCDC requires a connected sink.

Tested-by: Diederik de Haas <diederik@cknow-tech.com>
Tested-by: Maud Spierings <maud_spierings@hotmail.com>
Acked-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 73 ++++++++++++++++++++--------
 1 file changed, 54 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index a0613f0d2ebc..07b274f76e53 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -2,6 +2,7 @@
 /*
  * Copyright (c) 2021-2022 Rockchip Electronics Co., Ltd.
  * Copyright (c) 2024 Collabora Ltd.
+ * Copyright (c) 2025 Amazon.com, Inc. or its affiliates.
  *
  * Author: Algea Cao <algea.cao@rock-chips.com>
  * Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
@@ -15,7 +16,6 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
-#include <linux/workqueue.h>
 
 #include <drm/bridge/dw_hdmi_qp.h>
 #include <drm/display/drm_hdmi_helper.h>
@@ -38,8 +38,6 @@
 #define DDC_CI_ADDR		0x37
 #define DDC_SEGMENT_ADDR	0x30
 
-#define SCRAMB_POLL_DELAY_MS	3000
-
 /*
  * Unless otherwise noted, entries in this table are 100% optimization.
  * Values can be obtained from dw_hdmi_qp_compute_n() but that function is
@@ -162,6 +160,7 @@ struct dw_hdmi_qp {
 	} phy;
 
 	unsigned long ref_clk_rate;
+	struct drm_connector *curr_conn;
 	struct regmap *regm;
 	int main_irq;
 
@@ -752,26 +751,33 @@ static void dw_hdmi_qp_bridge_atomic_enable(struct drm_bridge *bridge,
 {
 	struct dw_hdmi_qp *hdmi = bridge->driver_private;
 	struct drm_connector_state *conn_state;
-	struct drm_connector *connector;
 	unsigned int op_mode;
+	int ret;
 
-	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
-	if (WARN_ON(!connector))
+	hdmi->curr_conn = drm_atomic_get_new_connector_for_encoder(state,
+								   bridge->encoder);
+	if (WARN_ON(!hdmi->curr_conn))
 		return;
 
-	conn_state = drm_atomic_get_new_connector_state(state, connector);
+	conn_state = drm_atomic_get_new_connector_state(state, hdmi->curr_conn);
 	if (WARN_ON(!conn_state))
 		return;
 
-	if (connector->display_info.is_hdmi) {
-		dev_dbg(hdmi->dev, "%s mode=HDMI %s rate=%llu bpc=%u\n", __func__,
-			drm_hdmi_connector_get_output_format_name(conn_state->hdmi.output_format),
-			conn_state->hdmi.tmds_char_rate, conn_state->hdmi.output_bpc);
+	if (hdmi->curr_conn->display_info.is_hdmi) {
 		op_mode = 0;
 		hdmi->tmds_char_rate = conn_state->hdmi.tmds_char_rate;
+
+		ret = drm_connector_hdmi_enable_scrambling(hdmi->curr_conn, conn_state);
+		if (ret)
+			dev_warn(hdmi->dev, "Failed to setup SCDC: %d\n", ret);
+
+		dev_dbg(hdmi->dev, "%s mode=HDMI %s rate=%llu bpc=%u scramb=%d\n", __func__,
+			drm_hdmi_connector_get_output_format_name(conn_state->hdmi.output_format),
+			conn_state->hdmi.tmds_char_rate, conn_state->hdmi.output_bpc,
+			hdmi->curr_conn->hdmi.scrambler_enabled);
 	} else {
-		dev_dbg(hdmi->dev, "%s mode=DVI\n", __func__);
 		op_mode = OPMODE_DVI;
+		dev_dbg(hdmi->dev, "%s mode=DVI\n", __func__);
 	}
 
 	hdmi->phy.ops->init(hdmi, hdmi->phy.data);
@@ -779,7 +785,7 @@ static void dw_hdmi_qp_bridge_atomic_enable(struct drm_bridge *bridge,
 	dw_hdmi_qp_mod(hdmi, HDCP2_BYPASS, HDCP2_BYPASS, HDCP2LOGIC_CONFIG0);
 	dw_hdmi_qp_mod(hdmi, op_mode, OPMODE_DVI, LINK_CONFIG0);
 
-	drm_atomic_helper_connector_hdmi_update_infoframes(connector, state);
+	drm_atomic_helper_connector_hdmi_update_infoframes(hdmi->curr_conn, state);
 }
 
 static void dw_hdmi_qp_bridge_atomic_disable(struct drm_bridge *bridge,
@@ -787,8 +793,14 @@ static void dw_hdmi_qp_bridge_atomic_disable(struct drm_bridge *bridge,
 {
 	struct dw_hdmi_qp *hdmi = bridge->driver_private;
 
+	if (!hdmi->curr_conn)
+		return;
+
 	hdmi->tmds_char_rate = 0;
 
+	drm_connector_hdmi_disable_scrambling(hdmi->curr_conn);
+
+	hdmi->curr_conn = NULL;
 	hdmi->phy.ops->disable(hdmi, hdmi->phy.data);
 }
 
@@ -830,12 +842,12 @@ dw_hdmi_qp_bridge_tmds_char_rate_valid(const struct drm_bridge *bridge,
 {
 	struct dw_hdmi_qp *hdmi = bridge->driver_private;
 
-	/*
-	 * TODO: when hdmi->no_hpd is 1 we must not support modes that
-	 * require scrambling, including every mode with a clock above
-	 * HDMI_1_3_TMDS_CHAR_RATE_MAX_HZ.
-	 */
-	if (rate > HDMI_1_3_TMDS_CHAR_RATE_MAX_HZ) {
+	if (hdmi->no_hpd && rate > HDMI_1_3_TMDS_CHAR_RATE_MAX_HZ) {
+		dev_dbg(hdmi->dev, "Unsupported TMDS char rate in no_hpd mode: %lld\n", rate);
+		return MODE_CLOCK_HIGH;
+	}
+
+	if (rate > HDMI_2_0_TMDS_CHAR_RATE_MAX_HZ) {
 		dev_dbg(hdmi->dev, "Unsupported TMDS char rate: %lld\n", rate);
 		return MODE_CLOCK_HIGH;
 	}
@@ -843,6 +855,26 @@ dw_hdmi_qp_bridge_tmds_char_rate_valid(const struct drm_bridge *bridge,
 	return MODE_OK;
 }
 
+static int dw_hdmi_qp_bridge_scrambler_enable(struct drm_bridge *bridge)
+{
+	struct dw_hdmi_qp *hdmi = bridge->driver_private;
+
+	dw_hdmi_qp_write(hdmi, 1, SCRAMB_CONFIG0);
+	dev_dbg(hdmi->dev, "scrambler enabled\n");
+
+	return 0;
+}
+
+static int dw_hdmi_qp_bridge_scrambler_disable(struct drm_bridge *bridge)
+{
+	struct dw_hdmi_qp *hdmi = bridge->driver_private;
+
+	dw_hdmi_qp_write(hdmi, 0, SCRAMB_CONFIG0);
+	dev_dbg(hdmi->dev, "scrambler disabled\n");
+
+	return 0;
+}
+
 static int dw_hdmi_qp_bridge_clear_avi_infoframe(struct drm_bridge *bridge)
 {
 	struct dw_hdmi_qp *hdmi = bridge->driver_private;
@@ -1217,6 +1249,8 @@ static const struct drm_bridge_funcs dw_hdmi_qp_bridge_funcs = {
 	.hpd_disable = dw_hdmi_qp_bridge_hpd_disable,
 	.edid_read = dw_hdmi_qp_bridge_edid_read,
 	.hdmi_tmds_char_rate_valid = dw_hdmi_qp_bridge_tmds_char_rate_valid,
+	.hdmi_scrambler_enable = dw_hdmi_qp_bridge_scrambler_enable,
+	.hdmi_scrambler_disable = dw_hdmi_qp_bridge_scrambler_disable,
 	.hdmi_clear_avi_infoframe = dw_hdmi_qp_bridge_clear_avi_infoframe,
 	.hdmi_write_avi_infoframe = dw_hdmi_qp_bridge_write_avi_infoframe,
 	.hdmi_clear_hdmi_infoframe = dw_hdmi_qp_bridge_clear_hdmi_infoframe,
@@ -1350,6 +1384,7 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	hdmi->bridge.vendor = "Synopsys";
 	hdmi->bridge.product = "DW HDMI QP TX";
+	hdmi->bridge.supported_hdmi_ver = HDMI_VERSION_2_0;
 
 	if (plat_data->supported_formats)
 		hdmi->bridge.supported_formats = plat_data->supported_formats;

-- 
2.54.0


