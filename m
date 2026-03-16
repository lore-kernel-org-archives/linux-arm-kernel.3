Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F9CF53D88
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 17:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t+Ke6MDKJVqcEf9NrO+D7AvgQVN5Q8TFNGGQNWsXyfo=; b=iczgsHxfnDHA8jEf1d1rinAdWc
	E+jYRj/AAh1j6wcn4jaa78t/P+IVn7wqNla09hTpQZ80dejshpnsb6BquPDovZPbmwgqTYXAbHV/n
	9toHu0R93x+JQzYssbzypji5skDRwgNRC4Gh3mpaLimHXrzPfbfCqgL6kZRzsFtHIMG8hBY4/MQUc
	Z8tBWuR0MWhaMaWkWCm4BWSc4b2WYtr7Yl+5Rur96Z0zr07ald9PJmpzNpZ98rctc2fl3n4/TBzlc
	IC5fdYKwX//gp4wFre2a49/yrKptay1VGWdAqy2gcoiMb4RmGMurXsCJ/AtbX8DsqeJgqz4c6AbI6
	Rptdp8Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2C9o-00000004crW-0QG9;
	Mon, 16 Mar 2026 17:55:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2C9i-00000004clC-2LWr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 17:55:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 01F4744587;
	Mon, 16 Mar 2026 17:55:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5627C19421;
	Mon, 16 Mar 2026 17:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773683703;
	bh=cV+TwzDOA+fi1UarfuRSdZezVkK7/lzJK4izZHAr6D8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ndvGsjDu/n2SZjTHxG8JtvA8cy706afsjKKuz12qGhSi5TEIBY7V0QnQiwVfZA69y
	 HA0ta1aIAM2L/UXux3eBwKpvPsy1mJc6Y0ZnGP1ji+3RNbOtaMaZea+DRjuwwjumlQ
	 si3Wt2SijfOGbR4jspdzrYW2uF8sKm+Vaosrn0nMSzulOFUf1Y/TVzCocFprrXSbG5
	 noAyboc8+WTSJ3IOU1Rp33ctasA7Ufqpsii+gQyU3v5MnEEQYi1owj2DTVaoyIyCVP
	 vN/1s9fkyycj7DQLXnMmQ5h9PA7k5ummtVPRMG+IFZuDshvE+dpjtNikFmXa5SyAfD
	 q4lFcdsOFMoHw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w2C9e-00000002XDx-06XR;
	Mon, 16 Mar 2026 17:55:02 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Quentin Perret <qperret@google.com>
Subject: [PATCH 12/17] KVM: arm64: Move kvm_s2_fault.{pfn,page} to kvm_s2_vma_info
Date: Mon, 16 Mar 2026 17:54:45 +0000
Message-ID: <20260316175451.1866175-13-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260316175451.1866175-1-maz@kernel.org>
References: <20260316175451.1866175-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, tabba@google.com, will@kernel.org, qperret@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_105506_722610_E1086339 
X-CRM114-Status: GOOD (  17.80  )
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

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/mmu.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 3cfb8f2a6d186..ccdc9398e4ce2 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1714,6 +1714,8 @@ struct kvm_s2_fault_vma_info {
 	unsigned long	mmu_seq;
 	long		vma_pagesize;
 	vm_flags_t	vm_flags;
+	struct page	*page;
+	kvm_pfn_t	pfn;
 	gfn_t		gfn;
 	bool		mte_allowed;
 	bool		is_vma_cacheable;
@@ -1722,10 +1724,8 @@ struct kvm_s2_fault_vma_info {
 
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
 
@@ -1924,10 +1925,11 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 	perm_fault_granule = (kvm_s2_fault_is_perm(s2fd) ?
 			      kvm_vcpu_trap_get_perm_fault_granule(s2fd->vcpu) : 0);
 	mapping_size = s2vi->vma_pagesize;
+	pfn = s2vi->pfn;
 	gfn = s2vi->gfn;
 
 	/*
-	 * If we are not forced to use fault->page mapping, check if we are
+	 * If we are not forced to use page mapping, check if we are
 	 * backed by a THP and thus use block mapping if possible.
 	 */
 	if (mapping_size == PAGE_SIZE &&
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
 
 	/* Mark the page dirty only if the fault is handled successfully */
@@ -2017,7 +2019,7 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 
 	ret = kvm_s2_fault_compute_prot(s2fd, &fault, &s2vi);
 	if (ret) {
-		kvm_release_page_unused(fault.page);
+		kvm_release_page_unused(s2vi.page);
 		return ret;
 	}
 
-- 
2.47.3


