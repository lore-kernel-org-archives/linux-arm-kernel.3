Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C324DE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 22:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q6jS5aM1yrT3Wk9S7thAANBeV8nY/BPLKgNmJ653TKY=; b=2MtW4JZh7rgpoyEjm/Xiutz0d0
	Avl3xLj57bEUNMXC5E8WBCNZlZW93hWZ7vfYJoodE7svYDB8ZAEw5mghfPPjegDSv3ek4uqmNAPId
	45sel2YAMCtsviGVNnrDNXRB1tjqMTaKHADIkLdKswXAkBkZp5oA9Rj4NbSHE/6mtQ7+HOsWkD03M
	NU1iaK1g/g2kq6P75CeRMSONT/MIL7CwHGqPFs6nPngUSd7jzMf5KFUrqPQ3MMKsM7DuWnTpAGN2a
	0DudX0C7fmWTYVz2AibAe+ys5gbBNXnubV0knCnhZNOiwZW//e9/rWszQXhII/dA/yCes1ne+XK9z
	vBrReGtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNJJY-0000000BWr2-2Phr;
	Mon, 16 Dec 2024 22:11:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNJIT-0000000BWjS-1Duz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 22:10:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 56D615C5FF8;
	Mon, 16 Dec 2024 22:09:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72799C4CED0;
	Mon, 16 Dec 2024 22:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734387036;
	bh=ZIHajP4z57vTK6o8UQy25HxwSbrcv4ka0/7b+g82lUw=;
	h=From:Date:Subject:To:Cc:From;
	b=opUh50brzVPKAwm+HiKPLbZrgKBYmzlilsh/3ukaLU/buTh0CbgqBgLSg5ZDy/lkd
	 EYVMoHCG7QF4nr97KxPEVhEM5/jd9oJEnclMFBGlvWNc6xaZ8XeiZOFkTIjvc/zJ5C
	 tt1kc593uzIznn7hjIR2TcM/iuGdcyyYKWOoEnIQPbnmO3zdR9Yq4r3cJ11eNw39jp
	 Lan5Y6r0ld6ORpEFSlXv9KrG89QklEd7MCyH+zblWdXbmBWCs3WFpoR5upOIphj82t
	 eCo+1s5B1lFsCN3SDIzZD6s44s/axls1l1EAKwCE+7lhfl024bIeupQNgpLNcClUu/
	 KVNUAva3lhQ1Q==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 16 Dec 2024 22:09:57 +0000
Subject: [PATCH v2] arm64/sme: Move storage of reg_smidr to
 __cpuinfo_store_cpu()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-arm64-fix-boot-cpu-smidr-v2-1-a99ffba2c37f@kernel.org>
X-B4-Tracking: v=1; b=H4sIADSlYGcC/3WNwQ6CMBBEf4Xs2TV0qYCc/A/DgdIVGoWSLRIN4
 d+tJB49vsnMmxUCi+MAVbKC8OKC82MEOiTQ9s3YMTobGSglrUhl2MiQa7y5FxrvZ2ynJ4bBWcG
 szE1pDZ3JEMT5JBxbu/paR+5dmL2896dFfdOfVP+XLgoVpoU+tTotCrL2cmcZ+XH00kG9bdsHR
 AvDh8EAAAA=
X-Change-ID: 20241213-arm64-fix-boot-cpu-smidr-386b8db292b2
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Peter Collingbourne <pcc@google.com>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=6545; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ZIHajP4z57vTK6o8UQy25HxwSbrcv4ka0/7b+g82lUw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnYKVZSu/xk3Hx9eeazIYaRErt7yWMIhYKlSJQ+jri
 rhn5G3+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ2ClWQAKCRAk1otyXVSH0PbQCA
 CGr/pzNQ+4UkN5B5h/BMsUNdrwoivyL0BSal8dZDeMC9UZwa5NCXA/Wm5D+rHZd5EocY6ha+3sLdU9
 hQFqIe7/E2mvWJgF0Ky5+pvwpMEcjhX+UxW+YRT7dnx9iyDllQL5McMgL/DoXDfyFALQCmWO+brrP4
 4WJbcnzNnZG4LpS/8tPH5P2nVrBCdYW3mqckwnPp/D8noMaboNGI5HEXyGgzpJKnmuUwnbhHms//LV
 kJwHCfLuFs5magNuqKN+P2x+DjLAfKdYKXcboCYj2QCRv6TZ826iXW6JRQyGTORzTS8BolULi9iQT+
 +eaYgvrEx6Z9jJV0Gz9uhDItneRH74
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_141037_439326_3E37503F 
X-CRM114-Status: GOOD (  25.47  )
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
all) let's just remove the override and store SMIDR_EL1 along with all
the other ID register reads in __cpuinfo_store_cpu().

