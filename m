Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDEFAC55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 10:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z9CUanFRpSnCn1BvgBoZN/95LbVUNzni2ghUMqmLEaI=; b=Deidz3JaKbWIURlPaCOgX6qFEj
	KVrQB3EIACUG5asPhlxibzltuCxjekyoc6MvE9N1FOsLH2WNaE/g22o1vZoIRyJs/cjvH+YlSpjIo
	wl/jryZjz/VIuP6n0YSOthzSbcs/6riv6Ed1rfXLh5AaX4lIgc9yXSNO5yA1sMCoMWoG/nvTaOpvp
	6ocuxyyL5wf2qXQbjvKT3YXhbeAf5i22VQtQouYPZ5obNFhmHMb/+w7jHaRMHmawUL2yCfYb/J6dQ
	tfIBjoeAsIvZaapVpD/BTKs7Hf207vi8gJJzoFGQ1oWGQfDhRaUPGvm7v0UW8kJBO+CYTXcdeifMT
	/Ddghieg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpdR-0000000Gmu6-2CdF;
	Mon, 03 Aug 2026 10:11:05 +0000
Received: from mail-lf1-x146.google.com ([2a00:1450:4864:20::146])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpdO-0000000Gmom-2ZeM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 10:11:03 +0000
Received: by mail-lf1-x146.google.com with SMTP id 2adb3069b0e04-5b291a1420fso2537364e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 03:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785751859; x=1786356659; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z9CUanFRpSnCn1BvgBoZN/95LbVUNzni2ghUMqmLEaI=;
        b=CJZ9TjHzGMkSprtKaYeBP5BxUyHEmUz3RlDtP5z/rvTQ7Fz1C/COeGfaAQwbCcOi/u
         ZXC396dRmEMKtq7Kg3gMvG2CvgW+/55IxWayleZATfmypCgtEZxIkOwz+ssMjKi0UE1N
         Dw6pjqEy8g4IZoj12TF6z75vcU5vA0jIlQlXg6B6oi8C9lK8+r6TT53/u72s+0nOgpq2
         EH+RmQfcoICuhVPIo+JfDj9YLFADcxqYBoSppWxO3cIxFHbAV6sv7oKCKrLXUFWz84E5
         +DH/HjeGJL3LCntxvAt+GZ5bswDQXXrH/mUQ3hIVTt3W7RnsnsOLOPWWBvSTcn4+s4gM
         6uUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785751859; x=1786356659;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z9CUanFRpSnCn1BvgBoZN/95LbVUNzni2ghUMqmLEaI=;
        b=exqmBeA13Fnb1kqRBeISxgW0wd9n9uHp4f4yO/e0x5cUnd6+ywkodoFBpc0prA7itc
         U4Z/dMLQUvnXGP8258eL1BVHBdB0lt9/cDjf3zHxcJzGhcsFBiV8knd0GFlnbGF6HgnZ
         ZoE1Rmu9DFEEAaMi8Zwm329rSNK/FRzeknSHdlJ7XjGxAXNdYQkEtdVpMzd0K8ZZdrdw
         22neCX4ka1Qypg0Ml5a37udARd4VXa+q4Jeg835Vb8FKsw+8pMvO/luTq8uRC61r0F1G
         9rkZP+exz902lQXFCs2zQnaHtP3IZn1GhT0H3ALYjJAOM4qfT8Pm0HoS+wqDg/QukUiW
         fUdw==
X-Forwarded-Encrypted: i=1; AHgh+Rr1aZuPAixijmkC5LCVDjcBniVb5bJztYhkjVudHeuUhXkrAlCtONgUFelRa5f+ny4Upk8ZGFDNxKHt6mRY1yJ0@lists.infradead.org
X-Gm-Message-State: AOJu0YxH+E5mevSogYYeIuOePpiEaxOv4iOrfRU3OFFpNRTwvYQXl/Tm
	5U/XqE03Qwnh9gmG//pvv0Sr+r0L8J7+y2nSw6TpDkkTCJGtDRzaCUI4YdpgPloWt+wRNol7iO6
	2UhE9/mA79g+FVLBH7cehSA==
X-Received: from lfvg24.prod.google.com ([2002:a05:6512:3b98:b0:5b1:5eee:e18d])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6512:21b:b0:5b0:137f:9476 with SMTP id 2adb3069b0e04-5b2e4f297f3mr1133230e87.16.1785751859390;
 Mon, 03 Aug 2026 03:10:59 -0700 (PDT)
