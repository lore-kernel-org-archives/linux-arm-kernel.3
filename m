Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17197C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 16:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wPrnuMVElbf0OVxOMvlRbagakQrZQomsS4SPCky3lf8=; b=D20rL+bhs6KmCyEeZ6UNQdxhsW
	MlmkoabKb+u8sFmchj5O4uysl7nq/WPQMAqtpl1kqKNcE6TFABsPVRUrzw+F3+/NscibF3SFKObhf
	A6mzlszYPtjFVbguoCs3POxBMuhx5h50o62Ep5bWw1xNPYAt4unw6hq6QwVEIQvUFTsWdlpNpd/5G
	QPUL756YbLjgETpeErNZodieKkMa6Dl287EUMHut9VWow09zsrqjoRuy6dGuW45K1U8SGoV3MFTfk
	lm49/PtVWz8wkxP+Rm2t8gCrMftCLugVmh6EPIUZmD7m44Zr6g46rYoCdN18Ng9wBpx0i26NFEM8u
	WUo9DkxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrlQ-0000000BMZt-2MhQ;
	Tue, 12 Aug 2025 16:22:16 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulnsH-0000000Af4a-0i5Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 12:13:06 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-459d40d16bdso35342765e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 05:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755000784; x=1755605584; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wPrnuMVElbf0OVxOMvlRbagakQrZQomsS4SPCky3lf8=;
        b=g1qmkMX/ydnzSY9IGgwOWx3BADmeeUojLG1Tzq04BMfLXBcsXcWlHLJtR6AissSwNz
         m8HNfBmoVlbHZSX0XH+3SVWMXy0LLxIegkN8czb1WJkcN4tdVW7NEITXpHDqDPp8VPdn
         WM3velqkOaycxRT/rM5xQHlyiLjlycN//DzuLeoNKZCN0d/vXDDrNbPrvR9AwsyVgoKc
         Mwkjv/73+FoU6EAoJIkeh9UncZjrW7F13pnk3Xa9ZfU2Lwhv87yDhnyITcQa/UeXBXIs
         RnXGnliptLFmMVJlFMzpSTQyyZ+poLowh/nNrgTKqYXJ/fV4M+lkuHm2XdbpFqOmwdXc
         7BtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755000784; x=1755605584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wPrnuMVElbf0OVxOMvlRbagakQrZQomsS4SPCky3lf8=;
        b=rxOyOonMXEMp3z5TQO6a4VTaQ3HQoJYHMWXaZ5+Tg0aorKWL33nQ/hVgXSDntsC5/z
         UdoYJv1pdy/0QOhnRQmHuPxrB8GxiMJ9sI4vKySKpxv+k8UZoRfJgcLMHSduuxvl4Q+N
         n9fZPoNYbCE7GLvAxJfmP0KNFhFCypy2LK+lf3cjkHF1/9erLLkfD/Y5dvAhmCh2ihr9
         O3wcuIiuyd9vvbxsh5FMtphZUvp6Gn+a+BVKQ9I5Zzc/OfwWOS688CAQEWs98ZXk8Iwg
         N5xLRfeEaRfSuniNxSi5s7fQFqk2wsIy3DRj+b8ZxHfbLToly2nd2VBoucLAj5DoGMkK
         Ezbw==
X-Forwarded-Encrypted: i=1; AJvYcCV/eR6ZR2OexcSWeoNyZRMk9YmIkWTsBm+hBV9NNKiXZp4G53qurIDqfhiUVld3dzXTK9kYrJ8Qrc2oHcbqh88u@lists.infradead.org
X-Gm-Message-State: AOJu0YzxZGbd1w7qg9Yl6UlNgPEc548Uu4DBytWZg7xXcyiN21dsUl58
	l4JVvyJ2K/DVRq2qKLc+c5nDCiP5TXK26xkZpfP5TNkPIDeGRr0D46EAp21doSlSqAI=
X-Gm-Gg: ASbGncv6MitG3iXwY3GCcRhpqZqlFDt3/qgJRcXb9nJcRTFkAr6+ZvIRmQdQu0E3/bJ
	XV713KTNKyN3yv3lbi77jHbZy3zxmaj/Fyesc+aRQNKcYsjDqbHLUyKwctzahStX1za1eCDHO0E
	FBgjdyKHRiWiWZrJBlbXCrMWKjzwhf29WU3eS13WBXHIw7iYXALOt9C8N8no2dGWCOTqgkfHC3r
	Ag9Au74xmt5/1sKHI5b33t4x3hbFUKd6dxBeb9coV3zHTUt4hFPHt4vE42kFo2V/LHya4KsK7f3
	ZtkA8OhFhFciqgqUt5HlizB7nK7xkvhSozgHvlZEKJ/RCTvLAp8QqR4lULjjlq2oi+/9mDqByw4
	5v5S7wFGaMvM7e53OyF3ovzT35w==
X-Google-Smtp-Source: AGHT+IEoMMi0CEBtjTeK1OAVQ2XJUx3abdGVGpfPoMfNdOa7/Fm+7Qs38HZJxLsTgY+6MWhlVI/Amw==
X-Received: by 2002:a05:600c:468b:b0:456:25aa:e9b0 with SMTP id 5b1f17b1804b1-459f4f9b5f6mr144387785e9.16.1755000783807;
        Tue, 12 Aug 2025 05:13:03 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e6867193sm298878535e9.6.2025.08.12.05.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 05:13:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 14:12:53 +0200
