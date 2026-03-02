Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E3CEB363C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 22:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=32pRIfBgcaMRV93APmmDIGcS1vL5A45WBMhTNh3QjKw=; b=lz/MAuvectdhcq0R7uGY60e6HV
	yUPoYhoiNkV16xp9pgkXCXNq+e2urZ3ZF/LOODw6RsVtn9cxMLtpWe1Sh8+3Gw5ScS+9Yw8x0lHPi
	RQRzSPGXUYOsV87jaLj6eBo3wTGYm0nx2XDfsEpqxkyjUzdAxwTaVgGqln8KGLk3pVaWOuszuqGpr
	ryyVvHZL76weXZLFQiL/qni5669QfimfPrY1egc/cUS1sLqulupMOwHieMYj/hfm+7UGKp6uBS0Xq
	lIkfpzOtyvuNnPKHeMg5ZBy1uY3q6jikkeKfaTl5RGimmmdx3M6sFaI9fTzH7Ug21goZ1lrsO/4Db
	gC0TefBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxCEx-0000000EAAt-0sIC;
	Mon, 02 Mar 2026 22:59:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxCEw-0000000EA9a-1UWl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 22:59:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B566C6014C;
	Mon,  2 Mar 2026 22:59:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0880C19425;
	Mon,  2 Mar 2026 22:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772492389;
	bh=bNGXa11VnH1NvzRGc4Tl07oCGUSosAZoawn/QPFfidU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dYNn2v/X/movuo2GInv/rlYhzJ7YyUo6VCNmNDc2j353VBWhVXqd/vA23dfQiAv3p
	 zOsfZAFNmULMKDxzaDvG35r1xmRf/P/nEV1AYg/PtfBelIpWn5hbu3lfIsl0tO9xRj
	 ayx6WONPeFfFe/EImzv4YSRuaN0tt3FO4IGpFCdjidfxHSMLuG1CzjbftMJXycyeBc
	 /mYThkpA1qj4QSpft7Etw8y0XT1b25QCENLT8FHXPKyRooJXPPbBO29vDeI2v6FVNd
	 GWs0R2Xt4CiVsCkd3Yf0nkVjSb1o04al6z5UY2Grv/N3MTnHabp84D4uO5yF9VG3DT
	 gsRQ1Uodr4gJQ==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 02 Mar 2026 22:53:22 +0000
Subject: [PATCH 7/8] arm64/cpufeature: Define hwcaps for 2025 dpISA
 features
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-arm64-dpisa-2025-v1-7-0855e7f41689@kernel.org>
References: <20260302-arm64-dpisa-2025-v1-0-0855e7f41689@kernel.org>
In-Reply-To: <20260302-arm64-dpisa-2025-v1-0-0855e7f41689@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-38bf1
X-Developer-Signature: v=1; a=openpgp-sha256; l=8779; i=broonie@kernel.org;
 h=from:subject:message-id; bh=bNGXa11VnH1NvzRGc4Tl07oCGUSosAZoawn/QPFfidU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpphZT6BGuSdPWhShOCQfApymkYPVM9/1nMpvOI
 /voBV79D5uJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaaYWUwAKCRAk1otyXVSH
 0HAWB/4sTjyyXZAiy/f3AfdhASKKHnoyTEFUklFbLZqj3WKyBKUvkXX8EDhwpCC6KSzIwgipy5I
 K9AKuQ/pC12Ozgf93CPRkYHfEr+Z7Q/QQrUO8ZuYz9hUHEGjkPvUyHtLIF2hPQDZpKSQ0ffDs9z
 d+A5oNXvqdEFJnIErPSg/a8pH9jGm1u79wnxnewJW92/mlzlYnorOKR9kVNSMU4Ex4s7udRNNdi
 4sGYhsZAovJOXi9UKq28QhTbb2R+mpIOVcEIk3LQ33lWIbcUMEcnWK3vlHuGjSiLJXaJpwm68mT
 9wWUsXp+CmItSbkGrXkzm5fT6eoSaRGvHpuK8J9j02wT4Bw3
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

The features added by the 2025 dpISA are all straightforward instruction
only features so there is no state to manage, we can just expose hwcaps to
let userspace know they are available.

