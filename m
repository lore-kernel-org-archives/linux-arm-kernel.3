Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E932C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 18:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OEcu3ksvny1DyWHbLUrYF2+7n1lMryaW716e1NKmQ+I=; b=VfjxQTdWX3cO7L/mkTUAUInhqw
	loLvAAlmwbEfgSU798uxtYfdh2XciFMvIVqJ192/NHAatEAuXcy69MqObe6A0uDN76IGQXsX3XQZE
	DLZOi61/yzcb4jZDHS8BJaZ69nchnVByYpQbn8/lx84Weuzjm7lJqw5UFusVcNR4gAFnlc/qbpaR7
	F5y7f9N/Aoug2KI73ldaBCpQnLusft6nEq9vyM263lEcWP0QXJpXDrboSryZpUOGcXA3iEDbsfjdK
	oOfE+F4ESQiCcGKLH/1Gpam17Hr82ZggfTUfcbhWE4B3AgsBueWtUdh0Esw+44zcsBqCpGLSyBjFD
	hhXrONjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk4he-0000000FifK-0p9Q;
	Wed, 15 Jul 2026 18:51:30 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk4hZ-0000000Fibq-41ui
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 18:51:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784141486; x=1815677486;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c6hpNb2JXzDFRlDVnT3j7w6ZUzrfVzvezdxIsX1aXGo=;
  b=YSGxDaIE7mtp6u8iXVEffjIJClGOkKGJSs2Tm90BiUqjOkJj1cUF+lGT
   KQzv5fn7HNr7LoA4LXiYt75YF0RnnFOYx4ETL3S4++0qIjhDBJGDIRgBH
   AWi8iQDScebS5wIuoPsxo59MdSZfwh50y4uDQCUnFFIwo1CWuaifBjxJh
   GNWA0BIbTs9MN5QzAmAXFfkFFaS06aRK7xKnY4l8Y0jXBC2Bs67KmgKHd
   um03uPSb8BIdc+GdjMWwqH14iyK8zevXwmgYZFynZfSG48HGwpJCTDvdk
   i53MnSINfSaNWL7A6UsDivhGMRKmT2lwxGXln6lPJZp3s0wTJi6YeKAIt
   g==;
X-CSE-ConnectionGUID: 2SqLCrPLR+Gquk6g1I23dQ==
X-CSE-MsgGUID: wSlgdsNoR1OYM//5NJtEHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="96308592"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="96308592"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 11:51:26 -0700
X-CSE-ConnectionGUID: IBaGDHu7QKeuyExlv8l9Uw==
X-CSE-MsgGUID: 9Rn3eEowS7mtmEOv0en++Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="294491681"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 15 Jul 2026 11:51:21 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 1125CA2; Wed, 15 Jul 2026 20:51:16 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bradford Love <brad@nextdimension.cc>,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Russell King <linux@armlinux.org.uk>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v1 7/7] gpiolib: Get rid of not used anymore gpio_request_one()
Date: Wed, 15 Jul 2026 20:46:47 +0200
Message-ID: <20260715185112.1323510-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
References: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_115126_107232_C4CCB2E1 
X-CRM114-Status: GOOD (  15.42  )
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

No more users.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 Documentation/driver-api/gpio/consumer.rst |  2 +-
 drivers/gpio/gpiolib-legacy.c              | 31 ----------------------
 include/linux/gpio/legacy.h                |  8 ------
 3 files changed, 1 insertion(+), 40 deletions(-)

diff --git a/Documentation/driver-api/gpio/consumer.rst b/Documentation/driver-api/gpio/consumer.rst
index bb3366047fad..03edd9472f07 100644
--- a/Documentation/driver-api/gpio/consumer.rst
+++ b/Documentation/driver-api/gpio/consumer.rst
@@ -463,7 +463,7 @@ and vice-versa::
 The GPIO number returned by desc_to_gpio() can safely be used as a parameter of
 the gpio\_*() functions for as long as the GPIO descriptor `desc` is not freed.
 All the same, a GPIO number passed to gpio_to_desc() must first be properly
-acquired using e.g. gpio_request_one(), and the returned GPIO descriptor is only
+acquired using e.g. gpio_request(), and the returned GPIO descriptor is only
 considered valid until that GPIO number is released using gpio_free().
 
 Freeing a GPIO obtained by one API with the other API is forbidden and an
diff --git a/drivers/gpio/gpiolib-legacy.c b/drivers/gpio/gpiolib-legacy.c
index ef3f2ef30cf2..c2b04605b203 100644
--- a/drivers/gpio/gpiolib-legacy.c
+++ b/drivers/gpio/gpiolib-legacy.c
@@ -21,37 +21,6 @@ void gpio_free(unsigned gpio)
 }
 EXPORT_SYMBOL_GPL(gpio_free);
 
-/**
- * gpio_request_one - request a single GPIO with initial configuration
- * @gpio:	the GPIO number
- * @flags:	GPIO configuration as specified by GPIOF_*
- * @label:	a literal description string of this GPIO
- *
- * **DEPRECATED** This function is deprecated and must not be used in new code.
- *
- * Returns:
- * 0 on success, or negative errno on failure.
- */
-int gpio_request_one(unsigned gpio, unsigned long flags, const char *label)
-{
-	int err;
-
-	err = gpio_request(gpio, label);
-	if (err)
-		return err;
-
-	if (flags & GPIOF_IN)
-		err = gpio_direction_input(gpio);
-	else
-		err = gpio_direction_output(gpio, !!(flags & GPIOF_OUT_INIT_HIGH));
-
-	if (err)
-		gpio_free(gpio);
-
-	return err;
-}
-EXPORT_SYMBOL_GPL(gpio_request_one);
-
 /*
  * **DEPRECATED** This function is deprecated and must not be used in new code.
  */
diff --git a/include/linux/gpio/legacy.h b/include/linux/gpio/legacy.h
index 557ef635935e..d4273162ed13 100644
--- a/include/linux/gpio/legacy.h
+++ b/include/linux/gpio/legacy.h
@@ -82,8 +82,6 @@ static inline int gpio_to_irq(unsigned gpio)
 	return gpiod_to_irq(gpio_to_desc(gpio));
 }
 
-int gpio_request_one(unsigned gpio, unsigned long flags, const char *label);
-
 int devm_gpio_request_one(struct device *dev, unsigned gpio,
 			  unsigned long flags, const char *label);
 
@@ -104,12 +102,6 @@ static inline int gpio_request(unsigned gpio, const char *label)
 	return -ENOSYS;
 }
 
-static inline int gpio_request_one(unsigned gpio,
-					unsigned long flags, const char *label)
-{
-	return -ENOSYS;
-}
-
 static inline void gpio_free(unsigned gpio)
 {
 	might_sleep();
-- 
2.50.1


