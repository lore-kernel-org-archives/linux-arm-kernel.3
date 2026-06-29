Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A24C3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 13:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5OeG3rRkzBqKhKaTP/QnJC8xEGmo/Ic6rup2rdYeGlI=; b=AiimN1nIIIsYkq+SiN7rl+KdNH
	4v8ap83xpcRZtqktsl8mh7/+Dj9nAh57Aflx1PYGH9FtFsIQAyzO67Vpljjw70dWioDpeewRk56D6
	MCbyXGWs3LZV0zyU+Is5MuwNMU49LCnk4l1YlHjbehmSg71TLYw5PWarTXA3QaT/VvAk8uJZsokNI
	shZMf5qw0YpUOfzBYiVzFjmHquWPJCD0A9uk9x60SACUxjE5LCE26N8QIXSmIOFmDUWPAzEjvzkQb
	6ukLAZUM8WEXO9yCr9e+f5oVWsYj4gGVSfHhjr+Qzwnu39QNUi6qg9UCQiW9tOtdtd7o74shPmohx
	szAXXMsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weC1E-0000000Ek81-0l7i;
	Mon, 29 Jun 2026 13:27:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weC1C-0000000Ek6q-3e78;
	Mon, 29 Jun 2026 13:27:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9BE9D405B3;
	Mon, 29 Jun 2026 13:27:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0344C1F00A3A;
	Mon, 29 Jun 2026 13:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782739642;
	bh=5OeG3rRkzBqKhKaTP/QnJC8xEGmo/Ic6rup2rdYeGlI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VEWPeht+Xql8Htfcb0XujBxovU/UjA5wNYx656mgwj/wAPbE7l9njMwSiI68NBHZn
	 9s0bf5fydgquXff7KNgOosHUEyDMQ1RTnVEoJ8TvOqkcPWdWGhBDWS++c3Rs5WAhxQ
	 6UIBz58ycqw8QdlujISNsMh+7PfcQbdg4XbV4C8Y5RTn7YhMPsv+8nbAQiqqqFZ8XX
	 8djtypw/XjCzyHgsaz6cKMwDIJkwgJBHBvLPV7MX1xHRBra1/gtIA+03J3pXOKm2PM
	 7/jVfyIgBKHdblY7K9eEewDQPWKA5cRwuXdHunOjc3gA63h2ATO33e4cdnZS9TLhlO
	 LyDD8splpT/KA==
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
Subject: [PATCH 05/13] mfd: replace linux/gpio.h inclusions
Date: Mon, 29 Jun 2026 15:26:25 +0200
Message-Id: <20260629132633.1300009-6-arnd@kernel.org>
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

linux/gpio.h should no longer be used, convert these instead to
either linux/gpio/consumer.h or linux/gpio/legacy.h as needed.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/mfd/aat2870-core.c        | 2 +-
 drivers/mfd/arizona-irq.c         | 2 +-
 drivers/mfd/lp3943.c              | 2 +-
 drivers/mfd/si476x-cmd.c          | 2 +-
 drivers/mfd/si476x-i2c.c          | 2 +-
 drivers/mfd/sm501.c               | 2 +-
 drivers/mfd/tps6105x.c            | 2 +-
 drivers/mfd/tps65911-comparator.c | 2 +-
 drivers/mfd/wm8994-irq.c          | 2 +-
 include/linux/mfd/lp3943.h        | 2 +-
 include/linux/mfd/ti-lmu.h        | 2 +-
 include/linux/mfd/tps65910.h      | 2 +-
 include/linux/mfd/ucb1x00.h       | 2 +-
 13 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/mfd/aat2870-core.c b/drivers/mfd/aat2870-core.c
index 34d66ba9646a..0d56cd6fbc6a 100644
--- a/drivers/mfd/aat2870-core.c
+++ b/drivers/mfd/aat2870-core.c
@@ -13,7 +13,7 @@
 #include <linux/uaccess.h>
 #include <linux/i2c.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 #include <linux/mfd/core.h>
 #include <linux/mfd/aat2870.h>
 #include <linux/regulator/machine.h>
diff --git a/drivers/mfd/arizona-irq.c b/drivers/mfd/arizona-irq.c
index 544016d420fe..14f9cb2c4b67 100644
--- a/drivers/mfd/arizona-irq.c
+++ b/drivers/mfd/arizona-irq.c
@@ -8,7 +8,7 @@
  */
 
 #include <linux/delay.h>
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/irqdomain.h>
diff --git a/drivers/mfd/lp3943.c b/drivers/mfd/lp3943.c
index 6764553147e4..1918b5c7a5e7 100644
--- a/drivers/mfd/lp3943.c
+++ b/drivers/mfd/lp3943.c
@@ -28,7 +28,7 @@
  */
 
 #include <linux/err.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/mfd/core.h>
 #include <linux/mfd/lp3943.h>
