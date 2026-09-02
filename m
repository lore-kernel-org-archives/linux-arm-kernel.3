Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A06C624D6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 16:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xxl3R2RxR/fdY+CE5Gsyx1FXrQJglfzt8OPnA5rO56k=; b=R8z4mDCD4EUU+BbOSGVmwyO8Hi
	LoXr3kGRxeDs7SlUG9a92gN8sssFzzQFM6hvGj3MYp9cUVYeojP2pp7mDX22ZHwlLBPFk6iKs6oaJ
	iH+47i/0c3zVQPL0esegBYSLGRc3ZTa1lmkMSF/pBQTrrG/t/3EiyxMk6EmVGkj5SLlvaUfnJvBku
	uROqe76mCNvrE+KDad45ynczv2XJO64Eh9xRZ/WbOfDBt/u3vntRmBtdvyqAOmtlsYQfVRDMQfbnZ
	6bx4sYB900obQmxO+YJt8DOA17RAKqdzxU6R87FOULhGjegbH8NDalT//GnigGjMfb9m/GGeC+XFp
	6AGhtTnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o1w-0000000FEYn-2hqO;
	Wed, 02 Sep 2026 16:41:44 +0000
Received: from mail-pf1-x447.google.com ([2607:f8b0:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o1n-0000000FECB-2Y0T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 16:41:37 +0000
Received: by mail-pf1-x447.google.com with SMTP id d2e1a72fcca58-84a67b16217so2213100b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 09:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788367294; x=1788972094; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xxl3R2RxR/fdY+CE5Gsyx1FXrQJglfzt8OPnA5rO56k=;
        b=Xq9Cb/jbl6C+BQ11bI2exilRrpI+SaFXJBgdzn13Qc4A319ALpb5c7X/N1pWKYPXl2
         HCwxmuTRxa1NaDbuCIQd3JG0n/eupz59iJTdPyWSzVK4ynT0uX2PKW31bROhl01y+CxC
         cClf2PYtos5o+8nOlcVYoiBR/LpkmDVzIwCwWqJiMAH86vi4dGJgY9CinKngLB3LGr2u
         93Il/x8BD4o05j0MZD0fLf4O7HN6iGamdapFchZ4Gq469UIfHHJ6BKQkuW5Jp7iFHJid
         NLtulZ6RaQHkJGUR+OztC7hn83qp9f1pGYsfHgK2Nwcqe1bPCwPT20Qtu8cYVBSIMpu4
         ed7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367294; x=1788972094;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xxl3R2RxR/fdY+CE5Gsyx1FXrQJglfzt8OPnA5rO56k=;
        b=NU8XCpMJY2LJQpHC0vMh5dvEkE6UjXweVjYrXjVpAhEcLlMYCWzmOYQwvKBz+3QCjY
         BhYrlXE3QRdnpPUWTtaKKWbPAAW+RWUG+87/hws8wn0SUNMH0QAbkSDirZIXyUDKFpJd
         AHHQZjkHHKYR/LLJMHVnWl/H3otsMIzsh0capGYYi3TJLYlcjC9KVSze/FmXv/E+vB2l
         zlq+zb8d60sDJG/dotPcHdWqgR/lfoS6gtuXoT8FaOrfvmvkzPm4rTQ9CnV2wE4Fgo4n
         K/2/FUNI7ruRKYZdmdfGW6GximdYIPhK8YNDxT2zZUGLsYVhaNkXyDvQS5UNlY/4dv1g
         VQfw==
X-Forwarded-Encrypted: i=1; AKwUvBxn+Jj5IcFx500jM5sfn8tjnC28iPAXuT82Z7Lmw/mnUDqTQbVpNuZCpJLyfegX3y7cFHUz8RI/GUiVEgx0Xtrt@lists.infradead.org
X-Gm-Message-State: AFuF++mXuzu3iXU3rSl18CKvRXVQoq7VKvcKMocA9/qZ/rcCbCOEthVO
	P0eAJJRuFEiRU2SoUMquX5T1bhN/SMo4XbN5jDWBlkgE9Ew06D/Tj7zG/C5gY9V8shYArRks/DD
	qfavstA==
X-Received: from pfmy23.prod.google.com ([2002:aa7:8057:0:b0:847:7f5d:6b90])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4fce:b0:845:e9e8:645c
 with SMTP id d2e1a72fcca58-85ed7d1ddf1mr9648289b3a.6.1788367293421; Wed, 02
 Sep 2026 09:41:33 -0700 (PDT)
Date: Wed,  2 Sep 2026 09:41:10 -0700
In-Reply-To: <20260902164123.2546762-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260902164123.2546762-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260902164123.2546762-8-seanjc@google.com>
Subject: [PATCH v2 07/20] KVM: selftests: Make the single-page allocator APIs
 static inline
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
X-CRM114-CacheID: sfid-20260902_094135_665587_50B0079E 
X-CRM114-Status: GOOD (  11.16  )
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

Move the single-page allocator APIs to kvm_util.h as inline functions, as
the are trivial wrappers, and unlike __vm_phy_pages_alloc(), are expected
to remain that way for the foreseeable future.

No functional change intended.

Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h | 14 ++++++++++++--
 tools/testing/selftests/kvm/lib/kvm_util.c     | 11 -----------
 2 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 4732b9528812..d9d39a8894e2 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -990,12 +990,10 @@ void kvm_gsi_routing_write(struct kvm_vm *vm, struct kvm_irq_routing *routing);
 
 const char *exit_reason_str(unsigned int exit_reason);
 
-gpa_t vm_phy_page_alloc(struct kvm_vm *vm, gpa_t min_gpa, u32 memslot);
 gpa_t ____vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
 			     u32 memslot, bool protected, bool naturally_aligned);
 gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
 			   u32 memslot, bool protected);
-gpa_t vm_alloc_page_table(struct kvm_vm *vm);
 
 static inline gpa_t vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages,
 				       gpa_t min_gpa, u32 memslot)
@@ -1009,6 +1007,18 @@ static inline gpa_t vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages,
 				    vm_arch_has_protected_memory(vm));
 }
 
+static inline gpa_t vm_phy_page_alloc(struct kvm_vm *vm, gpa_t min_gpa,
+				      u32 memslot)
+{
+	return vm_phy_pages_alloc(vm, 1, min_gpa, memslot);
+}
+
+static inline gpa_t vm_alloc_page_table(struct kvm_vm *vm)
+{
+	return vm_phy_page_alloc(vm, KVM_GUEST_PAGE_TABLE_MIN_PADDR,
+				 vm->memslots[MEM_REGION_PT]);
+}
+
 /*
  * ____vm_create() does KVM_CREATE_VM and little else.  __vm_create() also
  * loads the test binary into guest memory and creates an IRQ chip (x86 only).
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 896da440659e..ce0d8fba4624 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -2086,17 +2086,6 @@ gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
 	return ____vm_phy_pages_alloc(vm, nr_pages, min_gpa, memslot, protected, false);
 }
 
-gpa_t vm_phy_page_alloc(struct kvm_vm *vm, gpa_t min_gpa, u32 memslot)
-{
-	return vm_phy_pages_alloc(vm, 1, min_gpa, memslot);
-}
-
-gpa_t vm_alloc_page_table(struct kvm_vm *vm)
-{
-	return vm_phy_page_alloc(vm, KVM_GUEST_PAGE_TABLE_MIN_PADDR,
-				 vm->memslots[MEM_REGION_PT]);
-}
-
 /*
  * Address Guest Virtual to Host Virtual
  *
-- 
2.55.0.966.g6673acef38-goog


