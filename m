Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8ECFC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 15:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aYvcrktvqQbW/y+mHXOh7FdS9ld+/uoyn784mg/jGyk=; b=NwPaF+q7hnTwBdwJPOmu3zewXo
	zocLJ1uXS9AeIhwYIaOj353pOwbuwsdgACekdwdtUNAbyAjasR+DEwJSKL6CkMNLVzqF413ybKfpd
	tZEe/TabLpV+x3Cv13Q3qW60D53cvDVnXuUWLltOE0Wz98YYGFV5VFd3QbD17DHy+FsCNYaek9Cjp
	4EHa0ZHqftrHurIIMImbcvgKUPFzqEj7rcP0lQP3ZoWkVMFyfHniFQGbDfrPSWCgPpau1sWiJcUTK
	bgUsnkejvLqDm6aRRNpvwHmsyswbR0PaqweMexYt3oLE9ZAnT1x4citQxCAZ5g7tCDLw6riLlBl4M
	T7QvX9Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uURfS-000000093oc-3o1k;
	Wed, 25 Jun 2025 15:04:06 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUOFI-00000008Ses-1A3L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 11:24:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 18474A522F9;
	Wed, 25 Jun 2025 11:24:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F5F6C4CEF0;
	Wed, 25 Jun 2025 11:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750850690;
	bh=tAV6xipp2Cccsjel/OuGPLD/NSdXCwSY4dbfZYzvIiY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=P1Wxkd7GeNTD2Lq0QyzHMK/Pq0Jlmb9HoQ0/Atur5/VYuBvdtZOrPcrtqIuSbCLzv
	 KJtLVVzvJgtzh2cmQD9dyF3uxijIPojS8GJLebZjemd1W5xQsVn8jmBBiUnWlND9ti
	 rvMoSLijnYkcSa2j1Jb1wKShnLzDE5oIsWKwCkj/RvJkaO5dAr59hFS8/DBDLtSQ7A
	 SMqhgwro3PjnhVdm5utAD59nyMg826gkPYy5Wt7WOvvGSyaQ7m+7uzy5Zls9R2227P
	 /9vpSl9hjkeOGoZqgn59CMeNHObVuNdAEADAL02LFc/4TpaPuK1SXKZ6yBA9TGW+yC
	 mSDW57gaREUiA==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 25 Jun 2025 11:47:52 +0100
Subject: [PATCH v6 01/28] arm64/fpsimd: Update FA64 and ZT0 enables when
 loading SME state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-kvm-arm64-sme-v6-1-114cff4ffe04@kernel.org>
References: <20250625-kvm-arm64-sme-v6-0-114cff4ffe04@kernel.org>
In-Reply-To: <20250625-kvm-arm64-sme-v6-0-114cff4ffe04@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-08c49
X-Developer-Signature: v=1; a=openpgp-sha256; l=5763; i=broonie@kernel.org;
 h=from:subject:message-id; bh=tAV6xipp2Cccsjel/OuGPLD/NSdXCwSY4dbfZYzvIiY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoW9xlBkzR8GNctp0kn0pzBj+3OpnDqbUW6KWCW
 BzwjXfN9NWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaFvcZQAKCRAk1otyXVSH
 0NF+B/9e53wpct6Lpjq4Yj8r9MgVZg84GjL/Opay6bY8KDyzkxf+ZcJzS7v/HLmS/sDx4fRXL4A
 JkHe/epgdF2V/NuAy/nWxZuiN/fkka+9zY78rdL+lemzk4Yv9mCPFMkID4y39I8ySpqW00X8AbM
 v1EYrRaOfwBu2VEq2oDesHYvoXZ0rkyL5iUOLyhUtnOfZoUgv4ajujiv6vcXq9jbyPb+xrV3slM
 4xtUnEgYSuB9ABy3rQxgSQe2+dhGCqXeq2E/aj8+ue0k41WMobd+gy99bX8Sw8Qx0TQ+N25ryYx
 Ufqumwq0nMaJv4dePDthglq78wYFzaMTn8V/4kVGdCu7CMFX
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_042452_493586_AD6C80F2 
X-CRM114-Status: GOOD (  20.74  )
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

Currently we enable EL0 and EL1 access to FA64 and ZT0 at boot and leave
them enabled throughout the runtime of the system. When we add KVM support
we will need to make this configuration dynamic, these features may be
disabled for some KVM guests. Since the host kernel saves the floating
point state for non-protected guests and we wish to avoid KVM having to
reload the floating point state needlessly on guest reentry let's move the
configuration of these enables to the floating point state reload.

We provide a helper which does the configuration as part of a
read/modify/write operation along with the configuration of the task VL,
then update the floating point state load and SME access trap to use it.
We also remove the setting of the enable bits from the CPU feature
identification and resume paths.  There will be a small overhead from
setting the enables one at a time but this should be negligable in the
context of the state load or access trap.  In order to avoid compiler
warnings due to unused variables in !CONFIG_ARM64_SME cases we avoid
storing the vector length in temporary variables.

Signed-off-by: Mark Brown <broonie@kernel.org>

df
---
 arch/arm64/include/asm/fpsimd.h | 14 ++++++++++++
 arch/arm64/kernel/cpufeature.c  |  2 --
 arch/arm64/kernel/fpsimd.c      | 47 +++++++++++------------------------------
 3 files changed, 26 insertions(+), 37 deletions(-)

