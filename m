Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E739FCF65F0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 12:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sgfrw2eu1PAJd3z1vCslMYi3U9GvD8Ziq7/B2di93u0=; b=wDCq4WK7ePM8GKtRetVo+w1kbC
	hb9/sieBOzIlRDgyzvVGs+nt0hqVgEzUxoDOuI0MkXWM19HrL+J5ieGfqOR/PFgZGzR1g9uAoEzQW
	BeLg4kZ+K/DWMeIsA+lydIq9L3ofakZBjrxkT8oAFd7bNGfOWzhovSjZCe02u0ht2fhP9iuhVCgnF
	m0jy7iPr+C2sWHzg7Q92Lcu4Omarn1N8MPnVCilCmKmfmus6zhhC5DX8fiU0t6606oKZSt2mz7bXS
	B7Bf4UODLTRXKdOUs7yUqgYzlYW6p+jlpsLlzfZ3/cyfNl6eGurPRflFFNmUpb8jMnpDj/Awfp5v7
	BfqPQytw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLXW-0000000CV9J-0led;
	Mon, 26 Jan 2026 12:17:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLXF-0000000CUtd-2dVK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 12:17:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B70974418C;
	Mon, 26 Jan 2026 12:17:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97566C116C6;
	Mon, 26 Jan 2026 12:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769429856;
	bh=o+Azuxl+435ZLpfOEdegfUYGO8k5jHT7f0xTAjuorWE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Pzrv69IwL8pBSXX3IzH8yxYaicNcJbweSQnTZbN/jjjfCBKGI7hz92X5OUiQ/vicM
	 GIsyVzh/5NruBLSHGEPNlEa39wYouyrOe8GIB8d70xkltChZWH+jw8ItF7tk2X5hCb
	 u2CYJ3ibAYHmNXzUH1+e5rir1UoRbBc2JxgKRgPaNuS+AW36HXcrI/IbZ1hUmdA9O2
	 SUqUIo6xP08bcBPcMWm6MVOLQgU09ngSU7GGeKNXD9ewHPnQW0O3vLV+xuFfXwnIMi
	 7TZY9sPJzPa2gNfAv8DTnHW3QnmbZWBP3NR1hMdVXPoe+sR9pop5YsSG3BKTNxcD2/
	 +3BRlIvWPpe5A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vkLXC-00000005hx6-2wEH;
	Mon, 26 Jan 2026 12:17:34 +0000
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
Subject: [PATCH 13/20] KVM: arm64: Move RESx into individual register descriptors
Date: Mon, 26 Jan 2026 12:16:47 +0000
Message-ID: <20260126121655.1641736-14-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260126121655.1641736-1-maz@kernel.org>
References: <20260126121655.1641736-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_041737_768223_A0FF390F 
X-CRM114-Status: GOOD (  15.03  )
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

