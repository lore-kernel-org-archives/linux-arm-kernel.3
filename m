Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC043C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 May 2025 21:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1QBd2ohB2N6fsA1qJx9AOje0X+gLr3GSE/jCM+tCx2U=; b=CYQWBOElR5fhIvlXB/vTB1Fwjn
	iPBm+Gzf+K4WTUHXoGy8n//UPodZKfHW14MHweOr7DWDVf2Gq/D4AhNFqWwBu/4tzwnW5TTLPHm2T
	aF3updsmUDkCUsGuuPP85CdIbZvYyP2rzCQniNDdCStw/HMbE1RwqNXlPJ4yCghmHINOnK9zHpa8B
	BnhxaT89jsSTgtxjN3WH8lM7+NZ/rE1XliApB43AbVQxotQC2Sl1RtOeonNG8iCauVMqcKvhapIA/
	yJ7jXH7ig/HdhR/N/YzIyCPmPFN8cHzJP2qS0V+IqR49S/e42nQLtVBd+CvkDErzVE7whNAe5tGcx
	WDvWCGiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLTiI-00000004TA7-14mL;
	Sat, 31 May 2025 21:25:58 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLTg8-00000004ScI-0rs5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 May 2025 21:23:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748726624; x=1780262624;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fO2IZVQirqF8M5hIKmy/1EuXz2JFWuUbdV/fET9QHAw=;
  b=gE1oPPjPtemYEXoE2KuLpFPmuECfwtncXKgx+T2SF0thIoUa3wyG0umD
   J1zzCjPv01jsFVXafER5tApPf30uKDV4f5kFPat/AZXDtOkVJmcBVVZkA
   U3WtuS4LiM+FCb5L7ZcvSzePdjLLxebGbLLmSFXarYFT2vZkywHMMbFm/
   3LNhbhqhVAqUBLOQPgHAWSkyMfZvsbT3P3ssz+qJnGpj6Gwf0xwPts+6k
   h52/kdSuEgpdyDiDOJUaeJj/zz6UadsGz3QM6M5ANlaL5l5fkYNIQZzA2
   luohyPp3AH/PuVL2y1H9zUUdEOBBWDUT36hitZqrI88wcJy00PwmuEGdi
   A==;
X-CSE-ConnectionGUID: Z2kCJZhlQda9VOURQGmLYA==
X-CSE-MsgGUID: lfmNN0etT0iX3yPGRThcww==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="50888686"
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600"; 
   d="scan'208";a="50888686"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2025 14:23:39 -0700
X-CSE-ConnectionGUID: VjJhx55BRL+5PD+MaTcO0g==
X-CSE-MsgGUID: 75ksBrGuTLeQXQQ0MVpOnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600"; 
   d="scan'208";a="144161858"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 31 May 2025 14:23:36 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 6A46BAF; Sun, 01 Jun 2025 00:23:35 +0300 (EEST)
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
Subject: [PATCH v1 1/2] usb: gadget: pxa25x_udc: Switch to use devm_gpio_request_one()
Date: Sun,  1 Jun 2025 00:21:38 +0300
Message-ID: <20250531212331.3635269-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250531212331.3635269-1-andriy.shevchenko@linux.intel.com>
References: <20250531212331.3635269-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250531_142344_259757_34B8AEF0 
X-CRM114-Status: GOOD (  11.74  )
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

devm_gpio_request() is going to be removed. This driver is only user of that
API. Convert it to use different API.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/usb/gadget/udc/pxa25x_udc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/pxa25x_udc.c b/drivers/usb/gadget/udc/pxa25x_udc.c
index 24eb1ae78e45..366abdab095c 100644
--- a/drivers/usb/gadget/udc/pxa25x_udc.c
+++ b/drivers/usb/gadget/udc/pxa25x_udc.c
@@ -2348,15 +2348,14 @@ static int pxa25x_udc_probe(struct platform_device *pdev)
 	dev->transceiver = devm_usb_get_phy(&pdev->dev, USB_PHY_TYPE_USB2);
 
 	if (gpio_is_valid(dev->mach->gpio_pullup)) {
-		retval = devm_gpio_request(&pdev->dev, dev->mach->gpio_pullup,
-					   "pca25x_udc GPIO PULLUP");
+		retval = devm_gpio_request_one(&pdev->dev, dev->mach->gpio_pullup,
+					       GPIOF_OUT_INIT_LOW, "pca25x_udc GPIO PULLUP");
 		if (retval) {
 			dev_dbg(&pdev->dev,
 				"can't get pullup gpio %d, err: %d\n",
 				dev->mach->gpio_pullup, retval);
 			goto err;
 		}
-		gpio_direction_output(dev->mach->gpio_pullup, 0);
 	}
 
 	timer_setup(&dev->timer, udc_watchdog, 0);
-- 
2.47.2


