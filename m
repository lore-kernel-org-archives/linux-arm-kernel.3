Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FD3EE57C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 23:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Cc6wkm6hIGFSfttAC+mfZ95Ec3DVPFhFOuj3x7H3nk=; b=4jGtOpfOsvxbi5NM9Xljn0XUYt
	aJmmjRjg8znHSFcO/Pvi3Pw+AvevOD/jmoWuRiyVYnfsWL6e/WyWHPvk3D1d+ylia+jFi301JsbM3
	eH64ZQaFzQuiTppCS2sHxznSshSjMAlsjlJxmFcIiCIUjhfHVMqOO1VqtPsxLXl9nhf82kNeHANgP
	wgugWQvdAEgIzSxtRpLytg4nlkUIRCWuEU2tDh6mUFZpYGUIBdd1ut2o3WahltNnhBRnPGhaxLV7f
	pz+V0TbFNKjrNCrB0CfPWEkizCs33tswLR3RZdZ7Ujy8+C30bKlE+Otsw5PsYuC9tMf3Y2z0Fx/sA
	iG77GyAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaijX-00000005NBk-1Cr2;
	Tue, 30 Dec 2025 23:02:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaijE-00000005Mm4-0Ffj
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 30 Dec 2025 23:02:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5Cc6wkm6hIGFSfttAC+mfZ95Ec3DVPFhFOuj3x7H3nk=; b=Q2E5HUdwJIOgrkMLNm4TOjYW4H
	hap8UZj0vICy3taJpdGb6LvUXSiJ1K1l8dRAnkwZqYjQ1ALQuSI7oMb0tXUdMyBU6GO+vBfvZnwey
	3E990Q1mNickVVumbkFnsPJ0x874Z+NQZwFE6LhGNXOPnjdQ0tuoIqPH7O8bUwFt3iYwf4KG1pxPp
	leg18UDWDDyf9iU3KGqP+HqvZImOOubmJNy+VtMovtsYja40hpW7Sy9FAfa1JSPESlzXgN72HJZNh
	jmv7ySAfGXVha66T37oJtE5r+5FuOlFRRrPwHg0IsnqQ83Bhwc/rcvWOBa1mKYTUnpCprlSSK1KvV
	HHwSMcqg==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaij9-00000004Byq-2bjq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 23:02:10 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-34a9bb41009so16720274a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Dec 2025 15:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767135725; x=1767740525; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=5Cc6wkm6hIGFSfttAC+mfZ95Ec3DVPFhFOuj3x7H3nk=;
        b=N71jHAiwBa9VFp9wPkW0q0AjZER8LR4G2ywW8U9lw2EwR0wUi460L/qGhadk57UH85
         3e2t0C5SnuUl2aBQiD+h83iRCykWky7hocWdUp/2cfIFcOcIzLf4b1DdZw4SPdvO5HPk
         hK3V2TUhINHU7m1oT2SyIN8xodrOhLVQ/B8Ayj7nKQoTgDBFmHRxw8tXQfZKa+c9sTR9
         Yq9o7Bsjq7Ssk+4TjUghJx8L6/BGsDAxO1MthrD7WN1Ypf0sBJnkj0QUZTZXs6ECETcp
         KfWuH7QDX3D3RJ5yso8L2vufmeCVHtYuJmUjHQq2Eoe/+eRb492l6GPSF25GmZfKV3Mc
         zfyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767135725; x=1767740525;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Cc6wkm6hIGFSfttAC+mfZ95Ec3DVPFhFOuj3x7H3nk=;
        b=TmunjA+Pn3Hc1hn7cNjBLkzdYeGqy4GODr7jO6LeUxn3INCG/SWbJ7ZdzMtFI08Vca
         NEXByB7diZT5bipNVe2EDC06i7veeq8Gbp71/ZLzN42HJV67P00AiAV8TM5N6kEQ3w9K
         fNr8/308kB7Cg7X5Wx0vZbwMtWoaLF1yoPlzPInN4CgnyMsSL7VTg7Q0yZYek9EBmVxe
         JvKHfm6ZNNkd8akznGvU5xs4oO1yd8XxFKSLMeajUqGereivJvJxlf2T6MCrrS6O9m/Q
         EuOk1DP/gR4Jhp3bRSxA5vyjGQ0YB+63gEFkmW1mbfz2mIZzbeeiWIwyRphzIpUTPD7/
         WK0g==
