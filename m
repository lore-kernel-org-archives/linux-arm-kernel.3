Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A38C410ED65C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 11:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k07hmyy/GgHt8VpSbmcKbkNNP+GWt7pfhRToC3DytcE=; b=ILXlTW1vomHMMk6d6MDJVSl5hF
	ZJiSSPU+nGhKYvjM9Ty9hlxRg3oHL+iLIrDrLoITyvVztmErWjjtWNAtwmHbBOvyTRaVltNDUKL6H
	PimRFbmAsStv+8q+LdBNGWUu8mJkinIcYOBLyaLHin72q2+JiglFmRuELn3QReOaMClyuikBjUlxz
	Z5NYaiPVlENYdIL1jzmzhYsYKwBY9af8WGiJDDRwV+PgBArqNcER0m3X7MMVZj8On9tbHpDfM9p2n
	4yGOlU7ILLteUZwkDB4Hn8meokVP5/2yyTSXaj0L/1njFMZMv/vfC2n4UlwbIwamBpC+YSSy9gF0O
	xDZFw+Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65Uo-00000007FeB-1wJf;
	Fri, 27 Mar 2026 11:36:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65UM-00000007F2L-1gZM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 11:36:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C4F144738;
	Fri, 27 Mar 2026 11:36:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F130FC2BCB9;
	Fri, 27 Mar 2026 11:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774611390;
	bh=3OfrA9uRh9uQmzOFOsa8ijQ60jgqHYTvRLxz/uPMQc0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mLf6f3uZ3TJsfvGtQB5ftAG2WgKZE5tbHGKYg4WFgUip4Bo5hovlh95fWwO5hENdS
	 sb7o2zP+DPXVxE4yZjsItx7hYr4aUgyVU66Fmki/ZxhuGM7DhLo2j8206x0zTBAw/N
	 Z3Q6UNplVS4dXh0lvzgWuxJEueLAAK2IyW2hxrgGU1j08M/2+lVXELgVK9VHIatftW
	 VQf84BDqqKH9/WqAauFi1qTIdop4JC17PXkAESMYD1F0yWa95X05KrqEyXAC5TcprR
	 ZFFfx+yi9bQXoBf0jmM53RVfhaDOmiDCaNffv9cXih/CadYer7KmPRZdEYa5/F3faq
	 3nrz6MJj/Kr3A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w65UJ-00000006K4a-3wbA;
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
Subject: [PATCH v2 24/30] KVM: arm64: Restrict the scope of the 'writable' attribute
Date: Fri, 27 Mar 2026 11:36:12 +0000
Message-ID: <20260327113618.4051534-25-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20260327_043630_523592_2D3D2C75 
X-CRM114-Status: GOOD (  16.02  )
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

The 'writable' field is ambiguous, and indicates multiple things:

- whether the underlying memslot is writable

- whether we are resolving the fault with writable attributes

Add a new field to kvm_s2_fault_vma_info (map_writable) to indicate
the former condition, and have local writable variables to track
the latter.

Tested-by: Fuad Tabba <tabba@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/mmu.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 26313e0b40c25..91767a2e6e9f2 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1655,6 +1655,7 @@ struct kvm_s2_fault_vma_info {
 	gfn_t		gfn;
 	bool		mte_allowed;
 	bool		is_vma_cacheable;
+	bool		map_writable;
 };
 
 static short kvm_s2_resolve_vma_size(const struct kvm_s2_fault_desc *s2fd,
@@ -1720,7 +1721,6 @@ static short kvm_s2_resolve_vma_size(const struct kvm_s2_fault_desc *s2fd,
 }
 
 struct kvm_s2_fault {
-	bool writable;
 	bool s2_force_noncacheable;
 	kvm_pfn_t pfn;
 	bool force_pte;
@@ -1801,7 +1801,7 @@ static int kvm_s2_fault_pin_pfn(const struct kvm_s2_fault_desc *s2fd,
 
 	fault->pfn = __kvm_faultin_pfn(s2fd->memslot, get_canonical_gfn(s2fd, s2vi),
 				       kvm_is_write_fault(s2fd->vcpu) ? FOLL_WRITE : 0,
-				       &fault->writable, &fault->page);
+				       &s2vi->map_writable, &fault->page);
 	if (unlikely(is_error_noslot_pfn(fault->pfn))) {
 		if (fault->pfn == KVM_PFN_ERR_HWPOISON) {
 			kvm_send_hwpoison_signal(s2fd->hva, __ffs(s2vi->vma_pagesize));
@@ -1818,6 +1818,7 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
 				     const struct kvm_s2_fault_vma_info *s2vi)
 {
 	struct kvm *kvm = s2fd->vcpu->kvm;
+	bool writable = s2vi->map_writable;
 
 	/*
 	 * Check if this is non-struct page memory PFN, and cannot support
@@ -1857,7 +1858,7 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
 		 * Only actually map the page as writable if this was a write
 		 * fault.
 		 */
-		fault->writable = false;
+		writable = false;
 	}
 
 	if (kvm_vcpu_trap_is_exec_fault(s2fd->vcpu) && fault->s2_force_noncacheable)
@@ -1875,9 +1876,9 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
 	}
 
 	if (s2fd->nested)
-		adjust_nested_fault_perms(s2fd->nested, &fault->prot, &fault->writable);
+		adjust_nested_fault_perms(s2fd->nested, &fault->prot, &writable);
 
-	if (fault->writable)
+	if (writable)
 		fault->prot |= KVM_PGTABLE_PROT_W;
 
 	if (kvm_vcpu_trap_is_exec_fault(s2fd->vcpu))
@@ -1906,6 +1907,7 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 			    const struct kvm_s2_fault_vma_info *s2vi, void *memcache)
 {
 	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_SHARED;
+	bool writable = fault->prot & KVM_PGTABLE_PROT_W;
 	struct kvm *kvm = s2fd->vcpu->kvm;
 	struct kvm_pgtable *pgt;
 	long perm_fault_granule;
@@ -1966,7 +1968,7 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 	}
 
 out_unlock:
-	kvm_release_faultin_page(kvm, fault->page, !!ret, fault->writable);
+	kvm_release_faultin_page(kvm, fault->page, !!ret, writable);
 	kvm_fault_unlock(kvm);
 
 	/*
@@ -1974,7 +1976,7 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 	 * making sure we adjust the canonical IPA if the mapping size has
 	 * been updated (via a THP upgrade, for example).
 	 */
-	if (fault->writable && !ret) {
+	if (writable && !ret) {
 		phys_addr_t ipa = gfn_to_gpa(get_canonical_gfn(s2fd, s2vi));
 		ipa &= ~(mapping_size - 1);
 		mark_page_dirty_in_slot(kvm, s2fd->memslot, gpa_to_gfn(ipa));
-- 
2.47.3


