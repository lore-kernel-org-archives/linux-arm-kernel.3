Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A525CEBF92
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 18:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rk1fl88JutZZYCoKcXxRTtxtyt/5+rf5iGOfbus1BTk=; b=unHUgjgdXV9yYaij9+FMXi8Jol
	e1hra2QrFV32/7xiuWCXtC9jlESxLK5pS0MIlGKzSoi51ciAYGGpWjN1x7KZp/LT7RmuT+M1ojlNT
	TrhugxAUD1tUvaNmI9OMpw+PjygVOO2YTZcp9EmpsFIJWWDo1r2QEg/TrdwqWcjB8ppArU+QLAJoq
	JInIMBYWE6bdaD8VhbcdyYM+MArOGHbLLLDJGbKeHm+n/VRd/pqeCqrLOhzcNjMCBkGoezo1jPexV
	/Eah9Uu749nWH5TGS13sCI6jHZ/1mobs9oob2mPm6Iwa2dUUM3UyfRodzBlcMuySvP0ZC/u/1LyHM
	zwV9do8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4HV-0000000Gdjy-2H7H;
	Mon, 17 Nov 2025 18:48:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4HJ-0000000GdXE-1okA
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 17 Nov 2025 18:48:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Rk1fl88JutZZYCoKcXxRTtxtyt/5+rf5iGOfbus1BTk=; b=lL3eeU//K7NZstrCN97W7h9sE6
	t4/UIKa++14nhdWuWpvc1rl2H6GQzdvJ5QQiMV2L88rr+P8x99DNCf4H9zMQ1tC+c/2WSV61wahRX
	Ulbd5mYOV2fw5kPtkmY2JxRul3c7jpoJ2szuJswd0kbwQWAhKKefSvKuurGUNGMPKsUqZJvDlTPk8
	XCV7L01BB0TLiAQPLp5zcDWGVjrUk52SQgsvGpYh9m8Q7+DZUtVRwt5LUR/DKampG+7Ysvqc7hNmw
	B5P9EfcSotvv00f+5YbpSSjzZEdjNr71PV0sLt/VNSsf0uARVN6jSKV0n8qn2SDEa+bfuHb/aGVoL
	lQhZl2pA==;
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL3Pc-00000007waa-3dmX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 17:53:14 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-b72de28c849so405684666b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 10:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763405316; x=1764010116; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rk1fl88JutZZYCoKcXxRTtxtyt/5+rf5iGOfbus1BTk=;
        b=URzN17MtBrOOd958qS+BLbRjt2JFQde2Pve5lQp1RJuJIlTR1pMRF3vIc8/J36vaLf
         MB+A5kqXRwJrsYX6jpW00/MMbNcd3Ux0jlaGiJY/IeVb2gR9Ev2AxQfqhPqZBoe6awMV
         59CNRCYNKTt0bDua2KDKI6bwzWxxl1DIlVLrO19odzp6ymOhn83AG8Xpr1I0VjKAL/x0
         Gv7dt21kAP/UHz4cr4rMicWE4f7y96Puv/GYMt6xyMziJspV/FvqA7kacVzlqFjpSZF/
         4ParQ4tDeOewc9xgRBkFqilaFLNSfQrUpIe38LMt2GN/9bTPKzSmdyntV1RZ/GwVx/Ms
         idwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763405316; x=1764010116;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rk1fl88JutZZYCoKcXxRTtxtyt/5+rf5iGOfbus1BTk=;
        b=s4DJP3ukpDbjIyrpCbmulAU6Bp3tPXgg4yQ/F13enDc6uvrq0vNCq7lMi8kbL8e640
         q8iyIln+rINZWR1TO4UDPCfhnUiutEkbxb9BPWgSkh2I9tXAFbTe4S5lngApPKHYksW0
         V2e2DGsp99C09x04zyhXmEMWgQ5wYMaQENZGCt93F7lKNO7dC1aIYw27OZ0CGuBPPI0b
         J/MO6/T6hPvyn+GKXNV8O0cXbYfbs2gaM3S6UVUzQqvIvW4geAxUWQjkDVGXqqGSoojs
         VZP7kL3Afu807WJspOcNHTVyPg/DF1U/yvmPIvK4G7yXSjiFFizUtEGG9Exck+uAkVMI
         eCug==