X-Forwarded-Encrypted: i=1; AJvYcCXN8LHMgeHK79L+mNlZiGkruEyoM6jWHPv9X5tBzIjU2rDpTZNZTp8yBLXvtZ8ewBsPJKTyB0RyK7vEBNAD1KZk@lists.infradead.org
X-Gm-Message-State: AOJu0YxHuB90Bu2cXL0ma7MixsRuS48uaksQu+XALvq6jnhx5lMNAqWV
	nDs2uwYJjZwIrpkqhB3i7ugL1Du3uIuZ3XfTkKAtBurQ1rxgZW9zXPGUM/1Raxw9O/u3H+F4vXJ
	DspNe5w==
X-Google-Smtp-Source: AGHT+IEOOU/PO2opx5uUUNTa4NR3nkLk9xuANEwk4g6N1XvLso6TqSi1gOEvbsBH7aLFxJKOwgJ+kV8p0Fg=
X-Received: from pjnz3.prod.google.com ([2002:a17:90a:8b83:b0:34a:bee9:ef2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2e08:b0:340:ad5e:ca
 with SMTP id 98e67ed59e1d1-34e92139e3amr31373229a91.12.1767135724924; Tue, 30
 Dec 2025 15:02:04 -0800 (PST)
Date: Tue, 30 Dec 2025 15:01:36 -0800
In-Reply-To: <20251230230150.4150236-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251230230150.4150236-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Message-ID: <20251230230150.4150236-8-seanjc@google.com>
Subject: [PATCH v4 07/21] KVM: selftests: Plumb "struct kvm_mmu" into x86's
 MMU APIs
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
X-CRM114-CacheID: sfid-20251230_230208_161145_905F4A99 
X-CRM114-Status: GOOD (  17.63  )
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

In preparation for generalizing the x86 virt mapping APIs to work with
TDP (stage-2) page tables, plumb "struct kvm_mmu" into all of the helper
functions instead of operating on vm->mmu directly.

Opportunistically swap the order of the check in virt_get_pte() to first
assert that the parent is the PGD, and then check that the PTE is present,
as it makes more sense to check if the parent PTE is the PGD/root (i.e.
not a PTE) before checking that the PTE is PRESENT.

No functional change intended.

Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Yosry Ahmed <yosry.ahmed@linux.dev>
[sean: rebase on common kvm_mmu structure, rewrite changelog]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/include/x86/processor.h     |  3 +-
 .../testing/selftests/kvm/lib/x86/processor.c | 68 +++++++++++--------
 2 files changed, 41 insertions(+), 30 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/processor.h b/tools/testing/selftests/kvm/include/x86/processor.h
index c00c0fbe62cd..cbac9de29074 100644
--- a/tools/testing/selftests/kvm/include/x86/processor.h
+++ b/tools/testing/selftests/kvm/include/x86/processor.h
@@ -1449,7 +1449,8 @@ enum pg_level {
 #define PG_SIZE_2M PG_LEVEL_SIZE(PG_LEVEL_2M)
 #define PG_SIZE_1G PG_LEVEL_SIZE(PG_LEVEL_1G)
 
-void __virt_pg_map(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr, int level);
+void __virt_pg_map(struct kvm_vm *vm, struct kvm_mmu *mmu, uint64_t vaddr,
+		   uint64_t paddr,  int level);
 void virt_map_level(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr,
 		    uint64_t nr_bytes, int level);
 
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index f027f86d1535..f25742a804b0 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -156,26 +156,31 @@ bool kvm_is_tdp_enabled(void)
 		return get_kvm_amd_param_bool("npt");
 }
 
-void virt_arch_pgd_alloc(struct kvm_vm *vm)
+static void virt_mmu_init(struct kvm_vm *vm, struct kvm_mmu *mmu)
 {
-	TEST_ASSERT(vm->mode == VM_MODE_PXXVYY_4K,
-		    "Unknown or unsupported guest mode: 0x%x", vm->mode);
-
 	/* If needed, create the top-level page table. */
-	if (!vm->mmu.pgd_created) {
-		vm->mmu.pgd = vm_alloc_page_table(vm);
-		vm->mmu.pgd_created = true;
+	if (!mmu->pgd_created) {
+		mmu->pgd = vm_alloc_page_table(vm);
+		mmu->pgd_created = true;
 	}
 }
 
-static void *virt_get_pte(struct kvm_vm *vm, uint64_t *parent_pte,
-			  uint64_t vaddr, int level)
+void virt_arch_pgd_alloc(struct kvm_vm *vm)
+{
+	TEST_ASSERT(vm->mode == VM_MODE_PXXVYY_4K,
+		    "Unknown or unsupported guest mode: 0x%x", vm->mode);
+
+	virt_mmu_init(vm, &vm->mmu);
+}
+
+static void *virt_get_pte(struct kvm_vm *vm, struct kvm_mmu *mmu,
+			  uint64_t *parent_pte, uint64_t vaddr, int level)
 {
 	uint64_t pt_gpa = PTE_GET_PA(*parent_pte);
 	uint64_t *page_table = addr_gpa2hva(vm, pt_gpa);
 	int index = (vaddr >> PG_LEVEL_SHIFT(level)) & 0x1ffu;
 
-	TEST_ASSERT((*parent_pte & PTE_PRESENT_MASK) || parent_pte == &vm->mmu.pgd,
+	TEST_ASSERT((*parent_pte == mmu->pgd) || (*parent_pte & PTE_PRESENT_MASK),
 		    "Parent PTE (level %d) not PRESENT for gva: 0x%08lx",
 		    level + 1, vaddr);
 
@@ -183,13 +188,14 @@ static void *virt_get_pte(struct kvm_vm *vm, uint64_t *parent_pte,
 }
 
 static uint64_t *virt_create_upper_pte(struct kvm_vm *vm,
+				       struct kvm_mmu *mmu,
 				       uint64_t *parent_pte,
 				       uint64_t vaddr,
 				       uint64_t paddr,
 				       int current_level,
 				       int target_level)
 {
-	uint64_t *pte = virt_get_pte(vm, parent_pte, vaddr, current_level);
+	uint64_t *pte = virt_get_pte(vm, mmu, parent_pte, vaddr, current_level);
 
 	paddr = vm_untag_gpa(vm, paddr);
 
@@ -215,10 +221,11 @@ static uint64_t *virt_create_upper_pte(struct kvm_vm *vm,
 	return pte;
 }
 
-void __virt_pg_map(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr, int level)
+void __virt_pg_map(struct kvm_vm *vm, struct kvm_mmu *mmu, uint64_t vaddr,
+		   uint64_t paddr, int level)
 {
 	const uint64_t pg_size = PG_LEVEL_SIZE(level);
-	uint64_t *pte = &vm->mmu.pgd;
+	uint64_t *pte = &mmu->pgd;
 	int current_level;
 
 	TEST_ASSERT(vm->mode == VM_MODE_PXXVYY_4K,
@@ -243,17 +250,17 @@ void __virt_pg_map(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr, int level)
 	 * Allocate upper level page tables, if not already present.  Return
 	 * early if a hugepage was created.
 	 */
-	for (current_level = vm->mmu.pgtable_levels;
+	for (current_level = mmu->pgtable_levels;
 	     current_level > PG_LEVEL_4K;
 	     current_level--) {
-		pte = virt_create_upper_pte(vm, pte, vaddr, paddr,
+		pte = virt_create_upper_pte(vm, mmu, pte, vaddr, paddr,
 					    current_level, level);
 		if (*pte & PTE_LARGE_MASK)
 			return;
 	}
 
 	/* Fill in page table entry. */
-	pte = virt_get_pte(vm, pte, vaddr, PG_LEVEL_4K);
+	pte = virt_get_pte(vm, mmu, pte, vaddr, PG_LEVEL_4K);
 	TEST_ASSERT(!(*pte & PTE_PRESENT_MASK),
 		    "PTE already present for 4k page at vaddr: 0x%lx", vaddr);
 	*pte = PTE_PRESENT_MASK | PTE_WRITABLE_MASK | (paddr & PHYSICAL_PAGE_MASK);
@@ -270,7 +277,7 @@ void __virt_pg_map(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr, int level)
 
 void virt_arch_pg_map(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr)
 {
-	__virt_pg_map(vm, vaddr, paddr, PG_LEVEL_4K);
+	__virt_pg_map(vm, &vm->mmu, vaddr, paddr, PG_LEVEL_4K);
 }
 
 void virt_map_level(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr,
@@ -285,7 +292,7 @@ void virt_map_level(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr,
 		    nr_bytes, pg_size);
 
 	for (i = 0; i < nr_pages; i++) {
-		__virt_pg_map(vm, vaddr, paddr, level);
+		__virt_pg_map(vm, &vm->mmu, vaddr, paddr, level);
 		sparsebit_set_num(vm->vpages_mapped, vaddr >> vm->page_shift,
 				  nr_bytes / PAGE_SIZE);
 
@@ -294,7 +301,8 @@ void virt_map_level(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr,
 	}
 }
 
-static bool vm_is_target_pte(uint64_t *pte, int *level, int current_level)
+static bool vm_is_target_pte(struct kvm_mmu *mmu, uint64_t *pte,
+			     int *level, int current_level)
 {
 	if (*pte & PTE_LARGE_MASK) {
 		TEST_ASSERT(*level == PG_LEVEL_NONE ||
@@ -306,17 +314,19 @@ static bool vm_is_target_pte(uint64_t *pte, int *level, int current_level)
 	return *level == current_level;
 }
 
-static uint64_t *__vm_get_page_table_entry(struct kvm_vm *vm, uint64_t vaddr,
+static uint64_t *__vm_get_page_table_entry(struct kvm_vm *vm,
+					   struct kvm_mmu *mmu,
+					   uint64_t vaddr,
 					   int *level)
 {
-	int va_width = 12 + (vm->mmu.pgtable_levels) * 9;
-	uint64_t *pte = &vm->mmu.pgd;
+	int va_width = 12 + (mmu->pgtable_levels) * 9;
+	uint64_t *pte = &mmu->pgd;
 	int current_level;
 
 	TEST_ASSERT(!vm->arch.is_pt_protected,
 		    "Walking page tables of protected guests is impossible");
 
-	TEST_ASSERT(*level >= PG_LEVEL_NONE && *level <= vm->mmu.pgtable_levels,
+	TEST_ASSERT(*level >= PG_LEVEL_NONE && *level <= mmu->pgtable_levels,
 		    "Invalid PG_LEVEL_* '%d'", *level);
 
 	TEST_ASSERT(vm->mode == VM_MODE_PXXVYY_4K,
@@ -332,22 +342,22 @@ static uint64_t *__vm_get_page_table_entry(struct kvm_vm *vm, uint64_t vaddr,
 		    (((int64_t)vaddr << (64 - va_width) >> (64 - va_width))),
 		    "Canonical check failed.  The virtual address is invalid.");
 
-	for (current_level = vm->mmu.pgtable_levels;
+	for (current_level = mmu->pgtable_levels;
 	     current_level > PG_LEVEL_4K;
 	     current_level--) {
-		pte = virt_get_pte(vm, pte, vaddr, current_level);
-		if (vm_is_target_pte(pte, level, current_level))
+		pte = virt_get_pte(vm, mmu, pte, vaddr, current_level);
+		if (vm_is_target_pte(mmu, pte, level, current_level))
 			return pte;
 	}
 
-	return virt_get_pte(vm, pte, vaddr, PG_LEVEL_4K);
+	return virt_get_pte(vm, mmu, pte, vaddr, PG_LEVEL_4K);
 }
 
 uint64_t *vm_get_page_table_entry(struct kvm_vm *vm, uint64_t vaddr)
 {
 	int level = PG_LEVEL_4K;
 
-	return __vm_get_page_table_entry(vm, vaddr, &level);
+	return __vm_get_page_table_entry(vm, &vm->mmu, vaddr, &level);
 }
 
 void virt_arch_dump(FILE *stream, struct kvm_vm *vm, uint8_t indent)
@@ -497,7 +507,7 @@ static void kvm_seg_set_kernel_data_64bit(struct kvm_segment *segp)
 vm_paddr_t addr_arch_gva2gpa(struct kvm_vm *vm, vm_vaddr_t gva)
 {
 	int level = PG_LEVEL_NONE;
-	uint64_t *pte = __vm_get_page_table_entry(vm, gva, &level);
+	uint64_t *pte = __vm_get_page_table_entry(vm, &vm->mmu, gva, &level);
 
 	TEST_ASSERT(*pte & PTE_PRESENT_MASK,
 		    "Leaf PTE not PRESENT for gva: 0x%08lx", gva);
-- 
2.52.0.351.gbe84eed79e-goog


