Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E90C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 15:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uct3Ludpq24IkXvn9l1jjsC5bWb0ebUeANTGai6zz7w=; b=oJFdMne8335OC6eVgxNSY+TXBd
	Y1ZnzvxJjrPLlvJx3z8OtN2KFc+FmqX0KrOt9vcYBHWZ4AWCjix9B6RQzF6xVFowBH3J200YTYW4/
	mo0rbm2J5RoIwxJX05TesVDTnR2stopcZqhhuJhNgCtSdxcQctzwmh+81kTDDLvWLX/HPpnnGvzID
	0UF18OrTxaqLo0dg39FC6w1esFKQzK7NXa5iOQ5iWjUasEWxUuU76Ouvt2aoyxehIkngWNitynsYK
	wlzqed15JUgUfpP1CLcHtaWfe1XRu4fUKknQ4bJ6HWwkY8VQYniXaUIowKjcys19kUTIW+AIkAC9s
	UMdCiZuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90Jd-00000005SYu-3mXH;
	Tue, 22 Sep 2026 13:13:45 +0000
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90J8-00000005S7Y-1eAn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 13:13:15 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-49d0ae342b9so29875845e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 06:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790082792; x=1790687592; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uct3Ludpq24IkXvn9l1jjsC5bWb0ebUeANTGai6zz7w=;
        b=TbDtYsLo1Yn0A+LTMSdjqfqbt82MOMofCZbghGFWiLFnUgHRxmtzyn81PHKl7AEr8z
         FDH1mAWmc/8RKRkVYzHBbuyan8F6SazPP4208WL4zMooalFKVYUKxXVh9HsOsmWDY5tk
         qqd8it6VZtu8c7ip7FiyADTVtKIvHdJaUQaiiBw4gAbrUytUDmNWlISRsBXXTvK4NVfJ
         5t4ODHrsf5f+wC3eVO56UQ8ZFhjpUERHU13p7SijBKiTNGEjAeLUhHhPXbh2B4ckzVMp
         lN+wksFSfL6NeVeV/Kdnqw/GCXebjvPennEdfl+KMT2GjKkz/1EV2/L6COhgxsYGhx+J
         0xlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790082792; x=1790687592;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uct3Ludpq24IkXvn9l1jjsC5bWb0ebUeANTGai6zz7w=;
        b=XSGV9TWzZKN2Yv1Phscn5wNrhWcIP2SpcDMlk5lvZGuq/+bk2PwAPc0Y1US4f5NJyb
         URn7YExTDNmOzT+MjRtX9YPDYr0XzUPaum+ABdn1oqOngfXjCV+hQRkMHjbqR/AQDK6M
         Nd1VJWrE5y4i6OUAhcdzmsC4DSSEJFDPInb7DeLvfxHGCvRNlZUJAgVruyLiFzWII8fP
         i45IOGFjHPSR+Fqw7467TfpPAoKADOY+aIeirQlQAfB71+MX5yrvNEhXdIOrQsxdRrQM
         Sh1BXJcbhdUDkB0Bq/LpUEebzQszs1lXW7riCkbUe5yU2HoNUjzmHx89Gi2zYwVstcXj
         Y/FA==
X-Gm-Message-State: AFuF++nHxFvvDSR0tPOs/phAnFctXrqsd8EV7LxcTmBoZOqz6OYh0hiv
	s5XLxcjeM+utzO3BQib2QS37MhtFsVWFOvGBQZ3w99xzOO6qaClmFj7x/DzOJpQyrlc1XisaT7R
	zEWYk/UCsTnppRHR6jW1MnUcCX35q/zpPz/vFFZtqLfKBb/jZvO5sFSnD+4xbnGfCJ42TGGnSjV
	5bwNbM0YXBLK7yqnEk8EDyFKdHhUzveEoh8YcYfwAiB8D6TPQVqdRGOrNiOxmiWlaMMA==
X-Received: from wmix24-n1.prod.google.com ([2002:a05:600c:e558:10b0:49e:6019:d6a])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a0a:b0:49e:84bf:6110 with SMTP id 5b1f17b1804b1-49fc56dbb49mr208095955e9.6.1790082791905;
 Tue, 22 Sep 2026 06:13:11 -0700 (PDT)
