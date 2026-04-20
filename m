Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E40F5A8C7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 21:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/wqyOTzheuJxJ8S4g/++8igtrJuOvPAFVCvhgsDhrq0=; b=luWvdYyCengDgJVda+iJ+q51/C
	FvgsyQDb7BlW1RoD+tc/vAovMtSgZlwxYyDdE/UeZpKudxtHMFOghiQvBT8aXv1my2mKjzAWC/LT1
	CebOA9US9B68LiyeBsrtLf7VXLQ03dcROHcy4BAqoLlvEuQV+gx0zP9yRQDKCcOW4MvUznUFS7NfY
	+zWR7GLGv6tTQeK6AchwCUqLQM1wFQ9qfmqdIlzqGcsAE2nayuhUdv4CY3UhJzM8d7+Tq4kS/b6L3
	B+qgWfRkAImypqcNwJNV/MEqByDxdbRgmEOBp+ecjUeOgZRfZRGuAqjO8b/j7H2dpBi9+9CQI2SmQ
	gkRQFNsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEw3F-00000007gV8-1rJL;
	Mon, 20 Apr 2026 21:21:05 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEw2h-00000007fok-2wtf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 21:20:37 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-c70f19f0f37so1513028a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 14:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776720029; x=1777324829; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=/wqyOTzheuJxJ8S4g/++8igtrJuOvPAFVCvhgsDhrq0=;
        b=qCPA8TrrTCx2y/t+F0wUMZiWs2wUxAbiw+ry6bnNCkCLfNSjv1sOuQrO88vKPzTawz
         pNbx2LkaVxE+kejmogjRAcnvllc1zgcglMMvwNFSe7oN2j+UGAUcv4zQS1qucrJlNE8I
         O4gXzVQY5C9FBy9Y/dl5C8dcK+zCeBs/cyou6HQ9bCiymznRPUi64u9urWWPiUS7Ks6j
         UYdMG5Cig4z/vrwruJAIo1gaGnIPrC9LxS9cbIwTvUMl4y6ykop8AQhu7Sw8VeTMnFtb
         +0uIZxWWxMlYfeFEUP/FpJpWu2ypnzY0EUJOrsODDWByvEFClezC5GQ0VWbnQqBhUDid
         a1SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776720029; x=1777324829;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/wqyOTzheuJxJ8S4g/++8igtrJuOvPAFVCvhgsDhrq0=;
        b=nyn1IhOPhd/kdM0yeE2xsMu4G2LePh8XnsEml2LvhLj1EDVxS2noZSFDtBb22j/Ire
         cG4tHm2hW5GuYrIE7ORrYkSkVHbx+95VfTgb2t+1roG5/tqjAa2ayXajSiu1Rvph8zEz
         JlqraJsrFggsDksXeVkfZAdjqwuOysUwxo0wmRqP4LdUaoeP8MtRFphzIR0HGHxsI6Hw
         vtdjc4i2Loq+rGYcGfdNbkXybA+PFa4f+cUUoF02z2Bcx5AlY2E2uVwa6q9nVxqNHeb0
         jW88U2asnbqHPLzjewyHIUGkHqJZqCI7i0Otuf5binZtMyJOcwEegF6q9p5ADeIO857m
         tbqg==
X-Forwarded-Encrypted: i=1; AFNElJ+HCu/+c+cF9S9vqjkqyMUBcg4jaSkl39ot0xPi0cg03KFVrklSa2mTIhL0NQrlHa/xc1Ih+aTopUUEzONar1oA@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9RnFSk4Pou8oRSYEZH1jqezwFQo0RzUlUxcyfyY4LT0Mc0n3j
	e7hoO1ZOqXrN1cjGlMA4AgtUDhJ/9T2zrT5LUTeEsUumemdx59axxLku4353VVg83UayAhGRZZA
	MYacaqw==
X-Received: from pgiz3.prod.google.com ([2002:a63:c043:0:b0:c79:65cb:1f76])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:2584:b0:39f:c93e:c7f7
 with SMTP id adf61e73a8af0-3a08c626f18mr12869336637.0.1776720029334; Mon, 20
 Apr 2026 14:20:29 -0700 (PDT)
Date: Mon, 20 Apr 2026 14:19:57 -0700
In-Reply-To: <20260420212004.3938325-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260420212004.3938325-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.rc1.555.g9c883467ad-goog
Message-ID: <20260420212004.3938325-13-seanjc@google.com>
Subject: [PATCH v3 12/19] KVM: selftests: Rename vm_vaddr_unused_gap() => vm_unused_gva_gap()
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
	linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_142031_820079_A5CF63C5 
X-CRM114-Status: GOOD (  15.75  )
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

Now that KVM selftests use gva_t instead of vm_vaddr_t, rename the API
for finding an unused range of virtual memory to drop the defunct
terminology and use "vm" for the scope.

Opportunistically clean up the function comment to drop superfluous
and redundant information.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../testing/selftests/kvm/include/kvm_util.h  |  2 +-
 tools/testing/selftests/kvm/lib/arm64/ucall.c |  2 +-
 tools/testing/selftests/kvm/lib/kvm_util.c    | 24 ++++---------------
 .../selftests/kvm/lib/loongarch/ucall.c       |  2 +-
 .../selftests/kvm/x86/hyperv_tlb_flush.c      |  2 +-
 5 files changed, 9 insertions(+), 23 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 8f7afc34ea8d..0239e89320e5 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -715,7 +715,7 @@ void vm_mem_region_move(struct kvm_vm *vm, u32 slot, u64 new_gpa);
 void vm_mem_region_delete(struct kvm_vm *vm, u32 slot);
 struct kvm_vcpu *__vm_vcpu_add(struct kvm_vm *vm, u32 vcpu_id);
 void vm_populate_vaddr_bitmap(struct kvm_vm *vm);
