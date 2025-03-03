Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D09C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 13:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lfos9Syg08SqOn+//RWYzG2n1+EfVqjsyXohmBPCw+w=; b=x97BuB/b2dZTPhpXuqNt1M9Omv
	iT2aSieGKKlFgCuTNrF8iBNtA9WKarIDUk2cw60KOKEEwGgpgSFSO8MvrLClvlc/uaiBUrRl9X4pn
	dS9XiQ//dxQzxQYV/21Rk+I4sKKXSTsRxA7hqbaN6fbTvqsqwjhg7+78SUETTPq1WxlIYsuVhTJyP
	ArUpCSNd1F2akeVh+vBh0yH9iLSZmYLaMeXzu8fHq1PhpOpOJ5+yN1UpPgkMdio+oYV1NcYgde7WC
	LIjE34C4luOVZXq8pKvCmvDPUPn9ksoh3uL855Cjlaj1zH62tmuulC5ZWucgOuBdGHzExuAimMF7D
	4qO4SYIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp62y-00000000xlW-3zza;
	Mon, 03 Mar 2025 13:41:28 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5h6-00000000sce-3Hd6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 13:18:53 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso46809375e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 05:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741007931; x=1741612731; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lfos9Syg08SqOn+//RWYzG2n1+EfVqjsyXohmBPCw+w=;
        b=WGZwVX+mYTYnLJ/3snWQdjo8GJWTY81uR59NKx6ZepshTC01Cja2rC8qb5EbJUiN3l
         b7o3azy6TlYQQXS/DFbaEmhoEJcuiYNJcs0wIQsYdFrxIb3aKnBm7pzGRx5zQwsHtlXg
         Ee9IdehraO9LYaa/JdrdzLz7DjmuynbMb2DJuczez99x2gW2W7s2GYqeEFyWydV+ZIzT
         Y8of6Z/lL8KRodH8VydPqWSi8UTAEzgXCDaESzY4vRxGsxG61xQEFiyWq1SDc/Z9K+Jx
         35yA/DJ9XcYz+oz7RZJyxnccYrTpScFVHWacrej3n7UrRgpcWTOqfo87d3AcfgSVveKI
         MapA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741007931; x=1741612731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lfos9Syg08SqOn+//RWYzG2n1+EfVqjsyXohmBPCw+w=;
        b=TmjeU2yfOzCZ6gfvZaIN/IeHkUhoPPsV+MwScSRuVyQTsXAeg+8bmuHN2/dSGOAZj7
         TxwhBVhIYXDHYEGjriq61BE+GWgY0vmUzqk+r5rf0exDqqSUKNq+Nj7uht8cDsI+XiEN
         JFKvcWtvul+f4N76mbqZ4Qbqd+O6zWYcAQVE4x0ktSjwBEpFJmVTCQl+t99DMG5PquXh
         TEItqQVm+DQD0KtNBwlRzWcO+Sy8/qZW6sh/OEqTeHae4/v5QGRoTKq8PPTsEol2cfCS
         eWZYtRnz6u+ZvlIFaPI2Gs9aYEjBfbIhNi6I31fdbOEyEgzMpXB/DEUPYWL7aGw0zZ6D
         JIjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUP2rIPweTaywmeUKdjvtCO1kLWRE0AETA4wlgztZJtvk2Tkf/0+rxMyvlxoF6Tbl5819NUutKpSNM5oSn0rtAm@lists.infradead.org
X-Gm-Message-State: AOJu0YyxqUH8gMrxlC7MuyoeLvhJVuf0Wa59oq1KYSrbAa5V51uksJlH
	sG7sQh1WeOepP+FNoXHUgZUVsIKwQgyaH2cefgbrm4IGh/dNIrotxdNrIj9mDUI=
X-Gm-Gg: ASbGncssdfL6bTA8R9rx4OjhNU4XNT2+sl8UZ9ANI+OeCz1Retd+VruAsT/hdUGxuwF
	NQiVVd3xl0NtDLyzgpt2LSzj5Wb4Q6Ux5TybZU9RzbWYozOhqtfYINUMrnOK9PxEgxeALeBw4nd
	GadAkHJYNfzX8Y+HwmB5bsMH6C30M4y0r1iLbrFcTGbur+YL8AzkAmLmj80epNt8TTqF44xlCGt
	55bB+NpjS98lRV2vJMSrHvl9uEGXTjFL5Yn9dUvfDKt7IiBYFkRKJV7SKl6shNOGxr7Yq8QJvPD
	M1Y2x0Z6Bychq/JQxyijuAOvHTqxI6Fu1aPIBw==
