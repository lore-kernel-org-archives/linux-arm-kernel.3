Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EBB410ED65E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 11:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yhk80z5dTghmXUT3T3uHwqEqbpWaDXPwF8qijKfIaws=; b=B/vjXumC769zQ0U+cldT/hg+zj
	1jWiY66hfDeHh/ubcYGdsyBsvBNsa8qEF9epICXvPt9YMaAIqG6W6zFv7z8VDs3HSg29+/y7BhQWe
	p3YlGQWGChrLUhoO2/2WuTmtFVSPT2wCPW/BM/QlBuMDUwwGqGMmT36ZM3J7nnTl6IYyURGxCqyYn
	5z/IhXyoVRB8aoXjHiLvXlqU408M7rLws1hR6Ix5hb+YyoWC1uleBteG21x4LCmxkIDVlGGVXTuvr
	wZ4ZW+iY2FLN4e/jLaR646GcZ+URDgTkuW5Jae64RHzW7ADZB2uTM0npH6ISv1wHggrnE45lobRhK
	50xKRKgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65Ul-00000007FYq-4C1y;
	Fri, 27 Mar 2026 11:36:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65UL-00000007F2g-4A3X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 11:36:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CCCD542D7A;
	Fri, 27 Mar 2026 11:36:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73014C2BCB2;
	Fri, 27 Mar 2026 11:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774611389;
	bh=JXO/2iR7xnSArfoHCR9bt5/i8SnG2nbEfIp4JiW/kC8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qoSTxSgUJ5c1hs2nU91k/jyA5ATDm7z8c9RifF4i7fPzUqTP1lCu7DZ4gQZeggaS0
	 /a8Hw9Hi4v3zZMp7Z5dJNpyIvbo8t2ucULZr4LweWp4noYwpBO39uCJDtLLImk/9Ka
	 LMS4vfCFvNdmELszz1DyOn3gNRrGz61fUZTSzkhmaXBdBK6cmSDWuXj/3vNm/GCuo/
	 eOFso9mTLdkgn8T2dXb2HsYh0O3/4r/KActbh2KUg9t+HYxlT6dAPmCfEvoBDFg3lo
	 uvB/xyyq3oG4B50umLJ9kwnM5WRcGfZOrwmkHIhdq1HyLdgcF/+hutysxqoHMNwiF6
	 YRAivRlWnfNsg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w65UJ-00000006K4a-1nqi;
	Fri, 27 Mar 2026 11:36:27 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Quentin Perret <qperret@google.com>
Subject: [PATCH v2 22/30] KVM: arm64: Move VMA-related information to kvm_s2_fault_vma_info
Date: Fri, 27 Mar 2026 11:36:10 +0000
Message-ID: <20260327113618.4051534-23-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327113618.4051534-1-maz@kernel.org>
References: <20260327113618.4051534-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, tabba@google.com, will@kernel.org, qperret@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_043630_188186_0A2BE55E 
X-CRM114-Status: GOOD (  27.73  )
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

Mecanically extract a bunch of VMA-related fields from kvm_s2_fault
and move them to a new kvm_s2_fault_vma_info structure.

This is not much, but it already allows us to define which functions
can update this structure, and which ones are pure consumers of the
data. Those in the latter camp are updated to take a const pointer
to that structure.

Tested-by: Fuad Tabba <tabba@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/mmu.c | 117 ++++++++++++++++++++++++-------------------
 1 file changed, 65 insertions(+), 52 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 5b05caecdbd92..5b2862e2bfcf3 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1648,6 +1648,15 @@ static int gmem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	return ret != -EAGAIN ? ret : 0;
 }
 
