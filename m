Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD5C5E63F1C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Feb 2026 22:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f63y7Wq2UjRJwaDurNk5EkD4fofDVgyaXt3x3vGItDA=; b=ce0aR6yjQzZ5VuWdynN+TpI0pK
	kYG3lYkKeeFBQDadP/joRhEkSP4mrHiyp5WAA12DE8AqNVGFVTPqMQEpxFQGIU+FKc2x0o45HCz/K
	wwjCLs/MiJA/JSNJEEnhCjDqne+oD5UmFDFfUPnHznjbUpyyAG6za6nI6g6zNAxGITN+jvUQl0uxF
	xISSV0rrFGed50qqPi605LBdubfWaCK5epVQTZzS2HrpyCfxbC2ZIE7Y69bASRigTCfOgtE9h5oRb
	ZuY4TW/cAz1sdnv6ygiVjK1KFpnX7jqg9KBvrknVbDhUZOhV6Yf+ACAf8YQ9NKT+oJjZ3zoe9pE01
	M9uzEi7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrl1n-00000005jjV-43wD;
	Sun, 15 Feb 2026 22:55:47 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrl1h-00000005jaM-3aMA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Feb 2026 22:55:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=f63y7Wq2UjRJwaDurNk5EkD4fofDVgyaXt3x3vGItDA=; b=HsL6Kb
	oidDyjlA5DER1h1Z56zGsiZ/6NJLRuwIOww7Dc6aGPZWz6LWUs4qR7Ys/ezJMn91
	LiRJy4XDaPgHdGPCBkTF8zxI60/6w9E1c8KV4vAM6ep0Z2g27S3Gdv4QXkF3HhjU
	MCtmVaUdAu7r6PaRVvEE3/iTa4ziWloP4eokLNJ1F6ThkzxMVP6E2N/i/rKVzCzj
	/h50Zx+lD9zECGJZ72Kb1uva6TqLRW8kEyp+PWv7suKzg2y5AIj6wCHQ4pxvdEkX
	0B0rSikBDybvLhXumFb77OHI7nw1EbK72/QF+y51mCKDBulQmr532oTNREZNgD76
	oX10FSLJEvNERQew==
Received: (qmail 3011809 invoked from network); 15 Feb 2026 23:55:22 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Feb 2026 23:55:22 +0100
X-UD-Smtp-Session: l3s3148p1@V3+qu+RKdOUujns5
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lee Jones <lee@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Srinivas Kandagatla <srini@kernel.org>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	Linus Walleij <linusw@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-remoteproc@vger.kernel.org,
	linux-doc@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-iio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-gpio@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-spi@vger.kernel.org
Subject: [RFC PATCH v2 13/13] hwspinlock: refactor consumer.h from public header
Date: Sun, 15 Feb 2026 23:54:53 +0100
Message-ID: <20260215225501.6365-14-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260215225501.6365-1-wsa+renesas@sang-engineering.com>
References: <20260215225501.6365-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260215_145542_327709_E55E45DC 
X-CRM114-Status: GOOD (  14.74  )
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

Factor out the entries only needed for consumers from the generic public
header. This allows for a clean separation between providers and
consumers.

FIXME: separate driver changes?

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/locking/hwspinlock.rst              |  2 +-
 MAINTAINERS                                       |  1 -
 drivers/base/regmap/regmap.c                      |  2 +-
 drivers/hwspinlock/hwspinlock_core.c              |  2 +-
 drivers/iio/adc/sc27xx_adc.c                      |  2 +-
 drivers/irqchip/irq-stm32mp-exti.c                |  2 +-
 drivers/mfd/syscon.c                              |  2 +-
 drivers/nvmem/sc27xx-efuse.c                      |  2 +-
 drivers/nvmem/sprd-efuse.c                        |  2 +-
 drivers/pinctrl/stm32/pinctrl-stm32.c             |  2 +-
 drivers/soc/qcom/smem.c                           |  2 +-
 drivers/spi/spi-sprd-adi.c                        |  2 +-
 .../linux/{hwspinlock.h => hwspinlock/consumer.h} | 15 ++++++---------
 13 files changed, 17 insertions(+), 21 deletions(-)
 rename include/linux/{hwspinlock.h => hwspinlock/consumer.h} (98%)

diff --git a/Documentation/locking/hwspinlock.rst b/Documentation/locking/hwspinlock.rst
index a737c702a7d1..001bcab86690 100644
--- a/Documentation/locking/hwspinlock.rst
+++ b/Documentation/locking/hwspinlock.rst
@@ -306,7 +306,7 @@ Typical usage
 
 ::
 
-	#include <linux/hwspinlock.h>
+	#include <linux/hwspinlock/consumer.h>
 	#include <linux/err.h>
 
 	int hwspinlock_example(void)
diff --git a/MAINTAINERS b/MAINTAINERS
index f9131b8cd5d2..8141a8a5ea01 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11216,7 +11216,6 @@ F:	Documentation/devicetree/bindings/hwlock/
 F:	Documentation/locking/hwspinlock.rst
 F:	drivers/hwspinlock/
 F:	include/linux/hwspinlock/
-F:	include/linux/hwspinlock.h
 
 HARDWARE TRACING FACILITIES
 M:	Alexander Shishkin <alexander.shishkin@linux.intel.com>
diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index 4231e9d4b8ff..3f4c254e8ac7 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -16,7 +16,7 @@
 #include <linux/sched.h>
 #include <linux/delay.h>
 #include <linux/log2.h>
-#include <linux/hwspinlock.h>
+#include <linux/hwspinlock/consumer.h>
 #include <linux/unaligned.h>
 
 #define CREATE_TRACE_POINTS
diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index 6c8a03deb00c..e78ec4b5cfa3 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -12,7 +12,7 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/err.h>
-#include <linux/hwspinlock.h>
+#include <linux/hwspinlock/consumer.h>
 #include <linux/hwspinlock/provider.h>
 #include <linux/jiffies.h>
 #include <linux/kernel.h>
diff --git a/drivers/iio/adc/sc27xx_adc.c b/drivers/iio/adc/sc27xx_adc.c
index 6209499c5c37..8a881d63b7dd 100644
--- a/drivers/iio/adc/sc27xx_adc.c
+++ b/drivers/iio/adc/sc27xx_adc.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (C) 2018 Spreadtrum Communications Inc.
 
-#include <linux/hwspinlock.h>
+#include <linux/hwspinlock/consumer.h>
 #include <linux/iio/iio.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
diff --git a/drivers/irqchip/irq-stm32mp-exti.c b/drivers/irqchip/irq-stm32mp-exti.c
index a24f4f1a4f8f..25d5aa67728a 100644
--- a/drivers/irqchip/irq-stm32mp-exti.c
+++ b/drivers/irqchip/irq-stm32mp-exti.c
@@ -6,7 +6,7 @@
  */
 
 #include <linux/bitops.h>
-#include <linux/hwspinlock.h>
+#include <linux/hwspinlock/consumer.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/irq.h>
diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
index e5d5def594f6..49473669e84e 100644
--- a/drivers/mfd/syscon.c
+++ b/drivers/mfd/syscon.c
@@ -11,7 +11,7 @@
 #include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/err.h>
-#include <linux/hwspinlock.h>
+#include <linux/hwspinlock/consumer.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
diff --git a/drivers/nvmem/sc27xx-efuse.c b/drivers/nvmem/sc27xx-efuse.c
index 4e2ffefac96c..309090cd4ff0 100644
--- a/drivers/nvmem/sc27xx-efuse.c
+++ b/drivers/nvmem/sc27xx-efuse.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (C) 2018 Spreadtrum Communications Inc.
 
-#include <linux/hwspinlock.h>
+#include <linux/hwspinlock/consumer.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
diff --git a/drivers/nvmem/sprd-efuse.c b/drivers/nvmem/sprd-efuse.c
index 1a7e4e5d8b86..92e3092719ba 100644
--- a/drivers/nvmem/sprd-efuse.c
+++ b/drivers/nvmem/sprd-efuse.c
@@ -3,7 +3,7 @@
 
 #include <linux/clk.h>
 #include <linux/delay.h>
-#include <linux/hwspinlock.h>
+#include <linux/hwspinlock/consumer.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/nvmem-provider.h>
diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 6a99708a5a23..17b2072d609e 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -10,7 +10,7 @@
 #include <linux/clk.h>
 #include <linux/export.h>
 #include <linux/gpio/driver.h>
-#include <linux/hwspinlock.h>
+#include <linux/hwspinlock/consumer.h>
 #include <linux/io.h>
 #include <linux/irq.h>
 #include <linux/mfd/syscon.h>
diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index d5c94b47f431..6d574d65b4a3 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
  */
 
-#include <linux/hwspinlock.h>
+#include <linux/hwspinlock/consumer.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
diff --git a/drivers/spi/spi-sprd-adi.c b/drivers/spi/spi-sprd-adi.c
index e7d83c16b46c..04313e4a63dd 100644
--- a/drivers/spi/spi-sprd-adi.c
+++ b/drivers/spi/spi-sprd-adi.c
@@ -5,7 +5,7 @@
  */
 
 #include <linux/delay.h>
-#include <linux/hwspinlock.h>
+#include <linux/hwspinlock/consumer.h>
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
diff --git a/include/linux/hwspinlock.h b/include/linux/hwspinlock/consumer.h
similarity index 98%
rename from include/linux/hwspinlock.h
rename to include/linux/hwspinlock/consumer.h
index 4fe1c8831cd1..f476222ec924 100644
--- a/include/linux/hwspinlock.h
+++ b/include/linux/hwspinlock/consumer.h
@@ -1,17 +1,16 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * Hardware spinlock public header
+ * Hardware spinlock public header for consumers
  *
  * Copyright (C) 2010 Texas Instruments Incorporated - http://www.ti.com
- *
- * Contact: Ohad Ben-Cohen <ohad@wizery.com>
+ * Copyright (C) 2026 Sang Engineering
+ * Copyright (C) 2026 Renesas Solutions Corp.
  */
 
-#ifndef __LINUX_HWSPINLOCK_H
-#define __LINUX_HWSPINLOCK_H
+#ifndef __LINUX_HWSPINLOCK_CONSUMER_H
+#define __LINUX_HWSPINLOCK_CONSUMER_H
 
 #include <linux/err.h>
-#include <linux/sched.h>
 
 /* hwspinlock mode argument */
 #define HWLOCK_IRQSTATE		0x01 /* Disable interrupts, save state */
@@ -22,8 +21,6 @@
 struct device;
 struct device_node;
 struct hwspinlock;
-struct hwspinlock_device;
-struct hwspinlock_ops;
 
 #ifdef CONFIG_HWSPINLOCK
 
@@ -403,4 +400,4 @@ static inline void hwspin_unlock(struct hwspinlock *hwlock)
 	__hwspin_unlock(hwlock, 0, NULL);
 }
 
-#endif /* __LINUX_HWSPINLOCK_H */
+#endif /* __LINUX_HWSPINLOCK_CONSUMER_H */
-- 
2.51.0


