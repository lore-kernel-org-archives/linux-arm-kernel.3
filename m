Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB21CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 07:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4UqewswoTYBEIcsMbZDgouz4c+DgJ88e6nymWd2RnwE=; b=y/CTYEpocEyQJkdmnVQJvuM7W9
	Z3nWp/HOUd7oUQGptY0XwQLETQZ0Mob6Bt0XVFpDxoxOkuppxH7iurLjhfNXFwEnIDKB7HacH/xb4
	90P1zW2hQHvXqZwF/vSGMeXg21e7fF3wraN2E+QEfdqeys+VCzwUyg1CWksI3N151ZiBDbA6taAYG
	WY4//tkv8SWqE96hMy88VwKElx+EAO2RcMUc5/RGAD1sF2RJ8bMVPl1Wrq/t8Cw+0D0IZtzzy6rKQ
	1Z0NkPl73pyRtrX0GpSe1xG2jAu+qp5Dd76HqSatjr0o97RAwxgVHoT1NH31yAbeKHtx9W6BGLWzD
	abJLSGtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwF0y-0000000CRY8-2dQk;
	Wed, 10 Sep 2025 07:13:12 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwF0n-0000000CREa-2sFE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 07:13:05 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-45df656889cso5612045e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 00:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757488380; x=1758093180; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4UqewswoTYBEIcsMbZDgouz4c+DgJ88e6nymWd2RnwE=;
        b=QDZ+q7HOH6II/FwjiuQic+6Bx9GBEbhztCJsNtBvBQ5QnnUEhlrn6xgWVpM/slo0sh
         1BYikP7uGWNfGInYAt7V0pbVilkuNheFwB7P1c+Sl3hITpUjWxuM0AmukwMzt4LrL+zm
         LB20swRXy856xufU9f5C/4BwEUAyan+5aIpAWUPp15h/IFRjyriOQ7CYgFl8Zgaaig3s
         iVh10+gCUEHY3r/aKAD526suTKkpO8uSI77KlBb8stivYquCVNArGxDqUBx7J+6Ve7HR
         mVN5C87WvAzoKx37Q4ti5yzy8WMiPkBjMp3l2PsaX5Xt0lahMPjjHKr0xS5zr/iRSzHv
         rgQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757488380; x=1758093180;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4UqewswoTYBEIcsMbZDgouz4c+DgJ88e6nymWd2RnwE=;
        b=uvlPXTRkmHNebtV8UGd84k19NgJ744uH0mmv9m+QaMuiz4Huagngj98kAJ5rD1JxM/
         xNpRDNv1F+YjpE3adUNjoDhnLKAkkOwo7pD91s1saJV6/kHk9C8KzO3XtNA1ZKplT7EP
         JJcQjqyG5OB7MQjXTvzKmcigiZhnsxYt0p9fozYDQlJ571S3H89JHQR8j3apStRzX/Oa
         b6xVklT20wvV3dUCEBSXJcBaFbyPY8JVhmoOKBdmoIpwLNIJe+Eb6RAEIJ1Y6H+3OYWv
         C6sdx0sJlOFHT53XWrQhQJjELwxNu70SL5lHUYKWiNyQwfzZNErpQBV0hKIoPFAJMPvS
         OURw==
X-Forwarded-Encrypted: i=1; AJvYcCVfC9OjNbHi8ZTMg0XsMsKb03skwI+4xUm5rYNnp7hckm3gVB46aOTql7q8v/xPF6wicIuhojlWvyyk7ewk/PK0@lists.infradead.org
X-Gm-Message-State: AOJu0YyZNO+5JY8Gt3AnKAMllVKf4OzSK7GfMhSMhB3XaiTpg10OdQbr
	XhVkGHW+RwovBJ6jewrX14AITXeGfZA72hCheMLtzZkLmcUNRNMbBCqZOsXap3if0AU=
X-Gm-Gg: ASbGnctu59DyhOaouq1YVEPdoQ/GUXxDo1oX6qOVWYFPrl1IerIVw2zQ0IjKzEmJMLv
	uvjqEDa0ik5ugi4ov7ex01FKPUJ4aB5N7o/mcArlpUmHi4Y/v3AAA98TVXkRQsEt1ZkQRNWvxlb
	ORQmyey0riXVHlEZkkpgNyRXtzVoBXNrHfSR57odFh5Ijk9nFBZRMGobN/Mx+jSz9N2zrnBxjuY
	RH0szEyVrurKjnlTplpImAb+eFQB22nQQveyRt49UvesWJgc1pCOU/CnVnVFzPgvYFNEZVBVho7
	JO4IIV5pyvYRzsZhqFenDAUjzDwoPuKtY9VdV+LUJet5FRTr4AMn32JCbLfjK2LY/s/6GN8T4BC
	3HjXaaoUxBDJ38/IS
