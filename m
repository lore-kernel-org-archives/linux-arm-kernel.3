Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 955C3C44507
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 21:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=46eUzVM3ncAmL/9d8cH77iPrk71pbyGmWfoXjh1L6RU=; b=DKvWEAhj8DWcvIKw8E4hBja7T8
	fTwg3B46AHedE0xYUXlnpN55P+S7JIfd173ezpG7eu00Ahlu8BJuD0LUtiNpwXZg+jPB3dVKg9+xm
	sfrkAJvY0HWQ9pY0jvS9Fwa/YpHh0+vor22BKZjgV1pFbhJayymRdiiAmnvUtpaVblXq/hB34oAlu
	CON0CjPNuN4KPyJ2zTkzUYmGNLYzXzlVV7RxAxGnnAaWwZ+6tpuNUzWpB1TJ5j/9YIULXL5/NovL1
	lQs7blOBrxUTkdZcFLL/WBwZMtq4HuVGNwRc/UY8cSYEJNd2+MKCBFGMkTSpDSmn6a+H84KqKt0ml
	+/TE4sfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiIe4-00000005ncB-3q8Y;
	Fri, 10 Jul 2026 21:20:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiIe3-00000005naN-1GRb;
	Fri, 10 Jul 2026 21:20:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B6D6C600C3;
	Fri, 10 Jul 2026 21:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 844321F00A3A;
	Fri, 10 Jul 2026 21:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783718426;
	bh=46eUzVM3ncAmL/9d8cH77iPrk71pbyGmWfoXjh1L6RU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LF44cjDyG2hqK00k2mfWkqXGbJF8blKUlTcFPOjLUfZ2ua4SP1IhMZVv94Mjwp7xo
	 mfEDdZkIWq8GfMFuibDL0EegdsALrOlV636uEcI0FZbEffDmgaKKPPUmoEx1LmSX7C
	 V3sQD0QRmU0kDQX5rvfmz96i2ajCJcfyB4T7ZweOqJZujZIQ9h21ESh6JmSTeTzlS7
	 crjfQgLQBV7aUNGve/Jqu1SoFnPZfqVLjySWnOUgpPEVi67IIJ8y2inP0rsNPmEJU4
	 roTMAnhXXyFsyMatMsv590fT+L0oG+lyT13kdP3JXHWA2LnwtOPElNhz48VlYb5yWW
	 fa/D7KQDEHa4w==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-gpio@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
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
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-phy@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 03/10] mips: replace linux/gpio.h inclusions
Date: Fri, 10 Jul 2026 23:19:48 +0200
Message-Id: <20260710211954.1373336-4-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260710211954.1373336-1-arnd@kernel.org>
References: <20260710211954.1373336-1-arnd@kernel.org>
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

linux/gpio.h should no longer be used, convert these instead to
either linux/gpio/consumer.h or linux/gpio/legacy.h as needed.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/mips/alchemy/board-xxs1500.c                   | 2 +-
 arch/mips/alchemy/devboards/db1000.c                | 2 +-
 arch/mips/alchemy/devboards/db1200.c                | 2 +-
 arch/mips/alchemy/devboards/db1550.c                | 2 +-
 arch/mips/bcm47xx/workarounds.c                     | 2 +-
 arch/mips/bcm63xx/boards/board_bcm963xx.c           | 1 +
 arch/mips/include/asm/mach-bcm63xx/board_bcm963xx.h | 2 +-
 arch/mips/txx9/rbtx4927/setup.c                     | 2 +-
 8 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/arch/mips/alchemy/board-xxs1500.c b/arch/mips/alchemy/board-xxs1500.c
index f175bce2987f..a03762dde4e7 100644
--- a/arch/mips/alchemy/board-xxs1500.c
+++ b/arch/mips/alchemy/board-xxs1500.c
@@ -11,7 +11,7 @@
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/platform_device.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/delay.h>
 #include <linux/pm.h>
 #include <asm/bootinfo.h>
diff --git a/arch/mips/alchemy/devboards/db1000.c b/arch/mips/alchemy/devboards/db1000.c
index 8fb24b220e3a..5eff34a8683b 100644
--- a/arch/mips/alchemy/devboards/db1000.c
+++ b/arch/mips/alchemy/devboards/db1000.c
@@ -8,7 +8,7 @@
 
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 #include <linux/gpio/machine.h>
 #include <linux/gpio/property.h>
 #include <linux/init.h>
diff --git a/arch/mips/alchemy/devboards/db1200.c b/arch/mips/alchemy/devboards/db1200.c
index de2a9083ed9a..539b311fc8af 100644
--- a/arch/mips/alchemy/devboards/db1200.c
+++ b/arch/mips/alchemy/devboards/db1200.c
@@ -7,7 +7,7 @@
 
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
diff --git a/arch/mips/alchemy/devboards/db1550.c b/arch/mips/alchemy/devboards/db1550.c
index b8295a5c2e9a..579fc8f1eaed 100644
--- a/arch/mips/alchemy/devboards/db1550.c
+++ b/arch/mips/alchemy/devboards/db1550.c
@@ -7,7 +7,7 @@
 
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/io.h>
diff --git a/arch/mips/bcm47xx/workarounds.c b/arch/mips/bcm47xx/workarounds.c
index 745c6228eb2c..dc9e5483347d 100644
--- a/arch/mips/bcm47xx/workarounds.c
+++ b/arch/mips/bcm47xx/workarounds.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "bcm47xx_private.h"
 
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 #include <bcm47xx_board.h>
 #include <bcm47xx.h>
 
diff --git a/arch/mips/bcm63xx/boards/board_bcm963xx.c b/arch/mips/bcm63xx/boards/board_bcm963xx.c
index c5617b889b1c..71628dac6c26 100644
--- a/arch/mips/bcm63xx/boards/board_bcm963xx.c
+++ b/arch/mips/bcm63xx/boards/board_bcm963xx.c
@@ -7,6 +7,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/init.h>
+#include <linux/gpio/legacy.h>
 #include <linux/kernel.h>
 #include <linux/string.h>
 #include <linux/platform_device.h>
diff --git a/arch/mips/include/asm/mach-bcm63xx/board_bcm963xx.h b/arch/mips/include/asm/mach-bcm63xx/board_bcm963xx.h
index 830f53f28e3f..428cf4508f9a 100644
--- a/arch/mips/include/asm/mach-bcm63xx/board_bcm963xx.h
+++ b/arch/mips/include/asm/mach-bcm63xx/board_bcm963xx.h
@@ -3,7 +3,7 @@
 #define BOARD_BCM963XX_H_
 
 #include <linux/types.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/leds.h>
 #include <bcm63xx_dev_enet.h>
 #include <bcm63xx_dev_usb_usbd.h>
diff --git a/arch/mips/txx9/rbtx4927/setup.c b/arch/mips/txx9/rbtx4927/setup.c
index 31955c1d5555..b4fbe6a2a73a 100644
--- a/arch/mips/txx9/rbtx4927/setup.c
+++ b/arch/mips/txx9/rbtx4927/setup.c
@@ -48,7 +48,7 @@
 #include <linux/ioport.h>
 #include <linux/platform_device.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 #include <linux/leds.h>
 #include <asm/io.h>
 #include <asm/reboot.h>
-- 
2.39.5


