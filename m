Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 296D9CCFA1E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 07:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aFZgFBoJa+bAOqPY6qsOnelkOHStmKp/+HWUoYZneyc=; b=NhTvVQ1wIzqYa5Zpp4rqOctvhF
	75NDN9CZgQIAoHmPekJAIHUgOE7goyNnMwXjkK41If2XYUOxrfftdR24FNk3J/eC1JFkOtQdDTBam
	ct1f/AGrtihsy4DURzFRpk8qcZLGGuwTZEVBppb+mJk+Iwn5LaQ3OBc90E/GN23s7DjMt5v8jOhTJ
	VFKdgHUAJVgOIVdZrz3cjRUTp9+cqhEI7P7IZI7TParwXSatfi7XRnSPJU5I/7myP94t6ic5i9h8L
	ohA4X9tEviJkw31raTsQPz8Ab5hGrEriylOfIph4Su3JolPNpTOtUIKaqDz7lrGRrYiT7WFzlE9V4
	04kMVFug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHGno-0000000Gmdg-1wpm;
	Fri, 07 Nov 2025 07:22:32 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHGnh-0000000GmY9-35UQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 07:22:28 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4d2r7c6BryznTVj;
	Fri,  7 Nov 2025 15:20:44 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 3941F1800CF;
	Fri,  7 Nov 2025 15:22:19 +0800 (CST)
Received: from kwepemq200004.china.huawei.com (7.202.195.237) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 7 Nov 2025 15:22:19 +0800
Received: from huawei.com (10.90.31.46) by kwepemq200004.china.huawei.com
 (7.202.195.237) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 7 Nov
 2025 15:22:18 +0800
From: Zhou Wang <wangzhou1@hisilicon.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <maz@kernel.org>,
	<oliver.upton@linux.dev>, <joey.gouly@arm.com>, <suzuki.poulose@arm.com>,
	<yuzenghui@huawei.com>, <arnd@arndb.de>
CC: <linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<yangyccccc@gmail.com>, <prime.zeng@hisilicon.com>, <xuwei5@huawei.com>,
	<wangzhou1@hisilicon.com>
Subject: [PATCH v7 5/7] arm64: Add support for FEAT_{LS64, LS64_V}
Date: Fri, 7 Nov 2025 15:21:25 +0800
Message-ID: <20251107072127.448953-6-wangzhou1@hisilicon.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20251107072127.448953-1-wangzhou1@hisilicon.com>
References: <20251107072127.448953-1-wangzhou1@hisilicon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemq200004.china.huawei.com (7.202.195.237)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_232226_103575_8614B62E 
X-CRM114-Status: GOOD (  19.36  )
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
instructions and its variants named under FEAT_{LS64, LS64_V}.
These features are identified by ID_AA64ISAR1_EL1.LS64 and the
use of such instructions in userspace (EL0) can be trapped. In
order to support the use of corresponding instructions in userspace:
- Make ID_AA64ISAR1_EL1.LS64 visbile to userspace
- Add identifying and enabling in the cpufeature list
- Expose these support of these features to userspace through HWCAP3
  and cpuinfo

ld64b/st64b (FEAT_LS64) and st64bv (FEAT_LS64_V) is intended for
special memory (device memory) so requires support by the CPU, system
and target memory location (device that support these instructions).
The HWCAP3_{LS64, LS64_V} implies the support of CPU and system (since
no identification method from system, so SoC vendors should advertise
support in the CPU if system also support them).

Otherwise for ld64b/st64b the atomicity may not be guaranteed or a
DABT will be generated, so users (probably userspace driver developer)
should make sure the target memory (device) also have the support.
For st64bv 0xffffffffffffffff will be returned as status result for
unsupported memory so user should check it.

