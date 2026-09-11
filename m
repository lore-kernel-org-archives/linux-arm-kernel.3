Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD63C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 22:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EuapJCTCH4Mm1Cl2su8mwhuXka1tyaCJMFc8XSqcx9k=; b=USrM0bb0weCHxtAxKKBypnN8o1
	P+1sDp91Hq6pGy37Caed+OZQg0knnPPMxZuntUbpEkVUZ/cK0qEloktQloV5nFSKf9p/OB/mdtwh8
	+RRAGsSRn9YRe21YaSLg/0wFwKGmzX4taegbIcAEAJF5PAQW6P6QcAP52qo3mB2jalWDaDFlmhfhR
	UtVgPTklbkKEuS5XcPL1RcwF1G80BpxoLOAtaK8wk9Ezi2EMao2Nf37zZbjqW/AhWQqQUscNtnU70
	/DuGTKQijkeMkS25Qe0LAsDQ6+SiU5tSWYdwV9DvySTQpwPnDA7E2Ek0kt+U/jEdUpolYZCu9tc6g
	07HJmzqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x59Wr-00000000FMB-04XB;
	Fri, 11 Sep 2026 22:15:29 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x59Wc-00000000FCg-2sOU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 22:15:16 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so2222695e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 15:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789164913; x=1789769713; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EuapJCTCH4Mm1Cl2su8mwhuXka1tyaCJMFc8XSqcx9k=;
        b=WsvI5zNVNRdOFxeuUW2vYjP1gL+Zgk4wL2J86f1o5sA8iylwJNtjsL48Hl1eLe3J+J
         IylDKAqUHF2FQnV6GLqybqmaZqEHNgSFv7ojbqEafqg9FSNrr71DlhwWTnjOtWCVUUHg
         y5biP6ArcJ+RSW+2ZLGx/5edqrPORy06euCRSkF9fivSauV4OhwXF3Rs2Hhny77Ww+By
         ttr2xiM9ONT6zOhQ2ZQkT1hCg82Z6RciPiJZT66FJk/ZdStkhZqmRdst5mESt5agzogh
         4Or9rjVaTgBJc1cG/5Q05NO47ZB8FVsn/olW7JEMEbcjHLndRme2MCjKOvY51lmZu+Dw
         nupw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164913; x=1789769713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EuapJCTCH4Mm1Cl2su8mwhuXka1tyaCJMFc8XSqcx9k=;
        b=GBn/GMt71DP60NZacLbLAJXfENRmXal5+ggCV/Tfv+iZbWzuDmuro6E7x5p9Jfzs+e
         HfaxG3hJmBPjIsXVybt+yfwtPolaBhyC7e1HFvwCgBCKVyE9upVxqT2xA8VQk/RzhS7U
         yBalw6p42bUMM2EDBPyNq0Umlp4XGJy+e6CQXQOpmWCEyJDU3ws0tXj3m42vqUs8yGc4
         HhmCf6rz+0ilo2s4IjzARSyw2xG+/Rgc4qmbcrpYaibb8CUCS0L4W8Z2QG5wNFlbddbk
         HMXNPWiSwQzrcEuQMe4eLzP9JJ8caQwoTb3FH2PxymqjzDk2vj/m6qDgX4MSlT3BhUGQ
         TOGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzgHG4PTkrWfDW+faXTM/ApT1AekPE+L6LKH6vL9qU+Dy7p+8oOyaPI6i6deztpcU1ndZsD66DtzEFi8JwHaJ5A@lists.infradead.org
X-Gm-Message-State: AFuF++nGYXxxXeenzQe7jbZ8gooqbmfOkEJGjigU73oSzkv5ucZv3RxZ
	Iu1cAo42XUY99m3ABi0ZSpig/pTurb/f8rvj12kFGoQWB09xW20QDcefm8PNUcPi8d4=
