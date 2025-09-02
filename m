Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8CD4CA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 13:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=STRbBIxviuKhs+jzlInTpwJifD0wdHKunxeAO7GERwQ=; b=HqznOYl2WRbYHC5ZwPhIqwVr5N
	8sXKBQpv/AO1TLXIovFYMr8/NbIV3yh1s83zznvd33MlQ6hSAKTpOKo+IBpeeUV34NfUGFq0Oh137
	4lKl6h76tcsl7oOqADtl5uo7DjyIrtMXHwURvEZ95qDg6MIC5SzK+FD/lyx4tCF1hljlZYy5rOVSF
	n2IwFgUqw5XhDnlAhvichgGJKrv6Uhmo/lSxe36uW9mqM+9UXnBsTho0IqU2Xth6DaSROz1mHWAMe
	A8ud3STba2xtfQS1ycjWAmMBjOKKRYL+dv/6BdTTwx4TTFcsUc0GVGyTBH1OXsuL7z02Cy3K0ijRs
	9iXL48MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQuo-0000000HaYP-47pt;
	Tue, 02 Sep 2025 13:19:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utPRC-0000000Gyb2-3fRN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 11:44:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4FD336020A;
	Tue,  2 Sep 2025 11:44:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49F2CC4CEF5;
	Tue,  2 Sep 2025 11:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756813474;
	bh=tDa3Sk8XxTm+Aaxc1UJdjATH+x+7vPOsHdbcIxBkYo8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QumXOoYloKKun156twQI0T4S7LRNQb8YF7ctqGvDc2K9ZgHag2BOSdTV70x7CpALy
	 4yfSZ6kClvP7QP7yZbotUPIsIRkzGG6oRE4Req3fh0+a0BohPY82+eUZ8l0PVHQwNv
	 pSCWSBz2CoA41fZ3ItB2F0BYlhKj75llk3GGkNYxedQaZbSnxHM+dF/ijfc7rtK/CM
	 ZkohTueUr7XR68QNS1L/s8NIlTZxY69appZ7HqRjVxsS5UvsENub+JXRpkUotBpzpu
	 MtJGfhNekpEAmoHpKVHj2x5IyDGjL5lky+IMZ1vIyqr+1E3l8io35Pw+3fGOn0Eid0
	 fBrZSAUCXipHw==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 02 Sep 2025 12:36:06 +0100
Subject: [PATCH v8 03/29] arm64/fpsimd: Decide to save ZT0 and streaming
 mode FFR at bind time
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-kvm-arm64-sme-v8-3-2cb2199c656c@kernel.org>
References: <20250902-kvm-arm64-sme-v8-0-2cb2199c656c@kernel.org>
In-Reply-To: <20250902-kvm-arm64-sme-v8-0-2cb2199c656c@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-cff91
X-Developer-Signature: v=1; a=openpgp-sha256; l=3253; i=broonie@kernel.org;
 h=from:subject:message-id; bh=tDa3Sk8XxTm+Aaxc1UJdjATH+x+7vPOsHdbcIxBkYo8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBotth8ditRMtDuLvggdD2r+WCiNbXhCyjDKZFV5
 ekI3TZJ3JmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaLbYfAAKCRAk1otyXVSH
 0CJgB/93wLP5ln56mIw0GDElH3woq2lftowDHQ2xYMVsC8HN3kKR+9SSIzk+AUg2So9qg4PtzTX
 bn3CGbEI2ifWDrvqgBk4wohx+K0L/yh+qwt4TTgwN+4LWZrBfL4dKziYpvQVfA8cAlaxyUgfEzs
 8kkt3VNFPVvm2QkENSBnAFVsTHgYtA3w/Gu6hqsbibPC6qK5ylcbUbGibdLpGObZp5xjT3f1efq
 Lh0KAM148dOO94Qr3hA8LxVXyOkJIFxSIvoqXw82cwwoBwnZ5D21Nerk4RHAforvAMMiU5Sk07K
 95jNzlwsfaPOLGe5SwVHxMfUJAdRYcgGbwRHXUoYf6uWwJub
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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
index b4359f942621..0ecdd7dcf623 100644
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
index 653c0dec6b18..77f9dfaffe8b 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -477,12 +477,12 @@ static void fpsimd_save_user_state(void)
 
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
@@ -1655,6 +1655,12 @@ static void fpsimd_bind_task_to_cpu(void)
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
2.39.5


