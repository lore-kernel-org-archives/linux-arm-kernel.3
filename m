Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A3DEE57C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 23:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=58nGY4ldtTkRgfnQQsIVSVuYVZGfnI/GIgKO3s4AINY=; b=ymM2jgw8RdnPqRHIU7VwJ7C2RM
	2wBcqZoGUutuWo71gjfxYhtaJSzTjCVifxpY90WKsPF2iLr1bpayVz792Anjd0PUqDTQRloVvEa5Q
	VSImsZsuRWdo3L3UKFt+7xBGvoSe8jsxGF2uU7eFvnp/5m7onHOjbPBv+26kiuf5AO+kIVEnLv1T6
	u1VZoxOkKR6mVx62gUjEaV+BSzNavH2VjnzsuurWzFDI5iqjbUUTDwa4IsKlaAlO9TXlIvJpb1A7X
	LTsqVjlUflC0C4G1+v3PnkseMc2sRgRvbH+BqCPrBofum3BHtIj1K008lkOjQ3A8ycHM1B6q1gYRA
	NEXKNP+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaikS-00000005OHg-3ugV;
	Tue, 30 Dec 2025 23:03:29 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaijJ-00000005Mtp-3rQl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 23:02:21 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-34eff656256so7531986a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Dec 2025 15:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767135737; x=1767740537; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=58nGY4ldtTkRgfnQQsIVSVuYVZGfnI/GIgKO3s4AINY=;
        b=pqjb0+ffrUcnsRvGYCIXFpgukaF1exKYtMM+IK0jj0X6Ny57S0O/GbLxi6euokkPol
         xV9KN1WCu63PVrr4CddyfIKvNIFy3O7l4NOXZrqA0JxryOAzd69pJwyRI1lhlGJ1Zeg3
         QFgqXM/lIKvTkb/52bFANX2kPPKlrTXoZ0ejtcEM1DIm3lAS6mnlN4OWzk0MneBV2+9Q
         Wb9n8WgumpyIN2/0NYZZPl5e9uLlqU3UD4g2a7aHvPVIEEk47dw6P23vVScGaXBE5Qxz
         UwJvtV8LAEtOjhMSHtrjsxYN16B7p0xcIzKGKGOLJ4VJyr6tiziC74602LythP7epwIb
         ld1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767135737; x=1767740537;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=58nGY4ldtTkRgfnQQsIVSVuYVZGfnI/GIgKO3s4AINY=;
        b=UatmNJIaSwTIltgjvyGEJMbJjLJFp8w3j01tOuKvSfH5UmLzBP8CI0Fn5ieMnxi2gp
         MUX6fc3MT+h5PBAFCWzPAMzM272AEi2KDfeqtEb1PzzgvBpwb3D/SA5yvzkEcA2fWBis
         Vev2IC0LY11tetXL4ykMscO+9dC7ME1GfKnyv8rPxCvCAcuogb/FWGGTRy7qB8ZfId61
         l35JctFlKwet6DHd8HYvKsTrlIAOgEzeXYmaYdAkuWwJ9Zg8/f30vd3UaVD22YAReCbU
         RDNsQqgQx5MuK9jgJrSkpBQ54iXMH3Dfxcuc6I4D5WZ1g8sKcq19dyNN5s6v356mZD/O
         1QJg==
X-Forwarded-Encrypted: i=1; AJvYcCX7Cd+GcnmyxgBidlI4HH8Rn6Lqk2kMfXBCWApO0kbobiZQC0SBlBufBkOniyDC2wmO4hUHuR215Y+oZN+v1489@lists.infradead.org
X-Gm-Message-State: AOJu0YyOTbnJrI7ec7amJdwR9+FiOewWr/ucvrnx+FAaeGawe94v2+2F
	JeH0IpPKYCD0OKueyrWAAiOMbMfDpwM9+lW1Qd2X/TCFwms6Lc8VRIB0L8i0R852INbHs31j/7/
	nOlwmrA==
X-Google-Smtp-Source: AGHT+IHYP5GuhSEXKm9bE6+AiGelDQ95KXay8Hc3+Dh7sZg4xo9JYXOIH/yq4oOqsJcIf2r6UztQNZfvedQ=
X-Received: from pjblp6.prod.google.com ([2002:a17:90b:4a86:b0:34a:aa6a:e179])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4b43:b0:343:e2ba:e8be
 with SMTP id 98e67ed59e1d1-34e9214bec7mr27723847a91.10.1767135737056; Tue, 30
 Dec 2025 15:02:17 -0800 (PST)