X-Gm-Message-State: AOJu0YyUIZpOOUb7V3odnAncSFSFK3WeivGAoHK0NA9gXv393yt5pP5P
	uDTf+1K/viDBg8YcERw/6vTiE22W7n5ltbtXUJcoH+O9eJV0b0iuIZbN4zAheN7lkLb2uHHJNgy
	JX+cKpA7envzVn/nfTPxfE91JPQJ78H0uXRodcTrmlrjof5j+bAAeC4FfGQnXIGjC9oPnxvxN8d
	AOUowFacftaLdj/KrgoJocsheeDibVUnSTXzDq2M7eqlW+RmHfi51HuIFGW85C809g3g==
X-Google-Smtp-Source: AGHT+IFK6mFtucBRLiWaaV+YANl4dQaIe6ZXNzcjcMCQe/1qsUgD5bMWkFpnXRoT7wZjLhUKC6CSylQU/X+dYw==
X-Received: from ejcvd5.prod.google.com ([2002:a17:907:d205:b0:b73:7a81:20af])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3c82:b0:b73:16fc:d469 with SMTP id a640c23a62f3a-b736793dcdcmr1369485766b.51.1763405316436;
 Mon, 17 Nov 2025 10:48:36 -0800 (PST)
Date: Mon, 17 Nov 2025 18:47:57 +0000
In-Reply-To: <20251117184815.1027271-1-smostafa@google.com>
Mime-Version: 1.0
References: <20251117184815.1027271-1-smostafa@google.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251117184815.1027271-11-smostafa@google.com>
Subject: [PATCH v5 10/27] KVM: arm64: iommu: Add memory pool
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
X-CRM114-CacheID: sfid-20251117_175313_065844_4F18BA45 
X-CRM114-Status: GOOD (  28.49  )
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

IOMMU drivers would require to allocate memory for the shadow page
table. Similar to the host stage-2 CPU page table, the IOMMU pool
is allocated early from the carveout and it's memory is added in
a pool which the IOMMU driver can allocate from and reclaim at
run time.

As this is too early for drivers to use init calls, a default value
can be set in the kernel config through IOMMU_POOL_PAGES, which
then can be overridden later from the kernel command line:
"kvm-arm.hyp_iommu_pages".

Later when the driver registers, it will pass how many pages it
needs, and if it was less than what was allocated, it will fail
to register.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../admin-guide/kernel-parameters.txt         |  4 +++
 arch/arm64/include/asm/kvm_host.h             |  3 +-
 arch/arm64/kvm/Kconfig                        |  7 +++++
 arch/arm64/kvm/hyp/include/nvhe/iommu.h       |  5 ++-
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c         | 20 +++++++++++-
 arch/arm64/kvm/hyp/nvhe/setup.c               | 16 +++++++++-
 arch/arm64/kvm/iommu.c                        | 31 ++++++++++++++++++-
 arch/arm64/kvm/pkvm.c                         |  1 +
 8 files changed, 82 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 6c42061ca20e..f843d10a3dfc 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3059,6 +3059,10 @@
 			trap: set WFI instruction trap
 
 			notrap: clear WFI instruction trap
