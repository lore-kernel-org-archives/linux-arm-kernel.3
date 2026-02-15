Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B210E63F1C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Feb 2026 22:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jn0mkrbIShFcsJPVeHZ53xi/cLQEfalMOWyFCxoe5g4=; b=27YEJBcaAQeTHt8tgNFLYWpOVk
	FCPB4sjDpkkjjJhfS0ipaVP5+nlOijRcz8hngTPH1YZGVS9mzfowYbjJdj2ByWjv63AB0SVM2YxoI
	mcpYDqrfOvsN8kKI7CjtRiRD9no/MZ9CmjRBVzoxacmMeJGlUqMO4k/Z1juiKdKFaP+szVSZFZJk/
	eFe2UyAYUwv9ZxgMbv+kKT2zqGceMlZk3cto5TQZnqLcqCbaiFPyJDft+eEQ3RvrQpH9RrsdHnzmP
	Gfu6znn6BqqLcpgHamXt4q5bJUKS2EUn3eVEgphSMfP5GMKxoHsJkXsJeTLavl0qV2EKI2/73YJsX
	VV1UracA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrl1Q-00000005jKR-1dHt;
	Sun, 15 Feb 2026 22:55:24 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrl1N-00000005jJW-0WNC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Feb 2026 22:55:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=jn0mkrbIShFcsJPVeHZ53xi/cLQEfalMOWyFCxoe5g4=; b=MqcRvY
	oAN9UOzrOLnVKCXcYju/pdXdbAADVxdegs0B07XxLnMydhx/LWnWye7J2+MVjwUl
	YhnKXZHyHLHJkJ/S0BmTAMB5I/Sb+dondZrBdUjBioMrqWcFRAad63Rd0lHdtSTW
	NRLT4LFrfL3B7jBGr5emTNxcy9aJ37ngjS14k7mmAkxJUtPFv5tHl3nJB6hoh/Ap
	0DUqiBjJmTRI/WHSyiyk1e06miR7FQCDkBYkNF+jovDgzyVIRBovU3HxZ4AjuYhV
	CL7pSImG+2/CMJx+sj2T8rHcTq+EtRdJV/mPcd1yI4rbS5ropdIAWMaV95yJqZN9
	Stt04dNQvzylfrTQ==
Received: (qmail 3011365 invoked from network); 15 Feb 2026 23:55:07 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Feb 2026 23:55:07 +0100
X-UD-Smtp-Session: l3s3148p1@o3/FuuRKbIQujns5
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org
Subject: [RFC PATCH v2 02/13] hwspinlock: add callback to fill private data of a hwspinlock
Date: Sun, 15 Feb 2026 23:54:42 +0100
Message-ID: <20260215225501.6365-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260215225501.6365-1-wsa+renesas@sang-engineering.com>
References: <20260215225501.6365-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260215_145521_535332_32619936 
X-CRM114-Status: GOOD (  19.73  )
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

To hide internal core structures from providers, a callback is added to
the ops which allows to set the 'priv' field of a hwspinlock. It is
called when a hwspinlock device is registered and, thus, iterated over
all locks. The register-functions are also extended to pass a data
pointer to this callback, so it can do necessary calculations for the
priv field of each hwspinlock. Providers are converted separately
because these changes need dedicated reviews.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/hwspinlock/hwspinlock_core.c     | 19 +++++++++++++++----
 drivers/hwspinlock/hwspinlock_internal.h | 19 +++++++++++--------
 include/linux/hwspinlock.h               |  4 ++--
 3 files changed, 28 insertions(+), 14 deletions(-)

diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index 2c9eceba7fe8..afe1e7ce2829 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -507,6 +507,7 @@ static struct hwspinlock *hwspin_lock_unregister_single(unsigned int id)
  * @ops: hwspinlock handlers for this device
  * @base_id: id of the first hardware spinlock in this bank
  * @num_locks: number of hwspinlocks provided by this device
+ * @init_data: additional data passed on to the init_priv callback
  *
  * This function should be called from the underlying platform-specific
  * implementation, to register a new hwspinlock device instance.
