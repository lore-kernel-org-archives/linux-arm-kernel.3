Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D07CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 20:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uOWI3MWzFM4E6XsnBaoMm2oO1l7gBBooy2wESuq6Qac=; b=XlhwAe1K7SNAx0tjY/vqolMV+6
	lzEm0O/2lh/gW+MeKzzfjZOenBNg5QlV8pa0VkR7rCrBAcw+MAi/WYHLvOklUPyjwT050A/kf0wAU
	aQdVa6qVH9j+U6Pw6r7CC79ytN8KHVu0/esTEaMvcbMwA3OvLBVf3APqRDwEEzes+UC4QpSL92CpW
	iJpxFprhkC8j+lq/fPT80xYLdgJolQOAtG+zF0sWI2Op44X8AOe99QBDhXiP685nncuvPZJ+4l5GZ
	IDvBA2/AsN7bg3vqv3vQlVj1d4r2mNzvVgpnU8A2vetZfUSNbUiHQz8TN4xbfN+7wdm4ogZvHUKcl
	IVfdZ9qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRma-00000001JN2-18eG;
	Thu, 15 Oct 2026 20:10:32 +0000
Received: from mail-wm1-f71.google.com ([209.85.128.71])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRll-00000001ILA-2uyx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 20:09:43 +0000
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a027f2e364so39422345e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 13:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792094978; x=1792699778; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uOWI3MWzFM4E6XsnBaoMm2oO1l7gBBooy2wESuq6Qac=;
        b=KJmD48o1PDmE5lHVdF7rBUDf8EYqRrdvtji4WxmJTVfSUaYJyMUVz9ACQ6wq7/by1C
         NqgI2IN6gfsEPC4R5UeJxevlQEZMZnLq78o0uNAU/Rcx7G4AzSLow6J/PyDoFkgfS6jQ
         Xq11DkTIo5ZrYNVr3cC56PtGHf0ai2Z4bjgdi8sff5ZIEBTS60MjbkuordokwK9zI/rm
         e4V54XLJZ80b11keWIaS2RIMow64sHfx89TQRPXLof1YxTW3F1ZdRwkioGOeD9uHKgjx
         Qb2DQDyPUYZ1pB9kr+fHXW2xAJXm9RAdt+A5aI0IlToG5By49YPgPjQw3xcRYFyj+YdP
         tU4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792094978; x=1792699778;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uOWI3MWzFM4E6XsnBaoMm2oO1l7gBBooy2wESuq6Qac=;
        b=kfisfPaoR40iKACBRGAKNPI46rLNIb0PcNQ78WF2/na0df5qYH1ABD+maGHzKOGXzL
         kF2UTHZ/v6cQtR0NvNCbE/AwyLSEQtGfZ6PtT5YM93P+ismdQIC+laoHWPQC3p9vIUNM
         mmwHrcQq1AMKzW30siGDPZ2auVxvnSxp0CyIqJn7kG3GcR+RmN0dWu4w4rsg+kWUnDeT
         n+51WMHsZWFaYb5zQxrpFhR2jj3F/ulQXQ9bGT9RcWs09FWveKLhgxdOUBnX+La/I2D4
         6Hf1UkAJlds2JY905itY+cVoq4i6NS1aidVokYrYDspMAPgJvklXLEo6vGsha6eu/03L
         TVFw==
X-Gm-Message-State: AFq9FYJ1SMgNMUsxy/ZPn1gT1evvnSywRboG/K1cCDy/h7eA01kYzYwO
	5xqq4oNzuACN/4me8t27M2aDSScYnyVKKg68CzIHH/cFmtyOZRqOxquCBUIOiwzRRdT0p65FBRq
	ODNh2GwsuQ9JY7z4hH9AtsABsRQ2WxvNrVI/iOFTvtGyqQqaHZRjbMuNf59Xgs2fb4M76cnrWc1
	3flLKMoUx1Hnx+X1ZAym4ZoTyYxSBQW4GwW9VmWzCl1XaKL7z9RsYa5hHb81OLmKS3cQ==
X-Received: from wmjs9.prod.google.com ([2002:a7b:c389:0:b0:4a1:8be5:4018])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3e0a:b0:4a0:1c10:1419 with SMTP id 5b1f17b1804b1-4a18e4cd667mr404934305e9.26.1792094977861;
 Thu, 15 Oct 2026 13:09:37 -0700 (PDT)
Date: Thu, 15 Oct 2026 20:08:53 +0000
In-Reply-To: <20261015200903.2735565-1-smostafa@google.com>
Mime-Version: 1.0
References: <20261015200903.2735565-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261015200903.2735565-23-smostafa@google.com>
Subject: [PATCH v9 22/25] iommu/arm-smmu-v3-kvm: Shadow the CPU stage-2 page table
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, vdonnefort@google.com, 
	nicolinc@nvidia.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_130941_953139_BF77198B 
X-CRM114-Status: GOOD (  28.80  )
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

