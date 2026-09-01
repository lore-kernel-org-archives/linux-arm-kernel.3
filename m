Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6626C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 17:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YsgM7llzEfp7Q/Vpqb+6HwpVGIpXC1m5e9H5i/hFJJA=; b=LysuwYE8MoFF5grZsLVYZ2egJ8
	gsB03gcSede4OmJUb0Ei7YX2elmlAAoF2ywuZOdmnkqGcFhlgu341i8zJRkY43LFH6oIUvM2aH7ve
	NMXH/jUsKoJtr21yx1F6LV/eCAf1S/afikOuzgninhrPU+WTQGp0/iyana/eSoB/ntGkyncztw716
	Ze4AY2tNByzso+C26NPlAZ2SxeyE7dLjDcYDYd/RJJQSBlSQL1fZBMDCiuinnjdWuX/UOcbx3R+Os
	xOc+O3WfuqsXsVSYmC22cevN5GirFVr5rYU1wbBFb2WpaW9w8N22qRkrBgNJ5MZxFVLawRvcUYyKO
	+AS1FYvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1S5n-0000000CnJr-1R8A;
	Tue, 01 Sep 2026 17:16:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1S5h-0000000CnDr-31iH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 17:16:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CAE71BD0;
	Tue,  1 Sep 2026 10:16:02 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2E8B13F7D8;
	Tue,  1 Sep 2026 10:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788282966; bh=D3HeJ7zjz9bBhOtcqSqLw8x6tNR/CWKmRK3aKt2UT4w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KggqkEEg8p9v2mh/x9AFk+GPbtf3DwwbME9qdyDpScThwx++GnH9rv9MD8UwRDYqw
	 T8tGo76TcFcmjjPQ7qS1PmqfXf8lJTMtjp42ppG9ouhLXDHh7R8NVFNalmysteoabd
	 S2jFJESf4rR/GEKTOoEsPe4Fzcg94z9UJVWQXakE=
From: Leonardo Bras <leo.bras@arm.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Leonardo Bras <leo.bras@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Tian Zheng <zhengtian10@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/5] KVM: arm64: pgtables: Change write bit from S2AP_W to DBM
Date: Tue,  1 Sep 2026 18:15:52 +0100
Message-ID: <20260901171558.2674031-2-leo.bras@arm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901171558.2674031-1-leo.bras@arm.com>
References: <20260901171558.2674031-1-leo.bras@arm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6188; i=leo.bras@arm.com; h=from:subject; bh=D3HeJ7zjz9bBhOtcqSqLw8x6tNR/CWKmRK3aKt2UT4w=; b=owGbwMvMwCX2pizjszvTwvWMp9WSGLKms83V/vPEZoZpvvwUr0vH8xb8lFda+eXEJzeVxpktW xXuFKg87ChlYRDjYpAVU2SRfTR/Fc/3KRlHrvxYADOHlQlkCAMXpwBM5M4jhn+ayjqvDPqZxZ7d 3sorJr3hyZGpes0/+BJf87s9N8kyWK3LyPBb5DvH383uV07c1NWbf75EaO7vQhEP66juXZNb539 lCGEAAA==
X-Developer-Key: i=leo.bras@arm.com; a=openpgp; fpr=36E6C95AE0F111CC5B6F4D2E688C33F8A0C5B0C5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_101609_873050_95A757EB 
X-CRM114-Status: GOOD (  18.56  )
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

As a first step of changing the encoding for the Stage2 PTE descriptor,
introduce the DBM bit, and adapt every usage of writable to use the DBM bit
(51) instead of S2AP[1]/Dirty bit (7).

For this step, we convert usages of RW(Dirty) -> WD(DBM|Dirty).

