Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D4C7CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 21:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XA45GgyMFptg8nMtCksqWZb6a37WSiRFA2uoqnixTJc=; b=OzwzP5BmalLAy3DfJ8KSLcl0IX
	G0EuCXgnBt8+Hr8khnu5UwntUOeCXjv9k2OQC4ttJEgBLbxSAqAgfuDx/d05wys3ucX6nmJKkNVcG
	dw99Kb76snsgkS+3hACgbMpJLJofrYapgmWpiI8Ix0LWmJqT5n6rOqOot4Y/2pU9NcI7MEzfKP6CT
	Ok2m16zJDN0Nj7VS6msqOULParMmiMbE20LhRX6HPdG3l3L0aM0dPmXUSOEcfWnoFJLrdxYSkv1aV
	Bcg2ythSy5a50n/gaqV7x8zGkWlRfAiAnymfqL8tzOz4Mfw4OSiiW2jPeemYTOXjJU+9DLw8iK8ED
	BOShotjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo7Nv-00000008i5B-1aBb;
	Mon, 18 Aug 2025 21:27:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo5Uw-00000008VhE-48Ec
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 19:26:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AF7CB45FF6;
	Mon, 18 Aug 2025 19:26:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B1B6C116D0;
	Mon, 18 Aug 2025 19:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755545186;
	bh=tE3vjuer16Q9aKRgwGD1wbqaDmgXWO5eLjpXugsWLRg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mqjxnwpb2AKhJqL5v+7S29hYiGmXD/FPeCQDu0k1XK5SnroTIJ+OkeaXlA+2eSGmk
	 scD3LevEvtqKO00LNdvNxFntrhbOE/fkMiSyYwCYH/CwdzWe4WXe7ebKuEv4a24lbt
	 eG3aNVrDC6tE9HHP4zimCj/BAq8xGKc7uy7t5ia+JJMI9XFqeAfzbTDIbd3Rmm5kTc
	 Zd5mDbI7FpPLOy2G/3oX4NHEP7AsIWBvcDdW8aaygsSi3HVczoeA2WFW6v+NMt+1+q
	 CAjO+UttrHZF0wneJygH9FXt9sQe7LqOdcPQVFmGqlilVzRsdPn0U4bDZfpB1G00Z1
	 25q0obdtmMLgA==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 18 Aug 2025 20:21:18 +0100
Subject: [PATCH v3 1/3] arm64/hwcap: Add hwcap for FEAT_LSFE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-arm64-lsfe-v3-1-af6f4d66eb39@kernel.org>
References: <20250818-arm64-lsfe-v3-0-af6f4d66eb39@kernel.org>
In-Reply-To: <20250818-arm64-lsfe-v3-0-af6f4d66eb39@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-cff91
X-Developer-Signature: v=1; a=openpgp-sha256; l=3733; i=broonie@kernel.org;
 h=from:subject:message-id; bh=tE3vjuer16Q9aKRgwGD1wbqaDmgXWO5eLjpXugsWLRg=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhozFdVHV7+rqbFMjNDKE55d4hFvO4mhaP2HxSlvT1tYsG
 8ui4y2djMYsDIxcDLJiiixrn2WsSg+X2Dr/0fxXMINYmUCmMHBxCsBENlax/y9/lVHv4RzPM6GT
 QX2XRqPNZ9brvVc/pjOpJ4dUn52/XI+vRN6A+YrLV4mknBtn4/pCLusf37RzvvAfMQ2W/JrU9wz
 NbK+0otW7Nu4/JXqs18TvpF/jSdaTi0QZ9yhvFN/kZNK5xrQzRnMi19sD7zz5P09fVVi5d5Hpxs
 6FsebJ21ga7udGvzQ63WC2ZFWt4/HYZVIe7Ts2pume3Jyk7DY515dnmrK+5jyjyZ/PfosWsD+e+
 bwjWHnn4lU/58Q18fYtMquR1Y2K+Vwqc7dbYsMzq5j+F9nVf6WEwhWa2n+cZBIJPRZveDC85QJf
 zpLvob4Rxu+Ovzu+O/zotgcc1e+anGW/uQmftwlRsE8AAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_122627_069031_AE0958D8 
X-CRM114-Status: GOOD (  13.36  )
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

FEAT_LSFE (Large System Float Extension), providing atomic floating point
memory operations, is optional from v9.5. This feature adds no new
architectural stare and we have no immediate use for it in the kernel so
simply provide a hwcap for it to support discovery by userspace.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/arch/arm64/elf_hwcaps.rst | 4 ++++
 arch/arm64/include/asm/hwcap.h          | 1 +
 arch/arm64/include/uapi/asm/hwcap.h     | 1 +
 arch/arm64/kernel/cpufeature.c          | 2 ++
 arch/arm64/kernel/cpuinfo.c             | 1 +
 5 files changed, 9 insertions(+)

