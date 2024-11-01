Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0803EE6B240
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 10:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h1/qiW+fnRl/FJlXPSiMeWJ1ccQQT9CkXDqCh4iuUkw=; b=S0wgUQN9Frd1GM8OJYJS7KxncC
	JcqDeEv9+MyLNzUdTmfLdEvW2BCZVEcimDPUDOdW47C3ZS9+hBRDjRHEbAXq9yiap0s/b/Ao0z13p
	V+U3cDrPlDh06506VSwTUdah52v+MGm9+rIkUdCDfKGzWoB0k45InAQIrNtsjwuO6V68G7TPWmDrV
	1Lcm1XH+faZNUXtLq0bF1wBKTVBYn2fY4UKtEhv7Dgswe+xooD1muTtTM0bLIrApose29FNyoNkkP
	U0MxouXFgxH8LlgIuZYmlD15SF6EkmuN20G/aQy66vRaqqzX1wJ72j0dg/iVmp5ddYwfhm2DwMLDi
	1jJRD1vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6oyj-00000006aZ8-2Bgm;
	Fri, 01 Nov 2024 10:34:05 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6okQ-00000006Xwp-29Dm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 10:19:24 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2fb5fa911aaso27852881fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 03:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730456356; x=1731061156; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h1/qiW+fnRl/FJlXPSiMeWJ1ccQQT9CkXDqCh4iuUkw=;
        b=hYX3dVl4tkanwPTbxHMNYnDy9EBH3B6/BzhOYzD3OkvgqP3b02dqWZlN1ij9zMqfAm
         bakFgv5brVu6S+SGsiAdx5pMoFNKj2+cbtJIYo5m8TfGUYCB7aFu6GBa18on24AsCGog
         jbEBzdgcL17hGS4MVshda3SusugF5L5sjaSTNRN2+a76IEZ37UdUtFeEeUPb3RTn9WFF
         8lMoRzt9IhazkUnsJt/L4TBbtSpDlmFT6H9Fvko+abRXyCWDTjipp1vqWVFgtO3UT0Ha
         08lMczL8p+LNCqtBBd5DzKrkRVoImWWXcwJ8myztS4/VFTe5GsbVo22A+DYQsLAG83N2
         9l0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730456356; x=1731061156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h1/qiW+fnRl/FJlXPSiMeWJ1ccQQT9CkXDqCh4iuUkw=;
        b=sXHuzTJ1TUUzXvtlgbQgVMSP2olHIpuPIU/hRqu9QgYFE80JiTQPrlTNpD1ne/Jewm
         vzJw8uhFteqrKYXEq3urAvC3y7baNBdHQie8Lvw3rAJWiGl/s3lqii7GiJhGKOMJX1hg
         CXvfGzAmDDyEfNbUf85m9dQiNf+CYVLwkroyeTIYtRf9AHUUGHWcf1pSERiB56g377uP
         UkSxDrjc2NaWsMrpD1cA2hwMEECNisly49KWH0LRhTS7Jn+jHpeDCZXBDElGo3zvwmo1
         Ufpg4dLaCxqBy83UzBCixnVNxZh++5UzJUOF0yTw+7LiT3p3vr1qI8DWMA6j9SoHGOex
         YLyA==
X-Forwarded-Encrypted: i=1; AJvYcCVR7lRVeV+YOIY/2IkBY8UDyyvdhHPi9sRIlAlteS855cfe6AU9vffPGGcLPs0tIgrCyIw3pTZBwyBanzuJS7aV@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6chgGXbkq9JRjQq3wJWZWhbkfho6Yy7dfe1AzyJZEgOujlDWz
	Xm4Q0xXIGFKuyvm+3PpGnGSSqB6vOvTVBd6fq+09fdL+2ds+6oJpTldctmQovPE=
X-Google-Smtp-Source: AGHT+IGfOrAmvPqGnwkSe0ftz8Tmhn/NjuEb9mFY++/dM079TIBnXuB0aqnqlIdmYRkVJozLPc5G7Q==
X-Received: by 2002:a2e:bc27:0:b0:2fb:5bd:8ff2 with SMTP id 38308e7fff4ca-2fedb7a2d4fmr25045471fa.16.1730456356390;
        Fri, 01 Nov 2024 03:19:16 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fdef5d6ef4sm5197031fa.48.2024.11.01.03.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 03:19:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 01 Nov 2024 12:19:04 +0200
