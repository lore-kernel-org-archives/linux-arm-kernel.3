Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574E2E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 10:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vdhbM8g3M0NP93FMRv6ZaSecbbnwku8p9d6VdNVGSLw=; b=qkSrAS/iEZQCBM1g5Lhd76kq91
	U84phMlqlDAWUajf9hmGQCYzwPYpZSMKAPwQP2vvMTr2SSIl7KZFBo/7N5s2piy5gtVb+1Sn1Ok0b
	9A5Htj1XipNzDWOmzqkOWCwJSMkWOKD5dsW5idULH5P581K8JJPIHkJwTHH8FLWucahoFXdNiIkgM
	47ufSKUKakj05CdrcQvChkgI8bNUhIzbGuFp6RIr+PMGDfy1PsjeLgXmehD1pLGXt+YRumBjNmHOX
	aosT/kW5sfUVR3m0ejqw9hzm/w9BOReW+8YzpJbdr4cNOJy9XMHDq9ro35w8ZyOksocrnR/9RPeMu
	+JJZAuAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJVkJ-00000001KYO-3Sw2;
	Fri, 06 Dec 2024 10:39:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJVOR-00000001ERU-0JtY
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 06 Dec 2024 10:17:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=vdhbM8g3M0NP93FMRv6ZaSecbbnwku8p9d6VdNVGSLw=; b=TleWeXV52ELPcnefhyLqxAHZrd
	sLNJ302rtGGGlwDXNFcS7PcENALvoNHl1GCpbyXOMip6AVvfJN0tc2PkwoUP3XE2vWADliKNwSNwS
	vDVIJMgXoTRilq5gc9n758oXTKcSdJtT20eTIRjbxHoIGpgceLP/oaq8Y5xSWq/g6VI7rYoSul6ee
	4TLcp5h8yLT/zAvuqEPWEmToYe38bjh/Bbqp5ueEhC+4TxPru9YX8heO0uXa5k0+kBcQowwBooDu3
	MK3pnXSb8f1dj52depwiJrhb3IeMczRbCCNAh4BS5PK0bH6X+lewoX0EsUSn6jbT+bZjT9C2W7oML
	s/rnJ9QQ==;
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJVON-00000003377-1L8B
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 10:17:01 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-30037784fceso2571891fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 02:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733480216; x=1734085016; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vdhbM8g3M0NP93FMRv6ZaSecbbnwku8p9d6VdNVGSLw=;
        b=dMAk98v9rKYWszPRYunm6t1M3RtrZrHM8Z3qiMA9S5gUta0JABoZgtFZBrDvGrLDx6
         hUYYbHhSSKzV14xrvPHJEdMQ0f4EaOTZiXDucXHgU4fAhYV9oyp4pCgYwnVnPfROCqlX
         tnsqKoOTTGswqxo3Mrh1h8Yn2K7eZ3eE7xCqCf0Fy0BId7+SpJC4cVwF0MGAMYz48qIz
         LtUXvrYdGKJrCAuiqM9E5XrLZ/k9SBRk/GLMU13/dhgvMQWSwFMWHu9pIqKErSjk3ckO
         qKA1J7KwlgMShWvv8gUJwnp8/XxpFPsf91FHWdFWAt1rLrU2uh+rWT7XuTml32PuMFLs
         tLig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733480216; x=1734085016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vdhbM8g3M0NP93FMRv6ZaSecbbnwku8p9d6VdNVGSLw=;
        b=Ev7i28ogH6nUfeCqig9djYH5M9dUSIYiT+kxrI2TkKGAGV+00ww1wasrSSpTxNyDa2
         LFZR0HOLvI0G+VZGMJbwbV8nHNxxnBDfy4Q835Ygdm2vT/TnwmInWppuRkbsgYdf5+X6
         oVzgPGod23bR8JjgnvAS+aKNfToz60By7VpYQSHNtxx55XPPUizC9XEeY0yexas99iTK
         EUYqVvaUcJaaSIJL0NnFwqtICQdJgXTptGvUzH7BbIg+F+lr9RlV4Co6C9di+t4dJ/DE
         nalyBma5TpZfaXTeHag6VIawcQX0TLSmxcXSjxdAuLR3bPLI01WlvCPilgpyLRrD8cUT
         LfmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMW2fc4Z8Vj+ADaEy+qzp2I42zXW3s9pEDL8hiX33/1S5ncNro2C5TUsfTtyXCm/GPhwr7F4j+Tw9GzlqmB3Jy@lists.infradead.org
