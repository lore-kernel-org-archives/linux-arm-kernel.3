Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77EF4C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 15:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BBaOY9uf7roP9XDqtAz5x68PyKZTOf7/8v/Go6a5UMQ=; b=CFQ0G98fJuKnE/Rgw6lMwJFUav
	emqBgNvpxBTVS42JEDWIHINXU7EfcvOOPp541JVuywWDXoSWIPyA57zT4Z2cS9P9mpzlNXNRLtlXR
	q6tVxdzlyfa0Se2eEnWI2t+re5rHHFa4jwRP7bms1AtY4MCaWmEkx+aUviN56D4G3i5kZar9QYeec
	UCwD0Z+T4emv7r//pTF+OOVjTjqMpihCy7Z5ehWQ3PteKavqhha8luK/92YiWeXlhlMNbUXlXut5Z
	Tm/nkpvrJTbGrYn4YlhXzWycUOZCYA3x3a7RK/cwyi5LPAK4FY7+Hqaw9otmKELORi2MDa5t8DJDN
	c4QVX0Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjK1X-00000000JiM-2Ib9;
	Sat, 15 Feb 2025 15:24:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjJgF-00000000H4f-1Ggr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 15:02:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7A7DA5C5438;
	Sat, 15 Feb 2025 15:01:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6641C4CEE8;
	Sat, 15 Feb 2025 15:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739631724;
	bh=MFIfMJ/dFAsy7V3XbG3ICYqJRyT8AeKA6m2PlwG+ugc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GyGJrqEd+ONBoAzPhWAdJMcSIEV57aTNo42YHG+rSlmZiEVMbcWdUB0jasdHvoNRR
	 dua28lqqwEM0+R/nAfK0nWMBEPyv9jo0/OtiOU+yyeV2whdSz6wWGYnV83ttRrW5SW
	 TltVtoOMqdnFWNQror70ctyqveJKGFps1Kdk6oskXNtQ2NgJbD4ll2x203nUGzLJEK
	 QJmi2cfhUTjQI4nmSdIT2aL66gAjaAzblVR4GXNbMR1Pm3cXHabpvQrz0hFM81aXX6
	 yK6PHiSvJWKVB1OVvkzEhGd3xQ9+R+a/GnSBU+PbEr19kIFTvznHnYUlYN2uQG967b
	 ExKv2zwU/BBOQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tjJgA-004Nz6-Vc;
	Sat, 15 Feb 2025 15:02:03 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH 14/14] KVM: arm64: nv: Plumb TLBI S1E2 into system instruction dispatch
Date: Sat, 15 Feb 2025 15:01:34 +0000
Message-Id: <20250215150134.3765791-15-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250215150134.3765791-1-maz@kernel.org>
References: <20250215150134.3765791-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, eric.auger@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_070207_456201_8DA063DC 
X-CRM114-Status: GOOD (  13.62  )
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

