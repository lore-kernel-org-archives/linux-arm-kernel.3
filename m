Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A1ACD4F49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 15:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0EaEtp+NjgujiEJl+onPEKqRbgJwif9DxxZ8e5Jffn0=; b=Ks9pE6zySqrxTxd7QhvBWKWbD6
	z417/apQIa8GYnYSAYWfrMPo9gTxwZ71WyigIXvaYstc3TkMQ4HGzkyBQYnPIPbWo6YrvLikUvXlh
	d/wlhwjp5F4MQuBTGLs8H7KKSbh9lbWHVUvOqt56ex7kwwA7jW3AXlxG8CPc2bDnu1nZl9HIv3kEs
	w9pjfBJvo5KvZdC+GwzzWP+dgmtvcF+dJCOOr3dGYRoOf0wDpb7r0ZYTKEHwBDn+gAnALVYGWd25W
	/x1WnFwisZWKZ2He2zTQ9fzgxmOIIE2zM1P81odMJj9HW1fTk1GD9aek1oqY8304llUUEPwgAk8Ng
	cl5Z8CjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNuCC-00000008fB6-2Wyn;
	Fri, 15 May 2026 15:11:24 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNuC6-00000008f74-34i2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 15:11:20 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-488ad135063so77680475e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 08:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778857877; x=1779462677; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0EaEtp+NjgujiEJl+onPEKqRbgJwif9DxxZ8e5Jffn0=;
        b=TF1U08ve/yRJQsNwgcWJAj7dE2wWFhHN/xucz1QZeIW6Vx3ux35TI0/lOGux7BvJeB
         YhPqGeTGMrXpiLuVwt5onXimNdu4w1qRvHDRlDRxDi2iCGJ8+Fe9WzeO8n0skCnPqq3P
         5dqP1IgwsWG8jC9brFrUyYb3k5JS89t5QW+odsra/LYUQyMl11gKl7+N+PTKwT9R1XpY
         I7jFf9sF83i96KE028DaQrfK2Ph2jpZkVy2e9dGz1lCDnXKjDWro6pI9W3Z2ECC+lEO3
         7WuzEK65Z+OlTwROKCOEBqlhokCU89wzyEoQUz6WYoKj5rIrHEHgN3CjMBMqPRf7DkRj
         UAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778857877; x=1779462677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0EaEtp+NjgujiEJl+onPEKqRbgJwif9DxxZ8e5Jffn0=;
        b=hgLQ0dbKerJFjrRGzMxKPl/PxZeoRJ3sYARAk6ijo990zchlfpzVPWJhNHJVeWnPv9
         YPpsuZ54ITxOXeXE9pyBrWesveFuamxqODx+LiYBUP671RTXvaSMbXxCYFZJvB6AP8qR
         /qsJskBrkXDNoDNiqSiDPJR+Ot1c5IrSCJWDTdptWtyVw6i1pYAIk/VoOtwFP0l8EjOl
         1gCjzXmg1yhVSU/yTh2F8Ii1HwoVXxJQxv+RzIluPPFSNCW33okvLAJbie+6HZZbYoXr
         0/vz7yFRXfX1IJaCgaA5xVyLGOdsVpo1ow4xxRo5mX51GvPdukSWE6y95SdruKHAt5Nb
         fM+A==
X-Forwarded-Encrypted: i=1; AFNElJ8YLqrOmUBQe7AjaObdXUEIrGlcBQgEsphlHGxvxRxhAN0JKLrtA8FeYqdaBCOnAXLHBe2EH4ZGsXy97GuVaMRp@lists.infradead.org
X-Gm-Message-State: AOJu0YyRc2wb3zTZcob2rX6bePfFvOawefILUA6mCbSqsrOjpjQGqucj
	t9Ul9bJaUlkpOHGiepYLc/0+B5B3XbtvFHiNwDTAXsXFJAfa+p+5IYZ8z5k8Wnj25m4=
X-Gm-Gg: Acq92OE/M4DBg/CwoR78yJBlVx4Wy49oLMGEnkQVBErfmImgZOljs+uEsGU2fqEl7ur
	amU+DVdsU/aSfR0m6RDc4i/Hc93/l8Osw8Uo2fsRvPbyJU1b8J9vKeJkx8ixWqBQdYeSEDwSw4I
	e5YjYRizaKF+osmPhAUZZk05UEiEVEdmOSsLEom1hSAlc1TaLFvOvtsMQ8jc0xD/dQSSau0cl23
	OrRQbecGs6tM+nd/2i0AI6vszGzX1TG59pfNN2EAH1UG5Idnq/Zx//OXFuUPEtKJO0FerQfOErX
	LKYflP9ofD/TGUqRzqZaNLUA3MFca72b61nH5zY13jGkX3iik9uc3CPrqw6sraDnzjk+jsnBAzZ
	jlktCFCb9xaUjp4CsvBSO5I6VrqfAhjGvN2ihlgNic2XcezLQRRBy4WcIELhqBPNf/bCKd+n/e4
	EoLsaVk97G9L7h3Qiv/A7T
