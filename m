Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E31AD6260B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 09:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F3sZ4Yf6WwtX3/wcIrvWpRHHa87NxwTBt9HNKiubwwU=; b=jdn9UCxsEnCSDFOZkZkfCdvktE
	Vw1qZyNTQTD5xpQyU8Krafnjvxi983ikLlZPkoBmGrfE2lpt7gMl+ezg2YW/X0lt+w79VPj01cLOy
	rxocx0USmvOv7hNNn1Picui/8rPA51s4RJ0btHn4EKdbzCjVNpyhWMNF9KwqWETdLtfMCCpow526Q
	O9Yz8LsdDickWHhr7uYWEaKDB4Vq7vbf+k2GuVdHlV9yamntDVX9W9UO6emJEPx9/62aDYYkDLR44
	Za63B0CkAadpxRjqf6D8VLonP9Qg/BzSiriNSDsc96/MYVzFmMyJNGn6qMXlPZ4mHQ4ATyLza26Yi
	tZB7R/Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virJA-00000006m9u-42gu;
	Thu, 22 Jan 2026 09:48:56 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virJ7-00000006m6f-2zxx
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Jan 2026 09:48:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=F3sZ4Yf6WwtX3/wcIrvWpRHHa87NxwTBt9HNKiubwwU=; b=PrCcboP6yLyV5MrCoLNiiLMgsN
	JvqFXasKr4NCXAUFra4OPNNIJsnFmP0ucmT+r+oPIy7qkqtdu0o0d9+3dOaSRe3USueOnt17Fsazz
	bRAYgy9iiB5NDhdW/nhF6r3EPdbDoGGcrJ2KnxPwwwqdyzIH+JlCymZj36D48jZ3+OfV8lHyab2nK
	E9CW1wnr/uRQ/yWeOvjqjkjLdylBMyaZVQzrOMPrfxyp3+4ylIW4gHqPPxRh3OoXxnrHK02FDQHbt
	L1+R15ij31yo+YUqxoJEmG/xB/Y+8FLvlPyx5MNOxLfoIyJqKKlCdrQ9C/7S0vpxFMS5HQFWlEhPS
	NuIyFVBQ==;
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virJ4-000000008GK-0xdE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 09:48:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1769075309; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=F3sZ4Yf6WwtX3/wcIrvWpRHHa87NxwTBt9HNKiubwwU=;
	b=h0Q7juKWTaKuLWKkn6UxW/SizhEHpXoUYRLfkeFWNrC/bhbaPyvclUAVMPE1FAnLI2OpzaxOXV2WDCGuTRXJpB1KtWK2TBIf2G4a4Ftq165FPDZ4gZ6eqR14VuvlnGLHzR0LmW/0c9fvi4lY499iAwoUrV43FWjoO6KRNN6P3NI=