Document the restrictions along with HWCAP3_{LS64, LS64_V}.

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
Signed-off-by: Zhou Wang <wangzhou1@hisilicon.com>
---
 Documentation/arch/arm64/booting.rst    | 12 ++++++
 Documentation/arch/arm64/elf_hwcaps.rst | 14 +++++++
 arch/arm64/include/asm/hwcap.h          |  2 +
 arch/arm64/include/uapi/asm/hwcap.h     |  2 +
 arch/arm64/kernel/cpufeature.c          | 51 +++++++++++++++++++++++++
 arch/arm64/kernel/cpuinfo.c             |  2 +
 arch/arm64/tools/cpucaps                |  2 +
 7 files changed, 85 insertions(+)

diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
index e4f953839f71..2c56d76ecafb 100644
--- a/Documentation/arch/arm64/booting.rst
+++ b/Documentation/arch/arm64/booting.rst
@@ -556,6 +556,18 @@ Before jumping into the kernel, the following conditions must be met:
 
    - MDCR_EL3.TPM (bit 6) must be initialized to 0b0
 
+  For CPUs with support for 64-byte loads and stores without status (FEAT_LS64):
+
+  - If the kernel is entered at EL1 and EL2 is present:
+
+    - HCRX_EL2.EnALS (bit 1) must be initialised to 0b1.
+
+  For CPUs with support for 64-byte stores with status (FEAT_LS64_V):
+
+  - If the kernel is entered at EL1 and EL2 is present:
+
+    - HCRX_EL2.EnASR (bit 2) must be initialised to 0b1.
+
 The requirements described above for CPU mode, caches, MMUs, architected
 timers, coherency and system registers apply to all CPUs.  All CPUs must
 enter the kernel in the same exception level.  Where the values documented
diff --git a/Documentation/arch/arm64/elf_hwcaps.rst b/Documentation/arch/arm64/elf_hwcaps.rst
index a15df4956849..b86059bc288b 100644
--- a/Documentation/arch/arm64/elf_hwcaps.rst
+++ b/Documentation/arch/arm64/elf_hwcaps.rst
@@ -444,6 +444,20 @@ HWCAP3_MTE_STORE_ONLY
 HWCAP3_LSFE
     Functionality implied by ID_AA64ISAR3_EL1.LSFE == 0b0001
 
+HWCAP3_LS64
+    Functionality implied by ID_AA64ISAR1_EL1.LS64 == 0b0001. Note that
+    the function of instruction ld64b/st64b requires support by CPU, system
+    and target (device) memory location and HWCAP3_LS64 implies the support
+    of CPU. User should only use ld64b/st64b on supported target (device)
+    memory location, otherwise fallback to the non-atomic alternatives.
+
+HWCAP3_LS64_V
+    Functionality implied by ID_AA64ISAR1_EL1.LS64 == 0b0010. Same to
+    HWCAP3_LS64 that HWCAP3_LS64_V implies CPU's support of instruction
+    st64bv but also requires the support from the system and target (device)
+    memory location. st64bv supports return status result and 0xFFFFFFFFFFFFFFFF
+    will be returned for unsupported memory location.
+
 
 4. Unused AT_HWCAP bits
 -----------------------
diff --git a/arch/arm64/include/asm/hwcap.h b/arch/arm64/include/asm/hwcap.h
index 6d567265467c..3c0804fb3435 100644
--- a/arch/arm64/include/asm/hwcap.h
+++ b/arch/arm64/include/asm/hwcap.h
@@ -179,6 +179,8 @@
 #define KERNEL_HWCAP_MTE_FAR		__khwcap3_feature(MTE_FAR)
 #define KERNEL_HWCAP_MTE_STORE_ONLY	__khwcap3_feature(MTE_STORE_ONLY)
 #define KERNEL_HWCAP_LSFE		__khwcap3_feature(LSFE)