X-Gm-Message-State: AOJu0Yxm8Y6q/gFheWc8qzkFUl5jqFICWSoIXn7TACfohkDnAfSqBkph
	V707Efb2I/eyNPIWL5NVUuDbSj2GbYXCx0yeUXTzdDWqbTunRzgs90dApXnPecc=
X-Gm-Gg: ASbGncuPZjTESUMhUu5nPIfBD/vKOPQ4hdHlFhA/l1TsYta/bV3vs7x1sJ5hLKGY5M6
	VWIXVKSeMFimZrFCLjxAcu7h2SII4qDDp5TH3dEOzn6iSfKCTA+HII3yVcsJ7D0UIJbCawWYqjK
	ByxMaPAY50iTK9uCAmNf39Hnkugiu6fRYa7qLMAZ8T8eAWBHRDi/giXWSnHZRb4L67qRExlCC7q
	uw3ASDcVwrLSGkYdpmONP5fYKn6GmcBq/v3Veq15MrEclkfZQ9CoT+U2A==
X-Google-Smtp-Source: AGHT+IHLAMrwNntawycHSzAoyVtOkC7Gtw6N52xdlcAMQPWcfc0l+WCOL0Lh45bakS9i5aF/g9qeYQ==
X-Received: by 2002:a05:6512:1594:b0:53e:284a:70e9 with SMTP id 2adb3069b0e04-53e2c2f0085mr1211346e87.57.1733480215645;
        Fri, 06 Dec 2024 02:16:55 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e2294738fsm462355e87.52.2024.12.06.02.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 02:16:55 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 06 Dec 2024 12:15:59 +0200
Subject: [PATCH v6 05/10] drm/bridge: lt9611: switch to using the DRM HDMI
 codec framework
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-drm-bridge-hdmi-connector-v6-5-50dc145a9c06@linaro.org>
References: <20241206-drm-bridge-hdmi-connector-v6-0-50dc145a9c06@linaro.org>
In-Reply-To: <20241206-drm-bridge-hdmi-connector-v6-0-50dc145a9c06@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7839;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=+67Db5QR/nsja/ue4a+VGF3IOxdNSnDuXouI0gIrYtg=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ3rQeU6JW1urPoTcvv+n0cF5DfM82cKPquzdU2UEp+a8d
 Xf1P5rdyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJvOZg/6d1qv6zrv4+PZEE
 XnYWXQmH3C3vpBjnH3v4oaFKQqV17vf7M6fdfj33n6dt8K/mlGMhuj166gWtkdkBXt3foyT3pE0
 +XbWplHXd7EApkYa+IimTfR1KB9/UiE83Sr7Lpf+hNnhidYbSWVnf/k3zki80N78496XvfxGXxQ
 nvg6aVUxbMlWOoXc682meZS7L3D0HeAl/d7bdktOf5XHerm/9IjXHmzGO3dp5/p3SiNUJRXaP29
 iSFl4fui7s4J4vJLv8md+OMxNJZ79qS2n6e/et2cFaHW2aOBFMkr5cpj7BH5fTjAs89rD55bb4z
 aaq+S7G76c3nMowSK8SWMz1b8tUxpdjxWoH3GvUC1ccMAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_101659_542687_4A7E5570 
X-CRM114-Status: GOOD (  18.04  )
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