X-Received: by 2002:a05:600c:848c:b0:48a:52d4:888c with SMTP id 5b1f17b1804b1-48fe60e5241mr65301055e9.3.1778857876640;
        Fri, 15 May 2026 08:11:16 -0700 (PDT)
Received: from [127.0.1.1] ([151.41.223.93])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a19c2dsm15262062f8f.21.2026.05.15.08.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 08:11:16 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Fri, 15 May 2026 17:10:38 +0200
Subject: [PATCH 2/4] ASoC: meson: aiu-encoder-i2s: use gx_iface and
 gx_stream structures
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-reshape-aiu-as-axg-v1-2-53b457784ff3@baylibre.com>
References: <20260515-reshape-aiu-as-axg-v1-0-53b457784ff3@baylibre.com>
In-Reply-To: <20260515-reshape-aiu-as-axg-v1-0-53b457784ff3@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12028; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=54PIae7SEeel0cOzqQW3XSaYMJnLQDfwZn/z4oQ7lbg=;
 b=owGbwMvMwCF2z3ty7kUrRgbG02pJDFns5v1F/TXLIne8vloWHF1x7urD1lyx+TL183Y4nUuUn
 nzcynhNRykLgxgHg6yYIgvL9Hu/C0rVHhonnCyAmcPKBDKEgYtTACbSMZ+RYZWZbg3T1Ilh1Y82
 rexo2MgQP/GASdmXWVYf9P9NU30qrs3wT73JVOeMSOnk64vYk84927LvcpTgZFWrh8YTDv395TZ
 1CgcA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_081118_845588_F5E48785 
X-CRM114-Status: GOOD (  24.51  )
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
 sound/soc/meson/aiu-encoder-i2s.c | 200 ++++++++++++++++++++++++++++++++------
 sound/soc/meson/aiu.h             |   3 +
 2 files changed, 174 insertions(+), 29 deletions(-)

diff --git a/sound/soc/meson/aiu-encoder-i2s.c b/sound/soc/meson/aiu-encoder-i2s.c
index 3b4061508c18047fe8d6f3f98061720f8ce238f2..39accd396affb8beb49fa7cca394244730b24574 100644
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
@@ -188,25 +184,55 @@ static int aiu_encoder_i2s_hw_params(struct snd_pcm_substream *substream,
 				     struct snd_pcm_hw_params *params,
 				     struct snd_soc_dai *dai)
 {
+	struct gx_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
+	struct gx_iface *iface = ts->iface;
 	struct snd_soc_component *component = dai->component;
 	int ret;
 
-	/* Disable the clock while changing the settings */
-	aiu_encoder_i2s_divider_enable(component, false);
+	/* Enforce interface wide rate symmetry. */
+	if (iface->rate && (iface->rate != params_rate(params))) {
+		dev_err(dai->dev, "can't set iface rate (%d != %d)\n",
+			iface->rate, params_rate(params));
+		return -EINVAL;
+	}
+
+	iface->rate = params_rate(params);
+	ts->physical_width = params_physical_width(params);
+	ts->width = params_width(params);
+	ts->channels = params_channels(params);
 
 	ret = aiu_encoder_i2s_setup_desc(component, params);
 	if (ret) {
-		dev_err(dai->dev, "setting i2s desc failed\n");
+		dev_err(dai->dev, "setting i2s desc failed: %d\n", ret);
 		return ret;
 	}
 
-	ret = aiu_encoder_i2s_set_clocks(component, params);
+	ret = aiu_encoder_i2s_set_clocks(component, ts);
 	if (ret) {
-		dev_err(dai->dev, "setting i2s clocks failed\n");
+		dev_err(dai->dev, "setting i2s clocks failed: %d\n", ret);
 		return ret;
 	}
 
-	aiu_encoder_i2s_divider_enable(component, true);
+	return 0;
+}
+
+static int aiu_encoder_i2s_prepare(struct snd_pcm_substream *substream,
+				   struct snd_soc_dai *dai)
+{
+	struct gx_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
+	struct snd_soc_component *component = dai->component;
+	int ret;
+
+	if (ts->clk_enabled)
+		return 0;
+
+	ret = clk_prepare_enable(ts->iface->mclk);
+	if (ret)
+		return ret;
+
+	ts->clk_enabled = true;
+
+	aiu_encoder_i2s_divider_enable(component, 1);
 
 	return 0;
 }
