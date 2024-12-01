Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA10D7361B
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Dec 2024 00:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SGZ90COHRkhh8UlEhkaIl4zaxPrKoR1+whYcWjnYlhQ=; b=B998qzWT8DH7vW1ue6Ab8jkkjJ
	xpSZPmgKX+dremccmws/A9ULYido2m3sA+9Q+PYLcQv6mtaeqehTea2aTXPP+qY4kEJNAehtPxto2
	Hp8WWx+6T2e/O13f7N2s+f+YUS3zLi0eB35n3KwKSkJLMMAKcyeneglyUUWcNNd6LFQXQY1RW6Ozq
	CloeFJsFCm3SZnupnyHylxQGyL881fVfDRbyX4aSKM2JtSMLbCMjJuuBhpP/Ogwx2O5HWUrO1p6eG
	HAy0VBWWupobBWvFB2rpe/amMSUkZ1PsF85HG1ckWMiD0Oe30cXjz5eyRmS/N4aQlrMCgUSXF4OWE
	tjD7Aswg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHYCU-00000002qIB-1EeA;
	Sun, 01 Dec 2024 00:52:38 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHY4m-00000002og5-1Fls
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Dec 2024 00:44:42 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5d0bdeb0419so1694445a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Nov 2024 16:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733013879; x=1733618679; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SGZ90COHRkhh8UlEhkaIl4zaxPrKoR1+whYcWjnYlhQ=;
        b=E4QuUfqsSe+GM72XAXw05cTYu6SuvOsdAzoBfbvLYTo+MGxHJ1yNmxZY6ENIQ8A5Ui
         thuBkvhZ1vrTo2TV5xWSGIM36E+H4vj29CRBPjRcxzCZMAH20vwRfOnCKDBzXot13VaK
         Is1+YrmtEFmunmZASPuPGimz2+bYbtLYBYzK9cGjwYWEv3d95S/d/a84JrlyyM+0eQ0n
         Ebkk3c24myKocq5UeekjsuIEfIEOZ8TV8Ow2QbcBT5FXSL0b0dOJd5UxCv/urfHgnmRk
         hMHBUySsj1fYQsKvsHEigYJPNHE/cyWqs3J4XHFSH34ePhK/etIS8NgrfmSHL2fqxGI0
         OEBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733013879; x=1733618679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SGZ90COHRkhh8UlEhkaIl4zaxPrKoR1+whYcWjnYlhQ=;
        b=S5cBqIP8L2VvYLXhUxhMWhZDOdqzsUsjfVtEfsXKc0vM3Sz666ABBSyeh7O4oEfc5j
         cuawKaS8eZIC2PYUDR5XlUFn6ppHwQeazWMA+oj+TxJgMMkkmX1MhLGgnohosFQSx2Wb
         MSi8Ofi1q2UWDkr6jWdnE0QITBWHQ+e5hzXyNuqwPRQ4dgx6r5iFFG0e9gf+W0OaS32k
         z1p2CQkt6hXAHMkLtbbBUeSj3iEQB9PKgZNqRmmbfcS0y+q5+r3lkfBUiZuTOLO5a2RC
         ad8po3q4832O2iAbSW+HzxSLH8R/qW9mOwXYP1UDXqswAsfTHfe0V9Q5xSQIWag2w3WH
         j+ww==
X-Forwarded-Encrypted: i=1; AJvYcCVQM9kx527PQEsOTBVdIK6TBwoRKnza+c7lfchj6wljyb6bI7we75nWRrt+gSkB4YrHadtQFj9g86h7a3Lb7QYz@lists.infradead.org
X-Gm-Message-State: AOJu0YwnKHqSd9ObUwuJdLh2QpCsVQxo0KBPOq8CeWQmDVgZHH4+u36w
	aRC4WHmR6PX3skdcJOc0VA+NkEwcw2MtsE6a3lO71LIT63venTU9CE6kbrWR1vk=
X-Gm-Gg: ASbGncuqd36AEDwF132ziTjlLKWapPOMK1LZw1YmT9/4pAYxYcjWCa6HVsjOPLa++iU
	pjipovUjULg0F+sjan+jglLeCb+l/yBnZL6aB0vFOM1JAQzPei10nki0/o1KHMcJxHRCLIp8wvh
	RNwSEBa1tk6XZyh2cIWqKBwIi385PyYDg481JX4HWjYtR7QKzIebSzvnoEUJdtCkm57bC5GZuOQ
	Ioj/hwhY6AteGQagJAwxUpPoQp5sY4l2vGMVx742IjanOxUXUiFYnX2Ig==
