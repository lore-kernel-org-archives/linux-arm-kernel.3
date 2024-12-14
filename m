Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B03E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 01:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yjbPundlswM+RqZ35dE9CVv0oq7bz8gVbAYpvYdnrgs=; b=QMEi4UFUBqr1Tbgc/0okzhiU3H
	YshvbE1wdXHkV3bXWniZ84NB1rCLnavc7erBGbMa2cEGAufgaAXgVKME9+QFE8v+wZ6KnDR57YtS/
	wD+GP1/Vs2C0B+83stwsS7l30w07MBX4p8rlbrXXMlTMPQQCvqgGkDKpou9TI0y5iMGB49CNBHcU4
	/o0iYbUy91w15io93IRJCiqDeb5rR+C/AZTQSiuIw8Prl2wTVP/jkXZTf7pCS3wT5gtU06dagEWrE
	w42MgYRRewLUdl3svwbMxjvUmcSMAjT2uApMnfeF5mkTuE6EdadMnK6rOrPadtlPqu61dKabBDMxY
	le4UAEmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMGWS-00000005Rze-3pqp;
	Sat, 14 Dec 2024 01:00:44 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMGPJ-00000005Qo3-0BcQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 00:53:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3313AA42EC0;
	Sat, 14 Dec 2024 00:51:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94797C4CED0;
	Sat, 14 Dec 2024 00:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734137600;
	bh=TU7beI3w2g6z5G8iT84//FPeFwQvnKablyc1aMJP4JE=;
	h=From:Date:Subject:To:Cc:From;
	b=kM5JrsDYHFuauJhvfUTwWoHEKNgcBPjVnGR9KwDc8viRCPgBNlxHtrXyK2S1bGqEi
	 v4F4xv1kssglbriZNeaVgYgAGzhRP97MjMRp1aflh9+0hbMgZvGf6yGUGKLTi+S//7
	 /wdsHE+HQwPKhQ5Zcp0KnT3ZcKxMKjfOTO55oKsQrTIY4uj8BeJk2CeRReus2gCjuC
	 kz9iv0CU+1d1skpfaKSBtunfireTWs+9U9s9gO1su+rruMoiiyfN6+YUM89cequSYN
	 MmI3kP3bhSFTMHXDmSrrI8B1xkpr9bh/Gc3mGqzCwWZ9caw9YabMe3V3+qJii57poC
	 BsQM0wkQbcpQg==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 14 Dec 2024 00:52:08 +0000
Subject: [PATCH] arm64/sme: Move storage of reg_smidr to
 __cpuinfo_store_cpu()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-arm64-fix-boot-cpu-smidr-v1-1-0745c40772dd@kernel.org>
X-B4-Tracking: v=1; b=H4sIALfWXGcC/x2MQQ5AMBAAvyJ7tokuEXxFHFpd7IHKFpGIv2scJ
 5mZByKrcIQue0D5kihhS2DyDMbFbjOj+MRABVWGTIlW17rCSW50IRw47ifGVbxi2dSu8Y5acgQ
 p35WT9a/74X0/z2wzFWoAAAA=
X-Change-ID: 20241213-arm64-fix-boot-cpu-smidr-386b8db292b2
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Peter Collingbourne <pcc@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=2881; i=broonie@kernel.org;
 h=from:subject:message-id; bh=TU7beI3w2g6z5G8iT84//FPeFwQvnKablyc1aMJP4JE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnXNb9A0sFwErABm1PkpyY8E9bipFtL2o3asskTfST
 0a3YhaiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ1zW/QAKCRAk1otyXVSH0B23CA
 CDgnCBHdnKTjOZmTQ+K+vA3rdNNZl4B31eptRG3/hV71c3oiMORttN/cFZ5yjwrgmA+KO+2HueqI2V
 0JROSKJqV3pAae4WWgtTP8JRhvFwAjKRL4wEGnrDq7LotAhY32lVndkK3fBzJmOyyJKBSyp8OSS9TV
 lvDKz6AyrSHin8fqhqFQuUBln3UHZsG9lEM5nX54SrZYU6q8DwY8K5yB/uIaECvNixkHrJicUTpzOz
 XYHmkT/YFxRO89WwaxhhHVDmuRcyIw15uYfdwOBAkLkjm4Akw4rM5+Rulrayd1W9oDbsIPuICUBOW+
 9SEHmBq1XURiVX+WM6yDCP6Kokz2Ek
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_165321_222242_06F55C66 
X-CRM114-Status: GOOD (  17.25  )
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

