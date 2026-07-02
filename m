Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C77C43602
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 16:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ik67GD/2i78xfrGe+gYf3a65KDr4Tg+2EgInqKJ3odI=; b=UFZZwKefAZTI8eKmzLNIrc2trP
	lLGF8MOpu4Og22sW/PS1ElaHf19cbTSdP/n1weI6NNFfbKjZoU3qxTBuZxciu1jC65t46BAJst7XL
	HqNx1IW5B8EiyBm0fzzvk1/0cv1oLTvNXqFCPjUqqVoIQO9MfapLO4YiWjHm6x9NVhKq09Q19lMzS
	G3X0Ry8mwuP8BKoZROiFhxbGAxOPq0Pnepll7sXPZt/hGmB6YOQH9mAlQmXXpnYggYCV05tWC15Dw
	MyfOVdXp/+HEwhccc389bfB3jkFKM6KFkFp39PzVgSEGDLixNc3bRP6Ow8o3oO94w1vMDIONWJZv1
	aFKYE7vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfIgf-00000004egw-2mC2;
	Thu, 02 Jul 2026 14:46:45 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfIgb-00000004eYQ-0Xf4;
	Thu, 02 Jul 2026 14:46:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783003599;
	bh=c+X7KYcJ0x+hDbr0ifb6EmCP7ZEzo/GJLuiaJ5gbEJk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=I45xClyZw/5RRkvwvZGHXKZFmR+HJCgAv1E1aNqLiarznASqiWaq8GZENPqWtIBnH
	 RDjdj6us9w849OjMLgMC2wSgBL2IQr9GJn2lGTFcKyle3Bmrs8GbYjqKRh9c2UNWKk
	 od1NPL+jz/kpwza7FJWd3tzoBX5hfjZ3H2cDBjcJiMjx80grFsLO2aAZEd6TpiDu2D
	 /JziI0cExBlf26k1cOMxJM3fIhesn/CAlc4zizo6M52G9U8VofmOYXQq/TiTGaZ2CR
	 Qq/9PJk1+BKG0KBCP2YB+M5aZPfpUb2sMoXS4EToXPBHtrABbsmxpH4L0b+RGd+Aml
	 Q6oETCs/M4Log==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E784017E15DA;
	Thu,  2 Jul 2026 16:46:38 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 02 Jul 2026 17:46:23 +0300
Subject: [PATCH v8 10/39] drm/display: hdmi-state-helper: Sync SCDC state
 on hotplug
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-dw-hdmi-qp-scramb-v8-10-d79890d00b6a@collabora.com>
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
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_074641_791924_80431F92 
X-CRM114-Status: GOOD (  17.19  )
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

drm_atomic_helper_connector_hdmi_hotplug() does not currently
synchronize SCDC status on hotplug events, leaving the scrambler state
potentially inconsistent after (re)connect.

Hook drm_connector_hdmi_sync_scdc() into both the connect and disconnect
paths, replacing the existing TODOs around missing scrambler handling.

SCDC synchronization may require a CRTC reset, which in turn needs a
modeset acquire context for correct locking.  Therefore, extend
drm_atomic_helper_connector_hdmi_hotplug() and
drm_atomic_helper_connector_hdmi_update() to take a
drm_modeset_acquire_ctx argument.  Additionally, change their return
type from void to int, allowing propagation of errors, such as -EDEADLK
from lock contention.

Update existing callers to pass NULL for the acquire context, preserving
current behavior.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c  |  3 ++-
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 28 +++++++++++++++++--------
 drivers/gpu/drm/vc4/vc4_hdmi.c                  |  2 +-
 include/drm/display/drm_hdmi_state_helper.h     |  6 ++++--
 4 files changed, 26 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 796069dbf1a1..46104506fe32 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -221,7 +221,8 @@ drm_bridge_connector_detect(struct drm_connector *connector, bool force)
 		status = detect->funcs->detect(detect, connector);
 
 		if (hdmi)
-			drm_atomic_helper_connector_hdmi_hotplug(connector, status);
+			drm_atomic_helper_connector_hdmi_hotplug(connector, status,
+								 NULL);
 
 		drm_bridge_connector_hpd_notify(connector, status);
 	} else {
diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index db76699093e8..69ccfbf123fe 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -1198,18 +1198,20 @@ drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector *con
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_clear_audio_infoframe);
 
