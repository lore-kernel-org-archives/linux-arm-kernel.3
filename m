Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A32D2F338
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 15:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zLRXg7JVZZko0zZdXj8CGlwR+G7ltrm8Wkc0QXIHPMo=; b=y/qlOUdFywM8DO7FPbIMnYvmae
	7PjLR9HREn6scaeEVUkbfBGqXL5Ae/rLJocWdRSkVHWna0Tu/tDy7E714ytvPdLB32tWAaTpmIKbf
	cUfQd2Z9MS/34rsYjN8EGbZSYeKizfhbWJububFvGLhTL19ykM4J+kCxilFNRjbmeO0bUEg+8LbKg
	yv4+MuJ5L4VLd1YdhzOKmL+IHC++lk3hpjaJ/+fHN34YjafAzm+BOaqUe3P8AaHpxGvAP+BkP0gJL
	7hY6/6vTO020qYDlWr41sIgfSXJX0RLmYHELGDCb5oPceqjd1N4YqtH2jXoQZbNnWsU8C9IA0ZiKW
	yQ92wajQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgJ8-00000007MgH-1PMw;
	Tue, 13 Jan 2026 15:27:47 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgJ0-00000007MbH-3YxJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 15:27:40 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so52555745e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 07:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768318057; x=1768922857; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zLRXg7JVZZko0zZdXj8CGlwR+G7ltrm8Wkc0QXIHPMo=;
        b=iO185oUadNOXXodEQ7mbojQpBZE6Z7JQcaa1kM6Xjl+psWRdB5QfvacXmqmxgm6Cbs
         KGiRq/WLY+SMyvOZNIQtLKUT9EvDfOwSIwHxOea5+52RwDl3KJtysu+HKq2woZH0KVM4
         bF4QUlx21zc6nnZehf5w4wnlb1GdvNNlYw+YHQwx60kExiIjxYTdgJY3ymz1mJEGeFEa
         +izdRzP7MeFgzzN0pfZ44CNp4jpaA/KSukjEm49R2sSvP5VoBrCCV18wwAxiojyOvIZn
         hx3Md7Llp/DkurW/IZIlUlw01p5k6OB/nVAkZ5yrXonn6DisedjT9zeXH723+y5B9Hbi
         vRQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768318057; x=1768922857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zLRXg7JVZZko0zZdXj8CGlwR+G7ltrm8Wkc0QXIHPMo=;
        b=Id2tmDl+X296yXLtV6zpOQmbmZtE0fhliqdQXXC4+rOPsCC+jTH54iq/gpSKFlcPCt
         tN5Xj1FiXu/GmbZrupndJdyIqD15vFSlogryl7iZsM6ydYWl4OKw8Ny8TKgdQp43+lko
         14iRXsO4HGNxSB2mdAfF1xI/tIZudc0Z+HKMIiFFWkAM5nT7hXNzWaMETQ5nvQe2ENWB
         7zs/afDzuyEz746Gtenn32g6J9XiBYwfmayZlijcl+bfLBA6eBkOeafLTGhjggIkdhqZ
         hMr9AAEszEdgAmfLFrGkjgMegCNNiOf3v4KkSf0QFmhlyZW8SBmB341ME50jpJ+EkUsj
         dqrA==
X-Forwarded-Encrypted: i=1; AJvYcCVrlpC7AgXlNYa0c47lvbL1eQSSNfIIbyCfkQldjEQTdaCkJvuGf14zxuggViE0pLxAZDw2p6P+h30zA8DlK1y+@lists.infradead.org
X-Gm-Message-State: AOJu0YxlYqQ0MI0VLRHJYbJiBmc3os1y4Hl03UNwqhFqPmFzgW9PQ1LQ
	OH4+DLnQlWto0enfba2mDe+bV0z9lwVb712u8yk/6MxC8GySDilVCHD0
X-Gm-Gg: AY/fxX5CrQB7Gcfoa7WEC5+n63PylF7P9qndJCgpWCNuyKF2ue3FqtvhE9Pf0Vffdxt
	T4TBGfEJ/hfZ8K3z1W6OfMIPVGJVzH7gy3Myx/BXW3ILwEuN870JMTD2P5xMX9/juX9MgVhygo+
	Lxa1ZE3rjdQE+/mMWCuA52aJrEgnA8IQkSia+i7V3OEArb+W8IRwe/IbZdbfLaf4o2ZHPJECWB1
	kJm7PnSWp1et/ObNgdU7Nl7xn/mdN5+INc5gJnrbVBMRx0wrLodIYkFKAsHKJJHvTJj7K2xiqgd
	VzT0FdClw+gXoyfPyxShmMtOmcAXE8fsZwAlK2TY/3Knf7oHanOjsTQWynHfG4gx9d4Sl7YrAzL
	yBzobQLyDbrlg4pVPWOP2ahlj5SqLjYsIIcYEhj3alpqV/Jo4jkS50O0CTJ1jeRg8kSe8LrBs2U
	rNsFBvu6qM1MI12XmGGpVAGJMw6l0QUmSTpDru7lqrpuKlrldij63QFBY=
