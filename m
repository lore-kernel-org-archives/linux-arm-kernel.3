Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A774CCD194
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 09:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ebccT5r9h4sq1EAbS6O1Ek+KohRKJ8knZkMvNsBsVEk=; b=WfStLeJr1WoqHXeWf2ofS9rrcq
	JutRM+ipXZmcvnM82e0+VJrbj6cqohSva5upYQvaywBbG8aoeMOCP7ghEeQMWhQJhurJAj1AqoDHg
	MNBYJ9Za7blraOwBTspuWxY5dSy4AahV+/A2jlH6dJeFOjpk2ioEdIxUT06/SHVIj5NrGXkDIZ3lS
	Io3GSgjPLQQqaRsqrwGbiqdZHr+af+EK18XK+pvAQtPoZIeqF0nYuIwktjiTQGtfz1zD2SWWf9TN7
	UyO3EEeBMWWc3y47esvIjE49UHMXdkykdVSbzzzOK1ja4Cvfx21Zf0rWgxshSXE1NhqcMwhDWjPDA
	48DuC+7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9JzR-000000047d7-1qUl;
	Thu, 16 Oct 2025 09:09:41 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9JzN-000000047af-1QiL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 09:09:38 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-47112a73785so2831625e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 02:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1760605775; x=1761210575; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ebccT5r9h4sq1EAbS6O1Ek+KohRKJ8knZkMvNsBsVEk=;
        b=wW8cmwDWAldoul8ztku+jJTLZqW1o4zlRgGFvSO8q3mfI4wzYmWOhU+kIrYGYjIog8
         EwWWbJTkAN/Qkgt6kNXiiIVIAmVi3eWETudNjuCjdO+UPjTEWipTNqRzQftZgPIrdrch
         Cc9XEVsrarqaWuKLc+6Taj0ZuWUsRnNGsutodhYF+8qDjBS+JUYPCeNKdjsVp5NfKRpt
         cnmUc4oPF7Cy4iGyOzF3z+FLrArvYbxd8eN/x60KEadG2GGnihGLzp5vpbXKYWyfoXHM
         8i7CKEg3gxBMczrzNanLk/mR4thfIi6OQ79/Wgvx2BdYYnAyx61+LMQUvnI5DROECdTm
         Q3AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760605775; x=1761210575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ebccT5r9h4sq1EAbS6O1Ek+KohRKJ8knZkMvNsBsVEk=;
        b=GFtt07r7JfVe/A4uG/maGD+66pi/8lE2sWTugjTR8FGa3bP9dHFIy0JUGRvNr/lf1j
         b07YLdT0GeGHkLYJlrqYa+OpIV8bWRUn5DABvgVhXVzBoBBzs6EuUwH3vx2CgWbhQbJZ
         JmgGosKKP2bqQ6o+BFwBliY52dXTstza5M/QTVam1Gl2wpfBCXdB+3PbvrsBS2YGG3Wf
         7EXeBcvPWYf0OHVbAgxjzUKX6wOImmlRBch/X4glsiEVCYvcr0syHfPpih1t+KPMmqR+
         Y3j32OYxGODAo50IPs1/yKoffQO2B/mtAvuPN1hCTbiMHkXfmROnc4I8Z2V51o2FcJR6
         VS/g==
X-Forwarded-Encrypted: i=1; AJvYcCUbXHzQbM2zNB+MOpjx6lNMHTVFQLAy49Q/wiW5CUfS7Ad3ckmHe13aEPPWpXBkRqA5Lc/RJv273GozumjKOT3W@lists.infradead.org
X-Gm-Message-State: AOJu0YzMjnZbRQySQxfrNeH+YNZzMFT0UoeAwxPuNRLyhKAeffRfj10+
	20vZYB3X6iVwvEz5GNqvw6VJYHpIC/4CiTHrwg0A/XoqFNIludm8n+QapLH+D0ZnfJ8=
