Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB3ACA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 15:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L6XGDr7h20As/O/9U2MCpFBO1J1PqKsbwcqGb04Zg5g=; b=xA/jVHNn36eAYHVMfKv3DRArL9
	HNC06jA3Z9lRtoLFeKRlygGTfL7JgUOHlbeD0tFyhkc9nqVpzqvPOuAcNWgBCjWoqPC2GP1HmUR7/
	xQzzGsWlt0Cc5oXhdAUN60Xp3L80sGSr+zsSN/nJxjn0f/mrSNVs3bkqJiP8RWYxg5czXFVMiH3vj
	hFNZuHCiyMPNyzqVFU9Is3Ef0SEYSrTsF4Fe/EonOp3meLBMvfYp1VI4q6xOyneRIbDqKduQz5OC0
	pZsH18A39htLWQb5i+2d4USLlZEhNikaxg8hlWNc4/orpntQuU33v9M250cjoGEEwCS1CMxZAFolU
	BFaIYqnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5T5-0000000AAIJ-1yqk;
	Fri, 12 Sep 2025 15:13:43 +0000
Received: from out-189.mta0.migadu.com ([91.218.175.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5T2-0000000AAG3-1Snx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 15:13:42 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757690007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=L6XGDr7h20As/O/9U2MCpFBO1J1PqKsbwcqGb04Zg5g=;
	b=JcwoWp/EdkPkmY5/BW9/DBSgB5MjBvrr3Zdrn+nBtNwTpRMhh5zAekm2PmguRKNXK55+O1
	djAHjuk4EmSsI8VazO8d85U6ReIjhiarj4uQptFv7sVBOxivQ9NkwRhYRKEHxGHNmW+Ypy
	eAgGX3F/1J7l4ioAKWhpneGTUC+r2ZE=
From: Sean Anderson <sean.anderson@linux.dev>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Cc: Yeoreum Yun <yeoreum.yun@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Linu Cherian <lcherian@marvell.com>,
	linux-kernel@vger.kernel.org,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	James Clark <james.clark@linaro.org>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH v3] coresight: Fix possible deadlock in coresight_panic_cb
Date: Fri, 12 Sep 2025 11:13:14 -0400
Message-Id: <20250912151314.3761026-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_081340_683885_B7B03744 
X-CRM114-Status: GOOD (  21.35  )
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
bus_kset->list_lock without disabling IRQs. This may cause a deadlock.

Instead of adding a panic API for coresight devices, just have coresight
drivers that need a panic callback register directly with the panic
notifier.

Fixes: 46006ceb5d02 ("coresight: core: Add provision for panic callbacks")
Fixes: 6dbcbcfc4496 ("coresight: tmc: Enable panic sync handling")
Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

Changes in v3:
- Rewrite patch to remove the panic sync API entirely

Changes in v2:
- Add a comment describing csdev_lock/list
- Consolidate list removal in coresight_device_release

 drivers/hwtracing/coresight/coresight-core.c  | 42 -------------------
 .../hwtracing/coresight/coresight-tmc-core.c  | 20 ++++++++-
 .../hwtracing/coresight/coresight-tmc-etf.c   | 12 +++---
 .../hwtracing/coresight/coresight-tmc-etr.c   | 12 +++---
 drivers/hwtracing/coresight/coresight-tmc.h   | 10 ++++-
 include/linux/coresight.h                     | 11 +----
 6 files changed, 38 insertions(+), 69 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index fa758cc21827..297af270bf3d 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -19,7 +19,6 @@
 #include <linux/property.h>
 #include <linux/delay.h>
 #include <linux/pm_runtime.h>
-#include <linux/panic_notifier.h>
 
 #include "coresight-etm-perf.h"
 #include "coresight-priv.h"
@@ -1563,36 +1562,6 @@ const struct bus_type coresight_bustype = {
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
@@ -1605,20 +1574,11 @@ static int __init coresight_init(void)
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
@@ -1628,8 +1588,6 @@ static int __init coresight_init(void)
 static void __exit coresight_exit(void)
 {
 	cscfg_exit();
-	atomic_notifier_chain_unregister(&panic_notifier_list,
-					     &coresight_notifier);
 	etm_perf_exit();
 	bus_unregister(&coresight_bustype);
 }
diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 88afb16bb6be..012f76dbf7d3 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -16,6 +16,7 @@
 #include <linux/fs.h>
 #include <linux/miscdevice.h>
 #include <linux/mutex.h>
+#include <linux/panic_notifier.h>
 #include <linux/property.h>
 #include <linux/uaccess.h>
 #include <linux/slab.h>
@@ -834,6 +835,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.type = CORESIGHT_DEV_TYPE_SINK;
 		desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_SYSMEM;
 		desc.ops = &tmc_etr_cs_ops;
+		drvdata->panic_notifier.notifier_call = tmc_panic_sync_etr;
 		ret = tmc_etr_setup_caps(dev, devid, &desc.access);
 		if (ret)
 			goto out;
@@ -847,6 +849,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_BUFFER;
 		desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_FIFO;
 		desc.ops = &tmc_etf_cs_ops;
+		drvdata->panic_notifier.notifier_call = tmc_panic_sync_etf;
 		dev_list = &etf_devs;
 		break;
 	default:
@@ -869,11 +872,18 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 	dev->platform_data = pdata;
 	desc.pdata = pdata;
 
+	if (drvdata->panic_notifier.notifier_call) {
+		ret = atomic_notifier_chain_register(&panic_notifier_list,
+						     &drvdata->panic_notifier);
+		if (ret)
+			goto out;
+	}
+
 	coresight_clear_self_claim_tag(&desc.access);
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev)) {
 		ret = PTR_ERR(drvdata->csdev);
-		goto out;
+		goto err;
 	}
 
 	drvdata->miscdev.name = desc.name;
