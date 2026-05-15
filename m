Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBCDECD4F4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 15:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C6mWlulhIjJ+KVaCp0+AQJ0i2SOXLwY0ch+ls2yqanI=; b=h9UBq38nWq4afGcdJXTsvZUvGW
	7KElCYOk9GptiRpYkWzCfpQFr8aG7Kc7T+778sFZcaTa7CzU51oC9rre/Ie9FVXGU0GYn9OlpkiE5
	RfzRbbTGuDhA8nc+dwNzWYhu1ftxpT1x29+faWiCKCi8tKclC/T0AifJ4dU6QzdabaGnNPgQ6nerq
	WlzoNJg9whHICkaf7RG9PEbNibRUG+JxeAFgaQZxL6UvsdWherxVhNb/H7x6nuG2wSGraN/kRp+Yd
	fOAixZnVYJe+13US9VW+1aAXQdbd+pT7H4FgT5w5kJBeVjFtVe6d+u8Qknj0tt7Uxyar3BVb42S1w
	ueR/quvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNuCC-00000008fC0-47aV;
	Fri, 15 May 2026 15:11:24 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNuC9-00000008f8M-39hN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 15:11:22 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-48e82c23840so51978335e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 08:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778857880; x=1779462680; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C6mWlulhIjJ+KVaCp0+AQJ0i2SOXLwY0ch+ls2yqanI=;
        b=U5H+R+QSptQadVZNKWbykvwqNeholTPRa03GdOfVhVJGQLNGk3HQTniODNmJ2W9jGk
         otGMHrXFaXIcPIWlskg5erjxvTyxdSsL3voTSND4f5xfiiXhROTBjJhVZqEB+qpqivmq
         VZqimRK48dTNFGLVB8N1ClV68Xb1JF49rmLhjBaY1s3swCzDR/+SUWy5qIbWvEgddE2+
         kC8IAKm7ApP6II++KSKljBwHmFyd/fcvbbcxpGFq8aqaijKMslY1+M2/+Mmk4jilIBKy
         VENUiEwNF3W50jHPoCRTbTQkXx7C2fxUyaXMmQstpIcGFLqEsumt9uHeQuVklxl8D9+n
         IAyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778857880; x=1779462680;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C6mWlulhIjJ+KVaCp0+AQJ0i2SOXLwY0ch+ls2yqanI=;
        b=pMJpeYUf0EbDPDgTI1NdD45+R6w3WUI23AAP54Gd5jHMgRGp0LO7iOonjP9PAGW0Vf
         YXG8ZvRdqbEhmffkxHFPHZVJs06E7UNiIu5TvI/UEeR6DEkQ4vBgvmkz88Za8//diKtN
         xyQxuRVWOGCsPQ+dgX2AtSeZzXn1oJz4yYp98OdHRcJ/raZLvR4Q4qxJbLEWDPn/JZyu
         xs7PJ3XYWkDeYofZo0HTr8uSX7Jv88qsWqa97AQ/IO1BHPmakgAFrJiIr4xDvDqRWaYn
         CJsBGWaY+aQlV8lwN5UFsX6KdtGWQkeneSvgwjFW/4vhVnKCIdDX7Xo/VtVUsmBgp1W4
         tOcw==
X-Forwarded-Encrypted: i=1; AFNElJ/ooPYkd5yq7cDp8DBmYpImOgb18IzOsbjB2lTy2GQGNw82pHTuOZ5M+Rg6APQA82Wkm74gMQUaJckxBA/YCh7O@lists.infradead.org
X-Gm-Message-State: AOJu0YzMFm+fxR4c1NilTE3/xJpdYyVg7VGBSPK0RSovmpSVF4KTlDQy
	l7D3ra0PQtUiB5Nd+Wd1CMFg9h1sGBlol0MnHKEqK6L7Re1LLCn0ADRxMlGWBMszx/Q=
X-Gm-Gg: Acq92OHZ7PQNIQYyQkx8p/JhogzHpUl5wrs1AIFeESPvj873qZ7AMP6GQEnCIhiN6xK
	Qi89ZciLTxqP2N9ZXM+9mskJGXq81rsnJEmnKIKNtzfrLdF/A9RIN18H0ZitgQEc6aZlEBZV9Kl
	Bq7jfj5ko3ZGtSeQo802d0unn57nB30Td1x/6PiA4+p2VQ7ZlNC14AgnL1mzfXGxCaszdfWzi9i
	o5DCFmrSdNNW/f21HG0wPpSFOZW8F4pg4Gl6hSO8168UMYo4htwLslh5SWluzua5IlNIlVp/2us
	wUcQtvlQLAJ+ez+Oafzghgr3VFEHSWnTbQE3SeInOubGeL57ru42u+i2QDmG4ezsv6KGQNcVCFk
	TRtRvHrxV3T6FhezBa8QC8+wlDEysSo/QHxdSIPc0ruQc3CdyoVhee/Npf+erPKSSoeqrsxqjEp
	YOyJM3Qj8SpjUWCXh3GmSJGrfZ1Bcs8+4=