Date: Mon,  3 Aug 2026 11:08:49 +0100
In-Reply-To: <20260803100904.3563942-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260803100904.3563942-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260803100904.3563942-6-vdonnefort@google.com>
Subject: [PATCH 05/20] KVM: arm64: Make pKVM ownership selftest an HVC
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	keirf@google.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_031102_714486_3F27272C 
X-CRM114-Status: GOOD (  22.28  )
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

In preparation for testing the pKVM ownership with huge mappings,
refactor the selftest to be triggered via an HVC using dynamically
allocated memory from the host. This avoids wasting memory which would
be even worse for testing ownership transitions for huge stage-2
mappings.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index 043495f7fc78..37c5e22fac98 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -62,6 +62,7 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___kvm_enable_ssbs,
 	__KVM_HOST_SMCCC_FUNC___vgic_v3_init_lrs,
 	__KVM_HOST_SMCCC_FUNC___vgic_v3_get_gic_config,
+	__KVM_HOST_SMCCC_FUNC___pkvm_ownership_selftest,
 
 	MARKER(__KVM_HOST_SMCCC_FUNC_MIN_PKVM),
 
diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index 74fedd9c5ff0..c53869cb6be1 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -23,6 +23,12 @@ bool pkvm_hyp_vm_is_created(struct kvm *kvm);
 void pkvm_destroy_hyp_vm(struct kvm *kvm);
 int pkvm_create_hyp_vcpu(struct kvm_vcpu *vcpu);
 
+#ifdef CONFIG_NVHE_EL2_DEBUG
+void pkvm_ownership_selftest(void);
+#else
+static inline void pkvm_ownership_selftest(void) { }
+#endif
+
 /*
  * Check whether the specific capability is allowed in pKVM.
  *
@@ -158,12 +164,6 @@ static inline unsigned long host_s2_pgtable_pages(void)
 	return res;
 }
 
-#ifdef CONFIG_NVHE_EL2_DEBUG
-static inline unsigned long pkvm_selftest_pages(void) { return 32; }
-#else
-static inline unsigned long pkvm_selftest_pages(void) { return 0; }
-#endif
-
 #define KVM_FFA_MBOX_NR_PAGES	1
 
 static inline unsigned long hyp_ffa_proxy_pages(void)
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 50adfff75be8..fff92936c20f 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2883,6 +2883,8 @@ static int __init init_hyp_mode(void)
 			kvm_err("Failed to init hyp memory protection\n");
 			goto out_err;
 		}
+
+		pkvm_ownership_selftest();
 	}
 
 	return 0;
diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index 29935c7da1de..e2a5d7ffec7d 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -74,10 +74,9 @@ static __always_inline void __load_host_stage2(void)
 }
 
 #ifdef CONFIG_NVHE_EL2_DEBUG
-void pkvm_ownership_selftest(void *base);
-struct pkvm_hyp_vcpu *init_selftest_vm(void *virt);
-void teardown_selftest_vm(void);
+int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr_pages);
 #else
-static inline void pkvm_ownership_selftest(void *base) { }
+static inline int
+__pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr_pages) { return 0; }
 #endif
 #endif /* __KVM_NVHE_MEM_PROTECT__ */
diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
index c904647d2f76..f04cea5ff389 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
@@ -93,5 +93,9 @@ bool kvm_handle_pvm_sysreg(struct kvm_vcpu *vcpu, u64 *exit_code);
 bool kvm_handle_pvm_restricted(struct kvm_vcpu *vcpu, u64 *exit_code);
 void kvm_init_pvm_id_regs(struct kvm_vcpu *vcpu);
 int kvm_check_pvm_sysreg_table(void);
+#ifdef CONFIG_NVHE_EL2_DEBUG
+struct pkvm_hyp_vcpu *init_selftest_vm(void *virt, u64 nr_pages);
+void teardown_selftest_vm(void);
+#endif
 
 #endif /* __ARM64_KVM_NVHE_PKVM_H__ */
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index d3c69de698f4..bed3ba8e48e5 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -557,6 +557,15 @@ static void handle___pkvm_create_private_mapping(struct kvm_cpu_context *host_ct
 	cpu_reg(host_ctxt, 1) = haddr;
 }
 
