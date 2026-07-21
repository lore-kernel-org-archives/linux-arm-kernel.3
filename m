Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF612C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 10:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8FKz6zL2lYGruFgrXSmVh8CpNcaMm/DKeCPXfcKM2u4=; b=pUjQn2m0mW+XYwjDIvD0tXppha
	KclYH1VMeVShEp2IZfTKWhm3T9k2KcL68mlMsSnptF5iTSp3yGYg06WP7KLDUc31v7OAexcs+eNAx
	IqCOjV02R2QDpMmBAzotGfUuklbo866cZChAlwN0nOEoIrTDQ7RCTXEevstpgfDFPLCcvDSVgcB/W
	pZ5M/chkbEkqFFY7lAqiSyDblJ7EIqSdh+eG+T4XHMJv103hJhU4XzsMaD8ACx7vsrtVNJ4QriWLb
	joh9rEBTbEdXirauU6g9TlkrepXI7b7fO4jz/CPzvZ/R6x1JcCxRrr44sjl8rQ38CX6CtvVQCM08f
	kzcI9Hmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7gV-00000009847-2uho;
	Tue, 21 Jul 2026 10:26:47 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7gT-0000000981x-17Oo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 10:26:46 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2caea3f742bso132662665ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 03:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629604; x=1785234404; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8FKz6zL2lYGruFgrXSmVh8CpNcaMm/DKeCPXfcKM2u4=;
        b=AZod8jN1eezgkmaiZhcwFT5BV+xOllEDCCxvG6zTEBh5aRiow5oQXB1mwjMbw9HRqT
         UNqnspjhLY1CLnd1lwZVEUV4xqhLJ6p4ajykRYlK6H2v7hWFqV+UQU9LpkEkjx0UMede
         grh5pli9YwshNOiOnJ5H3AzFuue+L2zGx0ztNbtM6T+XylzMs1YS6bhbtOZJMcvxkYpY
         oYVsr7+wi9xFKlQ+COnQlvenc7RSREPSMyGAnMxMhHA2qfezYNJTD08eXmJiUElGDryX
         kqnBTPoNnS0fALCy1+seWMKBVsrAnHcMPGfe8v/04DCGXeXD1MsuBSoDff9UIOseu2YA
         nJmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629604; x=1785234404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8FKz6zL2lYGruFgrXSmVh8CpNcaMm/DKeCPXfcKM2u4=;
        b=COqoHuFmTOSxx7GzUerUB2Jcq1HufA6ZMNnJFaf2ElJtewPkJ3Z+0wN8LtWLCwtMi3
         RhPFQrE+w9leRfq8MsQtFIukc36eevEUYsdREiRdrnUYcncBX1S4Kcyk/9PtMLYNE4dp
         F5V1p+235Evie57IuBn4yAFJ7wzCeJxgcFR/ud8wdEMFq5eFv5WSkkJy3P15dP82gJTo
         7IMK7C0SsRoz5W6HaCcglROyFMpIOfQdk/assMZMT6FkCCWwG4NBz9twn3tZieKz0/EX
         W6K1DbyTempX76bcG9UDA2L2htxLclQr3Rp0UEVEvwSD8JYnR49jQEMgGqc2H9quCIoK
         46/w==
X-Forwarded-Encrypted: i=1; AHgh+RrzMwXJXGJJLs+lyKJ+kNAPsktsRr4sa9Y5XcgQtA4GqXdsIRBNxVXug/tYg+JunJF3Sz/OzzkLLYnTCGKBVR/B@lists.infradead.org
X-Gm-Message-State: AOJu0Yz87jBkghW+wrFLeuiUFcrVlGpBn6dBPRH/keN0JylLacUW3tpB
	oiZ689p6rSeNs0CUZO83dVkKDREn2ZDh6fXUxd6CMKxyMVBU2w46WOZj
X-Gm-Gg: AR+sD12esnzoBrLLo8QdDjbCKQW1ZEOmHEIGeMgWqndkkWgYbyiuMjLqCj3nctnBm0Z
	n1AlyZwfvE5EW/jC7HBQ1O7vj1JUG47bLtrP+1lv23GAZcuqhuIruhUOv+/O6ZfbyY4F4xAwekk
	YFyuvLn20Kh6NVkxW7L4mKxCgMmyInNvkZysUCXZc/eBF713wm2EAiYowwY6f5ty0AL0CvAFUWv
	H9VttEuDgi4uEiADhVbhzfhz8ZgbDlr1vs2cUCWJeDAk4NrWh5tkSlKGZh7ROLHxc/BTJ0hm+CA
	Ygn3HrAIOz+su5YdgaWUUYWKgTDpQGuPlTANd9Ex7UScMQ9o7ivFrNRsw9Z59cRfF1K3zpKV+DR
	FdqvCNh+8oy8Wt4ps6fXQ730NqPxZIsSTAF+5iBdi1fQNZGnQ9meMwy1pOu6xoF983poJGaapfP
	JFRYg7nsRLx2VeldODTvvrazfJwZoGCxV/FWmp
X-Received: by 2002:a17:903:1b0e:b0:2ca:73aa:b48f with SMTP id d9443c01a7336-2cf34a48f7fmr193973625ad.35.1784629604317;
        Tue, 21 Jul 2026 03:26:44 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:26:44 -0700 (PDT)
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
Subject: [PATCH v4 03/29] ASoC: codecs: es8316: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:34 +0700
Message-ID: <20260721102600.523199-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721102600.523199-1-phucduc.bui@gmail.com>
References: <20260721102600.523199-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_032645_317675_068F6EE6 
X-CRM114-Status: GOOD (  15.50  )
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
index 3abe77423f29..87f331868dc7 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -9,6 +9,7 @@
 
 #include <linux/module.h>
 #include <linux/acpi.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
@@ -620,15 +621,15 @@ static irqreturn_t es8316_irq(int irq, void *data)
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
@@ -681,8 +682,6 @@ static irqreturn_t es8316_irq(int irq, void *data)
 		}
 	}
 
-out:
-	mutex_unlock(&es8316->lock);
 	return IRQ_HANDLED;
 }
 
@@ -699,18 +698,16 @@ static void es8316_enable_jack_detect(struct snd_soc_component *component,
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
@@ -726,7 +723,7 @@ static void es8316_disable_jack_detect(struct snd_soc_component *component)
 
 	disable_irq(es8316->irq);
 
-	mutex_lock(&es8316->lock);
+	guard(mutex)(&es8316->lock);
 
 	snd_soc_component_update_bits(component, ES8316_GPIO_DEBOUNCE,
 				      ES8316_GPIO_ENABLE_INTERRUPT, 0);
@@ -737,8 +734,6 @@ static void es8316_disable_jack_detect(struct snd_soc_component *component)
 	}
 
 	es8316->jack = NULL;
-
-	mutex_unlock(&es8316->lock);
 }
 
 static int es8316_set_jack(struct snd_soc_component *component,
-- 
2.43.0


