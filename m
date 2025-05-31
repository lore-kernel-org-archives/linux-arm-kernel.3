Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22FEEC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 May 2025 21:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=krH6rZIwIAJe3KwhDtsikRR5D0WJcxtSgZS4GWSwIyA=; b=tD3m5QAJJ5Hd7cqIvbyVJDOiWK
	aul5uPeI4+7RX9Ru2w0w3TWJva1K7gEbUZczEt2VW0B5BHcd2Xb/S4zQmZUA2vwIYZM88xY4p0MDW
	xwEx9bygMfCq09cQ5ykOONGr+LnKyD1/t8t7VaijMMYycXR6BXM7PLpefwvMaLeLzLUGC9ONNOzn8
	Xg60q4uzthesNoVL1S4PW+H1Tc0YT/wBOYT9TIdI5fTI/vmf7o4IWYEUq+vd59AZ/hm8qv2qqsybg
	dwj2TRtPJ5wXxRGejI+Vmsw6q/rKusNjZsJybyQDLzlPajAeWU3b91fk+RR0WCXDpcRrEGCwqVjLq
	VwMK6iCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLTkP-00000004TwD-3vqt;
	Sat, 31 May 2025 21:28:09 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLTg9-00000004ScI-1Wf7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 May 2025 21:23:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748726625; x=1780262625;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=y122ltxUGKIzJOFeENdMTmUh/wFoa8nCfcCmKphjWq0=;
  b=UmXnC0X5V9YQsGP+icUpvg+EG2rL7R+KlsqY86mQe7BSdb6yft/zs3x7
   YHRCxxEPmSEywDXI1paqQUwI95i8AHGCm+yB/KXTcmvOMnWF3mMK6OhOq
   o9QSCBaXLdQpFQysf1ijmzjANXVJjHnfoizMTwkjje/+oMAwUUO0z2Lon
   rG+g5pIBYIOfWe8GYRZufjcZY6eqeLTSqtswjLyA5P2DisFKZMh75jZsV
   jbvtE0rky/1jKt6MwvhWj9a2z8LAswLLu1pTDbrvL2xNMzU6U22fJIa41
   OqVnyAVm+TCHBEuSOmBQYpeJvtkYJYFoah19Wmm92ZZwsJFaVcadl3fQQ
   A==;
X-CSE-ConnectionGUID: QZ8jwakdQESGJ3TLdK2cHQ==
X-CSE-MsgGUID: Adoq0s2XTb6LCS3edyc3Eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="50888695"
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600"; 
   d="scan'208";a="50888695"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2025 14:23:40 -0700
X-CSE-ConnectionGUID: JpjkgCHwTOS5zMHoRV4AmA==
X-CSE-MsgGUID: UovtZcQkTSKC9JT6DzCvjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600"; 
   d="scan'208";a="144161859"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 31 May 2025 14:23:36 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 781FF2E5; Sun, 01 Jun 2025 00:23:35 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v1 2/2] gpiolib: Remove unused devm_gpio_request()
Date: Sun,  1 Jun 2025 00:21:39 +0300
Message-ID: <20250531212331.3635269-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250531212331.3635269-1-andriy.shevchenko@linux.intel.com>
References: <20250531212331.3635269-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250531_142345_419959_D7196538 
X-CRM114-Status: GOOD (  14.31  )
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

No users.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 .../driver-api/driver-model/devres.rst        |  1 -
 drivers/gpio/gpiolib-legacy.c                 | 38 -------------------
 include/linux/gpio.h                          |  8 ----
 3 files changed, 47 deletions(-)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index 3d56f94ac2ee..2b36ebde9cec 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -275,7 +275,6 @@ GPIO
   devm_gpiod_put()
   devm_gpiod_unhinge()
   devm_gpiochip_add_data()
-  devm_gpio_request()
   devm_gpio_request_one()
 
 I2C
diff --git a/drivers/gpio/gpiolib-legacy.c b/drivers/gpio/gpiolib-legacy.c
index aeae6df8bec9..3bc93ccadb5b 100644
--- a/drivers/gpio/gpiolib-legacy.c
+++ b/drivers/gpio/gpiolib-legacy.c
@@ -85,44 +85,6 @@ static void devm_gpio_release(struct device *dev, void *res)
 	gpio_free(*gpio);
 }
 
-/**
- * devm_gpio_request - request a GPIO for a managed device
- * @dev: device to request the GPIO for
- * @gpio: GPIO to allocate
- * @label: the name of the requested GPIO
- *
- * Except for the extra @dev argument, this function takes the
- * same arguments and performs the same function as gpio_request().
- * GPIOs requested with this function will be automatically freed
- * on driver detach.
- *
- * **DEPRECATED** This function is deprecated and must not be used in new code.
- *
- * Returns:
- * 0 on success, or negative errno on failure.
- */
-int devm_gpio_request(struct device *dev, unsigned gpio, const char *label)
-{
-	unsigned *dr;
-	int rc;
-
-	dr = devres_alloc(devm_gpio_release, sizeof(unsigned), GFP_KERNEL);
-	if (!dr)
-		return -ENOMEM;
-
-	rc = gpio_request(gpio, label);
-	if (rc) {
-		devres_free(dr);
-		return rc;
-	}
-
-	*dr = gpio;
-	devres_add(dev, dr);
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(devm_gpio_request);
-
 /**
  * devm_gpio_request_one - request a single GPIO with initial setup
  * @dev: device to request for
diff --git a/include/linux/gpio.h b/include/linux/gpio.h
index d105a207eaa2..ff99ed76fdc3 100644
--- a/include/linux/gpio.h
+++ b/include/linux/gpio.h
@@ -85,7 +85,6 @@ static inline int gpio_to_irq(unsigned gpio)
 
 int gpio_request_one(unsigned gpio, unsigned long flags, const char *label);
 
-int devm_gpio_request(struct device *dev, unsigned gpio, const char *label);
 int devm_gpio_request_one(struct device *dev, unsigned gpio,
 			  unsigned long flags, const char *label);
 
@@ -163,13 +162,6 @@ static inline int gpio_to_irq(unsigned gpio)
 	return -EINVAL;
 }
 
-static inline int devm_gpio_request(struct device *dev, unsigned gpio,
-				    const char *label)
-{
-	WARN_ON(1);
-	return -EINVAL;
-}
-
 static inline int devm_gpio_request_one(struct device *dev, unsigned gpio,
 					unsigned long flags, const char *label)
 {
-- 
2.47.2


