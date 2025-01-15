Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2379C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 08:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g1vToKAKNW4zdLS93Qdf0lRuFENalediCWpiCtcMczM=; b=A1u24AJUqEe06xjQYgpzlneUbf
	69xZyZ3Nv/4Gkmw7+tj807Qt66sbo34M3mgN4iAyxyEldSE3ecETvNkuMybWp/HJTRlz703svU8EE
	qeeXMwMdzeF2tmJoJ2xSLXad/gmhv58HmjHt6Egqr9Ghs4xlPLKG12Mcb8GBq91PGphHYB0JlMujm
	/vY5dr6ecQrBAOZ3wjgzxqwX+x+nwc1P/IrVS/nLbU6YgrsM08Rcu61PLJZ2qITqgLN655YbgbWi0
	aj/gFRqXCiMXjDGX8kOLtfDWP6mrOEXsHb2VSXyPsIuNVrKgtNt20n936am7K/JoakWkf+Zj7r9fw
	QqAoT3BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXz1Z-0000000B8mB-1aGk;
	Wed, 15 Jan 2025 08:45:17 +0000
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXyz4-0000000B8KZ-1PSo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 08:42:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1736930559; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=g1vToKAKNW4zdLS93Qdf0lRuFENalediCWpiCtcMczM=;
	b=n1Htm/Zzm7rOHNHXWAU6OTTylp+6A2ymh+yTYJwhVSx4Uk+J85/eMVqKhVWRjohR4zWOZyb2vReNsRpoqGYVnB2PWtGq2pWF45R9PRP4asWQfcqtWQK/YgShmF53nknZiC1286Llex9e0TDMdaZHh7YFB/tboQNq1TrAWySLI9M=
