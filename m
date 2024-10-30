Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D752D6B6A6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 16:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+w+AAFB7KVRh7XzrkqBYEc+TrlvhJYCVY9Qv5z30GOs=; b=4bIXGTeRvFtbLVEptD35W2khHb
	XsftB3U9I0k0fwPO9S99Jw9mwwsIc9WcWtVXNOXcxhvrtsp9R2ClhTE5Ois/iZ+oN3casUu5IWiUe
	Utmr3SCYX2iXaJPryilGS7kvrP0IYsuX5WvJpzT5Qoj+hlwDNgnOw7feLUaIK8u05cvDg+P7WkgrG
	5Y2MEu8kPPJlIau1YGBsGlGgPz0D+iw023VNe/v7PGImRB962eOOieSTvGrv13nsiJI7LXHi+MLl+
	rBbTKK6feMClUFJozOCrUinXfH6X4/euVy592/v3bOWE5KnDZB6t3sa0cMMd3w75Hv4tPAkUOzErZ
	3pQ+7HmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6BPw-000000013Ap-15k0;
	Wed, 30 Oct 2024 16:19:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6BAU-0000000104r-44qD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 16:03:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 131B919F0;
	Wed, 30 Oct 2024 09:04:02 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2CECE3F528;
	Wed, 30 Oct 2024 09:03:30 -0700 (PDT)
From: Joey Gouly <joey.gouly@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: anshuman.khandual@arm.com,
	gshan@redhat.com,
	james.morse@arm.com,
	joey.gouly@arm.com,
	shameerali.kolothum.thodi@huawei.com,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Jing Zhang <jingzhangos@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v6 3/7] arm64: cpufeature: discover CPU support for MPAM
Date: Wed, 30 Oct 2024 16:03:13 +0000
Message-Id: <20241030160317.2528209-4-joey.gouly@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241030160317.2528209-1-joey.gouly@arm.com>
References: <20241030160317.2528209-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_090335_266324_80FE20C1 
X-CRM114-Status: GOOD (  24.44  )
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

From: James Morse <james.morse@arm.com>

ARMv8.4 adds support for 'Memory Partitioning And Monitoring' (MPAM)
which describes an interface to cache and bandwidth controls wherever
they appear in the system.

Add support to detect MPAM. Like SVE, MPAM has an extra id register that
describes some more properties, including the virtualisation support,
which is optional. Detect this separately so we can detect
mismatched/insane systems, but still use MPAM on the host even if the
virtualisation support is missing.

MPAM needs enabling at the highest implemented exception level, otherwise
the register accesses trap. The 'enabled' flag is accessible to lower
exception levels, but its in a register that traps when MPAM isn't enabled.
The cpufeature 'matches' hook is extended to test this on one of the
CPUs, so that firmware can emulate MPAM as disabled if it is reserved
for use by secure world.

Secondary CPUs that appear late could trip cpufeature's 'lower safe'
behaviour after the MPAM properties have been advertised to user-space.
Add a verify call to ensure late secondaries match the existing CPUs.

(If you have a boot failure that bisects here its likely your CPUs
advertise MPAM in the id registers, but firmware failed to either enable
or MPAM, or emulate the trap as if it were disabled)

Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Tested-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 .../arch/arm64/cpu-feature-registers.rst      |  2 +
 arch/arm64/include/asm/cpu.h                  |  1 +
 arch/arm64/include/asm/cpucaps.h              |  5 +
 arch/arm64/include/asm/cpufeature.h           | 17 ++++
 arch/arm64/kernel/cpufeature.c                | 96 +++++++++++++++++++
 arch/arm64/kernel/cpuinfo.c                   |  3 +
 arch/arm64/tools/cpucaps                      |  2 +
 7 files changed, 126 insertions(+)

