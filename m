Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0513C88E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 13:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AkCT1ho/uvoDJ+UpX9D2PLGW4nyUKa4Cm7tHEYRfN5c=; b=AIrSW3t0sAh1IyYS9u92aSGclk
	aHpDj9Tda4u/WSl7poXYbff7WGw/nmjEp5PmG6rHEvFKQ9VRKVzQZ1/5KxazQVzPOSpWnaTH0dK5W
	Y9FXhAZ8fiSoQBLSG/fHmzlsqUiRjuteg5j4vijjeaz716cV2OSRWAaUhwfF0INfzJZx4nfmWGvmB
	4QonoPlTfbRxOvRSmQ6un6oJr88P+81cStRxaomIDTm/KeR6YF/R5PdWPKpYbsH6v+T7LngOmqs1H
	r9EXgKKTdRlxadI1SSHGMvuiyUbOhmhShkRjuafR1tTRwGRJjDK/ShDpiX4jwxGaV1in2S3V9GzpA
	5S68kVTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51et-0000000GntD-25Mj;
	Fri, 11 Sep 2026 13:51:15 +0000
Received: from mail-wm1-x347.google.com ([2a00:1450:4864:20::347])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51eo-0000000Gnml-0Wyd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 13:51:12 +0000
Received: by mail-wm1-x347.google.com with SMTP id 5b1f17b1804b1-49ccfbe060aso6229145e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 06:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789134668; x=1789739468; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AkCT1ho/uvoDJ+UpX9D2PLGW4nyUKa4Cm7tHEYRfN5c=;
        b=UTz6M6ge6GPMiYCho7kTwPXB20LmGx/Hq5vBjf6Ku5HKXQmNO/eXFHlFR+OrW3ymaB
         SOeynvPmLH3pTrd4WYlCkua+jt9oVQDAYQYUZlH8y240K5cnjEotOfEJ/WhoIdTCWMfa
         G2V94voKyxROTsI4qH7uaY9Mhe2S8bwjq54VZnJN1YJtXl8mdPmso7lpfy3KMdtyFB27
         QALSftWFytMq27Hp1vpf0NfyK3tbYYN+FIm1K9FeiV92nLF5G2LL690eH0VLheopy5B6
         bM6Pq5R3XqzD2rbQ5dC48LouEKDeLgmMsaGa6kzoFedvkpzwtpuq+P/IYKwXIW/W2yLN
         JI5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789134668; x=1789739468;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AkCT1ho/uvoDJ+UpX9D2PLGW4nyUKa4Cm7tHEYRfN5c=;
        b=rN6JcCicaQXqjCOWaqbUJ6YOAHoqrHr88WtkTX9GmPIwguL8XFmaAK6cTlDj9fG33F
         EK+rUSSj0cItey186ELcTyuIQkPS9XqnjKxMnE8sHGiCZzY4Am0BefhDTTahphVDcnhz
         tzIbiulxs2xizr8ubBzsMkjV62scbxVtJbMgaW/84Gc9/Z5NJ0ezNX29ZuvGzQTa6kl3
         yMsqL0eq7zZ0IYXOlH+DnoZjGTEI/Y9pLInaxR9dgtVzOdcavY8lS4NOfzlouBojfTpr
         +hcMrpTqSpPOVxgKtnilLfITNglzBQ+hQG9npm6OCS/XCpxHkMqFbMp8XNYnCREorrm3
         HlPw==
X-Forwarded-Encrypted: i=1; AKwUvBwqcc+rNjJUVmOIt8dU5S6UeIfCdAohYBm6ptWOGVFbFDQ6uW+8z6QIR8hru7zLMUYEWGd3Y+EvuQ2lP/NFC2OB@lists.infradead.org
X-Gm-Message-State: AFuF++kHGGSvAYm1wYC0JjaubbrMLsOcfe94m1ZPnAw5PMO1jikbLfbj
	lcsr7tDYUS3/6FFdx8hYmnyiF27NaYDMKatykploRe2BAbmTnjwJQFCY7nDgVLuW9yHvUuV/aM5
	4VMJUwbWcRuk62fFASWInew==
X-Received: from wmfv12.prod.google.com ([2002:a05:600c:15cc:b0:49d:1cf4:ba1a])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:474c:b0:49c:fa21:e74a with SMTP id 5b1f17b1804b1-49e619e4e91mr51950335e9.32.1789134667334;
 Fri, 11 Sep 2026 06:51:07 -0700 (PDT)
