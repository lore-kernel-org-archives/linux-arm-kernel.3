Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43970C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3sym6yGQC/EhXhyirQy4STD/Q9GCfZ0oBRXgmamGKmM=; b=1JyuX7zWALbYpqms9zxfqZ+o3C
	1BZ9bbX8XRufqZr9AV339HkUqGx9ZfdGwA7TUXCRbZ6yuFEa8KBH8iVGkOYJ4qDAku9FSHfPZuajg
	J0kWYlCq4gALJDryjwqH3VbI0dw3gHbH/E75aNN/K1EP0Xxjws9wqDqLIIHUZRy3QPKGg6Y8AHTjo
	BXRYLTqaZSUksBSDj6KynuniGBXmZDH5d2z69zBzi4b/tCgo5+0tjq9L1G2OL3IIHCQ7tjiavGXCw
	P0Wou4A5OVt83QxyB+xYyaN1JHKRDrwXhj+TIk/bmUPwoIHAa+x9HyGCm9JZK6kKLkT0cpad8qOiy
	fHvGXKrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VJs-00000007GUj-0v9K;
	Tue, 15 Sep 2026 15:43:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VJn-00000007GSV-1Mh8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 15:43:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB10A15A1;
	Tue, 15 Sep 2026 08:43:30 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BDA633F882;
	Tue, 15 Sep 2026 08:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789487014; bh=E3MnILg53mlr4G1yo77+YKy7GVbSgPTcUYGivxV5F98=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mzx1fa8pzN8/JLf9ZvF+Dm6cP90s9jDOH69MfvNPqpZetn3gnq61Lhd8D1ReXsGyV
	 6bXhGoKKlFycdpXrTdkwfezNghzLl+9rFunvqA0IbGiMAZGeJAoxAb5fArUAoaRQC3
	 zMWV2dgEj+6Yvo72y/SeVLg64X/8/R+jtSDTGpFg=
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
Subject: [PATCH v6 4/7] KVM: arm64: nv: Track guest stage-2 mapping removal
Date: Tue, 15 Sep 2026 16:43:02 +0100
Message-ID: <20260915154305.3852871-5-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915154305.3852871-1-weilin.chang@arm.com>
References: <20260915154305.3852871-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_084335_448253_0BCCF926 
X-CRM114-Status: GOOD (  20.07  )
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

kvm_stage2_unmap_range() is the helper to remove mappings from the
stage-2 page tables. It is called during guest TLBI handling, memslot
removal, nested mmu reuse, etc.

Teach it about the guest stage-2 tracking trees and remove mappings from
there when shadow mappings are removed. This keeps the tracking trees
from having stale mappings pile up.

