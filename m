Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E445CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 15:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rFsFtt/dYubWASJgvWs3g9b5WimRx2r0jDM0W9mimZ4=; b=n21CuImZ0FF4IjjwQsKJQBUN9A
	BECUw2l/TDyDQLv0wN4KR8zfmyYkphIjaNIvaz/WQI05A9TKEWo0OeqJ3qHO0lAmZu72tO+da/eNZ
	YFQvK2BZ3tM0b2kYOdvChiP2MtwVlK/4Tge3ZFFdakMUE2fL3JIDoq5XDjkOo/hgq1BJSxAYYomVc
	atOlfzjaRWjzOtIeO/eddOE5DbRTn8HOsEYHvEa9NONpeLXJeFbGGXkuYw64kkbz+s/9Ni7imo/Kf
	lb+EmkUYb0Lq8wPmdcsXiJMkZL3UUilnQYuAtWqES646xYwhxi/2JRuV7Ggck+EtkUqapamPTPRmf
	KoIMJozA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1nWn-0000000APKH-2Dvs;
	Thu, 25 Sep 2025 15:05:01 +0000
Received: from out-181.mta1.migadu.com ([95.215.58.181])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1nWk-0000000AObR-1Omw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 15:05:00 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758812644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rFsFtt/dYubWASJgvWs3g9b5WimRx2r0jDM0W9mimZ4=;
	b=JyqpvJj0isPclEJyeW7fLiPwKRipWqHOvgNoVwokn7yAbKMSE5TCY5PmT1etG8xI8ZCGSk
	RYaGfcnVN2eZsW4f7LlSsVQj5QpQSYhO0TAfEPPkUinvgfiB4SJskHiSCx4GhNjQ/IioWf
	PkNRCPYpEyuLxt1TcIj6/N83QfV+LfE=
From: Sean Anderson <sean.anderson@linux.dev>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Cc: Leo Yan <leo.yan@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Linu Cherian <lcherian@marvell.com>,
	Mike Leach <mike.leach@linaro.org>,
	linux-kernel@vger.kernel.org,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	James Clark <james.clark@linaro.org>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH v5 3/3] coresight: Fix possible deadlock in coresight_panic_cb
Date: Thu, 25 Sep 2025 11:03:42 -0400
Message-Id: <20250925150342.1845615-4-sean.anderson@linux.dev>
In-Reply-To: <20250925150342.1845615-1-sean.anderson@linux.dev>
References: <20250925150342.1845615-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_080458_963146_543A3AAB 
X-CRM114-Status: GOOD (  22.58  )
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

Panics can occur at any time, so taking locks may cause a deadlock (such
as if the panicking CPU held the lock).  coresight_panic_cb uses
bus_for_each_dev, but that calls bus_to_subsys which takes
bus_kset->list_lock.

Instead of registering a single panic notifier and iterating over
coresight devices, register a panic notifier for each coresight device
that requires it (letting the atomic notifier list handle iteration).
atomic_notifier_chain_unregister will just return -ENOENT if a notifier
block isn't on the list, so it's safe to call when we haven't registered
a notifier.

Fixes: 46006ceb5d02 ("coresight: core: Add provision for panic callbacks")
Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

Changes in v5:
- Check csdev mode before calling sync()

Changes in v4:
- Move the panic notifier into csdev and restore the panic sync API

Changes in v3:
- Rewrite patch to remove the panic sync API entirely

