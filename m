Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE77CF34D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zvh/JmcD+vV+fmSdAaWgiLybPr/qaTggvGFdey4c4z4=; b=mHXE41yNDlutQGGzCjhIrKVyG+
	LOz+p75UZG6bb/YPEU05Rxjue8JyFpLXlDzIVN6yS4URsg+UuDE2bHrCiJNPfn1ifSuMXgpqvqFLR
	d05dPcRGo5kdJJb6iYZdu/Skm6x9kvEJMga0wZ+5ZTkqsKQr/kJCCavrfkvKePh8MlE0d9qytur2t
	t/y2vxWyNNBbVmaXar2Vsfn1YY2V3w9b21rs1XInBsIWztPhfLMn2Ivs5WQCFo+ionZ4BvdkweiPY
	oX3MNk5/a/Ij34carXXTg74iR2eWHgPgbgVePmB2GUaiWh0RJGkozp4Jfjl1VW+pPU6gnOwwxBEFl
	CEUlsYNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkR8-00000003Ypy-3VJ6;
	Wed, 19 Nov 2025 15:49:38 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkR2-00000003Ykf-2vpP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 15:49:33 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-42bb288c219so3586769f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 07:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763567370; x=1764172170; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zvh/JmcD+vV+fmSdAaWgiLybPr/qaTggvGFdey4c4z4=;
        b=b9FfSTnI14308Lb3nc/Qjwv4Yt/loPu9hB0gwABJCeWKGiGd4NXmxhty0/Oyu2T1TJ
         s0g7zqn7TuNWpBR2PooecsjsiiBn38+zhOZKc/Ey1wWLditHjILgdywFTHqeGGZAANnn
         HlXrjbaQWmRpeM+a/bG6lGNaWQh6FtiDIpVys5EN+K3Zige8Y66FmEB3poMvQGEISZ99
         27TuDUh4I4sd0uLZqj6fgmUKsuURkx8V5AFskNJACiFUiEZ+cBvS8G7NRdhNFnnXXB4o
         YMoTd/FgYLq3qJlsk/eBcqtxcrV2p8dbQanv1q2nAU6bfazsxFJ7xSlnwdXxNfrmt0hT
         lmIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567370; x=1764172170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zvh/JmcD+vV+fmSdAaWgiLybPr/qaTggvGFdey4c4z4=;
        b=Rh2yLWdrrrGnFQq5S44qm7QtXwvqU5TRVLyWZ1iqzsWd1yKNo7ZqoIK5l4YvLTAbM3
         Lha/pDTZ5jvTOgRdAzX4PlMy/erljtezYhN8sWegXfbJS02MvAh7QfbpNjElVhSWa2ep
         Otc7ceiyM6FZys50r08VgBBize4EGINmxWdp+0bMunjW7n/82U6jk8CXM6IDOKBKwtg9
         j4Ni8y8rHzl5dx45hzUlkH2K+waTNrnbyYP/9gQkgPbEeWp8uIYIF6KUl0rFFpJ2960o
         zhQl2lab7EtJK5QsxFK2RVSl6Qw2lB+OBG8yIpvtyBwsuIUQmkkYnVj0WMEldbAyU3Mv
         yM+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWYAtGA4akoPQ27E1u8KJnLpsTrHab9QcCJgb3zGnf6SUhMrN8ZJGvKnPZUNVixkphwZ+rKj30SMdcHZDDHohQ4@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6vy81Fp8YyYDa8KALridIxI+BLSNt0si7AKexoSkpWp/lMQLz
	e22pYSPuGrJVeVP2BJAalr4yX+EGnthfwCC0WwxA+FPBYG3GIcl+FQpx
X-Gm-Gg: ASbGncuK419RDQroZSfF0kg15dofVZ47qilcoS2GhWesk6EgJ7dnpynd06EYfgE2caJ
	ZkSBdqisQrd9FC7uCzVcRmIKK6YdgRseMYMIrCmQ7R7Zao5kwUWPWIY2yd3U08WD+zdzcgvCGcq
	/fvx5iEVgsoxBJZDp0Q6YSgOHYK9Rf5bsBQn8lX8ZBTmfnmiY+gD5FkIjYH0h5iPW28IenHjtbs
	zkfI2eD+R2H3GaqzM3k8Ifmm65IFfozYia6HNzlC4VAwnmVMhow8X33bwinheWLEBSPzWSbt01h
	LI4fesb/KE3tbRsKBIX3wwCrNP984aU4fR/n5pP5WVnJQgtgoTxgSqDdt0uf1WyfhGdLzJqpvJ9
	MTFF85xBIJilg0naFR3guH3aojcGFcNDN8U5ndNj8gESXkgFeUYHU3mqG147yjytEG48LZi3gQu
	IzCuOl8BzKBNF/Nhw0O5lZ0af1kH83nUIfWVHwR5Rd+zuCh0933pY4q7I=
