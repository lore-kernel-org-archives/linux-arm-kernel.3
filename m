Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B77D5E368
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 13:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qRQHcGUBlI3li/BhfVDTF9PQra92/P564gQBC06zyyA=; b=2Nq/lzVnWU8HMAdXdXITqm4nBA
	OCikyyMU79cPLTSsfczJwhAGXpXOmBWdFFswP3Vb3D/qzTtwQzt8P6GKCDDgs7hWiJoDo3UpEHbdN
	bitpqezGOlO2h2rl/HMd90wDEMFTmy0zxS8IZ49IhT9yB64Zu1aVTl+UlvqG7/5Im76zXyBm+e+nt
	Dw8ogGdNqsc0E5XEiZPAfdJPFKAn+8gOsD5t9fKK+1nmBldnJZBQ/FUBHUlPeWetdMYp7JCDNRZ6e
	PAONZPuth7T1l0ZI4mXfmdtGckj1/vZQykj9XSZjhE6TsiPZfYYOLgwMQvvMt6zLag+KwD5ZqhB/g
	bz4RohQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9l8Q-0000000DMxA-2pMT;
	Sat, 09 Nov 2024 13:04:14 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9ktL-0000000DL1l-2k4o
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 12:48:41 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-539fb49c64aso4809645e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 Nov 2024 04:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731156518; x=1731761318; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qRQHcGUBlI3li/BhfVDTF9PQra92/P564gQBC06zyyA=;
        b=BW7GmzVtKxFVSBvS85AnOwIdRLN9DirWgzvrwhb1o5q1urpgZu6jILpEy0+K2B1Cfp
         P8F/t1MyZUfZdQFtOIj2wY+PTVhNPYiIoYmPGRR84XCE1J8QtnwECEunQilKvWRktkD5
         8xmkzRp2WOfytxJ9zMqICpyKACptdp0zKIn+BQINK0FKf32xujiaRdjN8bJBzdK/xhad
         24c6omGKb0eNJuiu5tM7GTTgftoqIEcgebIacnkEPPUvatfdSzVSQ0mW8ViFl4twU95G
         ATwP8m/DKhxQHsIZHD3P5NMAD4s/FZUwlEatg0/l3xRzkoa5b2VpSnkiVx9H4Ye1eMFL
         /cJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731156518; x=1731761318;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qRQHcGUBlI3li/BhfVDTF9PQra92/P564gQBC06zyyA=;
        b=GYcbwUTho1ws+49qGrzrQ76yPB2vnVrCSmmd3dkS95PqT0yT2nsmhXgtIVxV31bFJV
         v5Yy8khY8rcPMo5kxEGsh6+8bgJjmeYQHzlsxZzkBa+dzm2jTCYNG0B4LRWb/2XA3RiY
         lo57sQJ9oRQ1jEjI33p3x9YQekCJngd12ITtbyc4qqD/XmTOVk6175+tT4Q07/d8O/Hq
         dYTkxkVcwBv2nsf7Bx/zqa4DYzv0Ohh+K3vbgVBNGTpQMatA6Ny4YIDPt7v4KuD3xPeC
         BTQqDcIyktVlI5okHYKMXBxEk2uvZ0+SNkzqwCKP119YjvEc69mtlL2rR4mnx1cqx07L
         8diw==
X-Forwarded-Encrypted: i=1; AJvYcCVhO+ToD49R7l+DD7dwOTwhqTe0fo3O+50AWN15DXBQwZWjwWBulXwprmSNabG/bSts/6iToPs6vAu4Flpm8dp8@lists.infradead.org
X-Gm-Message-State: AOJu0YxUFon75CwxH4tBvQ5ksVojDhLN6PgDmk1KYyKuc3VDawbnCR2c
	hzpK8HBvuBeemo3oSmXzXXyPx+s+Z5gj7+9A3pemHJDQzhBuiQzAVGyhHQXC/KY=