@@ -214,9 +240,20 @@ static int aiu_encoder_i2s_hw_params(struct snd_pcm_substream *substream,
 static int aiu_encoder_i2s_hw_free(struct snd_pcm_substream *substream,
 				   struct snd_soc_dai *dai)
 {
+	struct gx_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
 	struct snd_soc_component *component = dai->component;
 
-	aiu_encoder_i2s_divider_enable(component, false);
+	/*
+	 * Disable the i2s clock divider only if this is the last substream
+	 * being closed.
+	 */
+	if (snd_soc_dai_active(dai) <= 1)
+		aiu_encoder_i2s_divider_enable(component, 0);
+
+	if (ts->clk_enabled) {
+		clk_disable_unprepare(ts->iface->mclk);
+		ts->clk_enabled = false;
+	}
 
 	return 0;
 }
@@ -224,6 +261,8 @@ static int aiu_encoder_i2s_hw_free(struct snd_pcm_substream *substream,
 static int aiu_encoder_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
 	struct snd_soc_component *component = dai->component;
+	struct aiu *aiu = snd_soc_component_get_drvdata(component);
+	struct gx_iface *iface = &aiu->i2s.iface;
 	unsigned int inv = fmt & SND_SOC_DAIFMT_INV_MASK;
 	unsigned int val = 0;
 	unsigned int skew;
@@ -255,9 +294,12 @@ static int aiu_encoder_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
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
@@ -281,10 +323,14 @@ static int aiu_encoder_i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id,
 		return 0;
 
 	ret = clk_set_rate(aiu->i2s.clks[MCLK].clk, freq);
-	if (ret)
-		dev_err(dai->dev, "Failed to set sysclk to %uHz", freq);
+	if (ret) {
+		dev_err(dai->dev, "Failed to set sysclk to %uHz: %d", freq, ret);
+		return ret;
+	}
 
-	return ret;
+	aiu->i2s.iface.mclk_rate = freq;
+
+	return 0;
 }
 
 static const unsigned int hw_channels[] = {2, 8};
@@ -305,30 +351,126 @@ static int aiu_encoder_i2s_startup(struct snd_pcm_substream *substream,
 					 SNDRV_PCM_HW_PARAM_CHANNELS,
 					 &hw_channel_constraints);
 	if (ret) {
-		dev_err(dai->dev, "adding channels constraints failed\n");
+		dev_err(dai->dev, "adding channels constraints failed: %d\n", ret);
 		return ret;
 	}
 
-	ret = clk_bulk_prepare_enable(aiu->i2s.clk_num, aiu->i2s.clks);
-	if (ret)
-		dev_err(dai->dev, "failed to enable i2s clocks\n");
+	/*
+	 * Enable only clocks which are required for the interface internal
+	 * logic. MCLK is enabled/disabled from the formatter and the I2S
+	 * divider is enabled/disabled in "hw_params"/"hw_free", respectively.
+	 */
+	ret = clk_prepare_enable(aiu->i2s.clks[PCLK].clk);
+	if (ret) {
+		dev_err(dai->dev, "failed to enable PCLK: %d\n", ret);
+		return ret;
+	}
+	ret = clk_prepare_enable(aiu->i2s.clks[MIXER].clk);
+	if (ret) {
+		dev_err(dai->dev, "failed to enable MIXER: %d\n", ret);
+		clk_disable_unprepare(aiu->i2s.clks[PCLK].clk);
+		return ret;
+	}
+	ret = clk_prepare_enable(aiu->i2s.clks[AOCLK].clk);
+	if (ret) {
+		dev_err(dai->dev, "failed to enable AOCLK: %d\n", ret);
+		clk_disable_unprepare(aiu->i2s.clks[MIXER].clk);
+		clk_disable_unprepare(aiu->i2s.clks[PCLK].clk);
+		return ret;
+	}
 
-	return ret;
+	return 0;
 }
 
 static void aiu_encoder_i2s_shutdown(struct snd_pcm_substream *substream,
 				     struct snd_soc_dai *dai)
 {
 	struct aiu *aiu = snd_soc_component_get_drvdata(dai->component);
+	struct gx_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
+	struct gx_iface *iface = ts->iface;
+
+	if (!snd_soc_dai_active(dai))
+		iface->rate = 0;
+
+	clk_disable_unprepare(aiu->i2s.clks[AOCLK].clk);
+	clk_disable_unprepare(aiu->i2s.clks[MIXER].clk);
+	clk_disable_unprepare(aiu->i2s.clks[PCLK].clk);
+}
 
-	clk_bulk_disable_unprepare(aiu->i2s.clk_num, aiu->i2s.clks);
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
+	.prepare	= aiu_encoder_i2s_prepare,
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