-gva_t vm_vaddr_unused_gap(struct kvm_vm *vm, size_t sz, gva_t vaddr_min);
+gva_t vm_unused_gva_gap(struct kvm_vm *vm, size_t sz, gva_t vaddr_min);
 gva_t vm_alloc(struct kvm_vm *vm, size_t sz, gva_t vaddr_min);
 gva_t __vm_alloc(struct kvm_vm *vm, size_t sz, gva_t vaddr_min,
 		 enum kvm_mem_region_type type);
diff --git a/tools/testing/selftests/kvm/lib/arm64/ucall.c b/tools/testing/selftests/kvm/lib/arm64/ucall.c
index 8257dc4ae106..e0550ad5aa75 100644
--- a/tools/testing/selftests/kvm/lib/arm64/ucall.c
+++ b/tools/testing/selftests/kvm/lib/arm64/ucall.c
@@ -10,7 +10,7 @@ gva_t *ucall_exit_mmio_addr;
 
 void ucall_arch_init(struct kvm_vm *vm, gpa_t mmio_gpa)
 {
-	gva_t mmio_gva = vm_vaddr_unused_gap(vm, vm->page_size, KVM_UTIL_MIN_VADDR);
+	gva_t mmio_gva = vm_unused_gva_gap(vm, vm->page_size, KVM_UTIL_MIN_VADDR);
 
 	virt_map(vm, mmio_gva, mmio_gpa, 1);
 
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index b304c0e54837..8c82b40a7448 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -1366,26 +1366,12 @@ struct kvm_vcpu *__vm_vcpu_add(struct kvm_vm *vm, u32 vcpu_id)
 }
 
 /*
- * VM Virtual Address Unused Gap
- *
- * Input Args:
- *   vm - Virtual Machine
- *   sz - Size (bytes)
- *   vaddr_min - Minimum Virtual Address
- *
- * Output Args: None
- *
- * Return:
- *   Lowest virtual address at or above vaddr_min, with at least
- *   sz unused bytes.  TEST_ASSERT failure if no area of at least
- *   size sz is available.
- *
- * Within the VM specified by vm, locates the lowest starting virtual
- * address >= vaddr_min, that has at least sz unallocated bytes.  A
+ * Within the VM specified by @vm, locates the lowest starting guest virtual
+ * address >= @vaddr_min, that has at least @sz unallocated bytes.  A
  * TEST_ASSERT failure occurs for invalid input or no area of at least
- * sz unallocated bytes >= vaddr_min is available.
+ * @sz unallocated bytes >= @min_gva is available.
  */
-gva_t vm_vaddr_unused_gap(struct kvm_vm *vm, size_t sz, gva_t vaddr_min)
+gva_t vm_unused_gva_gap(struct kvm_vm *vm, size_t sz, gva_t vaddr_min)
 {
 	u64 pages = (sz + vm->page_size - 1) >> vm->page_shift;
 
@@ -1464,7 +1450,7 @@ static gva_t ____vm_alloc(struct kvm_vm *vm, size_t sz, gva_t vaddr_min,
 	 * Find an unused range of virtual page addresses of at least
 	 * pages in length.
 	 */
-	gva_t vaddr_start = vm_vaddr_unused_gap(vm, sz, vaddr_min);
+	gva_t vaddr_start = vm_unused_gva_gap(vm, sz, vaddr_min);
 
 	/* Map the virtual pages. */
 	for (gva_t vaddr = vaddr_start; pages > 0;
diff --git a/tools/testing/selftests/kvm/lib/loongarch/ucall.c b/tools/testing/selftests/kvm/lib/loongarch/ucall.c
index eb9f714a535c..cd49a3440ead 100644
--- a/tools/testing/selftests/kvm/lib/loongarch/ucall.c
+++ b/tools/testing/selftests/kvm/lib/loongarch/ucall.c
@@ -13,7 +13,7 @@ gva_t *ucall_exit_mmio_addr;
 
 void ucall_arch_init(struct kvm_vm *vm, gpa_t mmio_gpa)
 {
-	gva_t mmio_gva = vm_vaddr_unused_gap(vm, vm->page_size, KVM_UTIL_MIN_VADDR);
+	gva_t mmio_gva = vm_unused_gva_gap(vm, vm->page_size, KVM_UTIL_MIN_VADDR);
 
 	virt_map(vm, mmio_gva, mmio_gpa, 1);
 
diff --git a/tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c b/tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c
index 6adf76574921..15ee8b7bfc11 100644
--- a/tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c
+++ b/tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c
@@ -617,7 +617,7 @@ int main(int argc, char *argv[])
 	 * Get PTE pointers for test pages and map them inside the guest.
 	 * Use separate page for each PTE for simplicity.
 	 */
-	gva = vm_vaddr_unused_gap(vm, NTEST_PAGES * PAGE_SIZE, KVM_UTIL_MIN_VADDR);
+	gva = vm_unused_gva_gap(vm, NTEST_PAGES * PAGE_SIZE, KVM_UTIL_MIN_VADDR);
 	for (i = 0; i < NTEST_PAGES; i++) {
 		pte = vm_get_pte(vm, data->test_pages + i * PAGE_SIZE);
 		gpa = addr_hva2gpa(vm, pte);
-- 
2.54.0.rc1.555.g9c883467ad-goog


