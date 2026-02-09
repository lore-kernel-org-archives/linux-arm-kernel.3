Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8002E81BB2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 12:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i3pkLvrduLU1d4k6WxS6QNwyMSmXTbU3d7AyEwkdAUI=; b=O1Vk9VV5FFTN/CF1oTyHhrG2/1
	zi03GUtJ8wgmMyDQT8M4rXaVCFzgW4lsXArjVHNqQvAgtaOete2DGuABc8mzaaxC4Fy7uz29tx0SB
	DVNSR/0gbFMJu/8rVKkFaX1YH5gV4HmeHx2hGR1B7A9XVu07081MIN+RJoyalEZf6imDMAAsvOFR1
	zQ79jl8/1mFbOT5iLG6dC7f8bhJaBkiSjmVLMYDd3Pvky/DBTuKDXQyChTnt9GL+NLy27rM3N7jlH
	MkbkYU1LLwZDAAkeLqYEBQchPoYfsjMu4G+ojzAiK8g+M3wqUAl9ne4Ks3iaUFu5fvjkukYaKkXXu
	pYNAtxZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpQdN-0000000FNK2-3yLp;
	Mon, 09 Feb 2026 12:44:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpQdL-0000000FNJ3-1GmZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 12:44:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1447D1063;
	Mon,  9 Feb 2026 04:44:48 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8837F3F63F;
	Mon,  9 Feb 2026 04:44:52 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 09 Feb 2026 12:44:33 +0000
Subject: [PATCH v4 1/8] coresight: Fix memory leak in
 coresight_alloc_device_name()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-arm_coresight_refactor_dev_register-v4-1-62d6042f76f7@arm.com>
References: <20260209-arm_coresight_refactor_dev_register-v4-0-62d6042f76f7@arm.com>
In-Reply-To: <20260209-arm_coresight_refactor_dev_register-v4-0-62d6042f76f7@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770641090; l=25691;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=kwUfxEFsTF3zWcNReYlNch31WwD7dxC9Qx5667l6Pi0=;
 b=YnbapJlOMDdG01CNyKzmnePSNVMk8ABG2ayQ1fm8pa3HaPrrsvpbVMIpH7JDB6d8zKuA/3+aA
 V699Fz+9MFtBZC8ZR7XE+GbtNogtHU4Mi62IDkoYgPi7wXboWK/qRfE
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_044455_546515_71B53C5E 
X-CRM114-Status: GOOD (  35.66  )
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

The memory leak detector reports:

  echo clear > /sys/kernel/debug/kmemleak
  modprobe coresight_funnel
  rmmod coresight_funnel

  # Scan memory leak and report it
  echo scan > /sys/kernel/debug/kmemleak
  cat /sys/kernel/debug/kmemleak
  unreferenced object 0xffff0008020c7200 (size 64):
    comm "modprobe", pid 410, jiffies 4295333721
    hex dump (first 32 bytes):
      d8 da fe 7e 09 00 ff ff e8 2e ff 7e 09 00 ff ff  ...~.......~....
      b0 6c ff 7e 09 00 ff ff 30 83 00 7f 09 00 ff ff  .l.~....0.......
    backtrace (crc 4116a690):
      kmemleak_alloc+0xd8/0xf8
      __kmalloc_node_track_caller_noprof+0x2c8/0x6f0
      krealloc_node_align_noprof+0x13c/0x2c8
      coresight_alloc_device_name+0xe4/0x158 [coresight]
      0xffffd327ecef8394
      0xffffd327ecef85ec
      amba_probe+0x118/0x1c8
      really_probe+0xc8/0x3f0
      __driver_probe_device+0x88/0x190
      driver_probe_device+0x44/0x120
      __driver_attach+0x100/0x238
      bus_for_each_dev+0x84/0xf0
      driver_attach+0x2c/0x40
      bus_add_driver+0x128/0x258
      driver_register+0x64/0x138
      __amba_driver_register+0x2c/0x48

