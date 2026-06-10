Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0208CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 21:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b5n/WB65Bulk0t5EdzRIcppU+woA0ls1FJjQ79kkwdI=; b=VjaEQ+8FoAeR4wjxeF2FoyFEqD
	AJcds02t6aLH0ckccEOdW8pZdl338ZFzSa7qK46BT0H81RDI+prQ43F6rX2obe2ZMVIECqMgX3yee
	dMKHie0WgZTEMiBewtoCs19MhVFhsZp8h0nb3zWg35JXUkdzNzFNsTNJazEUjjUnbDT/DeDdBYb6d
	14eS/u1Lolyi1xXBeHwkWncS4ZNyeaboZqW8o8PLMSuZ3ujNFrR0s9JFG+At7ALRldAUSC/WOSzvB
	/V6Ib9T1VC1sgWZ3kkbNEd4xA9wIDPlqVojEeiKGwNvdGlEBZh4gKFmeAPkvlkLMGMA+1eY3rDynm
	htiNPzsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXQUc-00000008NTG-32P1;
	Wed, 10 Jun 2026 21:29:46 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXQUY-00000008NPI-0NTn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 21:29:44 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-490acbb0f89so49827415e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 14:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781126980; x=1781731780; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b5n/WB65Bulk0t5EdzRIcppU+woA0ls1FJjQ79kkwdI=;
        b=Jr9Fbf3VCr574a4nBVfN28576fV1weuctjMuJfjUDFIENHuPgDnefhVW6oUAYlZMUA
         sl1sh1mu1Z691jnVrPmX8Gb9yr3/4iAWYVYlHcilYypD/xgkH65FAJr5FsiZjBPqVphC
         jVz+0rd1k5mZQNoH1NWxLqObZ7F5Gulqn+toBqzMIYGH/7ngYSkdIPRZV7gciF70dWVr
         EQ1qMlUn7LCGpQPsO43DOrWtBI9Z5gJ3/6LinWFl3iWSbHapRhxGddYVnftLe4yXJJIW
         53DDB+bXiqd6JjpEQkiL3Kx8hJ8wvUuCo2h3A5v7l16Q+VNX0Areo2Wg62MaPvuBDAah
         oeGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781126980; x=1781731780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b5n/WB65Bulk0t5EdzRIcppU+woA0ls1FJjQ79kkwdI=;
        b=IxaxeluTyiuwSZXo/bexP7ipphRB1wyVbY83KQIvm2ZV3C1yRJ6t/AJ2rgIODAE35k
         qJoLcMK7WrfikTYsBuQJFZHc4u9ookjVb0L771nbPNQA74cq6C2gfXy4O+Uo0DQUoPLn
         BKJK96KryMtDxU6n7v2HwpzaDvP5+/6NgIk1fJh0c12pMoz17UEskFclcx3kT9+OVKGe
         9COYc+lPIlZ1NJ366KvSL62QPLux4tN+Tj/22Ai7ggGZhW7dHZxEKVDx4XRYVHhr8rjI
         ytj5onX6RHL5lzU1znBFLXnSJanEWGu2MOWerDRERdpLP/zu7o1ENkX7P5lkKBrZRfMm
         6gfQ==
X-Forwarded-Encrypted: i=1; AFNElJ+1G5HXgC9sTENnXS9Y2giH+k6Rz73SwFevFp3+RuKbJR1Z3JALE1m+gdaAmI9W4goFcH/PqCjfvWvVSVsxwqCd@lists.infradead.org
X-Gm-Message-State: AOJu0Yzi6xBgVAsxcFyfda3SeEoEVtUkFJdDUvV+95QvEJX14tBiyQ4K
	P69ExodPPQcv7oy5Bnht68fpcS8n6734XtMzTKN1tTzRVaUYNcTW4x86Y6a74qPENAVxn8EKN4k
	BDBqvFS4=
X-Gm-Gg: Acq92OGbO9oOgEdeUQAqJKl+ZMaMW47ZJE8qlX+f2iwsvaE0+gKOKNocczA9ARDJnaR
	AnsFAttrkvUZgPgiRzK5CgHZW6lBmBQcPzGEgKjwtpl2xl7ZZML+GkxCvSjGGGP8T9wwZanNESr
	awiqLL7DIoRLAk9hx5QOiFdaCb0ixhLNB6CILjq4CCCZhqKvkh84J69GCNOyEQ5fq5BqeECD8Hv
	5Exp4odMGCHPlqnYrELsB9yq1wJjh7WxMrM+CDjiGeQg4jUSEYobIUyHlQ3/pmAw/FlqXfB7OFJ
	6RMTFWC3Ba2BwDHecym2BDAQLulFaJSr9Ttbfn3gv/aR+cM2mDqMZCnF/ttfd5epdQuuzTtQEk2
	ZCxIygeVI9BlR7YHtKeMPb9srPJXCNdGeH1BHePRstVSdlRUjp5fo1F112I2KYR6fAwDX1RxLFl
	Z6LckOk3ozCiF//s8thcSaRpq6NeIeQG4=
