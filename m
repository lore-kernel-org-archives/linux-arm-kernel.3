Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C5F7CA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 09:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uAicBEYxH4Wq0iMqjkmBP1ydMlvyJQbxDwaiB57cyeU=; b=0EUIhzPqDwy21Ign9T4i3ezonX
	LfvUUHKp0DWQM5HGDImM6vMbvB5V9PTthpobhYpyaynpT/CxcrE5crktN0DQn9bPBgRBc5JMKYhQP
	CMnmav5P6pI9vU4azq7q4D5min1PREI9BXWVoVnJEAmE1wiDbSiQQo4TBXKCyilDYVvs0+/Wo1145
	qu9Nee5MgeYEhtWO6pwZ9gDbyyJtYo8IefeNGr9bsjSHlYfTZpu6nnExSj3F4CaaYMWgEiOIH9hyo
	b7x/kdIvseV+F3kqtFyJb7eY4dZi3LlG8Fe3HC1XH/ZWgAOV255tb7S7GDOu9hxNtc9lSqge2gTE8
	JOLPkpEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqqRF-0000000BWVf-0uxk;
	Tue, 26 Aug 2025 09:58:01 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqq5K-0000000BR3W-1E4k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 09:35:23 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3c51f015a1cso2587458f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 02:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756200921; x=1756805721; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uAicBEYxH4Wq0iMqjkmBP1ydMlvyJQbxDwaiB57cyeU=;
        b=I/kwyP/MmdzCHZChqngAooOMND9b5z+eSVBUjwtUaAf809EYYQrstzoaCuedhzazy8
         zLvEdSwAwtcDgC5I6cSpoeawiF2I1/Vnlm7Og5ZOeK8lNvR+ivrht5JnFyqEQAgomjyL
         DQTqvuoA3lSLzj21qMFSDdGT9Ro0cveCCrw76e8a+BCD9qtVoKCex3DVong8gzXzq+Rf
         43AK6AZZadxFjbwI5jltSuxrVMva1++CXr5hDJoMvkc9MABJtgXO6eYxR+FvuQlBLEQ8
         uRU4Z52V/SK+V8iiSLd+RhbeW7UHq1U8wdNSz6rKzjMyRnHzGNeVw2eZK6Tj4oC0IJhB
         yNSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756200921; x=1756805721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uAicBEYxH4Wq0iMqjkmBP1ydMlvyJQbxDwaiB57cyeU=;
        b=CZzAyh0RqKMpiIMUi1alHV1fVN6j4bGbAsDNVWLfTaPfoobH6Cp66kmSgxvMnXiU9H
         AL9o9fnj4WcxbwaznPj1X0LZVHtaUY1beSyW+8mqY6jawov/Ye5ul/JI3L9/mmwjQtAc
         zYRyiVvqMv+f3Dt1Bi5THZskLaJpBgqNxcAhHvHtliV/oc8D0hjkMWy6QvIk32q7L9LY
         cOsvbY4yQFCAAB0n+osqy7C7w+XpEq8Iz5ro4Sw3Z244oeYBBxXIYnrqGEScqkpnpxNu
         HSnBkzkx1X2sFFcaybNk0cEKv3FbFYbP396Qak6AHdI5zRwsAzdy4quQQ64Vd//z0SBI
         G8QQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJRR/8IzWgM8HWlx0RbCU0xLY3D7ZhHeQ5Oh8N/fHiz8Fo7YuquP0du//tOOnAVk7E9GmOcyXdSSXXH4E2ftq2@lists.infradead.org
X-Gm-Message-State: AOJu0YzHjIBbo2Ivej2P2XVCuKUVHPXAVfOl/+qw9u1J0TcP0XpM03qe
	YobWrg9cg7SAhD3y34haCpdlC/En+pN9KrPhhtRKpaOXl0Lb7t1waGLx0V+uyFRPqyM=
