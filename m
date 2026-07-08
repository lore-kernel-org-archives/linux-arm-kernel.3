Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 549D6C43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 14:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RozeYceB4iwycNfbGDK46tH90J5JBru51kfxpqOiyNk=; b=bBD7UFb9tTAOVgi6un4g8tpMPW
	vvLzeraegQ9GZKhwo6uY7ylz/yUa/yekO4k4rDxu9QyriuChfMrHW78aGzcBqdwmhVxRJ2i8NlmoP
	qFciVREzZL6V9PZXLE0Y+YJkPs+/mtdhhv8bNb0yLL6mORKpP1/o8egrdWEi75bUg9h/+Q8+OiOKJ
	TThMA70Mfd/qAD9ywLFmsuSBS2l/T+1MQ17JE+ip9lP8xTcX9T9P0TN4bGBiHJqXd+CcGehXy4hrN
	cBU0g60dNnIQkwG4T2QXZXODOCqriARnpbJmPBuApM79d3fFCTlfPaXfDqxojmDEcq1RLAAMnSn1R
	EdmHVaAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT7a-0000000HGJu-46HM;
	Wed, 08 Jul 2026 14:19:30 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT7Y-0000000HGHR-0VyL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 14:19:29 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2cace91f112so8237245ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 07:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520367; x=1784125167; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RozeYceB4iwycNfbGDK46tH90J5JBru51kfxpqOiyNk=;
        b=sSHwmepZ9kbTZQLhrp5vxWvvC+DH5DioWLdxmLmsxssPKM1u1LQu6ljsBUECad2uOO
         NqbYIO2nlewDaru8/Qviaw8/7JbK+zUXSEk9TC6hgbuVS7vLWe1CEdPi+jfZnPvTJOkK
         QWtjd3Mfmbs9C2SNPQiPr6nyIXAo0syw/npBYRf/YBoODNJsvNvfaJUqU42eb72ipYuc
         TfHAY31YfTMqeGg9Y7SiG8yvUvO+qkrnqwQVcIvgF1U/ZXnmbAS12gBbEyG2HaB7jBnC
         ehAeO6rD8pfjFN8lF1XLDtXSuonznwq32Hp6TTvyTiFgnQIDAZ60E3sqVM0g0Wb+ye4v
         3c5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520367; x=1784125167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RozeYceB4iwycNfbGDK46tH90J5JBru51kfxpqOiyNk=;
        b=UOMAlpjD5ACLiLelSShhLvC995hDcRGf0pOnbydq+TuDtyLu3e8TMKhBvjrYUGPDL8
         BoI2SoHBGK8UFi7IrtwpAPR1dwnbVjOoeVVR2xJz0BcewpwYC8CU7NIhObe/U1BH1K7E
         YDVxYjwGP0xlghV8K4/F3aO83l2y+PGZYYtIenjx6mu+GxmVwPhtH/Lsk+XJ6WcYiuzA
         3ZvGYXU+MbcWcVGc4rkcNWBYIQxtoJ0OHrxL9hkbf0K1vcjj3WlphROanWI5Q8YKwdXq
         OAuWd0RESyP++p5+qLf9CHrmhZlxba/u+4OYE7YMfCwRxDRAyfwftmdgfIwMA80WB/T8
         XeEg==
X-Forwarded-Encrypted: i=1; AHgh+RoLCjEkbt7zpt8LvFbOJcewCsWlSmF1Rs/9t0rJrsGDyIuVKxyxpOz3MCVQBRXIvjd+ajbS07r0U16HCgX8bBU1@lists.infradead.org
X-Gm-Message-State: AOJu0YwpLDaje8UF9dTYQjhQ+4ITt7sfbL9bIwTlSIYnXArUaCGmEBbn
	K2Ivw/kVwie4nVAKa9+k+S1qZvm1UApP/rubEdzqzCOHrR0rjK1cguGw
X-Gm-Gg: AfdE7cmxlxI+AFCzVxBeQ+FSr9+l5Zzj4ppRbqAZtd/M2FLYsDmH30+YN1/WDr6XYG1
	FSxQEr6f5dc5tn9h1nzW9UwxPQ/9YPLFdMjPmas0XLvqhFLqe8djwjXmTlrDePitCgAYKrYxtu/
	KXmgrtKa8rZyivR3pVZ2OM9t8kurem72VCsQzmuhCvuB8qEFuzARtMZB7ag4EOJx6Ixov4dWTed
	JhZgR9LQqbzKv6qv9IMjZynTXw93Jh1PZ/aNmj9IKJqBK+conZwrb0kpYUAnnRpRrMGOb8sblVY
	xZzxbUSiUTjljKMCmIIXVs6JsNHHUNOUneAX9OVBPynufIbKRfpKDx2MZsYrkKfCSVbB9Qj5sfX
	E75cPEbf8NYS1cP8yWG/l1N/YP/iZotNyGWo8Lg0nkXd8XcJ3uB8+yWCYjxUnmpCMX7P49r5Eu7
	Y1UbaSxhdpa5ywdorg8nUxtuRFXraweICPO8ECxDOyMB1fRUA=
