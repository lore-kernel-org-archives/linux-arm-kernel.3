Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A77C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 09:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N7kFddEF6pBySf6PFA5gmlzAGr/b+AmmqOMBreUEoxk=; b=k1aIhVRIghhkZ2tQP/+ZvAIsRX
	BgxTvbZd1XhZ8kwkPwwYHfSDwMcSqpL5q61MlwO+dLndV+Heo8Nm/1uoWTho/2MgCKmzejZ0SC9+E
	10OXnPw9tCiPNMxfTzFIr9fEfi3bQiIspzvX+G4TTceTMVbJTOMzBvjbuHdialL3Odc17Ru0BXOtO
	GxlGq51wIEkcRPHOITvEssYpw3bJoN8nSpIQWTrGsdmi5fOkrq+NJffCSDud7fqtkGyN49zMNjPGP
	qBYrKMuHi/OPNNRxnM0JSRdbW+V1kQj2Im95L3jE7QdXSUGc/kclxiiiDKoyI1npWZH5/yrnD8xSp
	vbBoKRtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wru7a-00000005L3F-21Yo;
	Thu, 06 Aug 2026 09:10:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wru7X-00000005L1Y-2x2V
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 09:10:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5DF7643C5F;
	Thu,  6 Aug 2026 09:10:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 405CC1F00AC4;
	Thu,  6 Aug 2026 09:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786007435;
	bh=N7kFddEF6pBySf6PFA5gmlzAGr/b+AmmqOMBreUEoxk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BT0Zq/16Satg5ZEBecmHF38w6jN4PIKEzGAhl33KuDEgtzRPB0zW4jtZDY8lPaG3S
	 OyFNomCoGQbz+St41WJcjpbd4r/NvsknuGx/lhnXuLit+hibDPd+m71ZOCYStKJx7s
	 3ngltMSTzFN5nqK/dWCmtRn4CaObpZ7u7TzF7Rsg2mbvri76xppQcy9Z2k0KhQHxEh
	 HP6w22/dKaY3G/zr4nPCyMKRLNlUMxQdd7xftGweLC4CRiAm85uzocZRbsLH+pgsFw
	 RAoj1ylS5j9R4Y8n5IzwNm6Ch3v/XJ1N5qgRJnikJN2B/x610u2ebIqcKZfe6SS/ho
	 IxtAj3Ho/PSgA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wru7V-0000000CtHi-2Em4;
	Thu, 06 Aug 2026 09:10:33 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Hyunwoo Kim <imv4bel@gmail.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	ljs@kernel.org,
	sashiko-bot@kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 7/8] KVM: arm64: Make VNCR invalidation participate in MMU invalidation retry
Date: Thu,  6 Aug 2026 10:10:25 +0100
Message-ID: <20260806091026.620700-8-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260806091026.620700-1-maz@kernel.org>
References: <20260806091026.620700-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, fuad.tabba@linux.dev, imv4bel@gmail.com, yaoyuan@linux.alibaba.com, ljs@kernel.org, sashiko-bot@kernel.org, stable@vger.kernel.org
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

A VNCR TLB invalidation can occur on one vcpu while another vcpu is
faulting in this same page. Without correctly handling this, we can
end up with the following scenario:

- vcpu A walks the PTs to translate VNCR
- before vcpu A is able to grab the MMU lock to insert the TLB,
  vcpu B updates the S1 PTs with an invalid entry, and issues
  a TLBI S1E2 for this VA
- vcpu A inserts the TLB for something that is now invalid

This isn't a new problem, and we manage S2 by having the MMU notifier
to bump up mmu_invalidate_seq on invalidation so that the fault can be
replayed.

We can perform something similar here, and extend invalidate_vncr_va() to
update the same counter, clearly indicating that the context has
changed under our feet. This is safe as the invalidation always happen
while holding the MMU lock for write, and that we sample the sequence
number before walking S1.

Fixes: 4ffa72ad8f37e ("KVM: arm64: nv: Add S1 TLB invalidation primitive for VNCR_EL2")
Reported-by: sashiko-bot@kernel.org
Link: https://lore.kernel.org/r/20260801130454.5D9F11F00AC4@smtp.kernel.org
Signed-off-by: Marc Zyngier <maz@kernel.org>
Cc: stable@vger.kernel.org
---
 arch/arm64/kvm/nested.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index cf0d45059edbd..550c9bd3dbe7d 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1058,6 +1058,12 @@ static void kvm_invalidate_vncr_ipa(struct kvm *kvm, u64 start, u64 end)
 	if (!kvm_has_feat(kvm, ID_AA64MMFR4_EL1, NV_frac, NV2_ONLY))
 		return;
 
+	/*
+	 * Note that invalidating the VNCR on the back of an MMU notifier
+	 * doesn't require messing with the invalidation counter for a
+	 * parallel walk. The notifier itself will have bumped the counter,
+	 * making sure we rewalk.
+	 */
 	kvm_for_each_vncr_tlb(i, vcpu, vt, kvm)
 		if (vncr_tlb_intersects(vt, vt->wr.pa, start, end - start))
 			invalidate_vncr(vt);
@@ -1085,6 +1091,15 @@ static void invalidate_vncr_va(struct kvm *kvm,
 
 	lockdep_assert_held_write(&kvm->mmu_lock);
 
+	/*
+	 * We might be performing a parallel S1 walk, so bump up the
+	 * invalidation counter even in the absence of an actual VNCR TLB
+	 * invalidation, as this could indicate that the guest has gone
+	 * through a BBM sequence.
+	 */
+	kvm->mmu_invalidate_seq++;
+	smp_wmb();
+
 	kvm_for_each_vncr_tlb(i, vcpu, vt, kvm) {
 		switch (scope->type) {
 		case TLBI_ALL:
@@ -1419,15 +1434,15 @@ static int kvm_translate_vncr(struct kvm_vcpu *vcpu, bool *is_gmem)
 
 	va =  read_vncr_el2(vcpu);
 
+	mmu_seq = vcpu->kvm->mmu_invalidate_seq;
+	smp_rmb();
+
 	ret = __kvm_translate_va(vcpu, &vt->wi, &vt->wr, va);
 	if (ret)
 		return ret;
 
 	write_fault = kvm_is_write_fault(vcpu);
 
-	mmu_seq = vcpu->kvm->mmu_invalidate_seq;
-	smp_rmb();
-
 	gfn = vt->wr.pa >> PAGE_SHIFT;
 	memslot = gfn_to_memslot(vcpu->kvm, gfn);
 	if (!memslot) {
-- 
2.47.3