X-Gm-Gg: AYBFou2lAytwMm72Onxs3ouOjKUM4OeqiayZvJO+1lZYcaAFo85ifm4v6iOoPcrahoI
	o+VPTnrk3Ci6kTznB38YhfrFIxv5LToPMnSEOIDgYry4CJbF3xvIwQNyDrS4hs5gIHNDl0Avs4c
	pA+jIcpZWPNrhVNr1A7EtZVIIvbhQKNnAU1f4rdbN2nOaVJ0HaFigAgPu7u+MmKL4ItQfjLcxCX
	qpwIHGTXrfPyM91Ig+1+u5OiaunZAAjOEpToQd2lFzUHOhDN290BoRiLx1oEjY1lAoQbAkpVQta
	IjfTZCjgMvPmTVXR9B4avP2eEupBV7Mg6QHCUejDJJMupkz7MimVjXoV+tBZYUXlhTlHQVOVoMe
	Iwnz6A9WWLx6e+pWWErg5LJxGZ2SZEBhdR9FhxU2YyycV7GcCsJBOgp8b78GRFIhBumUogt6wPi
	tfKCsiElGYTk/O3Mj9U36LdN2EDtKsfw0oprUOQYbYGWBxCopfGtzYELlr8ziDCE4Nbg==
X-Received: by 2002:a05:600c:540e:b0:49e:6692:27fd with SMTP id 5b1f17b1804b1-49e66922810mr91970045e9.2.1789164913122;
        Fri, 11 Sep 2026 15:15:13 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c2a419sm202882745e9.7.2026.09.11.15.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:15:12 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sat, 12 Sep 2026 00:14:32 +0200
Subject: [PATCH 2/6] ASoC: meson: add audin main module and I2S formatter
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260912-audin-v1-2-7fbefe928711@baylibre.com>
References: <20260912-audin-v1-0-7fbefe928711@baylibre.com>
In-Reply-To: <20260912-audin-v1-0-7fbefe928711@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=12397; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=U38KIW8l3Mu//XwcIMEecEk/1YyGnT9t7x5OqfJMhJs=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlLanP94l+c3PBA9/DU6+57ct2rOvMaV3Qe2OyfpKHmz
 dLEULe+o5SFQYyLQVZMkYVl+r3fBaVqD40TThbAzGFlAhnCwMUpABP5f4jhf63FF8HcSQ/epJuf
 uGtT8jNz2k55Jr1jS9xdLD8krD7h+4fhf7m3ULHFoWIDC76Gxl8fv7GXLo91Xi68/NXPVa1edwP
 3sQIA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_151514_790403_DEC2A49E 
X-CRM114-Status: GOOD (  28.58  )
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

Audin is the main component that provides audio input support to the Amlogic
GX based platforms (GXBB/GXL). From a functional point of view it's pretty
simple:
- It provides input data formatters as sound widgets. Currently only I2S
  is supported, but other interfaces can be added in the future.
- It enables the shared clock that's being used from all the components,
  i.e. formatters and FIFO.
- It triggers the parsing of its DT child nodes that implement FIFOs.
  Note: the parent intentionally does not claim its register window so
  that the FIFO children can claim theirs.

'audin-formatter-i2s' is also added here implementing the functionalities
required for the widget that's part of the audin audio component.

The overall design is identical to what has been done for AIU module.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/Kconfig               |   9 ++
 sound/soc/meson/Makefile              |   3 +
 sound/soc/meson/audin-formatter-i2s.c | 174 ++++++++++++++++++++++++++++++++++
 sound/soc/meson/audin.c               | 109 +++++++++++++++++++++
 sound/soc/meson/audin.h               |  14 +++
 5 files changed, 309 insertions(+)

diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
index d9a730994a2a..f6e54615fc73 100644
--- a/sound/soc/meson/Kconfig
+++ b/sound/soc/meson/Kconfig
@@ -12,6 +12,14 @@ config SND_MESON_AIU
 	  Select Y or M to add support for the Audio output subsystem found
 	  in the Amlogic Meson8, Meson8b and GX SoC families
 
+config SND_MESON_AUDIN
+	tristate "Amlogic AUDIN"
+	select REGMAP_MMIO
+	select SND_MESON_AIU
+	help
+	  Select Y or M to add support for the audio input subsystem found
+	  in the Amlogic GX SoC family. Currently only I2S input is supported.
+
 config SND_MESON_AXG_FIFO
 	tristate
 	select REGMAP_MMIO
@@ -108,6 +116,7 @@ config SND_MESON_GX_SOUND_CARD
 	tristate "Amlogic GX Sound Card Support"
 	select SND_MESON_CARD_UTILS
 	imply SND_MESON_AIU
+	imply SND_MESON_AUDIN
 	help
 	  Select Y or M to add support for the GXBB/GXL SoC sound card
 