Date: Tue, 22 Sep 2026 13:12:41 +0000
In-Reply-To: <20260922131259.2975334-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260922131259.2975334-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922131259.2975334-9-smostafa@google.com>
Subject: [PATCH v8 08/25] KVM: arm64: iommu: Add memory pool
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
X-CRM114-CacheID: sfid-20260922_061314_495783_D0DF8C76 
X-CRM114-Status: GOOD (  28.82  )
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

IOMMU drivers need to allocate memory for the shadow page table.
Similar to the host stage-2 CPU page table, the IOMMU pool
is allocated early from the carveout and its memory is added to
a pool which the IOMMU driver can allocate from and reclaim to at
run time.

As this is too early for drivers to use initcalls, the number of
pages allocated is set from command line "kvm-arm.iommu_pgt_mem".

Later when the driver registers, it will pass how many pages it
needs, and if it was more than what was allocated, it will fail
to register.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../admin-guide/kernel-parameters.txt         |  5 +++
 arch/arm64/include/asm/kvm_host.h             |  3 +-
 arch/arm64/kvm/hyp/include/nvhe/iommu.h       |  8 +++-
 arch/arm64/kvm/hyp/nvhe/iommu.c               | 21 +++++++++-
 arch/arm64/kvm/hyp/nvhe/setup.c               | 11 ++++-
 arch/arm64/kvm/iommu.c                        | 41 ++++++++++++++++++-
 arch/arm64/kvm/pkvm.c                         |  1 +
 7 files changed, 85 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 33cd30996e47..408a1f431782 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3240,6 +3240,11 @@ Kernel parameters
 			max_snp_asid == min_sev_asid-1, will effectively make
 			SEV-ES unusable.
 
+	kvm-arm.iommu_pgt_mem=nn[KMG]
+			[KVM,ARM,EARLY]
+			Memory allocated for the IOMMU pool from the KVM carveout
+			when running in protected mode (See kvm-arm.mode=).
+
 	kvm-arm.mode=
 			[KVM,ARM,EARLY] Select one of KVM/arm64's modes of
 			operation.
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 7ba7d384889e..743d812e8ee0 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1719,7 +1719,8 @@ long kvm_get_cap_for_kvm_ioctl(unsigned int ioctl, long *ext);
 
 #ifndef __KVM_NVHE_HYPERVISOR__
 struct pkvm_iommu_ops;
-int pkvm_iommu_register_driver(struct pkvm_iommu_ops *hyp_ops);
+int pkvm_iommu_register_driver(struct pkvm_iommu_ops *hyp_ops, unsigned int nr_pages);
+unsigned int pkvm_iommu_pages(void);
 #endif
 
 #endif /* __ARM64_KVM_HOST_H__ */