X-Google-Smtp-Source: AGHT+IHXK2frQu5mm5st7OG50mDUgW+ZqOAgaKWtdnfNsGdx2IIR5+MeX+T68WRmGU9N2Zhz+vD07w==
X-Received: by 2002:a05:600c:45cc:b0:439:9ee1:86bf with SMTP id 5b1f17b1804b1-43ba7c9b8e2mr134577995e9.7.1741007931114;
        Mon, 03 Mar 2025 05:18:51 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:664a:9e92:6aa8:6007])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba538b9fsm194821915e9.17.2025.03.03.05.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 05:18:50 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 03 Mar 2025 14:18:37 +0100
Subject: [PATCH 12/15] gpio: aspeed: use lock guards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-gpiochip-set-conversion-v1-12-1d5cceeebf8b@linaro.org>
References: <20250303-gpiochip-set-conversion-v1-0-1d5cceeebf8b@linaro.org>
In-Reply-To: <20250303-gpiochip-set-conversion-v1-0-1d5cceeebf8b@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mun Yew Tham <mun.yew.tham@intel.com>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pwm@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=10512;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=6Biyqx/oPiy1u29C0+kNxd6YeuL0GXYE5IHU8R6GPkQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnxawre/nLb8HZ9vCTWG9HgoFrpXBkyMmO3uPg+
 DkbCvt+1bmJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ8WsKwAKCRARpy6gFHHX
 ct7sD/9yKqknbydRuHgo09mRDQLljVd2RW0HD61Q3y+e/L/B6cyQnjzZKT5uGJ+v6h4lgQv+iXU
 ka+2zeotaUUZDupvz+c5QV5Z7LA8/PWAP3O7uVp9pdDlIJ9GsdOQg9KbFeQZsTOfhMKXfQTt6PY
 z0o7Fa+2lJh1TS+J24HnpMcUWXqI1Nu1N3tBj9XiBcJspKwP0iDeP3a2KjMUw3cNX+EPK7a47J3
 Snyjbs5wm8baI0fqmEyKL4pt1rZZ5mWecGL4VVpLMLZiCBTrIa+LgvxNGHkL+gKevzXYUnoYKR3
 tZKeMyE69KAyE/ZOB1tvR5UmGrw7vjpuPJMpcG4eAIIJswazrvDydIqT4M43TPIevqtqhgQg/YE
 6vp6cHKqSigeHfJcLF+msUCUvTtjmSKGBGp0LupdS+uPASKA/O/cfZx4v5tIeG2nPSnQZZl6tqR
 SIJHEXkhxoclh99WGXVu0GM2vsR9nl22pgPSYkKIwUzKV2epGnm+RVZZYhddELQ3fVhplnYWUnK
 s6bz7bNOSah0XlLT3p4hQp5s/jkOPlPszWSIJcnxeh5Q05zwmcgbdo4MF2vZBX0iaeCd4y+NI9X
 c6vgDAzA8oJ1o3lkJ5HWlhwdW/fj54pLrh+XXHSZ+a05AcdBd1vi1UyJ5kHAKf8jITmDJdjkq45
 NxSkq37b/jMxB8Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_051852_835784_7048DFD6 
X-CRM114-Status: GOOD (  16.55  )
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

Reduce the code complexity by using automatic lock guards with the raw
spinlock.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-aspeed.c | 101 +++++++++++++++++----------------------------
 1 file changed, 38 insertions(+), 63 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 40c1bd80f8b0..e2535aad1026 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -5,6 +5,7 @@
  * Joel Stanley <joel@jms.id.au>
  */
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/gpio/aspeed.h>
 #include <linux/gpio/driver.h>
