Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F1ED7361B
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Dec 2024 00:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pC7u1TQzvRQC1A4e5XvGLZfvCGSbkGoiw1ILZXBCOZI=; b=YrZILMJRs/wxMOsDKkssk7p/Zg
	aNWKbLzRHObPiHIzskIQKxYtmNjb7nOeRj6GKr4cehqxDrpAKh2SBuNScEDGn1wAZ/XVGb50Yly5G
	R39BSBskjHoMEXJUWHgwy1QL4ApIUvB/v18u7Ldcz8oTa8dGHD5u8K3GMWwgsMiyqRao+BSaKkOSm
	G5l7oFZBj+tF6vbmQTF0GTabjmQLLSEXMvOJ7ZyRyzlAWbXX5equJ2VxrXRgQSFfy0LHE50k19eZj
	xKHz+65w9UcHOK6QowtzxyiLvXW4uN0NOENkgQm8Q/uMfT5/tpQ86rs2XpEklifcwtR26RnaEPG++
	IXdZ4/ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHY8L-00000002pZa-3khW;
	Sun, 01 Dec 2024 00:48:21 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHY4X-00000002oUI-0qzj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Dec 2024 00:44:27 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5d0b922a637so2237412a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Nov 2024 16:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733013863; x=1733618663; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pC7u1TQzvRQC1A4e5XvGLZfvCGSbkGoiw1ILZXBCOZI=;
        b=pUfihVoP3JEgTARlhGDMugq8CCa/eCdkXx2ZHhCs+O3hShibT6fEgBmHQpHxKCJoZj
         eEPTws+s1RBkJwinIxV0SoCUqQ8zLT1KGMZU01Dw0mW4ID+3TYdUsaO5bnB4JRzNBzFH
         rcG8yAhAZVapNPGbrpe5mLv3hYvjim5+kFL+ODYD+Mup/F3ldH3KYEIBixrN89b8dVeo
         HUncyYWPHvLntHNqB36aRHZn+IurDoPc/cIok1FCiaO2i3PMDiDLYhSnuEdLO01h3Ogu
         J2Q0xUWATEYdtOd94LsI3r3f43bURR7R8Xmm/all58+8pjItRp7v13ErZKQHsc4toMMu
         tD9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733013863; x=1733618663;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pC7u1TQzvRQC1A4e5XvGLZfvCGSbkGoiw1ILZXBCOZI=;
        b=oGDZhTAATWzPycKMZzaGSFYkNC+twtzGnHlqLRbW7DtLifBqgMCih1OAHfA5kR3KDK
         pd0ChsN67sICy2VQ5rJDaNN6DL5RiJZQCK13P5DDKtdKTaIypPGybo5yFNyoyDeJvBsk
         NBy+HuZyD/YrXmWIPztJRivmZbn5BQglh/BdntTbab+c6lUkg97QbMAhizLovNcSgjyv
         qLL2/KsU49Kjc/Lp91gTh17J9j1sQWlr506Q3lK2McalQCYytque1dbwHRiWnxjCQAE0
         8E2aELe296gjZZMBsICgsppsv2IVMN2epVCbjb32qnN/aJ2L05ZK/J8Qg5mxIt4ATxX3
         0Byg==
X-Forwarded-Encrypted: i=1; AJvYcCVc7j/g/90cgjflHnBpB2t70CDmlHa67y4d2ir+g7/DQ+fXmUFIXyCq+COUy+YoduesMPwlczQkeBGm2eV3CR4s@lists.infradead.org
X-Gm-Message-State: AOJu0YxC9V4xdUR2ux6WDKp/9raduLTzj/mVJSUQTX+rXHZP70+sa2hY
	tkroPm7CcSrNWEKXxVK2ZeAjVekLJkOTwQaZhkA+6FNR0wsZVFYvgPcV/MaDXOM=
