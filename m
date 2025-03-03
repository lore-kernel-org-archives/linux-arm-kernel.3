Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E2AC282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 08:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QSwJcdDFh8D6SKpgTLO17+NlEvY9pqV/dD+QbbnNntw=; b=LxBfRkKXGKqAaJeWOE/fhHMkpl
	o+s6rnWjZ9ZO8Pbaj4utVge4ypVpL6QTxxCjhDV7QLDL++lK7AI2K70ip7PwOsIN3u8LxNpF2CdgB
	TJKVTiqIotug8jtCGF7XolkqgzHe2OJg8EOkq11DT/ose3qXlIfaO+IhRi8NLPON6vClcxFV+mE3Z
	9wSVBR3KiAOzF3D+5O721oaf+k5HWuhbXYFHonm0aBCatmNgqLFciPI+WPiU1g0/XOipZ+B36PEgf
	dGV4HPNB6LgUbrZ5J++VaxOvzwW/aGRqBG/1KAb6TWd1oHLYkmnLRMDvpvg5xi/zoQn09ajwsL5yh
	M+RwjIIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp1Wl-00000000098-3j2L;
	Mon, 03 Mar 2025 08:51:55 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp1Mz-0000000HZHV-0zk1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 08:41:50 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-30bb64a4060so7255361fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 00:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740991307; x=1741596107; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QSwJcdDFh8D6SKpgTLO17+NlEvY9pqV/dD+QbbnNntw=;
        b=jrFUvQJiN/QmEVsSVuBdgUsNBU2MK852O691sxtCEMsxRGilRCHXJhGg/g2T5i4P+x
         wnYEGPiKqRoedRhzYWoVl0L7xfS+BTBYAobXN+3liNF9Vf7FAezA3yHiK0uCKrw/uIoV
         B9eKnd6Pu4hfLoilUtAgSlNRD/jfQrEuCLP4j2Wl8vVvJuo1XavUAKLqZU9EeGVKr7au
         6Rgs4mkT169IBptTj0G/aVzClU1KT8Z+LPH/ZTiP8Yy7FOs99fOaKm4aKPei/UpiR6dB
         Xj7n2Y1RO+czWnPDxXwB0qVe9HVD+/VE9izTbrL5VgtCIpy/zKJOFgOslwPtM57GCznT
         izIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740991307; x=1741596107;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QSwJcdDFh8D6SKpgTLO17+NlEvY9pqV/dD+QbbnNntw=;
        b=VJWd/gI38rycOIoV/JI8xaeUMaeUvgfQEu7My4MpYQmaXNKcqUxyMxv9e5Teuouuw5
         2XmqNlOCUcRRYPWqTfN0e67ruDNyHMMN2cNJPfNNWCKZ5zBZ1OYPJhYWjc1FSFdmJZCs
         MJyhr/zn4GMi8qE9lDvEfoTJhOTRzFL9VChpP+PiEPzcMTtTwOaaMKhrOz0KvU2yGHlp
         RA+WPxspwbTKyeXK/p86VWe7hiGIo03EoNZsDCBhhzjaG/HuOV25SdIK7rYg9rNmS55+
         Ldh07gJ5afgm3YvPSTrOT2IiA6VFDHmRMqdF2VGMBRo/+6w43whc182PQqj/fcivXWgs
         S07Q==
X-Forwarded-Encrypted: i=1; AJvYcCWKPxTn3b8lZEpGK5fp/VXPJT0M6JDdTqmeziGZi7OFx5xUboI+3IMQ1mws4Hwe+0120A5/4/9BWcDLBGa2kmZI@lists.infradead.org
X-Gm-Message-State: AOJu0YwICcf7QXgdVY2t4hSb6ySQEzoAxGwvPYj5K74FCQKxEGnNtZk0
	z1KUH3p9ZOgIPbJF/jVbH7IPaMVfo8oy5dDjCAEXb1a430H9Um2TBi6bpJVcYJY=
X-Gm-Gg: ASbGncsMNcTiPCFsK24Pq55YYoSHR1L8VfPI/zXig+iL80AVhac8qwn6gA9AY9fRF1m
	0mVh6ot8iv0vrjEstbAVu9y5Bo5BtWm8a/m7pEKRZVIrk3QMSE88VUgtaJaZrf4lEb393MOrPpo
	2X6vR0BY5h1FBnEP4vLjwmRtJ1WeMDOvwrCL6LcwrDS2oulHDUZtGwjLaijnmQr8+YQyb0iqHC8
	tDIK6Bm3rnZteU3MUfvBQfjyO3IUej8yic2JFA1w6ADD60u0d3op79mXUFSghD8FbvIZpW1+WPu
	gWK6fAedRMmb0p6VyB4r/OO3/Q+013zkwxlbAN2VUSlFRxv6qvE8rBM=
X-Google-Smtp-Source: AGHT+IF6Gh/owdQANIvhyYACKJwghbMIJCt42VIMQ7h6UQPochcPtTUdjjYYrRpdf3fMrNRP+dsYqQ==
X-Received: by 2002:a05:651c:2227:b0:30b:b908:cddb with SMTP id 38308e7fff4ca-30bb908d758mr10862631fa.16.1740991307204;
        Mon, 03 Mar 2025 00:41:47 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bc49d8b56sm827371fa.80.2025.03.03.00.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 00:41:46 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 03 Mar 2025 09:41:44 +0100
Subject: [PATCH 4/6] ASoC: samsung: speyside: Convert to GPIO descriptor
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-samsung-codecs-v1-4-56a2299dd928@linaro.org>
References: <20250303-samsung-codecs-v1-0-56a2299dd928@linaro.org>
In-Reply-To: <20250303-samsung-codecs-v1-0-56a2299dd928@linaro.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_004149_282801_19C2E9BF 
X-CRM114-Status: GOOD (  18.78  )
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
 sound/soc/samsung/speyside.c | 37 ++++++++++++++++++++++++++++++-------
 1 file changed, 30 insertions(+), 7 deletions(-)

diff --git a/sound/soc/samsung/speyside.c b/sound/soc/samsung/speyside.c
index 79476e8eb680984434a1198ff691ddd4b9fe07c1..947b85ff83f036a0814fd477f5f6f69253a2a2d8 100644
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
@@ -325,6 +332,21 @@ static struct snd_soc_card speyside = {
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
 static int speyside_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = &speyside;
@@ -332,6 +354,7 @@ static int speyside_probe(struct platform_device *pdev)
 
 	card->dev = &pdev->dev;
 
+	gpiod_add_lookup_table(&wm8996_gpiod_table);
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret)
 		dev_err_probe(&pdev->dev, ret, "snd_soc_register_card() failed\n");

-- 
2.48.1


