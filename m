Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12E96C44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 01:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7K17CdTSfNLR6RFNfNU+ubIA2Nww7vUzBHCbzLeSLxI=; b=lhd4uo0dpZkoqY7eMg1kbzxsI9
	M4KUdQki0iy3uN3mgFlRFVEzS7L+APdQZTZbzPWLmGL45vLiGVZFXUbaqX/rmVNT98xY/rs+6FyAR
	lzi3GW/NPzadrKoi+iFGq3gCEPxX4a6ofcaxDmia1BnPLA2W973VFCC2GKCGJh5NgKxZaGG/BgGG2
	gTWQ/2HqA61nLlJazWdbJPgAjzGLEOuHTQKXmQBb2v+fqryE8dIWVCRdBPM3k8j6TEDV2JuLjQ/g8
	cUTq2uqu/JqZPxWhOGJErsekq7jKLV2aWDjC2DnDQ6xm7cey9DTj1ufIo5/bd9Myf/kW560d6g+87
	vs9fFgaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiOY-0000000D7Db-33T0;
	Thu, 23 Jul 2026 01:38:42 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiLV-0000000D3HL-3mMp;
	Thu, 23 Jul 2026 01:35:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784770532;
	bh=ssnLSMSNl/BkiE2rbaF4YspoeGjFNh8xM/0xBgd54cc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=L6/HowD3j8eM/kRBVWyJjHYuAlS7z7QS4Jn04ytH+dHtZjV4xAc+UNEuielNgJ/Lh
	 FYhyuHw16aeipazFjB8agZN5Yu7ZlEj+FJG0KVinz3PixDpXETxjPW4MUpswWFXOxd
	 hxaD7zx3Fsc3D3R3nI+qLRQ+0guXh1g7ENEfsvjExJuPtPz8Hfhe8RsczvFtkaQH8i
	 xa+DVmVDLGtx33e1blipZxdHo8rx8UweFkX3n54zHd2cI8p0W9zY2gbYqpxIVS/uvw
	 lzgAG+o1+pG5wwEvnI2EvPfWRDYFy9vYS+U//sVRaNQdhnbFEyxPsn97aIdLky4t7O
	 QgtmiftyZNHAw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0A82F17E023C;
	Thu, 23 Jul 2026 03:35:32 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 23 Jul 2026 04:35:32 +0300
Subject: [PATCH v9 43/61] drm/bridge: ite-it6263: Advertise HDMI 1.3
 capabilities
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-dw-hdmi-qp-scramb-v9-43-4fb12ea22ac9@collabora.com>
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
X-CRM114-CacheID: sfid-20260722_183534_122592_632B140D 
X-CRM114-Status: GOOD (  12.34  )
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

Advertise HDMI 1.3 support for IT6263, covering the 225 MHz TMDS
character rate currently documented by the driver, which is within the
HDMI 1.3 limit of 340 MHz.  Additionally, keep the stricter 150 MHz
effective mode limit by setting max_tmds_char_rate from
MAX_PIXEL_CLOCK_KHZ.

The existing .hdmi_tmds_char_rate_valid() hook checks both the pixel
clock and TMDS character rate.  Since the bridge only supports 8 bpc
RGB444, these are equivalent for supported modes, making the 225 MHz
TMDS rate check unreachable once the 150 MHz pixel-clock limit is
applied.

drm_bridge_connector_atomic_check() invokes
drm_atomic_helper_connector_hdmi_check(), which rejects modes whose
computed TMDS character rate exceeds the connector's max_tmds_char_rate
before invoking the driver's .tmds_char_rate_valid hook.  Since
max_tmds_char_rate now carries the existing effective limit,
it6263_hdmi_tmds_char_rate_valid() is redundant.  Drop it.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/ite-it6263.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
index f166bb38998c..73caf28c6ac7 100644
--- a/drivers/gpu/drm/bridge/ite-it6263.c
+++ b/drivers/gpu/drm/bridge/ite-it6263.c
@@ -738,20 +738,6 @@ it6263_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 	return input_fmts;
 }
 
-static enum drm_mode_status
-it6263_hdmi_tmds_char_rate_valid(const struct drm_bridge *bridge,
-				 const struct drm_display_mode *mode,
-				 unsigned long long tmds_rate)
-{
-	if (mode->clock > MAX_PIXEL_CLOCK_KHZ)
-		return MODE_CLOCK_HIGH;
-
-	if (tmds_rate > MAX_HDMI_TMDS_CHAR_RATE_HZ)
-		return MODE_CLOCK_HIGH;
-
-	return MODE_OK;
-}
-
 static int it6263_hdmi_clear_avi_infoframe(struct drm_bridge *bridge)
 {
 	struct it6263 *it = bridge_to_it6263(bridge);
@@ -821,7 +807,6 @@ static const struct drm_bridge_funcs it6263_bridge_funcs = {
 	.detect = it6263_bridge_detect,
 	.edid_read = it6263_bridge_edid_read,
 	.atomic_get_input_bus_fmts = it6263_bridge_atomic_get_input_bus_fmts,
-	.hdmi_tmds_char_rate_valid = it6263_hdmi_tmds_char_rate_valid,
 	.hdmi_clear_avi_infoframe = it6263_hdmi_clear_avi_infoframe,
 	.hdmi_write_avi_infoframe = it6263_hdmi_write_avi_infoframe,
 	.hdmi_clear_hdmi_infoframe = it6263_hdmi_clear_hdmi_infoframe,
@@ -883,6 +868,8 @@ static int it6263_probe(struct i2c_client *client)
 	it->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	it->bridge.vendor = "ITE";
 	it->bridge.product = "IT6263";
+	it->bridge.supported_hdmi_ver = HDMI_VERSION_1_3;
+	it->bridge.max_tmds_char_rate = 1000ULL * MAX_PIXEL_CLOCK_KHZ;
 
 	return devm_drm_bridge_add(dev, &it->bridge);
 }

-- 
2.55.0