F16MM is slightly odd in that the feature is FEAT_F16MM but it is discovered
via ID_AA64FPFR0_EL1.F16MM2. We follow the feature name.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/arch/arm64/elf_hwcaps.rst | 24 ++++++++++++++++++++++++
 arch/arm64/include/uapi/asm/hwcap.h     |  8 ++++++++
 arch/arm64/kernel/cpufeature.c          | 11 +++++++++++
 arch/arm64/kernel/cpuinfo.c             |  8 ++++++++
 4 files changed, 51 insertions(+)

diff --git a/Documentation/arch/arm64/elf_hwcaps.rst b/Documentation/arch/arm64/elf_hwcaps.rst
index 97315ae6c0da..ea9215d65481 100644
--- a/Documentation/arch/arm64/elf_hwcaps.rst
+++ b/Documentation/arch/arm64/elf_hwcaps.rst
@@ -451,6 +451,30 @@ HWCAP3_LS64
     of CPU. User should only use ld64b/st64b on supported target (device)
     memory location, otherwise fallback to the non-atomic alternatives.
 
+HWCAP3_SVE_B16MM
+    Functionality implied by ID_AA64ZFR0_EL1.B16B16 == 0b0011
+
+HWCAP3_SVE2P3
+    Functionality implied by ID_AA64ZFR0_EL1.SVEver == 0b0100
+
+HWCAP3_SME_LUT6
+    Functionality implied by ID_AA64SMFR0_EL1.LUT6 == 0b1
+
+HWCAP3_SME2P3
+    Functionality implied by ID_AA64SMFR0_EL1.SMEver == 0b0100
+
+HWCAP3_F16MM
+    Functionality implied by ID_AA64FPFR0_EL1.F16MM2 == 0b1
+
+HWCAP3_F16F32DOT
+    Functionality implied by ID_AA64ISAR0_EL1.FHM == 0b0010
+
+HWCAP3_F16F32MM
+    Functionality implied by ID_AA64ISAR0_EL1.FHM == 0b0011
+
+HWCAP3_LUT6
+    Functionality implied by ID_AA64ISAR2_EL1.LUT == 0b0010
+
 
 4. Unused AT_HWCAP bits
 -----------------------
diff --git a/arch/arm64/include/uapi/asm/hwcap.h b/arch/arm64/include/uapi/asm/hwcap.h
index 06f83ca8de56..a48aee07a54a 100644
--- a/arch/arm64/include/uapi/asm/hwcap.h
+++ b/arch/arm64/include/uapi/asm/hwcap.h
@@ -147,5 +147,13 @@
 #define HWCAP3_MTE_STORE_ONLY		(1UL << 1)
 #define HWCAP3_LSFE		(1UL << 2)
 #define HWCAP3_LS64		(1UL << 3)
+#define HWCAP3_SVE_B16MM	(1UL << 4)
+#define HWCAP3_SVE2P3		(1UL << 5)
+#define HWCAP3_SME_LUT6		(1UL << 6)
+#define HWCAP3_SME2P3		(1UL << 7)
+#define HWCAP3_F16MM		(1UL << 8)
+#define HWCAP3_F16F32DOT	(1UL << 9)
+#define HWCAP3_F16F32MM		(1UL << 10)
+#define HWCAP3_LUT6		(1UL << 11)
 
 #endif /* _UAPI__ASM_HWCAP_H */
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index c31f8e17732a..a26cef210b08 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -361,6 +361,8 @@ static const struct arm64_ftr_bits ftr_id_aa64zfr0[] = {
 static const struct arm64_ftr_bits ftr_id_aa64smfr0[] = {
 	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_SME),
 		       FTR_STRICT, FTR_EXACT, ID_AA64SMFR0_EL1_FA64_SHIFT, 1, 0),
+	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_SME),
+		       FTR_STRICT, FTR_EXACT, ID_AA64SMFR0_EL1_LUT6_SHIFT, 1, 0),
 	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_SME),
 		       FTR_STRICT, FTR_EXACT, ID_AA64SMFR0_EL1_LUTv2_SHIFT, 1, 0),
 	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_SME),
@@ -415,6 +417,7 @@ static const struct arm64_ftr_bits ftr_id_aa64fpfr0[] = {
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_EXACT, ID_AA64FPFR0_EL1_F8DP2_SHIFT, 1, 0),
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_EXACT, ID_AA64FPFR0_EL1_F8MM8_SHIFT, 1, 0),
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_EXACT, ID_AA64FPFR0_EL1_F8MM4_SHIFT, 1, 0),
+	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_EXACT, ID_AA64FPFR0_EL1_F16MM2_SHIFT, 1, 0),
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_EXACT, ID_AA64FPFR0_EL1_F8E4M3_SHIFT, 1, 0),
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_EXACT, ID_AA64FPFR0_EL1_F8E5M2_SHIFT, 1, 0),
 	ARM64_FTR_END,
