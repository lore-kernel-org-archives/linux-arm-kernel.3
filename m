Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA440CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 23:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FTW2UGpkj+rMJnUPmb+I3Uc3pZGMzoyVmbU3iR5h6JE=; b=e2ZT8ZLJQnSz9FiPTFuCf6FpmI
	nJjz9EeOZ/lWbYfToBTi4aQqwioaQBlC4WlvXAL+WT9Go/nmO/e2eYxeCH8wEDc3BS0IjylfT0VPd
	oODZe1BFniK7y1Ez3LzSrnJjhDb+tyBxO+eOwhfj3ITofR4FkLVUWY7PJA5TPuiw9CBCIS3XwOhst
	Fohv/1bkCzAUXyzVARzj192VmmnikhQ+fSWvPOEF1LN26QyLSFpA5kHB+ZWU1lrGWleJr+y9m1ywJ
	DP1UbULJOjqbe2whsouaVGhZGUmWm7usXqp3aJC+T8vFDdK1GTR4audI1WRsMw6ccJnpqKDLGS0uI
	kdqQ+Y7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoWBn-0000000BuSV-0GGU;
	Tue, 19 Aug 2025 23:56:27 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoUFv-0000000BfR3-1iPC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 21:52:36 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-45a1b10418aso34340615e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 14:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755640353; x=1756245153; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FTW2UGpkj+rMJnUPmb+I3Uc3pZGMzoyVmbU3iR5h6JE=;
        b=Vlt2T27UbFQ8dOZzhOLTbZIlCa/BqpPU51Mr/4cJY+HG1mUSrENB6oiPOHib8ySEem
         BcPfHAXTIr2PspfJIRxylGj4nDMCjZDoZPUrQwsYN+ddxMtwVAKIb8BLdoYRpEoIoniY
         eqMf61oskDBOmaHOa15hgHdMJ0/nGdn42w2mjvT+CV5yW6x2asJ6q1x+Y0ljNvo+8ixC
         DfZBGMXhGX0Cdv4xV3CDqHLHZIsV4WA5ODE0ryQE8fYA+HxK+O2rEIdhvZZWALtz2ZsS
         JqqkXzOOorxrCpEGu+mDtOsIxFvoEo5n/v91S23IfKOu+Bw++tobx3yQDd0F5F2TY6LB
         Mq9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755640353; x=1756245153;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FTW2UGpkj+rMJnUPmb+I3Uc3pZGMzoyVmbU3iR5h6JE=;
        b=ZHLCbvKMIUfhKi3G2upoEuhGsK0ej2MtgRbNh/5Og3DDbVU80O1IiuSX3mYrn3bFKo
         N+C7AfWRxE1/dUUS/9O09DBnNw/7deHC5s+Z8+lnLUlCvC8+wwexHPXP/cIBAIG8SoBb
         9O4N7en7ybAYM8d38sp6u3NZ67jezJxODnTWW1WzkViF87ZlMUPIo1frnVcMrIvQQ7st
         PqGzQvJnVvaKZW47yQmWCKsbW5Kaov9LdbCOHogypUa8dDPycdaOghcwS4047VBGmmMs
         k90zOgxwxajG1FucmGtKQF5v0dMwJEK8OKjNgLhwv0l3nWy2VRHKTZd92aZ07rwPx0uQ
         jFdw==
X-Forwarded-Encrypted: i=1; AJvYcCUImgBMqjWcMmWGeU6MtflZatqk/F8XsDTkxs4HrU5zmqNNyrwPi+QmE7jBUwxGGCi19LClLrGZJqfsjrpA4zib@lists.infradead.org
X-Gm-Message-State: AOJu0YzPxoRT0C/9IY1mv1cFtywshpU/zn7H40+/VvASNnLzgjNFlvpd
	w5xLDGZwB6GCvQU6olBySg8KHkWKXDX8t4fvzILHr/oDs1IV18ECb2vkt4G9LwOopAeJoE3/er+
	UeG/GxuZ6Wkfe+A==
