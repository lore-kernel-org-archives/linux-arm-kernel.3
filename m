Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B020C44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 15:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pYYsEwOVQ0v1AVNZOQN5PzwCM48qQaF11OzC3DHeUNo=; b=dI/BRDUti8f3kzWdk8LaLoYoK/
	JnAwypnG29rYTqbDjkHsjCCWpGYldMwuwPRtQF9lNjhO+KVMvqX1Rt+bWx1KKi1T/UeJKZE5+dcIh
	9e63MEaHjDiXl7IhAMfJfp/WzmGInQPiVSst+ruyr20EcxqzgcF0WwO6W7Kc8NwaxmhBABMcwxFzW
	va7vbv8to41rDPH1LThmYwhMUzOAbu05kOdZTacO6fpjjMYflEHLw9wTByN4H+UCizMPmNOHLlKDB
	bE960puSx6hitzDT2nOVEa2D6tfLN93DvoIFdmVVNLw43cyNfVShWYSrPqnoncU90sgHwebmSgRH/
	rqvCsw0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqAL-00000007Fh9-2big;
	Mon, 20 Jul 2026 15:44:25 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqAJ-00000007FfI-1MCx;
	Mon, 20 Jul 2026 15:44:24 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wlqAC-000000004GF-1w0u;
	Mon, 20 Jul 2026 15:44:16 +0000
Date: Mon, 20 Jul 2026 16:44:13 +0100
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
	Hermes Wu <hermes.wu@ite.com.tw>,
	Allen Chen <allen.chen@ite.com.tw>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 2/2] drm/bridge: it6505: Don't reject audio hw_params
 without an encoder
Message-ID: <11d86a39a66ad81f29bb6d9274419e993d58337a.1784561622.git.daniel@makrotopia.org>
References: <cover.1784561622.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1784561622.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_084423_364896_E937926D 
X-CRM114-Status: GOOD (  12.40  )
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
v2:
 * drop the encoder check entirely instead of returning 0 early, so
   the stream parameters are always cached even while no display is
   attached; rewrite the commit message to explain why the check is
   harmful

 drivers/gpu/drm/bridge/ite-it6505.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index d84441926e8e..e20edbbb7c13 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -2979,9 +2979,6 @@ static int it6505_audio_setup_hw_params(struct it6505 *it6505,
 			     params->sample_rate, params->sample_width,
 			     params->cea.channels);
 
-	if (!it6505->bridge.encoder)
-		return -ENODEV;
-
 	if (params->cea.channels <= 1 || params->cea.channels > 8) {
 		DRM_DEV_DEBUG_DRIVER(dev, "channel number: %d not support",
 				     it6505->audio.channel_count);
-- 
2.55.0

