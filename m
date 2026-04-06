Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D623F46C59
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 16:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LDOZzVACRpk870DMS0PueiOkVfgKs1fF2gSkFnO1hkc=; b=YCcKQbvWjwdO9XiP1wEpKtUfaY
	7bm/lxfCAnYyO4tasS9xVCLeQhmJsH76vvKKmuIEheVOu+LrxjYi0obzMaZe5+6GNC5BVJOkKpW39
	hFaUzgbZ6523ZNTGFd5eGZXFdrreV0zhOflrpW4W06wjluPaetOsJTOM4y5QsneMzqQf0ZPxIm3Xi
	TutWpUx1IBCj5zKWRK9Y03fYqWQbtTlpvU1muBDSxlZkZ7/E+vDbzuhu6q1OzMCXTI1ASAYWgEm3i
	siH5H0v/H5E6GAEaWKZZbScneQ5b04DztfXQ3Pt7GggnkhhXd42ZTYcE163tX+CTR7S7TN1KDe1DZ
	4ACbSE0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9n6p-00000005KiC-0O04;
	Mon, 06 Apr 2026 16:47:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9n6n-00000005KhY-0hlI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 16:47:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6264F175A;
	Mon,  6 Apr 2026 09:47:20 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8DCF03F7D8;
	Mon,  6 Apr 2026 09:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775494046; bh=RjyP2D1fTKruhCbxtZ3oeTYzHGWYyMJK78WSAjXluj0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WxFfwS1w80wr9zICsTMC6J+JNpju8crtP2jCoeyfELyI+XLJzpF9CY1Iu8T12pbkr
	 06ndLBLhnS3f2xIt/TI6JwRxbfAcAD49mtHEdq3TzA5su0G+QDzKnmUAg/AYr5k0XZ
	 t6TXPDEh0cmLkoTN0yxknXHdBBxX7U8uxM0W8M2k=
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
Subject: [PATCH 1/2] KVM: arm64: Factor out TG0/1 decoding of VTCR and TCR
Date: Mon,  6 Apr 2026 17:46:17 +0100
Message-ID: <20260406164618.3312473-2-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260406164618.3312473-1-weilin.chang@arm.com>
References: <20260406164618.3312473-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_094729_286618_22A70F14 
X-CRM114-Status: GOOD (  15.44  )
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

The current code decodes TCR.TG0/TG1 and VTCR.TG0 inline at several
places. Extract this logic into helpers so the granule size is derived
in one place. This enables us to alter the effective granule size in
the same place, which we will need in a later patch.

Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
---
 arch/arm64/kvm/at.c     | 73 +++++++++++++++++++++++++----------------
 arch/arm64/kvm/nested.c | 70 ++++++++++++++++++++++++---------------
 2 files changed, 89 insertions(+), 54 deletions(-)

diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index c5c5644b1878..ff8ba30e917b 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -135,14 +135,54 @@ static void compute_s1poe(struct kvm_vcpu *vcpu, struct s1_walk_info *wi)
 	wi->e0poe = (wi->regime != TR_EL2) && (val & TCR2_EL1_E0POE);
 }
 
