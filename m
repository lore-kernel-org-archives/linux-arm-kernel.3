Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A11E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 01:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OeQhWMbiAj36NmxvAZBRKZHGBYgaRTeLUPD3AdVnWOM=; b=lCuYd1h4mD7wkI5kmzerPfG9GA
	BNMrwT85ZXky8aM4V2g6kVdl9SeAB5UeB5nb/THtQgO4UvLW/iTRwBdmTsSf6N2ObWYkdZvnC8Mhl
	nC9YK+fU1p6Yg/2lMwVIxmCYT0yDzFVtfsqSyyapADz86+/Cez7yNIHslN/wJybWIzTKntDkxGwuw
	oXUW5NXY71Z55olttLhB4vxpCzwndOeGoxE5SaLrr3wsfb5AXILX6FVFUOjxuatlEDUlKvrO3KZs4
	xaZKtJsHCLBsPQ7khIdK1dOHPgCxx+Tv36PZ6Tk2ZLn5EyvioHSH/gkSdZR75KOny28I+Sit8zIBc
	H376d4yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPu73-0000000B2XQ-33DI;
	Tue, 24 Dec 2024 01:53:33 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPu1l-0000000B1Nn-0Bak
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 01:48:06 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-540215984f0so4966587e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Dec 2024 17:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735004883; x=1735609683; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OeQhWMbiAj36NmxvAZBRKZHGBYgaRTeLUPD3AdVnWOM=;
        b=FEf/BtNSAfBRNVOOBXVaznFTOud6/CC5raV1qt866V7rJEuP8MiNRKLkPKSIdAxG5+
         vIzZAQkA+eVJzi+MpDrQm/iXEqYlZPFZVJLSwzpoJrx4x0pgPJRHVTyWlwtZz+Oyz3Gh
         h0X2SaSPqR1gqhtanD7bvTDNBs3pXV4hIQgm0FvQlBUGvabRVdHz2ABWI1VXOznP0Lv7
         ZT6CukSl4/jiQd4VZcm42j43t/wgXd7nD4bpz1J7EAHM3IjgogI2ZwlMwBGl8pnxfU2T
         wnR+5ZbGWr3w6dFFch6+Bpn1itdcDrTKAHGNXVfxEDwlWjQb6FAX4339KCJLOswUrjbv
         RqdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735004883; x=1735609683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OeQhWMbiAj36NmxvAZBRKZHGBYgaRTeLUPD3AdVnWOM=;
        b=Mlw8GIk1IhgpKt5CiE4levxw/FE6T8NfHSy12Odxa6qCuz+kS3/t7I63RBmyXPS4Bf
         dDDnaHLD1S7VGJz6isqItu3GJaX+GcuGDDK3CLMXTvLG0/PqMLafOi0my75KwPub0qIa
         wbQCd/awKX/zLxL+8Hk+X0HKV2qrh3jWhHuC4qilEtnltjyJqY3uFT2a9FnCGDMBFFQV
         NOzL5f0TP6tkBuWC4Icg0qTpwhI7DJDLPEDSFz/jn9lhUQrTc+3WH7eKlzQoShPoMynD
         bY8lv98yBOggVqKYU+XQa1Jl/nlM7ECtNlsLVP1QK94IbOZIN4u1mis6SnPoaZr6TT/8
         6rsw==
X-Forwarded-Encrypted: i=1; AJvYcCWENfQJdcwWWJxnFOM4AiOfVTCkcKGwtfGbkBrxJK3qxFZu5t4lYspsTHJEs0xgNiIu4ykYuVOnDEDvOcmJh1CD@lists.infradead.org
X-Gm-Message-State: AOJu0YwwuztCnnlM7JFRp0hngTgE5vQrFkqkE87Oo8t0AiEUmkDKiTZx
	VgKJIfp5hc65MFBQIpMq8s0wwZRBBw/Zsyn5LahAIkd0CGgQQ78QKmVU7bAzvLQ=
