Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61132CD5BB4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 18:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tC79GZ6FJUosLFmmmeASO+V/W6WKEl2vTtpHwzSGGZI=; b=xdjC6NYdM+h1ht+RTPdGX21XoL
	u0/oWjh0CNedbhlRrVK1tKZNDFPEFBiXUyyj33FLbEfIhl8+RjUnXOELYBt/whfhMD9+JTLfJU/k1
	rthdh029dfofUp/CL0ypaT6nlMo8ezzWtaDb3xraD6KT4MkLCIugDFOgLjp1b479SKGDtiZeOpjPm
	jMKykbcDe7m6RLtVFW/2pADKNCxVH8dtm318cqEYSAjGxxVO5vgV6TCD7CKscv35H7mzLg5/RyQan
	hlLaEwmJa8W3H1Waw6PmpFpk6zCNP5/I5W5dWNsMtYiT+7lTPQEQnkMB6rOCxxbwq7VUSwq0WmhPE
	ypy7X3OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPlor-00000005TLL-0m2v;
	Wed, 20 May 2026 18:39:01 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPloZ-00000005Sod-1GTA;
	Wed, 20 May 2026 18:38:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1779302321;
	bh=+AlUlXYPuD4QBdDr6IWTz1ePLPkqbWMlTfmCOUtJT1M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IPFsBvJJl7aKTEnylHpjaHos2kzCfeiNEdPFlmb24u8JKcbvRbmxnMrSoRyDbef4S
	 YcegJcExoXy1F1oTfTLi9S7np+xiYnmmE5UVghfkHvOIFttLZ9pnT39dcsdtOwsVBw
	 bop3p4bx8zBKHmwhFI7uCL8gtRGU9dlCMsLS7Baxjw+8EqYfVkI8217TP0C9gFJPIX
	 K/4g/Vy+8H5oYlMMmy/p8qJa21UnUD8SLSBWwTPuXaHzj8LyGd9iK17ttve5ll9gfi
	 jtV76PCZiOfq/ql7cbjf0+96bHX8HmdTyspzCVqfL3su/gPDmaiU1CAMlclKk2z+uw
	 urQYlDyX8ki9A==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D261E17E1534;
	Wed, 20 May 2026 20:38:40 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 20 May 2026 21:38:24 +0300
