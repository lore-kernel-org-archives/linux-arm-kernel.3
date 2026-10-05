Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95228CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 00:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kdLVdS4/lrBCWWkjQfcs1ELUQETVc3D0f8ua88760Vs=; b=YMNiAik0IzAbVxeB/ULn6hbPRx
	Sf4iO9ZYVhK/kzsUSgNuh5agTtNi0FtJVwMxjml4vVb4FhvBPWpmLD2EkqodjZsxuVxHOdHztl9DV
	GuBbx7oYVi5mkC98r8NXbJ6C/gnNEQ1LoxOt1ojCmE5d1eFURTEG9dFTEKJ3w2sPIOAopi6vPjyXU
	gB/S6+LLpCqzGbJbo5Jp9mVHGA57YAZkrbo1OfIjTcBCXrqcIxf6fvf1aa0s2dw55O9DT8O0wRpr0
	QhWXBX+LjgZEanIFUewYJtMtvN9bFjaPcZV2QdLLBN50y9pZIXX21J4JpynuQkojTNXcNKKNFAfgj
	qGIf0GFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDWjL-0000000FW49-1xle;
	Mon, 05 Oct 2026 00:38:59 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDWjC-0000000FVw4-3VKg;
	Mon, 05 Oct 2026 00:38:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1791160728;
	bh=c0R0feFeJ5rmGlGgUcOfE4gsdcUy/yoARnD+nAT5VIA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DRl0+KrW2BDVoHKglShd/rVrMG20pKgfq76lQ/TQJcgE6ULUfOb/cevZQPmIfJEjQ
	 vW/EKZtKrA8Vl0l46jmANtaZTKzSghHtO6yw1CP4fZY9OkhD3RU9PaWc3KAhcQy3lA
	 64WnD7K5kLTh/IV98rpGVnUmQWhudODqEFVj+dx1HDardruEznb+ylrdOK+URTj+Xz
	 si1KZeeFjYuCN29CSM0tXj79JBfpl1oHva4ZOLvSsFdQPTP8TDw8CYC9yASo29v84S
	 lyY+/wSAgRqiZjIGXGiu86tlLvQr3OQMJCUNQVjyvETPXDjP4Xcw4r5ppoOSJxfmNC
	 AIFbC1z9hQgxw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 52A9917E0D5D;
	Mon, 05 Oct 2026 02:38:48 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 05 Oct 2026 03:38:05 +0300
Subject: [PATCH v12 04/16] drm/bridge: dw-hdmi-qp: Add HDMI 2.0 scrambling
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261005-dw-hdmi-qp-scramb-v12-4-195157ba0b40@collabora.com>
References: <20261005-dw-hdmi-qp-scramb-v12-0-195157ba0b40@collabora.com>
In-Reply-To: <20261005-dw-hdmi-qp-scramb-v12-0-195157ba0b40@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Algea Cao <algea.cao@rock-chips.com>, Daniel Stone <daniels@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maud_spierings@hotmail.com>, 
 Diederik de Haas <diederik@cknow-tech.com>, 
 =?utf-8?q?Robin_R=C3=A4ber?= <robin.raebi@gmail.com>, 
 Igor Paunovic <royalnet026@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_173851_062046_9F89EB70 
X-CRM114-Status: GOOD (  16.85  )
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

Add support for SCDC scrambling and the high TMDS clock ratio required
by HDMI 2.0 modes with TMDS character rates above 340 MHz, such as
4K@60Hz.

Hook the bridge into the DRM HDMI connector scrambling helpers so the
sink-side SCDC state and the controller scrambler are updated together
as part of the atomic enable and disable paths.  This allows the driver
to advertise HDMI 2.0 support when HPD is available.

Keep no-HPD configurations limited to HDMI 1.4, since SCDC access
requires a connected HDMI sink.

Modes above the HDMI 2.0 600 MHz TMDS character-rate limit are now
implicitly rejected by the DRM HDMI connector/bridge infrastructure,
making the dw_hdmi_qp_bridge_tmds_char_rate_valid() callback redundant.
Drop it.

