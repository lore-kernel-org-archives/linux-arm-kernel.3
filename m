Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0384AC624DA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 16:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WnzaMKfYFzpdBR00mBxUkRbzuomQsYg60ItfNS+IF/Y=; b=nbIButwsOkxRAsO7dnSvNpqLsQ
	3NkvuX9JDLZ44LVz4kK3oI1YqWORsoFFglFIVK3oC5IKNjQB9FnoDexl/4NLeWkqhHOX20GQ3L6n5
	BhiEdTiOyeZoBuPq4TT0yiRIhHntmgGNW6zVOZrTvdiiK0uZ+3oTgZqpSpTvaMXIPZnB59Yz46xQc
	LWuWduFs5zu1L6fbnPtrt3tBX4H6BvctHPvSAF4ShMIEa5btwUbgzxYMfyBL1aLJTJDUi8OjMQsEM
	ztv6uZD/7jAvMOfZYDuO0C605x9FsWM/EpH8Rmikm3dI28CQCIjCkNcTWt4tkEBwQo0DBKj73jwwN
	ksfV7B8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o2I-0000000FFHu-1JSr;
	Wed, 02 Sep 2026 16:42:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o1x-0000000FEZ3-0zGa
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 02 Sep 2026 16:41:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WnzaMKfYFzpdBR00mBxUkRbzuomQsYg60ItfNS+IF/Y=; b=Efpf95u5NO1WrA3aWASV6IKp2W
	C/rAh2l0NbCBERUeaqbG4pOzX0HvQPaWAAMs45lh01kfiEuNr8lq2UkY6hUThHVk0jQBoglFPlMc8
	legi/Ne/n62be5Ys6VgSZTb9oPrHpGGKtDqro6azXsSCDc27PZnwGX8ihn+DRcFBiEmy4lbzugX1a
	QNVh0LPVCwg+C3jE+uva0qhS8K8rFh6yst1IshpAE2CmHuiEOb4aKN77408b2SSwXDkzrjEhYe5X7
	bfBdDL+c2+FII9aJODYWBGlHDW4YzuRKKVKasOyXFZJrTk94Ec/XO22yRVY0fy5y6C0ujph1QxWVC
	ZJxrmvTw==;
Received: from mail-pg1-x546.google.com ([2607:f8b0:4864:20::546])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x1o1u-0000000CD7x-0jA6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 16:41:44 +0000
Received: by mail-pg1-x546.google.com with SMTP id 41be03b00d2f7-c85798977dcso1990014a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 09:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788367300; x=1788972100; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WnzaMKfYFzpdBR00mBxUkRbzuomQsYg60ItfNS+IF/Y=;
        b=C/YySPavvCrXEwW88I4Co7KYFN2Crrrz5nfbXurmqF736zVAJtV3JQl/P/R844rSlB
         qDh3ie3G7IOAetcM/uVl0nQBZ9Ksb1cOwfFQsRLNYAZol3Ezx+ly3Bp/GYMGIKJP1Zff
         WZsskh60TJ+KE0zTZuVsniHhb/7mbsTIUWM5L5oWSDFiIyb66vqvcfWxTX0Cx4NClkfG
         EBahHO/VKp/xmn8aGsIAF5JmyoInK79vOUBcRvLlGbAeDsI380e2djvGwQJSl9jScQls
         FQ2V2+QdbgLkMa97/6D5WM9YqUvB+HeBRfE3GQwQPYsQlYKg0Bk6/O7zNiiT6cVXfOen
         zk9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367300; x=1788972100;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WnzaMKfYFzpdBR00mBxUkRbzuomQsYg60ItfNS+IF/Y=;
        b=NDE6cl4MABEEYOokKBcrE82fAWV6VcoPduJxPp/Mf2xeEDp1gPQLn3uObz40/aiK3l
         MIuO89g9zvSlhaH2cK75Zyxebki55JGegFKAvej87itxwyiN6TGe1Th4DlCoEmq5T3Qr
         ZPzTI1eGROciQEZ8duXnOKOaD9SwxPZ7UT6Pnp3u7U5ZtDKGABG0Lk8AdH7b6VszFshs
         G9++erAwDXKRbagSvSTM8CnrsjxFv8aM2muKd9PzsFvKYPXNLxyrtA5BvMzEPoEJdzBx
         w3Gr+fTsOrLrQP3NL90GQAk0qsBQLm9grRtCP/HH7zpFPCF20DLy0WjzO2EJoObrRCt/
         Zndg==