The memory leak is caused by not freeing the device list that maintains
device indices.

This device list preserves stable device indices across unbind and
rebind device operations, so it does not share the same lifetime as a
device instances and must only be freed when the module is unloaded.

Some modules do not implement a module exit callback because they are
registered using module_platform_driver().  As a result, the device
list cannot be released during module exit for those modules.

Fix this by moving the device list into the core layer.  As a general
solution, instead of maintaining a static list in each driver, drivers
now allocate device lists via coresight_allocate_device_list() and
device indices via coresight_allocate_device_idx().

The list is released only when the core module is unloaded by calling
coresight_release_device_list(), avoiding the leak.

Fixes: 0f5f9b6ba9e1 ("coresight: Use platform agnostic names")
Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-catu.c       |   4 +-
 drivers/hwtracing/coresight/coresight-core.c       | 127 +++++++++++++++------
 drivers/hwtracing/coresight/coresight-ctcu-core.c  |   4 +-
 drivers/hwtracing/coresight/coresight-cti-core.c   |  19 ++-
 drivers/hwtracing/coresight/coresight-dummy.c      |   7 +-
 drivers/hwtracing/coresight/coresight-etb10.c      |   4 +-
 drivers/hwtracing/coresight/coresight-funnel.c     |   4 +-
 drivers/hwtracing/coresight/coresight-replicator.c |   4 +-
 drivers/hwtracing/coresight/coresight-stm.c        |   4 +-
 drivers/hwtracing/coresight/coresight-tmc-core.c   |  12 +-
 drivers/hwtracing/coresight/coresight-tnoc.c       |   4 +-
 drivers/hwtracing/coresight/coresight-tpda.c       |   4 +-
 drivers/hwtracing/coresight/coresight-tpdm.c       |   4 +-
 drivers/hwtracing/coresight/coresight-tpiu.c       |   4 +-
 drivers/hwtracing/coresight/ultrasoc-smb.c         |   4 +-
 include/linux/coresight.h                          |  14 +--
 16 files changed, 120 insertions(+), 103 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index 69b36bae97ab488197f23e6eafe3729ca22445d4..4e7e60ac86e8073db36aeb29e265bcebe72981d3 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -30,8 +30,6 @@
 #define catu_dbg(x, ...) do {} while (0)
 #endif
 
