Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ABC8C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 06:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IXxFKX8S2wxmrwc1wkQlOgDMHrW9/3ESYm7rv50lzFU=; b=Hdtq2iY0QCo/vS5P8B9jpNSdA+
	8d/BlfctbGSEZNphv7aGwdYxxRmgs1duh1rqdXBT5RCtE+1MwvobK4I4Ez+TTuedkjNe5OnSVk5i6
	dHRSJjVdGR7mO24x8KDvn5J4GBnJ1Ykzy0h4gCb12IA4saRk92TwNFa2yvBtgXeCTP6g5AuyU+gIf
	PiL03PiM73qEDk6AmMjz72D6vJO8hKSRHmLtnvpCTzworEZb1h6M7etfEcn+m4tszL2s1+fbRQ0kT
	YpeTHb64poVLtYF5ns5jDV53Vkdosui5WAJ5iOH4o6zzVtr7zZKRuwsBkGrUx2uy/viojBb98uUvl
	bJtPbVDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woF6H-000000023UO-0kfS;
	Mon, 27 Jul 2026 06:46:09 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woF5y-0000000233g-3V5W;
	Mon, 27 Jul 2026 06:45:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1785134695;
	bh=IXxFKX8S2wxmrwc1wkQlOgDMHrW9/3ESYm7rv50lzFU=;
	h=From:To:Subject:Date:Message-Id;
	b=H7sDjc84BydXWlDkCYweSB4uIbFJ0dgMX0jmG0U3aIKpOC5z9Lrbz55Y0CvOcy75r
	 md4yQOqc046xnCxZQlGDv5CMtXy3yA/OHppDcSobRc7XXbA5Hlbz33DHXJgwaW4WYS
	 vl7XpmkATTq6s+HFZ8mi201Ksf8YK2qV1Nggxv6s=
X-QQ-mid: esmtpgz10t1785134693t09f1d5a5
X-QQ-Originating-IP: /HAbmp0+BxWcRpHafCMWLPVk6ugZ0+zK+a7daqhXDu4=
Received: from DESKTOP-8BT1A2O.localdomain ( [61.154.14.86])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 27 Jul 2026 14:44:49 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17654370942254750847
From: Chaoyi Chen <kernel@airkyi.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Vinod Koul <vkoul@kernel.org>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v4 5/5] drm/rockchip: cdn-dp: Add multiple bridges to support PHY port selection
Date: Mon, 27 Jul 2026 14:44:08 +0800
Message-Id: <20260727064408.101-6-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260727064408.101-1-kernel@airkyi.com>
References: <20260727064408.101-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NuQRJUP0KJGkG08+n2phJQ+pzObTZjXv0FWGVc86bbFTPQ4CC24jq1Jq
	Bv5V/8ZUIG1zDunHAuhGe6ju3bBgNNinbrrq2oJGVkTO6aIYgSo/OJt7MVhc8ULyZdJ2NbG
	9/CU6fh5Dze2ZOtC/NAE7jmLwjEu51QmQOZpUZehE09rS/rYkG38Z03HPMxmYI//oexragp
	nQdLSWD76mWoB137IengR8bZZyGSdNxs22sD70TcdlTfP98hCIghFOMCgbgZ7r9TjGqVslq
	zXNdhlQsL2mDeXRslthhK/RHVQn078egDnVzEHU9nbCD52H0L9Owytm6D49tZCeZVyW+0bV
	lrHJHMLbgqCNOkRLOjvp04LAflO80o3IH+00O+aCyeUws+UHzuUB4A0MS0f8CUPlHov3wgu
	Z7c1/rmkTlFnt6tMOK8t839nJEXZanQbGh93PwXgT2fMuG60IEyaeB6Zptc3Vqwbr0v/1Oh
	5Z/MKGMsbTJBSqZN01VCS8Jc4cOs+jHl3l3XnhvuJXQ6l8CQP0ss6GY//PYjygvIPrcURFX
	gMxm5fFDkhOX7DK02HTvsMggZbHVhHyrTR3GYSkkYr3uy3tJXAD8Yeex//1dux2FQ/Qx1TE
	vv17QgJB5myeqgpod/JqhspuVlWrtUUrR8QQ79cn41yIjSAg2OHYG4HxR9ePVAKQhNulpN/
	qOJK47FQIpnndGrzsTkdJtLL1hQSu4GAvzZo0Hyt4KohmM/4YizHYIP4z2LE08grJZZZzx8
	0eP5jmg5iyQAe+X1sYJ9FGLOsUVZ8bachmT8zArzjTGMEjk5zyc74k03dAYKUFcQ1+tps6K
	DjRbkIXjnSgaBsma3rKaZY85tC4kGbZqePbkScWPuBHZhubxITqF3RnLsBG3jovIF2PGiIA
	nYwSlhAFzSrMKxVybeBW3wmoXDABV+VRKzhNaoaDnwkSgJ9fFpUki4GbqZ7TzOd/zgErYeN
	O8uShPDbmyfUzR0jyePfJfABTJXb4/nKixk1WpiwL4+AaSup0TeyJG6YGLnpjsHwr5W+4fM
	MF3M6Qnu7Y8wuQi9linUyO++PhS9U8mJlCr8VHcQ==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_234551_748987_632060F9 
