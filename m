Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69025C56203
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 09:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gQ8zq70y0787azP95WYE6ddYaI5CvHh9/VpExmEvz+w=; b=H/twKA0UPXpxMyOzpkUx1kKvpS
	Un+b+X2adU1omd5VBdcmYm6jgM3rwKa+BOLbA87gRe3i1AuYsrPSbWnEuvUmeJxCnUMS9iOJ5K1hB
	HXKlirWqZwh0BTE2UNpJtc2mhcak11y26QX+AW514gLR30+lfGP4dMpceyCPtnkQSAqGwxI6qj7fj
	Ky65rd8aZxY8T+uOHjDDCia0Nph/pYH77jTIfiUJfxoxy2gqZMDhXM1v5VrwnfDBKypzX+e7WNmC8
	hjvt5+Zoq+tbjEKMdCjT3KlL/6WhIPp5Z3jgrXNjk0joHXSbkSc4oLdpo3FrKrVkHbMi42BHO5SLU
	vufoVgYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wru7a-00000005L3a-2fc5;
	Thu, 06 Aug 2026 09:10:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wru7X-00000005L17-2x1z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 09:10:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8B6DC4367E;
	Thu,  6 Aug 2026 09:10:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7047D1F01559;
	Thu,  6 Aug 2026 09:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786007434;
	bh=gQ8zq70y0787azP95WYE6ddYaI5CvHh9/VpExmEvz+w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hrlYiL6AUHSwVsGrZy5BQKpHYGfFiVMP+eiN1kClFvgN7Hy2nKce9wuEa5tJDtsDQ
	 xNxbyoL+N0ycBsX4at6VXk9WEnX6CMrKjrIL1FRn8vLrpm0HIdTgK52fvnsE82/3bN
	 q79LKl4awvIPHZCILgwY34u8eqgpE4ODq44vrQmVx/z5RMrbFV+a0GMYJNELSCG0Lk
	 jC1eQ6qH6pPNij5jKlFAW31JGGFp79LxMSqh/9ngbWVovbxNgtE6t0CdaVBaAscljO
	 jJDD7R9QoewanwYAcoDcIv4epE+s9loQdE8lRSM0LbC0xh6eLx5soNvMsADZ7zR1rg
	 cd57302UT8qNw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wru7U-0000000CtHi-2vCZ;
	Thu, 06 Aug 2026 09:10:32 +0000
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
	stable@vger.kernel.org
Subject: [PATCH v2 4/8] KVM: arm64: Correctly handle end of VA space TLBI invalidation
Date: Thu,  6 Aug 2026 10:10:22 +0100
Message-ID: <20260806091026.620700-5-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260806091026.620700-1-maz@kernel.org>
References: <20260806091026.620700-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, fuad.tabba@linux.dev, imv4bel@gmail.com, yaoyuan@linux.alibaba.com, ljs@kernel.org, stable@vger.kernel.org
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

Our TLB invalidation by VA code is based on comparing two ranges,
one defined by the TLB, and one defined by the TLBI instruction.

Each range is defined by a start and a size. However, the way the
comparison is done doesn't account for address rollover, as it
compares an address with (base + size). This works nicely until
this expression represent the last page/block in the TTBR1 VA space,
as the result is a big fat 0. And a failed TLB invalidation.

Rewrite the comparison in a way that is immune to the address
rollover (making the end address inclusive instead of exclusive),
and move this into a common helper that is used by both VA and IPA
invalidations, as suggested by Hyunwoo Kim (although the IPA version
didn't suffer from this particular problem, obviously).

Fixes: 4ffa72ad8f37e ("KVM: arm64: nv: Add S1 TLB invalidation primitive for VNCR_EL2")
Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
Cc: stable@vger.kernel.org
---
 arch/arm64/kvm/nested.c | 43 ++++++++++++++++++-----------------------
 1 file changed, 19 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 27bc7ee4b3382..8a602d074dbb4 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -999,6 +999,20 @@ static void invalidate_vncr(struct vncr_tlb *vt)
 		clear_fixmap(vncr_fixmap(vt->cpu));
 }
 
+static bool vncr_tlb_intersects(struct vncr_tlb *vt, u64 addr,
+				u64 scope_start, u64 scope_size)
+{
+	u64 tlb_size, tlb_start, tlb_end, scope_end;
+
+	tlb_size = ttl_to_size(pgshift_level_to_ttl(vt->wi.pgshift, vt->wr.level));
+
+	tlb_start = addr & ~(tlb_size - 1);
+	tlb_end = tlb_start + tlb_size - 1;
+	scope_end = scope_start + scope_size - 1;
+
+	return !(tlb_end < scope_start || tlb_start > scope_end);
+}
+
 /*
  * VNCR TLB invalidation occurs from MMU notifiers or TLBI instructions, and
  * either can race against a vcpu not being onlined yet (no pseudo-TLB
@@ -1021,19 +1035,9 @@ static void kvm_invalidate_vncr_ipa(struct kvm *kvm, u64 start, u64 end)
 	if (!kvm_has_feat(kvm, ID_AA64MMFR4_EL1, NV_frac, NV2_ONLY))
 		return;
 
-	kvm_for_each_vncr_tlb(i, vcpu, vt, kvm) {
-		u64 ipa_start, ipa_end, ipa_size;
-
-		ipa_size = ttl_to_size(pgshift_level_to_ttl(vt->wi.pgshift,
-							    vt->wr.level));
-		ipa_start = vt->wr.pa & ~(ipa_size - 1);
-		ipa_end = ipa_start + ipa_size;
-
-		if (ipa_end <= start || ipa_start >= end)
-			continue;
-
-		invalidate_vncr(vt);
-	}
+	kvm_for_each_vncr_tlb(i, vcpu, vt, kvm)
+		if (vncr_tlb_intersects(vt, vt->wr.pa, start, end - start))
+			invalidate_vncr(vt);
 }
 
 struct s1e2_tlbi_scope {
@@ -1059,28 +1063,19 @@ static void invalidate_vncr_va(struct kvm *kvm,
 	lockdep_assert_held_write(&kvm->mmu_lock);
 
 	kvm_for_each_vncr_tlb(i, vcpu, vt, kvm) {
-		u64 va_start, va_end, va_size;
-
-		va_size = ttl_to_size(pgshift_level_to_ttl(vt->wi.pgshift,
-							   vt->wr.level));
-		va_start = vt->gva & ~(va_size - 1);
-		va_end = va_start + va_size;
-
 		switch (scope->type) {
 		case TLBI_ALL:
 			break;
 
 		case TLBI_VA:
-			if (va_end <= scope->va ||
-			    va_start >= (scope->va + scope->size))
+			if (!vncr_tlb_intersects(vt, vt->gva, scope->va, scope->size))
 				continue;
 			if (vt->wr.nG && vt->wr.asid != scope->asid)
 				continue;
 			break;
 
 		case TLBI_VAA:
-			if (va_end <= scope->va ||
-			    va_start >= (scope->va + scope->size))
+			if (!vncr_tlb_intersects(vt, vt->gva, scope->va, scope->size))
 				continue;
 			break;
 
-- 
2.47.3


