Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA1AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 13:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iYwaK59VeErRBhP0Q9iTMSGYiDgPnUNQAe6MLCdyQLw=; b=0CA0/oOzWywWRZQZZRgReqkl+I
	AjiktP5u/wb4ZSD+SJ+S0Yt9ozsyOltjwh2lvVb75G0soKgxWzP09QFVES5eG3DgcFf/fMnVqFF87
	EibYumNeo8hxCjEoYtlK1wA1lZUlpZcH78FJKQs7OHTGLMZcFNFbBFLrx+GCVWwIhRlnVSMhAnzci
	D8PKnNKPlrVvZImMHb4C5KQi6mDJIDzKrOJFzP3+dmnOK9MZWNgtKbQ3sPkph6PpFZdcGwvzPxtvU
	ZneH8G+ZZ6jpO3lx7tNlXf7YZHk5pdWzvXguvBJzSoZyn/0LtxyXrGEXKu+Vm7jFd+wNsK7iB+WV1
	FpGMDY+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weC28-0000000El3G-1bCH;
	Mon, 29 Jun 2026 13:28:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weC26-0000000El21-415a;
	Mon, 29 Jun 2026 13:28:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A7C2C41320;
	Mon, 29 Jun 2026 13:28:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 089BD1F00A3A;
	Mon, 29 Jun 2026 13:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782739698;
	bh=iYwaK59VeErRBhP0Q9iTMSGYiDgPnUNQAe6MLCdyQLw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=h5AFqQi4jStPxyTSP1+6Qa/JvBSIFtVgK0MNZzsiH6wjFRswa/RLrnQqFNHih/qjG
	 EWv3fVYPKDKbBtHjWpFdO8cIy9X4E9hkJpPP6vBXA8/qsQylAAtt6v+NK73U7OXv92
	 YB7mQNWAxRfG6dGtDgsPLk0YTrL8XMwVLZP0DiJLe31ovoUMss8UP/7D/l/j5xY8/E
	 GWyr+Tst/J+V3i8q9C/i4YobqaQblCJhFZjTHY4YfQcFjDhwMaiBx0Ip4Lj1e9DE6L
	 mM017Lryq9TQOfeRAPIp4At1UOUu2ZNtp0Xj6zezM1lXYTXWiO8CpisTNWLtJuCnOG
	 JFsljvXoooevw==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Greg Ungerer <gerg@linux-m68k.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Linus Walleij <linusw@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-phy@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 13/13] gpiolib: remove linux/gpio.h
Date: Mon, 29 Jun 2026 15:26:33 +0200
Message-Id: <20260629132633.1300009-14-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260629132633.1300009-1-arnd@kernel.org>
References: <20260629132633.1300009-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Arnd Bergmann <arnd@arndb.de>

After all other drivers have converted to linux/gpio/consumer.h
or linux/gpio/legacy.h, remove the final leftover bits here.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 MAINTAINERS                   |  1 -
 drivers/gpio/TODO             |  4 +---
 drivers/gpio/gpiolib-cdev.c   |  2 +-
 drivers/gpio/gpiolib-legacy.c |  3 +--
 drivers/gpio/gpiolib.c        |  2 +-
 include/linux/gpio.h          | 22 ----------------------
 6 files changed, 4 insertions(+), 30 deletions(-)
 delete mode 100644 include/linux/gpio.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 15011f5752a9..7f3f386b1d8c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11175,7 +11175,6 @@ F:	Documentation/devicetree/bindings/gpio/
 F:	Documentation/driver-api/gpio/
 F:	drivers/gpio/
 F:	include/dt-bindings/gpio/
-F:	include/linux/gpio.h
 F:	include/linux/gpio/
 K:	(devm_)?gpio_(request|free|direction|get|set)
 K:	GPIOD_FLAGS_BIT_NONEXCLUSIVE
diff --git a/drivers/gpio/TODO b/drivers/gpio/TODO
index 7ce80fde1f17..894c7e1af252 100644
--- a/drivers/gpio/TODO
+++ b/drivers/gpio/TODO
@@ -52,9 +52,7 @@ Work items:
   base can be made dynamic (set to -1) if CONFIG_GPIO_SYSFS is disabled.
 
 - When this work is complete (will require some of the items in the
-  following ongoing work as well) we can delete the old global
-  numberspace accessors from <linux/gpio.h> and eventually delete
-  <linux/gpio.h> altogether.
+  following ongoing work as well) we can delete <linux/gpio/lagacy.h>.
 
 -------------------------------------------------------------------------------
 
diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 82f27db0b230..9b6a28819371 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -11,7 +11,7 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/file.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
 #include <linux/hte.h>
 #include <linux/interrupt.h>
diff --git a/drivers/gpio/gpiolib-legacy.c b/drivers/gpio/gpiolib-legacy.c
index ef3f2ef30cf2..33e5a45e720b 100644
--- a/drivers/gpio/gpiolib-legacy.c
+++ b/drivers/gpio/gpiolib-legacy.c
@@ -7,8 +7,7 @@
 
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
-
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 
 #include "gpiolib.h"
 
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e5fb60111151..1f498d6c8c68 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -29,7 +29,7 @@
 #include <linux/string.h>
 #include <linux/string_choices.h>
 
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
 #include <linux/gpio/machine.h>
 
diff --git a/include/linux/gpio.h b/include/linux/gpio.h
deleted file mode 100644
index b0d4942a65de..000000000000
--- a/include/linux/gpio.h
+++ /dev/null
@@ -1,22 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * NOTE: This header *must not* be included.
- *
- * If you're implementing a GPIO driver, only include <linux/gpio/driver.h>
- * If you're implementing a GPIO consumer, only include <linux/gpio/consumer.h>
- * If you're using the legacy interfaces, include <linux/gpio/legacy.h>
- */
-
-#ifndef __LINUX_GPIO_H
-#define __LINUX_GPIO_H
-
-#include <linux/types.h>
-#ifdef CONFIG_GPIOLIB
-#include <linux/gpio/consumer.h>
-#endif
-
-#ifdef CONFIG_GPIOLIB_LEGACY
-#include <linux/gpio/legacy.h>
-#endif /* CONFIG_GPIOLIB_LEGACY */
-
-#endif /* __LINUX_GPIO_H */
-- 
2.39.5


