Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F614EE57C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 23:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ja2t3RddJQQ9WtlMGrZPDGGnut4pYDpTPLHSPL1hvlg=; b=Squ2Lmoj/s6z5UTvdw9Pyx1VBb
	EMb00SqHSZ0tLewY01gTMLljW7ZG1oOFV2Qx+qGWfY73lEaPq9kmojZyqAFpZhRhkYQs58VhgZKVL
	JVhkoTJUhE6FqKOQwHURItA7gob0xFTo0BI1K23YqOfEl6oHI/Ot6p+3RdzkFyNvm/QtYUH+BUMjT
	vzTfOw8v1LIuzmel4BiI/vYP23AxDXEBwjwV1l8TCpO6U5D/gZoWLcUXh4Lk/DiRjtlfZZ/kwNJUQ
	KAOWHyiCSOsUcBoG0kjedwMZE7tiUrIxEAMMlcdd27oTwx5yJMczzyWDz51Xx/cjNwJGxE7hiGfne
	4sq6yBPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaikH-00000005O4E-24ZE;
	Tue, 30 Dec 2025 23:03:17 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaijE-00000005MnX-43En
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 23:02:17 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-34eff656256so7531924a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Dec 2025 15:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767135732; x=1767740532; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ja2t3RddJQQ9WtlMGrZPDGGnut4pYDpTPLHSPL1hvlg=;
        b=FK+GrslM2TxdE3Wc6qyKRiBCpKtrOaPvsQSYVjmVK49oL5KNJMLZVrh/WzeSSo4jLn
         HBbBqUgaLewAxgMF6T8h3kQCkOnQnbSqb6DVfIJTLuTn79N2qkIymzqP9zb/Y5BR+GFR
         gZcyjj2znxePLn5Dv/72syQQxcleUf40fMz8XeqO5IEY/yu58PwABfe6PXm0uNx+JCkd
         xAGNlwmwdjo1DLOIsUud9A3RYJG+uu4OVK6PHiQc5tobhG0MbpQuthv0wU26sapmmYoS
         TihcTtreuVz0yV8AuvvUFg9RrJUaUCaGeY2PcIbGgo3h2LbY1j5faMCEvl6BLHVzGTsU
         Y0Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767135732; x=1767740532;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ja2t3RddJQQ9WtlMGrZPDGGnut4pYDpTPLHSPL1hvlg=;
        b=LWTJgvgH+8bFfF9DKnkX94nRwtjknzbFhYqNkOg8En8vxC/57nyeLqC1JHtxwov5Pf
         tvgtfpvxpBS+T9KJ31sOzAH6qbf8hwoUy7coHJkWPaVsOyEhBZHdc2EPNUd53rsTgz3/
         pbAQ03BbJJqCoiadkYEJAfEd0/6rws9krcqW7zFixMPL7ncx6I6p3xJD5rELHnRvl286
         kF8X6F7yPYtpXOE/ypxioMLFj3yjHZhprqFI6IABZNkGJoCZ34jKl1fZC3c2g40U5AI7
         E8NGWG55f7vbN9utS8KueIeJudvx3WQkwaP5x2d/4fCrFeD/yIVh3IiKbjWdfZKYG6BC
         Ap/w==
X-Forwarded-Encrypted: i=1; AJvYcCWL4dxeLRYm8jYf366exyMNXiVEhdSTnkLir+GW0QuztzXeReNNkGwoHIQYX8fHBw9R9rP/dnrm2MqxnlWZfgG3@lists.infradead.org
X-Gm-Message-State: AOJu0YxFuukt4BPD07+SDo3WpETxfSHOcHSoQ/WKIVYS0KkVDQbSvVGd
	AdctMxAIQjUEANJ9You2DnvuGpYBoEMrb38npMQPtgy2KwrOXwCIpY2ouo47dJ6yxBmoMKvSBr+
	KrH+r9g==
