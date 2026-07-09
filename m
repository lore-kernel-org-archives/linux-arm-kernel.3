Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 882D2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 18:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8qpVDx4UpWHjMsfsBGz1zwBdy92zZEuyHy7wmDCoc1U=; b=cgGk5bXmhAvZ0Q8DEiX2muK7oL
	IV5IWSMg39Zyqjz+Ui/94TfWO06musU/1Tnyx1gxlWwdLvY2WSb5wvJvxpQ/ZdrWML86+5VFaWXea
	uu58ApdZKnRIoXm0XnEtlU2pjH4LOjhtaNUlhKaQhkCyrOUIdgwQmHdGIfe+1T01DQPu+OwC5hYwJ
	CsZY8saDo4cO8Anl31/UIN52x6PcE4Ohhzt9xTGGvYfPoeQsehHNtvkoyuEd7xJClQHqjGqfo9FF6
	NumfN7+fkE81LZV2Ih7lf1ZemdjIiBgLuxxDvMZWo8EWGkjtSO8Saz15EswaN5cLUCUlAh5jJ0OWB
	DxD0ElGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtfU-00000003Es1-3nn9;
	Thu, 09 Jul 2026 18:40:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtfU-00000003Erm-0ZX0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 18:40:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 955E661386;
	Thu,  9 Jul 2026 18:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3179B1F00AC4;
	Thu,  9 Jul 2026 18:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783622415;
	bh=8qpVDx4UpWHjMsfsBGz1zwBdy92zZEuyHy7wmDCoc1U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=P2IAErhdgKWTcjA8mSRwy0bSsJpispvTa7nU1cfWA/BfUqGEmh9tmOMdZwISvxsUd
	 557VhfBtJJ4dbPlBtMu8UD0HT03S3Qn2B4z1sFhv+/8kbF5VQ7ciiakxSX/2RlSE7m
	 WNxMEYtykYDK51FDSu+UBhu5wO0JU/rIX2YAnR9zewuOk5oZw3+RognrQd4//qkyWl
	 ABPYSw7mLyx2blvVl6VtoK71njdUcKaOSZjJJGJPEfG8Aovi/gUWXNmXOBXciXJGAq
	 r4WAA7fCijYxAgbq8S11bUQ6rjpttvWUSpoZ30w/JkQvRK19giLtcXALiuXz2RU3Mo
	 cKTaJ7jSZNiEg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 09 Jul 2026 19:27:23 +0100
Subject: [PATCH v12 02/29] arm64/fpsimd: Update FA64 and ZT0 enables when
 loading SME state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-kvm-arm64-sme-v12-2-d0301d79ef58@kernel.org>
References: <20260709-kvm-arm64-sme-v12-0-d0301d79ef58@kernel.org>
In-Reply-To: <20260709-kvm-arm64-sme-v12-0-d0301d79ef58@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 Jean-Philippe Brucker <jpb@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6750; i=broonie@kernel.org;
 h=from:subject:message-id; bh=0XvV/YeRJrO9B2CFARjUgzNQGXMLM6qPBMtNGxGdbBc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqT+rrz/851J8pfXfj1JOEBY1LgOLZyhapWyk/3
 iVX1huk2/OJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCak/q6wAKCRAk1otyXVSH
 0KRkB/42+vniuyHSbVcH1FtK+u4Hcjqvg83pv5iQxKxgDhuxw6zdTdTG/WuMBGbPlervae/MycY
 fKuRFj0FYY0dGqwd28klFDeCtOJTIzGDZMBKLTeDpsmeSVyI4Mi17D6O/PIhs9MfQS7MVXlRIHn
 n3YhZDRL6OB9+0syjKlajuNyLM4V6UQCSa/cSmWPPjXU9jSOPAUV7CvBrC8I5XbHkspKSR0vJ3L
 yGQ0JBL1frzM65lo2ia4QI5RkkXGw0vih+Uye/e+hNolBzWWSstTsBdqLmWjTxrwplMYYuor7P9
 b5/f2cuaLOOD7nwrxdzY9g3qXwPu8wVbR+jMi5DVLmvj5wKi
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

Currently we enable EL0 and EL1 access to FA64 and ZT0 at boot and leave
them enabled throughout the runtime of the system. When we add KVM support
we will need to make this configuration dynamic, these features may be
disabled for some KVM guests. Since the host kernel saves the floating
point state for non-protected guests and we wish to avoid KVM having to
reload the floating point state needlessly on guest reentry let's move the
configuration of these enables to the floating point state reload.

Provide a helper task_smcr() which generates the value of SMCR_EL1 to
use based on the task struct and use it when we set the vector length
SMCR_EL1, currently while handling SME access traps or FP state load.

For consistency handle ZCR_EL1 the same way, currently the only field it
has is the LEN so the change is less meaningful there.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/fpsimd.h |  2 --
 arch/arm64/kernel/cpufeature.c  |  2 --
 arch/arm64/kernel/fpsimd.c      | 72 ++++++++++++++++++-----------------------
 3 files changed, 31 insertions(+), 45 deletions(-)

diff --git a/arch/arm64/include/asm/fpsimd.h b/arch/arm64/include/asm/fpsimd.h
index a67d5774e672..8d2a3d63481b 100644
--- a/arch/arm64/include/asm/fpsimd.h
+++ b/arch/arm64/include/asm/fpsimd.h
@@ -360,8 +360,6 @@ struct arm64_cpu_capabilities;
 extern void cpu_enable_fpsimd(const struct arm64_cpu_capabilities *__unused);
 extern void cpu_enable_sve(const struct arm64_cpu_capabilities *__unused);
 extern void cpu_enable_sme(const struct arm64_cpu_capabilities *__unused);