X-Google-Smtp-Source: AGHT+IHM/EcqsUNxHTRDkv3Ro2FU5tTwnI8xZ82Dg6C6xAUM9mtRb1fnf1sXNkjM+VFNWYNXfmhjXA==
X-Received: by 2002:a05:600c:46d0:b0:45d:d96e:6176 with SMTP id 5b1f17b1804b1-45ddded62d8mr122670245e9.25.1757488379615;
        Wed, 10 Sep 2025 00:12:59 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df81d20d2sm16357035e9.8.2025.09.10.00.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 00:12:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 09:12:40 +0200
Subject: [PATCH v2 04/15] gpio: ath79: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-gpio-mmio-gpio-conv-part4-v2-4-f3d1a4c57124@linaro.org>
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
In-Reply-To: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, 
 Doug Berger <opendmb@gmail.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4614;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=wGzsLYe28KPZB1pzrH+XgxKm5KCqfN9J0bmBOYG+Gco=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowSTtTmv5xyvHuwcosTc3gy9UW+bEpZ2dbIBYT
 Hnhg3cEry2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMEk7QAKCRARpy6gFHHX
 cucUD/9omit0rOIo7nBUQp1NY+g0m23ZYDVTkrv8PDFLBqip9QIN/E0Spw9mgMF8EFWu2Abra3A
 kgdXX56x/EVzo9LbQIESlljovTDZm7Kaad+0tYhXkLavji5TvvbVKE4gGIEEnWgCjHsuDpotfkt
 7EFf5Ivegc5pt84kcej+0R9OyLEm4p2jSYuCJ5Rpb02LInCEsYKmFB3R21MdNMk0awkxQ1FMVNm
 hF/CTynqUlN9oSrMDHE1X7Q/aoqRa3q+tzz2xdoIaozvpYW7UxeHSVYb33VoCUpGRgKkxqGZ6CP
 GKyiYuOBY+sbyf3vytebxAEYEj3fREBnHdkwLz8kFxybTumob3zF34bsvwdYMEAGYBqUEw5C5RV
 UFH1zeKrl8v7nzA6ZCTccLXIfQ6WIwZcRd3oopG5T0DCvnSf8hJS8dKVFdcjyjXJDjtBVKfVPAi
 zGOrbFBfjKJRd57SJaF7NrggN/dQEQDD+qEz/qwmG9tc7K74RRz3Oqu26LsTsnWOob4Ui2LYzG3
 +vpBkmrptSnD+UFq9Kq723eYPGASKDYy4xDNeyqN93oRYUajGSY3+gEIyyC44G0Zi9cET4kMax0
 rJhd1rC8QMyTxVq6dxlrTwJ4S85Ps6elhTCItk2in8SfWBDNoeVORRP4fawfgjCy5B+5ShyIjAu
 Keme0RB5lGm0H1w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_001301_945720_CA9998D9 
X-CRM114-Status: GOOD (  18.91  )
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
 drivers/gpio/gpio-ath79.c | 39 ++++++++++++++++++++++++---------------
 1 file changed, 24 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpio-ath79.c b/drivers/gpio/gpio-ath79.c
index de4cc12e5e0399abcef61a89c8c91a1b203d20fb..8879f23f1871ed323513082f4d2ebb2c40544cde 100644
--- a/drivers/gpio/gpio-ath79.c
+++ b/drivers/gpio/gpio-ath79.c
@@ -10,6 +10,7 @@
 
 #include <linux/device.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/mod_devicetable.h>
@@ -28,7 +29,7 @@
 #define AR71XX_GPIO_REG_INT_MASK	0x24
 
 struct ath79_gpio_ctrl {
-	struct gpio_chip gc;
+	struct gpio_generic_chip chip;
 	void __iomem *base;
 	raw_spinlock_t lock;
 	unsigned long both_edges;
@@ -37,8 +38,9 @@ struct ath79_gpio_ctrl {
 static struct ath79_gpio_ctrl *irq_data_to_ath79_gpio(struct irq_data *data)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	struct gpio_generic_chip *gen_gc = to_gpio_generic_chip(gc);
 
-	return container_of(gc, struct ath79_gpio_ctrl, gc);
+	return container_of(gen_gc, struct ath79_gpio_ctrl, chip);
 }
 
 static u32 ath79_gpio_read(struct ath79_gpio_ctrl *ctrl, unsigned reg)
@@ -72,7 +74,7 @@ static void ath79_gpio_irq_unmask(struct irq_data *data)
 	u32 mask = BIT(irqd_to_hwirq(data));
 	unsigned long flags;
 
-	gpiochip_enable_irq(&ctrl->gc, irqd_to_hwirq(data));
+	gpiochip_enable_irq(&ctrl->chip.gc, irqd_to_hwirq(data));
 	raw_spin_lock_irqsave(&ctrl->lock, flags);
 	ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_MASK, mask, mask);
 	raw_spin_unlock_irqrestore(&ctrl->lock, flags);
