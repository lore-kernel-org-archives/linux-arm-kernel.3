Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE53FCA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 10:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O5ozA9Bv06U/8Xqy1iShN9MOTwm74I3ECkjpnomfaao=; b=yYqyCRsIF1e5XYYgBD5svnuU/A
	30kmfBbjljaOTGGkcaY4orKeWYV7OZbZS4qBZsGIWk3UIYC+FeejUaKSMKPE5Txj3bXoL0+Fj6qB1
	2ib7e6ogHGQ1Q5tf+tDLTVHy264zDqbuVNQGqGG7ROBmQxhfvNVzbbStNOrWAl4CsYHSSLLte3qjm
	e07/jOI29ZqO94DXNp12hVgCxW70luqsNH7a36029dOgOECsYRNjxAwlNrM43RZOivhH2U+TMwHBv
	e5epMv7Qe1GYbNfB/u9gQsDmEPGIBFD6h2qh3/J3Op7e1nxtX0IzGb6JTMSsXIEoe4xnxm9ayg9JT
	uIAnXYAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqqvG-0000000BcwW-2jG2;
	Tue, 26 Aug 2025 10:29:02 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqq5H-0000000BR1i-3j22
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 09:35:21 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3cbb0df3981so162164f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 02:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756200918; x=1756805718; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O5ozA9Bv06U/8Xqy1iShN9MOTwm74I3ECkjpnomfaao=;
        b=zhHNjThit98Lp/KRx7ryQ1kCLd6gSvvHwuBdJlNBBkf2ujgGYbmO3tehWJz7vRulcn
         iJ9TcF939/UUtnv1l75q729qILgRy7oG+e9d+bCZmZoOX29MjcAnF+nS+vcIBJxakN31
         Velbyp8dMBMAHzVXOsFRJOY/CE0RxW0n62xeU9JkjTLOhoSafhEXQMiljTj0H9W3pw+Y
         JwxprHdaZwBtWZY1T4gK3DKY0PUrsRjKUwQdzbCUrjcIEwkoj/DGZrSQggTi2MEGvFOZ
         8bAbWWHYblJ9CDipAEAfEXrK5vVYZz7N6fsXu7LfBDBGHaZ6fgHppVRJkx7SjkM5FuP0
         8lSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756200918; x=1756805718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O5ozA9Bv06U/8Xqy1iShN9MOTwm74I3ECkjpnomfaao=;
        b=FAyF+Y3y5ozwt1WUimRZd10Uot3hZsinNP8bdxsRFbpSLHONur6nhJ0UzU64IRK45b
         Y6U3qSdrTq7vYEUioUj2HkcB5/26BgqyZnUgwsu0Y9OpjBe0Meb2EgDXZDfPJKjXntRn
         7S2hz8W0DvtV1x2Xc5eM21wyFl7vBNDDyISlBu6wQJrO7/Spfc0U/EVBAgWGxq2rN/ma
         Iey1zmdTOXoVeYIC0Ycil8tkRsqox1l1Uil0acZhBH4GEUg9p9rsH/XpygCkgYjP/ThT
         c59nqi0bCSKXfFoo4akpGPbwQ4nHrmvjfpltCOGKWCAGN/gpcPXMSWYszcNCXNjyD3z5
         8gvw==
X-Forwarded-Encrypted: i=1; AJvYcCUA91gn1IARMURp/W9yDu6GlHOhNVNOVrBaySZ3OEGIoULnLgQXGNCYDj36srKifuO30n5JJBL5bcL6NYOVnfeA@lists.infradead.org
X-Gm-Message-State: AOJu0YzMMhLJxWTCeMMO2PG9LIAuhTCaIGyQug+yuX8BCAVoqP7bFP1K
	Z6eASP+YOPBWDXuUT7TUY04JumHJGyalKjAn2TVzZTbb+9hpJwtsXsfkG5dQ6kqmxH0=
