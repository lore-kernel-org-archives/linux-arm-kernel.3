Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B84C55171
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 16:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xxi61J6EfqocZunJqjbeAiGOxDQSDg6PNPIE6+2MVTU=; b=MfNUWKsU7HFpOVaVR8sQ5nLufW
	fxe7Q+WqJDxd9PrMa/j8VtHvnsreXSHKjY6Hg9Cm0eqQ1RtYA1X8L8f7xvGHQJYXvikKDS78QEFDY
	/hgChqTbHm/T48urbbQJASTg/G3WCKBsDJNEBlY+V6alCRp185ie7F1lfzw+5k/1r2KBy4xN69L21
	R9RM6lAjcH9kxdIrnZ8LoTxkJVZR9OC1V4vo/X6v61vvQtlpkNOLt62ZJIlPSdb6L1wAaYhKTHOl7
	dPkcId1zvzljxjWsHDCgLf+HJRCPLNaHCStrp0h9K7kPaGMp/TbcT9A08VlMDP5m+UCJUhDt533v6
	C8W8GUtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpq1k-0000000D3Ul-2hxX;
	Fri, 31 Jul 2026 16:24:04 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wppxf-0000000CzbF-49FG;
	Fri, 31 Jul 2026 16:20:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785514789;
	bh=0cXQh/wi9mNTTITbxgaDB3yHqtiGn5+Qa+cNMfRk9UA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QokOt9JTCghHQqgaFmv7YW2OfQO804zPDPvd0V9NEdkZNb0xGkFT++WwjQBLlrLlN
	 I+faxIFULRQi6QJbBp22hUwuvNbcJJJ3kDNIA5bo4Qpk1Zr9VHCMczhHQ9L2o27ox/
	 9u1MC0KH+4f9esQu4xVGTkAWlG3LuyFk/MfgQDpNrr/3wZ5EvT2CcLN8bWHOs5Pjsl
	 I1Zdo8+C1n8ootnUPk3AFXvqAlRxFZXybo3KdaBNjRywMd2aeTTVA/j8mIs6Cw0j07
	 /QlMfkCxRzkRLtelo0r4eOo1sXGP7EaA7CLXKnKm3+8uo1NPiwv8F0E3XI8WlC2Ahh
	 ZSzW/ZsO9/rDw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EA51D17E092F;
	Fri, 31 Jul 2026 18:19:48 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 31 Jul 2026 19:19:55 +0300
Subject: [PATCH v10 48/69] drm/bridge: adv7511: Advertise HDMI 1.2
 capabilities
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-dw-hdmi-qp-scramb-v10-48-294364b2cf15@collabora.com>
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
X-CRM114-CacheID: sfid-20260731_091953_948068_B2A7BF69 
X-CRM114-Status: GOOD (  14.40  )
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

Bridges using DRM_BRIDGE_OP_HDMI are now expected to also provide a
supported HDMI version.  This is not yet enforced, but will become
mandatory once the migration to the new caps-based HDMI connector
initialization API is completed.

Since max_mode_clock_khz does not exceed 165 MHz for any of the chip
variants handled by the driver, advertise HDMI 1.2 as the supported
version and set the bridge's max_tmds_char_rate so the connector limit
inferred from supported_hdmi_ver is overridden by the chip-specific
hardware constraints.

drm_bridge_connector_atomic_check() runs
drm_atomic_helper_connector_hdmi_check(), which rejects modes whose
computed TMDS character rate exceeds the connector limit before invoking
the driver's .tmds_char_rate_valid() hook, making
adv7511_bridge_hdmi_tmds_char_rate_valid() redundant. Drop it.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 22 +++-------------------
 1 file changed, 3 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 038b852405b5..c3ef44074477 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -8,6 +8,7 @@
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/gpio/consumer.h>
+#include <linux/hdmi.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/slab.h>
@@ -775,11 +776,6 @@ static int adv7511_connector_init(struct adv7511 *adv)
  * DRM Bridge Operations
  */
 
-static const struct adv7511 *bridge_to_adv7511_const(const struct drm_bridge *bridge)
-{
-	return container_of(bridge, struct adv7511, bridge);
-}
-
 static void adv7511_bridge_atomic_enable(struct drm_bridge *bridge,
 					 struct drm_atomic_commit *state)
 {
@@ -817,19 +813,6 @@ static void adv7511_bridge_atomic_disable(struct drm_bridge *bridge,
 	adv7511_power_off(adv);
 }
 
-static enum drm_mode_status
-adv7511_bridge_hdmi_tmds_char_rate_valid(const struct drm_bridge *bridge,
-					 const struct drm_display_mode *mode,
-					 unsigned long long tmds_rate)
-{
-	const struct adv7511 *adv = bridge_to_adv7511_const(bridge);
-
-	if (tmds_rate > 1000ULL * adv->info->max_mode_clock_khz)
-		return MODE_CLOCK_HIGH;
-
-	return MODE_OK;
-}
-
 static enum drm_mode_status adv7511_bridge_mode_valid(struct drm_bridge *bridge,
 						      const struct drm_display_info *info,
 		const struct drm_display_mode *mode)
@@ -1006,7 +989,6 @@ static const struct drm_bridge_funcs adv7511_bridge_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_create_state = drm_atomic_helper_bridge_create_state,
 
-	.hdmi_tmds_char_rate_valid = adv7511_bridge_hdmi_tmds_char_rate_valid,
 	.hdmi_clear_audio_infoframe = adv7511_bridge_hdmi_clear_audio_infoframe,
 	.hdmi_write_audio_infoframe = adv7511_bridge_hdmi_write_audio_infoframe,
 	.hdmi_clear_avi_infoframe = adv7511_bridge_hdmi_clear_avi_infoframe,
@@ -1359,6 +1341,8 @@ static int adv7511_probe(struct i2c_client *i2c)
 
 	adv7511->bridge.vendor = "Analog";
 	adv7511->bridge.product = adv7511->info->name;
+	adv7511->bridge.supported_hdmi_ver = HDMI_VERSION_1_2;
+	adv7511->bridge.max_tmds_char_rate = 1000ULL * adv7511->info->max_mode_clock_khz;
 
 #ifdef CONFIG_DRM_I2C_ADV7511_AUDIO
 	adv7511->bridge.ops |= DRM_BRIDGE_OP_HDMI_AUDIO;

-- 
2.55.0


