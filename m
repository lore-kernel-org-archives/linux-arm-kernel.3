Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84061CA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 10:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o4Ozf3h6dAyNgcLS1QQF35dozdTBGPqsmqDzYPaZPmc=; b=r8ov+h+xErBRM58lD9R7y7COzJ
	UlcByVhr0ImxZHw3tk3z27wNtkOs8KowPC3Tktmp+V8QdoedDrEfmI33twaGBsaAhMrnxt9CMULsW
	/n88mOIhGwrMhNf3PagjpjByQZp1qvk29JKFiSxCynTc52goSm1z8OQpzdHAAIdsmJJKuOuRdkE8f
	Rpwpu9Wcj+qKAQMsQmIvdAU7/bjl8AruzXoruk+VFhXwIl3+GLqYEYRYIjSX4Li60xU35sEeAe75y
	dv0gpoQWhSL8CaYQljkRheS76IYdGHcqcUfKaK/NGrSTQTJQMx5B0eFrls4Bnz1z9x1CcUen3eVYC
	CPYVWbQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7WR-00000005z5V-3T6Q;
	Fri, 09 Oct 2026 10:08:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7WQ-00000005z3e-2KK4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 10:08:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 027CD43E03;
	Fri,  9 Oct 2026 10:08:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8FB71F00893;
	Fri,  9 Oct 2026 10:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540493;
	bh=o4Ozf3h6dAyNgcLS1QQF35dozdTBGPqsmqDzYPaZPmc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EO/PODptOKW07Sm47JQQG0TKRhielURSBdNIDl/rOtff4SoOmRGZ3zOCqBS46u+bB
	 G3TU6xG8h2/+xjFikhP29ypHXFcMnb0H3IXsiqzG2LrlDIhU7+qEPf6zL2AC8zOSud
	 g/YcfOyM2+ACnGdFDERNkBXA+wss9pUl0KE4kkCgXGLLpbVXlz8HH1a39B6Q9V4r/z
	 5FXlZCmAR0SM+6g3MoOyW1ZeK9IrRioDUNZfLUU/FTB49o5czcnG0ySt+u9zi83zTc
	 d107FW/He234dwC42/7MPW/WZ7kXfgqg1mcc/nxDQCYvAN05Hz2DlwItRI4dH1dCYZ
	 Ss//mfOrPqYaQ==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	=?UTF-8?q?=C8=98tefania=20Ion?= <stefion@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Tarun Sahu <tarunsahu@google.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH v2 07/23] arm64: cpufeature: Read MPAMIDR_EL1 in __cpuinfo_store_cpu()
Date: Fri,  9 Oct 2026 11:07:18 +0100
Message-ID: <20261009100738.31288-8-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261009100738.31288-1-will@kernel.org>
References: <20261009100738.31288-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Fuad Tabba <fuad.tabba@linux.dev>

MPAMIDR_EL1 is the one ID register __cpuinfo_store_cpu() doesn't read.
Its read was deferred to init_cpu_features() and update_cpu_features()
because it traps on firmware that fails to enable MPAM. Only the
sanitised ID_AA64PFR0_EL1 and ID_AA64PFR1_EL1 carried the arm64.nompam
override for such firmware.

Store ID_AA64PFR0_EL1 through read_cpuid_with_overrides() as well. Then
read MPAMIDR_EL1 in __cpuinfo_store_cpu() again, beside GMID_EL1, gated
on this CPU's overridden ID_AA64PFR0_EL1 and ID_AA64PFR1_EL1. cpu_data
is then complete before init_cpu_features() runs.

Other readers of the stored ID_AA64PFR0_EL1 see the override too. With
arm64.no32bit_el0, __cpuinfo_store_cpu() no longer reads the AArch32 ID
registers. Adding allow_mismatched_32bit_el0 no longer enables 32-bit
EL0 either.

detect_ftr_has_mpam(), a system-wide test on the sanitised values,
stays for the ARM64_MPAM capability.

