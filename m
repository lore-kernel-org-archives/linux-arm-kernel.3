Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40104105F799
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 10:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=icFysft0LSPk0zpVH5IW/swVH3hmaglpp35gf+tJ190=; b=HLVfMxdqOdc3HUtuwXpqdgBGVH
	iK/S4ifkIsdcLnMshKswxol/u+9O2lrjGO/63ktslOISHaZCt3HP93HbPHiApIhgTY8ILU2H6DxsP
	2/aLoXQvkjeH+S2NA/FcbBFwNNIk/+oTfZAc09dLKcFU01tyE+1xyDXTr+WUqFQLwdiZYQMUqLsvN
	FSKIyrklGA+B3Z2oSp3bpRSmUrZU4Xefpj2qV8Ph1JeEo2bw+nm9tC0UpSYyzmFpwQzHohDWVas5d
	bKxC0jobEPbBd9F1YxjqmQWxh8qyYeeZvzYdV24xSdfA01psPQunmj/+So6OnhEa+rrZPaxoADm6/
	kuJCJnjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1006-0000000HX4a-0aEd;
	Fri, 13 Mar 2026 10:44:14 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1001-0000000HWy6-08au
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 10:44:10 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=icFysft0LSPk0zpVH5IW/swVH3hmaglpp35gf+tJ190=;
	b=LVy1HD2tx9UfeWwjKSpJSxqp9m6y7ehUQGDMHtX3WZN8VxeztF7HC+kvFEg9SJuY/Lc4WRdAq
	kztxtq2+swvQvHbxvPl8LPiOmWgYJ3PReKANymEEJg5GNIYd5D//tSRqeutqaZKIXbNjrm8N2hF
	I/hstB/JdpGuE4ld0hGyg9M=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4fXLZF5hbzzKm5M;
	Fri, 13 Mar 2026 18:39:01 +0800 (CST)
Received: from kwepemj200003.china.huawei.com (unknown [7.202.194.15])
	by mail.maildlp.com (Postfix) with ESMTPS id 0354440563;
	Fri, 13 Mar 2026 18:43:59 +0800 (CST)
Received: from localhost.huawei.com (10.90.31.46) by
 kwepemj200003.china.huawei.com (7.202.194.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 13 Mar 2026 18:43:58 +0800
From: Qinxin Xia <xiaqinxin@huawei.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <jpb@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<xiaqinxin@huawei.com>, <wangzhou1@hisilicon.com>,
	<prime.zeng@hisilicon.com>, <fanghao11@huawei.com>,
	<jonathan.cameron@huawei.com>, <linuxarm@huawei.com>
Subject: [RFC PATCH 3/5] iommu/arm-smmu-v3: Add Stream Table Entry display to debugfs
Date: Fri, 13 Mar 2026 18:43:49 +0800
Message-ID: <20260313104351.3502293-4-xiaqinxin@huawei.com>
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
X-CRM114-CacheID: sfid-20260313_034409_421483_4A802A5C 
X-CRM114-Status: GOOD (  15.70  )
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

Add Stream Table Entry (STE) display functionality to debugfs.
This allow inspecting STE contents for each device stream including:
- STE validity and configuration
- Stage 1 and Stage 2 context pointers
- Raw STE data

Signed-off-by: Qinxin Xia <xiaqinxin@huawei.com>
---
 .../arm/arm-smmu-v3/arm-smmu-v3-debugfs.c     | 130 ++++++++++++++++++
 1 file changed, 130 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c
index f9bf955f3351..d7f3defd94a3 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c
@@ -21,6 +21,12 @@
  * - CMDQ_PROD/CONS: Command queue producer and consumer pointers
  * - EVTQ_PROD/CONS: Event queue producer and consumer pointers
  *
+ * STE Information Displayed:
+ * - Validity: Whether the STE is currently active and valid
+ * - Configuration: Translation mode (bypass/abort/S1/S2)
+ * - Context Pointers: Stage 1 and Stage 2 translation context addresses
+ * - Raw Data: Complete 64-bit STE words in hexadecimal
+ *
  * Directory Structure:
  * /sys/kernel/debug/iommu/arm_smmu_v3/
  * └── smmu0/
@@ -43,6 +49,8 @@
  */
 
 #include <linux/debugfs.h>
+#include <linux/pci.h>
+#include <linux/iommu.h>
 #include "arm-smmu-v3.h"
 
 static struct dentry *smmuv3_root_dir;
@@ -196,3 +204,125 @@ int arm_smmu_debugfs_setup(struct arm_smmu_device *smmu, phys_addr_t ioaddr)
 	smmu->debugfs = NULL;
 	return ret;
 }
