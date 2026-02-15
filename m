Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D5EE63F1C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Feb 2026 22:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ebCf8IAGgl2B/372c2QLceVUsgeqo2XZMEmzfMHhLb4=; b=nNuPiSVgrQwDNB9O2KI6PZJkX8
	I8LnwoijI2VoyYpVoRbWNkhH8dSCc3xdqZJX2jhjnTPRlRzcFD2koswwiPC2xnISQ/enmllkuBInS
	SXUohpL1n8R07cuOyrDdjYGZu1SsObZeLUO/6dbjrBWR/iUTPUWkjWxSJwoTSN6DsFI5sUD8fh9Nw
	Ms0nOliS3JArtI5SXaYNryqutzFzGUUR/VMWAfCbem/Kv7+qJPlRtdnyDycPkpgT/U6Dih/Hul14t
	8zKW5pMiF9ZrUs2Hxgg22NSpUX6HT+W8dwJg21r6PHGlmh2KYZ3Bt1JMPb78OlrVLfvFit7ijpMBn
	ji19BbBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrl1b-00000005jV4-3J6I;
	Sun, 15 Feb 2026 22:55:35 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrl1W-00000005jNa-1YD7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Feb 2026 22:55:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=ebCf8IAGgl2B/372c2QLceVUsgeqo2XZMEmzfMHhLb4=; b=goAWzt
	tqa7xKol9ZWL/DrW1QbOpXEcLfzNhLol8Zt7yh4/0H/GCuduAoLKKVGIpak6D/Yn
	BHsYtHPI3mioE8FQ5dKryvw432BvjoDHNwJtnpAFvfXzQkYPBEtOnI8lqExiUj8l
	42KjrBsmZ4bOtYm7xhuvyg3IYiBJXaqzVlh6YValGbaN/W6kGGGLBVmgni/is20e
	Lquu4K9Y3As5wrWLmAQxRwvI2iRtg1z6I3zNhNN4ui8W8LINAdncVSn1bXlIoQR5
	eb4Km/EVlE5/nbbrI5T0JJf/faG3olFjUZDCuhL9M1ae/re1Azcw0rxvmqBKeuua
	583zjJ9O3f9x+y7A==
Received: (qmail 3011526 invoked from network); 15 Feb 2026 23:55:14 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Feb 2026 23:55:14 +0100
X-UD-Smtp-Session: l3s3148p1@ptstu+RK9MAujns5
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-arm-kernel@lists.infradead.org,
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
	linux-sunxi@lists.linux.dev
Subject: [RFC PATCH v2 08/13] hwspinlock: handle hwspinlock device allocation in the core
Date: Sun, 15 Feb 2026 23:54:48 +0100
Message-ID: <20260215225501.6365-9-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260215225501.6365-1-wsa+renesas@sang-engineering.com>
References: <20260215225501.6365-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260215_145530_835585_1AE56CE4 
X-CRM114-Status: GOOD (  26.09  )
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

Providers have been refactored to avoid using core internal structures.
As a result, they do not need to allocate the hwspinlock device on their
own anymore because they can access everything they need with helpers.

So, the allocation is moved to the core. As a result, the registering
functions now return a pointer to the (soon) opaque hwspinlock device
which may be needed for unregistering only.

Because the argument list of the registering functions is changed, all
users are changed here as well.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/hwspinlock/hwspinlock_core.c  | 48 +++++++++++++++------------
 drivers/hwspinlock/omap_hwspinlock.c  | 10 ++----
 drivers/hwspinlock/qcom_hwspinlock.c  | 11 ++----
 drivers/hwspinlock/sprd_hwspinlock.c  | 17 ++++------
 drivers/hwspinlock/stm32_hwspinlock.c |  7 ++--
 drivers/hwspinlock/sun6i_hwspinlock.c | 12 ++-----
 include/linux/hwspinlock.h            | 17 ++++++----
 7 files changed, 52 insertions(+), 70 deletions(-)

diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index afe1e7ce2829..a7610ba755b4 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -21,6 +21,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
+#include <linux/slab.h>
 
 #include "hwspinlock_internal.h"
 