Don't remove tracked mappings from the interval trees if they only
partially overlap the removal range. For instance we can have a 4K
shadow mapping tracked as a 2M range in the interval trees. It would be
wrong to remove the tracked 2M range when a guest TLBI doesn't touch the
4K mapped.

Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
---
 arch/arm64/include/asm/kvm_host.h   |  5 ++++-
 arch/arm64/include/asm/kvm_nested.h |  2 ++
 arch/arm64/kvm/mmu.c                | 23 +++++++++++++++++--
 arch/arm64/kvm/nested.c             | 34 +++++++++++++++++++++++++++++
 4 files changed, 61 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 365ec57d6d7a..f12883a42081 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -340,7 +340,10 @@ struct kvm_arch {
 	size_t nested_mmus_size;
 	int nested_mmus_next;
 
-	/* Guest s2 tracking trees access serialization. */
+	/*
+	 * Serializes guest s2 tracking trees access when the mmu_lock
+	 * is only held for read.
+	 */
 	spinlock_t guest_s2_tracking_lock;
 
 	/* Interrupt controller */
diff --git a/arch/arm64/include/asm/kvm_nested.h b/arch/arm64/include/asm/kvm_nested.h
index 2d71f686064a..954f532bc11b 100644
--- a/arch/arm64/include/asm/kvm_nested.h
+++ b/arch/arm64/include/asm/kvm_nested.h
@@ -81,6 +81,8 @@ extern void kvm_s2_mmu_iterate_by_vmid(struct kvm *kvm, u16 vmid,
 extern void kvm_record_guest_s2_mapping(struct kvm_s2_mmu *mmu, gpa_t canonical_ipa,
 					gpa_t nested_ipa, size_t map_size,
 					struct kvm_guest_s2_mapping *mapping);
+extern void kvm_remove_guest_s2_mappings(struct kvm_s2_mmu *mmu,
+					 gpa_t nipa, size_t size);
 extern void kvm_vcpu_load_hw_mmu(struct kvm_vcpu *vcpu);
 extern void kvm_vcpu_put_hw_mmu(struct kvm_vcpu *vcpu);
 
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 9bc799553ce9..c46e92d67f04 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -314,6 +314,19 @@ static void invalidate_icache_guest_page(void *va, size_t size)
  * we then fully enforce cacheability of RAM, no matter what the guest
  * does.
  */
+
+static int kvm_pgtable_stage2_unmap_tracked(struct kvm_pgtable *pgt, u64 addr, u64 size)
+{
+	int ret;
+
+	ret = kvm_pgtable_stage2_unmap(pgt, addr, size);
+	if (ret)
+		return ret;
+
+	kvm_remove_guest_s2_mappings(pgt->mmu, addr, size);
+	return 0;
+}
+
 /**
  * __unmap_stage2_range -- Clear stage2 page table entries to unmap a range
  * @mmu:   The KVM stage-2 MMU pointer
@@ -331,11 +344,17 @@ static void __unmap_stage2_range(struct kvm_s2_mmu *mmu, phys_addr_t start, u64
 {
 	struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
 	phys_addr_t end = start + size;
+	int (*fn)(struct kvm_pgtable *, u64, u64);
 
 	lockdep_assert_held_write(&kvm->mmu_lock);
 	WARN_ON(size & ~PAGE_MASK);
-	WARN_ON(stage2_apply_range(mmu, start, end, KVM_PGT_FN(kvm_pgtable_stage2_unmap),
-				   may_block));
+
+	if (kvm_is_nested_s2_mmu(kvm, mmu))
+		fn = kvm_pgtable_stage2_unmap_tracked;
+	else
+		fn = KVM_PGT_FN(kvm_pgtable_stage2_unmap);
+
+	WARN_ON(stage2_apply_range(mmu, start, end, fn, may_block));
 }
 
 void kvm_stage2_unmap_range(struct kvm_s2_mmu *mmu, phys_addr_t start,
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index d9acff507fd2..92a9a32f9f2b 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -897,6 +897,40 @@ void kvm_record_guest_s2_mapping(struct kvm_s2_mmu *mmu, gpa_t canonical_ipa,
 	interval_tree_insert(&mapping->canonical, &kvm->arch.mmu.guest_s2_mappings);
 }
 
+void kvm_remove_guest_s2_mappings(struct kvm_s2_mmu *mmu, gpa_t nipa,
+				  size_t size)
+{
+	struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
+	struct interval_tree_node *node, *next;
+	struct kvm_guest_s2_mapping *mapping;
+	gpa_t nipa_end = nipa + size - 1;
+
+	/*
+	 * Guest s2 tracking interval trees are only accessed while holding the
+	 * mmu_lock, hence we don't have to take guest_s2_tracking_lock if the
+	 * mmu_lock is held for write.
+	 */
+	lockdep_assert_held_write(&kvm->mmu_lock);
+
+	node = interval_tree_iter_first(&mmu->guest_s2_mappings, nipa, nipa_end);
+	while (node) {
+		next = interval_tree_iter_next(node, nipa, nipa_end);
+		mapping = container_of(node, struct kvm_guest_s2_mapping,
+				       nested);
+		/*
+		 * Tracking must be conservative on removal, only remove
+		 * mappings that are within the unmap range.
+		 */
+		if (nipa <= mapping->nested.start && nipa_end >= mapping->nested.last) {
+			interval_tree_remove(&mapping->nested, &mmu->guest_s2_mappings);
+			interval_tree_remove(&mapping->canonical,
+					     &kvm->arch.mmu.guest_s2_mappings);
+			kfree(mapping);
+		}
+		node = next;
+	}
+}
+
 void kvm_init_nested_s2_mmu(struct kvm_s2_mmu *mmu)
 {
 	/* CnP being set denotes an invalid entry */
-- 
2.43.0