Date: Tue, 30 Dec 2025 15:01:43 -0800
In-Reply-To: <20251230230150.4150236-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251230230150.4150236-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Message-ID: <20251230230150.4150236-15-seanjc@google.com>
Subject: [PATCH v4 14/21] KVM: selftests: Move TDP mapping functions outside
 of vmx.c
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
X-CRM114-CacheID: sfid-20251230_150218_016194_F5267A82 
X-CRM114-Status: GOOD (  16.85  )
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

Now that the functions are no longer VMX-specific, move them to
processor.c. Do a minor comment tweak replacing 'EPT' with 'TDP'.

No functional change intended.

Signed-off-by: Yosry Ahmed <yosry.ahmed@linux.dev>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/include/x86/processor.h     |  4 ++
 tools/testing/selftests/kvm/include/x86/vmx.h |  3 -
 .../testing/selftests/kvm/lib/x86/processor.c | 53 ++++++++++++++
 tools/testing/selftests/kvm/lib/x86/vmx.c     | 71 -------------------
 4 files changed, 57 insertions(+), 74 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/processor.h b/tools/testing/selftests/kvm/include/x86/processor.h
index 4c0d2fc83c1c..d134c886f280 100644
--- a/tools/testing/selftests/kvm/include/x86/processor.h
+++ b/tools/testing/selftests/kvm/include/x86/processor.h
@@ -1477,6 +1477,10 @@ void __virt_pg_map(struct kvm_vm *vm, struct kvm_mmu *mmu, uint64_t vaddr,
 void virt_map_level(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr,
 		    uint64_t nr_bytes, int level);
 
+void tdp_map(struct kvm_vm *vm, uint64_t nested_paddr, uint64_t paddr, uint64_t size);
+void tdp_identity_map_default_memslots(struct kvm_vm *vm);
+void tdp_identity_map_1g(struct kvm_vm *vm,  uint64_t addr, uint64_t size);
+
 /*
  * Basic CPU control in CR0
  */
diff --git a/tools/testing/selftests/kvm/include/x86/vmx.h b/tools/testing/selftests/kvm/include/x86/vmx.h
index 4dd4c2094ee6..92b918700d24 100644
--- a/tools/testing/selftests/kvm/include/x86/vmx.h
+++ b/tools/testing/selftests/kvm/include/x86/vmx.h
@@ -557,9 +557,6 @@ bool load_vmcs(struct vmx_pages *vmx);
 
 bool ept_1g_pages_supported(void);
 
-void tdp_map(struct kvm_vm *vm, uint64_t nested_paddr, uint64_t paddr, uint64_t size);
-void tdp_identity_map_default_memslots(struct kvm_vm *vm);
-void tdp_identity_map_1g(struct kvm_vm *vm,  uint64_t addr, uint64_t size);
 bool kvm_cpu_has_ept(void);
 void vm_enable_ept(struct kvm_vm *vm);
 void prepare_virtualize_apic_accesses(struct vmx_pages *vmx, struct kvm_vm *vm);
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index 41316cac94e0..29e7d172f945 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -472,6 +472,59 @@ void virt_arch_dump(FILE *stream, struct kvm_vm *vm, uint8_t indent)
 	}
 }
 
