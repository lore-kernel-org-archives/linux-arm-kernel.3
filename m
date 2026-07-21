Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC3EEC44520
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 02:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X8Wc83+Qj1lrVApLCfZ2lPAFddq7TcOl4ZRw9yUQu3Y=; b=eoA4jYKMAtit/m5KtWV0NB9gge
	Ro/lNWD3H+OlUFlXJyaGqqLEkzQTVyWSuo89SvX0OzixAr6/1HvQCvHtPCWjdwaefrh8/NDxTgdVp
	iZowqf3fSQCkCCnpCc6zHsa9YDFwduSd5tyU+RChjkvPOKJqZ5fryph2wxEiAw51bXTQIzSTxMivA
	Np2JmqZBWOBekcCwHwwSmeHX7qTnqx2BI4H4eOjcCQIIYn5vDw30xVK7mb4imsOIIWjmRZ5+qYGbI
	sCeXKOOirM0LKrexUfhTy9Wm4l/78i/hh3k/Jvg6svRwzJqrmxkzqgQLbv9vZxsSYclU/Wv13ld/9
	0r0laQrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm0D5-00000008G05-1H77;
	Tue, 21 Jul 2026 02:27:55 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm0D2-00000008FzZ-1Bp8;
	Tue, 21 Jul 2026 02:27:53 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wm0Cv-000000000Gf-1LLR;
	Tue, 21 Jul 2026 02:27:45 +0000
Date: Tue, 21 Jul 2026 03:27:42 +0100
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
Subject: [PATCH v3 3/4] drm/bridge: it6505: Add audio support
Message-ID: <6e27cdb00758a7a55a12293be21e3a3bafe34296.1784600387.git.daniel@makrotopia.org>
References: <cover.1784600387.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1784600387.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_192752_495744_46D542A9 
X-CRM114-Status: GOOD (  22.70  )
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

From: Jiaxin Yu <jiaxin.yu@mediatek.com>

Add audio support for it6505 by bridging to the hdmi-codec, registering
an "hdmi-audio-codec" platform device from probe. The it6505's audio
setup/shutdown helpers were merged earlier as unused code; wire them up
via hdmi_codec_ops so the DAI actually appears, which unblocks the
mt8186-mt6366 sound card that references it6505 as the I2S3 codec.

Some DP-to-HDMI dongles get into a bad state if InfoFrame is sent
without audio data, so it6505's audio is only enabled once the stream
is unmuted.

it6505_enable_audio()/it6505_disable_audio() can be called from
several contexts: DP link training (link_works), the HPD-low path,
the audio-FIFO-error IRQ, and now also the delayed audio-enable work
and the .mute_stream/.audio_shutdown hdmi_codec_ops added here. None
of these are mutually exclusive, so serialize the actual register
sequences with a new audio_lock mutex.

Also track the mute state requested through .mute_stream/
.audio_shutdown in it6505->audio.mute, and have the audio-FIFO-error
IRQ handler skip re-enabling audio while muted: without this, an
audio-FIFO error following an ALSA-requested mute would silently
re-enable audio and could send the very InfoFrame-without-data
sequence the delayed-enable logic above is meant to avoid.

Link: https://lore.kernel.org/all/20230730180803.22570-4-jiaxin.yu@mediatek.com/
Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v3:
 * serialise it6505_enable_audio()/it6505_disable_audio() with a new
   audio_lock mutex, resolving the "input welcome on whether a lock
   is warranted" note below
 * track requested mute state in it6505->audio.mute and have the
   audio-FIFO-error IRQ handler skip re-enabling audio while muted,
   both addressing automated review of v2

v2:
 * store the hdmi-codec platform_device and unregister it on i2c
   remove, fixing a resource leak and use-after-free on unbind
 * initialise the delayed audio work before registering the codec
   device instead of after
 * synchronously cancel the delayed audio work on audio shutdown and
   on driver remove (cancel_delayed_work_sync)
 * rework the mute path to cancel pending work synchronously and
   disable audio immediately when muting, removing a race with the
   delayed enable work

