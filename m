Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E688DF3ED4F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 14:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Im5NapW3ILuEb7eBZxKOTHx86oKbRy8zdrGBsjozZe4=; b=cftFMhxpKLKz/AtFgJpcOg+uQp
	aSrwREuQEczwF6SOzn7LkgpXSICgSJB7+fHUwS0b/PPevMIR83omEUSW6O/txJXbUwKe7wgLr9i1l
	q3Ctj7JxRXwlbsQ1DKfL0Avc7wu0XK3jzLxHZH2Lu00agqdQTzttHN88Zwcpy06TDzVL0aK/XUarH
	mcL1dTobVFglibCtzY9ushb+kXnQbpfQ7/FA9bba+jUNAQ1swETkc4ucLQeK5WJCNvL34B13CaiAb
	3i9vutN1Z79/hrdE5J115yWd64d5kuEiY8HktdZqW29Rr8DlSeM1a7ng+mSMIqP2UJe5wVJ40mwJU
	+nfuyqjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBZmg-0000000DXe7-2w0o;
	Sat, 11 Apr 2026 14:58:06 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBZmc-0000000DXae-48WL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Apr 2026 14:58:04 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso45169245e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Apr 2026 07:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775919481; x=1776524281; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Im5NapW3ILuEb7eBZxKOTHx86oKbRy8zdrGBsjozZe4=;
        b=CDz/O6Ty7EpNLxCXiyBSpoAQh+HfbhCwMXs9fvstUqaOs399JuaHOKFIvpc2v8xRzk
         C3oHNYHfThKnRGjBah6kx8WNa6JJJLAljVPeP4DUfXMAkWwLfxic3ssilf7GPFkOlxS1
         KTnlu5j5x+GBsxtantwOeZhf8Yg45P8JhClj+fn0HgkeXi9vpXbeYibdQJj3/IHPemLc
         wgptOLROoibmWGZpwSfH1vf47FEFyo+McOIUR8ePfKH/jAqn3cGCNNvLQ80KJ0YmIRQ5
         aK4VextyeeqTekpZsAns17fqg1HTG+qySANHxJE7cvr0ZCW8vA7oDHpxhXybx0VoMDlf
         4BgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775919481; x=1776524281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Im5NapW3ILuEb7eBZxKOTHx86oKbRy8zdrGBsjozZe4=;
        b=BsCqSxVrauksL0E7Yc6rKF4IBDBl/yLMpIoYzTkEOmyM283H1uGsapRpGkVuh21K3C
         sO9rPiE9qXHKnA1wdKgQUsF9vWOoRb/DPEnwR2MhdJXSdYWdUOaWRVU6pvEnm1Akoz+0
         x7PqxFO23ofh7AUa8+v4GCZMCYxQgamAdzkYAeaoHWMQNSU6kHJDLPZMtakLcoYUoHVG
         wlp3UG5zGIEVHAtxI5vlQHVHb9usjL8mUFOYd5WZjC7K5qrurPnbZDYCotUFSqli9NDu
         MrTbZL0SwDs3iEDMzAkl1CK/Ou+DTitysKDXkIPIE4+C56HiLm+kg0JLXOQe1KjtB97k
         cdGA==
X-Forwarded-Encrypted: i=1; AJvYcCXjmEqifx83Z/T3v8GZHuYj8rG61TnesfHIe6MLpxFYmRPXm5kM05h4FH4b6HFdrmKPak12o2LRTjWmN90L1A47@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5NwDl2c4mipoOqdnJYH+SiRGfG1RadhEGelDuelazCCaMtka2
	VgEpuW4p9nV/tzXc6bfJ2sBrq9Iq8iadR4cQ+OyKa240w1Q30uBKLYrxf6/m5xqnsR0=
