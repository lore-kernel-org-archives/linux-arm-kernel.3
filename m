Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35033D132A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 09:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FKcSD9zZKYeH9ORLe/NgLgE7fPIMQMERv18AMIjksTU=; b=KUkYLG1S0hwsBMhasujm1GnsfV
	Lk9c20eA7bxF6SfWhwCHIIq8l6ecNcbwig+CfzlxzjhWcSMaIsWcbUXECJcJnjR5mCZdBPymUcxNz
	OJtMEIhhNpY4iK2egXNk3rBGXs3zy3PJDF5xev5QOkm/SkTlVDNle5uoMicfi9UexCHRHAHLgcs16
	PMaiK4wHKb0uKuVkoLB4O2FDlKHQyu9ZW75MaehxXf99TvnPXY475hJCDdg2VIiBoL2KETBJNQYYJ
	a0Mus7FnclNZXE1I1JIj4mYotLXwlRzlRxg/pElXSV6djwqG9/lMt5gxIS1HjdusvkUFxKn5FyycQ
	gl03p6MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7tYv-0000000DBQZ-3mTC;
	Mon, 04 Nov 2024 09:39:53 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7tVW-0000000DAcy-24VA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 09:36:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730712982; x=1762248982;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nwoZv6RI/t7WIQO+Llzq3vqo716xkyZTrrmxMQ1Qo5A=;
  b=XTOinAKCF0sm8Q7mGXbztYkT/mypycJn/Qw1AxDCSSaUUeflCC4iV9I6
   95eRbyVGJSdTQNsFHw4vcMXLjWelHlEIUCRY4AEr+M16vpeRihzBJ7Yiz
   4GC/nV0tsSxYYu62/PVS6wj3whlE3zxEW848u039DJRPp2nlQC/B/oc5Z
   UGBGxIrn12VnVOhDuuETmyGyB+hdp9FT4d2bGCX/jOhpdYJ08d2fFXRLB
   7FrddnUGMnVS9l87Bl/gqSvIm3SLt2ttk8D9VMuwHNMDFM667NL0Yik8h
   V49k98Dc9mDuBDBJiXuVGVuadGRbKbGO8URl3+9qVLZhdSS0UZw6RhAgw
   Q==;
X-CSE-ConnectionGUID: d6JhbYQNR9urAPw79v/f7Q==
X-CSE-MsgGUID: tL4vuP+dRTuq59O0i6iYTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="30620070"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="30620070"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 01:36:19 -0800
X-CSE-ConnectionGUID: MYYv3+lJR1OEQqIJMobIIg==
X-CSE-MsgGUID: u/T5IgnnRf6ay5P0MC8VNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="83127054"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 04 Nov 2024 01:36:11 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 9F70B17D; Mon, 04 Nov 2024 11:36:10 +0200 (EET)
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
Subject: [PATCH v1 1/6] Input: gpio_keys - avoid using GPIOF_ACTIVE_LOW
Date: Mon,  4 Nov 2024 11:34:19 +0200
Message-ID: <20241104093609.156059-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com>
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_013622_606240_DC52A1EC 
X-CRM114-Status: GOOD (  13.51  )
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
 drivers/input/keyboard/gpio_keys.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
index 380fe8dab3b0..5eef66516e37 100644
--- a/drivers/input/keyboard/gpio_keys.c
+++ b/drivers/input/keyboard/gpio_keys.c
@@ -531,12 +531,7 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
 		 * Legacy GPIO number, so request the GPIO here and
 		 * convert it to descriptor.
 		 */
-		unsigned flags = GPIOF_IN;
-
-		if (button->active_low)
-			flags |= GPIOF_ACTIVE_LOW;
-
-		error = devm_gpio_request_one(dev, button->gpio, flags, desc);
+		error = devm_gpio_request_one(dev, button->gpio, GPIOF_IN, desc);
 		if (error < 0) {
 			dev_err(dev, "Failed to request GPIO %d, error %d\n",
 				button->gpio, error);
@@ -546,6 +541,9 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
 		bdata->gpiod = gpio_to_desc(button->gpio);
 		if (!bdata->gpiod)
 			return -EINVAL;
+
+		if (button->active_low ^ gpiod_is_active_low(bdata->gpiod))
+			gpiod_toggle_active_low(bdata->gpiod);
 	}
 
 	if (bdata->gpiod) {
-- 
2.43.0.rc1.1336.g36b5255a03ac