X-Gm-Gg: ASbGncsaiF7ilE1IUEZ3/CpbdWdZH05/SlSHTVHM85JfHZQ9CvH60E9TVeQMYmmw8RT
	Z4h2gV1J0oq8oceA93rsDOxMPyCyowU9CDmctLAyJ899mxbySajD/WsOo7d6WrSqNE3VSQ+QMvh
	6WfvgOSFC/kopKQLqe04pAa9YROYDajAN+cU1s7yEyZSkieCGBgWZ7kJN22MBQcf0VqGz0aT+KN
	I5/E/xlRHibOaEK/i0/mlxrGX1pz3+/jl8F1AhwhWywFHb71v8Edmy4kA==
X-Google-Smtp-Source: AGHT+IF/qOKvsTIvpjsO2rdx8+dnHjqM1lk/0IBBK4NiYEI+++S8oNCo0xAu5I1QF8LenN4SLlEGVw==
X-Received: by 2002:a05:6402:3482:b0:5d0:214b:9d15 with SMTP id 4fb4d7f45d1cf-5d080b8c890mr16948576a12.5.1733013862530;
        Sat, 30 Nov 2024 16:44:22 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d097e8d817sm3400359a12.63.2024.11.30.16.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 16:44:22 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 01 Dec 2024 02:44:07 +0200
Subject: [PATCH v5 3/9] drm/connector: implement generic HDMI codec helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241201-drm-bridge-hdmi-connector-v5-3-b5316e82f61a@linaro.org>
References: <20241201-drm-bridge-hdmi-connector-v5-0-b5316e82f61a@linaro.org>
In-Reply-To: <20241201-drm-bridge-hdmi-connector-v5-0-b5316e82f61a@linaro.org>
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
 Andy Yan <andy.yan@rock-chips.com>, Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=14432;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Q2weCM4AXGG9FokUe/Pnniy4EwvTBWOcgeDLe4MFxtM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnS7FY9nXUnV+/Z9kzWEP1LgcipZ6qwSrNkxfL2
 BJ6TpRSfpKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0uxWAAKCRCLPIo+Aiko
 1bTdB/9R7BAip+W3eQ7+u4/3iHpLjdEULIfi7KlfKfHyYbtTvdrMJJP+OkCflvoRd6BSXrtFvDF
 sI+LhulTy6a0iDjG6xEVd3bT33eTjidw2XhFxk76+QNfsN08423BFPJ6B51E/cNrwxSyzqrquUy
 w1zy82GRkPwXmXaoLsyIBJGE/PN2OOjJ4vveQtkmuu8N5RGcLQ+ET3Cl2jDDgg2Iffzcz1ZzsDb
 GhTyFZMGnri/WpQSWElGwbVuLCLq+ZE/MpiJjaNjgR4uOOXq4VWy7QHjwha2EGtbHNo4uowWwBk
 njer6h19N7HnbmQ/WCVTR1vNq5iCAzagf/R7P9ysoicNiti8
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241130_164425_253749_97E8A7CD 
X-CRM114-Status: GOOD (  25.97  )
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
 drivers/gpu/drm/Makefile                           |   1 +
 drivers/gpu/drm/drm_connector.c                    |  11 ++
 drivers/gpu/drm/drm_connector_hdmi_codec.c         | 187 +++++++++++++++++++++
 .../gpu/drm/drm_connector_hdmi_codec_internal.h    |  35 ++++
 include/drm/drm_connector.h                        |  80 +++++++++
 5 files changed, 314 insertions(+)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 1677c1f335fbb0c6114bdb4cc0b12eb407d84564..afdd9268ca23ac7602e73bbe45f3f9cd090a3afd 100644
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
index bbdaaf7022b62d84594a29f1b60144920903a99a..e6252b13e4555125b69d19e0ca24f93b00cee74b 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -38,6 +38,7 @@
 
 #include <video/cmdline.h>
 
+#include "drm_connector_hdmi_codec_internal.h"
 #include "drm_crtc_internal.h"
 #include "drm_internal.h"
 