@@ -502,7 +503,6 @@ static struct hwspinlock *hwspin_lock_unregister_single(unsigned int id)
 
 /**
  * hwspin_lock_register() - register a new hw spinlock device
- * @bank: the hwspinlock device, which usually provides numerous hw locks
  * @dev: the backing device
  * @ops: hwspinlock handlers for this device
  * @base_id: id of the first hardware spinlock in this bank
@@ -514,21 +514,25 @@ static struct hwspinlock *hwspin_lock_unregister_single(unsigned int id)
  *
  * Should be called from a process context (might sleep)
  *
- * Returns: %0 on success, or an appropriate error code on failure
+ * Returns: a pointer to the device (needed for unregistering), or an
+ * appropriate error pointer on failure
  */
-int hwspin_lock_register(struct hwspinlock_device *bank, struct device *dev,
-		const struct hwspinlock_ops *ops, int base_id, int num_locks,
-		void *init_data)
+struct hwspinlock_device *hwspin_lock_register(struct device *dev, const struct hwspinlock_ops *ops,
+					       int base_id, int num_locks, void *init_data)
 {
+	struct hwspinlock_device *bank;
 	struct hwspinlock *hwlock;
 	int ret, i;
 
-	if (!bank || !ops || !dev || !num_locks || !ops->trylock ||
-							!ops->unlock) {
+	if (!ops || !dev || !num_locks || !ops->trylock || !ops->unlock) {
 		pr_err("invalid parameters\n");
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
 	}
 
+	bank = kzalloc(struct_size(bank, lock, num_locks), GFP_KERNEL);
+	if (!bank)
+		return ERR_PTR(-ENOMEM);
+
 	bank->dev = dev;
 	bank->ops = ops;
 	bank->base_id = base_id;
@@ -553,12 +557,13 @@ int hwspin_lock_register(struct hwspinlock_device *bank, struct device *dev,
 			goto reg_failed;
 	}
 
-	return 0;
+	return bank;
 
 reg_failed:
 	while (--i >= 0)
 		hwspin_lock_unregister_single(base_id + i);
-	return ret;
+	kfree(bank);
+	return ERR_PTR(ret);
 }
 EXPORT_SYMBOL_GPL(hwspin_lock_register);
 
@@ -589,6 +594,8 @@ int hwspin_lock_unregister(struct hwspinlock_device *bank)
 		WARN_ON(tmp != hwlock);
 	}
 
+	kfree(bank);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(hwspin_lock_unregister);
@@ -639,7 +646,6 @@ EXPORT_SYMBOL_GPL(devm_hwspin_lock_unregister);
  * devm_hwspin_lock_register() - register a new hw spinlock device for
  *				 a managed device
  * @dev: the backing device
- * @bank: the hwspinlock device, which usually provides numerous hw locks
  * @ops: hwspinlock handlers for this device
  * @base_id: id of the first hardware spinlock in this bank
  * @num_locks: number of hwspinlocks provided by this device
@@ -650,29 +656,27 @@ EXPORT_SYMBOL_GPL(devm_hwspin_lock_unregister);
  *
  * Should be called from a process context (might sleep)
  *
- * Returns: %0 on success, or an appropriate error code on failure
+ * Returns: a pointer to the device (usable for unregistering), or an
+ * appropriate error pointer on failure
  */
