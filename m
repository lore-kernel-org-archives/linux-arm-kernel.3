Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F10BE63C8C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 18:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2tns6S3I7nuAsAxqYBJ2IjP6/s2UtSsJ9ECq6HdadWc=; b=lu8YoiNqrV4D7EwDtlo57vvZCV
	Ob8ooqLCtS9VjSD609VPl1xVGAHatUmNGqxIpbYYWGDLyVz0GVk/dn+Rd6gLFiwdVzAdbYiEXL5V2
	SUCQ2P6uXcHo4BE5ZYtr8omBjq9kHlCmjOpIq7Dc2tfFQUJj1N6ltZS047ZsjcrihhDL+m8LWLdHg
	JaKxX2LX2MLeGVVKNW70K9QrMeTZz5KBe0kvfwzCJC8R1RHiW0ZUrGUwa4VwurMj7tlNrPyJRmVlC
	X9r3q9BgJUEQ2avP+x+gm9DI1alNt4pj/f0c7nC6AgkPlcSEbTJrCNBXApOWDSq3S0eg5Q44h0hAa
	XySIQ1SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmytn-00000005R5Z-1gva;
	Mon, 02 Feb 2026 18:43:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmyti-00000005Qxp-1Ctk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 18:43:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D81294437B;
	Mon,  2 Feb 2026 18:43:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71F06C19425;
	Mon,  2 Feb 2026 18:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770057821;
	bh=vXt3dkdSDLwNJz60xaHrqFHIWoy2bX5H2+VkPtnYxjo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fMan6MiZXjcO/g45FnuqlRlbn0UT96tPZQ986xoaDp2lNbU/m7I0yOyG0aoAcewh7
	 sKoKgMYYouLVEeeEjOiUGG+iPLa8ABRkKQFtHuXaIxfJtVzEnoTQdnCuIJowocW5K8
	 h2XBWEvGqtgi3bTSjba3aZEZRdqnxyiamAeZ51CuLNOVMXSfCfyoER3aOEBnF1kCMk
	 9fM+zLSjMEuh+Pof0a3At6NINDjKjWf90Y56SBejD3MEnZEscJSwR8+/cBFXakDvqH
	 9C+FFVFFt68tyowMsTtAW5CvgJ7eUzpUzf35cfDhi4a/cdBdGBU4CSJoP5JOwpD4ty
	 MkUkest3ubVEg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vmytf-00000007sAy-2apD;
	Mon, 02 Feb 2026 18:43:39 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH v2 04/20] KVM: arm64: Introduce data structure tracking both RES0 and RES1 bits
Date: Mon,  2 Feb 2026 18:43:13 +0000
Message-ID: <20260202184329.2724080-5-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260202184329.2724080-1-maz@kernel.org>
References: <20260202184329.2724080-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_104342_367187_4AE174E0 
X-CRM114-Status: GOOD (  19.79  )
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

We have so far mostly tracked RES0 bits, but only made a few attempts
at being just as strict for RES1 bits (probably because they are both
rarer and harder to handle).

Start scratching the surface by introducing a data structure tracking
RES0 and RES1 bits at the same time.

Note that contrary to the usual idiom, this structure is mostly passed
around by value -- the ABI handles it nicely, and the resulting code is
much nicer.

Reviewed-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h |  21 ++++-
 arch/arm64/kvm/config.c           | 148 ++++++++++++++++--------------
 arch/arm64/kvm/nested.c           | 129 +++++++++++++-------------
 3 files changed, 160 insertions(+), 138 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index b552a1e03848c..799f494a1349c 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -626,13 +626,24 @@ enum vcpu_sysreg {
 	NR_SYS_REGS	/* Nothing after this line! */
 };
 
+struct resx {
+	u64	res0;
+	u64	res1;
+};
+
 struct kvm_sysreg_masks {
-	struct {
-		u64	res0;
-		u64	res1;
-	} mask[NR_SYS_REGS - __SANITISED_REG_START__];
+	struct resx mask[NR_SYS_REGS - __SANITISED_REG_START__];
 };
 