@@ -516,10 +517,11 @@ static struct hwspinlock *hwspin_lock_unregister_single(unsigned int id)
  * Returns: %0 on success, or an appropriate error code on failure
  */
 int hwspin_lock_register(struct hwspinlock_device *bank, struct device *dev,
-		const struct hwspinlock_ops *ops, int base_id, int num_locks)
+		const struct hwspinlock_ops *ops, int base_id, int num_locks,
+		void *init_data)
 {
 	struct hwspinlock *hwlock;
-	int ret = 0, i;
+	int ret, i;
 
 	if (!bank || !ops || !dev || !num_locks || !ops->trylock ||
 							!ops->unlock) {
@@ -538,6 +540,14 @@ int hwspin_lock_register(struct hwspinlock_device *bank, struct device *dev,
 		spin_lock_init(&hwlock->lock);
 		hwlock->bank = bank;
 
+		if (ops->init_priv) {
+			hwlock->priv = ops->init_priv(i, init_data);
+			if (IS_ERR(hwlock->priv)) {
+				ret = PTR_ERR(hwlock->priv);
+				goto reg_failed;
+			}
+		}
+
 		ret = hwspin_lock_register_single(hwlock, base_id + i);
 		if (ret)
 			goto reg_failed;
@@ -633,6 +643,7 @@ EXPORT_SYMBOL_GPL(devm_hwspin_lock_unregister);
  * @ops: hwspinlock handlers for this device
  * @base_id: id of the first hardware spinlock in this bank
  * @num_locks: number of hwspinlocks provided by this device
+ * @init_data: additional data passed on to the init_priv callback
  *
  * This function should be called from the underlying platform-specific
  * implementation, to register a new hwspinlock device instance.
@@ -644,7 +655,7 @@ EXPORT_SYMBOL_GPL(devm_hwspin_lock_unregister);
 int devm_hwspin_lock_register(struct device *dev,
 			      struct hwspinlock_device *bank,
 			      const struct hwspinlock_ops *ops,
-			      int base_id, int num_locks)
+			      int base_id, int num_locks, void *init_data)
 {
 	struct hwspinlock_device **ptr;
 	int ret;
@@ -653,7 +664,7 @@ int devm_hwspin_lock_register(struct device *dev,
 	if (!ptr)
 		return -ENOMEM;
 
-	ret = hwspin_lock_register(bank, dev, ops, base_id, num_locks);
+	ret = hwspin_lock_register(bank, dev, ops, base_id, num_locks, init_data);
 	if (!ret) {
 		*ptr = bank;
 		devres_add(dev, ptr);
diff --git a/drivers/hwspinlock/hwspinlock_internal.h b/drivers/hwspinlock/hwspinlock_internal.h
index f298fc0ee5ad..3c835d96bf86 100644
--- a/drivers/hwspinlock/hwspinlock_internal.h
+++ b/drivers/hwspinlock/hwspinlock_internal.h
@@ -18,20 +18,23 @@ struct hwspinlock_device;
 /**
  * struct hwspinlock_ops - platform-specific hwspinlock handlers
  *
- * @trylock: make a single attempt to take the lock. returns 0 on
- *	     failure and true on success. may _not_ sleep.
- * @unlock:  release the lock. always succeed. may _not_ sleep.
- * @bust:    optional, platform-specific bust handler, called by hwspinlock
- *	     core to bust a specific lock.
- * @relax:   optional, platform-specific relax handler, called by hwspinlock
- *	     core while spinning on a lock, between two successive
- *	     invocations of @trylock. may _not_ sleep.
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
  */
 struct hwspinlock_ops {
 	int (*trylock)(struct hwspinlock *lock);
 	void (*unlock)(struct hwspinlock *lock);
 	int (*bust)(struct hwspinlock *lock, unsigned int id);
 	void (*relax)(struct hwspinlock *lock);
+	void *(*init_priv)(int local_id, void *init_data);
 };
 
 /**
diff --git a/include/linux/hwspinlock.h b/include/linux/hwspinlock.h
index dffa1dff7289..094a6d0d39d6 100644
--- a/include/linux/hwspinlock.h
+++ b/include/linux/hwspinlock.h
@@ -30,7 +30,7 @@ struct hwspinlock_ops;
 void *hwspin_lock_get_priv(struct hwspinlock *hwlock);
 struct device *hwspin_lock_get_dev(struct hwspinlock *hwlock);
 int hwspin_lock_register(struct hwspinlock_device *bank, struct device *dev,
-		const struct hwspinlock_ops *ops, int base_id, int num_locks);
+		const struct hwspinlock_ops *ops, int base_id, int num_locks, void *init_data);
 int hwspin_lock_unregister(struct hwspinlock_device *bank);
 struct hwspinlock *hwspin_lock_request_specific(unsigned int id);
 int hwspin_lock_free(struct hwspinlock *hwlock);
@@ -49,7 +49,7 @@ int devm_hwspin_lock_unregister(struct device *dev,
 int devm_hwspin_lock_register(struct device *dev,
 			      struct hwspinlock_device *bank,
 			      const struct hwspinlock_ops *ops,
-			      int base_id, int num_locks);
+			      int base_id, int num_locks, void *init_data);
 
 #else /* !CONFIG_HWSPINLOCK */
 
-- 
2.51.0