X-Received: by 2002:a05:600c:6087:b0:48a:8b02:ae91 with SMTP id 5b1f17b1804b1-490c25b0231mr457881835e9.11.1781126980260;
        Wed, 10 Jun 2026 14:29:40 -0700 (PDT)
Received: from [127.0.1.1] ([151.61.238.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e4228768sm970965e9.0.2026.06.10.14.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 14:29:39 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Wed, 10 Jun 2026 23:29:26 +0200
Subject: [PATCH v2 2/4] ASoC: meson: aiu-encoder-i2s: prepare for multiple
 streams
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-reshape-aiu-as-axg-v2-2-cac3663a8b51@baylibre.com>
References: <20260610-reshape-aiu-as-axg-v2-0-cac3663a8b51@baylibre.com>
In-Reply-To: <20260610-reshape-aiu-as-axg-v2-0-cac3663a8b51@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11845; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=pgscRYSf0CnocgVAT3NBszrMFG6puvajLA4Nw2Ybqg0=;
 b=owGbwMvMwCF2z3ty7kUrRgbG02pJDFma1x02TC8IZFvQdb8z83t6V+eau8YT+x0X8e1X3xB0W
 HGns29oRykLgxgHg6yYIgvL9Hu/C0rVHhonnCyAmcPKBDKEgYtTACay/yrD/yR5g+UKK3f6POQs
 ldu/eMcTyQCPqh96qc65eZbX/2Wx1jAyXHn650n6esN/v7RN9LL6L8zVtrD9scFfet367wemJnr
 eZgUA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_142942_197283_0393D171 
X-CRM114-Status: GOOD (  26.76  )
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

aiu-encoder-i2s is going to be the interface that handles both playback
and capture, so this commit does all the required changes to prepare
for that since so far it only handled playback:
- probe/remove functions are added to allocate/free per stream data,
  respectively.
- 'struc gx_iface' and 'struct gx_stream' are used to store interface or
  stream associated data, respecively.
- interface wide rate symmetry is enforced.
- quirks on bclk are also enforced if/when necessary.

Clock-wise instead of bulk enabling all the clocks on startup and disabling
them on shutdown, only the peripheral's internal ones are enabled/disabled
in those functions, whereas MCLK and I2S clock divider are handled in
prepare/hw_free.

Finally a trigger() callback is also added to start/stop the associated
I2S data formatter.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/aiu-encoder-i2s.c | 207 ++++++++++++++++++++++++++++++++++----
 sound/soc/meson/aiu.h             |   3 +
 2 files changed, 193 insertions(+), 17 deletions(-)

diff --git a/sound/soc/meson/aiu-encoder-i2s.c b/sound/soc/meson/aiu-encoder-i2s.c
index 3b4061508c18047fe8d6f3f98061720f8ce238f2..f50b03824ad280afabb31eecc20ccb855defa11e 100644
--- a/sound/soc/meson/aiu-encoder-i2s.c
+++ b/sound/soc/meson/aiu-encoder-i2s.c
@@ -10,6 +10,8 @@
 #include <sound/soc-dai.h>
 
 #include "aiu.h"
+#include "gx-formatter.h"
+#include "gx-interface.h"
 
 #define AIU_I2S_SOURCE_DESC_MODE_8CH	BIT(0)
 #define AIU_I2S_SOURCE_DESC_MODE_24BIT	BIT(5)
@@ -112,6 +114,9 @@ static int aiu_encoder_i2s_set_more_div(struct snd_soc_component *component,
 					struct snd_pcm_hw_params *params,
 					unsigned int bs)
 {
+	struct aiu *aiu = snd_soc_component_get_drvdata(component);
+	struct gx_iface *iface = &aiu->i2s.iface;
+
 	/*
 	 * NOTE: this HW is odd.
 	 * In most configuration, the i2s divider is 'mclk / blck'.
@@ -126,6 +131,18 @@ static int aiu_encoder_i2s_set_more_div(struct snd_soc_component *component,
 			return -EINVAL;
 		}
 		bs += bs / 2;
+		iface->bs_quirk = true;
+	} else {
+		/*
+		 * If the bs quirk is currently applied for one stream and another
+		 * ones tries to setup a configuration for which the quirk is
+		 * not required, then fail.
+		 */
+		if (iface->bs_quirk) {
+			dev_err(component->dev,
+				"bclk requirements are incompatible with active stream\n");
+			return -EINVAL;
+		}
 	}
 
 	/* Use CLK_MORE for mclk to bclk divider */
@@ -145,14 +162,15 @@ static int aiu_encoder_i2s_set_clocks(struct snd_soc_component *component,
 				      struct snd_pcm_hw_params *params)
 {
 	struct aiu *aiu = snd_soc_component_get_drvdata(component);
+	struct gx_iface *iface = &aiu->i2s.iface;
 	unsigned int srate = params_rate(params);
 	unsigned int fs, bs;
 	int ret;
 
 	/* Get the oversampling factor */
-	fs = DIV_ROUND_CLOSEST(clk_get_rate(aiu->i2s.clks[MCLK].clk), srate);
+	fs = DIV_ROUND_CLOSEST(iface->mclk_rate, srate);
 
-	if (fs % 64)
+	if ((fs % 64) || (fs == 0))
 		return -EINVAL;
 
 	/* Send data MSB first */
@@ -188,24 +206,59 @@ static int aiu_encoder_i2s_hw_params(struct snd_pcm_substream *substream,
 				     struct snd_pcm_hw_params *params,
 				     struct snd_soc_dai *dai)
 {
+	struct gx_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
+	struct gx_iface *iface = ts->iface;
 	struct snd_soc_component *component = dai->component;
 	int ret;
 
-	/* Disable the clock while changing the settings */
-	aiu_encoder_i2s_divider_enable(component, false);
+	/*
+	 * Enforce interface wide rate symmetry only if there is more than
+	 * 1 stream active.
+	 */
+	if (snd_soc_dai_active(dai) > 1) {
+		if (iface->rate && iface->rate != params_rate(params)) {
+			dev_err(dai->dev, "can't set iface rate (%d != %d)\n",
+				iface->rate, params_rate(params));
+			return -EINVAL;
+		}
+	}
 
 	ret = aiu_encoder_i2s_setup_desc(component, params);
 	if (ret) {
-		dev_err(dai->dev, "setting i2s desc failed\n");
+		dev_err(dai->dev, "setting i2s desc failed: %d\n", ret);
 		return ret;
 	}
 
 	ret = aiu_encoder_i2s_set_clocks(component, params);
 	if (ret) {
-		dev_err(dai->dev, "setting i2s clocks failed\n");
+		dev_err(dai->dev, "setting i2s clocks failed: %d\n", ret);
 		return ret;
 	}
 
+	iface->rate = params_rate(params);
+	ts->physical_width = params_physical_width(params);
+	ts->width = params_width(params);
+	ts->channels = params_channels(params);
+
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
 	aiu_encoder_i2s_divider_enable(component, true);
 
 	return 0;
@@ -214,9 +267,24 @@ static int aiu_encoder_i2s_hw_params(struct snd_pcm_substream *substream,
 static int aiu_encoder_i2s_hw_free(struct snd_pcm_substream *substream,
 				   struct snd_soc_dai *dai)
 {
+	struct gx_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
+	struct gx_iface *iface = ts->iface;
 	struct snd_soc_component *component = dai->component;
 
-	aiu_encoder_i2s_divider_enable(component, false);
+	/*
+	 * If this is the last substream being closed then disable the i2s
+	 * clock divider and clear 'iface->rate'.
+	 */
+	if (snd_soc_dai_active(dai) <= 1) {
+		aiu_encoder_i2s_divider_enable(component, 0);
+		iface->rate = 0;
+		iface->bs_quirk = false;
+	}
+
+	if (ts->clk_enabled) {
+		clk_disable_unprepare(ts->iface->mclk);
+		ts->clk_enabled = false;
+	}
 
 	return 0;
 }
@@ -224,6 +292,8 @@ static int aiu_encoder_i2s_hw_free(struct snd_pcm_substream *substream,
 static int aiu_encoder_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
 	struct snd_soc_component *component = dai->component;
+	struct aiu *aiu = snd_soc_component_get_drvdata(component);
+	struct gx_iface *iface = &aiu->i2s.iface;
 	unsigned int inv = fmt & SND_SOC_DAIFMT_INV_MASK;
 	unsigned int val = 0;
 	unsigned int skew;
@@ -255,9 +325,12 @@ static int aiu_encoder_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
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
@@ -272,6 +345,7 @@ static int aiu_encoder_i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id,
 				      unsigned int freq, int dir)
 {
 	struct aiu *aiu = snd_soc_component_get_drvdata(dai->component);
+	struct gx_iface *iface = &aiu->i2s.iface;
 	int ret;
 
 	if (WARN_ON(clk_id != 0))
@@ -280,11 +354,15 @@ static int aiu_encoder_i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id,
 	if (dir == SND_SOC_CLOCK_IN)
 		return 0;
 
-	ret = clk_set_rate(aiu->i2s.clks[MCLK].clk, freq);
-	if (ret)
-		dev_err(dai->dev, "Failed to set sysclk to %uHz", freq);
+	ret = clk_set_rate(iface->mclk, freq);
+	if (ret) {
+		dev_err(dai->dev, "Failed to set sysclk to %uHz: %d", freq, ret);
+		return ret;
+	}
 
-	return ret;
+	iface->mclk_rate = freq;
+
+	return 0;
 }
 
 static const unsigned int hw_channels[] = {2, 8};
@@ -305,15 +383,35 @@ static int aiu_encoder_i2s_startup(struct snd_pcm_substream *substream,
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
@@ -321,14 +419,89 @@ static void aiu_encoder_i2s_shutdown(struct snd_pcm_substream *substream,
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
+		struct gx_stream *ts;
+
+		ts = snd_soc_dai_dma_data_get(dai, stream);
+		if (ts)
+			gx_stream_free(ts);
+
+		snd_soc_dai_dma_data_set(dai, stream, NULL);
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
+	iface->mclk_rate = clk_get_rate(iface->mclk);
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


