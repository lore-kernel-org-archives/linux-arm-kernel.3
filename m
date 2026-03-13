Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D789105F796
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 10:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2bJKkLeJmzSDxTe2pOlZoCqfksCo8ZTkQe1N8Y6sLJ4=; b=Qh8mKVpunQ6axu4FFxCGgr8APC
	lm9R60XPddRNKQ1MxdzS3LOnQPGW2JWM+T3a8P98h+azFjMWXkvKIv6ufrkYPAaop8hih85/qPtEh
	UZxhJ85IYpPgYu8HPqOadxAYa+JenRfVWNLcKClfobwwy2KoDbesBKL5bZ+xNwpF+zY8hYk2Zk9L5
	YlXouDLYuKX2WCVcglq+1XUo8+sfQCs5alA/3EV5GDOnb1pQgbkZzhp7nYaKMl5Poyfy1KQxj/kaF
	/Ab8ydSkQVsN0VOOwblNjftxvSPTNHM1SdRl7xdk4FebUv/gJ2C93VGv+g7+pHi0qcQSj55815yjv
	XdEj25hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1004-0000000HX2j-421m;
	Fri, 13 Mar 2026 10:44:12 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zzx-0000000HWv2-2uQg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 10:44:08 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=2bJKkLeJmzSDxTe2pOlZoCqfksCo8ZTkQe1N8Y6sLJ4=;
	b=jgYMJFV4cZAsnmo7WByBmWcGLEy/QQltc9xCHAB8ailw2znT7mxpeZxoG8qMh3l4+ZofXkhuE
	RYgMf382pdqkHLvtu6WhlQZKLQBtUYXpa2PI2aV1gDW9kts+P4xJd3asHrv5zhr4YeMBgJ02xIm
	wVqVdUSUlmcq4Ees0DIfQZk=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4fXLZD3cL4zLlw0;
	Fri, 13 Mar 2026 18:39:00 +0800 (CST)
Received: from kwepemj200003.china.huawei.com (unknown [7.202.194.15])
	by mail.maildlp.com (Postfix) with ESMTPS id EA7BB40565;
	Fri, 13 Mar 2026 18:43:56 +0800 (CST)