X-Forwarded-Encrypted: i=1; AKwUvBy/3l5ASdjZWzXy/YMBGojK28VGCQazAR21TrHUMEbkgMjo+5JkD7H7ML8WA52nmxJXCCuKKW5Sq3dOVPqtbytT@lists.infradead.org
X-Gm-Message-State: AFuF++maemhRoJHT7yFAghbTMh96atbioPcBrFRrwrxCUp48Ix6PDYoD
	5ivDVw0jgpBbC3VN730zz3E///71SGIT24OTqVmMPxoW3SpWe3ZhPS6XvfbI/jjxht4fC7Hx5Bw
	eEZZO/A==
X-Received: from pgwa1.prod.google.com ([2002:a65:6541:0:b0:cc1:c7d5:9661])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:134b:b0:3c4:4272:b400
 with SMTP id adf61e73a8af0-3d9ae8e1ee9mr11072673637.18.1788367299354; Wed, 02
 Sep 2026 09:41:39 -0700 (PDT)
Date: Wed,  2 Sep 2026 09:41:15 -0700
In-Reply-To: <20260902164123.2546762-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260902164123.2546762-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260902164123.2546762-13-seanjc@google.com>
Subject: [PATCH v2 12/20] KVM: selftests: Add APIs to override memory region
 types with custom memslots
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, 
	Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Ritesh Harjani <ritesh.list@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_174142_316894_37A5CACB 
X-CRM114-Status: GOOD (  14.42  )
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

Add and use APIs to override memory region types instead of open coding the
logic in tests, partly to dedup test code, but mostly to add some amount of
protection against conflicting overrides.  This will allow converting more
tests to override memory regions without taking on too much risk of bugs in
the long term, e.g. due to silently overriding a region multiple times.

Deliberately "unroll" the loops in __vm_create() and the CMMA test's
create_main_memslot() to avoid filling all memslots in anticipation of
adding an "extra" memslot that is for test use and *only* test use, i.e.
shouldn't be configured by core library code.

Converting tests to overriding memory regions will allow taking the region
type instead of the raw memslot in the physical page allocator APIs.

Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/arm64/page_fault_test.c     | 18 +++++------
 .../testing/selftests/kvm/include/kvm_util.h  | 30 +++++++++++++++++++
 tools/testing/selftests/kvm/lib/kvm_util.c    |  8 +++--
 tools/testing/selftests/kvm/s390/cmma_test.c  | 19 ++++--------
 4 files changed, 49 insertions(+), 26 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/page_fault_test.c b/tools/testing/selftests/kvm/arm64/page_fault_test.c
index 6bb3d82906b2..b0e3fc8cd76a 100644
--- a/tools/testing/selftests/kvm/arm64/page_fault_test.c
+++ b/tools/testing/selftests/kvm/arm64/page_fault_test.c
@@ -597,18 +597,16 @@ static void setup_memslots(struct kvm_vm *vm, struct test_params *p)
 
 	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, 0,
 				    CODE_AND_DATA_MEMSLOT, code_npages, 0);
-	vm->memslots[MEM_REGION_CODE] = CODE_AND_DATA_MEMSLOT;
-	vm->memslots[MEM_REGION_DATA] = CODE_AND_DATA_MEMSLOT;
+	____vm_override_mem_region(vm, MEM_REGION_CODE, CODE_AND_DATA_MEMSLOT);
+	____vm_override_mem_region(vm, MEM_REGION_DATA, CODE_AND_DATA_MEMSLOT);
 
-	vm_userspace_mem_region_add(vm, p->src_type, data_gpa - pt_size,
-				    PAGE_TABLE_MEMSLOT, pt_size / guest_page_size,
-				    p->test_desc->pt_memslot_flags);
-	vm->memslots[MEM_REGION_PT] = PAGE_TABLE_MEMSLOT;
+	__vm_override_mem_region(vm, MEM_REGION_PT, p->src_type, data_gpa - pt_size,
+				 PAGE_TABLE_MEMSLOT, pt_size / guest_page_size,
+				 p->test_desc->pt_memslot_flags);
 
-	vm_userspace_mem_region_add(vm, p->src_type, data_gpa, TEST_DATA_MEMSLOT,
-				    data_size / guest_page_size,
-				    p->test_desc->data_memslot_flags);
-	vm->memslots[MEM_REGION_TEST_DATA] = TEST_DATA_MEMSLOT;
+	__vm_override_mem_region(vm, MEM_REGION_TEST_DATA, p->src_type, data_gpa,
+				 TEST_DATA_MEMSLOT, data_size / guest_page_size,
+				 p->test_desc->data_memslot_flags);
 }
 
 static void setup_ucall(struct kvm_vm *vm)
diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 304ef6af3268..c8faa8a02b93 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -704,6 +704,36 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
 		gpa_t gpa, u32 slot, u64 npages, u32 flags,
 		int guest_memfd_fd, u64 guest_memfd_offset);
 
+
+static inline void ____vm_override_mem_region(struct kvm_vm *vm,
+					      enum kvm_mem_region_type type,
+					      u32 slot)
+{
+	TEST_ASSERT(vm->memslots[type] == KVM_INVALID_MEMSLOT,
+		    "Memory region type '%u' was already overridden with slot=%u",
+		    type, vm->memslots[type]);
+
+	vm->memslots[type] = slot;
+}
+
+static inline void __vm_override_mem_region(struct kvm_vm *vm,
+					    enum kvm_mem_region_type type,
+					    enum vm_mem_backing_src_type src_type,
+					    gpa_t gpa, u32 slot, u64 npages,
+					    u32 flags)
+{
+	____vm_override_mem_region(vm, type, slot);
+	vm_userspace_mem_region_add(vm, src_type, gpa, slot, npages, flags);
+}
+
+static inline void vm_override_mem_region(struct kvm_vm *vm,
+					  enum kvm_mem_region_type type,
+					  enum vm_mem_backing_src_type src_type,
+					  gpa_t gpa, u32 slot, u64 npages)
+{
+	__vm_override_mem_region(vm, type, src_type, gpa, slot, npages, 0);
+}
+
 #ifndef vm_arch_has_protected_memory
 static inline bool vm_arch_has_protected_memory(struct kvm_vm *vm)
 {
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 56df5b1d9c79..781af2928d04 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -495,7 +495,7 @@ struct kvm_vm *__vm_create(struct vm_shape shape, u32 nr_runnable_vcpus,
 						 nr_extra_pages);
 	struct userspace_mem_region *slot0;
 	struct kvm_vm *vm;
-	int i, flags;
+	int flags;
 
 	kvm_set_files_rlimit(nr_runnable_vcpus);
 
@@ -513,8 +513,10 @@ struct kvm_vm *__vm_create(struct vm_shape shape, u32 nr_runnable_vcpus,
 		flags |= KVM_MEM_GUEST_MEMFD;
 
 	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, 0, 0, nr_pages, flags);
-	for (i = 0; i < NR_MEM_REGIONS; i++)
-		vm->memslots[i] = 0;
+	____vm_override_mem_region(vm, MEM_REGION_CODE, 0);
+	____vm_override_mem_region(vm, MEM_REGION_PT, 0);
+	____vm_override_mem_region(vm, MEM_REGION_DATA, 0);
+	____vm_override_mem_region(vm, MEM_REGION_TEST_DATA, 0);
 
 	kvm_vm_elf_load(vm, program_invocation_name);
 
diff --git a/tools/testing/selftests/kvm/s390/cmma_test.c b/tools/testing/selftests/kvm/s390/cmma_test.c
index 15d81b2ed7ad..73387cc3bca7 100644
--- a/tools/testing/selftests/kvm/s390/cmma_test.c
+++ b/tools/testing/selftests/kvm/s390/cmma_test.c
@@ -102,24 +102,17 @@ static void guest_dirty_test_data(void)
 
 static void create_main_memslot(struct kvm_vm *vm)
 {
-	int i;
-
 	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, 0, 0, MAIN_PAGE_COUNT, 0);
-	/* set the array of memslots to zero like __vm_create does */
-	for (i = 0; i < NR_MEM_REGIONS; i++)
-		vm->memslots[i] = 0;
+	____vm_override_mem_region(vm, MEM_REGION_CODE, 0);
+	____vm_override_mem_region(vm, MEM_REGION_PT, 0);
+	____vm_override_mem_region(vm, MEM_REGION_DATA, 0);
 }
 
 static void create_test_memslot(struct kvm_vm *vm)
 {
-	vm_userspace_mem_region_add(vm,
-				    VM_MEM_SRC_ANONYMOUS,
-				    TEST_DATA_START_GFN << vm->page_shift,
-				    TEST_DATA_MEMSLOT,
-				    TEST_DATA_PAGE_COUNT,
-				    0
-				   );
-	vm->memslots[MEM_REGION_TEST_DATA] = TEST_DATA_MEMSLOT;
+	vm_override_mem_region(vm, MEM_REGION_TEST_DATA, VM_MEM_SRC_ANONYMOUS,
+			       TEST_DATA_START_GFN << vm->page_shift,
+			       TEST_DATA_MEMSLOT, TEST_DATA_PAGE_COUNT);
 }
 
 static void create_memslots(struct kvm_vm *vm)
-- 
2.55.0.966.g6673acef38-goog


