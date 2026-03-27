Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1164A10ED65C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 11:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tmh6M2/mzY+oGh5N5rIzMHsKvnxwCj+/Mu0chUYhm6M=; b=HQ4dFkPWeMQF80aIWBwpZV868O
	6lsX9vVAniwAgCQ9gF9r/JO4iXQjob5Q8xj/hzLhqGCXOkbifRzLFpO/laWnxrRfmP2aA+PtWhchZ
	kLzxhmhYJoQyiboAVx7MA48nqm1F/aycSAX4sT2ooJPbOOBvAg5Px064Lw8dLTjsyTVH78ICGmv0t
	0IjM+Hxu1neofP/xOIkSh7VTnWfKFv8hyGOAQ2w/x/SYXCi5okEs0Kmgag8xlVltWKSTyfx2Mc5uE
	HMl6H0txXzpPKH1OxCo4yhjJNorZVhUSczZz2yN9uxJvGtCDgV4avxUXazfnDsbE5CkHF3vh4zOup
	shOxtHFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65Uk-00000007FVk-2nlI;
	Fri, 27 Mar 2026 11:36:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65UK-00000007F56-3NCp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 11:36:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6EE3644767;
	Fri, 27 Mar 2026 11:36:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E2F8C2BCB0;
	Fri, 27 Mar 2026 11:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774611388;
	bh=tKlJeqRs+lNAXLMbIZCSYajfPwVkHyxypi6fRUMjj6E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CHBdEFSmhB/Xv6AbxhEoul2ahdd54LgFkWOfo+sCfOL05Y/4tzRjW7i/B2yNhlTpO
	 WTPqcIGN0rR1aa5wyJn/3yj+x9LDVvFxQ3Y0EudsrMi0dy+YN/BCw0oSJpFuX1hzlh
	 6vIvXjtNhtoeNItC8pfOSq2TRXSMN6UKDgZbHalfUfC4mvg7RZhMqCN8TelHJnfexf
	 g7tesUUzYtvNTrPAQtsXmv+1I0AOXlRHYaSrQAKBwxdyGXO/zjqW38HZ9qloEHTStJ
	 D7wSlDqQHBvINVv/Mi2oKqHbDdw+5tyGyr5PNnlYgr3M3D5cyHmbAv8WwjLCJ4h/BU
	 qzSaqlk2Lcy4A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w65UI-00000006K4a-1vdP;
	Fri, 27 Mar 2026 11:36:26 +0000
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
Subject: [PATCH v2 18/30] KVM: arm64: Constrain fault_granule to kvm_s2_fault_map()
Date: Fri, 27 Mar 2026 11:36:06 +0000
Message-ID: <20260327113618.4051534-19-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20260327_043628_916086_7B1B75F4 
X-CRM114-Status: GOOD (  16.87  )
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

The notion of fault_granule is specific to kvm_s2_fault_map(), and
is unused anywhere else.

Move this variable locally, removing it from kvm_s2_fault.

Tested-by: Fuad Tabba <tabba@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/mmu.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 1e0d93d6d265a..981c04a74ab7a 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1724,7 +1724,6 @@ struct kvm_s2_fault {
 	bool logging_active;
 	bool force_pte;
 	long vma_pagesize;
-	long fault_granule;
 	enum kvm_pgtable_prot prot;
 	struct page *page;
 	vm_flags_t vm_flags;
@@ -1908,9 +1907,9 @@ static phys_addr_t get_ipa(const struct kvm_s2_fault *fault)
 static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 			    struct kvm_s2_fault *fault, void *memcache)
 {
-	bool fault_is_perm = kvm_s2_fault_is_perm(s2fd);
 	struct kvm *kvm = s2fd->vcpu->kvm;
 	struct kvm_pgtable *pgt;
+	long perm_fault_granule;
 	int ret;
 	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_SHARED;
 
@@ -1920,14 +1919,17 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 	if (mmu_invalidate_retry(kvm, fault->mmu_seq))
 		goto out_unlock;
 
+	perm_fault_granule = (kvm_s2_fault_is_perm(s2fd) ?
+			      kvm_vcpu_trap_get_perm_fault_granule(s2fd->vcpu) : 0);
+
 	/*
 	 * If we are not forced to use page mapping, check if we are
 	 * backed by a THP and thus use block mapping if possible.
 	 */
 	if (fault->vma_pagesize == PAGE_SIZE &&
 	    !(fault->force_pte || fault->s2_force_noncacheable)) {
-		if (fault_is_perm && fault->fault_granule > PAGE_SIZE) {
-			fault->vma_pagesize = fault->fault_granule;
+		if (perm_fault_granule > PAGE_SIZE) {
+			fault->vma_pagesize = perm_fault_granule;
 		} else {
 			fault->vma_pagesize = transparent_hugepage_adjust(kvm, s2fd->memslot,
 									  s2fd->hva, &fault->pfn,
@@ -1940,15 +1942,15 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 		}
 	}
 
-	if (!fault_is_perm && !fault->s2_force_noncacheable && kvm_has_mte(kvm))
+	if (!perm_fault_granule && !fault->s2_force_noncacheable && kvm_has_mte(kvm))
 		sanitise_mte_tags(kvm, fault->pfn, fault->vma_pagesize);
 
 	/*
 	 * Under the premise of getting a FSC_PERM fault, we just need to relax
-	 * permissions only if fault->vma_pagesize equals fault->fault_granule. Otherwise,
+	 * permissions only if vma_pagesize equals perm_fault_granule. Otherwise,
 	 * kvm_pgtable_stage2_map() should be called to change block size.
 	 */
-	if (fault_is_perm && fault->vma_pagesize == fault->fault_granule) {
+	if (fault->vma_pagesize == perm_fault_granule) {
 		/*
 		 * Drop the SW bits in favour of those stored in the
 		 * PTE, which will be preserved.
@@ -1984,7 +1986,6 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 		.logging_active = logging_active,
 		.force_pte = logging_active,
 		.prot = KVM_PGTABLE_PROT_R,
-		.fault_granule = perm_fault ? kvm_vcpu_trap_get_perm_fault_granule(s2fd->vcpu) : 0,
 		.write_fault = write_fault,
 		.exec_fault = kvm_vcpu_trap_is_exec_fault(s2fd->vcpu),
 		.topup_memcache = !perm_fault || (logging_active && write_fault),
-- 
2.47.3


