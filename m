Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6529E10ED65E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 11:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=57YFEYT1njn30BmaW05+JJshUytrLmcs/q9S/5PYYws=; b=QvYUZG+XGX2RhleetfCc4Rjcz7
	rJO7xwZqaSZ0C2go6BQM814hyNA6g0uuOEnqPop9hm5BAYCQQUjZnL6+lu9QhsCsb/kOXA5XwPzgQ
	B9SCnoD2RnSxlwoVfDQKn8Kv2X8r4ArSNIIYqi2EsQChW+bLPFYMBd5pXbS0pQBswW9Q2FCcDrcdY
	kzYlMB9vEMYqf4GaJ6vZn57uIRA8dZjzcME3OEqHEtn5XdsyC+ZefJ9noPEjfMAN2cFgK3mmRdion
	6Y8zsH/3jtTZCWuIV6xelP8Va4DiMVfGB9TCIaGHu+7eKtwsWDLVthiOnPcsWqR+fNGyr154dXELZ
	gZ9HZuVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65Ui-00000007FR7-1Ckb;
	Fri, 27 Mar 2026 11:36:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65UK-00000007F4Q-0kz2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 11:36:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A9E4C44752;
	Fri, 27 Mar 2026 11:36:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CE08C2BCB3;
	Fri, 27 Mar 2026 11:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774611387;
	bh=MV0Scaif8P8dPh58Og9n6ijPDdAPHXlD+neslzGB70I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aeVthJMLq2tp9oX91vkAYSxkG5k3XVxQGda8yyicsUp8+Sqp8un25uCU1wsZVJHfe
	 sKwHlb+VUH64xQABtio7KBji+guSi3bCe4pDt5FT0M8DbqmqPqaGa8EHOQ+asNU9Se
	 IRmdFLRAo6jknz+qMQL3USoeCdJdJ96m0+ntHgaBDgeDLaFaRsLLst70+7XQrvg6gt
	 LC4Nzr4N0xjCwncI6TlM8LjmM7Eah2KyBD2HGzYHdtQI23E9BgE8ZLUDt9PseNOu8E
	 UjcvDlCL+6bPy915QSoqfzizZfpvdCpXSbfrI4gxuXnAnHseJA0Sz8QwDDkr/8Wt5W
	 qmLhagXpE+IKA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w65UH-00000006K4a-2zI7;
	Fri, 27 Mar 2026 11:36:25 +0000
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
Subject: [PATCH v2 15/30] KVM: arm64: Make fault_ipa immutable
Date: Fri, 27 Mar 2026 11:36:03 +0000
Message-ID: <20260327113618.4051534-16-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20260327_043628_313133_B2E4DBA0 
X-CRM114-Status: GOOD (  18.18  )
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

Updating fault_ipa is conceptually annoying, as it changes something
that is a property of the fault itself.

Stop doing so and instead use fault->gfn as the sole piece of state
that can be used to represent the faulting IPA.

At the same time, introduce get_canonical_gfn() for the couple of case
we're we are concerned with the memslot-related IPA and not the faulting
one.

Tested-by: Fuad Tabba <tabba@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/mmu.c | 38 ++++++++++++++++++++++++++------------
 1 file changed, 26 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 67e5e867e01dc..496bf5903ed3d 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1400,10 +1400,10 @@ static bool fault_supports_stage2_huge_mapping(struct kvm_memory_slot *memslot,
  */
 static long
 transparent_hugepage_adjust(struct kvm *kvm, struct kvm_memory_slot *memslot,
-			    unsigned long hva, kvm_pfn_t *pfnp,
-			    phys_addr_t *ipap)
+			    unsigned long hva, kvm_pfn_t *pfnp, gfn_t *gfnp)
 {
 	kvm_pfn_t pfn = *pfnp;
+	gfn_t gfn = *gfnp;
 
 	/*
 	 * Make sure the adjustment is done only for THP pages. Also make
@@ -1419,7 +1419,8 @@ transparent_hugepage_adjust(struct kvm *kvm, struct kvm_memory_slot *memslot,
 		if (sz < PMD_SIZE)
 			return PAGE_SIZE;
 
-		*ipap &= PMD_MASK;
+		gfn &= ~(PTRS_PER_PMD - 1);
+		*gfnp = gfn;
 		pfn &= ~(PTRS_PER_PMD - 1);
 		*pfnp = pfn;
 
@@ -1735,7 +1736,6 @@ static int kvm_s2_fault_get_vma_info(struct kvm_s2_fault *fault)
 {
 	struct vm_area_struct *vma;
 	struct kvm *kvm = fault->vcpu->kvm;
-	phys_addr_t ipa;
 
 	mmap_read_lock(current->mm);
 	vma = vma_lookup(current->mm, fault->hva);
@@ -1753,9 +1753,7 @@ static int kvm_s2_fault_get_vma_info(struct kvm_s2_fault *fault)
 	 * mapping size to ensure we find the right PFN and lay down the
 	 * mapping in the right place.
 	 */
-	fault->fault_ipa = ALIGN_DOWN(fault->fault_ipa, fault->vma_pagesize);
-	ipa = fault->nested ? kvm_s2_trans_output(fault->nested) : fault->fault_ipa;
-	fault->gfn = ALIGN_DOWN(ipa, fault->vma_pagesize) >> PAGE_SHIFT;
+	fault->gfn = ALIGN_DOWN(fault->fault_ipa, fault->vma_pagesize) >> PAGE_SHIFT;
 
 	fault->mte_allowed = kvm_vma_mte_allowed(vma);
 
@@ -1777,6 +1775,17 @@ static int kvm_s2_fault_get_vma_info(struct kvm_s2_fault *fault)
 	return 0;
 }
 