X-Gm-Gg: ASbGncuRtPFCBDQ9dt0s7sRsCaWRrIHYuhItV7YfTSDhcXlXtZPuIiviEL8NndjsEbC
	SRsImVQf3p8k2Wfw632DnyVC63t+hrhSl7nfW31rPMf1E6lYgtxilNbphgcfsOAEm6I9Eo6/0oH
	Pd7qPN2w4TcuWjhlzZN84UA2dNu67SOiwJ1H4USIWiaKS+4E0gmlr3bInWJNMwrbdxFJnzfAQnd
	rL2TkzsEwvGSxoI1HXzWRmrH4zuMNpsffzesW4PIWNvqhpiSfdtsmgTmCeyuw68
X-Google-Smtp-Source: AGHT+IGR24jHtPGUxfsKfO/45jWIvv5b6slQCVDAD8hWAJgGtxOK0toEZZdVCC30B+1NpY/lWq3Jzw==
X-Received: by 2002:a05:6512:438b:b0:542:2999:2e43 with SMTP id 2adb3069b0e04-54229992e47mr5455384e87.24.1735004883561;
        Mon, 23 Dec 2024 17:48:03 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f6509sm1425988e87.25.2024.12.23.17.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 17:48:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Dec 2024 03:47:53 +0200
Subject: [PATCH v10 01/10] ASoC: hdmi-codec: pass data to get_dai_id too
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-drm-bridge-hdmi-connector-v10-1-dc89577cd438@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5752;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=WPV59zPnUnkkJ7Uz4UuxqKnfbTp+vJqvD7wMF0GDGF8=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ3qW0JmIvaf0ZJx9gzznxy9gDxA3VXfasl5yX77W5B6nE
 7qP0906GY1ZGBi5GGTFFFl8ClqmxmxKDvuwY2o9zCBWJpApDFycAjCRsiXs/wPfhnxjupUgOUFt
 W+sWRunGC8KpKity2J0EPYMU5gi56b76Vs8UFdcjpS5/r3HSqrstFdcm5DMt65/7ITx+1pFZz/P
 SeSWyT7EHPU6IPvOgQetwQ+P39IXi9iaLw/L2HZr4cpd7KbvUu1eTZkzITVzi/PqGsGZZ54O8vG
 knuO8xzNRRVtl2a5vSylumF9kXCVYxmovlcqRGXDOPmcJ+6adIvLOq0NzwZ2aynxbbHC0vdDYO+
 GD55fb3jgqpRz4aIZ11fxXurBN6bb3cdn0Y013TSrbyiKyaHR+nTlT7l7bW/+r2yqPxgvM3nc6Y
 uGV6zRU975TCD+w/GAoitCYGrdq1YyZ3wswry9O9bN0lAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_174805_119266_43387CC1 
X-CRM114-Status: GOOD (  14.54  )
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

The upcoming DRM connector HDMI codec implementation is going to use
codec-specific data in the .get_dai_id to get drm_connector. Pass data
to the callback, as it is done with other hdmi_codec_ops callbacks.

Acked-by: Mark Brown <broonie@kernel.org>
Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c      | 3 ++-
 drivers/gpu/drm/bridge/analogix/anx7625.c           | 3 ++-
 drivers/gpu/drm/bridge/lontium-lt9611.c             | 3 ++-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c          | 3 ++-
 drivers/gpu/drm/bridge/sii902x.c                    | 3 ++-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c | 3 ++-
 include/sound/hdmi-codec.h                          | 3 ++-
 sound/soc/codecs/hdmi-codec.c                       | 2 +-
 8 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
index 61f4a38e7d2bf6905683cbc9e762b28ecc999d05..51fb9a574b4e28450b2598a92e2930ace5128b71 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
@@ -204,7 +204,8 @@ static void audio_shutdown(struct device *dev, void *data)
 }
 
 static int adv7511_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
