Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E07F10ED660
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 11:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z7qUpR3oB/vGv4HeT5ezrJtrg4/SU86Zmx35J29xx90=; b=ffr7d0WTgWWJMB1VI6KcmtotUm
	KkZV2Z/pj0T6Iv6B4BLGDaQ6hf+Jgm05b2veNZpZQZukrKMlnJs6tTkYb8QgatvCvNuB8LjDvqKji
	INKaFp6y+O9imo+W3mBTSvTy64sY0pzSMr4OqCauRUFL2zrB+rB4r1IOxJlHs2MICLVxJsjmfBP8l
	1P88Eat6qAAN4PNqH47AKiIXCEXCIjLJXhbCQ31Z7D+2CHKsEkcU4MKDgJ71x3v8SxN1ApuQhh+Nx
	CGmg3lxSYYK7vD6kNEiJGDudkSMVWpSOGBn9fIbCncyHYk0y/L1A77bO52wzIJEr7JvSOnHDsbjc7
	vBZk9zow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65Ud-00000007FHf-0tvN;
	Fri, 27 Mar 2026 11:36:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65UI-00000007F1W-2q65
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 11:36:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0ED8C61892;
	Fri, 27 Mar 2026 11:36:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95B34C2BCB0;
	Fri, 27 Mar 2026 11:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774611385;
	bh=yn5033REN0yCBJzRSmpPHDS7s9auoOCEIoTxQv/2SvY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vI9/BBEHzC6bqVW6N8OebFs2Gg4ezq/dHUBoGui+YuGNq7PmwAZLiUhniqEUkMGPc
	 8gl4AF05Hg+2gg/nebiMjMoJMCVNsh5//JzEZPHV7CNaClLIvrcUz1IeaQHsm1T1vt
	 FZO0+ZzETc2uAuqd1b+63ZmZ2PrWCa2+Q+FhrdkWtYy9AeFFkvzvXDRcocBsY4Vu6n
	 yqqy5+vLqWxrIQ+SjJwJXK4uXMEu6H+QlHcUvnkF5R53hgo05xSEgV0daCkdEbq5t/
	 KdtX96+IeyzDQu03vGZbZRl1rFGQ8ffQl+NGSorvmf89rKR4w1PWUWp9HUQSSLmWH5
	 2VMC0GsVhhhzA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w65UF-00000006K4a-2Ddr;
	Fri, 27 Mar 2026 11:36:23 +0000
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
Subject: [PATCH v2 06/30] KVM: arm64: Extract page table mapping in user_mem_abort()
Date: Fri, 27 Mar 2026 11:35:54 +0000
Message-ID: <20260327113618.4051534-7-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327113618.4051534-1-maz@kernel.org>
References: <20260327113618.4051534-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, tabba@google.com, will@kernel.org, qperret@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

From: Fuad Tabba <tabba@google.com>

Extract the code responsible for locking the KVM MMU and mapping the PFN
into the stage-2 page tables into a new helper, kvm_s2_fault_map().

This helper manages the kvm_fault_lock, checks for MMU invalidation
retries, attempts to adjust for transparent huge pages (THP), handles
MTE sanitization if needed, and finally maps or relaxes permissions on
the stage-2 entries.

With this change, the main user_mem_abort() function is now a sequential
dispatcher that delegates to specialized helper functions.

Signed-off-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/mmu.c | 128 +++++++++++++++++++++++--------------------
 1 file changed, 68 insertions(+), 60 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index d1ffdce18631a..164f1160ea33d 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1892,68 +1892,13 @@ static int kvm_s2_fault_compute_prot(struct kvm_s2_fault *fault)
 	return 0;
 }
 
