Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F2D108E1E7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 11:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Tuc6A/FvFB15id+FPPkagjKPIMyqvuTmoP13uOV7sE=; b=E8TewSuaRnhj25a5IMjXThrott
	IM/VN9AwAwCgFzNgxHSPAX7lwYAEGjMew7aM1NKzXupkcn+k6w43AqQ3Jm6cXEeeeXMg7hqq/+wqi
	lDRy6ziiKSBiiiIe6eEJWByScLAXxn9nfCKm9UEqygHnrCBw9wNgH/nXpq458io8r2iB7PzB9lpth
	vEbGgqCFrNnWhVKtP1DPv8ubPa4fhodiHypavq3kXTUYxvHl3His0hH79JOKmziMojaY85clNUtx+
	s8AK9KtTtcVKkv978+P9kVCt7r/2Xjp6AvUtG/8ssgW3G/runiplGrsLBAOW+ZH/xL1Zq94vYhW69
	nlfNGndg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3B7O-0000000ATXz-3OYc;
	Thu, 19 Mar 2026 11:00:46 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3B7K-0000000ATTA-06AV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 11:00:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=4Tuc6A/FvFB15id+FPPkagjKPIMyqvuTmoP13uOV7sE=; b=OM7oZl
	4wxQSWnDtuWEqld2AHyoETYmdLYMn7OoPkBh5yoZ54wDEQXV1SdREEMEoyKyTTr5
	iGxPSyEmYu1MPIoK7XKUPNs7wcbc5FTYLzgvrfmUMe49WR8WrhwyLydGMOilHJNZ
	oJXeGE5St7docsKmf0BYcjRDfQgdp1OrOdinTQIXww+bFkj8MDDWfk7X/WGprYPG
	drSePTuacpgC+pyB6A5klblrODCcxCnZ3Nlnik8oTEWZ6tWHII6SoSgS8EACLOnE
	y5ZYXBEIdzsXBQflrkRN9IgAYAEJRo4DKYYeSCg7xw7WAwHWaJq2IJhW9q27ybFq
	vdi5+FYYDr6qtptg==
Received: (qmail 1100027 invoked from network); 19 Mar 2026 12:00:12 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Mar 2026 12:00:12 +0100
X-UD-Smtp-Session: l3s3148p1@MJP5eF5N1q0gAwDPXzF+ANZpdrMKUeLI
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
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
	linux-remoteproc@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v5 14/15] hwspinlock: refactor provider.h from public header
Date: Thu, 19 Mar 2026 11:59:36 +0100
Message-ID: <20260319105947.6237-15-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260319105947.6237-1-wsa+renesas@sang-engineering.com>
References: <20260319105947.6237-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_040042_350290_482F68D4 
X-CRM114-Status: GOOD (  22.82  )
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

Factor out the entries only needed for providers from the generic public
header. This allows for a clean separation between providers and
consumers. All providers are in the hwspinlock subsystem currently and
are trivially converted here as well.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 MAINTAINERS                           |  1 +
 drivers/hwspinlock/hwspinlock_core.c  |  1 +
 drivers/hwspinlock/omap_hwspinlock.c  |  2 +-
 drivers/hwspinlock/qcom_hwspinlock.c  |  2 +-
 drivers/hwspinlock/sprd_hwspinlock.c  |  2 +-
 drivers/hwspinlock/stm32_hwspinlock.c |  2 +-
 drivers/hwspinlock/sun6i_hwspinlock.c |  2 +-
 include/linux/hwspinlock.h            | 44 --------------------
 include/linux/hwspinlock/provider.h   | 60 +++++++++++++++++++++++++++
 9 files changed, 67 insertions(+), 49 deletions(-)
 create mode 100644 include/linux/hwspinlock/provider.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 59bccd940fe0..117aa8d118b1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11211,6 +11211,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git hw
 F:	Documentation/devicetree/bindings/hwlock/
 F:	Documentation/locking/hwspinlock.rst
 F:	drivers/hwspinlock/