@@ -427,37 +428,33 @@ static void aspeed_gpio_set(struct gpio_chip *gc, unsigned int offset,
 			    int val)
 {
 	struct aspeed_gpio *gpio = gpiochip_get_data(gc);
-	unsigned long flags;
 	bool copro = false;
 
-	raw_spin_lock_irqsave(&gpio->lock, flags);
+	guard(raw_spinlock_irqsave)(&gpio->lock);
+
 	copro = aspeed_gpio_copro_request(gpio, offset);
 
 	__aspeed_gpio_set(gc, offset, val);
 
 	if (copro)
 		aspeed_gpio_copro_release(gpio, offset);
-	raw_spin_unlock_irqrestore(&gpio->lock, flags);
 }
 
 static int aspeed_gpio_dir_in(struct gpio_chip *gc, unsigned int offset)
 {
 	struct aspeed_gpio *gpio = gpiochip_get_data(gc);
-	unsigned long flags;
 	bool copro = false;
 
 	if (!have_input(gpio, offset))
 		return -ENOTSUPP;
 
-	raw_spin_lock_irqsave(&gpio->lock, flags);
+	guard(raw_spinlock_irqsave)(&gpio->lock);
 
 	copro = aspeed_gpio_copro_request(gpio, offset);
 	gpio->config->llops->reg_bit_set(gpio, offset, reg_dir, 0);
 	if (copro)
 		aspeed_gpio_copro_release(gpio, offset);
 
-	raw_spin_unlock_irqrestore(&gpio->lock, flags);
-
 	return 0;
 }
 