X-Gm-Gg: ASbGncsWcc/cr4CYMmh+ua/6hM3aMkpuhezE6qCy6JZcdc1xw1icdjV2hTGvF2ktyNT
	D2XZeOJK/rdlKTrNe7/Fc3hF5+9P/lR4Ah9Zdggu3MBZ0VSUaiE9VacQ1E6FKwtAjoohv5S/+t+
	a4Z/cfUP1jS7Olu+gPPyu51N6rSSID2Wo6tgnt000Cq5VBFDSo8Q731umVhLjAM0YB1CRYwyMVh
	l0IPI3lJ0E3GWFsnztgDAyg3xdpvbkBPjLY1mq8J8FCasrXrSFnYRPxuaNZPGUrRZ7IKu4wcnzw
	EJMZ4JYIh++aMY/SKAJxKwmyljmuclyhMME9mwR8igqEnqOURZgjwoF1nBXlRPk8Tm/14TpEVw+
	HpZhhxiEyGWKinj+3JoYvEN9sUuQ=
X-Google-Smtp-Source: AGHT+IE0tE/RzFmGAas6KXcSeY2T7eMH/vWwACoAstGhW9wtqaD4AW5ZX1XUBkucRXyAbfKxCt47IA==
X-Received: by 2002:a5d:64ec:0:b0:3a6:d95e:f38c with SMTP id ffacd0b85a97d-3c5dd8aa9e5mr11233482f8f.33.1756200918141;
        Tue, 26 Aug 2025 02:35:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fed4:79fc:9440:6629])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c7117d5b10sm15308255f8f.47.2025.08.26.02.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 02:35:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Aug 2025 11:35:07 +0200
Subject: [PATCH 06/12] gpio: xgs-iproc: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-gpio-mmio-gpio-conv-part2-v1-6-f67603e4b27e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3659;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=cwcsufdleTyfdjvLH+M9bpnNNWhHDiBNP0A3nWGPBi0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorX/Nc2+ipMdtkTFzhs/H10ajPYFviqGbqVxeG
 qgjKSLlKdqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaK1/zQAKCRARpy6gFHHX
 cpYaEACHIXIK2YjYL9eAp7i1sQJTexz1MuBdYOPR4A8it3r/OYVQqva9D6wvJZVdOK3RAj6Y4zQ
 +iuzGJOlk9UD+nuWtU9nZoIwOdwUj3KXHEcbNXhhfjBFsbtOpXecDO2wREoTop6Zo55K6rHeLZe
 XryN51bj02LGexSZpj8NppyCVBBJLQkzsYvLXIHlQ23Y5QD5K+HuRNyZrNBsLY03ENxsQnacuP9
 OTio5stWF8A4+eOAFS9K/eO+3wI9xzhxCu1A6NecCbPfcZI/K1KFm2+Z5SgQ+0oaDYN5hP/nP9+
 q7lyO0ih1LJHMm9O/NIME2cxYgqUXnq7Knwbz0AfSu/tNWVXTAlE8e7lZU+DE9D2XStL9LtDtwz
 k+AqgxfltD8j8pFNva1ZbkoNCUaroY6gyC5ZkxwrrK+426A0M201/St6LCyrIT4Gb6fjUIbOOed
 kDKeFy+keX0KrlE+Ts+EaMu4SaFEJxvLp3SQPeV4EAeULWR8SDXH6buihr7r/9QnNnXgThzBedG
 mL4677cYfwCL84zVntm7hmbFH1qCkT+Tc+bc75+NzG1lBUU6aBSZho/JNmqCFzL01+XYJmXIl6K
 WxYgCxGKuIUIxfp//ne7C+TbWCCxccQ5jj9A7N1ZfYseV0hVSo5yKFhXIwGBVboGOe6hqK7mHIz
 dBdf5yVrFHM8zyA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_023519_952680_538A8668 
X-CRM114-Status: GOOD (  19.28  )
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
 drivers/gpio/gpio-xgs-iproc.c | 34 +++++++++++++++++++---------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpio-xgs-iproc.c b/drivers/gpio/gpio-xgs-iproc.c
