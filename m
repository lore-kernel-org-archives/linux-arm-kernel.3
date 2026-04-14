Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E9DF531DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 00:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jW68GWkLMsFpNYia8DmpjTEtKMhRM1pN73+q2RvUhRg=; b=1jnzUmzTqXmrhCyvlQfI6easFB
	WhbyBVhTzY/E8AelfHcxPwDi1DzYejFpfjAHYPVHdXSggO4htqatonQLpy8L6bmiXwDg43d0De/5Q
	bF6t04xWeKaXeSqh5LRCspRlr//Ut/kJnoCf/vFbL7FQYkZMz7aEfuihrNC2Z+L5sWNByPx8ezaad
	CdXXYZrVylYE2O3vR1ymv1FT//hk26ahlT49GjrXqYGvn1CsPY7xW0jy92YBOnmgW7X87SspXl/KM
	kCJximEWnjGJ91VJBE6RJbGVoMQHonJKMHBTycJLf4uuGRzLw4qNLN4sMGeqKURW1Et7vDpARN+7r
	UiOVQjXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCRGF-0000000GVMf-3Y1i;
	Tue, 14 Apr 2026 00:04:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCRGB-0000000GVJa-0V52
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 00:04:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E24294E2C;
	Mon, 13 Apr 2026 17:03:59 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E68863F7B4;
	Mon, 13 Apr 2026 17:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776125045; bh=rTwPoMoBGibDvIeg7vnDDP5LMIeeRhi6mWL8JuxGNWA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YT8o3hsSFlzjqWp2lvLm6XNX4RQqcecARDcEvZVudE1XIYx4yVik1u2x4Jr5H5wGB
	 sE+q4RhQMznFJMtcxA0nslEDSM/L8r7Jg9NWYFaiGq64Zl5QvExJHolSg7gAONPQR9
	 Wmcaim/glfLIoRfnroudgdJyEOauW6OlhnvRFwlw=
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
Subject: [PATCH v2 3/4] KVM: arm64: nv: Use literal granule size in TLBI range calculation
Date: Tue, 14 Apr 2026 01:03:33 +0100
Message-ID: <20260414000334.3947257-4-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260414000334.3947257-1-weilin.chang@arm.com>
References: <20260414000334.3947257-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_170407_282538_C207CFBE 
X-CRM114-Status: GOOD (  12.43  )
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

TLBI handling derives the invalidation range from guest VTCR_EL2.TG0 in
get_guest_mapping_ttl() and compute_tlb_inval_range(). Switch these to
use a helper that returns the decoded VTCR_EL2.TG0 granule size instead
of decoding it inline.

This keeps the granule size derivation in one place and prepares for
following changes that adjust the effective granule size.

Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
---
 arch/arm64/kvm/nested.c | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 40d52e9100d6..a732d7b0bd5d 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -394,6 +394,11 @@ static unsigned int vtcr_to_tg0_pgshift(u64 vtcr)
 	}
 }
 
+static size_t vtcr_to_tg0_pgsize(u64 vtcr)
+{
+	return BIT(vtcr_to_tg0_pgshift(vtcr));
+}
+
 static void setup_s2_walk(struct kvm_vcpu *vcpu, struct s2_walk_info *wi)
 {
 	u64 vtcr = vcpu_read_sys_reg(vcpu, VTCR_EL2);
@@ -516,20 +521,21 @@ static u8 pgshift_level_to_ttl(u16 shift, u8 level)
  */
 static u8 get_guest_mapping_ttl(struct kvm_s2_mmu *mmu, u64 addr)
 {
-	u64 tmp, sz = 0, vtcr = mmu->tlb_vtcr;
+	u64 tmp, sz = 0;
 	kvm_pte_t pte;
 	u8 ttl, level;
+	size_t tg0_size = vtcr_to_tg0_pgsize(mmu->tlb_vtcr);
 
 	lockdep_assert_held_write(&kvm_s2_mmu_to_kvm(mmu)->mmu_lock);
 
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
@@ -539,19 +545,19 @@ static u8 get_guest_mapping_ttl(struct kvm_s2_mmu *mmu, u64 addr)
 
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
@@ -602,14 +608,14 @@ unsigned long compute_tlb_inval_range(struct kvm_s2_mmu *mmu, u64 val)
 
 	if (!max_size) {
 		/* Compute the maximum extent of the invalidation */
-		switch (FIELD_GET(VTCR_EL2_TG0_MASK, mmu->tlb_vtcr)) {
-		case VTCR_EL2_TG0_4K:
+		switch (vtcr_to_tg0_pgsize(mmu->tlb_vtcr)) {
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