diff --git a/Documentation/arch/arm64/cpu-feature-registers.rst b/Documentation/arch/arm64/cpu-feature-registers.rst
index 44f9bd78539d..253e9743de2f 100644
--- a/Documentation/arch/arm64/cpu-feature-registers.rst
+++ b/Documentation/arch/arm64/cpu-feature-registers.rst
@@ -152,6 +152,8 @@ infrastructure:
      +------------------------------+---------+---------+
      | DIT                          | [51-48] |    y    |
      +------------------------------+---------+---------+
+     | MPAM                         | [43-40] |    n    |
+     +------------------------------+---------+---------+
      | SVE                          | [35-32] |    y    |
      +------------------------------+---------+---------+
      | GIC                          | [27-24] |    n    |
diff --git a/arch/arm64/include/asm/cpu.h b/arch/arm64/include/asm/cpu.h
index 9b73fd0cd721..81e4157f92b7 100644
--- a/arch/arm64/include/asm/cpu.h
+++ b/arch/arm64/include/asm/cpu.h
@@ -46,6 +46,7 @@ struct cpuinfo_arm64 {
 	u64		reg_revidr;
 	u64		reg_gmid;
 	u64		reg_smidr;
+	u64		reg_mpamidr;
 
 	u64		reg_id_aa64dfr0;
 	u64		reg_id_aa64dfr1;
diff --git a/arch/arm64/include/asm/cpucaps.h b/arch/arm64/include/asm/cpucaps.h
index a6e5b07b64fd..f20e6e4212a7 100644
--- a/arch/arm64/include/asm/cpucaps.h
+++ b/arch/arm64/include/asm/cpucaps.h
@@ -60,6 +60,11 @@ cpucap_is_possible(const unsigned int cap)
 		return IS_ENABLED(CONFIG_ARM64_WORKAROUND_REPEAT_TLBI);
 	case ARM64_WORKAROUND_SPECULATIVE_SSBS:
 		return IS_ENABLED(CONFIG_ARM64_ERRATUM_3194386);
+	case ARM64_MPAM:
+		/*
+		 * KVM MPAM support doesn't rely on the host kernel supporting MPAM.
+		*/
+		return true;
 	}
 
 	return true;
diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index 3d261cc123c1..352aa6b93964 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -612,6 +612,13 @@ static inline bool id_aa64pfr1_sme(u64 pfr1)
 	return val > 0;
 }
 
+static inline bool id_aa64pfr0_mpam(u64 pfr0)
+{
+	u32 val = cpuid_feature_extract_unsigned_field(pfr0, ID_AA64PFR0_EL1_MPAM_SHIFT);
+
+	return val > 0;
+}
+
 static inline bool id_aa64pfr1_mte(u64 pfr1)
 {
 	u32 val = cpuid_feature_extract_unsigned_field(pfr1, ID_AA64PFR1_EL1_MTE_SHIFT);
@@ -838,6 +845,16 @@ static inline bool system_supports_poe(void)
 		alternative_has_cap_unlikely(ARM64_HAS_S1POE);
 }
 
+static inline bool system_supports_mpam(void)
+{
+	return alternative_has_cap_unlikely(ARM64_MPAM);
+}
+
+static __always_inline bool system_supports_mpam_hcr(void)
+{
+	return alternative_has_cap_unlikely(ARM64_MPAM_HCR);
+}
+
 int do_emulate_mrs(struct pt_regs *regs, u32 sys_reg, u32 rt);
 bool try_emulate_mrs(struct pt_regs *regs, u32 isn);
 
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 718728a85430..33dce6b9c49b 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -684,6 +684,14 @@ static const struct arm64_ftr_bits ftr_id_dfr1[] = {
 	ARM64_FTR_END,
 };
 
