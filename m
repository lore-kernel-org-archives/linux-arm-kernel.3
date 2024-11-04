Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC55D132A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 09:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k0AX5zW3xOotMnu0fE3qitweQ7iDEzxquKmOE/YQPbo=; b=bR1y2XTZSShNNyV+6jNJhfApID
	pdKOb7/KdLcR4SSY988lZ7FcMlxwLQGg/Q9xbn410wa3fn7lixywkF8z5swhHNB04vJMs+rxmxwMP
	cYlEqvccQfWAUJFA7uYnDy17MfM2AgIal40UQfmRpJpw3cFgRQoNQzQQ6uvTlZiGiaZEhLRx/6YDp
	OKHl37bYeVx991vsuQB6hLvcOHJN3KiaSPVCDYFPSCZ1z+2ZuADsNqMnpjz+9JZVcGKd472UnVCEx
	l/XMST/EMx75jGsdzRfSKQtJeBmrmScvN85a6eOQTLpl7yLDDO3nrs1lZ+swJjytDi8MZLoiMLOHw
	QUCzx3Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7tXG-0000000DB4Y-1ewC;
	Mon, 04 Nov 2024 09:38:10 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7tVW-0000000DAcx-24oy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 09:36:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730712982; x=1762248982;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=n06aomNea54LOIjl4FdYmKdQ3SaJdgCBi4KWYyxFzVE=;
  b=Kk6dyaXj9YAlUeD7r3M6mVfPiH26deblUc+K0A1Aj8c+JbVGEkJyGDli
   BMaF6SxgoUl1xue73Milcc5DxpxEWZe1WWJmU45yPdXEz2pSTpNHHUfdV
   Idr4xUBRsyq2UoGPdwU24Tq9Y8NxlIFISPrwlWLhd3IuAUS3j4FiJpNfl
   PmxUEaGTtw7R2GdipUIpUSkAIgUF0SPw6WtpHM4jRwY60a3ufpj5asfq5
   mqTWZaBDL2a5nBG7OzPPoXUdhpfo6kAKvABhCcK+mH3MrlpLufDg+Pff1
   wi5C6CD2JkzRCj/neXd+NkjHBV1/6maROGTe5P1s/lCyLEj96ELmpXmjq
   A==;
X-CSE-ConnectionGUID: OwOts5bsTcmvcMTmV062FA==
X-CSE-MsgGUID: KmOvwloqQoeSApdGSXzHlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="30278741"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="30278741"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 01:36:16 -0800
X-CSE-ConnectionGUID: 8Yb4jDMESFapTW0806TxMw==
X-CSE-MsgGUID: msVvaH3ITSCCm1JSxsXAwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="83481188"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa009.jf.intel.com with ESMTP; 04 Nov 2024 01:36:12 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 8F47E1C4; Mon, 04 Nov 2024 11:36:10 +0200 (EET)
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
Subject: [PATCH v1 0/6] gpio: Get rid of deprecated GPIOF_ACTIVE_LOW
Date: Mon,  4 Nov 2024 11:34:18 +0200
Message-ID: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_013622_604737_5848017B 
X-CRM114-Status: GOOD (  10.70  )
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

This series targets the deprecated GPIOF_ACTIVE_LOW as only a few users
left. Convert those users to call modern APIs and drop this legacy piece
from the source tree.

The idea is to route this via GPIO tree, please Ack.

Andy Shevchenko (6):
  Input: gpio_keys - avoid using GPIOF_ACTIVE_LOW
  Input: gpio_keys_polled - avoid using GPIOF_ACTIVE_LOW
  leds: gpio: Avoid using GPIOF_ACTIVE_LOW
  pcmcia: soc_common: Avoid using GPIOF_ACTIVE_LOW
  USB: gadget: pxa27x_udc: Avoid using GPIOF_ACTIVE_LOW
  gpio: Get rid of GPIOF_ACTIVE_LOW

 drivers/gpio/gpiolib-legacy.c             |  3 ---
 drivers/input/keyboard/gpio_keys.c        | 10 ++++------
 drivers/input/keyboard/gpio_keys_polled.c | 12 +++++-------
 drivers/leds/leds-gpio.c                  |  9 ++++-----
 drivers/pcmcia/soc_common.c               | 12 +++++-------
 drivers/usb/gadget/udc/pxa27x_udc.c       |  7 ++++---
 include/linux/gpio.h                      |  3 ---
 7 files changed, 22 insertions(+), 34 deletions(-)

-- 
2.43.0.rc1.1336.g36b5255a03ac