X-Received: by 2002:a17:903:2984:b0:2cb:ea0b:9164 with SMTP id d9443c01a7336-2ccea3849d2mr28129135ad.6.1783520367125;
        Wed, 08 Jul 2026 07:19:27 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:19:26 -0700 (PDT)
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
Subject: [PATCH v2 03/27] ASoC: codecs: es8316: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:10 +0700
Message-ID: <20260708141734.578926-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708141734.578926-1-phucduc.bui@gmail.com>
References: <20260708141734.578926-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_071928_169907_0946D28D 
X-CRM114-Status: GOOD (  15.84  )
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
 sound/soc/codecs/es8316.c | 31 +++++++++++++------------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index 6a428387e496..e83dab0b7083 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -9,6 +9,7 @@
 
 #include <linux/module.h>
 #include <linux/acpi.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
@@ -621,15 +622,15 @@ static irqreturn_t es8316_irq(int irq, void *data)
 	struct snd_soc_component *comp = es8316->component;
 	unsigned int flags;
 
-	mutex_lock(&es8316->lock);
+	guard(mutex)(&es8316->lock);
 
 	regmap_read(es8316->regmap, ES8316_GPIO_FLAG, &flags);
 	if (flags == 0x00)
-		goto out; /* Powered-down / reset */
+		return IRQ_HANDLED; /* Powered-down / reset */
 
 	/* Catch spurious IRQ before set_jack is called */
 	if (!es8316->jack)
-		goto out;
+		return IRQ_HANDLED;
 
 	if (es8316->jd_inverted)
 		flags ^= ES8316_GPIO_FLAG_HP_NOT_INSERTED;
@@ -682,8 +683,6 @@ static irqreturn_t es8316_irq(int irq, void *data)
 		}
 	}
 
-out:
-	mutex_unlock(&es8316->lock);
 	return IRQ_HANDLED;
 }
 
@@ -700,18 +699,16 @@ static void es8316_enable_jack_detect(struct snd_soc_component *component,
 	es8316->jd_inverted = device_property_read_bool(component->dev,
 							"everest,jack-detect-inverted");
 
-	mutex_lock(&es8316->lock);
+	scoped_guard(mutex, &es8316->lock) {
+		es8316->jack = jack;
 
-	es8316->jack = jack;
-
-	if (es8316->jack->status & SND_JACK_MICROPHONE)
-		es8316_enable_micbias_for_mic_gnd_short_detect(component);
-
-	snd_soc_component_update_bits(component, ES8316_GPIO_DEBOUNCE,
-				      ES8316_GPIO_ENABLE_INTERRUPT,
-				      ES8316_GPIO_ENABLE_INTERRUPT);
+		if (es8316->jack->status & SND_JACK_MICROPHONE)
+			es8316_enable_micbias_for_mic_gnd_short_detect(component);
 
-	mutex_unlock(&es8316->lock);
+		snd_soc_component_update_bits(component, ES8316_GPIO_DEBOUNCE,
+					      ES8316_GPIO_ENABLE_INTERRUPT,
+					      ES8316_GPIO_ENABLE_INTERRUPT);
+	}
 
 	/* Enable irq and sync initial jack state */
 	enable_irq(es8316->irq);
@@ -727,7 +724,7 @@ static void es8316_disable_jack_detect(struct snd_soc_component *component)
 
 	disable_irq(es8316->irq);
 
-	mutex_lock(&es8316->lock);
+	guard(mutex)(&es8316->lock);
 
 	snd_soc_component_update_bits(component, ES8316_GPIO_DEBOUNCE,
 				      ES8316_GPIO_ENABLE_INTERRUPT, 0);
@@ -738,8 +735,6 @@ static void es8316_disable_jack_detect(struct snd_soc_component *component)
 	}
 
 	es8316->jack = NULL;
-
-	mutex_unlock(&es8316->lock);
 }
 
 static int es8316_set_jack(struct snd_soc_component *component,
-- 
2.43.0