+struct kvm_s2_fault_vma_info {
+	unsigned long	mmu_seq;
+	long		vma_pagesize;
+	vm_flags_t	vm_flags;
+	gfn_t		gfn;
+	bool		mte_allowed;
+	bool		is_vma_cacheable;
+};
+
 static short kvm_s2_resolve_vma_size(const struct kvm_s2_fault_desc *s2fd,
 				     struct vm_area_struct *vma, bool *force_pte)
 {
@@ -1712,18 +1721,12 @@ static short kvm_s2_resolve_vma_size(const struct kvm_s2_fault_desc *s2fd,
 
 struct kvm_s2_fault {
 	bool writable;
-	bool mte_allowed;
-	bool is_vma_cacheable;
 	bool s2_force_noncacheable;
-	unsigned long mmu_seq;
-	gfn_t gfn;
 	kvm_pfn_t pfn;
 	bool logging_active;
 	bool force_pte;
-	long vma_pagesize;
 	enum kvm_pgtable_prot prot;
 	struct page *page;
-	vm_flags_t vm_flags;
 };
 
 static bool kvm_s2_fault_is_perm(const struct kvm_s2_fault_desc *s2fd)
@@ -1732,7 +1735,8 @@ static bool kvm_s2_fault_is_perm(const struct kvm_s2_fault_desc *s2fd)
 }
 
 static int kvm_s2_fault_get_vma_info(const struct kvm_s2_fault_desc *s2fd,
-				     struct kvm_s2_fault *fault)
+				     struct kvm_s2_fault *fault,
+				     struct kvm_s2_fault_vma_info *s2vi)
 {
 	struct vm_area_struct *vma;
 	struct kvm *kvm = s2fd->vcpu->kvm;
@@ -1745,20 +1749,20 @@ static int kvm_s2_fault_get_vma_info(const struct kvm_s2_fault_desc *s2fd,
 		return -EFAULT;
 	}
 
-	fault->vma_pagesize = BIT(kvm_s2_resolve_vma_size(s2fd, vma, &fault->force_pte));
+	s2vi->vma_pagesize = BIT(kvm_s2_resolve_vma_size(s2fd, vma, &fault->force_pte));
 
 	/*
 	 * Both the canonical IPA and fault IPA must be aligned to the
 	 * mapping size to ensure we find the right PFN and lay down the
 	 * mapping in the right place.
 	 */
-	fault->gfn = ALIGN_DOWN(s2fd->fault_ipa, fault->vma_pagesize) >> PAGE_SHIFT;
+	s2vi->gfn = ALIGN_DOWN(s2fd->fault_ipa, s2vi->vma_pagesize) >> PAGE_SHIFT;
 
-	fault->mte_allowed = kvm_vma_mte_allowed(vma);
+	s2vi->mte_allowed = kvm_vma_mte_allowed(vma);
 
-	fault->vm_flags = vma->vm_flags;
+	s2vi->vm_flags = vma->vm_flags;
 
-	fault->is_vma_cacheable = kvm_vma_is_cacheable(vma);
+	s2vi->is_vma_cacheable = kvm_vma_is_cacheable(vma);
 
 	/*
 	 * Read mmu_invalidate_seq so that KVM can detect if the results of
@@ -1768,39 +1772,40 @@ static int kvm_s2_fault_get_vma_info(const struct kvm_s2_fault_desc *s2fd,
 	 * Rely on mmap_read_unlock() for an implicit smp_rmb(), which pairs
 	 * with the smp_wmb() in kvm_mmu_invalidate_end().
 	 */
-	fault->mmu_seq = kvm->mmu_invalidate_seq;
+	s2vi->mmu_seq = kvm->mmu_invalidate_seq;
 	mmap_read_unlock(current->mm);
 
 	return 0;
 }
 
 static gfn_t get_canonical_gfn(const struct kvm_s2_fault_desc *s2fd,
-			       const struct kvm_s2_fault *fault)
+			       const struct kvm_s2_fault_vma_info *s2vi)
 {
 	phys_addr_t ipa;
 
 	if (!s2fd->nested)
-		return fault->gfn;
+		return s2vi->gfn;
 
 	ipa = kvm_s2_trans_output(s2fd->nested);
-	return ALIGN_DOWN(ipa, fault->vma_pagesize) >> PAGE_SHIFT;
+	return ALIGN_DOWN(ipa, s2vi->vma_pagesize) >> PAGE_SHIFT;
 }
 
 static int kvm_s2_fault_pin_pfn(const struct kvm_s2_fault_desc *s2fd,
-				struct kvm_s2_fault *fault)
+				struct kvm_s2_fault *fault,
+				struct kvm_s2_fault_vma_info *s2vi)
 {
 	int ret;
 
-	ret = kvm_s2_fault_get_vma_info(s2fd, fault);
+	ret = kvm_s2_fault_get_vma_info(s2fd, fault, s2vi);
 	if (ret)
 		return ret;
 
-	fault->pfn = __kvm_faultin_pfn(s2fd->memslot, get_canonical_gfn(s2fd, fault),
+	fault->pfn = __kvm_faultin_pfn(s2fd->memslot, get_canonical_gfn(s2fd, s2vi),
 				       kvm_is_write_fault(s2fd->vcpu) ? FOLL_WRITE : 0,
 				       &fault->writable, &fault->page);
 	if (unlikely(is_error_noslot_pfn(fault->pfn))) {
 		if (fault->pfn == KVM_PFN_ERR_HWPOISON) {
-			kvm_send_hwpoison_signal(s2fd->hva, __ffs(fault->vma_pagesize));
+			kvm_send_hwpoison_signal(s2fd->hva, __ffs(s2vi->vma_pagesize));
 			return 0;
 		}
 		return -EFAULT;
@@ -1810,7 +1815,8 @@ static int kvm_s2_fault_pin_pfn(const struct kvm_s2_fault_desc *s2fd,
 }
 
 static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
-				     struct kvm_s2_fault *fault)
+				     struct kvm_s2_fault *fault,
+				     const struct kvm_s2_fault_vma_info *s2vi)
 {
 	struct kvm *kvm = s2fd->vcpu->kvm;
 
@@ -1818,8 +1824,8 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
 	 * Check if this is non-struct page memory PFN, and cannot support
 	 * CMOs. It could potentially be unsafe to access as cacheable.
 	 */
-	if (fault->vm_flags & (VM_PFNMAP | VM_MIXEDMAP) && !pfn_is_map_memory(fault->pfn)) {
-		if (fault->is_vma_cacheable) {
+	if (s2vi->vm_flags & (VM_PFNMAP | VM_MIXEDMAP) && !pfn_is_map_memory(fault->pfn)) {
+		if (s2vi->is_vma_cacheable) {
 			/*
 			 * Whilst the VMA owner expects cacheable mapping to this
 			 * PFN, hardware also has to support the FWB and CACHE DIC
@@ -1879,7 +1885,7 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
 		fault->prot |= KVM_PGTABLE_PROT_X;
 
 	if (fault->s2_force_noncacheable)
-		fault->prot |= (fault->vm_flags & VM_ALLOW_ANY_UNCACHED) ?
+		fault->prot |= (s2vi->vm_flags & VM_ALLOW_ANY_UNCACHED) ?
 			       KVM_PGTABLE_PROT_NORMAL_NC : KVM_PGTABLE_PROT_DEVICE;
 	else if (cpus_have_final_cap(ARM64_HAS_CACHE_DIC))
 		fault->prot |= KVM_PGTABLE_PROT_X;
@@ -1889,74 +1895,73 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
 
 	if (!kvm_s2_fault_is_perm(s2fd) && !fault->s2_force_noncacheable && kvm_has_mte(kvm)) {
 		/* Check the VMM hasn't introduced a new disallowed VMA */
-		if (!fault->mte_allowed)
+		if (!s2vi->mte_allowed)
 			return -EFAULT;
 	}
 
 	return 0;
 }
 
-static phys_addr_t get_ipa(const struct kvm_s2_fault *fault)
-{
-	return gfn_to_gpa(fault->gfn);
-}
-
 static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
-			    struct kvm_s2_fault *fault, void *memcache)
+			    struct kvm_s2_fault *fault,
+			    const struct kvm_s2_fault_vma_info *s2vi, void *memcache)
 {
+	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_SHARED;
 	struct kvm *kvm = s2fd->vcpu->kvm;
 	struct kvm_pgtable *pgt;
 	long perm_fault_granule;
+	long mapping_size;
+	gfn_t gfn;
 	int ret;
-	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_SHARED;
 
 	kvm_fault_lock(kvm);
 	pgt = s2fd->vcpu->arch.hw_mmu->pgt;
 	ret = -EAGAIN;
-	if (mmu_invalidate_retry(kvm, fault->mmu_seq))
+	if (mmu_invalidate_retry(kvm, s2vi->mmu_seq))
 		goto out_unlock;
 
 	perm_fault_granule = (kvm_s2_fault_is_perm(s2fd) ?
 			      kvm_vcpu_trap_get_perm_fault_granule(s2fd->vcpu) : 0);
+	mapping_size = s2vi->vma_pagesize;
+	gfn = s2vi->gfn;
 
 	/*
 	 * If we are not forced to use page mapping, check if we are
 	 * backed by a THP and thus use block mapping if possible.
 	 */
-	if (fault->vma_pagesize == PAGE_SIZE &&
+	if (mapping_size == PAGE_SIZE &&
 	    !(fault->force_pte || fault->s2_force_noncacheable)) {
 		if (perm_fault_granule > PAGE_SIZE) {
-			fault->vma_pagesize = perm_fault_granule;
+			mapping_size = perm_fault_granule;
 		} else {
-			fault->vma_pagesize = transparent_hugepage_adjust(kvm, s2fd->memslot,
-									  s2fd->hva, &fault->pfn,
-									  &fault->gfn);
-
-			if (fault->vma_pagesize < 0) {
-				ret = fault->vma_pagesize;
+			mapping_size = transparent_hugepage_adjust(kvm, s2fd->memslot,
+								   s2fd->hva, &fault->pfn,
+								   &gfn);
+			if (mapping_size < 0) {
+				ret = mapping_size;
 				goto out_unlock;
 			}
 		}
 	}
 
 	if (!perm_fault_granule && !fault->s2_force_noncacheable && kvm_has_mte(kvm))
-		sanitise_mte_tags(kvm, fault->pfn, fault->vma_pagesize);
+		sanitise_mte_tags(kvm, fault->pfn, mapping_size);
 
 	/*
 	 * Under the premise of getting a FSC_PERM fault, we just need to relax
-	 * permissions only if vma_pagesize equals perm_fault_granule. Otherwise,
+	 * permissions only if mapping_size equals perm_fault_granule. Otherwise,
 	 * kvm_pgtable_stage2_map() should be called to change block size.
 	 */
-	if (fault->vma_pagesize == perm_fault_granule) {
+	if (mapping_size == perm_fault_granule) {
 		/*
 		 * Drop the SW bits in favour of those stored in the
 		 * PTE, which will be preserved.
 		 */
 		fault->prot &= ~KVM_NV_GUEST_MAP_SZ;
-		ret = KVM_PGT_FN(kvm_pgtable_stage2_relax_perms)(pgt, get_ipa(fault),
+		ret = KVM_PGT_FN(kvm_pgtable_stage2_relax_perms)(pgt, gfn_to_gpa(gfn),
 								 fault->prot, flags);
 	} else {
-		ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, get_ipa(fault), fault->vma_pagesize,
+		ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, gfn_to_gpa(gfn), mapping_size,
 							 __pfn_to_phys(fault->pfn), fault->prot,
 							 memcache, flags);
 	}
@@ -1965,9 +1970,16 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 	kvm_release_faultin_page(kvm, fault->page, !!ret, fault->writable);
 	kvm_fault_unlock(kvm);
 
-	/* Mark the page dirty only if the fault is handled successfully */
-	if (fault->writable && !ret)
-		mark_page_dirty_in_slot(kvm, s2fd->memslot, get_canonical_gfn(s2fd, fault));
+	/*
+	 * Mark the page dirty only if the fault is handled successfully,
+	 * making sure we adjust the canonical IPA if the mapping size has
+	 * been updated (via a THP upgrade, for example).
+	 */
+	if (fault->writable && !ret) {
+		phys_addr_t ipa = gfn_to_gpa(get_canonical_gfn(s2fd, s2vi));
+		ipa &= ~(mapping_size - 1);
+		mark_page_dirty_in_slot(kvm, s2fd->memslot, gpa_to_gfn(ipa));
+	}
 
 	if (ret != -EAGAIN)
 		return ret;
@@ -1978,6 +1990,7 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 {
 	bool perm_fault = kvm_vcpu_trap_is_permission_fault(s2fd->vcpu);
 	bool logging_active = memslot_is_logging(s2fd->memslot);
+	struct kvm_s2_fault_vma_info s2vi = {};
 	struct kvm_s2_fault fault = {
 		.logging_active = logging_active,
 		.force_pte = logging_active,
@@ -2002,17 +2015,17 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 	 * Let's check if we will get back a huge page backed by hugetlbfs, or
 	 * get block mapping for device MMIO region.
 	 */
-	ret = kvm_s2_fault_pin_pfn(s2fd, &fault);
+	ret = kvm_s2_fault_pin_pfn(s2fd, &fault, &s2vi);
 	if (ret != 1)
 		return ret;
 
-	ret = kvm_s2_fault_compute_prot(s2fd, &fault);
+	ret = kvm_s2_fault_compute_prot(s2fd, &fault, &s2vi);
 	if (ret) {
 		kvm_release_page_unused(fault.page);
 		return ret;
 	}
 
-	return kvm_s2_fault_map(s2fd, &fault, memcache);
+	return kvm_s2_fault_map(s2fd, &fault, &s2vi, memcache);
 }
 
 /* Resolve the access fault by making the page young again. */
-- 
2.47.3


