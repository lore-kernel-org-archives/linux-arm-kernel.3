Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5DA0C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 18:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mC0NXmwp3hUFyxgYzqhl2oziOdKHiyicw+7VAZXZeac=; b=PsAxBjPt7M4PZZoBOAWjgGGqC9
	zQhJIcA7poBIdTn4QLZnmO+s8cDFwWRSMP2ox49FQ+qz7Sf+XltQcRp9T5ndHa0uCxE0+jWao7hGE
	pVZUj4f0fUpaOUzVvAVlufxipoyNVWT0WBiILvSagVlNG0XJH4VWLoZmJeJhzMsFSAbXYdx4qQCPq
	STKLM9UpMbaTbbwsKjHc25QFAuEKSoSnoPgvm9Eeyfr1wIK3kZRzHOOEpDr1E8B7pfefwSHhpl8Fb
	4BerwlYFuig2OfQ1Wy1FLespqRTO/bcjWDJNkYSsf9evr93ljMJCET2Bq2h31OClnVyaLK4knHrhh
	hnTaKgvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Drw-000000058X5-0WUi;
	Tue, 08 Apr 2025 18:40:20 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Dax-000000055xB-0GBT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 18:22:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B7D71A48FE6;
	Tue,  8 Apr 2025 18:17:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 447B5C4CEE9;
	Tue,  8 Apr 2025 18:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744136566;
	bh=94B73exkvxZIp7PjZglkCZBY40cUsa7OpOScJsLUoog=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PqvFcV7MB/OV15mYLd+gHbJSSGEFznA0DxuB2PBVbE7W4085ugfWvdYgDdqylxt0D
	 5Qf8xVh99HLh+fKnd2NjKZhzt+EWmXLHwyigsSDpr15dXYkK61Z1L0wpkS+63S3UIX
	 VDmmarfGl2Rew/V8277bDGLIJhb8WcQTFMbR+lKVFoJt6GJyUgSPufX2MdteB94LdM
	 k8/Xr+4PPugCU8ewDKtPgqt4dfjQXSu+ahYrKUlAz5YxyztryMEG92aO2m+3jBS/0p
	 VJOjQSlPKG/bRt/8FgZkC/Ecp1b5NjOKiVIhaVKd8jIPWIY2F2jf/Q4A3RXFhGe/91
	 sDMg42jnTHkDg==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 08 Apr 2025 19:10:04 +0100
Subject: [PATCH 5.15 v3 09/11] KVM: arm64: Remove VHE host restore of
 CPACR_EL1.ZEN
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-stable-sve-5-15-v3-9-ca9a6b850f55@kernel.org>
References: <20250408-stable-sve-5-15-v3-0-ca9a6b850f55@kernel.org>
In-Reply-To: <20250408-stable-sve-5-15-v3-0-ca9a6b850f55@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Oleg Nesterov <oleg@redhat.com>, Oliver Upton <oliver.upton@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Fuad Tabba <tabba@google.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3514; i=broonie@kernel.org;
 h=from:subject:message-id; bh=z0T8Mw2Gv92zuKeVWJq8mDeqr184OynN7N95pkdbt3E=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBn9WlSA5GbnGtX3RsCslIUJ3vjbvkc54JHy7pM4Ogz
 TkYpdP2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ/VpUgAKCRAk1otyXVSH0IPdB/
 9qgLuVL0XNOu2uxbW9SdLR/JkjAJ1tmBtaOhOGfqkAa2zW4epsXR3iVIJeSj2NMMTJJ4mC5NMC4zk4
 HBymsKA7vqRIQQ/RCtlTpNj2B6hpg+ZvYPgZr//O0LXVN1G7iI7KtBRocC3zDiYwLPe+qrsosUbTjD
 LcfEnXdqe/J6yRBkmo1GdiC1K1OEG8YNK6CmQmLTG7PKwv/3tf8VqL97zm+qKb5FGxXwD5qsoow7WU
 qXzvZOdEnMYa7hJF2oUd6ZWsJoQvzrZYHQ7nm7XoOzfDAx7oO5QQcw3/4kxOvHwNzK3Ypzw3liOMYQ
 5qZaSqkTIyH7q5lHnF3Q1Jh5h/8J2o
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_112247_240977_6943A7E5 
X-CRM114-Status: GOOD (  16.13  )
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
 arch/arm64/include/asm/kvm_host.h |  1 -
 arch/arm64/kvm/fpsimd.c           | 15 ---------------
 2 files changed, 16 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 06e8d4645ecd..3d4e2396a2d7 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -421,7 +421,6 @@ struct kvm_vcpu_arch {
 #define KVM_ARM64_DEBUG_DIRTY		(1 << 0)
 #define KVM_ARM64_FP_ENABLED		(1 << 1) /* guest FP regs loaded */
 #define KVM_ARM64_FP_HOST		(1 << 2) /* host FP regs loaded */
-#define KVM_ARM64_HOST_SVE_ENABLED	(1 << 4) /* SVE enabled for EL0 */
 #define KVM_ARM64_GUEST_HAS_SVE		(1 << 5) /* SVE exposed to guest */
 #define KVM_ARM64_VCPU_SVE_FINALIZED	(1 << 6) /* SVE config completed */
 #define KVM_ARM64_GUEST_HAS_PTRAUTH	(1 << 7) /* PTRAUTH exposed to guest */
diff --git a/arch/arm64/kvm/fpsimd.c b/arch/arm64/kvm/fpsimd.c
index 1ef9d6cb91ee..1360ddd4137b 100644
--- a/arch/arm64/kvm/fpsimd.c
+++ b/arch/arm64/kvm/fpsimd.c
@@ -83,9 +83,6 @@ void kvm_arch_vcpu_load_fp(struct kvm_vcpu *vcpu)
 	 */
 	fpsimd_save_and_flush_cpu_state();
 	vcpu->arch.flags &= ~KVM_ARM64_FP_HOST;
-
-	if (read_sysreg(cpacr_el1) & CPACR_EL1_ZEN_EL0EN)
-		vcpu->arch.flags |= KVM_ARM64_HOST_SVE_ENABLED;
 }
 
 /*
@@ -142,18 +139,6 @@ void kvm_arch_vcpu_put_fp(struct kvm_vcpu *vcpu)
 		}
 
 		fpsimd_save_and_flush_cpu_state();
-	} else if (has_vhe() && system_supports_sve()) {
-		/*
-		 * The FPSIMD/SVE state in the CPU has not been touched, and we
-		 * have SVE (and VHE): CPACR_EL1 (alias CPTR_EL2) has been
-		 * reset to CPACR_EL1_DEFAULT by the Hyp code, disabling SVE
-		 * for EL0.  To avoid spurious traps, restore the trap state
-		 * seen by kvm_arch_vcpu_load_fp():
-		 */
-		if (vcpu->arch.flags & KVM_ARM64_HOST_SVE_ENABLED)
-			sysreg_clear_set(CPACR_EL1, 0, CPACR_EL1_ZEN_EL0EN);
-		else
-			sysreg_clear_set(CPACR_EL1, CPACR_EL1_ZEN_EL0EN, 0);
 	}
 
 	local_irq_restore(flags);

-- 
2.39.5


