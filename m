Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B58C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 04:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lAANK9EatRgM8qlVuTkHcUTTaZtpLq75H6hzaPLeuxs=; b=vkenpa5fJb178ir8MoAqn/HC+m
	MAEiWwVoZFTV3oWVEEAEA7Ga/k1BHsYDVBc9n+7Jd8Ddm2iZeplFQI4XX1Dd5FF4EiQlQAuPgGRY7
	nMkrFVYD1MHlnwhHOQuEVpslAR9ikEVCO01AZKj0Jjs4LZqmVhyvle9qlWx4XYivCeSpq9pTbjDtm
	fnBNPw6GKaS9oKHI/MuQ2Mvyfa1V7KCkuuZ6xQfjyUkNnXpqf0Sf5mJC2b36akNF8+f7LX6Jvc/IK
	zXBF39jIw7P1zf01jblJQX+NSZXrRNsZWD8CAelVg3kepwDR3nXS8sR8EyrdVOB4Xqh4VYMFsG9GL
	55rJLzVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRkUH-000000091TH-3ijf;
	Wed, 18 Jun 2025 04:33:25 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRkLg-00000008zoM-38wP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 04:24:33 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-74847a38e5eso4217861b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 21:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750220672; x=1750825472; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lAANK9EatRgM8qlVuTkHcUTTaZtpLq75H6hzaPLeuxs=;
        b=zNZQ+e/pxc0HNh3v5BBp84YvIx4fn7UZYCUc2dEJJNc0AfuPpmKIthr1QSggnNyPb7
         gTOAoER/eOTBjQtU8lEpt/n3HsbhJLVuMHBWtf0l78vFFXcVOvP0o76L3roIsr7wty4E
         fgAbhS3URH6cmcP/U75sERHGmFi7ACE9cc5HHCxYP4EVxs9sX+o+UC50MbhMj5OsFyZI
         e476vMSWdOhPLlYPwnrX9dx7TDXbyh60oZukzYwIW2+FMF4nliZS4Mx54YgxDbySgobO
         y5e9K4IvgBkfg+3KQY3T7ZF9e6aY9v9BFvmIHJdkdRoH+wlooRdxaqzHq80xjmLyx/3D
         Rp2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750220672; x=1750825472;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lAANK9EatRgM8qlVuTkHcUTTaZtpLq75H6hzaPLeuxs=;
        b=VYmbTE/cSAM0Pl5OooYcRXogwTqkATQfGS3cFH3Z5xGdzyGDETamU9VGjHTdyQpieP
         8rD6eXe+O9kFNwsQlGHFvjJeNHy/Nvu8d3ppd5y82+JNERJzfPLBL4Z0qeSE+e24r8wa
         HHHfk5OrMSpqTU3uA8ty+S6IrbnO47iYwalPh+tCkY6N8BSCYmYfL/4khyU25N6TUgDa
         /vYNrP6IbAjOdQkWq3MezPcA4xaKP/1ndgdktu/KPimDfalh5V0MtkSiMhQ6GQvhQpYe
         9zRnDAcmh1G6oDQGZ6AsGfMwAwJLkPRdKF1f09GaJqEFu2FXBMVKHCe2T1GuP5nBaUwg
         pw9g==
X-Forwarded-Encrypted: i=1; AJvYcCW1DQvbg9XEKx/3Ad7tbTG6Pflsj5mqiGfdloNCPanbW7mjvq0xaHV6Bj5u2s0bP4PNvGspaNWPSKwmf1mcFwgn@lists.infradead.org
X-Gm-Message-State: AOJu0YzcAgvVbZaNosUX5QUw5lOn3xnMKEutXtWzFlMCzjLmpC/a/R6o
	7Cxn3lclnwjfV0yqz6kTHDPRxlnZ+2OPKoQa+ciYzk45Y6eKIzdYplJMXCwV75Rc8xDS2jPhPZZ
	NmzWvoXdQNBNO1hiHrevzzw==
