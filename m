Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFBDDE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 14:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ad63xrEHJ/DILRhAkJcXmI2yvLrjOSx98iqpFD4t7GE=; b=wOPw0VJqXjag3eXNiztiDjTjCa
	e4XY040kFBflarniCO9AhJETPs8mqnn3WZrHfHlUVHwSVpnajcgKExmN7S3pv+l8xl97A6lMP9Phg
	bwV85BQms0QDk7l3uFevSNsZx2A6dOwwcCzzFojb6gJ5u+sy+SIVEy8sLIGcS4HId08uQZXK2VxBJ
	Q0t3ZkmrsjaFlCRQwcb9/vhcv2O+f4JDaRLu/jKl1Lwf0kRbrlzM7a8OuIl4hVGUol9/brddOrF8r
	ZZvraiOSlmRAqHX0EPk8pM5Sj6ZvRtbaIkQAX3sGIx70cXWh3aJLtbr90SdB0wdNygX4sgmbj8kdP
	Xg5NWuNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNYYB-0000000Dkcf-2IRn;
	Tue, 17 Dec 2024 14:27:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNYTw-0000000DjY0-3qVe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 14:23:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0A2755C5926;
	Tue, 17 Dec 2024 14:22:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBA43C4CEDE;
	Tue, 17 Dec 2024 14:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734445408;
	bh=qUpHIbiQuhU1+4N8+i0jJ8LE2+QbS+HIXdOvz3fZ3rY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c2FKzFy/GHc4j1zsDmUE8iu21kR7SsTBcTqLJPMgNBqdnSx8klfhtVFMxWHmfpat9
	 d+RVllfg17xCuHpMwvlvyjGmiMV34XaazK9bzcP0ByBnyBgwxyESija1d5bmuzcE/B
	 lFJW0R700+buV372Qod2p35IOQ035ivAVhC5glGShmCQ0QVXc6m607+YUQwEfFl77k
	 E17Q8F0zcQX0I0OT4swEj1X5lmdQcn85vHaA4+tKVk/kzrb6jWQR7YL71boL2SeLxg
	 U6xSEAuHLSeQxvPYIkNUL00YkNKaYjSrg2PrRCq9ObdogR/YVXM81AEFzh6K8nMCqG
	 QdWEqNrO3Ojeg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tNYTu-004aJx-5g;
	Tue, 17 Dec 2024 14:23:26 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Chase Conklin <chase.conklin@arm.com>,
	Eric Auger <eauger@redhat.com>
Subject: [PATCH v2 08/12] KVM: arm64: nv: Add trap routing for CNTHCTL_EL2.EL1{NVPCT,NVVCT,TVT,TVCT}
Date: Tue, 17 Dec 2024 14:23:16 +0000
Message-Id: <20241217142321.763801-9-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241217142321.763801-1-maz@kernel.org>
References: <20241217142321.763801-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, andersson@kernel.org, christoffer.dall@arm.com, gankulkarni@os.amperecomputing.com, chase.conklin@arm.com, eauger@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_062329_045306_FBBE7CD9 
X-CRM114-Status: GOOD (  11.99  )
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

