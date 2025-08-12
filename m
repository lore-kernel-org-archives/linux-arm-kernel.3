Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ABC8C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 16:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/JXqL63qeFVdF/I9mGFbork5TN+ZaQ7aCD37gp/UqF0=; b=OE56to7rtua3wpRQAevGNeMK2I
	aHdlpHGnCD1XKOUEXi4LLzD6EOTlxib9B7HxCWGc5ytqsV8NyGlZ/tmNP1bFP4ZnKMO+uH34Oru9i
	UfB8GLG0DFIY6vs3qgCqy5h51aYpd18hckeLql4R03z4hPP+y9hxVqDrMoALO14lgzxpA4nR8gskz
	ACY20LyjE8tGJBLgAqfiDkO6VJmik+AozTmpMIwqSHlz7GeX9TXEQXP5iLCou/9RZiVXZRidURVBd
	1jF3w5lyi8ds3qheBPUTdbpId4OogudAkHxqgbwZcH/lIS0gu7yU3FoBMRWSSmed45sesSFaqbU3N
	f5LikqdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrlN-0000000BMVk-17h9;
	Tue, 12 Aug 2025 16:22:13 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulnsG-0000000Af3q-07K8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 12:13:05 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-45a0dc77a15so10539015e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 05:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755000783; x=1755605583; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/JXqL63qeFVdF/I9mGFbork5TN+ZaQ7aCD37gp/UqF0=;
        b=nDxz2oIxb0ukEwx+ZINyjGTIyiHw2/7qdNkPxRc24Rc7XeYjR8HKEddonIANVj82jY
         d6vGeEdbsQu0xeoY7gPTrKmkWHgz68u2WnXFqn0LSVczP2z7wvJ6r3FFCA5mPOfvflbY
         ycj4Cej/kPDJpsP4Ho42pmQLS+cq9nwBBrk8KdiUPjTnypLEn+kn+XwGX28qcvXX633E
         k/le/Dr/aSzkxJMK7jkxJqvDjYb7seMu1jHrkThqK1xHmbdQhZx3rbs/4PRJkrigug01
         VvU8yuDbynrU4pFMQfBjTIWMu5E+d+oNSwYaFDkR+M1/Jtl7goRisa7YwMpB0IguJ/x4
         t8VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755000783; x=1755605583;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/JXqL63qeFVdF/I9mGFbork5TN+ZaQ7aCD37gp/UqF0=;
        b=WNs0jZARKO+awea7l0C2G7hCrT4qj7IYdIVpgTYPn9nWOSfyjnLqQQP5jJ6zmbEXvC
         WbZKSs5DAhbAOrjxZ6z2dCn07I5Pih2D93ko2PEts1WoDVWyKvrxqfj+4w9KGLt6TrS1
         2GOWXL6F20NS5HtB5eqWxhajYOZLprua2V9pqHoYcuJR2GeeOIIgnsg1Wi+XV9umVj5j
         Tf7tknA3j7nus8qrsioOPd2YVxSGRyEZcWv8seHYutG5/7X3OV0xmmaCRIwxZTA3KlLl
         KA73OBvjzwsiAy3UImrgMR9PLzUdxbOmzYbveutnqTNIooGHMD62MruiYLkxymrVfXvV
         Vbtw==
X-Forwarded-Encrypted: i=1; AJvYcCXWC08rTiwgXuPW0KM82DNQwkh3IVE2LVrSG3qIIzpn6NdAW/VXkCG8JumCC0D1BZxzCZ0v7mpgHXmuWFC4jgSv@lists.infradead.org
X-Gm-Message-State: AOJu0YyRelVrDeLmFSpzynrWYEG0nb56MXBetH2IiC74DMSNH2Edh8FD
	EdUfzsNPrbUuPYZJJrQsUfym+lywkSCdq0WAEjwMjnzq0tDP6mwEvJrxavitTLNUYjE=