djg: respin of Jiaxin Yu's v3, rebased onto current mainline. Changes
from v3: hdmi_codec_ops lost .trigger, so drive enable/disable from
.mute_stream; drop the now-redundant __maybe_unused; use it6505->dev
instead of &client->dev, addressing AngeloGioacchino Del Regno's v3
review. Also fix issues in v3: initialise delayed_audio before
registering the codec device; keep and unregister the platform_device
and cancel delayed_audio on remove to avoid a leak and a
use-after-free; cancel the delayed work on audio shutdown; and
actually disable audio (not just cancel the pending enable) when the
stream is muted.
---
 drivers/gpu/drm/bridge/ite-it6505.c | 126 ++++++++++++++++++++++++----
 1 file changed, 108 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index f2ed76a05f6b..37036ef5403f 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -407,6 +407,7 @@ struct it6505_audio_data {
 	u8 i2s_data_delay;
 	u8 i2s_ws_channel;
 	u8 i2s_data_sequence;
+	bool mute;
 };
 
 struct it6505_audio_sample_rate_map {
@@ -439,6 +440,7 @@ struct it6505 {
 	struct mutex extcon_lock;
 	struct mutex mode_lock; /* used to bridge_detect */
 	struct mutex aux_lock; /* used to aux data transfers */
+	struct mutex audio_lock; /* serializes audio enable/disable */
 	struct regmap *regmap;
 	struct drm_display_mode source_output_mode;
 	struct drm_display_mode video_info;
@@ -476,6 +478,7 @@ struct it6505 {
 	bool enable_enhanced_frame;
 	hdmi_codec_plugged_cb plugged_cb;
 	struct device *codec_dev;
+	struct platform_device *audio_pdev;
 	struct delayed_work delayed_audio;
 	struct it6505_audio_data audio;
 	struct dentry *debugfs;
@@ -1594,7 +1597,7 @@ static void it6505_enable_audio_infoframe(struct it6505 *it6505)
 			EN_AUD_CTRL_PKT);
 }
 
-static void it6505_disable_audio(struct it6505 *it6505)
+static void __it6505_disable_audio(struct it6505 *it6505)
 {
 	it6505_set_bits(it6505, REG_DATA_MUTE_CTRL, EN_AUD_MUTE, EN_AUD_MUTE);
 	it6505_set_bits(it6505, REG_AUDIO_SRC_CTRL, M_AUDIO_I2S_EN, 0x00);
@@ -1602,13 +1605,23 @@ static void it6505_disable_audio(struct it6505 *it6505)
 	it6505_set_bits(it6505, REG_RESET_CTRL, AUDIO_RESET, AUDIO_RESET);
 }
 
+static void it6505_disable_audio(struct it6505 *it6505)
+{
+	mutex_lock(&it6505->audio_lock);
+	__it6505_disable_audio(it6505);
+	mutex_unlock(&it6505->audio_lock);
+}
+
 static void it6505_enable_audio(struct it6505 *it6505)
 {
 	struct device *dev = it6505->dev;
 	int regbe;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "start");
-	it6505_disable_audio(it6505);
+
+	mutex_lock(&it6505->audio_lock);
+
+	__it6505_disable_audio(it6505);
 
 	it6505_setup_audio_channel_status(it6505);
 	it6505_setup_audio_format(it6505);
@@ -1627,6 +1640,8 @@ static void it6505_enable_audio(struct it6505 *it6505)
 	DRM_DEV_DEBUG_DRIVER(dev, "regbe:0x%02x audio input fs: %d.%d kHz",
 			     regbe, 6750 / regbe, (6750 % regbe) * 10 / regbe);
 	it6505_set_bits(it6505, REG_DATA_MUTE_CTRL, EN_AUD_MUTE, 0x00);
+
+	mutex_unlock(&it6505->audio_lock);
 }
 
 static bool it6505_use_step_train_check(struct it6505 *it6505)
