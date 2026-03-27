Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C32B10ED65E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 11:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3w7S4fbvur4s/VCTuzy+xJoxkUZaYaAmkrI0w0ljUgU=; b=12b2P0c+rjgx2b41E9ztDrdHQT
	ltMWUfkZYmTlz04IwKFb22RsZOHa7xof2iUl5Pz+oiCjq6Z09RoR/INKst3a1PT04uSn0XmhaN2Al
	9Ta1Egzqf0appa/5Q2IWU8kXhefoFqUyb5hcL7XVVVLeGpNV8ltx1TfFZ1hkprrWo6YJu8Q0loSfm
	rJ3AGgcTbkXOUBypX28UVWJen2j+LYdmphaHcB0hjqu0Cs1P9Ldsjajs+mwOsdXX/G3lUjs+ZVAgH
	mCB3Yie2UohLU3japier5OcX6pTF9pvMgnixnp0bkQGuEhFmZl9ojpg5AhKR1aeoVF88+dtZKKZd5
	xJhov1sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65Um-00000007FaL-33Uc;
	Fri, 27 Mar 2026 11:36:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65UM-00000007F3C-28WT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 11:36:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6265C44749;
	Fri, 27 Mar 2026 11:36:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31052C2BCB6;
	Fri, 27 Mar 2026 11:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774611390;
	bh=1bQKCb7BXL+xYOOVLaQxMZMRHM4eHSQAOwXHhv1tOy0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ppfO8GETBMFvNrHjeLHbRq33crNyZbj2RYmYCDWQY59W0hZA6JAQ7S4l4sWmSEpmK
	 c/0OMkUkiB7ZJDvolcZ31/Zc2PYpyqXCZxVA+kTCh0m5J3jt6eGOedk9RQeDdaRcdx
	 hBumsHQhkaq5FRPKhc0ImD6+pkGKBI0H/H3EAU+Yw+oXYPbT0KlVH1d7WY/DaqypPd
	 XGVodam+q5ZdWNf3CEYfEjkdSamb1KB6xo74kzhv8PDF+gYWkEVJjRCtMm7uzSjAiL
	 p4H3OQnDVWmVTtKES9asBR02A6VcpyIJfLz1oof5JvgOzNBRLonZefb7C2e3psTURO
	 nwHFiO+2FsvKA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w65UK-00000006K4a-0iRS;
	Fri, 27 Mar 2026 11:36:28 +0000
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
Subject: [PATCH v2 25/30] KVM: arm64: Move kvm_s2_fault.{pfn,page} to kvm_s2_vma_info
Date: Fri, 27 Mar 2026 11:36:13 +0000
Message-ID: <20260327113618.4051534-26-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20260327_043630_644261_419E0DC8 
X-CRM114-Status: GOOD (  16.37  )
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

Continue restricting the visibility/mutability of some attributes
by moving kvm_s2_fault.{pfn,page} to kvm_s2_vma_info.

This is a pretty mechanical change.

