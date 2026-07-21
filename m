Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB44C44524
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 02:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Locu97VW1DMsaRzel0MhlqBHmy6O3W8xHGltTq/0m/M=; b=d5n96ZFJuNxXmNGMLbpYjJAWnF
	KAEf5TAK0sP9Zda6/R0sricLaivR1dymUNVsgHPE54/oDTNlSM9bNH9WqKCio7enGLxRASER3AcAb
	9SVYG5x4r7og/PZNsBpn2Nk5iHONFxxwr2wW71fN0Qk7R5jV651cQ16DUkWvptuTqTAYCjHhKNoGc
	PJHScXpX1hwQJYHA/UC3JHeK5sFUARfzBaa6UkEuQfERax/1KZky+Psf7hXwY8icJu3+ZTm9Mz4ZB
	6tBjLpRuB0SbfPjWrMn+gVI3TX26e1OnvjBZT3FttYfSI4u/FrHy8R6Kjf3bxE5ti+Z8vKoroSM11
	G7RDJuMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm0DN-00000008G4a-2UTx;
	Tue, 21 Jul 2026 02:28:13 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm0DK-00000008G3H-1gqI;
	Tue, 21 Jul 2026 02:28:11 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wm0DD-000000000Hf-2RzL;
	Tue, 21 Jul 2026 02:28:03 +0000
Date: Tue, 21 Jul 2026 03:28:00 +0100
From: Daniel Golle <daniel@makrotopia.org>
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
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Allen Chen <allen.chen@ite.com.tw>,
	Hermes Wu <hermes.wu@ite.com.tw>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 4/4] drm/bridge: it6505: Don't reject audio hw_params
 without an encoder
Message-ID: <c82134d59d36fbc66e75d397ae50141ad447220b.1784600387.git.daniel@makrotopia.org>
References: <cover.1784600387.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1784600387.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_192810_443898_5D262B02 
X-CRM114-Status: GOOD (  12.51  )
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

it6505_audio_setup_hw_params() returns -ENODEV when the bridge is not
attached to a DRM encoder. Now that it6505 registers an hdmi-audio-codec,
this callback runs whenever a stream is configured on the I2S DAI it is
wired to, including when that DAI is shared with another codec. On
mt8186-corsola the speaker amplifier (rt1019) and it6505 share I2S3, so
when the it6505 DP output has no display attached (bridge.encoder is
NULL) the -ENODEV propagates up through dpcm_be_dai_hw_params() and tears
down the whole backend, breaking speaker playback.

The check is harmful in its own right: the rest of the function only
caches the stream parameters (channel count, rate, word length) in
software, none of which needs an encoder. Returning early leaves
it6505->audio.channel_count at 0, which would then index
audio_info_ca[-1] in it6505_enable_audio_infoframe() should a display be
hotplugged while a stream is running, and makes such a hotplug play with
stale parameters.

Drop the encoder check so the parameters are always cached; the actual
audio output is already gated by it6505->powered.

Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v3: no changes

v2:
 * drop the encoder check entirely instead of returning 0 early, so
   the stream parameters are always cached even while no display is
   attached; rewrite the commit message to explain why the check is
   harmful

 drivers/gpu/drm/bridge/ite-it6505.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 37036ef5403f..435601b6929e 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -2999,9 +2999,6 @@ static int it6505_audio_setup_hw_params(struct it6505 *it6505,
 			     params->sample_rate, params->sample_width,
 			     params->cea.channels);
 
-	if (!it6505->bridge.encoder)
-		return -ENODEV;
-
 	if (params->cea.channels <= 1 || params->cea.channels > 8) {
 		DRM_DEV_DEBUG_DRIVER(dev, "channel number: %d not support",
 				     params->cea.channels);
-- 
2.55.0