-static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
-			  struct kvm_s2_trans *nested,
-			  struct kvm_memory_slot *memslot, unsigned long hva,
-			  bool fault_is_perm)
+static int kvm_s2_fault_map(struct kvm_s2_fault *fault, void *memcache)
 {
-	int ret = 0;
-	struct kvm_s2_fault fault_data = {
-		.vcpu = vcpu,
-		.fault_ipa = fault_ipa,
-		.nested = nested,
-		.memslot = memslot,
-		.hva = hva,
-		.fault_is_perm = fault_is_perm,
-		.ipa = fault_ipa,
-		.logging_active = memslot_is_logging(memslot),
-		.force_pte = memslot_is_logging(memslot),
-		.s2_force_noncacheable = false,
-		.vfio_allow_any_uc = false,
-		.prot = KVM_PGTABLE_PROT_R,
-	};
-	struct kvm_s2_fault *fault = &fault_data;
-	struct kvm *kvm = vcpu->kvm;
-	void *memcache;
+	struct kvm *kvm = fault->vcpu->kvm;
 	struct kvm_pgtable *pgt;
+	int ret;
 	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_SHARED;
 
-	if (fault->fault_is_perm)
-		fault->fault_granule = kvm_vcpu_trap_get_perm_fault_granule(fault->vcpu);
-	fault->write_fault = kvm_is_write_fault(fault->vcpu);
-	fault->exec_fault = kvm_vcpu_trap_is_exec_fault(fault->vcpu);
-	VM_WARN_ON_ONCE(fault->write_fault && fault->exec_fault);
-
-	/*
-	 * Permission faults just need to update the existing leaf entry,
-	 * and so normally don't require allocations from the memcache. The
-	 * only exception to this is when dirty logging is enabled at runtime
-	 * and a write fault needs to collapse a block entry into a table.
-	 */
-	fault->topup_memcache = !fault->fault_is_perm ||
-				(fault->logging_active && fault->write_fault);
-	ret = prepare_mmu_memcache(fault->vcpu, fault->topup_memcache, &memcache);
-	if (ret)
-		return ret;
-
-	/*
-	 * Let's check if we will get back a huge page backed by hugetlbfs, or
-	 * get block mapping for device MMIO region.
-	 */
-	ret = kvm_s2_fault_pin_pfn(fault);
-	if (ret != 1)
-		return ret;
-
-	ret = 0;
-
-	ret = kvm_s2_fault_compute_prot(fault);
-	if (ret == 1) {
-		ret = 1; /* fault injected */
-		goto out_put_page;
-	}
-	if (ret)
-		goto out_put_page;
-
 	kvm_fault_lock(kvm);
 	pgt = fault->vcpu->arch.hw_mmu->pgt;
 	if (mmu_invalidate_retry(kvm, fault->mmu_seq)) {
@@ -2001,8 +1946,8 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 		 * PTE, which will be preserved.
 		 */
 		fault->prot &= ~KVM_NV_GUEST_MAP_SZ;
-		ret = KVM_PGT_FN(kvm_pgtable_stage2_relax_perms)(pgt, fault->fault_ipa, fault->prot,
-								 flags);
+		ret = KVM_PGT_FN(kvm_pgtable_stage2_relax_perms)(pgt, fault->fault_ipa,
+								 fault->prot, flags);
 	} else {
 		ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, fault->fault_ipa, fault->vma_pagesize,
 							 __pfn_to_phys(fault->pfn), fault->prot,
@@ -2018,6 +1963,69 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 		mark_page_dirty_in_slot(kvm, fault->memslot, fault->gfn);
 
 	return ret != -EAGAIN ? ret : 0;
+}
+
+static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
+			  struct kvm_s2_trans *nested,
+			  struct kvm_memory_slot *memslot, unsigned long hva,
+			  bool fault_is_perm)
+{
+	int ret = 0;
+	struct kvm_s2_fault fault_data = {
+		.vcpu = vcpu,
+		.fault_ipa = fault_ipa,
+		.nested = nested,
+		.memslot = memslot,
+		.hva = hva,
+		.fault_is_perm = fault_is_perm,
+		.ipa = fault_ipa,
+		.logging_active = memslot_is_logging(memslot),
+		.force_pte = memslot_is_logging(memslot),
+		.s2_force_noncacheable = false,
+		.vfio_allow_any_uc = false,
+		.prot = KVM_PGTABLE_PROT_R,
+	};
+	struct kvm_s2_fault *fault = &fault_data;
+	void *memcache;
+
+	if (fault->fault_is_perm)
+		fault->fault_granule = kvm_vcpu_trap_get_perm_fault_granule(fault->vcpu);
+	fault->write_fault = kvm_is_write_fault(fault->vcpu);
+	fault->exec_fault = kvm_vcpu_trap_is_exec_fault(fault->vcpu);
+	VM_WARN_ON_ONCE(fault->write_fault && fault->exec_fault);
+
+	/*
+	 * Permission faults just need to update the existing leaf entry,
+	 * and so normally don't require allocations from the memcache. The
+	 * only exception to this is when dirty logging is enabled at runtime
+	 * and a write fault needs to collapse a block entry into a table.
+	 */
+	fault->topup_memcache = !fault->fault_is_perm ||
+				(fault->logging_active && fault->write_fault);
+	ret = prepare_mmu_memcache(fault->vcpu, fault->topup_memcache, &memcache);
+	if (ret)
+		return ret;
+
+	/*
+	 * Let's check if we will get back a huge page backed by hugetlbfs, or
+	 * get block mapping for device MMIO region.
+	 */
+	ret = kvm_s2_fault_pin_pfn(fault);
+	if (ret != 1)
+		return ret;
+
+	ret = 0;
+
+	ret = kvm_s2_fault_compute_prot(fault);
+	if (ret == 1) {
+		ret = 1; /* fault injected */
+		goto out_put_page;
+	}
+	if (ret)
+		goto out_put_page;
+
+	ret = kvm_s2_fault_map(fault, memcache);
+	return ret;
 
 out_put_page:
 	kvm_release_page_unused(fault->page);
-- 
2.47.3


