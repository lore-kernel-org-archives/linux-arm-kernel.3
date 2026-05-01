Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C21CD3424
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 11:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w0w7aacCAKh5xDmIAde6/c4ma74UnnFyw9cMZFzY2vk=; b=I5KpTOcbVmMBeYMtvKriwVUNlk
	4YCPJ13fkq3P0TzfYMToS/kvOfgex+J3DhX1iBCJ9O3IrH0d1/ssSqQORLjoOmibyXdMsGCSF+9Zd
	u1wKCfL6QBeLlbSC+htrAiPeCNSoRI5fQqGkB88MBULlx93dOqRco8sKZam2NZeFq2LGVag49W4Eb
	zFnTVxFE0xb7xm/jZTWnIhbhZIdViNNAtUCiYg24DrTBqRFo4QLjWoDqRBtq+0ctaLJo+bHK7Mme5
	1+xKmzJBhqi6sP6Kw3qClyqD3fNzn4CL70/yj5q2JTooOgW/QN7Vhr6eg80x5VjWSZtIrhENUmja2
	+IKg6llQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIlvG-00000006dWR-2MQz;
	Fri, 01 May 2026 11:20:42 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIlv8-00000006dF9-2Xx2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 11:20:36 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-43d7a5b9678so1645564f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 04:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777634432; x=1778239232; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=w0w7aacCAKh5xDmIAde6/c4ma74UnnFyw9cMZFzY2vk=;
        b=ucPHPyI2l9aal10xBRXRuybnnqiRvBgF1Aws8gTM5qsloO972kH+r1UdN5AgGkf3dy
         i3H0Di/mJhI3Et4fYrXe5EJZTrlidl0fpMv1cX4kunbQsA2n+eOhNEO/QgXAKteppbKf
         xyX8WxyZl5D9w792ijUmb0xPqj8z8+AAVHNStZGNlb9FiF1S4ShB5tDBIIVvlTFy1dQu
         YZVtk7eeFxYmMK+1P3GFIXZKfNQqqgg8LIZ4GcaObpti4jFB0Nbfskzf+7656SuhNd5a
         rknuwhenxQk0+RY5XMw+J4uplPSdqm/N1YqvKzZoZk18N6kupi6yvEnJNppeWAC6f56D
         IUQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777634432; x=1778239232;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w0w7aacCAKh5xDmIAde6/c4ma74UnnFyw9cMZFzY2vk=;
        b=Dqc5Qr5cqf+oaex2L2hxCrrNkSTvZqWsJeETY42gMrZzYoBXzM5ag7GWh1DwH49Adu
         UABJ+sBVKLeDOg9oWuoOsT3mE/YRoNDrLAE12oxrBVUtWBqFB83K0sTmLNOmz7lp3B3H
         msXHv5IYaBcy7OkcPDQL0/BNddgAvddobNM/9eNqBPf2l26ax9g/8ulTDDnHbS1Vjb0Y
         l0CwbSKQZRsU1t5SdgZhlMcWbvBwsOONR8YCoVhmSn98R7AQ8yx6mdUnZAPbe8FIpyxo
         0bcOCFyVee2y50OCmhnmxh/v+dyVNTUzVKfjfKkZEzJRYuu6A1+109RMgosfAiOTJLxZ
         S1fw==
X-Gm-Message-State: AOJu0YxmVSj+iB+lIzQuA2VsfC6HvFQjyzqLq62kZ+gyVlpicpvYGhoV
	h81dRwGHmEtCxtlAc9Mz5240Smd5JLj5663gBjPwf+PlVDrozEHPJTo91eayPXP0SejSmGgIctb
	6ZeBL/tOx8azQ9Z8PlZtX26RBImHdd3Znhr4gjXYqf5STQP/YdYS2mfCB83I8okQ2ly6znulv7G
	inH81bJli0B2wT2iU5gGPeQ35XGcFSyh/QwryNVZslx1IEn9TKR7xc1kUK0VzoLf+2Qw==
X-Received: from wroq15.prod.google.com ([2002:adf:f50f:0:b0:44a:c22c:e636])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a316:b0:48a:58ae:9933 with SMTP id 5b1f17b1804b1-48a8eb8b706mr26555135e9.18.1777634431501;
 Fri, 01 May 2026 04:20:31 -0700 (PDT)
Date: Fri,  1 May 2026 11:19:25 +0000
In-Reply-To: <20260501111928.259252-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260501111928.259252-1-smostafa@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260501111928.259252-24-smostafa@google.com>
Subject: [PATCH v6 23/25] iommu/arm-smmu-v3-kvm: Shadow the CPU stage-2 page table
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org, jgg@ziepe.ca, 
	mark.rutland@arm.com, qperret@google.com, tabba@google.com, 
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_042034_756156_C39AED99 
X-CRM114-Status: GOOD (  28.34  )
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

Based on the callbacks from the hypervisor, update the SMMUv3
Identity mapped page table.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 197 +++++++++++++++++-
 1 file changed, 195 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
