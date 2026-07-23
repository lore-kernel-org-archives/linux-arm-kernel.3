Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86275C531C8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 01:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WLQmfLPIui2PMC2QyQ8Z8+1jmbOn2iTPj7lC586T0wY=; b=Ix+vOOvRFZJ4hbSaX1S9Jk/qRW
	EpzfqJzkFyHSuSxpg0qZKTNZwNwxRgvhg5gH8LRyNZ/oLDiBrgdT/ZM657+ci4ABvyMvmCuAMpAZo
	5Gt8Q7IZuUP+uMkAVwBbN+GZZfTXb/amYpipwrRkC1/Dsn3/yM6W7/wUXO23cuEZZL1nzSRSn9ctZ
	raNXpkL3Kr8pn1qqZBF7kjqg5elFRcUXCMSKKlJaqk2nEsh5QNjDpiEPVz8lpv0qSrnA7VqdmHPAU
	+3glERL+2qtIG4S5IUbWSy3I4FIvQ92kutSbndNWdQNS7XslGc2oJSNTTaeTph7Di8PlLvOlyxgbl
	14eFWvQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiQJ-0000000D8sc-0IRa;
	Thu, 23 Jul 2026 01:40:31 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiLX-0000000D3J7-1KBZ;
	Thu, 23 Jul 2026 01:35:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784770533;
	bh=RFyuQv7nRggfvzhopw1fvn8ctM8nhZm+B4c1Q6ujibA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=O0HbnrCHnlC062t8cmkWxDsb4CliHtvRLHziSClu2c3kKR0z/Pb06vgqFQy0dzOTy
	 VqPI2e1i8ZOBY/UNCccOsZ9J9x2HQk6J2JDDLD/MYXz8/vMGEO5RXDcUMbfBj0QjyZ
	 t709eOQFqtPf3g1qEgczcWAOVvfpXYgkKi4HyffeCngkTPY4mH9Bp7TiId6e3t9yxB
	 h8ypdIMNaOaWaaYA+Xpg94BtXmj3w+zWoCGztMbiTVEgHGx2OsGmKTKGoqbCrqjydm
	 8znXuRXq0xFOU0wILh7pp9q/uflCz360FRIziZGyAsOflLbuQz9svZlZ4eI1O5R9h9
	 OXK18bwpW8VLg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6339C17E0857;
	Thu, 23 Jul 2026 03:35:33 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 23 Jul 2026 04:35:34 +0300
Subject: [PATCH v9 45/61] drm/bridge: lontium-lt9611: Advertise HDMI 1.4
 capabilities
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-dw-hdmi-qp-scramb-v9-45-4fb12ea22ac9@collabora.com>
References: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
In-Reply-To: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
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
X-CRM114-CacheID: sfid-20260722_183535_527273_E5A9DFDC 
X-CRM114-Status: GOOD (  12.76  )
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

Bridges using DRM_BRIDGE_OP_HDMI are expected to provide the supported
HDMI version.  This is not enforced yet, but will become mandatory once
the migration to the caps-based HDMI connector initialization API is
complete.

As LT9611 supposedly cannot drive a TMDS character rate exceeding 297
MHz, advertise HDMI 1.4 as the supported version.  HDMI 1.4 allows up to
340 MHz, so set the bridge's max_tmds_char_rate to ensure the connector
limit derived from supported_hdmi_ver remains within the hardware
capabilities.

drm_bridge_connector_atomic_check() calls
drm_atomic_helper_connector_hdmi_check(), which rejects modes whose
computed TMDS character rate exceeds the connector's max_tmds_char_rate
before invoking the driver's .tmds_char_rate_valid hook.  Since
max_tmds_char_rate now carries the existing effective limit,
lt9611_hdmi_tmds_char_rate_valid() is redundant.  Drop it.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index b6a368f71285..19971ffade8b 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/gpio/consumer.h>
+#include <linux/hdmi.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/media-bus-format.h>
@@ -952,18 +953,6 @@ static int lt9611_hdmi_write_hdmi_infoframe(struct drm_bridge *bridge,
 	return 0;
 }
 
-static enum drm_mode_status
-lt9611_hdmi_tmds_char_rate_valid(const struct drm_bridge *bridge,
-				 const struct drm_display_mode *mode,
-				 unsigned long long tmds_rate)
-{
-	/* 297 MHz for 4k@30 mode */
-	if (tmds_rate > 297000000)
-		return MODE_CLOCK_HIGH;
-
-	return MODE_OK;
-}
-
 static int lt9611_hdmi_audio_startup(struct drm_bridge *bridge,
 				     struct drm_connector *connector)
 {
@@ -1029,7 +1018,6 @@ static const struct drm_bridge_funcs lt9611_bridge_funcs = {
 	.atomic_create_state = drm_atomic_helper_bridge_create_state,
 	.atomic_get_input_bus_fmts = lt9611_atomic_get_input_bus_fmts,
 
-	.hdmi_tmds_char_rate_valid = lt9611_hdmi_tmds_char_rate_valid,
 	.hdmi_write_audio_infoframe = lt9611_hdmi_write_audio_infoframe,
 	.hdmi_clear_audio_infoframe = lt9611_hdmi_clear_audio_infoframe,
 	.hdmi_write_avi_infoframe = lt9611_hdmi_write_avi_infoframe,
@@ -1177,6 +1165,8 @@ static int lt9611_probe(struct i2c_client *client)
 	lt9611->bridge.hdmi_audio_dev = dev;
 	lt9611->bridge.hdmi_audio_max_i2s_playback_channels = 8;
 	lt9611->bridge.hdmi_audio_dai_port = 2;
+	lt9611->bridge.supported_hdmi_ver = HDMI_VERSION_1_4;
+	lt9611->bridge.max_tmds_char_rate = 297000000; /* 297 MHz for 4k@30 mode */
 
 	drm_bridge_add(&lt9611->bridge);
 

-- 
2.55.0