X-Google-Smtp-Source: AGHT+IFlmvuQfNmiHzFuNq9XlPth424WfhGaGaW+Waxyx9tMx4HEJVVNAsbuKBuWKPaCjxwrIKXmvslHERQ=
X-Received: from pjbnw17.prod.google.com ([2002:a17:90b:2551:b0:34c:30f1:8d54])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3882:b0:340:d511:e167
 with SMTP id 98e67ed59e1d1-34e9207378fmr28865851a91.0.1767135731850; Tue, 30
 Dec 2025 15:02:11 -0800 (PST)
Date: Tue, 30 Dec 2025 15:01:40 -0800
In-Reply-To: <20251230230150.4150236-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251230230150.4150236-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Message-ID: <20251230230150.4150236-12-seanjc@google.com>
Subject: [PATCH v4 11/21] KVM: selftests: Stop passing VMX metadata to TDP
 mapping functions
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Yosry Ahmed <yosry.ahmed@linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_150213_122253_738EC74A 
X-CRM114-Status: GOOD (  15.28  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Yosry Ahmed <yosry.ahmed@linux.dev>

The root GPA can now be retrieved from the nested MMU, stop passing VMX
metadata. This is in preparation for making these functions work for
NPTs as well.

Opportunistically drop tdp_pg_map() since it's unused.

No functional change intended.

Signed-off-by: Yosry Ahmed <yosry.ahmed@linux.dev>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/x86/vmx.h | 11 ++-----
 .../testing/selftests/kvm/lib/x86/memstress.c | 11 +++----
 tools/testing/selftests/kvm/lib/x86/vmx.c     | 33 +++++++------------
 .../selftests/kvm/x86/vmx_dirty_log_test.c    |  9 +++--
 4 files changed, 24 insertions(+), 40 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/vmx.h b/tools/testing/selftests/kvm/include/x86/vmx.h
index 1fd83c23529a..4dd4c2094ee6 100644
--- a/tools/testing/selftests/kvm/include/x86/vmx.h
+++ b/tools/testing/selftests/kvm/include/x86/vmx.h
@@ -557,14 +557,9 @@ bool load_vmcs(struct vmx_pages *vmx);
 
 bool ept_1g_pages_supported(void);
 
-void tdp_pg_map(struct vmx_pages *vmx, struct kvm_vm *vm, uint64_t nested_paddr,
-		uint64_t paddr);
-void tdp_map(struct vmx_pages *vmx, struct kvm_vm *vm, uint64_t nested_paddr,
-	     uint64_t paddr, uint64_t size);
-void tdp_identity_map_default_memslots(struct vmx_pages *vmx,
-				       struct kvm_vm *vm);
-void tdp_identity_map_1g(struct vmx_pages *vmx, struct kvm_vm *vm,
-			 uint64_t addr, uint64_t size);
+void tdp_map(struct kvm_vm *vm, uint64_t nested_paddr, uint64_t paddr, uint64_t size);
+void tdp_identity_map_default_memslots(struct kvm_vm *vm);
+void tdp_identity_map_1g(struct kvm_vm *vm,  uint64_t addr, uint64_t size);
 bool kvm_cpu_has_ept(void);
 void vm_enable_ept(struct kvm_vm *vm);
 void prepare_virtualize_apic_accesses(struct vmx_pages *vmx, struct kvm_vm *vm);
diff --git a/tools/testing/selftests/kvm/lib/x86/memstress.c b/tools/testing/selftests/kvm/lib/x86/memstress.c
index 00f7f11e5f0e..3319cb57a78d 100644
--- a/tools/testing/selftests/kvm/lib/x86/memstress.c
+++ b/tools/testing/selftests/kvm/lib/x86/memstress.c
@@ -59,7 +59,7 @@ uint64_t memstress_nested_pages(int nr_vcpus)
 	return 513 + 10 * nr_vcpus;
 }
 
