Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7852C88E7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gHhsIo22ETIhEZvj5QqVcye86SSzXxA6PA3AX4jS5yo=; b=Hn4Fe2MM4S/UpHUgMOXn04vg4N
	J2hQWyAJ5VNSXeRNTDymKPQrRuXmgs3Gzo1uXpZFc9J2VUZrEc8Nz2pN+r3JDkjs9dG4eeT+Zaf+R
	HjxjQG/tWQlUK5DHGu04G7nzAY0ndOdlA2tw2aYE1ymOiv5ZtFdR6Lan7BUlpYtH+wLzxRtZUbkCJ
	b3L9JPMg6s7yZr+Vm0FFVhl9HHdDeLCGrYqVHV2pKodJ9OivLxFhm8wk+WiQmal/oJrAAoaW1Zcqh
	skzRyoa7s+5dBISNOnNjUrgJ34oZm/hJVvB/j3kUs6oJI1uzSu8LQbEkhrJFL/81X4nXb2AMhTvte
	QZclD10A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VKA-00000007Gft-2ZMO;
	Tue, 15 Sep 2026 15:43:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VJt-00000007GWD-16xT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 15:43:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8DBCC15A1;
	Tue, 15 Sep 2026 08:43:36 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8F0083F882;
	Tue, 15 Sep 2026 08:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789487020; bh=BxubJhJnwe6/0bJ2MGHy009TjXa9UajkeWAN2/J4vkI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LQUq6r98ixMf6dnQmOincG/BdRjm+KsxyMA2DkfvrVw5uLeyLHr6+81sZJFx/TUgv
	 sJ3P9BcBXG+ZvS4UI1RRdrxP6gF9hNxmLtOOyDBXg7OoxL0aqMKlosbO0+jgaEYosv
	 k6uCESPCOgMRKBReS5d6dWHnmKQJQrMyEkK9QlXI=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Itaru Kitayama <itaru.kitayama@fujitsu.com>,
	Wang Han <wanghan@linux.alibaba.com>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH v6 6/7] KVM: arm64: nv: Drop kvm_s2_mmu pointer from kvm_guest_s2_mapping
Date: Tue, 15 Sep 2026 16:43:04 +0100
Message-ID: <20260915154305.3852871-7-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915154305.3852871-1-weilin.chang@arm.com>
References: <20260915154305.3852871-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_084341_387998_187526B5 
X-CRM114-Status: GOOD (  23.35  )
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

From: Marc Zyngier <maz@kernel.org>

As it appears that the kvm_guest_s2_mapping structure is quite large,
and results in a 128 byte slab allocation, there is some incentive
to shrink a bit.

For this, replace the S2 MMU back-pointer with an index tucked into
the low bits of the nested.start field. This allows us to shrink
the structure by 8 bytes, and therefore to fit in a 96 byte slab.

The index is also stored in the S2 MMU structure itself, which
comes for free as it fits in an existing hole. The structure is
also repacked to avoid other disgracious holes.

