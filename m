Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37204FCB638
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 17:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lTpibdk0INsbELEnTcirY7P5S3JIEI85hp5KO2wcvqI=; b=Hq1ONgXzNkIFXuJBNsb9vYy197
	yFhzacaLtq2f0TH0weI2LjUIS4pv6h73uVRi1j8mNCQETTU7wgtLxR9K+GbixDrySo65SpL5KPQvF
	dT3woRxJzkrkEYKl+PNVnc5BQKajdihS30DUVITAQrxPv4l0RokNXIXy60BohMwhS3yXEWKV+eG77
	MSi/WnMdwx2MZAr4hsXJtiP+5gVqI6+YaLb5pzqP3OjipGXugPTXzxxNVNAqcd9lOkcW8t5MuCHmQ
	zPDVEcJD+qO/SD1lZGVEQbTnY9b7xVb0zHvy8pmFSCHp9GD57nIRj0HOUTWTLofkeAI0PI0Cl5L5U
	MjgGe2KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYgN-00000004Ckx-3pFA;
	Fri, 06 Mar 2026 17:09:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYgM-00000004Cjo-2EoW
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 06 Mar 2026 17:09:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=lTpibdk0INsbELEnTcirY7P5S3JIEI85hp5KO2wcvqI=; b=XQLeb/+/U3zlW86AYpOMMgwJCr
	d+unGOJnEjuUuRlgLhNX3Vcdai2gJ/j0Uc6DHvGf+9/iuxrJRYkXdDjtl6mn+AazBduXkJQf90I/w
	rdnUI8Omo+gXQOU+e1PJ+/oU5LT8PeZ8e6V+Cz9jdiNyQOi8W1Zfe9S5v8sCLEO7FmZ8i6HxGmClj
	PIX5diosIHVdQblevJEc/4i/tU4RMorPXGpD+WBi4zbdLCpwwqObXY4hQOGut2vvxMQRR3aP3gBRf
	HZqHS9J0Bi2TXiSnZXnZtOrZwCWlJCEUIX9Hdb/nlMeiy5SJBNUPubdVSxwQLvLQCvKzLGggO2IXb
	FfZR24Iw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYgI-00000009JGP-3jSY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 17:09:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9438A4328A;
	Fri,  6 Mar 2026 17:09:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75FCAC19425;
	Fri,  6 Mar 2026 17:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772816978;
	bh=sM9E+HyTSNR7eo/xMvIQXOjg3Prwq/RvlNfqR4HFAKw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pa8RwM4heujOlb8MDd1b6sXTwRaFj5C21AjuX5JQgc3XvXVc3KoNh4ciBe5o9W6KQ
	 Y18LpZLHpa32FY7l/zQkOAnTzZbYiNmmCdAREWxN18rY2Z71qZr++0Qt5VvKqO25Xw
	 YhfIZn4fJa3tRToMqwgIOpg88U20o1JhIGEIamM83dOx1xc0RQ5TVCicVB3CNTTfXx
	 t3Q05+VwkA/mt+4aXHVgnuFQmw1FwYZdNP0aEwU/pE7xe7TAZTFof4CmMzhjiWAOrU
	 YOnBiHQFkI3oFsK/HKJ3VPAD39X+SagQqrnvNUf3aGRgJtar6W4prfeqzrYFchbi0T
	 8A7o2JmZQx4Ag==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 06 Mar 2026 17:00:55 +0000
Subject: [PATCH v10 03/30] arm64/fpsimd: Decide to save ZT0 and streaming
 mode FFR at bind time
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-kvm-arm64-sme-v10-3-43f7683a0fb7@kernel.org>
References: <20260306-kvm-arm64-sme-v10-0-43f7683a0fb7@kernel.org>
In-Reply-To: <20260306-kvm-arm64-sme-v10-0-43f7683a0fb7@kernel.org>
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
X-Mailer: b4 0.15-dev-6ac23
X-Developer-Signature: v=1; a=openpgp-sha256; l=3297; i=broonie@kernel.org;
 h=from:subject:message-id; bh=sM9E+HyTSNR7eo/xMvIQXOjg3Prwq/RvlNfqR4HFAKw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpqwoq5zUTgfzO46tRiQ5ZzpXJgba6fXPBrZsxe
 +CIkm++mEmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaasKKgAKCRAk1otyXVSH
 0CwJB/9C13km6pWUoAvqHsbOVm3SS4n6CBgFM2r7aTMrW+PlTIWM83xo0vOJA4Nt7RlP2JD2NSF
 srDCWFqiDsg+m1VKmZGMb9uIrAOwFogIxAd3QPCXL7nfFnecDbFCcpYFM94kJnrG/va6nd2/VT7
 qBRg2PIdfcYLHCKQMxm+U9gLFnO755Vnz31WxvbJGnSqNRilZ/533E+pKyWoePCeF1vwFPa+Zz9
 EmuK34/nfAeu7PrcNdr0ZgGzbiSe3nGSrmvPa+INrTIxWQ1/iyOv8HWM19gHXQ4VhQnxo1RjNJz
 /st2NpVPHhU0H1Lo9zuGjEODTgtAXWmEIysw8IrW+OBz7HtQ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_170943_368725_B4E5E9BA 
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

Reviewed-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/fpsimd.h |  1 +
 arch/arm64/kernel/fpsimd.c      | 10 ++++++++--
 arch/arm64/kvm/fpsimd.c         |  1 +
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/fpsimd.h b/arch/arm64/include/asm/fpsimd.h
index 7361b3b4a5f5..e97729aa3b2f 100644
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
index cf419319f077..2af0e0c5b9f4 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -483,12 +483,12 @@ static void fpsimd_save_user_state(void)
 
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
@@ -1632,6 +1632,12 @@ static void fpsimd_bind_task_to_cpu(void)
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


