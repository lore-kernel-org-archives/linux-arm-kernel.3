Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D60C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 19:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w5NjQFK3LMXVck/2I61WHnYSFTQfZupDj7jJwxA50Fo=; b=U2VJ+aXinO+0ZCEFwRZI483Sy+
	nKyLTFzgzJS3gsPXfUaAaP7Ai4eHtS0BNYa0etltri4pVoBuu0JgVMouq7EpbIvB6NfCe1HV2OOlM
	l7oM19O88VAuzc30M3jTDAzUTIvi5dVU5YrNPdSA3sFe0EYJh3LEV+qjp7eWFInVthGALA2aIrJHz
	88Xm3DL5dAgbAaQP7sUh8XeYeBLmwz2EwrVgRW9kOuklQogY8Ns1OOrN9aAFuD2qRuu1UhzISATbo
	NkRwm67CRr9yGNK8Gbag3Sv3rvcs8VxqDXmQmOAs+8MyRjsMmaG0KPVSuHkRsN+5Cdd45YArXUCrx
	QfSo0qIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugTij-0000000FHt8-2h8b;
	Mon, 28 Jul 2025 19:41:13 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugS2l-0000000F8vg-19p5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 17:53:48 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4560f28b2b1so15170625e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 10:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753725225; x=1754330025; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=w5NjQFK3LMXVck/2I61WHnYSFTQfZupDj7jJwxA50Fo=;
        b=kd2nqaS+yu8uVcOUISaq8htUgvkOtJM+mcwpE2CVASZD3DC3XDNwtOZPLp7SKdyvhZ
         F92Gh7Hkx5xVDQB6d4NOgkENnKHi+kRHEUtMjlNb90CEC7zr7Vn10oU1qHvQD7lDz5c4
         YYMLRGcdo3guvfw56LcdVAcsChYrCMk4RIznEQu7zspfwPMYN14tz/pT/LhBZVLauAtG
         c0jMBKcYc85uRLuTwIA3WrVNiS9p7f8c99Zylz+U25GpLazSVLsCJ8jvUyWcqzW9eDtn
         gTBszWbT1j9VVFuOrJk3xhEV3IKbbS2zyRmjdumB6JDOb4+xT8TerYf1spW9UBYy3DZJ
         uXJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753725225; x=1754330025;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w5NjQFK3LMXVck/2I61WHnYSFTQfZupDj7jJwxA50Fo=;
        b=Y0tW5dKVtGQsibkFGSS3wmY8iWE7QiZYI8+eHtufNFMtffMHhlQDLFpWEUhu5FGgxp
         812tdIQxM2g3eAZAXpQ8AcVa019D+QtrGxA3u7J1rD6QmHpaNAEAsBQORvmd87txO6cv
         FKAFj+vesUpJeI3avvUeAMYDQk2icG2ttou7rkC83+sfe4W7osMZOoNGmBxqCbfvQDOv
         L9cP8lYPRQVd2PFev2oEMl9bNitk8SjBx1GPEFcf1+m8VYXegVgDwnm84bnnxNPlAVj+
         Tl1p81ytW0XrJ0dbMHWI2VCo6lUw+Q9siqHRtkBZFOCsva5KY7lG+C6vLHPtav54q2ju
         e06Q==
X-Forwarded-Encrypted: i=1; AJvYcCVihLqn28qi0PFJSdF7SCzKSRGgmvF9ult7kh8smTtvUxA7yEP5WKkX1PNQH1YTjwJhcqDPzQAfjCMMfjdElAik@lists.infradead.org
X-Gm-Message-State: AOJu0YywaRgjMROcBEOR+KnxyoqTNmaBa4NlzwdDMNObHXiHNRcq/q+V
	RgBiWi3VIsdCtI20W0nI7ct3dDcs0uL6bzS5UKIZoAGeHqjxzxGdLwPAVAMz2zpkZnRqSvO4K4/
	R4NjjLGv0OneqMQ==
X-Google-Smtp-Source: AGHT+IHSNClQJxjKWyMtSeRnDi1Da1nWZxQp6Vl0HzgxR6hexmbhiCv9Lfo4JnhcLL7nQ3Uw/6o6Ifnro2r7Kg==
X-Received: from wmsr20.prod.google.com ([2002:a05:600c:8b14:b0:454:d702:f3c2])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e0a:b0:456:fc1:c26d with SMTP id 5b1f17b1804b1-4587dae0f88mr78273155e9.2.1753725225522;
 Mon, 28 Jul 2025 10:53:45 -0700 (PDT)
Date: Mon, 28 Jul 2025 17:53:02 +0000
In-Reply-To: <20250728175316.3706196-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250728175316.3706196-1-smostafa@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250728175316.3706196-16-smostafa@google.com>
Subject: [PATCH v3 15/29] KVM: arm64: iommu: Shadow host stage-2 page table
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
X-CRM114-CacheID: sfid-20250728_105347_323917_2184760E 
X-CRM114-Status: GOOD (  23.24  )
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
2.50.1.552.g942d659e1b-goog