+	kvm-arm.hyp_iommu_pages=
+			[KVM, ARM, EARLY]
+			Number of pages allocated for the IOMMU pool from the
+			KVM carveout when running in protected mode.
 
 	kvm_cma_resv_ratio=n [PPC,EARLY]
 			Reserves given percentage from system memory area for
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index fb2551ba8798..5496c52d0163 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1654,7 +1654,8 @@ static __always_inline enum fgt_group_id __fgt_reg_to_group_id(enum vcpu_sysreg
 
 #ifndef __KVM_NVHE_HYPERVISOR__
 struct kvm_iommu_ops;
-int kvm_iommu_register_driver(struct kvm_iommu_ops *hyp_ops);
+int kvm_iommu_register_driver(struct kvm_iommu_ops *hyp_ops, size_t pool_pages);
+size_t kvm_iommu_pages(void);
 #endif
 
 #endif /* __ARM64_KVM_HOST_H__ */
diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index 4f803fd1c99a..6a1bd82a0d07 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -83,4 +83,11 @@ config PTDUMP_STAGE2_DEBUGFS
 
 	  If in doubt, say N.
 
+config IOMMU_POOL_PAGES
+	hex "Number of pages reserved for IOMMU pool"
+	depends on KVM && IOMMU_SUPPORT
+	default 0x0
+	help
+	  IOMMU pool is used with protected mode to allocated IOMMU drivers page tables.
+
 endif # VIRTUALIZATION
diff --git a/arch/arm64/kvm/hyp/include/nvhe/iommu.h b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
index 219363045b1c..9f4906c6dcc9 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/iommu.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
@@ -10,8 +10,11 @@ struct kvm_iommu_ops {
 	void (*host_stage2_idmap)(phys_addr_t start, phys_addr_t end, int prot);
 };
 
-int kvm_iommu_init(void);
+int kvm_iommu_init(void *pool_base, size_t nr_pages);
 
 void kvm_iommu_host_stage2_idmap(phys_addr_t start, phys_addr_t end,
 				 enum kvm_pgtable_prot prot);
+void *kvm_iommu_donate_pages(u8 order);
+void kvm_iommu_reclaim_pages(void *ptr);
+
 #endif /* __ARM64_KVM_NVHE_IOMMU_H__ */
diff --git a/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c b/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
index 414bd4c97690..a0df34ecf6b0 100644
--- a/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
+++ b/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
@@ -15,6 +15,7 @@ struct kvm_iommu_ops *kvm_iommu_ops;
 
 /* Protected by host_mmu.lock */
 static bool kvm_idmap_initialized;
+static struct hyp_pool iommu_pages_pool;
 
 static inline int pkvm_to_iommu_prot(enum kvm_pgtable_prot prot)
 {
@@ -72,7 +73,7 @@ static int kvm_iommu_snapshot_host_stage2(void)
 	return ret;
 }
 
-int kvm_iommu_init(void)
+int kvm_iommu_init(void *pool_base, size_t nr_pages)
 {
 	int ret;
 
@@ -80,6 +81,13 @@ int kvm_iommu_init(void)
 	    !kvm_iommu_ops->host_stage2_idmap)
 		return -ENODEV;
 
+	if (nr_pages) {
+		ret = hyp_pool_init(&iommu_pages_pool, hyp_virt_to_pfn(pool_base),
+				    nr_pages, 0);
+		if (ret)
+			return ret;
+	}
+
 	ret = kvm_iommu_ops->init();
 	if (ret)
 		return ret;
@@ -95,3 +103,13 @@ void kvm_iommu_host_stage2_idmap(phys_addr_t start, phys_addr_t end,
 		return;
 	kvm_iommu_ops->host_stage2_idmap(start, end, pkvm_to_iommu_prot(prot));
 }
+
+void *kvm_iommu_donate_pages(u8 order)
+{
+	return hyp_alloc_pages(&iommu_pages_pool, order);
+}
+
+void kvm_iommu_reclaim_pages(void *ptr)
+{
+	hyp_put_page(&iommu_pages_pool, ptr);
+}
diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
index de79803e7439..c245ea88c480 100644
--- a/arch/arm64/kvm/hyp/nvhe/setup.c
+++ b/arch/arm64/kvm/hyp/nvhe/setup.c
@@ -22,6 +22,13 @@
 
 unsigned long hyp_nr_cpus;
 
+/* See kvm_iommu_pages() */
+#ifdef CONFIG_IOMMU_POOL_PAGES
+size_t hyp_kvm_iommu_pages = CONFIG_IOMMU_POOL_PAGES;
+#else
+size_t hyp_kvm_iommu_pages;
+#endif
+
 #define hyp_percpu_size ((unsigned long)__per_cpu_end - \
 			 (unsigned long)__per_cpu_start)
 