X-CRM114-Status: GOOD (  34.16  )
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

The RK3399 has two USB/DP combo PHY and one CDN-DP controller. And
the CDN-DP can be switched to output to one of the PHYs. If both ports
are plugged into DP, DP will select the first port for output.

This patch adds support for multiple bridges, enabling users to flexibly
select the output port. For each PHY port, a separate encoder and bridge
are registered.

The change is based on the DRM AUX HPD bridge, rather than the
extcon approach. This requires the DT to correctly describe the
connections between the first bridge in bridge chain and DP
controller. For example, the bridge chain may be like this:

PHY aux birdge -> fsa4480 analog audio switch bridge ->
onnn,nb7vpq904m USB reminder bridge -> USB-C controller AUX HPD bridge

In this case, the connection relationships among the PHY aux bridge
and the DP contorller need to be described in DT.

In addition, the cdn_dp_parse_next_bridge_dt() will parses it and
determines whether to register one or two bridges.

Since there is only one DP controller, only one of the PHY ports can
output at a time. The key is how to switch between different PHYs,
which is handled by cdn_dp_switch_port() and cdn_dp_enable().

There are two cases:

1. Neither bridge is enabled. In this case, both bridges can
independently read the EDID, and the PHY port may switch before
reading the EDID.

2. One bridge is already enabled. In this case, other bridges are not
allowed to read the EDID. So we will try to return the cached EDID.

Since the scenario of two ports plug in at the same time is rare,
I don't have a board which support two TypeC connector to test this.
Therefore, I tested forced switching on a single PHY port, as well as
output using a fake PHY port alongside a real PHY port.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---

(no changes since v4)

Changes in v3:
- Remove now-redundant call to drm_connector_attach_encoder()

Changes in v2:
- Fix the check logic for dp->active_port (0 is valid).
- Fix the uninitialized prev_port.
- Remove duplicate logic from cdn_dp_switch_port().
- Fix the prototype of cdn_dp_bridge_hpd_notify().
- Properly release connector->fwnode.
- Properly release next_bridge.

---
 drivers/gpu/drm/rockchip/Kconfig       |   1 +
 drivers/gpu/drm/rockchip/cdn-dp-core.c | 333 ++++++++++++++++++++-----
 drivers/gpu/drm/rockchip/cdn-dp-core.h |  18 +-
 3 files changed, 294 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
index e7f49fe845ea..ce70f91c13e6 100644
--- a/drivers/gpu/drm/rockchip/Kconfig
+++ b/drivers/gpu/drm/rockchip/Kconfig
@@ -60,6 +60,7 @@ config ROCKCHIP_CDN_DP
 	select DRM_DISPLAY_HELPER
 	select DRM_BRIDGE_CONNECTOR
 	select DRM_DISPLAY_DP_HELPER
+	select DRM_AUX_HPD_BRIDGE
 	help
 	  This selects support for Rockchip SoC specific extensions
 	  for the cdn DP driver. If you want to enable Dp on
diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index 74e1f5422a6e..5e513f6930cb 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -28,16 +28,17 @@
 #include "cdn-dp-core.h"
 #include "cdn-dp-reg.h"
 