X-Google-Smtp-Source: AGHT+IGOGfwbuvnKgA4Zty6EfW/z0NDZGT8+jx/1Ev1TPzxM7TNRuATZo23zi+kv55y3TV6t5AxLVQ==
X-Received: by 2002:a05:600c:8b66:b0:47e:e20e:bba4 with SMTP id 5b1f17b1804b1-47ee20ebde0mr2858135e9.18.1768318056848;
        Tue, 13 Jan 2026 07:27:36 -0800 (PST)
Received: from f4d4888f22f2.ant.amazon.com.com ([15.248.2.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f68f4ddsm421025325e9.2.2026.01.13.07.27.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Jan 2026 07:27:36 -0800 (PST)
From: Jack Thomson <jackabt.amazon@gmail.com>
To: maz@kernel.org,
	oliver.upton@linux.dev,
	pbonzini@redhat.com
Cc: joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	shuah@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	isaku.yamahata@intel.com,
	xmarcalx@amazon.co.uk,
	kalyazin@amazon.co.uk,
	jackabt@amazon.com
Subject: [PATCH v4 1/3] KVM: arm64: Add pre_fault_memory implementation
Date: Tue, 13 Jan 2026 15:26:40 +0000
Message-ID: <20260113152643.18858-2-jackabt.amazon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260113152643.18858-1-jackabt.amazon@gmail.com>
References: <20260113152643.18858-1-jackabt.amazon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_072738_922142_8B30E141 
X-CRM114-Status: GOOD (  22.66  )
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

From: Jack Thomson <jackabt@amazon.com>

Add kvm_arch_vcpu_pre_fault_memory() for arm64. The implementation hands
off the stage-2 faulting logic to either gmem_abort() or
user_mem_abort().

Add an optional page_size output parameter to user_mem_abort() to
return the VMA page size, which is needed when pre-faulting.

Update the documentation to clarify x86 specific behaviour.

Signed-off-by: Jack Thomson <jackabt@amazon.com>
---
 Documentation/virt/kvm/api.rst |  3 +-
 arch/arm64/kvm/Kconfig         |  1 +
 arch/arm64/kvm/arm.c           |  1 +
 arch/arm64/kvm/mmu.c           | 79 ++++++++++++++++++++++++++++++++--
 4 files changed, 79 insertions(+), 5 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 01a3abef8abb..44cfd9e736bb 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6493,7 +6493,8 @@ Errors:
 KVM_PRE_FAULT_MEMORY populates KVM's stage-2 page tables used to map memory
 for the current vCPU state.  KVM maps memory as if the vCPU generated a
 stage-2 read page fault, e.g. faults in memory as needed, but doesn't break
-CoW.  However, KVM does not mark any newly created stage-2 PTE as Accessed.
+CoW.  However, on x86, KVM does not mark any newly created stage-2 PTE as
+Accessed.
 
 In the case of confidential VM types where there is an initial set up of
 private guest memory before the guest is 'finalized'/measured, this ioctl
diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index 4f803fd1c99a..6872aaabe16c 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -25,6 +25,7 @@ menuconfig KVM
 	select HAVE_KVM_CPU_RELAX_INTERCEPT
 	select KVM_MMIO
 	select KVM_GENERIC_DIRTYLOG_READ_PROTECT
+	select KVM_GENERIC_PRE_FAULT_MEMORY
 	select VIRT_XFER_TO_GUEST_WORK
 	select KVM_VFIO
 	select HAVE_KVM_DIRTY_RING_ACQ_REL
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 4f80da0c0d1d..19bac68f737f 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -332,6 +332,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_COUNTER_OFFSET:
 	case KVM_CAP_ARM_WRITABLE_IMP_ID_REGS:
 	case KVM_CAP_ARM_SEA_TO_USER:
+	case KVM_CAP_PRE_FAULT_MEMORY:
 		r = 1;
 		break;
 	case KVM_CAP_SET_GUEST_DEBUG2:
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 48d7c372a4cd..499b131f794e 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1642,8 +1642,8 @@ static int gmem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 
 static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 			  struct kvm_s2_trans *nested,
-			  struct kvm_memory_slot *memslot, unsigned long hva,
-			  bool fault_is_perm)
+			  struct kvm_memory_slot *memslot, unsigned long *page_size,
+			  unsigned long hva, bool fault_is_perm)
 {
 	int ret = 0;
 	bool topup_memcache;
@@ -1923,6 +1923,9 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	kvm_release_faultin_page(kvm, page, !!ret, writable);
 	kvm_fault_unlock(kvm);
 
+	if (page_size)
+		*page_size = vma_pagesize;
+
 	/* Mark the page dirty only if the fault is handled successfully */
 	if (writable && !ret)
 		mark_page_dirty_in_slot(kvm, memslot, gfn);
@@ -2196,8 +2199,8 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 		ret = gmem_abort(vcpu, fault_ipa, nested, memslot,
 				 esr_fsc_is_permission_fault(esr));
 	else
-		ret = user_mem_abort(vcpu, fault_ipa, nested, memslot, hva,
-				     esr_fsc_is_permission_fault(esr));
+		ret = user_mem_abort(vcpu, fault_ipa, nested, memslot, NULL,
+				     hva, esr_fsc_is_permission_fault(esr));
 	if (ret == 0)
 		ret = 1;
 out:
@@ -2573,3 +2576,71 @@ void kvm_toggle_cache(struct kvm_vcpu *vcpu, bool was_enabled)
 
 	trace_kvm_toggle_cache(*vcpu_pc(vcpu), was_enabled, now_enabled);
 }
