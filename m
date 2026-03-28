Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF44A10F3DE1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 10:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wHU5+KqunB9+hNX5vubJwM9ZUSxN3Zdyf6nPKCwwUJg=; b=VvsEGpVF0a1KjCRsgAS4RLnYLG
	Of0jkLJE96s4cUyV47X3MyovUZ54rUFQ/OBwEvJYSk4oaehbJTKU5Hlf7E3tvJ/xbzFIfYPeBLD92
	VSzEkUxuNKtVBXDl3/3sROTkkiwq58kwJLyN8wQq+FqYOKjPgBcnRMVyVGdnu9ZfyHK6JXdtqHZd4
	8gQnLF60mjWIM5N/7mPQeZv/kd4hy/mgiLynCWGWTZllsgkgbe1jw1xMIzY5ZrxJvIW/VGvU4Zl0P
	MaNhcw3MGWYWgJ7BzFUGbC/comktX9d3yYdBfXKF5j/Lt4W+tuS4LEiOaYuP8Z8hUd+ge/tM1x4GX
	4PSQuf+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6QcJ-00000008oPT-1W1E;
	Sat, 28 Mar 2026 10:10:07 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6QcG-00000008oNM-0XsQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 10:10:06 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=wHU5+KqunB9+hNX5vubJwM9ZUSxN3Zdyf6nPKCwwUJg=;
	b=DoIa/UjiXs/6lsETax8Fox9fC9DPXWNqGUGrti5agC3zcwpU0NxaGnpM+NzMYEPGqMDaagYWh
	yyk9MoFkFBlqOub8Jot78omoKzJH9/i2/FLpF72ePGJZhFzaea7YaddjI5LKJWMiHzDhfvo7vdZ
	kjhGTaJl+ss7aeR0nhJQzmA=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4fjY4f0LcdzKm5B;
	Sat, 28 Mar 2026 18:03:46 +0800 (CST)
Received: from kwepemj200003.china.huawei.com (unknown [7.202.194.15])
	by mail.maildlp.com (Postfix) with ESMTPS id 46ABE40562;
	Sat, 28 Mar 2026 18:09:55 +0800 (CST)