Subject: [PATCH v6 13/22] drm/bridge: dw-hdmi-qp: Add HDMI 2.0 SCDC
 scrambling support`
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-dw-hdmi-qp-scramb-v6-13-24b74603b782@collabora.com>
References: <20260520-dw-hdmi-qp-scramb-v6-0-24b74603b782@collabora.com>
In-Reply-To: <20260520-dw-hdmi-qp-scramb-v6-0-24b74603b782@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Daniel Stone <daniels@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Diederik de Haas <diederik@cknow-tech.com>, 
 Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_113843_578075_6027BB9D 
X-CRM114-Status: GOOD (  19.20  )
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
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 76 ++++++++++++++++++++--------
 1 file changed, 56 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index efa798aa23ac..001916a98da8 100644
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
@@ -15,12 +16,12 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
-#include <linux/workqueue.h>
 
 #include <drm/bridge/dw_hdmi_qp.h>
 #include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_cec_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
+#include <drm/display/drm_scdc_helper.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
@@ -39,8 +40,7 @@
 #define DDC_SEGMENT_ADDR	0x30
 
 #define HDMI14_MAX_TMDSCLK	340000000
-
-#define SCRAMB_POLL_DELAY_MS	3000
+#define HDMI20_MAX_TMDSRATE	600000000
 
 /*
  * Unless otherwise noted, entries in this table are 100% optimization.
@@ -164,6 +164,7 @@ struct dw_hdmi_qp {
 	} phy;
 
 	unsigned long ref_clk_rate;
+	struct drm_connector *curr_conn;
 	struct regmap *regm;
 	int main_irq;
 
@@ -754,26 +755,35 @@ static void dw_hdmi_qp_bridge_atomic_enable(struct drm_bridge *bridge,
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
+		if (hdmi->tmds_char_rate > HDMI14_MAX_TMDSCLK) {
+			ret = drm_scdc_start_scrambling(hdmi->curr_conn);
+			if (ret)
+				dev_warn(hdmi->dev, "Failed to setup SCDC: %d\n", ret);
+		}
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
@@ -781,7 +791,7 @@ static void dw_hdmi_qp_bridge_atomic_enable(struct drm_bridge *bridge,
 	dw_hdmi_qp_mod(hdmi, HDCP2_BYPASS, HDCP2_BYPASS, HDCP2LOGIC_CONFIG0);
 	dw_hdmi_qp_mod(hdmi, op_mode, OPMODE_DVI, LINK_CONFIG0);
 
-	drm_atomic_helper_connector_hdmi_update_infoframes(connector, state);
+	drm_atomic_helper_connector_hdmi_update_infoframes(hdmi->curr_conn, state);
 }
 
 static void dw_hdmi_qp_bridge_atomic_disable(struct drm_bridge *bridge,
@@ -791,6 +801,9 @@ static void dw_hdmi_qp_bridge_atomic_disable(struct drm_bridge *bridge,
 
 	hdmi->tmds_char_rate = 0;
 
+	drm_scdc_stop_scrambling(hdmi->curr_conn);
+
+	hdmi->curr_conn = NULL;
 	hdmi->phy.ops->disable(hdmi, hdmi->phy.data);
 }
 
@@ -832,12 +845,12 @@ dw_hdmi_qp_bridge_tmds_char_rate_valid(const struct drm_bridge *bridge,
 {
 	struct dw_hdmi_qp *hdmi = bridge->driver_private;
 
-	/*
-	 * TODO: when hdmi->no_hpd is 1 we must not support modes that
-	 * require scrambling, including every mode with a clock above
-	 * HDMI14_MAX_TMDSCLK.
-	 */
-	if (rate > HDMI14_MAX_TMDSCLK) {
+	if (hdmi->no_hpd && rate > HDMI14_MAX_TMDSCLK) {
+		dev_dbg(hdmi->dev, "Unsupported TMDS char rate in no_hpd mode: %lld\n", rate);
+		return MODE_CLOCK_HIGH;
+	}
+
+	if (rate > HDMI20_MAX_TMDSRATE) {
 		dev_dbg(hdmi->dev, "Unsupported TMDS char rate: %lld\n", rate);
 		return MODE_CLOCK_HIGH;
 	}
@@ -845,6 +858,26 @@ dw_hdmi_qp_bridge_tmds_char_rate_valid(const struct drm_bridge *bridge,
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
@@ -1218,6 +1251,8 @@ static const struct drm_bridge_funcs dw_hdmi_qp_bridge_funcs = {
 	.hpd_disable = dw_hdmi_qp_bridge_hpd_disable,
 	.edid_read = dw_hdmi_qp_bridge_edid_read,
 	.hdmi_tmds_char_rate_valid = dw_hdmi_qp_bridge_tmds_char_rate_valid,
+	.hdmi_scrambler_enable = dw_hdmi_qp_bridge_scrambler_enable,
+	.hdmi_scrambler_disable = dw_hdmi_qp_bridge_scrambler_disable,
 	.hdmi_clear_avi_infoframe = dw_hdmi_qp_bridge_clear_avi_infoframe,
 	.hdmi_write_avi_infoframe = dw_hdmi_qp_bridge_write_avi_infoframe,
 	.hdmi_clear_hdmi_infoframe = dw_hdmi_qp_bridge_clear_hdmi_infoframe,
@@ -1344,7 +1379,8 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
 			   DRM_BRIDGE_OP_HDMI |
 			   DRM_BRIDGE_OP_HDMI_AUDIO |
 			   DRM_BRIDGE_OP_HDMI_HDR_DRM_INFOFRAME |
-			   DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME;
+			   DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME |
+			   DRM_BRIDGE_OP_HDMI_SCRAMBLER;
 	if (!hdmi->no_hpd)
 		hdmi->bridge.ops |= DRM_BRIDGE_OP_HPD;
 	hdmi->bridge.of_node = pdev->dev.of_node;

-- 
2.53.0


