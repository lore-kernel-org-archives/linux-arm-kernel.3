Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC7DD132A3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 09:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rcCCpdajBQF8xi6YFQ/DmuBvJodcMHHoGXyQHYsxAUc=; b=MaEay5u0Kw1B2azyWDY8HNNOqT
	gfj22+LNlO+n29uX3Lb1ELE02BVSrdrxVHekO97HVBp+B9YNIuCoJjxIJfFtpZ7quCKNdIH4QV5Jq
	KL5rn81h/Fy7onBjUP1LJGEypeKFPkanKRzugU7Ws2qoRc5q7PWrUP6wiuUqSUaLnQNCfKSQ1U+2q
	GpBTIrZuTOAF6CLopTg6PYuhl6WR6KmTQrU3ziSrBHpu4TNb0A/J1vJFt2wJt9p8rXXHToCT074h6
	23r3cY2QQGx+MCbqVwEe2o1tm3SXaCFFVQ9IElgnZOdCyhMeA8Ii1jqiDrpRwbRRHuZtJKs+lAHtQ
	dXMKlnuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7tdu-0000000DCGK-1z40;
	Mon, 04 Nov 2024 09:45:02 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7tVY-0000000DAeu-1RTN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 09:36:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730712984; x=1762248984;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hwe/b3t0fRSiOwM5LgSXyqtmSdkws0uscP6ALDCp0/s=;
  b=VBNxBBSPKijF6iDPKAyzEaxIJhPF5TWbNhsaCskENv+jKuxGZvJxBWYz
   UWofYTVnincdxZfNgny1EuPb6jc+26/vFCyGrl6IipFQ45VyqImMy0/Mc
   dlljBcP1psvncXP/1FwJRT1C3vloedJGPZTCOQlds/9QpFxUyycGQ5K7y
   5RtzPcMmG8DXWayMVjwroLjQcYMc3Sn9YmyXjAfLUnwUTwiVoufuxgHIO
   4ETGzwBHeQIHlEAkluZa/OlTy19iwxgzVEOMdjRVhHW1nNPG7VNve5AsX
   15U1r+VOF3WRx0vRu24wW1eVnFa0xsOvyGk8M3IPrNIUZ/uIcjV81PoCu
   w==;
X-CSE-ConnectionGUID: RpoGRNxKTxOg9Zd11w0TPA==
X-CSE-MsgGUID: Po7SoBAhSPqpbodlpBsJow==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="30278784"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="30278784"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 01:36:21 -0800
X-CSE-ConnectionGUID: s9rewHwKS8eXCZpHso+clw==
X-CSE-MsgGUID: nJ4vzYBeTXunQESoKPaApw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="83481194"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa009.jf.intel.com with ESMTP; 04 Nov 2024 01:36:17 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id DEBD7740; Mon, 04 Nov 2024 11:36:10 +0200 (EET)
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
Subject: [PATCH v1 6/6] gpio: Get rid of GPIOF_ACTIVE_LOW
Date: Mon,  4 Nov 2024 11:34:24 +0200
Message-ID: <20241104093609.156059-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com>
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_013624_708945_96675B33 
X-CRM114-Status: GOOD (  11.16  )
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
 drivers/gpio/gpiolib-legacy.c | 3 ---
 include/linux/gpio.h          | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/drivers/gpio/gpiolib-legacy.c b/drivers/gpio/gpiolib-legacy.c
index 28f1046fb670..aeae6df8bec9 100644
--- a/drivers/gpio/gpiolib-legacy.c
+++ b/drivers/gpio/gpiolib-legacy.c
@@ -46,9 +46,6 @@ int gpio_request_one(unsigned gpio, unsigned long flags, const char *label)
 	if (err)
 		return err;
 
-	if (flags & GPIOF_ACTIVE_LOW)
-		set_bit(FLAG_ACTIVE_LOW, &desc->flags);
-
 	if (flags & GPIOF_IN)
 		err = gpiod_direction_input(desc);
 	else
diff --git a/include/linux/gpio.h b/include/linux/gpio.h
index 2d105be7bbc3..6270150f4e29 100644
--- a/include/linux/gpio.h
+++ b/include/linux/gpio.h
@@ -21,9 +21,6 @@ struct device;
 #define GPIOF_OUT_INIT_LOW	((0 << 0) | (0 << 1))
 #define GPIOF_OUT_INIT_HIGH	((0 << 0) | (1 << 1))
 
-/* Gpio pin is active-low */
-#define GPIOF_ACTIVE_LOW        (1 << 2)
-
 /**
  * struct gpio - a structure describing a GPIO with configuration
  * @gpio:	the GPIO number
-- 
2.43.0.rc1.1336.g36b5255a03ac


