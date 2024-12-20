Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF7ECE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 16:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rsILcwPqrR2tIn82l4ch9HwemBft0ThSABZQsI/ouaA=; b=mr6Nqp5BBhjPTlOTmxsTGCxX8L
	vwaYvXu5pySLPLYke+KayXT14K6WxhsecrY0N9FBz2pnKhLRyA+qiYziBuUpw3TIlMeZky+ZH/KEi
	xEtl7IfPtRqU0uRo+FSxMCtGsbyEkSAos8ko0K+K5idfrfU72nahSMZtSyDBIUbI6OFxSfbMYMTd5
	iuhrwgusmGVZOmgziP2tTKZlp9T2njRvNFfRY0CP9XyFaPaw+Mr6MAQdK2I8ZMA2x3MqNnK8JJWW2
	dnegxxPFXO1POpZmN2xZGZuSn6kyl5jh5feorx9KJSj9KE33xWepOZdcpbshs//LOmWOCZjmPXjCY
	Gz8LLptQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgGg-00000005WXp-1c10;
	Fri, 20 Dec 2024 16:54:26 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgDK-00000005VrT-39wT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 16:50:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 93358A4202A;
	Fri, 20 Dec 2024 16:49:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8449CC4CEDC;
	Fri, 20 Dec 2024 16:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734713457;
	bh=TrCGcoJZcMaq9NQXaz5QIPxcM7YhfKCIwJUJHa3hpoY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lY0GcXKjx5ustz3wJJVvDwWEYFi8aYA9kUIpUGgXqIzbsMD32EMGVjJiKRlaYZ/RA
	 Zmm+CQtXyi0DhErPJNdx5p0Qdk6l++6MvPcV9lYmRNOCgvUONrepMHLwkPUQGPlZYS
	 QT2cqs0oYH2HENIhTGDERPJFRdyR57oKpGnn+250g+GnAoR3T17PaTPGSXZ9zz9ZX1
	 QED1NVDfdpDli5hlfltgDvRCokxf6pUfXZsuCXvK9Uv3Iumf1bwFRJX89lhRHZrIZO
	 dGBe+nM/afqlStmsu+o5lKEKjrVwMpc0/bhawrZk0bOF3OLu6+DjFQ638o2Zt+HEz1
	 qa3SLIdyux1+Q==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 20 Dec 2024 16:46:26 +0000
Subject: [PATCH RFC v3 01/27] arm64/fpsimd: Update FA64 and ZT0 enables
 when loading SME state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-kvm-arm64-sme-v3-1-05b018c1ffeb@kernel.org>
References: <20241220-kvm-arm64-sme-v3-0-05b018c1ffeb@kernel.org>
In-Reply-To: <20241220-kvm-arm64-sme-v3-0-05b018c1ffeb@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=5400; i=broonie@kernel.org;
 h=from:subject:message-id; bh=TrCGcoJZcMaq9NQXaz5QIPxcM7YhfKCIwJUJHa3hpoY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnZaBV7Q2cNbktgqMjPzjwEQdgceGjgwNGp30spIyG
 LQzQEDmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ2WgVQAKCRAk1otyXVSH0OtoB/
 4+5F12FDcBOuENPVMcOHBNTl8Je2KSQtp0eVdxl6YuybjZSByEi2ZxgVs2D1oHbBdYMCaSEJb6p3Ni
 JBmkEyhWsgL60rA9Xlqs3fQ/5sXix3J+IXXW3qALcWrfxrc37N7gXtpIUbFyaiK03W/4xdK8PZqoPZ
 eYkaIYjo8v8F6Q8nWRFNmfokZDZEg7VS2slCKAomIpzuH3t2XnMwR+SC1HNno25JOB7nc/OirmzSEo
 Vs2jpccl3x5ltbHgBObc62H0IVS21EvP+jql9unY6lSrYpbGFuDRUTAmhNRMbpV84DCg0nZL9EQ24x
 ZtVYFiL5r54EsGGYC5aUFgZej7qmQe
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_085058_931529_6C328837 
X-CRM114-Status: GOOD (  19.49  )
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
context of the state load or access trap.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/fpsimd.h | 12 +++++++++++
 arch/arm64/kernel/cpufeature.c  |  2 --
 arch/arm64/kernel/fpsimd.c      | 44 ++++++++++++-----------------------------
 3 files changed, 25 insertions(+), 33 deletions(-)

diff --git a/arch/arm64/include/asm/fpsimd.h b/arch/arm64/include/asm/fpsimd.h
index f2a84efc361858d4deda99faf1967cc7cac386c1..95355892d47b3ec1c77a3ab19ccad0d7f9a8d621 100644
--- a/arch/arm64/include/asm/fpsimd.h
+++ b/arch/arm64/include/asm/fpsimd.h
@@ -429,6 +429,18 @@ static inline size_t sme_state_size(struct task_struct const *task)
 
 #endif /* ! CONFIG_ARM64_SME */
 
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
 /* For use by EFI runtime services calls only */
 extern void __efi_fpsimd_begin(void);
 extern void __efi_fpsimd_end(void);
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 6ce71f444ed84f9056196bb21bbfac61c9687e30..ab669ef8244eea70d9e20024d5584d2e960389dc 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2848,7 +2848,6 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
 		.capability = ARM64_SME_FA64,
 		.matches = has_cpuid_feature,
-		.cpu_enable = cpu_enable_fa64,
 		ARM64_CPUID_FIELDS(ID_AA64SMFR0_EL1, FA64, IMP)
 	},
 	{
@@ -2856,7 +2855,6 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
 		.capability = ARM64_SME2,
 		.matches = has_cpuid_feature,
-		.cpu_enable = cpu_enable_sme2,
 		ARM64_CPUID_FIELDS(ID_AA64PFR1_EL1, SME, SME2)
 	},
 #endif /* CONFIG_ARM64_SME */
diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index 8c4c1a2186cc510a7826d15ec36225857c07ed71..92c085288ed2cbc4f51f49546c6abbde6ba891a3 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -399,9 +399,15 @@ static void task_fpsimd_load(void)
 	if (system_supports_sme()) {
 		unsigned long sme_vl = task_get_sme_vl(current);
 
-		/* Ensure VL is set up for restoring data */
+		/*
+		 * Ensure VL is set up for restoring data.  KVM might
+		 * disable subfeatures so we reset them each time.
+		 */
 		if (test_thread_flag(TIF_SME))
-			sme_set_vq(sve_vq_from_vl(sme_vl) - 1);
+			sme_cond_update_smcr(sve_vq_from_vl(sme_vl) - 1,
+					     system_supports_fa64(),
+					     system_supports_sme2(),
+					     SYS_SMCR_EL1);
 
 		write_sysreg_s(current->thread.svcr, SYS_SVCR);
 
@@ -1267,26 +1273,6 @@ void cpu_enable_sme(const struct arm64_cpu_capabilities *__always_unused p)
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
@@ -1330,17 +1316,9 @@ void __init sme_setup(void)
 
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
 
@@ -1457,7 +1435,11 @@ void do_sme_acc(unsigned long esr, struct pt_regs *regs)
 	if (!test_thread_flag(TIF_FOREIGN_FPSTATE)) {
 		unsigned long vq_minus_one =
 			sve_vq_from_vl(task_get_sme_vl(current)) - 1;
-		sme_set_vq(vq_minus_one);
+
+		sme_cond_update_smcr(vq_minus_one,
+				     system_supports_fa64(),
+				     system_supports_sme2(),
+				     SYS_SMCR_EL1);
 
 		fpsimd_bind_task_to_cpu();
 	}

-- 
2.39.5