Received: from localhost(mailfrom:tianruidong@linux.alibaba.com fp:SMTPD_---0WNhzd2L_1736930556 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 15 Jan 2025 16:42:38 +0800
From: Ruidong Tian <tianruidong@linux.alibaba.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	lpieralisi@kernel.org,
	guohanjun@huawei.com,
	sudeep.holla@arm.com,
	xueshuai@linux.alibaba.com,
	baolin.wang@linux.alibaba.com,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	rafael@kernel.org,
	lenb@kernel.org,
	tony.luck@intel.com,
	bp@alien8.de,
	yazen.ghannam@amd.com
Cc: tianruidong@linux.alibaba.com
Subject: [PATCH v3 2/5] RAS/AEST: Introduce AEST driver sysfs interface
Date: Wed, 15 Jan 2025 16:42:25 +0800
Message-Id: <20250115084228.107573-3-tianruidong@linux.alibaba.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20250115084228.107573-1-tianruidong@linux.alibaba.com>
References: <20250115084228.107573-1-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_004242_815970_7EED6B41 
X-CRM114-Status: GOOD (  26.36  )
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

Exposes certain AEST driver information to userspace.

Only ROOT can access these interface because it includes
hardware-sensitive information.

All AEST device will create one platform device, and for oncore device,
like CPU error node, will create a directory named "ras" in each cpu
device, and this directory include all records of this core:

  ls /sys/kernel/debug/aest/
  record0 record1 ...

Interface in

All details at:
        Documentation/ABI/testing/sysfs-driver-aest

Signed-off-by: Ruidong Tian <tianruidong@linux.alibaba.com>
---
 Documentation/ABI/testing/debugfs-aest |  98 +++++++++++
 MAINTAINERS                            |   1 +
 drivers/acpi/arm64/aest.c              |   3 +
 drivers/ras/aest/Makefile              |   1 +
 drivers/ras/aest/aest-core.c           |  35 ++++
 drivers/ras/aest/aest-sysfs.c          | 226 +++++++++++++++++++++++++
 drivers/ras/aest/aest.h                |  15 +-
 7 files changed, 378 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/debugfs-aest
 create mode 100644 drivers/ras/aest/aest-sysfs.c

diff --git a/Documentation/ABI/testing/debugfs-aest b/Documentation/ABI/testing/debugfs-aest
new file mode 100644
index 000000000000..39d9c85843ef
--- /dev/null
+++ b/Documentation/ABI/testing/debugfs-aest
@@ -0,0 +1,98 @@
+What:		/sys/kernel/debug/aest/<name>.<uid>/
+Date:		June 2024
+KernelVersion	6.10
+Contact:	Ruidong Tian <tianruidong@linux.alibaba.com>
+Description:
+		Directory represented a AEST device, <name> means device type,
+		like:
+
+			processor
+			memory
+			smmu
+			...
+		<uid> is the unique ID for this device.
+
+What:		/sys/kernel/debug/aest/<dev_name>/<node_name>/*
+Date:		June 2024
+KernelVersion	6.10
+Contact:	Ruidong Tian <tianruidong@linux.alibaba.com>
+Description:
+		Attibute for aest node which belong this device, the format
+		of node name is: <Node Type>-<Node Address>
+
+		See more at:
+			https://developer.arm.com/documentation/den0085/latest/
+
+What:		/sys/kernel/debug/aest/<dev_name>/<node_name>/type
+Date:		June 2024
+KernelVersion	6.10
+Contact:	Ruidong Tian <tianruidong@linux.alibaba.com>
+Description:
+		(RO) Return number indicates aest node type:
+
+		0 : Processor
+		1 : Memory Controller
+		2 : SMMU
+		3 : Vendor-defined
+		4 : GIC
+		5 : PCIe Root Complex
+		6 : Proxy error
+
+		See more at:
+			https://developer.arm.com/documentation/den0085/latest/
+
+What:		/sys/kernel/debug/aest/<dev_name>/<node_name>/error_node_device
+Date:		June 2024
+KernelVersion	6.10
+Contact:	Ruidong Tian <tianruidong@linux.alibaba.com>
+Description:
+		(RO) ACPI _UID field of the Arm error node device in DSDT
+		that describes this error node
+
+		See more at:
+			https://developer.arm.com/documentation/den0085/latest/
+
+What:		/sys/kernel/debug/aest/<dev_name>/<node_name>/ce_threshold
+Date:		June 2024
+KernelVersion	6.10
+Contact:	Ruidong Tian <tianruidong@linux.alibaba.com>
+Description:
+		(WO) Write the ce threshold to all records of this node. Failed
+		if input exceeded the maximum threshold
+
+What:		/sys/kernel/debug/aest/<dev_name>/<node_name>/err_count
+Date:		June 2024
+KernelVersion	6.10
+Contact:	Ruidong Tian <tianruidong@linux.alibaba.com>
+Description:
+		(RO) Outputs error statistics for all error records of this node.
+
+What:		/sys/kernel/debug/aest/<dev_name>/<node_name>/record<index>/err_*
+Date:		June 2024
+KernelVersion	6.10
+Contact:	Ruidong Tian <tianruidong@linux.alibaba.com>
+Description:
+		(RO) Read err_* register and return val.
+
+What:		/sys/kernel/debug/aest/<dev_name>/<node_name>/record<index>/err_*
+Date:		June 2024
+KernelVersion	6.10
+Contact:	Ruidong Tian <tianruidong@linux.alibaba.com>
+Description:
+		(RO) Read err_* register and return val.
+
+
+What:		/sys/kernel/debug/aest/<dev_name>/<node_name>/record<index>/ce_threshold
+Date:		June 2024
+KernelVersion	6.10
+Contact:	Ruidong Tian <tianruidong@linux.alibaba.com>
+Description:
+		(RW) Read and write the ce threshold to this record. Failed
+		if input exceeded the maximum threshold
+
+What:		/sys/kernel/debug/aest/<dev_name>/<node_name>/record<index>/err_count
+Date:		June 2024
+KernelVersion	6.10
+Contact:	Ruidong Tian <tianruidong@linux.alibaba.com>
+Description:
+		(RO) Outputs error statistics for all this records.
diff --git a/MAINTAINERS b/MAINTAINERS
index d757f9339627..fe9ae27fdbec 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -335,6 +335,7 @@ M:	Ruidong Tian <tianruidond@linux.alibaba.com>
 L:	linux-acpi@vger.kernel.org
 L:	linux-arm-kernel@lists.infradead.org
 S:	Supported
+F:	Documentation/ABI/testing/debugfs-aest
 F:	arch/arm64/include/asm/ras.h
 F:	drivers/acpi/arm64/aest.c
 F:	drivers/ras/aest/
diff --git a/drivers/acpi/arm64/aest.c b/drivers/acpi/arm64/aest.c
index 6dba9c23e04e..312ddd5c15f5 100644
--- a/drivers/acpi/arm64/aest.c
+++ b/drivers/acpi/arm64/aest.c
@@ -318,6 +318,9 @@ void __init acpi_aest_init(void)
 	}
 
 	aest_array = kzalloc(sizeof(struct xarray), GFP_KERNEL);
+	if (!aest_array)
+		return;
+
 	xa_init(aest_array);
 
 	ret = acpi_aest_init_nodes(aest_table);
diff --git a/drivers/ras/aest/Makefile b/drivers/ras/aest/Makefile
index a6ba7e36fb43..75495413d2b6 100644
--- a/drivers/ras/aest/Makefile
+++ b/drivers/ras/aest/Makefile
@@ -3,3 +3,4 @@
 obj-$(CONFIG_AEST) 	+= aest.o
 
 aest-y		:= aest-core.o
+aest-y		+= aest-sysfs.o
diff --git a/drivers/ras/aest/aest-core.c b/drivers/ras/aest/aest-core.c
index 060a1eedee0a..12d0a32ecda9 100644
--- a/drivers/ras/aest/aest-core.c
+++ b/drivers/ras/aest/aest-core.c
@@ -20,6 +20,9 @@ DEFINE_PER_CPU(struct aest_device, percpu_adev);
 #undef pr_fmt
 #define pr_fmt(fmt) "AEST: " fmt
 
+#ifdef CONFIG_DEBUG_FS
+struct dentry *aest_debugfs;
+#endif
 /*
  * This memory pool is only to be used to save AEST node in AEST irq context.
  * There can be 500 AEST node at most.
@@ -165,6 +168,27 @@ aest_node_gen_pool_add(struct aest_device *adev, struct aest_record *record,
 	init_aest_event(event, record, regs);
 	llist_add(&event->llnode, &adev->event_list);
 
+	if (regs->err_status & ERR_STATUS_CE)
+		record->count.ce++;
+	if (regs->err_status & ERR_STATUS_DE)
+		record->count.de++;
+	if (regs->err_status & ERR_STATUS_UE) {
+		switch (regs->err_status & ERR_STATUS_UET) {
+		case ERR_STATUS_UET_UC:
+			record->count.uc++;
+			break;
+		case ERR_STATUS_UET_UEU:
+			record->count.ueu++;
+			break;
+		case ERR_STATUS_UET_UER:
+			record->count.uer++;
+			break;
+		case ERR_STATUS_UET_UEO:
+			record->count.ueo++;
+			break;
+		}
+	}
+
 	return 0;
 }
 
@@ -938,10 +962,13 @@ static int aest_device_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	aest_dev_init_debugfs(adev);
+
 	aest_dev_dbg(adev, "Node cnt: %x, uid: %x, irq: %d, %d\n",
 			adev->node_cnt, adev->uid, adev->irq[0], adev->irq[1]);
 
 	return 0;
+
 }
 
 static const struct acpi_device_id acpi_aest_ids[] = {
@@ -960,12 +987,20 @@ static struct platform_driver aest_driver = {
 
 static int __init aest_init(void)
 {
+#ifdef CONFIG_DEBUG_FS
+	aest_debugfs = debugfs_create_dir("aest", NULL);
+#endif
+
 	return platform_driver_register(&aest_driver);
 }
 module_init(aest_init);
 
 static void __exit aest_exit(void)
 {
+#ifdef CONFIG_DEBUG_FS
+	debugfs_remove(aest_debugfs);
+#endif
+
 	platform_driver_unregister(&aest_driver);
 }
 module_exit(aest_exit);
diff --git a/drivers/ras/aest/aest-sysfs.c b/drivers/ras/aest/aest-sysfs.c
new file mode 100644
index 000000000000..f19cd2b5edb2
--- /dev/null
+++ b/drivers/ras/aest/aest-sysfs.c
@@ -0,0 +1,226 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ARM Error Source Table Support
+ *
+ * Copyright (c) 2024, Alibaba Group.
+ */
+
+#include "aest.h"
+
+static void
+aest_store_threshold(struct aest_record *record, void *data)
+{
+	u64 err_misc0, *threshold = data;
+	struct ce_threshold *ce = &record->ce;
+
+	if (*threshold > ce->info->max_count)
+		return;
+
+	ce->threshold = *threshold;
+	ce->count = ce->info->max_count - ce->threshold + 1;
+
+	err_misc0 = record_read(record, ERXMISC0);
+	ce->reg_val = (err_misc0 & ~ce->info->mask) |
+			(ce->count << ce->info->shift);
+
+	record_write(record, ERXMISC0, ce->reg_val);
+}
+
+static void
+aest_error_count(struct aest_record *record, void *data)
+{
+	struct record_count *count = data;
+
+	count->ce += record->count.ce;
+	count->de += record->count.de;
+	count->uc += record->count.uc;
+	count->ueu += record->count.ueu;
+	count->uer += record->count.uer;
+	count->ueo += record->count.ueo;
+}
+
+/*******************************************************************************
+ *
+ * Debugfs for AEST node
+ *
+ ******************************************************************************/
+
+static int aest_node_err_count_show(struct seq_file *m, void *data)
+{
+	struct aest_node *node = data;
+	struct record_count count = { 0 };
+	int i;
+
+	for (i = 0; i < node->record_count; i++)
+		aest_error_count(&node->records[i], &count);
+
+	seq_printf(m, "CE: %llu\n"
+				"DE: %llu\n"
+				"UC: %llu\n"
+				"UEU: %llu\n"
+				"UEO: %llu\n"
+				"UER: %llu\n",
+				count.ce, count.de, count.uc, count.ueu,
+				count.uer, count.ueo);
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(aest_node_err_count);
+
+/*******************************************************************************
+ *
+ * Attribute for AEST record
+ *
+ ******************************************************************************/
+
+#define DEFINE_AEST_DEBUGFS_ATTR(name, offset) \
+static int name##_get(void *data, u64 *val) \
+{ \
+	struct aest_record *record = data; \
+	*val = record_read(record, offset); \
+	return 0; \
+} \
+static int name##_set(void *data, u64 val) \
+{ \
+	struct aest_record *record = data; \
+	record_write(record, offset, val); \
+	return 0; \
+} \
+DEFINE_DEBUGFS_ATTRIBUTE(name##_ops, name##_get, name##_set, "%#llx\n")
+
+DEFINE_AEST_DEBUGFS_ATTR(err_fr, ERXFR);
+DEFINE_AEST_DEBUGFS_ATTR(err_ctrl, ERXCTLR);
+DEFINE_AEST_DEBUGFS_ATTR(err_status, ERXSTATUS);
+DEFINE_AEST_DEBUGFS_ATTR(err_addr, ERXADDR);
+DEFINE_AEST_DEBUGFS_ATTR(err_misc0, ERXMISC0);
+DEFINE_AEST_DEBUGFS_ATTR(err_misc1, ERXMISC1);
+DEFINE_AEST_DEBUGFS_ATTR(err_misc2, ERXMISC2);
+DEFINE_AEST_DEBUGFS_ATTR(err_misc3, ERXMISC3);
+
+static int record_ce_threshold_get(void *data, u64 *val)
+{
+	struct aest_record *record = data;
+
+	*val = record->ce.threshold;
+	return 0;
+}
+
+static int record_ce_threshold_set(void *data, u64 val)
+{
+	u64 threshold = val;
+	struct aest_record *record = data;
+
+	aest_store_threshold(record, &threshold);
+
+	return 0;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(record_ce_threshold_ops, record_ce_threshold_get,
+					record_ce_threshold_set, "%llu\n");
+
+static int aest_record_err_count_show(struct seq_file *m, void *data)
+{
+	struct aest_record *record = data;
+	struct record_count count = { 0 };
+
+	aest_error_count(record, &count);
+
+	seq_printf(m, "CE: %llu\n"
+				"DE: %llu\n"
+				"UC: %llu\n"
+				"UEU: %llu\n"
+				"UEO: %llu\n"
+				"UER: %llu\n",
+				count.ce, count.de, count.uc, count.ueu,
+				count.uer, count.ueo);
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(aest_record_err_count);
+
+static void aest_record_init_debugfs(struct aest_record *record)
+{
+	debugfs_create_file("err_fr", 0600, record->debugfs, record,
+								&err_fr_ops);
+	debugfs_create_file("err_ctrl", 0600, record->debugfs, record,
+								&err_ctrl_ops);
+	debugfs_create_file("err_status", 0600, record->debugfs, record,
+								&err_status_ops);
+	debugfs_create_file("err_addr", 0600, record->debugfs, record,
+								&err_addr_ops);
+	debugfs_create_file("err_misc0", 0600, record->debugfs, record,
+								&err_misc0_ops);
+	debugfs_create_file("err_misc1", 0600, record->debugfs, record,
+								&err_misc1_ops);
+	debugfs_create_file("err_misc2", 0600, record->debugfs, record,
+								&err_misc2_ops);
+	debugfs_create_file("err_misc3", 0600, record->debugfs, record,
+								&err_misc3_ops);
+	debugfs_create_file("err_count", 0400, record->debugfs, record,
+						&aest_record_err_count_fops);
+	debugfs_create_file("ce_threshold", 0400, record->debugfs, record,
+						&record_ce_threshold_ops);
+}
+
+static void
+aest_node_init_debugfs(struct aest_node *node)
+{
+	int i;
+	struct aest_record *record;
+
+	debugfs_create_u32("device_id", 0400, node->debugfs,
+				&node->info->common->error_node_device);
+	debugfs_create_file("err_count", 0400, node->debugfs, node,
+					&aest_node_err_count_fops);
+
+	for (i = 0; i < node->record_count; i++) {
+		record = &node->records[i];
+		if (!record->name)
+			continue;
+		record->debugfs = debugfs_create_dir(record->name,
+								node->debugfs);
+		aest_record_init_debugfs(record);
+	}
+}
+
+static void
+aest_oncore_dev_init_debugfs(struct aest_device *adev)
+{
+	int cpu, i;
+	struct aest_node *node;
+	struct aest_device *percpu_dev;
+	char name[16];
+
+	for_each_possible_cpu(cpu) {
+		percpu_dev = this_cpu_ptr(adev->adev_oncore);
+
+		snprintf(name, sizeof(name), "processor%u", cpu);
+		percpu_dev->debugfs = debugfs_create_dir(name, aest_debugfs);
+
+		for (i = 0; i < adev->node_cnt; i++) {
+			node = &adev->nodes[i];
+
+			node->debugfs = debugfs_create_dir(node->name,
+							percpu_dev->debugfs);
+			aest_node_init_debugfs(node);
+		}
+	}
+}
+
+void aest_dev_init_debugfs(struct aest_device *adev)
+{
+	int i;
+	struct aest_node *node;
+
+	adev->debugfs = debugfs_create_dir(dev_name(adev->dev), aest_debugfs);
+	if (aest_dev_is_oncore(adev)) {
+		aest_oncore_dev_init_debugfs(adev);
+		return;
+	}
+
+	for (i = 0; i < adev->node_cnt; i++) {
+		node = &adev->nodes[i];
+		if (!node->name)
+			continue;
+		node->debugfs = debugfs_create_dir(node->name, adev->debugfs);
+		aest_node_init_debugfs(node);
+	}
+}
diff --git a/drivers/ras/aest/aest.h b/drivers/ras/aest/aest.h
index 04005aad3617..d9a52e39b1b9 100644
--- a/drivers/ras/aest/aest.h
+++ b/drivers/ras/aest/aest.h
@@ -7,6 +7,7 @@
 
 #include <linux/acpi_aest.h>
 #include <asm/ras.h>
+#include <linux/debugfs.h>
 
 #define MAX_GSI_PER_NODE 2
 #define AEST_MAX_PPI 3
@@ -53,7 +54,7 @@
 #define ERXGROUP		0xE00
 #define GIC_ERRDEVARCH		0xFFBC
 
-extern struct xarray *aest_array;
+extern struct dentry *aest_debugfs;
 
 struct aest_event {
 	struct llist_node llnode;
@@ -104,6 +105,15 @@ struct ce_threshold {
 	u64				reg_val;
 };
 
+struct record_count {
+	u64				ce;
+	u64				de;
+	u64				uc;
+	u64				uer;
+	u64				ueo;
+	u64				ueu;
+};
+
 struct aest_record {
 	char				*name;
 	int				index;
@@ -125,6 +135,7 @@ struct aest_record {
 	struct dentry			*debugfs;
 	struct ce_threshold		ce;
 	enum ras_ce_threshold		threshold_type;
+	struct record_count		count;
 	const struct aest_access	*access;
 
 	void				*vendor_data;
@@ -321,3 +332,5 @@ aest_set_name(struct aest_device *adev, struct aest_hnode *ahnode)
 
 	return 0;
 }
+
+void aest_dev_init_debugfs(struct aest_device *adev);
-- 
2.33.1


