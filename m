Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 042BED78325
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 14:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FIK6dyyQkCIT6euikCJYHHiWYwt9CAAse/uxdyRVRIw=; b=c9SD6VBMni2RH6MqV7UVRF6LiL
	Ht25AErGgOf9BdL0IDZOEcxR6IZd+CWcaiWRpEjlEcK+o3JXpza15vIdWRqDzCsEjrTKRJ34pcHo8
	li+x+Gt9g61XJIZLw2UcbenUTEyTe8vDavh62f1761MEF5KIfI7NY9CM629y/5yMYin25ZOBA05We
	Um/HsyA7hk2vw0EvsI28I+HDfepP2noeQdsgpIzkABRnVf9tAuscqqTMXDk9ZcIj3WLwmN4EOv0J+
	XwVmRzuoCbEuDjXp0wejabd2g3gXaF8LSRUEVHRJ4jvHPmCKSDZIwjDWiCiqcNnnZm/KBMh3M8ApM
	twRLY4Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI70Z-00000006KsB-23VS;
	Mon, 02 Dec 2024 14:02:39 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI6uA-00000006JZW-3EIt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 13:56:09 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Y24xC0sgmz1V5My;
	Mon,  2 Dec 2024 21:53:03 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 2C308180105;
	Mon,  2 Dec 2024 21:55:57 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Mon, 2 Dec 2024 21:55:56 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <maz@kernel.org>,
	<oliver.upton@linux.dev>, <corbet@lwn.net>,
	<linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<linux-kselftest@vger.kernel.org>, <linux-doc@vger.kernel.org>
CC: <joey.gouly@arm.com>, <suzuki.poulose@arm.com>, <yuzenghui@huawei.com>,
	<shuah@kernel.org>, <jonathan.cameron@huawei.com>,
	<shameerali.kolothum.thodi@huawei.com>, <linuxarm@huawei.com>,
	<prime.zeng@hisilicon.com>, <xuwei5@huawei.com>, <yangyicong@hisilicon.com>
Subject: [PATCH 2/5] arm64: Add support for FEAT_{LS64, LS64_V, LS64_ACCDATA}
Date: Mon, 2 Dec 2024 21:55:01 +0800
Message-ID: <20241202135504.14252-3-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20241202135504.14252-1-yangyicong@huawei.com>
References: <20241202135504.14252-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_055603_219900_56E3F50F 
X-CRM114-Status: GOOD (  16.47  )
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

From: Yicong Yang <yangyicong@hisilicon.com>

Armv8.7 introduces single-copy atomic 64-byte loads and stores
instructions and its variants named under FEAT_{LS64, LS64_V,
LS64_ACCDATA}. These features are identified by ID_AA64ISAR1_EL1.LS64
and the use of such instructions in userspace (EL0) can be trapped.
In order to support the use of corresponding instructions in userspace:
- Make ID_AA64ISAR1_EL1.LS64 visbile to userspace
- Add identifying and enabling in the cpufeature list
- Expose these support of these features to userspace through HWCAP
  and cpuinfo

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 Documentation/arch/arm64/booting.rst    | 28 ++++++++++
 Documentation/arch/arm64/elf_hwcaps.rst |  9 ++++
 arch/arm64/include/asm/hwcap.h          |  3 ++
 arch/arm64/include/uapi/asm/hwcap.h     |  3 ++
 arch/arm64/kernel/cpufeature.c          | 70 ++++++++++++++++++++++++-
 arch/arm64/kernel/cpuinfo.c             |  3 ++
 arch/arm64/tools/cpucaps                |  3 ++
 7 files changed, 118 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
index 3278fb4bf219..c35cfe9da501 100644
--- a/Documentation/arch/arm64/booting.rst
+++ b/Documentation/arch/arm64/booting.rst
@@ -449,6 +449,34 @@ Before jumping into the kernel, the following conditions must be met:
 
     - HFGWTR_EL2.nGCS_EL0 (bit 52) must be initialised to 0b1.
 
+  For CPUs support for 64-byte loads and stores without status (FEAT_LS64):
+
+  - If the kernel is entered at EL1 and EL2 is present:
+
+    - HCRX_EL2.EnALS (bit 1) must be initialised to 0b1.
+
+  For CPUs support for 64-byte loads and stores with status (FEAT_LS64_V):
+
+  - If the kernel is entered at EL1 and EL2 is present:
+
+    - HCRX_EL2.EnASR (bit 2) must be initialised to 0b1.
+
+  For CPUs support for 64-byte EL0 stores with status (FEAT_LS64_ACCDATA):
+
+  - If EL3 is present:
+
+    - SCR_EL3.EnAS0 (bit 36) must be initialised to 0b1.
+
+    - SCR_EL3.ADEn (bit 37) must be initialised to 0b1.
+
+  - If the kernel is entered at EL1 and EL2 is present:
+
+    - HCRX_EL2.EnAS0 (bit 0) must be initialised to 0b1.
+
+    - HFGRTR_EL2.nACCDATA_EL1 (bit 50) must be initialised to 0b1.
+
+    - HFGWTR_EL2.nACCDATA_EL1 (bit 50) must be initialised to 0b1.
+
 The requirements described above for CPU mode, caches, MMUs, architected
 timers, coherency and system registers apply to all CPUs.  All CPUs must
 enter the kernel in the same exception level.  Where the values documented
