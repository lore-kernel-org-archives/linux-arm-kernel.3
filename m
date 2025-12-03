Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 673AED1BDD1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 18:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t+bkYHw7apmwnIyLo06tW/5FpAg1i66bFzcO2h8IYWo=; b=oLjXP1l+8CE0ILR7rKBs3Ze3da
	PUcsqmbV2n3cN6g1Yc/1TiwPZahzFdGv/YQ/ylyNiAavyyyqPU8dr6GSJyDG6OaGw1/jWhbcc4yLs
	UxY/zRZiY1NMbeskXS9mWvHXwNMDK7O4zDL7jcPRvySEPXr+pqyEx5mcz54NI8j5uAAJZH/rS+jk5
	f6FE12yNLm4mN1FIniyuJEKIVCKMITQBhMAfgw3sg2XMM/qtSaNWoJC9J4hKPOlDAwaKOdB64E7h5
	h0cP7c+6Gwob0hoyk2VAhlsIsEHDxsuCeYs//VY4G3RwoyDWjbEAjEfWMKE5dsdETNdFI0NfizpVC
	zarNjM/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQrb4-00000006vug-3blX;
	Wed, 03 Dec 2025 18:29:02 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQrax-00000006voP-2caG;
	Wed, 03 Dec 2025 18:28:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764786532;
	bh=DDH7GvPL/YnKRi9Q1mYXJUeTkrUG4a6V/o/ktSD0oRw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Lolsnom6MkKG8uu3rUVJyrB2j9DAjwIrbl3WBSw/OblSWj7E1JdYU5ceGyri9k6z3
	 EPhfy8cdzksHGMS37Iit9EWma2BCzkGAFxQMeWxY7wZg1MVPUKWhVX6AVmY6vP9oRQ
	 rof33gpKVSjPARGW8SOwLi/IKOT6/ra56J+jzFHIZNJzMiI7a9VOS0/n7ZuP6mGXDg
	 deqoX/y9siwMvI9UiokoHS0VeXPYDK4U3PXzMgYnvWfhKnrOxlialt/UMXeFuIsYCN
	 lfgnQJvRrxDzYUIn7j09kq54vPo0JPt3vEDz9TWTN5dIyn5Ihl8OWGoiQ/4UIike0S
	 NsDjuluDX/fsw==
