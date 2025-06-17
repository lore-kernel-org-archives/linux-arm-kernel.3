Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D27AC71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 14:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2vGocA0NzmxAsML3Qid17hAMGJrIycCA470w0MqI028=; b=njO7YcRU2eRQNtaVwWNYe9b83Z
	Bhp7eS+OVXQEpvPl01+Ai/8BuCSTncXhijnarnXtBIU6YoVX2hwPDTNnrjVG/DdclMDploL6Zfvn/
	W2Bi3ewA+WW4ik+M8TR0egn6xOCLSUphDtFvaH8PzqLIH1WmPkehyXDIa05sjAAW/57O5qrRP4TAw
	/iIfDxbRM8CYKwH2keQW6H+KDksya652QzyPflPSycxUpcthGXD/1l4AoEp30rm3Zuz1Wj2hVLwg/
	9M7ijJq8QNsx9rZOE/xps1woZC24vdIIak9VJ6O0fNq1zFstSrVlQZRdkMButft94xgwi9/OrHaxN
	1NdC5rVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWtM-00000007Sr8-07iy;
	Tue, 17 Jun 2025 14:02:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWVX-00000007NzT-3XiS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 13:37:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E95F1596;
	Tue, 17 Jun 2025 06:37:26 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 657653F673;
	Tue, 17 Jun 2025 06:37:45 -0700 (PDT)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	kvmarm@lists.linux.dev,
	mark.rutland@arm.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	stable@vger.kernel.org,
	tabba@google.com,
	will@kernel.org
Subject: [PATCH 7/7] KVM: arm64: VHE: Centralize ISBs when returning to host
Date: Tue, 17 Jun 2025 14:37:18 +0100
Message-Id: <20250617133718.4014181-8-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250617133718.4014181-1-mark.rutland@arm.com>
References: <20250617133718.4014181-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_063748_170078_84BB9703 
X-CRM114-Status: GOOD (  18.05  )
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

The VHE hyp code has recently gained a few ISBs. Simplify this to one
unconditional ISB in __kvm_vcpu_run_vhe(), and remove the unnecessary
ISB from the kvm_call_hyp_ret() macro.

While kvm_call_hyp_ret() is also used to invoke
__vgic_v3_get_gic_config(), but no ISB is necessary in that case either.

For the moment, an ISB is left in kvm_call_hyp(), as there are many more
users, and removign the ISB would require a more thorough audit.

Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Fuad Tabba <tabba@google.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h         |  6 ++----
 arch/arm64/kvm/hyp/include/hyp/debug-sr.h |  3 ---
 arch/arm64/kvm/hyp/vhe/switch.c           | 25 +++++++++++------------
 3 files changed, 14 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 382b382d14dac..2e3c152668eb8 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1289,9 +1289,8 @@ void kvm_arm_resume_guest(struct kvm *kvm);
 	})
 
 /*
- * The couple of isb() below are there to guarantee the same behaviour
- * on VHE as on !VHE, where the eret to EL1 acts as a context
- * synchronization event.
+ * The isb() below is there to guarantee the same behaviour on VHE as on !VHE,
+ * where the eret to EL1 acts as a context synchronization event.
  */
 #define kvm_call_hyp(f, ...)						\
 	do {								\
@@ -1309,7 +1308,6 @@ void kvm_arm_resume_guest(struct kvm *kvm);
 									\
 		if (has_vhe()) {					\
 			ret = f(__VA_ARGS__);				\
-			isb();						\
 		} else {						\
 			ret = kvm_call_hyp_nvhe(f, ##__VA_ARGS__);	\
 		}							\
diff --git a/arch/arm64/kvm/hyp/include/hyp/debug-sr.h b/arch/arm64/kvm/hyp/include/hyp/debug-sr.h
index 73881e1dc2679..502a5b73ee70c 100644
--- a/arch/arm64/kvm/hyp/include/hyp/debug-sr.h
+++ b/arch/arm64/kvm/hyp/include/hyp/debug-sr.h
@@ -167,9 +167,6 @@ static inline void __debug_switch_to_host_common(struct kvm_vcpu *vcpu)
 
 	__debug_save_state(guest_dbg, guest_ctxt);
 	__debug_restore_state(host_dbg, host_ctxt);
-
-	if (has_vhe())
-		isb();
 }
 
 #endif /* __ARM64_KVM_HYP_DEBUG_SR_H__ */
diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
index 32b4814eb2b7a..477f1580ffeaa 100644
--- a/arch/arm64/kvm/hyp/vhe/switch.c
+++ b/arch/arm64/kvm/hyp/vhe/switch.c
@@ -558,10 +558,10 @@ static int __kvm_vcpu_run_vhe(struct kvm_vcpu *vcpu)
 	host_ctxt = host_data_ptr(host_ctxt);
 	guest_ctxt = &vcpu->arch.ctxt;
 
-	sysreg_save_host_state_vhe(host_ctxt);
-
 	fpsimd_lazy_switch_to_guest(vcpu);
 
+	sysreg_save_host_state_vhe(host_ctxt);
+
 	/*
 	 * Note that ARM erratum 1165522 requires us to configure both stage 1
 	 * and stage 2 translation for the guest context before we clear
@@ -586,18 +586,23 @@ static int __kvm_vcpu_run_vhe(struct kvm_vcpu *vcpu)
 
 	__deactivate_traps(vcpu);
 
-	/* Ensure CPTR trap deactivation has taken effect */
+	sysreg_restore_host_state_vhe(host_ctxt);
+
+	__debug_switch_to_host(vcpu);
+
+	/*
+	 * Ensure that all system register writes above have taken effect
+	 * before returning to the host. In VHE mode, CPTR traps for
+	 * FPSIMD/SVE/SME also apply to EL2, so FPSIMD/SVE/SME state must be
+	 * manipulated after the ISB.
+	 */
 	isb();
 
 	fpsimd_lazy_switch_to_host(vcpu);
 
-	sysreg_restore_host_state_vhe(host_ctxt);
-
 	if (guest_owns_fp_regs())
 		__fpsimd_save_fpexc32(vcpu);
 
-	__debug_switch_to_host(vcpu);
-
 	return exit_code;
 }
 NOKPROBE_SYMBOL(__kvm_vcpu_run_vhe);
@@ -627,12 +632,6 @@ int __kvm_vcpu_run(struct kvm_vcpu *vcpu)
 	 */
 	local_daif_restore(DAIF_PROCCTX_NOIRQ);
 
-	/*
-	 * When we exit from the guest we change a number of CPU configuration
-	 * parameters, such as traps.  We rely on the isb() in kvm_call_hyp*()
-	 * to make sure these changes take effect before running the host or
-	 * additional guests.
-	 */
 	return ret;
 }
 
-- 
2.30.2