X-Google-Smtp-Source: AGHT+IFC4f9TFYtJcHeYguMFJJzghlWK9KU6mi0KIys1MVGWduWRRdB37rOMzmuqxanQUm8EohCMZm6hqx7hmQ==
X-Received: from wmpz12.prod.google.com ([2002:a05:600c:a0c:b0:459:de2a:4d58])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:154b:b0:459:dc35:dc05 with SMTP id 5b1f17b1804b1-45b479a393dmr3326805e9.9.1755640353566;
 Tue, 19 Aug 2025 14:52:33 -0700 (PDT)
Date: Tue, 19 Aug 2025 21:51:38 +0000
In-Reply-To: <20250819215156.2494305-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250819215156.2494305-1-smostafa@google.com>
X-Mailer: git-send-email 2.51.0.rc1.167.g924127e9c0-goog
Message-ID: <20250819215156.2494305-11-smostafa@google.com>
Subject: [PATCH v4 10/28] KVM: arm64: iommu: Shadow host stage-2 page table
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, robin.murphy@arm.com, jean-philippe@linaro.org, 
	qperret@google.com, tabba@google.com, jgg@ziepe.ca, mark.rutland@arm.com, 
	praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_145235_447985_CDE3A104 
X-CRM114-Status: GOOD (  23.41  )
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

Create a shadow page table for the IOMMU that shadows the
host CPU stage-2 into the IOMMUs to establish DMA isolation.

An initial snapshot is created after the driver init, then
on every permission change a callback would be called for
the IOMMU driver to update the page table.

For some cases, an SMMUv3 may be able to share the same page
table used with the host CPU stage-2 directly.
However, this is too strict and requires changes to the core hypervisor
page table code, plus it would require the hypervisor to handle IOMMU
page faults. This can be added later as an optimization for SMMUV3.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/iommu.h |  4 ++
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c   | 83 ++++++++++++++++++++++++-
 arch/arm64/kvm/hyp/nvhe/mem_protect.c   |  5 ++
 3 files changed, 90 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/iommu.h b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
index 1ac70cc28a9e..219363045b1c 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/iommu.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
@@ -3,11 +3,15 @@
 #define __ARM64_KVM_NVHE_IOMMU_H__
 
 #include <asm/kvm_host.h>
+#include <asm/kvm_pgtable.h>
 
 struct kvm_iommu_ops {
 	int (*init)(void);
+	void (*host_stage2_idmap)(phys_addr_t start, phys_addr_t end, int prot);
 };
 
 int kvm_iommu_init(void);
 
+void kvm_iommu_host_stage2_idmap(phys_addr_t start, phys_addr_t end,
+				 enum kvm_pgtable_prot prot);
 #endif /* __ARM64_KVM_NVHE_IOMMU_H__ */
diff --git a/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c b/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
index a01c036c55be..f7d1c8feb358 100644
--- a/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
+++ b/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
@@ -4,15 +4,94 @@
  *
  * Copyright (C) 2022 Linaro Ltd.
  */
+#include <linux/iommu.h>
+
 #include <nvhe/iommu.h>
+#include <nvhe/mem_protect.h>
+#include <nvhe/spinlock.h>
 
 /* Only one set of ops supported */
 struct kvm_iommu_ops *kvm_iommu_ops;
 
