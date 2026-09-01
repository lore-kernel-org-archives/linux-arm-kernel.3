Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D74C624D9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 18:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xxi61J6EfqocZunJqjbeAiGOxDQSDg6PNPIE6+2MVTU=; b=XXRUSsMILoljpf8XtiBAmL7YkF
	NdOBRtYO39N9tl9bMMgi8mcJ8l7UncHXGsaySMCRARsRyMkzCaXnOiBkVBcdP6VrZyWzh3KBSONq/
	5dy7sV8CBe6xgThcpJcipuPIbP8zv/uSlKmEv26Axjuo1Q6Y0qjDr9JNlN+qnwNQsgadC5Iz39RMX
	O241hbFaQfVkWSysIqFdgZoyNZXPuHY+eWwTGtxJcd3PBYQ9TRenvLn/udLk4Jf/cr9oDc4EWxi3U
	/M8J5akwZR17D1NXsBZkNsqDYS2t2lrW7j2omit8q4xz9+wBFOODYXSccfGXDRXla3c4nIDDXEl3j
	ZxSqRS3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Tbt-0000000D5Hu-2T5j;
	Tue, 01 Sep 2026 18:53:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TZq-0000000D1Ln-1l0z;
	Tue, 01 Sep 2026 18:51:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=xxi61J6EfqocZunJqjbeAiGOxDQSDg6PNPIE6+2MVTU=; b=I/pUZN286m7KoB0ZbCv3pzMaDN
	vH0aNMoojU8Ko35BX1CdtDWJNZQAYiNwzxzeqp2vR1V/2eFaWeFO/5n4/QM5NBK2X9g+kJQ/3QG5O
	DY8ehsOgzKQ1diN+Q/mf6R09j8dBMo7+SxfTpahBPUzaTN1H/LRiEdLCmRSyJe4eKcJ+MiMMP1zk1
	BuGy61gn54gZlIjgmpAJLDzLfDxtr7iO9yIgmp9wcOdSVlGvS0NbbTGTgq/31I1/0PxLpDbOcSExB
	4rIPfLdgHcXzPJ6VwuVk3MmHBTvRelWb/gp5/pUP4yFuLaX+zmm88oqfSpbwrUmIrIcGf9BcSzFh3
	QpyPnxpQ==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x1TZn-0000000BHWb-0dEW;
	Tue, 01 Sep 2026 18:51:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788288678;
	bh=0cXQh/wi9mNTTITbxgaDB3yHqtiGn5+Qa+cNMfRk9UA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bvEMwm0R4HTcJXN0fRwhoeQ9+XkgI9mIBkkLPPDDjMXynwv5r35tGSGkWAmlC+G/1
	 V6g3L3B+papJwVafaVwroEXhSTBFdwFcnifiJ18PYA6/hM/KGnTia5/0HLfEbGB9Ax
	 Xl4DiaBBx2xYUz7CbxmgFieMDUfzAwKUJCDOTngb3TZWXhV8KHF3HKAIpHkERR0Pv2
	 Umc041NnF3oo5NxRj6oi1gO50G/o2hDTpEllAFChOJFURqtBe34kvlhgJ9X1A+T+KO
	 601K+f1xVcHkI0lThJ+w+TdYSkRuAPrKZcuMEZcdo243ZODSycaVCBa8M/CjKoWv/I
	 iY4d9aJrag7Jg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D8BA717E3C71;
	Tue, 01 Sep 2026 20:51:17 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 01 Sep 2026 21:51:14 +0300
Subject: [PATCH v11 50/74] drm/bridge: adv7511: Advertise HDMI 1.2
 capabilities
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dw-hdmi-qp-scramb-v11-50-bc12954a0688@collabora.com>
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
X-CRM114-CacheID: sfid-20260901_195119_457324_3B1674F9 
X-CRM114-Status: GOOD (  14.75  )
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


