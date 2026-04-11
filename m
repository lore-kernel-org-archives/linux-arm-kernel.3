Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2BBF3ED57
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 14:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ecSMrOBx0pzo4y3143wojd4syVHZTf/XbWi3AqukMso=; b=oukLisggiwtAF3x8WGToPREjaq
	abuZlR/H06gwZXUmQRmnfaPWrtYW49gD4m1U5LXA2Pw/uEUV3l4P6vId3ULl1XDQJfre4gAQqudfy
	ekFNIoXWQbnfCHKlSGZTwPwHOXpjgrKS+lyqZLEwChQc7LA3YNs2MsMx1SlFumjFIMx7XUpBXpoPx
	uFCbqmxNtIL01LLmTRbuvrbMBoH9kE7JUjMb97IaqMllWzzK9SQ5BmMUKRXm2+csThg+v4MiG0M11
	F8p2JrhhGqSark5UAMdshjOZadeTszzkYH9s0NjKRrG2dOsH1paINOGm91Xal/f+XVlzosL8zEVQp
	leBnu8fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBZml-0000000DXjv-18Le;
	Sat, 11 Apr 2026 14:58:11 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBZmf-0000000DXcI-1mUB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Apr 2026 14:58:06 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-488c2690057so28496075e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Apr 2026 07:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775919484; x=1776524284; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ecSMrOBx0pzo4y3143wojd4syVHZTf/XbWi3AqukMso=;
        b=E6sdiZjG5XlQ4qAwSz1rMbhxLD9vvam6Vm19qhU9MljQFd/82VLqoJe+T54eQSIUfp
         tbx66yyhlYXL0zVhE1fZTSkQh0Bv2ynL1ZxPl1xxDktc5AQETmH+V99ageKFbaR4wNkH
         l2LPlbOM2kLr+fQ3SnnuIjWzRCHvOvmb6/r4exGRI0qpsKAFNcO5B2EDFCSLkjjACo1G
         UlPHTnVlzKWr6vF1c/7yNNgPvpuh9Qucg2+EDTBIP4Xbs0vS4sZqgBfl1tkzX/+S11Vc
         Erw+NTFRizEM64o4QekkyUARjBGYgs71wrSdtAvL7RIPK9zApBF4yabfzNR2371q6PJS
         R2Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775919484; x=1776524284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ecSMrOBx0pzo4y3143wojd4syVHZTf/XbWi3AqukMso=;
        b=awJnUek6xJh9j1VgXZXAqbQgeB3jgbnKiNC1i2HJ90XSAZlTzcvG0Nb+ITms5i0eIa
         lZn0v++7GxpNOPWtBId5u+dwNoAYrFYz+PD36DYcrOYePI+MFgdlUZR4wUW11WhTiL56
         1mzQKq6v8Qz3ky1YamzYf+mDeVxN7oC1jHAaIRE4KJK8FfI0oDhy/8AIlXpxZMiPd48l
         c9awDdJC6p/v9lCEcgAPKVHUrFJfLhLVjccJojJxy61miTUrPeCy8W4aYeOFSpYuRv50
         4c8g7pBmiJETSdJlQsmJpi03EQ3j6SGyZ78jt5aPEkg5JtC1MlI6ppu9mVJANxv44yNy
         yqEA==
X-Forwarded-Encrypted: i=1; AJvYcCVORjAxpRZDbl1GijAc02engMJcX1qsDQ+ys3Jyq0UKn3EKIyafgeZ5HLXQ3lAeOajIt7XjJbbw4j8R9nvLa190@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8wLmdgexLC15fQFkCus0OI/Ipwltl/ox53Eaf90O50ENCjbYz
	iLtm/IrxeUciWw0KqT8k2z41kuA6WZ7xIdfP9/MLJBhRTSTXwZG7ZRDpCJixwMjalNE=
X-Gm-Gg: AeBDietVMft4kl7zjcvi2wH0NGisx0PhkUwq4m9Ze1s1kqtMWrm8dTcMG3JHdUokugK
	zV8WNEKXhjXeZZT1RYwCCMq+fkpehMXqvpkF9vWaKzN6Uo2RznK1j+d2CrbtlRZz5K1MTFYkYuP
	yoxMXLAuSnDA0h/QKDKx6t2bpHadTzvarNMGrSQHfQcbE2NVb+BXT9WCOt1Cc0mHGSMrj2VIjbs
	9YY5zewqN4yLHAY/74FWVBr3bby+ZYvnKgRoAVQJxOxDQ3vZTKdqXRAjuojKaDLWUxnDhbQU+FP
	5rsXQSYlXlxUOU/QFp+TrjgUX14nXc9naYKio2vRbwnEKTPBt17eixrgA9DMwqEUcK1ZNribjYU
	g6vJSr/VRl8wJ4RhF41LMHM7kN7zoB52gss/7CzZuvMFzLxh1WoXEm3PPZRQ+F9lFwujX0AWtoi
	2z93f/WV+qZK6nVuOVlnJ5
X-Received: by 2002:a05:600c:3150:b0:488:c80c:c236 with SMTP id 5b1f17b1804b1-488d68057f3mr100729095e9.5.1775919483749;
        Sat, 11 Apr 2026 07:58:03 -0700 (PDT)
Received: from [127.0.1.1] ([151.61.248.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5dc7070sm48882375e9.10.2026.04.11.07.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 07:58:03 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sat, 11 Apr 2026 16:57:29 +0200
Subject: [PATCH RFC v2 04/11] ASoC: meson: aiu: use aiu-formatter-i2s to
 format I2S output data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-audin-rfc-v2-4-4c8a6ec5fcab@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6044; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=GvUUnavXTrTzCeaOmfiAqtoNpa4n5tFwZBrof78Pboc=;
 b=owGbwMvMwCF2z3ty7kUrRgbG02pJDJm3EoujFh9NYsnautmp8dAxR+7Vs6p+Mk29eWM2113x6
 v0WBxtSO0pZGMQ4GGTFFFlYpt/7XVCq9tA44WQBzBxWJpAhDFycAjCRPDaGv+JsavcKLCRMpnq7
 Vh9RLuvZdnKv8/Sw4ypmCxeJtznNWs/IcPC88j/JS+EO1450NvvHHSnfUnn7yZdlRnlH7T8qqGw
 4wwwA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_075805_505864_13A3834A 
X-CRM114-Status: GOOD (  18.88  )
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
index 76a33878b9df101ad62b18abd8cc14b7908c2c42..ce28850fde23f4fd1872c4364e13588138ba26ba 100644
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
@@ -194,12 +144,6 @@ static int aiu_encoder_i2s_hw_params(struct snd_pcm_substream *substream,
 	ts->width = params_width(params);
 	ts->channels = params_channels(params);
 
-	ret = aiu_encoder_i2s_setup_desc(component, params);
-	if (ret) {
-		dev_err(dai->dev, "setting i2s desc failed\n");
-		return ret;
-	}
-
 	ret = aiu_encoder_i2s_set_clocks(component, ts);
 	if (ret) {
 		dev_err(dai->dev, "setting i2s clocks failed\n");
diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index f2890111c1d2cfa2213bf01849957a796744b9ae..bb3e0364190766ab4ce9ea3ebd313eecf220a244 100644
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
+		return ret;
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