Suggested-by: Will Deacon <will@kernel.org>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/cpufeature.c | 10 +++-------
 arch/arm64/kernel/cpuinfo.c    | 11 ++++-------
 2 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 3161531ad401..9212f10c1d1a 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -1248,10 +1248,8 @@ void __init init_cpu_features(struct cpuinfo_arm64 *info)
 		cpacr_restore(cpacr);
 	}
 
-	if (detect_ftr_has_mpam()) {
-		info->reg_mpamidr = read_cpuid(MPAMIDR_EL1);
+	if (id_aa64pfr0_mpam(info->reg_id_aa64pfr0) || id_aa64pfr1_mpamfrac(info->reg_id_aa64pfr1))
 		init_cpu_ftr_reg(SYS_MPAMIDR_EL1, info->reg_mpamidr);
-	}
 
 	if (IS_ENABLED(CONFIG_ARM64_MTE) && id_aa64pfr1_mte(info->reg_id_aa64pfr1))
 		init_cpu_ftr_reg(SYS_GMID_EL1, info->reg_gmid);
@@ -1504,11 +1502,9 @@ void update_cpu_features(int cpu,
 		cpacr_restore(cpacr);
 	}
 
-	if (detect_ftr_has_mpam()) {
-		info->reg_mpamidr = read_cpuid(MPAMIDR_EL1);
+	if (id_aa64pfr0_mpam(info->reg_id_aa64pfr0) || id_aa64pfr1_mpamfrac(info->reg_id_aa64pfr1))
 		taint |= check_update_ftr_reg(SYS_MPAMIDR_EL1, cpu,
-					info->reg_mpamidr, boot->reg_mpamidr);
-	}
+					      info->reg_mpamidr, boot->reg_mpamidr);
 
 	/*
 	 * The kernel uses the LDGM/STGM instructions and the number of tags
diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
index d48167fe4218..0ae40b0c7b2f 100644
--- a/arch/arm64/kernel/cpuinfo.c
+++ b/arch/arm64/kernel/cpuinfo.c
@@ -495,7 +495,7 @@ static void __cpuinfo_store_cpu(struct cpuinfo_arm64 *info)
 	info->reg_id_aa64mmfr2 = read_cpuid(ID_AA64MMFR2_EL1);
 	info->reg_id_aa64mmfr3 = read_cpuid(ID_AA64MMFR3_EL1);
 	info->reg_id_aa64mmfr4 = read_cpuid(ID_AA64MMFR4_EL1);
-	info->reg_id_aa64pfr0 = read_cpuid(ID_AA64PFR0_EL1);
+	info->reg_id_aa64pfr0 = read_cpuid_with_overrides(ID_AA64PFR0_EL1);
 	info->reg_id_aa64pfr1 = read_cpuid_with_overrides(ID_AA64PFR1_EL1);
 	info->reg_id_aa64pfr2 = read_cpuid(ID_AA64PFR2_EL1);
 	info->reg_id_aa64zfr0 = read_cpuid(ID_AA64ZFR0_EL1);
@@ -505,15 +505,12 @@ static void __cpuinfo_store_cpu(struct cpuinfo_arm64 *info)
 	if (IS_ENABLED(CONFIG_ARM64_MTE) && id_aa64pfr1_mte(info->reg_id_aa64pfr1))
 		info->reg_gmid = read_cpuid(GMID_EL1);
 
+	if (id_aa64pfr0_mpam(info->reg_id_aa64pfr0) || id_aa64pfr1_mpamfrac(info->reg_id_aa64pfr1))
+		info->reg_mpamidr = read_cpuid(MPAMIDR_EL1);
+
 	if (id_aa64pfr0_32bit_el0(info->reg_id_aa64pfr0))
 		__cpuinfo_store_cpu_32bit(&info->aarch32);
 
-	/*
-	 * info->reg_mpamidr deferred to {init,update}_cpu_features because we
-	 * don't want to read it (and trigger a trap on buggy firmware) if
-	 * using an aa64pfr0_el1 override to unconditionally disable MPAM.
-	 */
-
 	if (IS_ENABLED(CONFIG_ARM64_SME) &&
 	    id_aa64pfr1_sme(info->reg_id_aa64pfr1)) {
 		/*
-- 
2.56.0.385.gd3acb90ef8-goog