Received: from localhost.huawei.com (10.90.31.46) by
 kwepemj200003.china.huawei.com (7.202.194.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 28 Mar 2026 18:09:54 +0800
From: Qinxin Xia <xiaqinxin@huawei.com>
To: <robin.murphy@arm.com>, <nicolinc@nvidia.com>, <will@kernel.org>,
	<jpb@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<xiaqinxin@huawei.com>, <wangzhou1@hisilicon.com>,
	<prime.zeng@hisilicon.com>, <fanghao11@huawei.com>,
	<jonathan.cameron@huawei.com>, <wuyifan50@huawei.com>, <linuxarm@huawei.com>
Subject: [RFC PATCH v2 2/5] iommu/arm-smmu-v3: Add register display to debugfs
Date: Sat, 28 Mar 2026 18:09:50 +0800
Message-ID: <20260328100953.3441915-3-xiaqinxin@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260328100953.3441915-1-xiaqinxin@huawei.com>
References: <20260328100953.3441915-1-xiaqinxin@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemj200003.china.huawei.com (7.202.194.15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_031004_814459_F59E2E37 
X-CRM114-Status: GOOD (  13.08  )
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

Add register display functionality to debugfs.This allows reading
and displaying key SMMU register values including control registers
and queue pointers.

The registers file shows:
- CR0, CR1, CR2 control registers
- Command and Event queue pointers

Signed-off-by: Qinxin Xia <xiaqinxin@huawei.com>
---
 .../arm/arm-smmu-v3/arm-smmu-v3-debugfs.c     | 78 ++++++++++++++++++-
 1 file changed, 77 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c
index c764b28e5cfb..cfd296aebc9f 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c
@@ -5,13 +5,18 @@
  * Directory Structure:
  * /sys/kernel/debug/iommu/arm_smmu_v3/
  * └── smmu<ioaddr>/
- *     └── capabilities    # SMMU feature capabilities and configuration
+ *     ├── capabilities    # SMMU feature capabilities and configuration
+ *     └── registers	   # SMMU Key registers
  *
  * The capabilities file provides detailed information about:
  * - translation stage support (Stage1/Stage2)
  * - System coherency, ATS, and PRI feature availability
  * - Stream table size and command/event queue depths
  *
+ * The registers display provides crucial visibility into:
+ * - CR0, CR1, CR2 control registers
+ * - Command and Event queue pointers
+ *
  * Copyright (C) 2026 HiSilicon Limited.
  * Author: Qinxin Xia <xiaqinxin@huawei.com>
  */
@@ -89,6 +94,74 @@ static const struct file_operations smmu_debugfs_capabilities_fops = {
 	.release = smmu_debugfs_capabilities_release,
 };
 
+/**
+ * smmu_debugfs_registers_show() - Display SMMU register values
+ * @seq: seq_file to write to
+ *
+ * Errors are reported via seq_puts, the function always returns 0
+ */
+static int smmu_debugfs_registers_show(struct seq_file *seq, void *unused)
+{
+	struct arm_smmu_device *smmu = seq->private;
+	void __iomem *base;
+
+	if (!smmu || !smmu->base) {
+		seq_puts(seq, "SMMU not available\n");
+		return 0;
+	}
+
+	base = smmu->base;
+
+	seq_puts(seq, "SMMUv3 Key Registers:\n");
+
+	/* 32-bit control registers */
+	seq_printf(seq, "CR0: 0x%08x\n", readl_relaxed(base + ARM_SMMU_CR0));
+	seq_printf(seq, "CR1: 0x%08x\n", readl_relaxed(base + ARM_SMMU_CR1));
+	seq_printf(seq, "CR2: 0x%08x\n", readl_relaxed(base + ARM_SMMU_CR2));
+
+	/* 32-bit queue pointer registers */
+	seq_printf(seq, "CMDQ_PROD: 0x%08x\n",
+		   readl_relaxed(base + ARM_SMMU_CMDQ_PROD));
+	seq_printf(seq, "CMDQ_CONS: 0x%08x\n",
+		   readl_relaxed(base + ARM_SMMU_CMDQ_CONS));
+	seq_printf(seq, "EVTQ_PROD: 0x%08x\n",
+		   readl_relaxed(base + ARM_SMMU_EVTQ_PROD));
+	seq_printf(seq, "EVTQ_CONS: 0x%08x\n",
+		   readl_relaxed(base + ARM_SMMU_EVTQ_CONS));
+
+	return 0;
+}
+
+static int smmu_debugfs_registers_open(struct inode *inode, struct file *file)
+{
+	struct arm_smmu_device *smmu = inode->i_private;
+
+	if (!smmu || !get_device(smmu->dev))
+		return -ENODEV;
+
+	return single_open(file, smmu_debugfs_registers_show, smmu);
+}
+
+static int smmu_debugfs_registers_release(struct inode *inode, struct file *file)
+{
+	struct seq_file *seq = file->private_data;
+	struct arm_smmu_device *smmu = seq->private;
+
+	single_release(inode, file);
+	if (smmu)
+		put_device(smmu->dev);
+
+	return 0;
+}
+
+static const struct file_operations smmu_debugfs_registers_fops = {
+	.owner   = THIS_MODULE,
+	.open    = smmu_debugfs_registers_open,
+	.read    = seq_read,
+	.llseek  = seq_lseek,
+	.release = smmu_debugfs_registers_release,
+};
+
 /**
  * arm_smmu_debugfs_setup() - Initialize debugfs for SMMU device
  * @smmu: SMMU device to setup debugfs for
@@ -134,6 +207,9 @@ int arm_smmu_debugfs_setup(struct arm_smmu_device *smmu, const char *name)
 	debugfs_create_file("capabilities", 0444, smmu_dir, smmu,
 			    &smmu_debugfs_capabilities_fops);
 
+	debugfs_create_file("registers", 0444, smmu_dir, smmu,
+			    &smmu_debugfs_registers_fops);
+
 	dev_dbg(smmu->dev, "debugfs initialized for %s\n", name);
 	return 0;
 }
-- 
2.33.0