+
+long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
+				    struct kvm_pre_fault_memory *range)
+{
+	struct kvm_vcpu_fault_info *fault_info = &vcpu->arch.fault;
+	struct kvm_s2_trans nested_trans, *nested = NULL;
+	unsigned long page_size = PAGE_SIZE;
+	struct kvm_memory_slot *memslot;
+	phys_addr_t ipa = range->gpa;
+	phys_addr_t end;
+	hva_t hva;
+	gfn_t gfn;
+	int ret;
+
+	if (vcpu_is_protected(vcpu))
+		return -EOPNOTSUPP;
+
+	/*
+	 * We may prefault on a shadow stage 2 page table if we are
+	 * running a nested guest.  In this case, we have to resolve the L2
+	 * IPA to the L1 IPA first, before knowing what kind of memory should
+	 * back the L1 IPA.
+	 *
+	 * If the shadow stage 2 page table walk faults, then we return
+	 * -EFAULT
+	 */
+	if (kvm_is_nested_s2_mmu(vcpu->kvm, vcpu->arch.hw_mmu) &&
+	    vcpu->arch.hw_mmu->nested_stage2_enabled) {
+		ret = kvm_walk_nested_s2(vcpu, ipa, &nested_trans);
+		if (ret)
+			return -EFAULT;
+
+		ipa = kvm_s2_trans_output(&nested_trans);
+		nested = &nested_trans;
+	}
+
+	if (ipa >= kvm_phys_size(vcpu->arch.hw_mmu))
+		return -ENOENT;
+
+	/* Generate a synthetic abort for the pre-fault address */
+	fault_info->esr_el2 = (ESR_ELx_EC_DABT_LOW << ESR_ELx_EC_SHIFT) |
+		ESR_ELx_FSC_FAULT_L(KVM_PGTABLE_LAST_LEVEL);
+	fault_info->hpfar_el2 = HPFAR_EL2_NS |
+		FIELD_PREP(HPFAR_EL2_FIPA, ipa >> 12);
+
+	gfn = gpa_to_gfn(ipa);
+	memslot = gfn_to_memslot(vcpu->kvm, gfn);
+	if (!memslot)
+		return -ENOENT;
+
+	if (kvm_slot_has_gmem(memslot)) {
+		/* gmem currently only supports PAGE_SIZE mappings */
+		ret = gmem_abort(vcpu, ipa, nested, memslot, false);
+	} else {
+		hva = gfn_to_hva_memslot_prot(memslot, gfn, NULL);
+		if (kvm_is_error_hva(hva))
+			return -EFAULT;
+
+		ret = user_mem_abort(vcpu, ipa, nested, memslot, &page_size, hva,
+				     false);
+	}
+
+	if (ret < 0)
+		return ret;
+
+	end = ALIGN_DOWN(range->gpa, page_size) + page_size;
+	return min(range->size, end - range->gpa);
+}
-- 
2.43.0


