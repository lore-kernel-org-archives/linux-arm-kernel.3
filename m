Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27866C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 00:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0e+mUjDAWf3s0YKL6KQvH3NwIpYY0unoMYXfb9E1b+g=; b=XKs2au3Cx4trO6Pw8l4l3L9Gqi
	9eMMhDCsiOwGibCyVID7DAfGcs6Z3jQdBH5v8byP0n8Ts0MKHuvuytnwORQ745r54xU69f63t2+Km
	rCCMjncUkV4sg3iuJP6Rkwd6eguFlDkO4K01EDXzL0upFw3gH42MCR/JRbMBILf9JQvd8j1TGka+p
	Zm7eiV/I/NZnWB+wjKweBHt0S3ufwYfxp5R8DFw7hhhEUagQR4wpcX4ppkYgPgsjI9cOH19OGHm85
	ox6AB5hGR6trJ4KG0lJBa6X9a/ziZ0jTGcpzrLkmth5BHe7tUEtQwped7vW9yVnXYBtX9mf9G4AOF
	omsB/J4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvQai-0000000DapP-433Y;
	Fri, 21 Mar 2025 00:50:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvQ5k-0000000DXV5-3dyW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 00:18:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4AEA25C6820;
	Fri, 21 Mar 2025 00:16:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85AE3C4CEDD;
	Fri, 21 Mar 2025 00:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742516308;
	bh=CFBkZ3D3qqKor5Kj9cL5tM3zTXoy9Y0nRxvtgtnhaUQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pIVATjvSPxV7eaF1uh1SB3g2F3VirR4rPbKKUZnzb+gD8uIISrkYKbRDHG6ujaOv0
	 Coqp+rN5bUMGgY4EEAdIoXSt3qkvcZ82q3TLLdsmlG8DgJhNrGs7D53PwxiAtO8Ss1
	 e0sU24+C3MRPDkz7YZo1m6A9x6rZpmIBPj8G+UGacbTSCKnaAhjJgMVrCW9xl1Te6F
	 Gv1UHwVhr6Tp2Q8KxQeZ++thAAHOb1LumHpZc7sCQLnGisiw8be1WmdWJbYG6mbzgh
	 PtX7nNY2KZAIy5L5VMwIwSjxhPUg+QsenQp2Gr8n8HkwOueDkDxQEfZl6B46HVr+F2
	 E9kb27/LopShA==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 21 Mar 2025 00:16:04 +0000
Subject: [PATCH 6.6 4/8] KVM: arm64: Remove VHE host restore of
 CPACR_EL1.ZEN
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250321-stable-sve-6-6-v1-4-0b3a6a14ea53@kernel.org>
References: <20250321-stable-sve-6-6-v1-0-0b3a6a14ea53@kernel.org>
In-Reply-To: <20250321-stable-sve-6-6-v1-0-0b3a6a14ea53@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Fuad Tabba <tabba@google.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=3631; i=broonie@kernel.org;
 h=from:subject:message-id; bh=bEhjaWWeo3MZO4hv+4A0+U6DdeP5Zvjor/41KIDmUy4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBn3LA9h7iGC6z3d780UO9FNjZjJlZmARitK1wAo5KK
 CyUCMcmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ9ywPQAKCRAk1otyXVSH0CueCA
 CCr8ZNxeoYBGooYidPdc4468iwsk8Q3DIHQHwgFNO/Wa9FS57xkTpMSZFsBJEhksiGasBeDTcQMOQV
 YfDj4w8ImQclIvmXq/WPHewaesljGxLjGaHGCapiX5XpVeXJTuHvG5IP/2/dK2WKPcUTsoxZ0f7wm7
 awdhgw+iZA/ntG3LSKmP7LP83HyzQ1CE6xyBu/r/NVW0zgv5tr22bRdd2qKKivuK0SPsdUKS8RUjDl
 mW4suwnCmYV56lizBnBYD0+AX5hYR/KuDL8KDBFUUYOnjCAgohQIBS7Tzz762mKkOTVUrqfqygl8VZ
 xr8T/jywDbQDXm7I7bOj3HMe0KnvVN
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_171829_021067_A3594C93 
X-CRM114-Status: GOOD (  17.35  )
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

From: Mark Rutland <mark.rutland@arm.com>

