Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A273C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 09:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PwgqV7JMKM+1Tdt6knk3Cvvf9DNI3Ep7WFwi1Aj3y68=; b=iDr9Y5W6ztMZl5LTb9sY9wBVpM
	gT1boBA0LqQ6VuTtuz6GIJxdNKVlEA7a+AxpQ93PjhXYxy5vgC7RSJsoBzQBsnyexSEnOlYszsA9M
	kt6U9ErOKb0JuMPywN3QuP+mKu5lX5JlQ6SRjisiqbDNV0QmHhCCd+mlh/sX4oXx9b3UZ9sf9OD9r
	kDv+KV9AAzLd8qdSrdmfdMlNy7sl8+kd+47mmxFwmrwRwYYPZeFkoY9xm5nbRB+MuOrf/h8g0nC8Y
	j0WA92wCd4GcQ1xyy8dt19qH4m+Gj4O8XIZ6Cz/MLymmt8VTBG7wxZ45BuQm+tgdnNHbBLd4iEjma
	eUM/QuUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpkba-00000007R9W-2JRw;
	Wed, 05 Mar 2025 08:59:54 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpjLd-00000007G9R-4All
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 07:39:23 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-30ba92c846eso38029321fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 23:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741160360; x=1741765160; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PwgqV7JMKM+1Tdt6knk3Cvvf9DNI3Ep7WFwi1Aj3y68=;
        b=vS0PGdLi4NEU4/h27eM3/YCi7BK5Hl/th1563JBE6B3avy+hQ8SA5s8p/1V2puxELK
         pDxe1+1I6woDCgRshP2PqADtrlApaI8Epb8Wthdti2qsGolO2SBL7RBA5cJTRCyHObDb
         LMM3liNce8Z7cvUSJWZ4yPVEFCV0fG5f3KiY8X9NhJt4BQN9TAMMLozvTKoqQj4bmcn+
         Hv+pC4ETz/adaJ5vgg4yK2ER7Dq1evyG5w/sUW1VmTh01oJNDdUOxjejF663G4GG9qQu
         CMg7hVx6sdpRSbvosIbUSJVgEMVUODlGd1Ui/Il9IebTx6CICaavWth/31OFIwPyofcI
         URFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741160360; x=1741765160;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PwgqV7JMKM+1Tdt6knk3Cvvf9DNI3Ep7WFwi1Aj3y68=;
        b=k7XMGWiAbCgD7Hk6yv39KBjP62q4uQM5VZYXzA0+087WcizjQ/eBRQjLQfgtk8+LNO
         NO25aa//dLY1lVDgn8lZYmfRk3cTkaVoBTKPYrk0RMPqViT3uPA4sBAB1ksUXREFSjna
         ixeMx+2l93cea+mQcbWI/u7Prwr/NSj43r67027qzf7VMdwdgVe/BD8OFhqdjggVnMUe
         uavqGFmfeb50QYXNIEorFuiIRuHUHJ4OTNn4Wu+nIWFABl1vILayPSoA6c9Rlvm1qMzn
         UChy8Y3O7ncFP/69WS9FLgGw4UJ/zpJvhnT94nx8mPRXhOV28lHNij2bn6YFDfCeJyp0
         HB3A==
X-Forwarded-Encrypted: i=1; AJvYcCV9+PlsniMVU4BpEueVAvgsNcqB2EQgFyAigf7gjwv0fvHwuDLoWfWqnx3rwud7Aiebx2lklLkW5iOiXyMwuJN3@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4If9eYZElImzXC2zFZLi1z29ykT+OvOnOWssbpXBTnj+630Tv
	mdRTEPnkGSsvV7ezQbcNcF+wRLvyj/Jva8C2UbDB8+TPQKozpMOgEsnZzHlg2Cc=
X-Gm-Gg: ASbGncvs1IVZtb6STovk9NgZIr6aqVt67R8aOfyKNKMq8ZVQ+dZnXAKCTyohi7EtmZD
	+jZhW7SW83tndZ00dbCFgTMkKsl89q4k/3pnetNV8Y9Iv10gSCX8o32OJSw8/ZLm+hyNJxEjuLT
	cPrRTpTgOUBkgxw9sjlkoUPFynlFOwsZmhI0vIv6sqKA9cDOo3GZA34p47XCfN1iW44dWvhljBr
	JgHzwafQoyFCyVTHLvXI2EEY3pYUXjdOTJpSa3r6cUoNxmxZcZQBZ6aP1q+79olYaZk85q9Sx9w
	+vy6tBOToNGDKN/gWPUMj3nfAcMZZY+ihla+2CmMxJMR/L2HLwXwErs=
X-Google-Smtp-Source: AGHT+IETHX3WLF7A8QYZdcOSJX3vTAinkijtOtXIBDhRzk3pdGH5kt3jK5fgx1/s0BdnTDWh4IXh3Q==
X-Received: by 2002:a05:651c:8c:b0:306:501:4772 with SMTP id 38308e7fff4ca-30bd7b173b9mr7061171fa.37.1741160360083;
        Tue, 04 Mar 2025 23:39:20 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bbae78e73sm8902351fa.75.2025.03.04.23.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 23:39:19 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 05 Mar 2025 08:39:16 +0100
