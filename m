Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B88DF0183A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 14:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TocInmoOWJ8fFP1iH0uGrF2E0/0ArBixtXbl/xtyH9I=; b=h4C946gmkBqhrpeGJ7oxmuwqE6
	LZzwzIAO5y0Ja+0W7Yp6lpfD2wMUSPsxjhCSfscyPGa/nx7ZLGVZRcFNE80xCYUQfrvmfWwjUGZUC
	r8PN0jTPU1O4U5x3U/yaZeeSXMd2JI4LaMd/oFM3J2Zuqv+EgfA3M6lv/c6qJaZQ3sydXf+vwdvHR
	Rc4Pmp1CNBUEWDogQQmcPFVtvettPaLeoMiHRZW+PbN1rfo7OZMf9lgOLB7JmuAwsC4TG9T/tlls9
	JtkzMbFiWsKcz6E4IhcfID7e6mxuo22T13j1vKckogaqK/pN+4YB9Pp1EWzZ8OavCN76PsbSZpDN4
	tBfVeKNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVlQ-00000003qCf-2mjx;
	Fri, 06 Mar 2026 14:02:48 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVlM-00000003q5V-1F0u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 14:02:45 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-b9360e9f43bso1082820166b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 06:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772805760; x=1773410560; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TocInmoOWJ8fFP1iH0uGrF2E0/0ArBixtXbl/xtyH9I=;
        b=cV0IGfQhyj/91iA99P3DjlVPsqcZHWnbCrDC6Tn0naBW8tA+XQj88rKxixdgxsmNTu
         gqG9yiEG8Ub3bd0leGwid4RUudDN4wOiobPKNC7bOBmPnRF7zUZUljCbuLJ37PFh75fe
         YukXRudWDf/0UAmSYX5nc0m44jk4xiVz2o9z2PBA1bMQxi8jDsIRwWq9iiHp9KOeK+j6
         FgRJo/0zhdnMaqYk55uurwvsmlASF6cpH4jsSSttrL1gReoXfIq0VmCxV4hu0inmOkyL
         JhxEr4kLu/EVEDNEl2J5YDqWE+EOovm1PBsu9I1stbSCd0j5p5PLOdJ0gNd8aeBluwx2
         seqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772805760; x=1773410560;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TocInmoOWJ8fFP1iH0uGrF2E0/0ArBixtXbl/xtyH9I=;
        b=KShjbzsLxckrOKCLyzC3753LkcwBjOMBM2CoUzIExxC67wPz/7Un+PPQkzwHSprEKs
         O/vm/k4toSCfAx4oliIHUgJVO879K1HDF5DZToaBzV+FsNt7MRgZMADq3T63f1MrSusB
         mGc8JbFMGrCFVLPNQMu0vPKTAMTMgYHsqkkmvv4CX4mnOpxp68OG0/08oaop69fPf1E7
         F+JynJNuSHRCcn8mLGkKHusgoejYagaMRqDETErJxJpWSZnsupmsAmm+HbXkEMGVhJQd
         xlJOxVbMdu6Sy5QhvrgODBJh0Rkaeb+vGhSu5R1l9oel1Q0rfB7oVH41SjG1WLfW3jRW
         QtzQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+8/VxHjNncAEQb22bx4RSrDkhT4zIGw39YjvT8IKydA49RQTEJ1FasnhBw8ldNeR1BUYSpGB65MSMuLsbchOB@lists.infradead.org
X-Gm-Message-State: AOJu0YzZ7/KTMdVhuvWYAjVs26ub5ItcbW0HnxKcfUblBgzmNieaSWMR
	txfOp7HurhJmoZksTEkZKp/UYS9X6CGozhDfhhKyNO+ynISXB25Sixl//IyfdIr/bRVS+sHsji3
	MtA==
X-Received: from edtb21.prod.google.com ([2002:aa7:c915:0:b0:661:344d:ea14])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:96ac:b0:b8e:dab6:82a6
 with SMTP id a640c23a62f3a-b942e0261f6mr129346866b.57.1772805760166; Fri, 06
 Mar 2026 06:02:40 -0800 (PST)
Date: Fri,  6 Mar 2026 14:02:24 +0000
In-Reply-To: <20260306140232.2193802-1-tabba@google.com>
Mime-Version: 1.0
References: <20260306140232.2193802-1-tabba@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260306140232.2193802-6-tabba@google.com>
Subject: [PATCH v1 05/13] KVM: arm64: Extract stage-2 permission logic in user_mem_abort()
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, qperret@google.com, vdonnefort@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_060244_440783_E583A582 
X-CRM114-Status: GOOD (  23.80  )
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

