Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C8EFC88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 08:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H137qfG3h8enrbCR8FlT5MD3WdEANP9LGcr88jAxASI=; b=ZTm3uXvtsqi+DcxtifAi3A9WUG
	FPtWRJqVvBBnxAO9e8pEbNdxGKTXfJPUF0cmZKWrom/qX0iIYPuixcN4iReooivmZmyhdcrZZ6Es7
	h5BRhlFH2E5nmXEfuHHYonDvZ2INYvBYue10ebsUsr+rDwAE2Ub6dP5qABAGEHNKaymBEXcZEf5EP
	hw0j9e7VAqJpyd/hMr1fEUNYJwrNAvJl+LQbyrsocgzxp+LEmpmlC4RbjXBIPhE6q5U3+smDgPNwz
	cR7ar8tr0Rp5qfaDoOstKacw7sBQvu93MjDM2CD0CgFt+Evpb0tIwy/xHUbZTsXg/8ptm2dwb9ZYk
	7za9Dubg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6OAG-00000005ZLh-3T39;
	Tue, 15 Sep 2026 08:05:16 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6OAA-00000005ZJo-1Rfv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 08:05:11 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-485b1d2874fso915188f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 01:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789459508; x=1790064308; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H137qfG3h8enrbCR8FlT5MD3WdEANP9LGcr88jAxASI=;
        b=mDsnC7cuKWv1RJFAiXkM+sIHVpGcqeP9UjPM0XFYZBe5af8hz+1aFnkJnjIlry0XvA
         qKf5oZXl+8bJ+VAOBmmRkqTq71mYQyEq0muEDjwVMa1wAAEodWWfCMMvmFfk1+j346uH
         LvfBr74qcpysmDZAwFCsgKowK4PpkUhz5qno/xl56/nZms60M8pnfd17GV/oBErt6Aqn
         DMYo/7tvkINfhbNNeW0or4u/6xFfq7VwqtOR3uYI35lJkuzxFnor9XW21YzIWmP6H/FI
         CDLmPwC8JgsVWFCo3Pzlz0vZhmdTjbtajkCQqB3Sl4bVo+Rjhv4iK/qJIrGYaQHheBfa
         bkvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459508; x=1790064308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H137qfG3h8enrbCR8FlT5MD3WdEANP9LGcr88jAxASI=;
        b=vSwh08ukynMKyAvIweDW0NNrV/cprNbXfZC0GExG4yzqSBD4v6fXQE8SWEpyRlzfij
         f+Glmqi8aX3Z8/RVFbKL1Y5StsV8XQ/pdq8v/DrTae/jYl5lKeHLAnthI7Q6ezwry/nl
         EblD5J78lBY/OcBvmfceEsVRaNUn5xS+kK+sKu7MMppF6HKIQ/sHz3CicufQGRdcqfSP
         obsf5FjmJc3meFfE4HaiHuwls8dItimpc9TGMkb0CJV7Esx7eeHScP9shRhS0l+BIeWn
         KrRJA4NBlb40qCLuE3mb+l+q8bBY8gu9W25UcXUvLeKbIprihvi48VOmQJ61jlpmWDkq
         HYug==
X-Forwarded-Encrypted: i=1; AKwUvBwHsqaBqM0gz/UK+TsLHDZR01LBHaurvP1Q1Gu78YUczhdMkG/ElbObBlRu+bSKhq/AkFlIy6nrJ+Qe4K8NnyAm@lists.infradead.org
X-Gm-Message-State: AFuF++lLCyEimcIv5gYbJFGZnl7NswkbwHh9PLynObPPOIKdMOclKHdQ
	hadiHfhthcHwuLq4OpIaM/xK2Wp8wzfxuseYzV9uJQEH80eKnatpCDBy
X-Gm-Gg: AYBFou2wMzHGrQ1NHM/ZNqdTK5L9TaaDls6akOgNb5HSqch9K+XeuS2oh2SoAmpkVfq
	uXI0EkHbYsL1G7AHzCS1OqY+sAxm1VOMZa/wkBUeKoinKP9hYso4HdpWIG8DPgrEpoltUoFPqNK
	5OOZjpCSndk3JY98XINtilypORKfoNRBKOaCAeBw7AZ124AzSCZEwmY2FNDzJ3e1jqcaPTfe2yi
	lrdzl7F+3C7Oh3D7pmx6Ttnv+xz/w8RxBPz4iVog7k2aOw3ICcT1N5zpxvHsWWGHehfYF8TY8ba
	YqjT5yurH0CA/KzflqaSy4gehdKCj9TNb+d7etDncnR4LVdS++MgNTLXFYRokz9hfF/3ETStFX+
	0n7vijSQlMaTs4IifRSMqywZScNBKqQrCq18/WHi3Syymz997gnNiDS1txMJkT92aBhzhYsz4HS
	sTrYDtJ2UCdx6BFWo1Da12hIeLwtrE0YNRjIV0BfN5EwMfOuAJN/zDyrLWjp3TmRJjsWCoLEwGc
	TLO
X-Received: by 2002:a05:600c:3e10:b0:49d:2936:8ad1 with SMTP id 5b1f17b1804b1-49e7d722aa2mr32668075e9.1.1789459508063;
        Tue, 15 Sep 2026 01:05:08 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d27315csm48588365e9.2.2026.09.15.01.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:05:07 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Haibo Chen <haibo.chen@nxp.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
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
Subject: [PATCH v6 4/4] gpio: mmio: track the direction of chips without direction registers
Date: Tue, 15 Sep 2026 10:05:01 +0200
Message-ID: <20260915080501.329424-5-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915080501.329424-1-mehmet.fide@gmail.com>
References: <20260915080501.329424-1-mehmet.fide@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_010510_423099_617511CA 
X-CRM114-Status: GOOD (  21.13  )
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
Colibri module the i2c core, asking for the SDA line's direction before
bus recovery, gets that backtrace on every boot, and so does any other
caller outside gpiolib.

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

dir_unreadable, so far set only for GPIO_GENERIC_UNREADABLE_REG_DIR, is
now also set for a pinctrl-backed chip without direction registers: both
kinds of chip have no register to read the direction from and serve it
from the shadow.

The answers depend on the pinctrl driver decoding the parameter. On
Vybrid that is the preceding pinctrl-imx patch: without it
pin_config_get() returns the raw pad register, which would seed every
requested line as an output, so this patch must not land ahead of it.

Suggested-by: Bartosz Golaszewski <brgl@kernel.org>
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
Reviewed-by: Haibo Chen <haibo.chen@nxp.com>
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
2.55.0