Signed-off-by: Leonardo Bras <leo.bras@arm.com>
---
 arch/arm64/include/asm/kvm_pgtable.h | 3 +++
 arch/arm64/kvm/hyp/pgtable.c         | 8 +++++---
 arch/arm64/kvm/nested.c              | 4 +++-
 arch/arm64/kvm/ptdump.c              | 4 ++--
 4 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 41a8687938eb..37baa86d6fd8 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -86,24 +86,27 @@ typedef u64 kvm_pte_t;
 #define KVM_PTE_LEAF_ATTR_HI		GENMASK(63, 50)
 
 #define KVM_PTE_LEAF_ATTR_HI_SW		GENMASK(58, 55)
 
 #define KVM_PTE_LEAF_ATTR_HI_S1_XN	BIT(54)
 #define KVM_PTE_LEAF_ATTR_HI_S1_UXN	BIT(54)
 #define KVM_PTE_LEAF_ATTR_HI_S1_PXN	BIT(53)
 
 #define KVM_PTE_LEAF_ATTR_HI_S2_XN	GENMASK(54, 53)
 
+#define KVM_PTE_LEAF_ATTR_HI_S2_DBM	BIT(51)
+
 #define KVM_PTE_LEAF_ATTR_HI_S1_GP	BIT(50)
 
 #define KVM_PTE_LEAF_ATTR_S2_PERMS	(KVM_PTE_LEAF_ATTR_LO_S2_S2AP_R | \
 					 KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W | \
