Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4216CE6B26D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 01:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uzbaq56zMB6SrYQOiN6ea3kGbuNEA4Dr1EGvzfGtb/8=; b=lzaTtxjwUsxEmBjBOHkA1wVEtt
	UmwRXZf+nMvzX1vTNJoVr5hQz8G6ADpfUINg8roCfqfoqdt3Fi3ydaGdMdobVPLzOJOr/VPVR7CFH
	YhukJuaHFcZyghxIB5Dc5ToLMqsfZ0bxWz70atiktm4IWHv6ZUZkfeF0BcSdLRer96NladEFmH0q9
	C09vSY7MN5tyjF3sRM8PzM22qSHalJJNXJAYmXaX67lVgJICXrOavx7icN+QtOfdkTF+wW5SdPn/N
	MtNjsODtBAurHsK0Jyt68i8s0CdjcEAXwmybcjUTe4UuirAjpFV2eG4fvsBwLejenUvp0SJhtpbaW
	4t/eINWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXr5y-0000000ELIk-1UAS;
	Tue, 23 Dec 2025 01:21:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXr5w-0000000ELHT-0eJa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 01:21:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D65BE43893;
	Tue, 23 Dec 2025 01:21:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD117C19425;
	Tue, 23 Dec 2025 01:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766452907;
	bh=AMoEF0nrqU26LQooV0kBfxDCIBukvmAs571HQFetjbk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Z9DIaYE67tRSltM+1hG5us1paTYsOBt6mnBkbXS7Ha8VkxAoThUi82GMOF31urORP
	 dCqVhrLmjHvjRB3jvX9i8W7jFTTAx0Z/F0CECVBMwoxzD+Pjp8lfERPTPrJ2rDTia/
	 HRYJ84LW6XpiN8NOnHdTBUoGsygC6xcprc7ec4bcHu7mnSjv9pyJIrb3xxVdOrJLgG
	 GEKnqYOPYnJkK+S1WZegocC5Q6ur1AfKvBvIwjCElqDrMMa80D4PZfJBuK0Yh3qP4T
	 cOzl3QQNz6ehDR4vzLX3m2HwQEwAHA3KuYTHTDrni9AINCDPVuF/86euOo6gTGdUCd
	 5eWNNh2ySeReA==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 23 Dec 2025 01:20:57 +0000
Subject: [PATCH v9 03/30] arm64/fpsimd: Decide to save ZT0 and streaming
 mode FFR at bind time
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-kvm-arm64-sme-v9-3-8be3867cb883@kernel.org>
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org>
In-Reply-To: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=3253; i=broonie@kernel.org;
 h=from:subject:message-id; bh=AMoEF0nrqU26LQooV0kBfxDCIBukvmAs571HQFetjbk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpSe6EqgzzsT+BP4JPJTNb7yndoTQdPD2m7a+nK
 80LYt1smamJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaUnuhAAKCRAk1otyXVSH
 0CpxB/wMQFXj7q5Ry0rGSuTXXxCQ4zusY5Q91V6JpRdifOT+ybfhMl2E+fqzmSSQuaI/45E1rsR
 OG8TOpMjDJhmbPCNxkJCSE2+WiDzyT82rYDLJW2cxop5mXseS2pAIEbVs+gnexyXT+m6R7svl0k
 uYtnStqc2N4XIeG9iULMb0Cwbb1Wl+E6jjhS13OeUCyQ+maFDk7neI9dODsg5ZLttSa/oXGaBNV
 vWDXQLHK41Tyxzn0HLEkcqcKwyarx0Nfknsv7bUJOBlNseiIjNM/oWKj3WeRlJO7wMO1Gg0rseN
 FqkImvbppiz42Cssne1b4FoYpH8iwuE7PT+Pwi6M8jtH5mJY
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_172148_241121_D1415B1D 
X-CRM114-Status: GOOD (  18.72  )
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

Some parts of the SME state are optional, enabled by additional features
on top of the base FEAT_SME and controlled with enable bits in SMCR_ELx. We
unconditionally enable these for the host but for KVM we will allow the
feature set exposed to guests to be restricted by the VMM. These are the
FFR register (FEAT_SME_FA64) and ZT0 (FEAT_SME2).

We defer saving of guest floating point state for non-protected guests to
the host kernel. We also want to avoid having to reconfigure the guest
floating point state if nothing used the floating point state while running
the host. If the guest was running with the optional features disabled then
traps will be enabled for them so the host kernel will need to skip
accessing that state when saving state for the guest.

Support this by moving the decision about saving this state to the point
where we bind floating point state to the CPU, adding a new variable to
the cpu_fp_state which uses the enable bits in SMCR_ELx to flag which
features are enabled.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/fpsimd.h |  1 +
 arch/arm64/kernel/fpsimd.c      | 10 ++++++++--
 arch/arm64/kvm/fpsimd.c         |  1 +
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/fpsimd.h b/arch/arm64/include/asm/fpsimd.h
index ece65061dea0..146c1af55e22 100644
--- a/arch/arm64/include/asm/fpsimd.h
+++ b/arch/arm64/include/asm/fpsimd.h
@@ -87,6 +87,7 @@ struct cpu_fp_state {
 	void *sme_state;
 	u64 *svcr;
 	u64 *fpmr;
+	u64 sme_features;
 	unsigned int sve_vl;
 	unsigned int sme_vl;
 	enum fp_type *fp_type;
diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index be4499ff6498..887fce177c92 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -490,12 +490,12 @@ static void fpsimd_save_user_state(void)
 
 		if (*svcr & SVCR_ZA_MASK)
 			sme_save_state(last->sme_state,
-				       system_supports_sme2());
+				       last->sme_features & SMCR_ELx_EZT0);
 
 		/* If we are in streaming mode override regular SVE. */
 		if (*svcr & SVCR_SM_MASK) {
 			save_sve_regs = true;
-			save_ffr = system_supports_fa64();
+			save_ffr = last->sme_features & SMCR_ELx_FA64;
 			vl = last->sme_vl;
 		}
 	}
@@ -1671,6 +1671,12 @@ static void fpsimd_bind_task_to_cpu(void)
 	last->to_save = FP_STATE_CURRENT;
 	current->thread.fpsimd_cpu = smp_processor_id();
 
+	last->sme_features = 0;
+	if (system_supports_fa64())
+		last->sme_features |= SMCR_ELx_FA64;
+	if (system_supports_sme2())
+		last->sme_features |= SMCR_ELx_EZT0;
+
 	/*
 	 * Toggle SVE and SME trapping for userspace if needed, these
 	 * are serialsied by ret_to_user().
diff --git a/arch/arm64/kvm/fpsimd.c b/arch/arm64/kvm/fpsimd.c
index 15e17aca1dec..9158353d8be3 100644
--- a/arch/arm64/kvm/fpsimd.c
+++ b/arch/arm64/kvm/fpsimd.c
@@ -80,6 +80,7 @@ void kvm_arch_vcpu_ctxsync_fp(struct kvm_vcpu *vcpu)
 		fp_state.svcr = __ctxt_sys_reg(&vcpu->arch.ctxt, SVCR);
 		fp_state.fpmr = __ctxt_sys_reg(&vcpu->arch.ctxt, FPMR);
 		fp_state.fp_type = &vcpu->arch.fp_type;
+		fp_state.sme_features = 0;
 
 		if (vcpu_has_sve(vcpu))
 			fp_state.to_save = FP_STATE_SVE;

-- 
2.47.3