Tested-by: Maud Spierings <maud_spierings@hotmail.com>
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS, Rock 5B
Acked-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Robin Räber <robin.raebi@gmail.com>
Tested-by: Igor Paunovic <royalnet026@gmail.com> # RK3588 Orange Pi 5 Plus, dual HDMI
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 60 ++++++++++++++++++----------
 1 file changed, 39 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 4b55bed42ab7..14723ee5cb05 100644
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
@@ -536,6 +537,7 @@ static void dw_hdmi_qp_bridge_atomic_enable(struct drm_bridge *bridge,
 	struct drm_connector_state *conn_state;
 	struct drm_connector *connector;
 	unsigned int op_mode;
+	int ret;
 
 	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
 	if (WARN_ON(!connector))
@@ -546,14 +548,20 @@ static void dw_hdmi_qp_bridge_atomic_enable(struct drm_bridge *bridge,
 		return;
 
 	if (connector->display_info.is_hdmi) {
-		dev_dbg(hdmi->dev, "%s mode=HDMI %s rate=%llu bpc=%u\n", __func__,
-			drm_hdmi_connector_get_output_format_name(conn_state->hdmi.output_format),
-			conn_state->hdmi.tmds_char_rate, conn_state->hdmi.output_bpc);
 		op_mode = 0;
 		hdmi->tmds_char_rate = conn_state->hdmi.tmds_char_rate;
+
+		ret = drm_connector_hdmi_enable_scrambling(connector, conn_state);
+		if (ret)
+			dev_warn(hdmi->dev, "Failed to enable scrambling: %d\n", ret);
+
+		dev_dbg(hdmi->dev, "%s mode=HDMI %s rate=%llu bpc=%u scramb=%d\n", __func__,
+			drm_hdmi_connector_get_output_format_name(conn_state->hdmi.output_format),
+			conn_state->hdmi.tmds_char_rate, conn_state->hdmi.output_bpc,
+			connector->hdmi.scrambler_enabled);
 	} else {
-		dev_dbg(hdmi->dev, "%s mode=DVI\n", __func__);
 		op_mode = OPMODE_DVI;
+		dev_dbg(hdmi->dev, "%s mode=DVI\n", __func__);
 	}
 
 	hdmi->phy.ops->init(hdmi, hdmi->phy.data);
@@ -568,9 +576,13 @@ static void dw_hdmi_qp_bridge_atomic_disable(struct drm_bridge *bridge,
 					     struct drm_atomic_commit *state)
 {
 	struct dw_hdmi_qp *hdmi = bridge->driver_private;
+	struct drm_connector *connector;
 
 	hdmi->tmds_char_rate = 0;
 
+	connector = drm_atomic_get_old_connector_for_encoder(state, bridge->encoder);
+	drm_connector_hdmi_disable_scrambling(connector);
+
 	hdmi->phy.ops->disable(hdmi, hdmi->phy.data);
 }
 
@@ -605,24 +617,24 @@ dw_hdmi_qp_bridge_edid_read(struct drm_bridge *bridge,
 	return drm_edid;
 }
 
-static enum drm_mode_status
-dw_hdmi_qp_bridge_tmds_char_rate_valid(const struct drm_bridge *bridge,
-				       const struct drm_display_mode *mode,
-				       unsigned long long rate)
+static int dw_hdmi_qp_bridge_scrambler_enable(struct drm_bridge *bridge)
 {
 	struct dw_hdmi_qp *hdmi = bridge->driver_private;
 
-	/*
-	 * TODO: when hdmi->no_hpd is 1 we must not support modes that
-	 * require scrambling, including every mode with a clock above
-	 * HDMI_1_3_TMDS_CHAR_RATE_MAX_HZ.
-	 */
-	if (rate > HDMI_1_3_TMDS_CHAR_RATE_MAX_HZ) {
-		dev_dbg(hdmi->dev, "Unsupported TMDS char rate: %lld\n", rate);
-		return MODE_CLOCK_HIGH;
-	}
+	dw_hdmi_qp_write(hdmi, 1, SCRAMB_CONFIG0);
+	dev_dbg(hdmi->dev, "scrambler enabled\n");
 
-	return MODE_OK;
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
 }
 
 static int dw_hdmi_qp_bridge_clear_avi_infoframe(struct drm_bridge *bridge)
@@ -998,7 +1010,8 @@ static const struct drm_bridge_funcs dw_hdmi_qp_bridge_funcs = {
 	.hpd_enable = dw_hdmi_qp_bridge_hpd_enable,
 	.hpd_disable = dw_hdmi_qp_bridge_hpd_disable,
 	.edid_read = dw_hdmi_qp_bridge_edid_read,
-	.hdmi_tmds_char_rate_valid = dw_hdmi_qp_bridge_tmds_char_rate_valid,
+	.hdmi_scrambler_enable = dw_hdmi_qp_bridge_scrambler_enable,
+	.hdmi_scrambler_disable = dw_hdmi_qp_bridge_scrambler_disable,
 	.hdmi_clear_avi_infoframe = dw_hdmi_qp_bridge_clear_avi_infoframe,
 	.hdmi_write_avi_infoframe = dw_hdmi_qp_bridge_write_avi_infoframe,
 	.hdmi_clear_hdmi_infoframe = dw_hdmi_qp_bridge_clear_hdmi_infoframe,
@@ -1126,13 +1139,18 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
 			   DRM_BRIDGE_OP_HDMI_AUDIO |
 			   DRM_BRIDGE_OP_HDMI_HDR_DRM_INFOFRAME |
 			   DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME;
-	if (!hdmi->no_hpd)
-		hdmi->bridge.ops |= DRM_BRIDGE_OP_HPD;
 	hdmi->bridge.of_node = pdev->dev.of_node;
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	hdmi->bridge.vendor = "Synopsys";
 	hdmi->bridge.product = "DW HDMI QP TX";
 
+	if (hdmi->no_hpd) {
+		hdmi->bridge.supported_hdmi_ver = HDMI_VERSION_1_4;
+	} else {
+		hdmi->bridge.supported_hdmi_ver = HDMI_VERSION_2_0;
+		hdmi->bridge.ops |= DRM_BRIDGE_OP_HPD;
+	}
+
 	if (plat_data->supported_formats)
 		hdmi->bridge.supported_formats = plat_data->supported_formats;
 

-- 
2.55.0


