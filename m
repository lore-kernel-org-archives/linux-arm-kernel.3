Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FAB7C54F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 16:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bbp3te2GirkKM69nxU9ed/GUtKcgsp30Et+V2tcpQbE=; b=p5P053xmbVfmIwolnXQe7eMQFB
	ucXG8OxyBhHHBQRzeBwHpTtCNjB+ROh2ZXg3DgMX1xvfr2QUXBO/sgI/pxwXkZXfF4NEnAeFLKkzA
	Hmykg9qpN32uxnfqyaoGWOTZwuDsBm6v/ajeylfz1fFGR/QvRAbp+BSRdNH5YR0htumy2uzpwnKh2
	Eqr7z51UXcaIoZaMiBY5AVtAAInvFsIoSPgzAmugN8bxqRKgdFw5RfPcIuzIaxsWaxYsOjjeCQjHA
	tp0mwCDBv5I+asvOufUiil5KIXIsMzE3n1X7Vul9N6zYeg1IE+Bwh/sRcouo1JwZlHMqoS9el9pSV
	XcuS22zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wppyx-0000000D0rt-2R5x;
	Fri, 31 Jul 2026 16:21:11 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wppxJ-0000000Cyt8-2HwY;
	Fri, 31 Jul 2026 16:19:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785514767;
	bh=/TKBya/JRolWMqyMoq59j0Jgp+DNbAGSUTJj0kIybwo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pjkxXoRUML7OflI1VWYB4yh2ZD1+v//L/vm+F599mt2GJb8l5kypciiwowIDJvJoh
	 yB266LaFP21ZV119m/yqpOhr244odPvxfcgPTmSfd82hehoOkrP412Y+SKKIxEVf08
	 QuCqxjEhBqAzPM2q4SV+QPnauZ8uo/lSROZloowftk7eVORduw7lvhpZDVqAuIGwfI
	 KH0VJur2+v7X7J/5etJCDOM9C4CFdmndp5F/BrteWZr/OH1SZKtGM2rsfSalheiVqP
	 yASK47x4eusofxz60dvb3Ixt8Z3WkNu1soIjZHtU7NSCsdNe0v2RBRYdc+nNMXE0JS
	 BSGRLbgbCamvw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AB58C17E093D;
	Fri, 31 Jul 2026 18:19:27 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 31 Jul 2026 19:19:25 +0300
Subject: [PATCH v10 18/69] drm/display: bridge_connector: Switch to
 .force_ctx() connector helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-dw-hdmi-qp-scramb-v10-18-294364b2cf15@collabora.com>
References: <20260731-dw-hdmi-qp-scramb-v10-0-294364b2cf15@collabora.com>
In-Reply-To: <20260731-dw-hdmi-qp-scramb-v10-0-294364b2cf15@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Algea Cao <algea.cao@rock-chips.com>, 
 Daniel Stone <daniels@collabora.com>, Liu Ying <victor.liu@nxp.com>, 
 Phong LE <ple@baylibre.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_091929_738468_AA5D2DD8 
X-CRM114-Status: GOOD (  12.90  )
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
index 0d44a270b636..86353a0b9758 100644
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
@@ -274,7 +264,6 @@ drm_bridge_connector_color_format(const struct drm_connector_state *conn_state)
 }
 
 static const struct drm_connector_funcs drm_bridge_connector_funcs = {
-	.force = drm_bridge_connector_force,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.atomic_create_state = drm_bridge_connector_create_state,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
@@ -322,6 +311,19 @@ static int drm_bridge_connector_detect_ctx(struct drm_connector *connector,
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
@@ -414,6 +416,7 @@ static int drm_bridge_connector_atomic_check(struct drm_connector *connector,
 static const struct drm_connector_helper_funcs drm_bridge_connector_helper_funcs = {
 	.get_modes = drm_bridge_connector_get_modes,
 	.detect_ctx = drm_bridge_connector_detect_ctx,
+	.force_ctx = drm_bridge_connector_force_ctx,
 	.mode_valid = drm_bridge_connector_mode_valid,
 	.enable_hpd = drm_bridge_connector_enable_hpd,
 	.disable_hpd = drm_bridge_connector_disable_hpd,

-- 
2.55.0


