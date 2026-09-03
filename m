Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB815C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 08:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yGVy22n2k2x8Vmi+YjiPo8Onst4nWhBMCSM53hHrhOk=; b=2bazhBSHepAJlpKsE5LNfeKmum
	wto2AgdYDPM1guD3pw1JfesrypRdSCSblbFpBBFbZI8s/Q2JZkZ6G0BQ5jG2TrlVbj3zZO9pnZD3W
	XTrye7ZXctaj1zwPPn96hq5VQLvdjQ+UxuEZSNlpql5n26mq6UYv55l7NlKvR8a1I9MfrIK0kRoIi
	N7QOJLx5RwFZe+mB7uni5EyUdD7+bnQCahZvt8wPi3LhWU/oMkP0pOAxvZoS5khCNkgVT9EzasIAD
	aLQeKgcG7iKAA0hPK+2rQ5JU0Swh8edDiyJhjQu9N9tSINX9M5/v9L2L/DJMIBr+WDbUW7BhdYP5V
	qLyuzotw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22MY-0000000GiiG-3EEA;
	Thu, 03 Sep 2026 07:59:58 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22MV-0000000Giex-3IB0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 07:59:56 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-49954b88fffso15690925e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 00:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788422394; x=1789027194; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yGVy22n2k2x8Vmi+YjiPo8Onst4nWhBMCSM53hHrhOk=;
        b=tKVyVlt3EToY6qCbMTNhIcQgBSE5UNwr/7vnhWRklSLZhX0I6+oLz+IkMPPx3Sh06M
         l/voPXaTAB/B3Vrs2Moo8FDiP7/PRbP/sk+z0xc+zFt2YYzYJT7Dxum+CYlwsmHZsLSF
         dGXsbPYdoY+6/Sa/6+1anROpyYv0i91zXcM0FQVKdyVmJdWMgwcH4WXn9EED3i60d4LL
         msBappyVLm0uKxDYFa97ZwizhZlyiqCDn7NIX3qwz2yAWcIz9ifIA5vmXzDqvWP15zHF
         aWEEGYgwgEI80oEZGuPmPIxHCks8CksMnFjD8+9nll/+/e2/W9oxytNcZwdW3eiqfMAv
         dBFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422394; x=1789027194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yGVy22n2k2x8Vmi+YjiPo8Onst4nWhBMCSM53hHrhOk=;
        b=VVQJCuF6EbAjGwmmDmO1QIP62cTY619aeWIl4H5em+5tAWavDbwlWJkj8YgACvHGoY
         PpLt3Ia8EbEffXQxZainCzFPgGoNcV4/YMpiacCXMzWm+2uAkMpBvnp495Q5OrVW2Gez
         TagTwhpRQcAtLLwmRlygduccaQNDOcmCe72osQWiFYOxRuZbMm4uWwg49C8fUes6R3q1
         53NlZiUjrGy4QYn+fXtsu/4X7USYdM39Ldsu3jd/uY6fqOo3qDVcmLd0qVwF7Lm9ZImH
         NZuL6ccWNtrq1FEAkL3mxeIVihR+b6j1WoMw/F9vdUZzucZJz0SRPseFsXVt1VpkGwC5
         2jrQ==
X-Forwarded-Encrypted: i=1; AKwUvBw95XSsRb4Ph/klLct37qLONc62Tc4u2sjGHbuhBY8jE+bhm71uR/KB6UD1u7Qq1S0NTyb7tNmsSrZt8f/aALOm@lists.infradead.org
X-Gm-Message-State: AFuF++keHlLxsRe9+B4lhocEhgvIBBI723Mbam7YohGpl+szTKQPxv4A
	7p3k7wIqehzfzDJtJ1bx8WNUTPYFXqZpLYX7DXr25d6BxW9SqRGnBxtI
X-Gm-Gg: AYBFou0N8uaP654zbCbrbht3sk6VEVpnhpZQmwWTlMfXwMkxxTbfJ1io1Q9LpewYka1
	RAmj9gMPAAjbic+L7rzjsNISFrPjWi+if+ROuTa5rIeq1MhHEBj0p744IG3uIw4NBHD7G5wl2an
	732thQd7s8BBSqj/c4nzolvr0iuvEPcAK3zWq5PCq8y83b0EZ8xyTZqGhRIBp1UHVNg79tARpFR
	KBje6WhzBx9PM4RkD83Uy7UK7EDpaYzQ9E35ADYW+X3WHv5H7JfHzRpz24in/4gS0QyF+Cf3k/N
	E0hDIwlh1qDwY1UpQ1oUuaBmoHurETw+OsQTjS+KW/PDRmN0X+Pu+7Y4r64jxuYD1Ej/Bw3AdNR
	QpQlcCrwfhKOSo+8o62PHVWSOLRZZ5b9nkaYcu7HOLmgWirtaxQ/6HtPyhxFcTS5Y2w/X9OQ+3V
	MDtLORQkw0qoXIlv1Ib3tzQYR81oGpw4peSUhtPzRYt9FJbY7KCTBO3PUeJSWJN/doRQ==
X-Received: by 2002:a05:600c:621b:b0:499:dbae:86be with SMTP id 5b1f17b1804b1-49ce58352ccmr202005745e9.14.1788422385163;
        Thu, 03 Sep 2026 00:59:45 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee3b0af8sm52373275e9.0.2026.09.03.00.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:59:44 -0700 (PDT)
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
Subject: [PATCH v5 3/3] gpio: mmio: track the direction of chips without direction registers
Date: Thu,  3 Sep 2026 09:59:40 +0200
Message-ID: <20260903075940.2089367-4-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260903075940.2089367-1-mehmet.fide@gmail.com>
References: <20260903075940.2089367-1-mehmet.fide@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_005955_841736_D6CD5254 
X-CRM114-Status: GOOD (  18.93  )
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
new line, so the shadow is seeded there from PIN_CONFIG_OUTPUT_ENABLE
through the chip's get_config(), which is gpiochip_generic_get_config()
for the pinctrl backend, and the line reports what the pin controller
says. Lines pinctrl cannot answer for keep the input default, which is
what gpiolib assumed before.

Suggested-by: Bartosz Golaszewski <brgl@kernel.org>
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/gpio/gpio-mmio.c | 60 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 56 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 7e4b3e8d609f..0709ffaab4de 100644
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
@@ -601,20 +622,51 @@ static int gpio_mmio_setup_direction(struct gpio_generic_chip *chip,
 			gc->direction_input = gpio_mmio_dir_in_err;
 		else
 			gc->direction_input = gpio_mmio_simple_dir_in;
+
+		if (cfg->flags & GPIO_GENERIC_PINCTRL_BACKEND) {
+			chip->dir_unreadable = true;
+			gc->get_direction = gpio_mmio_get_dir;
+			gc->get_config = gpiochip_generic_get_config;
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
+	if (!gc->get_config || chip->reg_dir_out || chip->reg_dir_in)
+		return;
+
+	config = pinconf_to_config_packed(PIN_CONFIG_OUTPUT_ENABLE, 0);
+	if (gc->get_config(gc, gpio, &config))
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


