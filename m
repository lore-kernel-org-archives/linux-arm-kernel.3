Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A37C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 05:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=73JLQAmWuZSnNO0q42K5V2Btd42o1yjgi7/OGpCGXNY=; b=fTkgJNaAqVbvf5huAcCcpKXyxL
	xdvtrqxBXKwQ8GYggAYJfmPdnk5xND4yeuXuFUXAOLdQdrNLqUGPh9Fc+y5IwuvBO0E9GIJp1+pBx
	NfCWmoo5dUoHFnB/uoNRW1qPhzbxml2E/7zluP6BBx2kRoz5xbpBmKbmpzE7+nGT8L5TYoMtSf351
	GLXLv+xTkrZH6BAV72gkP0DFsf7A5ZhzsX0hF5aJzJhpld46Ji5cAazAUJ6YFoYJRFedpmiicgeyb
	XTyjLoYkzlSKIgVWT9ehAQwdHcFGXktV1GG7nRS81/GoBv3JsdA4pyv3Qld+Q7JDTLiU8jBffNa0x
	VKHHzHnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3RS-000000048LO-3KdY;
	Fri, 10 Jul 2026 05:06:26 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3RO-000000048Hu-44fi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 05:06:25 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-845c92bc464so406762b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 22:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783659982; x=1784264782; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=73JLQAmWuZSnNO0q42K5V2Btd42o1yjgi7/OGpCGXNY=;
        b=KErHJVjNRyfyatHVpU39rsR0jqTJYC2RsCe7M8owGfgzd5MpCm1CZRWNcxBYeEXP1F
         90kvr4wnBbMnjcDb2kxPPa0jd5OvHL/T0fCaYhqqo/UmWUseY+m5T8nU2lNMmzGpZfHQ
         lkzh62MuGoBvQcD2GZH36Z+WIDy0Z/lm9/rOh+3rvszew8LSPmHoTi0+v9WB2Lmef5+O
         2yAlt0TfKd3giJ80e4afokMsN/4KUk0dXqvzc7i6FsVO0ahRpEVrS79VetweoaqMQFMR
         by+8Og3CMAcsH8vgGqgv3NeU5clvSW7e9bfUvdQezH3R50nL/x1DoQzK75hC58XFuDnT
         be7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783659982; x=1784264782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=73JLQAmWuZSnNO0q42K5V2Btd42o1yjgi7/OGpCGXNY=;
        b=eATSqnamXv2hsKtgQ0XQG8NyMLO1coyU07bmoW1EOzxZEydxtSdRMQpk09AYmub0bQ
         A7ozNiMkDVtyY3AoQk9a1jGBIwtGePojS98M1zOcj7oPLhT81YeG3crmtYr5TpZ6Ypz9
         pFlWKJq5skumW+aobHtOSGice3EEtgSEC9H6SyhksCn7L/uQku43Q4x67/7u2aO/mcqX
         s/Yd3LMtWQV9Eu5nrrrkEonVRUko2uEKaKkgXI0+l+VUWsPJbQqkOpFkWO2pHtgcoxBz
         W5pYUuQtSTGuDrI9BLpPDaHFukBEZ1/ENxD3gobsFUJX1AeNFsIe9H/5I3JrOuC7ISdp
         zFjw==
X-Forwarded-Encrypted: i=1; AHgh+RpAj0N0QdY/YnKzya5vD5BPx3H9bhUYLyyb6I//V7P3rPLycTmyG1OP7IdYn0v/U3o+AAk2YheXQeke/EapGFTF@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4Ey+rNbjWXltAP04p8I/huOHNHNuifM7rNjB8cmEncteLmdZ0
	v25IZ6ZmrL9GjdIdRVP+5Jk3qThuJavc5p17SyKwZSaSndXpQYDSwKO6
X-Gm-Gg: AfdE7clIGvH8SZmSTqzzSsQ3HDFRdaDcw7ah9xfEnOXkofA7aZb2+KaTIqD+PdxQ+Gb
	1HXHfk0fbSD8YuYEynY6s1r6EVG43rBOhl78LWyVWFAKtfBdeOIjdrt4eGZ0rIBVgFJuBiHCGHm
	6wYB3n6RQnzHruun+uOHhznXDABGurmrHogzRn7x/bzOuTcyXL5/Ih4VWqOQhu61WAkNN5/04gq
	iTEIbBHa9TnSVKH66wbKkKNfYhj17nAEZep0sMxxKkARJaSinJGhpgv/EhGsiplGvlX0eiOvsAH
	Yg2fFE4NKyuf9mJTpBmDxbI9xcteShoUIXNmIRJ+9qwWRl9miKJu4bjkB1FVGVjhSDnQMI6swDO
	gp88xQx1K6E3fKgD5xlrezbF3GWzykflgP15u+lamRSrkpcIShqS32RcW0kV+MpMB6Ag2QcMeLQ
	m+N5Q2X5XH3oqQj/bGwJGnrgayH/o9Ac5QTOvPJKBnD/IImXc=
