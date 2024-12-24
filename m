Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D380E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 01:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aUXMApCPVbZrdh/ywGvhviEJjk+UNjn7ww2dNhiym/A=; b=bO8JU9OYqzVnGp4lS2k5/BfIsU
	takA4Jj+xPXt2d0ydoalkACA8+bUgeKvc/2/bqyLtKNszsoeAHDQga3zjTibsFrNFLOe0C7ZwZh4x
	FoGPGflbfR8WvHecYJI/nQZkUAPpuIvfGglFFLQUCzTLQ/U7vuun+D8tCdX5yiJ3Tbmu2SHhAgWkt
	RBL4tr/3vWrKpwr67m2dovlDE5FfwPFmlIEul9GHiGHSZY04DWmJm7HvOvkUcDaFzAmxVJvQwAMEH
	hpGnZTugkRk7s+r5QikkSJ4lPUkgcbRkzI2S3COwTeL95rIdMJkBA1VJqmpb0jBcHlZTnZnplW8mA
	dQRDFXGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPu9M-0000000B2uo-3LBu;
	Tue, 24 Dec 2024 01:55:56 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPu1p-0000000B1Q8-2eAy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 01:48:10 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-540215984f0so4966618e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Dec 2024 17:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735004888; x=1735609688; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aUXMApCPVbZrdh/ywGvhviEJjk+UNjn7ww2dNhiym/A=;
        b=yI+JnI46zh6vRW6u2eYxjWYBEhb4Sx+XXjEsdYkFZ2jQeqPVCDbQIvOYF0tEKIfabJ
         oc3pL8yF1QyOqISSIYPPCSeeoODKv0Tf/t+bOuqN8hlKHXa9odrWJ4hpH4U7tfHtPRHY
         Z89AvYCQUaes7RrtvCc4gTNgOA5MmKPvbEdenu4gMT8qvR+P7Sz7AzqkHf8cZsW/ignT
         slLOJn4U76Vu2/UwMf1W0wJwZP14ACIgYesRUEVt1gw7ok9QNPTGqv/UNZYzjLx0XlTj
         t0dg4tptQjSc++HWE/N+tDCFKtd0bH2wmf9ZpiUiGEKf1gDfhp997F/M74ClW5RleEpj
         ACQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735004888; x=1735609688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aUXMApCPVbZrdh/ywGvhviEJjk+UNjn7ww2dNhiym/A=;
        b=Gb1Ga3OlkCoxU6w5jyy8rbiLBN/W5x5E18LbB4TrC37W1CJu8+Qx309ckGxCNCWjoP
         AktCL49zq8E+sn9OPRZu6u3fSfvAnndPQE9gP+G36s/iwSYt2Z7E74oo7a7SLVVusDiv
         jrGPaMJZcqXtrlp0B4xngVFpxOwPtbX8n0Vl5G7BBMLE2JUOxtg5j3XDU59p1JhHk7Nj
         Oli6Kd7EKoqQYVopARPaoFkQ32mNR82hzjY47qyOe8rEJTCEQ8Z7LVF68P1f46Qp0crf
         hPsxJsc5cSrRBVJSHZ1/PGy/fi4NG2S4ICpsicoGWoiqg/Z+/6mx9M4u9YU0q09QfUaI
         LlwA==
X-Forwarded-Encrypted: i=1; AJvYcCWDrsW91BRNFQpKp0ZTu5+JTB3tH0gLw4rzLrUnLegzS1R3nYZEd2nWPhjwbFOgwhYFX32yVHJCfJYt4kzC2Kdv@lists.infradead.org
X-Gm-Message-State: AOJu0YzOVHPVsyTFmrwO+X1OVlNJbd2ThVqXA8CnOITpj5KDTtleL8OH
	J7BVg8onFiyjJdIv23o7Cjb+viTlStEBqYdgNSlWTq3wZc8g5rpbOAFkoG/Ddbc=
X-Gm-Gg: ASbGncvpvHQNmO9iLagEOmUQWmjTTbFiRHUnNB1Hf98SdcrYg+8U79ZN1eGSOoUAseG
	lUEiXPJUbuxlGTU6BmxpYZF9pdM8QS69l/IozlB2Jb3+6LPgwAn1hBpklh2tKTCQZhaH4UEeAF7
	EyjSE68U1Fss1SifQco8PQjIy5gTFHxwioC6sDv1wDdQXxBGvfFq7Lx4jxN4Ag1XgzqpFdyHBQY
	AaiUTYsLE2DfP8C3hF1lXsRO4Qs63v3efBYIlIQmkQbpDD3MOFKeKXD6F8oG7rn