@@ -2323,19 +2338,12 @@ static void it6505_stop_link_train(struct it6505 *it6505)
 
 static void it6505_link_train_ok(struct it6505 *it6505)
 {
-	struct device *dev = it6505->dev;
-
 	it6505->link_state = LINK_OK;
 	/* disalbe mute enable avi info frame */
 	it6505_set_bits(it6505, REG_DATA_MUTE_CTRL, EN_VID_MUTE, 0x00);
 	it6505_set_bits(it6505, REG_INFOFRAME_CTRL,
 			EN_VID_CTRL_PKT, EN_VID_CTRL_PKT);
 
-	if (it6505_audio_input(it6505)) {
-		DRM_DEV_DEBUG_DRIVER(dev, "Enable audio!");
-		it6505_enable_audio(it6505);
-	}
-
 	if (it6505->hdcp_desired)
 		it6505_start_hdcp(it6505);
 }
@@ -2627,6 +2635,9 @@ static void it6505_irq_audio_fifo_error(struct it6505 *it6505)
 
 	DRM_DEV_DEBUG_DRIVER(dev, "audio fifo error Interrupt");
 
+	if (it6505->audio.mute)
+		return;
+
 	if (it6505_audio_input(it6505))
 		it6505_enable_audio(it6505);
 }
@@ -2963,7 +2974,7 @@ static void it6505_remove_notifier_module(struct it6505 *it6505)
 	}
 }
 
-static void __maybe_unused it6505_delayed_audio(struct work_struct *work)
+static void it6505_delayed_audio(struct work_struct *work)
 {
 	struct it6505 *it6505 = container_of(work, struct it6505,
 					     delayed_audio.work);
@@ -2977,9 +2988,9 @@ static void __maybe_unused it6505_delayed_audio(struct work_struct *work)
 		it6505_enable_audio(it6505);
 }
 