@@ -33,6 +40,7 @@ static void *selftest_base;
 static void *ffa_proxy_pages;
 static struct kvm_pgtable_mm_ops pkvm_pgtable_mm_ops;
 static struct hyp_pool hpool;
+static void *iommu_base;
 
 static int divide_memory_pool(void *virt, unsigned long size)
 {
@@ -70,6 +78,12 @@ static int divide_memory_pool(void *virt, unsigned long size)
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
 
@@ -329,7 +343,7 @@ void __noreturn __pkvm_init_finalise(void)
 	if (ret)
 		goto out;
 
-	ret = kvm_iommu_init();
+	ret = kvm_iommu_init(iommu_base, hyp_kvm_iommu_pages);
 	if (ret)
 		goto out;
 
diff --git a/arch/arm64/kvm/iommu.c b/arch/arm64/kvm/iommu.c
index c9041dcb6c57..6143fd3e1de3 100644
--- a/arch/arm64/kvm/iommu.c
+++ b/arch/arm64/kvm/iommu.c
@@ -7,9 +7,38 @@
 #include <linux/kvm_host.h>
 
 extern struct kvm_iommu_ops *kvm_nvhe_sym(kvm_iommu_ops);
+extern size_t kvm_nvhe_sym(hyp_kvm_iommu_pages);
 
-int kvm_iommu_register_driver(struct kvm_iommu_ops *hyp_ops)
+int kvm_iommu_register_driver(struct kvm_iommu_ops *hyp_ops, size_t pool_pages)
 {
+	/* See kvm_iommu_pages() */
+	if (pool_pages > kvm_nvhe_sym(hyp_kvm_iommu_pages)) {
+		kvm_err("Missing memory for the IOMMU pool, need 0x%zx pages, check kvm-arm.hyp_iommu_pages",
+			 pool_pages);
+		return -ENOMEM;
+	}
+
 	kvm_nvhe_sym(kvm_iommu_ops) = hyp_ops;
 	return 0;
 }
+
+size_t kvm_iommu_pages(void)
+{
+	/*
+	 * This is called very early during setup_arch() where no initcalls,
+	 * so this has to call specific functions per each KVM driver.
+	 * So we allow a config option that can set the defaul value for
+	 * the IOMMU pool that can overridden by a command line option.
+	 * When the driver registers it will pass the number pages needed
+	 * for it's page tables, if less that what the system has already
+	 * allocated we fail.
+	 */
+	return kvm_nvhe_sym(hyp_kvm_iommu_pages);
+}
+
+/* Number of pages to reserve for iommu pool*/
+static int __init early_hyp_iommu_pages(char *arg)
+{
+	return kstrtoul(arg, 10, &kvm_nvhe_sym(hyp_kvm_iommu_pages));
+}
+early_param("kvm-arm.hyp_iommu_pages", early_hyp_iommu_pages);
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 24f0f8a8c943..b9d212b48c04 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -63,6 +63,7 @@ void __init kvm_hyp_reserve(void)
 	hyp_mem_pages += hyp_vmemmap_pages(STRUCT_HYP_PAGE_SIZE);
 	hyp_mem_pages += pkvm_selftest_pages();
 	hyp_mem_pages += hyp_ffa_proxy_pages();
+	hyp_mem_pages += kvm_iommu_pages();
 
 	/*
 	 * Try to allocate a PMD-aligned region to reduce TLB pressure once
-- 
2.52.0.rc1.455.g30608eb744-goog


