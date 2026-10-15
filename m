Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D630CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 21:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WtEQd+Mbv2A+20oTamxspD6VLu1dz9WsK6wgSsf9W6U=; b=grlZs6ACiuPQcrMGCBwTc8KuvA
	l5E68yFTdvGvdp6aZOAZGY6cywGkw52VEmF9LgMexlZa4r0f6h6wGcLjBes5FNp6lVa+az99VLqiL
	lRFflbEFmRXWwn6PEeddE3t/T3lm3igDP8rmeOTItDP5cokNgWQAjLbvRbiJ3qtWgtmCGwITpSWbS
	LcRt9OMm2ZUbltoPt5ZORLjt8UEQkyuvc8bbD6cT1BsI+XXD+jSu/guICKI/Yt+bRXn1EbtyVGigE
	ldbaK19kUbqWhVvz8h9/tm+O6w+no/P9kYKuEPpTNlp6z5ML0xORqBe6tx/WFKQkjd2y/DspBPyr9
	nPwwOV5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRlh-00000001IIm-2NYC;
	Thu, 15 Oct 2026 20:09:37 +0000
Received: from mail-wr1-x445.google.com ([2a00:1450:4864:20::445])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRlR-00000001I0f-3CPa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 20:09:23 +0000
Received: by mail-wr1-x445.google.com with SMTP id ffacd0b85a97d-48df02e6b40so1197916f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 13:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792094959; x=1792699759; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WtEQd+Mbv2A+20oTamxspD6VLu1dz9WsK6wgSsf9W6U=;
        b=vFsglfB16x+ry4VNbYAOdwYAGM22CKxUWZBk54ruel0PBzStrVQI/w9gy5hYeeWdYM
         T/bRLfhmFHTL6T8HbMmBxEY6E5b8FzCK24CXBc7mZHMj9L6kuE4W5ms8JleEja9ixkLN
         C4+X719DtPE/Fk6+oDGtOWz+DvPSTH2VQZw7kOSEmKouUuWf6uRmKjaSFMHIViqbE9Dd
         TQA1VAhtnEMWv6Il75GElLjxEh83KusdTPwj1D75dQ64NxRXRhKDkxwOWthzP1Dx8OhD
         N7lLv6+1bw2N1fPS4aPcECy2WSfZfsHSh/j50zy5ujXvon7wam2JiJTL/LnBjPyRi8+d
         G2mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792094959; x=1792699759;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WtEQd+Mbv2A+20oTamxspD6VLu1dz9WsK6wgSsf9W6U=;
        b=q3xKOEioCzH0X2P4ZG+xltiJNbfIGrbc8nztNeiN2ph3LIFzn2B5ZXKUzxdvP6ulQo
         zU3UXsWC14Y6vsLYft0gwg3UocsY2bBlrOggVpZBvRs1KULZrT0T9XbHkuPDSVCMOroM
         qKCL7M+y/pC/9thYoBSnKduXSqg2d9k/ixyiwA8jioLAIjTiSUezhMutQ/ax6nKv/9h0
         +8LVJpJ394P1oxkfIqKdLKiLdBkc0XEQcBW3HnVi/GrcwxkSKMsCei8YEbpSuhFFnO5a
         HhmIXz1JYzzu9WNnqBH7HbuzfdM0hzc9OHFXEbFTf/VD4aH2G9QoJx+5KPqKckxEvudg
         9dsw==
X-Gm-Message-State: AFq9FYK7hdV3OL/vgZmiBjtUClhwgN46xP3CEGlypXc4gV2HT10kQJ5B
	RhJaGx33KdVrcQsoNhbrtQv1aMUqCGHneE86+ON5Rgiv2UC6jQRU9s6gtLha0cGAQylNMcEs2fO
	gtFxzRRmGpm/744Th8Ybni72K+7V3lKCZAbLENL5rV/40QL31xfLASkqXKoXfdHG940QLRLNOpo
	JNjgK6TsdZTWN9RGf1wlfvcxI7LxtuZuo10KNMbkXpNNJQthcw11t41wALporTrg4VHQ==
