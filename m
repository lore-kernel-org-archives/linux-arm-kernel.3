Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF84C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 13:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7iDWjP9HRVIb7sR3VThhC45lPvgyQWTusyUiyxvyENs=; b=kXpaidVoPMFelJFrFWlbjvzzmw
	ttEiQes7/cn3xGz7D9ogtVxe/ClhDLongrFA1FL/7HdUzu5R2ZbdGSY87m26HVVV5GQZzPYxfx9Lc
	pamWXz6ZZd3j67JVRj+sRycJ0xc0uqdhDkPDjx+75rn6Flu4c8HDjvxI7HyIjDu9olEyDQkcvB0Zz
	9QXmdmFdiI5/kC8rYfLakNh8khnOy3xcOAyjihKQIT/aisjPQ5pZdLgaAOCwIZuqT2P+bjF4W5b3R
	pKB6hTtK5sx2sUeyvZb0UJRJ6z0z3zHbPF9Y+Uwd1Ce7O4DqEkPTLCwKUBM+kOSoYlPKjVN/E8plN
	xdqXt4NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUQbg-00000008sPD-29cu;
	Wed, 25 Jun 2025 13:56:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNRv-00000008K7F-1kUZ
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Jun 2025 10:33:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=7iDWjP9HRVIb7sR3VThhC45lPvgyQWTusyUiyxvyENs=; b=EVuJEDjRUFGtY+vaQz0xSH0KEh
	Vc0Q69qblVZ/oyc+pKLYmyU2R2uaQIQqFx+DyHahpzZGQ1jQLbY6YOZj7zd+IOTK9zBWvzvWbFlM9
	w2pjgAKU34D+fP16omBILgJU9MHmQN87+DBVHSrkAxG4iNlDGhKoFa4ssFVq8Z8iaQowbtHsNehl6
	yAb0+uWIQbFQuehzs85gSBT+/bD+QoQcg3BYKc44jHcVsY8HxUbQgzT4WFaONPH5PQ0GIVBfbJ2F2
	i8R3eOC2Tzi/L3ppjnu/vhQCha/nxCfPkbfFAueJRMfdmrb1VXdUyQ/jihiZSVO1qyzr1i1ayY9Sa
	7pFK6mHA==;
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNRs-00000005mpl-3rMN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 10:33:50 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-442fda876a6so57515535e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 03:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750847627; x=1751452427; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7iDWjP9HRVIb7sR3VThhC45lPvgyQWTusyUiyxvyENs=;
        b=dyDbGb34zIuNSvxlHOxylj6f6VHS7cQfrDjPEiQN/9IQz0qKS0YdnyvLuSUcCxHnQ7
         OtJqWOhKRfrVdxRlceTS8VoeWdAZBjUtIcrhbcPNykYbGH9h42h5BCSttcbK9rQKmqPq
         bd5G3cSaT6x5/VgsAD2Q1PCMx3BuHAsxSE7FRrXvaJmOdER3rVAhGSPIG71nhWCJ8ZTK
         l+2nUcCaHxBvBwinh+y8rEpZ3TyMOcPsJOC7jN4+Pq+XWK2qvcisUednFl4hZniUWA8V
         VOBHNmq0CHVBsNuWEm+uVcJxX9bxJo8ZiKW+yfEAFnZH8El84caS/IAp0esa+jWRJbIv
         2LfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750847627; x=1751452427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7iDWjP9HRVIb7sR3VThhC45lPvgyQWTusyUiyxvyENs=;
        b=VhFTAZ2vHg3sqYIZRqXRbOoWgk0TQoWCqxxbxJq96iovMS6dE3TrwFvii+aCojFzWb
         zU/2EJwhHSjWeIXRXAVyBTmbNlzhOz9EPf6aJn/HNYXSpJNn0r2Vzvpu6nVOkA0u/IHb
         gzMamfE2pxiids7XdlFbVsRo1ovASH27LwOWhEaI73dAJeqIxzl8hryqERTtJTzd3zxI
         jtiFnKRs2auEcHwNLrJIGQT89C1AG28HarueuCOughX4i/1CZNGKlUkcJ5Wbqaijqafb
         qt7q8y90BjphsbaJv3x0jPpT7kj+tLiHNOQ62FPtpAEReU+xwKkOf/lvjhikJpbjiqZn
         Y+AQ==
X-Gm-Message-State: AOJu0Ywj/FMHnTwKaX+6O7wiKVRpKid8JIKVU/6s6cCYDMj0j14k5n89
	D3EvkhxxO0xH4ne9p9decHuDriJH8xI0SncyalK29nZITi2c+yMrAy74gu2kip3/Znw=
