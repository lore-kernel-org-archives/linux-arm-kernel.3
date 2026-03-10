Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3434FFCC9D9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 07:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ww4nYucVcxYHOiIbxAnzL68uueWTV/h2bRDqOLnsme0=; b=DQ6FCjhZcbvaEua1iv9UMEms14
	lpQwVmoZbyf+Cfq3Y3Zid5SYJ3Mql7Gpl4ae9UhayZc5dUeomSrLPXCIdnPllpsC4EJBqMZwh010x
	TKDz/J/yPPJy29LYBlMvPUVwlFGJ2kC8TLFP2b/CWNG/8kcQ2kt+vL3/HfaVM0fHOKfe+c+ZpVon8
	gau0lDVRF9xZX3egDaLsDXR4CDNj2y9cyiX0D2l4p5i72He5D4E879hlizNsA5TNFQqsnR48qvU8+
	1v6a5W746NjPPMiQ8xZhp9B1qd0R8sySzGMUmZ4xwpm69Lm/7chvwWZbZPliWRcm7yvaui2r00Wr+
	iP+Du/Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzrwq-00000008stl-0HIH;
	Tue, 10 Mar 2026 07:56:12 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzrwn-00000008sse-0ccb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 07:56:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=Ww4nYucVcxYHOiIbxAnzL68uueWTV/h2bRDqOLnsme0=; b=jSnsmL
	qYMbsKvWcgJkDyGTS/MKc6CavAjUlEjTs7Jc1fq4TKz63lF18ap7o8k4SN8PXbyS
	AHL8q+PdihoH4HtcqxO1Zy9d6w3gs2vfEITGwDJ18954tz/bYbrqQpz/k5n1K+Nt
	vqA+pg0pr/pfiZ2fyH5RHWpZiNLfI2uD5UnE6EKKWdtKakY3rKSVsxEeWvmAX4PB
	+B3SdKbjJvBo2xJWzM61toM3yRYMNng1r3e81RTJbF7WjE0V86GHf4eX9TX5YlDv
	GFNVWeKy9ahgzUkxhBCCWgdgtJ2nAGza2RYfakik/k4ZYVxFHNsMPQILQ5qr5KgQ
	co7yFG/J9Xj4yChg==
Received: (qmail 3112619 invoked from network); 10 Mar 2026 08:55:50 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Mar 2026 08:55:50 +0100
X-UD-Smtp-Session: l3s3148p1@Bz4S2aZMrpAujntP
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
Subject: [PATCH v4 03/15] hwspinlock: add helpers to retrieve core data
Date: Tue, 10 Mar 2026 08:55:18 +0100
Message-ID: <20260310075539.11701-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260310075539.11701-1-wsa+renesas@sang-engineering.com>
References: <20260310075539.11701-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_005609_466748_CFEDC0B1 
X-CRM114-Status: GOOD (  15.89  )
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

This is a first step to hide internal core structs from hwspinlock
providers. It adds helper functions to retrieve the data needed by them.
Because all users are only within the hwspinlock subsystem and the
change there is trivial, conversion is included in this patch as well.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/hwspinlock/hwspinlock_core.c  | 12 ++++++++++++
 drivers/hwspinlock/omap_hwspinlock.c  |  4 ++--
 drivers/hwspinlock/qcom_hwspinlock.c  | 11 ++++++-----
 drivers/hwspinlock/sprd_hwspinlock.c  |  6 +++---
 drivers/hwspinlock/stm32_hwspinlock.c |  4 ++--
 drivers/hwspinlock/sun6i_hwspinlock.c |  4 ++--
 include/linux/hwspinlock.h            |  2 ++
 7 files changed, 29 insertions(+), 14 deletions(-)

diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index cc8e952a6772..2c9eceba7fe8 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -888,5 +888,17 @@ struct hwspinlock *devm_hwspin_lock_request_specific(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_hwspin_lock_request_specific);
 
