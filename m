Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF8F1C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 15:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=moiVjFwkTESuvisdhudXbZzKGM0Y+aQ6GppxKKCrMlg=; b=eRK/f2k+cP3H/39648Y7lOsD3+
	B50mTc7OsAL1wuxDeLlw5AlCdPlXe6xSWhhutksH6EZuUdKcJk4mlkMMvQgxdLR9ykwmj1s0hRkoW
	uqZ4fk4D6V87Jj9hwQQ4tq++XZa78ZPg4MrzOSCwTDKi1cpFr/kjtsWABcuk0bc1nfwQJkc/c+GxG
	yoXnPDc0VUXKLG5vRnmxjU8XwD/vBRr7DIj+StYucgZO7McQTumgqwO7Miq3rnGEyzQ97aC1YmjmH
	/m4EOa6eSIihUOTzQc4yUzlyhqUGdrjLHuODT2wLGMYTCJ8AnjoDQvVjC6nWmXiUNO4L9jIYnzz/o
	AFbAYvUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmqV-0000000Bdhy-0tle;
	Mon, 05 Jan 2026 15:50:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmqS-0000000Bdfj-1HNj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 15:50:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F02BE44208;
	Mon,  5 Jan 2026 15:50:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47830C116D0;
	Mon,  5 Jan 2026 15:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767628211;
	bh=avRE/22DDTZ0ogA02eYtumbOLmxw2aUxX3FpcUEiOgU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bS+rNVUVVqtzOLL/a7jLqLBwB8ZQUxnBTm8Jf2BDawX/jIcj3Yguia5QvXp+XL1mr
	 q1E7h79fdrvf3SZpyTH84B7hD91z2RIgQ+uzC99iCRGdk1qdjwhdUfEhonOwOMghhf
	 xW/0qJ3/z15XkkOd+HXRNHaehmrz4xC1fjls2AA3sH5xqtoXPqwmLl/aR9mIUTOkB0
	 D8hTCwvaZQmkYtE6ygRIcszC4w1Sbhl5KvO4netlrlZUksSnN2ZHa+CwSbdHUjRrTC
	 OtBoOC3R2Cghfvl2WSc4WQG3JLUY9h8LK3JtGgXHQWXlb0sHHoHai+jiRlyDf/6jum
	 I2Szq6h9SGzxw==
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
	Mostafa Saleh <smostafa@google.com>
Subject: [PATCH 07/30] KVM: arm64: Ignore MMU notifier callbacks for protected VMs
Date: Mon,  5 Jan 2026 15:49:15 +0000
Message-ID: <20260105154939.11041-8-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260105154939.11041-1-will@kernel.org>
References: <20260105154939.11041-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_075012_401132_D488112A 
X-CRM114-Status: GOOD (  12.09  )
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

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/mmu.c  | 12 ++++++++++++
 arch/arm64/kvm/pkvm.c | 19 ++++++++++++++++++-
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 5d18927f76ba..a888840497f9 100644
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
 
@@ -2208,6 +2211,9 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 
 bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
 {
+	if (kvm_vm_is_protected(kvm))
+		return false;
+
 	__unmap_stage2_range(&kvm->arch.mmu, range->start << PAGE_SHIFT,
 			     (range->end - range->start) << PAGE_SHIFT,
 			     range->may_block);
@@ -2220,6 +2226,9 @@ bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 {
 	u64 size = (range->end - range->start) << PAGE_SHIFT;
 
+	if (kvm_vm_is_protected(kvm))
+		return false;
+
 	return KVM_PGT_FN(kvm_pgtable_stage2_test_clear_young)(kvm->arch.mmu.pgt,
 						   range->start << PAGE_SHIFT,
 						   size, true);
@@ -2233,6 +2242,9 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 {
 	u64 size = (range->end - range->start) << PAGE_SHIFT;
 
+	if (kvm_vm_is_protected(kvm))
+		return false;
+
 	return KVM_PGT_FN(kvm_pgtable_stage2_test_clear_young)(kvm->arch.mmu.pgt,
 						   range->start << PAGE_SHIFT,
 						   size, false);
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
2.52.0.351.gbe84eed79e-goog