diff --git a/arch/arm64/kvm/hyp/include/nvhe/iommu.h b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
index 2e35ec01c75d..1fa728ab47d4 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/iommu.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
@@ -9,8 +9,14 @@ struct pkvm_iommu_ops {
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
index 3637b0327d9e..cacab0dc462a 100644
--- a/arch/arm64/kvm/hyp/nvhe/iommu.c
+++ b/arch/arm64/kvm/hyp/nvhe/iommu.c
@@ -16,6 +16,7 @@ struct pkvm_iommu_ops *pkvm_iommu_ops;
 
 /* Protected by host_mmu.lock */
 static bool pkvm_idmap_initialized;
+static struct hyp_pool iommu_pages_pool;
 
 static inline int pkvm_to_iommu_prot(enum kvm_pgtable_prot prot)
 {
@@ -113,7 +114,7 @@ static int pkvm_iommu_snapshot_host_stage2(void)
 	return ret;
 }
 
-int pkvm_iommu_init(void)
+int pkvm_iommu_init(void *pool_base, unsigned int nr_pages)
 {
 	int ret;
 
@@ -122,6 +123,14 @@ int pkvm_iommu_init(void)
 	    !pkvm_iommu_ops->host_stage2_idmap)
 		return 0;
 
+	if (!nr_pages)
+		return -ENOMEM;
+
+	ret = hyp_pool_init(&iommu_pages_pool, hyp_virt_to_pfn(pool_base),
+			    nr_pages, 0);
+	if (ret)
+		return ret;
+
 	ret = pkvm_iommu_ops->init();
 	if (ret)
 		return ret;
@@ -139,3 +148,13 @@ int pkvm_iommu_host_stage2_idmap(phys_addr_t start, phys_addr_t end,
 
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
index 9607d1b18a88..7ce1fc2232da 100644
--- a/arch/arm64/kvm/hyp/nvhe/setup.c
+++ b/arch/arm64/kvm/hyp/nvhe/setup.c
@@ -22,6 +22,8 @@
 
 unsigned long hyp_nr_cpus;
 
+unsigned int hyp_kvm_iommu_pages;
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
 
+	if (hyp_kvm_iommu_pages) {
+		iommu_base = hyp_early_alloc_contig(hyp_kvm_iommu_pages);
+		if (!iommu_base)
+			return -ENOMEM;
+	}
+
 	return 0;
 }
 
@@ -334,7 +343,7 @@ void __noreturn __pkvm_init_finalise(void)
 	 * resources that would be leaked if the hypervisor fails after as there
 	 * is no remove_iommu_driver() at the moment.
 	 */
-	ret = pkvm_iommu_init();
+	ret = pkvm_iommu_init(iommu_base, hyp_kvm_iommu_pages);
 	if (ret)
 		goto out;
 
diff --git a/arch/arm64/kvm/iommu.c b/arch/arm64/kvm/iommu.c
index 30a3862e93d7..f008f68eee40 100644
--- a/arch/arm64/kvm/iommu.c
+++ b/arch/arm64/kvm/iommu.c
@@ -7,10 +7,11 @@
 #include <linux/kvm_host.h>
 
 extern struct pkvm_iommu_ops *kvm_nvhe_sym(pkvm_iommu_ops);
+extern unsigned int kvm_nvhe_sym(hyp_kvm_iommu_pages);
 
 static DEFINE_MUTEX(pkvm_iommu_reg_lock);
 
-int pkvm_iommu_register_driver(struct pkvm_iommu_ops *hyp_ops)
+int pkvm_iommu_register_driver(struct pkvm_iommu_ops *hyp_ops, unsigned int nr_pages)
 {
 	guard(mutex)(&pkvm_iommu_reg_lock);
 
@@ -20,6 +21,44 @@ int pkvm_iommu_register_driver(struct pkvm_iommu_ops *hyp_ops)
 	if (kvm_nvhe_sym(pkvm_iommu_ops))
 		return -EBUSY;
 
+	/* See pkvm_iommu_pages() */
+	if (nr_pages > kvm_nvhe_sym(hyp_kvm_iommu_pages)) {
+		kvm_err("IOMMU pool needs 0x%x pages, check kvm-arm.iommu_pgt_mem\n", nr_pages);
+		return -ENOMEM;
+	}
+
 	kvm_nvhe_sym(pkvm_iommu_ops) = hyp_ops;
 	return 0;
 }
+
+unsigned int pkvm_iommu_pages(void)
+{
+	/*
+	 * This is used very early during setup_arch() before any initcalls
+	 * or any drivers are registered.
+	 * This value is set by a command line option.
+	 * Later, when the driver is registered, it will pass the number
+	 * pages needed for it's page tables, if it was more than what
+	 * the system has already allocated, it will fail registration.
+	 */
+	return kvm_nvhe_sym(hyp_kvm_iommu_pages);
+}
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
+	if (requested_size > UINT_MAX) {
+		kvm_err("kvm-arm.iommu_pgt_mem is too large\n");
+		return -EINVAL;
+	}
+
+	kvm_nvhe_sym(hyp_kvm_iommu_pages) = DIV_ROUND_UP(requested_size, PAGE_SIZE);
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
2.55.0.1082.g2b9226bbc0-goog