-static inline struct cdn_dp_device *bridge_to_dp(struct drm_bridge *bridge)
+static int cdn_dp_switch_port(struct cdn_dp_device *dp, struct cdn_dp_port *prev_port,
+			      struct cdn_dp_port *port);
+
+static inline struct cdn_dp_bridge *bridge_to_dp_bridge(struct drm_bridge *bridge)
 {
-	return container_of(bridge, struct cdn_dp_device, bridge);
+	return container_of(bridge, struct cdn_dp_bridge, bridge);
 }
 
-static inline struct cdn_dp_device *encoder_to_dp(struct drm_encoder *encoder)
+static inline struct cdn_dp_device *bridge_to_dp(struct drm_bridge *bridge)
 {
-	struct rockchip_encoder *rkencoder = to_rockchip_encoder(encoder);
-
-	return container_of(rkencoder, struct cdn_dp_device, encoder);
+	return bridge_to_dp_bridge(bridge)->parent;
 }
 
 #define GRF_SOC_CON9		0x6224
@@ -192,14 +193,27 @@ static int cdn_dp_get_sink_count(struct cdn_dp_device *dp, u8 *sink_count)
 static struct cdn_dp_port *cdn_dp_connected_port(struct cdn_dp_device *dp)
 {
 	struct cdn_dp_port *port;
-	int i, lanes;
+	int i, lanes[MAX_PHY];
 
 	for (i = 0; i < dp->ports; i++) {
 		port = dp->port[i];
-		lanes = cdn_dp_get_port_lanes(port);
-		if (lanes)
+		lanes[i] = cdn_dp_get_port_lanes(port);
+		if (!dp->next_bridge_valid)
 			return port;
 	}
+
+	if (dp->next_bridge_valid) {
+		/* If more than one port is available, pick the last active port */
+		if (dp->active_port >= 0 && lanes[dp->active_port])
+			return dp->port[dp->active_port];
+
+		/* If the last active port is not available, pick an available port in order */
+		for (i = 0; i < dp->bridge_count; i++) {
+			if (lanes[i])
+				return dp->port[i];
+		}
+	}
+
 	return NULL;
 }
 
@@ -254,12 +268,45 @@ static const struct drm_edid *
 cdn_dp_bridge_edid_read(struct drm_bridge *bridge, struct drm_connector *connector)
 {
 	struct cdn_dp_device *dp = bridge_to_dp(bridge);
-	const struct drm_edid *drm_edid;
+	struct cdn_dp_bridge *dp_bridge = bridge_to_dp_bridge(bridge);
+	struct cdn_dp_port *port = dp->port[dp_bridge->id];
+	struct cdn_dp_port *prev_port = NULL;
+	const struct drm_edid *drm_edid = NULL;
+	int i, ret;
 
 	mutex_lock(&dp->lock);
+
+	/* More than one port is available */
+	if (dp->bridge_count > 1 && !port->phy_enabled) {
+		for (i = 0; i < dp->bridge_count; i++) {
+			/* Another port already enable */
+			if (dp->bridge_list[i] != dp_bridge && dp->bridge_list[i]->enabled)
+				goto get_cache;
+			/* Find already enabled port */
+			if (dp->port[i]->phy_enabled)
+				prev_port = dp->port[i];
+		}
+
+		/* Switch to current port */
+		if (prev_port) {
+			ret = cdn_dp_switch_port(dp, prev_port, port);
+			if (ret)
+				goto get_cache;
+		}
+	}
+
 	drm_edid = drm_edid_read_custom(connector, cdn_dp_get_edid_block, dp);
+	/* replace edid cache */
+	if (dp->edid_cache[dp_bridge->id])
+		drm_edid_free(dp->edid_cache[dp_bridge->id]);
+	dp->edid_cache[dp_bridge->id] = drm_edid_dup(drm_edid);
+
 	mutex_unlock(&dp->lock);
+	return drm_edid;
 
+get_cache:
+	drm_edid = drm_edid_dup(dp->edid_cache[dp_bridge->id]);
+	mutex_unlock(&dp->lock);
 	return drm_edid;
 }
 
