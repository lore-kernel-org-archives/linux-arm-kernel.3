Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB70CC7115C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 13:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BY+Lz6lKMiwYrbR7KuHJ26zaicwVAsUkFljRs2T1XQE=; b=eDi113nBxEnZiYfaC2Or17bniG
	eXumgT5fIa9oM9Yw0nS+bDmxEHJngtuq8D7Sp0u3IpFJlna+uC+htDjUWfqE71IIHWgduW5HCnixC
	32NVreJ2oqaDKINKNFxQZPSp37qmQSNJaDj/YCG/5M2/fw4PZWymbU3QgqjjY+UQ5CZZlGkhca6ug
	WEI7VwxjK1COhSa8t4cKEebqv0szypsnGa877+5kqLcIdp3FasZ3F16hVgnSt/GsbovQf/2DQvQym
	ujRuwxlsKpOETL2muVqUYNi0MgW1ocPQm6ygT1V+aTiO3QF55Wgl1Z8byKzgRpKxyZcFQUo3R8hhy
	aTPWnR/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUQO5-00000008qPH-3ndV;
	Wed, 25 Jun 2025 13:42:06 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNRl-00000008K3v-3jtx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 10:33:42 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4537fdec39fso5433505e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 03:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750847619; x=1751452419; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BY+Lz6lKMiwYrbR7KuHJ26zaicwVAsUkFljRs2T1XQE=;
        b=v0Ibw1HD+BePWMdzy+QcK4CFTMkGu3d/KPgxOoCQgXdn2DplD6AAISl99GqxTrCrXd
         BUdD39GWsa9d6xiT+PTr6Ld8NHuo7GW0vYJBrKOGRAfQU4ElhHSovMcyQaRb7I7RUOk8
         SDxyRDBb4oE9ZpNa1jrVcehFxVfXJdU0kw9kxyKXuWA+4bd6UK6zIQ9W68oaAbq6k31Y
         6FBFTQFMjNfajqm9lbN5mItmUGljkZbTxG5gGz7X1AbDmIZSKUn9Hic3WOPii3RCau5K
         LZ+g7Fjc1/x7SfB9aOOP11KVIUQzRnYMslKtgOA6/UILSNmRSfq9ckTHL5qP2gSflEkv
         eXow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750847619; x=1751452419;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BY+Lz6lKMiwYrbR7KuHJ26zaicwVAsUkFljRs2T1XQE=;
        b=VrritljlaWk0m7j8EnoXRT0oMWa44dJJA5dz4LiWywG3zlElLF5fWRGK3rRvMYYKKn
         W1a16AqiCewbudQLyRni6drI7roPugB3DS6ZPGb0kcVmlUxv8XFLWNsH/IMNXNKtmTg0
         XzHuilgaPtQvvqmqHs7mT5eUkZFs6kKR0B29b40djejdQtpe6/d4m4+QOCq7eBtMuYTl
         HtLKVyctkbhZ9WQAgqOSqwfTikm+SyfbnahwWkrjcu2K81WgeWWD6PzdPvx5ah2RTnE/
         YdMzTBFUu9pYVKdpbVmDqAFOkYKwVHN25kTS7ZJDsuoN5nm0m9a4KqJY89eIjjkNsAuX
         0kkA==
X-Gm-Message-State: AOJu0Yz4DepfVWrFlOrctlP4sCpLfpfvQCsWgvWWnaQexYbpdDzKI/EK
	VmUpPDRw0CwaLxkkH3Hze2rHstOMbXgaSQnkgKXfLDg9V3w9AV8tJGGXYmFwk2uX1rI=
X-Gm-Gg: ASbGncum3jsHB8YHdNPW+ybohggRDYAUPytw+tCtRwQAg8ZzyXNSYXkjHQPW1RUcOg+
	AfOmQ1PALUCX0Q+HUF0FKq7ISkZ3qUg2o8EvsulK9EeAzR59cLmAzOf1oGLF6cx5siiP3sWEO+R
	6OpUGrCsUUu5NXL2ff8dpYNHI8eEjqOR3zoxfi9Dme8irUCZ1gAQGeXAe9wpFmOsuKvI+6lGyh5
	DZ9y4rByIND+PqPK0gnOYrz4ck54/Zuq7GMRWwAn33JBJZ7J11eArSLQ1+UVCdlePP8fOw9eucw
	opZCK8w1/XMwjmEusB13zl3o8U457NUzpkvtSrAdK9/uuldyKarlDmc+