@@ -280,6 +281,7 @@ static int __drm_connector_init(struct drm_device *dev,
 	mutex_init(&connector->eld_mutex);
 	mutex_init(&connector->edid_override_mutex);
 	mutex_init(&connector->hdmi.infoframes.lock);
+	mutex_init(&connector->hdmi_codec.lock);
 	connector->edid_blob_ptr = NULL;
 	connector->epoch_counter = 0;
 	connector->tile_blob_ptr = NULL;
@@ -534,6 +536,12 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 
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
@@ -632,6 +640,8 @@ void drm_connector_cleanup(struct drm_connector *connector)
 		    DRM_CONNECTOR_REGISTERED))
 		drm_connector_unregister(connector);
 
+	drm_connector_hdmi_codec_cleanup(connector);
+
 	if (connector->privacy_screen) {
 		drm_privacy_screen_put(connector->privacy_screen);
 		connector->privacy_screen = NULL;
@@ -670,6 +680,7 @@ void drm_connector_cleanup(struct drm_connector *connector)
 		connector->funcs->atomic_destroy_state(connector,
 						       connector->state);
 
+	mutex_destroy(&connector->hdmi_codec.lock);
 	mutex_destroy(&connector->hdmi.infoframes.lock);
 	mutex_destroy(&connector->mutex);
 
diff --git a/drivers/gpu/drm/drm_connector_hdmi_codec.c b/drivers/gpu/drm/drm_connector_hdmi_codec.c
new file mode 100644
index 0000000000000000000000000000000000000000..495ddf21f3ada5a119347102e813684a25af24ff
--- /dev/null
+++ b/drivers/gpu/drm/drm_connector_hdmi_codec.c
@@ -0,0 +1,187 @@
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
+#include "drm_connector_hdmi_codec_internal.h"
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
+	mutex_lock(&connector->eld_mutex);
+	memcpy(buf, connector->eld, min(sizeof(connector->eld), len));
+	mutex_unlock(&connector->eld_mutex);
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
+ * drm_connector_hdmi_codec_init - Initialize HDMI Codec device for the DRM connector
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
diff --git a/drivers/gpu/drm/drm_connector_hdmi_codec_internal.h b/drivers/gpu/drm/drm_connector_hdmi_codec_internal.h
new file mode 100644
index 0000000000000000000000000000000000000000..1b46a2d3ef5c4d003ddf903107d0aee22d42060b
--- /dev/null
+++ b/drivers/gpu/drm/drm_connector_hdmi_codec_internal.h
@@ -0,0 +1,35 @@
+/*
+ * Copyright (c) 2024 Linaro Ltd.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+/*
+ * Private functions provided by drm_connector_hdmi_codec.c
+ */
+
+#ifndef __DRM_CONNECTOR_HDMI_CODEC_INTERNAL_H__
+#define __DRM_CONNECTOR_HDMI_CODEC_INTERNAL_H__
+
+struct drm_connector;
+
+int drm_connector_hdmi_codec_init(struct drm_connector *connector);
+void drm_connector_hdmi_codec_cleanup(struct drm_connector *connector);
+
+#endif
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 1e2b25e204cb523d61d30f5409faa059bf2b86eb..37b208edb88d63461be7d4b44b2305c9496f26f7 100644
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
@@ -2121,6 +2193,11 @@ struct drm_connector {
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
@@ -2154,6 +2231,9 @@ void drm_connector_unregister(struct drm_connector *connector);
 int drm_connector_attach_encoder(struct drm_connector *connector,
 				      struct drm_encoder *encoder);
 
+void drm_connector_hdmi_codec_plugged_notify(struct drm_connector *connector,
+					     bool plugged);
+
 void drm_connector_cleanup(struct drm_connector *connector);
 
 static inline unsigned int drm_connector_index(const struct drm_connector *connector)

-- 
2.39.5


