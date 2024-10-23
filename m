Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8305CFA447
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 15:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HeYzf9j8LNtoofvVzVi4XFbEwbk9doRl9QwNi2Dm5Cc=; b=Phe3kElTQSDIsDi6Us0x2YeEsI
	vHNRUjFP6yWfHfnfwROUsm8j0n0st28tXYpOrWz8rZ+9krmXWbIkgMmye9C2LDN6Vi3kmA2sgxTR9
	By3HgDr1X7ORR4+nAUtEKFggXjfPPnGMolHrmbpBIcDakHSXaFLvFNL4R0vh1ShJ/SUhHMGDSGnph
	gocubk2AAkfA06oI4WEVEcBUG6JR07wlfZoGM9ap54wqe+sML/fbXP5WhWurh8LL4Sp7RjrcWsJb+
	eOxO2OPmQHVcdKO4EKR0OMc01F9VdGB2o2ufMEXbWVx4jzBGyD9GuwxFmMDTWW5zEtdVkg68Q4f6a
	um/MZkag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3dcS-0000000F1zQ-431m;
	Wed, 23 Oct 2024 15:49:57 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ckL-0000000EpKl-27cU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 14:54:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BF97DA45044;
	Wed, 23 Oct 2024 14:53:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E671C4CEE6;
	Wed, 23 Oct 2024 14:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729695236;
	bh=miQZHZgbW1sasFdsH6OWS+k+yOuBiQ+dexB+f0U9p1o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RBb7PCTZzRz6Z610kDvj2hDycCs4Mpw+6Sw2CqIpVSx4VFIAT+P8wD0ecnzS7Tdbi
	 yhUM9KisKDDS5wmItyJQj3zg6zNDeVTmuwPw/AFndY83+p/nNao+iLtgDJ78hni2go
	 Eb0xXg5KutYS2BEtosfirtahVCPHn5Rz03O2huotZcDLBk15aWJqdQqIK5PPc9BITC
	 dpMJES9/HrGyn6uq8DLRAL91cQx7nlu4EQXnPmco9vVJ9k98e471n/QTgweRGrI8rW
	 9ju8f5ma+iaNovc3AyCPlR7FeyG/snWLBuAOAqg7DFZ3JhaycpMVj5XRxnoLuLk+L+
	 ZlqFoAMMbhmsw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1t3ckE-0068vz-T3;
	Wed, 23 Oct 2024 15:53:54 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v5 26/37] KVM: arm64: Rely on visibility to let PIR*_ELx/TCR2_ELx UNDEF
Date: Wed, 23 Oct 2024 15:53:34 +0100
Message-Id: <20241023145345.1613824-27-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241023145345.1613824-1-maz@kernel.org>
References: <20241023145345.1613824-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, alexandru.elisei@arm.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_075401_792740_6FD06B35 
X-CRM114-Status: GOOD (  10.61  )
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

With a visibility defined for these registers, there is no need
to check again for S1PIE or TCRX being implemented as perform_access()
already handles it.

Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/sys_regs.c | 34 +++-------------------------------
 1 file changed, 3 insertions(+), 31 deletions(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 85b465c9ec8fd..6c20de8607b2d 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -369,18 +369,6 @@ static bool access_rw(struct kvm_vcpu *vcpu,
 	return true;
 }
 
-static bool check_s1pie_access_rw(struct kvm_vcpu *vcpu,
-				  struct sys_reg_params *p,
-				  const struct sys_reg_desc *r)
-{
-	if (!kvm_has_s1pie(vcpu->kvm)) {
-		kvm_inject_undefined(vcpu);
-		return false;
-	}
-
-	return access_rw(vcpu, p, r);
-}
-
 /*
  * See note at ARMv7 ARM B1.14.4 (TL;DR: S/W ops are not easily virtualized).
  */
@@ -445,10 +433,6 @@ static bool access_vm_reg(struct kvm_vcpu *vcpu,
 	bool was_enabled = vcpu_has_cache_enabled(vcpu);
 	u64 val, mask, shift;
 
-	if (reg_to_encoding(r) == SYS_TCR2_EL1 &&
-	    !kvm_has_tcr2(vcpu->kvm))
-		return undef_access(vcpu, p, r);
-
 	BUG_ON(!p->is_write);
 
 	get_access_mask(r, &mask, &shift);
@@ -467,18 +451,6 @@ static bool access_vm_reg(struct kvm_vcpu *vcpu,
 	return true;
 }
 
-static bool access_tcr2_el2(struct kvm_vcpu *vcpu,
-			    struct sys_reg_params *p,
-			    const struct sys_reg_desc *r)
-{
-	if (!kvm_has_tcr2(vcpu->kvm)) {
-		kvm_inject_undefined(vcpu);
-		return false;
-	}
-
-	return access_rw(vcpu, p, r);
-}
-
 static bool access_actlr(struct kvm_vcpu *vcpu,
 			 struct sys_reg_params *p,
 			 const struct sys_reg_desc *r)
@@ -2904,7 +2876,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	EL2_REG(TTBR0_EL2, access_rw, reset_val, 0),
 	EL2_REG(TTBR1_EL2, access_rw, reset_val, 0),
 	EL2_REG(TCR_EL2, access_rw, reset_val, TCR_EL2_RES1),
-	EL2_REG_FILTERED(TCR2_EL2, access_tcr2_el2, reset_val, TCR2_EL2_RES1,
+	EL2_REG_FILTERED(TCR2_EL2, access_rw, reset_val, TCR2_EL2_RES1,
 			 tcr2_el2_visibility),
 	EL2_REG_VNCR(VTTBR_EL2, reset_val, 0),
 	EL2_REG_VNCR(VTCR_EL2, reset_val, 0),
@@ -2933,9 +2905,9 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	EL2_REG(HPFAR_EL2, access_rw, reset_val, 0),
 
 	EL2_REG(MAIR_EL2, access_rw, reset_val, 0),
-	EL2_REG_FILTERED(PIRE0_EL2, check_s1pie_access_rw, reset_val, 0,
+	EL2_REG_FILTERED(PIRE0_EL2, access_rw, reset_val, 0,
 			 s1pie_el2_visibility),
-	EL2_REG_FILTERED(PIR_EL2, check_s1pie_access_rw, reset_val, 0,
+	EL2_REG_FILTERED(PIR_EL2, access_rw, reset_val, 0,
 			 s1pie_el2_visibility),
 	EL2_REG(AMAIR_EL2, access_rw, reset_val, 0),
 
-- 
2.39.2