X-Google-Smtp-Source: AGHT+IH5n3V2Wm0P6CUxi1gveb6IoGY767ZKTPjsevskpMmy1m5PrdgebUCMcoB8UkSLHfSDVjT+Rg==
X-Received: by 2002:a05:600c:4513:b0:43c:f6c6:578c with SMTP id 5b1f17b1804b1-45381abd384mr23901585e9.15.1750847619098;
        Wed, 25 Jun 2025 03:33:39 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45382373c86sm16133195e9.33.2025.06.25.03.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 03:33:38 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jun 2025 12:33:24 +0200
Subject: [PATCH 01/12] gpio: sama5d2-piobu: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-gpiochip-set-rv-gpio-round2-v1-1-bc110a3b52ff@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1638;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=OsKwI/13W1loEUCyUkai3/g1YYcKJASkK3JSsvIY/ec=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoW9B+9KzJ70ZY+HOhiE4zfGY1VbgsiKidRlYmK
 Rv3Gzq8LI2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFvQfgAKCRARpy6gFHHX
 coFpD/96Zq597g3aZF9Cd8f0q6z9n1kK7v0Gd/AF1oaMMmqa2jvOdxjxS46OrtOECQVVOyuQ95t
 f7XeyYeGiRy18XEWjZ/0Uuw9OmpXhmjr+pxJE0xgvpMdSdB8cR1UiHRZyeiRPCuQ0lnkRx2Z3RO
 WuCDT4rXFYkiwkXXncVox+JetZFiI1TMVTZtKIXXH7bLPembV88ZHrP7cWAa4WSEL6rJg5UUq+r
 LppO5ug+0t6xsRwuaJmcQPx4UxMZmXhPF88VklWn8VagD45ej5ypqtnGBzSj44t1eogzEDGTMTe
 Zy0yyjYw6Jcd0fZE6Vh/dcNZFx1gHvwxHwFlhg3GtcWI0quHZdD2nQBBA6zVFeI73okPfaiON97
 DOnHi0E8m4d1mDRVSJtw+Ct7AbPkTJJhyUQKxnKvUPnDSBpsAi1FWgdu9UA+o4bMAy1/CiqZaT0
 BubNZ3V5K/sSLUCdVY4c9fpxJH0lsrGmLG1KqYn67nB1LR81iT85PSRvA2fsptCGUH4dbnh7d+3
 jecoaH+kkmqYURLUmE3znM4Z8q5+60nvqU5SAj+M9AiLSAMMNj59Z8wDPE1K4r4hrOR9yjrdwwZ
 jk93GzPN+Xo67157cGFkbmMSGgD2gvq83xOMW3ChasZQfvwXittXuovyJArX7alaEWz8hoHIXGX
 xjhSKJU/QASErwA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_033341_935519_63E6DA2C 
X-CRM114-Status: GOOD (  12.49  )
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
 drivers/gpio/gpio-sama5d2-piobu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-sama5d2-piobu.c b/drivers/gpio/gpio-sama5d2-piobu.c
index d770a6f3d846640d8ab4c9ae387635118b82cf51..c31244cf5e89108b5a21ff6ff58569dbef4bf972 100644
--- a/drivers/gpio/gpio-sama5d2-piobu.c
+++ b/drivers/gpio/gpio-sama5d2-piobu.c
@@ -169,15 +169,15 @@ static int sama5d2_piobu_get(struct gpio_chip *chip, unsigned int pin)
 /*
  * sama5d2_piobu_set() - gpiochip set
  */
-static void sama5d2_piobu_set(struct gpio_chip *chip, unsigned int pin,
-			      int value)
+static int sama5d2_piobu_set(struct gpio_chip *chip, unsigned int pin,
+			     int value)
 {
 	if (!value)
 		value = PIOBU_LOW;
 	else
 		value = PIOBU_HIGH;
 
-	sama5d2_piobu_write_value(chip, pin, PIOBU_SOD, value);
+	return sama5d2_piobu_write_value(chip, pin, PIOBU_SOD, value);
 }
 
 static int sama5d2_piobu_probe(struct platform_device *pdev)
@@ -196,7 +196,7 @@ static int sama5d2_piobu_probe(struct platform_device *pdev)
 	piobu->chip.direction_input = sama5d2_piobu_direction_input;
 	piobu->chip.direction_output = sama5d2_piobu_direction_output;
 	piobu->chip.get = sama5d2_piobu_get;
-	piobu->chip.set = sama5d2_piobu_set;
+	piobu->chip.set_rv = sama5d2_piobu_set;
 	piobu->chip.base = -1;
 	piobu->chip.ngpio = PIOBU_NUM;
 	piobu->chip.can_sleep = 0;

-- 
2.48.1