diff --git a/drivers/mfd/si476x-cmd.c b/drivers/mfd/si476x-cmd.c
index 3bb2decfebd3..8cbc0a386f3f 100644
--- a/drivers/mfd/si476x-cmd.c
+++ b/drivers/mfd/si476x-cmd.c
@@ -15,7 +15,7 @@
 #include <linux/atomic.h>
 #include <linux/i2c.h>
 #include <linux/device.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/videodev2.h>
 
 #include <linux/mfd/si476x-core.h>
diff --git a/drivers/mfd/si476x-i2c.c b/drivers/mfd/si476x-i2c.c
index 7ddc97dfc940..7be3460b0491 100644
--- a/drivers/mfd/si476x-i2c.c
+++ b/drivers/mfd/si476x-i2c.c
@@ -13,7 +13,7 @@
 #include <linux/slab.h>
 #include <linux/interrupt.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 #include <linux/regulator/consumer.h>
 #include <linux/i2c.h>
 #include <linux/err.h>
diff --git a/drivers/mfd/sm501.c b/drivers/mfd/sm501.c
index b5bda477ebfc..9d5bb67e8084 100644
--- a/drivers/mfd/sm501.c
+++ b/drivers/mfd/sm501.c
@@ -35,7 +35,7 @@ struct sm501_device {
 struct sm501_gpio;
 
 #ifdef CONFIG_MFD_SM501_GPIO
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 
 struct sm501_gpio_chip {
 	struct gpio_chip	gpio;
diff --git a/drivers/mfd/tps6105x.c b/drivers/mfd/tps6105x.c
index e2f6858d101e..b11cd2c03311 100644
--- a/drivers/mfd/tps6105x.c
+++ b/drivers/mfd/tps6105x.c
@@ -16,7 +16,7 @@
 #include <linux/init.h>
 #include <linux/i2c.h>
 #include <linux/regmap.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/spinlock.h>
 #include <linux/slab.h>
 #include <linux/err.h>
diff --git a/drivers/mfd/tps65911-comparator.c b/drivers/mfd/tps65911-comparator.c
index 7098712ea008..cc8545a972bc 100644
--- a/drivers/mfd/tps65911-comparator.c
+++ b/drivers/mfd/tps65911-comparator.c
@@ -14,7 +14,7 @@
 #include <linux/err.h>
 #include <linux/platform_device.h>
 #include <linux/debugfs.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/mfd/tps65910.h>
 
 #define COMP1					0
diff --git a/drivers/mfd/wm8994-irq.c b/drivers/mfd/wm8994-irq.c
index a46cea948763..a15483489b9d 100644
--- a/drivers/mfd/wm8994-irq.c
+++ b/drivers/mfd/wm8994-irq.c
@@ -9,7 +9,7 @@
 
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/irq.h>
 #include <linux/mfd/core.h>
diff --git a/include/linux/mfd/lp3943.h b/include/linux/mfd/lp3943.h
index 402f01078fcc..5d2d172d3598 100644
--- a/include/linux/mfd/lp3943.h
+++ b/include/linux/mfd/lp3943.h
@@ -10,7 +10,7 @@
 #ifndef __MFD_LP3943_H__
 #define __MFD_LP3943_H__
 
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/regmap.h>
 
 /* Registers */
diff --git a/include/linux/mfd/ti-lmu.h b/include/linux/mfd/ti-lmu.h
index 0bc0e8199798..5040c7d1e1b9 100644
--- a/include/linux/mfd/ti-lmu.h
+++ b/include/linux/mfd/ti-lmu.h
@@ -10,7 +10,7 @@
 #ifndef __MFD_TI_LMU_H__
 #define __MFD_TI_LMU_H__
 
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/notifier.h>
 #include <linux/regmap.h>
 #include <linux/gpio/consumer.h>
diff --git a/include/linux/mfd/tps65910.h b/include/linux/mfd/tps65910.h
index f67ef0a4e041..3813fc9c2b55 100644
--- a/include/linux/mfd/tps65910.h
+++ b/include/linux/mfd/tps65910.h
@@ -12,7 +12,7 @@
 #ifndef __LINUX_MFD_TPS65910_H
 #define __LINUX_MFD_TPS65910_H
 
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/regmap.h>
 
 /* TPS chip id list */
diff --git a/include/linux/mfd/ucb1x00.h b/include/linux/mfd/ucb1x00.h
index ede237384723..4ad54e22ed33 100644
--- a/include/linux/mfd/ucb1x00.h
+++ b/include/linux/mfd/ucb1x00.h
@@ -9,7 +9,7 @@
 
 #include <linux/device.h>
 #include <linux/mfd/mcp.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
 #include <linux/mutex.h>
 
-- 
2.39.5


