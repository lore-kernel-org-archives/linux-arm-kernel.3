Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C4C10ED679
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 14:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BJU1JZ7TQW0NuD76p8XKRpLNxnPSL0K0I9Z/Go15OcA=; b=hz77BgekDZjhC5tESF++TOtVjx
	5u29tEdfYDawQqr2j0IKF4j1v8BouksodUfwxfz+Hy0T4+LYoUCRwqcrygzd+UkjXSiFG76Suy1Kq
	VeptNyt7rp3zGgTu9Tuyx5Zm6MvfA963rqiSWZ6Qp/fZQOkdlwy5t94K9OyNwY8RC2ysWN9BAbDsX
	BEMMLYBRxFg8TVcjJYJUzYFclWkL/pl0nMz5V2AWkDNbxPjF7QlEUqe1fYQfBI0LP3hEYnGAb4lim
	ZWfPedo8FduII+gWZWpbTrwrRCAZDhuc9HklcJJmmTxmtISChqQg6IAVlTT7rtSCEOIytq8D/aYbR
	76e3c/Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67kq-00000007VsA-0LT5;
	Fri, 27 Mar 2026 14:01:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67kT-00000007VaE-3hHP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 14:01:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8AF8343AD4;
	Fri, 27 Mar 2026 14:01:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3112C19423;
	Fri, 27 Mar 2026 14:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774620077;
	bh=2MbIZeVJR/NCc6Da1MC/5uUrQO3s9fEOxT3xGL4fLI8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VJkPQ1dlmixrnDW47IiGlDMwf13Lh4EAyEpNc8LIIugLvzlP7ObDeAA2qAY5idhQu
	 WMIHJ6QaXJ1+Orsadz5iW6UMP7x60XiCjVi7UOE+hvaQZkQlEbdHfSU3VOKhuaz0Ek
	 3P5P53IFZ9643z57YmL5twj1aCTW6uBrk2XaaZsCfS5bkG+weD55VynM8WwysYvHaH
	 iupKKYfuSaIMsNY6XjpnA2hQPYd6yLqhGjzaqKkW8CvQcL0LVPuNdoZbDctUGd33tw
	 NP7IvT70PGiz6EUcpqhTfwmfJTKOE2njDi1TFAKm9/tC6MzcTE3cHhAu8STX0LlwCv
	 Ip63QzM7OWE1g==
From: Will Deacon <will@kernel.org>
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: [PATCH v4 08/38] KVM: arm64: Ignore MMU notifier callbacks for protected VMs
Date: Fri, 27 Mar 2026 14:00:07 +0000
Message-ID: <20260327140039.21228-9-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327140039.21228-1-will@kernel.org>
References: <20260327140039.21228-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_070117_966956_067EDC1E 
X-CRM114-Status: GOOD (  11.88  )
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

In preparation for supporting the donation of pinned pages to protected
VMs, return early from the MMU notifiers when called for a protected VM,
as the necessary hypercalls are exposed only for non-protected guests.

Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>
Tested-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/mmu.c  |  9 ++++++---
 arch/arm64/kvm/pkvm.c | 19 ++++++++++++++++++-
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 17d64a1e11e5..5e7821fe0fc4 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -340,6 +340,9 @@ static void __unmap_stage2_range(struct kvm_s2_mmu *mmu, phys_addr_t start, u64
 void kvm_stage2_unmap_range(struct kvm_s2_mmu *mmu, phys_addr_t start,
 			    u64 size, bool may_block)
 {
+	if (kvm_vm_is_protected(kvm_s2_mmu_to_kvm(mmu)))
+		return;
+
 	__unmap_stage2_range(mmu, start, size, may_block);
 }
 
@@ -2223,7 +2226,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 
 bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
 {
-	if (!kvm->arch.mmu.pgt)
+	if (!kvm->arch.mmu.pgt || kvm_vm_is_protected(kvm))
 		return false;
 
 	__unmap_stage2_range(&kvm->arch.mmu, range->start << PAGE_SHIFT,
@@ -2238,7 +2241,7 @@ bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 {
 	u64 size = (range->end - range->start) << PAGE_SHIFT;
 
-	if (!kvm->arch.mmu.pgt)
+	if (!kvm->arch.mmu.pgt || kvm_vm_is_protected(kvm))
 		return false;
 
 	return KVM_PGT_FN(kvm_pgtable_stage2_test_clear_young)(kvm->arch.mmu.pgt,
@@ -2254,7 +2257,7 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 {
 	u64 size = (range->end - range->start) << PAGE_SHIFT;
 
-	if (!kvm->arch.mmu.pgt)
+	if (!kvm->arch.mmu.pgt || kvm_vm_is_protected(kvm))
 		return false;
 
 	return KVM_PGT_FN(kvm_pgtable_stage2_test_clear_young)(kvm->arch.mmu.pgt,
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 42f6e50825ac..20d50abb3b94 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -407,7 +407,12 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
 
 int pkvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size)
 {
-	lockdep_assert_held_write(&kvm_s2_mmu_to_kvm(pgt->mmu)->mmu_lock);
+	struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
+
+	if (WARN_ON(kvm_vm_is_protected(kvm)))
+		return -EPERM;
+
+	lockdep_assert_held_write(&kvm->mmu_lock);
 
 	return __pkvm_pgtable_stage2_unshare(pgt, addr, addr + size);
 }
@@ -419,6 +424,9 @@ int pkvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size)
 	struct pkvm_mapping *mapping;
 	int ret = 0;
 
+	if (WARN_ON(kvm_vm_is_protected(kvm)))
+		return -EPERM;
+
 	lockdep_assert_held(&kvm->mmu_lock);
 	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping) {
 		ret = kvm_call_hyp_nvhe(__pkvm_host_wrprotect_guest, handle, mapping->gfn,
@@ -450,6 +458,9 @@ bool pkvm_pgtable_stage2_test_clear_young(struct kvm_pgtable *pgt, u64 addr, u64
 	struct pkvm_mapping *mapping;
 	bool young = false;
 
+	if (WARN_ON(kvm_vm_is_protected(kvm)))
+		return -EPERM;
+
 	lockdep_assert_held(&kvm->mmu_lock);
 	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping)
 		young |= kvm_call_hyp_nvhe(__pkvm_host_test_clear_young_guest, handle, mapping->gfn,
@@ -461,12 +472,18 @@ bool pkvm_pgtable_stage2_test_clear_young(struct kvm_pgtable *pgt, u64 addr, u64
 int pkvm_pgtable_stage2_relax_perms(struct kvm_pgtable *pgt, u64 addr, enum kvm_pgtable_prot prot,
 				    enum kvm_pgtable_walk_flags flags)
 {
+	if (WARN_ON(kvm_vm_is_protected(kvm_s2_mmu_to_kvm(pgt->mmu))))
+		return -EPERM;
+
 	return kvm_call_hyp_nvhe(__pkvm_host_relax_perms_guest, addr >> PAGE_SHIFT, prot);
 }
 
 void pkvm_pgtable_stage2_mkyoung(struct kvm_pgtable *pgt, u64 addr,
 				 enum kvm_pgtable_walk_flags flags)
 {
+	if (WARN_ON(kvm_vm_is_protected(kvm_s2_mmu_to_kvm(pgt->mmu))))
+		return;
+
 	WARN_ON(kvm_call_hyp_nvhe(__pkvm_host_mkyoung_guest, addr >> PAGE_SHIFT));
 }
 
-- 
2.53.0.1018.g2bb0e51243-goog