+					 KVM_PTE_LEAF_ATTR_HI_S2_DBM | \
 					 KVM_PTE_LEAF_ATTR_HI_S2_XN)
 
 /* pKVM invalid pte encodings */
 #define KVM_INVALID_PTE_TYPE_MASK	GENMASK(63, 60)
 #define KVM_INVALID_PTE_ANNOT_MASK	~(KVM_PTE_VALID | \
 					  KVM_INVALID_PTE_TYPE_MASK)
 
 enum kvm_invalid_pte_type {
 	/*
 	 * Used to indicate a pte for which a 'break-before-make'
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index b74dd5ce1efd..ca49f1bd7c34 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -725,42 +725,43 @@ static int stage2_set_prot_attr(struct kvm_pgtable *pgt, enum kvm_pgtable_prot p
 	}
 
 	r = stage2_set_xn_attr(prot, &attr);
 	if (r)
 		return r;
 
 	if (prot & KVM_PGTABLE_PROT_R)
 		attr |= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_R;
 
 	if (prot & KVM_PGTABLE_PROT_W)
-		attr |= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W;
+		attr |= KVM_PTE_LEAF_ATTR_HI_S2_DBM | KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W;
+
 
 	if (!kvm_lpa2_is_enabled())
 		attr |= FIELD_PREP(KVM_PTE_LEAF_ATTR_LO_S2_SH, sh);
 
 	attr |= KVM_PTE_LEAF_ATTR_LO_S2_AF;
 	attr |= prot & KVM_PTE_LEAF_ATTR_HI_SW;
 	*ptep = attr;
 
 	return 0;
 }
 
 enum kvm_pgtable_prot kvm_pgtable_stage2_pte_prot(kvm_pte_t pte)
 {
 	enum kvm_pgtable_prot prot = pte & KVM_PTE_LEAF_ATTR_HI_SW;
 
 	if (!kvm_pte_valid(pte))
 		return prot;
 
 	if (pte & KVM_PTE_LEAF_ATTR_LO_S2_S2AP_R)
 		prot |= KVM_PGTABLE_PROT_R;
-	if (pte & KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W)
+	if (pte & KVM_PTE_LEAF_ATTR_HI_S2_DBM)
 		prot |= KVM_PGTABLE_PROT_W;
 
 	switch (FIELD_GET(KVM_PTE_LEAF_ATTR_HI_S2_XN, pte)) {
 	case 0b00:
 		prot |= KVM_PGTABLE_PROT_PX | KVM_PGTABLE_PROT_UX;
 		break;
 	case 0b01:
 		prot |= KVM_PGTABLE_PROT_UX;
 		break;
 	case 0b11:
@@ -1281,20 +1282,21 @@ static int stage2_update_leaf_attrs(struct kvm_pgtable *pgt, u64 addr,
 		*orig_pte = data.pte;
 
 	if (level)
 		*level = data.level;
 	return 0;
 }
 
 int kvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size)
 {
 	return stage2_update_leaf_attrs(pgt, addr, size, 0,
+					KVM_PTE_LEAF_ATTR_HI_S2_DBM |
 					KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W,
 					NULL, NULL,
 					KVM_PGTABLE_WALK_IGNORE_EAGAIN);
 }
 
 void kvm_pgtable_stage2_mkyoung(struct kvm_pgtable *pgt, u64 addr,
 				enum kvm_pgtable_walk_flags flags)
 {
 	int ret;
 
@@ -1361,21 +1363,21 @@ int kvm_pgtable_stage2_relax_perms(struct kvm_pgtable *pgt, u64 addr,
 	s8 level;
 	int ret;
 
 	if (prot & KVM_PTE_LEAF_ATTR_HI_SW)
 		return -EINVAL;
 
 	if (prot & KVM_PGTABLE_PROT_R)
 		set |= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_R;
 
 	if (prot & KVM_PGTABLE_PROT_W)
-		set |= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W;
+		set |= KVM_PTE_LEAF_ATTR_HI_S2_DBM | KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W;
 
 	if (prot & KVM_PGTABLE_PROT_X) {
 		ret = stage2_set_xn_attr(prot, &xn);
 		if (ret)
 			return ret;
 
 		set |= xn & KVM_PTE_LEAF_ATTR_HI_S2_XN;
 		clr |= ~xn & KVM_PTE_LEAF_ATTR_HI_S2_XN;
 	}
 
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 17123f0b6dab..eb8dfffc32c7 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -379,21 +379,23 @@ static int walk_nested_s2_pgd(struct kvm_vcpu *vcpu, phys_addr_t ipa,
 	}
 
 	addr_bottom += contiguous_bit_shift(desc, wi, level);
 
 	/* Calculate and return the result */
 	paddr = (desc & GENMASK_ULL(47, addr_bottom)) |
 		(ipa & GENMASK_ULL(addr_bottom - 1, 0));
 	out->output = paddr;
 	out->block_size = 1UL << ((3 - level) * stride + wi->pgshift);
 	out->readable = desc & KVM_PTE_LEAF_ATTR_LO_S2_S2AP_R;
-	out->writable = desc & KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W;
+	/* Takes care of both RO/RW and RO/WC/WD encodings */
+	out->writable = desc & (KVM_PTE_LEAF_ATTR_HI_S2_DBM |
+				KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W);
 	out->level = level;
 	out->desc = desc;
 	return 0;
 }
 
 #define _has_tgran_2(__r, __sz)						\
 	({								\
 		u64 _s1, _s2, _mmfr0 = __r;				\
 									\
 		_s2 = SYS_FIELD_GET(ID_AA64MMFR0_EL1,			\
diff --git a/arch/arm64/kvm/ptdump.c b/arch/arm64/kvm/ptdump.c
index 69899797dbad..b0cb8d84a9e9 100644
--- a/arch/arm64/kvm/ptdump.c
+++ b/arch/arm64/kvm/ptdump.c
@@ -33,22 +33,22 @@ static const struct ptdump_prot_bits stage2_pte_bits[] = {
 		.set	= " ",
 		.clear	= "F",
 	},
 	{
 		.mask	= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_R,
 		.val	= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_R,
 		.set	= "R",
 		.clear	= " ",
 	},
 	{
-		.mask	= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W,
-		.val	= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W,
+		.mask	= KVM_PTE_LEAF_ATTR_HI_S2_DBM,
+		.val	= KVM_PTE_LEAF_ATTR_HI_S2_DBM,
 		.set	= "W",
 		.clear	= " ",
 	},
 	{
 		.mask	= KVM_PTE_LEAF_ATTR_HI_S2_XN,
 		.val	= 0b00UL << __bf_shf(KVM_PTE_LEAF_ATTR_HI_S2_XN),
 		.set	= "px ux ",
 	},
 	{
 		.mask	= KVM_PTE_LEAF_ATTR_HI_S2_XN,
-- 
2.55.0


