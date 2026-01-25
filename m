Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AACF5E63CBF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 18:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sVBBtTtHZDiuRw9xiNC+g1Bn2nLrGFbkjjc5++bmQN4=; b=ZBr2SqcJm3//kXBw4ra3UYGT6M
	6fKG0CwahPdPBvgJhWpIxzg6XaeWjB01fC/rY+wKtxUnNuAP2piZ6OXpNCjXIcRaqEDuWI7KlQMSu
	3iUPbo0TaSfvzq9UEv+b39aEyFn8by44iNc3D/7a7fWktey1H5Nud4KWL7bNaLLrubAjBkebrNoS1
	kA/Au9bv2hKDAJ98V0onbxLMbSirb+UtKmuag92+OfmhV62G3SjwWvG3JUrVM9s1q/Th6FntSmgZq
	9VgMMscykT3RTKLzHsMOR53WIA5ebjGyuyZO3vpQVk/KT2oS8XRdcwePKRjBSDIVF2w6+7ddRHoiw
	DBE0q2Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk5DT-0000000BQ1a-2hEh;
	Sun, 25 Jan 2026 18:52:07 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk5DQ-0000000BQ0n-1Id5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Jan 2026 18:52:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=sVBBtTtHZDiuRw9xiNC+g1Bn2nLrGFbkjjc5++bmQN4=; b=Od2hrv
	7e587jJGvYj/YhtcC5s95KgPAHyqoi/9vVEA88KLZR36sLSG5z1yIHc0w/KN9sJ3
	IPF4p+ZLeyRbHSD+HYg1zCPacE61g+lFEDLoKOcYR7FOgALSXhnJEYmQpFvTnLO5
	QhTvlNLdk5gW/zHsm9N9aYIu06RcnEvtpZMyzzYsB6OuqWoWN9gGlbeJz51jLczF
	KmecgO9KHlZCsXOJ4pisco1DD4fh4em8sPMGZvTrzYsQrg9NHxsMVa++O+RffPHz
	wixjnGYwapkMR6u1+clrsivB8XBzi480OzPek+YvZDzARWJMHrYFwIPG6Pd8VNdW
	mql9dG4Kn5ftRhnQ==
Received: (qmail 2369557 invoked from network); 25 Jan 2026 19:51:49 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jan 2026 19:51:49 +0100
X-UD-Smtp-Session: l3s3148p1@Jf0K4jpJd0BtKXAW
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-remoteproc@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [RFC PATCH 1/4] hwspinlock: refactor existing headers into provider.h
Date: Sun, 25 Jan 2026 19:46:52 +0100
Message-ID: <20260125184654.17843-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260125184654.17843-6-wsa+renesas@sang-engineering.com>
References: <20260125184654.17843-6-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_105204_628912_B569BF93 
X-CRM114-Status: GOOD (  21.65  )
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

The ultimate goal is to allow hwspinlock drivers outside of the
hwspinlock directory. So, the public and the internal header get
refactored into a more modern public provider/consumer pair. This patch
creates the provider header. It is a plain move without functional
changes. Only a now obsolete comment gets removed which explained why
some functions do not have fallbacks if hwspinlock is not seleceted. All
acutal providers are converted as well.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 MAINTAINERS                                   |  1 +
 drivers/hwspinlock/hwspinlock_core.c          |  3 +-
 drivers/hwspinlock/omap_hwspinlock.c          |  4 +-
 drivers/hwspinlock/qcom_hwspinlock.c          |  4 +-
 drivers/hwspinlock/sprd_hwspinlock.c          |  4 +-
 drivers/hwspinlock/stm32_hwspinlock.c         |  4 +-
 drivers/hwspinlock/sun6i_hwspinlock.c         |  4 +-
 drivers/hwspinlock/u8500_hsem.c               |  3 +-
 include/linux/hwspinlock.h                    | 14 -------
 .../linux/hwspinlock/provider.h               | 40 ++++++++++++-------
 10 files changed, 33 insertions(+), 48 deletions(-)
 rename drivers/hwspinlock/hwspinlock_internal.h => include/linux/hwspinlock/provider.h (78%)

diff --git a/MAINTAINERS b/MAINTAINERS
index a56f8f00aebb..18f4991044ee 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11187,6 +11187,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git hw
 F:	Documentation/devicetree/bindings/hwlock/
 F:	Documentation/locking/hwspinlock.rst
 F:	drivers/hwspinlock/
+F:	include/linux/hwspinlock/
 F:	include/linux/hwspinlock.h
 
 HARDWARE TRACING FACILITIES
diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index cc8e952a6772..3ee4f4357e01 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -18,12 +18,11 @@
 #include <linux/jiffies.h>
 #include <linux/radix-tree.h>
 #include <linux/hwspinlock.h>
+#include <linux/hwspinlock/provider.h>
 #include <linux/pm_runtime.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
 