X-Gm-Gg: ASbGncsDmK7Da+Atj1fVnkDhOVwEazEUTvcqA0sPZyJ4glvJBaX6He8db4Y6UnfPKpw
	MaKBwsZByc4sQcpMsk06naFRSasiU4gJ2CIefdkgrj7LRR/BcdeXbRtjFuu8gGmeQpyntHmLHLL
	A3z33YSSJlQlEe9TaEbBEqDjFp/wy1gL3SFcHluvej8rmSP/VEbWS1Gbixa1lMPYK+3x7ywD5M4
	2sRwK3t7YT9ez55MFW8dyOeVFUxqTD6BTBhbPC8T3E6SHRStGEFLqoYBBE+Ad/4a10C3GTgYHWf
	uXgwoagx5JXd/v1i1br/75mQbiSBOG9P72wXJBSxMkztuWm5ei4aDBUnZF/ouT0qNt8j5JEGjQZ
	VtE+Q7cHzgq777pBhMD9entrSNxuwSytpWx5BIjACtsbpZsym1iTp7MEg5sGNEKuACQ9UDEWscW
	O6d0xMmw==
X-Google-Smtp-Source: AGHT+IGQWhJUQbEP0NTPgkhtlw8FdiW4eMaK0Bf9Bh/NjUF+7IvZdvR6YnB8KB0HK3aO5FvT+g1kUQ==
X-Received: by 2002:a05:600c:1c05:b0:471:76f:80ed with SMTP id 5b1f17b1804b1-471076f8254mr34145545e9.41.1760605775254;
        Thu, 16 Oct 2025 02:09:35 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ef97:57cb:86cb:f7c4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5e1284sm33191287f8f.45.2025.10.16.02.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 02:09:33 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 16 Oct 2025 11:09:25 +0200
Subject: [PATCH 1/3] gpio: rename gpio_chip_hwgpio() to gpiod_hwgpio()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-aspeed-gpiolib-include-v1-1-31201c06d124@linaro.org>
References: <20251016-aspeed-gpiolib-include-v1-0-31201c06d124@linaro.org>
In-Reply-To: <20251016-aspeed-gpiolib-include-v1-0-31201c06d124@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=14609;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=64M7sLqUbn9pZ/yukdGpDmm71CMp76vrBJe0uDRLaTM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo8LZLxyONPB2juU6q5oTOECN2z+qXL78iHsCt1
 N3bWmf7HKiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaPC2SwAKCRARpy6gFHHX
 cjyPEADingMEcy6pJSkb+z75ZNh4X4JbbO/7F0AFxfUKr+GO2WDzJNyAua/AF1BUjR2hYdSu7LY
 Ojo7i/46BTTF66ffu0OdO5zj6ds3yNWVUtaDrj/R6Bw4hE+wOWqDocTOSVBg2GzBTnkz7BDL1L3
 iJj2kKIbxel3uot+BS7jwCOamMFfJh8hA6HmrLE8yxx1ZP73CRelhLgObXO5Duy2toYnhOg0m/Q
 tT0h63UqVB8V2IaCBFSXdAlA+yVHDE4beK3TtNAix8hxEDaPTVWRpfVpWAY60+vXsW9u2QHenHT
 qJGYmbi7ApQAI5d/Y1qcy8rarOl4juQs+Y7E90W5dnoOyLdMiMm+xDEUPysZrSv7x/bG3WqRzr8
 FjTqCLKZwhwrivO960UrXAi+PsjT4MZ4ZTkc4K6AxO1Uk96wtdhP3hVp3cf4VJY7XM3iaoxKAAr
 +8cbeYl/Fm5Myo0PzXNcJZ7E7aPOps19U9ohKcdYAkqUosa7uJsRJBYUSKv6aWy/NN80Zxuax8O
 MA00NDIkOtPi+eFppwA47NT8r9F1+c1H48uLUxvZVbjWf5gLMFfBINtBkzJQfpNh513178VHndL
 /WmgnD5SDcheCODHvOeEN/owyzPv63dStBv9SX3BQv8ZiGurBnwBUfhCLENoeaMhjuZOSICJSE3
 kcwL8RaJDSaqXBA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_020937_534099_7E73857C 
X-CRM114-Status: GOOD (  23.83  )
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

This function takes a GPIO descriptor as first argument. Make its naming
consistent with the rest of the GPIO codebase and use the gpiod_ prefix.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-aspeed.c   |  6 +++---
 drivers/gpio/gpiolib-cdev.c  | 12 ++++++------
 drivers/gpio/gpiolib-sysfs.c | 14 +++++++-------
 drivers/gpio/gpiolib.c       | 46 ++++++++++++++++++++++----------------------
 drivers/gpio/gpiolib.h       |  2 +-
 5 files changed, 40 insertions(+), 40 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 7953a9c4e36d7550bda5206aa42f4309ea7f3150..3da37a0fda3fbdcb8077c07706aa41b233e9beeb 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -24,7 +24,7 @@
 
 /*
  * These two headers aren't meant to be used by GPIO drivers. We need
- * them in order to access gpio_chip_hwgpio() which we need to implement
+ * them in order to access gpiod_hwgpio() which we need to implement
  * the aspeed specific API which allows the coprocessor to request
  * access to some GPIOs and to arbitrate between coprocessor and ARM.
  */