+static void handle___pkvm_ownership_selftest(struct kvm_cpu_context *host_ctxt)
+{
+	DECLARE_REG(u64, pfn, host_ctxt, 1);
+	DECLARE_REG(u64, pgtable_pfn, host_ctxt, 2);
+	DECLARE_REG(unsigned long, pgtable_nr_pages, host_ctxt, 3);
+
+	cpu_reg(host_ctxt, 1) = __pkvm_ownership_selftest(pfn, pgtable_pfn, pgtable_nr_pages);
+}
+
 static void handle___pkvm_prot_finalize(struct kvm_cpu_context *host_ctxt)
 {
 	cpu_reg(host_ctxt, 1) = __pkvm_prot_finalize();
@@ -717,6 +726,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__kvm_enable_ssbs),
 	HANDLE_FUNC(__vgic_v3_init_lrs),
 	HANDLE_FUNC(__vgic_v3_get_gic_config),
+	HANDLE_FUNC(__pkvm_ownership_selftest),
 	HANDLE_FUNC(__pkvm_prot_finalize),
 
 	HANDLE_FUNC(__kvm_adjust_pc),
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 3c3e0c3d66d1..b917537f12a7 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1741,24 +1741,36 @@ static void assert_page_state(void)
 		assert_page_state();			\
 	} while (0)
 
-void pkvm_ownership_selftest(void *base)
+int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr_pages)
 {
 	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_RWX;
-	void *virt = hyp_alloc_pages(&host_s2_pool, 0);
 	struct pkvm_hyp_vcpu *vcpu;
-	u64 phys, size, pfn, gfn;
 	struct pkvm_hyp_vm *vm;
+	u64 phys, size, gfn;
+	void *virt;
+	int ret;
 
-	WARN_ON(!virt);
-	selftest_page = hyp_virt_to_page(virt);
-	selftest_page->refcount = 0;
-	selftest_vcpu = vcpu = init_selftest_vm(base);
+	ret = __pkvm_host_donate_hyp(pgtable_pfn, pgtable_nr_pages);
+	if (ret)
+		return ret;
+
+	ret = __pkvm_host_donate_hyp(pfn, 1);
+	if (ret) {
+		WARN_ON(__pkvm_hyp_donate_host(pgtable_pfn, pgtable_nr_pages));
+		return ret;
+	}
+
+	selftest_vcpu = vcpu = init_selftest_vm(hyp_phys_to_virt(hyp_pfn_to_phys(pgtable_pfn)),
+						pgtable_nr_pages);
 	vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
 
-	size = PAGE_SIZE << selftest_page->order;
-	phys = hyp_virt_to_phys(virt);
-	pfn = hyp_phys_to_pfn(phys);
+	phys = hyp_pfn_to_phys(pfn);
+	virt = hyp_phys_to_virt(phys);
 	gfn = hyp_phys_to_pfn(selftest_ipa());
+	size = PAGE_SIZE;
+
+	selftest_page = hyp_virt_to_page(virt);
+	selftest_page->refcount = 0;
 
 	selftest_state.host = PKVM_NOPAGE;
 	selftest_state.hyp = PKVM_PAGE_OWNED;
@@ -1919,8 +1931,11 @@ void pkvm_ownership_selftest(void *base)
 	selftest_state.hyp = PKVM_PAGE_OWNED;
 	assert_transition_res(0,	__pkvm_host_donate_hyp, pfn, 1);
 
+	/* This also gives back the ownership to the host */
 	teardown_selftest_vm();
-	selftest_page->refcount = 1;
-	hyp_put_page(&host_s2_pool, virt);
+
+	WARN_ON(__pkvm_hyp_donate_host(pfn, 1));
+
+	return 0;
 }
 #endif
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 24d6f164129a..b7ec535da86b 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -749,7 +749,7 @@ static struct pkvm_hyp_vcpu selftest_vcpu = {
 	},
 };
 
