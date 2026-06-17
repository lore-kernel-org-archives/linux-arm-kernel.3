Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ABDACD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 10:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xcitmHPXdjwjVBCqMlXK3p8pn3Z3237U4G8SnuErAoU=; b=sIEtnbaB5kgvD8BZolnMYlRiVA
	zF7TGv51xN92qoarlkcVXgbyZLUtInE9ojHsh//aXCSYNAwkG7/sVK5nObUbmqK1UakoHClXm/NNg
	hQWKhsc+iL5YX6+R4wQ8MDto3lQPrP+FsNGrILkxiVj2k9xaB9Rn1K4baxoLKLOfHXH/XB+62YB2f
	JnNkG2J9YKCIxBUak+evx4v3QPyj9u+poVbxjRBDkzvQJHlqJmcrocu8kMYjZXq0+2Z9zz1pRRIOE
	+O7oXzQcSXYU/hWQ895iUIFKIYx5ke0VdBCczWCspnomEKwqrFJUTKYOq5N5C/izxeDzk0s4P5lCE
	oKB4Vh5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZndv-0000000H6kA-2aku;
	Wed, 17 Jun 2026 10:37:11 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnds-0000000H6hx-43b7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 10:37:10 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-30bbe98c3f0so2724117eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 03:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692628; x=1782297428; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xcitmHPXdjwjVBCqMlXK3p8pn3Z3237U4G8SnuErAoU=;
        b=jz37cX72MybEWEhNe3F4oYR4bp1ObUZm4QK2bhGGHmRKHJc9RQpXoCWFlemqle0mpi
         HApFtFNH41PeiXPRMvLQfCAchtBRw5M8vjvCZjqsmiBMdxI+JHrH+j4zAhMRb6rBXwCe
         q74HKEDpRouFmWjkqucerk6hEFQwMkpNNwPqlUiBTVkkglYe9ouh+bKDxtbEXWPXXOiP
         KA5XmTmR61km9Wa1DF0Zi0QB0p0FVhVN3DnwblSwtXc6rTfTk83VwdmqpEuOfs6BId0a
         lu1HtiRyLwNOIsGfXoI7paK2ZIsvZf+yaecFUvfEdTqoXzm1QO+QSKNbMiYMOANQjlzn
         8o6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692628; x=1782297428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xcitmHPXdjwjVBCqMlXK3p8pn3Z3237U4G8SnuErAoU=;
        b=CbUs6s61yahOQVLl4u4bwS1Qk0ZN1JEfzMCh4T8z/GlxmKr4WUcbTtalLod3hYyxVW
         9MRLsUp82PratsDxNwYrlGT9inZ2AVGn5Iu09xJYB4BWZu5j3YmNvfqf0t4KIougdyyQ
         DXcwrDngzrxRcsWG2o4n4oIR0NhnIiQajv6TgBUPfZhiMy6cAPKVie6AzAAiBPj8moUa
         p7gCvteYTueAmSCDzNZIuFCou0/9FMEkelZW4CxCTjsMQjVEZWL7bqSFeCjzKr3Vdali
         BctrQVEhLtvKLH5FRbyh1iiScxwW6WvLazuZUKOKtU29ihICPw24vuB8+QPTi+Zlfp//
         zNyg==
X-Forwarded-Encrypted: i=1; AFNElJ/DyLfQVWSuosrMYENGvq9FTWd4uILeHR83cwCYRnvOzQ45iXGwAP8nYONBY0ovW83qT21m+sjYP+vqnqDcOVtF@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3FCHIns2X8XyxR1hFzXkjN/FqA5f1i3bxH2GByhWSP1EhNrIo
	fig5Go+9/Dsp9r5BLQK2Ix/w8rrocJL5UyBGKUAB3JDd6NqmiHyc64nW
X-Gm-Gg: AfdE7clM5btUy2CkNV+gzcYxAnvUYQb3PS9NVSIj9oYF/dieo/AeUfust6zfpuCXu8V
	o/TbWHTiRxwYLJZfShYh2Gwlz+XkBSeNUTjuOQVccD4MuiReZsUnzud3BnNrztWhreD6DwOP49f
	3YmxDXO/umPc6z7pwxGjck3I8hNIPtH9Cj+7/8TMUQsUxPjo1IAOJy28spBt9GfeagmG821IWOt
	jumVRxJH6MBSAGHuYOohbu9U8T67CLBsqiS1pmA0DG/aTGLaWzr4SeJRTbZvXusVO08JpiVaNDS
	FlOee1IhnJxqYl3NSjaAVJrdoicJZFCxBWp6lhCuJeNSPZGeVzODWSUBved2/CFSSlUSitrJzx/
	mCnYoHAfjROtbREEbbGP60O0biQEEjFGjMZtDjZ6m9iHnYAu6Q0jABV1QMzLpqBjIwieJqjgzpl
	LQrfTqQ4wi9+pH4ckgQGMKZAMY2qCGePxI0Ln+dVdet7biKKs=
X-Received: by 2002:a05:7300:4313:b0:2d1:d434:cfe3 with SMTP id 5a478bee46e88-30bc92019d6mr1607108eec.0.1781692628170;
        Wed, 17 Jun 2026 03:37:08 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:37:07 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 27/78] ASoC: codecs: es8316: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:44 +0700
Message-ID: <20260617103235.449609-28-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033709_007996_7615A6DD 
X-CRM114-Status: GOOD (  13.30  )
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
 sound/soc/codecs/es8316.c | 30 ++++++++++++------------------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index 6a428387e496..df6cf8a19270 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -621,15 +621,15 @@ static irqreturn_t es8316_irq(int irq, void *data)
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
@@ -682,8 +682,6 @@ static irqreturn_t es8316_irq(int irq, void *data)
 		}
 	}
 
-out:
-	mutex_unlock(&es8316->lock);
 	return IRQ_HANDLED;
 }
 
@@ -700,18 +698,16 @@ static void es8316_enable_jack_detect(struct snd_soc_component *component,
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
@@ -727,7 +723,7 @@ static void es8316_disable_jack_detect(struct snd_soc_component *component)
 
 	disable_irq(es8316->irq);
 
-	mutex_lock(&es8316->lock);
+	guard(mutex)(&es8316->lock);
 
 	snd_soc_component_update_bits(component, ES8316_GPIO_DEBOUNCE,
 				      ES8316_GPIO_ENABLE_INTERRUPT, 0);
@@ -738,8 +734,6 @@ static void es8316_disable_jack_detect(struct snd_soc_component *component)
 	}
 
 	es8316->jack = NULL;
-
-	mutex_unlock(&es8316->lock);
 }
 
 static int es8316_set_jack(struct snd_soc_component *component,
-- 
2.43.0


