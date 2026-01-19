Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B8DD29C2A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 13:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x7FJUbG40IwPZMEPQu5dv3NxG3XsUSu8/SOKclUk5zg=; b=CcLddBgm6KgWVP15yXH7c8bXYR
	/rR4/2qNXCPki9A4LpKIpDrl+cRtD2nSam2KwPMusLG9pONKAe4nUhDg0VvHxTsSKiQl3wJhn4dzY
	enXHf4nXTXSA0GeDU6O0kpqNot4oZc89PTQh+ascblZwsJVcZiLVy6LSHPuzekEKVIxwWCxnK5lFI
	Cje35xPB4osqWxdtpo6XFh/9jGOmkte5QBAOlgJpkdduyPskmh9IUrOk/d/bMN3s42uj22Kzp4zKg
	j2apU0ehqOM+in6uOBCd7WKcQLmgm9lnCPWNOGJw5WtR+5fFpi1sLxTiCWBdDg9o5b+8B4sBGXgrV
	QgW+mGIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhpGt-00000002A4a-3T2X;
	Mon, 19 Jan 2026 13:26:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhpGk-000000029yB-1oTM;
	Mon, 19 Jan 2026 13:26:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=x7FJUbG40IwPZMEPQu5dv3NxG3XsUSu8/SOKclUk5zg=; b=oFfqxIPr3W+iTlXeV/1UGNAOhG
	bWgcJdGZbhc+mFfONYtlY5i37Dv3snLcQFokSNPvBgpE+BkyqAyBgGjS6kUz5C2QO7MxdpT9h1XUp
	3yNkb3Yizb2T511zzN+Mr+p2HevuptjxeAX7wTONma1yoLkdK6PNpoXN1XIDwxevKv7Fh7J8mLNjM
	aDFNeT5APnOWrucOrchFUYpZo4eWAs4/XW3vJtmrk8JUvNXbMiGY0zRcvOE4ZMtMQKIZZU/dgtQB4
	yLkqenjoEkOgdlKgxHquwHG2Xm/6gNe+FLlstMZfpMdP7pa6rULdp5fUckT7yxDYdUQJKfAKAhONk
	FZGFsGUQ==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhpGg-0000000CACn-3nUg;
	Mon, 19 Jan 2026 13:26:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768829162;
	bh=UJIgn17ZRdDhYS59WO3vOfCLbTNCB5WEtBKFLu99a74=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QjWNNnW1kEJmJdpAVSzyRQWLuBnjQjtXEqb0HqkZIvlafH9jbNtJgMhNTqpW5SsBm
	 vmyCLCZ0dp3E5AKlFG1c5YIyBMKlzxvPTl7NMjr00lKVngSXgQ95cccfNG5Ivpn0tc
	 LWnCMFeDXOjecEN1Jf/4YkrSMVecRyevoh2Dg4W2y//ZLoYFWz58JWZrqYT1aEO/Qu
	 DagPfxvdcG3PXtf3vvEgLPZw4WZaqaQCe5kEItoKt+K7zcRrG3Rt9mfXdMs2Avcvj1
	 18X5ZFZ9jj5mAGNtTiInqPkq++JW4MBZYddhpt86d1FvLYuWuwcByD9C+yX9ioCkFF
	 PHo4neyP9WALw==