@@ -942,7 +942,7 @@ int aspeed_gpio_copro_grab_gpio(struct gpio_desc *desc,
 {
 	struct gpio_chip *chip = gpiod_to_chip(desc);
 	struct aspeed_gpio *gpio = gpiochip_get_data(chip);
-	int rc = 0, bindex, offset = gpio_chip_hwgpio(desc);
+	int rc = 0, bindex, offset = gpiod_hwgpio(desc);
 	const struct aspeed_gpio_bank *bank = to_bank(offset);
 
 	if (!aspeed_gpio_support_copro(gpio))
@@ -987,7 +987,7 @@ int aspeed_gpio_copro_release_gpio(struct gpio_desc *desc)
 {
 	struct gpio_chip *chip = gpiod_to_chip(desc);
 	struct aspeed_gpio *gpio = gpiochip_get_data(chip);
-	int rc = 0, bindex, offset = gpio_chip_hwgpio(desc);
+	int rc = 0, bindex, offset = gpiod_hwgpio(desc);
 
 	if (!aspeed_gpio_support_copro(gpio))
 		return -EOPNOTSUPP;
diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index ddc452b5ee23a2be99fc2798cd1d55403a625099..ed064e6f268c78c123bb655ddf1bf6592531574b 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -676,7 +676,7 @@ static enum hte_return process_hw_ts_thread(void *p)
 	}
 	le.line_seqno = line->line_seqno;
 	le.seqno = (lr->num_lines == 1) ? le.line_seqno : line->req_seqno;
-	le.offset = gpio_chip_hwgpio(line->desc);
+	le.offset = gpiod_hwgpio(line->desc);
 
 	linereq_put_event(lr, &le);
 
@@ -793,7 +793,7 @@ static irqreturn_t edge_irq_thread(int irq, void *p)
 	line->line_seqno++;
 	le.line_seqno = line->line_seqno;
 	le.seqno = (lr->num_lines == 1) ? le.line_seqno : line->req_seqno;
-	le.offset = gpio_chip_hwgpio(line->desc);
+	le.offset = gpiod_hwgpio(line->desc);
 
 	linereq_put_event(lr, &le);
 
@@ -891,7 +891,7 @@ static void debounce_work_func(struct work_struct *work)
 
 	lr = line->req;
 	le.timestamp_ns = line_event_timestamp(line);
-	le.offset = gpio_chip_hwgpio(line->desc);
+	le.offset = gpiod_hwgpio(line->desc);
 #ifdef CONFIG_HTE
 	if (edflags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_HTE) {
 		/* discard events except the last one */
@@ -1591,7 +1591,7 @@ static void linereq_show_fdinfo(struct seq_file *out, struct file *file)
 
 	for (i = 0; i < lr->num_lines; i++)
 		seq_printf(out, "gpio-line:\t%d\n",
-			   gpio_chip_hwgpio(lr->lines[i].desc));
+			   gpiod_hwgpio(lr->lines[i].desc));
 }
 #endif
 
@@ -2244,7 +2244,7 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 		return;
 
 	memset(info, 0, sizeof(*info));
-	info->offset = gpio_chip_hwgpio(desc);
+	info->offset = gpiod_hwgpio(desc);
 
 	if (desc->name)
 		strscpy(info->name, desc->name, sizeof(info->name));
@@ -2549,7 +2549,7 @@ static int lineinfo_changed_notify(struct notifier_block *nb,
 	struct lineinfo_changed_ctx *ctx;
 	struct gpio_desc *desc = data;
 
-	if (!test_bit(gpio_chip_hwgpio(desc), cdev->watched_lines))
+	if (!test_bit(gpiod_hwgpio(desc), cdev->watched_lines))
 		return NOTIFY_DONE;
 
 	/*
diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 7d5fc1ea2aa54fce0c7c884b53d16ad1278c4612..cd553acf3055eddfc8e8ab2fa592c815ee24a459 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -244,7 +244,7 @@ static int gpio_sysfs_request_irq(struct gpiod_data *data, unsigned char flags)
 	 * Remove this redundant call (along with the corresponding unlock)
 	 * when those drivers have been fixed.
 	 */
-	ret = gpiochip_lock_as_irq(guard.gc, gpio_chip_hwgpio(desc));
+	ret = gpiochip_lock_as_irq(guard.gc, gpiod_hwgpio(desc));
 	if (ret < 0)
 		goto err_clr_bits;
 
@@ -258,7 +258,7 @@ static int gpio_sysfs_request_irq(struct gpiod_data *data, unsigned char flags)
 	return 0;
 
 err_unlock:
-	gpiochip_unlock_as_irq(guard.gc, gpio_chip_hwgpio(desc));
+	gpiochip_unlock_as_irq(guard.gc, gpiod_hwgpio(desc));
 err_clr_bits:
 	clear_bit(GPIOD_FLAG_EDGE_RISING, &desc->flags);
 	clear_bit(GPIOD_FLAG_EDGE_FALLING, &desc->flags);
@@ -280,7 +280,7 @@ static void gpio_sysfs_free_irq(struct gpiod_data *data)
 
 	data->irq_flags = 0;
 	free_irq(data->irq, data);
-	gpiochip_unlock_as_irq(guard.gc, gpio_chip_hwgpio(desc));
+	gpiochip_unlock_as_irq(guard.gc, gpiod_hwgpio(desc));
 	clear_bit(GPIOD_FLAG_EDGE_RISING, &desc->flags);
 	clear_bit(GPIOD_FLAG_EDGE_FALLING, &desc->flags);
 }
@@ -478,10 +478,10 @@ static int export_gpio_desc(struct gpio_desc *desc)
 	if (!guard.gc)
 		return -ENODEV;
 
-	offset = gpio_chip_hwgpio(desc);
+	offset = gpiod_hwgpio(desc);
 	if (!gpiochip_line_is_valid(guard.gc, offset)) {
 		pr_debug_ratelimited("%s: GPIO %d masked\n", __func__,
-				     gpio_chip_hwgpio(desc));
+				     gpiod_hwgpio(desc));
 		return -EINVAL;
 	}
 
