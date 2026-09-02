Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF10C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 15:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ABWq6yl6RmD8WKfldYZOiTpcwQ6GawnJnekuHKy7JS0=; b=Ms8jGAegMCubgaegvkytLA8ZV9
	flNH2bgAxhVhvCSLUwACMmQipug7vh1TfWxqCuQGm/7/sqYD436mdzY6o06bokBJ3F1z902ZQfh2r
	g6FnbINQFnPHv13TtYbPy9eNU7WhmytEqMlR/ixpYoMWRILwwRSIUgEAjO2DtHfxTdhsMTuVIt0hD
	GjM4jds6SvqJg+ANzMgp9eEx72kZuyoGj/Z1xDXw1v8wmAtZ0kKsb0bqXUx7iBoP2FAsdqDY7isD9
	nSwyifIaDb9swu05YTgHk5iJTCW+c/xnsLR8cejtP7VPzYIKzPVu0y7bqo7H7smzrPjtfG3AUpD5N
	cIAn+TiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1n9a-0000000F8IF-1k2S;
	Wed, 02 Sep 2026 15:45:34 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1n9X-0000000F8Hj-2m9I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 15:45:32 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso12539555e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 08:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788363930; x=1788968730; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ABWq6yl6RmD8WKfldYZOiTpcwQ6GawnJnekuHKy7JS0=;
        b=FmzuMPVGlis+Btx1rfZ2ia1YiCNs6Mu4KDLiGS7rPm+UeHLwUPMB95/OErhMzqDxz2
         bgsEFS7IHWbLXTANHQog49vgT/le9E7hjFx3EZM5/1LLyJykB42JzP994WJvGK+YNlyZ
         u4Xks7fY0+KG1fwmQ+YqnDZ8shzXOQ1qJEiGexLy0FyYiE5l/iHTRJjZZw70oDzd8iLG
         47w0ObRjwFMlJIw8x7xlLOXFQRgSJlgkebqSZtCsp1d5td09tiv4dOJI8/nD6HDG8c6H
         +eFuFNIbEEhTFMv3bDeWbyKvJwwEWjLcXaC5S7trD3UejpIjVo87rrTJn5vhRbCtOSvv
         Esgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788363930; x=1788968730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ABWq6yl6RmD8WKfldYZOiTpcwQ6GawnJnekuHKy7JS0=;
        b=BwRe+QK3RpPaGijaa8LLd3E67IFtbZtCPnCQVNTMab6VU8erYJyljYgUSA5CByEOkF
         YDEgENdrWKSzEjQPZtBn1TcSpYeKQ67jc/UmTVNC9IkhqPv+F/tzKL/1vomfcaZFswdE
         rQF2zKlQq/GMIXLAiR0XfL/p0Ht6VC9DUFm6rhO7iBo4RaGs1BnPRLq0soeIeVgqZpOE
         1Fk3/qKEiEDwVPB5uIQb4RC6t0sTsXMG4ZV4w/8czBiydbAS85pII01Zw9HAEDHO5y10
         tZd8WytTeOVRHj2Pr0XB3NqDCU5SP3Xha2Hxp7H70S9TBGzjk8sAlL/J5CAFKYsCwoFx
         E7pQ==
X-Forwarded-Encrypted: i=1; AHgh+RqRZySG764+5avHdw/wJJaFtkr9sb1Dbz9Pj0gRA4/1ASNWL28kS1L30VKEaNXeKFNCS9I8tNdIs3te6YRDba7N@lists.infradead.org
X-Gm-Message-State: AFuF++lcdtyEh/dDArgDBNnJ9e/jTNGaUV5fYWsJX37xQxaq2j7SlXbU
	44/8dHbR8ZuNArQFWem4LC4sCNIXcj2uGqt97bBGB4Rvs3q4zXGKUvhU
X-Gm-Gg: AR+sD116Z2qbqGP7gJ/387wsRuGv2NyAypHpEOfyPUE5HPJkVtjBnw4WvKs6H9La+pr
	qe89wVI4oRiJshW08onqY7GrJLDD3HPVcJ1tRgUE3ftaqrJM2dr+xT8oiZY+PghoJMuTZ4ymezS
	NMOQFNslxdoT01R5IaiShAhVU0bcRW+3yQNJtuV2u2JeXi4bzhFka4Xkx7fLyhzLALdE05dypjY
	DeGT2J2dbi59rFJ7v8kG73/XuEvBJha/lSjWwI9LxWOoRk2NDER6E8wRq33j5Lud8URWZtMy1Jz
	FDIodlNxSoQfqNmAGsXWRaRZ+E76HoLYRWGkQa5+IW6R7wcYRU5aRIpCNqTBNkmr31jC+FLGZId
	Kuz2ekkynZv3pBQ8IL01cRoKtoZ27U+uvowajrnMLqfF7tY42g79YZ0JL3a5F9c2/X/VEf/Msa4
	XZuoKWMd9Hl/0hxf9GD4P9DjGqHeXm6rgKi2cpCQB3E6R0Ct5ji9TTIr5cOFUe/UsOYZo=
X-Received: by 2002:a05:600c:6296:b0:499:621a:2ec2 with SMTP id 5b1f17b1804b1-49ce581635bmr118401635e9.3.1788363929530;
        Wed, 02 Sep 2026 08:45:29 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5e686fsm530655e9.15.2026.09.02.08.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 08:45:29 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: [PATCH v3 2/2] gpio: mmio: track the direction of chips without direction registers