X-Google-Smtp-Source: AGHT+IEuj24wJkdaiYnuCPHz/SWi8S/hVs+sJ2WiYm+fByjgRzStWY16LTJ+uayPA8mD5ACDx5cP6A==
X-Received: by 2002:a05:6402:3226:b0:5d0:e254:cbb3 with SMTP id 4fb4d7f45d1cf-5d0e254cf27mr488656a12.27.1733013878965;
        Sat, 30 Nov 2024 16:44:38 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d097e8d817sm3400359a12.63.2024.11.30.16.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 16:44:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 01 Dec 2024 02:44:12 +0200
Subject: [PATCH v5 8/9] drm/vc4: hdmi: switch to using generic HDMI Codec
 infrastructure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241201-drm-bridge-hdmi-connector-v5-8-b5316e82f61a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6838;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Ma9Aer0yQKkPHw5XCvFB8jWTtBBoIVZ9qBNvPW3rvQ8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnS7FZ4tmicFhQlw+on0M82fbNPsjbm2ahGe5sf
 wHeohELK7SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0uxWQAKCRCLPIo+Aiko
 1SrpB/0R+8/5hrJd7crbg9lLNJcq0FHxpkM9gabyC14zRcox9Asqiup1f6TtU3C50WBNXkRLaZO
 kIcaylCukwHvAZrdkc0lPBEjlNGr/QkU5iepK9TWZviccyluWx62YJQiMMz5dtiuf1hmqA3sFay
 1pp9kSbNF1DIM46JcStOGH5BN0/aWa6sPI0oKq+jLo/PkcAAkGn0Ge/MFXGN2Gi/MqLNSfLOJei
 okGcToPWHEFwn9SpyOgh3psVdS/hp5AshPJ5fKDp3KVEfF6ap0ITfnaPaxmIVyRQAjw6SpYmld/
 DMXaRWxEf0M5fuxqFaf8eTxhci+D8dKE9L7FSAb4Bo5vBLSt
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241130_164440_370212_0C5B27BA 
X-CRM114-Status: GOOD (  16.72  )
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

Drop driver-specific implementation and use the generic HDMI Codec
framework in order to implement the HDMI audio support.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 68 ++++++++++--------------------------------
 drivers/gpu/drm/vc4/vc4_hdmi.h |  2 --
 2 files changed, 15 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 7295834e75fb1ab0cd241ed274e675567e66870b..d0a9aff7ad43016647493263c00d593296a1e3ad 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -595,6 +595,9 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
 	if (vc4_hdmi->variant->supports_hdr)
 		max_bpc = 12;
 
+	connector->hdmi_codec.max_i2s_channels = 8;
+	connector->hdmi_codec.i2s = 1;
+
 	ret = drmm_connector_hdmi_init(dev, connector,
 				       "Broadcom", "Videocore",
 				       &vc4_hdmi_connector_funcs,
@@ -1706,9 +1709,12 @@ vc4_hdmi_connector_clock_valid(const struct drm_connector *connector,
 	return MODE_OK;
 }
 
+static const struct drm_connector_hdmi_codec_funcs vc4_hdmi_codec_funcs;
+
 static const struct drm_connector_hdmi_funcs vc4_hdmi_hdmi_connector_funcs = {
 	.tmds_char_rate_valid	= vc4_hdmi_connector_clock_valid,
 	.write_infoframe	= vc4_hdmi_write_infoframe,
+	.codec_funcs		= &vc4_hdmi_codec_funcs,
 };
 
 #define WIFI_2_4GHz_CH1_MIN_FREQ	2400000000ULL
@@ -1922,9 +1928,9 @@ static bool vc4_hdmi_audio_can_stream(struct vc4_hdmi *vc4_hdmi)
 	return true;
 }
 
-static int vc4_hdmi_audio_startup(struct device *dev, void *data)
+static int vc4_hdmi_audio_startup(struct drm_connector *connector)
 {
-	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
+	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	struct drm_device *drm = vc4_hdmi->connector.dev;
 	unsigned long flags;
 	int ret = 0;
@@ -1986,9 +1992,9 @@ static void vc4_hdmi_audio_reset(struct vc4_hdmi *vc4_hdmi)
 	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 }
 
-static void vc4_hdmi_audio_shutdown(struct device *dev, void *data)
+static void vc4_hdmi_audio_shutdown(struct drm_connector *connector)
 {
-	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
+	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	struct drm_device *drm = vc4_hdmi->connector.dev;
 	unsigned long flags;
 	int idx;
@@ -2058,13 +2064,12 @@ static int sample_rate_to_mai_fmt(int samplerate)
 }
 
 /* HDMI audio codec callbacks */