X-Gm-Gg: ASbGncvSk6Odwf/e46vBWFBUTY3E8H6+rNEuhOYrXllNzRJkR1fg84jQ90p8PQrlfQ/
	EEl9vCLWKQHLM6gmCLRaTEqBuCthDYsixbTf33utB3Mmcb30qMfnT1zhio1RmX6zMeAjiNw9hTX
	dQR2r7EBWB8Ena1klyvzwL13WVnQErcDGAQlebF4eHHFS0rZXM3RU10Fcvh0hcsUmWf1iXYPQl6
	Es//WI+hwhIo2tnEvzdRtNd4LE2QMqsRjruh4xTTNjxHtJLYHPvaYRcbU6kzKrBeNDJ17NU1+CJ
	UyFB0Tlma08A7SCdBSQmzrYtoUZlUjQ3XYX7DtteE8+RS2xYXjwwkyp6IzekVU00s/VEKbguuD/
	gr0zEKxYFJlcWStw=
X-Google-Smtp-Source: AGHT+IFCYSd3Po4+XCgGW5jHPNIoyljuwRSni53VHCwjwdUP7QVtuCEaq249i8u2GW/NoKXFHK/u+w==
X-Received: by 2002:a05:600c:46d1:b0:455:f380:32e2 with SMTP id 5b1f17b1804b1-45a10c00677mr34160085e9.18.1755000782670;
        Tue, 12 Aug 2025 05:13:02 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e6867193sm298878535e9.6.2025.08.12.05.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 05:13:01 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 14:12:52 +0200
Subject: [PATCH RESEND 10/14] gpio: amdpt: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-gpio-mmio-gpio-conv-v1-10-aac41d656979@linaro.org>
References: <20250812-gpio-mmio-gpio-conv-v1-0-aac41d656979@linaro.org>
In-Reply-To: <20250812-gpio-mmio-gpio-conv-v1-0-aac41d656979@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Hoan Tran <hoan@os.amperecomputing.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, Yang Shen <shenyang39@huawei.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4007;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=J+TT9XjbJJKbjE77nqgtMEqiO3qZwqcbYA98JKh3zw8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomy/BELGF8WeZdyE8Hb//8DlU41prWqZVK+ZHx
 SzPK2xIFM2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsvwQAKCRARpy6gFHHX
 cjErD/9odeqgoWXMsX2plGrfcpj1RQRBtlsnb9eFQkWpAVjcW1hoCl4XAfvVDQmzRV0j8FjesqV
 EV3vPblsndq9BdJoGUSt8PPNWxdGwu8d7tI+RNqqlBpBop0y1tdWa3Ucm9KYYEY8l+CFlReGW3e
 pFPpXTdH4cxSYWrTWxtzS0chesSyWIU63ZOFixhjI2iHsv12Sato+vmcVjXLVZ1Eu0acgjzwxYK
 Wjyz008T6Tch9NfqM9hxx0DHzTPnD+YB1+IiCLjyNiZZ/pO1HeImB5T2ZsX1r6HHJ8TXLMtXroh
 sXsYaprSVJYsPnRYUc5rJfXkHiAAWQVD7DrVxC51JSZRKkOYFxgs4TaV4kc9ojCFjjf6OXSWQ+p
 qnqFsSNrStWXiEdrf36V6em8VFWMdiqGQski900NPGD1RFRf+V+Eof5+d2pkwubi7U1WpLNwnG1
 Gov2a5U8f3chK6lZVsz/E43l1iExRjhH+B7yuSrOKn0iW//hBvI3S7hZ0qmPmoT7qd8TApPS5VI
 R45U0wm+HUY+ADxLILCUZu4nlXSdLkad0hamI6rVOd/jv6nra/pjfkwMaGNvgfgKJCb8Vbyh+24
 4fH+tQSsqzr3dxNjWIpNdEl6Nw6WB4sKyVgXXkUzenkLTxILNHAd+CydMfJa8pW6eZbU8SgLnLb
 +WSik3H2GcYxE9Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_051304_087444_E4B285DC 
X-CRM114-Status: GOOD (  16.61  )
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
 drivers/gpio/gpio-amdpt.c | 44 +++++++++++++++++++++++---------------------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/drivers/gpio/gpio-amdpt.c b/drivers/gpio/gpio-amdpt.c
index b70036587d9c3f64bb73ed3b94e1c14f249c9e21..0a9b870705b90bdc9bdab93ce5a4a33ebdafccc6 100644
--- a/drivers/gpio/gpio-amdpt.c
+++ b/drivers/gpio/gpio-amdpt.c
@@ -9,6 +9,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/spinlock.h>
 #include <linux/acpi.h>
 #include <linux/platform_device.h>
