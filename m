Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE4A6F53D84
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 17:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XTSWpFzDQhkzYBj2qtfGg7g7Ni+dLORSNrB1AT8+nfw=; b=pakob8tcaN0YQPceySGN6wB5RV
	tP0SUcc5OG0hAwml7oN6f8R3NdKwyVZgT0rn6RdlgBzoEMK1cmAQ+T05SnM2DjZmKO4857Np2d2Gm
	Jeq4EfP2EUgM+qcdD4+tHdP0Q2Z8P1c2HNprMX3vM821Fpqz0a1BVPiBN9dBQtOI0GEo5oH45N4zW
	JGWFDzQ78GFpjHlpIWh1XTQB6FlwQQZ+Osnuwf3Qlw+0oRpDjg7Ozj1D6lt+iH4hF/XYLE7GaNvMQ
	xRKWod+sbPRAFDH3XqrvJOWixrbt2APoEOGBIB5C3WDT1KQPJDpS5Mj5lvo7vh6ToOcUJKe132rKY
	7DOneO1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2C9o-00000004csG-1xSd;
	Mon, 16 Mar 2026 17:55:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2C9i-00000004cmM-3A6y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 17:55:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B735244577;
	Mon, 16 Mar 2026 17:55:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BCA7C2BCB1;
	Mon, 16 Mar 2026 17:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773683703;
	bh=cvE1z8lorC1RF6rgkXTsGeUvZNPlHNmMijZGRMZd0bs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h6/VbXDwYii+GfFVDmGzvmgf8shVcex3r3QyEcJQPpYzqdHIfRfs6l0hlCzAqBE0M
	 R3E3JfPID/q4s25dABAe0cBgAJHrOo14QmVD/jo47JJ5p9WgQJC02PCfXpwmgOwhac
	 xY80tH1PAuTH+3KcX8CsXada7nH79BUwqmTHzZMMwTbWzFr6usBlZjMXJIJ3uphjUM
	 iqPuDkVsJLLi13NzagVBqHDYPDaWq8kka0KJTINYnWTxP63RCV1Q97+goB8Q3GQGl0
	 JhXnCwreJ2waa+vEd3JGpAFStM1a2ze0kQV4xE/Aw7T5GkYXiatdQPkg+ykoXME3Ph
	 PzUY5U9choAsg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w2C9d-00000002XDx-3Jop;
	Mon, 16 Mar 2026 17:55:01 +0000
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
Subject: [PATCH 11/17] KVM: arm64: Restrict the scope of the 'writable' attribute
Date: Mon, 16 Mar 2026 17:54:44 +0000
Message-ID: <20260316175451.1866175-12-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20260316_105506_857631_68093A54 
X-CRM114-Status: GOOD (  16.06  )
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

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/mmu.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index caa5bedc79e19..3cfb8f2a6d186 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1717,10 +1717,10 @@ struct kvm_s2_fault_vma_info {
 	gfn_t		gfn;
 	bool		mte_allowed;
 	bool		is_vma_cacheable;
+	bool		map_writable;
 };
 
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
@@ -1966,11 +1968,11 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 	}
 
 out_unlock:
-	kvm_release_faultin_page(kvm, fault->page, !!ret, fault->writable);
+	kvm_release_faultin_page(kvm, fault->page, !!ret, writable);
 	kvm_fault_unlock(kvm);
 
 	/* Mark the page dirty only if the fault is handled successfully */
-	if (fault->writable && !ret) {
+	if (writable && !ret) {
 		phys_addr_t ipa = gfn_to_gpa(get_canonical_gfn(s2fd, s2vi));
 		ipa &= ~(mapping_size - 1);
 		mark_page_dirty_in_slot(kvm, s2fd->memslot, gpa_to_gfn(ipa));
-- 
2.47.3