Received: from localhost(mailfrom:tianruidong@linux.alibaba.com fp:SMTPD_---0WxbuarO_1769075305 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 22 Jan 2026 17:48:28 +0800
From: Ruidong Tian <tianruidong@linux.alibaba.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	lpieralisi@kernel.org,
	guohanjun@huawei.com,
	sudeep.holla@arm.com,
	rafael@kernel.org,
	robin.murphy@arm.com,
	mark.rutland@arm.com,
	tony.luck@intel.com,
	bp@alien8.de,
	tglx@linutronix.de,
	peterz@infradead.org
Cc: lenb@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-edac@vger.kernel.org,
	mchehab@kernel.org,
	xueshuai@linux.alibaba.com,
	zhuo.song@linux.alibaba.com,
	oliver.yang@linux.alibaba.com,
	Ruidong Tian <tianruidong@linux.alibaba.com>
Subject: [PATCH v6 13/16] ras: AEST: Introduce AEST inject interface to test AEST driver
Date: Thu, 22 Jan 2026 17:46:53 +0800
Message-Id: <20260122094656.73399-14-tianruidong@linux.alibaba.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20260122094656.73399-1-tianruidong@linux.alibaba.com>
References: <20260122094656.73399-1-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_094850_806515_D70BA262 
X-CRM114-Status: GOOD (  22.07  )
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

AEST offers both soft and hard injection. Soft injection simulates errors
in software, providing flexibility to define the error register content.
Hard injection, on the other hand, utilizes error injection registers to
introduce hardware faults, strictly requiring values that adhere to their
specifications.

Read Documentation/ABI/testing/debugfs-aest to learn how to use them.

Signed-off-by: Ruidong Tian <tianruidong@linux.alibaba.com>
---
 Documentation/ABI/testing/debugfs-aest |  37 +++++++
 drivers/ras/aest/Makefile              |   1 +
 drivers/ras/aest/aest-core.c           |  24 +++--
 drivers/ras/aest/aest-inject.c         | 131 +++++++++++++++++++++++++
 drivers/ras/aest/aest-sysfs.c          |   8 +-
 drivers/ras/aest/aest.h                |   2 +
 6 files changed, 193 insertions(+), 10 deletions(-)
 create mode 100644 drivers/ras/aest/aest-inject.c

diff --git a/Documentation/ABI/testing/debugfs-aest b/Documentation/ABI/testing/debugfs-aest
index 4d160072d37a..cc41ea7032c7 100644
--- a/Documentation/ABI/testing/debugfs-aest
+++ b/Documentation/ABI/testing/debugfs-aest
@@ -60,3 +60,40 @@ KernelVersion	6.19
 Contact:	Ruidong Tian <tianruidong@linux.alibaba.com>
 Description:
 		(RO) Outputs error statistics for all this records.
+
+What:		/sys/kernel/debug/aest/<name>.<id>/<node_name>/record<index>/inject/err_*
+Date:		Dec 2025
+KernelVersion	6.19
+Contact:	Ruidong Tian <tianruidong@linux.alibaba.com>
+Description:
+		(RW) These registers are used to simulate soft injection errors
+		by holding error register values. You can write any values
+		to them. To trigger the injection, you need to write soft_inject
+		at last. The validity of the injected error depends on the
+		value written to err_status.
+
+		Accepts values -  any.
+
+What:		/sys/kernel/debug/aest/<name>.<id>/<node_name>/record<index>/inject/soft_inject
+Date:		Dec 2025
+KernelVersion	6.19
+Contact:	Ruidong Tian <tianruidong@linux.alibaba.com>
+Description:
+		(WO) Write any value to this file to trigger the error
+		injection. Make sure you have specified all necessary error
+		parameters, i.e. this write should be the last step when
+		injecting errors.
+
+		Accepts values -  any.
+
+What:		/sys/kernel/debug/aest/<name>.<id>/<node_name>/record<index>/inject/hard_inject
+Date:		Dec 2025
+KernelVersion	6.19
+Contact:	Ruidong Tian <tianruidong@linux.alibaba.com>
+Description:
+		(WO) If the AEST table provides error injection registers,
+		you can write to them via this interface. For instance,
+		values can be written to the ERXPFGCTL register. The post-injection
+		behavior is then determined by the hardware specification.
+
+		Accepts values - any.
diff --git a/drivers/ras/aest/Makefile b/drivers/ras/aest/Makefile
index 75495413d2b6..5ee10fc8b2e9 100644
--- a/drivers/ras/aest/Makefile
+++ b/drivers/ras/aest/Makefile
@@ -4,3 +4,4 @@ obj-$(CONFIG_AEST) 	+= aest.o
 
 aest-y		:= aest-core.o
 aest-y		+= aest-sysfs.o
+aest-y		+= aest-inject.o
diff --git a/drivers/ras/aest/aest-core.c b/drivers/ras/aest/aest-core.c
index 75cca98024ad..a290b482bf8b 100644
--- a/drivers/ras/aest/aest-core.c
+++ b/drivers/ras/aest/aest-core.c
@@ -273,7 +273,7 @@ static void aest_panic(struct aest_record *record, struct ras_ext_regs *regs,
 	panic(msg);
 }
 
-static void aest_proc_record(struct aest_record *record, void *data)
+void aest_proc_record(struct aest_record *record, void *data, bool fake)
 {
 	struct ras_ext_regs regs = { 0 };
 	int *count = data;
@@ -315,9 +315,15 @@ static void aest_proc_record(struct aest_record *record, void *data)
 	/* panic if unrecoverable and uncontainable error encountered */
 	ue = FIELD_GET(ERR_STATUS_UET, regs.err_status);
 	if ((regs.err_status & ERR_STATUS_UE) &&
-	    (ue == ERR_STATUS_UET_UC || ue == ERR_STATUS_UET_UEU))
-		aest_panic(record, &regs,
-			   "AEST: unrecoverable error encountered");
+	    (ue == ERR_STATUS_UET_UC || ue == ERR_STATUS_UET_UEU)) {
+		if (fake)
+			aest_record_info(
+				record,
+				"Simulated error! Skip panic due to fault injection\n");
+		else
+			aest_panic(record, &regs,
+				   "AEST: unrecoverable error encountered");
+	}
 
 	aest_log(record, &regs);
 
@@ -335,7 +341,8 @@ static void aest_proc_record(struct aest_record *record, void *data)
 	record_write(record, ERXSTATUS, regs.err_status);
 }
 