@@ -3265,6 +3268,8 @@ static const struct arm64_cpu_capabilities arm64_elf_hwcaps[] = {
 	HWCAP_CAP(ID_AA64ISAR0_EL1, SM4, IMP, CAP_HWCAP, KERNEL_HWCAP_SM4),
 	HWCAP_CAP(ID_AA64ISAR0_EL1, DP, IMP, CAP_HWCAP, KERNEL_HWCAP_ASIMDDP),
 	HWCAP_CAP(ID_AA64ISAR0_EL1, FHM, IMP, CAP_HWCAP, KERNEL_HWCAP_ASIMDFHM),
+	HWCAP_CAP(ID_AA64ISAR0_EL1, FHM, F16F32DOT, CAP_HWCAP, KERNEL_HWCAP_F16F32DOT),
+	HWCAP_CAP(ID_AA64ISAR0_EL1, FHM, F16F32MM, CAP_HWCAP, KERNEL_HWCAP_F16F32MM),
 	HWCAP_CAP(ID_AA64ISAR0_EL1, TS, FLAGM, CAP_HWCAP, KERNEL_HWCAP_FLAGM),
 	HWCAP_CAP(ID_AA64ISAR0_EL1, TS, FLAGM2, CAP_HWCAP, KERNEL_HWCAP_FLAGM2),
 	HWCAP_CAP(ID_AA64ISAR0_EL1, RNDR, IMP, CAP_HWCAP, KERNEL_HWCAP_RNG),
@@ -3290,11 +3295,13 @@ static const struct arm64_cpu_capabilities arm64_elf_hwcaps[] = {
 	HWCAP_CAP(ID_AA64ISAR1_EL1, I8MM, IMP, CAP_HWCAP, KERNEL_HWCAP_I8MM),
 	HWCAP_CAP(ID_AA64ISAR1_EL1, LS64, LS64, CAP_HWCAP, KERNEL_HWCAP_LS64),
 	HWCAP_CAP(ID_AA64ISAR2_EL1, LUT, IMP, CAP_HWCAP, KERNEL_HWCAP_LUT),
+	HWCAP_CAP(ID_AA64ISAR2_EL1, LUT, LUT6, CAP_HWCAP, KERNEL_HWCAP_LUT6),
 	HWCAP_CAP(ID_AA64ISAR3_EL1, FAMINMAX, IMP, CAP_HWCAP, KERNEL_HWCAP_FAMINMAX),
 	HWCAP_CAP(ID_AA64ISAR3_EL1, LSFE, IMP, CAP_HWCAP, KERNEL_HWCAP_LSFE),
 	HWCAP_CAP(ID_AA64MMFR2_EL1, AT, IMP, CAP_HWCAP, KERNEL_HWCAP_USCAT),
 #ifdef CONFIG_ARM64_SVE
 	HWCAP_CAP(ID_AA64PFR0_EL1, SVE, IMP, CAP_HWCAP, KERNEL_HWCAP_SVE),
+	HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, SVEver, SVE2p3, CAP_HWCAP, KERNEL_HWCAP_SVE2P3),
 	HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, SVEver, SVE2p2, CAP_HWCAP, KERNEL_HWCAP_SVE2P2),
 	HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, SVEver, SVE2p1, CAP_HWCAP, KERNEL_HWCAP_SVE2P1),
 	HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, SVEver, SVE2, CAP_HWCAP, KERNEL_HWCAP_SVE2),
@@ -3304,6 +3311,7 @@ static const struct arm64_cpu_capabilities arm64_elf_hwcaps[] = {
 	HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, BitPerm, IMP, CAP_HWCAP, KERNEL_HWCAP_SVEBITPERM),
 	HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, B16B16, IMP, CAP_HWCAP, KERNEL_HWCAP_SVE_B16B16),
 	HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, B16B16, BFSCALE, CAP_HWCAP, KERNEL_HWCAP_SVE_BFSCALE),