Received: from localhost (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4112917E13F1;
	Wed,  3 Dec 2025 19:28:52 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 03 Dec 2025 20:27:54 +0200
Subject: [PATCH 3/4] drm/bridge: dw-hdmi-qp: Add high TMDS clock ratio and
 scrambling support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-dw-hdmi-qp-scramb-v1-3-836fe7401a69@collabora.com>
References: <20251203-dw-hdmi-qp-scramb-v1-0-836fe7401a69@collabora.com>
In-Reply-To: <20251203-dw-hdmi-qp-scramb-v1-0-836fe7401a69@collabora.com>
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
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_102855_850547_29BC1385 
X-CRM114-Status: GOOD (  22.24  )
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

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 174 +++++++++++++++++++++++++--
 1 file changed, 162 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index fe4c026280f0..f732bd238ff8 100644
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
@@ -20,6 +21,7 @@
 #include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_cec_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
+#include <drm/display/drm_scdc_helper.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
@@ -37,8 +39,10 @@
 #define DDC_SEGMENT_ADDR	0x30
 
 #define HDMI14_MAX_TMDSCLK	340000000
+#define HDMI20_MAX_TMDSRATE	600000000
 
-#define SCRAMB_POLL_DELAY_MS	3000
+#define SCDC_MIN_SOURCE_VERSION	0x1
+#define SCRAMB_POLL_DELAY_MS	5000
 
 /*
  * Unless otherwise noted, entries in this table are 100% optimization.
@@ -162,6 +166,11 @@ struct dw_hdmi_qp {
 	} phy;
 
 	unsigned long ref_clk_rate;
+
+	struct drm_connector *curr_conn;
+	struct delayed_work scramb_work;
+	bool scramb_enabled;
+
 	struct regmap *regm;
 
 	unsigned long tmds_char_rate;
@@ -851,28 +860,98 @@ static int dw_hdmi_qp_config_audio_infoframe(struct dw_hdmi_qp *hdmi,
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
@@ -883,7 +962,7 @@ static void dw_hdmi_qp_bridge_atomic_enable(struct drm_bridge *bridge,
 	dw_hdmi_qp_mod(hdmi, HDCP2_BYPASS, HDCP2_BYPASS, HDCP2LOGIC_CONFIG0);
 	dw_hdmi_qp_mod(hdmi, op_mode, OPMODE_DVI, LINK_CONFIG0);
 
-	drm_atomic_helper_connector_hdmi_update_infoframes(connector, state);
+	drm_atomic_helper_connector_hdmi_update_infoframes(hdmi->curr_conn, state);
 }
 
 static void dw_hdmi_qp_bridge_atomic_disable(struct drm_bridge *bridge,
@@ -893,15 +972,84 @@ static void dw_hdmi_qp_bridge_atomic_disable(struct drm_bridge *bridge,
 
 	hdmi->tmds_char_rate = 0;
 
+	dw_hdmi_qp_disable_scramb(hdmi);
+
+	hdmi->curr_conn = NULL;
 	hdmi->phy.ops->disable(hdmi, hdmi->phy.data);
 }
 
-static enum drm_connector_status
-dw_hdmi_qp_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
+static int dw_hdmi_qp_reset_link(struct dw_hdmi_qp *hdmi,
+				 struct drm_connector *conn,
+				 struct drm_modeset_acquire_ctx *ctx)
+{
+	struct drm_crtc *crtc;
+	u8 config;
+	int ret;
+
+	if (!conn->state)
+		return 0;
+
+	crtc = conn->state->crtc;
+	if (!crtc)
+		return 0;
+
+retry:
+	ret = drm_modeset_lock(&crtc->mutex, ctx);
+	if (ret)
+		goto check_err;
+
+	if (!crtc->state->active)
+		return 0;
+
+	if (conn->state->commit &&
+	    !try_wait_for_completion(&conn->state->commit->hw_done))
+		return 0;
+
+	ret = drm_scdc_readb(hdmi->bridge.ddc, SCDC_TMDS_CONFIG, &config);
+	if (ret < 0) {
+		dev_err(hdmi->dev, "Failed to read TMDS config: %d\n", ret);
+		return 0;
+	}
+
+	if (!!(config & SCDC_SCRAMBLING_ENABLE) == hdmi->scramb_enabled)
+		return 0;
+
+	dev_dbg(hdmi->dev, "%s resetting crtc\n", __func__);
+
+	drm_atomic_helper_connector_hdmi_hotplug(conn, connector_status_connected);
+
+	/*
+	 * Conform to HDMI 2.0 spec by ensuring scrambled data is not sent
+	 * before configuring the sink scrambling, as well as suspending any
+	 * TMDS transmission while changing the TMDS clock rate in the sink.
+	 */
+	ret = drm_atomic_helper_reset_crtc(crtc, ctx);
+
+check_err:
+	if (ret == -EDEADLK) {
+		drm_modeset_backoff(ctx);
+		goto retry;
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
 
-	return hdmi->phy.ops->read_hpd(hdmi, hdmi->phy.data);
+	status = hdmi->phy.ops->read_hpd(hdmi, hdmi->phy.data);
+
+	dev_dbg(hdmi->dev, "%s status=%d scramb=%d\n", __func__,
+		status, hdmi->scramb_enabled);
+
+	if (status == connector_status_connected && hdmi->scramb_enabled)
+		dw_hdmi_qp_reset_link(hdmi, connector, ctx);
+
+	return status;
 }
 
 static const struct drm_edid *
@@ -925,7 +1073,7 @@ dw_hdmi_qp_bridge_tmds_char_rate_valid(const struct drm_bridge *bridge,
 {
 	struct dw_hdmi_qp *hdmi = bridge->driver_private;
 
-	if (rate > HDMI14_MAX_TMDSCLK) {
+	if (rate > HDMI20_MAX_TMDSRATE) {
 		dev_dbg(hdmi->dev, "Unsupported TMDS char rate: %lld\n", rate);
 		return MODE_CLOCK_HIGH;
 	}
@@ -1165,7 +1313,7 @@ static const struct drm_bridge_funcs dw_hdmi_qp_bridge_funcs = {
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.atomic_enable = dw_hdmi_qp_bridge_atomic_enable,
 	.atomic_disable = dw_hdmi_qp_bridge_atomic_disable,
-	.detect = dw_hdmi_qp_bridge_detect,
+	.detect_ctx = dw_hdmi_qp_bridge_detect,
 	.edid_read = dw_hdmi_qp_bridge_edid_read,
 	.hdmi_tmds_char_rate_valid = dw_hdmi_qp_bridge_tmds_char_rate_valid,
 	.hdmi_clear_infoframe = dw_hdmi_qp_bridge_clear_infoframe,
@@ -1247,6 +1395,8 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
 	if (IS_ERR(hdmi))
 		return ERR_CAST(hdmi);
 
+	INIT_DELAYED_WORK(&hdmi->scramb_work, dw_hdmi_qp_scramb_work);
+
 	hdmi->dev = dev;
 
 	regs = devm_platform_ioremap_resource(pdev, 0);

-- 
2.51.2


