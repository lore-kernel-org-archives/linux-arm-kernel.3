Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB655E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 16:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PB67RkOsQVWXBHZ1pVN2Xuio66XUomH/IKflO/CWroU=; b=KRoKn88xYr9ctqIq+q7v8eMD1n
	VOnE8rjkzSBERl9jYXd5SLSBX3kPd1xeyjDjlw+DOW9nRQOCr4juB1cTN7a2knJqxdpTiIOUZJ3X1
	quNrk+HOPd3xkbKlBmZvetwQvAyZeSem5f7aDzT4LtJKz6+Zdfa7/7M2DKNlwC5gfmyz3v8q01pW0
	/IGZgvPAYEHtaXeHVkCNi1C8c+1YMPyS/JlTCV4Yg4Vh4WdccL8MR621q08zEyj36yLIfiFLhk5f0
	trDj2zsthCcm1VQ4P46Tl68AhGwSPIEiJ9VjOh92AlthG7JHfy4RVQFn9fP3zg4EyLRf7ipFwMqT0
	i9bdFntQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tX1Bs-000000035kJ-0QCb;
	Sun, 12 Jan 2025 16:51:56 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tX1Ac-000000035c8-2rGM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jan 2025 16:50:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8ABA1A406C6;
	Sun, 12 Jan 2025 16:48:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AE3BC4CEE0;
	Sun, 12 Jan 2025 16:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736700637;
	bh=Xy1v5LbX4zOHiM5PEsmTxnSA3nlKDyqAo9G46Zj857I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F7g3rPXbv5V8IkvqNAWh4Ce+TU+l/kHr9RKs8fqsDSotPjNkszahaBjQ+adIu4dWd
	 +v72GVwc/ScMiyW7s9lj3RlkoT5o2E6oqw8gfYMLaRXS8SwgsrHPNLuoVIQovY1OPM
	 RPJPZQBjryrM/DddIFi8PE10J7buWv/VKHbB+Bg4+0VGUNNbUVhYF+WveLzPX8iGRe
	 9cll7QnF4MoTfN7caQItJ4GbOm33V6d7cBuH5nzxfQox0OT/F+FAmm3S9PFsXK8eAg
	 3dIKjhq/eVWpc7DOVKEO2/s38yVeNx6o+gciy40VO1F3hw3xoOrVJijugB24ABnH3U
	 eTYX5Z8lzOK/Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tX1AZ-00BNnv-BP;
	Sun, 12 Jan 2025 16:50:35 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Joey Gouly <Joey.Gouly@arm.com>
Subject: [PATCH 1/2] KVM: arm64: nv: Always evaluate HCR_EL2 using sanitising accessors
Date: Sun, 12 Jan 2025 16:50:28 +0000
Message-Id: <20250112165029.1181056-2-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250112165029.1181056-1-maz@kernel.org>
References: <20250112165029.1181056-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, Joey.Gouly@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_085038_854880_40F0D1B6 
X-CRM114-Status: GOOD (  18.51  )
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

A lot of the NV code depends on HCR_EL2.{E2H,TGE}, and we assume
in places that at least HCR_EL2.E2H is invariant for a given guest.

However, we make a point in *not* using the sanitising accessor
that would enforce this, and are at the mercy of the guest doing
stupid things. Clearly, that's not good.

Rework the HCR_EL2 accessors to use __vcpu_sys_reg() instead,
guaranteeing that the RESx settings get applied, specially
when HCR_EL2.E2H is evaluated. This results in fewer accessors
overall.

Huge thanks to Joey who spent a long time tracking this bug down.

Reported-by: Joey Gouly <Joey.Gouly@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_emulate.h | 36 ++++++++++++----------------
 arch/arm64/kvm/hyp/vhe/sysreg-sr.c   |  4 ++--
 2 files changed, 17 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index 333c163987a90..fad4f28ed7e81 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -184,29 +184,30 @@ static inline bool vcpu_is_el2(const struct kvm_vcpu *vcpu)
 	return vcpu_is_el2_ctxt(&vcpu->arch.ctxt);
 }
 
