Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 651D1CD6E61
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 07:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7gkf4QjVEhb8uFI0feUbMQvBshcd3PL9ANlWVkCDcgw=; b=vwDlrRgQj2CWIxyVPAv4yAU/fp
	UCBMfBqPuIEVUPuVvY2pU7x/+zhMDJuGw0ydB4AaOBzmVs+Eb/h+1jkjjb0H8L0GGjlMtuftutogK
	oSgMgcNjFJC/qdkFt21nxR/WpNZtxn9e3ok2oM6ErATImy4b9Ltxnifj13VxcMvsXWlgeXbOiTkPC
	hDPJGJhqRJgemfbVx6biAdcCfpGA6dD7SMRx7fz4O6+mZynnRUz3XrTIJkFK/D6H9dQedhmZhyE59
	wpt04XBfX5FbrF7vx5V/FiinkqSfcwkhHLCCO3YNWbe+JywandgfQEm1AOWBewShgUnDzrmwICbwy
	xnLbmDzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUJMU-0000000CRMN-11AN;
	Tue, 02 Jun 2026 07:16:30 +0000
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUJMI-0000000CR3v-2IYW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 07:16:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780384573; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=7gkf4QjVEhb8uFI0feUbMQvBshcd3PL9ANlWVkCDcgw=;
	b=s2dI6SaECnhAJmr5bq+Rlvzd0CJINSglVufGfgCDXPPgM5J1GMcdSUc3NF8c0zqg5CyIkw06w+CcXzVqQDzYZZJ+6lrh3VT++YSSSjEvuE50+dsqCD7bcqqCi3yQ9uDsMVgxmJe0BGP3rOLyJP/0d3LL02vE9FZELqm6r2cZSUk=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=tianruidong@linux.alibaba.com;NM=1;PH=DS;RN=20;SR=0;TI=SMTPD_---0X43R2fz_1780384571;