Tested-by: Fuad Tabba <tabba@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/mmu.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 91767a2e6e9f2..39f01dd59259c 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1652,6 +1652,8 @@ struct kvm_s2_fault_vma_info {
 	unsigned long	mmu_seq;
 	long		vma_pagesize;
 	vm_flags_t	vm_flags;
+	struct page	*page;
+	kvm_pfn_t	pfn;
 	gfn_t		gfn;
 	bool		mte_allowed;
 	bool		is_vma_cacheable;
@@ -1722,10 +1724,8 @@ static short kvm_s2_resolve_vma_size(const struct kvm_s2_fault_desc *s2fd,
 
 struct kvm_s2_fault {
 	bool s2_force_noncacheable;
-	kvm_pfn_t pfn;
 	bool force_pte;
 	enum kvm_pgtable_prot prot;
-	struct page *page;
 };
 
 static bool kvm_s2_fault_is_perm(const struct kvm_s2_fault_desc *s2fd)
@@ -1799,11 +1799,11 @@ static int kvm_s2_fault_pin_pfn(const struct kvm_s2_fault_desc *s2fd,
 	if (ret)
 		return ret;
 
-	fault->pfn = __kvm_faultin_pfn(s2fd->memslot, get_canonical_gfn(s2fd, s2vi),
-				       kvm_is_write_fault(s2fd->vcpu) ? FOLL_WRITE : 0,
-				       &s2vi->map_writable, &fault->page);
-	if (unlikely(is_error_noslot_pfn(fault->pfn))) {
-		if (fault->pfn == KVM_PFN_ERR_HWPOISON) {
+	s2vi->pfn = __kvm_faultin_pfn(s2fd->memslot, get_canonical_gfn(s2fd, s2vi),
+				      kvm_is_write_fault(s2fd->vcpu) ? FOLL_WRITE : 0,
+				      &s2vi->map_writable, &s2vi->page);
+	if (unlikely(is_error_noslot_pfn(s2vi->pfn))) {
+		if (s2vi->pfn == KVM_PFN_ERR_HWPOISON) {
 			kvm_send_hwpoison_signal(s2fd->hva, __ffs(s2vi->vma_pagesize));
 			return 0;
 		}
@@ -1824,7 +1824,7 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
 	 * Check if this is non-struct page memory PFN, and cannot support
 	 * CMOs. It could potentially be unsafe to access as cacheable.
 	 */
-	if (s2vi->vm_flags & (VM_PFNMAP | VM_MIXEDMAP) && !pfn_is_map_memory(fault->pfn)) {
+	if (s2vi->vm_flags & (VM_PFNMAP | VM_MIXEDMAP) && !pfn_is_map_memory(s2vi->pfn)) {
 		if (s2vi->is_vma_cacheable) {
 			/*
 			 * Whilst the VMA owner expects cacheable mapping to this
@@ -1912,6 +1912,7 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 	struct kvm_pgtable *pgt;
 	long perm_fault_granule;
 	long mapping_size;
+	kvm_pfn_t pfn;
 	gfn_t gfn;
 	int ret;
 
@@ -1924,6 +1925,7 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 	perm_fault_granule = (kvm_s2_fault_is_perm(s2fd) ?
 			      kvm_vcpu_trap_get_perm_fault_granule(s2fd->vcpu) : 0);
 	mapping_size = s2vi->vma_pagesize;
+	pfn = s2vi->pfn;
 	gfn = s2vi->gfn;
 
 	/*
@@ -1936,7 +1938,7 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 			mapping_size = perm_fault_granule;
 		} else {
 			mapping_size = transparent_hugepage_adjust(kvm, s2fd->memslot,
-								   s2fd->hva, &fault->pfn,
+								   s2fd->hva, &pfn,
 								   &gfn);
 			if (mapping_size < 0) {
 				ret = mapping_size;
@@ -1946,7 +1948,7 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 	}
 
 	if (!perm_fault_granule && !fault->s2_force_noncacheable && kvm_has_mte(kvm))
-		sanitise_mte_tags(kvm, fault->pfn, mapping_size);
+		sanitise_mte_tags(kvm, pfn, mapping_size);
 
 	/*
 	 * Under the premise of getting a FSC_PERM fault, we just need to relax
@@ -1963,12 +1965,12 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 								 fault->prot, flags);
 	} else {
 		ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, gfn_to_gpa(gfn), mapping_size,
-							 __pfn_to_phys(fault->pfn), fault->prot,
+							 __pfn_to_phys(pfn), fault->prot,
 							 memcache, flags);
 	}
 
 out_unlock:
-	kvm_release_faultin_page(kvm, fault->page, !!ret, writable);
+	kvm_release_faultin_page(kvm, s2vi->page, !!ret, writable);
 	kvm_fault_unlock(kvm);
 
 	/*
@@ -2021,7 +2023,7 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 
 	ret = kvm_s2_fault_compute_prot(s2fd, &fault, &s2vi);
 	if (ret) {
-		kvm_release_page_unused(fault.page);
+		kvm_release_page_unused(s2vi.page);
 		return ret;
 	}
 
-- 
2.47.3


