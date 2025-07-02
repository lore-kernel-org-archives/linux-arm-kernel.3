Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0391C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 09:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k0+AjDE5hY/TndXKkIwRA6Lb04rFiMbqRMpx6nKU2Y0=; b=aExD7wH2BQ0qBaZRlcEo2UYFwi
	mJsulUAxJeWruGqIDqYSCZpRbQhf0F3QCMuVC07aEpbHjey9xx4vXk8m+jxyLBVQ6zHVM5G8y3kM0
	hj1YeXhwkoX+eW66ED+PmRtC3jTqpCUX2D1nMjNhjtpmGgVo2jvEqwlfwWLeFfKD29OF1+cnC8bon
	G5lIVsI8TdAV8q5wxlUFHpENwFMmevIo9ougjLek0iu5lyjzoDP6U8E3eSyImje+kMYpHcwtrNB3+
	/bF1ehBMGdjZdLFlk8XMTsf5p+ym0wocWNyvdie/LeuY86yhXNsbhbNeytyaq3zPlM2f848H9L/Ry
	6WTXtmog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWu6s-00000007qWc-1uTA;
	Wed, 02 Jul 2025 09:50:34 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWtfa-00000007kdf-3KxP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 09:22:23 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3a522224582so3450048f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 02:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751448141; x=1752052941; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k0+AjDE5hY/TndXKkIwRA6Lb04rFiMbqRMpx6nKU2Y0=;
        b=2axQXMX0oMTjEK/0u/GWNCMSCVdhYuVlVbPeQWWud2RJcLT5Fj31TjN46bjhXA1jwI
         lXKrutR0DGWwAdaMqVhOg2STukY08sSYFXVbUzfOlyncZV9Fzf4DH+jS8MQgixTE4B8I
         fXpgkpcUiKSvHqn7q6eode8Zzp7bxlLMPTmZHbhFdqxIH3XRacGtefX0r5sL0eCMaSH1
         RzlsXP3s+w/IZ73EazTPWty5PWDoh0Xkoc0Dj0FuqkNgXRtCFG5hexpNXVrxmG9yv6Ox
         WnHGW4rfosilATjtY2iNgoQOgLt9DIGxwM8QPRTGwCy+1TfneVkaH275w2M9MazSMhjU
         gi0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751448141; x=1752052941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k0+AjDE5hY/TndXKkIwRA6Lb04rFiMbqRMpx6nKU2Y0=;
        b=ieespCzoVqP+P6Bt9Q2O+x0vtE38i0ddDTheQDVwjOC5gC5xQGp3EH+5whSwZONnGW
         pUu9k69qe8a4qiJXrZA252P+oVN2S349iaiQYlwZwAw9TBZsesHmPmgrfSzqS+TRntr/
         rkNSiBuf6ggAJjlTvqS+4QSSw3qj65G/FIzm8JlCac3YHkJ30245xKa43gNiRl+92VmN
         JhYohIe3uUqPbSNULOElCMF92gyUm/XMJGX5gYbqUKXch762ydzF1p6AB4nLiBssHgb9
         uCZqt4vUJGxtbJLSp8p19tA1rjY9AfI4WQP/EB99rlLXi81kE8rB37J5s63i05PGCTOM
         GJIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXS5+E2Q6cveeqxzyHXmuG2VGS2axj8yYz+lkcVrKrh5mJsZpuTRDRkjk6jZfNM73VB7Lk+qoYdQNsBB1rqF0ei@lists.infradead.org
X-Gm-Message-State: AOJu0YyP5bv/IDsQ8TKUxud7zKQ6uVDDvh3zliGv0hLJ9O0gg3MFPAVT
	dynm+7wsI2juXWwPMA21TA3KX1L8cTi0dgeyAnojlg6SAr4eWtK11Jl3dTmEVjfMEnY=
X-Gm-Gg: ASbGncu02ySYnS4iZ8RvUZD7HHsbo1tZAx576R0fCjfgwY73JuaUQMfk5vMpw8ANpV9
	Kdyjz8eCGS1Ol3mCQDp5qwm16P0TVGcHU7zgDXn3v4swABFtMU97xWBkrnkEiCv6jl8oNtj4W0J
	WtlkDoirsxIPZK/nCZGWexZIYQPsi/nssRfqhqKDFhcuueh2mn08UDJl1KGnTo3s75Ge0sBUiOl
	R+/OdS3cX4cxLw4dDfYwBQDmW7gjmrFYzv22kYTKm9fHcZvSaqevZA1UAmDm0hzqUD1ZM5+koA9
	K7qioDh0kIVq10sRf0LJrh99tFvkhpHp9kjRySWInla1AzwBSVQq9Q==