index 1ed5ccce7849..b73a2462f0dd 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
@@ -13,6 +13,9 @@
 
 #include "arm_smmu_v3.h"
 
+#include <linux/io-pgtable.h>
+#include "../../../io-pgtable-arm.h"
+
 size_t __ro_after_init kvm_hyp_arm_smmu_v3_count;
 struct hyp_arm_smmu_v3_device *kvm_hyp_arm_smmu_v3_smmus;
 
@@ -59,6 +62,9 @@ struct hyp_arm_smmu_v3_device *kvm_hyp_arm_smmu_v3_smmus;
 	__ret;								\
 })
 
+/* Protected by host_mmu.lock from core code. */
+static struct io_pgtable *idmap_pgtable;
+
 static bool is_cmdq_enabled(struct hyp_arm_smmu_v3_device *smmu)
 {
 	return FIELD_GET(CR0_CMDQEN, smmu->cr0);
@@ -210,7 +216,6 @@ static int smmu_sync_cmd(struct hyp_arm_smmu_v3_device *smmu)
 			 smmu_cmdq_empty(&smmu->cmdq));
 }
 
-__maybe_unused
 static int smmu_send_cmd(struct hyp_arm_smmu_v3_device *smmu,
 			 struct arm_smmu_cmdq_ent *cmd)
 {
@@ -222,6 +227,78 @@ static int smmu_send_cmd(struct hyp_arm_smmu_v3_device *smmu,
 	return smmu_sync_cmd(smmu);
 }
 
+static void __smmu_add_cmd(void *__opaque, struct arm_smmu_cmdq_batch *unused,
+			   struct arm_smmu_cmdq_ent *cmd)
+{
+	struct hyp_arm_smmu_v3_device *smmu = (struct hyp_arm_smmu_v3_device *)__opaque;
+
+	WARN_ON(smmu_add_cmd(smmu, cmd));
+}
+
+static int smmu_tlb_inv_range_smmu(struct hyp_arm_smmu_v3_device *smmu,
+				   struct arm_smmu_cmdq_ent *cmd,
+				   unsigned long iova, size_t size, size_t granule)
+{
+	arm_smmu_tlb_inv_build(cmd, iova, size, granule,
+			       PAGE_SHIFT, smmu->features & ARM_SMMU_FEAT_RANGE_INV,
+			       smmu, __smmu_add_cmd, NULL);
+	return smmu_sync_cmd(smmu);
+}
+
+static void smmu_tlb_inv_range(unsigned long iova, size_t size, size_t granule,
+			       bool leaf)
+{
+	struct arm_smmu_cmdq_ent cmd_s1 = {
+		.opcode = CMDQ_OP_TLBI_NH_ALL,
+		.tlbi = {
+			.vmid = 0,
+		},
+	};
+	struct hyp_arm_smmu_v3_device *smmu;
+
+	for_each_smmu(smmu) {
+		struct arm_smmu_cmdq_ent cmd = {
+			.opcode = CMDQ_OP_TLBI_S2_IPA,
+			.tlbi = {
+				.leaf = leaf,
+				.vmid = 0,
+			},
+		};
+
+		hyp_spin_lock(&smmu->lock);
+		/*
+		 * Don't bother if SMMU is disabled, this would be useful for the case
+		 * when RPM is supported to avoid touching the SMMU MMIO when disabled.
+		 * The hypervisor also asserts CMDQEN is enabled before the SMMU is
+		 * enabled. As otherwise the host can prevent the hypervisor from doing
+		 * TLB invalidations.
+		 */
+		if (is_smmu_enabled(smmu)) {
+			WARN_ON(smmu_tlb_inv_range_smmu(smmu, &cmd, iova, size, granule));
+			WARN_ON(smmu_send_cmd(smmu, &cmd_s1));
+		}
+		hyp_spin_unlock(&smmu->lock);
+	}
+}
+
+static void smmu_tlb_flush_walk(unsigned long iova, size_t size,
+				size_t granule, void *cookie)
+{
+	smmu_tlb_inv_range(iova, size, granule, false);
+}
+
+static void smmu_tlb_add_page(struct iommu_iotlb_gather *gather,
+			      unsigned long iova, size_t granule,
+			      void *cookie)
+{
+	smmu_tlb_inv_range(iova, granule, granule, true);
+}
+
+static const struct iommu_flush_ops smmu_tlb_ops = {
+	.tlb_flush_walk = smmu_tlb_flush_walk,
+	.tlb_add_page	= smmu_tlb_add_page,
+};
+
 /* Put the device in a state that can be probed by the host driver. */
 static void smmu_deinit_device(struct hyp_arm_smmu_v3_device *smmu)
 {
@@ -495,6 +572,37 @@ static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
 	return ret;
 }
 
+static int smmu_init_pgt(void)
+{
+	/* Default values overridden based on SMMUs common features. */
+	struct io_pgtable_cfg cfg = (struct io_pgtable_cfg) {
+		.tlb = &smmu_tlb_ops,
+		.pgsize_bitmap = -1,
+		.ias = 48,
+		.oas = 48,
+		.coherent_walk = true,
+	};
+	struct hyp_arm_smmu_v3_device *smmu;
+	struct io_pgtable_ops *ops;
+
+	for_each_smmu(smmu) {
+		cfg.ias = min(cfg.ias, smmu->oas);
+		cfg.oas = min(cfg.oas, smmu->oas);
+		cfg.pgsize_bitmap &= smmu->pgsize_bitmap;
+		cfg.coherent_walk &= !!(smmu->features & ARM_SMMU_FEAT_COHERENCY);
+	}
+
+	/* At least PAGE_SIZE must be supported by all SMMUs*/
+	if ((cfg.pgsize_bitmap & PAGE_SIZE) == 0)
+		return -EINVAL;
+
+	ops = kvm_alloc_io_pgtable_ops(ARM_64_LPAE_S2, &cfg, NULL);
+	if (!ops)
+		return -ENOMEM;
+	idmap_pgtable = io_pgtable_ops_to_pgtable(ops);
+	return 0;
+}
+
 /* Called while is the host is still trusted. */
 static int smmu_init(void)
 {
@@ -520,7 +628,10 @@ static int smmu_init(void)
 
 	BUILD_BUG_ON(sizeof(hyp_spinlock_t) != sizeof(u32));
 
-	return 0;
+	ret = smmu_init_pgt();
+	if (ret)
+		goto out_reclaim_smmu;
+	return ret;
 
 out_reclaim_smmu:
 	while (smmu != kvm_hyp_arm_smmu_v3_smmus)
@@ -950,8 +1061,90 @@ static bool smmu_dabt_handler(struct user_pt_regs *regs, u64 esr, u64 addr)
 	return false;
 }
 
+static size_t smmu_pgsize_idmap(size_t size, u64 paddr, size_t pgsize_bitmap)
+{
+	size_t pgsizes;
+
+	/* Remove page sizes that are larger than the current size */
+	pgsizes = pgsize_bitmap & GENMASK_ULL(__fls(size), 0);
+
+	/* Remove page sizes that the address is not aligned to. */
+	if (likely(paddr))
+		pgsizes &= GENMASK_ULL(__ffs(paddr), 0);
+
+	WARN_ON(!pgsizes);
+
+	/* Return the largest page size that fits. */
+	return BIT(__fls(pgsizes));
+}
+
 static int smmu_host_stage2_idmap(phys_addr_t start, phys_addr_t end, int prot)
 {
+	size_t pgsize = PAGE_SIZE, pgcount, size;
+	struct io_pgtable *pgtable = idmap_pgtable;
+	int ret = 0;
+
+	end = min(end, BIT(pgtable->cfg.oas));
+	if (start >= end)
+		return 0;
+
+	size = end - start;
+	if (prot) {
+		size_t mapped;
+
+		if (!(prot & IOMMU_MMIO))
+			prot |= IOMMU_CACHE;
+
+		while (size) {
+			mapped = 0;
+			/*
+			 * We handle pages size for memory and MMIO differently:
+			 * - memory: Map everything with PAGE_SIZE, that is guaranteed to
+			 *   find memory as we allocated enough pages to cover the entire
+			 *   memory, we do that as io-pgtable-arm doesn't support
+			 *   split_blk_unmap logic any more, so we can't break blocks once
+			 *   mapped to tables.
+			 * - MMIO: Unlike memory, pKVM allocate 1G to for all MMIO, while
+			 *   the MMIO space can be large, as it is assumed to cover the
+			 *   whole IAS that is not memory, we have to use block mappings,
+			 *   that is fine for MMIO as it is never donated at the moment,
+			 *   so we never need to unmap MMIO at the run time triggereing
+			 *   split block logic.
+			 */
+			if (prot & IOMMU_MMIO)
+				pgsize = smmu_pgsize_idmap(size, start, pgtable->cfg.pgsize_bitmap);
+
+			pgcount = size / pgsize;
+			ret = pgtable->ops.map_pages(&pgtable->ops, start, start,
+						     pgsize, pgcount, prot, 0, &mapped);
+			size -= mapped;
+			start += mapped;
+			/* Map failures doesn't impact security, tolerate it. */
+			if (!mapped || ret)
+				break;
+		}
+	} else {
+		struct iommu_iotlb_gather gather;
+		size_t unmapped;
+
+		while (size) {
+			pgcount = size / pgsize;
+			iommu_iotlb_gather_init(&gather);
+			unmapped = pgtable->ops.unmap_pages(&pgtable->ops, start,
+							    pgsize, pgcount, &gather);
+			size -= unmapped;
+			start += unmapped;
+			if (!unmapped)
+				break;
+		}
+	}
+
+	if (ret)
+		return ret;
+
+	if (WARN_ON(size))
+		return -EINVAL;
+
 	return 0;
 }
 
-- 
2.54.0.545.g6539524ca2-goog