diff --git a/Documentation/arch/arm64/elf_hwcaps.rst b/Documentation/arch/arm64/elf_hwcaps.rst
index 2ff922a406ad..6cb2594f0803 100644
--- a/Documentation/arch/arm64/elf_hwcaps.rst
+++ b/Documentation/arch/arm64/elf_hwcaps.rst
@@ -372,6 +372,15 @@ HWCAP2_SME_SF8DP4
 HWCAP2_POE
     Functionality implied by ID_AA64MMFR3_EL1.S1POE == 0b0001.
 
+HWCAP3_LS64
+    Functionality implied by ID_AA64ISAR1_EL1.LS64 == 0b0001.
+
+HWCAP3_LS64_V
+    Functionality implied by ID_AA64ISAR1_EL1.LS64 == 0b0010.
+
+HWCAP3_LS64_ACCDATA
+    Functionality implied by ID_AA64ISAR1_EL1.LS64 == 0b0011.
+
 4. Unused AT_HWCAP bits
 -----------------------
 
diff --git a/arch/arm64/include/asm/hwcap.h b/arch/arm64/include/asm/hwcap.h
index 2b6c61c608e2..ac1d576dfcd4 100644
--- a/arch/arm64/include/asm/hwcap.h
+++ b/arch/arm64/include/asm/hwcap.h
@@ -161,6 +161,9 @@
 #define KERNEL_HWCAP_POE		__khwcap2_feature(POE)
 
 #define __khwcap3_feature(x)		(const_ilog2(HWCAP3_ ## x) + 128)
+#define KERNEL_HWCAP_LS64              __khwcap3_feature(LS64)
+#define KERNEL_HWCAP_LS64_V            __khwcap3_feature(LS64_V)
+#define KERNEL_HWCAP_LS64_ACCDATA      __khwcap3_feature(LS64_ACCDATA)
 
 /*
  * This yields a mask that user programs can use to figure out what
diff --git a/arch/arm64/include/uapi/asm/hwcap.h b/arch/arm64/include/uapi/asm/hwcap.h
index 48d46b768eae..e70f91889fd6 100644
--- a/arch/arm64/include/uapi/asm/hwcap.h
+++ b/arch/arm64/include/uapi/asm/hwcap.h
@@ -128,5 +128,8 @@
 /*
  * HWCAP3 flags - for AT_HWCAP3
  */
+#define HWCAP3_LS64		(1UL << 0)
+#define HWCAP3_LS64_V		(1UL << 1)
+#define HWCAP3_LS64_ACCDATA	(1UL << 2)
 
 #endif /* _UAPI__ASM_HWCAP_H */
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 15f175e458c3..9e45c1b54372 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -229,7 +229,7 @@ static const struct arm64_ftr_bits ftr_id_aa64isar0[] = {
 };
 
 static const struct arm64_ftr_bits ftr_id_aa64isar1[] = {
-	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_EL1_LS64_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_EL1_LS64_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_EL1_XS_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_EL1_I8MM_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_EL1_DGH_SHIFT, 4, 0),
@@ -2246,6 +2246,47 @@ static void cpu_enable_e0pd(struct arm64_cpu_capabilities const *cap)
 }
 #endif /* CONFIG_ARM64_E0PD */
 
+static bool has_ls64(const struct arm64_cpu_capabilities *entry, int __unused)
+{
+	u64 ls64;
+
+	ls64 = cpuid_feature_extract_field(__read_sysreg_by_encoding(entry->sys_reg),
+					   entry->field_pos, entry->sign);
+
+	if (ls64 == ID_AA64ISAR1_EL1_LS64_NI ||
+	    ls64 > ID_AA64ISAR1_EL1_LS64_LS64_ACCDATA)
+		return false;
+
+	if (entry->capability == ARM64_HAS_LS64 &&
+	    ls64 >= ID_AA64ISAR1_EL1_LS64_LS64)
+		return true;
+
+	if (entry->capability == ARM64_HAS_LS64_V &&
+	    ls64 >= ID_AA64ISAR1_EL1_LS64_LS64_V)
+		return true;
+
+	if (entry->capability == ARM64_HAS_LS64_ACCDATA &&
+	    ls64 >= ID_AA64ISAR1_EL1_LS64_LS64_ACCDATA)
+		return true;
+
+	return false;
+}
+
+static void cpu_enable_ls64(struct arm64_cpu_capabilities const *cap)
+{
+	sysreg_clear_set(sctlr_el1, SCTLR_EL1_EnALS, SCTLR_EL1_EnALS);
+}
+
+static void cpu_enable_ls64_v(struct arm64_cpu_capabilities const *cap)
+{
+	sysreg_clear_set(sctlr_el1, SCTLR_EL1_EnASR, SCTLR_EL1_EnASR);
+}
+
+static void cpu_enable_ls64_accdata(struct arm64_cpu_capabilities const *cap)
+{
+	sysreg_clear_set(sctlr_el1, SCTLR_EL1_EnAS0, SCTLR_EL1_EnAS0);
+}
+
 #ifdef CONFIG_ARM64_PSEUDO_NMI
 static bool can_use_gic_priorities(const struct arm64_cpu_capabilities *entry,
 				   int scope)
