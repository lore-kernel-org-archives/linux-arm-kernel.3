Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C954AC44507
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 09:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z9PSMZ4DU3SB7MZOcmjM/U9K6hLtCBzBnZ9uQmrX33I=; b=Ld0x4s+c1fgq8EVfHSqfzMh0rk
	oJ3nzSWsnKaeeXYGwEMiF/VnqT8gMT/9DeKMu6TS978rM/tBLsL2pKfevkH2j/HbyWqd3HONsYYq6
	FmCSFuzRKPpVSRss9P2syw8TDB7lsrwe23Za+ELmBhGkp0m7NGm6/kYmDZ3gYP8FN7DgnomBJVHv5
	pu7pzhYOYTKvv9Z1qjgi5ovuBDu/RHmu24EzwHKFpxTzibvAF6A70cE/qB85yj/yAyZ3fMromGuOu
	aHjwZi+SB6xAwE/XlPSgD/FlRNFj9LHX5V3S/IXCeGhDil5HDrCNqXxQOCM4TwuvtZTBEH17+4EKp
	xTCh5T3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZGB-0000000BPDC-2ATi;
	Tue, 14 Jul 2026 09:17:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZFz-0000000BP2o-3joa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 09:16:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D21D4601ED;
	Tue, 14 Jul 2026 09:16:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87EB81F00A3E;
	Tue, 14 Jul 2026 09:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784020610;
	bh=Z9PSMZ4DU3SB7MZOcmjM/U9K6hLtCBzBnZ9uQmrX33I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EVR77mP9F5wZslq8g5qVJ8ORQ3KpYY9EzseNexYMqoQHxQDkTWx45iNmUJRpv9NGv
	 AypEJgoWGHJflpyB34Pp3s7o7tOWzqCIBS0OwAzOTXhGEY0u3hrjdKewBKa1nvKt4O
	 uhieKWHypgHcf/4IP08f4WASpvZfyyDHq3d7vodlcDtK4UIOEva4Awk5pHKtJmJkUa
	 PK4UI1A5AxmQXixTj4FC6Q/+o368kkmvuS//47KYR0xIHhGQe6HhbfgIUo+QMwZUQo
	 jgGFoPqIOsNsYJuPOWhg6n48GsaNVv3OeUo+083e1xBnl1w+Dt2281OLOfW0DvIxn1
	 Ie9olAkVa5lkg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wjZFw-00000004ny1-3dGN;
	Tue, 14 Jul 2026 09:16:48 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v2 09/28] KVM: arm64: Relax CPTR_EL2 handling when FEAT_NV2p1 is present
Date: Tue, 14 Jul 2026 10:16:22 +0100
Message-ID: <20260714091641.1970822-10-maz@kernel.org>
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
index a83be345f8450..8460a8a6745b3 100644
--- a/arch/arm64/kvm/hyp/vhe/switch.c
+++ b/arch/arm64/kvm/hyp/vhe/switch.c
@@ -438,6 +438,9 @@ static bool kvm_hyp_handle_cpacr_el1(struct kvm_vcpu *vcpu, u64 *exit_code)
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