@@ -268,12 +315,13 @@ cdn_dp_bridge_mode_valid(struct drm_bridge *bridge,
 			 const struct drm_display_info *display_info,
 			 const struct drm_display_mode *mode)
 {
+	struct cdn_dp_bridge *dp_bridge = bridge_to_dp_bridge(bridge);
 	struct cdn_dp_device *dp = bridge_to_dp(bridge);
 	u32 requested, actual, rate, sink_max, source_max = 0;
 	u8 lanes, bpc;
 
 	/* If DP is disconnected, every mode is invalid */
-	if (!dp->connected)
+	if (!dp_bridge->connected || !dp->connected)
 		return MODE_BAD;
 
 	switch (display_info->bpc) {
@@ -551,6 +599,50 @@ static bool cdn_dp_check_link_status(struct cdn_dp_device *dp)
 	return drm_dp_channel_eq_ok(link_status, min(port->lanes, sink_lanes));
 }
 
+static int cdn_dp_switch_port(struct cdn_dp_device *dp, struct cdn_dp_port *prev_port,
+			      struct cdn_dp_port *port)
+{
+	int ret;
+
+	ret = cdn_dp_disable_phy(dp, prev_port);
+	if (ret)
+		goto out;
+	ret = cdn_dp_enable_phy(dp, port);
+	if (ret)
+		goto out;
+
+	ret = cdn_dp_get_sink_capability(dp);
+	if (ret) {
+		cdn_dp_disable_phy(dp, port);
+		goto out;
+	}
+
+	dp->lanes = port->lanes;
+
+	if (!cdn_dp_check_link_status(dp)) {
+		dev_info(dp->dev, "Connected with sink; re-train link\n");
+
+		ret = cdn_dp_train_link(dp);
+		if (ret) {
+			dev_err(dp->dev, "Training link failed: %d\n", ret);
+			goto out;
+		}
+
+		ret = cdn_dp_set_video_status(dp, CONTROL_VIDEO_IDLE);
+		if (ret) {
+			dev_err(dp->dev, "Failed to idle video %d\n", ret);
+			goto out;
+		}
+
+		ret = cdn_dp_config_video(dp);
+		if (ret)
+			dev_err(dp->dev, "Failed to configure video: %d\n", ret);
+	}
+
+out:
+	return ret;
+}
+
 static void cdn_dp_display_info_update(struct cdn_dp_device *dp,
 				       struct drm_display_info *display_info)
 {
@@ -572,6 +664,7 @@ static void cdn_dp_display_info_update(struct cdn_dp_device *dp,
 static void cdn_dp_bridge_atomic_enable(struct drm_bridge *bridge, struct drm_atomic_commit *state)
 {
 	struct cdn_dp_device *dp = bridge_to_dp(bridge);
+	struct cdn_dp_bridge *dp_bridge = bridge_to_dp_bridge(bridge);
 	struct drm_connector *connector;
 	int ret, val;
 
@@ -581,7 +674,7 @@ static void cdn_dp_bridge_atomic_enable(struct drm_bridge *bridge, struct drm_at
 
 	cdn_dp_display_info_update(dp, &connector->display_info);
 
-	ret = drm_of_encoder_active_endpoint_id(dp->dev->of_node, &dp->encoder.encoder);
+	ret = drm_of_encoder_active_endpoint_id(dp->dev->of_node, &dp_bridge->encoder.encoder);
 	if (ret < 0) {
 		DRM_DEV_ERROR(dp->dev, "Could not get vop id, %d", ret);
 		return;
@@ -600,6 +693,9 @@ static void cdn_dp_bridge_atomic_enable(struct drm_bridge *bridge, struct drm_at
 
 	mutex_lock(&dp->lock);
 
+	if (dp->next_bridge_valid)
+		dp->active_port = dp_bridge->id;
+
 	ret = cdn_dp_enable(dp);
 	if (ret) {
 		DRM_DEV_ERROR(dp->dev, "Failed to enable bridge %d\n",
@@ -632,6 +728,7 @@ static void cdn_dp_bridge_atomic_enable(struct drm_bridge *bridge, struct drm_at
 		goto out;
 	}
 
+	dp_bridge->enabled = true;
 out:
 	mutex_unlock(&dp->lock);
 }
@@ -639,9 +736,11 @@ static void cdn_dp_bridge_atomic_enable(struct drm_bridge *bridge, struct drm_at
 static void cdn_dp_bridge_atomic_disable(struct drm_bridge *bridge, struct drm_atomic_commit *state)
 {
 	struct cdn_dp_device *dp = bridge_to_dp(bridge);
+	struct cdn_dp_bridge *dp_bridge = bridge_to_dp_bridge(bridge);
 	int ret;
 
 	mutex_lock(&dp->lock);
+	dp_bridge->enabled = false;
 
 	if (dp->active) {
 		ret = cdn_dp_disable(dp);
@@ -828,6 +927,17 @@ static int cdn_dp_audio_mute_stream(struct drm_bridge *bridge,
 	return ret;
 }
 
+static void cdn_dp_bridge_hpd_notify(struct drm_bridge *bridge,
+				     struct drm_connector *connector,
+				     enum drm_connector_status status)
+{
+	struct cdn_dp_bridge *dp_bridge = bridge_to_dp_bridge(bridge);
+	struct cdn_dp_device *dp = bridge_to_dp(bridge);
+
+	dp->bridge_list[dp_bridge->id]->connected = status == connector_status_connected;
+	schedule_work(&dp->event_work);
+}
+
 static const struct drm_bridge_funcs cdn_dp_bridge_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
@@ -838,6 +948,7 @@ static const struct drm_bridge_funcs cdn_dp_bridge_funcs = {
 	.atomic_disable = cdn_dp_bridge_atomic_disable,
 	.mode_valid = cdn_dp_bridge_mode_valid,
 	.mode_set = cdn_dp_bridge_mode_set,
+	.hpd_notify = cdn_dp_bridge_hpd_notify,
 
 	.dp_audio_prepare = cdn_dp_audio_prepare,
 	.dp_audio_mute_stream = cdn_dp_audio_mute_stream,
@@ -886,7 +997,8 @@ static void cdn_dp_pd_event_work(struct work_struct *work)
 {
 	struct cdn_dp_device *dp = container_of(work, struct cdn_dp_device,
 						event_work);
-	int ret;
+	bool connected;
+	int i, ret;
 
 	mutex_lock(&dp->lock);
 
@@ -945,9 +1057,12 @@ static void cdn_dp_pd_event_work(struct work_struct *work)
 
 out:
 	mutex_unlock(&dp->lock);
-	drm_bridge_hpd_notify(&dp->bridge,
-			      dp->connected ? connector_status_connected
-					    : connector_status_disconnected);
+	for (i = 0; i < dp->bridge_count; i++) {
+		connected = dp->connected && dp->bridge_list[i]->connected;
+		drm_bridge_hpd_notify(&dp->bridge_list[i]->bridge,
+				      connected ? connector_status_connected
+						: connector_status_disconnected);
+	}
 }
 
 static int cdn_dp_pd_event(struct notifier_block *nb,
@@ -967,28 +1082,16 @@ static int cdn_dp_pd_event(struct notifier_block *nb,
 	return NOTIFY_DONE;
 }
 
-static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
+static int cdn_bridge_add(struct device *dev,
+			  struct drm_bridge *bridge,
+			  struct drm_bridge *next_bridge,
+			  struct drm_encoder *encoder)
 {
 	struct cdn_dp_device *dp = dev_get_drvdata(dev);
-	struct drm_encoder *encoder;
+	struct drm_device *drm_dev = dp->drm_dev;
+	struct drm_bridge *last_bridge __free(drm_bridge_put) = NULL;
 	struct drm_connector *connector;
-	struct cdn_dp_port *port;
-	struct drm_device *drm_dev = data;
-	int ret, i;
-
-	ret = cdn_dp_parse_dt(dp);
-	if (ret < 0)
-		return ret;
-
-	dp->drm_dev = drm_dev;
-	dp->connected = false;
-	dp->active = false;
-	dp->active_port = -1;
-	dp->fw_loaded = false;
-
-	INIT_WORK(&dp->event_work, cdn_dp_pd_event_work);
-
-	encoder = &dp->encoder.encoder;
+	int ret;
 
 	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm_dev,
 							     dev->of_node);
@@ -1003,26 +1106,35 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
 
 	drm_encoder_helper_add(encoder, &cdn_dp_encoder_helper_funcs);
 
-	dp->bridge.ops =
-			DRM_BRIDGE_OP_DETECT |
-			DRM_BRIDGE_OP_EDID |
-			DRM_BRIDGE_OP_HPD |
-			DRM_BRIDGE_OP_DP_AUDIO;
-	dp->bridge.of_node = dp->dev->of_node;
-	dp->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
-	dp->bridge.hdmi_audio_dev = dp->dev;
-	dp->bridge.hdmi_audio_max_i2s_playback_channels = 8;
-	dp->bridge.hdmi_audio_spdif_playback = 1;
-	dp->bridge.hdmi_audio_dai_port = -1;
-
-	ret = devm_drm_bridge_add(dev, &dp->bridge);
+	bridge->ops =
+		DRM_BRIDGE_OP_DETECT |
+		DRM_BRIDGE_OP_EDID |
+		DRM_BRIDGE_OP_HPD |
+		DRM_BRIDGE_OP_DP_AUDIO;
+	bridge->of_node = dp->dev->of_node;
+	bridge->type = DRM_MODE_CONNECTOR_DisplayPort;
+	bridge->hdmi_audio_dev = dp->dev;
+	bridge->hdmi_audio_max_i2s_playback_channels = 8;
+	bridge->hdmi_audio_spdif_playback = 1;
+	bridge->hdmi_audio_dai_port = -1;
+
+	ret = devm_drm_bridge_add(dev, bridge);
 	if (ret)
 		return ret;
 
-	ret = drm_bridge_attach(encoder, &dp->bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	ret = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret)
 		return ret;
 
+	if (next_bridge) {
+		ret = drm_bridge_attach(encoder, next_bridge, bridge,
+					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+		if (ret)
+			return ret;
+
+		last_bridge = drm_bridge_chain_get_last_bridge(bridge->encoder);
+	}
+
 	connector = drm_bridge_connector_init(drm_dev, encoder);
 	if (IS_ERR(connector)) {
 		ret = PTR_ERR(connector);
@@ -1030,6 +1142,101 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 	}
 
+	if (last_bridge) {
+		fwnode_handle_put(connector->fwnode);
+		connector->fwnode = fwnode_handle_get(of_fwnode_handle(last_bridge->of_node));
+	}
+
+	return 0;
+}
+
+static int cdn_dp_parse_next_bridge_dt(struct cdn_dp_device *dp)
+{
+	struct device_node *np = dp->dev->of_node;
+	struct device_node *port __free(device_node) = of_graph_get_port_by_id(np, 1);
+	struct drm_bridge *bridge;
+	int count = 0;
+	int ret = 0;
+	int i;
+
+	/* If device use extcon, do not use hpd bridge */
+	for (i = 0; i < dp->ports; i++) {
+		if (dp->port[i]->extcon) {
+			dp->bridge_count = 1;
+			return 0;
+		}
+	}
+
+	/* One endpoint may correspond to one next bridge. */
+	for_each_of_graph_port_endpoint(port, dp_ep) {
+		struct device_node *next_bridge_node __free(device_node) =
+			of_graph_get_remote_port_parent(dp_ep);
+
+		bridge = of_drm_find_bridge(next_bridge_node);
+		if (!bridge) {
+			ret = -EPROBE_DEFER;
+			goto out;
+		}
+
+		dp->next_bridge_valid = true;
+		dp->next_bridge_list[count] = drm_bridge_get(bridge);
+		count++;
+	}
+
+out:
+	dp->bridge_count = count ? count : 1;
+	return ret;
+}
+
+static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
+{
+	struct cdn_dp_device *dp = dev_get_drvdata(dev);
+	struct drm_bridge *bridge, *next_bridge;
+	struct drm_encoder *encoder;
+	struct cdn_dp_port *port;
+	struct drm_device *drm_dev = data;
+	struct cdn_dp_bridge *dp_bridge;
+	int ret, i;
+
+	ret = cdn_dp_parse_dt(dp);
+	if (ret < 0)
+		return ret;
+
+	ret = cdn_dp_parse_next_bridge_dt(dp);
+	if (ret)
+		goto out;
+
+	dp->drm_dev = drm_dev;
+	dp->connected = false;
+	dp->active = false;
+	dp->active_port = -1;
+	dp->fw_loaded = false;
+
+	for (i = 0; i < dp->bridge_count; i++) {
+		dp_bridge = devm_drm_bridge_alloc(dev, struct cdn_dp_bridge, bridge,
+						    &cdn_dp_bridge_funcs);
+		if (IS_ERR(dp_bridge)) {
+			ret = PTR_ERR(dp_bridge);
+			goto out;
+		}
+		dp_bridge->id = i;
+		dp_bridge->parent = dp;
+		if (!dp->next_bridge_valid)
+			dp_bridge->connected = true;
+		dp->bridge_list[i] = dp_bridge;
+	}
+
+	for (i = 0; i < dp->bridge_count; i++) {
+		encoder = &dp->bridge_list[i]->encoder.encoder;
+		bridge = &dp->bridge_list[i]->bridge;
+		next_bridge = dp->next_bridge_list[i];
+		ret = cdn_bridge_add(dev, bridge, next_bridge, encoder);
+		if (ret)
+			goto out;
+	}
+
+	INIT_WORK(&dp->event_work, cdn_dp_pd_event_work);
+
 	for (i = 0; i < dp->ports; i++) {
 		port = dp->port[i];
 
@@ -1043,7 +1250,7 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
 		if (ret) {
 			DRM_DEV_ERROR(dev,
 				      "register EXTCON_DISP_DP notifier err\n");
-			return ret;
+			goto out;
 		}
 	}
 
@@ -1052,15 +1259,29 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
 	schedule_work(&dp->event_work);
 
 	return 0;
+
+out:
+	for (i = 0; i < MAX_PHY; i++)
+		drm_bridge_put(dp->next_bridge_list[i]);
+
+	return ret;
 }
 
 static void cdn_dp_unbind(struct device *dev, struct device *master, void *data)
 {
 	struct cdn_dp_device *dp = dev_get_drvdata(dev);
-	struct drm_encoder *encoder = &dp->encoder.encoder;
+	struct drm_encoder *encoder;
+	int i;
 
 	cancel_work_sync(&dp->event_work);
-	encoder->funcs->destroy(encoder);
+	for (i = 0; i < dp->bridge_count; i++) {
+		encoder = &dp->bridge_list[i]->encoder.encoder;
+		encoder->funcs->destroy(encoder);
+		drm_bridge_put(dp->next_bridge_list[i]);
+	}
+
+	for (i = 0; i < MAX_PHY; i++)
+		drm_edid_free(dp->edid_cache[i]);
 
 	pm_runtime_disable(dev);
 	if (dp->fw_loaded)
@@ -1111,10 +1332,10 @@ static int cdn_dp_probe(struct platform_device *pdev)
 	int ret;
 	int i;
 
-	dp = devm_drm_bridge_alloc(dev, struct cdn_dp_device, bridge,
-				   &cdn_dp_bridge_funcs);
-	if (IS_ERR(dp))
-		return PTR_ERR(dp);
+	dp = devm_kzalloc(dev, sizeof(*dp), GFP_KERNEL);
+	if (!dp)
+		return -ENOMEM;
+
 	dp->dev = dev;
 
 	match = of_match_node(cdn_dp_dt_ids, pdev->dev.of_node);
diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.h b/drivers/gpu/drm/rockchip/cdn-dp-core.h
index e9c30b9fd543..c10e423bbf06 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.h
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.h
@@ -38,6 +38,8 @@ enum vic_pxl_encoding_format {
 	Y_ONLY = 0x10,
 };
 
+struct cdn_dp_device;
+
 struct video_info {
 	bool h_sync_polarity;
 	bool v_sync_polarity;
@@ -63,16 +65,28 @@ struct cdn_dp_port {
 	u8 id;
 };
 
+struct cdn_dp_bridge {
+	struct cdn_dp_device *parent;
+	struct drm_bridge bridge;
+	struct rockchip_encoder encoder;
+	bool connected;
+	bool enabled;
+	int id;
+};
+
 struct cdn_dp_device {
 	struct device *dev;
 	struct drm_device *drm_dev;
-	struct drm_bridge bridge;
-	struct rockchip_encoder encoder;
+	int bridge_count;
+	struct cdn_dp_bridge *bridge_list[MAX_PHY];
+	struct drm_bridge *next_bridge_list[MAX_PHY];
+	const struct drm_edid *edid_cache[MAX_PHY];
 	struct drm_display_mode mode;
 	struct platform_device *audio_pdev;
 	struct work_struct event_work;
 
 	struct mutex lock;
+	bool next_bridge_valid;
 	bool connected;
 	bool active;
 	bool suspended;
-- 
2.53.0


