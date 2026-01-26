Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F0C2CF65E9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 12:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZLbrTYPwkf4ycD/ALb8qOLUtcLOLjOg+A3BPAuG7er4=; b=zG37mXxrcAPvniIgubu6Mec4YB
	J2j1yJO+ail3MChGDq56Ekm906XFBeq29lKV1uGW3lxPpB7c1P/lniRDDd04T7ajVLLLHSy9ID2Bg
	M147C6hDv02TXCppyPF8EMHQpFWTG/EQ1FJel8kEHWMgH/PCty7JP/ua3ja08Ew7jqnjNFRP5Kj19
	/i/x32CZEEEqlp9528c0zHPVQtrRumTCPNa92MPwjKwkfC/+lFdBfqrGaCGwlhzcFhRsDFvNs36ue
	RaVxAh/aWwIqVIW/T+HDzAHI4dIvJSFXGlNVEccC1XQgxIkbnzWlPIfMN65d/fQvrrIN7e6+3W/Hn
	K6QaPJlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLXU-0000000CV6S-2a4k;
	Mon, 26 Jan 2026 12:17:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLXF-0000000CUtY-1nMi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 12:17:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 24BE044495;
	Mon, 26 Jan 2026 12:17:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02FA6C116C6;
	Mon, 26 Jan 2026 12:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769429856;
	bh=8SV61IKVNDuBON1I84focVHa2lv7M39kP3v6fPZu3JA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uwmCywmBeOqUkDvwaFxkcv3P2+JzMNVAlUFtKpcC/frkzYMZ8THUj285oQsllGPqk
	 dACnddUhBocioeDIOypVLCnyASnyBUfG/f6R8ife8l++SFWy/+cC+hrVHaEI9sSssE
	 exRFPPdgHOfOP2atGqL2XCnp0rjk4E0NAEBTNFFyQ9AHiicMtmt0relPlwdsRWGd41
	 p+6kF/I/xougHcBNa37MMQGzec39hIZcE0Gv6S1b3jj1gRJI+WlhWIV514jLO0A1fD
	 gOnJ/xJKA8WBRqlO1aeG3O3n8frMqY2F3hAqt68GOqgJ728kHhByjKeqbFjFguYjPl
	 EGGQNFjYe8zgw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vkLXC-00000005hx6-0yYK;
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
Subject: [PATCH 11/20] KVM: arm64: Add REQUIRES_E2H1 constraint as configuration flags
Date: Mon, 26 Jan 2026 12:16:45 +0000
Message-ID: <20260126121655.1641736-12-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20260126_041737_542732_00EE15B3 
X-CRM114-Status: GOOD (  13.50  )
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

A bunch of EL2 configuration are very similar to their EL1 counterpart,
with the added constraint that HCR_EL2.E2H being 1.

For us, this means HCR_EL2.E2H being RES1, which is something we can
statically evaluate.

Add a REQUIRES_E2H1 constraint, which allows us to express conditions
in a much simpler way (without extra code). Existing occurrences are
converted, before we add a lot more.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/config.c | 38 ++++++++++++++------------------------
 1 file changed, 14 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index 4fac04d3132c0..1990cebc77c66 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -25,6 +25,7 @@ struct reg_bits_to_feat_map {
 #define	FIXED_VALUE	BIT(2)	/* RAZ/WI or RAO/WI in KVM */
 #define	MASKS_POINTER	BIT(3)	/* Pointer to fgt_masks struct instead of bits */
 #define	AS_RES1		BIT(4)	/* RES1 when not supported */
+#define	REQUIRES_E2H1	BIT(5)	/* Add HCR_EL2.E2H RES1 as a pre-condition */
 
 	unsigned long	flags;
 
@@ -311,21 +312,6 @@ static bool feat_trbe_mpam(struct kvm *kvm)
 		(read_sysreg_s(SYS_TRBIDR_EL1) & TRBIDR_EL1_MPAM));
 }
 
-static bool feat_asid2_e2h1(struct kvm *kvm)
-{
-	return kvm_has_feat(kvm, FEAT_ASID2) && !kvm_has_feat(kvm, FEAT_E2H0);
-}
-
-static bool feat_d128_e2h1(struct kvm *kvm)
-{
-	return kvm_has_feat(kvm, FEAT_D128) && !kvm_has_feat(kvm, FEAT_E2H0);
-}
-
-static bool feat_mec_e2h1(struct kvm *kvm)
-{
-	return kvm_has_feat(kvm, FEAT_MEC) && !kvm_has_feat(kvm, FEAT_E2H0);
-}
-
 static bool feat_ebep_pmuv3_ss(struct kvm *kvm)
 {
 	return kvm_has_feat(kvm, FEAT_EBEP) || kvm_has_feat(kvm, FEAT_PMUv3_SS);
@@ -1045,15 +1031,15 @@ static const DECLARE_FEAT_MAP(sctlr2_desc, SCTLR2_EL1,
 			      sctlr2_feat_map, FEAT_SCTLR2);
 
 static const struct reg_bits_to_feat_map tcr2_el2_feat_map[] = {
-	NEEDS_FEAT(TCR2_EL2_FNG1	|
-		   TCR2_EL2_FNG0	|
-		   TCR2_EL2_A2,
-		   feat_asid2_e2h1),
-	NEEDS_FEAT(TCR2_EL2_DisCH1	|
-		   TCR2_EL2_DisCH0	|
-		   TCR2_EL2_D128,
-		   feat_d128_e2h1),
-	NEEDS_FEAT(TCR2_EL2_AMEC1, feat_mec_e2h1),
+	NEEDS_FEAT_FLAG(TCR2_EL2_FNG1	|
+			TCR2_EL2_FNG0	|
+			TCR2_EL2_A2,
+			REQUIRES_E2H1, FEAT_ASID2),
+	NEEDS_FEAT_FLAG(TCR2_EL2_DisCH1	|
+			TCR2_EL2_DisCH0	|
+			TCR2_EL2_D128,
+			REQUIRES_E2H1, FEAT_D128),
+	NEEDS_FEAT_FLAG(TCR2_EL2_AMEC1, REQUIRES_E2H1, FEAT_MEC),
 	NEEDS_FEAT(TCR2_EL2_AMEC0, FEAT_MEC),
 	NEEDS_FEAT(TCR2_EL2_HAFT, FEAT_HAFT),
 	NEEDS_FEAT(TCR2_EL2_PTTWI	|
@@ -1285,6 +1271,7 @@ struct resx compute_resx_bits(struct kvm *kvm,
 			      unsigned long require,
 			      unsigned long exclude)
 {
+	bool e2h0 = kvm_has_feat(kvm, FEAT_E2H0);
 	struct resx resx = {};
 
 	for (int i = 0; i < map_size; i++) {
@@ -1307,6 +1294,9 @@ struct resx compute_resx_bits(struct kvm *kvm,
 			match = idreg_feat_match(kvm, &map[i]);
 		}
 
+		if (map[i].flags & REQUIRES_E2H1)
+			match &= !e2h0;
+		
 		if (!match) {
 			if (map[i].flags & AS_RES1)
  				resx.res1 |= reg_feat_map_bits(&map[i]);
-- 
2.47.3