@@ -24,54 +25,50 @@
 #define PT_SYNC_REG        0x28
 
 struct pt_gpio_chip {
-	struct gpio_chip         gc;
+	struct gpio_generic_chip chip;
 	void __iomem             *reg_base;
 };
 
 static int pt_gpio_request(struct gpio_chip *gc, unsigned offset)
 {
+	struct gpio_generic_chip *gen_gc = to_gpio_generic_chip(gc);
 	struct pt_gpio_chip *pt_gpio = gpiochip_get_data(gc);
-	unsigned long flags;
 	u32 using_pins;
 
 	dev_dbg(gc->parent, "pt_gpio_request offset=%x\n", offset);
 
-	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
+	guard(gpio_generic_lock_irqsave)(gen_gc);
 
 	using_pins = readl(pt_gpio->reg_base + PT_SYNC_REG);
 	if (using_pins & BIT(offset)) {
 		dev_warn(gc->parent, "PT GPIO pin %x reconfigured\n",
 			 offset);
-		raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
 		return -EINVAL;
 	}
 
 	writel(using_pins | BIT(offset), pt_gpio->reg_base + PT_SYNC_REG);
 
-	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
-
 	return 0;
 }
 
 static void pt_gpio_free(struct gpio_chip *gc, unsigned offset)
 {
+	struct gpio_generic_chip *gen_gc = to_gpio_generic_chip(gc);
 	struct pt_gpio_chip *pt_gpio = gpiochip_get_data(gc);
-	unsigned long flags;
 	u32 using_pins;
 
-	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
+	guard(gpio_generic_lock_irqsave)(gen_gc);
 
 	using_pins = readl(pt_gpio->reg_base + PT_SYNC_REG);
 	using_pins &= ~BIT(offset);
 	writel(using_pins, pt_gpio->reg_base + PT_SYNC_REG);
 
-	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
-
 	dev_dbg(gc->parent, "pt_gpio_free offset=%x\n", offset);
 }
 
 static int pt_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	struct device *dev = &pdev->dev;
 	struct pt_gpio_chip *pt_gpio;
 	int ret = 0;
@@ -91,22 +88,27 @@ static int pt_gpio_probe(struct platform_device *pdev)
 		return PTR_ERR(pt_gpio->reg_base);
 	}
 
-	ret = bgpio_init(&pt_gpio->gc, dev, 4,
-			 pt_gpio->reg_base + PT_INPUTDATA_REG,
-			 pt_gpio->reg_base + PT_OUTPUTDATA_REG, NULL,
-			 pt_gpio->reg_base + PT_DIRECTION_REG, NULL,
-			 BGPIOF_READ_OUTPUT_REG_SET);
+	config = (typeof(config)){
+		.dev = dev,
+		.sz = 4,
+		.dat = pt_gpio->reg_base + PT_INPUTDATA_REG,
+		.set = pt_gpio->reg_base + PT_OUTPUTDATA_REG,
+		.dirout = pt_gpio->reg_base + PT_DIRECTION_REG,
+		.flags = BGPIOF_READ_OUTPUT_REG_SET,
+	};
+
+	ret = gpio_generic_chip_init(&pt_gpio->chip, &config);
 	if (ret) {
-		dev_err(dev, "bgpio_init failed\n");
+		dev_err(dev, "failed to initialize the generic GPIO chip\n");
 		return ret;
 	}
 
-	pt_gpio->gc.owner            = THIS_MODULE;
-	pt_gpio->gc.request          = pt_gpio_request;
-	pt_gpio->gc.free             = pt_gpio_free;
-	pt_gpio->gc.ngpio            = (uintptr_t)device_get_match_data(dev);
+	pt_gpio->chip.gc.owner = THIS_MODULE;
+	pt_gpio->chip.gc.request = pt_gpio_request;
+	pt_gpio->chip.gc.free = pt_gpio_free;
+	pt_gpio->chip.gc.ngpio = (uintptr_t)device_get_match_data(dev);
 
-	ret = devm_gpiochip_add_data(dev, &pt_gpio->gc, pt_gpio);
+	ret = devm_gpiochip_add_data(dev, &pt_gpio->chip.gc, pt_gpio);
 	if (ret) {
 		dev_err(dev, "Failed to register GPIO lib\n");
 		return ret;

-- 
2.48.1


