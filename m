Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C09C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 09:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dp3qpaLxdoL/9VDJ6nL5BaV3W6j7nnnxGCE6fZ2JVIs=; b=Tc74guBG8IJ6QI0T8TmN6/VoqS
	JTZ0B5rjEwdWzDfAqJx22QCd9wwLBGteMLC4QonPpqXtZIjPt1UWlWv4ljiybiRLHSlHe8TsOJ2Qa
	5quRWKhFmoqLmCLlhrR+qmcaAKljc7OI8oqmvGG32ZOHem9lOwmOE6nxm8puzl/o9dYFyuiSB+aZA
	4TPPEPHbQYemVjcVBnTcFAWJXJkvZ/baQrsPsGJkUWJMpEFsoltEcurr+mCAqasYPWHwIt1DSsJtN
	1K6c6aNIEqSKShVa0tVOvh/Nbi8hZbYwA/42tT5crakILUO4NW3hvrNhuGLGYeUivpuFsEcPeo1SP
	jOjvAwxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWu2F-00000007pPT-3D6f;
	Wed, 02 Jul 2025 09:45:47 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWtfX-00000007kbS-28Ua
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 09:22:21 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-453634d8609so46694105e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 02:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751448138; x=1752052938; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dp3qpaLxdoL/9VDJ6nL5BaV3W6j7nnnxGCE6fZ2JVIs=;
        b=H2hGYz0gVZutiDx8pG7sicBTx3YWdizGWWpa491waKQIh7fSMk+3MLhr2qSvFXAXAJ
         ngpYqaBRTW2VJfnsUlc+MbGu+GMAobYokz4FRAZ9QupSiaafvM8guKS8Cr5EcFq54Vuk
         05pWY5N5Y5D2qx3/NGjkFZJKX7v+tLHJcycLtqC7AFQ07M3CVltOQJOiJY8N+M4i+sFJ
         DosZZpSx/HpyoXiC6YOjA4icDJeLdWUVXDw0BJbnhIRq1ivgXu1ne2e1psLTJDKlcnwD
         cuE0hfPbrkrG0kPLN82EDzL5me6O6ZoCFVEHlDdTkDm1D9o2DVcOhABFoHG4bOD3xnhv
         S0Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751448138; x=1752052938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dp3qpaLxdoL/9VDJ6nL5BaV3W6j7nnnxGCE6fZ2JVIs=;
        b=kANDxmVI+Hr6mjVn1Cu0c6j3xLqzOK4Dx0RDvSomHAVsgXIGhEN7CLeh1gUn7/j6aa
         DrAPBNwK5fmLGJegKRzmK9Kt6yilLT+cNJwMq79SVeRLd2USG74r/MWRRBUZVfEkXXdF
         wkkCM3uq7X6n/cDVGgAxP1I49fNXwNB3njoS9j8oIef0os+FYEhYg6LGh+ERzojnS0Bo
         W8XW0Fv8LeRDFB3iHGQylqa041CSJ5dqUfzspIBXESym8P5xfA5e8WFO98eyq0oTtQ8H
         2WnMN04i9F2jLaSOJjIoJJLNaNrKEJoFfL/HMD3Fs5Ch4rtFL3zu7u5GOo7onwozlyyc
         sDZA==
X-Forwarded-Encrypted: i=1; AJvYcCUoKztgYx9INuBjhY2GF9SpzUdKX9LldCrcAT5ZNKJcJL/oNQ1QaydznR8CCiLCEf3sBYrYe0gk3cM1Lv1u6HxA@lists.infradead.org
X-Gm-Message-State: AOJu0YwItD9Z3K2QJ9KYxu5sYJA8HjK77gMACTA4/XvCck2Khg7fJWnx
	4TPJCglQM7ec16Hb6R8Yb4cJqbZMnhkVNQzS7Z/PhxI/8/3ZALW5enWWeo1A+/L8OoE=
X-Gm-Gg: ASbGncssEYEIbCV1N9+q6s11cnxgh+ehJId8Y590rOB+PomdRNN6FKV7xz9d5FZqdLQ
	Owa8LR/sBhPVUnHo2LNGuaO/o5xm4ylavRR0+Jjd9EjPSaOT4Vc9tBaMZPkVDIl27OW4hPbNtl2
	SYkYZaEwrjucNYz4Hdrnkr0niUI9m17ApGJdlkocWlt7MP1hC4+oGQPBFGN9ARZ7atZdWH1fUuT
	069cqrqp4swpfpgX4TFDTXkpiY9gAVRYb+WDwAkP16DOHOekyY+jnBCIL+l7loKFd6ha+u+kcfT
	rFdanmwmxkYqWDQ574G8YghzeCM5H92smreldjAqORCEhQ1SZqzc2A==
