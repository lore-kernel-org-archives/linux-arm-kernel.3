Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50370E77184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 22:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O+imj12A4A2rTwiQpDq7AfX3T0lx2eWsZ7NjRV89tQY=; b=ZtOXjlh0vm5+g2twO8mFi6b4p2
	FtIURMct/noRG+YBMCJZJgfcggQr9p66YQJ6gDVo7cj/ZPedBZnau+BfvwHlp+ZFosose5uUxIPCH
	W9hW5i74ax0qGlaxfmeH8A7sObNmS7LJntwOhwzG4hxKpP9gOeVIRUI01HHzkwAYiWAeqJdMH8zXf
	ZR9+swJBVbotQs1Vc05qFbxf3dxau7MSLOUbw1BGKV4dPGsyVKYM8jXalWl5N55G15j+y5nSkjgio
	XYMiYpjxCUzazv69Wq5W4oH5XSW925KE2JQjK/UcxKtw0oquAoKIZBNmIJOl2SXf3EwY3sixqy3E7
	YzYephig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNfdO-0000000EwS2-2kzi;
	Tue, 17 Dec 2024 22:01:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNfcI-0000000EwJG-3EpX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 22:00:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E7FEA5C5B1F;
	Tue, 17 Dec 2024 21:59:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0B76C4CED3;
	Tue, 17 Dec 2024 22:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734472833;
	bh=UdvwEKCif7SL13UWTKxZEOkRyDKodoLCPs1kFcwO9ik=;
	h=From:Date:Subject:To:Cc:From;
	b=AU6wpPWTpHjHUMi92kiJloIuVM7EgEVAzyuXekOtRMvIXED5z7QiizAUOJZ//s2wv
	 iCqe3bKyXqR1uKRRaZd+QIzshlaG4xnc47ZkJTfatHDwS4zUY1K39FI+e0ZHPXPNcb
	 y8ESFNmq7v0ckOlcseK94Mh4B/11t2sAkPcM8esW6OJ/fol4MwpOeSycMu2XoRoXkc
	 XUJrwRBlFGR543kBhGTeuE4qfNyhaWF3XZukS/t6QTVTETTv5rS5UFnsckTPnAj7uI
	 lBinPqWMowrXPn+l1o6NJW3yb7HC/CanBkgZEJYqvA4/SIzadzKWA99vhyxdfIdP3x
	 d9aM2UOBD/RuQ==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 17 Dec 2024 21:59:48 +0000
Subject: [PATCH v3] arm64/sme: Move storage of reg_smidr to
 __cpuinfo_store_cpu()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-arm64-fix-boot-cpu-smidr-v3-1-7be278a85623@kernel.org>
X-B4-Tracking: v=1; b=H4sIAFT0YWcC/33NwQ6CMAyA4VchO1vDusnAk+9hPDA2YFEY6ZBoC
 O/uIDHRgx7/pv06s2DJ2cCOyczITi4438cQu4RVbdk3FpyJzTBFyZELKKnLJNTuAdr7EarhDqF
 zhkDkmc6NxgI1sng+kI1bG32+xG5dGD09t08TX6dvVP5GJw4cUiUPlUyVQmNOV0u9ve09NWxVJ
 /yUsj8SRqksirrWJVZC1V/SsiwvBFSiVgsBAAA=
X-Change-ID: 20241213-arm64-fix-boot-cpu-smidr-386b8db292b2
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Peter Collingbourne <pcc@google.com>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=4781; i=broonie@kernel.org;
 h=from:subject:message-id; bh=UdvwEKCif7SL13UWTKxZEOkRyDKodoLCPs1kFcwO9ik=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnYfR+z0ttVHBHgHuta4bowAhzuy6x8DgqTDQWKRxy
 8lziSdmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ2H0fgAKCRAk1otyXVSH0F9BB/
 wOFcy89llIBoJPEAQcioqnU8ppbKLYEVimCcjrsFnInq+ExM9mp4iPaThprBKSZuhcVbosteIr7Gf1
 J8Nmc+hBJqhjdBwF6zX5dRHMzuE4bnb+Q8faH7rSHu0rrtFhqnsnFIpNAAcxA/XUUMjWHZL7KLxmxj
 Myhe1uWXLARisurkHD7oU63fz8YF/aZqZfh5u0rnc3OaxypQLeNX11mNv5mJF1hovWIgJn+GaxK8np
 cD4FtHuLMBzQKtUK9DolIsGr9Xou72Atl7NbDsqjZvsj32DShuN/5zQePH8O1O1BpCD2RkBIeM/6XJ
 th3oSl+tKb13L99sEz7I4PgBtXGSku
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_140034_922821_438FCBC8 
X-CRM114-Status: GOOD (  21.81  )
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
boot, not the percpu copy used by the sysfs code. The expectation of the
feature identification code was that the ID registers would be read in
__cpuinfo_store_cpu() and the values not modified by init_cpu_features().

