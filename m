Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E9B4CCD18D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 15:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f+OYsx4qVrjFLJooxBU/tije1VKpZvCGcY9McxgoCoE=; b=lPONd3UaRTpmBtQC85CIvLtC5r
	1DPT6sQYfHwlPlumVuRljOd8QvKULWZvRugqeRGb+j3wH7FFvY7buGWwvoiCw6aADdUpKSQMgWTOT
	jHRa6yDfYlCbYewdUnrZ7CjipYejkxvKcwTQ8yP+8nlbZcivJ9eJn/AaMAR0qMygwc6PHiqz3GXNg
	SWIf340n2ZVq68Ss1o6MKWnY5Xrv/a5LVa823aLYwROU+jPt9bF83Xsn9dmEFKmz2X94t65UqIs0a
	GP+03E0nPwa1K0hDsj99sbKayTkSxKC3PEdHl0xWVnPRng8CJTSkZH8IrfAyW/bKC88dAuguTKi3l
	Yruqdzsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KGw-0000000Db2y-3UFm;
	Mon, 13 Oct 2025 15:15:38 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KGu-0000000Db1b-2s72
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 15:15:37 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-46e47cca387so43588315e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 08:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760368534; x=1760973334; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f+OYsx4qVrjFLJooxBU/tije1VKpZvCGcY9McxgoCoE=;
        b=BEMzuWMJJQpeeJU03lCPa7JLQBsiy1wtjizANigz0rxmteYKAIAzDNmiqkXKdRIfke
         CCTEPTGIOO2f1lqpnu5MnIjdm655ooPf9w0NnJZMPmADI5ztf/0+YcntCo7yU1JOvsPX
         NnpsMZetEIMnoX9/iZG9VOFlpcN3//4/CZDDMvLvkCG9KpWYe8T1MwrLNuF1rylcyWF5
         StOvMElS/59BeaQP+9QOuzrFn3bVL7dby1wJ213Mb09H/25SyNezlVPvSM+jQ2mavAj+
         9JTO//CJbQI+E0gJhfuIjzvMPXKir+2Bauleow44Hfowrxa8MBs9L9CF2Ybtss9fA85n
         Ppdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760368534; x=1760973334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f+OYsx4qVrjFLJooxBU/tije1VKpZvCGcY9McxgoCoE=;
        b=Na99TOfQMZhFuQSyPnLqdVSz02PCgn6yS+pELMA61TZoORxVHD1y6A8AruuhvZXgDL
         CN3MjOHxlTRiiu9oeX1Zf8111TXhCGma2Us+sIHgevs8IerVDFOszR1tQOa6ATiGrec/
         oBiJnIHtAVjK9V/RqMFivYjEowPPb94YbyQ67p93AgoOyuA4w4ax/qvJopiKsIX5rcRp
         QcrWWsiphLeIpnYIYBI2NuMnrqzjynNLW6DLx1xvDo7kOK3e/oKKtkm7H9foWcreBYKR
         o4C2Es60IfMJPHaOEnkpUdJSdDIajk1/cnaUI5qTnk+15CfzOMUj1QD8ZOVvrnWpzv01
         rIAg==
X-Forwarded-Encrypted: i=1; AJvYcCUxz+lQ+Qm2pg5h6kHA0245fc4XEGTBySylP5Az0/SNhwAPLrCEj/N3TA8FPJmP9oV9MI1HKpCL8FTw3S7OlZu6@lists.infradead.org
X-Gm-Message-State: AOJu0YycXKHT7+A6fduO+U6Qrtr+pEmrCSuEhvshZnvXmzoEm6D/kD2Q
	zurXk6o+oLl681JikLeuH2DkjHGvL/9xxARsLF0W2vWKOewXJRSHLs+x
X-Gm-Gg: ASbGncuj77ZDGKCZDzIa4JqqsELWl+PeBhaLPpea6YpVxmMXNB+uC7SuhLkGWOA7cy2
	VCaUG7M/xi/wRBYKkK8gIUU3kfCTqCtOdGoHD9tnllgCmBcSZn9afHKTFcpKaGYCh4A7oYtQaN3
	oNhIlZegKbcBmXYkd9SShMr/ZqbvfoQ05wieh/eZPgA0SpCCWliCp7REk06BM5kYyfL1Cznvqkc
	1lSdZYyilo3rB9ASDoq1IeEB9mKal7FipDDPgRs4ODNi40ePigygvEaDSSAwsJj2vUeTLtKD71Y
	BVczNVC75yXnDBzVQ6L1jrufj8hr3cdLL9u/3I8feFYh/JXU71WocwPaFz4txmlk8WCNI4D1qPB
	oVGmtcg5Fab2LbzfNi76S2RrPVTDjy16muvFGpXzoReUXq8q58TEBH5CakgpLNGRyO/mO6AS2sb
	sJ2e7A
