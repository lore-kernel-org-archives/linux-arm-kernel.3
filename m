Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D65AAC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 13:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8zb19l62LN7ssNNUqMMp02ypDTWsuR6UE9OCfe02DEw=; b=K1VsXqehvLOO6KIy2F6W2IDmgz
	o42DqiD36/Q+4eW+H2gT1SkcxBm9oT8TIEWeoVHVaVzzKbMh43bCcfRQcZeDCzEe/HOuR30T1Sxo3
	IDgabJXfp5m03TzePQauvvnBTro7+jX/N6CLo395sig/8f3PIeEKcKF8zAEZolF4n0whNp4yzjf9S
	6JCBap4mvbyuHVevvPFXZQOkHknuGmsljJtQhumQMFUeN8LHePviaz4/z07Bo59tKnGB6SjroAxA+
	i5I4LE8Mub2Rkig1UgkFrsewXOU1bc/szQHatOxIoykuOxQgDzaefdpIa5tnAmM6owNFUO0dJuu+j
	sbcT7UXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUQX9-00000008rj2-41tu;
	Wed, 25 Jun 2025 13:51:27 +0000
Received: from mail-wm1-f54.google.com ([209.85.128.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNRr-00000008K5i-1HbF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 10:33:49 +0000
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so72349595e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 03:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750847625; x=1751452425; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8zb19l62LN7ssNNUqMMp02ypDTWsuR6UE9OCfe02DEw=;
        b=z6Wy40cPoI0k4RMi+GQW0TpxrqT6G3+JNXZKIvxbBqhkrkVWopHu/H+W41gIK0WuDT
         aHx6r8iwPkCihsHYKH7j1kOqmk09sUPf5BLJ+UHVUC2hg49QITiT/wBCT0SijKSW5UHb
         MLCOpgsdlM9P4Dyj53Kl4Me0T30QO988pF84GCtqmMsqzIM0YEV31RnUnWaot5D1xPqe
         2eqZCaMvVS9AhJYwq8XeekeZmTMvPstU3TUZFREd1J1GqDvt0wqOa0wf0r6rg4iQk3xL
         +rRyPw2PjM4oI3K7/162E5apg/1KhbINdTAcOQ64pkUkD7cygn3QhLIaXDBa4pdPg+P7
         6frw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750847625; x=1751452425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8zb19l62LN7ssNNUqMMp02ypDTWsuR6UE9OCfe02DEw=;
        b=OphNAw1xIVWwpr0X25xooVWcoWQ9R5eryHAwnqx/PVASssIB623h7ShIUcEQeE/HGW
         DQEN1O/HIdGCitwzMArMMnDuqZGXXaUtxaTMpYw7QdyYQK06fhx2sFasESJxEwiTbuvi
         kYQs6w26+kJpxYPvvBi48a7qOAdWgtciu4dB/YnSlQp5bOuFZ/sat4y6lF5kJPytfYsr
         hfzoj2+nna1FFyIBxjRcyQpJ492vGktpyTNu/2AehABJ3tw80XBtD5YSCqx/5Aahdt27
         +HHkc2P1cZu7MpIfu9eg7lPaKI9uuz5nd3IAteiQUVqNDbL4zI/FZz0hbwt2EJD1axtT
         BDpA==
X-Gm-Message-State: AOJu0YybETSp/JXdYrXhgWQx0PFoHsFBldED3/R5JACGPnNd5q18mZ9V
	6fJQNo8hLddOz2ZXoUv9qAo5nxS1G8JKfzEH1UrRi/SiORvA8K8tK9ln4T3H5NHLCuc=
X-Gm-Gg: ASbGncsWbGZaHSTRGZMqxAwagjMlHSRRHQTPrhD4K/FuNpzT9j7jl/iXyHkp8zjeK7z
	GG6iN3gE0fl8GRJaxm7jzw/8MRmn1qEjwEz7keKeD9j2xa+FXQo3KwOTBzoENMcfgalPmyV5+L0
	uKballukK/4qUGjkUFv/K/ROqEXI4e1Bey2rUVBQGh5hiCQOmCgrOgXfAYIRxoepxkZw7aVzYwv
	wYiIS1Pi5YkBMQOz51nf61T1M7sUx480IYYeDZV3Cgc+H+eIwsIRVhEFnjHZ9tc4bb9YYrDJonP
	FJMuYi+DAulLytwwKrZvl8gzVE4pELvgkd6GqSU6vC9a5tjUkwcRTd8h
X-Google-Smtp-Source: AGHT+IGE1iP8Q+/UBvqDvrwiy35DOn+9cFNtjYDncbc3WiyZ+/TZLkMjhHK06lIMfzCnTiYjrVT4RA==
X-Received: by 2002:a05:600c:37ca:b0:450:cf42:7565 with SMTP id 5b1f17b1804b1-45381ae5157mr21000645e9.23.1750847625330;
        Wed, 25 Jun 2025 03:33:45 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45382373c86sm16133195e9.33.2025.06.25.03.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 03:33:43 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jun 2025 12:33:28 +0200
Subject: [PATCH 05/12] gpio: spear-spics: remove unneeded callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-gpiochip-set-rv-gpio-round2-v1-5-bc110a3b52ff@linaro.org>
References: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
In-Reply-To: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Thorsten Scherer <t.scherer@eckelmann.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1789;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=CY82p8ULaZbPaJLzsSE1jBEx4Q22047mL4oX3JNu98M=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoW9B/VUUd0S0rRYJZkJ/S3qmK/y9uGk/fty3n2
 /3rwZgRjn+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFvQfwAKCRARpy6gFHHX
 ckPIEACZJ7YNhLX9LjsVao2rzFSTptRFTG8o45nfPlE3dmbbY3xiZpnoKARBKsndI3htD18t+Su
 fFS5ueGlSpJvuexYxJjGZPb8EyjUMiMd1ilvCVmZPqFkQS/BllugnD6vUj/l+iTO4mFIGg+Rl2e
 GFNV9Mhjupn4r+u9nSPYCjv8WfgeHF2mRHMeqM6mACuMrNoK4XShviCejqKJtIHbtXJpmd/kWw4
 CyWp++UesKsLwMU4t4a8OU5Lg0uDOUNdfpx3rfp6I0dXwrHYRI1LvvHJfxxTZDaQVvptd+5Zj1x
 DIy+KmElvIDe8VbtEUqbf2Am9xBq0IMpV7YhioCvnedxP2WRq2uD3OTDtBEPz81V4iq0GroVTN4
 /8jPC1gWkufJEJV1fgYHfU/9P7Q9P916XEXQfqN5Kw45PZUy5lQ0mtGXRy45+/eGiq3949p9zSo
 BFFLAV6nYTA04ChIoJEgBLJtSOIrOz5ffGpNb4RUkW6EfPxKTHYXxCyvsqIItmGrryUpDZXbmYH
 vvKA1o39bf4Gl6fZK5G7ffc+Fy4l8MFNoKtb5qJK7KcTMxAsuOIa9MrYYE01osnahxcGJ4znoBx
 CTyeRANlafMQ2TmkDUni5eowtmFeaXK2AZ+O4ZoWgoZ4kUifnBvUg9X2dUs+vzHHawl6x9psUt4
 Ky1BQHapjjvhdHA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_033347_352127_B313A34A 
X-CRM114-Status: GOOD (  11.78  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

GPIO core can handle output-only chips that don't implement the get()
and direction_input() callbacks. There's no need to provide dummy
implementations in the driver so drop them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-spear-spics.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/gpio/gpio-spear-spics.c b/drivers/gpio/gpio-spear-spics.c
index 51539185400d329c5a065d7a51c27b2ae24f672c..964b7dcb30b7a5bccda964a637f7fec97fe02aa4 100644
--- a/drivers/gpio/gpio-spear-spics.c
+++ b/drivers/gpio/gpio-spear-spics.c
@@ -51,12 +51,6 @@ struct spear_spics {
 	struct gpio_chip	chip;
 };
 
-/* gpio framework specific routines */
-static int spics_get_value(struct gpio_chip *chip, unsigned offset)
-{
-	return -ENXIO;
-}
-
 static void spics_set_value(struct gpio_chip *chip, unsigned offset, int value)
 {
 	struct spear_spics *spics = gpiochip_get_data(chip);
@@ -76,11 +70,6 @@ static void spics_set_value(struct gpio_chip *chip, unsigned offset, int value)
 	writel_relaxed(tmp, spics->base + spics->perip_cfg);
 }
 
-static int spics_direction_input(struct gpio_chip *chip, unsigned offset)
-{
-	return -ENXIO;
-}
-
 static int spics_direction_output(struct gpio_chip *chip, unsigned offset,
 		int value)
 {
@@ -148,9 +137,7 @@ static int spics_gpio_probe(struct platform_device *pdev)
 	spics->chip.base = -1;
 	spics->chip.request = spics_request;
 	spics->chip.free = spics_free;
-	spics->chip.direction_input = spics_direction_input;
 	spics->chip.direction_output = spics_direction_output;
-	spics->chip.get = spics_get_value;
 	spics->chip.set = spics_set_value;
 	spics->chip.label = dev_name(&pdev->dev);
 	spics->chip.parent = &pdev->dev;

-- 
2.48.1


