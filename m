Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3358AD132A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 09:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tJtJaZj33fuwEKIP13MQ2/iQsNSJg2DzS6bqrAC5H/8=; b=cKQH+pMrOdk81UPDLQprSgW3uD
	3IKutWkPpJdv1KZ1rA3gmBMsFLxrE7UG3csZtWB5EQlvudVbhV2mVMD+RgLvLZZldC9ahEzTwMtHZ
	jsHAEwyxjW1MFXU0f1NTpEA1FphkWH7gMyjqRyJWQd27zWmjbsBucWyKYZlKiXZMHrBNoYhJofflL
	J1Uvr4tFYQohg0CENgs9FHw1aBQVLJid7V4xKkm9axI7splj1EisGhgxgBkvhK5oPoiU+wDprp6yf
	pyJI8BvggA8o1sCZ9RTn6loojjTaC2Yi8j7ACvdpza5I23+uqTPwswQfuMtSizBjpzAIScM4fLIqR
	CipW1IvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7thH-0000000DD3l-2yd6;
	Mon, 04 Nov 2024 09:48:31 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7tVc-0000000DAcy-2OKZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 09:36:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730712988; x=1762248988;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Sc+eqveINCgjfeZ/XCA8LOsWGvrDOO3Z75MHxHV6gP0=;
  b=NIjCuRrCw8mWx+vnU2kLxDvjw0Fjv3mzOl2q7U9R0567jO9IB5ZJRQsQ
   tca2Ik25WLVG+SHc76zPeGzPyv+gUEoUhri6NHdwXcdKmS8w7kpgGT/iP
   FIa/Ig9Je6+HgmwKaGiKWJei6eY1LymeXhAnPRYwCNZS4VvvLPoUNXc8m
   5sk555m2VesQD4oicI6u/DJdVSWQZNnz0kD54gFxkmIybjc/xCR1wAhmN
   +8t8iYgOZy4ZqonrUHvfjfX0AqRNtOEqC5SdpMjUalAsohbKRCK9xQFtB
   2kDlZUgFRfHeHo13+YKykP0Ks4a2EOia9cXs6nFLw1KGawzQUACn3iIEN
   Q==;
X-CSE-ConnectionGUID: K72xv7xMRMi+AvwQaE/5Ig==
X-CSE-MsgGUID: MAlhuAdSSQupM0qSDmQHkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="30620096"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="30620096"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 01:36:21 -0800
X-CSE-ConnectionGUID: Ah+BKPYZTaqhFdk5MbXoWg==
X-CSE-MsgGUID: 7yc422SjSi6VFqbnsmzs9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="83127064"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 04 Nov 2024 01:36:16 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id D17216CE; Mon, 04 Nov 2024 11:36:10 +0200 (EET)
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
Subject: [PATCH v1 5/6] USB: gadget: pxa27x_udc: Avoid using GPIOF_ACTIVE_LOW
Date: Mon,  4 Nov 2024 11:34:23 +0200
Message-ID: <20241104093609.156059-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com>
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_013628_703667_160120F6 
X-CRM114-Status: GOOD (  13.29  )
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
 drivers/usb/gadget/udc/pxa27x_udc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/pxa27x_udc.c b/drivers/usb/gadget/udc/pxa27x_udc.c
index 7d3a8a5f3796..f9a55d4f189f 100644
--- a/drivers/usb/gadget/udc/pxa27x_udc.c
+++ b/drivers/usb/gadget/udc/pxa27x_udc.c
@@ -2355,18 +2355,19 @@ static int pxa_udc_probe(struct platform_device *pdev)
 	struct pxa_udc *udc = &memory;
 	int retval = 0, gpio;
 	struct pxa2xx_udc_mach_info *mach = dev_get_platdata(&pdev->dev);
-	unsigned long gpio_flags;
 
 	if (mach) {
-		gpio_flags = mach->gpio_pullup_inverted ? GPIOF_ACTIVE_LOW : 0;
 		gpio = mach->gpio_pullup;
 		if (gpio_is_valid(gpio)) {
 			retval = devm_gpio_request_one(&pdev->dev, gpio,
-						       gpio_flags,
+						       GPIOF_OUT_INIT_LOW,
 						       "USB D+ pullup");
 			if (retval)
 				return retval;
 			udc->gpiod = gpio_to_desc(mach->gpio_pullup);
+
+			if (mach->gpio_pullup_inverted ^ gpiod_is_active_low(udc->gpiod))
+				gpiod_toggle_active_low(udc->gpiod);
 		}
 		udc->udc_command = mach->udc_command;
 	} else {
-- 
2.43.0.rc1.1336.g36b5255a03ac


