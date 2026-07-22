Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0851C531C8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 07:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=urFu3N3DSFlg/Z5Zm400OYF9XCFOkrVrIat2GhiYAqY=; b=G/+6u7/9x/jBk/jTk+62u7Tu9R
	d76xvP2zGgcqlQbrP512sGsgyLBg+t5JW0gSQzMvgcVMtaJy98GiSjhsBTui98M5LYGzPf2OSydQN
	slisYKsO0p/VfRmyn+t3mJoMj4eVYBLDvL9x9SZVmst76GSK5Fg0cs6eEU0GTj/gaIvDPuiWy9LWY
	NbmxSa0FmYbxG+NXBCJOnJ2mNcq1mCyp11mbYvd352ZjBm3dMTtZY8cISpxe/w2NbcOgprg0Je+Nk
	YWsR3q5Lt8NaSNKxMmHZrE82VlPcpzsieyMFwgkV9nXJH0G7sZ8jlLqgKXO2xw2Eq6yRfaNp98AWv
	EDJqhorQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRc1-0000000B753-0EHi;
	Wed, 22 Jul 2026 07:43:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRbW-0000000B6gk-36iT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 07:42:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 31D1B60A68;
	Wed, 22 Jul 2026 07:42:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAB3D1F00ADB;
	Wed, 22 Jul 2026 07:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784706177;
	bh=urFu3N3DSFlg/Z5Zm400OYF9XCFOkrVrIat2GhiYAqY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NSJOePfwpCBswzYMseYDK8Th1ldxovXiBtYfVLgVwOocC/bJIvWiuLl0uuw/TN1Eq
	 UxZd6/cv8hN45OiTiL8315lGSy+6Wk/6qceH5aE2wJvHeEPgN2MED/6u3UVfb7XX7I
	 uPBQPC3fq82PAha36gHBw6Hb2HUW0U0CsGT4QYAjKwrIArOSfLNgf5lk+9Tm4zIqQb
	 z3BMWcRdhn/KkM4aVPe28ge9xUx/Hwguyj0I7GFunijtewLMdyRsMzMHEIsf5b9FOv
	 OrMdCB4rmYz1lWzSaSEZIL4WE1NfhkgjOOLNUqRoZOyeHamXNpPmWGHLcOs+Zrb5rW
	 YjhQQNMrkeh5g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wmRbU-00000007VfN-0vo9;
	Wed, 22 Jul 2026 07:42:56 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH v3 09/28] KVM: arm64: Relax CPTR_EL2 handling when FEAT_NV2p1 is present
Date: Wed, 22 Jul 2026 08:42:15 +0100
Message-ID: <20260722074234.3330999-10-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260722074234.3330999-1-maz@kernel.org>
References: <20260722074234.3330999-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, yaoyuan@linux.alibaba.com, weilin.chang@arm.com
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

With FEAT_NV2P1, it is no longer necessary to trap CPTR_EL2 accesses
via CPACR_EL1, as CPACR_EL1.TCPAC is guaranteed to be stateful.

Prevent such trapping and context switch CPACTR_EL1 in NV contexts
when NV2P1 is present.

Reviewed-by: Joey Gouly <joey.gouly@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/hyp/include/hyp/switch.h | 5 +++--
 arch/arm64/kvm/hyp/vhe/switch.c         | 3 +++
 arch/arm64/kvm/hyp/vhe/sysreg-sr.c      | 8 +++++---
 arch/arm64/kvm/sys_regs.c               | 5 ++++-
 4 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index 8e5f492f39086..7b27296c94607 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -108,9 +108,10 @@ static inline void __activate_cptr_traps_vhe(struct kvm_vcpu *vcpu)
 	 * The architecture is a bit crap (what a surprise): an EL2 guest
 	 * writing to CPTR_EL2 via CPACR_EL1 can't set any of TCPAC or TTA,
 	 * as they are RES0 in the guest's view. To work around it, trap the
-	 * sucker using the very same bit it can't set...
+	 * sucker using the very same bit it can't set. FEAT_NV2p1 fixes it.
 	 */
-	if (vcpu_el2_e2h_is_set(vcpu) && is_hyp_ctxt(vcpu))
+	if (!cpus_have_final_cap(ARM64_HAS_NV2P1) &&
+	    vcpu_el2_e2h_is_set(vcpu) && is_hyp_ctxt(vcpu))
 		val |= CPTR_EL2_TCPAC;
 
 	/*
diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
index 684cebf23aa0e..a8da40568a048 100644
--- a/arch/arm64/kvm/hyp/vhe/switch.c
+++ b/arch/arm64/kvm/hyp/vhe/switch.c
@@ -443,6 +443,9 @@ static bool kvm_hyp_handle_cpacr_el1(struct kvm_vcpu *vcpu, u64 *exit_code)
 	u64 esr = kvm_vcpu_get_esr(vcpu);
 	int rt;
 
+	if (cpus_have_final_cap(ARM64_HAS_NV2P1))
+		return false;
+
 	if (!is_hyp_ctxt(vcpu) || esr_sys64_to_sysreg(esr) != SYS_CPACR_EL1)
 		return false;
 
diff --git a/arch/arm64/kvm/hyp/vhe/sysreg-sr.c b/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
index be685b63e8cf2..6f0f046e4ca4e 100644
--- a/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
+++ b/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
@@ -42,10 +42,12 @@ static void __sysreg_save_vel2_state(struct kvm_vcpu *vcpu)
 		u64 val;
 
 		/*
-		 * We don't save CPTR_EL2, as accesses to CPACR_EL1
-		 * are always trapped, ensuring that the in-memory
-		 * copy is always up-to-date. A small blessing...
+		 * Without FEAT_NV2p1, we don't save CPTR_EL2, as accesses
+		 * to CPACR_EL1 are always trapped, ensuring that the
+		 * in-memory copy is always up-to-date. A small blessing...
 		 */
+		if (cpus_have_final_cap(ARM64_HAS_NV2P1))
+			__vcpu_assign_sys_reg(vcpu, CPTR_EL2, read_sysreg_el1(SYS_CPACR));
 		__vcpu_assign_sys_reg(vcpu, SCTLR_EL2,	 read_sysreg_el1(SYS_SCTLR));
 		__vcpu_assign_sys_reg(vcpu, TTBR0_EL2,	 read_sysreg_el1(SYS_TTBR0));
 		__vcpu_assign_sys_reg(vcpu, TTBR1_EL2,	 read_sysreg_el1(SYS_TTBR1));
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 6b47d936efb32..1dfc1f88bec82 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -326,7 +326,10 @@ u64 vcpu_read_sys_reg(const struct kvm_vcpu *vcpu, enum vcpu_sysreg reg)
 			val |= __vcpu_sys_reg(vcpu, reg) & ~CNTKCTL_VALID_BITS;
 			return val;
 		case CPTR_EL2:
-			return __vcpu_sys_reg(vcpu, reg);
+			if (cpus_have_final_cap(ARM64_HAS_NV2P1))
+				return read_sysreg_el1(SYS_CPACR);
+			else
+				return __vcpu_sys_reg(vcpu, reg);
 		default:
 			WARN_ON_ONCE(1);
 		}
-- 
2.47.3