+
+/**
+ * smmu_get_ste() - Get Stream Table Entry for a given Stream ID
+ * @smmu: SMMU device
+ * @sid: Stream ID
+ *
+ * Return: Pointer to STE if found, NULL otherwise
+ */
+static struct arm_smmu_ste *smmu_get_ste(struct arm_smmu_device *smmu, u32 sid)
+{
+	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
+
+	if (sid >= (1 << smmu->sid_bits))
+		return NULL;
+
+	if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB) {
+		u32 l1_idx = arm_smmu_strtab_l1_idx(sid);
+		u32 l2_idx = arm_smmu_strtab_l2_idx(sid);
+
+		if (l1_idx >= cfg->l2.num_l1_ents || !cfg->l2.l2ptrs[l1_idx])
+			return NULL;
+
+		return &cfg->l2.l2ptrs[l1_idx]->stes[l2_idx];
+	}
+
+	return &cfg->linear.table[sid];
+}
+
+/**
+ * smmu_debug_dump_ste() - Dump STE details to seq_file
+ * @seq: seq_file to write to
+ * @dev: device associated with the STE
+ */
+static void smmu_debug_dump_ste(struct seq_file *seq, struct device *dev)
+{
+	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
+	struct arm_smmu_device *smmu;
+	struct arm_smmu_ste *ste;
+	u32 sid, cfg;
+	int i;
+
+	if (!master || !master->smmu) {
+		seq_puts(seq, "No SMMU master data\n");
+		return;
+	}
+
+	smmu = master->smmu;
+
+	/* Use first stream ID for debug */
+	if (master->num_streams == 0) {
+		seq_puts(seq, "No streams configured for device\n");
+		return;
+	}
+	sid = master->streams[0].id;
+
+	if (sid >= (1 << smmu->sid_bits)) {
+		seq_printf(seq, "Invalid Stream ID: %u (max %u)\n",
+			   sid, (1 << smmu->sid_bits) - 1);
+		return;
+	}
+
+	ste = smmu_get_ste(smmu, sid);
+	if (!ste) {
+		seq_printf(seq, "STE not available for SID %u\n", sid);
+		return;
+	}
+
+	seq_printf(seq, "STE for Stream ID %u\n", sid);
+	seq_printf(seq, "  Valid: %s\n",
+		   ste->data[0] & STRTAB_STE_0_V ? "Yes" : "No");
+
+	seq_puts(seq, "  Config: ");
+
+	cfg = FIELD_GET(STRTAB_STE_0_CFG, ste->data[0]);
+
+	switch (cfg) {
+	case STRTAB_STE_0_CFG_BYPASS:
+		seq_puts(seq, "BYPASS\n");
+		break;
+	case STRTAB_STE_0_CFG_S1_TRANS:
+		seq_puts(seq, "only S1_TRANS\n");
+		break;
+	case STRTAB_STE_0_CFG_S2_TRANS:
+		seq_puts(seq, "only S2_TRANS\n");
+		break;
+	case STRTAB_STE_0_CFG_NESTED:
+		seq_puts(seq, "S1+S2_TRANS\n");
+		break;
+	case STRTAB_STE_0_CFG_ABORT:
+		seq_puts(seq, "ABORT\n");
+		break;
+	default:
+		seq_puts(seq, "UNKNOWN\n");
+	}
+
+	if (ste->data[0] & STRTAB_STE_0_CFG_S1_TRANS) {
+		seq_printf(seq, "  S1ContextPtr: 0x%016llx\n",
+			   le64_to_cpu(ste->data[1]) & STRTAB_STE_0_S1CTXPTR_MASK);
+	}
+
+	if (ste->data[0] & STRTAB_STE_0_CFG_S2_TRANS) {
+		seq_printf(seq, "  S2ContextPtr: 0x%016llx\n",
+			   le64_to_cpu(ste->data[3]) & STRTAB_STE_3_S2TTB_MASK);
+	}
+
+	/* Display raw STE data */
+	seq_puts(seq, "  Raw Data:\n");
+	for (i = 0; i < STRTAB_STE_DWORDS; i++)
+		seq_printf(seq, "    STE[%d]: 0x%016llx\n", i,
+			   le64_to_cpu(ste->data[i]));
+}
+
+/* STE debugfs file operations */
+static int smmu_debugfs_ste_show(struct seq_file *seq, void *v)
+{
+	struct device *dev = seq->private;
+
+	smmu_debug_dump_ste(seq, dev);
+	return 0;
+}
+
+DEFINE_SHOW_ATTRIBUTE(smmu_debugfs_ste);
-- 
2.33.0