X-Received: from wmjs9.prod.google.com ([2002:a7b:c389:0:b0:4a1:8be5:4018])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6207:b0:49f:ff73:9971 with SMTP id 5b1f17b1804b1-4a18e4aff66mr402752955e9.18.1792094959086;
 Thu, 15 Oct 2026 13:09:19 -0700 (PDT)
Date: Thu, 15 Oct 2026 20:08:38 +0000
In-Reply-To: <20261015200903.2735565-1-smostafa@google.com>
Mime-Version: 1.0
References: <20261015200903.2735565-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261015200903.2735565-8-smostafa@google.com>
Subject: [PATCH v9 07/25] KVM: arm64: iommu: Shadow host stage-2 page table
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
X-CRM114-CacheID: sfid-20261015_130921_879020_06513D49 
X-CRM114-Status: GOOD (  26.58  )
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

Create a page table for the IOMMU that shadows the host CPU stage-2 to
establish DMA isolation.

An initial snapshot is taken after the driver init, then on every
ownership change a callback is called for the IOMMU driver to update
its page table. The callback runs under host_mmu.lock, prot 0 unmaps,
and a range may already be mapped with the same prot.

There are 3 different ways to add the callback:
1) In the high level memory transitions (__pkvm_host_donate_hyp(),
   __pkvm_host_donate_guest(), ...).

2) In lower level functions covering all transitions:
   - host_stage2_set_owner_metadata_locked(), which covers
     __pkvm_host_donate_hyp(), __pkvm_host_donate_guest() and
     __pkvm_guest_unshare_host().
   - host_stage2_set_owner_locked() for PKVM_ID_HOST, which covers
     __pkvm_hyp_donate_host(), __pkvm_host_force_reclaim_page_guest()
     and __pkvm_host_reclaim_page_guest().
   - __pkvm_guest_share_host().

3) In the lowest level function __host_update_page_state(), which
   requires only one callback. However, the page state is not enough
   there as the old state is needed as well.

Option 2 is implemented here.

IOMMUs can't handle faults, so the snapshot maps everything the host
owns, including what it has not faulted in yet. Failures to update the
shadow are fatal, as WARN_ON() at EL2 panics, so a driver must
guarantee the update cannot fail. The SMMUv3 driver does so by mapping
memory at page granularity, so ownership changes never split a block,
and by sizing its page table pool accordingly.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/iommu.h |   9 ++
 arch/arm64/kvm/hyp/nvhe/iommu.c         | 123 +++++++++++++++++++++++-
 arch/arm64/kvm/hyp/nvhe/mem_protect.c   |  27 +++---
 3 files changed, 143 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/iommu.h b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
index df3d0cc5d4db..6cbcc9d65b4b 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/iommu.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
@@ -3,11 +3,20 @@
 #define __ARM64_KVM_NVHE_IOMMU_H__
 
 #include <asm/kvm_host.h>
+#include <asm/kvm_pgtable.h>
 
 struct pkvm_iommu_ops {
 	int (*init)(void);
+	/*
+	 * Mirror [start, end) of the host stage-2 with IOMMU_* @prot, where 0
+	 * unmaps. Called with host_mmu.lock held. A range may already be mapped
+	 * with the same @prot, which must succeed.
+	 */
+	int (*host_stage2_idmap)(phys_addr_t start, phys_addr_t end, int prot);
 };
 
 int pkvm_iommu_init(void);
 
+int pkvm_iommu_host_stage2_idmap(phys_addr_t start, phys_addr_t end,
+				 enum kvm_pgtable_prot prot);
 #endif /* __ARM64_KVM_NVHE_IOMMU_H__ */
diff --git a/arch/arm64/kvm/hyp/nvhe/iommu.c b/arch/arm64/kvm/hyp/nvhe/iommu.c
index f4572b2dba76..662b1ed2330f 100644
--- a/arch/arm64/kvm/hyp/nvhe/iommu.c
+++ b/arch/arm64/kvm/hyp/nvhe/iommu.c
@@ -4,16 +4,131 @@
  *
  * Copyright (C) 2022 Linaro Ltd.
  */