X-Google-Smtp-Source: AGHT+IHjF9A77ATHBE3b9SvMdK9lJT3V87Bih4BU12gvPzJDNkmjN6VHlXOPrM1x33gj1i/Cj7OAEw==
X-Received: by 2002:a05:600c:1d09:b0:453:1058:f8c1 with SMTP id 5b1f17b1804b1-454a36dc7bemr26756415e9.3.1751448137808;
        Wed, 02 Jul 2025 02:22:17 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8827:d0e:25e:834a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a406489sm195844165e9.27.2025.07.02.02.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:22:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 02 Jul 2025 11:22:10 +0200
Subject: [PATCH v2 3/8] gpio: mxc: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-gpio-mmio-rework-v2-3-6b77aab684d8@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4640;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ArrJt1nq0/DyMnLRqYgOtwp6wmTkd8ckjtCqzdNL0po=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZPpEb1a2Iujd3m6Dlq9qCVuQ1Gay7cvpxMQ4G
 8uVzp1zKdCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGT6RAAKCRARpy6gFHHX
 coL3EADbnsSHboTOP67UtjJ1KfYAcu2cco3pEtdOD/wcQwvCs1oENdMmSFvj3/vvliHwnUDQoBB
 8d9K803SD2wRFHp8mwhxSTaQs/5KronLBcc0YW0cuf8rLF6ZWJ2L/D4fHLgootUcHEGpFjWpDzM
 AT9HAEa8pch5jvkq1NYCYlwyASLUvtOK/FqXw0Pdq6kpKZJuVBfsbRZC7p1pBQs8h777sqvhTeG
 ZEp6owZnFUs6FMY4CNohTvkIpAtBgOk28droEpctwLgDLm1OEyCGT3KjKhhQSMC62jvonrHj8Hg
 OMSQvXrQ7xSFGaj/pBdarGbtItdoM72Ar8gOqyXiCclxhOlaTEQm1tpIB83LLrOf6u03qOk5R7s
 Biwzu8qoubwnR4G+s8ZQdtYMpWm5TukofpRkhFboE5NZ3ICZ0qqqivzmrl5GiGKFXhRgd2SRM+p
 LJjyeeTgX1fHyD6XwNP8v6x729useTcDxA0m/FAFAArw/9USWIddgzc3wPr7o+CoSXvqI/WL73M
 jVtlyEzryR/+thIAOcyHGvxqZdBA+jofsDudB/SwwJTHIN/OWM/tBhkFOj5PihEJUxIJ0bAlH9S
 uOcujET0gOwaiB4KPVDR4yVbnOFfJfyalXRJ2umXGRW61M4IUDFHA/3/GRlV2GMyKBsxm2CjL6a
 8bhoo/c8RjwdhKQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_022219_561995_4ABDFA7A 
X-CRM114-Status: GOOD (  19.71  )
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
 drivers/gpio/gpio-mxc.c | 41 ++++++++++++++++++++++++-----------------
 1 file changed, 24 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 1c37168c8d0a657d7f93067d9ac95cfbd821f757..433cbadc3a4cc67ebc89a4702280975fa8d2c9bc 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -23,6 +23,7 @@
 #include <linux/spinlock.h>
 #include <linux/syscore_ops.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/of.h>
 #include <linux/bug.h>
 
