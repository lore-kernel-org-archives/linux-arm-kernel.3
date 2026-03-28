Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A380E10F3DE1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 10:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=35Vdxw+bGikUGARyshD29d8hmxPEOshopH4zQVVJEkw=; b=Y/wayCqrK7EKVORu6EvTJJArfq
	6K+ZNnhkBjT0Ou+Kzsu8uLnbD0cQRdMhOVbR3ytVY5lzrvlmpDcLTh+JRorCvX7SIG9TLzyWJrRKH
	PZjjgVMBromBO8/kir+Ix1kxNzdmqBCsYw8JlBg35ZcqmxgbsvssOCD0vLYwXr/kOM3K8SNUDVjVu
	T8V9DfyN94XqL5sBNB5F3PNjvko3qzp/ljR4OX+fBHDhkXH3sN2Zvlp9clgAmd+PrW7HimtzIWFZQ
	WBgJBMvvTYNIbUBqUgxnG3+vb/FSnF7udIt2I53kChFOZILXf9fMiEz5xElc5R0aQzJuvacxftGfp
	LRQsowMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6QcV-00000008oTf-47oF;
	Sat, 28 Mar 2026 10:10:19 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6QcG-00000008oNL-0Xsn
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 10:10:08 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=35Vdxw+bGikUGARyshD29d8hmxPEOshopH4zQVVJEkw=;
	b=s49vGdAHRwvtDhPiphC6xoXo/WG2C5Df4WFVvligxTKt1X6zBh5vr+jG+n7Z+guWwk/9RoNel
	MvljwNHxvht3ChIOXlBNkn+m6mr44/MOYkxxABpG2vxTAsLpxite/xkdksIG2DoMnSMBhG1xLJB
	uApiIXqzmtFkytkRb2rItXc=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4fjY4g2CLtzKm5B;
	Sat, 28 Mar 2026 18:03:47 +0800 (CST)
Received: from kwepemj200003.china.huawei.com (unknown [7.202.194.15])
	by mail.maildlp.com (Postfix) with ESMTPS id 8A78640565;
	Sat, 28 Mar 2026 18:09:56 +0800 (CST)