-#include "hwspinlock_internal.h"
-
 /* retry delay used in atomic context */
 #define HWSPINLOCK_RETRY_DELAY_US	100
 
diff --git a/drivers/hwspinlock/omap_hwspinlock.c b/drivers/hwspinlock/omap_hwspinlock.c
index 1832e0c3af6b..e2a8fe4ad96a 100644
--- a/drivers/hwspinlock/omap_hwspinlock.c
+++ b/drivers/hwspinlock/omap_hwspinlock.c
@@ -19,12 +19,10 @@
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
-#include <linux/hwspinlock.h>
+#include <linux/hwspinlock/provider.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 
-#include "hwspinlock_internal.h"
-
 /* Spinlock register offsets */
 #define SYSSTATUS_OFFSET		0x0014
 #define LOCK_BASE_OFFSET		0x0800
diff --git a/drivers/hwspinlock/qcom_hwspinlock.c b/drivers/hwspinlock/qcom_hwspinlock.c
index 0390979fd765..1b5a0c2fadee 100644
--- a/drivers/hwspinlock/qcom_hwspinlock.c
+++ b/drivers/hwspinlock/qcom_hwspinlock.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2015, Sony Mobile Communications AB
  */
 
-#include <linux/hwspinlock.h>
+#include <linux/hwspinlock/provider.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
@@ -14,8 +14,6 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
-#include "hwspinlock_internal.h"
-
 #define QCOM_MUTEX_APPS_PROC_ID	1
 #define QCOM_MUTEX_NUM_LOCKS	32
 
diff --git a/drivers/hwspinlock/sprd_hwspinlock.c b/drivers/hwspinlock/sprd_hwspinlock.c
index 22e2ffb91743..62de2a551cee 100644
--- a/drivers/hwspinlock/sprd_hwspinlock.c
+++ b/drivers/hwspinlock/sprd_hwspinlock.c
@@ -7,7 +7,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
-#include <linux/hwspinlock.h>
+#include <linux/hwspinlock/provider.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -15,8 +15,6 @@
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 
-#include "hwspinlock_internal.h"
-
 /* hwspinlock registers definition */
 #define HWSPINLOCK_RECCTRL		0x4
 #define HWSPINLOCK_MASTERID(_X_)	(0x80 + 0x4 * (_X_))
diff --git a/drivers/hwspinlock/stm32_hwspinlock.c b/drivers/hwspinlock/stm32_hwspinlock.c
index bb5c7e5f7a80..7af8e4cc564c 100644
--- a/drivers/hwspinlock/stm32_hwspinlock.c
+++ b/drivers/hwspinlock/stm32_hwspinlock.c
@@ -6,7 +6,7 @@
 
 #include <linux/clk.h>
 #include <linux/delay.h>
-#include <linux/hwspinlock.h>
+#include <linux/hwspinlock/provider.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -14,8 +14,6 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 
-#include "hwspinlock_internal.h"
-
 #define STM32_MUTEX_COREID	BIT(8)
 #define STM32_MUTEX_LOCK_BIT	BIT(31)
 #define STM32_MUTEX_NUM_LOCKS	32
diff --git a/drivers/hwspinlock/sun6i_hwspinlock.c b/drivers/hwspinlock/sun6i_hwspinlock.c
index c2d314588046..3c8c067e6312 100644
--- a/drivers/hwspinlock/sun6i_hwspinlock.c
+++ b/drivers/hwspinlock/sun6i_hwspinlock.c
@@ -7,7 +7,7 @@
 #include <linux/clk.h>
 #include <linux/debugfs.h>
 #include <linux/errno.h>
-#include <linux/hwspinlock.h>
+#include <linux/hwspinlock/provider.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -17,8 +17,6 @@
 #include <linux/spinlock.h>
 #include <linux/types.h>
 
-#include "hwspinlock_internal.h"
-
 #define DRIVER_NAME		"sun6i_hwspinlock"
 
 #define SPINLOCK_BASE_ID	0 /* there is only one hwspinlock device per SoC */
diff --git a/drivers/hwspinlock/u8500_hsem.c b/drivers/hwspinlock/u8500_hsem.c
index 5a2d8c3e0d80..ff0730613929 100644
--- a/drivers/hwspinlock/u8500_hsem.c
+++ b/drivers/hwspinlock/u8500_hsem.c
@@ -19,10 +19,9 @@
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/hwspinlock.h>
+#include <linux/hwspinlock/provider.h>
 #include <linux/platform_device.h>
 