Received: from t50a05405.sqa.eu95.tbsite.net(mailfrom:tianruidong@linux.alibaba.com fp:SMTPD_---0X43R2fz_1780384571 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 02 Jun 2026 15:16:12 +0800
From: Ruidong Tian <tianruidong@linux.alibaba.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-edac@vger.kernel.org,
	zhuo.song@linux.alibaba.com,
	oliver.yang@linux.alibaba.com,
	Ruidong Tian <tianruidong@linux.alibaba.com>
Subject: [PATCH v7 12/16] arm64: ras: Expose config abi through debugfs
Date: Tue,  2 Jun 2026 15:15:35 +0800
Message-ID: <20260602071540.3711528-13-tianruidong@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260602071540.3711528-1-tianruidong@linux.alibaba.com>
References: <20260602071540.3711528-1-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_001619_150737_04F9936D 
X-CRM114-Status: GOOD (  28.30  )
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

Expose per-node and per-record configuration through debugfs so
bring-up and validation can inspect and tweak driver state (CE
threshold, error counters,  ...) at runtime.

Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
Signed-off-by: Ruidong Tian <tianruidong@linux.alibaba.com>
---
 Documentation/ABI/testing/debugfs-arm64-ras |  50 +++++
 MAINTAINERS                                 |   1 +
 drivers/ras/arm64/Makefile                  |   1 +
 drivers/ras/arm64/ras-core.c                |  31 +++
 drivers/ras/arm64/ras-sysfs.c               | 211 ++++++++++++++++++++
 drivers/ras/arm64/ras.h                     |  17 ++
 drivers/ras/debugfs.c                       |   3 +-
 include/linux/ras.h                         |   2 +
 8 files changed, 315 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/debugfs-arm64-ras
 create mode 100644 drivers/ras/arm64/ras-sysfs.c

diff --git a/Documentation/ABI/testing/debugfs-arm64-ras b/Documentation/ABI/testing/debugfs-arm64-ras
new file mode 100644
index 000000000000..d86bde83d0b9
--- /dev/null
+++ b/Documentation/ABI/testing/debugfs-arm64-ras
@@ -0,0 +1,50 @@
+What:		/sys/kernel/debug/ras/arm64/<node_name>/
+Date:		Dec 2025
+KernelVersion:	6.19
+Contact:	Ruidong Tian <tianruidong@linux.alibaba.com>
+Description:
+		Directory representing a RAS node device, <name> means device
+		type, like:
+
+		- processor
+		- memory
+		- smmu
+		- ...
+
+What:		/sys/kernel/debug/ras/arm64/<node_name>/record<index>/err_*
+Date:		Dec 2025
+KernelVersion:	6.19
+Contact:	Ruidong Tian <tianruidong@linux.alibaba.com>
+Description:
+		(RW) Read/Write err_* register.
+
+What:		/sys/kernel/debug/ras/arm64/<node_name>/err_count
+Date:		Dec 2025
+KernelVersion:	6.19
+Contact:	Ruidong Tian <tianruidong@linux.alibaba.com>
+Description:
+		(RO) Outputs error statistics for all error records of this node.
+
+
+What:		/sys/kernel/debug/ras/arm64/<node_name>/record<index>/err_count
+Date:		Dec 2025
+KernelVersion:	6.19
+Contact:	Ruidong Tian <tianruidong@linux.alibaba.com>
+Description:
+		(RO) Outputs error statistics for this record.
+
+What:		/sys/kernel/debug/ras/arm64/<node_name>/ce_threshold
+Date:		Dec 2025
+KernelVersion:	6.19
+Contact:	Ruidong Tian <tianruidong@linux.alibaba.com>
+Description:
+		(WO) Write the CE threshold to all records of this node.
+		Returns error if input exceeded the maximum threshold.
+
+What:		/sys/kernel/debug/ras/arm64/<node_name>/record<index>/ce_threshold
+Date:		Dec 2025
+KernelVersion:	6.19
+Contact:	Ruidong Tian <tianruidong@linux.alibaba.com>
+Description:
+		(RW) Read and write the CE threshold to this record.
+		Returns error if input exceeded the maximum threshold.
\ No newline at end of file
diff --git a/MAINTAINERS b/MAINTAINERS
index 766d1240b465..007a5a69b6d9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -349,6 +349,7 @@ M:	Ruidong Tian <tianruidong@linux.alibaba.com>
 L:	linux-acpi@vger.kernel.org
 L:	linux-arm-kernel@lists.infradead.org
 S:	Supported
+F:	Documentation/ABI/testing/debugfs-arm64-ras
 F:	arch/arm64/include/asm/ras.h
 F:	drivers/acpi/arm64/aest.c
 F:	drivers/ras/arm64/
diff --git a/drivers/ras/arm64/Makefile b/drivers/ras/arm64/Makefile
index c5387f05a067..e13e223107dd 100644
--- a/drivers/ras/arm64/Makefile
+++ b/drivers/ras/arm64/Makefile
@@ -3,3 +3,4 @@
 obj-$(CONFIG_ARM64_RAS_DRIVER) 	+= arm64_ras.o
 
 arm64_ras-y		:= ras-core.o
+arm64_ras-y		+= ras-sysfs.o
diff --git a/drivers/ras/arm64/ras-core.c b/drivers/ras/arm64/ras-core.c
index 0b07b69545ad..c427c131a862 100644
--- a/drivers/ras/arm64/ras-core.c
+++ b/drivers/ras/arm64/ras-core.c
@@ -25,6 +25,8 @@ MODULE_PARM_DESC(aest_panic_on_ue,
 
 static DEFINE_PER_CPU(struct ras_node, percpu_ras_node);
 
+struct dentry *arm64_ras_debugfs;
+
 static const char *const ras_node_name[] = {
 	[ACPI_AEST_PROCESSOR_ERROR_NODE] = "processor",
 	[ACPI_AEST_MEMORY_ERROR_NODE] = "memory",
@@ -158,6 +160,27 @@ static void ras_do_proc(struct ras_record *record, struct ras_ext_regs *regs)
 	u64 status = regs->err_status, addr = regs->err_addr;
 
 	ras_print(record, regs);
+	if (regs->err_status & ERR_STATUS_CE)
+		record->count.ce++;
+	if (regs->err_status & ERR_STATUS_DE)
+		record->count.de++;
+	if (regs->err_status & ERR_STATUS_UE) {
+		switch (FIELD_GET(ERR_STATUS_UET, regs->err_status)) {
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
 	atomic_notifier_call_chain(&ras_decoder_chain, 0, record);
 
 	if (status & ERR_STATUS_CE)
@@ -887,6 +910,8 @@ static int arm64_ras_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, node);
 
+	ras_node_init_debugfs(node);
+
 	return 0;
 }
 
@@ -900,12 +925,18 @@ static struct platform_driver arm64_ras_driver = {
 
 static int __init arm64_ras_init(void)
 {
+#ifdef CONFIG_DEBUG_FS
+	arm64_ras_debugfs = debugfs_create_dir("arm64", ras_debugfs_dir);
+#endif
 	return platform_driver_register(&arm64_ras_driver);
 }
 module_init(arm64_ras_init);
 
 static void __exit arm64_ras_exit(void)
 {
+#ifdef CONFIG_DEBUG_FS
+	debugfs_remove_recursive(arm64_ras_debugfs);
+#endif
 	platform_driver_unregister(&arm64_ras_driver);
 }
 module_exit(arm64_ras_exit);
diff --git a/drivers/ras/arm64/ras-sysfs.c b/drivers/ras/arm64/ras-sysfs.c
new file mode 100644
index 000000000000..03cc00b820e2
--- /dev/null
+++ b/drivers/ras/arm64/ras-sysfs.c
@@ -0,0 +1,211 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ARM Error Source Table Support
+ *
+ * Copyright (c) 2025, Alibaba Group.
+ */
+
+#include "ras.h"
+
+static int ras_store_threshold(struct ras_record *record, u64 threshold)
+{
+	struct ce_threshold *ce = &record->ce;
+	u64 err_misc0;
+
+	if (!ce->info)
+		return -EOPNOTSUPP;
+
+	if (threshold > ce->info->max_count)
+		return -EINVAL;
+
+	ce->threshold = threshold;
+	ce->count = ce->info->max_count - threshold + 1;
+
+	err_misc0 = record_read(record, ERXMISC0);
+	ce->reg_val = (err_misc0 & ~ce->info->mask) |
+		      (ce->count << ce->info->shift);
+
+	record_write(record, ERXMISC0, ce->reg_val);
+	return 0;
+}
+
+static void ras_error_count(struct ras_record *record, struct record_count *count)
+{
+	count->ce += record->count.ce;
+	count->de += record->count.de;
+	count->uc += record->count.uc;
+	count->ueu += record->count.ueu;
+	count->uer += record->count.uer;
+	count->ueo += record->count.ueo;
+}
+
+/* Debugfs for RAS node */
+
+static int ras_node_err_count_show(struct seq_file *m, void *data)
+{
+	struct ras_node *node = m->private;
+	struct record_count count = { 0 };
+	int i;
+
+	for (i = 0; i < node->record_count; i++)
+		if (!test_bit(i, node->record_implemented))
+			ras_error_count(&node->records[i], &count);
+
+	seq_printf(m, "CE: %llu\n"
+		   "DE: %llu\n"
+		   "UC: %llu\n"
+		   "UEU: %llu\n"
+		   "UEO: %llu\n"
+		   "UER: %llu\n",
+		   count.ce, count.de, count.uc, count.ueu,
+		   count.uer, count.ueo);
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(ras_node_err_count);
+
+/* Attribute for RAS record */
+
+#define DEFINE_RAS_DEBUGFS_ATTR(name, offset) \
+static int name##_get(void *data, u64 *val) \
+{ \
+	struct ras_record *record = data; \
+	*val = record_read(record, offset); \
+	return 0; \
+} \
+static int name##_set(void *data, u64 val) \
+{ \
+	struct ras_record *record = data; \
+	record_write(record, offset, val); \
+	return 0; \
+} \
+DEFINE_DEBUGFS_ATTRIBUTE(name##_ops, name##_get, name##_set, "%#llx\n")
+
+DEFINE_RAS_DEBUGFS_ATTR(err_fr, ERXFR);
+DEFINE_RAS_DEBUGFS_ATTR(err_ctrl, ERXCTLR);
+
+static int record_ce_threshold_get(void *data, u64 *val)
+{
+	struct ras_record *record = data;
+
+	*val = record->ce.threshold;
+	return 0;
+}
+
+static int record_ce_threshold_set(void *data, u64 val)
+{
+	struct ras_record *record = data;
+
+	return ras_store_threshold(record, val);
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(record_ce_threshold_ops, record_ce_threshold_get,
+			 record_ce_threshold_set, "%llu\n");
+
+/* Node-level ce_threshold: write threshold to all records of this node */
+
+static int node_ce_threshold_set(void *data, u64 val)
+{
+	struct ras_node *node = data;
+	int i, ret, last_err = -EOPNOTSUPP;
+
+	for (i = 0; i < node->record_count; i++) {
+		ret = ras_store_threshold(&node->records[i], val);
+		if (ret == 0)
+			last_err = 0;
+		else if (ret == -EINVAL)
+			return ret;
+	}
+
+	return last_err;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(node_ce_threshold_ops, NULL,
+			 node_ce_threshold_set, "%llu\n");
+
+static int ras_record_err_count_show(struct seq_file *m, void *data)
+{
+	struct ras_record *record = m->private;
+	struct record_count count = { 0 };
+
+	ras_error_count(record, &count);
+
+	seq_printf(m, "CE: %llu\n"
+		   "DE: %llu\n"
+		   "UC: %llu\n"
+		   "UEU: %llu\n"
+		   "UEO: %llu\n"
+		   "UER: %llu\n",
+		   count.ce, count.de, count.uc, count.ueu,
+		   count.uer, count.ueo);
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(ras_record_err_count);
+
+static void ras_record_init_debugfs(struct ras_record *record)
+{
+	debugfs_create_file("err_fr", 0600, record->debugfs,
+			    record, &err_fr_ops);
+	debugfs_create_file("err_ctrl", 0600, record->debugfs,
+			    record, &err_ctrl_ops);
+	debugfs_create_file("err_count", 0400, record->debugfs,
+			    record, &ras_record_err_count_fops);
+	debugfs_create_file("ce_threshold", 0600, record->debugfs,
+			    record, &record_ce_threshold_ops);
+}
+
+static void ras_init_records_debugfs(struct ras_node *node)
+{
+	struct ras_record *record;
+	int i;
+
+	for (i = 0; i < node->record_count; i++) {
+		record = &node->records[i];
+		if (!record->name || test_bit(i, node->record_implemented))
+			continue;
+		record->debugfs = debugfs_create_dir(record->name,
+						     node->debugfs);
+
+		ras_record_init_debugfs(record);
+	}
+}
+
+static void ras_oncore_node_init_debugfs(struct ras_node *node)
+{
+	int cpu;
+	struct ras_node *percpu_node;
+	char name[16];
+
+	for_each_possible_cpu(cpu) {
+		percpu_node = per_cpu_ptr(node->oncore_node, cpu);
+
+		snprintf(name, sizeof(name), "processor%u", cpu);
+		percpu_node->debugfs = debugfs_create_dir(name, arm64_ras_debugfs);
+
+		debugfs_create_file("err_count", 0400, percpu_node->debugfs,
+				    percpu_node, &ras_node_err_count_fops);
+		debugfs_create_file("ce_threshold", 0200, percpu_node->debugfs,
+				    percpu_node, &node_ce_threshold_ops);
+		ras_init_records_debugfs(percpu_node);
+	}
+}
+
+void ras_node_init_debugfs(struct ras_node *node)
+{
+	if (!node->name)
+		return;
+
+	if (ras_node_is_oncore(node)) {
+		ras_oncore_node_init_debugfs(node);
+		return;
+	}
+
+	node->debugfs = debugfs_create_dir(node->name, arm64_ras_debugfs);
+	if (IS_ERR_OR_NULL(node->debugfs))
+		return;
+
+	debugfs_create_file("err_count", 0400, node->debugfs,
+			    node, &ras_node_err_count_fops);
+	debugfs_create_file("ce_threshold", 0200, node->debugfs,
+			    node, &node_ce_threshold_ops);
+	ras_init_records_debugfs(node);
+}
diff --git a/drivers/ras/arm64/ras.h b/drivers/ras/arm64/ras.h
index ac3876912495..92cbb975b4df 100644
--- a/drivers/ras/arm64/ras.h
+++ b/drivers/ras/arm64/ras.h
@@ -10,6 +10,7 @@
 
 #include <linux/acpi_aest.h>
 #include <asm/ras.h>
+#include <linux/debugfs.h>
 
 #define DEFAULT_CE_THRESHOLD 1
 
@@ -62,6 +63,8 @@
 
 #define GIC_ERRDEVARCH		0xFFBC
 
+extern struct dentry *arm64_ras_debugfs;
+
 struct ras_access {
 	u64 (*read)(void __iomem *base, u32 offset);
 	void (*write)(void __iomem *base, u32 offset, u64 val);
@@ -80,14 +83,25 @@ struct ce_threshold {
 	u64 reg_val;
 };
 
+struct record_count {
+	u64 ce;
+	u64 de;
+	u64 uc;
+	u64 uer;
+	u64 ueo;
+	u64 ueu;
+};
+
 struct ras_record {
 	char *name;
 	void __iomem *regs_base;
 	struct ras_node *node;
 	const struct ras_access *access;
+	struct dentry *debugfs;
 
 	struct ce_threshold ce;
 	enum ras_ce_threshold threshold_type;
+	struct record_count count;
 
 	int index;
 	/*
@@ -116,6 +130,7 @@ struct ras_node {
 	struct device *dev;
 	const struct ras_group *group;
 	struct ras_node __percpu *oncore_node;
+	struct dentry *debugfs;
 
 	void __iomem *base;
 	void __iomem *errgsr;
@@ -286,4 +301,6 @@ static inline void ras_sync(struct ras_node *node)
 		isb();
 }
 
+void ras_node_init_debugfs(struct ras_node *node);
+
 #endif /* _DRIVERS_RAS_ARM64_RAS_H_ */
diff --git a/drivers/ras/debugfs.c b/drivers/ras/debugfs.c
index 42afd3de68b2..e4d9a5627e5f 100644
--- a/drivers/ras/debugfs.c
+++ b/drivers/ras/debugfs.c
@@ -3,7 +3,8 @@
 #include <linux/ras.h>
 #include "debugfs.h"
 
-static struct dentry *ras_debugfs_dir;
+struct dentry *ras_debugfs_dir;
+EXPORT_SYMBOL_GPL(ras_debugfs_dir);
 
 static atomic_t trace_count = ATOMIC_INIT(0);
 
diff --git a/include/linux/ras.h b/include/linux/ras.h
index 11663150612f..976cd102f76c 100644
--- a/include/linux/ras.h
+++ b/include/linux/ras.h
@@ -71,4 +71,6 @@ static inline void ras_register_decode_chain(struct notifier_block *nb) {}
 static inline void ras_unregister_decode_chain(struct notifier_block *nb) {}
 #endif /* CONFIG_ARM64_RAS_DRIVER */
 
+extern struct dentry *ras_debugfs_dir;
+
 #endif /* __RAS_H__ */
-- 
2.51.2.612.gdc70283dfc