X-Google-Smtp-Source: AGHT+IGfw/fuYp0YvoE+rn33nARlIYiN3aa5M590yzdjQSAaiecYqF5p0spxRmCeRQgOGDvJLrq4ZeRSCV3QEL3v
X-Received: from pfjw27.prod.google.com ([2002:aa7:9a1b:0:b0:748:de42:3b4])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:a86:b0:732:2923:b70f with SMTP id d2e1a72fcca58-7489d00631fmr17847993b3a.11.1750220671791;
 Tue, 17 Jun 2025 21:24:31 -0700 (PDT)
Date: Wed, 18 Jun 2025 04:24:12 +0000
In-Reply-To: <20250618042424.330664-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20250618042424.330664-1-jthoughton@google.com>
X-Mailer: git-send-email 2.50.0.rc2.696.g1fc2a0284f-goog
Message-ID: <20250618042424.330664-4-jthoughton@google.com>
Subject: [PATCH v3 03/15] KVM: arm64: x86: Require "struct kvm_page_fault" for
 memory fault exits
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Oliver Upton <oliver.upton@linux.dev>
Cc: Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	James Houghton <jthoughton@google.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_212432_791915_673836A2 
X-CRM114-Status: GOOD (  15.90  )
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

From: Sean Christopherson <seanjc@google.com>

Now that both arm64 and x86 define "struct kvm_page_fault" with a base set
of fields, rework kvm_prepare_memory_fault_exit() to take a kvm_page_fault
structure instead of passing in a pile of parameters.  Guard the related
code with CONFIG_KVM_GENERIC_PAGE_FAULT to play nice with architectures
that don't yet support kvm_page_fault.

Rather than define a common kvm_page_fault and kvm_arch_page_fault child,
simply assert that the handful of required fields are provided by the
arch-defined structure.  Unlike vCPU and VMs, the number of common fields
is expected to be small, and letting arch code fully define the structure
allows for maximum flexibility with respect to const, layout, etc.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/arm64/kvm/Kconfig          |  1 +
 arch/x86/kvm/Kconfig            |  1 +
 arch/x86/kvm/mmu/mmu.c          |  8 ++++----
 arch/x86/kvm/mmu/mmu_internal.h | 10 +---------
 include/linux/kvm_host.h        | 26 ++++++++++++++++++++------
 virt/kvm/Kconfig                |  3 +++
 6 files changed, 30 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index 713248f240e03..3c299735b1668 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -37,6 +37,7 @@ menuconfig KVM
 	select HAVE_KVM_VCPU_RUN_PID_CHANGE
 	select SCHED_INFO
 	select GUEST_PERF_EVENTS if PERF_EVENTS
+	select KVM_GENERIC_PAGE_FAULT
 	help
 	  Support hosting virtualized guest machines.
 
diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
index 2eeffcec53828..2d5966f15738d 100644
--- a/arch/x86/kvm/Kconfig
+++ b/arch/x86/kvm/Kconfig
@@ -48,6 +48,7 @@ config KVM_X86
 	select KVM_GENERIC_PRE_FAULT_MEMORY
 	select KVM_GENERIC_PRIVATE_MEM if KVM_SW_PROTECTED_VM
 	select KVM_WERROR if WERROR