+#include <linux/iommu.h>
+#include <asm/kvm_pkvm.h>
+
 #include <nvhe/iommu.h>
+#include <nvhe/mem_protect.h>
+#include <nvhe/spinlock.h>
 
 /* Only one set of ops supported */
 struct pkvm_iommu_ops *pkvm_iommu_ops __ro_after_init;
 
-int pkvm_iommu_init(void)
+/* Protected by host_mmu.lock */
+static bool pkvm_idmap_initialized;
+
+static inline int pkvm_to_iommu_prot(enum kvm_pgtable_prot prot)
 {
-	/* Keep DMA isolation optional. */
-	if (!pkvm_iommu_ops || !pkvm_iommu_ops->init)
+	int iommu_prot = 0;
+
+	if (prot & KVM_PGTABLE_PROT_R)
+		iommu_prot |= IOMMU_READ;
+	if (prot & KVM_PGTABLE_PROT_W)
+		iommu_prot |= IOMMU_WRITE;
+
+	/* We don't understand that, might be dangerous. */
+	WARN_ON(prot & ~PKVM_HOST_MEM_PROT);
+	return iommu_prot;
+}
+
+static int pkvm_iommu_snapshot_walker(const struct kvm_pgtable_visit_ctx *ctx,
+				      enum kvm_pgtable_walk_flags visit)
+{
+	bool is_memory = *(bool *)ctx->arg;
+	kvm_pte_t pte = ctx->old;
+	u64 start = ctx->addr;
+	u64 block_end, end;
+	int prot;
+
+	block_end = ALIGN_DOWN(ctx->addr, kvm_granule_size(ctx->level)) +
+			kvm_granule_size(ctx->level);
+	end = min(ctx->end, block_end);
+	/*
+	 * Annotated PTEs stay unmapped. Everything else is mapped, including
+	 * PTEs the host has not faulted in yet (0) to avoid page faults.
+	 */
+	if (pte && !kvm_pte_valid(pte))
 		return 0;
 
-	return pkvm_iommu_ops->init();
+	if (kvm_pte_valid(pte))
+		prot = pkvm_to_iommu_prot(kvm_pgtable_stage2_pte_prot(pte));
+	else
+		prot = IOMMU_READ | IOMMU_WRITE;
+
+	if (!is_memory)
+		prot |= IOMMU_MMIO;
+
+	return pkvm_iommu_ops->host_stage2_idmap(start, end, prot);
+}
+
+static int pkvm_iommu_snapshot_host_stage2(void)
+{
+	struct kvm_pgtable *pgt = &host_mmu.pgt;
+	bool is_memory;
+	struct kvm_pgtable_walker walker = {
+		.cb	= pkvm_iommu_snapshot_walker,
+		.flags	= KVM_PGTABLE_WALK_LEAF,
+		.arg	= &is_memory,
+	};
+	int ret = 0, i;
+	u64 start = 0;
+
+	hyp_spin_lock(&host_mmu.lock);
+	for (i = 0; i < hyp_memblock_nr; i++) {
+		struct memblock_region *reg = &hyp_memory[i];
+
+		if (start < reg->base) {
+			is_memory = false;
+			ret = kvm_pgtable_walk(pgt, start, reg->base - start, &walker);
+			if (ret)
+				goto out_unlock;
+		}
+
+		is_memory = true;
+		ret = kvm_pgtable_walk(pgt, reg->base, reg->size, &walker);
+		if (ret)
+			goto out_unlock;
+
+		start = reg->base + reg->size;
+	}
+
+	if (start < BIT(pgt->ia_bits)) {
+		is_memory = false;
+		ret = kvm_pgtable_walk(pgt, start, BIT(pgt->ia_bits) - start, &walker);
+		if (ret)
+			goto out_unlock;
+	}
+
+	pkvm_idmap_initialized = true;
+
+out_unlock:
+	hyp_spin_unlock(&host_mmu.lock);
+	return ret;
+}
+
+int pkvm_iommu_init(void)
+{
+	int ret;
+
+	/* Keep DMA isolation optional. */
+	if (!pkvm_iommu_ops || !pkvm_iommu_ops->init ||
+	    !pkvm_iommu_ops->host_stage2_idmap)
+		return 0;
+
+	ret = pkvm_iommu_ops->init();
+	if (ret)
+		return ret;
+
+	return WARN_ON(pkvm_iommu_snapshot_host_stage2());
+}
+
+int pkvm_iommu_host_stage2_idmap(phys_addr_t start, phys_addr_t end,
+				 enum kvm_pgtable_prot prot)
+{
+	hyp_assert_lock_held(&host_mmu.lock);
+
+	if (!pkvm_idmap_initialized)
+		return 0;
+
+	return pkvm_iommu_ops->host_stage2_idmap(start, end, pkvm_to_iommu_prot(prot));
 }
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 75d250ca809c..c14af6a4877c 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -17,6 +17,7 @@
 
 #include <nvhe/arm-smccc.h>
 #include <nvhe/gfp.h>