+	HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, B16B16, B16MM, CAP_HWCAP, KERNEL_HWCAP_SVE_B16MM),
 	HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, BF16, IMP, CAP_HWCAP, KERNEL_HWCAP_SVEBF16),
 	HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, BF16, EBF16, CAP_HWCAP, KERNEL_HWCAP_SVE_EBF16),
 	HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, SHA3, IMP, CAP_HWCAP, KERNEL_HWCAP_SVESHA3),
@@ -3343,7 +3351,9 @@ static const struct arm64_cpu_capabilities arm64_elf_hwcaps[] = {
 #ifdef CONFIG_ARM64_SME
 	HWCAP_CAP(ID_AA64PFR1_EL1, SME, IMP, CAP_HWCAP, KERNEL_HWCAP_SME),
 	HWCAP_CAP_MATCH_ID(has_sme_feature, ID_AA64SMFR0_EL1, FA64, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_FA64),
+	HWCAP_CAP_MATCH_ID(has_sme_feature, ID_AA64SMFR0_EL1, LUT6, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_LUT6),
 	HWCAP_CAP_MATCH_ID(has_sme_feature, ID_AA64SMFR0_EL1, LUTv2, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_LUTV2),
+	HWCAP_CAP_MATCH_ID(has_sme_feature, ID_AA64SMFR0_EL1, SMEver, SME2p3, CAP_HWCAP, KERNEL_HWCAP_SME2P3),
 	HWCAP_CAP_MATCH_ID(has_sme_feature, ID_AA64SMFR0_EL1, SMEver, SME2p2, CAP_HWCAP, KERNEL_HWCAP_SME2P2),
 	HWCAP_CAP_MATCH_ID(has_sme_feature, ID_AA64SMFR0_EL1, SMEver, SME2p1, CAP_HWCAP, KERNEL_HWCAP_SME2P1),
 	HWCAP_CAP_MATCH_ID(has_sme_feature, ID_AA64SMFR0_EL1, SMEver, SME2, CAP_HWCAP, KERNEL_HWCAP_SME2),
@@ -3374,6 +3384,7 @@ static const struct arm64_cpu_capabilities arm64_elf_hwcaps[] = {
 	HWCAP_CAP(ID_AA64FPFR0_EL1, F8DP2, IMP, CAP_HWCAP, KERNEL_HWCAP_F8DP2),
 	HWCAP_CAP(ID_AA64FPFR0_EL1, F8MM8, IMP, CAP_HWCAP, KERNEL_HWCAP_F8MM8),
 	HWCAP_CAP(ID_AA64FPFR0_EL1, F8MM4, IMP, CAP_HWCAP, KERNEL_HWCAP_F8MM4),
+	HWCAP_CAP(ID_AA64FPFR0_EL1, F16MM2, IMP, CAP_HWCAP, KERNEL_HWCAP_F16MM),
 	HWCAP_CAP(ID_AA64FPFR0_EL1, F8E4M3, IMP, CAP_HWCAP, KERNEL_HWCAP_F8E4M3),
 	HWCAP_CAP(ID_AA64FPFR0_EL1, F8E5M2, IMP, CAP_HWCAP, KERNEL_HWCAP_F8E5M2),
 #ifdef CONFIG_ARM64_POE
diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
index 6149bc91251d..1967ef4e25c8 100644
--- a/arch/arm64/kernel/cpuinfo.c
+++ b/arch/arm64/kernel/cpuinfo.c
@@ -164,6 +164,14 @@ static const char *const hwcap_str[] = {
 	[KERNEL_HWCAP_MTE_FAR]		= "mtefar",
 	[KERNEL_HWCAP_MTE_STORE_ONLY]	= "mtestoreonly",
 	[KERNEL_HWCAP_LSFE]		= "lsfe",
+	[KERNEL_HWCAP_SVE_B16MM]	= "sveb16mm",
+	[KERNEL_HWCAP_SVE2P3]		= "sve2p3",
+	[KERNEL_HWCAP_SME_LUT6]		= "smelut6",
+	[KERNEL_HWCAP_SME2P3]		= "sme2p3",
+	[KERNEL_HWCAP_F16MM]		= "f16mm",
+	[KERNEL_HWCAP_F16F32DOT]	= "f16f32dot",
+	[KERNEL_HWCAP_F16F32MM]		= "f16f32mm",
+	[KERNEL_HWCAP_LUT6]		= "lut6",
 };
 
 #ifdef CONFIG_COMPAT

-- 
2.47.3