X-Received: by 2002:a05:600c:6992:b0:48e:6f39:f7be with SMTP id 5b1f17b1804b1-48fe60ea533mr59171235e9.10.1778857879891;
        Fri, 15 May 2026 08:11:19 -0700 (PDT)
Received: from [127.0.1.1] ([151.41.223.93])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a19c2dsm15262062f8f.21.2026.05.15.08.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 08:11:18 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Fri, 15 May 2026 17:10:40 +0200
Subject: [PATCH 4/4] ASoC: meson: aiu: use aiu-formatter-i2s to format I2S
 output data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-reshape-aiu-as-axg-v1-4-53b457784ff3@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6060; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=QAXbc3wWqSC9H0GdnYojichQpjbJWMTmLX6rrahyWPc=;
 b=owGbwMvMwCF2z3ty7kUrRgbG02pJDFns5hO+L3dLkz56L3furj2Jsw65ZDWbeb8TihIUiDF6n
 TT3bf2pjlIWBjEOBlkxRRaW6fd+F5SqPTROOFkAM4eVCWQIAxenAExEUpLhr1i2b8Ud/8nHa6Qe
 pel9PSH3erOa49tdG7a4r3pygP39BhuGv+Lldy7t2Hp9pv5+Ri/mzxrxuq6eOjfv1rK+ETu4+dr
 KNdwA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_081121_835922_8C05389F 
X-CRM114-Status: GOOD (  19.29  )
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

Create a new DAPM widget for "I2S formatter" and place it on the path
between FIFO and output DAI interface. Remove I2S output formatting code
from aiu-encoder-i2s since it's now implemented from aiu-formatter-i2s.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/aiu-encoder-i2s.c | 56 ---------------------------------------
 sound/soc/meson/aiu.c             | 30 ++++++++++++++++++---
 sound/soc/meson/aiu.h             |  1 +
 3 files changed, 27 insertions(+), 60 deletions(-)

diff --git a/sound/soc/meson/aiu-encoder-i2s.c b/sound/soc/meson/aiu-encoder-i2s.c
index 39accd396affb8beb49fa7cca394244730b24574..9f935a93aeab7a27f880fbde2d29041a4802e3a3 100644
--- a/sound/soc/meson/aiu-encoder-i2s.c
+++ b/sound/soc/meson/aiu-encoder-i2s.c
@@ -13,13 +13,6 @@
 #include "gx-formatter.h"
 #include "gx-interface.h"
 
-#define AIU_I2S_SOURCE_DESC_MODE_8CH	BIT(0)
-#define AIU_I2S_SOURCE_DESC_MODE_24BIT	BIT(5)
-#define AIU_I2S_SOURCE_DESC_MODE_32BIT	BIT(9)
-#define AIU_I2S_SOURCE_DESC_MODE_SPLIT	BIT(11)
-#define AIU_RST_SOFT_I2S_FAST		BIT(0)
-
-#define AIU_I2S_DAC_CFG_MSB_FIRST	BIT(2)
 #define AIU_CLK_CTRL_I2S_DIV_EN		BIT(0)
 #define AIU_CLK_CTRL_I2S_DIV		GENMASK(3, 2)
 #define AIU_CLK_CTRL_AOCLK_INVERT	BIT(6)
@@ -37,49 +30,6 @@ static void aiu_encoder_i2s_divider_enable(struct snd_soc_component *component,
 				      enable ? AIU_CLK_CTRL_I2S_DIV_EN : 0);
 }
 
