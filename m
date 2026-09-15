Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EBEAC88E7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rGjisz8i3X31jtK+0QCCy9X0CQQUYyFv+bxq2EHWgac=; b=gvK3S95109cwyCAuPS9ygBNJXW
	4P6Fgb8hz1IE2FaRygpeYyGR6abOWvf0mu6nRfAM9AU5sLHTazhnW4LG0Z7z9XnYiD+jsVpWczV/0
	vM97Nwb+Y2QcVDijP8oyLuWzFXO3mpsQUT4+2eufkHCUjXD6KaOb/P/EFrIvR3eg9gPuUvHp6KMjP
	Lw4TMOXQ0bQeEXPWEbT53zG9mdI9110CL9KQ7z9FvU34dWzUgZfXbUca3C8S930qpwUW8jvlViXPw
	57+5LrJLgWJRnJExSWdWMSOQQvYZqu+lnHGchFLZHFIzy8+ClypZ7O6oS4szJnlVYNz5T/ZBzBhEz
	ImGI3v4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VJs-00000007GV6-1Qto;
	Tue, 15 Sep 2026 15:43:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VJp-00000007GTS-3XJm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 15:43:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F349169E;
	Tue, 15 Sep 2026 08:43:33 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A630B3F882;
	Tue, 15 Sep 2026 08:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789487017; bh=tfSyeTEKhMgIr2WJ2UOq+ZLRU580pd9eUWgwdsIJlT8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BttJjvIg/rpdGLg/BCbqiUIZvf9gneIEp6IsL8+WZGUrRw7/aaYlwoR0NnwpSYuvv
	 zLu4fSGaj6PiOoTyWIjUxlEfFULgzxz41h9ODxukVWtdmFBPc55et/hID76TU9f46K
	 gdYcRIulRp0fJUc+e7erQ/6cHKgcUId9tCPjaAs4=
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
Subject: [PATCH v6 5/7] KVM: arm64: nv: Avoid full shadow stage-2 unmap
Date: Tue, 15 Sep 2026 16:43:03 +0100
Message-ID: <20260915154305.3852871-6-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915154305.3852871-1-weilin.chang@arm.com>
References: <20260915154305.3852871-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_084337_980032_6A7CB896 
X-CRM114-Status: GOOD (  14.62  )
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

With guest stage-2 tracking in place, we can improve MMU notifier unmaps
from unmapping all existing shadow stage-2 mappings to only unmapping
the ones affected by the given canonical IPA range.

Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
---
 arch/arm64/include/asm/kvm_nested.h |  2 ++
 arch/arm64/kvm/mmu.c                |  7 ++--
 arch/arm64/kvm/nested.c             | 50 +++++++++++++++++++++++++++--
 3 files changed, 53 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_nested.h b/arch/arm64/include/asm/kvm_nested.h
index 954f532bc11b..0f899addafa8 100644
--- a/arch/arm64/include/asm/kvm_nested.h
+++ b/arch/arm64/include/asm/kvm_nested.h
@@ -171,6 +171,8 @@ extern int kvm_s2_handle_perm_fault(struct kvm_vcpu *vcpu,
 				    struct kvm_s2_trans *trans);
 extern int kvm_inject_s2_fault(struct kvm_vcpu *vcpu, u64 esr_el2);
 extern void kvm_nested_s2_wp(struct kvm *kvm);
+extern void kvm_nested_unmap_cipa_range(struct kvm *kvm, gpa_t cipa,
+					size_t unmap_size, bool may_block);
 extern void kvm_nested_s2_unmap(struct kvm *kvm, bool may_block);
 extern void kvm_nested_s2_flush(struct kvm *kvm);
 
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index c46e92d67f04..b8ba2d09ed96 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -2525,8 +2525,9 @@ bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
 	__unmap_stage2_range(&kvm->arch.mmu, range->start << PAGE_SHIFT,
 			     (range->end - range->start) << PAGE_SHIFT,
 			     range->may_block);
-
-	kvm_nested_s2_unmap(kvm, range->may_block);
+	kvm_nested_unmap_cipa_range(kvm, range->start << PAGE_SHIFT,
+				    (range->end - range->start) << PAGE_SHIFT,
+				    range->may_block);
 	return false;
 }
 
@@ -2808,7 +2809,7 @@ void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
 
 	write_lock(&kvm->mmu_lock);
 	kvm_stage2_unmap_range(&kvm->arch.mmu, gpa, size, true);
-	kvm_nested_s2_unmap(kvm, true);
+	kvm_nested_unmap_cipa_range(kvm, gpa, size, true);
 	write_unlock(&kvm->mmu_lock);
 }
 
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 92a9a32f9f2b..4cbb4f1b8b35 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -906,9 +906,8 @@ void kvm_remove_guest_s2_mappings(struct kvm_s2_mmu *mmu, gpa_t nipa,
 	gpa_t nipa_end = nipa + size - 1;
 
 	/*
-	 * Guest s2 tracking interval trees are only accessed while holding the
-	 * mmu_lock, hence we don't have to take guest_s2_tracking_lock if the
-	 * mmu_lock is held for write.
+	 * See kvm_nested_unmap_cipa_range() for why guest_s2_tracking_lock
+	 * isn't taken here.
 	 */
 	lockdep_assert_held_write(&kvm->mmu_lock);
 
@@ -1342,6 +1341,51 @@ void kvm_nested_s2_wp(struct kvm *kvm)
 	kvm_invalidate_vncr_ipa(kvm, 0, BIT(kvm->arch.mmu.pgt->ia_bits));
 }
 
+void kvm_nested_unmap_cipa_range(struct kvm *kvm, gpa_t cipa, size_t unmap_size,
+				 bool may_block)
+{
+	gpa_t cipa_end = cipa + unmap_size - 1;
+	struct kvm_guest_s2_mapping *mapping;
+	struct interval_tree_node *node;
+	size_t mapping_size;
+
+	/*
+	 * Guest s2 tracking interval trees are only accessed while holding the
+	 * mmu_lock, hence we don't have to take guest_s2_tracking_lock if the
+	 * mmu_lock is held for write. This saves us from having to manually
+	 * lock/unlock guest_s2_tracking_lock below around
+	 * cond_resched_rwlock_write().
+	 */
+	lockdep_assert_held_write(&kvm->mmu_lock);
+
+	if (!kvm->arch.nested_mmus_size)
+		return;
+
+	while ((node = interval_tree_iter_first(&kvm->arch.mmu.guest_s2_mappings,
+						cipa, cipa_end))) {
+		mapping = container_of(node, struct kvm_guest_s2_mapping, canonical);
+		mapping_size = mapping->nested.last - mapping->nested.start + 1;
+
+		/* We could race against MMU teardown, which frees mmu->pgt. */
+		if (mapping->nested_mmu->pgt) {
+			if (WARN_ON_ONCE(kvm_pgtable_stage2_unmap(mapping->nested_mmu->pgt,
+								  mapping->nested.start,
+								  mapping_size)))
+				return;
+
+			interval_tree_remove(&mapping->nested,
+					     &mapping->nested_mmu->guest_s2_mappings);
+		}
+		interval_tree_remove(node, &kvm->arch.mmu.guest_s2_mappings);
+		kfree(mapping);
+
+		if (may_block)
+			cond_resched_rwlock_write(&kvm->mmu_lock);
+	}
+
+	kvm_invalidate_vncr_ipa(kvm, cipa, cipa + unmap_size);
+}
+
 void kvm_nested_s2_unmap(struct kvm *kvm, bool may_block)
 {
 	int i;
-- 
2.43.0