X-Google-Smtp-Source: AGHT+IFUTkQvyXFzsGNlqDX20NiNYBIQiPL8o6v8ocmr9X2/T9KyVihtWxZOoEUNTrhfgHIx4L9CzA==
X-Received: by 2002:a05:6000:1887:b0:3a5:2d42:aa25 with SMTP id ffacd0b85a97d-3b20110b277mr1315013f8f.50.1751448141188;
        Wed, 02 Jul 2025 02:22:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8827:d0e:25e:834a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a406489sm195844165e9.27.2025.07.02.02.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:22:20 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 02 Jul 2025 11:22:13 +0200
Subject: [PATCH v2 6/8] gpio: cadence: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-gpio-mmio-rework-v2-6-6b77aab684d8@linaro.org>
References: <20250702-gpio-mmio-rework-v2-0-6b77aab684d8@linaro.org>
In-Reply-To: <20250702-gpio-mmio-rework-v2-0-6b77aab684d8@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4923;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=PQq4ZbNjDNAuumzfNO2E7A4+3aqHViTTAOD8bRl9gxs=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZPpFZzbllRL7mqefD91k5+IPwZVgoSI1gZreR
 yDHtIsKGsuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGT6RQAKCRARpy6gFHHX
 cnRGD/9SPqNvkxINyTLmM900McNidb/ByKS47CfPiEEe9qvoRuUwmKGGHy8wqUyBm9pbsLQW1Mh
 dSo5sSKujwTyeuodotZnpOLQKGqxy56FGQxzlSzBsMe19Bf1NaY1AYj13rQJ6PptHneoHlOg6Lc
 ENaGsxptlqHu5vTG1iDMbo4uw8uZOBzFdDQK5b31IAKZ0FbiLz2ZiWOGLPUNproZnLyV+o0xIJj
 V2pzIZtiQL8Y5iHjb5V3+2ghR29/+SJsGzf2zO89j41i1txJ37HT1J/w/RjAEnd+0tO4AWp6xMK
 bXBR7sf+/BwWUUg5Tx1AAIjcAamZQ5ZWi1C+3s8W/ClctXTqoU4rjXlHqiFHTQekHIpGcvF2mXC
 ty6yN9O99EZRo5dgX2pIVVn03Hw0VndG+UVqhK8M4gsWXQekXpkwYG/claiHpAZCUsTR0mSoHIZ
 Pyt/VMEI4qaP3WjADGMBn0hMGIXSGCr5tz2nfenKT9dlgahTVHDEI+osZ6xN+P7Q+CCrn/8VvF/
 cw16GxtLqgWOhXm2mzx5+2FjSSsyUkqYjb20MITcghw38wapxlk2LtXCtwEicb5ziQkr/6Rid6n
 qcypD7qC1fourQbLm719N5Ke80ZmttMhQFWo6nkS75t7p3+XYwDAYR5cZgpMf4aXCoQAX2fTi3R
 /X1eXsdlptGq87A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_022222_845209_DA47FE08 
X-CRM114-Status: GOOD (  20.15  )
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

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-cadence.c | 46 ++++++++++++++++++++++++---------------------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff --git a/drivers/gpio/gpio-cadence.c b/drivers/gpio/gpio-cadence.c
index e6ec341d55e9047b2fa8718799ba72d54624388e..8243eddcd5bbe537bab1bedc72c80ee88839f5d3 100644
--- a/drivers/gpio/gpio-cadence.c
+++ b/drivers/gpio/gpio-cadence.c
@@ -12,6 +12,8 @@
 #include <linux/clk.h>
 #include <linux/gpio/driver.h>
 #include <linux/interrupt.h>
+#include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -31,7 +33,7 @@
 #define CDNS_GPIO_IRQ_ANY_EDGE		0x2c
 
 struct cdns_gpio_chip {
-	struct gpio_chip gc;
+	struct gpio_generic_chip gen_gc;
 	void __iomem *regs;
 	u32 bypass_orig;
 };
