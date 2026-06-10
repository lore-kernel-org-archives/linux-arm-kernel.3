Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8896ECD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 21:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HdSvP4OsE7eHoTjId0UaG2CyxblqVBvzSM5Fo0qLTpA=; b=nynoUaSEtTaE2HZeZreKvh44Ee
	QxYIRJCGYAKHRKqycLa3qsh/oikzh/mk6IfUxmNwh8n0JqqnmcHLdYWXVZAWb02qsVpWRlF/U31ot
	ZfMBdgnmMcMLOBKb57y1jQLd0A277ikwMpELKryEbLPTj9KKhaxQMy/Uh/75ubuBJ71GDUnjfQv3D
	Sf1M+X9CuFl/h4VwxHZSuytZUdZtwryfz924AOR9umOU+hefcbKm0oJbCD+j9NPwDUQWpmKOLeCKK
	OoBb3n3WYNroECq1s7eBzKuYHwYpyyGaJa1N1tZMEPv1u0VIhPjFYtyP8GvcYLUgTnXtC0LtP1kaX
	rkvFraQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXQUh-00000008NWb-1Acd;
	Wed, 10 Jun 2026 21:29:51 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXQUZ-00000008NQL-3keh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 21:29:46 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-490b7866869so79025035e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 14:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781126982; x=1781731782; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HdSvP4OsE7eHoTjId0UaG2CyxblqVBvzSM5Fo0qLTpA=;
        b=WEJRbpBXcuu8ikS9w4KCtU4kDlSRpZtzIjO+oHXVDIuSZyZbj/spauZGgUOyrdCkJP
         crZRcX1c2YlzwXl0UF4TuroFmugP4IbYGvTlwET9baijelkNKkjKi7aex6gbJXX0ZJ6H
         Cqf7K5lhfUS9cHsE+54oIMoVcVpDATsrzNknn5iGtYwL8qj3HPFmxtNB5uXuLefMKc/L
         Cc96vZQPG/E1cT8FyZ+6KaBC1Qu2aQod3/aHNkmXamrdQqgF7jgsthvCumgXazkXaqMV
         z48ZRl0bmFvSMDM45pbNT9qgPnfYusL26lEluCbKWvBqHJCiDtsxnmsXhNGSDV+OUn7A
         OauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781126982; x=1781731782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HdSvP4OsE7eHoTjId0UaG2CyxblqVBvzSM5Fo0qLTpA=;
        b=p//01W78H8/yMNXkdAtEvpOoxB/ixZ9GpG4KM9M4X6k9Fe02jLaOfIab6V+MTfjAzQ
         QqmQlEyaFPlwf56H/kc8mRIDLqfKGVJJXhVoLkj4/n1lP3ilr+xRBGUX2hCxWFT9AgyH
         WyrRkulX4qDTjr2rfpjJF9S2+QgN5tc5qY/4SrZa8+wqhSIkPT61E/omY6DQ+IKt8gbh
         RcRnYguQwTheUpyO2/JV3KJTkO8i1tAOPI9F+UnhaYwLtfjg2H0VQ3Jaz20h3jkrjhwp
         uVTSlgOTT7TXie5FKTZmZ8RgfPBgrHS066s3RRCkpv/vg2ZwZZqtRJI51vVdINIHJyjA
         6uJw==
X-Forwarded-Encrypted: i=1; AFNElJ8N//MgcQqP+swLltr56W0y+Czn7mcx/fqohD99HpTM3ME+FGkY1sVqOKmHt7qP6x0ksGfDWgHKP2K4dhVIMFE7@lists.infradead.org
X-Gm-Message-State: AOJu0YzKuUrkELl4yryeyLn+OB00D0uib3z8nuyfZf+z/vbkx06ygWti
	aoz/De7wnrqHOwRpiYJPFxPhA6J4RFFsjrVXmBI2j6PFph6iC2/hem8LSliQofCLvh6h2e3bwuZ
	EIyWPBqo=