@@ -2991,6 +3032,30 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		ARM64_CPUID_FIELDS(ID_AA64PFR1_EL1, GCS, IMP)
 	},
 #endif
+	{
+		.desc = "LS64",
+		.capability = ARM64_HAS_LS64,
+		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
+		.matches = has_ls64,
+		.cpu_enable = cpu_enable_ls64,
+		ARM64_CPUID_FIELDS(ID_AA64ISAR1_EL1, LS64, LS64)
+	},
+	{
+		.desc = "LS64_V",
+		.capability = ARM64_HAS_LS64_V,
+		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
+		.matches = has_ls64,
+		.cpu_enable = cpu_enable_ls64_v,
+		ARM64_CPUID_FIELDS(ID_AA64ISAR1_EL1, LS64, LS64_V)
+	},
+	{
+		.desc = "LS64_ACCDATA",
+		.capability = ARM64_HAS_LS64_ACCDATA,
+		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
+		.matches = has_ls64,
+		.cpu_enable = cpu_enable_ls64_accdata,
+		ARM64_CPUID_FIELDS(ID_AA64ISAR1_EL1, LS64, LS64_ACCDATA)
+	},
 	{},
 };
 
@@ -3088,6 +3153,9 @@ static const struct arm64_cpu_capabilities arm64_elf_hwcaps[] = {
 	HWCAP_CAP(ID_AA64ISAR1_EL1, BF16, EBF16, CAP_HWCAP, KERNEL_HWCAP_EBF16),
 	HWCAP_CAP(ID_AA64ISAR1_EL1, DGH, IMP, CAP_HWCAP, KERNEL_HWCAP_DGH),
 	HWCAP_CAP(ID_AA64ISAR1_EL1, I8MM, IMP, CAP_HWCAP, KERNEL_HWCAP_I8MM),
+	HWCAP_CAP(ID_AA64ISAR1_EL1, LS64, LS64, CAP_HWCAP, KERNEL_HWCAP_LS64),
+	HWCAP_CAP(ID_AA64ISAR1_EL1, LS64, LS64_V, CAP_HWCAP, KERNEL_HWCAP_LS64_V),
+	HWCAP_CAP(ID_AA64ISAR1_EL1, LS64, LS64_ACCDATA, CAP_HWCAP, KERNEL_HWCAP_LS64_ACCDATA),
 	HWCAP_CAP(ID_AA64ISAR2_EL1, LUT, IMP, CAP_HWCAP, KERNEL_HWCAP_LUT),
 	HWCAP_CAP(ID_AA64ISAR3_EL1, FAMINMAX, IMP, CAP_HWCAP, KERNEL_HWCAP_FAMINMAX),
 	HWCAP_CAP(ID_AA64MMFR2_EL1, AT, IMP, CAP_HWCAP, KERNEL_HWCAP_USCAT),
diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
index d79e88fccdfc..b140852955be 100644
--- a/arch/arm64/kernel/cpuinfo.c
+++ b/arch/arm64/kernel/cpuinfo.c
@@ -81,6 +81,9 @@ static const char *const hwcap_str[] = {
 	[KERNEL_HWCAP_PACA]		= "paca",
 	[KERNEL_HWCAP_PACG]		= "pacg",
 	[KERNEL_HWCAP_GCS]		= "gcs",
+	[KERNEL_HWCAP_LS64]		= "ls64",
+	[KERNEL_HWCAP_LS64_V]		= "ls64_v",
+	[KERNEL_HWCAP_LS64_ACCDATA]	= "ls64_accdata",
 	[KERNEL_HWCAP_DCPODP]		= "dcpodp",
 	[KERNEL_HWCAP_SVE2]		= "sve2",
 	[KERNEL_HWCAP_SVEAES]		= "sveaes",
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index eb17f59e543c..0454d5e64cbe 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -42,6 +42,9 @@ HAS_HCX
 HAS_LDAPR
 HAS_LPA2
 HAS_LSE_ATOMICS
+HAS_LS64
+HAS_LS64_V
+HAS_LS64_ACCDATA
 HAS_MOPS
 HAS_NESTED_VIRT
 HAS_PAN
-- 
2.24.0