diff --git a/sound/soc/meson/Makefile b/sound/soc/meson/Makefile
index f9ec0ebb01f0..6a06a7b26e61 100644
--- a/sound/soc/meson/Makefile
+++ b/sound/soc/meson/Makefile
@@ -10,6 +10,8 @@ snd-soc-meson-aiu-y += aiu-encoder-spdif.o
 snd-soc-meson-aiu-y += aiu-fifo.o
 snd-soc-meson-aiu-y += aiu-fifo-i2s.o
 snd-soc-meson-aiu-y += aiu-fifo-spdif.o
+snd-soc-meson-audin-y := audin.o
+snd-soc-meson-audin-y += audin-formatter-i2s.o
 snd-soc-meson-axg-fifo-y := axg-fifo.o
 snd-soc-meson-axg-frddr-y := axg-frddr.o
 snd-soc-meson-axg-toddr-y := axg-toddr.o
@@ -29,6 +31,7 @@ snd-soc-meson-g12a-tohdmitx-y := g12a-tohdmitx.o
 snd-soc-meson-t9015-y := t9015.o
 
 obj-$(CONFIG_SND_MESON_AIU) += snd-soc-meson-aiu.o
+obj-$(CONFIG_SND_MESON_AUDIN) += snd-soc-meson-audin.o
 obj-$(CONFIG_SND_MESON_AXG_FIFO) += snd-soc-meson-axg-fifo.o
 obj-$(CONFIG_SND_MESON_AXG_FRDDR) += snd-soc-meson-axg-frddr.o
 obj-$(CONFIG_SND_MESON_AXG_TODDR) += snd-soc-meson-axg-toddr.o
