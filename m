Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A278CD8C89
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 17:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=liDRSDovqjC0vV1eIvbY6OQvKsCHLQ2zJENAx8zcP+E=; b=tYm0Qku4B2VrzAwL/U8zsiYePr
	O2dEZBgWKgaJwhCY/wF6Ptjh6NPWiVlQlXrfi+vCg4iIVvgLGPOsl7wz9EERiRlUdl2+7KtoRZaLz
	Zq2A81BhTc7owVtLRmgPe+N5A1Kl3WwaiePIV/49NL8TWS0M+ikMKte5n1KC+A9ETeDzYIyRRjL5c
	vw3P3OeUwTN70I6LgtVkB1UHxQG6jTDLw7SX1388JSR7B44VTYOyyyp4R5lFBrszzC5vd6JKFE+jV
	jTZgdT+ZejAP+ADO6lPcQDmUO42RQqHI/999N2fGkwe9i784hf4+uIYEbB/qCH3ya0936FypmLsHJ
	86inc1Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWHhf-00000002Ni1-1dhO;
	Sun, 07 Jun 2026 17:54:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWHhe-00000002Nhu-3rzj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Jun 2026 17:54:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0D16A401D7;
	Sun,  7 Jun 2026 17:54:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E359D1F00893;
	Sun,  7 Jun 2026 17:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780854869;
	bh=liDRSDovqjC0vV1eIvbY6OQvKsCHLQ2zJENAx8zcP+E=;
	h=From:To:Cc:Subject:Date;
	b=ZhFqd5BHcwUXOAeElcxo7M70LA2umMvTU/cov7hrXSDkHSVhnKtdkxGWjWfh4apGT
	 6Sk92b254fjJtxFb5jFGqv+9JiO8Ntf4vkBVajWB38GTFdceM2A4z1387ecyhJSzpO
	 eKVIWHECpORpfo3Mj6+GD8sf4GHq+jykDnZcBB5RtFYOXgj7RIInnTOCLEUDjZVFGA
	 A6oPu0Hiv1PlVL4Wg/KfOve92tYHTmWuu1e3i385ozOIwpwVbPuQuI3+VPiMivpdYV
	 HGQFDo9EvAdO9nTG5bdcWtW72KNegB0yIhtVtz2WRolqNCXO9TB6nr/1XMcT2dxrb/
	 xOGNH3cSNXQgg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=lobster-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wWHhb-0000000AEMz-3IMj;
	Sun, 07 Jun 2026 17:54:27 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Hyunwoo Kim <imv4bel@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] KVM: arm64: Add kvm_for_each_vncr_tlb() helper
Date: Sun,  7 Jun 2026 18:57:45 +0100
Message-ID: <20260607175745.297793-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, imv4bel@gmail.com, stable@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

VNCR TLB invalidation occurs from MMU notifiers or TLBI instructions,
and either can race against a vcpu not being onlined yet (no pseudo-TLB
allocated). Similarly, the TLB might be invalid, and the invalidation
should be skipped in this case.

Both kvm_invalidate_vncr_ipa() and kvm_invalidate_vncr_va() are
expected to perform the same checks, except that the latter doesn't
check for the allocation and blindly dereferences the pointer.

Solve this by introducing a new iterator built on top of the usual
kvm_for_each_vcpu() that checks for both of the above conditions,
and convert the two users to it.

Reported-by: Hyunwoo Kim <imv4bel@gmail.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
Link: https://lore.kernel.org/r/aiUvSbrWndQeUPc8@v4bel
Fixes: 4ffa72ad8f37 ("KVM: arm64: nv: Add S1 TLB invalidation primitive for VNCR_EL2")
Cc: stable@vger.kernel.org
---
 arch/arm64/kvm/nested.c | 36 +++++++++++++++---------------------
 1 file changed, 15 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index f8d3f3a723282..690b8e8564166 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -908,9 +908,21 @@ static void invalidate_vncr(struct vncr_tlb *vt)
 		clear_fixmap(vncr_fixmap(vt->cpu));
 }
 
+/*
+ * VNCR TLB invalidation occurs from MMU notifiers or TLBI instructions, and
+ * either can race against a vcpu not being onlined yet (no pseudo-TLB
+ * allocated). Similarly, the TLB might be invalid.  Skip those, as they
+ * obviously don't participate in the invalidation at this stage.
+ */
+#define kvm_for_each_vncr_tlb(idx, vcpup, tlbp, kvm)	\
+	kvm_for_each_vcpu(idx, vcpup, kvm)		\
+		if (((tlbp) = vcpup->arch.vncr_tlb) &&	\
+		    (tlbp)->valid)
+
 static void kvm_invalidate_vncr_ipa(struct kvm *kvm, u64 start, u64 end)
 {
 	struct kvm_vcpu *vcpu;
+	struct vncr_tlb *vt;
 	unsigned long i;
 
 	lockdep_assert_held_write(&kvm->mmu_lock);
@@ -918,24 +930,9 @@ static void kvm_invalidate_vncr_ipa(struct kvm *kvm, u64 start, u64 end)
 	if (!kvm_has_feat(kvm, ID_AA64MMFR4_EL1, NV_frac, NV2_ONLY))
 		return;
 
-	kvm_for_each_vcpu(i, vcpu, kvm) {
-		struct vncr_tlb *vt = vcpu->arch.vncr_tlb;
+	kvm_for_each_vncr_tlb(i, vcpu, vt, kvm) {
 		u64 ipa_start, ipa_end, ipa_size;
 
-		/*
-		 * Careful here: We end-up here from an MMU notifier,
-		 * and this can race against a vcpu not being onlined
-		 * yet, without the pseudo-TLB being allocated.
-		 *
-		 * Skip those, as they obviously don't participate in
-		 * the invalidation at this stage.
-		 */
-		if (!vt)
-			continue;
-
-		if (!vt->valid)
-			continue;
-
 		ipa_size = ttl_to_size(pgshift_level_to_ttl(vt->wi.pgshift,
 							    vt->wr.level));
 		ipa_start = vt->wr.pa & ~(ipa_size - 1);
@@ -965,17 +962,14 @@ static void invalidate_vncr_va(struct kvm *kvm,
 			       struct s1e2_tlbi_scope *scope)
 {
 	struct kvm_vcpu *vcpu;
+	struct vncr_tlb *vt;
 	unsigned long i;
 
 	lockdep_assert_held_write(&kvm->mmu_lock);
 
-	kvm_for_each_vcpu(i, vcpu, kvm) {
-		struct vncr_tlb *vt = vcpu->arch.vncr_tlb;
+	kvm_for_each_vncr_tlb(i, vcpu, vt, kvm) {
 		u64 va_start, va_end, va_size;
 
-		if (!vt->valid)
-			continue;
-
 		va_size = ttl_to_size(pgshift_level_to_ttl(vt->wi.pgshift,
 							   vt->wr.level));
 		va_start = vt->gva & ~(va_size - 1);
-- 
2.47.3