diff --git a/arch/arm64/include/asm/fpsimd.h b/arch/arm64/include/asm/fpsimd.h
index b8cf0ea43cc0..b4359f942621 100644
--- a/arch/arm64/include/asm/fpsimd.h
+++ b/arch/arm64/include/asm/fpsimd.h
@@ -428,6 +428,18 @@ static inline size_t sme_state_size(struct task_struct const *task)
 	return __sme_state_size(task_get_sme_vl(task));
 }
 
+#define sme_cond_update_smcr(vl, fa64, zt0, reg)		\
+	do {							\
+		u64 __old = read_sysreg_s((reg));		\
+		u64 __new = vl;					\
+		if (fa64)			\
+			__new |= SMCR_ELx_FA64;			\
+		if (zt0)					\
+			__new |= SMCR_ELx_EZT0;			\
+		if (__old != __new)				\
+			write_sysreg_s(__new, (reg));		\
+	} while (0)
+
 #else
 
 static inline void sme_user_disable(void) { BUILD_BUG(); }
@@ -456,6 +468,8 @@ static inline size_t sme_state_size(struct task_struct const *task)
 	return 0;
 }
 
+#define sme_cond_update_smcr(val, fa64, zt0, reg) do { } while (0)
+
 #endif /* ! CONFIG_ARM64_SME */
 
 /* For use by EFI runtime services calls only */
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index b34044e20128..397ef8693f5f 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2911,7 +2911,6 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
 		.capability = ARM64_SME_FA64,
 		.matches = has_cpuid_feature,
-		.cpu_enable = cpu_enable_fa64,
 		ARM64_CPUID_FIELDS(ID_AA64SMFR0_EL1, FA64, IMP)
 	},
 	{
@@ -2919,7 +2918,6 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
 		.capability = ARM64_SME2,
 		.matches = has_cpuid_feature,
-		.cpu_enable = cpu_enable_sme2,
 		ARM64_CPUID_FIELDS(ID_AA64PFR1_EL1, SME, SME2)
 	},
 #endif /* CONFIG_ARM64_SME */
diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index c37f02d7194e..653c0dec6b18 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -392,11 +392,15 @@ static void task_fpsimd_load(void)
 
 	/* Restore SME, override SVE register configuration if needed */
 	if (system_supports_sme()) {
-		unsigned long sme_vl = task_get_sme_vl(current);
-
-		/* Ensure VL is set up for restoring data */
+		/*
+		 * Ensure VL is set up for restoring data.  KVM might
+		 * disable subfeatures so we reset them each time.
+		 */
 		if (test_thread_flag(TIF_SME))
-			sme_set_vq(sve_vq_from_vl(sme_vl) - 1);
+			sme_cond_update_smcr(sve_vq_from_vl(task_get_sme_vl(current)) - 1,
+					     system_supports_fa64(),
+					     system_supports_sme2(),
+					     SYS_SMCR_EL1);
 
 		write_sysreg_s(current->thread.svcr, SYS_SVCR);
 
@@ -1237,26 +1241,6 @@ void cpu_enable_sme(const struct arm64_cpu_capabilities *__always_unused p)
 	isb();
 }
 
-void cpu_enable_sme2(const struct arm64_cpu_capabilities *__always_unused p)
-{
-	/* This must be enabled after SME */
-	BUILD_BUG_ON(ARM64_SME2 <= ARM64_SME);
-
-	/* Allow use of ZT0 */
-	write_sysreg_s(read_sysreg_s(SYS_SMCR_EL1) | SMCR_ELx_EZT0_MASK,
-		       SYS_SMCR_EL1);
-}
-
-void cpu_enable_fa64(const struct arm64_cpu_capabilities *__always_unused p)
-{
-	/* This must be enabled after SME */
-	BUILD_BUG_ON(ARM64_SME_FA64 <= ARM64_SME);
-
-	/* Allow use of FA64 */
-	write_sysreg_s(read_sysreg_s(SYS_SMCR_EL1) | SMCR_ELx_FA64_MASK,
-		       SYS_SMCR_EL1);
-}
-
 void __init sme_setup(void)
 {
 	struct vl_info *info = &vl_info[ARM64_VEC_SME];
@@ -1300,17 +1284,9 @@ void __init sme_setup(void)
 
 void sme_suspend_exit(void)
 {
-	u64 smcr = 0;
-
 	if (!system_supports_sme())
 		return;
 
-	if (system_supports_fa64())
-		smcr |= SMCR_ELx_FA64;
-	if (system_supports_sme2())
-		smcr |= SMCR_ELx_EZT0;
-
-	write_sysreg_s(smcr, SYS_SMCR_EL1);
 	write_sysreg_s(0, SYS_SMPRI_EL1);
 }
 
@@ -1425,9 +1401,10 @@ void do_sme_acc(unsigned long esr, struct pt_regs *regs)
 		WARN_ON(1);
 
 	if (!test_thread_flag(TIF_FOREIGN_FPSTATE)) {
-		unsigned long vq_minus_one =
-			sve_vq_from_vl(task_get_sme_vl(current)) - 1;
-		sme_set_vq(vq_minus_one);
+		sme_cond_update_smcr(sve_vq_from_vl(task_get_sme_vl(current)) - 1,
+				     system_supports_fa64(),
+				     system_supports_sme2(),
+				     SYS_SMCR_EL1);
 
 		fpsimd_bind_task_to_cpu();
 	} else {

-- 
2.39.5