X-Gm-Gg: ASbGncsBYmfpNv0CJeBFBcxUtZ3CMxcAynPrCYInAodYNZLwc6eyMmw6slRnK/mbSmx
	3XScYGzw+GBIReDVh00bdspisnKKPT5Gd0NrX8XqUWLfrTALYfZVWQ0q0H2KViSysRGyCElXT68
	lkG44KC9Kz5TT1JEl0u4Q579zddTmwOGn7lNWx0LORCIu3YS1lkSUE+xVA9qneN+OL0gPgsV5sE
	xn4G/Bsb8Rvy5BBJk1txEx6v4C4vRd07QZIqGaJaWKqVHhiFthM1J6E4YKpcN7jhoj5eQYm2zG8
	p5YbrWsXTBy/7A+udgkBhQoG7k9K6io27K/kAEbkv3TldeUBEgoNdxviQulF3qc5aCZyfPoXOPI
	KPFf+JjBjaESfLwSu
X-Google-Smtp-Source: AGHT+IFpS9xXWMY2Dm1hPaoX2TY/sMKcuRIGpn0bg1DjysIZvtrpX2vCzH3rGMaLHK0/5fha31aU9w==
X-Received: by 2002:a5d:5d87:0:b0:3c9:469d:c054 with SMTP id ffacd0b85a97d-3c9469dc236mr4724123f8f.63.1756200920562;
        Tue, 26 Aug 2025 02:35:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fed4:79fc:9440:6629])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c7117d5b10sm15308255f8f.47.2025.08.26.02.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 02:35:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Aug 2025 11:35:09 +0200
Subject: [PATCH 08/12] gpio: ftgpio010: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-gpio-mmio-gpio-conv-part2-v1-8-f67603e4b27e@linaro.org>
References: <20250826-gpio-mmio-gpio-conv-part2-v1-0-f67603e4b27e@linaro.org>
In-Reply-To: <20250826-gpio-mmio-gpio-conv-part2-v1-0-f67603e4b27e@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Yang Shen <shenyang39@huawei.com>, 
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3151;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=sNq5AHyzS/pQA5YDfBiBOreqsVgAub+i5MXKUwXqNI0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorX/N4KYXmzF6Cg0MaDbG0pp3RTIGwO49gGsAe
 qJ9pzvJqjSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaK1/zQAKCRARpy6gFHHX
 cjcND/9da8AdGmBg/JbIu1BPLF5WyvYdgdS+Dl7+Ag6JInBicBZinpzZjhoKyKl3aTkYpdrI0D4
 xsleetUZK9dsiSv2qpRP9K27n5kBSYdsvp6wY9Nx6IH3PgR/k9UYkuSgCoj0yJBe0XfUVwrG3LB
 XhTucuLiOuJ6JTZYCIkxENv80ts3hYZPj+pbR80RymELfoGEdY6JwsJHji424KuSWmJjN1sCap9
 TgMDX+RQZ22zRItzzh8tmBRRuiLkK4K14fH11aUfrRaE2Fazi0f5/+oimccLNXKtsDov35sksbj
 OoNnf8hH982iL5RF7zyI1h6qWTARAotWgvYp36flEp4aB1G1dXrarhSP5i6vFoq8TbbndY04mXD
 ysBeHSj3AqZuKJKzeeO8DTytdX+NqBRH4hcpRLKUdo778w+cIywo+03hi4W24kXSlbJShIf3nq7
 guElSKzFW4Ez3KW1Enz9YcBi6zfQ3DDtqKU1k4Fy2DtHrpjKH+4I1VfXpYsOhM2i3BdrNX/mIuT
 akAlgu12pLzJmh1PRhpDJ4B+r1TWbjoMzjGbI3pFuTEfWg693E0c5XHusfIFbVRe9TuaQfCJMpG
 w7+/+E/XjaRS6BUWGCA+RYXMWtf9HT3fIbglLkNl+48fZ892Fhb+TKXqih6xN6trIbg4J1mgBDT
 /GvsEwTjY4IVjrA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_023522_346420_A84005F5 