+/* Protected by host_mmu.lock */
+static bool kvm_idmap_initialized;
+
+static inline int pkvm_to_iommu_prot(enum kvm_pgtable_prot prot)
+{
+	int iommu_prot = 0;
+
+	if (prot & KVM_PGTABLE_PROT_R)
+		iommu_prot |= IOMMU_READ;
+	if (prot & KVM_PGTABLE_PROT_W)
+		iommu_prot |= IOMMU_WRITE;
+	if (prot == PKVM_HOST_MMIO_PROT)
+		iommu_prot |= IOMMU_MMIO;
+
+	/* We don't understand that, might be dangerous. */
+	WARN_ON(prot & ~PKVM_HOST_MEM_PROT);
+	return iommu_prot;
+}
+
+static int __snapshot_host_stage2(const struct kvm_pgtable_visit_ctx *ctx,
+				  enum kvm_pgtable_walk_flags visit)
+{
+	u64 start = ctx->addr;
+	kvm_pte_t pte = *ctx->ptep;
+	u32 level = ctx->level;
+	u64 end = start + kvm_granule_size(level);
+	int prot =  IOMMU_READ | IOMMU_WRITE;
+
+	/* Keep unmapped. */
+	if (pte && !kvm_pte_valid(pte))
+		return 0;
+
+	if (kvm_pte_valid(pte))
+		prot = pkvm_to_iommu_prot(kvm_pgtable_stage2_pte_prot(pte));
+	else if (!addr_is_memory(start))
+		prot |= IOMMU_MMIO;
+
+	kvm_iommu_ops->host_stage2_idmap(start, end, prot);
+	return 0;
+}
+
+static int kvm_iommu_snapshot_host_stage2(void)
+{
+	int ret;
+	struct kvm_pgtable_walker walker = {
+		.cb	= __snapshot_host_stage2,
+		.flags	= KVM_PGTABLE_WALK_LEAF,
+	};
+	struct kvm_pgtable *pgt = &host_mmu.pgt;
+
+	hyp_spin_lock(&host_mmu.lock);
+	ret = kvm_pgtable_walk(pgt, 0, BIT(pgt->ia_bits), &walker);
+	/* Start receiving calls to host_stage2_idmap. */
+	kvm_idmap_initialized = !!ret;
+	hyp_spin_unlock(&host_mmu.lock);
+
+	return ret;
+}
+
 int kvm_iommu_init(void)
 {
-	if (!kvm_iommu_ops || !kvm_iommu_ops->init)
+	int ret;
+
+	if (!kvm_iommu_ops || !kvm_iommu_ops->init ||
+	    !kvm_iommu_ops->host_stage2_idmap)
 		return -ENODEV;
 
-	return kvm_iommu_ops->init();
+	ret = kvm_iommu_ops->init();
+	if (ret)
+		return ret;
+	return kvm_iommu_snapshot_host_stage2();
+}
+
+void kvm_iommu_host_stage2_idmap(phys_addr_t start, phys_addr_t end,
+				 enum kvm_pgtable_prot prot)
+{
+	hyp_assert_lock_held(&host_mmu.lock);
+
+	if (!kvm_idmap_initialized)
+		return;
+	kvm_iommu_ops->host_stage2_idmap(start, end, pkvm_to_iommu_prot(prot));
 }
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index c9a15ef6b18d..bce6690f29c0 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -15,6 +15,7 @@
 #include <hyp/fault.h>
 
 #include <nvhe/gfp.h>
+#include <nvhe/iommu.h>
 #include <nvhe/memory.h>
 #include <nvhe/mem_protect.h>
 #include <nvhe/mm.h>
@@ -529,6 +530,7 @@ static void __host_update_page_state(phys_addr_t addr, u64 size, enum pkvm_page_
 int host_stage2_set_owner_locked(phys_addr_t addr, u64 size, u8 owner_id)
 {
 	int ret;
+	enum kvm_pgtable_prot prot;
 
 	if (!range_is_memory(addr, addr + size))
 		return -EPERM;
@@ -538,6 +540,9 @@ int host_stage2_set_owner_locked(phys_addr_t addr, u64 size, u8 owner_id)
 	if (ret)
 		return ret;
 
+	prot = owner_id == PKVM_ID_HOST ? PKVM_HOST_MEM_PROT : 0;
+	kvm_iommu_host_stage2_idmap(addr, addr + size, prot);
+
 	/* Don't forget to update the vmemmap tracking for the host */
 	if (owner_id == PKVM_ID_HOST)
 		__host_update_page_state(addr, size, PKVM_PAGE_OWNED);
-- 
2.51.0.rc1.167.g924127e9c0-goog