-DEFINE_CORESIGHT_DEVLIST(catu_devs, "catu");
-
 struct catu_etr_buf {
 	struct tmc_sg_table *catu_table;
 	dma_addr_t sladdr;
@@ -530,7 +528,7 @@ static int __catu_probe(struct device *dev, struct resource *res)
 	if (ret)
 		return ret;
 
-	catu_desc.name = coresight_alloc_device_name(&catu_devs, dev);
+	catu_desc.name = coresight_alloc_device_name("catu", dev);
 	if (!catu_desc.name)
 		return -ENOMEM;
 
diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index c660cf8adb1c7cafff8f85e501f056e4e151e372..fe345832c4564bd55b39ca8bcde0a93afdc11a68 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -53,6 +53,9 @@ struct coresight_node {
 const u32 coresight_barrier_pkt[4] = {0x7fffffff, 0x7fffffff, 0x7fffffff, 0x7fffffff};
 EXPORT_SYMBOL_GPL(coresight_barrier_pkt);
 
+/* List maintains the device index */
+static LIST_HEAD(coresight_dev_idx_list);
+
 static const struct cti_assoc_op *cti_assoc_ops;
 
 void coresight_set_cti_ops(const struct cti_assoc_op *cti_op)
@@ -1438,22 +1441,55 @@ void coresight_unregister(struct coresight_device *csdev)
 }
 EXPORT_SYMBOL_GPL(coresight_unregister);
 
+static struct coresight_dev_list *
+coresight_allocate_device_list(const char *prefix)
+{
+	struct coresight_dev_list *list;
 
-/*
- * coresight_search_device_idx - Search the fwnode handle of a device
- * in the given dev_idx list. Must be called with the coresight_mutex held.
- *
- * Returns the index of the entry, when found. Otherwise, -ENOENT.
- */
-static int coresight_search_device_idx(struct coresight_dev_list *dict,
-				       struct fwnode_handle *fwnode)
+	/* Check if have already allocated */
+	list_for_each_entry(list, &coresight_dev_idx_list, node) {
+		if (!strcmp(list->pfx, prefix))
+			return list;
+	}
+
+	list = kzalloc(sizeof(*list), GFP_KERNEL);
+	if (!list)
+		return NULL;
+
+	list->pfx = kstrdup(prefix, GFP_KERNEL);
+	if (!list->pfx) {
+		kfree(list);
+		return NULL;
+	}
+
+	list_add(&list->node, &coresight_dev_idx_list);
+	return list;
+}
+
+static int coresight_allocate_device_idx(struct coresight_dev_list *list,
+					 struct device *dev)
 {
-	int i;
+	struct fwnode_handle **fwnode_list;
+	struct fwnode_handle *fwnode = dev_fwnode(dev);
+	int idx;
+
+	for (idx = 0; idx < list->nr_idx; idx++)
+		if (list->fwnode_list[idx] == fwnode)
+			return idx;
+
+	/* Make space for the new entry */
+	idx = list->nr_idx;
+	fwnode_list = krealloc_array(list->fwnode_list,
+				     idx + 1, sizeof(*list->fwnode_list),
+				     GFP_KERNEL);
+	if (!fwnode_list)
+		return -ENOMEM;
 
-	for (i = 0; i < dict->nr_idx; i++)
-		if (dict->fwnode_list[i] == fwnode)
-			return i;
-	return -ENOENT;
+	fwnode_list[idx] = fwnode;
+	list->fwnode_list = fwnode_list;
+	list->nr_idx = idx + 1;
+
+	return idx;
 }
 
 static bool coresight_compare_type(enum coresight_dev_type type_a,
@@ -1527,45 +1563,63 @@ bool coresight_loses_context_with_cpu(struct device *dev)
 EXPORT_SYMBOL_GPL(coresight_loses_context_with_cpu);
 
 /*
- * coresight_alloc_device_name - Get an index for a given device in the
- * device index list specific to a driver. An index is allocated for a
- * device and is tracked with the fwnode_handle to prevent allocating
+ * coresight_alloc_device_name - Get an index for a given device in the list
+ * specific to a driver (presented by the prefix string). An index is allocated
+ * for a device and is tracked with the fwnode_handle to prevent allocating
  * duplicate indices for the same device (e.g, if we defer probing of
  * a device due to dependencies), in case the index is requested again.
  */
-char *coresight_alloc_device_name(struct coresight_dev_list *dict,
-				  struct device *dev)
+char *coresight_alloc_device_name(const char *prefix, struct device *dev)
 {
-	int idx;
+	struct coresight_dev_list *list;
 	char *name = NULL;
-	struct fwnode_handle **list;
+	int idx;
 
 	mutex_lock(&coresight_mutex);
 
-	idx = coresight_search_device_idx(dict, dev_fwnode(dev));
-	if (idx < 0) {
-		/* Make space for the new entry */
-		idx = dict->nr_idx;
-		list = krealloc_array(dict->fwnode_list,
-				      idx + 1, sizeof(*dict->fwnode_list),
-				      GFP_KERNEL);
-		if (ZERO_OR_NULL_PTR(list)) {
-			idx = -ENOMEM;
-			goto done;
-		}
+	list = coresight_allocate_device_list(prefix);
+	if (!list)
+		goto done;
 
-		list[idx] = dev_fwnode(dev);
-		dict->fwnode_list = list;
-		dict->nr_idx = idx + 1;
-	}
+	idx = coresight_allocate_device_idx(list, dev);
 
-	name = devm_kasprintf(dev, GFP_KERNEL, "%s%d", dict->pfx, idx);
+	/*
+	 * If index allocation fails, the device list is not released here;
+	 * it is instead freed later by coresight_release_device_list() when
+	 * the coresight_core module is unloaded.
+	 */
+	if (idx < 0)
+		goto done;
+
+	name = devm_kasprintf(dev, GFP_KERNEL, "%s%d", list->pfx, idx);
 done:
 	mutex_unlock(&coresight_mutex);
 	return name;
 }
 EXPORT_SYMBOL_GPL(coresight_alloc_device_name);
 
+static void coresight_release_device_list(void)
+{
+	struct coresight_dev_list *list, *next;
+	int i;
+
+	/*
+	 * Here is no need to take coresight_mutex; this is during core module
+	 * unloading, no race condition with other modules.
+	 */
+
+	list_for_each_entry_safe(list, next, &coresight_dev_idx_list, node) {
+		for (i = 0; i < list->nr_idx; i++)
+			list->fwnode_list[i] = NULL;
+		list->nr_idx = 0;
+		list_del(&list->node);
+
+		kfree(list->pfx);
+		kfree(list->fwnode_list);
+		kfree(list);
+	}
+}
+
 const struct bus_type coresight_bustype = {
 	.name	= "coresight",
 };
@@ -1639,6 +1693,7 @@ static void __exit coresight_exit(void)
 					     &coresight_notifier);
 	etm_perf_exit();
 	bus_unregister(&coresight_bustype);
+	coresight_release_device_list();
 }
 
 module_init(coresight_init);
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index abed15eb72b4acb0d6eb743616afe1b414f1f639..6813ae6e929b05cdc4dcbaab9ff6584653ff4f39 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -19,8 +19,6 @@
 #include "coresight-ctcu.h"
 #include "coresight-priv.h"
 
