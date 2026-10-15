Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD39CCA466
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 20:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uPXk62xgLV+hWiazYa3Dt6SbhQEq4OxwLitgfdTfwW4=; b=EZuRIeKj4l5PZj+GKsmL2QBFd5
	QVxeJtU3gb0EdGCzfJjapaOiOopskFUskEiEsjYLXlT63I8pcSnK0xXw3slxrIMaJtlGkISjW0uCJ
	nViAgkot/uLpxQAW02Er9m5E5nnn9eAyhvdslAUGkPv8D4o/wtgTKWbnX5Cppr6468LsLAKIjqU0n
	C5PNyIznR3TT36kpjzS3eEtizo4sDHPCdFHd6aVTcpwXhqHVHlrCkfybRgDmeQCf820VCx7erK3bh
	t9Bn+RVJxLRxPOuVjv5WvFYfKTt+gIXsBmshP3W52x/qTh2si7UHcARUOz1zEe2xPcs+NAep1Oj05
	PNQRU7ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRli-00000001IK1-3XOA;
	Thu, 15 Oct 2026 20:09:38 +0000
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRlS-00000001I27-2JEr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 20:09:24 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-4a019d53f46so19496125e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 13:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792094960; x=1792699760; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uPXk62xgLV+hWiazYa3Dt6SbhQEq4OxwLitgfdTfwW4=;
        b=GDmGPbXQnL1kjEU1/3pwMdcKFaKUXyD8YMAomUNeK8IaUWpNGgxnxQaXFKlIecQ9+A
         +ljubagML06ivqjNuxKUDfgx5RInVd+5URAJm+IDzpbzgGKXSrtIY4Gl3U9fL45h/8Nq
         rtF0cD68Nrx2EOQFBWzDqFr3rPSxT1B9HQpqjeVwpRBWLpiobqu/iirrhWfoSTiUCJQi
         /u/jlT0gsT6uTW2VUe6Ov5RytBZ8fXBNHrJNEzT0Am/+DKPGB77G64INUemC6p3VNrd1
         zE3X49zH6Ywk09t8wQSHAeHMFaUkHaTj0wm7fTXREpExLN0opfBY5685ziCIS+1iQya1
         SYtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792094960; x=1792699760;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uPXk62xgLV+hWiazYa3Dt6SbhQEq4OxwLitgfdTfwW4=;
        b=bzkXElsCPfwoUboqsWvJtYz41D4sDqqiuIp/ZLBPCOn59rWOh2A3PNdhARobIhCvTo
         I3j9C2BUFL7a/If0PV3FOMmnPQBmFBM9TCtSDyhpd1wVqR3I/gnt6Ca/cT6tMDJSFLCA
         0Rm5hYVE+Qm0Sx8rUfBSJwVRqpRkqKHZAWaTgeW0pa1dzpEpDQytvrDN2Tc8jyhK6Neu
         VPlTqfAg3sZHZPB6bNAFEmk+dRsFSZGhajG62bzm0Zs8WTgD0XT/GGcuPfKUZWIYjoEG
         wNx3qmONP0nOH3YE6kDoErG+1PGo/Cq0lvxfx0Y7veICw4Iel5eI6NomvKHMdDLdqFMp
         dzIw==
X-Gm-Message-State: AFq9FYK6OOAPtW7WlAATJ6pMkH0g64+wBt0pmX/i3yve+NxlN6q8Lg1+
	lBMfANxHrb9kMy+IfH5ee4/1uHXPFOA/5esaNSCjMxIEjsEXbZ+gJeHHB750tFDX/144KcDHC0S
	Shes/6OvbTw7meMXYdfnRIznLYdVonmmjudQC4BgbhetA4ZsEla/uHR3Xxv6VHBzJYI4HGGCFgc
	ybkIP05F7dXf2StzZOnvQrzvE7dHfKT7+dREmEQGeEtV3YIJbLIAl9I0YsyMJt2/NNtw==
X-Received: from wmjt9.prod.google.com ([2002:a7b:c3c9:0:b0:4a1:7dc3:5e6b])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5251:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4a18e4d5a01mr408073195e9.32.1792094960196;
 Thu, 15 Oct 2026 13:09:20 -0700 (PDT)
