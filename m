Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 759D3D132A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 09:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3C1H/+BNXSVUmkcZs3+qh1TzwiLattmombr4IOrsWN4=; b=lgDAIwVNHC/as94+o60w64xuZq
	vIoaZLCXb3TEX225xS1cKXbM6zT1VP7VsSmId5LhFiuxngrkkXVj5z1X3B29qKc7/h4KtLiyuGR6S
	ezKMYDAECqFBf9vqqIOg0q1L9gaJF8qH/P4CpVNTRUC9AlP93XzZ+3yXc8GWM+fohF3Nd+mZzmb2N
	5Vw/fvDl/llD66Fdvq9Nd97Iyo5P3NeyK1V0zF+VzqpjgX7foDDX7PAStQtu6ry3xitxpo8Lg0GeE
	tZVtuV9/M4cVhKB+bTFGbI3BsRFo5DQBRikpALQmE7MkmjtdEBaV5s9RiQdsRgey2/tDeaGHWWNO2
	csqGecMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7tfc-0000000DClm-138y;
	Mon, 04 Nov 2024 09:46:48 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7tVY-0000000DAcy-3Aiv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 09:36:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730712984; x=1762248984;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vZMtd1T590YnZLPRvMitwgFNTD+hNyBhf6P6IUabJ8s=;
  b=KGpRmAl8pl+DBl2o9QsdZ3MijTvr5+mCAqiewO3RiIFNJcnSDTnNYPly
   jcNsexOK8TUqoLRWN+7fkEQG/mwYEQTnGR6U1AmbGul8+QTbHSEbmA0Nl
   l4jdAPZaQzoz0MaJWvZN7NZQl7KuW7fENEYyAxHIxQdD57XvU5pDuKn2N
   2savxXY2uz+abdeQeVATA3ygbg6oZS+UAfFldXqmOq+/fX6nALIs7U64z
   xdhG6kcG2JvFfFgMt7PSTxbF0epMLJIuf61tmALyIiDsTCrmeXHBXfU1q
   6Jxj46M5ZVwwJgYId3hiT3jpTTTFA+MvQE7usdiQ28EL9OMQa92+V4FKr
   Q==;
X-CSE-ConnectionGUID: 344vjAd7RlWIbqtyjHG6zg==
X-CSE-MsgGUID: z8nqItyOTWmWITuMGNKBZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="30620081"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="30620081"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 01:36:20 -0800
X-CSE-ConnectionGUID: UCIDPEfhSVKAFG44XKPZtQ==
X-CSE-MsgGUID: 697U+mSATYmDf45+hbnpFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="83127055"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 04 Nov 2024 01:36:11 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id B69AC320; Mon, 04 Nov 2024 11:36:10 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Lee Jones <lee@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Pavel Machek <pavel@ucw.cz>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v1 3/6] leds: gpio: Avoid using GPIOF_ACTIVE_LOW
Date: Mon,  4 Nov 2024 11:34:21 +0200
Message-ID: <20241104093609.156059-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com>
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_013624_854194_C87CB127 
X-CRM114-Status: GOOD (  13.19  )
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

Avoid using GPIOF_ACTIVE_LOW as it's deprecated and subject to remove.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/leds/leds-gpio.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index 0d59b0bbc002..a3428b22de3a 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -212,7 +212,6 @@ static struct gpio_desc *gpio_led_get_gpiod(struct device *dev, int idx,
 					    const struct gpio_led *template)
 {
 	struct gpio_desc *gpiod;
-	unsigned long flags = GPIOF_OUT_INIT_LOW;
 	int ret;
 
 	/*
@@ -239,10 +238,7 @@ static struct gpio_desc *gpio_led_get_gpiod(struct device *dev, int idx,
 	if (!gpio_is_valid(template->gpio))
 		return ERR_PTR(-ENOENT);
 
-	if (template->active_low)
-		flags |= GPIOF_ACTIVE_LOW;
-
-	ret = devm_gpio_request_one(dev, template->gpio, flags,
+	ret = devm_gpio_request_one(dev, template->gpio, GPIOF_OUT_INIT_LOW,
 				    template->name);
 	if (ret < 0)
 		return ERR_PTR(ret);
@@ -251,6 +247,9 @@ static struct gpio_desc *gpio_led_get_gpiod(struct device *dev, int idx,
 	if (!gpiod)
 		return ERR_PTR(-EINVAL);
 
+	if (template->active_low ^ gpiod_is_active_low(gpiod))
+		gpiod_toggle_active_low(gpiod);
+
 	return gpiod;
 }
 
-- 
2.43.0.rc1.1336.g36b5255a03ac


