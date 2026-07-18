Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB6A4C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jul 2026 17:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0IiV3gWySHQsud92R+VwlADv4quUwSQ7SKDvhs3Vz6s=; b=z83WE2+jn4zSNudo/B4q4wIIrl
	WHkFagYDHpU9KI1D1JyUvKxfNa9QCjGzHp7HpdrPnU8IVWtVW1fFtz0BBUPy5R8/9MdKSAt4eVr6q
	JNZCWJO22ZdNdqS75N/sOJNqOG0W7PjY8297Vff+Fdg5G+v7enxUU/n+Me8XN6bQRxg4NdHBwPUtV
	vDZxr79UHSdwk1PolVl3A788MEmOQFX31XJNKO3lOOnAYxctOPU0RR6GZWEUioeNvq96tK4WQ5p9H
	T2kFtWO3BX4wbLNGW1KeGHhv6BI5seri81whbt6+KqSkQj//AkNSD6KKjZA6ha3aMjULyUhs8QTbb
	vO6ohd2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl8RR-00000004MBW-33OP;
	Sat, 18 Jul 2026 17:03:09 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl8RN-00000004M9g-1VTD;
	Sat, 18 Jul 2026 17:03:06 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wl8R9-000000007rd-27xI;
	Sat, 18 Jul 2026 17:02:51 +0000
Date: Sat, 18 Jul 2026 18:02:48 +0100
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
Subject: [PATCH 1/2] drm/bridge: it6505: Add audio support
Message-ID: <2cc7d3922a66de483200d75c9f98badb5391c85a.1784393979.git.daniel@makrotopia.org>
References: <cover.1784393979.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1784393979.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_100305_425525_7459E4C3 
X-CRM114-Status: GOOD (  18.09  )
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

[djg: respin of Jiaxin Yu's v3; rebased onto current tree; the driver
 gained it6505->dev so drop the &client->dev usages; hdmi_codec_ops no
 longer has .trigger, so enable/disable via .mute_stream instead; drop
 now-redundant __maybe_unused on the wired-up helpers]

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
Link: https://lore.kernel.org/all/20230730180803.22570-4-jiaxin.yu@mediatek.com/
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 92 ++++++++++++++++++++++++-----
 1 file changed, 76 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 8ecb43611dba..698ae01b3a47 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -2320,19 +2320,12 @@ static void it6505_stop_link_train(struct it6505 *it6505)
 
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
@@ -2960,7 +2953,7 @@ static void it6505_remove_notifier_module(struct it6505 *it6505)
 	}
 }
 
-static void __maybe_unused it6505_delayed_audio(struct work_struct *work)
+static void it6505_delayed_audio(struct work_struct *work)
 {
 	struct it6505 *it6505 = container_of(work, struct it6505,
 					     delayed_audio.work);
@@ -2974,9 +2967,9 @@ static void __maybe_unused it6505_delayed_audio(struct work_struct *work)
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
@@ -3031,7 +3024,7 @@ static int __maybe_unused it6505_audio_setup_hw_params(struct it6505 *it6505,
 	return 0;
 }
 
-static void __maybe_unused it6505_audio_shutdown(struct device *dev, void *data)
+static void it6505_audio_shutdown(struct device *dev, void *data)
 {
 	struct it6505 *it6505 = dev_get_drvdata(dev);
 
@@ -3039,10 +3032,40 @@ static void __maybe_unused it6505_audio_shutdown(struct device *dev, void *data)
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
+	/*
+	 * Some DP-to-HDMI dongles get into a bad state if the InfoFrame is
+	 * sent without audio data, so only enable it6505's audio once the
+	 * stream is unmuted (i.e. actually playing).
+	 */
+	if (enable)
+		cancel_delayed_work(&it6505->delayed_audio);
+	else
+		queue_delayed_work(system_wq, &it6505->delayed_audio,
+				   msecs_to_jiffies(180));
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
 
@@ -3053,6 +3076,37 @@ static int __maybe_unused it6505_audio_hook_plugged_cb(struct device *dev,
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
+	pdev = platform_device_register_data(dev, HDMI_CODEC_DRV_NAME,
+					     PLATFORM_DEVID_AUTO, &codec_data,
+					     sizeof(codec_data));
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
+
+	INIT_DELAYED_WORK(&it6505->delayed_audio, it6505_delayed_audio);
+	DRM_DEV_DEBUG_DRIVER(dev, "bound to %s", HDMI_CODEC_DRV_NAME);
+
+	return 0;
+}
+
 static inline struct it6505 *bridge_to_it6505(struct drm_bridge *bridge)
 {
 	return container_of(bridge, struct it6505, bridge);
@@ -3612,6 +3666,12 @@ static int it6505_i2c_probe(struct i2c_client *client)
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
-- 
2.55.0

