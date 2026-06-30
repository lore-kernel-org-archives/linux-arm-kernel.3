Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1857EC43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 06:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RozeYceB4iwycNfbGDK46tH90J5JBru51kfxpqOiyNk=; b=HRbpJXkiTsJp52foCi18Etx65L
	A1a8mRlkmSwJXkE6q80FX7VaM4o0v1fYfRHzNXuknuZHPMdscebeX7QrZ8G9EIDXyynTtLGG3nzOo
	xWL5dZVyUTMUwSzCrbWmnOVOWWvvwAvczoee72cP8QSfMde3Lntj4dLcw474kaq55E7T8/ZYLpKWg
	uy5Q2X6X8yYGfIaWen8Czt2lRxOxzVlpc2Z7iKGW9s+mln/XLN5eijJ+tQXsDIQ8W9QZdZtSi9MhG
	ml4EkQyT2zNhN14fyZcfrYVMQp7Iz9jXAak6kPuf29w42Z6Y08PiRkt2QZKF3tg7k4B0YbVDzdCFz
	NFGPM2KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS4H-0000000Fy06-2jwf;
	Tue, 30 Jun 2026 06:35:37 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS4A-0000000Fxs1-2aV3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 06:35:32 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-c9672e02e05so759968a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 23:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801330; x=1783406130; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RozeYceB4iwycNfbGDK46tH90J5JBru51kfxpqOiyNk=;
        b=ddZG8mUd7h813USLhAHfvb0ED6Zbub4YD22G90JT+iYYwM/Gb8+B4DnbbpKyI6jzjt
         fGNxE/UZ3EANnFtBLs41w0tyqCsglf5C5QavbpielgEo1UNpzcgiqwWs6TIoNtAp4MV1
         Ajq75tOyHdFFQzfGOfC0H4+M7ex8JIIDiHYgwASPr1DnkuY3c/gqDf91KaB7yLqVprlZ
         6fjvIE4kCDTxejpBDrhGxSrJLifoW26j1F93V4ozMGC7Btkb9lS1P2OXevBtttUpHzBu
         wTTA01aH+Kuh5aIL2fo50hZ+8TJ31c42TvuhuWzqymotyWxEWkRlQ6GpA666JJekOa10
         GqDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801330; x=1783406130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RozeYceB4iwycNfbGDK46tH90J5JBru51kfxpqOiyNk=;
        b=AdLOHQvjqhc9Hfn40NGUNLdexj4oPwOzL/LtzswxrP+E7jyVb4MmFpLECjrl1QbLzO
         gsS/I8riEtGGeLeSEuIvoSbdtYA2bRdvuKYXrmCYDEAYcBXMYK9sHUOqEHJngMDNu6Qk
         JPjyuTNqeCy4+OHSX9oNNVz34G68omP1/QwUc8KFbid8Z84ve0eajtbpqTxCm0fpK2v9
         w2qA569Wo9AIV8KEc9zCCw9MrJN4MotH1p9v+YFh6yZwfsu7HLfHzpD1YbB0EMQU6ISd
         R4OHhVvudnjWdf8DkBJobT25EBZ3WwtOI9uewTJB5o1yoO8EsTqzY+5V1A04b/Z2wtZp
         NzVg==
X-Forwarded-Encrypted: i=1; AHgh+RqJeoMG4c/G7T7C/KjadtjkbJaIcMW1vztJ7JnJ3SJMZ6z4z9v5FRQ3N9DH7gKl1QdNH6uft2DCIMpCNVcAGRcY@lists.infradead.org
X-Gm-Message-State: AOJu0Yyg7ipvCHYRz5Tuz4gB3L6D1kaQUKvc9xWqGBmqPxY0fLwy+MVL
	gav4HgR3Al9UQORHegwoH2mSIHRIdZpkuyfLHBJI8tGQLUjcfiLZG48A
X-Gm-Gg: AfdE7cmtfMFE7GBeN5Rw6/bLLLrKBwDw+tr5H2zyaVOZm/0wQb+WL1c3oamV/0bTzOP
	Np3ofT4PMQ6QfQf2h4e4FUcazl9QcGQcqI/1jT6bNcW2GtPqq9b2dpjN4DU0hBzyqD5vWoHIoxc
	XAZUEscLaNcdAmmvQw6/HC9dPPtrqd42cWgmV1/Pd1z53hsNczYwo8ZsCseM9lNEMGN80uMOCAW
	0N88jb5FE/j7+C3GEY4w6z9yZXPv3Cs//O29CLr/s0k/MmBje2BBYQo963pFE47pF/tlMM6zMg+
	/Xw+xxY+p19hRnprJTtmLNEVNwNDJjR8Ci0Nflcb5+O06A4seaoXiJ/XmQ+XHK6XWss0j0ZFvFb
	wQvoaDEOVHNq/scolWCl6kOK9LiMZagpbkX3mojStWSw4GSFOZ0OKlA72LQ31cHyXVElLYKaBVv
	7ndTVWUWyqlfo3F1ceogtecopwfpA/DRVLj7hyr0CXa2ap9h4=
X-Received: by 2002:a05:6a00:3d04:b0:845:cf73:c1d8 with SMTP id d2e1a72fcca58-8479f1004f4mr1954813b3a.14.1782801329607;
        Mon, 29 Jun 2026 23:35:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:35:29 -0700 (PDT)
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
Subject: [PATCH 03/27] ASoC: codecs: es8316: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:25 +0700
Message-ID: <20260630063449.503996-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630063449.503996-1-phucduc.bui@gmail.com>
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_233530_681730_BBE58E8F 
X-CRM114-Status: GOOD (  15.18  )
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