[ Upstream commit 459f059be702056d91537b99a129994aa6ccdd35 ]

When KVM is in VHE mode, the host kernel tries to save and restore the
configuration of CPACR_EL1.ZEN (i.e. CPTR_EL2.ZEN when HCR_EL2.E2H=1)
across kvm_arch_vcpu_load_fp() and kvm_arch_vcpu_put_fp(), since the
configuration may be clobbered by hyp when running a vCPU. This logic is
currently redundant.

The VHE hyp code unconditionally configures CPTR_EL2.ZEN to 0b01 when
returning to the host, permitting host kernel usage of SVE.

Now that the host eagerly saves and unbinds its own FPSIMD/SVE/SME
state, there's no need to save/restore the state of the EL0 SVE trap.
The kernel can safely save/restore state without trapping, as described
above, and will restore userspace state (including trap controls) before
returning to userspace.

Remove the redundant logic.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Tested-by: Mark Brown <broonie@kernel.org>
Acked-by: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Fuad Tabba <tabba@google.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>
Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
Link: https://lore.kernel.org/r/20250210195226.1215254-4-mark.rutland@arm.com
Signed-off-by: Marc Zyngier <maz@kernel.org>
[Rework for refactoring of where the flags are stored -- broonie]
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h |  2 --
 arch/arm64/kvm/fpsimd.c           | 16 ----------------
 2 files changed, 18 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 3891963d42e00c8f999886dc5d7322bbacbc6c7f..9c1056d6f6859522dcee4b8c4e4804a7abac93d5 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -717,8 +717,6 @@ struct kvm_vcpu_arch {
 /* vcpu running in HYP context */
 #define VCPU_HYP_CONTEXT	__vcpu_single_flag(iflags, BIT(7))
 
-/* SVE enabled for host EL0 */
-#define HOST_SVE_ENABLED	__vcpu_single_flag(sflags, BIT(0))
 /* SME enabled for EL0 */
 #define HOST_SME_ENABLED	__vcpu_single_flag(sflags, BIT(1))
 /* Physical CPU not in supported_cpus */
diff --git a/arch/arm64/kvm/fpsimd.c b/arch/arm64/kvm/fpsimd.c
index 7c36d2a7aa3196056f76acfe8f9c41763ed67d9d..f1fe7abbcb83393e7c3402405bb7b1fdbf6024ff 100644
--- a/arch/arm64/kvm/fpsimd.c
+++ b/arch/arm64/kvm/fpsimd.c
@@ -88,10 +88,6 @@ void kvm_arch_vcpu_load_fp(struct kvm_vcpu *vcpu)
 	fpsimd_save_and_flush_cpu_state();
 	vcpu->arch.fp_state = FP_STATE_FREE;
 
-	vcpu_clear_flag(vcpu, HOST_SVE_ENABLED);
-	if (read_sysreg(cpacr_el1) & CPACR_EL1_ZEN_EL0EN)
-		vcpu_set_flag(vcpu, HOST_SVE_ENABLED);
-
 	if (system_supports_sme()) {
 		vcpu_clear_flag(vcpu, HOST_SME_ENABLED);
 		if (read_sysreg(cpacr_el1) & CPACR_EL1_SMEN_EL0EN)
@@ -189,18 +185,6 @@ void kvm_arch_vcpu_put_fp(struct kvm_vcpu *vcpu)
 		}
 
 		fpsimd_save_and_flush_cpu_state();
-	} else if (has_vhe() && system_supports_sve()) {
-		/*
-		 * The FPSIMD/SVE state in the CPU has not been touched, and we
-		 * have SVE (and VHE): CPACR_EL1 (alias CPTR_EL2) has been
-		 * reset by kvm_reset_cptr_el2() in the Hyp code, disabling SVE
-		 * for EL0.  To avoid spurious traps, restore the trap state
-		 * seen by kvm_arch_vcpu_load_fp():
-		 */
-		if (vcpu_get_flag(vcpu, HOST_SVE_ENABLED))
-			sysreg_clear_set(CPACR_EL1, 0, CPACR_EL1_ZEN_EL0EN);
-		else
-			sysreg_clear_set(CPACR_EL1, CPACR_EL1_ZEN_EL0EN, 0);
 	}
 
 	local_irq_restore(flags);

-- 
2.39.5