Received: from localhost (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1682417E13B5;
	Mon, 19 Jan 2026 14:26:02 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 19 Jan 2026 15:25:59 +0200
Subject: [PATCH v3 3/4] drm/bridge: dw-hdmi-qp: Add high TMDS clock ratio
 and scrambling support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-dw-hdmi-qp-scramb-v3-3-bd8611730fc1@collabora.com>
References: <20260119-dw-hdmi-qp-scramb-v3-0-bd8611730fc1@collabora.com>
In-Reply-To: <20260119-dw-hdmi-qp-scramb-v3-0-bd8611730fc1@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Diederik de Haas <diederik@cknow-tech.com>, 
 Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_132607_100280_51E6DFFF 
X-CRM114-Status: GOOD (  23.87  )
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

Add support for HDMI 2.0 display modes, e.g. 4K@60Hz, by permitting TMDS
character rates above the 340 MHz limit of HDMI 1.4b.

Hence, provide the required SCDC management, including the high TMDS
clock ratio and scrambling setup, and filter out the HDMI 2.1 modes.

Tested-by: Diederik de Haas <diederik@cknow-tech.com>
Tested-by: Maud Spierings <maud_spierings@hotmail.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 167 ++++++++++++++++++++++++---
 1 file changed, 150 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 036316e2b60d..efae19e8e24e 100644
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
@@ -20,9 +21,11 @@
 #include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_cec_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
+#include <drm/display/drm_scdc_helper.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_bridge_helper.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_modes.h>
@@ -38,8 +41,10 @@
 #define DDC_SEGMENT_ADDR	0x30
 
 #define HDMI14_MAX_TMDSCLK	340000000
+#define HDMI20_MAX_TMDSRATE	600000000
 
-#define SCRAMB_POLL_DELAY_MS	3000
+#define SCDC_MIN_SOURCE_VERSION	0x1
+#define SCRAMB_POLL_DELAY_MS	5000
 
 /*
  * Unless otherwise noted, entries in this table are 100% optimization.
@@ -163,6 +168,11 @@ struct dw_hdmi_qp {
 	} phy;
 
 	unsigned long ref_clk_rate;
+
+	struct drm_connector *curr_conn;
+	struct delayed_work scramb_work;
+	bool scramb_enabled;
+
 	struct regmap *regm;
 
 	unsigned long tmds_char_rate;
@@ -861,28 +871,98 @@ static int dw_hdmi_qp_config_audio_infoframe(struct dw_hdmi_qp *hdmi,
 	return 0;
 }
 
+static bool dw_hdmi_qp_supports_scrambling(struct drm_display_info *display)
+{
+	if (!display->is_hdmi)
+		return false;
+
+	return display->hdmi.scdc.supported &&
+		display->hdmi.scdc.scrambling.supported;
+}
+
+static void dw_hdmi_qp_set_scramb(struct dw_hdmi_qp *hdmi)
+{
+	dev_dbg(hdmi->dev, "set scrambling\n");
+
+	drm_scdc_set_high_tmds_clock_ratio(hdmi->curr_conn, true);
+	drm_scdc_set_scrambling(hdmi->curr_conn, true);
+
+	schedule_delayed_work(&hdmi->scramb_work,
+			      msecs_to_jiffies(SCRAMB_POLL_DELAY_MS));
+}
+
+static void dw_hdmi_qp_scramb_work(struct work_struct *work)
+{
+	struct dw_hdmi_qp *hdmi = container_of(to_delayed_work(work),
+					       struct dw_hdmi_qp,
+					       scramb_work);
+	if (!drm_scdc_get_scrambling_status(hdmi->curr_conn))
+		dw_hdmi_qp_set_scramb(hdmi);
+}
+
+static void dw_hdmi_qp_enable_scramb(struct dw_hdmi_qp *hdmi)
+{
+	u8 ver;
+
+	if (!dw_hdmi_qp_supports_scrambling(&hdmi->curr_conn->display_info))
+		return;
+
+	drm_scdc_readb(hdmi->bridge.ddc, SCDC_SINK_VERSION, &ver);
+	drm_scdc_writeb(hdmi->bridge.ddc, SCDC_SOURCE_VERSION,
+			min_t(u8, ver, SCDC_MIN_SOURCE_VERSION));
+
+	dw_hdmi_qp_set_scramb(hdmi);
+	dw_hdmi_qp_write(hdmi, 1, SCRAMB_CONFIG0);
+
+	hdmi->scramb_enabled = true;
+
+	/* Wait at least 1 ms before resuming TMDS transmission */
+	usleep_range(1000, 5000);
+}
+
+static void dw_hdmi_qp_disable_scramb(struct dw_hdmi_qp *hdmi)
+{
+	if (!hdmi->scramb_enabled)
+		return;
+
+	dev_dbg(hdmi->dev, "disable scrambling\n");
+
+	hdmi->scramb_enabled = false;
+	cancel_delayed_work_sync(&hdmi->scramb_work);
+
+	dw_hdmi_qp_write(hdmi, 0, SCRAMB_CONFIG0);
+
+	if (hdmi->curr_conn->status == connector_status_connected) {
+		drm_scdc_set_scrambling(hdmi->curr_conn, false);
+		drm_scdc_set_high_tmds_clock_ratio(hdmi->curr_conn, false);
+	}
+}
+
 static void dw_hdmi_qp_bridge_atomic_enable(struct drm_bridge *bridge,
 					    struct drm_atomic_state *state)
 {
 	struct dw_hdmi_qp *hdmi = bridge->driver_private;
 	struct drm_connector_state *conn_state;
-	struct drm_connector *connector;
 	unsigned int op_mode;
 
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
+	if (hdmi->curr_conn->display_info.is_hdmi) {
 		dev_dbg(hdmi->dev, "%s mode=HDMI %s rate=%llu bpc=%u\n", __func__,
 			drm_hdmi_connector_get_output_format_name(conn_state->hdmi.output_format),
 			conn_state->hdmi.tmds_char_rate, conn_state->hdmi.output_bpc);
 		op_mode = 0;
 		hdmi->tmds_char_rate = conn_state->hdmi.tmds_char_rate;
+
+		if (conn_state->hdmi.tmds_char_rate > HDMI14_MAX_TMDSCLK)
+			dw_hdmi_qp_enable_scramb(hdmi);
 	} else {
 		dev_dbg(hdmi->dev, "%s mode=DVI\n", __func__);
 		op_mode = OPMODE_DVI;
@@ -893,7 +973,7 @@ static void dw_hdmi_qp_bridge_atomic_enable(struct drm_bridge *bridge,
 	dw_hdmi_qp_mod(hdmi, HDCP2_BYPASS, HDCP2_BYPASS, HDCP2LOGIC_CONFIG0);
 	dw_hdmi_qp_mod(hdmi, op_mode, OPMODE_DVI, LINK_CONFIG0);
 
-	drm_atomic_helper_connector_hdmi_update_infoframes(connector, state);
+	drm_atomic_helper_connector_hdmi_update_infoframes(hdmi->curr_conn, state);
 }
 
 static void dw_hdmi_qp_bridge_atomic_disable(struct drm_bridge *bridge,
@@ -903,13 +983,56 @@ static void dw_hdmi_qp_bridge_atomic_disable(struct drm_bridge *bridge,
 
 	hdmi->tmds_char_rate = 0;
 
+	dw_hdmi_qp_disable_scramb(hdmi);
+
+	hdmi->curr_conn = NULL;
 	hdmi->phy.ops->disable(hdmi, hdmi->phy.data);
 }
 
-static enum drm_connector_status
-dw_hdmi_qp_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
+static int dw_hdmi_qp_reset_crtc(struct dw_hdmi_qp *hdmi,
+				 struct drm_connector *connector,
+				 struct drm_modeset_acquire_ctx *ctx)
+{
+	u8 config;
+	int ret;
+
+	ret = drm_scdc_readb(hdmi->bridge.ddc, SCDC_TMDS_CONFIG, &config);
+	if (ret < 0) {
+		dev_err(hdmi->dev, "Failed to read TMDS config: %d\n", ret);
+		return ret;
+	}
+
+	if (!!(config & SCDC_SCRAMBLING_ENABLE) == hdmi->scramb_enabled)
+		return 0;
+
+	drm_atomic_helper_connector_hdmi_hotplug(connector,
+						 connector_status_connected);
+	/*
+	 * Conform to HDMI 2.0 spec by ensuring scrambled data is not sent
+	 * before configuring the sink scrambling, as well as suspending any
+	 * TMDS transmission while changing the TMDS clock rate in the sink.
+	 */
+
+	dev_dbg(hdmi->dev, "resetting crtc\n");
+
+retry:
+	ret = drm_bridge_helper_reset_crtc(&hdmi->bridge, ctx);
+	if (ret == -EDEADLK) {
+		drm_modeset_backoff(ctx);
+		goto retry;
+	} else if (ret) {
+		dev_err(hdmi->dev, "Failed to reset crtc: %d\n", ret);
+	}
+
+	return ret;
+}
+
+static int dw_hdmi_qp_bridge_detect(struct drm_bridge *bridge,
+				    struct drm_connector *connector,
+				    struct drm_modeset_acquire_ctx *ctx)
 {
 	struct dw_hdmi_qp *hdmi = bridge->driver_private;
+	enum drm_connector_status status;
 	const struct drm_edid *drm_edid;
 
 	if (hdmi->no_hpd) {
@@ -920,7 +1043,15 @@ dw_hdmi_qp_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connec
 			return connector_status_disconnected;
 	}
 
-	return hdmi->phy.ops->read_hpd(hdmi, hdmi->phy.data);
+	status = hdmi->phy.ops->read_hpd(hdmi, hdmi->phy.data);
+
+	dev_dbg(hdmi->dev, "%s status=%d scramb=%d\n", __func__,
+		status, hdmi->scramb_enabled);
+
+	if (status == connector_status_connected && hdmi->scramb_enabled)
+		dw_hdmi_qp_reset_crtc(hdmi, connector, ctx);
+
+	return status;
 }
 
 static const struct drm_edid *
@@ -944,12 +1075,12 @@ dw_hdmi_qp_bridge_tmds_char_rate_valid(const struct drm_bridge *bridge,
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
@@ -1217,7 +1348,7 @@ static const struct drm_bridge_funcs dw_hdmi_qp_bridge_funcs = {
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.atomic_enable = dw_hdmi_qp_bridge_atomic_enable,
 	.atomic_disable = dw_hdmi_qp_bridge_atomic_disable,
-	.detect = dw_hdmi_qp_bridge_detect,
+	.detect_ctx = dw_hdmi_qp_bridge_detect,
 	.edid_read = dw_hdmi_qp_bridge_edid_read,
 	.hdmi_tmds_char_rate_valid = dw_hdmi_qp_bridge_tmds_char_rate_valid,
 	.hdmi_clear_avi_infoframe = dw_hdmi_qp_bridge_clear_avi_infoframe,
@@ -1305,6 +1436,8 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
 	if (IS_ERR(hdmi))
 		return ERR_CAST(hdmi);
 
+	INIT_DELAYED_WORK(&hdmi->scramb_work, dw_hdmi_qp_scramb_work);
+
 	hdmi->dev = dev;
 
 	regs = devm_platform_ioremap_resource(pdev, 0);

-- 
2.52.0