+static inline void __kvm_set_sysreg_resx(struct kvm_arch *arch,
+					 enum vcpu_sysreg sr, struct resx resx)
+{
+	arch->sysreg_masks->mask[sr - __SANITISED_REG_START__] = resx;
+}
+
+#define kvm_set_sysreg_resx(k, sr, resx)		\
+	__kvm_set_sysreg_resx(&(k)->arch, (sr), (resx))
+
 struct fgt_masks {
 	const char	*str;
 	u64		mask;
@@ -1607,7 +1618,7 @@ static inline bool kvm_arch_has_irq_bypass(void)
 }
 
 void compute_fgu(struct kvm *kvm, enum fgt_group_id fgt);
-void get_reg_fixed_bits(struct kvm *kvm, enum vcpu_sysreg reg, u64 *res0, u64 *res1);
+struct resx get_reg_fixed_bits(struct kvm *kvm, enum vcpu_sysreg reg);
 void check_feature_map(void);
 void kvm_vcpu_load_fgt(struct kvm_vcpu *vcpu);
 
diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index 2122599f7cbbd..2214c06902f86 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -1290,14 +1290,14 @@ static bool idreg_feat_match(struct kvm *kvm, const struct reg_bits_to_feat_map
 	}
 }
 
-static u64 __compute_fixed_bits(struct kvm *kvm,
-				const struct reg_bits_to_feat_map *map,
-				int map_size,
-				u64 *fixed_bits,
-				unsigned long require,
-				unsigned long exclude)
+static struct resx __compute_fixed_bits(struct kvm *kvm,
+					const struct reg_bits_to_feat_map *map,
+					int map_size,
+					u64 *fixed_bits,
+					unsigned long require,
+					unsigned long exclude)
 {
-	u64 val = 0;
+	struct resx resx = {};
 
 	for (int i = 0; i < map_size; i++) {
 		bool match;
@@ -1316,53 +1316,62 @@ static u64 __compute_fixed_bits(struct kvm *kvm,
 			match = idreg_feat_match(kvm, &map[i]);
 
 		if (!match || (map[i].flags & FIXED_VALUE))
-			val |= reg_feat_map_bits(&map[i]);
+			resx.res0 |= reg_feat_map_bits(&map[i]);
 	}
 
-	return val;
+	return resx;
 }
 
-static u64 compute_res0_bits(struct kvm *kvm,
-			     const struct reg_bits_to_feat_map *map,
-			     int map_size,
-			     unsigned long require,
-			     unsigned long exclude)
+static struct resx compute_resx_bits(struct kvm *kvm,
+				     const struct reg_bits_to_feat_map *map,
+				     int map_size,
+				     unsigned long require,
+				     unsigned long exclude)
 {
 	return __compute_fixed_bits(kvm, map, map_size, NULL,
 				    require, exclude | FIXED_VALUE);
 }
 
-static u64 compute_reg_res0_bits(struct kvm *kvm,
-				 const struct reg_feat_map_desc *r,
-				 unsigned long require, unsigned long exclude)
+static struct resx compute_reg_resx_bits(struct kvm *kvm,
+					 const struct reg_feat_map_desc *r,
+					 unsigned long require,
+					 unsigned long exclude)
 {
-	u64 res0;
+	struct resx resx, tmp;
 
-	res0 = compute_res0_bits(kvm, r->bit_feat_map, r->bit_feat_map_sz,
+	resx = compute_resx_bits(kvm, r->bit_feat_map, r->bit_feat_map_sz,
 				 require, exclude);
 
-	res0 |= compute_res0_bits(kvm, &r->feat_map, 1, require, exclude);
-	res0 |= ~reg_feat_map_bits(&r->feat_map);
+	tmp = compute_resx_bits(kvm, &r->feat_map, 1, require, exclude);
+
+	resx.res0 |= tmp.res0;
+	resx.res0 |= ~reg_feat_map_bits(&r->feat_map);
+	resx.res1 |= tmp.res1;
 
-	return res0;
+	return resx;
 }
 
 static u64 compute_fgu_bits(struct kvm *kvm, const struct reg_feat_map_desc *r)
 {
+	struct resx resx;
+
 	/*
 	 * If computing FGUs, we collect the unsupported feature bits as
-	 * RES0 bits, but don't take the actual RES0 bits or register
+	 * RESx bits, but don't take the actual RESx bits or register
 	 * existence into account -- we're not computing bits for the
 	 * register itself.
 	 */
-	return compute_res0_bits(kvm, r->bit_feat_map, r->bit_feat_map_sz,
+	resx = compute_resx_bits(kvm, r->bit_feat_map, r->bit_feat_map_sz,
 				 0, NEVER_FGU);
+
+	return resx.res0 | resx.res1;
 }
 
-static u64 compute_reg_fixed_bits(struct kvm *kvm,
-				  const struct reg_feat_map_desc *r,
-				  u64 *fixed_bits, unsigned long require,
-				  unsigned long exclude)
+static struct resx compute_reg_fixed_bits(struct kvm *kvm,
+					  const struct reg_feat_map_desc *r,
+					  u64 *fixed_bits,
+					  unsigned long require,
+					  unsigned long exclude)
 {
 	return __compute_fixed_bits(kvm, r->bit_feat_map, r->bit_feat_map_sz,
 				    fixed_bits, require | FIXED_VALUE, exclude);
@@ -1405,91 +1414,94 @@ void compute_fgu(struct kvm *kvm, enum fgt_group_id fgt)
 	kvm->arch.fgu[fgt] = val;
 }
 
-void get_reg_fixed_bits(struct kvm *kvm, enum vcpu_sysreg reg, u64 *res0, u64 *res1)
+struct resx get_reg_fixed_bits(struct kvm *kvm, enum vcpu_sysreg reg)
 {
 	u64 fixed = 0, mask;
+	struct resx resx;
 
 	switch (reg) {
 	case HFGRTR_EL2:
-		*res0 = compute_reg_res0_bits(kvm, &hfgrtr_desc, 0, 0);
-		*res1 = HFGRTR_EL2_RES1;
+		resx = compute_reg_resx_bits(kvm, &hfgrtr_desc, 0, 0);
+		resx.res1 |= HFGRTR_EL2_RES1;
 		break;
 	case HFGWTR_EL2:
-		*res0 = compute_reg_res0_bits(kvm, &hfgwtr_desc, 0, 0);
-		*res1 = HFGWTR_EL2_RES1;
+		resx = compute_reg_resx_bits(kvm, &hfgwtr_desc, 0, 0);
+		resx.res1 |= HFGWTR_EL2_RES1;
 		break;
 	case HFGITR_EL2:
-		*res0 = compute_reg_res0_bits(kvm, &hfgitr_desc, 0, 0);
-		*res1 = HFGITR_EL2_RES1;
+		resx = compute_reg_resx_bits(kvm, &hfgitr_desc, 0, 0);
+		resx.res1 |= HFGITR_EL2_RES1;
 		break;
 	case HDFGRTR_EL2:
-		*res0 = compute_reg_res0_bits(kvm, &hdfgrtr_desc, 0, 0);
-		*res1 = HDFGRTR_EL2_RES1;
+		resx = compute_reg_resx_bits(kvm, &hdfgrtr_desc, 0, 0);
+		resx.res1 |= HDFGRTR_EL2_RES1;
 		break;
 	case HDFGWTR_EL2:
-		*res0 = compute_reg_res0_bits(kvm, &hdfgwtr_desc, 0, 0);
-		*res1 = HDFGWTR_EL2_RES1;
+		resx = compute_reg_resx_bits(kvm, &hdfgwtr_desc, 0, 0);
+		resx.res1 |= HDFGWTR_EL2_RES1;
 		break;
 	case HAFGRTR_EL2:
-		*res0 = compute_reg_res0_bits(kvm, &hafgrtr_desc, 0, 0);
-		*res1 = HAFGRTR_EL2_RES1;
+		resx = compute_reg_resx_bits(kvm, &hafgrtr_desc, 0, 0);
+		resx.res1 |= HAFGRTR_EL2_RES1;
 		break;
 	case HFGRTR2_EL2:
-		*res0 = compute_reg_res0_bits(kvm, &hfgrtr2_desc, 0, 0);
-		*res1 = HFGRTR2_EL2_RES1;
+		resx = compute_reg_resx_bits(kvm, &hfgrtr2_desc, 0, 0);
+		resx.res1 |= HFGRTR2_EL2_RES1;
 		break;
 	case HFGWTR2_EL2:
-		*res0 = compute_reg_res0_bits(kvm, &hfgwtr2_desc, 0, 0);
-		*res1 = HFGWTR2_EL2_RES1;
+		resx = compute_reg_resx_bits(kvm, &hfgwtr2_desc, 0, 0);
+		resx.res1 |= HFGWTR2_EL2_RES1;
 		break;
 	case HFGITR2_EL2:
-		*res0 = compute_reg_res0_bits(kvm, &hfgitr2_desc, 0, 0);
-		*res1 = HFGITR2_EL2_RES1;
+		resx = compute_reg_resx_bits(kvm, &hfgitr2_desc, 0, 0);
+		resx.res1 |= HFGITR2_EL2_RES1;
 		break;
 	case HDFGRTR2_EL2:
-		*res0 = compute_reg_res0_bits(kvm, &hdfgrtr2_desc, 0, 0);
-		*res1 = HDFGRTR2_EL2_RES1;
+		resx = compute_reg_resx_bits(kvm, &hdfgrtr2_desc, 0, 0);
+		resx.res1 |= HDFGRTR2_EL2_RES1;
 		break;
 	case HDFGWTR2_EL2:
-		*res0 = compute_reg_res0_bits(kvm, &hdfgwtr2_desc, 0, 0);
-		*res1 = HDFGWTR2_EL2_RES1;
+		resx = compute_reg_resx_bits(kvm, &hdfgwtr2_desc, 0, 0);
+		resx.res1 |= HDFGWTR2_EL2_RES1;
 		break;
 	case HCRX_EL2:
-		*res0 = compute_reg_res0_bits(kvm, &hcrx_desc, 0, 0);
-		*res1 = __HCRX_EL2_RES1;
+		resx = compute_reg_resx_bits(kvm, &hcrx_desc, 0, 0);
+		resx.res1 |= __HCRX_EL2_RES1;
 		break;
 	case HCR_EL2:
-		mask = compute_reg_fixed_bits(kvm, &hcr_desc, &fixed, 0, 0);
-		*res0 = compute_reg_res0_bits(kvm, &hcr_desc, 0, 0);
-		*res0 |= (mask & ~fixed);
-		*res1 = HCR_EL2_RES1 | (mask & fixed);
+		mask = compute_reg_fixed_bits(kvm, &hcr_desc, &fixed, 0, 0).res0;
+		resx = compute_reg_resx_bits(kvm, &hcr_desc, 0, 0);
+		resx.res0 |= (mask & ~fixed);
+		resx.res1 |= HCR_EL2_RES1 | (mask & fixed);
 		break;
 	case SCTLR2_EL1:
 	case SCTLR2_EL2:
-		*res0 = compute_reg_res0_bits(kvm, &sctlr2_desc, 0, 0);
-		*res1 = SCTLR2_EL1_RES1;
+		resx = compute_reg_resx_bits(kvm, &sctlr2_desc, 0, 0);
+		resx.res1 |= SCTLR2_EL1_RES1;
 		break;
 	case TCR2_EL2:
-		*res0 = compute_reg_res0_bits(kvm, &tcr2_el2_desc, 0, 0);
-		*res1 = TCR2_EL2_RES1;
+		resx = compute_reg_resx_bits(kvm, &tcr2_el2_desc, 0, 0);
+		resx.res1 |= TCR2_EL2_RES1;
 		break;
 	case SCTLR_EL1:
-		*res0 = compute_reg_res0_bits(kvm, &sctlr_el1_desc, 0, 0);
-		*res1 = SCTLR_EL1_RES1;
+		resx = compute_reg_resx_bits(kvm, &sctlr_el1_desc, 0, 0);
+		resx.res1 |= SCTLR_EL1_RES1;
 		break;
 	case MDCR_EL2:
-		*res0 = compute_reg_res0_bits(kvm, &mdcr_el2_desc, 0, 0);
-		*res1 = MDCR_EL2_RES1;
+		resx = compute_reg_resx_bits(kvm, &mdcr_el2_desc, 0, 0);
+		resx.res1 |= MDCR_EL2_RES1;
 		break;
 	case VTCR_EL2:
-		*res0 = compute_reg_res0_bits(kvm, &vtcr_el2_desc, 0, 0);
-		*res1 = VTCR_EL2_RES1;
+		resx = compute_reg_resx_bits(kvm, &vtcr_el2_desc, 0, 0);
+		resx.res1 |= VTCR_EL2_RES1;
 		break;
 	default:
 		WARN_ON_ONCE(1);
-		*res0 = *res1 = 0;
+		resx = (typeof(resx)){};
 		break;
 	}
+
+	return resx;
 }
 
 static __always_inline struct fgt_masks *__fgt_reg_to_masks(enum vcpu_sysreg reg)
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 486eba72bb027..c5a45bc62153e 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1683,22 +1683,19 @@ u64 kvm_vcpu_apply_reg_masks(const struct kvm_vcpu *vcpu,
 	return v;
 }
 
-static __always_inline void set_sysreg_masks(struct kvm *kvm, int sr, u64 res0, u64 res1)
+static __always_inline void set_sysreg_masks(struct kvm *kvm, int sr, struct resx resx)
 {
-	int i = sr - __SANITISED_REG_START__;
-
 	BUILD_BUG_ON(!__builtin_constant_p(sr));
 	BUILD_BUG_ON(sr < __SANITISED_REG_START__);
 	BUILD_BUG_ON(sr >= NR_SYS_REGS);
 
-	kvm->arch.sysreg_masks->mask[i].res0 = res0;
-	kvm->arch.sysreg_masks->mask[i].res1 = res1;
+	kvm_set_sysreg_resx(kvm, sr, resx);
 }
 
 int kvm_init_nv_sysregs(struct kvm_vcpu *vcpu)
 {
 	struct kvm *kvm = vcpu->kvm;
-	u64 res0, res1;
+	struct resx resx;
 
 	lockdep_assert_held(&kvm->arch.config_lock);
 
@@ -1711,110 +1708,112 @@ int kvm_init_nv_sysregs(struct kvm_vcpu *vcpu)
 		return -ENOMEM;
 
 	/* VTTBR_EL2 */
-	res0 = res1 = 0;
+	resx = (typeof(resx)){};
 	if (!kvm_has_feat_enum(kvm, ID_AA64MMFR1_EL1, VMIDBits, 16))
-		res0 |= GENMASK(63, 56);
+		resx.res0 |= GENMASK(63, 56);
 	if (!kvm_has_feat(kvm, ID_AA64MMFR2_EL1, CnP, IMP))
-		res0 |= VTTBR_CNP_BIT;
-	set_sysreg_masks(kvm, VTTBR_EL2, res0, res1);
+		resx.res0 |= VTTBR_CNP_BIT;
+	set_sysreg_masks(kvm, VTTBR_EL2, resx);
 
 	/* VTCR_EL2 */
-	get_reg_fixed_bits(kvm, VTCR_EL2, &res0, &res1);
-	set_sysreg_masks(kvm, VTCR_EL2, res0, res1);
+	resx = get_reg_fixed_bits(kvm, VTCR_EL2);
+	set_sysreg_masks(kvm, VTCR_EL2, resx);
 
 	/* VMPIDR_EL2 */
-	res0 = GENMASK(63, 40) | GENMASK(30, 24);
-	res1 = BIT(31);
-	set_sysreg_masks(kvm, VMPIDR_EL2, res0, res1);
+	resx.res0 = GENMASK(63, 40) | GENMASK(30, 24);
+	resx.res1 = BIT(31);
+	set_sysreg_masks(kvm, VMPIDR_EL2, resx);
 
 	/* HCR_EL2 */
-	get_reg_fixed_bits(kvm, HCR_EL2, &res0, &res1);
-	set_sysreg_masks(kvm, HCR_EL2, res0, res1);
+	resx = get_reg_fixed_bits(kvm, HCR_EL2);
+	set_sysreg_masks(kvm, HCR_EL2, resx);
 
 	/* HCRX_EL2 */
-	get_reg_fixed_bits(kvm, HCRX_EL2, &res0, &res1);
-	set_sysreg_masks(kvm, HCRX_EL2, res0, res1);
+	resx = get_reg_fixed_bits(kvm, HCRX_EL2);
+	set_sysreg_masks(kvm, HCRX_EL2, resx);
 
 	/* HFG[RW]TR_EL2 */
-	get_reg_fixed_bits(kvm, HFGRTR_EL2, &res0, &res1);
-	set_sysreg_masks(kvm, HFGRTR_EL2, res0, res1);
-	get_reg_fixed_bits(kvm, HFGWTR_EL2, &res0, &res1);
-	set_sysreg_masks(kvm, HFGWTR_EL2, res0, res1);
+	resx = get_reg_fixed_bits(kvm, HFGRTR_EL2);
+	set_sysreg_masks(kvm, HFGRTR_EL2, resx);
+	resx = get_reg_fixed_bits(kvm, HFGWTR_EL2);
+	set_sysreg_masks(kvm, HFGWTR_EL2, resx);
 
 	/* HDFG[RW]TR_EL2 */
-	get_reg_fixed_bits(kvm, HDFGRTR_EL2, &res0, &res1);
-	set_sysreg_masks(kvm, HDFGRTR_EL2, res0, res1);
-	get_reg_fixed_bits(kvm, HDFGWTR_EL2, &res0, &res1);
-	set_sysreg_masks(kvm, HDFGWTR_EL2, res0, res1);
+	resx = get_reg_fixed_bits(kvm, HDFGRTR_EL2);
+	set_sysreg_masks(kvm, HDFGRTR_EL2, resx);
+	resx = get_reg_fixed_bits(kvm, HDFGWTR_EL2);
+	set_sysreg_masks(kvm, HDFGWTR_EL2, resx);
 
 	/* HFGITR_EL2 */
-	get_reg_fixed_bits(kvm, HFGITR_EL2, &res0, &res1);
-	set_sysreg_masks(kvm, HFGITR_EL2, res0, res1);
+	resx = get_reg_fixed_bits(kvm, HFGITR_EL2);
+	set_sysreg_masks(kvm, HFGITR_EL2, resx);
 
 	/* HAFGRTR_EL2 - not a lot to see here */
-	get_reg_fixed_bits(kvm, HAFGRTR_EL2, &res0, &res1);
-	set_sysreg_masks(kvm, HAFGRTR_EL2, res0, res1);
+	resx = get_reg_fixed_bits(kvm, HAFGRTR_EL2);
+	set_sysreg_masks(kvm, HAFGRTR_EL2, resx);
 
 	/* HFG[RW]TR2_EL2 */
-	get_reg_fixed_bits(kvm, HFGRTR2_EL2, &res0, &res1);
-	set_sysreg_masks(kvm, HFGRTR2_EL2, res0, res1);
-	get_reg_fixed_bits(kvm, HFGWTR2_EL2, &res0, &res1);
-	set_sysreg_masks(kvm, HFGWTR2_EL2, res0, res1);
+	resx = get_reg_fixed_bits(kvm, HFGRTR2_EL2);
+	set_sysreg_masks(kvm, HFGRTR2_EL2, resx);
+	resx = get_reg_fixed_bits(kvm, HFGWTR2_EL2);
+	set_sysreg_masks(kvm, HFGWTR2_EL2, resx);
 
 	/* HDFG[RW]TR2_EL2 */
-	get_reg_fixed_bits(kvm, HDFGRTR2_EL2, &res0, &res1);
-	set_sysreg_masks(kvm, HDFGRTR2_EL2, res0, res1);
-	get_reg_fixed_bits(kvm, HDFGWTR2_EL2, &res0, &res1);
-	set_sysreg_masks(kvm, HDFGWTR2_EL2, res0, res1);
+	resx = get_reg_fixed_bits(kvm, HDFGRTR2_EL2);
+	set_sysreg_masks(kvm, HDFGRTR2_EL2, resx);
+	resx = get_reg_fixed_bits(kvm, HDFGWTR2_EL2);
+	set_sysreg_masks(kvm, HDFGWTR2_EL2, resx);
 
 	/* HFGITR2_EL2 */
-	get_reg_fixed_bits(kvm, HFGITR2_EL2, &res0, &res1);
-	set_sysreg_masks(kvm, HFGITR2_EL2, res0, res1);
+	resx = get_reg_fixed_bits(kvm, HFGITR2_EL2);
+	set_sysreg_masks(kvm, HFGITR2_EL2, resx);
 
 	/* TCR2_EL2 */
-	get_reg_fixed_bits(kvm, TCR2_EL2, &res0, &res1);
-	set_sysreg_masks(kvm, TCR2_EL2, res0, res1);
+	resx = get_reg_fixed_bits(kvm, TCR2_EL2);
+	set_sysreg_masks(kvm, TCR2_EL2, resx);
 
 	/* SCTLR_EL1 */
-	get_reg_fixed_bits(kvm, SCTLR_EL1, &res0, &res1);
-	set_sysreg_masks(kvm, SCTLR_EL1, res0, res1);
+	resx = get_reg_fixed_bits(kvm, SCTLR_EL1);
+	set_sysreg_masks(kvm, SCTLR_EL1, resx);
 
 	/* SCTLR2_ELx */
-	get_reg_fixed_bits(kvm, SCTLR2_EL1, &res0, &res1);
-	set_sysreg_masks(kvm, SCTLR2_EL1, res0, res1);
-	get_reg_fixed_bits(kvm, SCTLR2_EL2, &res0, &res1);
-	set_sysreg_masks(kvm, SCTLR2_EL2, res0, res1);
+	resx = get_reg_fixed_bits(kvm, SCTLR2_EL1);
+	set_sysreg_masks(kvm, SCTLR2_EL1, resx);
+	resx = get_reg_fixed_bits(kvm, SCTLR2_EL2);
+	set_sysreg_masks(kvm, SCTLR2_EL2, resx);
 
 	/* MDCR_EL2 */
-	get_reg_fixed_bits(kvm, MDCR_EL2, &res0, &res1);
-	set_sysreg_masks(kvm, MDCR_EL2, res0, res1);
+	resx = get_reg_fixed_bits(kvm, MDCR_EL2);
+	set_sysreg_masks(kvm, MDCR_EL2, resx);
 
 	/* CNTHCTL_EL2 */
-	res0 = GENMASK(63, 20);
-	res1 = 0;
+	resx.res0 = GENMASK(63, 20);
+	resx.res1 = 0;
 	if (!kvm_has_feat(kvm, ID_AA64PFR0_EL1, RME, IMP))
-		res0 |= CNTHCTL_CNTPMASK | CNTHCTL_CNTVMASK;
+		resx.res0 |= CNTHCTL_CNTPMASK | CNTHCTL_CNTVMASK;
 	if (!kvm_has_feat(kvm, ID_AA64MMFR0_EL1, ECV, CNTPOFF)) {
-		res0 |= CNTHCTL_ECV;
+		resx.res0 |= CNTHCTL_ECV;
 		if (!kvm_has_feat(kvm, ID_AA64MMFR0_EL1, ECV, IMP))
-			res0 |= (CNTHCTL_EL1TVT | CNTHCTL_EL1TVCT |
-				 CNTHCTL_EL1NVPCT | CNTHCTL_EL1NVVCT);
+			resx.res0 |= (CNTHCTL_EL1TVT | CNTHCTL_EL1TVCT |
+				      CNTHCTL_EL1NVPCT | CNTHCTL_EL1NVVCT);
 	}
 	if (!kvm_has_feat(kvm, ID_AA64MMFR1_EL1, VH, IMP))
-		res0 |= GENMASK(11, 8);
-	set_sysreg_masks(kvm, CNTHCTL_EL2, res0, res1);
+		resx.res0 |= GENMASK(11, 8);
+	set_sysreg_masks(kvm, CNTHCTL_EL2, resx);
 
 	/* ICH_HCR_EL2 */
-	res0 = ICH_HCR_EL2_RES0;
-	res1 = ICH_HCR_EL2_RES1;
+	resx.res0 = ICH_HCR_EL2_RES0;
+	resx.res1 = ICH_HCR_EL2_RES1;
 	if (!(kvm_vgic_global_state.ich_vtr_el2 & ICH_VTR_EL2_TDS))
-		res0 |= ICH_HCR_EL2_TDIR;
+		resx.res0 |= ICH_HCR_EL2_TDIR;
 	/* No GICv4 is presented to the guest */
-	res0 |= ICH_HCR_EL2_DVIM | ICH_HCR_EL2_vSGIEOICount;
-	set_sysreg_masks(kvm, ICH_HCR_EL2, res0, res1);
+	resx.res0 |= ICH_HCR_EL2_DVIM | ICH_HCR_EL2_vSGIEOICount;
+	set_sysreg_masks(kvm, ICH_HCR_EL2, resx);
 
 	/* VNCR_EL2 */
-	set_sysreg_masks(kvm, VNCR_EL2, VNCR_EL2_RES0, VNCR_EL2_RES1);
+	resx.res0 = VNCR_EL2_RES0;
+	resx.res1 = VNCR_EL2_RES1;
+	set_sysreg_masks(kvm, VNCR_EL2, resx);
 
 out:
 	for (enum vcpu_sysreg sr = __SANITISED_REG_START__; sr < NR_SYS_REGS; sr++)
-- 
2.47.3