-static void memstress_setup_ept_mappings(struct vmx_pages *vmx, struct kvm_vm *vm)
+static void memstress_setup_ept_mappings(struct kvm_vm *vm)
 {
 	uint64_t start, end;
 
@@ -68,16 +68,15 @@ static void memstress_setup_ept_mappings(struct vmx_pages *vmx, struct kvm_vm *v
 	 * KVM can shadow the EPT12 with the maximum huge page size supported
 	 * by the backing source.
 	 */
-	tdp_identity_map_1g(vmx, vm, 0, 0x100000000ULL);
+	tdp_identity_map_1g(vm, 0, 0x100000000ULL);
 
 	start = align_down(memstress_args.gpa, PG_SIZE_1G);
 	end = align_up(memstress_args.gpa + memstress_args.size, PG_SIZE_1G);
-	tdp_identity_map_1g(vmx, vm, start, end - start);
+	tdp_identity_map_1g(vm, start, end - start);
 }
 
 void memstress_setup_nested(struct kvm_vm *vm, int nr_vcpus, struct kvm_vcpu *vcpus[])
 {
-	struct vmx_pages *vmx;
 	struct kvm_regs regs;
 	vm_vaddr_t vmx_gva;
 	int vcpu_id;
@@ -87,11 +86,11 @@ void memstress_setup_nested(struct kvm_vm *vm, int nr_vcpus, struct kvm_vcpu *vc
 
 	vm_enable_ept(vm);
 	for (vcpu_id = 0; vcpu_id < nr_vcpus; vcpu_id++) {
-		vmx = vcpu_alloc_vmx(vm, &vmx_gva);
+		vcpu_alloc_vmx(vm, &vmx_gva);
 
 		/* The EPTs are shared across vCPUs, setup the mappings once */
 		if (vcpu_id == 0)
-			memstress_setup_ept_mappings(vmx, vm);
+			memstress_setup_ept_mappings(vm);
 
 		/*
 		 * Override the vCPU to run memstress_l1_guest_code() which will
diff --git a/tools/testing/selftests/kvm/lib/x86/vmx.c b/tools/testing/selftests/kvm/lib/x86/vmx.c
index 9d4e391fdf2c..ea1c09f9e8ab 100644
--- a/tools/testing/selftests/kvm/lib/x86/vmx.c
+++ b/tools/testing/selftests/kvm/lib/x86/vmx.c
@@ -409,8 +409,8 @@ static void tdp_create_pte(struct kvm_vm *vm,
 }
 
 
-void __tdp_pg_map(struct vmx_pages *vmx, struct kvm_vm *vm,
-		  uint64_t nested_paddr, uint64_t paddr, int target_level)
+void __tdp_pg_map(struct kvm_vm *vm, uint64_t nested_paddr, uint64_t paddr,
+		  int target_level)
 {
 	const uint64_t page_size = PG_LEVEL_SIZE(target_level);
 	void *eptp_hva = addr_gpa2hva(vm, vm->arch.tdp_mmu->pgd);
@@ -453,12 +453,6 @@ void __tdp_pg_map(struct vmx_pages *vmx, struct kvm_vm *vm,
 	}
 }
 
-void tdp_pg_map(struct vmx_pages *vmx, struct kvm_vm *vm,
-		uint64_t nested_paddr, uint64_t paddr)
-{
-	__tdp_pg_map(vmx, vm, nested_paddr, paddr, PG_LEVEL_4K);
-}
-
 /*
  * Map a range of EPT guest physical addresses to the VM's physical address
  *
@@ -476,9 +470,8 @@ void tdp_pg_map(struct vmx_pages *vmx, struct kvm_vm *vm,
  * Within the VM given by vm, creates a nested guest translation for the
  * page range starting at nested_paddr to the page range starting at paddr.
  */
-void __tdp_map(struct vmx_pages *vmx, struct kvm_vm *vm,
-	       uint64_t nested_paddr, uint64_t paddr, uint64_t size,
-		  int level)
+void __tdp_map(struct kvm_vm *vm, uint64_t nested_paddr, uint64_t paddr,
+	       uint64_t size, int level)
 {
 	size_t page_size = PG_LEVEL_SIZE(level);
 	size_t npages = size / page_size;
@@ -487,23 +480,22 @@ void __tdp_map(struct vmx_pages *vmx, struct kvm_vm *vm,
 	TEST_ASSERT(paddr + size > paddr, "Paddr overflow");
 
 	while (npages--) {
-		__tdp_pg_map(vmx, vm, nested_paddr, paddr, level);
+		__tdp_pg_map(vm, nested_paddr, paddr, level);
 		nested_paddr += page_size;
 		paddr += page_size;
 	}
 }
 
-void tdp_map(struct vmx_pages *vmx, struct kvm_vm *vm,
-	     uint64_t nested_paddr, uint64_t paddr, uint64_t size)
+void tdp_map(struct kvm_vm *vm, uint64_t nested_paddr, uint64_t paddr,
+	     uint64_t size)
 {
-	__tdp_map(vmx, vm, nested_paddr, paddr, size, PG_LEVEL_4K);
+	__tdp_map(vm, nested_paddr, paddr, size, PG_LEVEL_4K);
 }
 
 /* Prepare an identity extended page table that maps all the
  * physical pages in VM.
  */
-void tdp_identity_map_default_memslots(struct vmx_pages *vmx,
-				       struct kvm_vm *vm)
+void tdp_identity_map_default_memslots(struct kvm_vm *vm)
 {
 	uint32_t s, memslot = 0;
 	sparsebit_idx_t i, last;
@@ -520,16 +512,15 @@ void tdp_identity_map_default_memslots(struct vmx_pages *vmx,
 		if (i > last)
 			break;
 
-		tdp_map(vmx, vm, (uint64_t)i << vm->page_shift,
+		tdp_map(vm, (uint64_t)i << vm->page_shift,
 			(uint64_t)i << vm->page_shift, 1 << vm->page_shift);
 	}
 }
 
 /* Identity map a region with 1GiB Pages. */
-void tdp_identity_map_1g(struct vmx_pages *vmx, struct kvm_vm *vm,
-			    uint64_t addr, uint64_t size)
+void tdp_identity_map_1g(struct kvm_vm *vm, uint64_t addr, uint64_t size)
 {
-	__tdp_map(vmx, vm, addr, addr, size, PG_LEVEL_1G);
+	__tdp_map(vm, addr, addr, size, PG_LEVEL_1G);
 }
 
 bool kvm_cpu_has_ept(void)
diff --git a/tools/testing/selftests/kvm/x86/vmx_dirty_log_test.c b/tools/testing/selftests/kvm/x86/vmx_dirty_log_test.c
index 5c8cf8ac42a2..370f8d3117c2 100644
--- a/tools/testing/selftests/kvm/x86/vmx_dirty_log_test.c
+++ b/tools/testing/selftests/kvm/x86/vmx_dirty_log_test.c
@@ -80,7 +80,6 @@ void l1_guest_code(struct vmx_pages *vmx)
 static void test_vmx_dirty_log(bool enable_ept)
 {
 	vm_vaddr_t vmx_pages_gva = 0;
-	struct vmx_pages *vmx;
 	unsigned long *bmap;
 	uint64_t *host_test_mem;
 
@@ -96,7 +95,7 @@ static void test_vmx_dirty_log(bool enable_ept)
 	if (enable_ept)
 		vm_enable_ept(vm);
 
-	vmx = vcpu_alloc_vmx(vm, &vmx_pages_gva);
+	vcpu_alloc_vmx(vm, &vmx_pages_gva);
 	vcpu_args_set(vcpu, 1, vmx_pages_gva);
 
 	/* Add an extra memory slot for testing dirty logging */
@@ -120,9 +119,9 @@ static void test_vmx_dirty_log(bool enable_ept)
 	 * GPAs as the EPT enabled case.
 	 */
 	if (enable_ept) {
-		tdp_identity_map_default_memslots(vmx, vm);
-		tdp_map(vmx, vm, NESTED_TEST_MEM1, GUEST_TEST_MEM, PAGE_SIZE);
-		tdp_map(vmx, vm, NESTED_TEST_MEM2, GUEST_TEST_MEM, PAGE_SIZE);
+		tdp_identity_map_default_memslots(vm);
+		tdp_map(vm, NESTED_TEST_MEM1, GUEST_TEST_MEM, PAGE_SIZE);
+		tdp_map(vm, NESTED_TEST_MEM2, GUEST_TEST_MEM, PAGE_SIZE);
 	}
 
 	bmap = bitmap_zalloc(TEST_MEM_PAGES);
-- 
2.52.0.351.gbe84eed79e-goog