Date: Fri, 11 Sep 2026 14:50:36 +0100
In-Reply-To: <20260911135053.146435-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260911135053.146435-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Message-ID: <20260911135053.146435-6-vdonnefort@google.com>
Subject: [PATCH v2 05/22] KVM: arm64: Make pKVM ownership selftest an HVC
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	weilin.chang@arm.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_065110_254072_28BA4201 
X-CRM114-Status: GOOD (  25.49  )
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
---
 arch/arm64/include/asm/kvm_asm.h              |  1 +
 arch/arm64/include/asm/kvm_pkvm.h             | 12 +++---
 arch/arm64/kvm/arm.c                          |  2 +
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  7 ++--
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h        |  4 ++
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            | 10 +++++
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 39 +++++++++++++------
 arch/arm64/kvm/hyp/nvhe/pkvm.c                | 12 +++++-
 arch/arm64/kvm/hyp/nvhe/setup.c               |  8 ----
 arch/arm64/kvm/pkvm.c                         | 30 +++++++++++++-
 10 files changed, 92 insertions(+), 33 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index e5b92ac09e69..7fdec5d98201 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -62,6 +62,7 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___kvm_enable_ssbs,
 	__KVM_HOST_SMCCC_FUNC___vgic_v3_init_lrs,
 	__KVM_HOST_SMCCC_FUNC___vgic_v3_get_gic_config,
+	__KVM_HOST_SMCCC_FUNC___pkvm_ownership_selftest,
 
 	MARKER(__KVM_HOST_SMCCC_FUNC_MIN_PKVM),
 
diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index beea00e693a0..ff8e93efcd7a 100644
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
@@ -161,12 +167,6 @@ static inline unsigned long host_s2_pgtable_pages(void)
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
index 8b080804bc90..fb36e73a8ffb 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2914,6 +2914,8 @@ static int __init init_hyp_mode(void)
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
index 9a3b92e626ad..9fbe703fc595 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -751,6 +751,15 @@ static void handle___pkvm_create_private_mapping(struct kvm_cpu_context *host_ct
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
@@ -911,6 +920,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__kvm_enable_ssbs),
 	HANDLE_FUNC(__vgic_v3_init_lrs),
 	HANDLE_FUNC(__vgic_v3_get_gic_config),
+	HANDLE_FUNC(__pkvm_ownership_selftest),
 	HANDLE_FUNC(__pkvm_prot_finalize),
 
 	HANDLE_FUNC(__kvm_adjust_pc),
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index c3676243fddc..183ecd7058cf 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1748,24 +1748,36 @@ static void assert_page_state(void)
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
@@ -1926,8 +1938,11 @@ void pkvm_ownership_selftest(void *base)
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
index 459bd9eb7e4b..ad9afe2cd1b9 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -762,7 +762,7 @@ static struct pkvm_hyp_vcpu selftest_vcpu = {
 	},
 };
 
-struct pkvm_hyp_vcpu *init_selftest_vm(void *virt)
+struct pkvm_hyp_vcpu *init_selftest_vm(void *virt, u64 nr_pages)
 {
 	struct hyp_page *p = hyp_virt_to_page(virt);
 	unsigned long min_pages, seeded = 0;
@@ -778,7 +778,7 @@ struct pkvm_hyp_vcpu *init_selftest_vm(void *virt)
 	 */
 	min_pages = kvm_mmu_cache_min_pages(&selftest_vm.kvm.arch.mmu);
 
-	for (i = 0; i < pkvm_selftest_pages(); i++) {
+	for (i = 0; i < nr_pages; i++) {
 		if (p[i].refcount)
 			continue;
 		p[i].refcount = 1;
@@ -798,9 +798,17 @@ struct pkvm_hyp_vcpu *init_selftest_vm(void *virt)
 
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
index 22200bb50990..38d3212f8678 100644
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
@@ -365,8 +359,6 @@ void __noreturn __pkvm_init_finalise(void)
 		goto out;
 
 	pkvm_hyp_vm_table_init(vm_table_base);
-
-	pkvm_ownership_selftest(selftest_base);
 out:
 	/*
 	 * We tail-called to here from handle___pkvm_init() and will not return,
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 8e4c6e4bec12..b88c1fcaadbd 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -61,7 +61,6 @@ void __init kvm_hyp_reserve(void)
 	hyp_mem_pages += host_s2_pgtable_pages();
 	hyp_mem_pages += hyp_vm_table_pages();
 	hyp_mem_pages += hyp_vmemmap_pages(STRUCT_HYP_PAGE_SIZE);
-	hyp_mem_pages += pkvm_selftest_pages();
 	hyp_mem_pages += hyp_ffa_proxy_pages();
 
 	/*
@@ -257,6 +256,35 @@ static void __init _kvm_host_prot_finalize(void *arg)
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
2.55.0.1007.g17ff1f9808-goog