For completeness, fun, and cerebral meltdown, add the virtualisation
related traps to the counter and timers.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/emulate-nested.c | 58 +++++++++++++++++++++++++++++++--
 1 file changed, 56 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 1ffbfd1c3cf2e..03d21044c41f5 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -89,6 +89,9 @@ enum cgt_group_id {
 	CGT_HCRX_EnFPM,
 	CGT_HCRX_TCR2En,
 
+	CGT_CNTHCTL_EL1TVT,
+	CGT_CNTHCTL_EL1TVCT,
+
 	CGT_ICH_HCR_TC,
 	CGT_ICH_HCR_TALL0,
 	CGT_ICH_HCR_TALL1,
@@ -124,6 +127,8 @@ enum cgt_group_id {
 	__COMPLEX_CONDITIONS__,
 	CGT_CNTHCTL_EL1PCTEN = __COMPLEX_CONDITIONS__,
 	CGT_CNTHCTL_EL1PTEN,
+	CGT_CNTHCTL_EL1NVPCT,
+	CGT_CNTHCTL_EL1NVVCT,
 
 	CGT_CPTR_TTA,
 	CGT_MDCR_HPMN,
@@ -393,6 +398,18 @@ static const struct trap_bits coarse_trap_bits[] = {
 		.mask		= HCRX_EL2_TCR2En,
 		.behaviour	= BEHAVE_FORWARD_RW,
 	},
+	[CGT_CNTHCTL_EL1TVT] = {
+		.index		= CNTHCTL_EL2,
+		.value		= CNTHCTL_EL1TVT,
+		.mask		= CNTHCTL_EL1TVT,
+		.behaviour	= BEHAVE_FORWARD_RW,
+	},
+	[CGT_CNTHCTL_EL1TVCT] = {
+		.index		= CNTHCTL_EL2,
+		.value		= CNTHCTL_EL1TVCT,
+		.mask		= CNTHCTL_EL1TVCT,
+		.behaviour	= BEHAVE_FORWARD_READ,
+	},
 	[CGT_ICH_HCR_TC] = {
 		.index		= ICH_HCR_EL2,
 		.value		= ICH_HCR_TC,
@@ -487,6 +504,32 @@ static enum trap_behaviour check_cnthctl_el1pten(struct kvm_vcpu *vcpu)
 	return BEHAVE_FORWARD_RW;
 }
 
+static bool is_nested_nv2_guest(struct kvm_vcpu *vcpu)
+{
+	u64 val;
+
+	val = __vcpu_sys_reg(vcpu, HCR_EL2);
+	return ((val & (HCR_E2H | HCR_TGE | HCR_NV2 | HCR_NV1 | HCR_NV)) == (HCR_E2H | HCR_NV2 | HCR_NV));
+}
+
+static enum trap_behaviour check_cnthctl_el1nvpct(struct kvm_vcpu *vcpu)
+{
+	if (!is_nested_nv2_guest(vcpu) ||
+	    !(__vcpu_sys_reg(vcpu, CNTHCTL_EL2) & CNTHCTL_EL1NVPCT))
+		return BEHAVE_HANDLE_LOCALLY;
+
+	return BEHAVE_FORWARD_RW;
+}
+
+static enum trap_behaviour check_cnthctl_el1nvvct(struct kvm_vcpu *vcpu)
+{
+	if (!is_nested_nv2_guest(vcpu) ||
+	    !(__vcpu_sys_reg(vcpu, CNTHCTL_EL2) & CNTHCTL_EL1NVVCT))
+		return BEHAVE_HANDLE_LOCALLY;
+
+	return BEHAVE_FORWARD_RW;
+}
+
 static enum trap_behaviour check_cptr_tta(struct kvm_vcpu *vcpu)
 {
 	u64 val = __vcpu_sys_reg(vcpu, CPTR_EL2);
@@ -534,6 +577,8 @@ static enum trap_behaviour check_mdcr_hpmn(struct kvm_vcpu *vcpu)
 static const complex_condition_check ccc[] = {
 	CCC(CGT_CNTHCTL_EL1PCTEN, check_cnthctl_el1pcten),
 	CCC(CGT_CNTHCTL_EL1PTEN, check_cnthctl_el1pten),
+	CCC(CGT_CNTHCTL_EL1NVPCT, check_cnthctl_el1nvpct),
+	CCC(CGT_CNTHCTL_EL1NVVCT, check_cnthctl_el1nvvct),
 	CCC(CGT_CPTR_TTA, check_cptr_tta),
 	CCC(CGT_MDCR_HPMN, check_mdcr_hpmn),
 };
@@ -850,11 +895,15 @@ static const struct encoding_to_trap_config encoding_to_cgt[] __initconst = {
 		      SYS_CNTHP_CVAL_EL2, CGT_HCR_NV),
 	SR_RANGE_TRAP(SYS_CNTHV_TVAL_EL2,
 		      SYS_CNTHV_CVAL_EL2, CGT_HCR_NV),
-	/* All _EL02, _EL12 registers */
+	/* All _EL02, _EL12 registers up to CNTKCTL_EL12*/
 	SR_RANGE_TRAP(sys_reg(3, 5, 0, 0, 0),
 		      sys_reg(3, 5, 10, 15, 7), CGT_HCR_NV),
 	SR_RANGE_TRAP(sys_reg(3, 5, 12, 0, 0),
-		      sys_reg(3, 5, 14, 15, 7), CGT_HCR_NV),
+		      sys_reg(3, 5, 14, 1, 0), CGT_HCR_NV),
+	SR_TRAP(SYS_CNTP_CTL_EL02,	CGT_CNTHCTL_EL1NVPCT),
+	SR_TRAP(SYS_CNTP_CVAL_EL02,	CGT_CNTHCTL_EL1NVPCT),
+	SR_TRAP(SYS_CNTV_CTL_EL02,	CGT_CNTHCTL_EL1NVVCT),
+	SR_TRAP(SYS_CNTV_CVAL_EL02,	CGT_CNTHCTL_EL1NVVCT),
 	SR_TRAP(OP_AT_S1E2R,		CGT_HCR_NV),
 	SR_TRAP(OP_AT_S1E2W,		CGT_HCR_NV),
 	SR_TRAP(OP_AT_S12E1R,		CGT_HCR_NV),
@@ -1184,6 +1233,11 @@ static const struct encoding_to_trap_config encoding_to_cgt[] __initconst = {
 	SR_TRAP(SYS_CNTP_CTL_EL0,	CGT_CNTHCTL_EL1PTEN),
 	SR_TRAP(SYS_CNTPCT_EL0,		CGT_CNTHCTL_EL1PCTEN),
 	SR_TRAP(SYS_CNTPCTSS_EL0,	CGT_CNTHCTL_EL1PCTEN),
+	SR_TRAP(SYS_CNTV_TVAL_EL0,	CGT_CNTHCTL_EL1TVT),
+	SR_TRAP(SYS_CNTV_CVAL_EL0,	CGT_CNTHCTL_EL1TVT),
+	SR_TRAP(SYS_CNTV_CTL_EL0,	CGT_CNTHCTL_EL1TVT),
+	SR_TRAP(SYS_CNTVCT_EL0,		CGT_CNTHCTL_EL1TVCT),
+	SR_TRAP(SYS_CNTVCTSS_EL0,	CGT_CNTHCTL_EL1TVCT),
 	SR_TRAP(SYS_FPMR,		CGT_HCRX_EnFPM),
 	/*
 	 * IMPDEF choice:
-- 
2.39.2