+	select KVM_GENERIC_PAGE_FAULT
 
 config KVM
 	tristate "Kernel-based Virtual Machine (KVM) support"
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index cbc84c6abc2e3..a4439e9e07268 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -3429,7 +3429,7 @@ static int kvm_handle_noslot_fault(struct kvm_vcpu *vcpu,
 	gva_t gva = fault->is_tdp ? 0 : fault->addr;
 
 	if (fault->is_private) {
-		kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
+		kvm_prepare_memory_fault_exit(vcpu, fault);
 		return -EFAULT;
 	}
 
@@ -4499,14 +4499,14 @@ static int kvm_mmu_faultin_pfn_private(struct kvm_vcpu *vcpu,
 	int max_order, r;
 
 	if (!kvm_slot_can_be_private(fault->slot)) {
-		kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
+		kvm_prepare_memory_fault_exit(vcpu, fault);
 		return -EFAULT;
 	}
 
 	r = kvm_gmem_get_pfn(vcpu->kvm, fault->slot, fault->gfn, &fault->pfn,
 			     &fault->refcounted_page, &max_order);
 	if (r) {
-		kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
+		kvm_prepare_memory_fault_exit(vcpu, fault);
 		return r;
 	}
 
@@ -4586,7 +4586,7 @@ static int kvm_mmu_faultin_pfn(struct kvm_vcpu *vcpu,
 	 * private vs. shared mismatch.
 	 */
 	if (fault->is_private != kvm_mem_is_private(kvm, fault->gfn)) {
-		kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
+		kvm_prepare_memory_fault_exit(vcpu, fault);
 		return -EFAULT;
 	}
 
diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index 384fc4d0bfec0..c15060ed6e8be 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -269,14 +269,6 @@ enum {
  */
 static_assert(RET_PF_CONTINUE == 0);
 
-static inline void kvm_mmu_prepare_memory_fault_exit(struct kvm_vcpu *vcpu,
-						     struct kvm_page_fault *fault)
-{
-	kvm_prepare_memory_fault_exit(vcpu, fault->gfn << PAGE_SHIFT,
-				      PAGE_SIZE, fault->write, fault->exec,
-				      fault->is_private);
-}
-
 static inline int kvm_mmu_do_page_fault(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
 					u64 err, bool prefetch,
 					int *emulation_type, u8 *level)
@@ -329,7 +321,7 @@ static inline int kvm_mmu_do_page_fault(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
 	 */
 	if (r == RET_PF_EMULATE && fault.is_private) {
 		pr_warn_ratelimited("kvm: unexpected emulation request on private memory\n");
-		kvm_mmu_prepare_memory_fault_exit(vcpu, &fault);
+		kvm_prepare_memory_fault_exit(vcpu, &fault);
 		return -EFAULT;
 	}
 
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 3bde4fb5c6aa4..9a85500cd5c50 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2497,20 +2497,34 @@ static inline void kvm_account_pgtable_pages(void *virt, int nr)
 /* Max number of entries allowed for each kvm dirty ring */
 #define  KVM_DIRTY_RING_MAX_ENTRIES  65536
 
+#ifdef CONFIG_KVM_GENERIC_PAGE_FAULT
+
+#define KVM_ASSERT_TYPE_IS(type_t, x)					\
+do {									\
+	type_t __maybe_unused tmp;					\
+									\
+	BUILD_BUG_ON(!__types_ok(tmp, x) || !__typecheck(tmp, x));	\
+} while (0)
+
 static inline void kvm_prepare_memory_fault_exit(struct kvm_vcpu *vcpu,
-						 gpa_t gpa, gpa_t size,
-						 bool is_write, bool is_exec,
-						 bool is_private)
+						 struct kvm_page_fault *fault)
 {
+	KVM_ASSERT_TYPE_IS(gfn_t, fault->gfn);
+	KVM_ASSERT_TYPE_IS(bool, fault->exec);
+	KVM_ASSERT_TYPE_IS(bool, fault->write);
+	KVM_ASSERT_TYPE_IS(bool, fault->is_private);
+	KVM_ASSERT_TYPE_IS(struct kvm_memory_slot *, fault->slot);
+
 	vcpu->run->exit_reason = KVM_EXIT_MEMORY_FAULT;
-	vcpu->run->memory_fault.gpa = gpa;
-	vcpu->run->memory_fault.size = size;
+	vcpu->run->memory_fault.gpa = fault->gfn << PAGE_SHIFT;
+	vcpu->run->memory_fault.size = PAGE_SIZE;
 
 	/* RWX flags are not (yet) defined or communicated to userspace. */
 	vcpu->run->memory_fault.flags = 0;
-	if (is_private)
+	if (fault->is_private)
 		vcpu->run->memory_fault.flags |= KVM_MEMORY_EXIT_FLAG_PRIVATE;
 }
+#endif
 
 #ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
 static inline unsigned long kvm_get_memory_attributes(struct kvm *kvm, gfn_t gfn)
diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
index 727b542074e7e..28ed6b241578b 100644
--- a/virt/kvm/Kconfig
+++ b/virt/kvm/Kconfig
@@ -128,3 +128,6 @@ config HAVE_KVM_ARCH_GMEM_PREPARE
 config HAVE_KVM_ARCH_GMEM_INVALIDATE
        bool
        depends on KVM_PRIVATE_MEM
+
+config KVM_GENERIC_PAGE_FAULT
+       bool
-- 
2.50.0.rc2.692.g299adb8693-goog


