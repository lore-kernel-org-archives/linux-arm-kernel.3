Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 949DFC43327
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 14:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xWRF6lOK0QLoTQo0be4dFnEaTF0MootzJdbfn+JGusg=; b=wY4ab8I9BvRS2P3OWRe5/MdWZv
	15BgIfFyknGJDntK4UCHtbGnV0nEkCFQ36xqAgrlp7dGr5q2PP9sX6WdXkrOdMbZ0gl3GkCxFcthP
	UFBIswWokDbXL5YMHeSnkZ7zTncM9GAl8lP8xSuQtjpPJLLFmcrqQksu8QAy6AZuY95lJ8hTVfRSN
	u29wOzsgmQ844OHXfojGIQck2ipyUvbygjlCuakez/9AC025xEcszYdnN9YrtJssOYlWW2jcACUwu
	xZogRh4aoNQj0DJwSZpd6fl+vjdcnON6/TJiiaWlWkpIhuEQS4Ij4yhYzNp885As9wx+cnS4F7Muu
	LpBJmscw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfIhB-00000004fky-0RWL;
	Thu, 02 Jul 2026 14:47:17 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfIge-00000004ec4-3JRi;
	Thu, 02 Jul 2026 14:46:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783003602;
	bh=OZazMdU01+3MFQsLIygiwL4qshpKvkuUHIIhOMIbyus=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QK7Rw9XzuK1z0Yo6CQt4f1HDvwV+DeWw8PoxBVJn9gxKLqCme5u0XKrr8FmgOnZeT
	 1H03YzavApR4aW4E7p3fmAQhyK/1X+fMmmvO8MraYm58flT1E1zvL4yxL6tQ49Psuo
	 FQzFvvrZBU/9gaZuTs64j1R9EXLAI2KbChI5UwxoivcTQz8cB+XiAoHgyjOGzk9x2u
	 qNuG9EmJFjidKsGILbNyvy34prIclY3UiPTlNOzwOd0v3G3gmCpPbwrkeU1SKJHDM5
	 zJDfGS2PAF+Myu0dbrtTfMv9IBL5QmdkbLalujF5ILGDNEr4lVeEMQd2m8O/3GTRGZ
	 z6FjYVL5H8C6g==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B3C4E17E35E3;
	Thu,  2 Jul 2026 16:46:42 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 02 Jul 2026 17:46:28 +0300
Subject: [PATCH v8 15/39] drm/display: bridge_connector: Switch to
 .detect_ctx() connector helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-dw-hdmi-qp-scramb-v8-15-d79890d00b6a@collabora.com>
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
 Maud Spierings <maud_spierings@hotmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_074645_031406_676234B6 
X-CRM114-Status: GOOD (  13.16  )
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

Replace the .detect() connector_funcs callback with the atomic-aware
.detect_ctx() connector_helper_funcs hook.

This propagates the modeset acquire context through
drm_atomic_helper_connector_hdmi_hotplug() to the HDMI connector
framework, enabling SCDC state recovery via CRTC reset when the sink
reconnects during an active display pipeline.

Tested-by: Diederik de Haas <diederik@cknow-tech.com>
Tested-by: Maud Spierings <maud_spierings@hotmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 74 ++++++++++++++------------
 1 file changed, 39 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 57238ba49d70..17eb2548efad 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -208,40 +208,6 @@ static void drm_bridge_connector_disable_hpd(struct drm_connector *connector)
  * Bridge Connector Functions
  */
 
-static enum drm_connector_status
-drm_bridge_connector_detect(struct drm_connector *connector, bool force)
-{
-	struct drm_bridge_connector *bridge_connector =
-		to_drm_bridge_connector(connector);
-	struct drm_bridge *detect = bridge_connector->bridge_detect;
-	struct drm_bridge *hdmi = bridge_connector->bridge_hdmi;
-	enum drm_connector_status status;
-
-	if (detect) {
-		status = detect->funcs->detect(detect, connector);
-
-		if (hdmi)
-			drm_atomic_helper_connector_hdmi_hotplug(connector, status,
-								 NULL);
-
-		drm_bridge_connector_hpd_notify(connector, status);
-	} else {
-		switch (connector->connector_type) {
-		case DRM_MODE_CONNECTOR_DPI:
-		case DRM_MODE_CONNECTOR_LVDS:
-		case DRM_MODE_CONNECTOR_DSI:
-		case DRM_MODE_CONNECTOR_eDP:
-			status = connector_status_connected;
-			break;
-		default:
-			status = connector_status_unknown;
-			break;
-		}
-	}
-
-	return status;
-}
-
 static void drm_bridge_connector_force(struct drm_connector *connector)
 {
 	struct drm_bridge_connector *bridge_connector =
@@ -308,7 +274,6 @@ drm_bridge_connector_color_format(const struct drm_connector_state *conn_state)
 }
 
 static const struct drm_connector_funcs drm_bridge_connector_funcs = {
-	.detect = drm_bridge_connector_detect,
 	.force = drm_bridge_connector_force,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.atomic_create_state = drm_bridge_connector_create_state,
@@ -323,6 +288,44 @@ static const struct drm_connector_funcs drm_bridge_connector_funcs = {
  * Bridge Connector Helper Functions
  */
 
+static int drm_bridge_connector_detect_ctx(struct drm_connector *connector,
+					   struct drm_modeset_acquire_ctx *ctx,
+					   bool force)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *detect = bridge_connector->bridge_detect;
+	struct drm_bridge *hdmi = bridge_connector->bridge_hdmi;
+	enum drm_connector_status status;
+	int ret;
+
+	if (detect) {
+		status = detect->funcs->detect(detect, connector);
+
+		if (hdmi) {
+			ret = drm_atomic_helper_connector_hdmi_hotplug(connector, status, ctx);
+			if (ret == -EDEADLK)
+				return ret;
+		}
+
+		drm_bridge_connector_hpd_notify(connector, status);
+	} else {
+		switch (connector->connector_type) {
+		case DRM_MODE_CONNECTOR_DPI:
+		case DRM_MODE_CONNECTOR_LVDS:
+		case DRM_MODE_CONNECTOR_DSI:
+		case DRM_MODE_CONNECTOR_eDP:
+			status = connector_status_connected;
+			break;
+		default:
+			status = connector_status_unknown;
+			break;
+		}
+	}
+
+	return status;
+}
+
 static int drm_bridge_connector_get_modes_edid(struct drm_connector *connector,
 					       struct drm_bridge *bridge)
 {
@@ -414,6 +417,7 @@ static int drm_bridge_connector_atomic_check(struct drm_connector *connector,
 
 static const struct drm_connector_helper_funcs drm_bridge_connector_helper_funcs = {
 	.get_modes = drm_bridge_connector_get_modes,
+	.detect_ctx = drm_bridge_connector_detect_ctx,
 	.mode_valid = drm_bridge_connector_mode_valid,
 	.enable_hpd = drm_bridge_connector_enable_hpd,
 	.disable_hpd = drm_bridge_connector_disable_hpd,

-- 
2.54.0