Subject: [PATCH v2 4/6] ASoC: samsung: speyside: Convert to GPIO descriptor
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-samsung-codecs-v2-4-20bc980c6445@linaro.org>
References: <20250305-samsung-codecs-v2-0-20bc980c6445@linaro.org>
In-Reply-To: <20250305-samsung-codecs-v2-0-20bc980c6445@linaro.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_233922_060686_D439DD15 
X-CRM114-Status: GOOD (  19.67  )
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

The Speyside ASoC uses a single GPIO from the WM8996
that we can provide from the local offset on that chip
rather than from the global GPIO numberspace as is being
done currently.

The offset 2 was done by calculating the base offset
for the CODEC (i.e. wm8996) GPIOs to 212, by reading
arch/arm/mach-s3c/gpio-samsung-s3c64xx.h and
arch/arm/mach-s3c/crag6410.h and adding up all the
offsets that were occasionally adding a +1 blank GPIO
between each GPIO provider.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Patch in a devm action to drop the gpiod table.
---
 sound/soc/samsung/speyside.c | 47 +++++++++++++++++++++++++++++++++++++-------
 1 file changed, 40 insertions(+), 7 deletions(-)

diff --git a/sound/soc/samsung/speyside.c b/sound/soc/samsung/speyside.c
index 79476e8eb680984434a1198ff691ddd4b9fe07c1..d6b8c62e015a3114c7a746e1f754217ffacb7044 100644
--- a/sound/soc/samsung/speyside.c
+++ b/sound/soc/samsung/speyside.c
@@ -7,13 +7,13 @@
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
 #include <sound/jack.h>
-#include <linux/gpio.h>
+#include <linux/gpio/machine.h>
+#include <linux/gpio/consumer.h>
 #include <linux/module.h>
 
 #include "../codecs/wm8996.h"
 #include "../codecs/wm9081.h"
 
-#define WM8996_HPSEL_GPIO 214
 #define MCLK_AUDIO_RATE (512 * 48000)
 
 static int speyside_set_bias_level(struct snd_soc_card *card,
@@ -105,6 +105,7 @@ static struct snd_soc_jack_pin speyside_headset_pins[] = {
 	},
 };
 
+static struct gpio_desc *speyside_hpsel_gpio;
 /* Default the headphone selection to active high */
 static int speyside_jack_polarity;
 
@@ -123,7 +124,7 @@ static void speyside_set_polarity(struct snd_soc_component *component,
 				  int polarity)
 {
 	speyside_jack_polarity = !polarity;
-	gpio_direction_output(WM8996_HPSEL_GPIO, speyside_jack_polarity);
+	gpiod_direction_output(speyside_hpsel_gpio, speyside_jack_polarity);
 
 	/* Re-run DAPM to make sure we're using the correct mic bias */
 	snd_soc_dapm_sync(snd_soc_component_get_dapm(component));
@@ -145,16 +146,22 @@ static int speyside_wm8996_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_dai *dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_component *component = dai->component;
+	enum gpiod_flags flags;
 	int ret;
 
 	ret = snd_soc_dai_set_sysclk(dai, WM8996_SYSCLK_MCLK2, 32768, 0);
 	if (ret < 0)
 		return ret;
 
-	ret = gpio_request(WM8996_HPSEL_GPIO, "HP_SEL");
-	if (ret != 0)
-		pr_err("Failed to request HP_SEL GPIO: %d\n", ret);
-	gpio_direction_output(WM8996_HPSEL_GPIO, speyside_jack_polarity);
+	if (speyside_jack_polarity)
+		flags = GPIOD_OUT_HIGH;
+	else
+		flags = GPIOD_OUT_LOW;
+	speyside_hpsel_gpio = devm_gpiod_get(rtd->card->dev,
+					     "hp-sel",
+					     flags);
+	if (IS_ERR(speyside_hpsel_gpio))
+		return PTR_ERR(speyside_hpsel_gpio);
 
 	ret = snd_soc_card_jack_new_pins(rtd->card, "Headset",
 					 SND_JACK_LINEOUT | SND_JACK_HEADSET |
@@ -325,6 +332,26 @@ static struct snd_soc_card speyside = {
 	.late_probe = speyside_late_probe,
 };
 
+static struct gpiod_lookup_table wm8996_gpiod_table = {
+	/* Hardcoded device name in board file mach-crag6410.c */
+	.dev_id = "speyside",
+	.table = {
+		/*
+		 * This line was hardcoded to 214 in the global GPIO
+		 * number space, S3C GPIO macros seems top set the
+		 * wm8996 codec GPIO start offset to 212, so this will
+		 * be GPIO 214 - 212 = 2 on the wm8996.
+		 */
+		GPIO_LOOKUP("wm8996", 2, "hp-sel", GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
+static void speyside_gpiod_table_action(void *data)
+{
+	gpiod_remove_lookup_table(&wm8996_gpiod_table);
+}
+
 static int speyside_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = &speyside;
@@ -332,6 +359,12 @@ static int speyside_probe(struct platform_device *pdev)
 
 	card->dev = &pdev->dev;
 
+	gpiod_add_lookup_table(&wm8996_gpiod_table);
+	ret = devm_add_action_or_reset(&pdev->dev, speyside_gpiod_table_action,
+				       NULL);
+	if (ret)
+		return ret;
+
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret)
 		dev_err_probe(&pdev->dev, ret, "snd_soc_register_card() failed\n");

-- 
2.48.1