Extract the logic that computes the stage-2 protections and checks for
various permission faults (e.g., execution faults on non-cacheable
memory) into a new helper function, kvm_s2_fault_compute_prot(). This
helper also handles injecting atomic/exclusive faults back into the
guest when necessary.

This refactoring step separates the permission computation from the
mapping logic, making the main fault handler flow clearer.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/mmu.c | 163 +++++++++++++++++++++++--------------------
 1 file changed, 87 insertions(+), 76 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 344a477e1bff..b328299cc0f5 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1809,6 +1809,89 @@ static int kvm_s2_fault_pin_pfn(struct kvm_s2_fault *fault)
 	return 1;
 }
 
+static int kvm_s2_fault_compute_prot(struct kvm_s2_fault *fault)
+{
+	struct kvm *kvm = fault->vcpu->kvm;
+
+	/*
+	 * Check if this is non-struct page memory PFN, and cannot support
+	 * CMOs. It could potentially be unsafe to access as cacheable.
+	 */
+	if (fault->vm_flags & (VM_PFNMAP | VM_MIXEDMAP) && !pfn_is_map_memory(fault->pfn)) {
+		if (fault->is_vma_cacheable) {
+			/*
+			 * Whilst the VMA owner expects cacheable mapping to this
+			 * PFN, hardware also has to support the FWB and CACHE DIC
+			 * features.
+			 *
+			 * ARM64 KVM relies on kernel VA mapping to the PFN to
+			 * perform cache maintenance as the CMO instructions work on
+			 * virtual addresses. VM_PFNMAP region are not necessarily
+			 * mapped to a KVA and hence the presence of hardware features
+			 * S2FWB and CACHE DIC are mandatory to avoid the need for
+			 * cache maintenance.
+			 */
+			if (!kvm_supports_cacheable_pfnmap())
+				return -EFAULT;
+		} else {
+			/*
+			 * If the page was identified as device early by looking at
+			 * the VMA flags, vma_pagesize is already representing the
+			 * largest quantity we can map.  If instead it was mapped
+			 * via __kvm_faultin_pfn(), vma_pagesize is set to PAGE_SIZE
+			 * and must not be upgraded.
+			 *
+			 * In both cases, we don't let transparent_hugepage_adjust()
+			 * change things at the last minute.
+			 */
+			fault->s2_force_noncacheable = true;
+		}
+	} else if (fault->logging_active && !fault->write_fault) {
+		/*
+		 * Only actually map the page as writable if this was a write
+		 * fault.
+		 */
+		fault->writable = false;
+	}
+
+	if (fault->exec_fault && fault->s2_force_noncacheable)
+		return -ENOEXEC;
+
+	/*
+	 * Guest performs atomic/exclusive operations on memory with unsupported
+	 * attributes (e.g. ld64b/st64b on normal memory when no FEAT_LS64WB)
+	 * and trigger the exception here. Since the memslot is valid, inject
+	 * the fault back to the guest.
+	 */
+	if (esr_fsc_is_excl_atomic_fault(kvm_vcpu_get_esr(fault->vcpu))) {
+		kvm_inject_dabt_excl_atomic(fault->vcpu, kvm_vcpu_get_hfar(fault->vcpu));
+		return 1;
+	}
+
+	if (fault->nested)
+		adjust_nested_fault_perms(fault->nested, &fault->prot, &fault->writable);
+
+	if (fault->writable)
+		fault->prot |= KVM_PGTABLE_PROT_W;
+
+	if (fault->exec_fault)
+		fault->prot |= KVM_PGTABLE_PROT_X;
+
+	if (fault->s2_force_noncacheable) {
+		if (fault->vfio_allow_any_uc)
+			fault->prot |= KVM_PGTABLE_PROT_NORMAL_NC;
+		else
+			fault->prot |= KVM_PGTABLE_PROT_DEVICE;
+	} else if (cpus_have_final_cap(ARM64_HAS_CACHE_DIC)) {
+		fault->prot |= KVM_PGTABLE_PROT_X;
+	}
+
+	if (fault->nested)
+		adjust_nested_exec_perms(kvm, fault->nested, &fault->prot);
+
+	return 0;
+}
+
 static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 			  struct kvm_s2_trans *nested,
 			  struct kvm_memory_slot *memslot, unsigned long hva,
