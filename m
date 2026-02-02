Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D3BE7DF19
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 18:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tzVjvoCujmYqZkp/WiSWUV0mWiAdseTGblsjXkfqo4U=; b=mt9tOYKuLeWGnibL3GrwmDsDhw
	oQc1GTw+7xLewppq7SvL4Y25EiGJX4abGquz13NJugP3jpuQ57aJlK2HfGbgvwb59ZbuBph4dtQcY
	+Ej/pi+3VJugTXzoKdm1ZT1xAUr6P+Ma0hjkjIAC3+bpxGmyQs2ugyb3WfHo3RX7xXsWBFbPCLlSh
	Y/miEBNaUbNgjoJdFtwkDpU+x/NP4NnqTos6sQQY/Ab0j66qU2K0Sok4awMNmPBiJjIh8QuTh7Sn4
	VNERsmi7lTSCqPkymkxcjj/qfrv68wZu5kGLuzVv9yPJSHEdtCzk8kTwK9cng+HujCUY8DVD+0s8c
	mQNOT7bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmytz-00000005RK2-1bP5;
	Mon, 02 Feb 2026 18:43:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmytl-00000005R0t-0Ui8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 18:43:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B88D2444C9;
	Mon,  2 Feb 2026 18:43:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94284C2BCB0;
	Mon,  2 Feb 2026 18:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770057823;
	bh=mya2aNm0MFtu4TDLCNnLunOt1rwd+05YOh2F8NM3xkc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aShLhAteHsow1yBXQE9b4PrezL5yg/Ot+AKxO1o/sJPnRAICs3p8vPvBZ3HWsIHbf
	 8b+c/dijXdpNUWWzOeXwxGriwFnNHArYQDB0GeEHLdyj6WPWOq1jpLkkVE8xT4pBg5
	 kRi3422MKHYmpZ7YfyDT42OSYjL8ZYu07ycwfxPoG5OOXfoBraUXlodXmX9u3zLa/Q
	 Iw81+xwNTxoPaZMCNS+JD4+hr55Q3h6RIXLOgUz6SgBGF0XdTqd+iptXuy/shw4BvN
	 BjkNqrluEFoLguDw7580TWL55Y9pejHmaiayuwqa9XsZF4QxECx/u3rR1Al8rrfv9u
	 +SdmXxkvdczjA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vmyth-00000007sAy-2rEU;
	Mon, 02 Feb 2026 18:43:41 +0000
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
Subject: [PATCH v2 13/20] KVM: arm64: Move RESx into individual register descriptors
Date: Mon,  2 Feb 2026 18:43:22 +0000
Message-ID: <20260202184329.2724080-14-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20260202_104345_236026_1C1C076F 
X-CRM114-Status: GOOD (  17.38  )
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