X-Gm-Gg: AeBDietxbUm68rWM/wE55txn7oy2jirR+HaX9Z0GZlAXb6O/3zsJNWQuH/UejbzU5qb
	08IHIuNASF2CV70Oa55a8o2auWxb/H1yccEMxwq3y9Vnq3W0tVRgPEjh6d3vU/UV9fufMYIdkRi
	A7R22V0zOVLnmJbU3iId9108fOby7weD+rct5HohIg9EuZNZWQgTJkn6ULDCgf8kATnml5++fiY
	XxQmgXZ/tgmdcssYzYA/dLQGhCP6oLGLrw8wTXmTbOai/zjr5Abkk3UNsMtKmXfh1k9tloetbui
	PGEuk/iD+q5XXlKrjaRXfQGAl5YH8vpem+jE6GEl59YFUtzXrzCfiitkoKXBMTVE2Yr2YXD0eoD
	b+5F4e4/HpxJaTWDUnceHS7jxieANkVs6vvA5AEHrNVtvEgcKN8gWiDvDr87n3RxVipg5P6YtNL
	H6AbYwq1Qi3oxnwgxS8rA4IR8iTRkiq14=
X-Received: by 2002:a05:600c:8218:b0:488:a14d:3d81 with SMTP id 5b1f17b1804b1-488d67c7034mr113822715e9.2.1775919481113;
        Sat, 11 Apr 2026 07:58:01 -0700 (PDT)