+F:	include/linux/hwspinlock/
 F:	include/linux/hwspinlock.h
 
 HARDWARE TRACING FACILITIES
diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index adf6fefb382f..6c8a03deb00c 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -13,6 +13,7 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/hwspinlock.h>
+#include <linux/hwspinlock/provider.h>
 #include <linux/jiffies.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
diff --git a/drivers/hwspinlock/omap_hwspinlock.c b/drivers/hwspinlock/omap_hwspinlock.c
index 41a8812708ef..1be5c9d5091b 100644
--- a/drivers/hwspinlock/omap_hwspinlock.c
+++ b/drivers/hwspinlock/omap_hwspinlock.c
@@ -19,7 +19,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
-#include <linux/hwspinlock.h>
+#include <linux/hwspinlock/provider.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 
diff --git a/drivers/hwspinlock/qcom_hwspinlock.c b/drivers/hwspinlock/qcom_hwspinlock.c
index 22cc6f9003df..7fdbb1e58b29 100644
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
diff --git a/drivers/hwspinlock/sprd_hwspinlock.c b/drivers/hwspinlock/sprd_hwspinlock.c
index 0f4fc622e3cd..46b55d939ea8 100644
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
diff --git a/drivers/hwspinlock/stm32_hwspinlock.c b/drivers/hwspinlock/stm32_hwspinlock.c
index 8eafe1a74b1b..2620d722ee1d 100644
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
diff --git a/drivers/hwspinlock/sun6i_hwspinlock.c b/drivers/hwspinlock/sun6i_hwspinlock.c
index 145d284c5ab5..24e60009fa76 100644
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
diff --git a/include/linux/hwspinlock.h b/include/linux/hwspinlock.h
index 4f5b6932712e..4fe1c8831cd1 100644
--- a/include/linux/hwspinlock.h
+++ b/include/linux/hwspinlock.h
@@ -27,34 +27,6 @@ struct hwspinlock_ops;
 
 #ifdef CONFIG_HWSPINLOCK
 
-/**
- * struct hwspinlock_ops - platform-specific hwspinlock handlers
- *
- * @trylock:	make a single attempt to take the lock. returns 0 on
- *		failure and true on success. may _not_ sleep.
- * @unlock:	release the lock. always succeed. may _not_ sleep.
- * @bust:	optional, platform-specific bust handler, called by hwspinlock
- *		core to bust a specific lock.
- * @relax:	optional, platform-specific relax handler, called by hwspinlock
- *		core while spinning on a lock, between two successive
- *		invocations of @trylock. may _not_ sleep.
- * @init_priv:	optional, callback used when registering the hwspinlock device.
- *		Its return value will be used to fill the per-lock 'priv' data.
- */
-struct hwspinlock_ops {
-	int (*trylock)(struct hwspinlock *lock);
-	void (*unlock)(struct hwspinlock *lock);
-	int (*bust)(struct hwspinlock *lock, unsigned int id);
-	void (*relax)(struct hwspinlock *lock);
-	void *(*init_priv)(int local_id, void *init_data);
-};
-
-void *hwspin_lock_get_priv(struct hwspinlock *hwlock);
-struct device *hwspin_lock_get_dev(struct hwspinlock *hwlock);
-int hwlock_to_id(struct hwspinlock *hwlock);
-struct hwspinlock_device *hwspin_lock_register(struct device *dev, const struct hwspinlock_ops *ops,
-					       int base_id, int num_locks, void *init_data);
-int hwspin_lock_unregister(struct hwspinlock_device *bank);
 struct hwspinlock *hwspin_lock_request_specific(unsigned int id);
 int hwspin_lock_free(struct hwspinlock *hwlock);
 int of_hwspin_lock_get_id(struct device_node *np, int index);
@@ -67,18 +39,6 @@ int hwspin_lock_bust(struct hwspinlock *hwlock, unsigned int id);
 int devm_hwspin_lock_free(struct device *dev, struct hwspinlock *hwlock);
 struct hwspinlock *devm_hwspin_lock_request_specific(struct device *dev,
 						     unsigned int id);