+#define KERNEL_HWCAP_LS64		__khwcap3_feature(LS64)
+#define KERNEL_HWCAP_LS64_V		__khwcap3_feature(LS64_V)
 
 /*
  * This yields a mask that user programs can use to figure out what
diff --git a/arch/arm64/include/uapi/asm/hwcap.h b/arch/arm64/include/uapi/asm/hwcap.h
index 575564ecdb0b..79bc77425b82 100644
--- a/arch/arm64/include/uapi/asm/hwcap.h
+++ b/arch/arm64/include/uapi/asm/hwcap.h
@@ -146,5 +146,7 @@
 #define HWCAP3_MTE_FAR		(1UL << 0)
 #define HWCAP3_MTE_STORE_ONLY		(1UL << 1)
 #define HWCAP3_LSFE		(1UL << 2)
+#define HWCAP3_LS64		(1UL << 3)
+#define HWCAP3_LS64_V		(1UL << 4)
 
 #endif /* _UAPI__ASM_HWCAP_H */
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 5ed401ff79e3..dcc5ba620a7e 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -239,6 +239,7 @@ static const struct arm64_ftr_bits ftr_id_aa64isar0[] = {
 };
 
 static const struct arm64_ftr_bits ftr_id_aa64isar1[] = {
+	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_EL1_LS64_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_EL1_XS_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_EL1_I8MM_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_EL1_DGH_SHIFT, 4, 0),
@@ -2259,6 +2260,38 @@ static void cpu_enable_e0pd(struct arm64_cpu_capabilities const *cap)
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
 #ifdef CONFIG_ARM64_PSEUDO_NMI
 static bool can_use_gic_priorities(const struct arm64_cpu_capabilities *entry,
 				   int scope)
@@ -3088,6 +3121,22 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.capability = ARM64_HAS_GICV5_LEGACY,
 		.matches = test_has_gicv5_legacy,
 	},
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
 	{},
 };
 
@@ -3207,6 +3256,8 @@ static const struct arm64_cpu_capabilities arm64_elf_hwcaps[] = {
 	HWCAP_CAP(ID_AA64ISAR1_EL1, BF16, EBF16, CAP_HWCAP, KERNEL_HWCAP_EBF16),
 	HWCAP_CAP(ID_AA64ISAR1_EL1, DGH, IMP, CAP_HWCAP, KERNEL_HWCAP_DGH),
 	HWCAP_CAP(ID_AA64ISAR1_EL1, I8MM, IMP, CAP_HWCAP, KERNEL_HWCAP_I8MM),
+	HWCAP_CAP(ID_AA64ISAR1_EL1, LS64, LS64, CAP_HWCAP, KERNEL_HWCAP_LS64),
+	HWCAP_CAP(ID_AA64ISAR1_EL1, LS64, LS64_V, CAP_HWCAP, KERNEL_HWCAP_LS64_V),
 	HWCAP_CAP(ID_AA64ISAR2_EL1, LUT, IMP, CAP_HWCAP, KERNEL_HWCAP_LUT),
 	HWCAP_CAP(ID_AA64ISAR3_EL1, FAMINMAX, IMP, CAP_HWCAP, KERNEL_HWCAP_FAMINMAX),
 	HWCAP_CAP(ID_AA64ISAR3_EL1, LSFE, IMP, CAP_HWCAP, KERNEL_HWCAP_LSFE),
diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
index c44e6d94f5de..e8ae0a1885e0 100644
--- a/arch/arm64/kernel/cpuinfo.c
+++ b/arch/arm64/kernel/cpuinfo.c
@@ -81,6 +81,8 @@ static const char *const hwcap_str[] = {
 	[KERNEL_HWCAP_PACA]		= "paca",
 	[KERNEL_HWCAP_PACG]		= "pacg",
 	[KERNEL_HWCAP_GCS]		= "gcs",
+	[KERNEL_HWCAP_LS64]		= "ls64",
+	[KERNEL_HWCAP_LS64_V]		= "ls64_v",
 	[KERNEL_HWCAP_DCPODP]		= "dcpodp",
 	[KERNEL_HWCAP_SVE2]		= "sve2",
 	[KERNEL_HWCAP_SVEAES]		= "sveaes",
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 1b32c1232d28..9aae80ac2280 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -45,6 +45,8 @@ HAS_HCX
 HAS_LDAPR
 HAS_LPA2
 HAS_LSE_ATOMICS
+HAS_LS64
+HAS_LS64_V
 HAS_MOPS
 HAS_NESTED_VIRT
 HAS_BBML2_NOABORT
-- 
2.33.0