Date: Thu, 15 Oct 2026 20:08:39 +0000
In-Reply-To: <20261015200903.2735565-1-smostafa@google.com>
Mime-Version: 1.0
References: <20261015200903.2735565-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261015200903.2735565-9-smostafa@google.com>
Subject: [PATCH v9 08/25] KVM: arm64: iommu: Add memory pool
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
X-CRM114-CacheID: sfid-20261015_130922_682023_3F1D866C 
X-CRM114-Status: GOOD (  29.63  )
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

IOMMU drivers need memory for the shadow page table. As with the host
stage-2 CPU page table, reserve it early from the pKVM carveout and
add it to a hyp_pool that the IOMMU driver allocates from and frees to
at run time. The pool is fixed for the lifetime of the hypervisor.

The carveout is reserved before any driver registers, so the pool size
comes from the kernel command line, "kvm-arm.iommu_pgt_mem". When the
driver registers it passes the number of pages it needs: if that is
more than what was reserved, registration fails and pKVM runs without
DMA isolation. Otherwise the driver gets the whole reserved pool, not
only what it asked for.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../admin-guide/kernel-parameters.txt         |  7 ++++
 arch/arm64/include/asm/kvm_host.h             |  3 +-
 arch/arm64/include/asm/kvm_pkvm.h             | 10 ++++++
 arch/arm64/kvm/hyp/include/nvhe/iommu.h       |  8 ++++-
 arch/arm64/kvm/hyp/nvhe/iommu.c               | 19 +++++++++-
 arch/arm64/kvm/hyp/nvhe/setup.c               | 11 +++++-
 arch/arm64/kvm/iommu.c                        | 35 ++++++++++++++++++-
 arch/arm64/kvm/pkvm.c                         |  1 +
 8 files changed, 89 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index e75344f4e0cd..96b4151f31c1 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3243,6 +3243,13 @@ Kernel parameters
 			max_snp_asid == min_sev_asid-1, will effectively make
 			SEV-ES unusable.
 
+	kvm-arm.iommu_pgt_mem=nn[KMG]
+			[KVM,ARM,EARLY]
+			Memory allocated for the IOMMU pool from the KVM carveout
+			when running in protected mode (See kvm-arm.mode=). If
+			unset or smaller than the IOMMU driver requires, the driver
+			fails to register and pKVM runs without DMA isolation.
+
 	kvm-arm.mode=
 			[KVM,ARM,EARLY] Select one of KVM/arm64's modes of
 			operation.
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 0c7fb6fa24f5..253b4bd1f421 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1721,7 +1721,8 @@ struct pkvm_iommu_ops;
 extern struct pkvm_iommu_ops *kvm_nvhe_sym(pkvm_iommu_ops);
 
 #ifndef __KVM_NVHE_HYPERVISOR__
-int __init pkvm_iommu_register_driver(struct pkvm_iommu_ops *hyp_ops);
+int __init pkvm_iommu_register_driver(struct pkvm_iommu_ops *hyp_ops,
+				      unsigned int nr_pages);
 #endif
 
 #endif /* __ARM64_KVM_HOST_H__ */
diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index cad60569f061..6027c7280e07 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -73,6 +73,7 @@ static inline bool kvm_pkvm_ioctl_allowed(struct kvm *kvm, unsigned int ioctl)
 
 extern struct memblock_region kvm_nvhe_sym(hyp_memory)[];
 extern unsigned int kvm_nvhe_sym(hyp_memblock_nr);
+extern unsigned int kvm_nvhe_sym(hyp_iommu_pages);
 
 static inline unsigned long
 hyp_vmemmap_memblock_size(struct memblock_region *reg, size_t vmemmap_entry_size)
@@ -185,6 +186,15 @@ static inline unsigned long hyp_ffa_proxy_pages(void)
 	return (2 * KVM_FFA_MBOX_NR_PAGES) + DIV_ROUND_UP(desc_max, PAGE_SIZE);
 }
 