index 93544e98ccbd3f8172010658cf82f5692949c772..9cffdedd31b1c39123b93469465f483fbb4d076a 100644
--- a/drivers/gpio/gpio-xgs-iproc.c
+++ b/drivers/gpio/gpio-xgs-iproc.c
@@ -3,11 +3,12 @@
  * Copyright (C) 2017 Broadcom
  */
 
-#include <linux/gpio/driver.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/irq.h>
+#include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -28,7 +29,7 @@
 #define IPROC_GPIO_CCA_INT_EDGE		0x24
 
 struct iproc_gpio_chip {
-	struct gpio_chip gc;
+	struct gpio_generic_chip gen_gc;
 	spinlock_t lock;
 	struct device *dev;
 	void __iomem *base;
@@ -38,7 +39,7 @@ struct iproc_gpio_chip {
 static inline struct iproc_gpio_chip *
 to_iproc_gpio(struct gpio_chip *gc)
 {
-	return container_of(gc, struct iproc_gpio_chip, gc);
+	return container_of(to_gpio_generic_chip(gc), struct iproc_gpio_chip, gen_gc);
 }
 
 static void iproc_gpio_irq_ack(struct irq_data *d)
@@ -213,6 +214,7 @@ static const struct irq_chip iproc_gpio_irq_chip = {
 
 static int iproc_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	struct device *dev = &pdev->dev;
 	struct device_node *dn = pdev->dev.of_node;
 	struct iproc_gpio_chip *chip;
@@ -231,21 +233,23 @@ static int iproc_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(chip->base))
 		return PTR_ERR(chip->base);
 
-	ret = bgpio_init(&chip->gc, dev, 4,
-			 chip->base + IPROC_GPIO_CCA_DIN,
-			 chip->base + IPROC_GPIO_CCA_DOUT,
-			 NULL,
-			 chip->base + IPROC_GPIO_CCA_OUT_EN,
-			 NULL,
-			 0);
+	config = (typeof(config)){
+		.dev = dev,
+		.sz = 4,
+		.dat = chip->base + IPROC_GPIO_CCA_DIN,
+		.set = chip->base + IPROC_GPIO_CCA_DOUT,
+		.dirout = chip->base + IPROC_GPIO_CCA_OUT_EN,
+	};
+
+	ret = gpio_generic_chip_init(&chip->gen_gc, &config);
 	if (ret) {
 		dev_err(dev, "unable to init GPIO chip\n");
 		return ret;
 	}
 
-	chip->gc.label = dev_name(dev);
+	chip->gen_gc.gc.label = dev_name(dev);
 	if (!of_property_read_u32(dn, "ngpios", &num_gpios))
-		chip->gc.ngpio = num_gpios;
+		chip->gen_gc.gc.ngpio = num_gpios;
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq > 0) {
@@ -266,13 +270,13 @@ static int iproc_gpio_probe(struct platform_device *pdev)
 		 * a flow-handler because the irq is shared.
 		 */
 		ret = devm_request_irq(dev, irq, iproc_gpio_irq_handler,
-				       IRQF_SHARED, chip->gc.label, &chip->gc);
+				       IRQF_SHARED, chip->gen_gc.gc.label, &chip->gen_gc.gc);
 		if (ret) {
 			dev_err(dev, "Fail to request IRQ%d: %d\n", irq, ret);
 			return ret;
 		}
 
-		girq = &chip->gc.irq;
+		girq = &chip->gen_gc.gc.irq;
 		gpio_irq_chip_set_chip(girq, &iproc_gpio_irq_chip);
 		/* This will let us handle the parent IRQ in the driver */
 		girq->parent_handler = NULL;
@@ -282,7 +286,7 @@ static int iproc_gpio_probe(struct platform_device *pdev)
 		girq->handler = handle_simple_irq;
 	}
 
-	ret = devm_gpiochip_add_data(dev, &chip->gc, chip);
+	ret = devm_gpiochip_add_data(dev, &chip->gen_gc.gc, chip);
 	if (ret) {
 		dev_err(dev, "unable to add GPIO chip\n");
 		return ret;

-- 
2.48.1


