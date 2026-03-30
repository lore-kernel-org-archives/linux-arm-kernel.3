Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB68AFB3CF5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 10:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E1489o1/A9KpYcy261N3TnCjiN18OuERlFy8R1Fl5Lg=; b=UetNlZ6siUBU+B5wQSm6qKwl3J
	Tyf25JssOk4LaOd5B8BzPbSIfyDx/460QAaicxR/I17M+UK3bXWK8iiKVD8h33DGD2QPluZf3ReJx
	vNk9POzSPiLR3Rp0DM0ysq68xEPAnNcGAsViQblRTF+gwbs15BzUtXKbe0F0b2ext/Y79At+tLU6E
	Lu1UAJA+aOxP6/uPE+2x7wRMIv0uJklW0rUBh9naXhDKx+aBoSGdOJFvivO6W+VmveuGZl6U92YO+
	WHiUaCj7vYDxL23vVjbzDEcYjy+UklXV7hfmRFmsYv8r6/mdTlCu8x81/quWX0zrnF2Ibb94m6Ft2
	/XV2s4cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79XB-0000000B1Ll-3sEQ;
	Mon, 30 Mar 2026 10:07:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79XA-0000000B1L5-3Kwa
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 30 Mar 2026 10:07:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=E1489o1/A9KpYcy261N3TnCjiN18OuERlFy8R1Fl5Lg=; b=oUMVFPCOQii+W2MVTOoxeefKoz
	L52Wtsqh3UZyaQUo3sHUhaojOKXK5JNCOpAbLD6CAM+fMj+fbya8kRXZcmvWkigR6pyGutzLxQ20n
	M0n76jGDA0HPslIIPcKpdBUhMeT+uwZAFnYFhQHxmlDou0Jv5WvnTXEsTss+wiWRGIPSOX0l+V+0e
	Uxco3TcP1VVh5WzmlblmLQJevqit7U+Z9redNRwgdQp8DEgK3blmcy0W4fcxhb5Gr80xHqieYZ0sj
	9aqzh7CR9lTiS8f4b+XZC/pcEgilaJmd50IAaCAmC0o+apL+J/w5Q8rPIF/mUNZQ78b7+F3qM40As
	SCS6jlDA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79X7-0000000DWGX-0wFn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 10:07:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B266A1BF3;
	Mon, 30 Mar 2026 03:07:36 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E77803F915;
	Mon, 30 Mar 2026 03:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774865262; bh=Vb9xxtHsTHwRbzD7GU8OESZOKbk4eyUOZTuHVncJqrw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f/3+x1/2VERKOhutWBXZBELrTUAbk7W/MrKR6o8yuXOk1TMKjLgjirYbc08fs+Zbu
	 DvVg3CpQ4Henpk4kT7JVgqTOQk7BVnW9IdOaY596wWkD1qUYgZPvEUkdEkI8PuWhyM
	 hpNiKCxVjYDxUYh9/bvpDXEflvOGQ5RDWYdv4fmg=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH 4/4] KVM: arm64: nv: Create nested IPA direct map to speed up reverse map removal
Date: Mon, 30 Mar 2026 11:06:33 +0100
Message-ID: <20260330100633.2817076-5-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330100633.2817076-1-weilin.chang@arm.com>
References: <20260330100633.2817076-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_110745_770100_793BE63F 
X-CRM114-Status: GOOD (  25.48  )
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