+/*
+ * Set from the kernel command line, as the carveout is reserved before the
+ * IOMMU driver registers. Registration fails if the driver needs more.
+ */
+static inline unsigned int pkvm_iommu_pages(void)
+{
+	return kvm_nvhe_sym(hyp_iommu_pages);
+}
+
 static inline size_t pkvm_host_sve_state_size(void)
 {
 	if (!system_supports_sve())
diff --git a/arch/arm64/kvm/hyp/include/nvhe/iommu.h b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
index 6cbcc9d65b4b..acd5058ef3ed 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/iommu.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
@@ -15,8 +15,14 @@ struct pkvm_iommu_ops {
 	int (*host_stage2_idmap)(phys_addr_t start, phys_addr_t end, int prot);
 };
 
-int pkvm_iommu_init(void);
+int pkvm_iommu_init(void *pool_base, unsigned int nr_pages);
 
 int pkvm_iommu_host_stage2_idmap(phys_addr_t start, phys_addr_t end,
 				 enum kvm_pgtable_prot prot);
+
+/* Allocate pages from the IOMMU carveout, returns zeroed memory. */
+void *pkvm_iommu_alloc_pages(u8 order);
+/* Free pages from pkvm_iommu_alloc_pages(). */
+void pkvm_iommu_free_pages(void *ptr);
+
 #endif /* __ARM64_KVM_NVHE_IOMMU_H__ */
diff --git a/arch/arm64/kvm/hyp/nvhe/iommu.c b/arch/arm64/kvm/hyp/nvhe/iommu.c
index 662b1ed2330f..36432bd46c78 100644
--- a/arch/arm64/kvm/hyp/nvhe/iommu.c
+++ b/arch/arm64/kvm/hyp/nvhe/iommu.c
@@ -14,6 +14,8 @@
 /* Only one set of ops supported */
 struct pkvm_iommu_ops *pkvm_iommu_ops __ro_after_init;
 
+static struct hyp_pool iommu_pages_pool;
+
 /* Protected by host_mmu.lock */
 static bool pkvm_idmap_initialized;
 
@@ -106,7 +108,7 @@ static int pkvm_iommu_snapshot_host_stage2(void)
 	return ret;
 }
 
-int pkvm_iommu_init(void)
+int pkvm_iommu_init(void *pool_base, unsigned int nr_pages)
 {
 	int ret;
 
@@ -115,6 +117,11 @@ int pkvm_iommu_init(void)
 	    !pkvm_iommu_ops->host_stage2_idmap)
 		return 0;
 
+	ret = hyp_pool_init(&iommu_pages_pool, hyp_virt_to_pfn(pool_base),
+			    nr_pages, 0);
+	if (ret)
+		return ret;
+
 	ret = pkvm_iommu_ops->init();
 	if (ret)
 		return ret;
@@ -132,3 +139,13 @@ int pkvm_iommu_host_stage2_idmap(phys_addr_t start, phys_addr_t end,
 
 	return pkvm_iommu_ops->host_stage2_idmap(start, end, pkvm_to_iommu_prot(prot));
 }
+
+void *pkvm_iommu_alloc_pages(u8 order)
+{
+	return hyp_alloc_pages(&iommu_pages_pool, order);
+}
+
+void pkvm_iommu_free_pages(void *ptr)
+{
+	hyp_put_page(&iommu_pages_pool, ptr);
+}
diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
index 620b05c2799a..8259837fb6de 100644
--- a/arch/arm64/kvm/hyp/nvhe/setup.c
+++ b/arch/arm64/kvm/hyp/nvhe/setup.c
@@ -22,6 +22,8 @@
 
 unsigned long hyp_nr_cpus;
 
+unsigned int hyp_iommu_pages __ro_after_init;
+
 #define hyp_percpu_size ((unsigned long)__per_cpu_end - \
 			 (unsigned long)__per_cpu_start)
 
@@ -33,6 +35,7 @@ static void *selftest_base;
 static void *ffa_proxy_pages;
 static struct kvm_pgtable_mm_ops pkvm_pgtable_mm_ops;
 static struct hyp_pool hpool;
+static void *iommu_base;
 
 static int divide_memory_pool(void *virt, unsigned long size)
 {
@@ -70,6 +73,12 @@ static int divide_memory_pool(void *virt, unsigned long size)
 	if (!ffa_proxy_pages)
 		return -ENOMEM;
 
+	if (hyp_iommu_pages) {
+		iommu_base = hyp_early_alloc_contig(hyp_iommu_pages);
+		if (!iommu_base)
+			return -ENOMEM;
+	}
+
 	return 0;
 }
 