@@ -65,7 +66,7 @@ struct mxc_gpio_port {
 	int irq_high;
 	void (*mx_irq_handler)(struct irq_desc *desc);
 	struct irq_domain *domain;
-	struct gpio_chip gc;
+	struct gpio_generic_chip gen_gc;
 	struct device *dev;
 	u32 both_edges;
 	struct mxc_gpio_reg_saved gpio_saved_reg;
@@ -179,7 +180,7 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 		if (GPIO_EDGE_SEL >= 0) {
 			edge = GPIO_INT_BOTH_EDGES;
 		} else {
-			val = port->gc.get(&port->gc, gpio_idx);
+			val = port->gen_gc.gc.get(&port->gen_gc.gc, gpio_idx);
 			if (val) {
 				edge = GPIO_INT_LOW_LEV;
 				pr_debug("mxc: set GPIO %d to low trigger\n", gpio_idx);
@@ -200,7 +201,7 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 		return -EINVAL;
 	}
 
-	scoped_guard(raw_spinlock_irqsave, &port->gc.bgpio_lock) {
+	scoped_guard(gpio_generic_lock_irqsave, &port->gen_gc) {
 		if (GPIO_EDGE_SEL >= 0) {
 			val = readl(port->base + GPIO_EDGE_SEL);
 			if (edge == GPIO_INT_BOTH_EDGES)
@@ -222,7 +223,7 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 		port->pad_type[gpio_idx] = type;
 	}
 
-	return port->gc.direction_input(&port->gc, gpio_idx);
+	return port->gen_gc.gc.direction_input(&port->gen_gc.gc, gpio_idx);
 }
 
 static void mxc_flip_edge(struct mxc_gpio_port *port, u32 gpio)
@@ -231,7 +232,7 @@ static void mxc_flip_edge(struct mxc_gpio_port *port, u32 gpio)
 	u32 bit, val;
 	int edge;
 
-	guard(raw_spinlock_irqsave)(&port->gc.bgpio_lock);
+	guard(gpio_generic_lock_irqsave)(&port->gen_gc);
 
 	reg += GPIO_ICR1 + ((gpio & 0x10) >> 2); /* lower or upper register */
 	bit = gpio & 0xf;
@@ -414,6 +415,7 @@ static void mxc_update_irq_chained_handler(struct mxc_gpio_port *port, bool enab
 
 static int mxc_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config = { };
 	struct device_node *np = pdev->dev.of_node;
 	struct mxc_gpio_port *port;
 	int irq_count;
@@ -473,27 +475,31 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 		port->mx_irq_handler = mx3_gpio_irq_handler;
 
 	mxc_update_irq_chained_handler(port, true);
-	err = bgpio_init(&port->gc, &pdev->dev, 4,
-			 port->base + GPIO_PSR,
-			 port->base + GPIO_DR, NULL,
-			 port->base + GPIO_GDIR, NULL,
-			 BGPIOF_READ_OUTPUT_REG_SET);
+
+	config.dev = &pdev->dev;
+	config.sz = 4;
+	config.dat = port->base + GPIO_PSR;
+	config.set = port->base + GPIO_DR;
+	config.dirout = port->base + GPIO_GDIR;
+	config.flags = BGPIOF_READ_OUTPUT_REG_SET;
+
+	err = gpio_generic_chip_init(&port->gen_gc, &config);
 	if (err)
 		goto out_bgio;
 
-	port->gc.request = mxc_gpio_request;
-	port->gc.free = mxc_gpio_free;
-	port->gc.to_irq = mxc_gpio_to_irq;
+	port->gen_gc.gc.request = mxc_gpio_request;
+	port->gen_gc.gc.free = mxc_gpio_free;
+	port->gen_gc.gc.to_irq = mxc_gpio_to_irq;
 	/*
 	 * Driver is DT-only, so a fixed base needs only be maintained for legacy
 	 * userspace with sysfs interface.
 	 */
 	if (IS_ENABLED(CONFIG_GPIO_SYSFS))
-		port->gc.base = of_alias_get_id(np, "gpio") * 32;
+		port->gen_gc.gc.base = of_alias_get_id(np, "gpio") * 32;
 	else /* silence boot time warning */
-		port->gc.base = -1;
+		port->gen_gc.gc.base = -1;
 
-	err = devm_gpiochip_add_data(&pdev->dev, &port->gc, port);
+	err = devm_gpiochip_add_data(&pdev->dev, &port->gen_gc.gc, port);
 	if (err)
 		goto out_bgio;
 
@@ -567,7 +573,8 @@ static bool mxc_gpio_generic_config(struct mxc_gpio_port *port,
 	if (of_device_is_compatible(np, "fsl,imx8dxl-gpio") ||
 	    of_device_is_compatible(np, "fsl,imx8qxp-gpio") ||
 	    of_device_is_compatible(np, "fsl,imx8qm-gpio"))
-		return (gpiochip_generic_config(&port->gc, offset, conf) == 0);
+		return (gpiochip_generic_config(&port->gen_gc.gc,
+						offset, conf) == 0);
 
 	return false;
 }

-- 
2.48.1