Signed-off-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
---
 arch/arm64/include/asm/kvm_host.h | 19 ++++++-----
 arch/arm64/kvm/nested.c           | 54 ++++++++++++++++++++++++-------
 2 files changed, 54 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index f12883a42081..8dfaa33c6cd5 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -153,12 +153,12 @@ struct kvm_vmid {
 
 /*
  * Record of a guest stage-2 mapping, storing canonical and nested IPA
- * ranges. Both ranges have the same size.
+ * ranges. Both ranges have the same size. The lower bits of nested.start
+ * store the index of the nested mmu this mapping belongs to.
  */
 struct kvm_guest_s2_mapping {
 	struct interval_tree_node canonical;
 	struct interval_tree_node nested;
-	struct kvm_s2_mmu *nested_mmu;
 };
 
 struct kvm_s2_mmu {
@@ -222,30 +222,33 @@ struct kvm_s2_mmu {
 	u64	tlb_vttbr;
 	u64	tlb_vtcr;
 
+	/* Guest s2 mapping records indexed in this MMU's IPA space. */
+	struct rb_root_cached guest_s2_mappings;
+
 	/*
 	 * true when this represents a nested context where virtual
 	 * HCR_EL2.VM == 1
 	 */
 	bool	nested_stage2_enabled;
 
-#ifdef CONFIG_PTDUMP_STAGE2_DEBUGFS
-	struct dentry *shadow_pt_debugfs_dentry;
-#endif
-
 	/*
 	 * true when this MMU needs to be unmapped before being used for a new
 	 * purpose.
 	 */
 	bool	pending_unmap;
 
-	/* Guest s2 mapping records indexed in this MMU's IPA space. */
-	struct rb_root_cached guest_s2_mappings;
+	/* Index in the S2 MMU array, only valid for a shadow S2 */
+	u16	s2_mmu_idx;
 
 	/*
 	 *  0: Nobody is currently using this, check vttbr for validity
 	 * >0: Somebody is actively using this.
 	 */
 	atomic_t refcnt;
+
+#ifdef CONFIG_PTDUMP_STAGE2_DEBUGFS
+	struct dentry *shadow_pt_debugfs_dentry;
+#endif
 };
 
 struct kvm_arch_memory_slot {
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 4cbb4f1b8b35..61d4dae6be6a 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -45,11 +45,12 @@ struct vncr_tlb {
  * will invalidate them more often).
  */
 #define S2_MMU_PER_VCPU		2
+#define S2_MMU_PER_VM		(KVM_MAX_VCPUS * S2_MMU_PER_VCPU)
 
 int kvm_init_nested(struct kvm *kvm)
 {
 	kvm->arch.nested_mmus = kvmalloc_objs(struct kvm_s2_mmu *,
-					      KVM_MAX_VCPUS * S2_MMU_PER_VCPU,
+					      S2_MMU_PER_VM,
 					      GFP_KERNEL_ACCOUNT);
 	kvm->arch.nested_mmus_size = 0;
 	atomic_set(&kvm->arch.vncr_tlb_count, 0);
@@ -128,8 +129,10 @@ int kvm_vcpu_init_nested(struct kvm_vcpu *vcpu)
 
 		guard(write_lock)(&kvm->mmu_lock);
 
-		for (i = 0; i < S2_MMU_PER_VCPU; i++)
+		for (i = 0; i < S2_MMU_PER_VCPU; i++) {
+			tmp[i].s2_mmu_idx = i + kvm->arch.nested_mmus_size;
 			kvm->arch.nested_mmus[i + kvm->arch.nested_mmus_size] = &tmp[i];
+		}
 
 		kvm->arch.nested_mmus_size += S2_MMU_PER_VCPU;
 	}
@@ -873,6 +876,27 @@ static struct kvm_s2_mmu *get_s2_mmu_nested(struct kvm_vcpu *vcpu)
 	return s2_mmu;
 }
 
+#define S2_MMU_IDX_MASK	GENMASK_ULL(11, 0)
+
+static void tag_s2_mapping_mmu(struct kvm_guest_s2_mapping *mapping,
+			       struct kvm_s2_mmu *mmu)
+{
+	BUILD_BUG_ON(S2_MMU_PER_VM > SZ_4K);
+	mapping->nested.start &= ~S2_MMU_IDX_MASK;
+	mapping->nested.start |= mmu->s2_mmu_idx;
+}
+
+static struct kvm_s2_mmu *s2_mapping_to_mmu(struct kvm *kvm,
+					    struct kvm_guest_s2_mapping *mapping)
+{
+	return kvm->arch.nested_mmus[mapping->nested.start & S2_MMU_IDX_MASK];
+}
+
+static unsigned long s2_mapping_to_nested_start(struct kvm_guest_s2_mapping *mapping)
+{
+	return mapping->nested.start & ~S2_MMU_IDX_MASK;
+}
+
 void kvm_record_guest_s2_mapping(struct kvm_s2_mmu *mmu, gpa_t canonical_ipa,
 				 gpa_t nested_ipa, size_t map_size,
 				 struct kvm_guest_s2_mapping *mapping)
@@ -890,7 +914,7 @@ void kvm_record_guest_s2_mapping(struct kvm_s2_mmu *mmu, gpa_t canonical_ipa,
 	mapping->nested.start    = nested_ipa;
 	mapping->nested.last     = nested_ipa + map_size - 1;
 
-	mapping->nested_mmu      = mmu;
+	tag_s2_mapping_mmu(mapping, mmu);
 
 	guard(spinlock)(&kvm->arch.guest_s2_tracking_lock);
 	interval_tree_insert(&mapping->nested, &mmu->guest_s2_mappings);
@@ -913,6 +937,8 @@ void kvm_remove_guest_s2_mappings(struct kvm_s2_mmu *mmu, gpa_t nipa,
 
 	node = interval_tree_iter_first(&mmu->guest_s2_mappings, nipa, nipa_end);
 	while (node) {
+		unsigned long nested_start;
+
 		next = interval_tree_iter_next(node, nipa, nipa_end);
 		mapping = container_of(node, struct kvm_guest_s2_mapping,
 				       nested);
@@ -920,7 +946,8 @@ void kvm_remove_guest_s2_mappings(struct kvm_s2_mmu *mmu, gpa_t nipa,
 		 * Tracking must be conservative on removal, only remove
 		 * mappings that are within the unmap range.
 		 */
-		if (nipa <= mapping->nested.start && nipa_end >= mapping->nested.last) {
+		nested_start = s2_mapping_to_nested_start(mapping);
+		if (nipa <= nested_start && nipa_end >= mapping->nested.last) {
 			interval_tree_remove(&mapping->nested, &mmu->guest_s2_mappings);
 			interval_tree_remove(&mapping->canonical,
 					     &kvm->arch.mmu.guest_s2_mappings);
@@ -1363,18 +1390,23 @@ void kvm_nested_unmap_cipa_range(struct kvm *kvm, gpa_t cipa, size_t unmap_size,
 
 	while ((node = interval_tree_iter_first(&kvm->arch.mmu.guest_s2_mappings,
 						cipa, cipa_end))) {
-		mapping = container_of(node, struct kvm_guest_s2_mapping, canonical);
-		mapping_size = mapping->nested.last - mapping->nested.start + 1;
+		unsigned long nested_start;
+		struct kvm_s2_mmu *mmu;
+
+		mapping = container_of(node, struct kvm_guest_s2_mapping,
+				       canonical);
+		nested_start = s2_mapping_to_nested_start(mapping);
+		mmu = s2_mapping_to_mmu(kvm, mapping);
 
 		/* We could race against MMU teardown, which frees mmu->pgt. */
-		if (mapping->nested_mmu->pgt) {
-			if (WARN_ON_ONCE(kvm_pgtable_stage2_unmap(mapping->nested_mmu->pgt,
-								  mapping->nested.start,
+		if (mmu->pgt) {
+			mapping_size = mapping->nested.last - nested_start + 1;
+
+			if (WARN_ON_ONCE(kvm_pgtable_stage2_unmap(mmu->pgt, nested_start,
 								  mapping_size)))
 				return;
 
-			interval_tree_remove(&mapping->nested,
-					     &mapping->nested_mmu->guest_s2_mappings);
+			interval_tree_remove(&mapping->nested, &mmu->guest_s2_mappings);
 		}
 		interval_tree_remove(node, &kvm->arch.mmu.guest_s2_mappings);
 		kfree(mapping);
-- 
2.43.0


