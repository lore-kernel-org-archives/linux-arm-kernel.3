Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20FA5D3C937
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 17:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iPzTI+T0UetyG/5J3mWfUSOAuj0bf67slVO4u0Lvhlc=; b=eacqXepNvID3RzUHh6oNOw1KFQ
	3MLo/7btbb4vdDb380ey20DbJhaYz+BSFfaokTgkolL55F6cNdMWQdd3vW6M4zfpiuHO06faMGLpI
	imsQ004DZDx+4lDkdX6cMJEKSy9VnHc12WxjWg/iTH6nW2nOb7JzCRSv6Zm92q2gifx9SD/OFlDgk
	Wq5COY8XEDi4lutOUaR9cdTr8KLunJuH8RLGb1Nsrpvc8TrwFSSUVtVHvakhdeGe/x2iN50rBRtHh
	1Irq1qrkEdUZpb9rl4V3+T2FE50/YpYPlbtCXEd2JE243Vukp8pVrwazRv6tzZ3hD17M/8gOnR5zE
	k59bd8eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTO1Q-0000000FhIT-0adN;
	Wed, 10 Dec 2025 17:30:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTO1K-0000000FhDy-0DHy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 17:30:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6CDA0443AA;
	Wed, 10 Dec 2025 17:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2290BC116B1;
	Wed, 10 Dec 2025 17:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765387833;
	bh=YNeiEYXXnONH3KX01TXKGJOYIDSF+XnrqU33OA0zSVk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=To5SnuUMUQtwOWocBW2EVT2DWpNVIDnjs5d4U0Aj9ppV/rcyBNgPn3+X41fynBwul
	 rZw99+FEXm/lTFmb7RgTYaUjj++5uFM6YnyoYnAkKgnv2rvKruYmcHTlg1LcIeQXXk
	 ifKkfW8YCCRxEIKvp4Eb56WWnW6xm+UHJIZAPv27QThahX98jJpsigQFUR3Bxn4RMq
	 Q6Ft6uZRMO9rVHYtkLgnVsvPaKw8PGrRX09pYuD8IOMaNSa6BHfRZhSnOGaiGg28KF
	 ZFeI9OBk3C1k3FkRPL7F54MFmCTvJhR5s30tiF5MS0Kc414rWzhSwSxjKQBH1rvVW/
	 s9A1Zip24I24g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vTO1H-0000000BnnB-190W;
	Wed, 10 Dec 2025 17:30:31 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Sebastian Ene <sebastianene@google.com>
Subject: [PATCH v2 4/6] KVM: arm64: Account for RES1 bits in DECLARE_FEAT_MAP() and co
Date: Wed, 10 Dec 2025 17:30:22 +0000
Message-ID: <20251210173024.561160-5-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251210173024.561160-1-maz@kernel.org>
References: <20251210173024.561160-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, alexandru.elisei@arm.com, Sascha.Bischoff@arm.com, qperret@google.com, tabba@google.com, sebastianene@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_093034_149104_44A5CE47 
X-CRM114-Status: GOOD (  20.70  )
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

None of the registers we manage in the feature dependency infrastructure
so far has any RES1 bit. This is about to change, as VTCR_EL2 has
its bit 31 being RES1.

In order to not fail the consistency checks by not describing a bit,
add RES1 bits to the set of immutable bits. This requires some extra
surgery for the FGT handling, as we now need to track RES1 bits there
as well.

There are no RES1 FGT bits *yet*. Watch this space.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h |  1 +
 arch/arm64/kvm/config.c           | 25 +++++++-------
 arch/arm64/kvm/emulate-nested.c   | 55 +++++++++++++++++--------------
 3 files changed, 45 insertions(+), 36 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index ac7f970c78830..b552a1e03848c 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -638,6 +638,7 @@ struct fgt_masks {
 	u64		mask;
 	u64		nmask;
 	u64		res0;
+	u64		res1;
 };
 
 extern struct fgt_masks hfgrtr_masks;
diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index 24bb3f36e9d59..3845b188551b6 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -16,14 +16,14 @@
  */
 struct reg_bits_to_feat_map {
 	union {
-		u64	bits;
-		u64	*res0p;
+		u64		 bits;
+		struct fgt_masks *masks;
 	};
 
 #define	NEVER_FGU	BIT(0)	/* Can trap, but never UNDEF */
 #define	CALL_FUNC	BIT(1)	/* Needs to evaluate tons of crap */
 #define	FIXED_VALUE	BIT(2)	/* RAZ/WI or RAO/WI in KVM */
-#define	RES0_POINTER	BIT(3)	/* Pointer to RES0 value instead of bits */
+#define	MASKS_POINTER	BIT(3)	/* Pointer to fgt_masks struct instead of bits */
 
 	unsigned long	flags;
 
@@ -92,8 +92,8 @@ struct reg_feat_map_desc {
 #define NEEDS_FEAT_FIXED(m, ...)			\
 	__NEEDS_FEAT_FLAG(m, FIXED_VALUE, bits, __VA_ARGS__, 0)
 
-#define NEEDS_FEAT_RES0(p, ...)				\
-	__NEEDS_FEAT_FLAG(p, RES0_POINTER, res0p, __VA_ARGS__)
+#define NEEDS_FEAT_MASKS(p, ...)				\
+	__NEEDS_FEAT_FLAG(p, MASKS_POINTER, masks, __VA_ARGS__)
 
 /*
  * Declare the dependency between a set of bits and a set of features,
@@ -109,19 +109,20 @@ struct reg_feat_map_desc {
 #define DECLARE_FEAT_MAP(n, r, m, f)					\
 	struct reg_feat_map_desc n = {					\
 		.name			= #r,				\
-		.feat_map		= NEEDS_FEAT(~r##_RES0, f), 	\
+		.feat_map		= NEEDS_FEAT(~(r##_RES0 |	\
+						       r##_RES1), f),	\
 		.bit_feat_map		= m,				\
 		.bit_feat_map_sz	= ARRAY_SIZE(m),		\
 	}
 
 /*
  * Specialised version of the above for FGT registers that have their
- * RES0 masks described as struct fgt_masks.
+ * RESx masks described as struct fgt_masks.
  */
 #define DECLARE_FEAT_MAP_FGT(n, msk, m, f)				\
 	struct reg_feat_map_desc n = {					\
 		.name			= #msk,				\
-		.feat_map		= NEEDS_FEAT_RES0(&msk.res0, f),\
+		.feat_map		= NEEDS_FEAT_MASKS(&msk, f),	\
 		.bit_feat_map		= m,				\
 		.bit_feat_map_sz	= ARRAY_SIZE(m),		\
 	}
@@ -1168,21 +1169,21 @@ static const DECLARE_FEAT_MAP(mdcr_el2_desc, MDCR_EL2,
 			      mdcr_el2_feat_map, FEAT_AA64EL2);
 
 static void __init check_feat_map(const struct reg_bits_to_feat_map *map,
-				  int map_size, u64 res0, const char *str)
+				  int map_size, u64 resx, const char *str)
 {
 	u64 mask = 0;
 
 	for (int i = 0; i < map_size; i++)
 		mask |= map[i].bits;
 
-	if (mask != ~res0)
+	if (mask != ~resx)
 		kvm_err("Undefined %s behaviour, bits %016llx\n",
-			str, mask ^ ~res0);
+			str, mask ^ ~resx);
 }
 
 static u64 reg_feat_map_bits(const struct reg_bits_to_feat_map *map)
 {
-	return map->flags & RES0_POINTER ? ~(*map->res0p) : map->bits;
+	return map->flags & MASKS_POINTER ? (map->masks->mask | map->masks->nmask) : map->bits;
 }
 
 static void __init check_reg_desc(const struct reg_feat_map_desc *r)
diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 834f13fb1fb7d..75d49f83342a5 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -2105,23 +2105,24 @@ static u32 encoding_next(u32 encoding)
 }
 
 #define FGT_MASKS(__n, __m)						\
