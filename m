Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2282C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 12:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ol6N7Vx1NTlVrCf/IVQ7ie/xZNl8BBwxYM7kichYdRY=; b=f+Y5siP+uFqO+NHAPcu2AQwgHL
	KxWSeprkaTtEQYrZm+Uz2r/SRARo27IvW7WfBXGMVcpRk4IBd1smEtdZH3xJwXG96N0FTAJV56VPC
	VqoSpJtHjqQAkxdNVsLoxbCIDAvD6pdTlNgzHqsJ6rt8BWWv/I/FuFrHDErpinDYJOe5VFgqn2P/3
	lyI0G8HgLCsqUm69n+almRUg03AgtoTumxRhaMs0Eq3Nl45yAq0eHP9G3o21mIRiRhIBH33gnoV0B
	undz5oAiDVVX4EreiWeDP5e3ba7pNLE/237c/lNcxPNsxO+z2E+5zjKohyjmrem/0bWReG765+fcl
	FNFM0u8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyHb-0000000Efvr-0lF2;
	Wed, 15 Jul 2026 12:00:11 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyHB-0000000EfTJ-3TUR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 11:59:47 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-698af52daa4so5768165a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 04:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784116783; x=1784721583; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ol6N7Vx1NTlVrCf/IVQ7ie/xZNl8BBwxYM7kichYdRY=;
        b=h+nDWUYkF/56PDu2XVkqXUd1kaomgt88+q0FETV+q7wcXrZKvA/Djqsdg8FbTatmJF
         UWvHwgyPcqpMa95AQA9BP5GJoA65UTrAS2p2t2jsN1VyJLZoFhHAWU5ZvP+8gtLI8Onk
         //No+qS1l3/4/CyrbGSdVIGNw7TT1oablsmCAdYk8cXYQYhj/B7L/AzNMpkrvR3ok9OV
         okjrL9RPr1jJ8Fr4ABo11H10g/ZkHqK/B7cPbFst6VgEsDc4frLp6ieIvL08IEmx0lb6
         SGktyN8mnkK17XmMc7B2F4/MHDyNM9xkSFkUWdc8pEQOgHGlCtGOTb7X2B3E0YbyHYMv
         CpBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784116783; x=1784721583;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ol6N7Vx1NTlVrCf/IVQ7ie/xZNl8BBwxYM7kichYdRY=;
        b=huJwFJGIbpMcOmIzuRmdu4Q03n33sXKjfBXqJv9I2znX590rKh8nd424qNkBVAGfO0
         /5jZc2pRlSjl0P/ya1EnAtLEwWgGnv3qjPRYJKRqMMfkdvHEz0lFMPQ3w7QRO5zJtQF3
         4LMiRx+QzaniJoXZbjFPWDOth2dNMvzsZCy9JyPa59hL4jx6FQbniBqoY2j0cmk9uFAE
         DOsfodV4m6w2xPy+pGMjijraBd2/Mt5hYBe4ZnFTSo81nwHANq2wsr4A1oIzp2tQ593o
         8RbN0znTK/mgtf8K+lHaJfXtEfJ7JdJJkiJxkSneFM0ovKso0GOdY2DepKupVRJ1NjGG
         WrEQ==
X-Gm-Message-State: AOJu0YwCyUSBmCWSMRCO1Gz/VLndiQcQ3gMJCtORwHICRVjCak5ZqY6x
	hRrzg7a2nwnspyhfi8f+5rbQbhRGVH5pAH4vcL+k7d+WoSus5UfhlK21rV8ua/RbagyQHGd1TFp
	8K410qwdvuT3ZqOOqZ3jJIl2BlGLloTpCVhGIlL1bwE2NGa0y0rClP1cr4BpCGJSBUUOYq27k94
	ctg6lKOpMarT3QRgjtb8omWJaBK2uW9AKHxTWO/FBZXr3brtjh9/8//jJG9ZXvzcJBYg==
X-Received: from ejbwn11.prod.google.com ([2002:a17:907:68b:b0:c15:cc45:3883])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:72d1:b0:c15:df6d:4b45 with SMTP id a640c23a62f3a-c1661879330mr426876166b.36.1784116781057;
 Wed, 15 Jul 2026 04:59:41 -0700 (PDT)
Date: Wed, 15 Jul 2026 11:59:03 +0000
In-Reply-To: <20260715115906.2664882-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260715115906.2664882-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
Message-ID: <20260715115906.2664882-23-smostafa@google.com>
Subject: [PATCH v7 22/24] iommu/arm-smmu-v3-kvm: Shadow the CPU stage-2 page table
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, vdonnefort@google.com, 
	sebastianene@google.com, keirf@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_045946_009463_8F8A2848 