Subject: [PATCH RFC v2 3/7] drm/connector: implement generic HDMI codec
 helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241101-drm-bridge-hdmi-connector-v2-3-739ef9addf9e@linaro.org>
References: <20241101-drm-bridge-hdmi-connector-v2-0-739ef9addf9e@linaro.org>
In-Reply-To: <20241101-drm-bridge-hdmi-connector-v2-0-739ef9addf9e@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Phong LE <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Alain Volmat <alain.volmat@foss.st.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12993;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=J73ORTWzhhODWeaq7deEswTDv9EGimfDnk75uuPwfvw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnJKsYvIjxTMttagkeB2+A7smBCSZdSiTLwEmCC
 iC1d9AOSPqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZySrGAAKCRCLPIo+Aiko
 1XznCACFHBGN2p5UoUoct++a+ZJxpE7/7drc9tW7VJwvZbQV/K2O7Le5BHpcnAWXHtQz4ZFgJA4
 43kHY6Ma0+3qEqDSowKogCBTNFl7hX7zLxkPumHsGeLYBF9NwBAPKfX3MoSSc3da374ibYMbz0S
 CP8+B57H12e4rWyP1D3KKhWyKfDHQLDMOPjlW0iVAaewNAivxYB+smHWxxSeA7PPzDrXn7jUNQz
 3Vx2mcqpoZ16RNS/0n5VYq5mNFVPVJv7WUuzn19z/FzFgUVPKlexlWLN7uwK/kX4dhRAUSYSWBT
 b1bPx50dDKoW8z9x1LZ/vjqwWAU67nJFRyO/tuHNjiWVqysN
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_031918_706963_16CB8B5A 
X-CRM114-Status: GOOD (  26.38  )
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

Several DRM drivers implement HDMI codec support (despite its name it
applies to both HDMI and DisplayPort drivers). Implement generic
framework to be used by these drivers. This removes a requirement to
implement get_eld() callback and provides default implementation for
codec's plug handling.

The framework is integrated with the DRM HDMI Connector framework, but
can be used by DisplayPort drivers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/Makefile                   |   1 +
 drivers/gpu/drm/drm_connector.c            |  10 ++
 drivers/gpu/drm/drm_connector_hdmi_codec.c | 186 +++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_internal.h             |   5 +
 include/drm/drm_connector.h                |  80 +++++++++++++
 5 files changed, 282 insertions(+)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 463afad1b5ca6275e61223adc8ca036c3d4d6b03..ab5b052ad5229229ac46e3804be77dd1d1680f58 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -42,6 +42,7 @@ drm-y := \
 	drm_cache.o \
 	drm_color_mgmt.o \
 	drm_connector.o \
+	drm_connector_hdmi_codec.o \
 	drm_crtc.o \
 	drm_displayid.o \
 	drm_drv.o \
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index fc35f47e2849ed6786d6223ac9c69e1c359fc648..1a155a9fb401f687e5a88e72faca1e81d944b6d2 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -279,6 +279,7 @@ static int __drm_connector_init(struct drm_device *dev,
 	mutex_init(&connector->mutex);
 	mutex_init(&connector->edid_override_mutex);
 	mutex_init(&connector->hdmi.infoframes.lock);
+	mutex_init(&connector->hdmi_codec.lock);
 	connector->edid_blob_ptr = NULL;
 	connector->epoch_counter = 0;
 	connector->tile_blob_ptr = NULL;
@@ -533,6 +534,12 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 
 	connector->hdmi.funcs = hdmi_funcs;
 
+	if (connector->hdmi_codec.i2s || connector->hdmi_codec.spdif) {
+		ret = drm_connector_hdmi_codec_init(connector);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 EXPORT_SYMBOL(drmm_connector_hdmi_init);
@@ -631,6 +638,8 @@ void drm_connector_cleanup(struct drm_connector *connector)
 		    DRM_CONNECTOR_REGISTERED))
 		drm_connector_unregister(connector);
 