diff --git a/Documentation/arch/arm64/elf_hwcaps.rst b/Documentation/arch/arm64/elf_hwcaps.rst
index f58ada4d6cb2..a15df4956849 100644
--- a/Documentation/arch/arm64/elf_hwcaps.rst
+++ b/Documentation/arch/arm64/elf_hwcaps.rst
@@ -441,6 +441,10 @@ HWCAP3_MTE_FAR
 HWCAP3_MTE_STORE_ONLY
     Functionality implied by ID_AA64PFR2_EL1.MTESTOREONLY == 0b0001.
 
+HWCAP3_LSFE
+    Functionality implied by ID_AA64ISAR3_EL1.LSFE == 0b0001
+
+
 4. Unused AT_HWCAP bits
 -----------------------
 
diff --git a/arch/arm64/include/asm/hwcap.h b/arch/arm64/include/asm/hwcap.h
index 13f94c8ddfc0..6d567265467c 100644
--- a/arch/arm64/include/asm/hwcap.h
+++ b/arch/arm64/include/asm/hwcap.h
@@ -178,6 +178,7 @@
 #define __khwcap3_feature(x)		(const_ilog2(HWCAP3_ ## x) + 128)
 #define KERNEL_HWCAP_MTE_FAR		__khwcap3_feature(MTE_FAR)
 #define KERNEL_HWCAP_MTE_STORE_ONLY	__khwcap3_feature(MTE_STORE_ONLY)
+#define KERNEL_HWCAP_LSFE		__khwcap3_feature(LSFE)
 
 /*
  * This yields a mask that user programs can use to figure out what
diff --git a/arch/arm64/include/uapi/asm/hwcap.h b/arch/arm64/include/uapi/asm/hwcap.h
index 72c78468b806..575564ecdb0b 100644
--- a/arch/arm64/include/uapi/asm/hwcap.h
+++ b/arch/arm64/include/uapi/asm/hwcap.h
@@ -145,5 +145,6 @@
  */
 #define HWCAP3_MTE_FAR		(1UL << 0)
 #define HWCAP3_MTE_STORE_ONLY		(1UL << 1)
+#define HWCAP3_LSFE		(1UL << 2)
 
 #endif /* _UAPI__ASM_HWCAP_H */
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 9ad065f15f1d..b1219f14459f 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -278,6 +278,7 @@ static const struct arm64_ftr_bits ftr_id_aa64isar2[] = {
 
 static const struct arm64_ftr_bits ftr_id_aa64isar3[] = {
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64ISAR3_EL1_FPRCVT_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_VISIBLE, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64ISAR3_EL1_LSFE_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64ISAR3_EL1_FAMINMAX_SHIFT, 4, 0),
 	ARM64_FTR_END,
 };
@@ -3252,6 +3253,7 @@ static const struct arm64_cpu_capabilities arm64_elf_hwcaps[] = {
 	HWCAP_CAP(ID_AA64ISAR1_EL1, I8MM, IMP, CAP_HWCAP, KERNEL_HWCAP_I8MM),
 	HWCAP_CAP(ID_AA64ISAR2_EL1, LUT, IMP, CAP_HWCAP, KERNEL_HWCAP_LUT),
 	HWCAP_CAP(ID_AA64ISAR3_EL1, FAMINMAX, IMP, CAP_HWCAP, KERNEL_HWCAP_FAMINMAX),
+	HWCAP_CAP(ID_AA64ISAR3_EL1, LSFE, IMP, CAP_HWCAP, KERNEL_HWCAP_LSFE),
 	HWCAP_CAP(ID_AA64MMFR2_EL1, AT, IMP, CAP_HWCAP, KERNEL_HWCAP_USCAT),
 #ifdef CONFIG_ARM64_SVE
 	HWCAP_CAP(ID_AA64PFR0_EL1, SVE, IMP, CAP_HWCAP, KERNEL_HWCAP_SVE),
diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
index ba834909a28b..c44e6d94f5de 100644
--- a/arch/arm64/kernel/cpuinfo.c
+++ b/arch/arm64/kernel/cpuinfo.c
@@ -162,6 +162,7 @@ static const char *const hwcap_str[] = {
 	[KERNEL_HWCAP_SME_SMOP4]	= "smesmop4",
 	[KERNEL_HWCAP_MTE_FAR]		= "mtefar",
 	[KERNEL_HWCAP_MTE_STORE_ONLY]	= "mtestoreonly",
+	[KERNEL_HWCAP_LSFE]		= "lsfe",
 };
 
 #ifdef CONFIG_COMPAT

-- 
2.39.5