Received: from [127.0.1.1] ([151.61.248.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5dc7070sm48882375e9.10.2026.04.11.07.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 07:58:00 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sat, 11 Apr 2026 16:57:27 +0200
Subject: [PATCH RFC v2 02/11] ASoC: meson: aiu-encoder-i2s: use gx_iface
 and gx_stream structures
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-audin-rfc-v2-2-4c8a6ec5fcab@baylibre.com>
References: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com>
In-Reply-To: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Valerio Setti <vsetti@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11216; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=gue3Y+n+tJoG37ZqLrhRv8zEV2s1GwTNmBgXTSncfz8=;
 b=owGbwMvMwCF2z3ty7kUrRgbG02pJDJm3EotrIr+t8HD0b95347zGlYkXn81ScBFsue3FxHP8p
 uTnuWLzO0pZGMQ4GGTFFFlYpt/7XVCq9tA44WQBzBxWJpAhDFycAjCRHWcYGe6c/NRqt0q86ckh
 Tm+2qbonki869tWbzDyV6dSve1hccxvDP53CJfN+7q3Vi5nXUd28+LGr+9ODKdf28XHO3/xHP3x
 6DAMA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_075803_090756_8B3A73F0 
X-CRM114-Status: GOOD (  25.96  )
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

Start using gx_iface and gx_stream to store interface and stream info,
respectively. probe()/remove() functions are added to allocate/free the
gx_stream structures for each PCM stream.

Clock-wise instead of bulk enabling all the clocks on startup and disabling
them on shutdown, only the peripheral's internal ones are enabled/disabled
in those functions, whereas MCLK and I2S clock divider are handled in
hw_params/hw_free.
Interface wide rate symmetry is also enforced here. This is useful when the
interface is used for playback and capture at the same time.

Finally a trigger() callback is also added to start/stop the associated
I2S data formatter.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/aiu-encoder-i2s.c | 163 ++++++++++++++++++++++++++++++++------
 sound/soc/meson/aiu.h             |   3 +
 2 files changed, 141 insertions(+), 25 deletions(-)

diff --git a/sound/soc/meson/aiu-encoder-i2s.c b/sound/soc/meson/aiu-encoder-i2s.c
index 3b4061508c18047fe8d6f3f98061720f8ce238f2..76a33878b9df101ad62b18abd8cc14b7908c2c42 100644
--- a/sound/soc/meson/aiu-encoder-i2s.c
+++ b/sound/soc/meson/aiu-encoder-i2s.c
@@ -10,6 +10,8 @@
 #include <sound/soc-dai.h>
 
 #include "aiu.h"
+#include "gx-formatter.h"
+#include "gx-interface.h"
 
 #define AIU_I2S_SOURCE_DESC_MODE_8CH	BIT(0)
 #define AIU_I2S_SOURCE_DESC_MODE_24BIT	BIT(5)
@@ -79,7 +81,7 @@ static int aiu_encoder_i2s_setup_desc(struct snd_soc_component *component,
 }
 
 static int aiu_encoder_i2s_set_legacy_div(struct snd_soc_component *component,
-					  struct snd_pcm_hw_params *params,
+					  struct gx_stream *ts,
 					  unsigned int bs)
 {
 	switch (bs) {
@@ -109,7 +111,7 @@ static int aiu_encoder_i2s_set_legacy_div(struct snd_soc_component *component,
 }
 
 static int aiu_encoder_i2s_set_more_div(struct snd_soc_component *component,
-					struct snd_pcm_hw_params *params,
+					struct gx_stream *ts,
 					unsigned int bs)
 {
 	/*
@@ -119,7 +121,7 @@ static int aiu_encoder_i2s_set_more_div(struct snd_soc_component *component,
 	 * increased by 50% to get the correct output rate.
 	 * No idea why !
 	 */
-	if (params_width(params) == 16 && params_channels(params) == 8) {
+	if (ts->width == 16 && ts->channels == 8) {
 		if (bs % 2) {
 			dev_err(component->dev,
 				"Cannot increase i2s divider by 50%%\n");
@@ -142,24 +144,18 @@ static int aiu_encoder_i2s_set_more_div(struct snd_soc_component *component,
 }
 
 static int aiu_encoder_i2s_set_clocks(struct snd_soc_component *component,
-				      struct snd_pcm_hw_params *params)
+				      struct gx_stream *ts)
 {
 	struct aiu *aiu = snd_soc_component_get_drvdata(component);
-	unsigned int srate = params_rate(params);
 	unsigned int fs, bs;
 	int ret;
 
 	/* Get the oversampling factor */
-	fs = DIV_ROUND_CLOSEST(clk_get_rate(aiu->i2s.clks[MCLK].clk), srate);
+	fs = DIV_ROUND_CLOSEST(ts->iface->mclk_rate, ts->iface->rate);
 
 	if (fs % 64)
 		return -EINVAL;
 
-	/* Send data MSB first */
-	snd_soc_component_update_bits(component, AIU_I2S_DAC_CFG,
-				      AIU_I2S_DAC_CFG_MSB_FIRST,
-				      AIU_I2S_DAC_CFG_MSB_FIRST);
-
 	/* Set bclk to lrlck ratio */
 	snd_soc_component_update_bits(component, AIU_CODEC_DAC_LRCLK_CTRL,
 				      AIU_CODEC_DAC_LRCLK_CTRL_DIV,
@@ -169,9 +165,9 @@ static int aiu_encoder_i2s_set_clocks(struct snd_soc_component *component,
 	bs = fs / 64;
 
 	if (aiu->platform->has_clk_ctrl_more_i2s_div)
-		ret = aiu_encoder_i2s_set_more_div(component, params, bs);
+		ret = aiu_encoder_i2s_set_more_div(component, ts, bs);
 	else
-		ret = aiu_encoder_i2s_set_legacy_div(component, params, bs);
+		ret = aiu_encoder_i2s_set_legacy_div(component, ts, bs);
 
 	if (ret)
 		return ret;
@@ -188,11 +184,15 @@ static int aiu_encoder_i2s_hw_params(struct snd_pcm_substream *substream,
 				     struct snd_pcm_hw_params *params,
 				     struct snd_soc_dai *dai)
 {
+	struct gx_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
+	struct gx_iface *iface = ts->iface;
 	struct snd_soc_component *component = dai->component;
 	int ret;
 
-	/* Disable the clock while changing the settings */
-	aiu_encoder_i2s_divider_enable(component, false);
+	iface->rate = params_rate(params);
+	ts->physical_width = params_physical_width(params);
+	ts->width = params_width(params);
+	ts->channels = params_channels(params);
 
 	ret = aiu_encoder_i2s_setup_desc(component, params);
 	if (ret) {
@@ -200,13 +200,17 @@ static int aiu_encoder_i2s_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 	}
 
-	ret = aiu_encoder_i2s_set_clocks(component, params);
+	ret = aiu_encoder_i2s_set_clocks(component, ts);
 	if (ret) {
 		dev_err(dai->dev, "setting i2s clocks failed\n");
 		return ret;
 	}
 
-	aiu_encoder_i2s_divider_enable(component, true);
+	ret = gx_stream_set_cont_clocks(ts, iface->fmt);
+	if (ret)
+		dev_err(dai->dev, "failed to apply continuous clock setting\n");
+
+	aiu_encoder_i2s_divider_enable(component, 1);
 
 	return 0;
 }
@@ -214,16 +218,20 @@ static int aiu_encoder_i2s_hw_params(struct snd_pcm_substream *substream,
 static int aiu_encoder_i2s_hw_free(struct snd_pcm_substream *substream,
 				   struct snd_soc_dai *dai)
 {
+	struct gx_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
 	struct snd_soc_component *component = dai->component;
 
-	aiu_encoder_i2s_divider_enable(component, false);
-
-	return 0;
+	/* This is the last substream open and that is going to be closed. */
+	if (snd_soc_dai_active(dai) <= 1)
+		aiu_encoder_i2s_divider_enable(component, 0);
+	return gx_stream_set_cont_clocks(ts, 0);
 }
 
 static int aiu_encoder_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
 	struct snd_soc_component *component = dai->component;
+	struct aiu *aiu = snd_soc_component_get_drvdata(component);
+	struct gx_iface *iface = &aiu->i2s.iface;
 	unsigned int inv = fmt & SND_SOC_DAIFMT_INV_MASK;
 	unsigned int val = 0;
 	unsigned int skew;
@@ -255,9 +263,12 @@ static int aiu_encoder_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		skew = 0;
 		break;
 	default:
+		dev_err(dai->dev, "unsupported dai format\n");
 		return -EINVAL;
 	}
 
+	iface->fmt = fmt;
+
 	val |= FIELD_PREP(AIU_CLK_CTRL_LRCLK_SKEW, skew);
 	snd_soc_component_update_bits(component, AIU_CLK_CTRL,
 				      AIU_CLK_CTRL_LRCLK_INVERT |
@@ -284,6 +295,8 @@ static int aiu_encoder_i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id,
 	if (ret)
 		dev_err(dai->dev, "Failed to set sysclk to %uHz", freq);
 
+	aiu->i2s.iface.mclk_rate = freq;
+
 	return ret;
 }
 
@@ -298,6 +311,7 @@ static int aiu_encoder_i2s_startup(struct snd_pcm_substream *substream,
 				   struct snd_soc_dai *dai)
 {
 	struct aiu *aiu = snd_soc_component_get_drvdata(dai->component);
+	struct gx_iface *iface = &aiu->i2s.iface;
 	int ret;
 
 	/* Make sure the encoder gets either 2 or 8 channels */
@@ -309,11 +323,40 @@ static int aiu_encoder_i2s_startup(struct snd_pcm_substream *substream,
 		return ret;
 	}
 
-	ret = clk_bulk_prepare_enable(aiu->i2s.clk_num, aiu->i2s.clks);
-	if (ret)
-		dev_err(dai->dev, "failed to enable i2s clocks\n");
+	if (snd_soc_dai_active(dai)) {
+		/* Apply interface wide rate symmetry */
+		ret = snd_pcm_hw_constraint_single(substream->runtime,
+						   SNDRV_PCM_HW_PARAM_RATE,
+						   iface->rate);
+		if (ret < 0)
+			dev_err(dai->dev, "can't set iface rate constraint\n");
+	}
 
-	return ret;
+	/*
+	 * Enable only clocks which are required for the interface internal
+	 * logic. MCLK is enabled/disabled from the formatter and the I2S
+	 * divider is enabled/disabled in "hw_params"/"hw_free", respectively.
+	 */
+	ret = clk_prepare_enable(aiu->i2s.clks[PCLK].clk);
+	if (ret) {
+		dev_err(dai->dev, "failed to enable PCLK\n");
+		return ret;
+	}
+	ret = clk_prepare_enable(aiu->i2s.clks[MIXER].clk);
+	if (ret) {
+		dev_err(dai->dev, "failed to enable MIXER\n");
+		clk_disable_unprepare(aiu->i2s.clks[PCLK].clk);
+		return ret;
+	}
+	ret = clk_prepare_enable(aiu->i2s.clks[AOCLK].clk);
+	if (ret) {
+		dev_err(dai->dev, "failed to enable AOCLK\n");
+		clk_disable_unprepare(aiu->i2s.clks[MIXER].clk);
+		clk_disable_unprepare(aiu->i2s.clks[PCLK].clk);
+		return ret;
+	}
+
+	return 0;
 }
 
 static void aiu_encoder_i2s_shutdown(struct snd_pcm_substream *substream,
@@ -321,14 +364,84 @@ static void aiu_encoder_i2s_shutdown(struct snd_pcm_substream *substream,
 {
 	struct aiu *aiu = snd_soc_component_get_drvdata(dai->component);
 
-	clk_bulk_disable_unprepare(aiu->i2s.clk_num, aiu->i2s.clks);
+	clk_disable_unprepare(aiu->i2s.clks[AOCLK].clk);
+	clk_disable_unprepare(aiu->i2s.clks[MIXER].clk);
+	clk_disable_unprepare(aiu->i2s.clks[PCLK].clk);
+}
+
+static int aiu_encoder_i2s_trigger(struct snd_pcm_substream *substream,
+				   int cmd,
+				   struct snd_soc_dai *dai)
+{
+	struct gx_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
+	int ret;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		ret = gx_stream_start(ts);
+		break;
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+	case SNDRV_PCM_TRIGGER_STOP:
+		gx_stream_stop(ts);
+		ret = 0;
+		break;
+	default:
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
+static int aiu_encoder_i2s_remove_dai(struct snd_soc_dai *dai)
+{
+	int stream;
+
+	for_each_pcm_streams(stream) {
+		struct gx_stream *ts = snd_soc_dai_dma_data_get(dai, stream);
+
+		if (ts)
+			gx_stream_free(ts);
+	}
+
+	return 0;
+}
+
+static int aiu_encoder_i2s_probe_dai(struct snd_soc_dai *dai)
+{
+	struct aiu *aiu = snd_soc_dai_get_drvdata(dai);
+	struct gx_iface *iface = &aiu->i2s.iface;
+	int stream;
+
+	for_each_pcm_streams(stream) {
+		struct gx_stream *ts;
+
+		if (!snd_soc_dai_get_widget(dai, stream))
+			continue;
+
+		ts = gx_stream_alloc(iface);
+		if (!ts) {
+			aiu_encoder_i2s_remove_dai(dai);
+			return -ENOMEM;
+		}
+		snd_soc_dai_dma_data_set(dai, stream, ts);
+	}
+
+	iface->mclk = aiu->i2s.clks[MCLK].clk;
+
+	return 0;
 }
 
 const struct snd_soc_dai_ops aiu_encoder_i2s_dai_ops = {
+	.probe		= aiu_encoder_i2s_probe_dai,
+	.remove		= aiu_encoder_i2s_remove_dai,
 	.hw_params	= aiu_encoder_i2s_hw_params,
 	.hw_free	= aiu_encoder_i2s_hw_free,
 	.set_fmt	= aiu_encoder_i2s_set_fmt,
 	.set_sysclk	= aiu_encoder_i2s_set_sysclk,
 	.startup	= aiu_encoder_i2s_startup,
 	.shutdown	= aiu_encoder_i2s_shutdown,
+	.trigger	= aiu_encoder_i2s_trigger,
 };
diff --git a/sound/soc/meson/aiu.h b/sound/soc/meson/aiu.h
index 0f94c8bf608181112d78402532b832eb50c2d409..68310de0bdf7a97d8de2ff306c159248ee9b0ede 100644
--- a/sound/soc/meson/aiu.h
+++ b/sound/soc/meson/aiu.h
@@ -7,6 +7,8 @@
 #ifndef _MESON_AIU_H
 #define _MESON_AIU_H
 
+#include "gx-formatter.h"
+
 struct clk;
 struct clk_bulk_data;
 struct device;
@@ -25,6 +27,7 @@ struct aiu_interface {
 	struct clk_bulk_data *clks;
 	unsigned int clk_num;
 	int irq;
+	struct gx_iface iface;
 };
 
 struct aiu_platform_data {

-- 
2.39.5


