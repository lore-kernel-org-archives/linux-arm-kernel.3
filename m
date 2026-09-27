Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAEC4C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 23:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T6Br8B52HiOcAEYBS4SFBjMtnKDt/aOPjWpjMD5HCIA=; b=Jl2aoxiunA8/tFUDFCbj3v49Z5
	IDOpK7tUncGT5RsRqC6XlH4Fso1wXK7gP86RrUPmYV4RWDaWQkzI2Q9MF0B2oUEs32498OSf8lmS4
	HTylUYp+KaKRJnwaDyGJcPpwkWH7zc5gnKA3mg59CuEg4yNlHVOtL7t0i9T2IJu2Ws1Fahfm+HGFJ
	MjbQzGfebiVgGQVdNeczNjXjFFvjU7yT3OPfPM8DUaGpzdcntZ+D3SfM8kW0koxVjMiANKFNh2zHW
	qC/NBTNZB+MDbQOKBeTQd+D7YmT2+3ciSRO4LuZMkHf1fnuZTpuzgTIfQAr3ktQ5kEEHqqgMhhmes
	3V0/wLjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAyet-0000000H2A2-13y1;
	Sun, 27 Sep 2026 23:51:51 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAyek-0000000H23E-0Tgv;
	Sun, 27 Sep 2026 23:51:43 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100)
	(envelope-from <daniel@makrotopia.org>)
	id 1xAyee-000000000vQ-10Sh;
	Sun, 27 Sep 2026 23:51:36 +0000
Date: Mon, 28 Sep 2026 00:51:33 +0100
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
	Allen Chen <allen.chen@ite.com.tw>,
	Pin-yen Lin <treapking@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v8 14/14] drm/bridge: it6505: Don't reject audio hw_params
 without an encoder
Message-ID: <0dae38fd46fe6950d5bac5433580791203891c6a.1790552614.git.daniel@makrotopia.org>
References: <cover.1790552614.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1790552614.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_165142_180360_A0AD5C00 
X-CRM114-Status: GOOD (  10.12  )
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

it6505_audio_setup_hw_params() returns -ENODEV when no encoder is
attached. With it6505 registering an hdmi-audio-codec this runs for
every stream on the I2S DAI, and on mt8186-corsola, where the rt1019
speaker amplifier shares I2S3, the error tears down the whole DPCM
backend and breaks speaker playback whenever no display is attached.

The function only caches stream parameters, which needs no encoder.
Drop the check, and apply the audio defaults once at probe instead of
in it6505_variable_config(), which would clobber the cached
parameters again on every hotplug. Actual audio output remains gated
by it6505->powered.

Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v8: no changes

v7: no changes

v6: no changes

v5: no changes

v4: apply audio defaults at probe time instead of in
    it6505_variable_config()

v3: no changes

v2: drop the encoder check entirely instead of returning 0 early
---
 drivers/gpu/drm/bridge/ite-it6505.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index acc25a579ff4d..8962e6f717dfe 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -1371,16 +1371,6 @@ static void it6505_variable_config(struct it6505 *it6505)
 	it6505->link_state = LINK_IDLE;
 	it6505->hdcp_desired = HDCP_DESIRED;
 	it6505->auto_train_retry = AUTO_TRAIN_RETRY;
-	it6505->audio.select = AUDIO_SELECT;
-	it6505->audio.sample_rate = AUDIO_SAMPLE_RATE;
-	it6505->audio.channel_count = AUDIO_CHANNEL_COUNT;
-	it6505->audio.type = AUDIO_TYPE;
-	it6505->audio.i2s_input_format = I2S_INPUT_FORMAT;
-	it6505->audio.i2s_justified = I2S_JUSTIFIED;
-	it6505->audio.i2s_data_delay = I2S_DATA_DELAY;
-	it6505->audio.i2s_ws_channel = I2S_WS_CHANNEL;
-	it6505->audio.i2s_data_sequence = I2S_DATA_SEQUENCE;
-	it6505->audio.word_length = AUDIO_WORD_LENGTH;
 	memset(it6505->sha1_input, 0, sizeof(it6505->sha1_input));
 	memset(it6505->bksvs, 0, sizeof(it6505->bksvs));
 }
@@ -3027,9 +3017,6 @@ static int it6505_audio_setup_hw_params(struct it6505 *it6505,
 			     params->sample_rate, params->sample_width,
 			     params->cea.channels);
 
-	if (!it6505->bridge.encoder)
-		return -ENODEV;
-
 	if (params->cea.channels <= 1 || params->cea.channels > 8) {
 		DRM_DEV_DEBUG_DRIVER(dev, "channel number: %d not support",
 				     params->cea.channels);
@@ -3161,6 +3148,16 @@ static int it6505_register_audio_driver(struct device *dev)
 	};
 	struct platform_device *pdev;
 
+	it6505->audio.select = AUDIO_SELECT;
+	it6505->audio.sample_rate = AUDIO_SAMPLE_RATE;
+	it6505->audio.channel_count = AUDIO_CHANNEL_COUNT;
+	it6505->audio.type = AUDIO_TYPE;
+	it6505->audio.i2s_input_format = I2S_INPUT_FORMAT;
+	it6505->audio.i2s_justified = I2S_JUSTIFIED;
+	it6505->audio.i2s_data_delay = I2S_DATA_DELAY;
+	it6505->audio.i2s_ws_channel = I2S_WS_CHANNEL;
+	it6505->audio.i2s_data_sequence = I2S_DATA_SEQUENCE;
+	it6505->audio.word_length = AUDIO_WORD_LENGTH;
 	it6505->audio.mute = true;
 	INIT_DELAYED_WORK(&it6505->delayed_audio, it6505_delayed_audio);
 
-- 
2.55.0