@@ -87,7 +89,7 @@ static void ath79_gpio_irq_mask(struct irq_data *data)
 	raw_spin_lock_irqsave(&ctrl->lock, flags);
 	ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_MASK, mask, 0);
 	raw_spin_unlock_irqrestore(&ctrl->lock, flags);
-	gpiochip_disable_irq(&ctrl->gc, irqd_to_hwirq(data));
+	gpiochip_disable_irq(&ctrl->chip.gc, irqd_to_hwirq(data));
 }
 
 static void ath79_gpio_irq_enable(struct irq_data *data)
@@ -187,8 +189,9 @@ static void ath79_gpio_irq_handler(struct irq_desc *desc)
 {
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
 	struct irq_chip *irqchip = irq_desc_get_chip(desc);
+	struct gpio_generic_chip *gen_gc = to_gpio_generic_chip(gc);
 	struct ath79_gpio_ctrl *ctrl =
-		container_of(gc, struct ath79_gpio_ctrl, gc);
+		container_of(gen_gc, struct ath79_gpio_ctrl, chip);
 	unsigned long flags, pending;
 	u32 both_edges, state;
 	int irq;
@@ -224,6 +227,7 @@ MODULE_DEVICE_TABLE(of, ath79_gpio_of_match);
 
 static int ath79_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	struct device *dev = &pdev->dev;
 	struct ath79_gpio_ctrl *ctrl;
 	struct gpio_irq_chip *girq;
@@ -253,21 +257,26 @@ static int ath79_gpio_probe(struct platform_device *pdev)
 		return PTR_ERR(ctrl->base);
 
 	raw_spin_lock_init(&ctrl->lock);
-	err = bgpio_init(&ctrl->gc, dev, 4,
-			ctrl->base + AR71XX_GPIO_REG_IN,
-			ctrl->base + AR71XX_GPIO_REG_SET,
-			ctrl->base + AR71XX_GPIO_REG_CLEAR,
-			oe_inverted ? NULL : ctrl->base + AR71XX_GPIO_REG_OE,
-			oe_inverted ? ctrl->base + AR71XX_GPIO_REG_OE : NULL,
-			0);
+
+	config = (struct gpio_generic_chip_config) {
+		.dev = dev,
+		.sz = 4,
+		.dat = ctrl->base + AR71XX_GPIO_REG_IN,
+		.set = ctrl->base + AR71XX_GPIO_REG_SET,
+		.clr = ctrl->base + AR71XX_GPIO_REG_CLEAR,
+		.dirout = oe_inverted ? NULL : ctrl->base + AR71XX_GPIO_REG_OE,
+		.dirin = oe_inverted ? ctrl->base + AR71XX_GPIO_REG_OE : NULL,
+	};
+
+	err = gpio_generic_chip_init(&ctrl->chip, &config);
 	if (err) {
-		dev_err(dev, "bgpio_init failed\n");
+		dev_err(dev, "failed to initialize generic GPIO chip\n");
 		return err;
 	}
 
 	/* Optional interrupt setup */
 	if (device_property_read_bool(dev, "interrupt-controller")) {
-		girq = &ctrl->gc.irq;
+		girq = &ctrl->chip.gc.irq;
 		gpio_irq_chip_set_chip(girq, &ath79_gpio_irqchip);
 		girq->parent_handler = ath79_gpio_irq_handler;
 		girq->num_parents = 1;
@@ -280,7 +289,7 @@ static int ath79_gpio_probe(struct platform_device *pdev)
 		girq->handler = handle_simple_irq;
 	}
 
-	return devm_gpiochip_add_data(dev, &ctrl->gc, ctrl);
+	return devm_gpiochip_add_data(dev, &ctrl->chip.gc, ctrl);
 }
 
 static struct platform_driver ath79_gpio_driver = {

-- 
2.48.1


