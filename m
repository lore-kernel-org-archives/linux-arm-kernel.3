Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C20C44508
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 09:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aUf4mefeij8lFYbjEvEXNlSmIZlKbvOv3KEUWlwzNqs=; b=rXNnOUDXEYH073mdtMBMcGKJ3y
	BHU2LjgjLzkuJZ5CxKA5GclgilUpj53EU0vawgL+UtqExOmhIouISu5WzWlrEEX5J2SXtbHNaR0L3
	7e8QPnmER/xpCuxqF62MHAMn9zjciPlxlF6SEV559QaQjWhHetdqk4tSDMUnED1QQUYszzhkWSWIL
	PbEceyajk8miGbuBrK5sxQxxIb7R4mZEy10IrzD9KRXzG9FBVTpWJWalnuswprwt7h0vpgss4qvY+
	o05ra78Eb6xxFYoD/U3UCRR7hvuiV8oPhdefWBPHdNva601qekJekv9U6Onz4Yc32xUbjC6SCwfMu
	0EzDdY9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZGE-0000000BPNF-3ZHL;
	Tue, 14 Jul 2026 09:17:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZG1-0000000BP5B-3h3Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 09:16:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9B45C43D6A;
	Tue, 14 Jul 2026 09:16:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F8771F00AC4;
	Tue, 14 Jul 2026 09:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784020613;
	bh=aUf4mefeij8lFYbjEvEXNlSmIZlKbvOv3KEUWlwzNqs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TYQp9xfZE7xw9M6GUDxlNHMappsAb/Dvm678Z6tMZXpqJPWssHabywW/D34efLljv
	 sWV1Fj8cFGUPk0Iysanb0nH6EzaxVFOvU57TFBHUcH/fOv/pdmJCC3T/ycCh84fja7
	 mmjm0n58Vp1l03n8XlmJJ4qdEto4WyyR5BjF56RmBd8iIIK0+AfOdFFwtpis2Uy55V
	 0zieN13Oln2Y/LEeGvVpEZXLHJN+2nReOHVGXuO33CkTRZzKZRH9zzvMDKXCavI8CZ
	 h1pQ96TzaYHpE2kEmF1XsBvwaoUYCwrAkuV9zau2W4fCzPrLUu2f6G8ject1mBT4pZ
	 Z6NCFMbG4FuLA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wjZFz-00000004ny1-3YUs;
	Tue, 14 Jul 2026 09:16:51 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v2 23/28] KVM: arm64: Add NVHCR_EL2 context switching
Date: Tue, 14 Jul 2026 10:16:36 +0100
Message-ID: <20260714091641.1970822-24-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260714091641.1970822-1-maz@kernel.org>
References: <20260714091641.1970822-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

Since NVHCR_EL2 represents the HCR_EL2 state of the EL1 guest, it
must be dealt with in some particular way:

- for a guest in hyp context (an L1 by definition), NVHCR_EL2 directly
  reflects HCR_EL2 as read and written by the guest itself. It must
  therefore be eagerly synced back with the emulation code which only
  knows about HCR_EL2. This is unconditional if NV3 is available on
  the host.

- For an L2 guest, NVHCR_EL2 is controlled by the L1 guest, and we
  just context switch it like any other EL1 register. Yes, EL1, as
  that's where this thing runs from the PoV of L1. This is conditioned
  on the guest using NV3.

Reviewed-by: Joey Gouly <joey.gouly@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h | 11 +++++++++++
 arch/arm64/kvm/hyp/vhe/switch.c            | 10 ++++++++--
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
index a17cbe7582de9..c382848d31947 100644
--- a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
+++ b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
@@ -172,6 +172,10 @@ static inline void __sysreg_save_el1_state(struct kvm_cpu_context *ctxt)
 
 	if (ctxt_has_sctlr2(ctxt))
 		ctxt_sys_reg(ctxt, SCTLR2_EL1) = read_sysreg_el1(SYS_SCTLR2);
+
+	/* Retrieve L2's HCR_EL2, and save it for future use */
+	if (is_nested_nv3_ctxt(ctxt_to_vcpu(ctxt)))
+		ctxt_sys_reg(ctxt, NVHCR_EL2) = read_sysreg_s(SYS_NVHCR_EL2);
 }
 
 static inline void __sysreg_save_el2_return_state(struct kvm_cpu_context *ctxt)
@@ -285,6 +289,13 @@ static inline void __sysreg_restore_el1_state(struct kvm_cpu_context *ctxt,
 
 	if (ctxt_has_sctlr2(ctxt))
 		write_sysreg_el1(ctxt_sys_reg(ctxt, SCTLR2_EL1), SYS_SCTLR2);
+
+	/*
+	 * Publish the L2 view of HCR_EL2 to the HW if L1 is using NV3.
+	 * Otherwise, the data is already in place in the L1's own VNCR.
+	 */
+	if (is_nested_nv3_ctxt(ctxt_to_vcpu(ctxt)))
+		write_sysreg_s(ctxt_sys_reg(ctxt, NVHCR_EL2), SYS_NVHCR_EL2);
 }
 
 /* Read the VCPU state's PSTATE, but translate (v)EL2 to EL1. */
diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
index ee92f6ad91c2b..e823046d28796 100644
--- a/arch/arm64/kvm/hyp/vhe/switch.c
+++ b/arch/arm64/kvm/hyp/vhe/switch.c
@@ -71,7 +71,10 @@ static u64 __compute_hcr(struct kvm_vcpu *vcpu)
 			hcr |= HCR_NV1;
 
 		/* Publish the guest's view of HCR_EL2 to the HW */
-		__vcpu_assign_sys_reg(vcpu, NVHCR_EL2, __vcpu_sys_reg(vcpu, HCR_EL2));
+		if (cpus_have_final_cap(ARM64_HAS_NV3) && vcpu_el2_e2h_is_set(vcpu))
+			write_sysreg_s(__vcpu_sys_reg(vcpu, HCR_EL2), SYS_NVHCR_EL2);
+		else
+			__vcpu_assign_sys_reg(vcpu, NVHCR_EL2, __vcpu_sys_reg(vcpu, HCR_EL2));
 
 		/*
 		 * Nothing in HCR_EL2 should impact running in hypervisor
@@ -562,7 +565,10 @@ static void fixup_nv_guest_exit(struct kvm_vcpu *vcpu)
 		*vcpu_cpsr(vcpu) |= mode;
 
 		/* Publish the latest HCR_EL2 to the emulation */
-		hcr = __vcpu_sys_reg(vcpu, NVHCR_EL2);
+		hcr = (cpus_have_final_cap(ARM64_HAS_NV3) &&
+		       vcpu_el2_e2h_is_set(vcpu)) ?
+			read_sysreg_s(SYS_NVHCR_EL2) :
+			__vcpu_sys_reg(vcpu, NVHCR_EL2);
 
 		__vcpu_assign_sys_reg(vcpu, HCR_EL2, hcr);
 	}
-- 
2.47.3