@@ -1863,68 +1946,14 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 
 	ret = 0;
 
-	/*
-	 * Check if this is non-struct fault->page memory PFN, and cannot support
-	 * CMOs. It could potentially be unsafe to access as cacheable.
-	 */
-	if (fault->vm_flags & (VM_PFNMAP | VM_MIXEDMAP) && !pfn_is_map_memory(fault->pfn)) {
-		if (fault->is_vma_cacheable) {
-			/*
-			 * Whilst the VMA owner expects cacheable mapping to this
-			 * PFN, hardware also has to support the FWB and CACHE DIC
-			 * features.
-			 *
-			 * ARM64 KVM relies on kernel VA mapping to the PFN to
-			 * perform cache maintenance as the CMO instructions work on
-			 * virtual addresses. VM_PFNMAP region are not necessarily
-			 * mapped to a KVA and hence the presence of hardware features
-			 * S2FWB and CACHE DIC are mandatory to avoid the need for
-			 * cache maintenance.
-			 */
-			if (!kvm_supports_cacheable_pfnmap())
-				ret = -EFAULT;
-		} else {
-			/*
-			 * If the fault->page was identified as device early by looking at
-			 * the VMA flags, fault->vma_pagesize is already representing the
-			 * largest quantity we can map.  If instead it was mapped
-			 * via __kvm_faultin_pfn(), fault->vma_pagesize is set to PAGE_SIZE
-			 * and must not be upgraded.
-			 *
-			 * In both cases, we don't let transparent_hugepage_adjust()
-			 * change things at the last minute.
-			 */
-			fault->s2_force_noncacheable = true;
-		}
-	} else if (fault->logging_active && !fault->write_fault) {
-		/*
-		 * Only actually map the fault->page as fault->writable if this was a write
-		 * fault.
-		 */
-		fault->writable = false;
+	ret = kvm_s2_fault_compute_prot(fault);
+	if (ret == 1) {
+		ret = 1; /* fault injected */
+		goto out_put_page;
 	}
-
-	if (fault->exec_fault && fault->s2_force_noncacheable)
-		ret = -ENOEXEC;
-
 	if (ret)
 		goto out_put_page;
 
-	/*
-	 * Guest performs atomic/exclusive operations on memory with unsupported
-	 * attributes (e.g. ld64b/st64b on normal memory when no FEAT_LS64WB)
-	 * and trigger the exception here. Since the fault->memslot is valid, inject
-	 * the fault back to the guest.
-	 */
-	if (esr_fsc_is_excl_atomic_fault(kvm_vcpu_get_esr(fault->vcpu))) {
-		kvm_inject_dabt_excl_atomic(fault->vcpu, kvm_vcpu_get_hfar(fault->vcpu));
-		ret = 1;
-		goto out_put_page;
-	}
-
-	if (fault->nested)
-		adjust_nested_fault_perms(fault->nested, &fault->prot, &fault->writable);
-
 	kvm_fault_lock(kvm);
 	pgt = fault->vcpu->arch.hw_mmu->pgt;
 	if (mmu_invalidate_retry(kvm, fault->mmu_seq)) {
@@ -1961,24 +1990,6 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 		}
 	}
 
-	if (fault->writable)
-		fault->prot |= KVM_PGTABLE_PROT_W;
-
-	if (fault->exec_fault)
-		fault->prot |= KVM_PGTABLE_PROT_X;
-
-	if (fault->s2_force_noncacheable) {
-		if (fault->vfio_allow_any_uc)
-			fault->prot |= KVM_PGTABLE_PROT_NORMAL_NC;
-		else
-			fault->prot |= KVM_PGTABLE_PROT_DEVICE;
-	} else if (cpus_have_final_cap(ARM64_HAS_CACHE_DIC)) {
-		fault->prot |= KVM_PGTABLE_PROT_X;
-	}
-
-	if (fault->nested)
-		adjust_nested_exec_perms(kvm, fault->nested, &fault->prot);
-
 	/*
 	 * Under the premise of getting a FSC_PERM fault, we just need to relax
 	 * permissions only if fault->vma_pagesize equals fault->fault_granule. Otherwise,
-- 
2.53.0.473.g4a7958ca14-goog