The hypervisor calls back into the driver on every change to the host
stage-2 page table.
Mirror those changes into an identity mapped stage-2 for the SMMUv3,
That would be attached to all active SIDs.

Difference between memory and MMIO handling:

- Memory is always mapped with PAGE_SIZE. io-pgtable-arm no longer
  supports split_blk_unmap, so a block cannot be broken into a table
  once it is mapped, and pages are donated back and forth at PAGE_SIZE
  granularity. The page table pool is sized to cover all of memory at
  that granularity.

- MMIO is mapped with the largest block that fits, as it is assumed to
  cover the whole IAS that is not memory while pKVM only reserves 1G
  for the page table. MMIO is never donated at runtime, so it is never
  unmapped and never needs a block to be split.

The TLB maintenance ops are left as stubs, they are implemented in the
next patch.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c    | 153 +++++++++++++++++-
 1 file changed, 152 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
index 943ffef0bb4a..75b2b1477a4f 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
@@ -15,6 +15,9 @@
 #include "../arm-smmu-v3.h"
 #include "../arm-smmu-v3-common-lib.h"
 
+#include <linux/io-pgtable.h>
+#include "../../../io-pgtable-arm.h"
+
 size_t __ro_after_init kvm_hyp_arm_smmu_v3_count;
 struct hyp_arm_smmu_v3_device *kvm_hyp_arm_smmu_v3_smmus;
 
@@ -72,6 +75,9 @@ static inline u64 hyp_clock_ns(void)
 	__ret;								\
 })
 
+/* Protected by host_mmu.lock from core code. */
+static struct io_pgtable *idmap_pgtable;
+
 static bool is_cmdq_enabled(struct hyp_arm_smmu_v3_device *smmu)
 {
 	return FIELD_GET(CR0_CMDQEN, smmu->cr0);
@@ -217,6 +223,24 @@ static int smmu_send_cmd(struct hyp_arm_smmu_v3_device *smmu,
 	return smmu_sync_cmd(smmu);
 }
 
+static void smmu_tlb_flush_walk(unsigned long iova, size_t size,
+				size_t granule, void *cookie)
+{
+	/* TBD: Invalidate the range in all the SMMUs. */
+}
+
+static void smmu_tlb_add_page(struct iommu_iotlb_gather *gather,
+			      unsigned long iova, size_t granule,
+			      void *cookie)
+{
+	/* TBD: Invalidate the granule in all the SMMUs. */
+}
+
+static const struct iommu_flush_ops smmu_tlb_ops = {
+	.tlb_flush_walk = smmu_tlb_flush_walk,
+	.tlb_add_page	= smmu_tlb_add_page,
+};
+
 static int smmu_abort_gbpa(struct hyp_arm_smmu_v3_device *smmu)
 {
 	int ret;
@@ -483,6 +507,38 @@ static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
 	return ret;
 }
 
+static int smmu_init_pgt(void)
+{
+	/* Default values overridden based on SMMUs common features. */
+	struct io_pgtable_cfg cfg = (struct io_pgtable_cfg) {
+		.tlb = &smmu_tlb_ops,
+		.pgsize_bitmap = ~0UL,
+		.ias = 48,
+		.oas = 48,
+		.coherent_walk = true,
+		.quirks = IO_PGTABLE_QUIRK_NO_WARN,
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
+	/* At least PAGE_SIZE must be supported by all SMMUs */
+	if ((cfg.pgsize_bitmap & PAGE_SIZE) == 0)
+		return -EINVAL;
+
+	ops = pkvm_alloc_io_pgtable_ops(ARM_64_LPAE_S2, &cfg, NULL);
+	if (!ops)
+		return -ENOMEM;
+	idmap_pgtable = io_pgtable_ops_to_pgtable(ops);
+	return 0;
+}
+
 /* Called while the host is still trusted. */
 static int smmu_init(void)
 {
@@ -513,7 +569,10 @@ static int smmu_init(void)
 			goto out_reclaim_smmu;
 	}
 
-	return 0;
+	ret = smmu_init_pgt();
+	if (ret)
+		goto out_reclaim_smmu;
+	return ret;
 
 out_reclaim_smmu:
 	while (smmu != kvm_hyp_arm_smmu_v3_smmus)
@@ -1011,8 +1070,100 @@ static bool smmu_dabt_handler(struct user_pt_regs *regs, u64 esr, u64 addr)
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
+			 * - MMIO: Unlike memory, pKVM allocates 1G for all MMIO, while
+			 *   the MMIO space can be large, as it is assumed to cover the
+			 *   whole IAS that is not memory, we have to use block mappings,
+			 *   that is fine for MMIO as it is never donated at the moment,
+			 *   so we never need to unmap MMIO at the run time triggering
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
+
+			if (ret == -EEXIST) {
+				/*
+				 * It is possible to get EEXIST when a VM dies with pages
+				 * in a shared state.
+				 */
+				ret = 0;
+				size -= pgsize;
+				start += pgsize;
+				continue;
+			}
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
2.56.0.176.g3575e65682-goog


