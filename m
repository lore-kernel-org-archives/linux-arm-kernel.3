Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A22ED132A3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 09:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hLu2T/PbLidOgZaS0MkCdg+g3hDYDSGtIyHHHjXh1Y4=; b=b9Ss15Bt0qnT//ZW7rCw1HzyZP
	8N2JJn8XfXZEtA0uOUKBuY48fVfTP0pyLLTTNsz+UwXCO737dul17sGPa5va6spWlrYSqhQTs+QTv
	1snRWzid1WZVoserDEd6VPiKlD2haX81x1xoF+MLcIVSy1L+9HNGuaxRnQ+FXI2shBZmKNRid3IkN
	s/QNJjL045CwT9wMdQZYTH5IvaklFWgvAVKCqwvFut3vYQCS0w/vN/qSL7tYaL2fNk525/jaFsZI7
	DC+6PlBamW0ZTv67ZjSD529nfDkDt5tkeOMzt7A1uIfYKYoS6L0hSb6jrBbEuizMekBxIWCZRC8F3
	1qECh/cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7taa-0000000DBef-1wYs;
	Mon, 04 Nov 2024 09:41:36 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7tVW-0000000DAdP-24Xg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 09:36:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730712982; x=1762248982;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kUCUIekHAy2hQVeY+KDx2ZmkPhmDOVUUdVI2qaPtf0A=;
  b=UBktejPaI/zFLOeLkY9Ms2qREZeAkHOZFas4aVttu9PULi5fkpRhNR3a
   LkekdJqNAhryBaT040G6kp+++fnQ8Mm1rhSEl1hKDD/5PIGI8WOWqqRxn
   Pzfn/hSAjFl53w9z4CHvQTFR4aYZmyuvXvhbH+1OHj3bICfe8HJlTQtpZ
   TjMe/ivE7CiBN4f7/VVjQvW8Wqtls56tnGz9/bI0PnK9eF39jWIt0zpJK
   2nYu1TaoV1A8oronWNok0JzbVZH8McVc/F5Bqn3lfButOSIfL1qUH2ChE
   bBC9nK0xTUtUrFNo0gu0ACQEqOH9SCtAIlrJdOLFSZgi323xT99oGdBV7
   A==;
X-CSE-ConnectionGUID: Oh4f3wXxR/Kwaij/ceWMRA==
X-CSE-MsgGUID: SYof0F6fS+Gbw4+0b6IfMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="30278752"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="30278752"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 01:36:16 -0800
X-CSE-ConnectionGUID: hvVNDrAtT+ibO2wGuf0PZw==
X-CSE-MsgGUID: jao+gc8dRpqEnOSD9mauAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="83481189"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa009.jf.intel.com with ESMTP; 04 Nov 2024 01:36:12 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id AD59626A; Mon, 04 Nov 2024 11:36:10 +0200 (EET)
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
Subject: [PATCH v1 2/6] Input: gpio_keys_polled - avoid using GPIOF_ACTIVE_LOW
Date: Mon,  4 Nov 2024 11:34:20 +0200
Message-ID: <20241104093609.156059-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com>
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_013622_622251_BA883A72 
X-CRM114-Status: GOOD (  12.35  )
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
 drivers/input/keyboard/gpio_keys_polled.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/input/keyboard/gpio_keys_polled.c b/drivers/input/keyboard/gpio_keys_polled.c
index 41ca0d3c9098..e6707d72210e 100644
--- a/drivers/input/keyboard/gpio_keys_polled.c
+++ b/drivers/input/keyboard/gpio_keys_polled.c
@@ -306,13 +306,8 @@ static int gpio_keys_polled_probe(struct platform_device *pdev)
 			 * Legacy GPIO number so request the GPIO here and
 			 * convert it to descriptor.
 			 */
-			unsigned flags = GPIOF_IN;
-
-			if (button->active_low)
-				flags |= GPIOF_ACTIVE_LOW;
-
-			error = devm_gpio_request_one(dev, button->gpio,
-					flags, button->desc ? : DRV_NAME);
+			error = devm_gpio_request_one(dev, button->gpio, GPIOF_IN,
+						      button->desc ? : DRV_NAME);
 			if (error)
 				return dev_err_probe(dev, error,
 						     "unable to claim gpio %u\n",
@@ -325,6 +320,9 @@ static int gpio_keys_polled_probe(struct platform_device *pdev)
 					button->gpio);
 				return -EINVAL;
 			}
+
+			if (button->active_low ^ gpiod_is_active_low(bdata->gpiod))
+				gpiod_toggle_active_low(bdata->gpiod);
 		}
 
 		bdata->last_state = -1;
-- 
2.43.0.rc1.1336.g36b5255a03ac


