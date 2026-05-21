Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3592CD5BB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 13:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cqUZIF/2Cr/WPf5X6pZcobhmBlqrkInnty14Ry9bxwg=; b=e218v/U34ZoGQjWlrZ2610tvO+
	OEsk5Ed/u4Gf5m6XqR5l374E3d91TCN1DSSkZN0M1AH4oyyILhEIA7qAvDDggYyk5zwMGR480Immi
	Rlojcg/lgCM3g2ipZYFdB5yxKTwLZQ9/6weHY2FdlbXf7BGBvy0VdVFVaosjyz8yn2VhfCHChyY5j
	2BZDx4ZDMsHIypwTsFbEd+nmDf+tLGhwLfeuYa8My3Vn7UDr55keJZKUQ/qfit24FatkOc4RZAFLJ
	1n8WDY3sgAm2xZPW2+ew69s6qX2tMWy3QIIFG+3V8cy/KHliVoDQwBdQP23iHoZpCGZfzVOMFg6+C
	jTBys5Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ3Pq-00000007rv6-26rO;
	Thu, 21 May 2026 13:26:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ3Ph-00000007rrJ-1jr0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 13:26:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 99CCA1C00;
	Thu, 21 May 2026 06:26:06 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 72EC53F7B4;
	Thu, 21 May 2026 06:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779369971; bh=acwW680FlgHoPISjQUrXZt5zYBW0vWNqCyeLFyG2C58=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TUtxTkMTUPF2fjbsXCGRmLyOVS1qkVDP0GLZHuyOM6v6HRyIS2eq+Dt26tUGpkZIc
	 Vt/BLwPWwKONF4JSSr+DLYCjJ1O0HpFxct5ETKS46olj4tNan9wwAp8iV3Aqv3tHAO
	 WaGpgzEIIkB2ABz0stQjG9CNOhL9MHA/l5hiQqaw=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	james.morse@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	oupton@kernel.org,
	tabba@google.com,
	will@kernel.org
Subject: [PATCH 03/18] KVM: arm64: pkvm: Save host FPMR in host cpu context
Date: Thu, 21 May 2026 14:25:41 +0100
Message-Id: <20260521132556.584676-4-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260521132556.584676-1-mark.rutland@arm.com>
References: <20260521132556.584676-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_062613_603725_4F3F4A41 
X-CRM114-Status: GOOD (  13.20  )
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

Protected KVM stores most of the host's system register state in
kvm_host_data::host_ctxt, which is an instance of struct
kvm_cpu_context. As kvm_cpu_context::sys_regs[] has a slot for FPMR, we
can store the host's FPMR there.

Do so, and remove kvm_host_data::fpmr.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Fuad Tabba <tabba@google.com>
Cc: James Morse <james.morse@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h       | 3 ---
 arch/arm64/kvm/hyp/include/hyp/switch.h | 6 ++++--
 arch/arm64/kvm/hyp/nvhe/hyp-main.c      | 5 +++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 65eead8362e0b..42b1c4764a4bf 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -775,9 +775,6 @@ struct kvm_host_data {
 	 */
 	struct cpu_sve_state *sve_state;
 
-	/* Used by pKVM only. */
-	u64	fpmr;
-
 	/* Ownership of the FP regs */
 	enum {
 		FP_STATE_FREE,
diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index 98b2976837b11..cc4d011a2b380 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -554,6 +554,8 @@ static inline void fpsimd_lazy_switch_to_host(struct kvm_vcpu *vcpu)
 
 static void kvm_hyp_save_fpsimd_host(struct kvm_vcpu *vcpu)
 {
+	struct kvm_cpu_context *hctxt = host_data_ptr(host_ctxt);
+
 	/*
 	 * Non-protected kvm relies on the host restoring its sve state.
 	 * Protected kvm restores the host's sve state as not to reveal that
@@ -562,11 +564,11 @@ static void kvm_hyp_save_fpsimd_host(struct kvm_vcpu *vcpu)
 	if (system_supports_sve()) {
 		__hyp_sve_save_host();
 	} else {
-		__fpsimd_save_state(host_data_ptr(host_ctxt.fp_regs));
+		__fpsimd_save_state(&hctxt->fp_regs);
 	}
 
 	if (kvm_has_fpmr(kern_hyp_va(vcpu->kvm)))
-		*host_data_ptr(fpmr) = read_sysreg_s(SYS_FPMR);
+		ctxt_sys_reg(hctxt, FPMR) = read_sysreg_s(SYS_FPMR);
 }
 
 
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 06db299c37a89..db60f770060e5 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -66,6 +66,7 @@ static void fpsimd_sve_flush(void)
 
 static void fpsimd_sve_sync(struct kvm_vcpu *vcpu)
 {
+	struct kvm_cpu_context *hctxt = host_data_ptr(host_ctxt);
 	bool has_fpmr;
 
 	if (!guest_owns_fp_regs())
@@ -89,10 +90,10 @@ static void fpsimd_sve_sync(struct kvm_vcpu *vcpu)
 	if (system_supports_sve())
 		__hyp_sve_restore_host();
 	else
-		__fpsimd_restore_state(host_data_ptr(host_ctxt.fp_regs));
+		__fpsimd_restore_state(&hctxt->fp_regs);
 
 	if (has_fpmr)
-		write_sysreg_s(*host_data_ptr(fpmr), SYS_FPMR);
+		write_sysreg_s(ctxt_sys_reg(hctxt, FPMR), SYS_FPMR);
 
 	*host_data_ptr(fp_owner) = FP_STATE_HOST_OWNED;
 }
-- 
2.30.2