Make the Lontium LT9611 DSI-to-HDMI bridge driver use the DRM HDMI Codec
framework. This enables programming of Audio InfoFrames using the HDMI
Connector interface and also enables support for the missing features,
including the ELD retrieval and better hotplug support.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 170 +++++++++++++-------------------
 1 file changed, 68 insertions(+), 102 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 60b7305c0fd1935e35742713c78937392b7faa79..63aa751c412fb90d6edb4b5331138e94f19de37d 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -45,7 +45,6 @@ struct lt9611 {
 	struct device_node *dsi1_node;
 	struct mipi_dsi_device *dsi0;
 	struct mipi_dsi_device *dsi1;
-	struct platform_device *audio_pdev;
 
 	bool ac_mode;
 
@@ -864,6 +863,10 @@ static int lt9611_hdmi_clear_infoframe(struct drm_bridge *bridge,
 	unsigned int mask;
 
 	switch (type) {
+	case HDMI_INFOFRAME_TYPE_AUDIO:
+		mask = LT9611_INFOFRAME_AUDIO;
+		break;
+
 	case HDMI_INFOFRAME_TYPE_AVI:
 		mask = LT9611_INFOFRAME_AVI;
 		break;
@@ -897,6 +900,11 @@ static int lt9611_hdmi_write_infoframe(struct drm_bridge *bridge,
 	int i;
 
 	switch (type) {
+	case HDMI_INFOFRAME_TYPE_AUDIO:
+		mask = LT9611_INFOFRAME_AUDIO;
+		addr = 0x84b2;
+		break;
+
 	case HDMI_INFOFRAME_TYPE_AVI:
 		mask = LT9611_INFOFRAME_AVI;
 		addr = 0x8440;
@@ -940,6 +948,55 @@ lt9611_hdmi_tmds_char_rate_valid(const struct drm_bridge *bridge,
 	return MODE_OK;
 }
 
+static int lt9611_hdmi_codec_audio_startup(struct drm_connector *connector,
+					   struct drm_bridge *bridge)
+{
+	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
+
+	regmap_write(lt9611->regmap, 0x82d6, 0x8c);
+	regmap_write(lt9611->regmap, 0x82d7, 0x04);
+
+	regmap_write(lt9611->regmap, 0x8406, 0x08);
+	regmap_write(lt9611->regmap, 0x8407, 0x10);
+
+	regmap_write(lt9611->regmap, 0x8434, 0xd5);
+
+	return 0;
+}
+
+static int lt9611_hdmi_codec_prepare(struct drm_connector *connector,
+				     struct drm_bridge *bridge,
+				     struct hdmi_codec_daifmt *fmt,
+				     struct hdmi_codec_params *hparms)
+{
+	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
+
+	if (hparms->sample_rate == 48000)
+		regmap_write(lt9611->regmap, 0x840f, 0x2b);
+	else if (hparms->sample_rate == 96000)
+		regmap_write(lt9611->regmap, 0x840f, 0xab);
+	else
+		return -EINVAL;
+
+	regmap_write(lt9611->regmap, 0x8435, 0x00);
+	regmap_write(lt9611->regmap, 0x8436, 0x18);
+	regmap_write(lt9611->regmap, 0x8437, 0x00);
+
+	return drm_atomic_helper_connector_hdmi_update_audio_infoframe(connector,
+								       &hparms->cea);
+}
+
+static void lt9611_hdmi_codec_audio_shutdown(struct drm_connector *connector,
+					     struct drm_bridge *bridge)
+{
+	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
+
+	drm_atomic_helper_connector_hdmi_clear_audio_infoframe(connector);
+
+	regmap_write(lt9611->regmap, 0x8406, 0x00);
+	regmap_write(lt9611->regmap, 0x8407, 0x00);
+}
+
 static const struct drm_bridge_funcs lt9611_bridge_funcs = {
 	.attach = lt9611_bridge_attach,
 	.mode_valid = lt9611_bridge_mode_valid,
@@ -960,6 +1017,10 @@ static const struct drm_bridge_funcs lt9611_bridge_funcs = {
 	.hdmi_tmds_char_rate_valid = lt9611_hdmi_tmds_char_rate_valid,
 	.hdmi_write_infoframe = lt9611_hdmi_write_infoframe,
 	.hdmi_clear_infoframe = lt9611_hdmi_clear_infoframe,
+
+	.hdmi_codec_audio_startup = lt9611_hdmi_codec_audio_startup,
+	.hdmi_codec_prepare = lt9611_hdmi_codec_prepare,
+	.hdmi_codec_audio_shutdown = lt9611_hdmi_codec_audio_shutdown,
 };
 
 static int lt9611_parse_dt(struct device *dev,
@@ -1013,102 +1074,6 @@ static int lt9611_read_device_rev(struct lt9611 *lt9611)
 	return ret;
 }
 
-static int lt9611_hdmi_hw_params(struct device *dev, void *data,
-				 struct hdmi_codec_daifmt *fmt,
-				 struct hdmi_codec_params *hparms)
-{
-	struct lt9611 *lt9611 = data;
-
-	if (hparms->sample_rate == 48000)
-		regmap_write(lt9611->regmap, 0x840f, 0x2b);
-	else if (hparms->sample_rate == 96000)
-		regmap_write(lt9611->regmap, 0x840f, 0xab);
-	else
-		return -EINVAL;
-
-	regmap_write(lt9611->regmap, 0x8435, 0x00);
-	regmap_write(lt9611->regmap, 0x8436, 0x18);
-	regmap_write(lt9611->regmap, 0x8437, 0x00);
-
-	return 0;
-}
-
-static int lt9611_audio_startup(struct device *dev, void *data)
-{
-	struct lt9611 *lt9611 = data;
-
-	regmap_write(lt9611->regmap, 0x82d6, 0x8c);
-	regmap_write(lt9611->regmap, 0x82d7, 0x04);
-
-	regmap_write(lt9611->regmap, 0x8406, 0x08);
-	regmap_write(lt9611->regmap, 0x8407, 0x10);
-
-	regmap_write(lt9611->regmap, 0x8434, 0xd5);
-
-	return 0;
-}
-
-static void lt9611_audio_shutdown(struct device *dev, void *data)
-{
-	struct lt9611 *lt9611 = data;
-
-	regmap_write(lt9611->regmap, 0x8406, 0x00);
-	regmap_write(lt9611->regmap, 0x8407, 0x00);
-}
-
-static int lt9611_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
-				      struct device_node *endpoint,
-				      void *data)
-{
-	struct of_endpoint of_ep;
-	int ret;
-
-	ret = of_graph_parse_endpoint(endpoint, &of_ep);
-	if (ret < 0)
-		return ret;
-
-	/*
-	 * HDMI sound should be located as reg = <2>
-	 * Then, it is sound port 0
-	 */
-	if (of_ep.port == 2)
-		return 0;
-
-	return -EINVAL;
-}
-
-static const struct hdmi_codec_ops lt9611_codec_ops = {
-	.hw_params	= lt9611_hdmi_hw_params,
-	.audio_shutdown = lt9611_audio_shutdown,
-	.audio_startup	= lt9611_audio_startup,
-	.get_dai_id	= lt9611_hdmi_i2s_get_dai_id,
-};
-
-static struct hdmi_codec_pdata codec_data = {
-	.ops = &lt9611_codec_ops,
-	.max_i2s_channels = 8,
-	.i2s = 1,
-};
-
-static int lt9611_audio_init(struct device *dev, struct lt9611 *lt9611)
-{
-	codec_data.data = lt9611;
-	lt9611->audio_pdev =
-		platform_device_register_data(dev, HDMI_CODEC_DRV_NAME,
-					      PLATFORM_DEVID_AUTO,
-					      &codec_data, sizeof(codec_data));
-
-	return PTR_ERR_OR_ZERO(lt9611->audio_pdev);
-}
-
-static void lt9611_audio_exit(struct lt9611 *lt9611)
-{
-	if (lt9611->audio_pdev) {
-		platform_device_unregister(lt9611->audio_pdev);
-		lt9611->audio_pdev = NULL;
-	}
-}
-
 static int lt9611_probe(struct i2c_client *client)
 {
 	struct lt9611 *lt9611;
@@ -1172,6 +1137,9 @@ static int lt9611_probe(struct i2c_client *client)
 
 	i2c_set_clientdata(client, lt9611);
 
+	/* Disable Audio InfoFrame, enabled by default */
+	regmap_update_bits(lt9611->regmap, 0x843d, LT9611_INFOFRAME_AUDIO, 0);
+
 	lt9611->bridge.funcs = &lt9611_bridge_funcs;
 	lt9611->bridge.of_node = client->dev.of_node;
 	lt9611->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
@@ -1180,6 +1148,9 @@ static int lt9611_probe(struct i2c_client *client)
 	lt9611->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	lt9611->bridge.vendor = "Lontium";
 	lt9611->bridge.product = "LT9611";
+	lt9611->bridge.hdmi_codec_dev = dev;
+	lt9611->bridge.hdmi_codec_max_i2s_playback_channels = 8;
+	lt9611->bridge.hdmi_codec_dai_port = 2;
 
 	drm_bridge_add(&lt9611->bridge);
 
@@ -1201,10 +1172,6 @@ static int lt9611_probe(struct i2c_client *client)
 
 	lt9611_enable_hpd_interrupts(lt9611);
 
-	ret = lt9611_audio_init(dev, lt9611);
-	if (ret)
-		goto err_remove_bridge;
-
 	return 0;
 
 err_remove_bridge:
@@ -1225,7 +1192,6 @@ static void lt9611_remove(struct i2c_client *client)
 	struct lt9611 *lt9611 = i2c_get_clientdata(client);
 
 	disable_irq(client->irq);
-	lt9611_audio_exit(lt9611);
 	drm_bridge_remove(&lt9611->bridge);
 
 	regulator_bulk_disable(ARRAY_SIZE(lt9611->supplies), lt9611->supplies);

-- 
2.39.5