X-Gm-Gg: ASbGncukZXAcd5Zxyn6EGtTzfUosGTCTv/wVBVoXmdTlCCWf5AEsOBg/CZ3mhVhqAso
	dY+B/qKtDq3GlwBW39VGVX/NYsgaY5p66SgcHCpQ9uuIdOFcHXto73g84A5spI/GBVYaHCoQjq2
	/i2et2pxo5OfxfU5U6SvTvXbb6mG6szgm8VAfCRvBT4Ea4ewlm0761mhVju1aB+ETxWP+eoWO/Z
	3ska1fP/xSciZ2YCeRLkCA3Lyx96DWOJc6kfP1U1tW9LQZVMTQtbXIkYhI7IJxwwtVEAhvbwmrP
	/f4kA2a4XxPNBW0F1rj7K6FxTuUt/YHkCTDkirBCHZ1X/03Pfa+SYZvr
X-Google-Smtp-Source: AGHT+IELePDfCHlBYQA947q59vgnMIBS0qmkpmIXczdAGAGH53ivPNqjGgKeUUibjSMbaCpIrdAsng==
X-Received: by 2002:a05:600c:a302:b0:43c:fda5:41e9 with SMTP id 5b1f17b1804b1-453821b0a2amr16718975e9.31.1750847627484;
        Wed, 25 Jun 2025 03:33:47 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45382373c86sm16133195e9.33.2025.06.25.03.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 03:33:46 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jun 2025 12:33:30 +0200
Subject: [PATCH 07/12] gpio: sprd: use new GPIO line value setter callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-gpiochip-set-rv-gpio-round2-v1-7-bc110a3b52ff@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1462;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=VMUhzabI6TJSSEFS1lhCE2pMbGfsNwLrSf77JeJz6/w=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoW9B/PT5QyhI466mXWQVK5eZlhAG2qptU0Jkjk
 YBlIjzP9muJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFvQfwAKCRARpy6gFHHX
 cmjfD/95UQq01tmrRM1DzYdnerQeB3FFvKTQyd2fjDFNLy9dtXqfSNiftQA7k79L0u6uDb4TdYS
 zi+7vE56uklzOxkqrdBlFLv1eviupQLOy0Lo1o8B97QDAW8bfdlWushg08bvClpa4i4S4RN3zrF
 HMSuPvKlhrGDXidpLumdsrLg5XGbkqyAgAF/q32+Bl/OfGwv6000fdWfoydiq7JXLHqObRe7lLt
 wE0GbE/H4Yg/tSKKRd8ddQgS5zbAvXCKNo7KwXlTqwRg2t1E0c8kOpTf/OdftZ9/3dCfQI0ptMb
 lxwLYLcofM4g3TqBdVzbd1SK4EAG8zl7gMfAMlgbb1XlD502kJ9t0eBGlf2mjBsHdXZLKx1w0w2
 4BS/nXvbFE8KEBYIXWVF8WeAs9XJuUkCDCAOTCu89w+x5npYmQRlHaAsS8PqW2NsCKu/9MGBnX0
 x+0WdyPAA8tIxz4FCcsis54cIhLEiNSaCvxWBgdSDMFCu0H6Zvtl9UH0fCdldLPheqqb7cU6PQL
 QEq13Ow1loF3vWheP8IdWLLxQCfq/+gufdsNv8wP4Azdw4wH7kaT7W4nbGUReg+D4nXT6H1Spt4
 QxwERElhaH1l0gwnAEQt7yxu1L25+NykUVwAdwaOCMXFGdE/ffigUG71qFAxkCLEtCL0aOiiugx
 BB64jdkmLzfuudg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_113349_043373_79EEB60D 
X-CRM114-Status: GOOD (  12.05  )
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

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-sprd.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-sprd.c b/drivers/gpio/gpio-sprd.c
index c117c11bfb29a84d814706e383faa19afe513e93..bbd5bf51c0882704a9ead35d9fbc7d4b9bceec50 100644
--- a/drivers/gpio/gpio-sprd.c
+++ b/drivers/gpio/gpio-sprd.c
@@ -108,10 +108,12 @@ static int sprd_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return sprd_gpio_read(chip, offset, SPRD_GPIO_DATA);
 }
 
-static void sprd_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			  int value)
+static int sprd_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			 int value)
 {
 	sprd_gpio_update(chip, offset, SPRD_GPIO_DATA, value);
+
+	return 0;
 }
 
 static void sprd_gpio_irq_mask(struct irq_data *data)
@@ -243,7 +245,7 @@ static int sprd_gpio_probe(struct platform_device *pdev)
 	sprd_gpio->chip.request = sprd_gpio_request;
 	sprd_gpio->chip.free = sprd_gpio_free;
 	sprd_gpio->chip.get = sprd_gpio_get;
-	sprd_gpio->chip.set = sprd_gpio_set;
+	sprd_gpio->chip.set_rv = sprd_gpio_set;
 	sprd_gpio->chip.direction_input = sprd_gpio_direction_input;
 	sprd_gpio->chip.direction_output = sprd_gpio_direction_output;
 

-- 
2.48.1


