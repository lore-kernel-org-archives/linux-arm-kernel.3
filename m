Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD08CC3601A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 23:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mC0NXmwp3hUFyxgYzqhl2oziOdKHiyicw+7VAZXZeac=; b=Qiq/r6PjVcblgWow3cesbB+w8I
	BSE/pu3SE6r+sPzUmwdpOmZebPVqCSaQaUNz4bAWg5Kd6DDX8TsvgrrMdanQ1uAR61be8W4AZSp6S
	2ccC5JFRyQhIWQa8hbT3MI3vR24AMThVtoZb7zoTe1bK9yNtyKAzo73+oGSX/BnB16+SwSBqnt22i
	PcuSoT6XWIjLh7X7Zm/15wKGefkvDj0IO5gwHqgquaGZQl9Xx/XAAr+GP4asv8EpHy4dr8BHLWewN
	6HKDSjJisb1rIMV348gkzLERaxvJvOQKpPvAIRuGAj6Ln/f14PAc8HAFRnZ5SeRicfA9RXp5pwoOQ
	X+BtaSQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u07WD-00000007PUx-1N5t;
	Wed, 02 Apr 2025 23:29:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u07Gx-00000007NPC-1m4V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 23:13:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E0A3468409;
	Wed,  2 Apr 2025 23:13:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 310BFC4CEE9;
	Wed,  2 Apr 2025 23:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743635606;
	bh=94B73exkvxZIp7PjZglkCZBY40cUsa7OpOScJsLUoog=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Cz9bCjX0XQNtJUML4hgMGAGzC+n+ekfOTyZwnmkaThPbXDcFTccvEM2wIO5eS2qYC
	 mWGR5Q0clh56b9AzkImiTPYO9nAIjAq74rH2mDDkYMVYhPt+w4KlsAj500fOqRYK9o
	 0r5y6lJTnBgctGT+QTi+jPINh5hhad3PrrT4kbIy/s9mpO4ySsO4QLZ7rLjnWM/vCn
	 Aj9+pHSCHacY1Vk9tiE3w27yHx0Ec/E79h1tlTGdnEtaGcnInyF6dU50VOV90zTYal
	 fKeMxyvNUm5sBizGrGgGnTKJ6SW35VkrAA+ZImQ9oTAqOGuim0Gs4dA8A4u2sL/7K7
	 IeqYa45xw3ZYw==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 02 Apr 2025 23:59:40 +0100
Subject: [PATCH 08/10] KVM: arm64: Remove VHE host restore of CPACR_EL1.ZEN
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-stable-sve-5-15-v1-8-84d0e5ff1102@kernel.org>
References: <20250402-stable-sve-5-15-v1-0-84d0e5ff1102@kernel.org>
In-Reply-To: <20250402-stable-sve-5-15-v1-0-84d0e5ff1102@kernel.org>
To: Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Oleg Nesterov <oleg@redhat.com>, Oliver Upton <oliver.upton@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Fuad Tabba <tabba@google.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3514; i=broonie@kernel.org;
 h=from:subject:message-id; bh=z0T8Mw2Gv92zuKeVWJq8mDeqr184OynN7N95pkdbt3E=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBn7cR6CzsLnXqKuTai2nTTrTJYDmpEeihjmPP8suGz
 oDr1dJiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ+3EegAKCRAk1otyXVSH0Hn8B/
 4kgpuKQR93h5ohmPUvMD8MAlaq8D1rYGCe/+VjyydlEf/3HeaB6Qi7JEcpLhy2hkdKMGLqCnZei2lA
 cGeMrKXeez0f1JJnUqRPyAZiVmSYqvimHYtnB6tH0kuJLbWny4bJVePe5qvSSG+9+GqaDKRcBQNNcH
 CZRBZzvXp2/BL9o1ccYGfVi4Y6ihOjNJZRL3GBpyxocmsAMn5zIjQNPwzQCuXKpitgxzNpnccCYdzc
 ZfK22BIcyowVdqqT4DzfbyGPXWLYQkMSGWl/+kjtnotORC4t1+VPLpAjnNqYy2HZGJS3dmF2ibvu0D
 TTm7A6qTC729HqrRGPXqCo+68KgiJe
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