This issue wasn't apparent when testing on emulated platforms that do not
report values in SMIDR_EL1.

Fixes: 892f7237b3ff ("arm64: Delay initialisation of cpuinfo_arm64::reg_{zcr,smcr}")
Signed-off-by: Mark Brown <broonie@kernel.org>
Cc: stable@vger.kernel.org
---
Changes in v2:
- Move the ID register read back to __cpuinfo_store_cpu().
- Remove the command line option for SME ID register override.
- Link to v1: https://lore.kernel.org/r/20241214-arm64-fix-boot-cpu-smidr-v1-1-0745c40772dd@kernel.org
---
 Documentation/admin-guide/kernel-parameters.txt |  3 ---
 arch/arm64/kernel/cpufeature.c                  | 13 -------------
 arch/arm64/kernel/cpuinfo.c                     | 10 ++++++++++
 arch/arm64/kernel/pi/idreg-override.c           | 16 ----------------
 4 files changed, 10 insertions(+), 32 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index dc663c0ca67067d041cf9a3767117eec765ccca8..d29dee978e933245e0db0f654f17eef3e414bb64 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -458,9 +458,6 @@
 	arm64.nopauth	[ARM64] Unconditionally disable Pointer Authentication
 			support
 
-	arm64.nosme	[ARM64] Unconditionally disable Scalable Matrix
-			Extension support
-
 	arm64.nosve	[ARM64] Unconditionally disable Scalable Vector
 			Extension support
 
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
 
diff --git a/arch/arm64/kernel/pi/idreg-override.c b/arch/arm64/kernel/pi/idreg-override.c
index 22159251eb3a6a5efea90ebda2910ebcfff52b8f..15dca48332c9b83b55752e474854d8fc45b0989b 100644
--- a/arch/arm64/kernel/pi/idreg-override.c
+++ b/arch/arm64/kernel/pi/idreg-override.c
@@ -122,21 +122,6 @@ static const struct ftr_set_desc pfr0 __prel64_initconst = {
 	},
 };
 
-static bool __init pfr1_sme_filter(u64 val)
-{
-	/*
-	 * Similarly to SVE, disabling SME also means disabling all
-	 * the features that are associated with it. Just set
-	 * id_aa64smfr0_el1 to 0 and don't look back.
-	 */
-	if (!val) {
-		id_aa64smfr0_override.val = 0;
-		id_aa64smfr0_override.mask = GENMASK(63, 0);
-	}
-
-	return true;
-}
-
 static const struct ftr_set_desc pfr1 __prel64_initconst = {
 	.name		= "id_aa64pfr1",
 	.override	= &id_aa64pfr1_override,
@@ -144,7 +129,6 @@ static const struct ftr_set_desc pfr1 __prel64_initconst = {
 		FIELD("bt", ID_AA64PFR1_EL1_BT_SHIFT, NULL ),
 		FIELD("gcs", ID_AA64PFR1_EL1_GCS_SHIFT, NULL),
 		FIELD("mte", ID_AA64PFR1_EL1_MTE_SHIFT, NULL),
-		FIELD("sme", ID_AA64PFR1_EL1_SME_SHIFT, pfr1_sme_filter),
 		{}
 	},
 };

---
base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
change-id: 20241213-arm64-fix-boot-cpu-smidr-386b8db292b2

Best regards,
-- 
Mark Brown <broonie@kernel.org>