+void __tdp_map(struct kvm_vm *vm, uint64_t nested_paddr, uint64_t paddr,
+	       uint64_t size, int level)
+{
+	size_t page_size = PG_LEVEL_SIZE(level);
+	size_t npages = size / page_size;
+
+	TEST_ASSERT(nested_paddr + size > nested_paddr, "Vaddr overflow");
+	TEST_ASSERT(paddr + size > paddr, "Paddr overflow");
+
+	while (npages--) {
+		__virt_pg_map(vm, &vm->stage2_mmu, nested_paddr, paddr, level);
+		nested_paddr += page_size;
+		paddr += page_size;
+	}
+}
+
+void tdp_map(struct kvm_vm *vm, uint64_t nested_paddr, uint64_t paddr,
+	     uint64_t size)
+{
+	__tdp_map(vm, nested_paddr, paddr, size, PG_LEVEL_4K);
+}
+
+/* Prepare an identity extended page table that maps all the
+ * physical pages in VM.
+ */
+void tdp_identity_map_default_memslots(struct kvm_vm *vm)
+{
+	uint32_t s, memslot = 0;
+	sparsebit_idx_t i, last;
+	struct userspace_mem_region *region = memslot2region(vm, memslot);
+
+	/* Only memslot 0 is mapped here, ensure it's the only one being used */
+	for (s = 0; s < NR_MEM_REGIONS; s++)
+		TEST_ASSERT_EQ(vm->memslots[s], 0);
+
+	i = (region->region.guest_phys_addr >> vm->page_shift) - 1;
+	last = i + (region->region.memory_size >> vm->page_shift);
+	for (;;) {
+		i = sparsebit_next_clear(region->unused_phy_pages, i);
+		if (i > last)
+			break;
+
+		tdp_map(vm, (uint64_t)i << vm->page_shift,
+			(uint64_t)i << vm->page_shift, 1 << vm->page_shift);
+	}
+}
+
+/* Identity map a region with 1GiB Pages. */
+void tdp_identity_map_1g(struct kvm_vm *vm, uint64_t addr, uint64_t size)
+{
+	__tdp_map(vm, addr, addr, size, PG_LEVEL_1G);
+}
+
 /*
  * Set Unusable Segment
  *
diff --git a/tools/testing/selftests/kvm/lib/x86/vmx.c b/tools/testing/selftests/kvm/lib/x86/vmx.c
index e3737b3d9120..448a63457467 100644
--- a/tools/testing/selftests/kvm/lib/x86/vmx.c
+++ b/tools/testing/selftests/kvm/lib/x86/vmx.c
@@ -373,77 +373,6 @@ void prepare_vmcs(struct vmx_pages *vmx, void *guest_rip, void *guest_rsp)
 	init_vmcs_guest_state(guest_rip, guest_rsp);
 }
 
-/*
- * Map a range of EPT guest physical addresses to the VM's physical address
- *
- * Input Args:
- *   vm - Virtual Machine
- *   nested_paddr - Nested guest physical address to map
- *   paddr - VM Physical Address
- *   size - The size of the range to map
- *   level - The level at which to map the range
- *
- * Output Args: None
- *
- * Return: None
- *
- * Within the VM given by vm, creates a nested guest translation for the
- * page range starting at nested_paddr to the page range starting at paddr.
- */
-void __tdp_map(struct kvm_vm *vm, uint64_t nested_paddr, uint64_t paddr,
-	       uint64_t size, int level)
-{
-	struct kvm_mmu *mmu = &vm->stage2_mmu;
-	size_t page_size = PG_LEVEL_SIZE(level);
-	size_t npages = size / page_size;
-
-	TEST_ASSERT(nested_paddr + size > nested_paddr, "Vaddr overflow");
-	TEST_ASSERT(paddr + size > paddr, "Paddr overflow");
-
-	while (npages--) {
-		__virt_pg_map(vm, mmu, nested_paddr, paddr, level);
-		nested_paddr += page_size;
-		paddr += page_size;
-	}
-}
-
-void tdp_map(struct kvm_vm *vm, uint64_t nested_paddr, uint64_t paddr,
-	     uint64_t size)
-{
-	__tdp_map(vm, nested_paddr, paddr, size, PG_LEVEL_4K);
-}
-
-/* Prepare an identity extended page table that maps all the
- * physical pages in VM.
- */
-void tdp_identity_map_default_memslots(struct kvm_vm *vm)
-{
-	uint32_t s, memslot = 0;
-	sparsebit_idx_t i, last;
-	struct userspace_mem_region *region = memslot2region(vm, memslot);
-
-	/* Only memslot 0 is mapped here, ensure it's the only one being used */
-	for (s = 0; s < NR_MEM_REGIONS; s++)
-		TEST_ASSERT_EQ(vm->memslots[s], 0);
-
-	i = (region->region.guest_phys_addr >> vm->page_shift) - 1;
-	last = i + (region->region.memory_size >> vm->page_shift);
-	for (;;) {
-		i = sparsebit_next_clear(region->unused_phy_pages, i);
-		if (i > last)
-			break;
-
-		tdp_map(vm, (uint64_t)i << vm->page_shift,
-			(uint64_t)i << vm->page_shift, 1 << vm->page_shift);
-	}
-}
-
-/* Identity map a region with 1GiB Pages. */
-void tdp_identity_map_1g(struct kvm_vm *vm, uint64_t addr, uint64_t size)
-{
-	__tdp_map(vm, addr, addr, size, PG_LEVEL_1G);
-}
-
 bool kvm_cpu_has_ept(void)
 {
 	uint64_t ctrl;
-- 
2.52.0.351.gbe84eed79e-goog