+	drm_connector_hdmi_codec_cleanup(connector);
+
 	if (connector->privacy_screen) {
 		drm_privacy_screen_put(connector->privacy_screen);
 		connector->privacy_screen = NULL;
@@ -669,6 +678,7 @@ void drm_connector_cleanup(struct drm_connector *connector)
 		connector->funcs->atomic_destroy_state(connector,
 						       connector->state);
 
+	mutex_destroy(&connector->hdmi_codec.lock);
 	mutex_destroy(&connector->hdmi.infoframes.lock);
 	mutex_destroy(&connector->mutex);
 
diff --git a/drivers/gpu/drm/drm_connector_hdmi_codec.c b/drivers/gpu/drm/drm_connector_hdmi_codec.c
new file mode 100644
index 0000000000000000000000000000000000000000..cec727d3fc1493684e954195264b1a5d85a7a2ff
--- /dev/null
+++ b/drivers/gpu/drm/drm_connector_hdmi_codec.c
@@ -0,0 +1,186 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright (c) 2024 Linaro Ltd
+ */
+
+#include <linux/mutex.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+
+#include <drm/drm_connector.h>
+#include <drm/drm_device.h>
+
+#include <sound/hdmi-codec.h>
+
+#include "drm_internal.h"
+
+static int drm_connector_hdmi_codec_audio_startup(struct device *dev, void *data)
+{
+	struct drm_connector *connector = data;
+	const struct drm_connector_hdmi_codec_funcs *funcs =
+		connector->hdmi.funcs->codec_funcs;
+
+	if (funcs->audio_startup)
+		return funcs->audio_startup(connector);
+
+	return 0;
+}
+
+static int drm_connector_hdmi_codec_prepare(struct device *dev, void *data,
+					    struct hdmi_codec_daifmt *fmt,
+					    struct hdmi_codec_params *hparms)
+{
+	struct drm_connector *connector = data;
+	const struct drm_connector_hdmi_codec_funcs *funcs =
+		connector->hdmi.funcs->codec_funcs;
+
+	return funcs->prepare(connector, fmt, hparms);
+}
+
+static void drm_connector_hdmi_codec_audio_shutdown(struct device *dev, void *data)
+{
+	struct drm_connector *connector = data;
+	const struct drm_connector_hdmi_codec_funcs *funcs =
+		connector->hdmi.funcs->codec_funcs;
+
+	return funcs->audio_shutdown(connector);
+}
+
+static int drm_connector_hdmi_codec_mute_stream(struct device *dev, void *data,
+						bool enable, int direction)
+{
+	struct drm_connector *connector = data;
+	const struct drm_connector_hdmi_codec_funcs *funcs =
+		connector->hdmi.funcs->codec_funcs;
+
+	if (funcs->mute_stream)
+		return funcs->mute_stream(connector, enable, direction);
+
+	return -ENOTSUPP;
+}
+
+static int drm_connector_hdmi_codec_get_dai_id(struct snd_soc_component *comment,
+		  struct device_node *endpoint,
+		  void *data)
+{
+	struct drm_connector *connector = data;
+	struct of_endpoint of_ep;
+	int ret;
+
+	if (connector->hdmi_codec.sound_dai_port < 0)
+		return -ENOTSUPP;
+
+	ret = of_graph_parse_endpoint(endpoint, &of_ep);
+	if (ret < 0)
+		return ret;
+
+	if (of_ep.port == connector->hdmi_codec.sound_dai_port)
+		return 0;
+
+	return -EINVAL;
+}
+
+static int drm_connector_hdmi_codec_get_eld(struct device *dev, void *data,
+					    uint8_t *buf, size_t len)
+{
+	struct drm_connector *connector = data;
+
+	//  FIXME: locking against drm_edid_to_eld ?
+	memcpy(buf, connector->eld, min(sizeof(connector->eld), len));
+
+	return 0;
+}
+
+static int drm_connector_hdmi_codec_hook_plugged_cb(struct device *dev,
+						    void *data,
+						    hdmi_codec_plugged_cb fn,
+						    struct device *codec_dev)
+{
+	struct drm_connector *connector = data;
+
+	mutex_lock(&connector->hdmi_codec.lock);
+
+	connector->hdmi_codec.plugged_cb = fn;
+	connector->hdmi_codec.plugged_cb_dev = codec_dev;
+
+	fn(codec_dev, connector->hdmi_codec.last_state);
+
+	mutex_unlock(&connector->hdmi_codec.lock);
+
+	return 0;
+}
+
+void drm_connector_hdmi_codec_plugged_notify(struct drm_connector *connector,
+					     bool plugged)
+{
+	mutex_lock(&connector->hdmi_codec.lock);
+
+	connector->hdmi_codec.last_state = plugged;
+
+	if (connector->hdmi_codec.plugged_cb &&
+	    connector->hdmi_codec.plugged_cb_dev)
+		connector->hdmi_codec.plugged_cb(connector->hdmi_codec.plugged_cb_dev,
+						 connector->hdmi_codec.last_state);
+
+	mutex_unlock(&connector->hdmi_codec.lock);
+}
+EXPORT_SYMBOL(drm_connector_hdmi_codec_plugged_notify);
+
+static const struct hdmi_codec_ops drm_connector_hdmi_codec_ops = {
+	.audio_startup = drm_connector_hdmi_codec_audio_startup,
+	.prepare = drm_connector_hdmi_codec_prepare,
+	.audio_shutdown = drm_connector_hdmi_codec_audio_shutdown,
+	.mute_stream = drm_connector_hdmi_codec_mute_stream,
+	.get_eld = drm_connector_hdmi_codec_get_eld,
+	.get_dai_id = drm_connector_hdmi_codec_get_dai_id,
+	.hook_plugged_cb = drm_connector_hdmi_codec_hook_plugged_cb,
+};
+
+/**
+ * drm_connector_hdmi_codec_cleanup - Cleanup the HDMI Codec for the connector
+ * @connector: A pointer to the connector to cleanup
+ *
+ * Cleanup the HDMI codec device created for the specified connector.
+ * Can be called even if the codec wasn't allocated.
+ */
+void drm_connector_hdmi_codec_cleanup(struct drm_connector *connector)
+{
+	platform_device_unregister(connector->hdmi_codec.codec_pdev);
+}
+
+/**
+ * drm_connector_hdmi_init - Initialize HDMI Codec device for the DRM connector
+ * @connector: A pointer to the connector to allocate codec for
+ *
+ * Create a HDMI codec device to be used with the specified connector.
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int drm_connector_hdmi_codec_init(struct drm_connector *connector)
+{
+	struct hdmi_codec_pdata codec_pdata = {};
+	struct platform_device *pdev;
+
+	if (!connector->hdmi.funcs->codec_funcs->prepare ||
+	    !connector->hdmi.funcs->codec_funcs->audio_shutdown ||
+	    !connector->hdmi_codec.dev)
+		return -EINVAL;
+
+	codec_pdata.ops = &drm_connector_hdmi_codec_ops;
+	codec_pdata.i2s = connector->hdmi_codec.i2s,
+	codec_pdata.spdif = connector->hdmi_codec.spdif,
+	codec_pdata.max_i2s_channels = connector->hdmi_codec.max_i2s_channels,
+	codec_pdata.data = connector;
+
+	pdev = platform_device_register_data(connector->hdmi_codec.dev,
+					     HDMI_CODEC_DRV_NAME,
+					     PLATFORM_DEVID_AUTO,
+					     &codec_pdata, sizeof(codec_pdata));
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
+
+	connector->hdmi_codec.codec_pdev = pdev;
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index b2b6a8e49dda46f1cb3b048ef7b28356dd3aaa4e..8ed58e482fac4662b659276e8bc17690e1fdb9b7 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -280,4 +280,9 @@ void drm_framebuffer_print_info(struct drm_printer *p, unsigned int indent,
 				const struct drm_framebuffer *fb);
 void drm_framebuffer_debugfs_init(struct drm_device *dev);
 
+/* drm_connector_hdmi_codec.c */
+
+int drm_connector_hdmi_codec_init(struct drm_connector *connector);
+void drm_connector_hdmi_codec_cleanup(struct drm_connector *connector);
+
 #endif /* __DRM_INTERNAL_H__ */
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index e3fa43291f449d70f3b92a00985336c4f2237bc6..b89f791cfa2be86ce1c5aa124c0f071d7c8a6489 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -46,6 +46,8 @@ struct drm_property_blob;
 struct drm_printer;
 struct drm_privacy_screen;
 struct edid;
+struct hdmi_codec_daifmt;
+struct hdmi_codec_params;
 struct i2c_adapter;
 
 enum drm_connector_force {
@@ -1141,6 +1143,52 @@ struct drm_connector_state {
 	struct drm_connector_hdmi_state hdmi;
 };
 
+struct drm_connector_hdmi_codec_funcs {
+	/**
+	 * @audio_startup:
+	 *
+	 * Called when ASoC starts an audio stream setup. The
+	 * @hdmi_audio_startup is optional.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise
+	 */
+	int (*audio_startup)(struct drm_connector *connector);
+
+	/**
+	 * @prepare:
+	 * Configures HDMI-encoder for audio stream. Can be called
+	 * multiple times for each setup. Mandatory.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise
+	 */
+	int (*prepare)(struct drm_connector *connector,
+		       struct hdmi_codec_daifmt *fmt,
+		       struct hdmi_codec_params *hparms);
+	/**
+	 * @audio_shutdown:
+	 *
+	 * Shut down the audio stream. Mandatory.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise
+	 */
+	void (*audio_shutdown)(struct drm_connector *connector);
+
+	/**
+	 * @mute_stream:
+	 *
+	 * Mute/unmute HDMI audio stream. The @mute_stream callback is
+	 * optional.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise
+	 */
+	int (*mute_stream)(struct drm_connector *connector,
+			   bool enable, int direction);
+};
+
 /**
  * struct drm_connector_hdmi_funcs - drm_hdmi_connector control functions
  */
@@ -1198,6 +1246,14 @@ struct drm_connector_hdmi_funcs {
 	int (*write_infoframe)(struct drm_connector *connector,
 			       enum hdmi_infoframe_type type,
 			       const u8 *buffer, size_t len);
+
+	/**
+	 * @codec_funcs:
+	 *
+	 * Implementation of the HDMI codec functionality to be used by the DRM
+	 * HDMI Codec framework.
+	 */
+	const struct drm_connector_hdmi_codec_funcs *codec_funcs;
 };
 
 /**
@@ -1660,6 +1716,22 @@ struct drm_cmdline_mode {
 	bool tv_mode_specified;
 };
 
+struct drm_connector_hdmi_codec {
+	struct platform_device *codec_pdev;
+	struct device *dev;
+
+	struct mutex lock; /* protects last_state and plugged_cb */
+	void (*plugged_cb)(struct device *dev, bool plugged);
+	struct device *plugged_cb_dev;
+	bool last_state;
+
+	int max_i2s_channels;
+	uint i2s: 1;
+	uint spdif: 1;
+
+	int sound_dai_port;
+};
+
 /*
  * struct drm_connector_hdmi - DRM Connector HDMI-related structure
  */
@@ -2118,6 +2190,11 @@ struct drm_connector {
 	 * @hdmi: HDMI-related variable and properties.
 	 */
 	struct drm_connector_hdmi hdmi;
+
+	/**
+	 * @hdmi_codec: HDMI codec properties and non-DRM state.
+	 */
+	struct drm_connector_hdmi_codec hdmi_codec;
 };
 
 #define obj_to_connector(x) container_of(x, struct drm_connector, base)
@@ -2151,6 +2228,9 @@ void drm_connector_unregister(struct drm_connector *connector);
 int drm_connector_attach_encoder(struct drm_connector *connector,
 				      struct drm_encoder *encoder);
 
+void drm_connector_hdmi_codec_plugged_notify(struct drm_connector *connector,
+					     bool plugged);
+
 void drm_connector_cleanup(struct drm_connector *connector);
 
 static inline unsigned int drm_connector_index(const struct drm_connector *connector)

-- 
2.39.5