Changes in v2:
- Add a comment describing csdev_lock/list
- Consolidate list removal in coresight_device_release

 drivers/hwtracing/coresight/coresight-core.c | 67 ++++++++------------
 include/linux/coresight.h                    |  2 +
 2 files changed, 28 insertions(+), 41 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 305b1773cfbe..01303348fc0e 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1046,6 +1046,9 @@ static void coresight_device_release(struct device *dev)
 {
 	struct coresight_device *csdev = to_coresight_device(dev);
 
+	if (panic_ops(csdev))
+		atomic_notifier_chain_unregister(&panic_notifier_list,
+						 &csdev->panic_notifier);
 	free_percpu(csdev->perf_sink_id_map.cpu_map);
 	fwnode_handle_put(csdev->dev.fwnode);
 	kfree(csdev);
@@ -1315,6 +1318,18 @@ void coresight_release_platform_data(struct coresight_device *csdev,
 		coresight_remove_conns_sysfs_group(csdev);
 }
 
+static int coresight_panic_notifier(struct notifier_block *nb,
+				    unsigned long action, void *data)
+{
+	struct coresight_device *csdev =
+		container_of(nb, struct coresight_device, panic_notifier);
+	int mode = coresight_get_mode(csdev);
+
+	if (mode == CS_MODE_SYSFS || mode == CS_MODE_PERF)
+		panic_ops(csdev)->sync(csdev);
+	return NOTIFY_DONE;
+}
+
 struct coresight_device *coresight_register(struct coresight_desc *desc)
 {
 	int ret;
@@ -1357,6 +1372,17 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 			goto err_out;
 		}
 	}
+
+	if (panic_ops(csdev)) {
+		csdev->panic_notifier.notifier_call = coresight_panic_notifier;
+		ret = atomic_notifier_chain_register(&panic_notifier_list,
+						     &csdev->panic_notifier);
+		if (ret) {
+			coresight_device_release(&csdev->dev);
+			goto err_out;
+		}
+	}
+
 	/*
 	 * Make sure the device registration and the connection fixup
 	 * are synchronised, so that we don't see uninitialised devices
@@ -1563,36 +1589,6 @@ const struct bus_type coresight_bustype = {
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
-static int coresight_panic_cb(struct notifier_block *self,
-			       unsigned long v, void *p)
-{
-	bus_for_each_dev(&coresight_bustype, NULL, NULL,
-				 coresight_panic_sync);
-
-	return 0;
-}
-
-static struct notifier_block coresight_notifier = {
-	.notifier_call = coresight_panic_cb,
-};
-
 static int __init coresight_init(void)
 {
 	int ret;
@@ -1605,20 +1601,11 @@ static int __init coresight_init(void)
 	if (ret)
 		goto exit_bus_unregister;
 
-	/* Register function to be called for panic */
-	ret = atomic_notifier_chain_register(&panic_notifier_list,
-					     &coresight_notifier);
-	if (ret)
-		goto exit_perf;
-
 	/* initialise the coresight syscfg API */
 	ret = cscfg_init();
 	if (!ret)
 		return 0;
 
-	atomic_notifier_chain_unregister(&panic_notifier_list,
-					     &coresight_notifier);
-exit_perf:
 	etm_perf_exit();
 exit_bus_unregister:
 	bus_unregister(&coresight_bustype);
@@ -1628,8 +1615,6 @@ static int __init coresight_init(void)
 static void __exit coresight_exit(void)
 {
 	cscfg_exit();
-	atomic_notifier_chain_unregister(&panic_notifier_list,
-					     &coresight_notifier);
 	etm_perf_exit();
 	bus_unregister(&coresight_bustype);
 }
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 4ac65c68bbf4..a7aaf9d3d01d 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -280,6 +280,7 @@ struct coresight_trace_id_map {
  * @config_csdev_list:  List of system configurations added to the device.
  * @cscfg_csdev_lock:	Protect the lists of configurations and features.
  * @active_cscfg_ctxt:  Context information for current active system configuration.
+ * @panic_notifier: Notifier block used to clean up during a panic
  */
 struct coresight_device {
 	struct coresight_platform_data *pdata;
@@ -304,6 +305,7 @@ struct coresight_device {
 	struct list_head config_csdev_list;
 	raw_spinlock_t cscfg_csdev_lock;
 	void *active_cscfg_ctxt;
+	struct notifier_block panic_notifier;
 };
 
 /*
-- 
2.35.1.1320.gc452695387.dirty