-static void aest_node_foreach_record(void (*func)(struct aest_record *, void *),
+static void aest_node_foreach_record(void (*func)(struct aest_record *, void *,
+						  bool),
 				     struct aest_node *node, void *data,
 				     unsigned long *bitmap)
 {
@@ -344,7 +351,7 @@ static void aest_node_foreach_record(void (*func)(struct aest_record *, void *),
 	for_each_clear_bit(i, bitmap, node->record_count) {
 		aest_select_record(node, i);
 
-		func(&node->records[i], data);
+		func(&node->records[i], data, false);
 
 		aest_sync(node);
 	}
@@ -379,7 +386,7 @@ static int aest_proc(struct aest_node *node)
 			if (test_bit(i * BITS_PER_LONG + j,
 				     node->status_reporting))
 				continue;
-			aest_proc_record(&node->records[j], &count);
+			aest_proc_record(&node->records[j], &count, false);
 		}
 	}
 
@@ -595,7 +602,8 @@ static int aest_init_record(struct aest_record *record, int i,
 	return 0;
 }
 
-static void aest_online_record(struct aest_record *record, void *data)
+static void aest_online_record(struct aest_record *record, void *data,
+			       bool __unused)
 {
 	if (record_read(record, ERXFR) & ERR_FR_CE)
 		aest_set_ce_threshold(record);
diff --git a/drivers/ras/aest/aest-inject.c b/drivers/ras/aest/aest-inject.c
new file mode 100644
index 000000000000..fe6ccac8338e
--- /dev/null
+++ b/drivers/ras/aest/aest-inject.c
@@ -0,0 +1,131 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ARM Error Source Table Support
+ *
+ * Copyright (c) 2024, Alibaba Group.
+ */
+
+#include "aest.h"
+
+static struct ras_ext_regs regs_inj;
+
+struct inj_attr {
+	struct attribute attr;
+	ssize_t (*show)(struct aest_node *n, struct inj_attr *a, char *b);
+	ssize_t (*store)(struct aest_node *n, struct inj_attr *a, const char *b,
+				size_t c);
+};
+
+struct aest_inject {
+	struct aest_node *node;
+	struct kobject kobj;
+};
+
+#define to_inj(k)	container_of(k, struct aest_inject, kobj)
+#define to_inj_attr(a)	container_of(a, struct inj_attr, attr)
+
+static u64 aest_sysreg_read_inject(void *__unused, u32 offset)
+{
+	u64 *p = (u64 *)&regs_inj;
+
+	return p[offset/8];
+}
+
+static void aest_sysreg_write_inject(void *base, u32 offset, u64 val)
+{
+	u64 *p = (u64 *)&regs_inj;
+
+	p[offset/8] = val;
+}
+
+static u64 aest_iomem_read_inject(void *base, u32 offset)
+{
+	u64 *p = (u64 *)&regs_inj;
+
+	return p[offset/8];
+}
+
+static void aest_iomem_write_inject(void *base, u32 offset, u64 val)
+{
+	u64 *p = (u64 *)&regs_inj;
+
+	p[offset/8] = val;
+}
+
+static struct aest_access aest_access_inject[] = {
+	[ACPI_AEST_NODE_SYSTEM_REGISTER] = {
+		.read = aest_sysreg_read_inject,
+		.write = aest_sysreg_write_inject,
+	},
+
+	[ACPI_AEST_NODE_MEMORY_MAPPED] = {
+		.read = aest_iomem_read_inject,
+		.write = aest_iomem_write_inject,
+	},
+	[ACPI_AEST_NODE_SINGLE_RECORD_MEMORY_MAPPED] = {
+		.read = aest_iomem_read_inject,
+		.write = aest_iomem_write_inject,
+	},
+	{ }
+};
+
+static int soft_inject_store(void *data, u64 val)
+{
+	int count = 0;
+	struct aest_record record_inj, *record = data;
+	struct aest_node node_inj, *node = record->node;
+
+	memcpy(&node_inj, node, sizeof(*node));
+	node_inj.name = "AEST-injection";
+
+	record_inj.access = &aest_access_inject[node->info->interface_hdr->type];
+	record_inj.node = &node_inj;
+	record_inj.index = record->index;
+
+	regs_inj.err_status |= ERR_STATUS_V;
+
+	aest_proc_record(&record_inj, &count, true);
+
+	if (count != 1)
+		return -EIO;
+
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(soft_inject_ops, NULL, soft_inject_store, "%llu\n");
+
+static int hard_inject_store(void *data, u64 val)
+{
+	struct aest_record *record = data;
+	struct aest_node *node = record->node;
+
+	if (!node->inj)
+		return -EPERM;
+
+	aest_select_record(node, record->index);
+	record_write(record, ERXPFGCTL, val);
+	record_write(record, ERXPFGCDN, 0x100);
+	aest_sync(node);
+
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(hard_inject_ops, NULL, hard_inject_store, "%llu\n");
+
+void aest_inject_init_debugfs(struct aest_record *record)
+{
+	struct dentry *inj;
+
+	inj = debugfs_create_dir("inject", record->debugfs);
+
+	debugfs_create_u64("err_fr", 0600, inj, &regs_inj.err_fr);
+	debugfs_create_u64("err_ctrl", 0600, inj, &regs_inj.err_ctlr);
+	debugfs_create_u64("err_status", 0600, inj, &regs_inj.err_status);
+	debugfs_create_u64("err_addr", 0600, inj, &regs_inj.err_addr);
+	debugfs_create_u64("err_misc0", 0600, inj, &regs_inj.err_misc[0]);
+	debugfs_create_u64("err_misc1", 0600, inj, &regs_inj.err_misc[1]);
+	debugfs_create_u64("err_misc2", 0600, inj, &regs_inj.err_misc[2]);
+	debugfs_create_u64("err_misc3", 0600, inj, &regs_inj.err_misc[3]);
+	debugfs_create_file("soft_inject", 0400, inj, record, &soft_inject_ops);
+
+	if (record->node->inj)
+		debugfs_create_file("hard_inject", 0400, inj, record, &hard_inject_ops);
+}
diff --git a/drivers/ras/aest/aest-sysfs.c b/drivers/ras/aest/aest-sysfs.c
index 392e7ad8328e..66e9c1103f99 100644
--- a/drivers/ras/aest/aest-sysfs.c
+++ b/drivers/ras/aest/aest-sysfs.c
@@ -158,6 +158,7 @@ static void aest_record_init_debugfs(struct aest_record *record)
 						&aest_record_err_count_fops);
 	debugfs_create_file("ce_threshold", 0600, record->debugfs, record,
 						&record_ce_threshold_ops);
+	aest_inject_init_debugfs(record);
 }
 
 static void
@@ -190,8 +191,8 @@ aest_oncore_dev_init_debugfs(struct aest_device *adev)
 	for_each_possible_cpu(cpu) {
 		percpu_dev = this_cpu_ptr(adev->adev_oncore);
 
-		snprintf(name, sizeof(name), "processor%u", cpu);
-		percpu_dev->debugfs = debugfs_create_dir(name, aest_debugfs);
+		snprintf(name, sizeof(name), "processor%u%u", cpu);
+		percpu_dev->debugfs = debugfs_create_dir(name, adev->debugfs);
 
 		for (i = 0; i < adev->node_cnt; i++) {
 			node = &adev->nodes[i];
@@ -208,6 +209,9 @@ void aest_dev_init_debugfs(struct aest_device *adev)
 	int i;
 	struct aest_node *node;
 
+	if (!aest_debugfs)
+		dev_err(adev->dev, "debugfs not enabled\n");
+
 	adev->debugfs = debugfs_create_dir(dev_name(adev->dev), aest_debugfs);
 	if (aest_dev_is_oncore(adev)) {
 		aest_oncore_dev_init_debugfs(adev);
diff --git a/drivers/ras/aest/aest.h b/drivers/ras/aest/aest.h
index 802430857dc4..2f6a7b9ca4ef 100644
--- a/drivers/ras/aest/aest.h
+++ b/drivers/ras/aest/aest.h
@@ -362,3 +362,5 @@ static inline bool aest_dev_is_oncore(struct aest_device *adev)
 }
 
 void aest_dev_init_debugfs(struct aest_device *adev);
+void aest_inject_init_debugfs(struct aest_record *record);
+void aest_proc_record(struct aest_record *record, void *data, bool fake);
-- 
2.51.2.612.gdc70283dfc