Date: Wed,  2 Sep 2026 17:45:25 +0200
Message-ID: <20260902154525.4090276-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260902154525.4090276-1-mehmet.fide@gmail.com>
References: <20260902154525.4090276-1-mehmet.fide@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_084531_737239_63076750 
X-CRM114-Status: GOOD (  18.77  )
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

A generic chip with GPIO_GENERIC_PINCTRL_BACKEND and no direction
registers sets the direction through pinctrl but has no get_direction
callback, so every gpiod_get_direction() call trips the WARN in gpiolib
and the direction gpiolib reports is whatever it assumed. On a Vybrid
Colibri module that is 21 backtraces per boot.

Keep the direction of such a chip in the existing shadow: the direction
setters update sdir under the chip lock, and get_direction() is the
shadow-reading path already used for unreadable direction registers.
That keeps the callback usable in atomic context, which it has to be:
gpiochip_lock_as_irq() calls it for !can_sleep chips from
gpiochip_irq_domain_activate(), under the irq descriptor lock.

The pad's actual state is read once, in process context, when a line is
requested: gpiolib calls request() right before get_direction() for a
new line, so the shadow is seeded from PIN_CONFIG_OUTPUT_ENABLE there and
the line reports what the pin controller says. Lines pinctrl cannot
answer for keep the input default, which is what gpiolib assumed before.

Suggested-by: Bartosz Golaszewski <brgl@kernel.org>
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/gpio/gpio-mmio.c | 59 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 55 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 7e4b3e8d609f..987285c33f45 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -49,6 +49,7 @@ o        `                     ~~~~\___/~~~~    ` controller in FPGA is ,.`
 #include <linux/log2.h>
 #include <linux/module.h>
 #include <linux/pinctrl/consumer.h>
+#include <linux/pinctrl/pinconf-generic.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/spinlock.h>
@@ -372,7 +373,17 @@ static int gpio_mmio_dir_in_err(struct gpio_chip *gc, unsigned int gpio)
 
 static int gpio_mmio_simple_dir_in(struct gpio_chip *gc, unsigned int gpio)
 {
-	return gpio_mmio_dir_return(gc, gpio, false);
+	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
+	int ret;
+
+	ret = gpio_mmio_dir_return(gc, gpio, false);
+	if (ret)
+		return ret;
+
+	guard(raw_spinlock_irqsave)(&chip->lock);
+	chip->sdir &= ~gpio_mmio_line2mask(gc, gpio);
+
+	return 0;
 }
 
 static int gpio_mmio_dir_out_err(struct gpio_chip *gc, unsigned int gpio,
@@ -384,9 +395,19 @@ static int gpio_mmio_dir_out_err(struct gpio_chip *gc, unsigned int gpio,
 static int gpio_mmio_simple_dir_out(struct gpio_chip *gc, unsigned int gpio,
 				    int val)
 {
+	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
+	int ret;
+
 	gc->set(gc, gpio, val);
 
-	return gpio_mmio_dir_return(gc, gpio, true);
+	ret = gpio_mmio_dir_return(gc, gpio, true);
+	if (ret)
+		return ret;
+
+	guard(raw_spinlock_irqsave)(&chip->lock);
+	chip->sdir |= gpio_mmio_line2mask(gc, gpio);
+
+	return 0;
 }
 
 static int gpio_mmio_dir_in(struct gpio_chip *gc, unsigned int gpio)
@@ -601,20 +622,50 @@ static int gpio_mmio_setup_direction(struct gpio_generic_chip *chip,
 			gc->direction_input = gpio_mmio_dir_in_err;
 		else
 			gc->direction_input = gpio_mmio_simple_dir_in;
+
+		if (cfg->flags & GPIO_GENERIC_PINCTRL_BACKEND) {
+			chip->dir_unreadable = true;
+			gc->get_direction = gpio_mmio_get_dir;
+		}
 	}
 
 	return 0;
 }
 
+static void gpio_mmio_seed_dir_from_pinctrl(struct gpio_chip *gc,
+					    unsigned int gpio)
+{
+	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
+	unsigned long config;
+
+	if (!IS_ENABLED(CONFIG_PINCTRL) || chip->reg_dir_out || chip->reg_dir_in)
+		return;
+
+	config = pinconf_to_config_packed(PIN_CONFIG_OUTPUT_ENABLE, 0);
+	if (pinctrl_gpio_get_config(gc, gpio, &config))
+		return;
+
+	guard(raw_spinlock_irqsave)(&chip->lock);
+	if (config)
+		chip->sdir |= gpio_mmio_line2mask(gc, gpio);
+	else
+		chip->sdir &= ~gpio_mmio_line2mask(gc, gpio);
+}
+
 static int gpio_mmio_request(struct gpio_chip *gc, unsigned int gpio_pin)
 {
 	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
+	int ret;
 
 	if (gpio_pin >= gc->ngpio)
 		return -EINVAL;
 
-	if (chip->pinctrl)
-		return gpiochip_generic_request(gc, gpio_pin);
+	if (chip->pinctrl) {
+		ret = gpiochip_generic_request(gc, gpio_pin);
+		if (ret)
+			return ret;
+		gpio_mmio_seed_dir_from_pinctrl(gc, gpio_pin);
+	}
 
 	return 0;
 }
-- 
2.54.0