-int devm_hwspin_lock_register(struct device *dev,
-			      struct hwspinlock_device *bank,
-			      const struct hwspinlock_ops *ops,
-			      int base_id, int num_locks, void *init_data)
+struct hwspinlock_device *devm_hwspin_lock_register(struct device *dev, const struct hwspinlock_ops *ops,
+						    int base_id, int num_locks, void *init_data)
 {
-	struct hwspinlock_device **ptr;
-	int ret;
+	struct hwspinlock_device **ptr, *bank;
 
 	ptr = devres_alloc(devm_hwspin_lock_unreg, sizeof(*ptr), GFP_KERNEL);
 	if (!ptr)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
-	ret = hwspin_lock_register(bank, dev, ops, base_id, num_locks, init_data);
-	if (!ret) {
+	bank = hwspin_lock_register(dev, ops, base_id, num_locks, init_data);
+	if (!IS_ERR(bank)) {
 		*ptr = bank;
 		devres_add(dev, ptr);
 	} else {
 		devres_free(ptr);
 	}
 
-	return ret;
+	return bank;
 }
 EXPORT_SYMBOL_GPL(devm_hwspin_lock_register);
 
diff --git a/drivers/hwspinlock/omap_hwspinlock.c b/drivers/hwspinlock/omap_hwspinlock.c
index 9a9cb3692348..f1ff6406db46 100644
--- a/drivers/hwspinlock/omap_hwspinlock.c
+++ b/drivers/hwspinlock/omap_hwspinlock.c
@@ -82,7 +82,6 @@ static const struct hwspinlock_ops omap_hwspinlock_ops = {
 
 static int omap_hwspinlock_probe(struct platform_device *pdev)
 {
-	struct hwspinlock_device *bank;
 	void __iomem *io_base;
 	int num_locks, i, ret;
 	/* Only a single hwspinlock block device is supported */
@@ -119,13 +118,8 @@ static int omap_hwspinlock_probe(struct platform_device *pdev)
 
 	num_locks = i * 32; /* actual number of locks in this device */
 
-	bank = devm_kzalloc(&pdev->dev, struct_size(bank, lock, num_locks),
-			    GFP_KERNEL);
-	if (!bank)
-		return -ENOMEM;
-
-	return devm_hwspin_lock_register(&pdev->dev, bank, &omap_hwspinlock_ops,
-					 base_id, num_locks, io_base + LOCK_BASE_OFFSET);
+	return devm_hwspin_lock_register_errno(&pdev->dev, &omap_hwspinlock_ops, base_id,
+					       num_locks, io_base + LOCK_BASE_OFFSET);
 }
 
 static const struct of_device_id omap_hwspinlock_of_match[] = {
diff --git a/drivers/hwspinlock/qcom_hwspinlock.c b/drivers/hwspinlock/qcom_hwspinlock.c
index 73b280988109..e2836d6728e8 100644
--- a/drivers/hwspinlock/qcom_hwspinlock.c
+++ b/drivers/hwspinlock/qcom_hwspinlock.c
@@ -223,9 +223,7 @@ static struct regmap *qcom_hwspinlock_probe_mmio(struct platform_device *pdev,
 static int qcom_hwspinlock_probe(struct platform_device *pdev)
 {
 	struct qcom_hwspinlock_priv_init_data init;
-	struct hwspinlock_device *bank;
 	struct regmap *regmap;
-	size_t array_size;
 
 	regmap = qcom_hwspinlock_probe_syscon(pdev, &init.base, &init.stride);
 	if (IS_ERR(regmap) && PTR_ERR(regmap) == -ENODEV)
@@ -234,16 +232,11 @@ static int qcom_hwspinlock_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	array_size = QCOM_MUTEX_NUM_LOCKS * sizeof(struct hwspinlock);
-	bank = devm_kzalloc(&pdev->dev, sizeof(*bank) + array_size, GFP_KERNEL);
-	if (!bank)
-		return -ENOMEM;
-
 	init.dev = &pdev->dev;
 	init.regmap = regmap;
 
-	return devm_hwspin_lock_register(&pdev->dev, bank, &qcom_hwspinlock_ops,
-					 0, QCOM_MUTEX_NUM_LOCKS, &init);
+	return devm_hwspin_lock_register_errno(&pdev->dev, &qcom_hwspinlock_ops,
+					       0, QCOM_MUTEX_NUM_LOCKS, &init);
 }
 
 static struct platform_driver qcom_hwspinlock_driver = {
diff --git a/drivers/hwspinlock/sprd_hwspinlock.c b/drivers/hwspinlock/sprd_hwspinlock.c
index c19b680d5fdf..95b254e9b6a0 100644
--- a/drivers/hwspinlock/sprd_hwspinlock.c
+++ b/drivers/hwspinlock/sprd_hwspinlock.c
@@ -33,15 +33,14 @@
 struct sprd_hwspinlock_dev {
 	void __iomem *base;
 	struct clk *clk;
-	struct hwspinlock_device bank;
 };
 
 /* try to lock the hardware spinlock */
 static int sprd_hwspinlock_trylock(struct hwspinlock *lock)
 {
-	struct sprd_hwspinlock_dev *sprd_hwlock =
-		dev_get_drvdata(hwspin_lock_get_dev(lock));
 	void __iomem *addr = hwspin_lock_get_priv(lock);
+	struct device *dev = hwspin_lock_get_dev(lock);
+	struct sprd_hwspinlock_dev *sprd_hwlock = dev_get_drvdata(dev);
 	int user_id, lock_id;
 
 	if (!readl(addr))
@@ -50,8 +49,7 @@ static int sprd_hwspinlock_trylock(struct hwspinlock *lock)
 	lock_id = hwlock_to_id(lock);
 	/* get the hardware spinlock master/user id */
 	user_id = readl(sprd_hwlock->base + HWSPINLOCK_MASTERID(lock_id));
-	dev_warn(sprd_hwlock->bank.dev,
-		 "hwspinlock [%d] lock failed and master/user id = %d!\n",
+	dev_warn(dev, "hwspinlock [%d] lock failed and master/user id = %d!\n",
 		 lock_id, user_id);
 	return 0;
 }
@@ -99,9 +97,7 @@ static int sprd_hwspinlock_probe(struct platform_device *pdev)
 	if (!pdev->dev.of_node)
 		return -ENODEV;
 
-	sprd_hwlock = devm_kzalloc(&pdev->dev,
-				   struct_size(sprd_hwlock, bank.lock, SPRD_HWLOCKS_NUM),
-				   GFP_KERNEL);
+	sprd_hwlock = devm_kzalloc(&pdev->dev, sizeof(*sprd_hwlock), GFP_KERNEL);
 	if (!sprd_hwlock)
 		return -ENOMEM;
 
@@ -132,9 +128,8 @@ static int sprd_hwspinlock_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, sprd_hwlock);
 
-	return devm_hwspin_lock_register(&pdev->dev, &sprd_hwlock->bank,
-					 &sprd_hwspinlock_ops, 0,
-					 SPRD_HWLOCKS_NUM, sprd_hwlock->base);
+	return devm_hwspin_lock_register_errno(&pdev->dev, &sprd_hwspinlock_ops, 0,
+					       SPRD_HWLOCKS_NUM, sprd_hwlock->base);
 }
 
 static const struct of_device_id sprd_hwspinlock_of_match[] = {
diff --git a/drivers/hwspinlock/stm32_hwspinlock.c b/drivers/hwspinlock/stm32_hwspinlock.c
index 02db950c9450..a966e967dcdb 100644
--- a/drivers/hwspinlock/stm32_hwspinlock.c
+++ b/drivers/hwspinlock/stm32_hwspinlock.c
@@ -22,7 +22,6 @@
 
 struct stm32_hwspinlock {
 	struct clk *clk;
-	struct hwspinlock_device bank;
 };
 
 static int stm32_hwspinlock_trylock(struct hwspinlock *lock)
@@ -87,7 +86,7 @@ static int stm32_hwspinlock_probe(struct platform_device *pdev)
 	if (IS_ERR(io_base))
 		return PTR_ERR(io_base);
 
-	hw = devm_kzalloc(dev, struct_size(hw, bank.lock, STM32_MUTEX_NUM_LOCKS), GFP_KERNEL);
+	hw = devm_kzalloc(dev, sizeof(*hw), GFP_KERNEL);
 	if (!hw)
 		return -ENOMEM;
 
@@ -114,8 +113,8 @@ static int stm32_hwspinlock_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = devm_hwspin_lock_register(dev, &hw->bank, &stm32_hwspinlock_ops,
-					0, STM32_MUTEX_NUM_LOCKS, io_base);
+	ret = devm_hwspin_lock_register_errno(dev, &stm32_hwspinlock_ops,
+					      0, STM32_MUTEX_NUM_LOCKS, io_base);
 
 	if (ret)
 		dev_err(dev, "Failed to register hwspinlock\n");
diff --git a/drivers/hwspinlock/sun6i_hwspinlock.c b/drivers/hwspinlock/sun6i_hwspinlock.c
index 7d0c639c0e82..8e17deb503c7 100644
--- a/drivers/hwspinlock/sun6i_hwspinlock.c
+++ b/drivers/hwspinlock/sun6i_hwspinlock.c
@@ -27,7 +27,6 @@
 #define SPINLOCK_NOTTAKEN	0
 
 struct sun6i_hwspinlock_data {
-	struct hwspinlock_device *bank;
 	struct reset_control *reset;
 	struct clk *ahb_clk;
 	struct dentry *debugfs;
@@ -161,13 +160,6 @@ static int sun6i_hwspinlock_probe(struct platform_device *pdev)
 		goto bank_fail;
 	}
 
-	priv->bank = devm_kzalloc(&pdev->dev, struct_size(priv->bank, lock, priv->nlocks),
-				  GFP_KERNEL);
-	if (!priv->bank) {
-		err = -ENOMEM;
-		goto bank_fail;
-	}
-
 	/* failure of debugfs is considered non-fatal */
 	sun6i_hwspinlock_debugfs_init(priv);
 	if (IS_ERR(priv->debugfs))
@@ -179,8 +171,8 @@ static int sun6i_hwspinlock_probe(struct platform_device *pdev)
 		goto bank_fail;
 	}
 
-	return devm_hwspin_lock_register(&pdev->dev, priv->bank, &sun6i_hwspinlock_ops,
-					 SPINLOCK_BASE_ID, priv->nlocks, io_base + SPINLOCK_LOCK_REGN);
+	return devm_hwspin_lock_register_errno(&pdev->dev, &sun6i_hwspinlock_ops, SPINLOCK_BASE_ID,
+					       priv->nlocks, io_base + SPINLOCK_LOCK_REGN);
 
 bank_fail:
 	clk_disable_unprepare(priv->ahb_clk);
diff --git a/include/linux/hwspinlock.h b/include/linux/hwspinlock.h
index 094a6d0d39d6..58733cda7a9a 100644
--- a/include/linux/hwspinlock.h
+++ b/include/linux/hwspinlock.h
@@ -29,8 +29,8 @@ struct hwspinlock_ops;
 
 void *hwspin_lock_get_priv(struct hwspinlock *hwlock);
 struct device *hwspin_lock_get_dev(struct hwspinlock *hwlock);
-int hwspin_lock_register(struct hwspinlock_device *bank, struct device *dev,
-		const struct hwspinlock_ops *ops, int base_id, int num_locks, void *init_data);
+struct hwspinlock_device *hwspin_lock_register(struct device *dev, const struct hwspinlock_ops *ops,
+					       int base_id, int num_locks, void *init_data);
 int hwspin_lock_unregister(struct hwspinlock_device *bank);
 struct hwspinlock *hwspin_lock_request_specific(unsigned int id);
 int hwspin_lock_free(struct hwspinlock *hwlock);
@@ -46,10 +46,15 @@ struct hwspinlock *devm_hwspin_lock_request_specific(struct device *dev,
 						     unsigned int id);
 int devm_hwspin_lock_unregister(struct device *dev,
 				struct hwspinlock_device *bank);
-int devm_hwspin_lock_register(struct device *dev,
-			      struct hwspinlock_device *bank,
-			      const struct hwspinlock_ops *ops,
-			      int base_id, int num_locks, void *init_data);
+struct hwspinlock_device *devm_hwspin_lock_register(struct device *dev, const struct hwspinlock_ops *ops,
+						    int base_id, int num_locks, void *init_data);
+
+static inline int devm_hwspin_lock_register_errno(struct device *dev,
+						  const struct hwspinlock_ops *ops,
+						  int base_id, int num_locks, void *init_data)
+{
+	return PTR_ERR_OR_ZERO(devm_hwspin_lock_register(dev, ops, base_id, num_locks, init_data));
+}
 
 #else /* !CONFIG_HWSPINLOCK */
 
-- 
2.51.0