Instead of hacking the RES1 bits at runtime, move them into the
register descriptors. This makes it significantly nicer.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/config.c | 36 +++++++++++++++++++++++++++++-------
 1 file changed, 29 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index 7063fffc22799..d5871758f1fcc 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -30,6 +30,7 @@ struct reg_bits_to_feat_map {
 #define	RES0_WHEN_E2H1	BIT(7)	/* RES0 when E2H=1 and not supported */
 #define	RES1_WHEN_E2H0	BIT(8)	/* RES1 when E2H=0 and not supported */
 #define	RES1_WHEN_E2H1	BIT(9)	/* RES1 when E2H=1 and not supported */
+#define	FORCE_RESx	BIT(10)	/* Unconditional RESx */
 
 	unsigned long	flags;
 
@@ -107,6 +108,11 @@ struct reg_feat_map_desc {
  */
 #define NEEDS_FEAT(m, ...)	NEEDS_FEAT_FLAG(m, 0, __VA_ARGS__)
 
+/* Declare fixed RESx bits */
+#define FORCE_RES0(m)		NEEDS_FEAT_FLAG(m, FORCE_RESx, enforce_resx)
+#define FORCE_RES1(m)		NEEDS_FEAT_FLAG(m, FORCE_RESx | AS_RES1, \
+						enforce_resx)
+
 /*
  * Declare the dependency between a non-FGT register, a set of
  * feature, and the set of individual bits it contains. This generates
@@ -230,6 +236,15 @@ struct reg_feat_map_desc {
 #define FEAT_HCX		ID_AA64MMFR1_EL1, HCX, IMP
 #define FEAT_S2PIE		ID_AA64MMFR3_EL1, S2PIE, IMP
 
+static bool enforce_resx(struct kvm *kvm)
+{
+	/*
+	 * Returning false here means that the RESx bits will be always
+	 * addded to the fixed set bit. Yes, this is counter-intuitive.
+	 */
+	return false;
+}
+
 static bool not_feat_aa64el3(struct kvm *kvm)
 {
 	return !kvm_has_feat(kvm, FEAT_AA64EL3);
@@ -1009,6 +1024,8 @@ static const struct reg_bits_to_feat_map hcr_feat_map[] = {
 		   HCR_EL2_TWEDEn,
 		   FEAT_TWED),
 	NEEDS_FEAT_FIXED(HCR_EL2_E2H, compute_hcr_e2h),
+	FORCE_RES0(HCR_EL2_RES0),
+	FORCE_RES1(HCR_EL2_RES1),
 };
 
 static const DECLARE_FEAT_MAP(hcr_desc, HCR_EL2,
@@ -1029,6 +1046,8 @@ static const struct reg_bits_to_feat_map sctlr2_feat_map[] = {
 		   SCTLR2_EL1_CPTM	|
 		   SCTLR2_EL1_CPTM0,
 		   FEAT_CPA2),
+	FORCE_RES0(SCTLR2_EL1_RES0),
+	FORCE_RES1(SCTLR2_EL1_RES1),
 };
 
 static const DECLARE_FEAT_MAP(sctlr2_desc, SCTLR2_EL1,
@@ -1054,6 +1073,8 @@ static const struct reg_bits_to_feat_map tcr2_el2_feat_map[] = {
 		   TCR2_EL2_E0POE,
 		   FEAT_S1POE),
 	NEEDS_FEAT(TCR2_EL2_PIE, FEAT_S1PIE),
+	FORCE_RES0(TCR2_EL2_RES0),
+	FORCE_RES1(TCR2_EL2_RES1),
 };
 
 static const DECLARE_FEAT_MAP(tcr2_el2_desc, TCR2_EL2,
@@ -1131,6 +1152,8 @@ static const struct reg_bits_to_feat_map sctlr_el1_feat_map[] = {
 		   SCTLR_EL1_A		|
 		   SCTLR_EL1_M,
 		   FEAT_AA64EL1),
+	FORCE_RES0(SCTLR_EL1_RES0),
+	FORCE_RES1(SCTLR_EL1_RES1),
 };
 
 static const DECLARE_FEAT_MAP(sctlr_el1_desc, SCTLR_EL1,
@@ -1165,6 +1188,8 @@ static const struct reg_bits_to_feat_map mdcr_el2_feat_map[] = {
 		   MDCR_EL2_TDE		|
 		   MDCR_EL2_TDRA,
 		   FEAT_AA64EL1),
+	FORCE_RES0(MDCR_EL2_RES0),
+	FORCE_RES1(MDCR_EL2_RES1),
 };
 
 static const DECLARE_FEAT_MAP(mdcr_el2_desc, MDCR_EL2,
@@ -1203,6 +1228,8 @@ static const struct reg_bits_to_feat_map vtcr_el2_feat_map[] = {
 		   VTCR_EL2_SL0		|
 		   VTCR_EL2_T0SZ,
 		   FEAT_AA64EL1),
+	FORCE_RES0(VTCR_EL2_RES0),
+	FORCE_RES1(VTCR_EL2_RES1),
 };
 
 static const DECLARE_FEAT_MAP(vtcr_el2_desc, VTCR_EL2,
@@ -1214,7 +1241,8 @@ static void __init check_feat_map(const struct reg_bits_to_feat_map *map,
 	u64 mask = 0;
 
 	for (int i = 0; i < map_size; i++)
-		mask |= map[i].bits;
+		if (!(map[i].flags & FORCE_RESx))
+			mask |= map[i].bits;
 
 	if (mask != ~resx)
 		kvm_err("Undefined %s behaviour, bits %016llx\n",
@@ -1447,28 +1475,22 @@ struct resx get_reg_fixed_bits(struct kvm *kvm, enum vcpu_sysreg reg)
 		break;
 	case HCR_EL2:
 		resx = compute_reg_resx_bits(kvm, &hcr_desc, 0, 0);
-		resx.res1 |= HCR_EL2_RES1;
 		break;
 	case SCTLR2_EL1:
 	case SCTLR2_EL2:
 		resx = compute_reg_resx_bits(kvm, &sctlr2_desc, 0, 0);
-		resx.res1 |= SCTLR2_EL1_RES1;
 		break;
 	case TCR2_EL2:
 		resx = compute_reg_resx_bits(kvm, &tcr2_el2_desc, 0, 0);
-		resx.res1 |= TCR2_EL2_RES1;
 		break;
 	case SCTLR_EL1:
 		resx = compute_reg_resx_bits(kvm, &sctlr_el1_desc, 0, 0);
-		resx.res1 |= SCTLR_EL1_RES1;
 		break;
 	case MDCR_EL2:
 		resx = compute_reg_resx_bits(kvm, &mdcr_el2_desc, 0, 0);
-		resx.res1 |= MDCR_EL2_RES1;
 		break;
 	case VTCR_EL2:
 		resx = compute_reg_resx_bits(kvm, &vtcr_el2_desc, 0, 0);
-		resx.res1 |= VTCR_EL2_RES1;
 		break;
 	default:
 		WARN_ON_ONCE(1);
-- 
2.47.3