@@ -465,13 +462,12 @@ static int aspeed_gpio_dir_out(struct gpio_chip *gc,
 			       unsigned int offset, int val)
 {
 	struct aspeed_gpio *gpio = gpiochip_get_data(gc);
-	unsigned long flags;
 	bool copro = false;
 
 	if (!have_output(gpio, offset))
 		return -ENOTSUPP;
 
-	raw_spin_lock_irqsave(&gpio->lock, flags);
+	guard(raw_spinlock_irqsave)(&gpio->lock);
 
 	copro = aspeed_gpio_copro_request(gpio, offset);
 	__aspeed_gpio_set(gc, offset, val);
@@ -479,7 +475,6 @@ static int aspeed_gpio_dir_out(struct gpio_chip *gc,
 
 	if (copro)
 		aspeed_gpio_copro_release(gpio, offset);
-	raw_spin_unlock_irqrestore(&gpio->lock, flags);
 
 	return 0;
 }
@@ -487,7 +482,6 @@ static int aspeed_gpio_dir_out(struct gpio_chip *gc,
 static int aspeed_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
 {
 	struct aspeed_gpio *gpio = gpiochip_get_data(gc);
-	unsigned long flags;
 	u32 val;
 
 	if (!have_input(gpio, offset))
@@ -496,12 +490,10 @@ static int aspeed_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
 	if (!have_output(gpio, offset))
 		return GPIO_LINE_DIRECTION_IN;
 
-	raw_spin_lock_irqsave(&gpio->lock, flags);
+	guard(raw_spinlock_irqsave)(&gpio->lock);
 
 	val = gpio->config->llops->reg_bit_get(gpio, offset, reg_dir);
 
-	raw_spin_unlock_irqrestore(&gpio->lock, flags);
-
 	return val ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
 }
 
@@ -527,7 +519,6 @@ static inline int irqd_to_aspeed_gpio_data(struct irq_data *d,
 static void aspeed_gpio_irq_ack(struct irq_data *d)
 {
 	struct aspeed_gpio *gpio;
-	unsigned long flags;
 	int rc, offset;
 	bool copro = false;
 
@@ -535,20 +526,19 @@ static void aspeed_gpio_irq_ack(struct irq_data *d)
 	if (rc)
 		return;
 
-	raw_spin_lock_irqsave(&gpio->lock, flags);
+	guard(raw_spinlock_irqsave)(&gpio->lock);
+
 	copro = aspeed_gpio_copro_request(gpio, offset);
 
 	gpio->config->llops->reg_bit_set(gpio, offset, reg_irq_status, 1);
 
 	if (copro)
 		aspeed_gpio_copro_release(gpio, offset);
-	raw_spin_unlock_irqrestore(&gpio->lock, flags);
 }
 
 static void aspeed_gpio_irq_set_mask(struct irq_data *d, bool set)
 {
 	struct aspeed_gpio *gpio;
-	unsigned long flags;
 	int rc, offset;
 	bool copro = false;
 
@@ -560,14 +550,14 @@ static void aspeed_gpio_irq_set_mask(struct irq_data *d, bool set)
 	if (set)
 		gpiochip_enable_irq(&gpio->chip, irqd_to_hwirq(d));
 
-	raw_spin_lock_irqsave(&gpio->lock, flags);
+	guard(raw_spinlock_irqsave)(&gpio->lock);
+
 	copro = aspeed_gpio_copro_request(gpio, offset);
 
 	gpio->config->llops->reg_bit_set(gpio, offset, reg_irq_enable, set);
 
 	if (copro)
 		aspeed_gpio_copro_release(gpio, offset);
-	raw_spin_unlock_irqrestore(&gpio->lock, flags);
 
 	/* Masking the IRQ */
 	if (!set)
@@ -591,7 +581,6 @@ static int aspeed_gpio_set_type(struct irq_data *d, unsigned int type)
 	u32 type2 = 0;
 	irq_flow_handler_t handler;
 	struct aspeed_gpio *gpio;
-	unsigned long flags;
 	int rc, offset;
 	bool copro = false;
 
@@ -620,16 +609,19 @@ static int aspeed_gpio_set_type(struct irq_data *d, unsigned int type)
 		return -EINVAL;
 	}
 
-	raw_spin_lock_irqsave(&gpio->lock, flags);
-	copro = aspeed_gpio_copro_request(gpio, offset);
+	scoped_guard(raw_spinlock_irqsave, &gpio->lock) {
+		copro = aspeed_gpio_copro_request(gpio, offset);
 
-	gpio->config->llops->reg_bit_set(gpio, offset, reg_irq_type0, type0);
-	gpio->config->llops->reg_bit_set(gpio, offset, reg_irq_type1, type1);
-	gpio->config->llops->reg_bit_set(gpio, offset, reg_irq_type2, type2);
+		gpio->config->llops->reg_bit_set(gpio, offset, reg_irq_type0,
+						 type0);
+		gpio->config->llops->reg_bit_set(gpio, offset, reg_irq_type1,
+						 type1);
+		gpio->config->llops->reg_bit_set(gpio, offset, reg_irq_type2,
+						 type2);
 
-	if (copro)
-		aspeed_gpio_copro_release(gpio, offset);
-	raw_spin_unlock_irqrestore(&gpio->lock, flags);
+		if (copro)
+			aspeed_gpio_copro_release(gpio, offset);
+	}
 
 	irq_set_handler_locked(d, handler);
 
@@ -686,17 +678,16 @@ static int aspeed_gpio_reset_tolerance(struct gpio_chip *chip,
 					unsigned int offset, bool enable)
 {
 	struct aspeed_gpio *gpio = gpiochip_get_data(chip);
-	unsigned long flags;
 	bool copro = false;
 
-	raw_spin_lock_irqsave(&gpio->lock, flags);
+	guard(raw_spinlock_irqsave)(&gpio->lock);
+
 	copro = aspeed_gpio_copro_request(gpio, offset);
 
 	gpio->config->llops->reg_bit_set(gpio, offset, reg_tolerance, enable);
 
 	if (copro)
 		aspeed_gpio_copro_release(gpio, offset);
-	raw_spin_unlock_irqrestore(&gpio->lock, flags);
 
 	return 0;
 }
@@ -798,7 +789,6 @@ static int enable_debounce(struct gpio_chip *chip, unsigned int offset,
 {
 	struct aspeed_gpio *gpio = gpiochip_get_data(chip);
 	u32 requested_cycles;
-	unsigned long flags;
 	int rc;
 	int i;
 
@@ -812,12 +802,12 @@ static int enable_debounce(struct gpio_chip *chip, unsigned int offset,
 		return rc;
 	}
 
-	raw_spin_lock_irqsave(&gpio->lock, flags);
+	guard(raw_spinlock_irqsave)(&gpio->lock);
 
 	if (timer_allocation_registered(gpio, offset)) {
 		rc = unregister_allocated_timer(gpio, offset);
 		if (rc < 0)
-			goto out;
+			return rc;
 	}
 
 	/* Try to find a timer already configured for the debounce period */
@@ -855,7 +845,7 @@ static int enable_debounce(struct gpio_chip *chip, unsigned int offset,
 			 * consistency.
 			 */
 			configure_timer(gpio, offset, 0);
-			goto out;
+			return rc;
 		}
 
 		i = j;
@@ -863,34 +853,26 @@ static int enable_debounce(struct gpio_chip *chip, unsigned int offset,
 		iowrite32(requested_cycles, gpio->base + gpio->config->debounce_timers_array[i]);
 	}
 
-	if (WARN(i == 0, "Cannot register index of disabled timer\n")) {
-		rc = -EINVAL;
-		goto out;
-	}
+	if (WARN(i == 0, "Cannot register index of disabled timer\n"))
+		return -EINVAL;
 
 	register_allocated_timer(gpio, offset, i);
 	configure_timer(gpio, offset, i);
 
-out:
-	raw_spin_unlock_irqrestore(&gpio->lock, flags);
-
 	return rc;
 }
 
 static int disable_debounce(struct gpio_chip *chip, unsigned int offset)
 {
 	struct aspeed_gpio *gpio = gpiochip_get_data(chip);
-	unsigned long flags;
 	int rc;
 
-	raw_spin_lock_irqsave(&gpio->lock, flags);
+	guard(raw_spinlock_irqsave)(&gpio->lock);
 
 	rc = unregister_allocated_timer(gpio, offset);
 	if (!rc)
 		configure_timer(gpio, offset, 0);
 
-	raw_spin_unlock_irqrestore(&gpio->lock, flags);
-
 	return rc;
 }
 
@@ -961,7 +943,6 @@ int aspeed_gpio_copro_grab_gpio(struct gpio_desc *desc,
 	struct aspeed_gpio *gpio = gpiochip_get_data(chip);
 	int rc = 0, bindex, offset = gpio_chip_hwgpio(desc);
 	const struct aspeed_gpio_bank *bank = to_bank(offset);
-	unsigned long flags;
 
 	if (!aspeed_gpio_support_copro(gpio))
 		return -EOPNOTSUPP;
@@ -974,13 +955,12 @@ int aspeed_gpio_copro_grab_gpio(struct gpio_desc *desc,
 		return -EINVAL;
 	bindex = offset >> 3;
 
-	raw_spin_lock_irqsave(&gpio->lock, flags);
+	guard(raw_spinlock_irqsave)(&gpio->lock);
 
 	/* Sanity check, this shouldn't happen */
-	if (gpio->cf_copro_bankmap[bindex] == 0xff) {
-		rc = -EIO;
-		goto bail;
-	}
+	if (gpio->cf_copro_bankmap[bindex] == 0xff)
+		return -EIO;
+
 	gpio->cf_copro_bankmap[bindex]++;
 
 	/* Switch command source */
@@ -994,8 +974,6 @@ int aspeed_gpio_copro_grab_gpio(struct gpio_desc *desc,
 		*dreg_offset = bank->rdata_reg;
 	if (bit)
 		*bit = GPIO_OFFSET(offset);
- bail:
-	raw_spin_unlock_irqrestore(&gpio->lock, flags);
 	return rc;
 }
 EXPORT_SYMBOL_GPL(aspeed_gpio_copro_grab_gpio);
@@ -1009,7 +987,6 @@ int aspeed_gpio_copro_release_gpio(struct gpio_desc *desc)
 	struct gpio_chip *chip = gpiod_to_chip(desc);
 	struct aspeed_gpio *gpio = gpiochip_get_data(chip);
 	int rc = 0, bindex, offset = gpio_chip_hwgpio(desc);
-	unsigned long flags;
 
 	if (!aspeed_gpio_support_copro(gpio))
 		return -EOPNOTSUPP;
@@ -1021,21 +998,19 @@ int aspeed_gpio_copro_release_gpio(struct gpio_desc *desc)
 		return -EINVAL;
 	bindex = offset >> 3;
 
-	raw_spin_lock_irqsave(&gpio->lock, flags);
+	guard(raw_spinlock_irqsave)(&gpio->lock);
 
 	/* Sanity check, this shouldn't happen */
-	if (gpio->cf_copro_bankmap[bindex] == 0) {
-		rc = -EIO;
-		goto bail;
-	}
+	if (gpio->cf_copro_bankmap[bindex] == 0)
+		return -EIO;
+
 	gpio->cf_copro_bankmap[bindex]--;
 
 	/* Switch command source */
 	if (gpio->cf_copro_bankmap[bindex] == 0)
 		aspeed_gpio_change_cmd_source(gpio, offset,
 					      GPIO_CMDSRC_ARM);
- bail:
-	raw_spin_unlock_irqrestore(&gpio->lock, flags);
+
 	return rc;
 }
 EXPORT_SYMBOL_GPL(aspeed_gpio_copro_release_gpio);

-- 
2.45.2