-static int aiu_encoder_i2s_setup_desc(struct snd_soc_component *component,
-				      struct snd_pcm_hw_params *params)
-{
-	/* Always operate in split (classic interleaved) mode */
-	unsigned int desc = AIU_I2S_SOURCE_DESC_MODE_SPLIT;
-
-	/* Reset required to update the pipeline */
-	snd_soc_component_write(component, AIU_RST_SOFT, AIU_RST_SOFT_I2S_FAST);
-	snd_soc_component_read(component, AIU_I2S_SYNC);
-
-	switch (params_physical_width(params)) {
-	case 16: /* Nothing to do */
-		break;
-
-	case 32:
-		desc |= (AIU_I2S_SOURCE_DESC_MODE_24BIT |
-			 AIU_I2S_SOURCE_DESC_MODE_32BIT);
-		break;
-
-	default:
-		return -EINVAL;
-	}
-
-	switch (params_channels(params)) {
-	case 2: /* Nothing to do */
-		break;
-	case 8:
-		desc |= AIU_I2S_SOURCE_DESC_MODE_8CH;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	snd_soc_component_update_bits(component, AIU_I2S_SOURCE_DESC,
-				      AIU_I2S_SOURCE_DESC_MODE_8CH |
-				      AIU_I2S_SOURCE_DESC_MODE_24BIT |
-				      AIU_I2S_SOURCE_DESC_MODE_32BIT |
-				      AIU_I2S_SOURCE_DESC_MODE_SPLIT,
-				      desc);
-
-	return 0;
-}
-
 static int aiu_encoder_i2s_set_legacy_div(struct snd_soc_component *component,
 					  struct gx_stream *ts,
 					  unsigned int bs)
@@ -201,12 +151,6 @@ static int aiu_encoder_i2s_hw_params(struct snd_pcm_substream *substream,
 	ts->width = params_width(params);
 	ts->channels = params_channels(params);
 
-	ret = aiu_encoder_i2s_setup_desc(component, params);
-	if (ret) {
-		dev_err(dai->dev, "setting i2s desc failed: %d\n", ret);
-		return ret;
-	}
-
 	ret = aiu_encoder_i2s_set_clocks(component, ts);
 	if (ret) {
 		dev_err(dai->dev, "setting i2s clocks failed: %d\n", ret);
diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index f2890111c1d2cfa2213bf01849957a796744b9ae..b09c2058eacaf2998d0d3cd6682910f94ec89912 100644
--- a/sound/soc/meson/aiu.c
+++ b/sound/soc/meson/aiu.c
@@ -29,13 +29,22 @@ static SOC_ENUM_SINGLE_DECL(aiu_spdif_encode_sel_enum, AIU_I2S_MISC,
 static const struct snd_kcontrol_new aiu_spdif_encode_mux =
 	SOC_DAPM_ENUM("SPDIF Buffer Src", aiu_spdif_encode_sel_enum);
 
-static const struct snd_soc_dapm_widget aiu_cpu_dapm_widgets[] = {
-	SND_SOC_DAPM_MUX("SPDIF SRC SEL", SND_SOC_NOPM, 0, 0,
-			 &aiu_spdif_encode_mux),
+#define AIU_WIDGET_SPDIF_SRC_SEL	0
+#define AIU_WIDGET_I2S_FORMATTER	1
+
+static struct snd_soc_dapm_widget aiu_cpu_dapm_widgets[] = {
+	[AIU_WIDGET_SPDIF_SRC_SEL] =
+		SND_SOC_DAPM_MUX("SPDIF SRC SEL", SND_SOC_NOPM, 0, 0,
+				 &aiu_spdif_encode_mux),
+	[AIU_WIDGET_I2S_FORMATTER] =
+		SND_SOC_DAPM_PGA_E("I2S Formatter", SND_SOC_NOPM, 0, 0, NULL, 0,
+				   gx_formatter_event,
+				   (SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_PRE_PMD)),
 };
 
 static const struct snd_soc_dapm_route aiu_cpu_dapm_routes[] = {
-	{ "I2S Encoder Playback", NULL, "I2S FIFO Playback" },
+	{ "I2S Formatter", NULL, "I2S FIFO Playback" },
+	{ "I2S Encoder Playback", NULL, "I2S Formatter" },
 	{ "SPDIF SRC SEL", "SPDIF", "SPDIF FIFO Playback" },
 	{ "SPDIF SRC SEL", "I2S", "I2S FIFO Playback" },
 	{ "SPDIF Encoder Playback", NULL, "SPDIF SRC SEL" },
@@ -172,6 +181,11 @@ static const struct regmap_config aiu_regmap_cfg = {
 	.max_register	= 0x2ac,
 };
 
+const struct gx_formatter_driver aiu_formatter_i2s_drv = {
+	.regmap_cfg	= &aiu_regmap_cfg,
+	.ops		= &aiu_formatter_i2s_ops,
+};
+
 static int aiu_clk_bulk_get(struct device *dev,
 			    const char * const *ids,
 			    unsigned int num,
@@ -291,6 +305,14 @@ static int aiu_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	/* Allocate the aiu-formatter into its widget */
+	ret = gx_formatter_create(dev, &aiu_cpu_dapm_widgets[AIU_WIDGET_I2S_FORMATTER],
+				  &aiu_formatter_i2s_drv, map);
+	if (ret) {
+		dev_err(dev, "Failed to allocate aiu formatter\n");
+		goto err;
+	}
+
 	/* Register the hdmi codec control component */
 	ret = aiu_hdmi_ctrl_register_component(dev);
 	if (ret) {
diff --git a/sound/soc/meson/aiu.h b/sound/soc/meson/aiu.h
index 68310de0bdf7a97d8de2ff306c159248ee9b0ede..7d0b98c1f351b3c526ca06c43a4c04ee5f4b6dfa 100644
--- a/sound/soc/meson/aiu.h
+++ b/sound/soc/meson/aiu.h
@@ -61,6 +61,7 @@ extern const struct snd_soc_dai_ops aiu_fifo_i2s_dai_ops;
 extern const struct snd_soc_dai_ops aiu_fifo_spdif_dai_ops;
 extern const struct snd_soc_dai_ops aiu_encoder_i2s_dai_ops;
 extern const struct snd_soc_dai_ops aiu_encoder_spdif_dai_ops;
+extern const struct gx_formatter_ops aiu_formatter_i2s_ops;
 
 #define AIU_IEC958_BPF			0x000
 #define AIU_958_MISC			0x010

-- 
2.39.5