Reviewed-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/config.c | 48 +++++++++++++++++++++++++++++++----------
 1 file changed, 37 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index 7e8e42c1cee4a..474d5c8038c24 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -28,6 +28,7 @@ struct reg_bits_to_feat_map {
 #define	REQUIRES_E2H1	BIT(5)	/* Add HCR_EL2.E2H RES1 as a pre-condition */
 #define	RES1_WHEN_E2H0	BIT(6)	/* RES1 when E2H=0 and not supported */
 #define	RES1_WHEN_E2H1	BIT(7)	/* RES1 when E2H=1 and not supported */
+#define	FORCE_RESx	BIT(8)	/* Unconditional RESx */
 
 	unsigned long	flags;
 
@@ -87,6 +88,12 @@ struct reg_feat_map_desc {
 		.match = (fun),				\
 	}
 
+#define __NEEDS_FEAT_0(m, f, w, ...)			\
+	{						\
+		.w	= (m),				\
+		.flags = (f),				\
+	}
+
 #define __NEEDS_FEAT_FLAG(m, f, w, ...)			\
 	CONCATENATE(__NEEDS_FEAT_, COUNT_ARGS(__VA_ARGS__))(m, f, w, __VA_ARGS__)
 
@@ -105,10 +112,14 @@ struct reg_feat_map_desc {
  */
 #define NEEDS_FEAT(m, ...)	NEEDS_FEAT_FLAG(m, 0, __VA_ARGS__)
 
+/* Declare fixed RESx bits */
+#define FORCE_RES0(m)		NEEDS_FEAT_FLAG(m, FORCE_RESx)
+#define FORCE_RES1(m)		NEEDS_FEAT_FLAG(m, FORCE_RESx | AS_RES1)
+
 /*
- * Declare the dependency between a non-FGT register, a set of
- * feature, and the set of individual bits it contains. This generates
- * a struct reg_feat_map_desc.
+ * Declare the dependency between a non-FGT register, a set of features,
+ * and the set of individual bits it contains. This generates a struct
+ * reg_feat_map_desc.
  */
 #define DECLARE_FEAT_MAP(n, r, m, f)					\
 	struct reg_feat_map_desc n = {					\
@@ -1007,6 +1018,8 @@ static const struct reg_bits_to_feat_map hcr_feat_map[] = {
 		   HCR_EL2_TWEDEn,
 		   FEAT_TWED),
 	NEEDS_FEAT_FIXED(HCR_EL2_E2H, compute_hcr_e2h),
+	FORCE_RES0(HCR_EL2_RES0),
+	FORCE_RES1(HCR_EL2_RES1),
 };
 
 static const DECLARE_FEAT_MAP(hcr_desc, HCR_EL2,
@@ -1027,6 +1040,8 @@ static const struct reg_bits_to_feat_map sctlr2_feat_map[] = {
 		   SCTLR2_EL1_CPTM	|
 		   SCTLR2_EL1_CPTM0,
 		   FEAT_CPA2),
+	FORCE_RES0(SCTLR2_EL1_RES0),
+	FORCE_RES1(SCTLR2_EL1_RES1),
 };
 
 static const DECLARE_FEAT_MAP(sctlr2_desc, SCTLR2_EL1,
@@ -1052,6 +1067,8 @@ static const struct reg_bits_to_feat_map tcr2_el2_feat_map[] = {
 		   TCR2_EL2_E0POE,
 		   FEAT_S1POE),
 	NEEDS_FEAT(TCR2_EL2_PIE, FEAT_S1PIE),
+	FORCE_RES0(TCR2_EL2_RES0),
+	FORCE_RES1(TCR2_EL2_RES1),
 };
 
 static const DECLARE_FEAT_MAP(tcr2_el2_desc, TCR2_EL2,
@@ -1129,6 +1146,8 @@ static const struct reg_bits_to_feat_map sctlr_el1_feat_map[] = {
 		   SCTLR_EL1_A		|
 		   SCTLR_EL1_M,
 		   FEAT_AA64EL1),
+	FORCE_RES0(SCTLR_EL1_RES0),
+	FORCE_RES1(SCTLR_EL1_RES1),
 };
 
 static const DECLARE_FEAT_MAP(sctlr_el1_desc, SCTLR_EL1,
@@ -1163,6 +1182,8 @@ static const struct reg_bits_to_feat_map mdcr_el2_feat_map[] = {
 		   MDCR_EL2_TDE		|
 		   MDCR_EL2_TDRA,
 		   FEAT_AA64EL1),
+	FORCE_RES0(MDCR_EL2_RES0),
+	FORCE_RES1(MDCR_EL2_RES1),
 };
 
 static const DECLARE_FEAT_MAP(mdcr_el2_desc, MDCR_EL2,
@@ -1201,6 +1222,8 @@ static const struct reg_bits_to_feat_map vtcr_el2_feat_map[] = {
 		   VTCR_EL2_SL0		|
 		   VTCR_EL2_T0SZ,
 		   FEAT_AA64EL1),
+	FORCE_RES0(VTCR_EL2_RES0),
+	FORCE_RES1(VTCR_EL2_RES1),
 };
 
 static const DECLARE_FEAT_MAP(vtcr_el2_desc, VTCR_EL2,
@@ -1211,8 +1234,14 @@ static void __init check_feat_map(const struct reg_bits_to_feat_map *map,
 {
 	u64 mask = 0;
 
+	/*
+	 * Don't account for FORCE_RESx that are architectural, and
+	 * therefore part of the resx parameter. Other FORCE_RESx bits
+	 * are implementation choices, and therefore accounted for.
+	 */
 	for (int i = 0; i < map_size; i++)
-		mask |= map[i].bits;
+		if (!((map[i].flags & FORCE_RESx) && (map[i].bits & resx)))
+			mask |= map[i].bits;
 
 	if (mask != ~resx)
 		kvm_err("Undefined %s behaviour, bits %016llx\n",
@@ -1284,13 +1313,16 @@ static struct resx compute_resx_bits(struct kvm *kvm,
 		if (map[i].flags & exclude)
 			continue;
 
-		switch (map[i].flags & (CALL_FUNC | FIXED_VALUE)) {
+		switch (map[i].flags & (FORCE_RESx | CALL_FUNC | FIXED_VALUE)) {
 		case CALL_FUNC | FIXED_VALUE:
 			map[i].fval(kvm, &resx);
 			continue;
 		case CALL_FUNC:
 			match = map[i].match(kvm);
 			break;
+		case FORCE_RESx:
+			match = false;
+			break;
 		default:
 			match = idreg_feat_match(kvm, &map[i]);
 		}
@@ -1434,28 +1466,22 @@ struct resx get_reg_fixed_bits(struct kvm *kvm, enum vcpu_sysreg reg)
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


