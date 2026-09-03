Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54863C624D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 07:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yGVy22n2k2x8Vmi+YjiPo8Onst4nWhBMCSM53hHrhOk=; b=knVX+2bZWvLnkur9V6Db+KDjmv
	F4cxin71AdBMrGSWwUtXFinywI/LDv4tjSLhS2LOc4A0D6VgSQ8MOzkIlxp7mGVl0keuXVjjcBeNt
	nE1x2xUrLONSriUQUV2JFI3Bfbq43FZkhwgxYvbb1FuUpNeVNVl9Ss2UfO7gCDGJy9XwaSt6srPhE
	LPhSN/fB8PQSIs3SNIZIS5xsU8ZO8GcGhzd3mOLfoZbifA+EtMnubQZSjkPMgUP+90/kjkk2maS4R
	/YwKS26V00f+LbFS950UdotNYYEOeRgfpJIXcP+ekQO/VuMZp4yEczMoSYf1BsYWqPrNJMOanOQah
	XzGCipJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x21vZ-0000000Ga25-21E0;
	Thu, 03 Sep 2026 07:32:05 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x21vL-0000000GZx5-1aVl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 07:32:02 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-49b0eab380eso6863525e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 00:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788420709; x=1789025509; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yGVy22n2k2x8Vmi+YjiPo8Onst4nWhBMCSM53hHrhOk=;
        b=XrwRr0MRyLeOvfxKjZISUcWKjcdWgocNaJKs2zGogvFKYY1OHScTlnFBZoPT9H/L0w
         iivwffAnE2IW23q3BfAlmhtk0EVGXlaA5XmiND7n3d5Zsdw8OcG3sitQ1nN2SUn+rTCo
         cjkcSCowiq/spz1UwJt5qp6P/N5a7s6BDM5fhufMT8eM+445jnJQ4QVskZuC8xwjhFSb
         ieWF5ilh/lDtCjzHXNzFPGwhEyO17ksJzHbMIOj45PSyaVMG/Dw6GSUP0opNS4q9CX2I
         zjsTocO0HGd2wPn8L/6/6nQQYunYOcvFRcMK6f7odca01rsscOL0TYY9X+CvHn7YjIat
         eNYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788420709; x=1789025509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yGVy22n2k2x8Vmi+YjiPo8Onst4nWhBMCSM53hHrhOk=;
        b=IcBi2GCZLxUPp/VcI00Pmd37CyjCQ19sEurbvLoOLvoSqcfpU0gyzQIeunQxZ6MbCW
         yjmQWBqoIwzQFAYzq8WWuInexI364QaAtMs1LFJbW2FALBEBzPkguu9OoVjYvHU12SGy
         vDHMRusBSK6CCQl0sgXLan1+zUv4B2Giii1aOtEYOOwYSwqeIyjqPkI5yYuRd+s8G11y
         Xa2WUtzp4Hky2v0/QfFQquQgqIpKTjOB/mHOPBmNxL80bw6VcoL3LDbV4TJ754GRjAGG
         brs29YmPcjklu1MZxu9HCLeSx0j/+CDBUQuMVhpiwmS0o9r/Pp5hCajf5rIoZBayyMQ0
         uKcw==
X-Forwarded-Encrypted: i=1; AKwUvBw8qu9inezHyZPe2lLvCcg7Lb5g0e1rp6PbVHEjD7ZjFP7g7CL7EELNDxRWHtgPggpmPqMkmoM0d8kBdejQ6mGi@lists.infradead.org
X-Gm-Message-State: AFuF++lYajcBmdLhpGefg9az3vrh59ohabKOseARcLYieUSx6PBopEeI
	6Ix3bnFaVAVn9im/bAgKT9YtOYfIpYeBzhI/o7eCBCPOO6wda4c+IDhg
X-Gm-Gg: AYBFou3i3GXWdtQxcS7L0S2lC8+R5JW6NK5ZNuMBf8WoCwgm/ZPPi/kUXmPIW4JrYmu
	UrCU9RhzqXDbbVdmbqcdzdoxQvQTFfW63ftKSCXD7YGQlyod961iktHpWmdHdfpiqTZJUcA3NxV
	0e+3hDrnoOZZntBE+U4G+SrROeWiM6FmqYYHfwmPT4kzCCiN1ZDnFW4cGqw/6Ag19wQl8qmKDd0
	/57Ow111rL41J/+lJ8w9W3lhYF51bxNvhTvs3uYKLWMowF3Mgh24hO11wfYsu2PMGZTBRuwbunJ
	gtFpRhpeN7bW+AXYN2owrJqsOBHArQMX78pUg9smCqPaD+BypdK4VMq0RAwwewWaeC7boT4+Knu
	MtDWzgJ/WhqRo7aL3rDQu3hI7CSPBUJSeDrCKLJyVcZV5iu9aZWhlU6rzZEYN8JwKCN5QDnW7Nd
	JKz2pPXgDQN2MgUFyS4oW9KEC/hQ7gNa4FOaUTOJOCkLsPlTLD7+JqqDAJziaPdgse6A==
X-Received: by 2002:a05:600c:348a:b0:49c:f13e:e4d with SMTP id 5b1f17b1804b1-49cf15a3672mr17202235e9.10.1788420709205;
        Thu, 03 Sep 2026 00:31:49 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce551bf7asm69369455e9.2.2026.09.03.00.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:31:48 -0700 (PDT)
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
Subject: [PATCH v4 3/3] gpio: mmio: track the direction of chips without direction registers
Date: Thu,  3 Sep 2026 09:31:43 +0200
Message-ID: <20260903073143.2068494-4-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260903073143.2068494-1-mehmet.fide@gmail.com>
References: <20260903073143.2068494-1-mehmet.fide@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_003155_487434_70223DE6 
X-CRM114-Status: GOOD (  18.73  )
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