X-Google-Smtp-Source: AGHT+IGmzv9vlPxndPSHEAo7OfKVj0vwkjbNJ5hSX60AHLE9VlHKHm9soR4yySIgBqdEJk4f1/kOzw==
X-Received: by 2002:a05:6000:40c9:b0:427:719f:de70 with SMTP id ffacd0b85a97d-42b593493edmr19503444f8f.14.1763567370308;
        Wed, 19 Nov 2025 07:49:30 -0800 (PST)
Received: from f4d4888f22f2.ant.amazon.com.com ([15.248.3.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42c9628ebacsm25969755f8f.30.2025.11.19.07.49.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 19 Nov 2025 07:49:30 -0800 (PST)
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
Subject: [PATCH v3 1/3] KVM: arm64: Add pre_fault_memory implementation
Date: Wed, 19 Nov 2025 15:49:08 +0000
Message-ID: <20251119154910.97716-2-jackabt.amazon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251119154910.97716-1-jackabt.amazon@gmail.com>
References: <20251119154910.97716-1-jackabt.amazon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_074932_801079_B002C02A 
X-CRM114-Status: GOOD (  21.02  )
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
 arch/arm64/kvm/mmu.c           | 73 ++++++++++++++++++++++++++++++++--
 4 files changed, 73 insertions(+), 5 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 57061fa29e6a..30872d080511 100644
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
index 870953b4a8a7..88c5dc2b4ee8 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -327,6 +327,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_IRQFD_RESAMPLE:
 	case KVM_CAP_COUNTER_OFFSET:
 	case KVM_CAP_ARM_WRITABLE_IMP_ID_REGS:
+	case KVM_CAP_PRE_FAULT_MEMORY:
 		r = 1;
 		break;
 	case KVM_CAP_SET_GUEST_DEBUG2:
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 7cc964af8d30..cba09168fc6d 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1599,8 +1599,8 @@ static int gmem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 
 static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 			  struct kvm_s2_trans *nested,
-			  struct kvm_memory_slot *memslot, unsigned long hva,
-			  bool fault_is_perm)
+			  struct kvm_memory_slot *memslot, long *page_size,
+			  unsigned long hva, bool fault_is_perm)
 {
 	int ret = 0;
 	bool topup_memcache;
@@ -1878,6 +1878,9 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	kvm_release_faultin_page(kvm, page, !!ret, writable);
 	kvm_fault_unlock(kvm);
 
+	if (page_size)
+		*page_size = vma_pagesize;
+
 	/* Mark the page dirty only if the fault is handled successfully */
 	if (writable && !ret)
 		mark_page_dirty_in_slot(kvm, memslot, gfn);
@@ -2080,8 +2083,8 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
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
@@ -2457,3 +2460,65 @@ void kvm_toggle_cache(struct kvm_vcpu *vcpu, bool was_enabled)
 
 	trace_kvm_toggle_cache(*vcpu_pc(vcpu), was_enabled, now_enabled);
 }
+
+long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
+				    struct kvm_pre_fault_memory *range)
+{
+	int ret, idx;
+	hva_t hva;
+	phys_addr_t end;
+	struct kvm_memory_slot *memslot;
+	struct kvm_vcpu_fault_info stored_fault, *fault_info;
+
+	long page_size = PAGE_SIZE;
+	phys_addr_t ipa = range->gpa;
+	gfn_t gfn = gpa_to_gfn(range->gpa);
+
+	idx = srcu_read_lock(&vcpu->kvm->srcu);
+
+	if (ipa >= kvm_phys_size(vcpu->arch.hw_mmu)) {
+		ret = -ENOENT;
+		goto out_unlock;
+	}
+
+	memslot = gfn_to_memslot(vcpu->kvm, gfn);
+	if (!memslot) {
+		ret = -ENOENT;
+		goto out_unlock;
+	}
+
+	fault_info = &vcpu->arch.fault;
+	stored_fault = *fault_info;
+
+	/* Generate a synthetic abort for the pre-fault address */
+	fault_info->esr_el2 = ESR_ELx_EC_DABT_LOW;
+	fault_info->esr_el2 &= ~ESR_ELx_ISV;
+	fault_info->esr_el2 |= ESR_ELx_FSC_FAULT_L(KVM_PGTABLE_LAST_LEVEL);
+
+	fault_info->hpfar_el2 = HPFAR_EL2_NS |
+		FIELD_PREP(HPFAR_EL2_FIPA, ipa >> 12);
+
+	if (kvm_slot_has_gmem(memslot)) {
+		ret = gmem_abort(vcpu, ipa, NULL, memslot, false);
+	} else {
+		hva = gfn_to_hva_memslot_prot(memslot, gfn, NULL);
+		if (kvm_is_error_hva(hva)) {
+			ret = -EFAULT;
+			goto out;
+		}
+		ret = user_mem_abort(vcpu, ipa, NULL, memslot, &page_size, hva,
+				     false);
+	}
+
+	if (ret < 0)
+		goto out;
+
+	end = (range->gpa & ~(page_size - 1)) + page_size;
+	ret = min(range->size, end - range->gpa);
+
+out:
+	*fault_info = stored_fault;
+out_unlock:
+	srcu_read_unlock(&vcpu->kvm->srcu, idx);
+	return ret;
+}
-- 
2.43.0