X-Gm-Gg: Acq92OHBbRQ6K1N+WFwQCZQpx/yP5mbDPnZOFuEW8HA9cn1ElY6PKbyoBt9YoYa2ppT
	sU3YwaqZyj3jWWbTydNMgWHP7ed0GNk60c2ouqduFztmXGMJhMWtKr85Vs1QqSp/t0SvDcbXJ1s
	CLQ9VUtLw/Pw64rXN0rxLjS3PJKucqFQ/gSdA3vfi0MnzNA32em+aJJPRz8ZMJ03fScpiCgGvWF
	oc6yuzRIokY0TCL57XrdciAMTqdj0TitymjaKdndYY2O5FiDR2kihQIMbVVDt3o0eWhGv6Uf3wR
	P3+7N8kd1uXy86v2g0awL5sPzZWg96eKbrBTON97hd0mzazizRe7Bts8HRHvO9AodtsoEva4paZ
	sGCoVpOxGxUfw0XThVSiRyp1ENA0x10F38zSChqwJY1edMjwIGa5sjsd198qu9ag0tMXsW9tbsi
	uJsGWOb9KcfOFOLpcwiOQEZQYzQs072LV7yV9/VidvTQ==
X-Received: by 2002:a05:600d:6446:10b0:490:bccf:2bd6 with SMTP id 5b1f17b1804b1-490e2e29494mr5787235e9.15.1781126982292;
        Wed, 10 Jun 2026 14:29:42 -0700 (PDT)
