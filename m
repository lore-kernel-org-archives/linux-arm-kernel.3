Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC7D3CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 23:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YqtJtL3fBEiMtwk9pStPuNnS2FkeUcvwr8He096wXA4=; b=FVDDkUAsRrlJLGx5HPXw039OvM
	L/rLe7p1lk7+cdyQ1CkAv+C3Ud/Cdxi3QBvpAEu0MbEtFCvv0jJ1xoMRu1bL8zb7HLshrY2LUglV4
	+6IFX/jwTxkVvRBqtAm2d7oIhIvHh5NYa7B3tdYgpMmzvrbFUGRTrv8gHvjssd5gJ+N/as0P7w+Ja
	/hqnW8PaNOn8Y77w5tG6UiFQV94FcyvCQugv3jdHAGDXHJg/SPSSSyRfFJBAgxfgxWlYN5p4uq4lc
	4V7HBx2JB76ryRiq3XSRlnoXwYzTcP66fiK0nFjtJ/2cCkajRPfp8+MrFqlNU/ZDCAG4dRJdXaSb1
	GUdI0AqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urlzi-00000003dhG-1t8X;
	Thu, 28 Aug 2025 23:25:26 +0000
Received: from out-189.mta0.migadu.com ([2001:41d0:1004:224b::bd])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urhC2-00000002kCt-1jos
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 18:17:52 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1756405066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YqtJtL3fBEiMtwk9pStPuNnS2FkeUcvwr8He096wXA4=;
	b=YPFHsozXzH3UGPY5aplZqj4qSxRGfxYI34m1c9VsPbALCXAz5bkYHa02xVb0MGw+3qBBH9
	8JGk+rsJmYZ4HzGTJAsqRF7miHes9zvf2qo07Jurfe9aKH7KYruqNn+Ml7RuO/1c7F0kSg
	J9ptnYa2zRUD+xjgxEWnaXXpOexpFuU=
From: Sean Anderson <sean.anderson@linux.dev>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	Mike Leach <mike.leach@linaro.org>,
	Linu Cherian <lcherian@marvell.com>,
	James Clark <james.clark@linaro.org>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH] coresight: Fix possible deadlock in coresight_panic_cb
Date: Thu, 28 Aug 2025 14:17:38 -0400
Message-Id: <20250828181738.1529289-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_111750_667205_AADAE7D4 
X-CRM114-Status: GOOD (  14.33  )
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

coresight_panic_cb is called with interrupts disabled during panics.
However, bus_for_each_dev calls bus_to_subsys which takes
bus_kset->list_lock without disabling IRQs. This will cause a deadlock
if a panic occurs while one of the other coresight functions that uses
bus_for_each_dev is running.

Maintain a separate list of coresight devices to access during a panic.

Fixes: 46006ceb5d02 ("coresight: core: Add provision for panic callbacks")
Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 drivers/hwtracing/coresight/coresight-core.c | 40 ++++++++++----------
 include/linux/coresight.h                    |  1 +
 2 files changed, 22 insertions(+), 19 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index fa758cc21827..1f1bf0e2bf92 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1315,6 +1315,9 @@ void coresight_release_platform_data(struct coresight_device *csdev,
 		coresight_remove_conns_sysfs_group(csdev);
 }
 
+static DEFINE_SPINLOCK(csdev_lock);
+static LIST_HEAD(csdev_list);
+
 struct coresight_device *coresight_register(struct coresight_desc *desc)
 {
 	int ret;
@@ -1374,11 +1377,16 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 		goto out_unlock;
 	}
 
+	scoped_guard(spinlock_irq, &csdev_lock)
+		list_add(&csdev->csdev_list, &csdev_list);
+
 	if (csdev->type == CORESIGHT_DEV_TYPE_SINK ||
 	    csdev->type == CORESIGHT_DEV_TYPE_LINKSINK) {
 		ret = etm_perf_add_symlink_sink(csdev);
 
 		if (ret) {
+			scoped_guard(spinlock_irq, &csdev_lock)
+				list_del(&csdev->csdev_list);
 			device_unregister(&csdev->dev);
 			/*
 			 * As with the above, all resources are free'd
@@ -1427,6 +1435,8 @@ void coresight_unregister(struct coresight_device *csdev)
 	coresight_remove_conns(csdev);
 	coresight_clear_default_sink(csdev);
 	coresight_release_platform_data(csdev, csdev->dev.parent, csdev->pdata);
+	scoped_guard(spinlock_irq, &csdev_lock)
+		list_del(&csdev->csdev_list);
 	device_unregister(&csdev->dev);
 }
 EXPORT_SYMBOL_GPL(coresight_unregister);
@@ -1563,28 +1573,20 @@ const struct bus_type coresight_bustype = {
 	.name	= "coresight",
 };
 
-static int coresight_panic_sync(struct device *dev, void *data)
-{
-	int mode;
-	struct coresight_device *csdev;
-
-	/* Run through panic sync handlers for all enabled devices */
-	csdev = container_of(dev, struct coresight_device, dev);
-	mode = coresight_get_mode(csdev);
-
-	if ((mode == CS_MODE_SYSFS) || (mode == CS_MODE_PERF)) {
-		if (panic_ops(csdev))
-			panic_ops(csdev)->sync(csdev);
-	}
-
-	return 0;
-}
-
 static int coresight_panic_cb(struct notifier_block *self,
 			       unsigned long v, void *p)
 {
-	bus_for_each_dev(&coresight_bustype, NULL, NULL,
-				 coresight_panic_sync);
+	struct coresight_device *csdev;
+
+	guard(spinlock)(&csdev_lock);
+	list_for_each_entry(csdev, &csdev_list, csdev_list) {
+		/* Run through panic sync handlers for all enabled devices */
+		int mode = coresight_get_mode(csdev);
+
+		if ((mode == CS_MODE_SYSFS || mode == CS_MODE_PERF) &&
+		    panic_ops(csdev))
+			panic_ops(csdev)->sync(csdev);
+	}
 
 	return 0;
 }
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 4ac65c68bbf4..a5e62ebd03b5 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -302,6 +302,7 @@ struct coresight_device {
 	/* system configuration and feature lists */
 	struct list_head feature_csdev_list;
 	struct list_head config_csdev_list;
+	struct list_head csdev_list;
 	raw_spinlock_t cscfg_csdev_lock;
 	void *active_cscfg_ctxt;
 };
-- 
2.35.1.1320.gc452695387.dirty


