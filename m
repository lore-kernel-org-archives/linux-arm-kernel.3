Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA36CEBF8D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 18:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=86k/mgvI8zrVMpw0/0P0jY4VXuRBlWrQXsQcBMGtbfo=; b=UuVo1vYOTwc7L1pG6mY2IWeMVo
	+waIRSRg2Zv3dXd5e5N6w/Lm8bIT1acfnFE6mtGfnYMlaeGsWO5IvLp59IsF+FszP0hCxjvLntAjn
	kT/z15touCXeLtBlyJjFLhG8eRZSTOvbKAedeAiqaEGOm4Q9HNCpt9aZTv6u+8Xz/zw7fz/SolpBT
	GAGQzodNAltmwsLXs6Z+8wP0sDtzvnduRXjQvGvhFJs+N0RWoek2kfbusanJNjZnvwZTWfr1Vpv7T
	l79y7tWhovqtMFwJV2DFsEFu/Q5o10t9UgdX3AzhtqW+rpD+TyI8k6vvKubv/sVkUCSPqu7mLnKtn
	i/K99wtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4HU-0000000Gdin-31Sa;
	Mon, 17 Nov 2025 18:48:52 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4HF-0000000GdRu-2BWP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 18:48:38 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4779edba8f3so10939325e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 10:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763405315; x=1764010115; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=86k/mgvI8zrVMpw0/0P0jY4VXuRBlWrQXsQcBMGtbfo=;
        b=BhPYJn2oxF3P31Md3FP6P11Lc7DIETc6jBWOd8VWOPXIiIvmmX/NpH8zQg0YRc6T+l
         jdPhTnnnyw/ZNPClnsgiW1lnwUFY7ZQT4vd/Zwp/b1FVIeG/k7Lz1XIeWfkoE66zLNXz
         C9Az1RCPrnTXjGCoYfp6RQKRAkaLd2v7JyCfwLQFk9YOIGugPqrSGzozWGcAGKoo2E+W
         guWmkT0YPvYzfuomGTl5dg1pKVuaj0qR37UPwjTfz3Oyi0v1wmQMxusAMcNCKp8vSG+B
         TEjcPaWzey9iEoklmDkZZ6P71ONvFaV3L+bRXkAl/Kf7yocPoO/oQYNDZjrlYqtnnq3J
         cCNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763405315; x=1764010115;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=86k/mgvI8zrVMpw0/0P0jY4VXuRBlWrQXsQcBMGtbfo=;
        b=qDJxzxA8vzgZDjKlqyRT7LU3wA9/2C1xxyQpNonMdMoJKBwEqz10oxipL+sCWHnYq9
         2hKxf2KFr+m6KUz0k6yTrWAAfP81QIwvB+c0RwDFkWIFTR1l6eLxfwnDxro9my8/Q1Po
         OtpWBJNveerh7xsLBoEp6u0AQRifeWRxtkZf2rZ3Uu1qPCk76Mv3TgaQRT+mda4GOhF9
         zNClZEsxzm5KwG4kez12UPrsVF4TdFGtMJs1GrUZsZQ5nT5NzrQCrrt+EZk8wQNWOASH
         GoM4/QOzuY7dPQ6HZxvBRXhwGi4dWQujo8QxOIrMKgbh2IIf++J1U36ofh3cojuWXcjV
         r6zA==
X-Gm-Message-State: AOJu0YwDu3/pm75gQGhALiOj9BEhK79zTgNePlcfysZDAAoIZX6YM57d
	NH9RXsvm9MjKof2NXlkBj6GfpEPPW0bzMSfxXq5WvVOSWnLuTbZcjxROI5CapOMQ7crKM9T+ezH
	2nQAB/d/F43lBMKF80G3WLqtDc5n+95lpFMSCdRSQPWCyd7ipyn8irUdQeurI0sSzmXPMM6jmdc
	e+zKN/LtG6mVkx40qibpRqc/9XkJK/5R/GMbX5w4FN6y9wa1S1ARVxUjAMaSNQTGTP6A==
X-Google-Smtp-Source: AGHT+IEj4z2+t+yDF5un/88u8JO0bKDq8uupoiOB9c833JgKVOtSjewqPTAdRZkxIX1uyr5HoS4xTfM/25eAYQ==
X-Received: from wmbz8.prod.google.com ([2002:a05:600c:c088:b0:475:df4b:95a9])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4753:b0:477:333a:f71f with SMTP id 5b1f17b1804b1-4778fe60658mr132994865e9.17.1763405315623;
 Mon, 17 Nov 2025 10:48:35 -0800 (PST)
Date: Mon, 17 Nov 2025 18:47:56 +0000
In-Reply-To: <20251117184815.1027271-1-smostafa@google.com>
Mime-Version: 1.0
References: <20251117184815.1027271-1-smostafa@google.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251117184815.1027271-10-smostafa@google.com>
Subject: [PATCH v5 09/27] KVM: arm64: iommu: Shadow host stage-2 page table
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org, jgg@ziepe.ca, 
	praan@google.com, danielmentz@google.com, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_104837_596066_A9D7922E 
X-CRM114-Status: GOOD (  22.83  )
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
index a01c036c55be..414bd4c97690 100644
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
+	int prot = IOMMU_READ | IOMMU_WRITE;
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
+	kvm_idmap_initialized = !ret;
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
index c3eac0da7cbe..f60acfb868d0 100644
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
2.52.0.rc1.455.g30608eb744-goog