Received: from [127.0.1.1] ([151.61.238.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e4228768sm970965e9.0.2026.06.10.14.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 14:29:42 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Wed, 10 Jun 2026 23:29:28 +0200
Subject: [PATCH v2 4/4] ASoC: meson: aiu: use aiu-formatter-i2s to format
 I2S output data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-reshape-aiu-as-axg-v2-4-cac3663a8b51@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7991; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=/h2Td7mUr6sv6XUhWr9Xcq7WvMFZwzP575T2baPy/Ds=;
 b=owGbwMvMwCF2z3ty7kUrRgbG02pJDFma1x2COF5w1rWmPDvsyMu7KsxGbZuhj/f+yfwLelrq7
 h1c9EW/o5SFQYyDQVZMkYVl+r3fBaVqD40TThbAzGFlAhnCwMUpABNpiWZkOLL1F/sOzeA12y7O
 z9z7PX6yvM9SM9bah3v5/Trsz2qfKGP4yfj1WP1cjlLvYotjP4/t5ZmXwx95fHka1zPrNy1bWA4
 ZMAMA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_142944_051641_C05BF56E 
X-CRM114-Status: GOOD (  23.92  )
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
 sound/soc/meson/aiu-encoder-i2s.c | 78 ++++++++++-----------------------------
 sound/soc/meson/aiu.c             | 32 ++++++++++++++--
 sound/soc/meson/aiu.h             |  1 +
 3 files changed, 48 insertions(+), 63 deletions(-)

diff --git a/sound/soc/meson/aiu-encoder-i2s.c b/sound/soc/meson/aiu-encoder-i2s.c
index f50b03824ad280afabb31eecc20ccb855defa11e..83b579e98f1c75ce03fea1c6ff4e99b2fedebe0c 100644
--- a/sound/soc/meson/aiu-encoder-i2s.c
+++ b/sound/soc/meson/aiu-encoder-i2s.c
@@ -13,13 +13,8 @@
 #include "gx-formatter.h"
 #include "gx-interface.h"
 
-#define AIU_I2S_SOURCE_DESC_MODE_8CH	BIT(0)
-#define AIU_I2S_SOURCE_DESC_MODE_24BIT	BIT(5)
-#define AIU_I2S_SOURCE_DESC_MODE_32BIT	BIT(9)
 #define AIU_I2S_SOURCE_DESC_MODE_SPLIT	BIT(11)
-#define AIU_RST_SOFT_I2S_FAST		BIT(0)
 
-#define AIU_I2S_DAC_CFG_MSB_FIRST	BIT(2)
 #define AIU_CLK_CTRL_I2S_DIV_EN		BIT(0)
 #define AIU_CLK_CTRL_I2S_DIV		GENMASK(3, 2)
 #define AIU_CLK_CTRL_AOCLK_INVERT	BIT(6)
@@ -37,49 +32,6 @@ static void aiu_encoder_i2s_divider_enable(struct snd_soc_component *component,
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
 					  struct snd_pcm_hw_params *params,
 					  unsigned int bs)
@@ -173,11 +125,6 @@ static int aiu_encoder_i2s_set_clocks(struct snd_soc_component *component,
 	if ((fs % 64) || (fs == 0))
 		return -EINVAL;
 
-	/* Send data MSB first */
-	snd_soc_component_update_bits(component, AIU_I2S_DAC_CFG,
-				      AIU_I2S_DAC_CFG_MSB_FIRST,
-				      AIU_I2S_DAC_CFG_MSB_FIRST);
-
 	/* Set bclk to lrlck ratio */
 	snd_soc_component_update_bits(component, AIU_CODEC_DAC_LRCLK_CTRL,
 				      AIU_CODEC_DAC_LRCLK_CTRL_DIV,
@@ -223,12 +170,6 @@ static int aiu_encoder_i2s_hw_params(struct snd_pcm_substream *substream,
 		}
 	}
 
-	ret = aiu_encoder_i2s_setup_desc(component, params);
-	if (ret) {
-		dev_err(dai->dev, "setting i2s desc failed: %d\n", ret);
-		return ret;
-	}
-
 	ret = aiu_encoder_i2s_set_clocks(component, params);
 	if (ret) {
 		dev_err(dai->dev, "setting i2s clocks failed: %d\n", ret);
@@ -411,6 +352,25 @@ static int aiu_encoder_i2s_startup(struct snd_pcm_substream *substream,
 		return ret;
 	}
 
+	/*
+	 * We're always operating in split mode for the playback stream.
+	 *
+	 * This setting arguably belong to the 'aiu-formatter', but it's kept
+	 * here for backward compatibility reason. At reset the I2S encoder
+	 * operates in normal mode which would only support 8ch, but by default
+	 * only 2ch are enabled. If a playback stream is started without
+	 * changing to split mode, then the I2S encoder doesn't consume audio
+	 * samples and the playback fails.
+	 * Moving this to 'aiu-formatter' would cause the split mode to be set
+	 * only when the formatter is enabled, which doesn't happen at boot as
+	 * the default value for "HDMI CTRL SRC" is "DISABLED".
+	 */
+	ret = snd_soc_component_update_bits(dai->component, AIU_I2S_SOURCE_DESC,
+					    AIU_I2S_SOURCE_DESC_MODE_SPLIT,
+					    AIU_I2S_SOURCE_DESC_MODE_SPLIT);
+	if (ret < 0)
+		dev_err(dai->dev, "failed to update AIU_I2S_SOURCE_DESC: %d", ret);
+
 	return 0;
 }
 
diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index f2890111c1d2cfa2213bf01849957a796744b9ae..64ace4d25d92cbe137066359a839e1b11bf140f8 100644
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
@@ -282,6 +296,14 @@ static int aiu_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	/* Allocate the aiu-formatter into its widget */
+	ret = gx_formatter_create(dev, &aiu_cpu_dapm_widgets[AIU_WIDGET_I2S_FORMATTER],
+				  &aiu_formatter_i2s_drv, map);
+	if (ret) {
+		dev_err(dev, "Failed to allocate aiu formatter\n");
+		goto err;
+	}
+
 	/* Register the cpu component of the aiu */
 	ret = snd_soc_register_component(dev, &aiu_cpu_component,
 					 aiu_cpu_dai_drv,
@@ -310,12 +332,14 @@ static int aiu_probe(struct platform_device *pdev)
 
 	return 0;
 err:
+	gx_formatter_free(&aiu_cpu_dapm_widgets[AIU_WIDGET_I2S_FORMATTER]);
 	snd_soc_unregister_component(dev);
 	return ret;
 }
 
 static void aiu_remove(struct platform_device *pdev)
 {
+	gx_formatter_free(&aiu_cpu_dapm_widgets[AIU_WIDGET_I2S_FORMATTER]);
 	snd_soc_unregister_component(&pdev->dev);
 }
 
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