The main reason for the original change was to avoid early accesses to
ZCR on practical systems that were seen shipping with SVE reported in ID
registers but traps enabled at EL3 and handled as fatal errors, SME was
rolled in due to the similarity with SVE. Since then we have removed the
early accesses to ZCR and SMCR in commits:

  abef0695f9665c3d ("arm64/sve: Remove ZCR pseudo register from cpufeature code")
  391208485c3ad50f ("arm64/sve: Remove SMCR pseudo register from cpufeature code")

so only the SMIDR_EL1 part of the change remains. Since SMIDR_EL1 is
only trapped via FEAT_IDST and not the SME trap it is less likely to be
affected by similar issues, and the factors that lead to issues with SVE
are less likely to apply to SME.

Since we have not yet seen practical SME systems that need to use a
command line override (and are only just beginning to see SME systems at
all) and the ID register read is much more likely to be safe let's just
store SMIDR_EL1 along with all the other ID register reads in
__cpuinfo_store_cpu().

This issue wasn't apparent when testing on emulated platforms that do not
report values in SMIDR_EL1.

Fixes: 892f7237b3ff ("arm64: Delay initialisation of cpuinfo_arm64::reg_{zcr,smcr}")
Signed-off-by: Mark Brown <broonie@kernel.org>
Cc: stable@vger.kernel.org
---
Changes in v3:
- Leave the override in place.
- Link to v2: https://lore.kernel.org/r/20241216-arm64-fix-boot-cpu-smidr-v2-1-a99ffba2c37f@kernel.org

Changes in v2:
- Move the ID register read back to __cpuinfo_store_cpu().
- Remove the command line option for SME ID register override.
- Link to v1: https://lore.kernel.org/r/20241214-arm64-fix-boot-cpu-smidr-v1-1-0745c40772dd@kernel.org
---
 arch/arm64/kernel/cpufeature.c | 13 -------------
 arch/arm64/kernel/cpuinfo.c    | 10 ++++++++++
 2 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 6ce71f444ed84f9056196bb21bbfac61c9687e30..818aca922ca6066eb4bdf79e153cccb24246c61b 100644
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
@@ -1423,13 +1417,6 @@ void update_cpu_features(int cpu,
 	    id_aa64pfr1_sme(read_sanitised_ftr_reg(SYS_ID_AA64PFR1_EL1))) {
 		unsigned long cpacr = cpacr_save_enable_kernel_sme();
 
-		/*
-		 * We mask out SMPS since even if the hardware
-		 * supports priorities the kernel does not at present
-		 * and we block access to them.
-		 */
-		info->reg_smidr = read_cpuid(SMIDR_EL1) & ~SMIDR_EL1_SMPS;
-
 		/* Probe vector lengths */
 		if (!system_capabilities_finalized())
 			vec_update_vq_map(ARM64_VEC_SME);
diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
index d79e88fccdfce427507e7a34c5959ce6309cbd12..c45633b5ae233fe78607fce3d623efb28a9f341a 100644
--- a/arch/arm64/kernel/cpuinfo.c
+++ b/arch/arm64/kernel/cpuinfo.c
@@ -482,6 +482,16 @@ static void __cpuinfo_store_cpu(struct cpuinfo_arm64 *info)
 	if (id_aa64pfr0_mpam(info->reg_id_aa64pfr0))
 		info->reg_mpamidr = read_cpuid(MPAMIDR_EL1);
 
+	if (IS_ENABLED(CONFIG_ARM64_SME) &&
+	    id_aa64pfr1_sme(info->reg_id_aa64pfr1)) {
+		/*
+		 * We mask out SMPS since even if the hardware
+		 * supports priorities the kernel does not at present
+		 * and we block access to them.
+		 */
+		info->reg_smidr = read_cpuid(SMIDR_EL1) & ~SMIDR_EL1_SMPS;
+	}
+
 	cpuinfo_detect_icache_policy(info);
 }
 

---
base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
change-id: 20241213-arm64-fix-boot-cpu-smidr-386b8db292b2

Best regards,
-- 
Mark Brown <broonie@kernel.org>


