Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134C5C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 18:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z5DRTm1vBTSdsG8fvXQbVvQFIhMRCac0V8WwKFuXILs=; b=ljJ4PhL1hPNB34EoLcfI46NwQH
	EE/a/d73pZ7lZjnOeCEuUY9gznPPjZheSyLKZMLBH+1l7c8qwegW4oLdbpFE0/CsdzbwY4UjJ4jlL
	MGEX7WGSr8q6z+3x0aw7w9TDsAtGR6vPx6LWWEsCU16pwWv502RRp3Oo0oX+YJaZxJDzI6cvraXA2
	0zvk0qanpGTDJbhC+BuiPMtXq9ZL9GgQjOH6q9HuEhAuRvss1PkN88a+DWkA4rQ/x8fH0k/tzAt/d
	crG2yRUDWC2DfVht5EwTZLQ0w0NRw0zBHV9t5iRqhw0uY3pcoC8/XS/csptQwrDh3JS+zrune5Umm
	Ck/h0tJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Tav-0000000D3Iq-4A4Q;
	Tue, 01 Sep 2026 18:52:30 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TZW-0000000D0rX-1Rgd;
	Tue, 01 Sep 2026 18:51:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788288659;
	bh=RkfCwo+2xh2eA4ByQWj+OR0E04K3cBjBCK6HYgdmnC4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=e57Wp8BCxkaI3grdmHvLeFEzL34bcRhsPmJS/VLQ6NSOsAK5su60nB3bcl5H0C/fk
	 nh31JaIO157gB+AJ5utw8azvVZ5H4berfJoT3IUd2a3v7Chnu7ZMBRbxoskadxEYXZ
	 GalLCIzLFoE6OA7dpRgi1vEuhqNXj2ATFnSekxYS0yx7l9Fjy5my1w3hMTHXa+vJU9
	 0OBPLJZftdnFTMixnWZ+d4ardebC+7dO30nd2PrUieKTL0U6w6aszH3ZaXsrrIm4FB
	 LbeJ3wThzHrLRbw4lSnx7bkhUypGR4F/sIwgeraRhoXNzFA2C9QnlPwVbIBeZfec7s
	 dLg4LSiPPdg2w==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9D9B417E38F9;
	Tue, 01 Sep 2026 20:50:59 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 01 Sep 2026 21:50:49 +0300
Subject: [PATCH v11 25/74] drm/display: bridge_connector: Switch to
 .force_ctx() connector helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dw-hdmi-qp-scramb-v11-25-bc12954a0688@collabora.com>
References: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
In-Reply-To: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Algea Cao <algea.cao@rock-chips.com>, 
 Daniel Stone <daniels@collabora.com>, Liu Ying <victor.liu@nxp.com>, 
 Phong LE <ple@baylibre.com>, Helge Deller <deller@gmx.de>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 linux-fbdev@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_115102_581124_1AF83BB4 
X-CRM114-Status: GOOD (  13.30  )
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

Turn drm_bridge_connector_force() into a .force_ctx() implementation and
hand the acquire context over to
drm_atomic_helper_connector_hdmi_force_ctx(), so that the HDMI connector
framework can reset the CRTC to recover the SCDC state when the sink
reconnects while the display pipeline is active.

No functional change for non-HDMI bridge connectors, which keep behaving
as a no-op.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index b5a6e2e8bcd5..707d7143e475 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -208,16 +208,6 @@ static void drm_bridge_connector_disable_hpd(struct drm_connector *connector)
  * Bridge Connector Functions
  */
 
-static void drm_bridge_connector_force(struct drm_connector *connector)
-{
-	struct drm_bridge_connector *bridge_connector =
-		to_drm_bridge_connector(connector);
-	struct drm_bridge *hdmi = bridge_connector->bridge_hdmi;
-
-	if (hdmi)
-		drm_atomic_helper_connector_hdmi_force(connector);
-}
-
 static void drm_bridge_connector_debugfs_init(struct drm_connector *connector,
 					      struct dentry *root)
 {
@@ -277,7 +267,6 @@ drm_bridge_connector_color_format(const struct drm_connector_state *conn_state)
 }
 
 static const struct drm_connector_funcs drm_bridge_connector_funcs = {
-	.force = drm_bridge_connector_force,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.atomic_create_state = drm_bridge_connector_create_state,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
@@ -329,6 +318,19 @@ static int drm_bridge_connector_detect_ctx(struct drm_connector *connector,
 	return status;
 }
 
+static int drm_bridge_connector_force_ctx(struct drm_connector *connector,
+					  struct drm_modeset_acquire_ctx *ctx)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *hdmi = bridge_connector->bridge_hdmi;
+
+	if (hdmi)
+		return drm_atomic_helper_connector_hdmi_force_ctx(connector, ctx);
+
+	return 0;
+}
+
 static int drm_bridge_connector_get_modes_edid(struct drm_connector *connector,
 					       struct drm_bridge *bridge)
 {
@@ -421,6 +423,7 @@ static int drm_bridge_connector_atomic_check(struct drm_connector *connector,
 static const struct drm_connector_helper_funcs drm_bridge_connector_helper_funcs = {
 	.get_modes = drm_bridge_connector_get_modes,
 	.detect_ctx = drm_bridge_connector_detect_ctx,
+	.force_ctx = drm_bridge_connector_force_ctx,
 	.mode_valid = drm_bridge_connector_mode_valid,
 	.enable_hpd = drm_bridge_connector_enable_hpd,
 	.disable_hpd = drm_bridge_connector_disable_hpd,

-- 
2.55.0