-static int vc4_hdmi_audio_prepare(struct device *dev, void *data,
+static int vc4_hdmi_audio_prepare(struct drm_connector *connector,
 				  struct hdmi_codec_daifmt *daifmt,
 				  struct hdmi_codec_params *params)
 {
-	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
+	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	struct drm_device *drm = vc4_hdmi->connector.dev;
-	struct drm_connector *connector = &vc4_hdmi->connector;
 	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	unsigned int sample_rate = params->sample_rate;
 	unsigned int channels = params->channels;
@@ -2076,7 +2081,7 @@ static int vc4_hdmi_audio_prepare(struct device *dev, void *data,
 	int ret = 0;
 	int idx;
 
-	dev_dbg(dev, "%s: %u Hz, %d bit, %d channels\n", __func__,
+	dev_dbg(&vc4_hdmi->pdev->dev, "%s: %u Hz, %d bit, %d channels\n", __func__,
 		sample_rate, params->sample_width, channels);
 
 	mutex_lock(&vc4_hdmi->mutex);
@@ -2215,40 +2220,12 @@ static const struct snd_dmaengine_pcm_config pcm_conf = {
 	.prepare_slave_config = snd_dmaengine_pcm_prepare_slave_config,
 };
 
-static int vc4_hdmi_audio_get_eld(struct device *dev, void *data,
-				  uint8_t *buf, size_t len)
-{
-	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
-	struct drm_connector *connector = &vc4_hdmi->connector;
-
-	mutex_lock(&connector->eld_mutex);
-	memcpy(buf, connector->eld, min(sizeof(connector->eld), len));
-	mutex_unlock(&connector->eld_mutex);
-
-	return 0;
-}
-
-static const struct hdmi_codec_ops vc4_hdmi_codec_ops = {
-	.get_eld = vc4_hdmi_audio_get_eld,
+static const struct drm_connector_hdmi_codec_funcs vc4_hdmi_codec_funcs = {
 	.prepare = vc4_hdmi_audio_prepare,
 	.audio_shutdown = vc4_hdmi_audio_shutdown,
 	.audio_startup = vc4_hdmi_audio_startup,
 };
 
-static struct hdmi_codec_pdata vc4_hdmi_codec_pdata = {
-	.ops = &vc4_hdmi_codec_ops,
-	.max_i2s_channels = 8,
-	.i2s = 1,
-};
-
-static void vc4_hdmi_audio_codec_release(void *ptr)
-{
-	struct vc4_hdmi *vc4_hdmi = ptr;
-
-	platform_device_unregister(vc4_hdmi->audio.codec_pdev);
-	vc4_hdmi->audio.codec_pdev = NULL;
-}
-
 static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 {
 	const struct vc4_hdmi_register *mai_data =
@@ -2256,7 +2233,6 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 	struct snd_soc_dai_link *dai_link = &vc4_hdmi->audio.link;
 	struct snd_soc_card *card = &vc4_hdmi->audio.card;
 	struct device *dev = &vc4_hdmi->pdev->dev;
-	struct platform_device *codec_pdev;
 	const __be32 *addr;
 	int index, len;
 	int ret;
@@ -2349,20 +2325,6 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 		return ret;
 	}
 
-	codec_pdev = platform_device_register_data(dev, HDMI_CODEC_DRV_NAME,
-						   PLATFORM_DEVID_AUTO,
-						   &vc4_hdmi_codec_pdata,
-						   sizeof(vc4_hdmi_codec_pdata));
-	if (IS_ERR(codec_pdev)) {
-		dev_err(dev, "Couldn't register the HDMI codec: %ld\n", PTR_ERR(codec_pdev));
-		return PTR_ERR(codec_pdev);
-	}
-	vc4_hdmi->audio.codec_pdev = codec_pdev;
-
-	ret = devm_add_action_or_reset(dev, vc4_hdmi_audio_codec_release, vc4_hdmi);
-	if (ret)
-		return ret;
-
 	dai_link->cpus		= &vc4_hdmi->audio.cpu;
 	dai_link->codecs	= &vc4_hdmi->audio.codec;
 	dai_link->platforms	= &vc4_hdmi->audio.platform;
@@ -2375,7 +2337,7 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 	dai_link->stream_name = "MAI PCM";
 	dai_link->codecs->dai_name = "i2s-hifi";
 	dai_link->cpus->dai_name = dev_name(dev);
-	dai_link->codecs->name = dev_name(&codec_pdev->dev);
+	dai_link->codecs->name = dev_name(&vc4_hdmi->connector.hdmi_codec.codec_pdev->dev);
 	dai_link->platforms->name = dev_name(dev);
 
 	card->dai_link = dai_link;
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index b2424a21da230db99db207efa293417faccd254d..e3d989ca302b72533c374dfa3fd0d5bd7fe64a82 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -104,8 +104,6 @@ struct vc4_hdmi_audio {
 	struct snd_soc_dai_link_component codec;
 	struct snd_soc_dai_link_component platform;
 	struct snd_dmaengine_dai_dma_data dma_data;
-	struct hdmi_audio_infoframe infoframe;
-	struct platform_device *codec_pdev;
 	bool streaming;
 };
 

-- 
2.39.5


