Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58492E6B243
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 10:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y44vew0lj4dDVronue+t+sjWiE6RZ4LKCNRar5uNqMk=; b=XJIFdSR7MbqTh4tv7lA3+RgLoS
	ofrPCBmnLgoP4Nv5QkxESrZn39kLZLt59OxS8LOxKBB+GIB518nv6p6WCKrfKO95Eh7vNGOceM6L0
	g8s2cSinkCRDmDLUSIo+nKM+Lq5lPiJHOa8IvivZ19w9hkGtXLCTEREmSlJDy9joiqfMfuj1OGORe
	EO9nOxWxzyorxidr+HioJ0Lkvylbtp7+tMoifVpJjepLUai3XUTsSJkEOQK2aEvNb77iii0+iinBO
	qCIWVlWOn2sTsFv7rQF0MkvDkDT7n1Otcu4DkJvxC3rpolUMxnK7IJoWlwqu6b5yk/9EISAT5DgNc
	IOcs0FbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6otj-00000006ZrS-4481;
	Fri, 01 Nov 2024 10:28:56 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6okK-00000006Xsz-3Dpr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 10:19:15 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-539fe76e802so2306467e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 03:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730456351; x=1731061151; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y44vew0lj4dDVronue+t+sjWiE6RZ4LKCNRar5uNqMk=;
        b=efmD/mcYKCFkinlS17lnYAceel7vhN8midtM4DvJzx/0gL0faxqTcyg1SZ2MCUQQMQ
         8wZruRVoe20P3CI61dVZcvLDBQvtMYN3AaYfOxuARhiuAJFDQOdkdSBywCb7xwJ6bPqF
         6mgfDPfhk9QEBvUf1PxgsLAyFrfjW5CkcB9lxaczSN7m1GPlg42lcEvWaTKQAM4xoFlK
         X8KZQI865/gc2ltOf+T3c2q+BtVhNLV3OYD5zGuwU+FgxO49mVK56b+68WKVnKmKNZYY
         URAnJQJLjSrTqhy2LzsNITvwLvS7VVjUSdm2hXe7ylJ/3IPXsdY07UsDWFPEe5ElMRiM
         972A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730456351; x=1731061151;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y44vew0lj4dDVronue+t+sjWiE6RZ4LKCNRar5uNqMk=;
        b=uBbEuOrCGo6XsSlPUr3QCObBm6Avj613KPQo1JTKBi4D+Iw+r8r5gtTLh+moKdbOl3
         Xkb0BjdczpevICOGK7kP4fCZfz9si1MN6tQwl6/FGIVGBHaGM0dSHeleRLDNXSF/bEym
         C3IyHDmueoE+cVmXcO/+hrUGMKy7zLoBge8sb52nxoZfPM1lKsoYda9irqS+D9Bswjkm
         USRqq5k2A5E0CHmPx0Kxzw9xD7KU3soQ7HwUbP/56vs7T9QSyCDpveSzQaY7j0sCHNsJ
         vjou/XPCu9ZeeY9likMj7cq0Gj0ed38vOwlRWOcs7ev0tZSzxYFokoXW1YMjmN177air
         lvLg==
X-Forwarded-Encrypted: i=1; AJvYcCWcT78G10l6gbIVAtcVhDHz0P/C+7HrSzSU7WBQ2v7At7e9ER5VG13eDZx8zBt/W5iQc9brGimOeK4G37wmZmYe@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4inFyvgEcZS3AKoqA077eNkZHHHAOpuyQLyVkvxT9X3iRs7uE
	dIervlYcKG4bXZ7+LgrIyvdbG44DZsfpTGdNH1CqL5j27GbGWaoeO+PHPcpK+LY=
X-Google-Smtp-Source: AGHT+IHqy42HrMmfsAoD9Rv6pzGinIsSBQMCWOUdnXOEzuHFeER7Llx6M5+DAeAPb/oiSa0Hwraosw==
X-Received: by 2002:a2e:be08:0:b0:2f7:4cf1:d6b1 with SMTP id 38308e7fff4ca-2fedb75732emr15286261fa.1.1730456350704;
        Fri, 01 Nov 2024 03:19:10 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fdef5d6ef4sm5197031fa.48.2024.11.01.03.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 03:19:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 01 Nov 2024 12:19:02 +0200
Subject: [PATCH RFC v2 1/7] ASoC: hdmi-codec: pass data to get_dai_id too
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241101-drm-bridge-hdmi-connector-v2-1-739ef9addf9e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5692;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=+Hp57m3QXnAn1W+61x8ZbDF7cVDM8XAonWljrtUU0rg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnJKsYXAj2mgrhv3yXCjx+Fl/iGYql1ibKHLUhn
 CRF/wuhKX6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZySrGAAKCRCLPIo+Aiko
 1WD4B/0ZOGZhKgVf+9tcVen34B2OCb9RNi3K6MkkJLmmn4+uYvDglIyaOT7d+Puied7BTs+e2dw
 6dxCPRD5BjVBLOsd+b8i865IYpn0C8OCvPhmfmj7hoECadys0iuRwaPHcVJZ4PbBm73/2dH6x9e
 gSIc63LA2/KreNsjtsWX2yv39bJtL/wL/Nqh0JJ6ExMH1jQWOi6f177CBPWEpyGBRKunt5EUgOQ
 VHZeVTWouIKVTX6SkhOsjMgeqBmzPfyDcQ3yVsMl/0NRC1KcNHcwEvjXvjvBmSzJatxjQieZuB8
 L99EW/RFmr7HZt0vNlJBh/YyN2QFGhoLBjWnpbU19Y7dz7QT
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_031913_335124_2B709112 
X-CRM114-Status: GOOD (  15.69  )
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
index a2675b121fe44b96945f34215fd900f35bfde43a..926437346b6c9a651d495faf25162cac7407d30d 100644
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
index 1b31fdebe164063e6f3972fdf8a5801ef4c35c4e..4fa0dfc5539a5786278221f7c13b6473ab320a9a 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -1059,7 +1059,8 @@ static void lt9611_audio_shutdown(struct device *dev, void *data)
 }
 
 static int lt9611_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
-				      struct device_node *endpoint)
+				      struct device_node *endpoint,
+				      void *data)
 {
 	struct of_endpoint of_ep;
 	int ret;
diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 4d1d40e1f1b4d144f4aa9de7b83bedf13dfa4436..fd26aa36b15b8c0d3859f7ef488a87573eea8507 100644
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
index 9be9cc5b902594ebe6e1ac29ab8684623e336796..f0be803cc2274ca2199ed7661cf752b0a91434b6 100644
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
index 26c187d20d973dc65801a3baa59ecf57d20072eb..86c412e9cbc80bb82bad5db3aa0263a7acd9c2d7 100644
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
index 74caae52e1273fda45ab8dd079ae800827f0231f..abd7c9b0fda9ee6fa6c4efde1f583af667716611 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -981,7 +981,7 @@ static int hdmi_of_xlate_dai_id(struct snd_soc_component *component,
 	int ret = -ENOTSUPP; /* see snd_soc_get_dai_id() */
 
 	if (hcp->hcd.ops->get_dai_id)
-		ret = hcp->hcd.ops->get_dai_id(component, endpoint);
+		ret = hcp->hcd.ops->get_dai_id(component, endpoint, hcp->hcd.data);
 
 	return ret;
 }

-- 
2.39.5


