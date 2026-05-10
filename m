Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 706DACD3427
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 14:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QS7HBf0AvOdYzSUHg6PQox885NSnDUusCESNYJW8lqc=; b=0mLoB1vIyhUGJ4Eyhp/9/9zorf
	mWFLcVfQX9nJtsaXVYhZllTadqzy+JAg3ky34bQiiPl6sFGIv9yQP7F3A1l3ohrKTdnIyyr+kaZiF
	WOnmmfvyEFrs1y1ZcB2EKl9MfYKGzfKtIzNEpfVXkGXQ2tTZIcUcdWKJyU1OcyHcnL3X3DzBYVGE4
	AaXiXr4kdMfS23W5F6E8j7KYNdi7J3aFq3MI9zl48XaHgzL+u+y0Oe7zV4bSiw6sjnitf3th6jj/u
	Uc9A9tLVfL8Nc9eCxgwdCy3xf3IfnUKenRSh74G/aDGTuZn3CC5iDTEhZ5TMS7SW6jpCVum/u4kmB
	QlOuSMdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM5Y4-0000000AywR-1X8Z;
	Sun, 10 May 2026 14:54:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM5Xy-0000000AytC-3Vbz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 14:54:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A22872938;
	Sun, 10 May 2026 07:54:16 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 915863F836;
	Sun, 10 May 2026 07:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778424861; bh=htsQJlRBS06zME+hYGhGVA/iLnzz79Qd5j+6CmUrf6s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=imSHh8YEQCrEqL+SqwMuw0wVtDp2VlrsfY+XNmLoTkFMi1XHjAWHuX6F0GqixrUY+
	 xgghmVmEGCIYpzcwpg056PdqPnBNBIMn1+UD0BDxk7WM1Tt9u3O9olYQ8xBNbF08iZ
	 Jk2nAdsFe2i5UYnj8bfi+MxwMR8aE8G6zjEtuYmM=
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
Subject: [PATCH v3 4/5] KVM: arm64: nv: Remove reverse map entries during TLBI handling
Date: Sun, 10 May 2026 15:53:37 +0100
Message-ID: <20260510145338.322962-5-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260510145338.322962-1-weilin.chang@arm.com>
References: <20260510145338.322962-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_075422_966880_24D4875B 
X-CRM114-Status: GOOD (  17.30  )
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

When a guest hypervisor issues a TLBI for a specific IPA range, KVM
unmaps that range from all the effected shadow stage-2s. During this we
get the opportunity to remove the reverse map, and lower the probability
of creating UNKNOWN_IPA reverse map ranges at subsequent stage-2 faults.

However, the TLBI ranges are specified in nested IPA, so in order to
locate the affected ranges in the reverse map maple tree, which is a
mapping from canonical IPA to nested IPA, we can only iterate through
the entire tree and check each entry.

Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
---
 arch/arm64/include/asm/kvm_nested.h |  2 ++
 arch/arm64/kvm/nested.c             | 38 +++++++++++++++++++++++++++++
 arch/arm64/kvm/sys_regs.c           |  3 +++
 3 files changed, 43 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_nested.h b/arch/arm64/include/asm/kvm_nested.h
index 5cbf78dfc685..b11925826b25 100644
--- a/arch/arm64/include/asm/kvm_nested.h
+++ b/arch/arm64/include/asm/kvm_nested.h
@@ -76,6 +76,8 @@ extern void kvm_s2_mmu_iterate_by_vmid(struct kvm *kvm, u16 vmid,
 				       const union tlbi_info *info,
 				       void (*)(struct kvm_s2_mmu *,
 						const union tlbi_info *));
+extern void kvm_remove_nested_revmap(struct kvm_s2_mmu *mmu, u64 nested_ipa,
+				     size_t size);
 extern void kvm_record_nested_revmap(gpa_t gpa, struct kvm_s2_mmu *mmu,
 				     gpa_t fault_ipa, size_t map_size);
 extern void kvm_vcpu_load_hw_mmu(struct kvm_vcpu *vcpu);
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 35b5d5f21a23..96b88d9c0c2a 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -784,6 +784,44 @@ static struct kvm_s2_mmu *get_s2_mmu_nested(struct kvm_vcpu *vcpu)
 	return s2_mmu;
 }
 
+void kvm_remove_nested_revmap(struct kvm_s2_mmu *mmu, u64 nested_ipa, size_t size)
+{
+	/*
+	 * Iterate through the mt of this mmu, remove all canonical ipa ranges
+	 * with !UNKNOWN_IPA that maps to ranges that are strictly within
+	 * [addr, addr + size).
+	 */
+	struct maple_tree *revmap_mt = &mmu->nested_revmap_mt;
+	void *entry;
+	u64 entry_val, nested_ipa_end = nested_ipa + size;
+	u64 this_nested_ipa, this_nested_ipa_end;
+	size_t revmap_size;
+
+	MA_STATE(mas_rev, revmap_mt, 0, ULONG_MAX);
+
+	mtree_lock(revmap_mt);
+	mas_for_each(&mas_rev, entry, ULONG_MAX) {
+		entry_val = xa_to_value(entry);
+		if (entry_val & UNKNOWN_IPA)
+			continue;
+
+		revmap_size = mas_rev.last - mas_rev.index + 1;
+		this_nested_ipa = entry_val & ADDR_MASK;
+		this_nested_ipa_end = this_nested_ipa + revmap_size;
+
+		if (this_nested_ipa >= nested_ipa &&
+		    this_nested_ipa_end <= nested_ipa_end) {
+			/*
+			 * As the shadow stage-2 is about to be unmapped
+			 * after this function, it doesn't matter whether the
+			 * removal of the reverse map failed or not.
+			 */
+			mas_store_gfp(&mas_rev, NULL, GFP_NOWAIT | __GFP_ACCOUNT);
+		}
+	}
+	mtree_unlock(revmap_mt);
+}
+
 void kvm_record_nested_revmap(gpa_t ipa, struct kvm_s2_mmu *mmu,
 			      gpa_t fault_ipa, size_t map_size)
 {
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 6a96cb7ba9a3..a97304680cee 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -4006,6 +4006,7 @@ union tlbi_info {
 static void s2_mmu_unmap_range(struct kvm_s2_mmu *mmu,
 			       const union tlbi_info *info)
 {
+	kvm_remove_nested_revmap(mmu, info->range.start, info->range.size);
 	/*
 	 * The unmap operation is allowed to drop the MMU lock and block, which
 	 * means that @mmu could be used for a different context than the one
@@ -4104,6 +4105,8 @@ static void s2_mmu_unmap_ipa(struct kvm_s2_mmu *mmu,
 	max_size = compute_tlb_inval_range(mmu, info->ipa.addr);
 	base_addr &= ~(max_size - 1);
 
+	kvm_remove_nested_revmap(mmu, base_addr, max_size);
+
 	/*
 	 * See comment in s2_mmu_unmap_range() for why this is allowed to
 	 * reschedule.
-- 
2.43.0