Subject: [PATCH RESEND 11/14] gpio: rda: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-gpio-mmio-gpio-conv-v1-11-aac41d656979@linaro.org>
References: <20250812-gpio-mmio-gpio-conv-v1-0-aac41d656979@linaro.org>
In-Reply-To: <20250812-gpio-mmio-gpio-conv-v1-0-aac41d656979@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Hoan Tran <hoan@os.amperecomputing.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, Yang Shen <shenyang39@huawei.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2916;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=VEKDyVTn7CdAc/qOsHjVELR8QjmrXUmK9abPLIIpync=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomy/B8rvqZkQIoUIaWbJj2JikJSIBQRI6vwGTH
 exlHS1tHziJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsvwQAKCRARpy6gFHHX
 cjwhEACH8baIpD+2+aI84ztaaLn90l4+CH4HwEvTCzlC37FxDvMiqii4Wca8Rf46f/QmI8nQOCf
 USMfGVag4jo2Le2ex1K1YmrU62y2UhS6QCq4PAz6jZylorTHByKx0ygHhk/yA9JMnkTvlsRP2Or
 Wn+LEZ383jaSF7W0XYOGbSYios5C3692nbvtb6vDrHiMW2RQDciQuwZMts9+3O4KNNjSW+UUkN9
 8jM7PlT91SmfHIa5OzrCd4alovMU036SZNAurpZv7xNEQOZDK+Z/m8sgYUwqHVlNH1kUmjsKLY2
 werUeez4QVeuEYEYO6TgDNdaIrYb8tD89ura7zRNoA+AHcnFbdzRkGM1wECJDlhgG6k1a+xz+zJ
 Fv50Kj0HDOHHsRJThA5mEwBOyDzuQVVUnA/Gl7xGfVna8HkXyOsgxJT0bbdnolLFcSdpPVGKui3
 Sn0Enw6wF7TWXTe7asipbGuiKMJn3k6W5uwUlRu8UtnB8m5NWm5EPw204LQrIE5difFvIVJB9nc
 HkeBW+1IX83brCIlcgJYO5q5ZGBbO980tM7E5upxO3asD1Z0+Lu272LjyxiGoewvWL5OlkHmrVQ
 9lEzIBB5zaFUuCea7Okr84C/6xXOAVKiAlcANFrqnrPciJhzasZ5JVLPLJi/DTQHUDBQEq8INxE
 lsTZn1blujN9PSg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_051305_235288_D4AF4F1B 
X-CRM114-Status: GOOD (  16.89  )
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

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-rda.c | 35 +++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-rda.c b/drivers/gpio/gpio-rda.c
index cb2f63eee2aa10a2708ec91dfd610ed1ea76917d..bcd85a2237a532b875df9470d972ac88b95a91cc 100644
--- a/drivers/gpio/gpio-rda.c
+++ b/drivers/gpio/gpio-rda.c
@@ -8,6 +8,7 @@
 
 #include <linux/bitops.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -35,7 +36,7 @@
 #define RDA_GPIO_BANK_NR	32
 
 struct rda_gpio {
-	struct gpio_chip chip;
+	struct gpio_generic_chip chip;
 	void __iomem *base;
 	spinlock_t lock;
 	int irq;
@@ -208,6 +209,7 @@ static const struct irq_chip rda_gpio_irq_chip = {
 
 static int rda_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	struct device *dev = &pdev->dev;
 	struct gpio_irq_chip *girq;
 	struct rda_gpio *rda_gpio;
@@ -235,24 +237,29 @@ static int rda_gpio_probe(struct platform_device *pdev)
 
 	spin_lock_init(&rda_gpio->lock);
 
-	ret = bgpio_init(&rda_gpio->chip, dev, 4,
-			 rda_gpio->base + RDA_GPIO_VAL,
-			 rda_gpio->base + RDA_GPIO_SET,
-			 rda_gpio->base + RDA_GPIO_CLR,
-			 rda_gpio->base + RDA_GPIO_OEN_SET_OUT,
-			 rda_gpio->base + RDA_GPIO_OEN_SET_IN,
-			 BGPIOF_READ_OUTPUT_REG_SET);
+	config = (typeof(config)){
+		.dev = dev,
+		.sz = 4,
+		.dat = rda_gpio->base + RDA_GPIO_VAL,
+		.set = rda_gpio->base + RDA_GPIO_SET,
+		.clr = rda_gpio->base + RDA_GPIO_CLR,
+		.dirout = rda_gpio->base + RDA_GPIO_OEN_SET_OUT,
+		.dirin = rda_gpio->base + RDA_GPIO_OEN_SET_IN,
+		.flags = BGPIOF_READ_OUTPUT_REG_SET,
+	};
+
+	ret = gpio_generic_chip_init(&rda_gpio->chip, &config);
 	if (ret) {
-		dev_err(dev, "bgpio_init failed\n");
+		dev_err(dev, "failed to initialize the generic GPIO chip\n");
 		return ret;
 	}
 
-	rda_gpio->chip.label = dev_name(dev);
-	rda_gpio->chip.ngpio = ngpios;
-	rda_gpio->chip.base = -1;
+	rda_gpio->chip.gc.label = dev_name(dev);
+	rda_gpio->chip.gc.ngpio = ngpios;
+	rda_gpio->chip.gc.base = -1;
 
 	if (rda_gpio->irq >= 0) {
-		girq = &rda_gpio->chip.irq;
+		girq = &rda_gpio->chip.gc.irq;
 		gpio_irq_chip_set_chip(girq, &rda_gpio_irq_chip);
 		girq->handler = handle_bad_irq;
 		girq->default_type = IRQ_TYPE_NONE;
@@ -269,7 +276,7 @@ static int rda_gpio_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, rda_gpio);
 
-	return devm_gpiochip_add_data(dev, &rda_gpio->chip, rda_gpio);
+	return devm_gpiochip_add_data(dev, &rda_gpio->chip.gc, rda_gpio);
 }
 
 static const struct of_device_id rda_gpio_of_match[] = {

-- 
2.48.1