Received: from localhost.huawei.com (10.90.31.46) by
 kwepemj200003.china.huawei.com (7.202.194.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 28 Mar 2026 18:09:55 +0800
From: Qinxin Xia <xiaqinxin@huawei.com>
To: <robin.murphy@arm.com>, <nicolinc@nvidia.com>, <will@kernel.org>,
	<jpb@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<xiaqinxin@huawei.com>, <wangzhou1@hisilicon.com>,
	<prime.zeng@hisilicon.com>, <fanghao11@huawei.com>,
	<jonathan.cameron@huawei.com>, <wuyifan50@huawei.com>, <linuxarm@huawei.com>
Subject: [RFC PATCH v2 5/5] iommu/arm-smmu-v3: Add Context Descriptor display to debugfs
Date: Sat, 28 Mar 2026 18:09:53 +0800
Message-ID: <20260328100953.3441915-6-xiaqinxin@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260328100953.3441915-1-xiaqinxin@huawei.com>
References: <20260328100953.3441915-1-xiaqinxin@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemj200003.china.huawei.com (7.202.194.15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_031004_955668_8543A037 
X-CRM114-Status: GOOD (  13.80  )
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

Add Context Descriptor (CD) display functionality to debugfs.
This allow inspecting CD contents for all Substream IDs including:
- CD validity and translation parameters
- TTBR0 and TCR configurations
- Raw CD data

/sys/kernel/debug/iommu/arm_smmu_v3/smmu0/stream_table/
└── <sid>/
    ├─── ste
    ├─── cd
    └─── <dev_name>

Signed-off-by: Qinxin Xia <xiaqinxin@huawei.com>
---
 .../arm/arm-smmu-v3/arm-smmu-v3-debugfs.c     | 94 +++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c
index dbcc8fce6d8e..501437432809 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c
@@ -10,6 +10,7 @@
  *     └── stream_table
  *	   └─── <sid>/                                # Stream ID
  *	       ├─── ste                               # Stream Table Entry
+ *	       ├── cd                                 # Context Descriptor
  *	       └── <dev_name>                         # Symlink to device sysfs directory
  *
  * The capabilities file provides detailed information about:
@@ -26,6 +27,12 @@
  * - Stage 1 and Stage 2 context pointers
  * - Raw STE data
  *
+ * CD Information Displayed:
+ * - T0SZ: Input address space size configuration
+ * - EPD0/EPD1: Stage 1 translation enable flags
+ * - TTBR0: Stage 1 translation table base address
+ * - Raw Data: Complete CD structure in hexadecimal format
+
  * Copyright (C) 2026 HiSilicon Limited.
  * Author: Qinxin Xia <xiaqinxin@huawei.com>
  */
@@ -284,6 +291,91 @@ static const struct file_operations smmu_debugfs_ste_fops = {
 	.release = smmu_debugfs_ste_release,
 };
 
+/**
+ * smmu_debug_dump_cd() - Dump a single Context Descriptor
+ * @seq: seq_file to write to
+ * @cd: pointer to the Context Descriptor to dump
+ */
+static void smmu_debug_dump_cd(struct seq_file *seq, struct arm_smmu_cd *cd)
+{
+	u64 data;
+	int i;
+
+	/* CD 0 */
+	data = le64_to_cpu(cd->data[0]);
+	seq_printf(seq, "  T0SZ: 0x%llx\n", data & CTXDESC_CD_0_TCR_T0SZ);
+	seq_printf(seq, "  EPD0: %s\n", data & CTXDESC_CD_0_TCR_EPD0 ? "Yes" : "No");
+	seq_printf(seq, "  EPD1: %s\n", data & CTXDESC_CD_0_TCR_EPD1 ? "Yes" : "No");
+
+	/* CD 1 */
+	data = le64_to_cpu(cd->data[1]);
+	seq_printf(seq, "  TTBR0: 0x%016llx\n", data & CTXDESC_CD_1_TTB0_MASK);
+
+	/* Display raw CD data */
+	seq_puts(seq, "  Raw Data:\n");
+	for (i = 0; i < CTXDESC_CD_DWORDS; i++)
+		seq_printf(seq, "    CD[%d]: 0x%016llx\n", i,
+			   le64_to_cpu(cd->data[i]));
+}
+
+static int smmu_debugfs_cd_show(struct seq_file *seq, void *unused)
+{
+	struct device *dev = seq->private;
+	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
+	u32 max_ssids, ssid;
+
+	if (!master) {
+		seq_puts(seq, "No master data\n");
+		return 0;
+	}
+
+	mutex_lock(&arm_smmu_asid_lock);
+	max_ssids = 1 << master->ssid_bits;
+	seq_printf(seq, "Context Descriptors for device (max SSIDs: %u):\n",
+		   max_ssids);
+
+	for (ssid = 0; ssid < max_ssids; ssid++) {
+		struct arm_smmu_cd *cd = arm_smmu_get_cd_ptr(master, ssid);
+
+		if (cd && (le64_to_cpu(cd->data[0]) & CTXDESC_CD_0_V)) {
+			seq_printf(seq, "\n--- SSID %u ---\n", ssid);
+			smmu_debug_dump_cd(seq, cd);
+		}
+	}
+
+	mutex_unlock(&arm_smmu_asid_lock);
+	return 0;
+}
+
+static int smmu_debugfs_cd_open(struct inode *inode, struct file *file)
+{
+	struct device *dev = inode->i_private;
+
+	if (!dev || !get_device(dev))
+		return -ENODEV;
+
+	return single_open(file, smmu_debugfs_cd_show, dev);
+}
+
+static int smmu_debugfs_cd_release(struct inode *inode, struct file *file)
+{
+	struct seq_file *seq = file->private_data;
+	struct device *dev = seq->private;
+
+	single_release(inode, file);
+	if (dev)
+		put_device(dev);
+	return 0;
+}
+
+static const struct file_operations smmu_debugfs_cd_fops = {
+	.owner   = THIS_MODULE,
+	.open    = smmu_debugfs_cd_open,
+	.read    = seq_read,
+	.llseek  = seq_lseek,
+	.release = smmu_debugfs_cd_release,
+};
+
 /**
  * arm_smmu_debugfs_create_stream_table() - Create debugfs entries for stream table
  * @dev: device to create entries for
@@ -348,6 +440,8 @@ int arm_smmu_debugfs_create_stream_table(struct device *dev,
 		}
 
 		kfree(path);
+		/* Create CD file to dump all valid Context Descriptors */
+		debugfs_create_file("cd", 0444, dev_dir, dev, &smmu_debugfs_cd_fops);
 	}
 
 	return 0;
-- 
2.33.0