X-Received: by 2002:a05:6a00:240d:b0:848:2eac:bfb2 with SMTP id d2e1a72fcca58-84842fe47b1mr9781518b3a.13.1783659982141;
        Thu, 09 Jul 2026 22:06:22 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm3400499b3a.22.2026.07.09.22.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:06:21 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Linus Walleij <linusw@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	u.kleine-koenig@baylibre.com,
	Zhang Yi <zhangyi@everest-semi.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kees Cook <kees@kernel.org>,
	HyeongJun An <sammiee5311@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 09/27] ASoC: codecs: idt821034: Use guard() for mutex locks
Date: Fri, 10 Jul 2026 12:04:53 +0700
Message-ID: <20260710050511.14439-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710050511.14439-1-phucduc.bui@gmail.com>
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
 <20260710050511.14439-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_220623_016173_62DBA763 
X-CRM114-Status: GOOD (  16.82  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2: 
 - Remove temporary variables and return directly 
   from the functions.

 sound/soc/codecs/idt821034.c | 144 ++++++++++++++---------------------
 1 file changed, 57 insertions(+), 87 deletions(-)

diff --git a/sound/soc/codecs/idt821034.c b/sound/soc/codecs/idt821034.c
index 084090ccef77..387f17b5f7b3 100644
--- a/sound/soc/codecs/idt821034.c
+++ b/sound/soc/codecs/idt821034.c
@@ -7,6 +7,7 @@
 // Author: Herve Codina <herve.codina@bootlin.com>
 
 #include <linux/bitrev.h>
+#include <linux/cleanup.h>
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/slab.h>
@@ -413,12 +414,12 @@ static int idt821034_kctrl_gain_get(struct snd_kcontrol *kcontrol,
 
 	ch = IDT821034_ID_GET_CHAN(mc->reg);
 
-	mutex_lock(&idt821034->mutex);
-	if (IDT821034_ID_IS_OUT(mc->reg))
-		val = idt821034->amps.ch[ch].amp_out.gain;
-	else
-		val = idt821034->amps.ch[ch].amp_in.gain;
-	mutex_unlock(&idt821034->mutex);
+	scoped_guard(mutex, &idt821034->mutex) {
+		if (IDT821034_ID_IS_OUT(mc->reg))
+			val = idt821034->amps.ch[ch].amp_out.gain;
+		else
+			val = idt821034->amps.ch[ch].amp_in.gain;
+	}
 
 	ucontrol->value.integer.value[0] = val & mask;
 	if (invert)
@@ -456,7 +457,7 @@ static int idt821034_kctrl_gain_put(struct snd_kcontrol *kcontrol,
 
 	ch = IDT821034_ID_GET_CHAN(mc->reg);
 
-	mutex_lock(&idt821034->mutex);
+	guard(mutex)(&idt821034->mutex);
 
 	if (IDT821034_ID_IS_OUT(mc->reg)) {
 		amp = &idt821034->amps.ch[ch].amp_out;
@@ -466,22 +467,18 @@ static int idt821034_kctrl_gain_put(struct snd_kcontrol *kcontrol,
 		gain_type = IDT821034_GAIN_TX;
 	}
 
-	if (amp->gain == val) {
-		ret = 0;
-		goto end;
-	}
+	if (amp->gain == val)
+		return 0;
 
 	if (!amp->is_muted) {
 		ret = idt821034_set_gain_channel(idt821034, ch, gain_type, val);
 		if (ret)
-			goto end;
+			return ret;
 	}
 
 	amp->gain = val;
-	ret = 1; /* The value changed */
-end:
-	mutex_unlock(&idt821034->mutex);
-	return ret;
+
+	return 1;
 }
 
 static int idt821034_kctrl_mute_get(struct snd_kcontrol *kcontrol,
@@ -495,11 +492,11 @@ static int idt821034_kctrl_mute_get(struct snd_kcontrol *kcontrol,
 
 	ch = IDT821034_ID_GET_CHAN(id);
 
-	mutex_lock(&idt821034->mutex);
-	is_muted = IDT821034_ID_IS_OUT(id) ?
-			idt821034->amps.ch[ch].amp_out.is_muted :
-			idt821034->amps.ch[ch].amp_in.is_muted;
-	mutex_unlock(&idt821034->mutex);
+	scoped_guard(mutex, &idt821034->mutex) {
+		is_muted = IDT821034_ID_IS_OUT(id) ?
+				idt821034->amps.ch[ch].amp_out.is_muted :
+				idt821034->amps.ch[ch].amp_in.is_muted;
+	}
 
 	ucontrol->value.integer.value[0] = !is_muted;
 
@@ -521,7 +518,7 @@ static int idt821034_kctrl_mute_put(struct snd_kcontrol *kcontrol,
 	ch = IDT821034_ID_GET_CHAN(id);
 	is_mute = !ucontrol->value.integer.value[0];
 
-	mutex_lock(&idt821034->mutex);
+	guard(mutex)(&idt821034->mutex);
 
 	if (IDT821034_ID_IS_OUT(id)) {
 		amp = &idt821034->amps.ch[ch].amp_out;
@@ -531,21 +528,17 @@ static int idt821034_kctrl_mute_put(struct snd_kcontrol *kcontrol,
 		gain_type = IDT821034_GAIN_TX;
 	}
 
-	if (amp->is_muted == is_mute) {
-		ret = 0;
-		goto end;
-	}
+	if (amp->is_muted == is_mute)
+		return 0;
 
 	ret = idt821034_set_gain_channel(idt821034, ch, gain_type,
 					 is_mute ? 0 : amp->gain);
 	if (ret)
-		goto end;
+		return ret;
 
 	amp->is_muted = is_mute;
-	ret = 1; /* The value changed */
-end:
-	mutex_unlock(&idt821034->mutex);
-	return ret;
+
+	return 1;
 }
 
 static const DECLARE_TLV_DB_LINEAR(idt821034_gain_in, -300, 1300);
@@ -623,24 +616,20 @@ static int idt821034_power_event(struct snd_soc_dapm_widget *w,
 	struct idt821034 *idt821034 = snd_soc_component_get_drvdata(component);
 	unsigned int id = w->shift;
 	u8 power, mask;
-	int ret;
 	u8 ch;
 
 	ch = IDT821034_ID_GET_CHAN(id);
 	mask = IDT821034_ID_IS_OUT(id) ? IDT821034_CONF_PWRUP_RX : IDT821034_CONF_PWRUP_TX;
 
-	mutex_lock(&idt821034->mutex);
+	guard(mutex)(&idt821034->mutex);
 
 	power = idt821034_get_channel_power(idt821034, ch);
 	if (SND_SOC_DAPM_EVENT_ON(event))
 		power |= mask;
 	else
 		power &= ~mask;
-	ret = idt821034_set_channel_power(idt821034, ch, power);
-
-	mutex_unlock(&idt821034->mutex);
 
-	return ret;
+	return idt821034_set_channel_power(idt821034, ch, power);
 }
 
 static const struct snd_soc_dapm_widget idt821034_dapm_widgets[] = {
@@ -717,9 +706,9 @@ static int idt821034_dai_set_tdm_slot(struct snd_soc_dai *dai,
 	ch = 0;
 	while (mask && ch < IDT821034_NB_CHANNEL) {
 		if (mask & 0x1) {
-			mutex_lock(&idt821034->mutex);
-			ret = idt821034_set_channel_ts(idt821034, ch, IDT821034_CH_RX, slot);
-			mutex_unlock(&idt821034->mutex);
+			scoped_guard(mutex, &idt821034->mutex)
+				ret = idt821034_set_channel_ts(idt821034, ch,
+							       IDT821034_CH_RX, slot);
 			if (ret) {
 				dev_err(dai->dev, "ch%u set tx tdm slot failed (%d)\n",
 					ch, ret);
@@ -742,9 +731,9 @@ static int idt821034_dai_set_tdm_slot(struct snd_soc_dai *dai,
 	ch = 0;
 	while (mask && ch < IDT821034_NB_CHANNEL) {
 		if (mask & 0x1) {
-			mutex_lock(&idt821034->mutex);
-			ret = idt821034_set_channel_ts(idt821034, ch, IDT821034_CH_TX, slot);
-			mutex_unlock(&idt821034->mutex);
+			scoped_guard(mutex, &idt821034->mutex)
+				ret = idt821034_set_channel_ts(idt821034, ch,
+							       IDT821034_CH_TX, slot);
 			if (ret) {
 				dev_err(dai->dev, "ch%u set rx tdm slot failed (%d)\n",
 					ch, ret);
@@ -769,9 +758,8 @@ static int idt821034_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
 	struct idt821034 *idt821034 = snd_soc_component_get_drvdata(dai->component);
 	u8 conf;
-	int ret;
 
-	mutex_lock(&idt821034->mutex);
+	guard(mutex)(&idt821034->mutex);
 
 	conf = idt821034_get_codec_conf(idt821034);
 
@@ -785,13 +773,10 @@ static int idt821034_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	default:
 		dev_err(dai->dev, "Unsupported DAI format 0x%x\n",
 			fmt & SND_SOC_DAIFMT_FORMAT_MASK);
-		ret = -EINVAL;
-		goto end;
+		return -EINVAL;
 	}
-	ret = idt821034_set_codec_conf(idt821034, conf);
-end:
-	mutex_unlock(&idt821034->mutex);
-	return ret;
+
+	return idt821034_set_codec_conf(idt821034, conf);
 }
 
 static int idt821034_dai_hw_params(struct snd_pcm_substream *substream,
@@ -800,9 +785,8 @@ static int idt821034_dai_hw_params(struct snd_pcm_substream *substream,
 {
 	struct idt821034 *idt821034 = snd_soc_component_get_drvdata(dai->component);
 	u8 conf;
-	int ret;
 
-	mutex_lock(&idt821034->mutex);
+	guard(mutex)(&idt821034->mutex);
 
 	conf = idt821034_get_codec_conf(idt821034);
 
@@ -816,13 +800,10 @@ static int idt821034_dai_hw_params(struct snd_pcm_substream *substream,
 	default:
 		dev_err(dai->dev, "Unsupported PCM format 0x%x\n",
 			params_format(params));
-		ret = -EINVAL;
-		goto end;
+		return -EINVAL;
 	}
-	ret = idt821034_set_codec_conf(idt821034, conf);
-end:
-	mutex_unlock(&idt821034->mutex);
-	return ret;
+
+	return idt821034_set_codec_conf(idt821034, conf);
 }
 
 static const unsigned int idt821034_sample_bits[] = {8};
@@ -897,11 +878,11 @@ static int idt821034_reset_audio(struct idt821034 *idt821034)
 	int ret;
 	u8 i;
 
-	mutex_lock(&idt821034->mutex);
+	guard(mutex)(&idt821034->mutex);
 
 	ret = idt821034_set_codec_conf(idt821034, 0);
 	if (ret)
-		goto end;
+		return ret;
 
 	for (i = 0; i < IDT821034_NB_CHANNEL; i++) {
 		idt821034->amps.ch[i].amp_out.gain = IDT821034_GAIN_OUT_INIT_RAW;
@@ -909,24 +890,21 @@ static int idt821034_reset_audio(struct idt821034 *idt821034)
 		ret = idt821034_set_gain_channel(idt821034, i, IDT821034_GAIN_RX,
 						 idt821034->amps.ch[i].amp_out.gain);
 		if (ret)
-			goto end;
+			return ret;
 
 		idt821034->amps.ch[i].amp_in.gain = IDT821034_GAIN_IN_INIT_RAW;
 		idt821034->amps.ch[i].amp_in.is_muted = false;
 		ret = idt821034_set_gain_channel(idt821034, i, IDT821034_GAIN_TX,
 						 idt821034->amps.ch[i].amp_in.gain);
 		if (ret)
-			goto end;
+			return ret;
 
 		ret = idt821034_set_channel_power(idt821034, i, 0);
 		if (ret)
-			goto end;
+			return ret;
 	}
 
-	ret = 0;
-end:
-	mutex_unlock(&idt821034->mutex);
-	return ret;
+	return 0;
 }
 
 static int idt821034_component_probe(struct snd_soc_component *component)
@@ -965,7 +943,7 @@ static int idt821034_chip_gpio_set(struct gpio_chip *c, unsigned int offset,
 	u8 slic_raw;
 	int ret;
 
-	mutex_lock(&idt821034->mutex);
+	guard(mutex)(&idt821034->mutex);
 
 	slic_raw = idt821034_get_written_slic_raw(idt821034, ch);
 	if (val)
@@ -974,8 +952,6 @@ static int idt821034_chip_gpio_set(struct gpio_chip *c, unsigned int offset,
 		slic_raw &= ~mask;
 	ret = idt821034_write_slic_raw(idt821034, ch, slic_raw);
 
-	mutex_unlock(&idt821034->mutex);
-
 	if (ret)
 		dev_err(&idt821034->spi->dev, "set gpio %d (%u, 0x%x) failed (%d)\n",
 			offset, ch, mask, ret);
@@ -991,9 +967,8 @@ static int idt821034_chip_gpio_get(struct gpio_chip *c, unsigned int offset)
 	u8 slic_raw;
 	int ret;
 
-	mutex_lock(&idt821034->mutex);
-	ret = idt821034_read_slic_raw(idt821034, ch, &slic_raw);
-	mutex_unlock(&idt821034->mutex);
+	scoped_guard(mutex, &idt821034->mutex)
+		ret = idt821034_read_slic_raw(idt821034, ch, &slic_raw);
 	if (ret) {
 		dev_err(&idt821034->spi->dev, "get gpio %d (%u, 0x%x) failed (%d)\n",
 			offset, ch, mask, ret);
@@ -1015,9 +990,8 @@ static int idt821034_chip_get_direction(struct gpio_chip *c, unsigned int offset
 	struct idt821034 *idt821034 = gpiochip_get_data(c);
 	u8 slic_dir;
 
-	mutex_lock(&idt821034->mutex);
+	guard(mutex)(&idt821034->mutex);
 	slic_dir = idt821034_get_slic_conf(idt821034, ch);
-	mutex_unlock(&idt821034->mutex);
 
 	return slic_dir & mask ? GPIO_LINE_DIRECTION_IN : GPIO_LINE_DIRECTION_OUT;
 }
@@ -1034,7 +1008,7 @@ static int idt821034_chip_direction_input(struct gpio_chip *c, unsigned int offs
 	if (mask & ~(IDT821034_SLIC_IO1_IN | IDT821034_SLIC_IO0_IN))
 		return -EPERM;
 
-	mutex_lock(&idt821034->mutex);
+	guard(mutex)(&idt821034->mutex);
 
 	slic_conf = idt821034_get_slic_conf(idt821034, ch) | mask;
 
@@ -1044,7 +1018,6 @@ static int idt821034_chip_direction_input(struct gpio_chip *c, unsigned int offs
 			offset, ch, mask, ret);
 	}
 
-	mutex_unlock(&idt821034->mutex);
 	return ret;
 }
 
@@ -1060,7 +1033,7 @@ static int idt821034_chip_direction_output(struct gpio_chip *c, unsigned int off
 	if (ret)
 		return ret;
 
-	mutex_lock(&idt821034->mutex);
+	guard(mutex)(&idt821034->mutex);
 
 	slic_conf = idt821034_get_slic_conf(idt821034, ch) & ~mask;
 
@@ -1070,7 +1043,6 @@ static int idt821034_chip_direction_output(struct gpio_chip *c, unsigned int off
 			offset, ch, mask, ret);
 	}
 
-	mutex_unlock(&idt821034->mutex);
 	return ret;
 }
 
@@ -1079,24 +1051,22 @@ static int idt821034_reset_gpio(struct idt821034 *idt821034)
 	int ret;
 	u8 i;
 
-	mutex_lock(&idt821034->mutex);
+	guard(mutex)(&idt821034->mutex);
 
 	/* IO0 and IO1 as input for all channels and output IO set to 0 */
 	for (i = 0; i < IDT821034_NB_CHANNEL; i++) {
 		ret = idt821034_set_slic_conf(idt821034, i,
 					      IDT821034_SLIC_IO1_IN | IDT821034_SLIC_IO0_IN);
 		if (ret)
-			goto end;
+			return ret;
 
 		ret = idt821034_write_slic_raw(idt821034, i, 0);
 		if (ret)
-			goto end;
+			return ret;
 
 	}
-	ret = 0;
-end:
-	mutex_unlock(&idt821034->mutex);
-	return ret;
+
+	return 0;
 }
 
 static int idt821034_gpio_init(struct idt821034 *idt821034)
-- 
2.43.0