-struct pkvm_hyp_vcpu *init_selftest_vm(void *virt)
+struct pkvm_hyp_vcpu *init_selftest_vm(void *virt, u64 nr_pages)
 {
 	struct hyp_page *p = hyp_virt_to_page(virt);
 	unsigned long min_pages, seeded = 0;
@@ -765,7 +765,7 @@ struct pkvm_hyp_vcpu *init_selftest_vm(void *virt)
 	 */
 	min_pages = kvm_mmu_cache_min_pages(&selftest_vm.kvm.arch.mmu);
 
-	for (i = 0; i < pkvm_selftest_pages(); i++) {
+	for (i = 0; i < nr_pages; i++) {
 		if (p[i].refcount)
 			continue;
 		p[i].refcount = 1;
@@ -785,9 +785,17 @@ struct pkvm_hyp_vcpu *init_selftest_vm(void *virt)
 
 void teardown_selftest_vm(void)
 {
+	struct kvm_hyp_memcache *vcpu_mc = &selftest_vcpu.vcpu.arch.pkvm_memcache;
+	struct kvm_hyp_memcache mc = { 0 };
+
+	while (vcpu_mc->nr_pages)
+		hyp_put_page(&selftest_vm.pool, pop_hyp_memcache(vcpu_mc, hyp_phys_to_virt));
+
 	hyp_spin_lock(&vm_table_lock);
 	remove_vm_table_entry(selftest_vm.kvm.arch.pkvm.handle);
 	hyp_spin_unlock(&vm_table_lock);
+
+	reclaim_pgtable_pages(&selftest_vm, &mc);
 }
 #endif /* CONFIG_NVHE_EL2_DEBUG */
 
diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
index d7beb2ccf1e1..c96600e8aa7c 100644
--- a/arch/arm64/kvm/hyp/nvhe/setup.c
+++ b/arch/arm64/kvm/hyp/nvhe/setup.c
@@ -28,7 +28,6 @@ static void *vmemmap_base;
 static void *vm_table_base;
 static void *hyp_pgt_base;
 static void *host_s2_pgt_base;
-static void *selftest_base;
 static void *ffa_proxy_pages;
 static struct kvm_pgtable_mm_ops pkvm_pgtable_mm_ops;
 static struct hyp_pool hpool;
@@ -39,11 +38,6 @@ static int divide_memory_pool(void *virt, unsigned long size)
 
 	hyp_early_alloc_init(virt, size);
 
-	nr_pages = pkvm_selftest_pages();
-	selftest_base = hyp_early_alloc_contig(nr_pages);
-	if (nr_pages && !selftest_base)
-		return -ENOMEM;
-
 	nr_pages = hyp_vmemmap_pages(sizeof(struct hyp_page));
 	vmemmap_base = hyp_early_alloc_contig(nr_pages);
 	if (!vmemmap_base)
@@ -377,8 +371,6 @@ void __noreturn __pkvm_init_finalise(void)
 		goto out;
 
 	pkvm_hyp_vm_table_init(vm_table_base);
-
-	pkvm_ownership_selftest(selftest_base);
 out:
 	/*
 	 * We tail-called to here from handle___pkvm_init() and will not return,
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 428723b1b0f5..047f941fcbb9 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -61,7 +61,6 @@ void __init kvm_hyp_reserve(void)
 	hyp_mem_pages += host_s2_pgtable_pages();
 	hyp_mem_pages += hyp_vm_table_pages();
 	hyp_mem_pages += hyp_vmemmap_pages(STRUCT_HYP_PAGE_SIZE);
-	hyp_mem_pages += pkvm_selftest_pages();
 	hyp_mem_pages += hyp_ffa_proxy_pages();
 
 	/*
@@ -260,6 +259,35 @@ static void __init _kvm_host_prot_finalize(void *arg)
 		WRITE_ONCE(*err, -EINVAL);
 }
 
+#ifdef CONFIG_NVHE_EL2_DEBUG
+void __init pkvm_ownership_selftest(void)
+{
+	unsigned long pgtable_order = 5;
+	unsigned long pgtable = 0;
+	unsigned long page = 0;
+	long ret = -ENOMEM;
+
+	/* Memory for the VM page-table */
+	pgtable = __get_free_pages(GFP_KERNEL, pgtable_order);
+	if (!pgtable)
+		goto out;
+
+	/* Page whose ownership will be tested */
+	page = __get_free_page(GFP_KERNEL);
+	if (!page)
+		goto out;
+
+	ret = kvm_call_hyp_nvhe(__pkvm_ownership_selftest, virt_to_pfn((void *)page),
+				virt_to_pfn((void *)pgtable), 1 << pgtable_order);
+out:
+	if (ret)
+		kvm_err("Failed to run %s (%ld)\n", __func__, ret);
+
+	free_pages(pgtable, pgtable_order);
+	free_page(page);
+}
+#endif
+
 static int __init pkvm_drop_host_privileges(void)
 {
 	int ret = 0;
-- 
2.55.0.508.g3f0d502094-goog


