Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 563C7D3B7F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 10:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zo5mimbPUNYnoumTueh0t1mauAGjhvK+A4v7TYhBmH8=; b=HOWJki/NNg+gQIzz8tiZZnfzce
	BPt1w0AWgC5dIV6MVtf4ndUaaMch0ieL6/nGGqz59RCOHqLzlfiTdoQ6AtXv5ImffYaVkMFok2hTW
	XPc7Qy79skh5OSVTPPFPkD9AxdsI4bEzGhiYk6x/UBzV7F97nb0vZp7wCwWxutYOEdyFs0IeMi4ku
	p8IlgEQuKDDWctjMJqJrmL1Pj44KaYSyqZSkVtBK6VLznXjLZwEhBnxneHz4A/ZRFXMSdxfly6YwE
	rww39StYNyv6+KXrzAt1MTkdzTxgMcD6kcl48wSyxCJqDSoZRrFyMtK3/I4I8OsO9ifgMKqN3pHfQ
	19uAcOIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFW9s-00000007hkq-13IU;
	Mon, 25 Nov 2024 10:17:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFVhg-00000007div-166U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 09:48:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 76EE21756;
	Mon, 25 Nov 2024 01:48:53 -0800 (PST)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 407E23F66E;
	Mon, 25 Nov 2024 01:48:21 -0800 (PST)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: suzuki.poulose@arm.com,
	mike.leach@linaro.org,
	james.clark@linaro.org,
	alexander.shishkin@linux.intel.com,
	bigeasy@linutronix.de,
	clrkwllms@kernel.org,
	rostedt@goodmis.org
Cc: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	nd@arm.com,
	Levi Yun <yeoreum.yun@arm.com>
Subject: [PATCH 1/9] coresight: change coresight_device lock type to raw_spinlock_t
Date: Mon, 25 Nov 2024 09:48:08 +0000
Message-Id: <20241125094816.365472-2-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125094816.365472-1-yeoreum.yun@arm.com>
References: <20241125094816.365472-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_014824_391871_978D5842 
X-CRM114-Status: GOOD (  19.18  )
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

From: Levi Yun <yeoreum.yun@arm.com>

coresight_device->cscfg_csdev_lock can be held during __schedule()
by perf_event_task_sched_out()/in().

Since coresight->cscfg_csdev_lock type is spinlock_t and
perf_event_task_sched_out()/in() is called after acquiring rq_lock,
which is raw_spinlock_t (an unsleepable lock),
this poses an issue in PREEMPT_RT kernel where spinlock_t is sleepable.

To address this, change type of coresight_device->cscfg_csdev_lock
from spinlock_t to raw_spinlock_t.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 .../hwtracing/coresight/coresight-syscfg.c    | 75 +++++++++----------
 include/linux/coresight.h                     |  2 +-
 2 files changed, 35 insertions(+), 42 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