In commit 892f7237b3ff ("arm64: Delay initialisation of
cpuinfo_arm64::reg_{zcr,smcr}") we moved access to ZCR, SMCR and SMIDR
later in the boot process in order to ensure that we don't attempt to
interact with them if SVE or SME is disabled on the command line.
Unfortunately when initialising the boot CPU in init_cpu_features() we work
on a copy of the struct cpuinfo_arm64 for the boot CPU used only during
boot, not the percpu copy used by the sysfs code.

Fix this by moving the handling for SMIDR_EL1 for the boot CPU to
cpuinfo_store_boot_cpu() so it can operate on the percpu copy of the data.
This reduces the potential for error that could come from having both the
percpu and boot CPU copies in init_cpu_features().

This issue wasn't apparent when testing on emulated platforms that do not
report values in this ID register.

Fixes: 892f7237b3ff ("arm64: Delay initialisation of cpuinfo_arm64::reg_{zcr,smcr}")
Signed-off-by: Mark Brown <broonie@kernel.org>
Cc: stable@vger.kernel.org
---
 arch/arm64/kernel/cpufeature.c |  6 ------
 arch/arm64/kernel/cpuinfo.c    | 11 +++++++++++
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 6ce71f444ed84f9056196bb21bbfac61c9687e30..b88102fd2c20f77e25af6df513fda09a484e882e 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -1167,12 +1167,6 @@ void __init init_cpu_features(struct cpuinfo_arm64 *info)
 	    id_aa64pfr1_sme(read_sanitised_ftr_reg(SYS_ID_AA64PFR1_EL1))) {
 		unsigned long cpacr = cpacr_save_enable_kernel_sme();
 
-		/*
-		 * We mask out SMPS since even if the hardware
-		 * supports priorities the kernel does not at present
-		 * and we block access to them.
-		 */
-		info->reg_smidr = read_cpuid(SMIDR_EL1) & ~SMIDR_EL1_SMPS;
 		vec_init_vq_map(ARM64_VEC_SME);
 
 		cpacr_restore(cpacr);
diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
index d79e88fccdfce427507e7a34c5959ce6309cbd12..b7d403da71e5a01ed3943eb37e7a00af238771a2 100644
--- a/arch/arm64/kernel/cpuinfo.c
+++ b/arch/arm64/kernel/cpuinfo.c
@@ -499,4 +499,15 @@ void __init cpuinfo_store_boot_cpu(void)
 
 	boot_cpu_data = *info;
 	init_cpu_features(&boot_cpu_data);
+
+	/* SMIDR_EL1 needs to be stored in the percpu data for sysfs */
+	if (IS_ENABLED(CONFIG_ARM64_SME) &&
+	    id_aa64pfr1_sme(read_sanitised_ftr_reg(SYS_ID_AA64PFR1_EL1))) {
+		/*
+		 * We mask out SMPS since even if the hardware
+		 * supports priorities the kernel does not at present
+		 * and we block access to them.
+		 */
+		info->reg_smidr = read_cpuid(SMIDR_EL1) & ~SMIDR_EL1_SMPS;
+	}
 }

---
base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
change-id: 20241213-arm64-fix-boot-cpu-smidr-386b8db292b2

Best regards,
-- 
Mark Brown <broonie@kernel.org>