-static int __maybe_unused it6505_audio_setup_hw_params(struct it6505 *it6505,
-						       struct hdmi_codec_params
-						       *params)
+static int it6505_audio_setup_hw_params(struct it6505 *it6505,
+					struct hdmi_codec_params
+					*params)
 {
 	struct device *dev = it6505->dev;
 	int i = 0;
@@ -3034,18 +3045,55 @@ static int __maybe_unused it6505_audio_setup_hw_params(struct it6505 *it6505,
 	return 0;
 }
 
-static void __maybe_unused it6505_audio_shutdown(struct device *dev, void *data)
+static void it6505_audio_shutdown(struct device *dev, void *data)
 {
 	struct it6505 *it6505 = dev_get_drvdata(dev);
 
+	it6505->audio.mute = true;
+	cancel_delayed_work_sync(&it6505->delayed_audio);
 	if (it6505->powered)
 		it6505_disable_audio(it6505);
 }
 
-static int __maybe_unused it6505_audio_hook_plugged_cb(struct device *dev,
-						       void *data,
-						       hdmi_codec_plugged_cb fn,
-						       struct device *codec_dev)
+static int it6505_audio_hw_params(struct device *dev, void *data,
+				  struct hdmi_codec_daifmt *daifmt,
+				  struct hdmi_codec_params *params)
+{
+	struct it6505 *it6505 = dev_get_drvdata(dev);
+
+	return it6505_audio_setup_hw_params(it6505, params);
+}
+
+static int it6505_audio_mute(struct device *dev, void *data,
+			     bool enable, int direction)
+{
+	struct it6505 *it6505 = dev_get_drvdata(dev);
+
+	DRM_DEV_DEBUG_DRIVER(dev, "mute: %d", enable);
+
+	it6505->audio.mute = enable;
+
+	/*
+	 * Some DP-to-HDMI dongles get into a bad state if the InfoFrame is
+	 * sent without audio data, so only enable it6505's audio once the
+	 * stream is unmuted (i.e. actually playing).
+	 */
+	if (enable) {
+		cancel_delayed_work_sync(&it6505->delayed_audio);
+		if (it6505->powered)
+			it6505_disable_audio(it6505);
+	} else {
+		queue_delayed_work(system_wq, &it6505->delayed_audio,
+				   msecs_to_jiffies(180));
+	}
+
+	return 0;
+}
+
+static int it6505_audio_hook_plugged_cb(struct device *dev,
+					void *data,
+					hdmi_codec_plugged_cb fn,
+					struct device *codec_dev)
 {
 	struct it6505 *it6505 = data;
 
@@ -3056,6 +3104,39 @@ static int __maybe_unused it6505_audio_hook_plugged_cb(struct device *dev,
 	return 0;
 }
 
+static const struct hdmi_codec_ops it6505_audio_codec_ops = {
+	.hw_params = it6505_audio_hw_params,
+	.mute_stream = it6505_audio_mute,
+	.audio_shutdown = it6505_audio_shutdown,
+	.hook_plugged_cb = it6505_audio_hook_plugged_cb,
+};
+
+static int it6505_register_audio_driver(struct device *dev)
+{
+	struct it6505 *it6505 = dev_get_drvdata(dev);
+	struct hdmi_codec_pdata codec_data = {
+		.ops = &it6505_audio_codec_ops,
+		.max_i2s_channels = 8,
+		.i2s = 1,
+		.no_capture_mute = 1,
+		.data = it6505,
+	};
+	struct platform_device *pdev;
+
+	INIT_DELAYED_WORK(&it6505->delayed_audio, it6505_delayed_audio);
+
+	pdev = platform_device_register_data(dev, HDMI_CODEC_DRV_NAME,
+					     PLATFORM_DEVID_AUTO, &codec_data,
+					     sizeof(codec_data));
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
+
+	it6505->audio_pdev = pdev;
+	DRM_DEV_DEBUG_DRIVER(dev, "bound to %s", HDMI_CODEC_DRV_NAME);
+
+	return 0;
+}
+
 static inline struct it6505 *bridge_to_it6505(struct drm_bridge *bridge)
 {
 	return container_of(bridge, struct it6505, bridge);
@@ -3565,6 +3646,7 @@ static int it6505_i2c_probe(struct i2c_client *client)
 	mutex_init(&it6505->extcon_lock);
 	mutex_init(&it6505->mode_lock);
 	mutex_init(&it6505->aux_lock);
+	mutex_init(&it6505->audio_lock);
 
 	it6505->bridge.of_node = client->dev.of_node;
 	it6505->connector_status = connector_status_disconnected;
@@ -3615,6 +3697,12 @@ static int it6505_i2c_probe(struct i2c_client *client)
 		return err;
 	}
 
+	err = it6505_register_audio_driver(dev);
+	if (err < 0) {
+		dev_err(dev, "Failed to register audio driver: %d", err);
+		return err;
+	}
+
 	INIT_WORK(&it6505->link_works, it6505_link_training_work);
 	INIT_WORK(&it6505->hdcp_wait_ksv_list, it6505_hdcp_wait_ksv_list);
 	INIT_DELAYED_WORK(&it6505->hdcp_work, it6505_hdcp_work);
@@ -3647,6 +3735,8 @@ static void it6505_i2c_remove(struct i2c_client *client)
 {
 	struct it6505 *it6505 = i2c_get_clientdata(client);
 
+	platform_device_unregister(it6505->audio_pdev);
+	cancel_delayed_work_sync(&it6505->delayed_audio);
 	cancel_work_sync(&it6505->link_works);
 	cancel_work_sync(&it6505->hdcp_wait_ksv_list);
 	cancel_delayed_work_sync(&it6505->hdcp_work);
-- 
2.55.0