-					struct device_node *endpoint)
+					struct device_node *endpoint,
+					void *data)
 {
 	struct of_endpoint of_ep;
 	int ret;
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 6c409f4f17788d92bf2044238ca3b9aff09c6de9..4be34d5c7a3b8295f6b4593b3734ec8131bb3a4a 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1952,7 +1952,8 @@ static void anx7625_audio_shutdown(struct device *dev, void *data)
 }
 
 static int anx7625_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
-				       struct device_node *endpoint)
+				       struct device_node *endpoint,
+				       void *data)
 {
 	struct of_endpoint of_ep;
 	int ret;
diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 74f726efc74613460a6eb9c41f0bbad2ab06208f..698a9a01783d28edc734b6932a7768978de65ffc 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -1057,7 +1057,8 @@ static void lt9611_audio_shutdown(struct device *dev, void *data)
 }
 
 static int lt9611_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
-				      struct device_node *endpoint)
+				      struct device_node *endpoint,
+				      void *data)
 {
 	struct of_endpoint of_ep;
 	int ret;
diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index db9a5466060b663e88d58e85f24bf2d58d74a81c..f4c3ff1fdc6923eb7a8c0d8f7f92e7649c797d77 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -522,7 +522,8 @@ static void lt9611uxc_audio_shutdown(struct device *dev, void *data)
 }
 
 static int lt9611uxc_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
-					 struct device_node *endpoint)
+					 struct device_node *endpoint,
+					 void *data)
 {
 	struct of_endpoint of_ep;
 	int ret;
diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index 127da22011b3235b049c38413e56d50414cf36fb..a02d30c0ba4221d7fee0eb50892ab4d8e8436004 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -815,7 +815,8 @@ static int sii902x_audio_get_eld(struct device *dev, void *data,
 }
 
 static int sii902x_audio_get_dai_id(struct snd_soc_component *component,
-				    struct device_node *endpoint)
+				    struct device_node *endpoint,
+				    void *data)
 {
 	struct of_endpoint of_ep;
 	int ret;
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
index f1c5a8d0fa90e2eb2ee488b6a5871b005f797ea1..2c903c9fe8052ab721445188fd2b75270a55f2b0 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
@@ -148,7 +148,8 @@ static int dw_hdmi_i2s_get_eld(struct device *dev, void *data, uint8_t *buf,
 }
 
 static int dw_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
-				  struct device_node *endpoint)
+				  struct device_node *endpoint,
+				  void *data)
 {
 	struct of_endpoint of_ep;
 	int ret;
diff --git a/include/sound/hdmi-codec.h b/include/sound/hdmi-codec.h
index 5e1a9eafd10f5d4f831abbb6f4c0fff661909584..b3407b47b4a7878532ecf3b08eeecd443d6fdb07 100644
--- a/include/sound/hdmi-codec.h
+++ b/include/sound/hdmi-codec.h
@@ -105,7 +105,8 @@ struct hdmi_codec_ops {
 	 * Optional
 	 */
 	int (*get_dai_id)(struct snd_soc_component *comment,
-			  struct device_node *endpoint);
+			  struct device_node *endpoint,
+			  void *data);
 
 	/*
 	 * Hook callback function to handle connector plug event.
diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index d9df29a26f4f213a30a2ebcdb63a593f9cf4b901..f536ca60e162dca6b50b37854ca6de2c114bc2a1 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -995,7 +995,7 @@ static int hdmi_of_xlate_dai_id(struct snd_soc_component *component,
 	int ret = -ENOTSUPP; /* see snd_soc_get_dai_id() */
 
 	if (hcp->hcd.ops->get_dai_id)
-		ret = hcp->hcd.ops->get_dai_id(component, endpoint);
+		ret = hcp->hcd.ops->get_dai_id(component, endpoint, hcp->hcd.data);
 
 	return ret;
 }

-- 
2.39.5