+static const struct arm64_ftr_bits ftr_mpamidr[] = {
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, MPAMIDR_EL1_PMG_MAX_SHIFT, MPAMIDR_EL1_PMG_MAX_WIDTH, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, MPAMIDR_EL1_VPMR_MAX_SHIFT, MPAMIDR_EL1_VPMR_MAX_WIDTH, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, MPAMIDR_EL1_HAS_HCR_SHIFT, 1, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, MPAMIDR_EL1_PARTID_MAX_SHIFT, MPAMIDR_EL1_PARTID_MAX_WIDTH, 0),
+	ARM64_FTR_END,
+};
+
 /*
  * Common ftr bits for a 32bit register with all hidden, strict
  * attributes, with 4bit feature fields and a default safe value of
@@ -804,6 +812,9 @@ static const struct __ftr_reg_entry {
 	ARM64_FTR_REG(SYS_ID_AA64MMFR3_EL1, ftr_id_aa64mmfr3),
 	ARM64_FTR_REG(SYS_ID_AA64MMFR4_EL1, ftr_id_aa64mmfr4),
 
+	/* Op1 = 0, CRn = 10, CRm = 4 */
+	ARM64_FTR_REG(SYS_MPAMIDR_EL1, ftr_mpamidr),
+
 	/* Op1 = 1, CRn = 0, CRm = 0 */
 	ARM64_FTR_REG(SYS_GMID_EL1, ftr_gmid),
 
@@ -1163,6 +1174,9 @@ void __init init_cpu_features(struct cpuinfo_arm64 *info)
 		cpacr_restore(cpacr);
 	}
 
+	if (id_aa64pfr0_mpam(info->reg_id_aa64pfr0))
+		init_cpu_ftr_reg(SYS_MPAMIDR_EL1, info->reg_mpamidr);
+
 	if (id_aa64pfr1_mte(info->reg_id_aa64pfr1))
 		init_cpu_ftr_reg(SYS_GMID_EL1, info->reg_gmid);
 }
@@ -1419,6 +1433,11 @@ void update_cpu_features(int cpu,
 		cpacr_restore(cpacr);
 	}
 
+	if (id_aa64pfr0_mpam(info->reg_id_aa64pfr0)) {
+		taint |= check_update_ftr_reg(SYS_MPAMIDR_EL1, cpu,
+					info->reg_mpamidr, boot->reg_mpamidr);
+	}
+
 	/*
 	 * The kernel uses the LDGM/STGM instructions and the number of tags
 	 * they read/write depends on the GMID_EL1.BS field. Check that the
@@ -2377,6 +2396,36 @@ cpucap_panic_on_conflict(const struct arm64_cpu_capabilities *cap)
 	return !!(cap->type & ARM64_CPUCAP_PANIC_ON_CONFLICT);
 }
 
+static bool
+test_has_mpam(const struct arm64_cpu_capabilities *entry, int scope)
+{
+	if (!has_cpuid_feature(entry, scope))
+		return false;
+
+	/* Check firmware actually enabled MPAM on this cpu. */
+	return (read_sysreg_s(SYS_MPAM1_EL1) & MPAM1_EL1_MPAMEN);
+}
+
+static void
+cpu_enable_mpam(const struct arm64_cpu_capabilities *entry)
+{
+	/*
+	 * Access by the kernel (at EL1) should use the reserved PARTID
+	 * which is configured unrestricted. This avoids priority-inversion
+	 * where latency sensitive tasks have to wait for a task that has
+	 * been throttled to release the lock.
+	 */
+	write_sysreg_s(0, SYS_MPAM1_EL1);
+}
+
+static bool
+test_has_mpam_hcr(const struct arm64_cpu_capabilities *entry, int scope)
+{
+	u64 idr = read_sanitised_ftr_reg(SYS_MPAMIDR_EL1);
+
+	return idr & MPAMIDR_EL1_HAS_HCR;
+}
+
 static const struct arm64_cpu_capabilities arm64_features[] = {
 	{
 		.capability = ARM64_ALWAYS_BOOT,
@@ -2873,6 +2922,20 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 #endif
 	},
 #endif
+	{
+		.desc = "Memory Partitioning And Monitoring",
+		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
+		.capability = ARM64_MPAM,
+		.matches = test_has_mpam,
+		.cpu_enable = cpu_enable_mpam,
+		ARM64_CPUID_FIELDS(ID_AA64PFR0_EL1, MPAM, 1)
+	},
+	{
+		.desc = "Memory Partitioning And Monitoring Virtualisation",
+		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
+		.capability = ARM64_MPAM_HCR,
+		.matches = test_has_mpam_hcr,
+	},
 	{
 		.desc = "NV1",
 		.capability = ARM64_HAS_HCR_NV1,
@@ -3396,6 +3459,36 @@ static void verify_hyp_capabilities(void)
 	}
 }
 