@@ -882,7 +892,10 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 	ret = misc_register(&drvdata->miscdev);
 	if (ret) {
 		coresight_unregister(drvdata->csdev);
-		goto out;
+err:
+		if (drvdata->panic_notifier.notifier_call)
+			atomic_notifier_chain_unregister(&panic_notifier_list,
+							 &drvdata->panic_notifier);
 	}
 
 out:
@@ -944,6 +957,9 @@ static void __tmc_remove(struct device *dev)
 	if (drvdata->crashdev.fops)
 		misc_deregister(&drvdata->crashdev);
 	coresight_unregister(drvdata->csdev);
+	if (drvdata->panic_notifier.notifier_call)
+		atomic_notifier_chain_unregister(&panic_notifier_list,
+						 &drvdata->panic_notifier);
 }
 
 static void tmc_remove(struct amba_device *adev)
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
index 0f45ab5e5249..9c8dfd5436ab 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
@@ -601,11 +601,14 @@ static unsigned long tmc_update_etf_buffer(struct coresight_device *csdev,
 	return to_read;
 }
 
-static int tmc_panic_sync_etf(struct coresight_device *csdev)
+int tmc_panic_sync_etf(struct notifier_block *nb, unsigned long action,
+		       void *data)
 {
 	u32 val;
 	struct tmc_crash_metadata *mdata;
-	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+	struct tmc_drvdata *drvdata = container_of(nb, struct tmc_drvdata,
+						   panic_notifier);
+	struct coresight_device *csdev = drvdata->csdev;
 
 	mdata = (struct tmc_crash_metadata *)drvdata->crash_mdata.vaddr;
 
@@ -689,10 +692,6 @@ static const struct coresight_ops_link tmc_etf_link_ops = {
 	.disable	= tmc_disable_etf_link,
 };
 
-static const struct coresight_ops_panic tmc_etf_sync_ops = {
-	.sync		= tmc_panic_sync_etf,
-};
-
 const struct coresight_ops tmc_etb_cs_ops = {
 	.sink_ops	= &tmc_etf_sink_ops,
 };
@@ -700,7 +699,6 @@ const struct coresight_ops tmc_etb_cs_ops = {
 const struct coresight_ops tmc_etf_cs_ops = {
 	.sink_ops	= &tmc_etf_sink_ops,
 	.link_ops	= &tmc_etf_link_ops,
-	.panic_ops	= &tmc_etf_sync_ops,
 };
 
 int tmc_read_prepare_etb(struct tmc_drvdata *drvdata)
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index b07fcdb3fe1a..91061462cd92 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1824,11 +1824,14 @@ static int tmc_disable_etr_sink(struct coresight_device *csdev)
 	return 0;
 }
 
-static int tmc_panic_sync_etr(struct coresight_device *csdev)
+int tmc_panic_sync_etr(struct notifier_block *nb, unsigned long action,
+		       void *data)
 {
 	u32 val;
 	struct tmc_crash_metadata *mdata;
-	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+	struct tmc_drvdata *drvdata = container_of(nb, struct tmc_drvdata,
+						   panic_notifier);
+	struct coresight_device *csdev = drvdata->csdev;
 
 	mdata = (struct tmc_crash_metadata *)drvdata->crash_mdata.vaddr;
 
@@ -1900,13 +1903,8 @@ static const struct coresight_ops_sink tmc_etr_sink_ops = {
 	.free_buffer	= tmc_free_etr_buffer,
 };
 
-static const struct coresight_ops_panic tmc_etr_sync_ops = {
-	.sync		= tmc_panic_sync_etr,
-};
-
 const struct coresight_ops tmc_etr_cs_ops = {
 	.sink_ops	= &tmc_etr_sink_ops,
-	.panic_ops	= &tmc_etr_sync_ops,
 };
 
 int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 6541a27a018e..d8e6bf5526c6 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -242,6 +242,7 @@ struct tmc_resrv_buf {
  *		(after crash) by default.
  * @crash_mdata: Reserved memory for storing tmc crash metadata.
  *		 Used by ETR/ETF.
+ * @panic_notifier: Notifier block used to clean up during a panic
  */
 struct tmc_drvdata {
 	struct clk		*pclk;
@@ -271,6 +272,7 @@ struct tmc_drvdata {
 	struct etr_buf		*perf_buf;
 	struct tmc_resrv_buf	resrv_buf;
 	struct tmc_resrv_buf	crash_mdata;
+	struct notifier_block	panic_notifier;
 };
 
 struct etr_buf_operations {
@@ -322,18 +324,24 @@ void tmc_disable_hw(struct tmc_drvdata *drvdata);
 u32 tmc_get_memwidth_mask(struct tmc_drvdata *drvdata);
 int tmc_read_prepare_crashdata(struct tmc_drvdata *drvdata);
 
+struct notifier_block;
+
 /* ETB/ETF functions */
 int tmc_read_prepare_etb(struct tmc_drvdata *drvdata);
 int tmc_read_unprepare_etb(struct tmc_drvdata *drvdata);
+int tmc_panic_sync_etf(struct notifier_block *nb, unsigned long action,
+		       void *data);
 extern const struct coresight_ops tmc_etb_cs_ops;
 extern const struct coresight_ops tmc_etf_cs_ops;
-
 ssize_t tmc_etb_get_sysfs_trace(struct tmc_drvdata *drvdata,
 				loff_t pos, size_t len, char **bufpp);
+
 /* ETR functions */
 int tmc_read_prepare_etr(struct tmc_drvdata *drvdata);
 int tmc_read_unprepare_etr(struct tmc_drvdata *drvdata);
 void tmc_etr_disable_hw(struct tmc_drvdata *drvdata);
+int tmc_panic_sync_etr(struct notifier_block *nb, unsigned long action,
+		       void *data);
 extern const struct coresight_ops tmc_etr_cs_ops;
 ssize_t tmc_etr_get_sysfs_trace(struct tmc_drvdata *drvdata,
 				loff_t pos, size_t len, char **bufpp);
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 4ac65c68bbf4..64e12ffd507b 100644
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
@@ -427,15 +428,6 @@ struct coresight_ops_helper {
 };
 
 
-/**
- * struct coresight_ops_panic - Generic device ops for panic handing
- *
- * @sync	: Sync the device register state/trace data
- */
-struct coresight_ops_panic {
-	int (*sync)(struct coresight_device *csdev);
-};
-
 struct coresight_ops {
 	int (*trace_id)(struct coresight_device *csdev, enum cs_mode mode,
 			struct coresight_device *sink);
@@ -443,7 +435,6 @@ struct coresight_ops {
 	const struct coresight_ops_link *link_ops;
 	const struct coresight_ops_source *source_ops;
 	const struct coresight_ops_helper *helper_ops;
-	const struct coresight_ops_panic *panic_ops;
 };
 
 static inline u32 csdev_access_relaxed_read32(struct csdev_access *csa,
-- 
2.35.1.1320.gc452695387.dirty


