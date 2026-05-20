Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02741CD5BAA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 18:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DiXaNNVElE6tV81lGBQdNHRXSeFSRLlQtPHAkAUqP10=; b=JirjMqw6hrs4Im2bWopVyrB+mI
	m4KypGKFvACANbUTRJCfW8vW6gMxgL4TFIJgEuWBdVg7XUYl0+WqYfng7Wa4wU56WnQhp+QID2faG
	LyBwp1sm4pUlXIO+msNFM7thq8Lw6uRJZS2SGKnQZpwkyL40FAAsXrkvCHTnDSSP+7W46ZUnA3XZo
	84U527mX+t1PGsIWqkD1OB1YseKFc2zlk++VBb4POMiEi3WJ2R41VZkf5GiZEAgqugTyJr5dKraOZ
	urmqHL79E5upp+aXNMDEAkXzBDprw+hbqvXQAWeVPcETbV5N19px8ht2L8jTpDAe7DK0ecig+G94f
	QN46pM0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPlol-00000005T6E-44MH;
	Wed, 20 May 2026 18:38:55 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPloV-00000005Sjn-2ji0;
	Wed, 20 May 2026 18:38:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1779302314;
	bh=PMazGqrcLk62NiMiM9e91vC9gW9B5kWfiknu5e2hMqQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MWk9NuHFft+ssCnRSNfAq9lIBXdSiTZj8eyoUn1w2i16+mCvg+qB1GdU5jg34Gak9
	 4Xn1HUmKXzeLkyRygE2iGwYXPCCSYG4wkLCuSD40w+aZtM+6StO/GDAhOKpKoR8NtK
	 whN0sfmD7mMyDqIlfUQWaQKoh4xajv6w7d7AW2dmEBysqMUycGxVnHzFwEdmhVYPwp
	 VSok+yeSBU54gG9r6Glv/wjqgkY4srQu9WS5PpvsgDm2+4KTk9le+bkSmfPhrS/EWY
	 nqSthg2/bTB8kH+H9Ue6DGfU5b5MEc+Bi98+7BCnyfOFoWMjeZsnD3w58zOY0qep3Z
	 rrSitDbXy4QYQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C0CE517E1454;
	Wed, 20 May 2026 20:38:34 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 20 May 2026 21:38:16 +0300
Subject: [PATCH v6 05/22] drm/display: hdmi_state_helper: Add ctx-aware
 hotplug helper for SCDC sync
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-dw-hdmi-qp-scramb-v6-5-24b74603b782@collabora.com>
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
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_113839_868175_A324DC13 
X-CRM114-Status: GOOD (  14.39  )
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

Introduce drm_atomic_helper_connector_hdmi_hotplug_ctx(), a variant of
drm_atomic_helper_connector_hdmi_hotplug() that accepts a
drm_modeset_acquire_ctx.

This enables SCDC status synchronization on hotplug events, which
requires lock acquisition context for performing the CRTC reset
triggered by drm_scdc_sync_status().

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 36 ++++++++++++++++++++-----
 include/drm/display/drm_hdmi_state_helper.h     |  4 +++
 2 files changed, 33 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 4867edbf2622..26c491047a6a 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -12,6 +12,7 @@
 #include <drm/display/drm_hdmi_cec_helper.h>
 #include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
+#include <drm/display/drm_scdc_helper.h>
 
 /**
  * DOC: hdmi helpers
@@ -1149,18 +1150,20 @@ drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector *con
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
+		drm_scdc_sync_status(connector, false, ctx);
 		drm_connector_hdmi_audio_plugged_notify(connector, false);
 		drm_edid_connector_update(connector, NULL);
 		drm_connector_cec_phys_addr_invalidate(connector);
-		return;
+		return 0;
 	}
 
 	if (connector->hdmi.funcs->read_edid)
@@ -1173,10 +1176,12 @@ drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector,
 	drm_edid_free(drm_edid);
 
 	if (status == connector_status_connected) {
-		// TODO: also handle scramber, HDMI sink is now connected.
+		ret = drm_scdc_sync_status(connector, true, ctx);
 		drm_connector_hdmi_audio_plugged_notify(connector, true);
 		drm_connector_cec_phys_addr_set(connector);
 	}
+
+	return ret;
 }
 
 /**
@@ -1190,10 +1195,27 @@ drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector,
 void drm_atomic_helper_connector_hdmi_hotplug(struct drm_connector *connector,
 					      enum drm_connector_status status)
 {
-	drm_atomic_helper_connector_hdmi_update(connector, status);
+	drm_atomic_helper_connector_hdmi_update(connector, status, NULL);
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_hotplug);
 
+/**
+ * drm_atomic_helper_connector_hdmi_hotplug_ctx - Handle the hotplug event for the HDMI connector
+ * @connector: A pointer to the HDMI connector
+ * @status: Connection status
+ * @ctx: Lock acquisition context to be used for resetting CRTC
+ *
+ * This function should be called as a part of the .detect() / .detect_ctx()
+ * callbacks for all status changes.
+ */
+int drm_atomic_helper_connector_hdmi_hotplug_ctx(struct drm_connector *connector,
+						 enum drm_connector_status status,
+						 struct drm_modeset_acquire_ctx *ctx)
+{
+	return drm_atomic_helper_connector_hdmi_update(connector, status, ctx);
+}
+EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_hotplug_ctx);
+
 /**
  * drm_atomic_helper_connector_hdmi_force - HDMI Connector implementation of the force callback
  * @connector: A pointer to the HDMI connector
@@ -1205,6 +1227,6 @@ EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_hotplug);
  */
 void drm_atomic_helper_connector_hdmi_force(struct drm_connector *connector)
 {
-	drm_atomic_helper_connector_hdmi_update(connector, connector->status);
+	drm_atomic_helper_connector_hdmi_update(connector, connector->status, NULL);
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_force);
diff --git a/include/drm/display/drm_hdmi_state_helper.h b/include/drm/display/drm_hdmi_state_helper.h
index 0adc30c55ec9..a572fe2bf9aa 100644
--- a/include/drm/display/drm_hdmi_state_helper.h
+++ b/include/drm/display/drm_hdmi_state_helper.h
@@ -7,6 +7,7 @@ struct drm_atomic_commit;
 struct drm_connector;
 struct drm_connector_state;
 struct drm_display_mode;
+struct drm_modeset_acquire_ctx;
 struct hdmi_audio_infoframe;
 
 enum drm_connector_status;
@@ -24,6 +25,9 @@ int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *con
 						       struct drm_atomic_commit *state);
 void drm_atomic_helper_connector_hdmi_hotplug(struct drm_connector *connector,
 					      enum drm_connector_status status);
+int drm_atomic_helper_connector_hdmi_hotplug_ctx(struct drm_connector *connector,
+						 enum drm_connector_status status,
+						 struct drm_modeset_acquire_ctx *ctx);
 void drm_atomic_helper_connector_hdmi_force(struct drm_connector *connector);
 
 enum drm_mode_status

-- 
2.53.0