-static void
+static int
 drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector,
-					enum drm_connector_status status)
+					enum drm_connector_status status,
+					struct drm_modeset_acquire_ctx *ctx)
 {
 	const struct drm_edid *drm_edid;
+	int ret = 0;
 
 	if (status == connector_status_disconnected) {
-		// TODO: also handle scramber, HDMI sink disconnected.
+		ret = drm_connector_hdmi_sync_scdc(connector, false, ctx);
 		drm_connector_hdmi_audio_plugged_notify(connector, false);
 		drm_edid_connector_update(connector, NULL);
 		drm_connector_cec_phys_addr_invalidate(connector);
-		return;
+		return ret;
 	}
 
 	if (connector->hdmi.funcs->read_edid)
@@ -1222,24 +1224,32 @@ drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector,
 	drm_edid_free(drm_edid);
 
 	if (status == connector_status_connected) {
-		// TODO: also handle scramber, HDMI sink is now connected.
+		ret = drm_connector_hdmi_sync_scdc(connector, true, ctx);
 		drm_connector_hdmi_audio_plugged_notify(connector, true);
 		drm_connector_cec_phys_addr_set(connector);
 	}
+
+	return ret;
 }
 
 /**
  * drm_atomic_helper_connector_hdmi_hotplug - Handle the hotplug event for the HDMI connector
  * @connector: A pointer to the HDMI connector
  * @status: Connection status
+ * @ctx: Lock acquisition context to be used for resetting CRTC
  *
  * This function should be called as a part of the .detect() / .detect_ctx()
  * callbacks for all status changes.
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ * If @ctx is set, it might also return -EDEADLK.
  */
-void drm_atomic_helper_connector_hdmi_hotplug(struct drm_connector *connector,
-					      enum drm_connector_status status)
+int drm_atomic_helper_connector_hdmi_hotplug(struct drm_connector *connector,
+					     enum drm_connector_status status,
+					     struct drm_modeset_acquire_ctx *ctx)
 {
-	drm_atomic_helper_connector_hdmi_update(connector, status);
+	return drm_atomic_helper_connector_hdmi_update(connector, status, ctx);
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_hotplug);
 
@@ -1254,6 +1264,6 @@ EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_hotplug);
  */
 void drm_atomic_helper_connector_hdmi_force(struct drm_connector *connector)
 {
-	drm_atomic_helper_connector_hdmi_update(connector, connector->status);
+	drm_atomic_helper_connector_hdmi_update(connector, connector->status, NULL);
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_force);
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 74dce4be0c00..e165f604939b 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -375,7 +375,7 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
 	 * the lock for now.
 	 */
 
-	drm_atomic_helper_connector_hdmi_hotplug(connector, status);
+	drm_atomic_helper_connector_hdmi_hotplug(connector, status, NULL);
 
 	if (status != connector_status_connected)
 		return;
diff --git a/include/drm/display/drm_hdmi_state_helper.h b/include/drm/display/drm_hdmi_state_helper.h
index 13375bd0f4ae..0619cd7c435e 100644
--- a/include/drm/display/drm_hdmi_state_helper.h
+++ b/include/drm/display/drm_hdmi_state_helper.h
@@ -7,6 +7,7 @@ struct drm_atomic_commit;
 struct drm_connector;
 struct drm_connector_state;
 struct drm_display_mode;
+struct drm_modeset_acquire_ctx;
 struct hdmi_audio_infoframe;
 
 enum drm_connector_status;
@@ -22,8 +23,9 @@ int drm_atomic_helper_connector_hdmi_update_audio_infoframe(struct drm_connector
 int drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector *connector);
 int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *connector,
 						       struct drm_atomic_commit *state);
-void drm_atomic_helper_connector_hdmi_hotplug(struct drm_connector *connector,
-					      enum drm_connector_status status);
+int drm_atomic_helper_connector_hdmi_hotplug(struct drm_connector *connector,
+					     enum drm_connector_status status,
+					     struct drm_modeset_acquire_ctx *ctx);
 void drm_atomic_helper_connector_hdmi_force(struct drm_connector *connector);
 
 enum drm_mode_status

-- 
2.54.0