Iterating through the whole reverse map to find which entries to remove
when handling guest hypervisor TLBIs is not efficient. Create a direct
map that goes from nested IPA to canonical IPA so that the canonical
IPA range affected by the TLBI can be quickly determined, then remove
the entries in the reverse map accordingly.

Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
---
 arch/arm64/include/asm/kvm_host.h |   3 +
 arch/arm64/kvm/mmu.c              |   2 +
 arch/arm64/kvm/nested.c           | 131 ++++++++++++++++++++----------
 3 files changed, 95 insertions(+), 41 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 06f83bb7ff1d..6b0858805530 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -220,6 +220,9 @@ struct kvm_s2_mmu {
 	/* canonical IPA to nested IPA range lookup, protected by kvm.mmu_lock */
 	struct maple_tree nested_revmap_mt;
 
+	/* nested IPA to canonical IPA range lookup, protected by kvm.mmu_lock */
+	struct maple_tree nested_direct_mt;
+
 #ifdef CONFIG_PTDUMP_STAGE2_DEBUGFS
 	struct dentry *shadow_pt_debugfs_dentry;
 #endif
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 2b413d3dc790..9f27a9669ec9 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1010,6 +1010,7 @@ int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu, unsigned long t
 		kvm_init_nested_s2_mmu(mmu);
 
 	mt_init(&mmu->nested_revmap_mt);
+	mt_init(&mmu->nested_direct_mt);
 
 	return 0;
 
@@ -1112,6 +1113,7 @@ void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu)
 	mtree_destroy(&mmu->nested_revmap_mt);
 
 	if (kvm_is_nested_s2_mmu(kvm, mmu)) {
+		mtree_destroy(&mmu->nested_direct_mt);
 		kvm_init_nested_s2_mmu(mmu);
 	}
 
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 125fa21ca2e7..4c96130abf82 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -45,13 +45,12 @@ struct vncr_tlb {
 #define S2_MMU_PER_VCPU		2
 
 /*
- * Per shadow S2 reverse map (IPA -> nested IPA range) maple tree payload
- * layout:
+ * Per shadow S2 reverse & direct map maple tree payload layout:
  *
- * bits 55-12: nested IPA bits 55-12
- * bit 0: polluted, 1 for polluted, 0 for not
+ * bits 55-12: {nested, canonical} IPA bits 55-12
+ * bit 0: polluted, 1 for polluted, 0 for not, only used in reverse map
  */
-#define NESTED_IPA_MASK		GENMASK_ULL(55, 12)
+#define ADDR_MASK		GENMASK_ULL(55, 12)
 #define UNKNOWN_IPA		BIT(0)
 
 void kvm_init_nested(struct kvm *kvm)
@@ -915,74 +914,118 @@ static int record_accel(struct kvm_s2_mmu *mmu, gpa_t gpa,
 void kvm_remove_nested_revmap(struct kvm_s2_mmu *mmu, u64 addr, u64 size)
 {
 	/*
-	 * Iterate through the mt of this mmu, remove all unpolluted canonical
-	 * ipa ranges that maps to ranges that are strictly within
-	 * [addr, addr + size).
+	 * For all ranges in direct_mt that are completely covered by the range
+	 * we are TLBIing [addr, addr + size), we remove the reverse map AND
+	 * its corresponding direct map together, when these conditions are
+	 * met:
+	 *
+	 * 1. The TLBI range completely covers the stored nested IPA range.
+	 * 2. The reverse map is not polluted. This ensures the reverse map
+	 *    and the direct map are 1:1.
 	 */
-	struct maple_tree *mt = &mmu->nested_revmap_mt;
-	void *entry;
-	u64 nested_ipa, nested_ipa_end, addr_end = addr + size;
-	size_t revmap_size;
+	struct maple_tree *direct_mt = &mmu->nested_direct_mt;
+	struct maple_tree *revmap_mt = &mmu->nested_revmap_mt;
+	gpa_t nested_ipa_start = addr;
+	gpa_t nested_ipa_end = addr + size - 1;
+	u64 entry_ipa, entry_nested_ipa;
+	u64 ipa, ipa_end;
 
-	MA_STATE(mas, mt, 0, ULONG_MAX);
+	MA_STATE(mas_nested_ipa, direct_mt, nested_ipa_start, nested_ipa_end);
+	entry_ipa = (u64)mas_find_range(&mas_nested_ipa, nested_ipa_end);
 
-	mas_for_each(&mas, entry, ULONG_MAX) {
-		if ((u64)entry & UNKNOWN_IPA)
-			continue;
+	while (entry_ipa && mas_nested_ipa.index <= nested_ipa_end) {
+		ipa = entry_ipa & ADDR_MASK;
+		ipa_end = ipa + mas_nested_ipa.last - mas_nested_ipa.index;
 
-		revmap_size = mas.last - mas.index + 1;
-		nested_ipa = (u64)entry & NESTED_IPA_MASK;
-		nested_ipa_end = nested_ipa + revmap_size;
+		/* Use ipa range to find the corresponding entry in revmap. */
+		MA_STATE(mas_ipa, revmap_mt, ipa, ipa_end);
+		entry_nested_ipa = (u64)mas_find_range(&mas_ipa, ipa_end);
 
-		if (nested_ipa >= addr && nested_ipa_end <= addr_end) {
-			accel_clear_mmu_range(mmu, mas.index, revmap_size);
-			mas_erase(&mas);
+		/*
+		 * Reverse and direct map are created together at s2 faults,
+		 * thus every direct map range should also have a corresponding
+		 * reverse map range, however that can be polluted.
+		 */
+		BUG_ON(!entry_nested_ipa);
+
+		/* The two conditions outlined above. */
+		if (!(entry_nested_ipa & UNKNOWN_IPA) &&
+		    mas_nested_ipa.index >= addr &&
+		    mas_nested_ipa.last <= nested_ipa_end) {
+			/*
+			 * If the reverse map isn't polluted, the direct and
+			 * reverse map are expected to be 1:1, thus they must
+			 * have the same size.
+			 */
+			BUG_ON(mas_ipa.last - mas_ipa.index !=
+			       mas_nested_ipa.last - mas_nested_ipa.index);
+
+			accel_clear_mmu_range(mmu, mas_ipa.index,
+					      mas_ipa.last - mas_ipa.index + 1);
+			mas_erase(&mas_ipa);
+			mas_erase(&mas_nested_ipa);
 		}
+		entry_ipa = (u64)mas_find_range(&mas_nested_ipa, nested_ipa_end);
 	}
 }
 
 int kvm_record_nested_revmap(gpa_t ipa, struct kvm_s2_mmu *mmu,
 			     gpa_t fault_ipa, size_t map_size)
 {
-	struct maple_tree *mt = &mmu->nested_revmap_mt;
-	gpa_t start = ipa;
-	gpa_t end = ipa + map_size - 1;
+	struct maple_tree *direct_mt = &mmu->nested_direct_mt;
+	struct maple_tree *revmap_mt = &mmu->nested_revmap_mt;
+	gpa_t ipa_start = ipa;
+	gpa_t ipa_end = ipa + map_size - 1;
+	gpa_t fault_ipa_end = fault_ipa + map_size - 1;
 	u64 entry, new_entry = 0;
 	int r = 0;
 
 	lockdep_assert_held_write(kvm_s2_mmu_to_kvm(mmu)->mmu_lock);
 
-	MA_STATE(mas, mt, start, end);
+	MA_STATE(mas_ipa, revmap_mt, ipa_start, ipa_end);
+	MA_STATE(mas_nested_ipa, direct_mt, fault_ipa, fault_ipa_end);
 
 	r = record_accel(mmu, ipa, map_size);
 	if (r)
 		goto out;
 
-	entry = (u64)mas_find_range(&mas, end);
+	r = mas_store_gfp(&mas_nested_ipa, (void *)ipa, GFP_KERNEL_ACCOUNT);
+	/*
+	 * In the case of direct map store failure, don't clean up
+	 * record_accel()'s successfully installed accel mt entry. Keeping
+	 * it is fine as it will just cause us to check a few more s2 mmus
+	 * in the mmu notifier.
+	 */
+	if (r)
+		goto out;
+
+	entry = (u64)mas_find_range(&mas_ipa, ipa_end);
 
 	if (entry) {
 		/* maybe just a perm update... */
-		if (!(entry & UNKNOWN_IPA) && mas.index == start &&
-		    mas.last == end &&
-		    fault_ipa == (entry & NESTED_IPA_MASK))
+		if (!(entry & UNKNOWN_IPA) && mas_ipa.index == ipa_start &&
+		    mas_ipa.last == ipa_end &&
+		    fault_ipa == (entry & ADDR_MASK))
 			goto out;
 		/*
 		 * Remove every overlapping range, then create a "polluted"
 		 * range that spans all these ranges and store it.
 		 */
-		while (entry && mas.index <= end) {
-			start = min(mas.index, start);
-			end = max(mas.last, end);
-			mas_erase(&mas);
-			entry = (u64)mas_find_range(&mas, end);
+		while (entry && mas_ipa.index <= ipa_end) {
+			ipa_start = min(mas_ipa.index, ipa_start);
+			ipa_end = max(mas_ipa.last, ipa_end);
+			mas_erase(&mas_ipa);
+			entry = (u64)mas_find_range(&mas_ipa, ipa_end);
 		}
 		new_entry |= UNKNOWN_IPA;
 	} else {
 		new_entry |= fault_ipa;
 	}
 
-	mas_set_range(&mas, start, end);
-	r = mas_store_gfp(&mas, (void *)new_entry, GFP_KERNEL_ACCOUNT);
+	mas_set_range(&mas_ipa, ipa_start, ipa_end);
+	r = mas_store_gfp(&mas_ipa, (void *)new_entry, GFP_KERNEL_ACCOUNT);
+	if (r)
+		mas_erase(&mas_nested_ipa);
 out:
 	return r;
 }
@@ -1371,13 +1414,14 @@ void kvm_nested_s2_wp(struct kvm *kvm)
 static void unmap_mmu_ipa_range(struct kvm_s2_mmu *mmu, gpa_t gpa,
 				  size_t unmap_size, bool may_block)
 {
-	struct maple_tree *mt = &mmu->nested_revmap_mt;
+	struct maple_tree *direct_mt = &mmu->nested_direct_mt;
+	struct maple_tree *revmap_mt = &mmu->nested_revmap_mt;
 	gpa_t start = gpa;
 	gpa_t end = gpa + unmap_size - 1;
 	u64 entry;
 	size_t entry_size;
 
-	MA_STATE(mas, mt, gpa, end);
+	MA_STATE(mas, revmap_mt, gpa, end);
 	entry = (u64)mas_find_range(&mas, end);
 
 	while (entry && mas.index <= end) {
@@ -1388,15 +1432,18 @@ static void unmap_mmu_ipa_range(struct kvm_s2_mmu *mmu, gpa_t gpa,
 		 * touches any polluted range.
 		 */
 		if (entry & UNKNOWN_IPA) {
-			mtree_destroy(mt);
+			mtree_destroy(direct_mt);
+			mtree_destroy(revmap_mt);
 			accel_clear_mmu(mmu);
 			kvm_stage2_unmap_range(mmu, 0, kvm_phys_size(mmu),
 					       may_block);
 			return;
 		}
+		/* not polluted, direct map and reverse map must be 1:1 */
+		mtree_erase(direct_mt, entry & ADDR_MASK);
 		mas_erase(&mas);
 		accel_clear_mmu_range(mmu, mas.index, entry_size);
-		kvm_stage2_unmap_range(mmu, entry & NESTED_IPA_MASK, entry_size,
+		kvm_stage2_unmap_range(mmu, entry & ADDR_MASK, entry_size,
 				       may_block);
 		/*
 		 * Other maple tree operations during preemption could render
@@ -1447,6 +1494,7 @@ void kvm_nested_s2_unmap(struct kvm *kvm, bool may_block)
 		struct kvm_s2_mmu *mmu = &kvm->arch.nested_mmus[i];
 
 		if (kvm_s2_mmu_valid(mmu)) {
+			mtree_destroy(&mmu->nested_direct_mt);
 			mtree_destroy(&mmu->nested_revmap_mt);
 			kvm_stage2_unmap_range(mmu, 0, kvm_phys_size(mmu), may_block);
 		}
@@ -2135,6 +2183,7 @@ void check_nested_vcpu_requests(struct kvm_vcpu *vcpu)
 
 		write_lock(&vcpu->kvm->mmu_lock);
 		if (mmu->pending_unmap) {
+			mtree_destroy(&mmu->nested_direct_mt);
 			mtree_destroy(&mmu->nested_revmap_mt);
 			accel_clear_mmu(mmu);
 			kvm_stage2_unmap_range(mmu, 0, kvm_phys_size(mmu), true);
-- 
2.43.0