diff --git a/sound/soc/meson/audin-formatter-i2s.c b/sound/soc/meson/audin-formatter-i2s.c
new file mode 100644
index 000000000000..8bbb5cdb52dc
--- /dev/null
+++ b/sound/soc/meson/audin-formatter-i2s.c
@@ -0,0 +1,174 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (c) 2026 BayLibre, SAS.
+// Author: Valerio Setti <vsetti@baylibre.com>
+
+#include <linux/bitfield.h>
+#include <linux/regmap.h>
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
+
+#include "audin.h"
+#include "gx-formatter.h"
+
+/* I2SIN_CTRL register and bits */
+#define AUDIN_I2SIN_CTRL			0x40
+#define  AUDIN_I2SIN_CTRL_I2SIN_DIR		BIT(0)
+#define  AUDIN_I2SIN_CTRL_I2SIN_CLK_SEL		BIT(1)
+#define  AUDIN_I2SIN_CTRL_I2SIN_LRCLK_SEL	BIT(2)
+#define  AUDIN_I2SIN_CTRL_I2SIN_BCLK_INV	BIT(3)
+#define  AUDIN_I2SIN_CTRL_I2SIN_LRCLK_SKEW_MASK	GENMASK(6, 4)
+#define  AUDIN_I2SIN_CTRL_I2SIN_LRCLK_INV	BIT(7)
+#define  AUDIN_I2SIN_CTRL_I2SIN_SIZE_MASK	GENMASK(9, 8)
+#define  AUDIN_I2SIN_CTRL_I2SIN_CHAN_EN_MASK	GENMASK(13, 10)
+#define  AUDIN_I2SIN_CTRL_I2SIN_EN		BIT(15)
+
+static struct snd_soc_dai *
+audin_formatter_i2s_get_be(struct snd_soc_dapm_widget *w)
+{
+	struct snd_soc_dapm_path *p;
+	struct snd_soc_dai *be;
+
+	snd_soc_dapm_widget_for_each_source_path(w, p) {
+		if (!p->connect)
+			continue;
+
+		if (p->source->id == snd_soc_dapm_dai_out)
+			return (struct snd_soc_dai *)p->source->priv;
+
+		be = audin_formatter_i2s_get_be(p->source);
+		if (be)
+			return be;
+	}
+
+	return NULL;
+}
+
+static struct gx_stream *
+audin_formatter_i2s_get_stream(struct snd_soc_dapm_widget *w)
+{
+	struct snd_soc_dai *be = audin_formatter_i2s_get_be(w);
+
+	if (!be)
+		return NULL;
+
+	return snd_soc_dai_dma_data_get_capture(be);
+}
+
+static void audin_formatter_i2s_enable(struct regmap *map)
+{
+	regmap_update_bits(map, AUDIN_I2SIN_CTRL,
+			   AUDIN_I2SIN_CTRL_I2SIN_EN,
+			   AUDIN_I2SIN_CTRL_I2SIN_EN);
+}
+
+static void audin_formatter_i2s_disable(struct regmap *map)
+{
+	regmap_update_bits(map, AUDIN_I2SIN_CTRL,
+			   AUDIN_I2SIN_CTRL_I2SIN_EN, 0);
+}
+
+static int audin_formatter_i2s_prepare(struct regmap *map,
+				       const struct gx_formatter_hw *quirks,
+				       struct gx_stream *ts)
+{
+	unsigned int val;
+	int ret;
+
+	/*
+	 * I2S decoder always outputs 24 bits to the FIFO according to the
+	 * manual. The only thing we can change through
+	 * AUDIN_I2SIN_CTRL_I2SIN_SIZE_MASK is the following:
+	 * - 0 -> output[23:0] = {original[23:8],8’d0}
+	 * - 1 -> output[23:0] = {original[23:6],6’d0}
+	 * - 2 -> output[23:0] = {original[23:4],4’d0}
+	 * - 3 -> output[23:0] = {original[23:0]}
+	 *
+	 * We use 3 here and, in case of 16 bit format, we filter unnecessary
+	 * bytes at FIFO stage.
+	 * Note: data is left-justified, so in case of 16 bits samples, this
+	 *       means that the LSB is to be discarded at FIFO level and the
+	 *       relevant part is in bits [23:8].
+	 */
+	val = FIELD_PREP(AUDIN_I2SIN_CTRL_I2SIN_SIZE_MASK, 3);
+	ret = regmap_update_bits(map, AUDIN_I2SIN_CTRL,
+				 AUDIN_I2SIN_CTRL_I2SIN_SIZE_MASK, val);
+	if (ret)
+		return ret;
+
+	/*
+	 * The manual claims that this platform supports up to 4 streams
+	 * (8 channels), but currently only 1 stream (2 channels) has been
+	 * tested and it's supported.
+	 */
+	val = FIELD_PREP(AUDIN_I2SIN_CTRL_I2SIN_CHAN_EN_MASK, 1);
+	ret = regmap_update_bits(map, AUDIN_I2SIN_CTRL,
+				 AUDIN_I2SIN_CTRL_I2SIN_CHAN_EN_MASK, val);
+	if (ret)
+		return ret;
+
+	/*
+	 * Use clocks from AIU and not from the pads since we only want to
+	 * support master mode.
+	 */
+	val = AUDIN_I2SIN_CTRL_I2SIN_CLK_SEL |
+	      AUDIN_I2SIN_CTRL_I2SIN_LRCLK_SEL |
+	      AUDIN_I2SIN_CTRL_I2SIN_DIR;
+	ret = regmap_update_bits(map, AUDIN_I2SIN_CTRL, val, val);
+	if (ret)
+		return ret;
+
+	switch (ts->iface->fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_IB_NF:
+		val = AUDIN_I2SIN_CTRL_I2SIN_BCLK_INV;
+		break;
+	case SND_SOC_DAIFMT_NB_IF:
+		val = AUDIN_I2SIN_CTRL_I2SIN_LRCLK_INV;
+		break;
+	case SND_SOC_DAIFMT_IB_IF:
+		val = AUDIN_I2SIN_CTRL_I2SIN_BCLK_INV | AUDIN_I2SIN_CTRL_I2SIN_LRCLK_INV;
+		break;
+	case SND_SOC_DAIFMT_NB_NF:
+		val = 0;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	ret = regmap_update_bits(map, AUDIN_I2SIN_CTRL,
+				 AUDIN_I2SIN_CTRL_I2SIN_LRCLK_INV |
+				 AUDIN_I2SIN_CTRL_I2SIN_BCLK_INV, val);
+	if (ret)
+		return ret;
+
+	switch (ts->iface->fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_I2S:
+		val = 1;
+		break;
+	case SND_SOC_DAIFMT_LEFT_J:
+		val = 0;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	val = FIELD_PREP(AUDIN_I2SIN_CTRL_I2SIN_LRCLK_SKEW_MASK, val);
+	ret = regmap_update_bits(map, AUDIN_I2SIN_CTRL,
+				 AUDIN_I2SIN_CTRL_I2SIN_LRCLK_SKEW_MASK,
+				 val);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static const struct gx_formatter_ops audin_formatter_i2s_ops = {
+	.get_stream	= audin_formatter_i2s_get_stream,
+	.prepare	= audin_formatter_i2s_prepare,
+	.enable		= audin_formatter_i2s_enable,
+	.disable	= audin_formatter_i2s_disable,
+};
+
+const struct gx_formatter_driver audin_formatter_i2s_drv = {
+	.ops		= &audin_formatter_i2s_ops,
+};
diff --git a/sound/soc/meson/audin.c b/sound/soc/meson/audin.c
new file mode 100644
index 000000000000..e8071323432b
--- /dev/null
+++ b/sound/soc/meson/audin.c
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (c) 2026 BayLibre, SAS.
+// Author: Valerio Setti <vsetti@baylibre.com>
+
+#include <linux/clk.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+#include <sound/soc.h>
+
+#include "audin.h"
+#include "gx-formatter.h"
+
+static struct snd_soc_dapm_widget audin_dapm_widgets[] = {
+	SND_SOC_DAPM_PGA_E("I2S Formatter", SND_SOC_NOPM, 0, 0, NULL, 0,
+			   gx_formatter_event,
+			   (SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_PRE_PMD)),
+};
+
+static const struct snd_soc_component_driver audin_component = {
+	.dapm_widgets		= audin_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(audin_dapm_widgets),
+};
+
+static const struct regmap_config audin_regmap_cfg = {
+	.reg_bits	= 32,
+	.val_bits	= 32,
+	.reg_stride	= 4,
+	.max_register	= 0x304,
+};
+
+static int meson_gx_audin_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+	void __iomem *mmio;
+	struct regmap *regmap;
+	struct clk *clk;
+	int ret;
+
+	ret = device_reset(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to reset device\n");
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return dev_err_probe(dev, -EINVAL, "Failed to get memory resource\n");
+
+	/*
+	 * Do not use devm_platform_ioremap_resource() here: it would claim the
+	 * whole AUDIN window exclusively and the FIFO children would then fail
+	 * to request their own sub-ranges.
+	 */
+	mmio = devm_ioremap(dev, res->start, resource_size(res));
+	if (!mmio)
+		return dev_err_probe(dev, -ENOMEM, "Failed to remap memory\n");
+
+	regmap = devm_regmap_init_mmio(dev, mmio, &audin_regmap_cfg);
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap), "Failed to init regmap\n");
+
+	clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk), "Failed to get clock\n");
+
+	ret = gx_formatter_create(dev, &audin_dapm_widgets[0], &audin_formatter_i2s_drv, regmap);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to allocate formatter\n");
+
+	ret = devm_snd_soc_register_component(dev, &audin_component, NULL, 0);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register component\n");
+
+	ret = devm_of_platform_populate(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to probe child nodes\n");
+
+	return 0;
+}
+
+static void meson_gx_audin_remove(struct platform_device *pdev)
+{
+	gx_formatter_free(&audin_dapm_widgets[0]);
+}
+
+static const struct of_device_id meson_gx_audin_of_match[] = {
+	{ .compatible = "amlogic,meson-gxbb-audin" },
+	{ .compatible = "amlogic,meson-gxl-audin" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, meson_gx_audin_of_match);
+
+static struct platform_driver meson_gx_audin_driver = {
+	.driver = {
+		.name = "meson-gx-audin",
+		.of_match_table = meson_gx_audin_of_match,
+	},
+	.probe = meson_gx_audin_probe,
+	.remove = meson_gx_audin_remove,
+};
+module_platform_driver(meson_gx_audin_driver);
+
+MODULE_DESCRIPTION("Meson GX AUDIN driver");
+MODULE_AUTHOR("Valerio Setti <vsetti@baylibre.com>");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/meson/audin.h b/sound/soc/meson/audin.h
new file mode 100644
index 000000000000..29961e18190f
--- /dev/null
+++ b/sound/soc/meson/audin.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+/*
+ * Copyright (c) 2026 BayLibre, SAS.
+ * Author: Valerio Setti <vsetti@baylibre.com>
+ */
+
+#ifndef _MESON_AUDIN_H
+#define _MESON_AUDIN_H
+
+#include "gx-formatter.h"
+
+extern const struct gx_formatter_driver audin_formatter_i2s_drv;
+
+#endif

-- 
2.47.3