X-CRM114-Status: GOOD (  17.32  )
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
 drivers/gpio/gpio-ftgpio010.c | 39 ++++++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpio-ftgpio010.c b/drivers/gpio/gpio-ftgpio010.c
index 56666ca8889bc92b91b160751728b65e287b0123..dfa2c9444960a304d411e8d20db9bce0f8afa1c6 100644
--- a/drivers/gpio/gpio-ftgpio010.c
+++ b/drivers/gpio/gpio-ftgpio010.c
@@ -14,6 +14,7 @@
 #include <linux/bitops.h>
 #include <linux/clk.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/platform_device.h>
@@ -41,13 +42,13 @@
 /**
  * struct ftgpio_gpio - Gemini GPIO state container
  * @dev: containing device for this instance
- * @gc: gpiochip for this instance
+ * @chip: generic GPIO chip for this instance
  * @base: remapped I/O-memory base
  * @clk: silicon clock
  */
 struct ftgpio_gpio {
 	struct device *dev;
-	struct gpio_chip gc;
+	struct gpio_generic_chip chip;
 	void __iomem *base;
 	struct clk *clk;
 };
@@ -234,6 +235,7 @@ static const struct irq_chip ftgpio_irq_chip = {
 
 static int ftgpio_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	struct device *dev = &pdev->dev;
 	struct ftgpio_gpio *g;
 	struct gpio_irq_chip *girq;
@@ -262,27 +264,30 @@ static int ftgpio_gpio_probe(struct platform_device *pdev)
 		 */
 		return PTR_ERR(g->clk);
 
-	ret = bgpio_init(&g->gc, dev, 4,
-			 g->base + GPIO_DATA_IN,
-			 g->base + GPIO_DATA_SET,
-			 g->base + GPIO_DATA_CLR,
-			 g->base + GPIO_DIR,
-			 NULL,
-			 0);
+	config = (typeof(config)){
+		.dev = dev,
+		.sz = 4,
+		.dat = g->base + GPIO_DATA_IN,
+		.set = g->base + GPIO_DATA_SET,
+		.clr = g->base + GPIO_DATA_CLR,
+		.dirout = g->base + GPIO_DIR,
+	};
+
+	ret = gpio_generic_chip_init(&g->chip, &config);
 	if (ret)
 		return dev_err_probe(dev, ret, "unable to init generic GPIO\n");
 
-	g->gc.label = dev_name(dev);
-	g->gc.base = -1;
-	g->gc.parent = dev;
-	g->gc.owner = THIS_MODULE;
-	/* ngpio is set by bgpio_init() */
+	g->chip.gc.label = dev_name(dev);
+	g->chip.gc.base = -1;
+	g->chip.gc.parent = dev;
+	g->chip.gc.owner = THIS_MODULE;
+	/* ngpio is set by gpio_generic_chip_init() */
 
 	/* We need a silicon clock to do debounce */
 	if (!IS_ERR(g->clk))
-		g->gc.set_config = ftgpio_gpio_set_config;
+		g->chip.gc.set_config = ftgpio_gpio_set_config;
 
-	girq = &g->gc.irq;
+	girq = &g->chip.gc.irq;
 	gpio_irq_chip_set_chip(girq, &ftgpio_irq_chip);
 	girq->parent_handler = ftgpio_gpio_irq_handler;
 	girq->num_parents = 1;
@@ -303,7 +308,7 @@ static int ftgpio_gpio_probe(struct platform_device *pdev)
 	/* Clear any use of debounce */
 	writel(0x0, g->base + GPIO_DEBOUNCE_EN);
 
-	return devm_gpiochip_add_data(dev, &g->gc, g);
+	return devm_gpiochip_add_data(dev, &g->chip.gc, g);
 }
 
 static const struct of_device_id ftgpio_gpio_of_match[] = {

-- 
2.48.1