Now that we have to handle TLBI S1E2 in the core code, plumb the
sysinsn dispatch code into it, so that these instructions don't
just UNDEF anymore.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/sys_regs.c | 87 +++++++++++++++++++++++++++------------
 1 file changed, 61 insertions(+), 26 deletions(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index cf1243dd04548..bd112f2859582 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -3386,11 +3386,22 @@ static void s2_mmu_tlbi_s1e1(struct kvm_s2_mmu *mmu,
 	WARN_ON(__kvm_tlbi_s1e2(mmu, info->va.addr, info->va.encoding));
 }
 
+static bool handle_tlbi_el2(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
+			    const struct sys_reg_desc *r)
+{
+	u32 sys_encoding = sys_insn(p->Op0, p->Op1, p->CRn, p->CRm, p->Op2);
+
+	if (!kvm_supported_tlbi_s1e2_op(vcpu, sys_encoding))
+		return undef_access(vcpu, p, r);
+
+	kvm_handle_s1e2_tlbi(vcpu, sys_encoding, p->regval);
+	return true;
+}
+
 static bool handle_tlbi_el1(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 			    const struct sys_reg_desc *r)
 {
 	u32 sys_encoding = sys_insn(p->Op0, p->Op1, p->CRn, p->CRm, p->Op2);
-	u64 vttbr = vcpu_read_sys_reg(vcpu, VTTBR_EL2);
 
 	/*
 	 * If we're here, this is because we've trapped on a EL1 TLBI
@@ -3401,6 +3412,13 @@ static bool handle_tlbi_el1(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 	 * - HCR_EL2.E2H == 0 : a non-VHE guest
 	 * - HCR_EL2.{E2H,TGE} == { 1, 0 } : a VHE guest in guest mode
 	 *
+	 * Another possibility is that we are invalidating the EL2 context
+	 * using EL1 instructions, but that we landed here because we need
+	 * additional invalidation for structures that are not held in the
+	 * CPU TLBs (such as the VNCR pseudo-TLB and its EL2 mapping). In
+	 * that case, we are guaranteed that HCR_EL2.{E2H,TGE} == { 1, 1 }
+	 * as we don't allow an NV-capable L1 in a nVHE configuration.
+	 *
 	 * We don't expect these helpers to ever be called when running
 	 * in a vEL1 context.
 	 */
@@ -3410,7 +3428,13 @@ static bool handle_tlbi_el1(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 	if (!kvm_supported_tlbi_s1e1_op(vcpu, sys_encoding))
 		return undef_access(vcpu, p, r);
 
-	kvm_s2_mmu_iterate_by_vmid(vcpu->kvm, get_vmid(vttbr),
+	if (vcpu_el2_e2h_is_set(vcpu) && vcpu_el2_tge_is_set(vcpu)) {
+		kvm_handle_s1e2_tlbi(vcpu, sys_encoding, p->regval);
+		return true;
+	}
+
+	kvm_s2_mmu_iterate_by_vmid(vcpu->kvm,
+				   get_vmid(__vcpu_sys_reg(vcpu, VTTBR_EL2)),
 				   &(union tlbi_info) {
 					   .va = {
 						   .addr = p->regval,
@@ -3532,16 +3556,21 @@ static struct sys_reg_desc sys_insn_descs[] = {
 	SYS_INSN(TLBI_IPAS2LE1IS, handle_ipas2e1is),
 	SYS_INSN(TLBI_RIPAS2LE1IS, handle_ripas2e1is),
 
-	SYS_INSN(TLBI_ALLE2OS, undef_access),
-	SYS_INSN(TLBI_VAE2OS, undef_access),
+	SYS_INSN(TLBI_ALLE2OS, handle_tlbi_el2),
+	SYS_INSN(TLBI_VAE2OS, handle_tlbi_el2),
 	SYS_INSN(TLBI_ALLE1OS, handle_alle1is),
-	SYS_INSN(TLBI_VALE2OS, undef_access),
+	SYS_INSN(TLBI_VALE2OS, handle_tlbi_el2),
 	SYS_INSN(TLBI_VMALLS12E1OS, handle_vmalls12e1is),
 
-	SYS_INSN(TLBI_RVAE2IS, undef_access),
-	SYS_INSN(TLBI_RVALE2IS, undef_access),
+	SYS_INSN(TLBI_RVAE2IS, handle_tlbi_el2),
+	SYS_INSN(TLBI_RVALE2IS, handle_tlbi_el2),
+	SYS_INSN(TLBI_ALLE2IS, handle_tlbi_el2),
+	SYS_INSN(TLBI_VAE2IS, handle_tlbi_el2),
 
 	SYS_INSN(TLBI_ALLE1IS, handle_alle1is),
+
+	SYS_INSN(TLBI_VALE2IS, handle_tlbi_el2),
+
 	SYS_INSN(TLBI_VMALLS12E1IS, handle_vmalls12e1is),
 	SYS_INSN(TLBI_IPAS2E1OS, handle_ipas2e1is),
 	SYS_INSN(TLBI_IPAS2E1, handle_ipas2e1is),
@@ -3551,11 +3580,17 @@ static struct sys_reg_desc sys_insn_descs[] = {
 	SYS_INSN(TLBI_IPAS2LE1, handle_ipas2e1is),
 	SYS_INSN(TLBI_RIPAS2LE1, handle_ripas2e1is),
 	SYS_INSN(TLBI_RIPAS2LE1OS, handle_ripas2e1is),
-	SYS_INSN(TLBI_RVAE2OS, undef_access),
-	SYS_INSN(TLBI_RVALE2OS, undef_access),
-	SYS_INSN(TLBI_RVAE2, undef_access),
-	SYS_INSN(TLBI_RVALE2, undef_access),
+	SYS_INSN(TLBI_RVAE2OS, handle_tlbi_el2),
+	SYS_INSN(TLBI_RVALE2OS, handle_tlbi_el2),
+	SYS_INSN(TLBI_RVAE2, handle_tlbi_el2),
+	SYS_INSN(TLBI_RVALE2, handle_tlbi_el2),
+	SYS_INSN(TLBI_ALLE2, handle_tlbi_el2),
+	SYS_INSN(TLBI_VAE2, handle_tlbi_el2),
+
 	SYS_INSN(TLBI_ALLE1, handle_alle1is),
+
+	SYS_INSN(TLBI_VALE2, handle_tlbi_el2),
+
 	SYS_INSN(TLBI_VMALLS12E1, handle_vmalls12e1is),
 
 	SYS_INSN(TLBI_IPAS2E1ISNXS, handle_ipas2e1is),
@@ -3563,19 +3598,19 @@ static struct sys_reg_desc sys_insn_descs[] = {
 	SYS_INSN(TLBI_IPAS2LE1ISNXS, handle_ipas2e1is),
 	SYS_INSN(TLBI_RIPAS2LE1ISNXS, handle_ripas2e1is),
 
-	SYS_INSN(TLBI_ALLE2OSNXS, undef_access),
-	SYS_INSN(TLBI_VAE2OSNXS, undef_access),
+	SYS_INSN(TLBI_ALLE2OSNXS, handle_tlbi_el2),
+	SYS_INSN(TLBI_VAE2OSNXS, handle_tlbi_el2),
 	SYS_INSN(TLBI_ALLE1OSNXS, handle_alle1is),
-	SYS_INSN(TLBI_VALE2OSNXS, undef_access),
+	SYS_INSN(TLBI_VALE2OSNXS, handle_tlbi_el2),
 	SYS_INSN(TLBI_VMALLS12E1OSNXS, handle_vmalls12e1is),
 
-	SYS_INSN(TLBI_RVAE2ISNXS, undef_access),
-	SYS_INSN(TLBI_RVALE2ISNXS, undef_access),
-	SYS_INSN(TLBI_ALLE2ISNXS, undef_access),
-	SYS_INSN(TLBI_VAE2ISNXS, undef_access),
+	SYS_INSN(TLBI_RVAE2ISNXS, handle_tlbi_el2),
+	SYS_INSN(TLBI_RVALE2ISNXS, handle_tlbi_el2),
+	SYS_INSN(TLBI_ALLE2ISNXS, handle_tlbi_el2),
+	SYS_INSN(TLBI_VAE2ISNXS, handle_tlbi_el2),
 
 	SYS_INSN(TLBI_ALLE1ISNXS, handle_alle1is),
-	SYS_INSN(TLBI_VALE2ISNXS, undef_access),
+	SYS_INSN(TLBI_VALE2ISNXS, handle_tlbi_el2),
 	SYS_INSN(TLBI_VMALLS12E1ISNXS, handle_vmalls12e1is),
 	SYS_INSN(TLBI_IPAS2E1OSNXS, handle_ipas2e1is),
 	SYS_INSN(TLBI_IPAS2E1NXS, handle_ipas2e1is),
@@ -3585,14 +3620,14 @@ static struct sys_reg_desc sys_insn_descs[] = {
 	SYS_INSN(TLBI_IPAS2LE1NXS, handle_ipas2e1is),
 	SYS_INSN(TLBI_RIPAS2LE1NXS, handle_ripas2e1is),
 	SYS_INSN(TLBI_RIPAS2LE1OSNXS, handle_ripas2e1is),
-	SYS_INSN(TLBI_RVAE2OSNXS, undef_access),
-	SYS_INSN(TLBI_RVALE2OSNXS, undef_access),
-	SYS_INSN(TLBI_RVAE2NXS, undef_access),
-	SYS_INSN(TLBI_RVALE2NXS, undef_access),
-	SYS_INSN(TLBI_ALLE2NXS, undef_access),
-	SYS_INSN(TLBI_VAE2NXS, undef_access),
+	SYS_INSN(TLBI_RVAE2OSNXS, handle_tlbi_el2),
+	SYS_INSN(TLBI_RVALE2OSNXS, handle_tlbi_el2),
+	SYS_INSN(TLBI_RVAE2NXS, handle_tlbi_el2),
+	SYS_INSN(TLBI_RVALE2NXS, handle_tlbi_el2),
+	SYS_INSN(TLBI_ALLE2NXS, handle_tlbi_el2),
+	SYS_INSN(TLBI_VAE2NXS, handle_tlbi_el2),
 	SYS_INSN(TLBI_ALLE1NXS, handle_alle1is),
-	SYS_INSN(TLBI_VALE2NXS, undef_access),
+	SYS_INSN(TLBI_VALE2NXS, handle_tlbi_el2),
 	SYS_INSN(TLBI_VMALLS12E1NXS, handle_vmalls12e1is),
 };
 
-- 
2.39.2


