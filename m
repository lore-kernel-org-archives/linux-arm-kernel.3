Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED42C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 May 2025 21:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6YH0fQxxO2LW9sC+HXt1EYIgfegg7zILcr6qRdDlAi8=; b=KyjOXfvLK+2B7N3b9yypxe4PZP
	jFXHR+QWHZTj3mvxMN9e30Ill2FewtentKi0OQjS+saUkLY8LTHUfE0tKfySwHfGG9lY8BjobZZgW
	jcnIlK9dTrg1vFCJn5W6w0MX91bGH5PtagAJfYyPIphh7MeeOuTrlKbbtsgrlO19n/s2L8kQAREtq
	pzlIA0rlvX9+sNbN+FHi1Y/5nfo6nxgRV8pK/GoUlvElx/QKHjkJ3BCb2xzsF3GYHLQk+UgXwfcAQ
	Ax65S43lAwTgbpSXDRWZoddnyghkx07y/fcLofN9gUP837POAMieV6JvPVgng8/cnZfPWpF6QXhI0
	aJGetOAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLTmX-00000004V2K-30hY;
	Sat, 31 May 2025 21:30:21 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLTg9-00000004Sd0-207v
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 May 2025 21:23:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748726626; x=1780262626;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=409EzBnRZl7HCyBHlkiarMMZ5YH45JJDUcocJR01ODQ=;
  b=l6151dgO+9KfQDtNTSTOIKs8Ut96C/HUzyYiEq+cwakbCqFQW5oRJi7J
   Pe5rLCHNoTz9OYm/Sg19secHU7CBPd3OKl5F8mSjxFcjaKgRyThfRNjE0
   0MMvoJIQAdfzy7F6ZaADfvhFp2T0dJFQQsm/Br7d8GynR60O0DD/jzm1n
   4NSUUkbdIwgktBP0otThle0Awhr1ZQ6hbkgBiPyorD2cNfvrT1o57DEBb
   21bcPdIx27pbTZ+adG4bRG8iuzoJn3hHJHT2fnpt8xBKIX1+mOQrw7QVV
   LESyA05+2c3+Trqv5i35+6EsA6dr+rmYppaRRajamdhNr23XmXuLwWLiR
   w==;
X-CSE-ConnectionGUID: cChSse7ATwupSVADu0YaTg==
X-CSE-MsgGUID: eSPMOyEWQMSM8yZlInfEwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="50941384"
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600"; 
   d="scan'208";a="50941384"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2025 14:23:42 -0700
X-CSE-ConnectionGUID: btzh5O+XQRClxfZzyVkLNg==
X-CSE-MsgGUID: SmPlBnKISje07NJUeixbHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600"; 
   d="scan'208";a="149465595"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 31 May 2025 14:23:38 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 5CA72202; Sun, 01 Jun 2025 00:23:35 +0300 (EEST)
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
Subject: [PATCH v1 0/2] gpiolib: get rid of devm_gpio_request()
Date: Sun,  1 Jun 2025 00:21:37 +0300
Message-ID: <20250531212331.3635269-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250531_142345_557345_C0DF34F9 
X-CRM114-Status: UNSURE (   9.14  )
X-CRM114-Notice: Please train this message.
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

devm_gpio_request() is used by a single driver. Replace it there and
kill the legacy API. Assumed to be routed via GPIO tree.

Andy Shevchenko (2):
  usb: gadget: pxa25x_udc: Switch to use devm_gpio_request_one()
  gpiolib: Remove unused devm_gpio_request()

 .../driver-api/driver-model/devres.rst        |  1 -
 drivers/gpio/gpiolib-legacy.c                 | 38 -------------------
 drivers/usb/gadget/udc/pxa25x_udc.c           |  5 +--
 include/linux/gpio.h                          |  8 ----
 4 files changed, 2 insertions(+), 50 deletions(-)

-- 
2.47.2