-int devm_hwspin_lock_unregister(struct device *dev,
-				struct hwspinlock_device *bank);
-struct hwspinlock_device *devm_hwspin_lock_register(struct device *dev, const struct hwspinlock_ops *ops,
-						    int base_id, int num_locks, void *init_data);
-
-static inline int devm_hwspin_lock_register_errno(struct device *dev,
-						  const struct hwspinlock_ops *ops,
-						  int base_id, int num_locks, void *init_data)
-{
-	return PTR_ERR_OR_ZERO(devm_hwspin_lock_register(dev, ops, base_id, num_locks, init_data));
-}
-
 #else /* !CONFIG_HWSPINLOCK */
 
 /*
@@ -87,10 +47,6 @@ static inline int devm_hwspin_lock_register_errno(struct device *dev,
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
diff --git a/include/linux/hwspinlock/provider.h b/include/linux/hwspinlock/provider.h
new file mode 100644
index 000000000000..73c7b0cb6735
--- /dev/null
+++ b/include/linux/hwspinlock/provider.h
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Hardware spinlock public header for providers
+ *
+ * Copyright (C) 2010 Texas Instruments Incorporated - http://www.ti.com
+ * Copyright (C) 2026 Sang Engineering
+ * Copyright (C) 2026 Renesas Solutions Corp.
+ */
+
+#ifndef __LINUX_HWSPINLOCK_PROVIDER_H
+#define __LINUX_HWSPINLOCK_PROVIDER_H
+
+#include <linux/err.h>
+
+struct device;
+struct hwspinlock;
+struct hwspinlock_device;
+
+/**
+ * struct hwspinlock_ops - platform-specific hwspinlock handlers
+ *
+ * @trylock:	make a single attempt to take the lock. returns 0 on
+ *		failure and true on success. may _not_ sleep.
+ * @unlock:	release the lock. always succeed. may _not_ sleep.
+ * @bust:	optional, platform-specific bust handler, called by hwspinlock
+ *		core to bust a specific lock.
+ * @relax:	optional, platform-specific relax handler, called by hwspinlock
+ *		core while spinning on a lock, between two successive
+ *		invocations of @trylock. may _not_ sleep.
+ * @init_priv:	optional, callback used when registering the hwspinlock device.
+ *		Its return value will be used to fill the per-lock 'priv' data.
+ */
+struct hwspinlock_ops {
+	int (*trylock)(struct hwspinlock *lock);
+	void (*unlock)(struct hwspinlock *lock);
+	int (*bust)(struct hwspinlock *lock, unsigned int id);
+	void (*relax)(struct hwspinlock *lock);
+	void *(*init_priv)(int local_id, void *init_data);
+};
+
+void *hwspin_lock_get_priv(struct hwspinlock *hwlock);
+struct device *hwspin_lock_get_dev(struct hwspinlock *hwlock);
+int hwlock_to_id(struct hwspinlock *hwlock);
+struct hwspinlock_device *hwspin_lock_register(struct device *dev, const struct hwspinlock_ops *ops,
+					       int base_id, int num_locks, void *init_data);
+int hwspin_lock_unregister(struct hwspinlock_device *bank);
+
+struct hwspinlock_device *devm_hwspin_lock_register(struct device *dev, const struct hwspinlock_ops *ops,
+						    int base_id, int num_locks, void *init_data);
+int devm_hwspin_lock_unregister(struct device *dev,
+				struct hwspinlock_device *bank);
+
+static inline int devm_hwspin_lock_register_errno(struct device *dev,
+						  const struct hwspinlock_ops *ops,
+						  int base_id, int num_locks, void *init_data)
+{
+	return PTR_ERR_OR_ZERO(devm_hwspin_lock_register(dev, ops, base_id, num_locks, init_data));
+}
+
+#endif /* __LINUX_HWSPINLOCK_PROVIDER_H */
-- 
2.51.0


