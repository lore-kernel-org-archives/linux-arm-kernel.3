Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B674FB3CF5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 10:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=87vNVxDWTXeDnezbl6ZjwnI5REsJQWPXzOnmzqKUTd0=; b=S0LrEiqXB35RcHMiTWYq650ksN
	C/gz2dddV/UqbFh3bysRRpj23cXkEqyPpLsVtC12PEwol4iy36W+HCjkWxUb8GmCh53mX7Xi+zWsm
	9NITWBb3Hvvd751tb7ev0Th0K/GZZA7Z0sF6HMuiMAmZ9e2PSoSyJokkwLpDQX38qwVGMYdVu99Nr
	KWy8e3s/WVnE2Qtxps/37YPW6lZk2EzVScNB3MkT+VfEw0JknGDGFI2KQbdzD07dm/Xzd1RgLQZv5
	St0MA5Fl3sACwsNe9j0Lb3C/Leak7eYHgkqDckS4NFnJKkTBOO6tn6iedYp6NKErxPuA3R4u01MLs
	pGdPg9cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79Wx-0000000B1Ge-2eZC;
	Mon, 30 Mar 2026 10:07:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79Wv-0000000B1Fo-3a5d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 10:07:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B96C71BF3;
	Mon, 30 Mar 2026 03:07:26 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 009403F915;
	Mon, 30 Mar 2026 03:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774865252; bh=Hj4nhQhUtz0V/rAJyYmuJZMMsBEFwCzLO0spoqPzVVs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GLST/jYJt3trQbmMs39yHLvbetaOb8cmbHUbTH8Jox+3LbXrn9AI04AdAV1oT9Aih
	 XfNQferj6snrFKtDxgqcDGlCKj4XzuESpe4YFkS/3Bgfeh9/4wjklUxxRLBiAXtLKq
	 8KxatCzVUJhlj/SW/xV6sJTMpU1/ueWbRNtWqsJo=
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
Subject: [PATCH 3/4] KVM: arm64: nv: Remove reverse map entries during TLBI handling
Date: Mon, 30 Mar 2026 11:06:32 +0100
Message-ID: <20260330100633.2817076-4-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330100633.2817076-1-weilin.chang@arm.com>
References: <20260330100633.2817076-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_030734_014013_1D725785 
X-CRM114-Status: GOOD (  15.64  )
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
of creating polluted reverse map ranges at subsequent stage-2 faults.

However, the TLBI ranges are specified in nested IPA, so in order to
locate the affected ranges in the reverse map maple tree, which is a
mapping from canonical IPA to nested IPA, we can only iterate through
the entire tree and check each entry.

Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
---
 arch/arm64/include/asm/kvm_nested.h |  1 +
 arch/arm64/kvm/nested.c             | 29 +++++++++++++++++++++++++++++
 arch/arm64/kvm/sys_regs.c           |  3 +++
 3 files changed, 33 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_nested.h b/arch/arm64/include/asm/kvm_nested.h
index 4d09d567d7f9..376619cdc9d5 100644
--- a/arch/arm64/include/asm/kvm_nested.h
+++ b/arch/arm64/include/asm/kvm_nested.h
@@ -76,6 +76,7 @@ extern void kvm_s2_mmu_iterate_by_vmid(struct kvm *kvm, u16 vmid,
 				       const union tlbi_info *info,
 				       void (*)(struct kvm_s2_mmu *,
 						const union tlbi_info *));
+extern void kvm_remove_nested_revmap(struct kvm_s2_mmu *mmu, u64 addr, u64 size);
 extern int kvm_record_nested_revmap(gpa_t gpa, struct kvm_s2_mmu *mmu,
 				    gpa_t fault_gpa, size_t map_size);
 extern void kvm_vcpu_load_hw_mmu(struct kvm_vcpu *vcpu);
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index c7d00cb40ba5..125fa21ca2e7 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -912,6 +912,35 @@ static int record_accel(struct kvm_s2_mmu *mmu, gpa_t gpa,
 	return mas_store_gfp(&mas, (void *)new_entry, GFP_KERNEL_ACCOUNT);
 }
 
+void kvm_remove_nested_revmap(struct kvm_s2_mmu *mmu, u64 addr, u64 size)
+{
+	/*
+	 * Iterate through the mt of this mmu, remove all unpolluted canonical
+	 * ipa ranges that maps to ranges that are strictly within
+	 * [addr, addr + size).
+	 */
+	struct maple_tree *mt = &mmu->nested_revmap_mt;
+	void *entry;
+	u64 nested_ipa, nested_ipa_end, addr_end = addr + size;
+	size_t revmap_size;
+
+	MA_STATE(mas, mt, 0, ULONG_MAX);
+
+	mas_for_each(&mas, entry, ULONG_MAX) {
+		if ((u64)entry & UNKNOWN_IPA)
+			continue;
+
+		revmap_size = mas.last - mas.index + 1;
+		nested_ipa = (u64)entry & NESTED_IPA_MASK;
+		nested_ipa_end = nested_ipa + revmap_size;
+
+		if (nested_ipa >= addr && nested_ipa_end <= addr_end) {
+			accel_clear_mmu_range(mmu, mas.index, revmap_size);
+			mas_erase(&mas);
+		}
+	}
+}
+
 int kvm_record_nested_revmap(gpa_t ipa, struct kvm_s2_mmu *mmu,
 			     gpa_t fault_ipa, size_t map_size)
 {
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index e1001544d4f4..c7af0eac9ee4 100644
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