-extern void cpu_enable_sme2(const struct arm64_cpu_capabilities *__unused);
-extern void cpu_enable_fa64(const struct arm64_cpu_capabilities *__unused);
 extern void cpu_enable_fpmr(const struct arm64_cpu_capabilities *__unused);
 
 /*
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 9a22df0c5120..0609dce1989e 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2992,7 +2992,6 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
 		.capability = ARM64_SME_FA64,
 		.matches = has_cpuid_feature,
-		.cpu_enable = cpu_enable_fa64,
 		ARM64_CPUID_FIELDS(ID_AA64SMFR0_EL1, FA64, IMP)
 	},
 	{
@@ -3000,7 +2999,6 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
 		.capability = ARM64_SME2,
 		.matches = has_cpuid_feature,
-		.cpu_enable = cpu_enable_sme2,
 		ARM64_CPUID_FIELDS(ID_AA64PFR1_EL1, SME, SME2)
 	},
 #endif /* CONFIG_ARM64_SME */
diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index 25dc5afe9ba0..8009213288b1 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -277,6 +277,27 @@ void task_set_vl_onexec(struct task_struct *task, enum vec_type type,
 	task->thread.vl_onexec[type] = vl;
 }
 
+static unsigned long task_zcr(const struct task_struct *task)
+{
+	unsigned long vq = sve_vq_from_vl(task_get_sve_vl(task));
+	unsigned long zcr = vq - 1;
+
+	return zcr;
+}
+
+static unsigned long task_smcr(const struct task_struct *task)
+{
+	unsigned long vq = sve_vq_from_vl(task_get_sme_vl(task));
+	unsigned long smcr = vq - 1;
+
+	if (system_supports_fa64())
+		smcr |= SMCR_ELx_FA64;
+	if (system_supports_sme2())
+		smcr |= SMCR_ELx_EZT0;
+
+	return smcr;
+}
+
 /*
  * TIF_SME controls whether a task can use SME without trapping while
  * in userspace, when TIF_SME is set then we must have storage
@@ -377,10 +398,8 @@ static void task_fpsimd_load(void)
 			if (!thread_sm_enabled(&current->thread))
 				WARN_ON_ONCE(!test_and_set_thread_flag(TIF_SVE));
 
-			if (test_thread_flag(TIF_SVE)) {
-				unsigned long vq = sve_vq_from_vl(task_get_sve_vl(current));
-				sysreg_clear_set_s(SYS_ZCR_EL1, ZCR_ELx_LEN, vq - 1);
-			}
+			if (system_supports_sve())
+				sysreg_cond_update_s(SYS_ZCR_EL1, task_zcr(current));
 
 			restore_sve_regs = true;
 			restore_ffr = true;
@@ -402,12 +421,13 @@ static void task_fpsimd_load(void)
 
 	/* Restore SME, override SVE register configuration if needed */
 	if (system_supports_sme()) {
-		unsigned long sme_vl = task_get_sme_vl(current);
-
-		/* Ensure VL is set up for restoring data */
+		/*
+		 * Ensure VL is set up for restoring data.  KVM might
+		 * disable subfeatures so we reset them each time.
+		 */
 		if (test_thread_flag(TIF_SME)) {
-			unsigned long vq = sve_vq_from_vl(sme_vl);
-			sysreg_clear_set_s(SYS_SMCR_EL1, SMCR_ELx_LEN, vq - 1);
+			sysreg_cond_update_s(SYS_SMCR_EL1, task_smcr(current));
+			isb();
 		}
 
 		write_sysreg_s(current->thread.svcr, SYS_SVCR);
@@ -1217,26 +1237,6 @@ void cpu_enable_sme(const struct arm64_cpu_capabilities *__always_unused p)
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
@@ -1281,17 +1281,9 @@ void __init sme_setup(void)
 
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
 
@@ -1336,8 +1328,7 @@ void do_sve_acc(unsigned long esr, struct pt_regs *regs)
 	 * any effective streaming mode SVE state.
 	 */
 	if (!test_thread_flag(TIF_FOREIGN_FPSTATE)) {
-		unsigned long vq = sve_vq_from_vl(task_get_sve_vl(current));
-		sysreg_clear_set_s(SYS_ZCR_EL1, ZCR_ELx_LEN, vq - 1);
+		sysreg_cond_update_s(SYS_ZCR_EL1, task_zcr(current));
 		sve_flush_live();
 		fpsimd_bind_task_to_cpu();
 	} else {
@@ -1468,8 +1459,7 @@ void do_sme_acc(unsigned long esr, struct pt_regs *regs)
 		WARN_ON(1);
 
 	if (!test_thread_flag(TIF_FOREIGN_FPSTATE)) {
-		unsigned long vq = sve_vq_from_vl(task_get_sme_vl(current));
-		sysreg_clear_set_s(SYS_SMCR_EL1, SMCR_ELx_LEN, vq - 1);
+		sysreg_cond_update_s(SYS_SMCR_EL1, task_smcr(current));
 
 		fpsimd_bind_task_to_cpu();
 	} else {

-- 
2.47.3