+#include <nvhe/iommu.h>
 #include <nvhe/memory.h>
 #include <nvhe/mem_protect.h>
 #include <nvhe/mm.h>
@@ -611,16 +612,15 @@ static int host_stage2_set_owner_metadata_locked(phys_addr_t addr, u64 size,
 	ret = host_stage2_try(kvm_pgtable_stage2_annotate, &host_mmu.pgt,
 			      addr, size, &host_s2_pool,
 			      KVM_HOST_INVALID_PTE_TYPE_DONATION, annotation);
-	if (!ret) {
-		/*
-		 * After stage2 maintenance has happened, but before the page
-		 * owner has changed.
-		 */
-		pkvm_sme_dvmsync_fw_call();
-		__host_update_page_state(addr, size, PKVM_NOPAGE);
-	}
-
-	return ret;
+	if (ret)
+		return ret;
+	/*
+	 * After stage2 maintenance has happened, but before the page
+	 * owner has changed.
+	 */
+	pkvm_sme_dvmsync_fw_call();
+	__host_update_page_state(addr, size, PKVM_NOPAGE);
+	return WARN_ON(pkvm_iommu_host_stage2_idmap(addr, addr + size, 0));
 }
 
 int host_stage2_set_owner_locked(phys_addr_t addr, u64 size, u8 owner_id)
@@ -633,8 +633,10 @@ int host_stage2_set_owner_locked(phys_addr_t addr, u64 size, u8 owner_id)
 			return -EPERM;
 
 		ret = host_stage2_idmap_locked(addr, size, PKVM_HOST_MEM_PROT);
-		if (!ret)
-			__host_update_page_state(addr, size, PKVM_PAGE_OWNED);
+		if (ret)
+			break;
+		__host_update_page_state(addr, size, PKVM_PAGE_OWNED);
+		ret = WARN_ON(pkvm_iommu_host_stage2_idmap(addr, addr + size, PKVM_HOST_MEM_PROT));
 		break;
 	case PKVM_ID_HYP:
 		ret = host_stage2_set_owner_metadata_locked(addr, size,
@@ -1049,6 +1051,7 @@ int __pkvm_guest_share_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn)
 				       pkvm_mkstate(KVM_PGTABLE_PROT_RWX, PKVM_PAGE_SHARED_OWNED),
 				       &vcpu->vcpu.arch.pkvm_memcache, 0));
 	WARN_ON(__host_set_page_state_range(phys, PAGE_SIZE, PKVM_PAGE_SHARED_BORROWED));
+	WARN_ON(pkvm_iommu_host_stage2_idmap(phys, phys + PAGE_SIZE, PKVM_HOST_MEM_PROT));
 unlock:
 	guest_unlock_component(vm);
 	host_unlock_component();
-- 
2.56.0.176.g3575e65682-goog