-#include "hwspinlock_internal.h"
-
 /*
  * Implementation of STE's HSem protocol 1 without interrutps.
  * The only masterID we allow is '0x01' to force people to use
diff --git a/include/linux/hwspinlock.h b/include/linux/hwspinlock.h
index f35b42e8c5de..7f38960c7162 100644
--- a/include/linux/hwspinlock.h
+++ b/include/linux/hwspinlock.h
@@ -55,9 +55,6 @@ struct hwspinlock_pdata {
 
 #ifdef CONFIG_HWSPINLOCK
 
-int hwspin_lock_register(struct hwspinlock_device *bank, struct device *dev,
-		const struct hwspinlock_ops *ops, int base_id, int num_locks);
-int hwspin_lock_unregister(struct hwspinlock_device *bank);
 struct hwspinlock *hwspin_lock_request_specific(unsigned int id);
 int hwspin_lock_free(struct hwspinlock *hwlock);
 int of_hwspin_lock_get_id(struct device_node *np, int index);
@@ -70,13 +67,6 @@ int hwspin_lock_bust(struct hwspinlock *hwlock, unsigned int id);
 int devm_hwspin_lock_free(struct device *dev, struct hwspinlock *hwlock);
 struct hwspinlock *devm_hwspin_lock_request_specific(struct device *dev,
 						     unsigned int id);
-int devm_hwspin_lock_unregister(struct device *dev,
-				struct hwspinlock_device *bank);
-int devm_hwspin_lock_register(struct device *dev,
-			      struct hwspinlock_device *bank,
-			      const struct hwspinlock_ops *ops,
-			      int base_id, int num_locks);
-
 #else /* !CONFIG_HWSPINLOCK */
 
 /*
@@ -85,10 +75,6 @@ int devm_hwspin_lock_register(struct device *dev,
  * code path get compiled away. This way, if CONFIG_HWSPINLOCK is not
  * required on a given setup, users will still work.
  *
- * The only exception is hwspin_lock_register/hwspin_lock_unregister, with which
- * we _do_ want users to fail (no point in registering hwspinlock instances if
- * the framework is not available).
- *
  * Note: ERR_PTR(-ENODEV) will still be considered a success for NULL-checking
  * users. Others, which care, can still check this with IS_ERR.
  */
diff --git a/drivers/hwspinlock/hwspinlock_internal.h b/include/linux/hwspinlock/provider.h
similarity index 78%
rename from drivers/hwspinlock/hwspinlock_internal.h
rename to include/linux/hwspinlock/provider.h
index f298fc0ee5ad..d53bbacec744 100644
--- a/drivers/hwspinlock/hwspinlock_internal.h
+++ b/include/linux/hwspinlock/provider.h
@@ -7,14 +7,26 @@
  * Contact: Ohad Ben-Cohen <ohad@wizery.com>
  */
 
-#ifndef __HWSPINLOCK_HWSPINLOCK_H
-#define __HWSPINLOCK_HWSPINLOCK_H
+#ifndef __LINUX_HWSPINLOCK_PROVIDER_H
+#define __LINUX_HWSPINLOCK_PROVIDER_H
 
 #include <linux/spinlock.h>
 #include <linux/device.h>
 
 struct hwspinlock_device;
 
+/**
+ * struct hwspinlock - this struct represents a single hwspinlock instance
+ * @bank: the hwspinlock_device structure which owns this lock
+ * @lock: initialized and used by hwspinlock core
+ * @priv: private data, owned by the underlying platform-specific hwspinlock drv
+ */
+struct hwspinlock {
+	struct hwspinlock_device *bank;
+	spinlock_t lock;
+	void *priv;
+};
+
 /**
  * struct hwspinlock_ops - platform-specific hwspinlock handlers
  *
@@ -34,18 +46,6 @@ struct hwspinlock_ops {
 	void (*relax)(struct hwspinlock *lock);
 };
 
-/**
- * struct hwspinlock - this struct represents a single hwspinlock instance
- * @bank: the hwspinlock_device structure which owns this lock
- * @lock: initialized and used by hwspinlock core
- * @priv: private data, owned by the underlying platform-specific hwspinlock drv
- */
-struct hwspinlock {
-	struct hwspinlock_device *bank;
-	spinlock_t lock;
-	void *priv;
-};
-
 /**
  * struct hwspinlock_device - a device which usually spans numerous hwspinlocks
  * @dev: underlying device, will be used to invoke runtime PM api
@@ -69,4 +69,14 @@ static inline int hwlock_to_id(struct hwspinlock *hwlock)
 	return hwlock->bank->base_id + local_id;
 }
 
-#endif /* __HWSPINLOCK_HWSPINLOCK_H */
+int hwspin_lock_register(struct hwspinlock_device *bank, struct device *dev,
+		const struct hwspinlock_ops *ops, int base_id, int num_locks);
+int hwspin_lock_unregister(struct hwspinlock_device *bank);
+int devm_hwspin_lock_register(struct device *dev,
+			      struct hwspinlock_device *bank,
+			      const struct hwspinlock_ops *ops,
+			      int base_id, int num_locks);
+int devm_hwspin_lock_unregister(struct device *dev,
+				struct hwspinlock_device *bank);
+
+#endif /* __LINUX_HWSPINLOCK_PROVIDER_H */
-- 
2.47.3