X-Google-Smtp-Source: AGHT+IG676yJj3ODpMz9srmPeoxGD09dmlv4auTncOx1uH2kFsvF6eTOFOFU8N9C9/qejoS+YPp7FA==
X-Received: by 2002:a05:6512:3192:b0:542:24c8:e062 with SMTP id 2adb3069b0e04-5422958eaa3mr4517681e87.44.1735004887606;
        Mon, 23 Dec 2024 17:48:07 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f6509sm1425988e87.25.2024.12.23.17.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 17:48:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Dec 2024 03:47:55 +0200
Subject: [PATCH v10 03/10] drm/connector: implement generic HDMI audio
 helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-drm-bridge-hdmi-connector-v10-3-dc89577cd438@linaro.org>
References: <20241224-drm-bridge-hdmi-connector-v10-0-dc89577cd438@linaro.org>
In-Reply-To: <20241224-drm-bridge-hdmi-connector-v10-0-dc89577cd438@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=14388;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=vKDRJdUj9HKLyTFXzPe21GyurnsKBw9x39sd/q7jraM=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ3qW0BmmhJX8v0PKk245Bi/dV27UOc2ac+6slfb+SzzWa
 zq8txfsZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBE2g9yMCy49rzt4/drbYkd
 QV2zJnT3hiTap8266urWrpzcYHN3+YKzFmc0e7aJWL2eImsYsu6laNLnBmPGEqHYUwsVg9abLou
 M23iMaSuXqmjOhCNtJwtbVk0QdZf9xhz2TYox22PVnQ0XmL+ZLEsvX7xPJOiKw4srfMUdPuk+zD
 LOBiY6Xm8EHDUelG0Vn6Ryb15L17QVx9SPLznKVfJv44ctj26U8k/iF+e3T7A3691reTUi2zXp4
 P2pkZvSNkqf1uWbLG+xUX1e/D/lyaq7wzbfmsX0sP5Ty4rWifFRi8ULtr04HFPrvrBEbcml5iiN
 vDLeuFNc8RzF7z9kJf4Ii/fLY2DLKym6Lrn7eZGJcV0TAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_174809_705387_36124204 
X-CRM114-Status: GOOD (  23.01  )
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

Acked-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/Kconfig                 |   6 +
 drivers/gpu/drm/display/Makefile                |   2 +
 drivers/gpu/drm/display/drm_hdmi_audio_helper.c | 190 ++++++++++++++++++++++++
 drivers/gpu/drm/drm_connector.c                 |   5 +
 include/drm/display/drm_hdmi_audio_helper.h     |  22 +++
 include/drm/drm_connector.h                     | 116 +++++++++++++++
 6 files changed, 341 insertions(+)

diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index 6a4e892afcf8966b45f50ce1f2530707441eda51..80c1953cac14a088d764acd45df03debfcb95e7c 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -75,6 +75,12 @@ config DRM_DISPLAY_HDCP_HELPER
 	help
 	  DRM display helpers for HDCP.
 
+config DRM_DISPLAY_HDMI_AUDIO_HELPER
+	bool
+	help
+	  DRM display helpers for HDMI Audio functionality (generic HDMI Codec
+	  implementation).
+
 config DRM_DISPLAY_HDMI_HELPER
 	bool
 	help
diff --git a/drivers/gpu/drm/display/Makefile b/drivers/gpu/drm/display/Makefile
index 629c834c3192c61ab8e071223c6a08b98d295b0c..b17879b957d5401721396e247fa346387cf6c48a 100644
--- a/drivers/gpu/drm/display/Makefile
+++ b/drivers/gpu/drm/display/Makefile
@@ -14,6 +14,8 @@ drm_display_helper-$(CONFIG_DRM_DISPLAY_DP_TUNNEL) += \
 drm_display_helper-$(CONFIG_DRM_DISPLAY_DSC_HELPER) += \
 	drm_dsc_helper.o
 drm_display_helper-$(CONFIG_DRM_DISPLAY_HDCP_HELPER) += drm_hdcp_helper.o