@@ -823,7 +823,7 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 	}
 
 	desc_data->chip_attr_group.name = kasprintf(GFP_KERNEL, "gpio%u",
-						    gpio_chip_hwgpio(desc));
+						    gpiod_hwgpio(desc));
 	if (!desc_data->chip_attr_group.name) {
 		status = -ENOMEM;
 		goto err_put_dirent;
@@ -843,7 +843,7 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 	if (status)
 		goto err_free_name;
 
-	path = kasprintf(GFP_KERNEL, "gpio%u/value", gpio_chip_hwgpio(desc));
+	path = kasprintf(GFP_KERNEL, "gpio%u/value", gpiod_hwgpio(desc));
 	if (!path) {
 		status = -ENOMEM;
 		goto err_remove_groups;
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index ba5df8a233fe75e16bae615f7f7c8591066c056e..5a450dac8f3acea3e381b09767b9fe9c9dadc2f7 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -443,7 +443,7 @@ int gpiod_get_direction(struct gpio_desc *desc)
 	if (!guard.gc)
 		return -ENODEV;
 
-	offset = gpio_chip_hwgpio(desc);
+	offset = gpiod_hwgpio(desc);
 	flags = READ_ONCE(desc->flags);
 
 	/*
@@ -2446,7 +2446,7 @@ static int gpiod_request_commit(struct gpio_desc *desc, const char *label)
 	if (test_and_set_bit(GPIOD_FLAG_REQUESTED, &desc->flags))
 		return -EBUSY;
 
-	offset = gpio_chip_hwgpio(desc);
+	offset = gpiod_hwgpio(desc);
 	if (!gpiochip_line_is_valid(guard.gc, offset))
 		return -EINVAL;
 
@@ -2508,7 +2508,7 @@ static void gpiod_free_commit(struct gpio_desc *desc)
 
 	if (guard.gc && test_bit(GPIOD_FLAG_REQUESTED, &flags)) {
 		if (guard.gc->free)
-			guard.gc->free(guard.gc, gpio_chip_hwgpio(desc));
+			guard.gc->free(guard.gc, gpiod_hwgpio(desc));
 
 		clear_bit(GPIOD_FLAG_ACTIVE_LOW, &flags);
 		clear_bit(GPIOD_FLAG_REQUESTED, &flags);
@@ -2668,7 +2668,7 @@ int gpio_do_set_config(struct gpio_desc *desc, unsigned long config)
 	if (!guard.gc->set_config)
 		return -ENOTSUPP;
 
-	ret = guard.gc->set_config(guard.gc, gpio_chip_hwgpio(desc), config);
+	ret = guard.gc->set_config(guard.gc, gpiod_hwgpio(desc), config);
 	if (ret > 0)
 		ret = -EBADE;
 
@@ -2699,7 +2699,7 @@ static int gpio_set_config_with_argument_optional(struct gpio_desc *desc,
 						  u32 argument)
 {
 	struct device *dev = &desc->gdev->dev;
-	int gpio = gpio_chip_hwgpio(desc);
+	int gpio = gpiod_hwgpio(desc);
 	int ret;
 
 	ret = gpio_set_config_with_argument(desc, mode, argument);
@@ -2862,9 +2862,9 @@ int gpiod_direction_input_nonotify(struct gpio_desc *desc)
 	 */
 	if (guard.gc->direction_input) {
 		ret = gpiochip_direction_input(guard.gc,
-					       gpio_chip_hwgpio(desc));
+					       gpiod_hwgpio(desc));
 	} else if (guard.gc->get_direction) {
-		dir = gpiochip_get_direction(guard.gc, gpio_chip_hwgpio(desc));
+		dir = gpiochip_get_direction(guard.gc, gpiod_hwgpio(desc));
 		if (dir < 0)
 			return dir;
 
@@ -2923,12 +2923,12 @@ static int gpiod_direction_output_raw_commit(struct gpio_desc *desc, int value)
 
 	if (guard.gc->direction_output) {
 		ret = gpiochip_direction_output(guard.gc,
-						gpio_chip_hwgpio(desc), val);
+						gpiod_hwgpio(desc), val);
 	} else {
 		/* Check that we are in output mode if we can */
 		if (guard.gc->get_direction) {
 			dir = gpiochip_get_direction(guard.gc,
-						     gpio_chip_hwgpio(desc));
+						     gpiod_hwgpio(desc));
 			if (dir < 0)
 				return dir;
 
@@ -2943,7 +2943,7 @@ static int gpiod_direction_output_raw_commit(struct gpio_desc *desc, int value)
 		 * If we can't actively set the direction, we are some
 		 * output-only chip, so just drive the output as desired.
 		 */
-		ret = gpiochip_set(guard.gc, gpio_chip_hwgpio(desc), val);
+		ret = gpiochip_set(guard.gc, gpiod_hwgpio(desc), val);
 		if (ret)
 			return ret;
 	}
@@ -3094,7 +3094,7 @@ int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags)
 	}
 
 	ret = guard.gc->en_hw_timestamp(guard.gc,
-					gpio_chip_hwgpio(desc), flags);
+					gpiod_hwgpio(desc), flags);
 	if (ret)
 		gpiod_warn(desc, "%s: hw ts request failed\n", __func__);
 
