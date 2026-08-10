Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED3DC5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 20:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OYjL7eH1x0jU7tozhu9m0CopLfebsahOK97yjZg/TxU=; b=Z/07sO8MMz0OKLMEl/K3lx8JWB
	TdkUWGlSpLpN78Pw42Vz86ljsOZ0QFI9PJcH2z+hyXCzBz/TaXhT+xUGWKX6A6pRdpn/XruGTWo5g
	jx5B2u+NGmOsi08sZpCS3VPfYWyKUTv154V2YjWN3AwBbKUPumzgFglPKssih06oRy4yO133Bm0rE
	WAJdRxr9GZGsHvl05uCkjh1qnHmXphEnwAwtDnsT1jreuTBBiME2rQoNXFcCLWB+bnKKDV6sjx0Ol
	y9476KV27r6pig93yd2R8/5sGcKL0jk122ipen1LOlFOx33LYthZmDZHeQ0lKnHvG2cF/zR6p2tKI
	/7X23Dvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtWye-0000000Cr2M-3q0i;
	Mon, 10 Aug 2026 20:52:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtWyW-0000000CqyO-3JkF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 20:52:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 307D51655;
	Mon, 10 Aug 2026 13:51:56 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3ED843F673;
	Mon, 10 Aug 2026 13:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786395120; bh=iEsxLdgXbUKc751dxgYuroZ4a7e4sbdIu33U4XqBSbg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HD/R2hl2cWK/QwxjdLZu/A1ylJ48Ljs6g/FsWr91HaSL4aCeR4a8f6XgEx2zoaJeX
	 3GWqcYS9tMFtjRqctOtG1hIyHwnfWNJQR5jWWtL3V/dWqF1qqxmKmD3bpa8XEoItnx
	 63Vl1tpUEZbEX5aWpVxzHl0Cm6oSZU2CzsTE7CtU=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Itaru Kitayama <itaru.kitayama@fujitsu.com>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH v5 5/6] KVM: arm64: nv: Avoid full shadow stage-2 unmap
Date: Mon, 10 Aug 2026 21:50:37 +0100
Message-ID: <20260810205038.118843-6-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810205038.118843-1-weilin.chang@arm.com>
References: <20260810205038.118843-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_135201_102117_24643D55 
X-CRM114-Status: GOOD (  13.09  )
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
 arch/arm64/kvm/mmu.c                |  7 +++--
 arch/arm64/kvm/nested.c             | 47 +++++++++++++++++++++++++++--
 3 files changed, 50 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_nested.h b/arch/arm64/include/asm/kvm_nested.h
index ffa3fa01f3cd..4e7d89b6824b 100644
--- a/arch/arm64/include/asm/kvm_nested.h
+++ b/arch/arm64/include/asm/kvm_nested.h
@@ -170,6 +170,8 @@ extern int kvm_s2_handle_perm_fault(struct kvm_vcpu *vcpu,
 				    struct kvm_s2_trans *trans);
 extern int kvm_inject_s2_fault(struct kvm_vcpu *vcpu, u64 esr_el2);
 extern void kvm_nested_s2_wp(struct kvm *kvm);
+extern void kvm_nested_unmap_cipa_range(struct kvm *kvm, gpa_t cipa,
+					size_t unmap_size, bool may_block);
 extern void kvm_nested_s2_unmap(struct kvm *kvm, bool may_block);
 extern void kvm_nested_s2_flush(struct kvm *kvm);
 
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index ddd1bbede227..241f020910d8 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -2518,8 +2518,9 @@ bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
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
 
@@ -2797,7 +2798,7 @@ void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
 
 	write_lock(&kvm->mmu_lock);
 	kvm_stage2_unmap_range(&kvm->arch.mmu, gpa, size, true);
-	kvm_nested_s2_unmap(kvm, true);
+	kvm_nested_unmap_cipa_range(kvm, gpa, size, true);
 	write_unlock(&kvm->mmu_lock);
 }
 
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 2a4c86df404c..0dc5824c8237 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -886,9 +886,8 @@ void kvm_remove_guest_s2_mappings(struct kvm_s2_mmu *mmu, gpa_t nipa,
 	gpa_t nipa_end = nipa + size - 1;
 
 	/*
-	 * Guest s2 tracking interval trees are only accessed while holding the
-	 * mmu_lock, hence we don't have to take guest_s2_tracking_lock if the
-	 * mmu_lock is held for write.
+	 * See kvm_nested_unmap_cipa_range() for why guest_s2_tracking_lock
+	 * isn't taken here.
 	 */
 	lockdep_assert_held_write(&kvm_s2_mmu_to_kvm(mmu)->mmu_lock);
 
@@ -1286,6 +1285,48 @@ void kvm_nested_s2_wp(struct kvm *kvm)
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
+		mapping = container_of(node, struct kvm_guest_s2_mapping,
+				       canonical);
+		mapping_size = mapping->nested.last - mapping->nested.start + 1;
+
+		if (WARN_ON_ONCE(kvm_pgtable_stage2_unmap(mapping->nested_mmu->pgt,
+							  mapping->nested.start,
+							  mapping_size)))
+			return;
+
+		interval_tree_remove(node, &kvm->arch.mmu.guest_s2_mappings);
+		interval_tree_remove(&mapping->nested, &mapping->nested_mmu->guest_s2_mappings);
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