+drm_display_helper-$(CONFIG_DRM_DISPLAY_HDMI_AUDIO_HELPER) += \
+	drm_hdmi_audio_helper.o
 drm_display_helper-$(CONFIG_DRM_DISPLAY_HDMI_HELPER) += \
 	drm_hdmi_helper.o \
 	drm_scdc_helper.o
diff --git a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
new file mode 100644
index 0000000000000000000000000000000000000000..05afc9f0bdd6b6f00d74223a9d8875e6d16aea5f
--- /dev/null
+++ b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
@@ -0,0 +1,190 @@
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
+#include <drm/display/drm_hdmi_audio_helper.h>
+
+#include <sound/hdmi-codec.h>
+
+static int drm_connector_hdmi_audio_startup(struct device *dev, void *data)
+{
+	struct drm_connector *connector = data;
+	const struct drm_connector_hdmi_audio_funcs *funcs =
+		connector->hdmi_audio.funcs;
+
+	if (funcs->startup)
+		return funcs->startup(connector);
+
+	return 0;
+}
+
+static int drm_connector_hdmi_audio_prepare(struct device *dev, void *data,
+					    struct hdmi_codec_daifmt *fmt,
+					    struct hdmi_codec_params *hparms)
+{
+	struct drm_connector *connector = data;
+	const struct drm_connector_hdmi_audio_funcs *funcs =
+		connector->hdmi_audio.funcs;
+
+	return funcs->prepare(connector, fmt, hparms);
+}
+
+static void drm_connector_hdmi_audio_shutdown(struct device *dev, void *data)
+{
+	struct drm_connector *connector = data;
+	const struct drm_connector_hdmi_audio_funcs *funcs =
+		connector->hdmi_audio.funcs;
+
+	return funcs->shutdown(connector);
+}
+
+static int drm_connector_hdmi_audio_mute_stream(struct device *dev, void *data,
+						bool enable, int direction)
+{
+	struct drm_connector *connector = data;
+	const struct drm_connector_hdmi_audio_funcs *funcs =
+		connector->hdmi_audio.funcs;
+
+	if (funcs->mute_stream)
+		return funcs->mute_stream(connector, enable, direction);
+
+	return -ENOTSUPP;
+}
+
+static int drm_connector_hdmi_audio_get_dai_id(struct snd_soc_component *comment,
+					       struct device_node *endpoint,
+					       void *data)
+{
+	struct drm_connector *connector = data;
+	struct of_endpoint of_ep;
+	int ret;
+
+	if (connector->hdmi_audio.dai_port < 0)
+		return -ENOTSUPP;
+
+	ret = of_graph_parse_endpoint(endpoint, &of_ep);
+	if (ret < 0)
+		return ret;
+
+	if (of_ep.port == connector->hdmi_audio.dai_port)
+		return 0;
+
+	return -EINVAL;
+}
+
+static int drm_connector_hdmi_audio_get_eld(struct device *dev, void *data,
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
+static int drm_connector_hdmi_audio_hook_plugged_cb(struct device *dev,
+						    void *data,
+						    hdmi_codec_plugged_cb fn,
+						    struct device *codec_dev)
+{
+	struct drm_connector *connector = data;
+
+	mutex_lock(&connector->hdmi_audio.lock);
+
+	connector->hdmi_audio.plugged_cb = fn;
+	connector->hdmi_audio.plugged_cb_dev = codec_dev;
+
+	fn(codec_dev, connector->hdmi_audio.last_state);
+
+	mutex_unlock(&connector->hdmi_audio.lock);
+
+	return 0;
+}
+
+void drm_connector_hdmi_audio_plugged_notify(struct drm_connector *connector,
+					     bool plugged)
+{
+	mutex_lock(&connector->hdmi_audio.lock);
+
+	connector->hdmi_audio.last_state = plugged;
+
+	if (connector->hdmi_audio.plugged_cb &&
+	    connector->hdmi_audio.plugged_cb_dev)
+		connector->hdmi_audio.plugged_cb(connector->hdmi_audio.plugged_cb_dev,
+						 connector->hdmi_audio.last_state);
+
+	mutex_unlock(&connector->hdmi_audio.lock);
+}
+EXPORT_SYMBOL(drm_connector_hdmi_audio_plugged_notify);
+
+static const struct hdmi_codec_ops drm_connector_hdmi_audio_ops = {
+	.audio_startup = drm_connector_hdmi_audio_startup,
+	.prepare = drm_connector_hdmi_audio_prepare,
+	.audio_shutdown = drm_connector_hdmi_audio_shutdown,
+	.mute_stream = drm_connector_hdmi_audio_mute_stream,
+	.get_eld = drm_connector_hdmi_audio_get_eld,
+	.get_dai_id = drm_connector_hdmi_audio_get_dai_id,
+	.hook_plugged_cb = drm_connector_hdmi_audio_hook_plugged_cb,
+};
+
+/**
+ * drm_connector_hdmi_audio_init - Initialize HDMI Codec device for the DRM connector
+ * @connector: A pointer to the connector to allocate codec for
+ * @hdmi_codec_dev: device to be used as a parent for the HDMI Codec
+ * @funcs: callbacks for this HDMI Codec
+ * @max_i2s_playback_channels: maximum number of playback I2S channels
+ * @spdif_playback: set if HDMI codec has S/PDIF playback port
+ * @dai_port: sound DAI port, -1 if it is not enabled
+ *
+ * Create a HDMI codec device to be used with the specified connector.
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int drm_connector_hdmi_audio_init(struct drm_connector *connector,
+				  struct device *hdmi_codec_dev,
+				  const struct drm_connector_hdmi_audio_funcs *funcs,
+				  unsigned int max_i2s_playback_channels,
+				  bool spdif_playback,
+				  int dai_port)
+{
+	struct hdmi_codec_pdata codec_pdata = {
+		.ops = &drm_connector_hdmi_audio_ops,
+		.max_i2s_channels = max_i2s_playback_channels,
+		.i2s = !!max_i2s_playback_channels,
+		.spdif = spdif_playback,
+		.no_i2s_capture = true,
+		.no_spdif_capture = true,
+		.data = connector,
+	};
+	struct platform_device *pdev;
+
+	if (!funcs ||
+	    !funcs->prepare ||
+	    !funcs->shutdown)
+		return -EINVAL;
+
+	connector->hdmi_audio.funcs = funcs;
+	connector->hdmi_audio.dai_port = dai_port;
+
+	pdev = platform_device_register_data(hdmi_codec_dev,
+					     HDMI_CODEC_DRV_NAME,
+					     PLATFORM_DEVID_AUTO,
+					     &codec_pdata, sizeof(codec_pdata));
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
+
+	connector->hdmi_audio.codec_pdev = pdev;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_connector_hdmi_audio_init);
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index ae6e71305f3000aff1cfe96b050061a300b9478e..1383fa9fff9bcf31488453e209a36c6fe97be2f1 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -33,6 +33,7 @@
 #include <drm/drm_sysfs.h>
 #include <drm/drm_utils.h>
 
+#include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/uaccess.h>
 
@@ -281,6 +282,7 @@ static int drm_connector_init_only(struct drm_device *dev,
 	mutex_init(&connector->eld_mutex);
 	mutex_init(&connector->edid_override_mutex);
 	mutex_init(&connector->hdmi.infoframes.lock);
+	mutex_init(&connector->hdmi_audio.lock);
 	connector->edid_blob_ptr = NULL;
 	connector->epoch_counter = 0;
 	connector->tile_blob_ptr = NULL;
@@ -714,6 +716,8 @@ void drm_connector_cleanup(struct drm_connector *connector)
 		    DRM_CONNECTOR_REGISTERED))
 		drm_connector_unregister(connector);
 
+	platform_device_unregister(connector->hdmi_audio.codec_pdev);
+
 	if (connector->privacy_screen) {
 		drm_privacy_screen_put(connector->privacy_screen);
 		connector->privacy_screen = NULL;
@@ -750,6 +754,7 @@ void drm_connector_cleanup(struct drm_connector *connector)
 		connector->funcs->atomic_destroy_state(connector,
 						       connector->state);
 
+	mutex_destroy(&connector->hdmi_audio.lock);
 	mutex_destroy(&connector->hdmi.infoframes.lock);
 	mutex_destroy(&connector->mutex);
 
diff --git a/include/drm/display/drm_hdmi_audio_helper.h b/include/drm/display/drm_hdmi_audio_helper.h
new file mode 100644
index 0000000000000000000000000000000000000000..c9a6faef4109f20ba79b610a9d5e8d5980efe2d1
--- /dev/null
+++ b/include/drm/display/drm_hdmi_audio_helper.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef DRM_DISPLAY_HDMI_AUDIO_HELPER_H_
+#define DRM_DISPLAY_HDMI_AUDIO_HELPER_H_
+
+#include <linux/types.h>
+
+struct drm_connector;
+struct drm_connector_hdmi_audio_funcs;
+
+struct device;
+
+int drm_connector_hdmi_audio_init(struct drm_connector *connector,
+				  struct device *hdmi_codec_dev,
+				  const struct drm_connector_hdmi_audio_funcs *funcs,
+				  unsigned int max_i2s_playback_channels,
+				  bool spdif_playback,
+				  int sound_dai_port);
+void drm_connector_hdmi_audio_plugged_notify(struct drm_connector *connector,
+					     bool plugged);
+
+#endif
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index d1be19242a5c5d7ab6b38cced1da336830b3848d..1d4c27948e8750191e7daf8ff6cda97d944905b4 100644
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
@@ -1141,6 +1143,53 @@ struct drm_connector_state {
 	struct drm_connector_hdmi_state hdmi;
 };
 
+struct drm_connector_hdmi_audio_funcs {
+	/**
+	 * @startup:
+	 *
+	 * Called when ASoC starts an audio stream setup. The
+	 * @startup() is optional.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise
+	 */
+	int (*startup)(struct drm_connector *connector);
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
+
+	/**
+	 * @shutdown:
+	 *
+	 * Shut down the audio stream. Mandatory.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise
+	 */
+	void (*shutdown)(struct drm_connector *connector);
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
@@ -1660,6 +1709,68 @@ struct drm_cmdline_mode {
 	bool tv_mode_specified;
 };
 
+/**
+ * struct drm_connector_hdmi_audio - DRM gemeric HDMI Codec-related structure
+ *
+ * HDMI drivers usually incorporate a HDMI Codec. This structure expresses the
+ * generic HDMI Codec as used by the DRM HDMI Codec framework.
+ */
+struct drm_connector_hdmi_audio {
+	/**
+	 * @funcs:
+	 *
+	 * Implementation of the HDMI codec functionality to be used by the DRM
+	 * HDMI Codec framework.
+	 */
+	const struct drm_connector_hdmi_audio_funcs *funcs;
+
+	/**
+	 * @codec_pdev:
+	 *
+	 * Platform device created to hold the HDMI Codec. It will be
+	 * automatically unregistered during drm_connector_cleanup().
+	 */
+	struct platform_device *codec_pdev;
+
+	/**
+	 * @lock:
+	 *
+	 * Mutex to protect @last_state, @plugged_cb and @plugged_cb_dev.
+	 */
+	struct mutex lock;
+
+	/**
+	 * @plugged_cb:
+	 *
+	 * Callback to be called when the HDMI sink get plugged to or unplugged
+	 * from this connector. This is assigned by the framework when
+	 * requested by the ASoC code.
+	 */
+	void (*plugged_cb)(struct device *dev, bool plugged);
+
+	/**
+	 * @plugged_cb_dev:
+	 *
+	 * The data for @plugged_cb(). It is being provided by the ASoC.
+	 */
+	struct device *plugged_cb_dev;
+
+	/**
+	 * @last_state:
+	 *
+	 * Last plugged state recored by the framework. It is used to correctly
+	 * report the state to @plugged_cb().
+	 */
+	bool last_state;
+
+	/**
+	 * @dai_port:
+	 *
+	 * The port in DT that is used for the Codec DAI.
+	 */
+	int dai_port;
+};
+
 /*
  * struct drm_connector_hdmi - DRM Connector HDMI-related structure
  */
@@ -2121,6 +2232,11 @@ struct drm_connector {
 	 * @hdmi: HDMI-related variable and properties.
 	 */
 	struct drm_connector_hdmi hdmi;
+
+	/**
+	 * @hdmi_audio: HDMI codec properties and non-DRM state.
+	 */
+	struct drm_connector_hdmi_audio hdmi_audio;
 };
 
 #define obj_to_connector(x) container_of(x, struct drm_connector, base)

-- 
2.39.5