Received: from localhost.huawei.com (10.90.31.46) by
 kwepemj200003.china.huawei.com (7.202.194.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 13 Mar 2026 18:43:56 +0800
From: Qinxin Xia <xiaqinxin@huawei.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <jpb@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<xiaqinxin@huawei.com>, <wangzhou1@hisilicon.com>,
	<prime.zeng@hisilicon.com>, <fanghao11@huawei.com>,
	<jonathan.cameron@huawei.com>, <linuxarm@huawei.com>
Subject: [RFC PATCH 1/5] iommu/arm-smmu-v3: Add basic debugfs framework
Date: Fri, 13 Mar 2026 18:43:47 +0800
Message-ID: <20260313104351.3502293-2-xiaqinxin@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260313104351.3502293-1-xiaqinxin@huawei.com>
References: <20260313104351.3502293-1-xiaqinxin@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemj200003.china.huawei.com (7.202.194.15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_034407_007205_8116BED6 
X-CRM114-Status: GOOD (  22.60  )
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

Add basic debugfs framework for ARM SMMUv3 driver.This creates the
root directory structure and provides capability display functionality.

The debugfs hierarchy is organized as:
/sys/kernel/debug/iommu/arm_smmu_v3/
└── smmu0/
    └── capabilities

Signed-off-by: Qinxin Xia <xiaqinxin@huawei.com>
---
 drivers/iommu/Kconfig                         |  11 ++
 drivers/iommu/arm/arm-smmu-v3/Makefile        |   1 +
 .../arm/arm-smmu-v3/arm-smmu-v3-debugfs.c     | 132 ++++++++++++++++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  10 ++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  14 ++
 5 files changed, 168 insertions(+)
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index f86262b11416..dfde3779764a 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -93,6 +93,17 @@ config IOMMU_DEBUGFS
 	  debug/iommu directory, and then populate a subdirectory with
 	  entries as required.
 
+config ARM_SMMU_V3_DEBUGFS
+	bool "ARM SMMUv3 DebugFS support"
+	depends on ARM_SMMU_V3 && IOMMU_DEBUGFS
+	help
+	  Expose ARM SMMUv3 internal state via debugfs for debugging and
+	  diagnostics. This creates /sys/kernel/debug/arm_smmu_v3/ with
+	  detailed information about SMMU configuration, stream tables,
+	  and context descriptors.
+
+	  Say N unless you are debugging IOMMU issues.
+
 choice
 	prompt "IOMMU default domain type"
 	depends on IOMMU_API
diff --git a/drivers/iommu/arm/arm-smmu-v3/Makefile b/drivers/iommu/arm/arm-smmu-v3/Makefile
index 493a659cc66b..81fd2808f12f 100644
--- a/drivers/iommu/arm/arm-smmu-v3/Makefile
+++ b/drivers/iommu/arm/arm-smmu-v3/Makefile
@@ -6,3 +6,4 @@ arm_smmu_v3-$(CONFIG_ARM_SMMU_V3_SVA) += arm-smmu-v3-sva.o
 arm_smmu_v3-$(CONFIG_TEGRA241_CMDQV) += tegra241-cmdqv.o
 
 obj-$(CONFIG_ARM_SMMU_V3_KUNIT_TEST) += arm-smmu-v3-test.o
+obj-$(CONFIG_ARM_SMMU_V3_DEBUGFS) += arm-smmu-v3-debugfs.o
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c
new file mode 100644
index 000000000000..542bd6047f26
--- /dev/null
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ARM SMMUv3 DebugFS Support
+ *
+ * This file implements the basic debugfs infrastructure for ARM SMMUv3 driver.
+ * It provides the foundation for exposing SMMU internal state through debugfs
+ * for debugging and diagnostic purposes.
+ *
+ * Key Features:
+ * - Global root directory management with proper mutex synchronization
+ * - Per-SMMU instance directory creation with unique naming
+ * - Capability reporting covering all major SMMU features and configuration
+ * - Extensible architecture designed for adding future debug functionality
+ * - Comprehensive error handling and resource cleanup
+ *
+ * Directory Structure:
+ * /sys/kernel/debug/iommu/arm_smmu_v3/
+ * └── smmu0/
+ *     └── capabilities    # SMMU feature capabilities and configuration
+ *
+ * The capabilities file provides detailed information about:
+ * - Architecture version and translation stage support (Stage1/Stage2)
+ * - System coherency, ATS, and PRI feature availability
+ * - Stream table size and command/event queue depths
+ * - All feature bits from the SMMU device structure
+ *
+ * Copyright (C) 2025 HiSilicon Limited.
+ * Author: Qinxin Xia <xiaqinxin@huawei.com>
+ */
+
+#include <linux/debugfs.h>
+#include "arm-smmu-v3.h"
+
+static struct dentry *smmuv3_root_dir;
+static DEFINE_MUTEX(arm_smmu_debugfs_lock);
+
+/**
+ * smmu_debugfs_capabilities_show() - Display SMMU capabilities
+ * @seq: seq_file to write to
+ * @v: private data (SMMU device)
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+static int smmu_debugfs_capabilities_show(struct seq_file *seq, void *v)
+{
+	struct arm_smmu_device *smmu = seq->private;
+
+	if (!smmu)
+		return -ENODEV;
+
+	seq_puts(seq, "SMMUv3 Capabilities:\n");
+	seq_printf(seq, "  Stage1 Translation: %s\n",
+		   smmu->features & ARM_SMMU_FEAT_TRANS_S1 ? "Yes" : "No");
+	seq_printf(seq, "  Stage2 Translation: %s\n",
+		   smmu->features & ARM_SMMU_FEAT_TRANS_S2 ? "Yes" : "No");
+	seq_printf(seq, "  Coherent Walk: %s\n",
+		   smmu->features & ARM_SMMU_FEAT_COHERENCY ? "Yes" : "No");
+	seq_printf(seq, "  ATS Support: %s\n",
+		   smmu->features & ARM_SMMU_FEAT_ATS ? "Yes" : "No");
+	seq_printf(seq, "  PRI Support: %s\n",
+		   smmu->features & ARM_SMMU_FEAT_PRI ? "Yes" : "No");
+	seq_printf(seq, "  Stream Table Size: %d\n", 1 << smmu->sid_bits);
+	seq_printf(seq, "  Command Queue Depth: %d\n",
+		   1 << smmu->cmdq.q.llq.max_n_shift);
+	seq_printf(seq, "  Event Queue Depth: %d\n",
+		   1 << smmu->evtq.q.llq.max_n_shift);
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(smmu_debugfs_capabilities);
+
+/**
+ * arm_smmu_debugfs_setup() - Initialize debugfs for SMMU device
+ * @smmu: SMMU device to setup debugfs for
+ * @ioaddr: Physical base address of the SMMU device registers
+ *
+ * This function creates the basic debugfs directory structure for a SMMU device.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int arm_smmu_debugfs_setup(struct arm_smmu_device *smmu, phys_addr_t ioaddr)
+{
+	struct arm_smmu_debugfs *debugfs;
+	struct dentry *smmu_dir;
+	char name[32];
+	int ret;
+
+	/* Create root directory if it doesn't exist */
+	mutex_lock(&arm_smmu_debugfs_lock);
+	if (!smmuv3_root_dir) {
+		smmuv3_root_dir = debugfs_create_dir("arm_smmu_v3",
+						     iommu_debugfs_dir);
+		if (!smmuv3_root_dir) {
+			mutex_unlock(&arm_smmu_debugfs_lock);
+			return -ENOMEM;
+		}
+	}
+	mutex_unlock(&arm_smmu_debugfs_lock);
+
+	/* Allocate debugfs structure */
+	debugfs = kzalloc(sizeof(*debugfs), GFP_KERNEL);
+	if (!debugfs)
+		return -ENOMEM;
+
+	smmu->debugfs = debugfs;
+	debugfs->smmu = smmu;
+
+	/* Create SMMU instance directory */
+	snprintf(name, sizeof(name), "smmu3.%pa", &ioaddr);
+	smmu_dir = debugfs_create_dir(name, smmuv3_root_dir);
+	if (!smmu_dir) {
+		ret = -ENOMEM;
+		goto err_free;
+	}
+
+	debugfs->smmu_dir = smmu_dir;
+
+	/* Create capabilities file */
+	if (!debugfs_create_file("capabilities", 0444, smmu_dir, smmu,
+				 &smmu_debugfs_capabilities_fops))
+		goto err_cleanup;
+
+	pr_info("SMMUv3 debugfs initialized for smmu%pa\n", &ioaddr);
+	return 0;
+
+err_cleanup:
+	debugfs_remove_recursive(smmu_dir);
+err_free:
+	kfree(debugfs);
+	smmu->debugfs = NULL;
+	return ret;
+}
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 4d00d796f078..211a0c87507a 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -33,6 +33,10 @@
 #include "arm-smmu-v3.h"
 #include "../../dma-iommu.h"
 
+#ifdef CONFIG_ARM_SMMU_V3_DEBUGFS
+static unsigned int arm_smmu_present;
+#endif
+
 static bool disable_msipolling;
 module_param(disable_msipolling, bool, 0444);
 MODULE_PARM_DESC(disable_msipolling,
@@ -4909,6 +4913,12 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_disable;
 
+#ifdef CONFIG_ARM_SMMU_V3_DEBUGFS
+	ret = arm_smmu_debugfs_setup(smmu, ioaddr);
+	if (ret)
+		dev_warn(dev, "Failed to create debugfs!\n");
+#endif
+
 	/* And we're up. Go go go! */
 	ret = iommu_device_sysfs_add(&smmu->iommu, dev, NULL,
 				     "smmu3.%pa", &ioaddr);
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 3c6d65d36164..247f27426f6b 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -733,6 +733,15 @@ struct arm_smmu_impl_ops {
 			  const struct iommu_user_data *user_data);
 };
 
+#ifdef CONFIG_ARM_SMMU_V3_DEBUGFS
+struct arm_smmu_debugfs {
+	struct dentry *root_dir;
+	struct dentry *smmu_dir;
+	struct arm_smmu_device *smmu;
+};
+int arm_smmu_debugfs_setup(struct arm_smmu_device *smmu, phys_addr_t ioaddr);
+#endif
+
 /* An SMMUv3 instance */
 struct arm_smmu_device {
 	struct device			*dev;
@@ -803,6 +812,11 @@ struct arm_smmu_device {
 
 	struct rb_root			streams;
 	struct mutex			streams_mutex;
+
+#ifdef CONFIG_ARM_SMMU_V3_DEBUGFS
+	/* DebugFS Info */
+	struct arm_smmu_debugfs		*debugfs;
+#endif
 };
 
 struct arm_smmu_stream {
-- 
2.33.0


