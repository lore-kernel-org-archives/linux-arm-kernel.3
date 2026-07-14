Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57CEAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 12:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ItREi6r3WZfZYv9NU/9RwjDpAHQMk4eIvG6qR4+tncE=; b=YpMSf3EO52MZd38jMLg4qdcUYS
	CNE2uxWQX25ychgOBMbXGfzE2mdf+iqD556VNhL51zvHD3J5sq3txAcBArpnaSOLs1SQ6Bqn8VxHV
	H47mipKdNwD3P1iS7ATCql413ZMjQpnxn+CKC+86YU1EqrMqTmuyr8Y/d9Q0T9y5mIccawePO8mrh
	sYkz6NG5bB3zXYGD0iCRbozZdOM9tsncrLKX6ckc/BKlANVC/JZKIonqN2uDz0+42kXTp1FRA0O5r
	AUKj+OBp9xKt8/liYjJgJlf7gsgnlpvkftgAnckhtZQV6psWuB6sJnDLq8yQDQmlrKC/JqHcju+es
	bNsD0QaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbo9-0000000BpeR-43zh;
	Tue, 14 Jul 2026 12:00:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbo6-0000000Bpbu-15T4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 12:00:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8329E1476;
	Tue, 14 Jul 2026 05:00:09 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 50AB93F93E;
	Tue, 14 Jul 2026 05:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784030413; bh=T73ydasjvqIW4dG81U6rIei8nMSD0vZur1SW676PBRs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l3fAi3fud6DlOGS2BXfXbzkGb3wNJukwl+N9BrPZurZnpyrPc7Yjhga4JFiBT+ryS
	 rWLbv2cFQxk2EHLFNezB4P+FgusgOjkIA61kzTWS0864J5nQpYyTGyWM2Hy7LxzTSO
	 Elr1NAng6U6Zt3CaX3BDQKX/AVxlm23MqqQFm7uo=
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
	Itaru Kitayama <itaru.kitayama@fujitsu.com>,
	Sebastian Ene <sebastianene@google.com>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH v4 5/6] KVM: arm64: nv: Remove reverse map entries during TLBI handling
Date: Tue, 14 Jul 2026 12:59:24 +0100
Message-ID: <20260714115926.2044757-6-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714115926.2044757-1-weilin.chang@arm.com>
References: <20260714115926.2044757-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_050014_378675_E45D4D7D 
X-CRM114-Status: GOOD (  15.53  )
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
unmaps that range from all the affected shadow stage-2s. During this we
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
 arch/arm64/kvm/nested.c             | 37 +++++++++++++++++++++++++++++
 arch/arm64/kvm/sys_regs.c           |  3 +++
 3 files changed, 42 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_nested.h b/arch/arm64/include/asm/kvm_nested.h
index 79de224f3438..664d789d17b1 100644
--- a/arch/arm64/include/asm/kvm_nested.h
+++ b/arch/arm64/include/asm/kvm_nested.h
@@ -77,6 +77,8 @@ extern void kvm_s2_mmu_iterate_by_vmid(struct kvm *kvm, u16 vmid,
 				       const union tlbi_info *info,
 				       void (*)(struct kvm_s2_mmu *,
 						const union tlbi_info *));
+extern void kvm_remove_nested_revmap(struct kvm_s2_mmu *mmu, u64 nested_ipa,
+				     size_t size);
 extern void kvm_record_nested_revmap(gpa_t canonical_ipa, struct kvm_s2_mmu *mmu,
 				     gpa_t nested_ipa, size_t map_size);
 extern void kvm_vcpu_load_hw_mmu(struct kvm_vcpu *vcpu);
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 22f8a1daca93..cd93793fe89d 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -872,6 +872,43 @@ static struct kvm_s2_mmu *get_s2_mmu_nested(struct kvm_vcpu *vcpu)
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
+	u64 entry_val, nested_ipa_end = nested_ipa + size;
+	u64 this_nested_ipa, this_nested_ipa_end;
+	size_t revmap_size;
+	void *entry;
+
+	MA_STATE(mas_rmap, revmap_mt, 0, ULONG_MAX);
+
+	mtree_lock(revmap_mt);
+	mas_for_each(&mas_rmap, entry, ULONG_MAX) {
+		entry_val = xa_to_value(entry);
+		if (unknown_ipa_entry(entry_val))
+			continue;
+
+		revmap_size = mas_rmap.last - mas_rmap.index + 1;
+		this_nested_ipa = entry_val & ADDR_MASK;
+		this_nested_ipa_end = this_nested_ipa + revmap_size;
+
+		if (this_nested_ipa >= nested_ipa &&
+		    this_nested_ipa_end <= nested_ipa_end) {
+			/*
+			 * Ignore result, failure to remove reverse mapping will
+			 * only cause extra unmaps.
+			 */
+			mas_store_gfp(&mas_rmap, NULL, GFP_NOWAIT | __GFP_ACCOUNT);
+		}
+	}
+	mtree_unlock(revmap_mt);
+}
+
 void kvm_record_nested_revmap(gpa_t canonical_ipa, struct kvm_s2_mmu *mmu,
 			      gpa_t nested_ipa, size_t map_size)
 {
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 33c921df19b5..e4ce70508af6 100644
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