+void *hwspin_lock_get_priv(struct hwspinlock *hwlock)
+{
+	return hwlock->priv;
+}
+EXPORT_SYMBOL_GPL(hwspin_lock_get_priv);
+
+struct device *hwspin_lock_get_dev(struct hwspinlock *hwlock)
+{
+	return hwlock->bank->dev;
+}
+EXPORT_SYMBOL_GPL(hwspin_lock_get_dev);
+
 MODULE_DESCRIPTION("Hardware spinlock interface");
 MODULE_AUTHOR("Ohad Ben-Cohen <ohad@wizery.com>");
diff --git a/drivers/hwspinlock/omap_hwspinlock.c b/drivers/hwspinlock/omap_hwspinlock.c
index 1832e0c3af6b..5bf0061d3fd6 100644
--- a/drivers/hwspinlock/omap_hwspinlock.c
+++ b/drivers/hwspinlock/omap_hwspinlock.c
@@ -37,7 +37,7 @@
 
 static int omap_hwspinlock_trylock(struct hwspinlock *lock)
 {
-	void __iomem *lock_addr = lock->priv;
+	void __iomem *lock_addr = hwspin_lock_get_priv(lock);
 
 	/* attempt to acquire the lock by reading its value */
 	return (SPINLOCK_NOTTAKEN == readl(lock_addr));
@@ -45,7 +45,7 @@ static int omap_hwspinlock_trylock(struct hwspinlock *lock)
 
 static void omap_hwspinlock_unlock(struct hwspinlock *lock)
 {
-	void __iomem *lock_addr = lock->priv;
+	void __iomem *lock_addr = hwspin_lock_get_priv(lock);
 
 	/* release the lock by writing 0 to it */
 	writel(SPINLOCK_NOTTAKEN, lock_addr);
diff --git a/drivers/hwspinlock/qcom_hwspinlock.c b/drivers/hwspinlock/qcom_hwspinlock.c
index 0390979fd765..7ff89c3e8c6b 100644
--- a/drivers/hwspinlock/qcom_hwspinlock.c
+++ b/drivers/hwspinlock/qcom_hwspinlock.c
@@ -27,7 +27,7 @@ struct qcom_hwspinlock_of_data {
 
 static int qcom_hwspinlock_trylock(struct hwspinlock *lock)
 {
-	struct regmap_field *field = lock->priv;
+	struct regmap_field *field = hwspin_lock_get_priv(lock);
 	u32 lock_owner;
 	int ret;
 
@@ -44,7 +44,7 @@ static int qcom_hwspinlock_trylock(struct hwspinlock *lock)
 
 static void qcom_hwspinlock_unlock(struct hwspinlock *lock)
 {
-	struct regmap_field *field = lock->priv;
+	struct regmap_field *field = hwspin_lock_get_priv(lock);
 	u32 lock_owner;
 	int ret;
 
@@ -66,13 +66,14 @@ static void qcom_hwspinlock_unlock(struct hwspinlock *lock)
 
 static int qcom_hwspinlock_bust(struct hwspinlock *lock, unsigned int id)
 {
-	struct regmap_field *field = lock->priv;
+	struct regmap_field *field = hwspin_lock_get_priv(lock);
+	struct device *dev = hwspin_lock_get_dev(lock);
 	u32 owner;
 	int ret;
 
 	ret = regmap_field_read(field, &owner);
 	if (ret) {
-		dev_err(lock->bank->dev, "unable to query spinlock owner\n");
+		dev_err(dev, "unable to query spinlock owner\n");
 		return ret;
 	}
 
@@ -81,7 +82,7 @@ static int qcom_hwspinlock_bust(struct hwspinlock *lock, unsigned int id)
 
 	ret = regmap_field_write(field, 0);
 	if (ret) {
-		dev_err(lock->bank->dev, "failed to bust spinlock\n");
+		dev_err(dev, "failed to bust spinlock\n");
 		return ret;
 	}
 
diff --git a/drivers/hwspinlock/sprd_hwspinlock.c b/drivers/hwspinlock/sprd_hwspinlock.c
index 22e2ffb91743..0d08efbdfb07 100644
--- a/drivers/hwspinlock/sprd_hwspinlock.c
+++ b/drivers/hwspinlock/sprd_hwspinlock.c
@@ -40,8 +40,8 @@ struct sprd_hwspinlock_dev {
 static int sprd_hwspinlock_trylock(struct hwspinlock *lock)
 {
 	struct sprd_hwspinlock_dev *sprd_hwlock =
-		dev_get_drvdata(lock->bank->dev);
-	void __iomem *addr = lock->priv;
+		dev_get_drvdata(hwspin_lock_get_dev(lock));
+	void __iomem *addr = hwspin_lock_get_priv(lock);
 	int user_id, lock_id;
 
 	if (!readl(addr))
@@ -59,7 +59,7 @@ static int sprd_hwspinlock_trylock(struct hwspinlock *lock)
 /* unlock the hardware spinlock */
 static void sprd_hwspinlock_unlock(struct hwspinlock *lock)
 {
-	void __iomem *lock_addr = lock->priv;
+	void __iomem *lock_addr = hwspin_lock_get_priv(lock);
 
 	writel(HWSPINLOCK_NOTTAKEN, lock_addr);
 }
diff --git a/drivers/hwspinlock/stm32_hwspinlock.c b/drivers/hwspinlock/stm32_hwspinlock.c
index bb5c7e5f7a80..1d75dc03f4ad 100644
--- a/drivers/hwspinlock/stm32_hwspinlock.c
+++ b/drivers/hwspinlock/stm32_hwspinlock.c
@@ -27,7 +27,7 @@ struct stm32_hwspinlock {
 
 static int stm32_hwspinlock_trylock(struct hwspinlock *lock)
 {
-	void __iomem *lock_addr = lock->priv;
+	void __iomem *lock_addr = hwspin_lock_get_priv(lock);
 	u32 status;
 
 	writel(STM32_MUTEX_LOCK_BIT | STM32_MUTEX_COREID, lock_addr);
@@ -38,7 +38,7 @@ static int stm32_hwspinlock_trylock(struct hwspinlock *lock)
 
 static void stm32_hwspinlock_unlock(struct hwspinlock *lock)
 {
-	void __iomem *lock_addr = lock->priv;
+	void __iomem *lock_addr = hwspin_lock_get_priv(lock);
 
 	writel(STM32_MUTEX_COREID, lock_addr);
 }
diff --git a/drivers/hwspinlock/sun6i_hwspinlock.c b/drivers/hwspinlock/sun6i_hwspinlock.c
index c2d314588046..8ff81cb5880a 100644
--- a/drivers/hwspinlock/sun6i_hwspinlock.c
+++ b/drivers/hwspinlock/sun6i_hwspinlock.c
@@ -62,14 +62,14 @@ static void sun6i_hwspinlock_debugfs_init(struct sun6i_hwspinlock_data *priv)
 
 static int sun6i_hwspinlock_trylock(struct hwspinlock *lock)
 {
-	void __iomem *lock_addr = lock->priv;
+	void __iomem *lock_addr = hwspin_lock_get_priv(lock);
 
 	return (readl(lock_addr) == SPINLOCK_NOTTAKEN);
 }
 
 static void sun6i_hwspinlock_unlock(struct hwspinlock *lock)
 {
-	void __iomem *lock_addr = lock->priv;
+	void __iomem *lock_addr = hwspin_lock_get_priv(lock);
 
 	writel(SPINLOCK_NOTTAKEN, lock_addr);
 }
diff --git a/include/linux/hwspinlock.h b/include/linux/hwspinlock.h
index 74b91244fe0e..dffa1dff7289 100644
--- a/include/linux/hwspinlock.h
+++ b/include/linux/hwspinlock.h
@@ -27,6 +27,8 @@ struct hwspinlock_ops;
 
 #ifdef CONFIG_HWSPINLOCK
 
+void *hwspin_lock_get_priv(struct hwspinlock *hwlock);
+struct device *hwspin_lock_get_dev(struct hwspinlock *hwlock);
 int hwspin_lock_register(struct hwspinlock_device *bank, struct device *dev,
 		const struct hwspinlock_ops *ops, int base_id, int num_locks);
 int hwspin_lock_unregister(struct hwspinlock_device *bank);
-- 
2.47.3