@@ -348,7 +357,7 @@ void __noreturn __pkvm_init_finalise(void)
 	 * resources that would be leaked if the hypervisor fails after as there
 	 * is no remove_iommu_driver() at the moment.
 	 */
-	ret = pkvm_iommu_init();
+	ret = pkvm_iommu_init(iommu_base, hyp_iommu_pages);
 	if (ret)
 		goto out;
 
diff --git a/arch/arm64/kvm/iommu.c b/arch/arm64/kvm/iommu.c
index ab3f37d61579..4e81878192a0 100644
--- a/arch/arm64/kvm/iommu.c
+++ b/arch/arm64/kvm/iommu.c
@@ -7,6 +7,7 @@
 #include <linux/kvm_host.h>
 
 #include <asm/kvm_mmu.h>
+#include <asm/kvm_pkvm.h>
 
 static DEFINE_MUTEX(pkvm_iommu_reg_lock);
 
@@ -14,13 +15,16 @@ static DEFINE_MUTEX(pkvm_iommu_reg_lock);
  * pkvm_iommu_register_driver() - Register the hypervisor IOMMU driver
  * @hyp_ops: Kernel address of the ops, which live in the hypervisor image,
  *           i.e. &kvm_nvhe_sym(ops).
+ * @nr_pages: Number of pages the driver needs from the IOMMU pool, see
+ *            kvm-arm.iommu_pgt_mem.
  *
  * Only one driver can be registered. Call from an initcall between
  * core_initcall() and fs_initcall().
  *
  * Return: 0 on success.
  */
-int __init pkvm_iommu_register_driver(struct pkvm_iommu_ops *hyp_ops)
+int __init pkvm_iommu_register_driver(struct pkvm_iommu_ops *hyp_ops,
+				      unsigned int nr_pages)
 {
 	guard(mutex)(&pkvm_iommu_reg_lock);
 
@@ -30,6 +34,35 @@ int __init pkvm_iommu_register_driver(struct pkvm_iommu_ops *hyp_ops)
 	if (kvm_nvhe_sym(pkvm_iommu_ops))
 		return -EBUSY;
 
+	if (!nr_pages)
+		return -EINVAL;
+
+	if (nr_pages > pkvm_iommu_pages()) {
+		kvm_err("IOMMU pool needs kvm-arm.iommu_pgt_mem=%luK or more\n",
+			nr_pages * PAGE_SIZE / SZ_1K);
+		return -ENOMEM;
+	}
+
 	kvm_nvhe_sym(pkvm_iommu_ops) = kern_hyp_va(kvm_ksym_ref(hyp_ops));
 	return 0;
 }
+
+static int __init early_iommu_pgt_mem(char *arg)
+{
+	unsigned long long requested_size;
+
+	if (!arg)
+		return -EINVAL;
+
+	requested_size = memparse(arg, NULL);
+
+	/* hyp_pool_init() computes nr_pages << PAGE_SHIFT in an unsigned int. */
+	if (requested_size > (UINT_MAX & PAGE_MASK)) {
+		kvm_err("kvm-arm.iommu_pgt_mem is too large\n");
+		return -EINVAL;
+	}
+
+	kvm_nvhe_sym(hyp_iommu_pages) = DIV_ROUND_UP(requested_size, PAGE_SIZE);
+	return 0;
+}
+early_param("kvm-arm.iommu_pgt_mem", early_iommu_pgt_mem);
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 8e4c6e4bec12..b6cf01e00f6b 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -63,6 +63,7 @@ void __init kvm_hyp_reserve(void)
 	hyp_mem_pages += hyp_vmemmap_pages(STRUCT_HYP_PAGE_SIZE);
 	hyp_mem_pages += pkvm_selftest_pages();
 	hyp_mem_pages += hyp_ffa_proxy_pages();
+	hyp_mem_pages += pkvm_iommu_pages();
 
 	/*
 	 * Try to allocate a PMD-aligned region to reduce TLB pressure once
-- 
2.56.0.176.g3575e65682-goog