-DEFINE_CORESIGHT_DEVLIST(ctcu_devs, "ctcu");
-
 #define ctcu_writel(drvdata, val, offset)	__raw_writel((val), drvdata->base + offset)
 #define ctcu_readl(drvdata, offset)		__raw_readl(drvdata->base + offset)
 
@@ -187,7 +185,7 @@ static int ctcu_probe(struct platform_device *pdev)
 	void __iomem *base;
 	int i, ret;
 
-	desc.name = coresight_alloc_device_name(&ctcu_devs, dev);
+	desc.name = coresight_alloc_device_name("ctcu", dev);
 	if (!desc.name)
 		return -ENOMEM;
 
diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index bfbc365bb2ef2744efab11c056b8450472957005..0f1374a79b5765475b7189247049199913f5a99b 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -48,15 +48,6 @@ static int nr_cti_cpu;
 /* quick lookup list for CPU bound CTIs when power handling */
 static struct cti_drvdata *cti_cpu_drvdata[NR_CPUS];
 
-/*
- * CTI naming. CTI bound to cores will have the name cti_cpu<N> where
- * N is the CPU ID. System CTIs will have the name cti_sys<I> where I
- * is an index allocated by order of discovery.
- *
- * CTI device name list - for CTI not bound to cores.
- */
-DEFINE_CORESIGHT_DEVLIST(cti_sys_devs, "cti_sys");
-
 /* write set of regs to hardware - call with spinlock claimed */
 void cti_write_all_hw_regs(struct cti_drvdata *drvdata)
 {
@@ -903,12 +894,18 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 	/* default to powered - could change on PM notifications */
 	drvdata->config.hw_powered = true;
 
-	/* set up device name - will depend if cpu bound or otherwise */
+	/*
+	 * Set up device name - will depend if cpu bound or otherwise.
+	 *
+	 * CTI bound to cores will have the name cti_cpu<N> where N is th
+	 * eCPU ID. System CTIs will have the name cti_sys<I> where I is an
+	 * index allocated by order of discovery.
+	 */
 	if (drvdata->ctidev.cpu >= 0)
 		cti_desc.name = devm_kasprintf(dev, GFP_KERNEL, "cti_cpu%d",
 					       drvdata->ctidev.cpu);
 	else
-		cti_desc.name = coresight_alloc_device_name(&cti_sys_devs, dev);
+		cti_desc.name = coresight_alloc_device_name("cti_sys", dev);
 	if (!cti_desc.name)
 		return -ENOMEM;
 
diff --git a/drivers/hwtracing/coresight/coresight-dummy.c b/drivers/hwtracing/coresight/coresight-dummy.c
index 14322c99e29d4696bc27ac2326280026412fe05f..c176a2f57300fd8cd5d153be5ccb6faaef96023d 100644
--- a/drivers/hwtracing/coresight/coresight-dummy.c
+++ b/drivers/hwtracing/coresight/coresight-dummy.c
@@ -19,9 +19,6 @@ struct dummy_drvdata {
 	u8				traceid;
 };
 
-DEFINE_CORESIGHT_DEVLIST(source_devs, "dummy_source");
-DEFINE_CORESIGHT_DEVLIST(sink_devs, "dummy_sink");
-
 static int dummy_source_enable(struct coresight_device *csdev,
 			       struct perf_event *event, enum cs_mode mode,
 			       __maybe_unused struct coresight_path *path)
@@ -126,7 +123,7 @@ static int dummy_probe(struct platform_device *pdev)
 
 	if (of_device_is_compatible(node, "arm,coresight-dummy-source")) {
 
-		desc.name = coresight_alloc_device_name(&source_devs, dev);
+		desc.name = coresight_alloc_device_name("dummy_source", dev);
 		if (!desc.name)
 			return -ENOMEM;
 
@@ -155,7 +152,7 @@ static int dummy_probe(struct platform_device *pdev)
 		drvdata->traceid = (u8)trace_id;
 
 	} else if (of_device_is_compatible(node, "arm,coresight-dummy-sink")) {
-		desc.name = coresight_alloc_device_name(&sink_devs, dev);
+		desc.name = coresight_alloc_device_name("dummy_sink", dev);
 		if (!desc.name)
 			return -ENOMEM;
 
diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/drivers/hwtracing/coresight/coresight-etb10.c
index 6657602d8f2e1b75ea6a8440e35c489d21f4245e..b952a1d47f12f44c15cc845914691305713028c4 100644
--- a/drivers/hwtracing/coresight/coresight-etb10.c
+++ b/drivers/hwtracing/coresight/coresight-etb10.c
@@ -63,8 +63,6 @@
 #define ETB_FFSR_BIT		1
 #define ETB_FRAME_SIZE_WORDS	4
 
-DEFINE_CORESIGHT_DEVLIST(etb_devs, "etb");
-
 /**
  * struct etb_drvdata - specifics associated to an ETB component
  * @base:	memory mapped base address for this component.
@@ -722,7 +720,7 @@ static int etb_probe(struct amba_device *adev, const struct amba_id *id)
 	struct resource *res = &adev->res;
 	struct coresight_desc desc = { 0 };
 
-	desc.name = coresight_alloc_device_name(&etb_devs, dev);
+	desc.name = coresight_alloc_device_name("etb", dev);
 	if (!desc.name)
 		return -ENOMEM;
 
diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index 3b248e54471a38f501777fe162fea850d1c851b3..3f56ceccd8c9f6deaaf783a06a0d19fb06eff7c4 100644
--- a/drivers/hwtracing/coresight/coresight-funnel.c
+++ b/drivers/hwtracing/coresight/coresight-funnel.c
@@ -30,8 +30,6 @@
 #define FUNNEL_HOLDTIME		(0x7 << FUNNEL_HOLDTIME_SHFT)
 #define FUNNEL_ENSx_MASK	0xff
 
-DEFINE_CORESIGHT_DEVLIST(funnel_devs, "funnel");
-
 /**
  * struct funnel_drvdata - specifics associated to a funnel component
  * @base:	memory mapped base address for this component.
@@ -223,7 +221,7 @@ static int funnel_probe(struct device *dev, struct resource *res)
 	    of_device_is_compatible(dev->of_node, "arm,coresight-funnel"))
 		dev_warn_once(dev, "Uses OBSOLETE CoreSight funnel binding\n");
 
-	desc.name = coresight_alloc_device_name(&funnel_devs, dev);
+	desc.name = coresight_alloc_device_name("funnel", dev);
 	if (!desc.name)
 		return -ENOMEM;
 
diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index e6472658235dc479cec91ac18f3737f76f8c74f0..07fc04f53b88fdec7ae18d3000046fe74c0cec9d 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -24,8 +24,6 @@
 #define REPLICATOR_IDFILTER0		0x000
 #define REPLICATOR_IDFILTER1		0x004
 
-DEFINE_CORESIGHT_DEVLIST(replicator_devs, "replicator");
-
 /**
  * struct replicator_drvdata - specifics associated to a replicator component
  * @base:	memory mapped base address for this component. Also indicates
@@ -230,7 +228,7 @@ static int replicator_probe(struct device *dev, struct resource *res)
 		dev_warn_once(dev,
 			      "Uses OBSOLETE CoreSight replicator binding\n");
 
-	desc.name = coresight_alloc_device_name(&replicator_devs, dev);
+	desc.name = coresight_alloc_device_name("replicator", dev);
 	if (!desc.name)
 		return -ENOMEM;
 
diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index e68529bf89c9815a8118955bf3114ad1ed4fb346..aca6cec7885a551ad5960986b1cdf08baa6b5a94 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -110,8 +110,6 @@ struct channel_space {
 	unsigned long		*guaranteed;
 };
 
-DEFINE_CORESIGHT_DEVLIST(stm_devs, "stm");
-
 /**
  * struct stm_drvdata - specifics associated to an STM component
  * @base:		memory mapped base address for this component.
@@ -834,7 +832,7 @@ static int __stm_probe(struct device *dev, struct resource *res)
 	struct resource ch_res;
 	struct coresight_desc desc = { 0 };
 
-	desc.name = coresight_alloc_device_name(&stm_devs, dev);
+	desc.name = coresight_alloc_device_name("stm", dev);
 	if (!desc.name)
 		return -ENOMEM;
 
diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 36599c431be6203e871fdcb8de569cc6701c52bb..58b469ee73b490932d78f5a6bc704c2abbe2f737 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -32,10 +32,6 @@
 #include "coresight-priv.h"
 #include "coresight-tmc.h"
 
-DEFINE_CORESIGHT_DEVLIST(etb_devs, "tmc_etb");
-DEFINE_CORESIGHT_DEVLIST(etf_devs, "tmc_etf");
-DEFINE_CORESIGHT_DEVLIST(etr_devs, "tmc_etr");
-
 int tmc_wait_for_tmcready(struct tmc_drvdata *drvdata)
 {
 	struct coresight_device *csdev = drvdata->csdev;
@@ -777,7 +773,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 	struct coresight_platform_data *pdata = NULL;
 	struct tmc_drvdata *drvdata;
 	struct coresight_desc desc = { 0 };
-	struct coresight_dev_list *dev_list = NULL;
+	const char *dev_list = NULL;
 
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
 	if (!drvdata)
@@ -827,7 +823,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.type = CORESIGHT_DEV_TYPE_SINK;
 		desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_BUFFER;
 		desc.ops = &tmc_etb_cs_ops;
-		dev_list = &etb_devs;
+		dev_list = "tmc_etb";
 		break;
 	case TMC_CONFIG_TYPE_ETR:
 		desc.groups = coresight_etr_groups;
@@ -839,7 +835,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 			goto out;
 		idr_init(&drvdata->idr);
 		mutex_init(&drvdata->idr_mutex);
-		dev_list = &etr_devs;
+		dev_list = "tmc_etr";
 		break;
 	case TMC_CONFIG_TYPE_ETF:
 		desc.groups = coresight_etf_groups;
@@ -847,7 +843,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_BUFFER;
 		desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_FIFO;
 		desc.ops = &tmc_etf_cs_ops;
-		dev_list = &etf_devs;
+		dev_list = "tmc_etf";
 		break;
 	default:
 		pr_err("%s: Unsupported TMC config\n", desc.name);
diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index 1128612e70a7312606d79b19ed1f4e91f01ddfc2..96a25877b8240f20921efa979a361eb473c05600 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -47,8 +47,6 @@ struct trace_noc_drvdata {
 	int			atid;
 };
 
-DEFINE_CORESIGHT_DEVLIST(trace_noc_devs, "traceNoc");
-
 static void trace_noc_enable_hw(struct trace_noc_drvdata *drvdata)
 {
 	u32 val;
@@ -191,7 +189,7 @@ static int _tnoc_probe(struct device *dev, struct resource *res)
 	struct coresight_desc desc = { 0 };
 	int ret;
 
-	desc.name = coresight_alloc_device_name(&trace_noc_devs, dev);
+	desc.name = coresight_alloc_device_name("traceNoc", dev);
 	if (!desc.name)
 		return -ENOMEM;
 
diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index 7055f8f1342785055ad18d6f7a741a179edc7013..89c8f71f0aff06e87971976efb23feb0057fcce6 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -20,8 +20,6 @@
 #include "coresight-trace-id.h"
 #include "coresight-tpdm.h"
 
-DEFINE_CORESIGHT_DEVLIST(tpda_devs, "tpda");
-
 static void tpda_clear_element_size(struct coresight_device *csdev)
 {
 	struct tpda_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
@@ -585,7 +583,7 @@ static int tpda_probe(struct amba_device *adev, const struct amba_id *id)
 	if (ret)
 		return ret;
 
-	desc.name = coresight_alloc_device_name(&tpda_devs, dev);
+	desc.name = coresight_alloc_device_name("tpda", dev);
 	if (!desc.name)
 		return -ENOMEM;
 	desc.type = CORESIGHT_DEV_TYPE_LINK;
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
index 06e0a905a67d7aa36625960711c28717b1d27fda..da77bdaad0a4519bd4e0653cc92e2a333e59e60d 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.c
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -19,8 +19,6 @@
 #include "coresight-priv.h"
 #include "coresight-tpdm.h"
 
-DEFINE_CORESIGHT_DEVLIST(tpdm_devs, "tpdm");
-
 static bool tpdm_has_dsb_dataset(struct tpdm_drvdata *drvdata)
 {
 	return (drvdata->datasets & TPDM_PIDR0_DS_DSB);
@@ -1416,7 +1414,7 @@ static int tpdm_probe(struct device *dev, struct resource *res)
 	}
 
 	/* Set up coresight component description */
-	desc.name = coresight_alloc_device_name(&tpdm_devs, dev);
+	desc.name = coresight_alloc_device_name("tpdm", dev);
 	if (!desc.name)
 		return -ENOMEM;
 	desc.type = CORESIGHT_DEV_TYPE_SOURCE;
diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
index aaa44bc521c330f5b2e385279e0cbda6ce72bccb..b8560b140e0fa4bf8bf1e5c60fe67077b11798fd 100644
--- a/drivers/hwtracing/coresight/coresight-tpiu.c
+++ b/drivers/hwtracing/coresight/coresight-tpiu.c
@@ -49,8 +49,6 @@
 #define FFCR_FON_MAN		BIT(6)
 #define FFCR_STOP_FI		BIT(12)
 
-DEFINE_CORESIGHT_DEVLIST(tpiu_devs, "tpiu");
-
 /*
  * @base:	memory mapped base address for this component.
  * @atclk:	optional clock for the core parts of the TPIU.
@@ -134,7 +132,7 @@ static int __tpiu_probe(struct device *dev, struct resource *res)
 	struct coresight_desc desc = { 0 };
 	int ret;
 
-	desc.name = coresight_alloc_device_name(&tpiu_devs, dev);
+	desc.name = coresight_alloc_device_name("tpiu", dev);
 	if (!desc.name)
 		return -ENOMEM;
 
diff --git a/drivers/hwtracing/coresight/ultrasoc-smb.c b/drivers/hwtracing/coresight/ultrasoc-smb.c
index 8f7922a5e534fde57ae4c84f2e72b33749809857..5776f63468fa05df255d3dd716f621c37424c048 100644
--- a/drivers/hwtracing/coresight/ultrasoc-smb.c
+++ b/drivers/hwtracing/coresight/ultrasoc-smb.c
@@ -17,8 +17,6 @@
 #include "coresight-priv.h"
 #include "ultrasoc-smb.h"
 
-DEFINE_CORESIGHT_DEVLIST(sink_devs, "ultra_smb");
-
 #define ULTRASOC_SMB_DSM_UUID	"82ae1283-7f6a-4cbe-aa06-53e8fb24db18"
 
 static bool smb_buffer_not_empty(struct smb_drv_data *drvdata)
@@ -478,7 +476,7 @@ static int smb_register_sink(struct platform_device *pdev,
 	desc.pdata = pdata;
 	desc.dev = &pdev->dev;
 	desc.groups = smb_sink_groups;
-	desc.name = coresight_alloc_device_name(&sink_devs, &pdev->dev);
+	desc.name = coresight_alloc_device_name("ultra_smb", &pdev->dev);
 	if (!desc.name) {
 		dev_err(&pdev->dev, "Failed to alloc coresight device name");
 		return -ENOMEM;
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 2b48be97fcd0d7ea2692206692bd33f35ba4ec79..2131febebee93d609df1aea8534a10898b600be2 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -306,24 +306,19 @@ struct coresight_device {
  * coresight_dev_list - Mapping for devices to "name" index for device
  * names.
  *
+ * @node:		Node on the global device index list.
  * @nr_idx:		Number of entries already allocated.
  * @pfx:		Prefix pattern for device name.
  * @fwnode_list:	Array of fwnode_handles associated with each allocated
  *			index, upto nr_idx entries.
  */
 struct coresight_dev_list {
+	struct list_head	node;
 	int			nr_idx;
-	const char		*pfx;
+	char			*pfx;
 	struct fwnode_handle	**fwnode_list;
 };
 
-#define DEFINE_CORESIGHT_DEVLIST(var, dev_pfx)				\
-static struct coresight_dev_list (var) = {				\
-						.pfx = dev_pfx,		\
-						.nr_idx = 0,		\
-						.fwnode_list = NULL,	\
-}
-
 #define to_coresight_device(d) container_of(d, struct coresight_device, dev)
 
 /**
@@ -663,8 +658,7 @@ void coresight_clear_self_claim_tag(struct csdev_access *csa);
 void coresight_clear_self_claim_tag_unlocked(struct csdev_access *csa);
 void coresight_disclaim_device(struct coresight_device *csdev);
 void coresight_disclaim_device_unlocked(struct coresight_device *csdev);
-char *coresight_alloc_device_name(struct coresight_dev_list *devs,
-					 struct device *dev);
+char *coresight_alloc_device_name(const char *prefix, struct device *dev);
 
 bool coresight_loses_context_with_cpu(struct device *dev);
 

-- 
2.34.1