X-Google-Smtp-Source: AGHT+IHLcGsVW00+hhxOHllgWhNtSwyLF9SB9AVtjN83/6O7FIOmdAZojYpEQiwQq36gyNNZUBjGxQ==
X-Received: by 2002:a05:6512:b1e:b0:53b:7ecc:5ddf with SMTP id 2adb3069b0e04-53d862cd080mr4596291e87.26.1731156518004;
        Sat, 09 Nov 2024 04:48:38 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826a9b76sm929967e87.172.2024.11.09.04.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2024 04:48:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 09 Nov 2024 14:48:28 +0200
Subject: [PATCH v3 2/7] ASoC: hdmi-codec: move no_capture_mute to struct
 hdmi_codec_pdata
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241109-drm-bridge-hdmi-connector-v3-2-c15afdca5884@linaro.org>
References: <20241109-drm-bridge-hdmi-connector-v3-0-c15afdca5884@linaro.org>
In-Reply-To: <20241109-drm-bridge-hdmi-connector-v3-0-c15afdca5884@linaro.org>
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
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8709;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=4RHDtStQsuP3XnEfIXAZ9dpuNg8g6Z0G2md3CVvXL7o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnL1odbv/gTHbC6rcjfvcQH8H951fFW0RC4y2BN
 4V4P30twe6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZy9aHQAKCRCLPIo+Aiko
 1VtGCACYb60Ptvu4nX4BvQoQSfARB5aEJKiKMDEbTPPiXxEz2UQ3bXuizyl1aKjiPaL0W7JIng+
 2yX424uoaz6wsiS94AZZ2GUD97n7f1QsWV28luVmp7yyBRupKIcvdx4DSX5Z5lgGFWD851/CnFL
 /k9ZLS2XPfe7B3F2adbK3jOkPDghwyEkM/DPZwVgUZNR81xSaWhVom3znhJHJl0b2Dic7pqF4HE
 dHyW9nSKXnqZclhqnln0VKmAaLmmKEM3cfTZ++XFbNtAJb8BCKtfBShkUFU0Lgj946a2p+MvXb5
 mylKYO+vsSaaI+rCcG/Yn3Duj89gCl6xmwk270ygtKvpOpMK
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_044839_892824_397B37B1 
X-CRM114-Status: GOOD (  16.67  )
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

The no_capture_mute flag might differ from platform to platform,
especially in the case of the wrapping implementations, like the
upcoming DRM HDMI Codec framework. Move the flag next to all other flags
in struct hdmi_codec_pdata.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/ite-it66121.c   | 2 +-
 drivers/gpu/drm/bridge/sii902x.c       | 2 +-
 drivers/gpu/drm/exynos/exynos_hdmi.c   | 2 +-
 drivers/gpu/drm/i2c/tda998x_drv.c      | 2 +-
 drivers/gpu/drm/mediatek/mtk_dp.c      | 2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c    | 2 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c | 2 +-
 drivers/gpu/drm/sti/sti_hdmi.c         | 2 +-
 include/sound/hdmi-codec.h             | 4 +---
 sound/soc/codecs/hdmi-codec.c          | 2 +-
 10 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 35ae3f0e8f51f768229e055a086b53a419ffcd9f..98669470d1e955fef36bb4592795fed6ca97139c 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -1464,7 +1464,6 @@ static const struct hdmi_codec_ops it66121_audio_codec_ops = {
 	.audio_shutdown = it66121_audio_shutdown,
 	.mute_stream = it66121_audio_mute,
 	.get_eld = it66121_audio_get_eld,
-	.no_capture_mute = 1,
 };
 
 static int it66121_audio_codec_init(struct it66121_ctx *ctx, struct device *dev)
@@ -1474,6 +1473,7 @@ static int it66121_audio_codec_init(struct it66121_ctx *ctx, struct device *dev)
 		.i2s = 1, /* Only i2s support for now */
 		.spdif = 0,
 		.max_i2s_channels = 8,
+		.no_capture_mute = 1,
 	};
 
 	dev_dbg(dev, "%s\n", __func__);
diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index f0be803cc2274ca2199ed7661cf752b0a91434b6..5248676b0036a7e8f2142bd2f099c36efb529471 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -841,7 +841,6 @@ static const struct hdmi_codec_ops sii902x_audio_codec_ops = {
 	.mute_stream = sii902x_audio_mute,
 	.get_eld = sii902x_audio_get_eld,
 	.get_dai_id = sii902x_audio_get_dai_id,
-	.no_capture_mute = 1,
 };
 
 static int sii902x_audio_codec_init(struct sii902x *sii902x,
@@ -864,6 +863,7 @@ static int sii902x_audio_codec_init(struct sii902x *sii902x,
 		.i2s = 1, /* Only i2s support for now. */
 		.spdif = 0,
 		.max_i2s_channels = 0,
+		.no_capture_mute = 1,
 	};
 	u8 lanes[4];
 	int num_lanes, i;
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index c9d4b9146df95bb46cb6bea4849c331616c2b463..2a74396ac846dc34d87fadea700c387d597ba307 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1658,7 +1658,6 @@ static const struct hdmi_codec_ops audio_codec_ops = {
 	.audio_shutdown = hdmi_audio_shutdown,
 	.mute_stream = hdmi_audio_mute,
 	.get_eld = hdmi_audio_get_eld,
-	.no_capture_mute = 1,
 };
 
 static int hdmi_register_audio_device(struct hdmi_context *hdata)
@@ -1667,6 +1666,7 @@ static int hdmi_register_audio_device(struct hdmi_context *hdata)
 		.ops = &audio_codec_ops,
 		.max_i2s_channels = 6,
 		.i2s = 1,
+		.no_capture_mute = 1,
 	};
 
 	hdata->audio.pdev = platform_device_register_data(
diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
index 2160f05bbd16d2346e27365e5549b75ad26fdcb9..10a4195d667ff577183788f8fc7ca806660e2b9c 100644
--- a/drivers/gpu/drm/i2c/tda998x_drv.c
+++ b/drivers/gpu/drm/i2c/tda998x_drv.c
@@ -1165,7 +1165,6 @@ static const struct hdmi_codec_ops audio_codec_ops = {
 	.audio_shutdown = tda998x_audio_shutdown,
 	.mute_stream = tda998x_audio_mute_stream,
 	.get_eld = tda998x_audio_get_eld,
-	.no_capture_mute = 1,
 };
 
 static int tda998x_audio_codec_init(struct tda998x_priv *priv,
@@ -1176,6 +1175,7 @@ static int tda998x_audio_codec_init(struct tda998x_priv *priv,
 		.max_i2s_channels = 2,
 		.no_i2s_capture = 1,
 		.no_spdif_capture = 1,
+		.no_capture_mute = 1,
 	};
 
 	if (priv->audio_port_enable[AUDIO_ROUTE_I2S])
diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 1cc916b164713d71461a0b2ad370032a14604be6..6a42459792ec75692fadb45a75b138fc43cc37a2 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2615,7 +2615,6 @@ static const struct hdmi_codec_ops mtk_dp_audio_codec_ops = {
 	.audio_shutdown = mtk_dp_audio_shutdown,
 	.get_eld = mtk_dp_audio_get_eld,
 	.hook_plugged_cb = mtk_dp_audio_hook_plugged_cb,
-	.no_capture_mute = 1,
 };
 
 static int mtk_dp_register_audio_driver(struct device *dev)
@@ -2626,6 +2625,7 @@ static int mtk_dp_register_audio_driver(struct device *dev)
 		.max_i2s_channels = 8,
 		.i2s = 1,
 		.data = mtk_dp,
+		.no_capture_mute = 1,
 	};
 
 	mtk_dp->audio_pdev = platform_device_register_data(dev,
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 7687f673964ec7df0d76328a43ed76d71b192350..a4b144b3bda8362a6c6c303723c6d3eef9ca338e 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1660,7 +1660,6 @@ static const struct hdmi_codec_ops mtk_hdmi_audio_codec_ops = {
 	.mute_stream = mtk_hdmi_audio_mute,
 	.get_eld = mtk_hdmi_audio_get_eld,
 	.hook_plugged_cb = mtk_hdmi_audio_hook_plugged_cb,
-	.no_capture_mute = 1,
 };
 
 static int mtk_hdmi_register_audio_driver(struct device *dev)
@@ -1671,6 +1670,7 @@ static int mtk_hdmi_register_audio_driver(struct device *dev)
 		.max_i2s_channels = 2,
 		.i2s = 1,
 		.data = hdmi,
+		.no_capture_mute = 1,
 	};
 	struct platform_device *pdev;
 
diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index b04538907f956cbf7732c9177c477951eaa32276..a1229d7fd57104c5c1f31b5b64d66e8249358d52 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -885,7 +885,6 @@ static const struct hdmi_codec_ops audio_codec_ops = {
 	.mute_stream = cdn_dp_audio_mute_stream,
 	.get_eld = cdn_dp_audio_get_eld,
 	.hook_plugged_cb = cdn_dp_audio_hook_plugged_cb,
-	.no_capture_mute = 1,
 };
 
 static int cdn_dp_audio_codec_init(struct cdn_dp_device *dp,
@@ -896,6 +895,7 @@ static int cdn_dp_audio_codec_init(struct cdn_dp_device *dp,
 		.spdif = 1,
 		.ops = &audio_codec_ops,
 		.max_i2s_channels = 8,
+		.no_capture_mute = 1,
 	};
 
 	dp->audio_pdev = platform_device_register_data(
diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
index 847470f747c0efad61c2ebdc3fb3746a7a13a863..dfb8e2887fae10cf3275e8f8427f39279982c5e6 100644
--- a/drivers/gpu/drm/sti/sti_hdmi.c
+++ b/drivers/gpu/drm/sti/sti_hdmi.c
@@ -1235,7 +1235,6 @@ static const struct hdmi_codec_ops audio_codec_ops = {
 	.audio_shutdown = hdmi_audio_shutdown,
 	.mute_stream = hdmi_audio_mute,
 	.get_eld = hdmi_audio_get_eld,
-	.no_capture_mute = 1,
 };
 
 static int sti_hdmi_register_audio_driver(struct device *dev,
@@ -1245,6 +1244,7 @@ static int sti_hdmi_register_audio_driver(struct device *dev,
 		.ops = &audio_codec_ops,
 		.max_i2s_channels = 8,
 		.i2s = 1,
+		.no_capture_mute = 1,
 	};
 
 	DRM_DEBUG_DRIVER("\n");
diff --git a/include/sound/hdmi-codec.h b/include/sound/hdmi-codec.h
index b3407b47b4a7878532ecf3b08eeecd443d6fdb07..b220072cfa1baf503efbe2d530d7e8392dc16603 100644
--- a/include/sound/hdmi-codec.h
+++ b/include/sound/hdmi-codec.h
@@ -115,9 +115,6 @@ struct hdmi_codec_ops {
 	int (*hook_plugged_cb)(struct device *dev, void *data,
 			       hdmi_codec_plugged_cb fn,
 			       struct device *codec_dev);
-
-	/* bit field */
-	unsigned int no_capture_mute:1;
 };
 
 /* HDMI codec initalization data */
@@ -129,6 +126,7 @@ struct hdmi_codec_pdata {
 	uint spdif:1;
 	uint no_spdif_playback:1;
 	uint no_spdif_capture:1;
+	uint no_capture_mute:1;
 	int max_i2s_channels;
 	void *data;
 };
diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index abd7c9b0fda9ee6fa6c4efde1f583af667716611..e8aac8069587785bcd2bd09b5f9e0140304fb8fb 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -700,7 +700,7 @@ static int hdmi_codec_mute(struct snd_soc_dai *dai, int mute, int direction)
 	 */
 	if (hcp->hcd.ops->mute_stream &&
 	    (direction == SNDRV_PCM_STREAM_PLAYBACK ||
-	     !hcp->hcd.ops->no_capture_mute))
+	     !hcp->hcd.no_capture_mute))
 		return hcp->hcd.ops->mute_stream(dai->dev->parent,
 						 hcp->hcd.data,
 						 mute, direction);

-- 
2.39.5