+static void verify_mpam_capabilities(void)
+{
+	u64 cpu_idr = read_cpuid(ID_AA64PFR0_EL1);
+	u64 sys_idr = read_sanitised_ftr_reg(SYS_ID_AA64PFR0_EL1);
+	u16 cpu_partid_max, cpu_pmg_max, sys_partid_max, sys_pmg_max;
+
+	if (FIELD_GET(ID_AA64PFR0_EL1_MPAM_MASK, cpu_idr) !=
+	    FIELD_GET(ID_AA64PFR0_EL1_MPAM_MASK, sys_idr)) {
+		pr_crit("CPU%d: MPAM version mismatch\n", smp_processor_id());
+		cpu_die_early();
+	}
+
+	cpu_idr = read_cpuid(MPAMIDR_EL1);
+	sys_idr = read_sanitised_ftr_reg(SYS_MPAMIDR_EL1);
+	if (FIELD_GET(MPAMIDR_EL1_HAS_HCR, cpu_idr) !=
+	    FIELD_GET(MPAMIDR_EL1_HAS_HCR, sys_idr)) {
+		pr_crit("CPU%d: Missing MPAM HCR\n", smp_processor_id());
+		cpu_die_early();
+	}
+
+	cpu_partid_max = FIELD_GET(MPAMIDR_EL1_PARTID_MAX, cpu_idr);
+	cpu_pmg_max = FIELD_GET(MPAMIDR_EL1_PMG_MAX, cpu_idr);
+	sys_partid_max = FIELD_GET(MPAMIDR_EL1_PARTID_MAX, sys_idr);
+	sys_pmg_max = FIELD_GET(MPAMIDR_EL1_PMG_MAX, sys_idr);
+	if (cpu_partid_max < sys_partid_max || cpu_pmg_max < sys_pmg_max) {
+		pr_crit("CPU%d: MPAM PARTID/PMG max values are mismatched\n", smp_processor_id());
+		cpu_die_early();
+	}
+}
+
 /*
  * Run through the enabled system capabilities and enable() it on this CPU.
  * The capabilities were decided based on the available CPUs at the boot time.
@@ -3422,6 +3515,9 @@ static void verify_local_cpu_capabilities(void)
 
 	if (is_hyp_mode_available())
 		verify_hyp_capabilities();
+
+	if (system_supports_mpam())
+		verify_mpam_capabilities();
 }
 
 void check_local_cpu_capabilities(void)
diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
index 44718d0482b3..46ba30d42b9b 100644
--- a/arch/arm64/kernel/cpuinfo.c
+++ b/arch/arm64/kernel/cpuinfo.c
@@ -478,6 +478,9 @@ static void __cpuinfo_store_cpu(struct cpuinfo_arm64 *info)
 	if (id_aa64pfr0_32bit_el0(info->reg_id_aa64pfr0))
 		__cpuinfo_store_cpu_32bit(&info->aarch32);
 
+	if (id_aa64pfr0_mpam(info->reg_id_aa64pfr0))
+		info->reg_mpamidr = read_cpuid(MPAMIDR_EL1);
+
 	cpuinfo_detect_icache_policy(info);
 }
 
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index eedb5acc21ed..dfac646430ac 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -60,6 +60,8 @@ HW_DBM
 KVM_HVHE
 KVM_PROTECTED_MODE
 MISMATCHED_CACHE_TYPE
+MPAM
+MPAM_HCR
 MTE
 MTE_ASYMM
 SME
-- 
2.25.1