-static inline bool __vcpu_el2_e2h_is_set(const struct kvm_cpu_context *ctxt)
+static inline bool vcpu_el2_e2h_is_set(const struct kvm_vcpu *vcpu)
 {
 	return (!cpus_have_final_cap(ARM64_HAS_HCR_NV1) ||
-		(ctxt_sys_reg(ctxt, HCR_EL2) & HCR_E2H));
+		(__vcpu_sys_reg(vcpu, HCR_EL2) & HCR_E2H));
 }
 
-static inline bool vcpu_el2_e2h_is_set(const struct kvm_vcpu *vcpu)
+static inline bool vcpu_el2_tge_is_set(const struct kvm_vcpu *vcpu)
 {
-	return __vcpu_el2_e2h_is_set(&vcpu->arch.ctxt);
+	return ctxt_sys_reg(&vcpu->arch.ctxt, HCR_EL2) & HCR_TGE;
 }
 
-static inline bool __vcpu_el2_tge_is_set(const struct kvm_cpu_context *ctxt)
+static inline bool is_hyp_ctxt(const struct kvm_vcpu *vcpu)
 {
-	return ctxt_sys_reg(ctxt, HCR_EL2) & HCR_TGE;
-}
+	bool e2h, tge;
+	u64 hcr;
 
-static inline bool vcpu_el2_tge_is_set(const struct kvm_vcpu *vcpu)
-{
-	return __vcpu_el2_tge_is_set(&vcpu->arch.ctxt);
-}
+	if (!vcpu_has_nv(vcpu))
+		return false;
+
+	hcr = __vcpu_sys_reg(vcpu, HCR_EL2);
+
+	e2h = (hcr & HCR_E2H);
+	tge = (hcr & HCR_TGE);
 
-static inline bool __is_hyp_ctxt(const struct kvm_cpu_context *ctxt)
-{
 	/*
 	 * We are in a hypervisor context if the vcpu mode is EL2 or
 	 * E2H and TGE bits are set. The latter means we are in the user space
@@ -215,14 +216,7 @@ static inline bool __is_hyp_ctxt(const struct kvm_cpu_context *ctxt)
 	 * Note that the HCR_EL2.{E2H,TGE}={0,1} isn't really handled in the
 	 * rest of the KVM code, and will result in a misbehaving guest.
 	 */
-	return vcpu_is_el2_ctxt(ctxt) ||
-		(__vcpu_el2_e2h_is_set(ctxt) && __vcpu_el2_tge_is_set(ctxt)) ||
-		__vcpu_el2_tge_is_set(ctxt);
-}
-
-static inline bool is_hyp_ctxt(const struct kvm_vcpu *vcpu)
-{
-	return vcpu_has_nv(vcpu) && __is_hyp_ctxt(&vcpu->arch.ctxt);
+	return vcpu_is_el2(vcpu) || (e2h && tge) || tge;
 }
 
 static inline bool vcpu_is_host_el0(const struct kvm_vcpu *vcpu)
diff --git a/arch/arm64/kvm/hyp/vhe/sysreg-sr.c b/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
index 5f78a39053a79..90b018e06f2cb 100644
--- a/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
+++ b/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
@@ -216,7 +216,7 @@ void __vcpu_load_switch_sysregs(struct kvm_vcpu *vcpu)
 	__sysreg32_restore_state(vcpu);
 	__sysreg_restore_user_state(guest_ctxt);
 
-	if (unlikely(__is_hyp_ctxt(guest_ctxt))) {
+	if (unlikely(is_hyp_ctxt(vcpu))) {
 		__sysreg_restore_vel2_state(vcpu);
 	} else {
 		if (vcpu_has_nv(vcpu)) {
@@ -260,7 +260,7 @@ void __vcpu_put_switch_sysregs(struct kvm_vcpu *vcpu)
 
 	host_ctxt = host_data_ptr(host_ctxt);
 
-	if (unlikely(__is_hyp_ctxt(guest_ctxt)))
+	if (unlikely(is_hyp_ctxt(vcpu)))
 		__sysreg_save_vel2_state(vcpu);
 	else
 		__sysreg_save_el1_state(guest_ctxt);
-- 
2.39.2