X-Google-Smtp-Source: AGHT+IG8YKjqV8/Bcai3s9JU+QHESTLB1iWcAO0SGLhAlri+L595vz6YBO/3o6gN4/HNAHvPqWUe0g==
X-Received: by 2002:a05:600c:8b42:b0:45d:e6b6:55fe with SMTP id 5b1f17b1804b1-46fa9b16607mr164819835e9.34.1760368534209;
        Mon, 13 Oct 2025 08:15:34 -0700 (PDT)
Received: from f4d4888f22f2.ant.amazon.com.com ([15.248.3.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab36a773sm135545825e9.0.2025.10.13.08.15.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 13 Oct 2025 08:15:34 -0700 (PDT)
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
	roypat@amazon.co.uk,
	kalyazin@amazon.co.uk,
	jackabt@amazon.com
Subject: [PATCH v2 1/4] KVM: arm64: Add pre_fault_memory implementation
Date: Mon, 13 Oct 2025 16:14:58 +0100
Message-ID: <20251013151502.6679-2-jackabt.amazon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251013151502.6679-1-jackabt.amazon@gmail.com>
References: <20251013151502.6679-1-jackabt.amazon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_081536_753215_7716D84A 
X-CRM114-Status: GOOD (  20.61  )
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
index c17a87a0a5ac..9e8cc4eb505d 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6461,7 +6461,8 @@ Errors:
 KVM_PRE_FAULT_MEMORY populates KVM's stage-2 page tables used to map memory
 for the current vCPU state.  KVM maps memory as if the vCPU generated a
 stage-2 read page fault, e.g. faults in memory as needed, but doesn't break
-CoW.  However, KVM does not mark any newly created stage-2 PTE as Accessed.
+CoW.  However, on x86, KVM does not mark any newly created stage-2 PTE as
+Accessed.
 
 In the case of confidential VM types where there is an initial set up of
 private guest memory before the guest is 'finalized'/measured, this ioctl
diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index bff62e75d681..1ac0605f86cb 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -25,6 +25,7 @@ menuconfig KVM
 	select HAVE_KVM_CPU_RELAX_INTERCEPT
 	select KVM_MMIO
 	select KVM_GENERIC_DIRTYLOG_READ_PROTECT
+	select KVM_GENERIC_PRE_FAULT_MEMORY
 	select KVM_XFER_TO_GUEST_WORK
 	select KVM_VFIO
 	select HAVE_KVM_DIRTY_RING_ACQ_REL
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 888f7c7abf54..65654a742864 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -322,6 +322,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_IRQFD_RESAMPLE:
 	case KVM_CAP_COUNTER_OFFSET:
 	case KVM_CAP_ARM_WRITABLE_IMP_ID_REGS:
+	case KVM_CAP_PRE_FAULT_MEMORY:
 		r = 1;
 		break;
 	case KVM_CAP_SET_GUEST_DEBUG2:
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index a36426ccd9b5..82f122e4b08c 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1597,8 +1597,8 @@ static int gmem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 
 static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 			  struct kvm_s2_trans *nested,
-			  struct kvm_memory_slot *memslot, unsigned long hva,
-			  bool fault_is_perm)
+			  struct kvm_memory_slot *memslot, long *page_size,
+			  unsigned long hva, bool fault_is_perm)
 {
 	int ret = 0;
 	bool topup_memcache;
@@ -1871,6 +1871,9 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	kvm_release_faultin_page(kvm, page, !!ret, writable);
 	kvm_fault_unlock(kvm);
 
+	if (page_size)
+		*page_size = vma_pagesize;
+
 	/* Mark the page dirty only if the fault is handled successfully */
 	if (writable && !ret)
 		mark_page_dirty_in_slot(kvm, memslot, gfn);
@@ -2069,8 +2072,8 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
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
@@ -2446,3 +2449,65 @@ void kvm_toggle_cache(struct kvm_vcpu *vcpu, bool was_enabled)
 
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
+	fault_info->esr_el2 = FIELD_PREP(ESR_ELx_EC_MASK, ESR_ELx_EC_DABT_CUR);
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