@@ -3126,7 +3126,7 @@ int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags)
 		return -ENOTSUPP;
 	}
 
-	ret = guard.gc->dis_hw_timestamp(guard.gc, gpio_chip_hwgpio(desc),
+	ret = guard.gc->dis_hw_timestamp(guard.gc, gpiod_hwgpio(desc),
 					 flags);
 	if (ret)
 		gpiod_warn(desc, "%s: hw ts release failed\n", __func__);
@@ -3257,7 +3257,7 @@ static int gpiochip_get(struct gpio_chip *gc, unsigned int offset)
 
 static int gpio_chip_get_value(struct gpio_chip *gc, const struct gpio_desc *desc)
 {
-	return gc->get ? gpiochip_get(gc, gpio_chip_hwgpio(desc)) : -EIO;
+	return gc->get ? gpiochip_get(gc, gpiod_hwgpio(desc)) : -EIO;
 }
 
 /* I/O calls are only valid after configuration completed; the relevant
@@ -3417,7 +3417,7 @@ int gpiod_get_array_value_complex(bool raw, bool can_sleep,
 		first = i;
 		do {
 			const struct gpio_desc *desc = desc_array[i];
-			int hwgpio = gpio_chip_hwgpio(desc);
+			int hwgpio = gpiod_hwgpio(desc);
 
 			__set_bit(hwgpio, mask);
 			i++;
@@ -3439,7 +3439,7 @@ int gpiod_get_array_value_complex(bool raw, bool can_sleep,
 
 		for (j = first; j < i; ) {
 			const struct gpio_desc *desc = desc_array[j];
-			int hwgpio = gpio_chip_hwgpio(desc);
+			int hwgpio = gpiod_hwgpio(desc);
 			int value = test_bit(hwgpio, bits);
 
 			if (!raw && test_bit(GPIOD_FLAG_ACTIVE_LOW, &desc->flags))
@@ -3576,7 +3576,7 @@ EXPORT_SYMBOL_GPL(gpiod_get_array_value);
  */
 static int gpio_set_open_drain_value_commit(struct gpio_desc *desc, bool value)
 {
-	int ret = 0, offset = gpio_chip_hwgpio(desc);
+	int ret = 0, offset = gpiod_hwgpio(desc);
 
 	CLASS(gpio_chip_guard, guard)(desc);
 	if (!guard.gc)
@@ -3605,7 +3605,7 @@ static int gpio_set_open_drain_value_commit(struct gpio_desc *desc, bool value)
  */
 static int gpio_set_open_source_value_commit(struct gpio_desc *desc, bool value)
 {
-	int ret = 0, offset = gpio_chip_hwgpio(desc);
+	int ret = 0, offset = gpiod_hwgpio(desc);
 
 	CLASS(gpio_chip_guard, guard)(desc);
 	if (!guard.gc)
@@ -3637,7 +3637,7 @@ static int gpiod_set_raw_value_commit(struct gpio_desc *desc, bool value)
 		return -ENODEV;
 
 	trace_gpio_value(desc_to_gpio(desc), 0, value);
-	return gpiochip_set(guard.gc, gpio_chip_hwgpio(desc), value);
+	return gpiochip_set(guard.gc, gpiod_hwgpio(desc), value);
 }
 
 /*
@@ -3760,7 +3760,7 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
 
 		do {
 			struct gpio_desc *desc = desc_array[i];
-			int hwgpio = gpio_chip_hwgpio(desc);
+			int hwgpio = gpiod_hwgpio(desc);
 			int value = test_bit(i, value_bitmap);
 
 			if (unlikely(!test_bit(GPIOD_FLAG_IS_OUT, &desc->flags)))
@@ -4000,7 +4000,7 @@ int gpiod_to_irq(const struct gpio_desc *desc)
 	if (!gc)
 		return -ENODEV;
 
-	offset = gpio_chip_hwgpio(desc);
+	offset = gpiod_hwgpio(desc);
 	if (gc->to_irq) {
 		ret = gc->to_irq(gc, offset);
 		if (ret)
@@ -4957,7 +4957,7 @@ int gpiod_hog(struct gpio_desc *desc, const char *name,
 	if (test_and_set_bit(GPIOD_FLAG_IS_HOGGED, &desc->flags))
 		return 0;
 
-	hwnum = gpio_chip_hwgpio(desc);
+	hwnum = gpiod_hwgpio(desc);
 
 	local_desc = gpiochip_request_own_desc(guard.gc, hwnum, name,
 					       lflags, dflags);
@@ -5038,7 +5038,7 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 		 * If pin hardware number of array member 0 is also 0, select
 		 * its chip as a candidate for fast bitmap processing path.
 		 */
-		if (descs->ndescs == 0 && gpio_chip_hwgpio(desc) == 0) {
+		if (descs->ndescs == 0 && gpiod_hwgpio(desc) == 0) {
 			struct gpio_descs *array;
 
 			bitmap_size = BITS_TO_LONGS(gdev->ngpio > count ?
@@ -5083,7 +5083,7 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 		 * Detect array members which belong to the 'fast' chip
 		 * but their pins are not in hardware order.
 		 */
-		else if (gpio_chip_hwgpio(desc) != descs->ndescs) {
+		else if (gpiod_hwgpio(desc) != descs->ndescs) {
 			/*
 			 * Don't use fast path if all array members processed so
 			 * far belong to the same chip as this one but its pin
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index b4c5369f8a3314244424d0c90ba006f7568b314e..62d4c15b74f580273412e6d432ab306a2d2fe682 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -276,7 +276,7 @@ const char *gpiod_get_label(struct gpio_desc *desc);
 /*
  * Return the GPIO number of the passed descriptor relative to its chip
  */
-static inline int gpio_chip_hwgpio(const struct gpio_desc *desc)
+static inline int gpiod_hwgpio(const struct gpio_desc *desc)
 {
 	return desc - &desc->gdev->descs[0];
 }

-- 
2.48.1