index 11138a9762b0..b7e9fb822e8f 100644
--- a/drivers/hwtracing/coresight/coresight-syscfg.c
+++ b/drivers/hwtracing/coresight/coresight-syscfg.c
@@ -65,7 +65,6 @@ static int cscfg_add_csdev_cfg(struct coresight_device *csdev,
 {
 	struct cscfg_config_csdev *config_csdev = NULL;
 	struct cscfg_feature_csdev *feat_csdev;
-	unsigned long flags;
 	int i;
 
 	/* look at each required feature and see if it matches any feature on the device */
@@ -89,9 +88,9 @@ static int cscfg_add_csdev_cfg(struct coresight_device *csdev,
 	}
 	/* if matched features, add config to device.*/
 	if (config_csdev) {
-		spin_lock_irqsave(&csdev->cscfg_csdev_lock, flags);
-		list_add(&config_csdev->node, &csdev->config_csdev_list);
-		spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
+		scoped_guard(raw_spinlock_irqsave, &csdev->cscfg_csdev_lock) {
+			list_add(&config_csdev->node, &csdev->config_csdev_list);
+		}
 	}
 
 	return 0;
@@ -177,7 +176,6 @@ static int cscfg_load_feat_csdev(struct coresight_device *csdev,
 				 struct cscfg_csdev_feat_ops *ops)
 {
 	struct cscfg_feature_csdev *feat_csdev;
-	unsigned long flags;
 	int err;
 
 	if (!ops->load_feat)
@@ -194,9 +192,9 @@ static int cscfg_load_feat_csdev(struct coresight_device *csdev,
 
 	/* add to internal csdev feature list & initialise using reset call */
 	cscfg_reset_feat(feat_csdev);
-	spin_lock_irqsave(&csdev->cscfg_csdev_lock, flags);
-	list_add(&feat_csdev->node, &csdev->feature_csdev_list);
-	spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
+	scoped_guard(raw_spinlock_irqsave, &csdev->cscfg_csdev_lock) {
+		list_add(&feat_csdev->node, &csdev->feature_csdev_list);
+	}
 
 	return 0;
 }
@@ -765,7 +763,7 @@ static int cscfg_list_add_csdev(struct coresight_device *csdev,
 
 	INIT_LIST_HEAD(&csdev->feature_csdev_list);
 	INIT_LIST_HEAD(&csdev->config_csdev_list);
-	spin_lock_init(&csdev->cscfg_csdev_lock);
+	raw_spin_lock_init(&csdev->cscfg_csdev_lock);
 
 	return 0;
 }
@@ -853,17 +851,14 @@ EXPORT_SYMBOL_GPL(cscfg_unregister_csdev);
 void cscfg_csdev_reset_feats(struct coresight_device *csdev)
 {
 	struct cscfg_feature_csdev *feat_csdev;
-	unsigned long flags;
 
-	spin_lock_irqsave(&csdev->cscfg_csdev_lock, flags);
+	guard(raw_spinlock_irqsave)(&csdev->cscfg_csdev_lock);
+
 	if (list_empty(&csdev->feature_csdev_list))
-		goto unlock_exit;
+		return;
 
 	list_for_each_entry(feat_csdev, &csdev->feature_csdev_list, node)
 		cscfg_reset_feat(feat_csdev);
-
-unlock_exit:
-	spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
 }
 EXPORT_SYMBOL_GPL(cscfg_csdev_reset_feats);
 
@@ -1048,7 +1043,6 @@ int cscfg_csdev_enable_active_config(struct coresight_device *csdev,
 {
 	struct cscfg_config_csdev *config_csdev_active = NULL, *config_csdev_item;
 	const struct cscfg_config_desc *config_desc;
-	unsigned long flags;
 	int err = 0;
 
 	/* quickly check global count */
@@ -1059,17 +1053,17 @@ int cscfg_csdev_enable_active_config(struct coresight_device *csdev,
 	 * Look for matching configuration - set the active configuration
 	 * context if found.
 	 */
-	spin_lock_irqsave(&csdev->cscfg_csdev_lock, flags);
-	list_for_each_entry(config_csdev_item, &csdev->config_csdev_list, node) {
-		config_desc = config_csdev_item->config_desc;
-		if ((atomic_read(&config_desc->active_cnt)) &&
-		    ((unsigned long)config_desc->event_ea->var == cfg_hash)) {
-			config_csdev_active = config_csdev_item;
-			csdev->active_cscfg_ctxt = (void *)config_csdev_active;
-			break;
+	scoped_guard(raw_spinlock_irqsave, &csdev->cscfg_csdev_lock) {
+		list_for_each_entry(config_csdev_item, &csdev->config_csdev_list, node) {
+			config_desc = config_csdev_item->config_desc;
+			if ((atomic_read(&config_desc->active_cnt)) &&
+			    ((unsigned long)config_desc->event_ea->var == cfg_hash)) {
+				config_csdev_active = config_csdev_item;
+				csdev->active_cscfg_ctxt = (void *)config_csdev_active;
+				break;
+			}
 		}
 	}
-	spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
 
 	/*
 	 * If found, attempt to enable
@@ -1090,12 +1084,12 @@ int cscfg_csdev_enable_active_config(struct coresight_device *csdev,
 			 *
 			 * Set enabled if OK, err if not.
 			 */
-			spin_lock_irqsave(&csdev->cscfg_csdev_lock, flags);
-			if (csdev->active_cscfg_ctxt)
-				config_csdev_active->enabled = true;
-			else
-				err = -EBUSY;
-			spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
+			scoped_guard(raw_spinlock_irqsave, &csdev->cscfg_csdev_lock) {
+				if (csdev->active_cscfg_ctxt)
+					config_csdev_active->enabled = true;
+				else
+					err = -EBUSY;
+			}
 		}
 	}
 	return err;
@@ -1117,23 +1111,22 @@ EXPORT_SYMBOL_GPL(cscfg_csdev_enable_active_config);
 void cscfg_csdev_disable_active_config(struct coresight_device *csdev)
 {
 	struct cscfg_config_csdev *config_csdev;
-	unsigned long flags;
 
 	/*
 	 * Check if we have an active config, and that it was successfully enabled.
 	 * If it was not enabled, we have no work to do, otherwise mark as disabled.
 	 * Clear the active config pointer.
 	 */
-	spin_lock_irqsave(&csdev->cscfg_csdev_lock, flags);
-	config_csdev = (struct cscfg_config_csdev *)csdev->active_cscfg_ctxt;
-	if (config_csdev) {
-		if (!config_csdev->enabled)
-			config_csdev = NULL;
-		else
-			config_csdev->enabled = false;
+	scoped_guard(raw_spinlock_irqsave, &csdev->cscfg_csdev_lock) {
+		config_csdev = (struct cscfg_config_csdev *)csdev->active_cscfg_ctxt;
+		if (config_csdev) {
+			if (!config_csdev->enabled)
+				config_csdev = NULL;
+			else
+				config_csdev->enabled = false;
+		}
+		csdev->active_cscfg_ctxt = NULL;
 	}
-	csdev->active_cscfg_ctxt = NULL;
-	spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
 
 	/* true if there was an enabled active config */
 	if (config_csdev)
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index c13342594278..924b58c343b3 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -296,7 +296,7 @@ struct coresight_device {
 	/* system configuration and feature lists */
 	struct list_head feature_csdev_list;
 	struct list_head config_csdev_list;
-	spinlock_t cscfg_csdev_lock;
+	raw_spinlock_t cscfg_csdev_lock;
 	void *active_cscfg_ctxt;
 };
 
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