-	struct fgt_masks __n = { .str = #__m, .res0 = __m, }
-
-FGT_MASKS(hfgrtr_masks, HFGRTR_EL2_RES0);
-FGT_MASKS(hfgwtr_masks, HFGWTR_EL2_RES0);
-FGT_MASKS(hfgitr_masks, HFGITR_EL2_RES0);
-FGT_MASKS(hdfgrtr_masks, HDFGRTR_EL2_RES0);
-FGT_MASKS(hdfgwtr_masks, HDFGWTR_EL2_RES0);
-FGT_MASKS(hafgrtr_masks, HAFGRTR_EL2_RES0);
-FGT_MASKS(hfgrtr2_masks, HFGRTR2_EL2_RES0);
-FGT_MASKS(hfgwtr2_masks, HFGWTR2_EL2_RES0);
-FGT_MASKS(hfgitr2_masks, HFGITR2_EL2_RES0);
-FGT_MASKS(hdfgrtr2_masks, HDFGRTR2_EL2_RES0);
-FGT_MASKS(hdfgwtr2_masks, HDFGWTR2_EL2_RES0);
+	struct fgt_masks __n = { .str = #__m, .res0 = __m ## _RES0, .res1 = __m ## _RES1 }
+
+FGT_MASKS(hfgrtr_masks, HFGRTR_EL2);
+FGT_MASKS(hfgwtr_masks, HFGWTR_EL2);
+FGT_MASKS(hfgitr_masks, HFGITR_EL2);
+FGT_MASKS(hdfgrtr_masks, HDFGRTR_EL2);
+FGT_MASKS(hdfgwtr_masks, HDFGWTR_EL2);
+FGT_MASKS(hafgrtr_masks, HAFGRTR_EL2);
+FGT_MASKS(hfgrtr2_masks, HFGRTR2_EL2);
+FGT_MASKS(hfgwtr2_masks, HFGWTR2_EL2);
+FGT_MASKS(hfgitr2_masks, HFGITR2_EL2);
+FGT_MASKS(hdfgrtr2_masks, HDFGRTR2_EL2);
+FGT_MASKS(hdfgwtr2_masks, HDFGWTR2_EL2);
 
 static __init bool aggregate_fgt(union trap_config tc)
 {
 	struct fgt_masks *rmasks, *wmasks;
+	u64 rresx, wresx;
 
 	switch (tc.fgt) {
 	case HFGRTR_GROUP:
@@ -2154,24 +2155,27 @@ static __init bool aggregate_fgt(union trap_config tc)
 		break;
 	}
 
+	rresx = rmasks->res0 | rmasks->res1;
+	if (wmasks)
+		wresx = wmasks->res0 | wmasks->res1;
+
 	/*
 	 * A bit can be reserved in either the R or W register, but
 	 * not both.
 	 */
-	if ((BIT(tc.bit) & rmasks->res0) &&
-	    (!wmasks || (BIT(tc.bit) & wmasks->res0)))
+	if ((BIT(tc.bit) & rresx) && (!wmasks || (BIT(tc.bit) & wresx)))
 		return false;
 
 	if (tc.pol)
-		rmasks->mask |= BIT(tc.bit) & ~rmasks->res0;
+		rmasks->mask |= BIT(tc.bit) & ~rresx;
 	else
-		rmasks->nmask |= BIT(tc.bit) & ~rmasks->res0;
+		rmasks->nmask |= BIT(tc.bit) & ~rresx;
 
 	if (wmasks) {
 		if (tc.pol)
-			wmasks->mask |= BIT(tc.bit) & ~wmasks->res0;
+			wmasks->mask |= BIT(tc.bit) & ~wresx;
 		else
-			wmasks->nmask |= BIT(tc.bit) & ~wmasks->res0;
+			wmasks->nmask |= BIT(tc.bit) & ~wresx;
 	}
 
 	return true;
@@ -2180,7 +2184,6 @@ static __init bool aggregate_fgt(union trap_config tc)
 static __init int check_fgt_masks(struct fgt_masks *masks)
 {
 	unsigned long duplicate = masks->mask & masks->nmask;
-	u64 res0 = masks->res0;
 	int ret = 0;
 
 	if (duplicate) {
@@ -2194,10 +2197,14 @@ static __init int check_fgt_masks(struct fgt_masks *masks)
 		ret = -EINVAL;
 	}
 
-	masks->res0 = ~(masks->mask | masks->nmask);
-	if (masks->res0 != res0)
-		kvm_info("Implicit %s = %016llx, expecting %016llx\n",
-			 masks->str, masks->res0, res0);
+	if ((masks->res0 | masks->res1 | masks->mask | masks->nmask) != GENMASK(63, 0) ||
+	    (masks->res0 & masks->res1)  || (masks->res0 & masks->mask) ||
+	    (masks->res0 & masks->nmask) || (masks->res1 & masks->mask)  ||
+	    (masks->res1 & masks->nmask) || (masks->mask & masks->nmask)) {
+		kvm_info("Inconsistent masks for %s (%016llx, %016llx, %016llx, %016llx)\n",
+			 masks->str, masks->res0, masks->res1, masks->mask, masks->nmask);
+		masks->res0 = ~(masks->res1 | masks->mask | masks->nmask);
+	}
 
 	return ret;
 }
-- 
2.47.3


