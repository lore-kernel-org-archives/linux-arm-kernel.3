Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AE2C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 18:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ygD10X9CbR/xIgoE5wFpebPD7SZLtVrLSaNRQ2O6CTQ=; b=e2jrWuP3zqPM1XQ21uC8licvY9
	31hboD1ZhyB95ZbA4S8Sj990lBNOq04SX1MoTgNHAoOmIaD85SFGM9VNj45zBKkf2l9tsLTqTheY8
	Xcv0HCp2pHiYZgrI/ESc6Vhw+6xESWfjlqjMoS4DGaizXDzcRmPtcnv88CTciwFQtVecWOaADZoTl
	DHPxwUmq9CicsdgNTbrcn6KX5L1wL8XsCxnjqHO3vaqsSbX8NEnxjGNuttcFh88/s2/UhdqB7bj+w
	aRX4q7hr6cMHhB2y13XmAD2pbCSY+D8xRpwrjBIoqvgqYazkasZ28o+4LSSGNOc7CWCqY1+m6vJIY
	JRUA29aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk4hY-0000000Fib1-2urb;
	Wed, 15 Jul 2026 18:51:24 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk4hV-0000000FiaH-3qBP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 18:51:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784141482; x=1815677482;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Zozgi4pBBMqS2Yp01Az5VMEBFWGBtzfkxrZ3zQRkYTg=;
  b=nhT3gHL5kUMkwFc36AIra1ZDpr3IMmt1LSnJ3NVHoD1TSmwYEimVjiA3
   W90nnvmh4gKFNjr3Pg/0p+e2r8I456P2S5eTcNUlo8bwgLJ70cGUFp2eV
   7FZigDnYcXV3Vk0RXbrOiWaX8WZEk3gsrmGo89VVNqYOBNBnApcqyMytb
   5gneHs327OGwbIUnMKjSx6W9aD9cwYt4jW7ufBRz9KepqJiR1BJDBzShH
   MUuE9GCjARvWkZmR5n4teaO3RKZDATv85SNos9E3iW5oQAXh7jstZXPRY
   msiYPQrTfU+CJSmGB9APIuBo1FFVFQlnrVgA8Z4FWGdqYKvRr9Oi2/lEa
   A==;
X-CSE-ConnectionGUID: 9WwukC4OQty/hh5xvlBUGw==
X-CSE-MsgGUID: hPAGC5qXTHeLj4d1DgZsAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="96308568"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="96308568"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 11:51:21 -0700
X-CSE-ConnectionGUID: 3IOviV9PSNC7VoDv77PcIg==
X-CSE-MsgGUID: 4JN2UDn6R4aIjFHo+IYNEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="294491648"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 15 Jul 2026 11:51:17 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id E712D95; Wed, 15 Jul 2026 20:51:15 +0200 (CEST)
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
Subject: [PATCH v1 0/7] gpiolib: kill gpio_request_one()
Date: Wed, 15 Jul 2026 20:46:40 +0200
Message-ID: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_115122_022106_2E0F2B21 
X-CRM114-Status: GOOD (  10.15  )
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

This is the finilazation of the work announced in the commit 61e1fd2abca4
("gpiolib: legacy: Make sure we kill gpio_request_one() first"). With this
small series we kill gpio_request_one() and leave only two legacy calls
devm_gpio_request_one() and gpio_request(), where the managed one has only
a few users and high chances to be killed soon as well.

The series is supposed to go via GPIO tree (due to nature of the last patch)
with possible immutable branch for others. Please, ack.

Andy Shevchenko (7):
  ARM: pxa: spitz: Open code gpio_request_one()
  media: em28xx: Split em28xx_pctv_290e_set_lna_gpio() helper
  media: em28xx: Open code gpio_request_one()
  MIPS: BCM47XX: Open code gpio_request_one()
  MIPS: BCM63XX: Remove one time use ephy_reset_gpio_flags
  MIPS: BCM63XX: Open code gpio_request_one()
  gpiolib: Get rid of not used anymore gpio_request_one()

 Documentation/driver-api/gpio/consumer.rst    |  2 +-
 arch/arm/mach-pxa/spitz_pm.c                  |  3 +-
 arch/mips/bcm47xx/workarounds.c               |  8 ++-
 arch/mips/bcm63xx/boards/board_bcm963xx.c     | 10 ++--
 .../include/asm/mach-bcm63xx/board_bcm963xx.h |  3 -
 drivers/gpio/gpiolib-legacy.c                 | 31 ----------
 drivers/media/usb/em28xx/em28xx-dvb.c         | 57 ++++++++-----------
 include/linux/gpio/legacy.h                   |  8 ---
 8 files changed, 39 insertions(+), 83 deletions(-)

-- 
2.50.1