+static unsigned int tg0_to_shift(u64 tg0)
+{
+	switch (tg0) {
+	case TCR_EL1_TG0_4K:
+		return 12;
+	case TCR_EL1_TG0_16K:
+		return 14;
+	case TCR_EL1_TG0_64K:
+	default:	/* IMPDEF: treat any other value as 64k */
+		return 16;
+	}
+}
+
+static unsigned int tg1_to_shift(u64 tg1)
+{
+	switch (tg1) {
+	case TCR_EL1_TG1_4K:
+		return 12;
+	case TCR_EL1_TG1_16K:
+		return 14;
+	case TCR_EL1_TG1_64K:
+	default:	/* IMPDEF: treat any other value as 64k */
+		return 16;
+	}
+}
+
+static u64 tcr_tg_shift(struct kvm *kvm, u64 tcr, bool upper_range)
+{
+	unsigned int shift;
+
+	/* Someone was silly enough to encode TG0/TG1 differently */
+	if (upper_range)
+		shift = tg1_to_shift(FIELD_GET(TCR_EL1_TG1_MASK, tcr));
+	else
+		shift = tg0_to_shift(FIELD_GET(TCR_EL1_TG0_MASK, tcr));
+
+	return shift;
+}
+
 static int setup_s1_walk(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
 			 struct s1_walk_result *wr, u64 va)
 {
-	u64 hcr, sctlr, tcr, tg, ps, ia_bits, ttbr;
+	u64 hcr, sctlr, tcr, ps, ia_bits, ttbr;
 	unsigned int stride, x;
-	bool va55, tbi, lva;
+	bool va55, tbi, lva, upper_range;
 
 	va55 = va & BIT(55);
+	upper_range = va55 && wi->regime != TR_EL2;
 
 	if (vcpu_has_nv(vcpu)) {
 		hcr = __vcpu_sys_reg(vcpu, HCR_EL2);
@@ -173,35 +213,12 @@ static int setup_s1_walk(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
 		BUG();
 	}
 
-	/* Someone was silly enough to encode TG0/TG1 differently */
-	if (va55 && wi->regime != TR_EL2) {
+	if (upper_range)
 		wi->txsz = FIELD_GET(TCR_T1SZ_MASK, tcr);
-		tg = FIELD_GET(TCR_TG1_MASK, tcr);
-
-		switch (tg << TCR_TG1_SHIFT) {
-		case TCR_TG1_4K:
-			wi->pgshift = 12;	 break;
-		case TCR_TG1_16K:
-			wi->pgshift = 14;	 break;
-		case TCR_TG1_64K:
-		default:	    /* IMPDEF: treat any other value as 64k */
-			wi->pgshift = 16;	 break;
-		}
-	} else {
+	else
 		wi->txsz = FIELD_GET(TCR_T0SZ_MASK, tcr);
-		tg = FIELD_GET(TCR_TG0_MASK, tcr);
-
-		switch (tg << TCR_TG0_SHIFT) {
-		case TCR_TG0_4K:
-			wi->pgshift = 12;	 break;
-		case TCR_TG0_16K:
-			wi->pgshift = 14;	 break;
-		case TCR_TG0_64K:
-		default:	    /* IMPDEF: treat any other value as 64k */
-			wi->pgshift = 16;	 break;
-		}
-	}
 
+	wi->pgshift = tcr_tg_shift(vcpu->kvm, tcr, upper_range);
 	wi->pa52bit = has_52bit_pa(vcpu, wi, tcr);
 
 	ia_bits = get_ia_size(wi);
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 883b6c1008fb..2bfab3007cb3 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -378,20 +378,36 @@ static int walk_nested_s2_pgd(struct kvm_vcpu *vcpu, phys_addr_t ipa,
 	return 0;
 }
 
-static void vtcr_to_walk_info(u64 vtcr, struct s2_walk_info *wi)
+static unsigned int tg0_to_shift(u64 tg0)
+{
+	switch (tg0) {
+	case VTCR_EL2_TG0_4K:
+		return 12;
+	case VTCR_EL2_TG0_16K:
+		return 14;
+	case VTCR_EL2_TG0_64K:
+	default:	/* IMPDEF: treat any other value as 64k */
+		return 16;
+	}
+}
+
+static u64 vtcr_tg0_shift(struct kvm *kvm, u64 vtcr)
+{
+	u64 tg0 = FIELD_GET(VTCR_EL2_TG0_MASK, vtcr);
+	unsigned int shift = tg0_to_shift(tg0);
+
+	return shift;
+}
+
+static size_t vtcr_tg0_size(struct kvm *kvm, u64 vtcr)
+{
+	return BIT(vtcr_tg0_shift(kvm, vtcr));
+}
+
+static void vtcr_to_walk_info(struct kvm *kvm, u64 vtcr, struct s2_walk_info *wi)
 {
 	wi->t0sz = vtcr & TCR_EL2_T0SZ_MASK;
-
-	switch (FIELD_GET(VTCR_EL2_TG0_MASK, vtcr)) {
-	case VTCR_EL2_TG0_4K:
-		wi->pgshift = 12;	 break;
-	case VTCR_EL2_TG0_16K:
-		wi->pgshift = 14;	 break;
-	case VTCR_EL2_TG0_64K:
-	default:	    /* IMPDEF: treat any other value as 64k */
-		wi->pgshift = 16;	 break;
-	}
-
+	wi->pgshift = vtcr_tg0_shift(kvm, vtcr);
 	wi->sl = FIELD_GET(VTCR_EL2_SL0_MASK, vtcr);
 	/* Global limit for now, should eventually be per-VM */
 	wi->max_oa_bits = min(get_kvm_ipa_limit(),
@@ -414,7 +430,7 @@ int kvm_walk_nested_s2(struct kvm_vcpu *vcpu, phys_addr_t gipa,
 
 	wi.baddr = vcpu_read_sys_reg(vcpu, VTTBR_EL2);
 
-	vtcr_to_walk_info(vtcr, &wi);
+	vtcr_to_walk_info(vcpu->kvm, vtcr, &wi);
 
 	wi.be = vcpu_read_sys_reg(vcpu, SCTLR_EL2) & SCTLR_ELx_EE;
 
@@ -515,17 +531,19 @@ static u8 get_guest_mapping_ttl(struct kvm_s2_mmu *mmu, u64 addr)
 	u64 tmp, sz = 0, vtcr = mmu->tlb_vtcr;
 	kvm_pte_t pte;
 	u8 ttl, level;
+	struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
+	size_t tg0_size = vtcr_tg0_size(kvm, vtcr);
 
-	lockdep_assert_held_write(&kvm_s2_mmu_to_kvm(mmu)->mmu_lock);
+	lockdep_assert_held_write(&kvm->mmu_lock);
 
-	switch (FIELD_GET(VTCR_EL2_TG0_MASK, vtcr)) {
-	case VTCR_EL2_TG0_4K:
+	switch (tg0_size) {
+	case SZ_4K:
 		ttl = (TLBI_TTL_TG_4K << 2);
 		break;
-	case VTCR_EL2_TG0_16K:
+	case SZ_16K:
 		ttl = (TLBI_TTL_TG_16K << 2);
 		break;
-	case VTCR_EL2_TG0_64K:
+	case SZ_64K:
 	default:	    /* IMPDEF: treat any other value as 64k */
 		ttl = (TLBI_TTL_TG_64K << 2);
 		break;
@@ -535,19 +553,19 @@ static u8 get_guest_mapping_ttl(struct kvm_s2_mmu *mmu, u64 addr)
 
 again:
 	/* Iteratively compute the block sizes for a particular granule size */
-	switch (FIELD_GET(VTCR_EL2_TG0_MASK, vtcr)) {
-	case VTCR_EL2_TG0_4K:
+	switch (tg0_size) {
+	case SZ_4K:
 		if	(sz < SZ_4K)	sz = SZ_4K;
 		else if (sz < SZ_2M)	sz = SZ_2M;
 		else if (sz < SZ_1G)	sz = SZ_1G;
 		else			sz = 0;
 		break;
-	case VTCR_EL2_TG0_16K:
+	case SZ_16K:
 		if	(sz < SZ_16K)	sz = SZ_16K;
 		else if (sz < SZ_32M)	sz = SZ_32M;
 		else			sz = 0;
 		break;
-	case VTCR_EL2_TG0_64K:
+	case SZ_64K:
 	default:	    /* IMPDEF: treat any other value as 64k */
 		if	(sz < SZ_64K)	sz = SZ_64K;
 		else if (sz < SZ_512M)	sz = SZ_512M;
@@ -598,14 +616,14 @@ unsigned long compute_tlb_inval_range(struct kvm_s2_mmu *mmu, u64 val)
 
 	if (!max_size) {
 		/* Compute the maximum extent of the invalidation */
-		switch (FIELD_GET(VTCR_EL2_TG0_MASK, mmu->tlb_vtcr)) {
-		case VTCR_EL2_TG0_4K:
+		switch (vtcr_tg0_size(kvm, mmu->tlb_vtcr)) {
+		case SZ_4K:
 			max_size = SZ_1G;
 			break;
-		case VTCR_EL2_TG0_16K:
+		case SZ_16K:
 			max_size = SZ_32M;
 			break;
-		case VTCR_EL2_TG0_64K:
+		case SZ_64K:
 		default:    /* IMPDEF: treat any other value as 64k */
 			/*
 			 * No, we do not support 52bit IPA in nested yet. Once
-- 
2.43.0