@@ -40,7 +42,7 @@ static int cdns_gpio_request(struct gpio_chip *chip, unsigned int offset)
 {
 	struct cdns_gpio_chip *cgpio = gpiochip_get_data(chip);
 
-	guard(raw_spinlock)(&chip->bgpio_lock);
+	guard(gpio_generic_lock)(&cgpio->gen_gc);
 
 	iowrite32(ioread32(cgpio->regs + CDNS_GPIO_BYPASS_MODE) & ~BIT(offset),
 		  cgpio->regs + CDNS_GPIO_BYPASS_MODE);
@@ -52,7 +54,7 @@ static void cdns_gpio_free(struct gpio_chip *chip, unsigned int offset)
 {
 	struct cdns_gpio_chip *cgpio = gpiochip_get_data(chip);
 
-	guard(raw_spinlock)(&chip->bgpio_lock);
+	guard(gpio_generic_lock)(&cgpio->gen_gc);
 
 	iowrite32(ioread32(cgpio->regs + CDNS_GPIO_BYPASS_MODE) |
 		  (BIT(offset) & cgpio->bypass_orig),
@@ -86,7 +88,7 @@ static int cdns_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	u32 mask = BIT(d->hwirq);
 	int ret = 0;
 
-	guard(raw_spinlock)(&chip->bgpio_lock);
+	guard(gpio_generic_lock)(&cgpio->gen_gc);
 
 	int_value = ioread32(cgpio->regs + CDNS_GPIO_IRQ_VALUE) & ~mask;
 	int_type = ioread32(cgpio->regs + CDNS_GPIO_IRQ_TYPE) & ~mask;
@@ -142,6 +144,7 @@ static const struct irq_chip cdns_gpio_irqchip = {
 
 static int cdns_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config = { };
 	struct cdns_gpio_chip *cgpio;
 	int ret, irq;
 	u32 dir_prev;
@@ -168,32 +171,33 @@ static int cdns_gpio_probe(struct platform_device *pdev)
 	 * gpiochip_lock_as_irq:
 	 * tried to flag a GPIO set as output for IRQ
 	 * Generic GPIO driver stores the direction value internally,
-	 * so it needs to be changed before bgpio_init() is called.
+	 * so it needs to be changed before gpio_generic_chip_init() is called.
 	 */
 	dir_prev = ioread32(cgpio->regs + CDNS_GPIO_DIRECTION_MODE);
 	iowrite32(GENMASK(num_gpios - 1, 0),
 		  cgpio->regs + CDNS_GPIO_DIRECTION_MODE);
 
-	ret = bgpio_init(&cgpio->gc, &pdev->dev, 4,
-			 cgpio->regs + CDNS_GPIO_INPUT_VALUE,
-			 cgpio->regs + CDNS_GPIO_OUTPUT_VALUE,
-			 NULL,
-			 NULL,
-			 cgpio->regs + CDNS_GPIO_DIRECTION_MODE,
-			 BGPIOF_READ_OUTPUT_REG_SET);
+	config.dev = &pdev->dev;
+	config.sz = 4;
+	config.dat = cgpio->regs + CDNS_GPIO_INPUT_VALUE;
+	config.set = cgpio->regs + CDNS_GPIO_OUTPUT_VALUE;
+	config.dirin = cgpio->regs + CDNS_GPIO_DIRECTION_MODE;
+	config.flags = BGPIOF_READ_OUTPUT_REG_SET;
+
+	ret = gpio_generic_chip_init(&cgpio->gen_gc, &config);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register generic gpio, %d\n",
 			ret);
 		goto err_revert_dir;
 	}
 
-	cgpio->gc.label = dev_name(&pdev->dev);
-	cgpio->gc.ngpio = num_gpios;
-	cgpio->gc.parent = &pdev->dev;
-	cgpio->gc.base = -1;
-	cgpio->gc.owner = THIS_MODULE;
-	cgpio->gc.request = cdns_gpio_request;
-	cgpio->gc.free = cdns_gpio_free;
+	cgpio->gen_gc.gc.label = dev_name(&pdev->dev);
+	cgpio->gen_gc.gc.ngpio = num_gpios;
+	cgpio->gen_gc.gc.parent = &pdev->dev;
+	cgpio->gen_gc.gc.base = -1;
+	cgpio->gen_gc.gc.owner = THIS_MODULE;
+	cgpio->gen_gc.gc.request = cdns_gpio_request;
+	cgpio->gen_gc.gc.free = cdns_gpio_free;
 
 	clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(clk)) {
@@ -210,7 +214,7 @@ static int cdns_gpio_probe(struct platform_device *pdev)
 	if (irq >= 0) {
 		struct gpio_irq_chip *girq;
 
-		girq = &cgpio->gc.irq;
+		girq = &cgpio->gen_gc.gc.irq;
 		gpio_irq_chip_set_chip(girq, &cdns_gpio_irqchip);
 		girq->parent_handler = cdns_gpio_irq_handler;
 		girq->num_parents = 1;
@@ -226,7 +230,7 @@ static int cdns_gpio_probe(struct platform_device *pdev)
 		girq->handler = handle_level_irq;
 	}
 
-	ret = devm_gpiochip_add_data(&pdev->dev, &cgpio->gc, cgpio);
+	ret = devm_gpiochip_add_data(&pdev->dev, &cgpio->gen_gc.gc, cgpio);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Could not register gpiochip, %d\n", ret);
 		goto err_revert_dir;

-- 
2.48.1