X-CRM114-Status: GOOD (  32.91  )
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
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 249 +++++++++++++++++-
 .../iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h  |   2 +
 2 files changed, 249 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
index 45dbab1b18ad..f30757dd9b11 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
@@ -13,6 +13,9 @@
 
 #include "arm_smmu_v3.h"
 
+#include <linux/io-pgtable.h>
+#include "../../../io-pgtable-arm.h"
+
 size_t __ro_after_init kvm_hyp_arm_smmu_v3_count;
 struct hyp_arm_smmu_v3_device *kvm_hyp_arm_smmu_v3_smmus;
 
@@ -64,6 +67,9 @@ struct hyp_arm_smmu_v3_device *kvm_hyp_arm_smmu_v3_smmus;
 	__ret;								\
 })
 
+/* Protected by host_mmu.lock from core code. */
+static struct io_pgtable *idmap_pgtable;
+
 static bool is_cmdq_enabled(struct hyp_arm_smmu_v3_device *smmu)
 {
 	return FIELD_GET(CR0_CMDQEN, smmu->cr0);
@@ -211,7 +217,6 @@ static int smmu_sync_cmd(struct hyp_arm_smmu_v3_device *smmu)
 			 smmu_cmdq_empty(&smmu->cmdq));
 }
 
-__maybe_unused
 static int smmu_send_cmd(struct hyp_arm_smmu_v3_device *smmu,
 			 struct arm_smmu_cmd *cmd)
 {
@@ -224,6 +229,69 @@ static int smmu_send_cmd(struct hyp_arm_smmu_v3_device *smmu,
 	return smmu_sync_cmd(smmu);
 }
 
+static void __smmu_add_cmd(void *__opaque, struct arm_smmu_cmdq_batch *unused,
+			   struct arm_smmu_cmd *cmd)
+{
+	struct hyp_arm_smmu_v3_device *smmu = (struct hyp_arm_smmu_v3_device *)__opaque;
+
+	WARN_ON(smmu_add_cmd(smmu, cmd));
+}
+
+static int smmu_tlb_inv_range_smmu(struct hyp_arm_smmu_v3_device *smmu,
+				   struct arm_smmu_cmd *cmd,
+				   unsigned long iova, size_t size, size_t granule,
+				   bool leaf)
+{
+	arm_smmu_tlb_inv_build(cmd, iova, size, granule,
+			       PAGE_SHIFT, smmu->features & ARM_SMMU_FEAT_RANGE_INV,
+			       smmu, leaf, __smmu_add_cmd, NULL);
+	return smmu_sync_cmd(smmu);
+}
+
+static void smmu_tlb_inv_range(unsigned long iova, size_t size, size_t granule,
+			       bool leaf)
+{
+	struct arm_smmu_cmd cmd_s1 = arm_smmu_make_cmd_op(CMDQ_OP_TLBI_NH_ALL);
+	struct hyp_arm_smmu_v3_device *smmu;
+
+	for_each_smmu(smmu) {
+		struct arm_smmu_cmd cmd = arm_smmu_make_cmd_op(CMDQ_OP_TLBI_S2_IPA);
+
+		hyp_spin_lock(&smmu->hw_lock);
+		/*
+		 * Don't bother if SMMU is disabled, this would be useful for the case
+		 * when RPM is supported to avoid touching the SMMU MMIO when disabled.
+		 * The hypervisor also asserts CMDQEN is enabled before the SMMU is
+		 * enabled. As otherwise the host can prevent the hypervisor from doing
+		 * TLB invalidations.
+		 * When the SMMU is re-enabled the hypervisor clean the TLBs.
+		 */
+		if (smmu->active) {
+			WARN_ON(smmu_tlb_inv_range_smmu(smmu, &cmd, iova, size, granule, leaf));
+			WARN_ON(smmu_send_cmd(smmu, &cmd_s1));
+		}
+		hyp_spin_unlock(&smmu->hw_lock);
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
@@ -477,6 +545,38 @@ static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
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
@@ -502,7 +602,10 @@ static int smmu_init(void)
 
 	BUILD_BUG_ON(sizeof(hyp_spinlock_t) != sizeof(u32));
 
-	return 0;
+	ret = smmu_init_pgt();
+	if (ret)
+		goto out_reclaim_smmu;
+	return ret;
 
 out_reclaim_smmu:
 	while (smmu != kvm_hyp_arm_smmu_v3_smmus)
@@ -646,6 +749,34 @@ static int smmu_update_ste_shadow(struct hyp_arm_smmu_v3_device *smmu, bool enab
 	return smmu_unshare_pages(strtab_host_base(smmu), strtab_size);
 }
 
+static int smmu_flush_all_tlb(struct hyp_arm_smmu_v3_device *smmu)
+{
+	int ret;
+	u32 cr0;
+	struct arm_smmu_cmd cmd = arm_smmu_make_cmd_op(CMDQ_OP_TLBI_NSNH_ALL);
+
+	hyp_spin_lock(&smmu->hw_lock);
+	/*
+	 * This must be called when the SMMU is getting enabled.
+	 * First enable the cmdq and then invalidate the TLB.
+	 */
+	cr0 = readl_relaxed(smmu->base + ARM_SMMU_CR0);
+	if (!(cr0 & CR0_CMDQEN)) {
+		cr0 |= CR0_CMDQEN;
+		writel_relaxed(cr0, smmu->base + ARM_SMMU_CR0);
+		ret = smmu_wait(false,
+				readl_relaxed(smmu->base + ARM_SMMU_CR0ACK) == cr0);
+		if (ret) {
+			hyp_spin_unlock(&smmu->hw_lock);
+			return ret;
+		}
+	}
+
+	ret = smmu_send_cmd(smmu, &cmd);
+	hyp_spin_unlock(&smmu->hw_lock);
+	return ret;
+}
+
 static void smmu_emulate_enable(struct hyp_arm_smmu_v3_device *smmu)
 {
 	/* Enabling SMMU without CMDQ, means TLB invalidation won't work. */
@@ -653,6 +784,8 @@ static void smmu_emulate_enable(struct hyp_arm_smmu_v3_device *smmu)
 		return;
 
 	WARN_ON(smmu_update_ste_shadow(smmu, true));
+	/* Clean the TLBs each time the SMMU is enabled. */
+	WARN_ON(smmu_flush_all_tlb(smmu));
 }
 
 static void smmu_emulate_disable(struct hyp_arm_smmu_v3_device *smmu)
@@ -673,6 +806,13 @@ static void smmu_emulate_cmdq_enable(struct hyp_arm_smmu_v3_device *smmu)
 
 static void smmu_emulate_cmdq_disable(struct hyp_arm_smmu_v3_device *smmu)
 {
+	/*
+	 * We can not enable the SMMU if the CMDQ is enabled and similarly
+	 * we can not disable the CMDQ if the SMMU is enabled, as that can
+	 * lead to stale TLBs.
+	 */
+	WARN_ON(is_smmu_enabled(smmu));
+
 	WARN_ON(smmu_unshare_pages(smmu->cmdq_host.base_dma,
 				   cmdq_size(&smmu->cmdq_host)));
 }
@@ -936,6 +1076,18 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
 		else
 			writel_relaxed(val & mask, smmu->base + off);
 
+		/*
+		 * Make sure writes to CR0 are immediately observed, that is important
+		 * when synchronizing with TLB invalidation as reading CR0 is enough
+		 * to deduce the SMMU state, and we have to enforce the ack with the
+		 * hw_lock aquired.
+		 */
+		if (off == ARM_SMMU_CR0) {
+			WARN_ON(smmu_wait(false,
+			        readl_relaxed(smmu->base + ARM_SMMU_CR0ACK) == (val & mask)));
+				smmu->active = !!(val & CR0_CMDQEN);
+		}
+
 		hyp_spin_unlock(&smmu->hw_lock);
 		return true;
 	}
@@ -973,8 +1125,101 @@ static bool smmu_dabt_handler(struct user_pt_regs *regs, u64 esr, u64 addr)
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
 
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
index d96801e433ef..9599809b46fc 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
@@ -29,6 +29,7 @@
  * @cmdq		CMDQ as observed by HW
  * @cmdq_host		Host view of the CMDQ, only q_base and llq used.
  * @cr0			Last value of CR0
+ * @active		Is SMMU HW cmdq usable, protected by hw_lock
  * @host_ste_cfg	Host stream table config
  * @host_ste_base	Host stream table base
  * @strtab_cfg		Stream table as seen by HW
@@ -55,6 +56,7 @@ struct hyp_arm_smmu_v3_device {
 	struct arm_smmu_queue	cmdq;
 	struct arm_smmu_queue	cmdq_host;
 	u32			cr0;
+	bool			active;
 	dma_addr_t		strtab_dma;
 	size_t			strtab_size;
 	u64			host_ste_cfg;
-- 
2.55.0.141.g00534a21ce-goog