+static gfn_t get_canonical_gfn(struct kvm_s2_fault *fault)
+{
+	phys_addr_t ipa;
+
+	if (!fault->nested)
+		return fault->gfn;
+
+	ipa = kvm_s2_trans_output(fault->nested);
+	return ALIGN_DOWN(ipa, fault->vma_pagesize) >> PAGE_SHIFT;
+}
+
 static int kvm_s2_fault_pin_pfn(struct kvm_s2_fault *fault)
 {
 	int ret;
@@ -1785,7 +1794,7 @@ static int kvm_s2_fault_pin_pfn(struct kvm_s2_fault *fault)
 	if (ret)
 		return ret;
 
-	fault->pfn = __kvm_faultin_pfn(fault->memslot, fault->gfn,
+	fault->pfn = __kvm_faultin_pfn(fault->memslot, get_canonical_gfn(fault),
 				       fault->write_fault ? FOLL_WRITE : 0,
 				       &fault->writable, &fault->page);
 	if (unlikely(is_error_noslot_pfn(fault->pfn))) {
@@ -1885,6 +1894,11 @@ static int kvm_s2_fault_compute_prot(struct kvm_s2_fault *fault)
 	return 0;
 }
 
+static phys_addr_t get_ipa(const struct kvm_s2_fault *fault)
+{
+	return gfn_to_gpa(fault->gfn);
+}
+
 static int kvm_s2_fault_map(struct kvm_s2_fault *fault, void *memcache)
 {
 	struct kvm *kvm = fault->vcpu->kvm;
@@ -1909,7 +1923,7 @@ static int kvm_s2_fault_map(struct kvm_s2_fault *fault, void *memcache)
 		} else {
 			fault->vma_pagesize = transparent_hugepage_adjust(kvm, fault->memslot,
 									  fault->hva, &fault->pfn,
-									  &fault->fault_ipa);
+									  &fault->gfn);
 
 			if (fault->vma_pagesize < 0) {
 				ret = fault->vma_pagesize;
@@ -1932,10 +1946,10 @@ static int kvm_s2_fault_map(struct kvm_s2_fault *fault, void *memcache)
 		 * PTE, which will be preserved.
 		 */
 		fault->prot &= ~KVM_NV_GUEST_MAP_SZ;
-		ret = KVM_PGT_FN(kvm_pgtable_stage2_relax_perms)(pgt, fault->fault_ipa,
+		ret = KVM_PGT_FN(kvm_pgtable_stage2_relax_perms)(pgt, get_ipa(fault),
 								 fault->prot, flags);
 	} else {
-		ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, fault->fault_ipa, fault->vma_pagesize,
+		ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, get_ipa(fault), fault->vma_pagesize,
 							 __pfn_to_phys(fault->pfn), fault->prot,
 							 memcache, flags);
 	}
@@ -1946,7 +1960,7 @@ static int kvm_s2_fault_map(struct kvm_s2_fault *fault, void *memcache)
 
 	/* Mark the page dirty only if the fault is handled successfully */
 	if (fault->writable && !ret)
-		mark_page_dirty_in_slot(kvm, fault->memslot, fault->gfn);
+		mark_page_dirty_in_slot(kvm, fault->memslot, get_canonical_gfn(fault));
 
 	if (ret != -EAGAIN)
 		return ret;
-- 
2.47.3


