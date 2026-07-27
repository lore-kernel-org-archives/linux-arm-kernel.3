Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35AA6C54F4D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 16:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ymi/E8XY6BbpMLHAk3MPgLWPyAPWHjXvrcac/fDqFZk=; b=teSy7zuyQU7IVgUxJgsSHnBzSo
	KRqh6pWB+0ZLJ6D9B92gDc6qnixqXmwiJsgRgiXjhMf72G6CGdpmWSuBrjb44Ja+Jfz9tWlKpRCO1
	0SE7Lt0MGsIWj52HajaLzHLqZwaSa6XWsnxDiQNwl8fpnTyGBvHjZqBXut622JDglof/qFtjaZsJU
	GY0h7sbXeIT92lg7nuYm5X485HUWrDukp4nxrTuYdNQ1NYuH9L6RiBTMHDl29/3bdvIsAW65WKZP5
	c6lF6jv/iia8xrEtotKarGHi4unhV054EhdulCAWt47rFVJJkhOSYVSUASRy4r8iHzFLjvfqRMtYs
	GFaWt4XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOKo-00000003OLJ-3RPV;
	Mon, 27 Jul 2026 16:37:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOJ5-00000003MjV-2T4E
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 16:36:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF9EE1762;
	Mon, 27 Jul 2026 09:35:54 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E73EA3F86F;
	Mon, 27 Jul 2026 09:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785170158; bh=xr9EWfV614nXI+x7XtUSuQ6bvdIPMyp81Gx2jAuFbZs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vRPfVaddwH0ggPZNMoNhlKOXZrORqZwUJe+9bT0lj1yi8X4YcdnkZ+bL7gL8eXuit
	 0AtblX3tgD12eTmR85phjMqbmrlv4oojOjzHIW2HflRA9q3hZ/Z6MLQ4T2vHHo1oCU
	 XhzxgMhXz8NTd27MRuMEcpu3flzwwlKuWt+kq5WE=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: [RFC PATCH v2 31/45] arm64: cpufeature: Detect PE support for FEAT_NMI
Date: Mon, 27 Jul 2026 17:34:39 +0100
Message-Id: <20260727163453.7969-32-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260727163453.7969-1-vladimir.murzin@arm.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_093559_735241_3C36D631 
X-CRM114-Status: GOOD (  20.52  )
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

From: Ada Couprie Diaz <ada.coupriediaz@arm.com>

Use of FEAT_NMI requires that all the PEs in the system and the GIC
have NMI support. This patch implements the PE part of that detection.

In order to avoid problematic interactions between real and pseudo NMIs
we disable the architected feature if the user has enabled pseudo NMIs
on the command line. If this is done on a system where support for the
architected feature is detected then a warning is printed during boot in
order to help users spot what is likely to be a misconfiguration.

As KVM does not care about the host kernel supporting FEAT_NMI or not
to allow guests to use it, split the CPU cap in two : ARM64_HAS_NMI is
the hardware support, ARM64_NMI is the kernel making use of it.

Co-developed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/cpucaps.h    |  2 +
 arch/arm64/include/asm/cpufeature.h | 10 +++++
 arch/arm64/kernel/cpufeature.c      | 68 ++++++++++++++++++++++++++++-
 arch/arm64/tools/cpucaps            |  2 +
 4 files changed, 81 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/cpucaps.h b/arch/arm64/include/asm/cpucaps.h
index 25c61cda901c..176a63f1cc1b 100644
--- a/arch/arm64/include/asm/cpucaps.h
+++ b/arch/arm64/include/asm/cpucaps.h
@@ -75,6 +75,8 @@ cpucap_is_possible(const unsigned int cap)
 		return IS_ENABLED(CONFIG_HW_PERF_EVENTS);
 	case ARM64_HAS_LSUI:
 		return IS_ENABLED(CONFIG_ARM64_LSUI);
+	case ARM64_NMI:
+		return IS_ENABLED(CONFIG_ARM64_NMI);
 	}
 
 	return true;
diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index 95cd8d4acd26..84b817b29155 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -816,6 +816,16 @@ static __always_inline bool system_uses_irq_prio_masking(void)
 	return alternative_has_cap_unlikely(ARM64_HAS_GIC_PRIO_MASKING);
 }
 
+static __always_inline bool system_supports_nmi(void)
+{
+	return alternative_has_cap_unlikely(ARM64_HAS_NMI);
+}
+
+static __always_inline bool system_uses_nmi(void)
+{
+	return alternative_has_cap_unlikely(ARM64_NMI);
+}
+
 static inline bool system_supports_mte(void)
 {
 	return alternative_has_cap_unlikely(ARM64_MTE);
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 9a22df0c5120..d87495d366c8 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -83,13 +83,14 @@
 #include <asm/cpu_ops.h>
 #include <asm/fpsimd.h>
 #include <asm/hwcap.h>
+#include <asm/hypervisor.h>
 #include <asm/insn.h>
+#include <asm/interrupts/common_flags.h>
 #include <asm/kvm_host.h>
 #include <asm/mmu.h>
 #include <asm/mmu_context.h>
 #include <asm/mpam.h>
 #include <asm/mte.h>
-#include <asm/hypervisor.h>
 #include <asm/processor.h>
 #include <asm/smp.h>
 #include <asm/sysreg.h>
@@ -315,6 +316,7 @@ static const struct arm64_ftr_bits ftr_id_aa64pfr1[] = {
 	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_GCS),
 		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR1_EL1_GCS_SHIFT, 4, 0),
 	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR1_EL1_MTE_frac_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR1_EL1_NMI_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_SME),
 		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR1_EL1_SME_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR1_EL1_MPAM_frac_SHIFT, 4, 0),
@@ -2320,6 +2322,51 @@ static bool has_gic_prio_relaxed_sync(const struct arm64_cpu_capabilities *entry
 }
 #endif
 
+#ifdef CONFIG_ARM64_NMI
+static bool can_use_nmi(const struct arm64_cpu_capabilities *entry, int scope)
+{
+	/*
+	 * ARM64_HAS_NMI has a lower index, and is a boot CPU
+	 * feature, so will be detected earlier.
+	 */
+	BUILD_BUG_ON(ARM64_NMI <= ARM64_HAS_NMI);
+	if (!cpus_have_cap(ARM64_HAS_NMI))
+		return false;
+
+	/*
+	 * Having both real and pseudo NMIs enabled simultaneously is
+	 * likely to cause confusion.  Since pseudo NMIs must be
+	 * enabled with an explicit command line option, if the user
+	 * has set that option on a system with real NMIs for some
+	 * reason assume they know what they're doing.
+	 *
+	 * ARM64_HAS_GIC_PRIO_MASKING has a lower index, and is a boot CPU
+	 * feature, so will be detected earlier.
+	 */
+	BUILD_BUG_ON(IS_ENABLED(CONFIG_ARM64_PSEUDO_NMI) &&
+			(ARM64_NMI <= ARM64_HAS_GIC_PRIO_MASKING));
+	if (cpus_have_cap(ARM64_HAS_GIC_PRIO_MASKING)) {
+		pr_info_once("Pseudo NMI enabled, not using architected NMI\n");
+		return false;
+	}
+
+	return true;
+}
+
+static void nmi_enable(const struct arm64_cpu_capabilities *__unused)
+{
+	/*
+	 * Enable use of NMIs controlled by ALLINT, SPINTMASK should
+	 * be clear by default but make it explicit that we are using
+	 * this mode.  Ensure that ALLINT is clear first in order to
+	 * avoid leaving things masked.
+	 */
+	_allint_clear();
+	sysreg_clear_set(sctlr_el1, SCTLR_EL1_SPINTMASK, SCTLR_EL1_NMI);
+	isb();
+}
+#endif
+
 static bool can_trap_icv_dir_el1(const struct arm64_cpu_capabilities *entry,
 				 int scope)
 {
@@ -3198,6 +3245,25 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.matches = has_cpuid_feature,
 		ARM64_CPUID_FIELDS(ID_AA64ISAR3_EL1, LSUI, IMP)
 	},
+#endif
+	{
+		.type = ARM64_CPUCAP_BOOT_CPU_FEATURE,
+		.capability = ARM64_HAS_NMI,
+		.matches = has_cpuid_feature,
+		ARM64_CPUID_FIELDS(ID_AA64PFR1_EL1, NMI, IMP)
+	},
+#ifdef CONFIG_ARM64_NMI
+	/*
+	 * Depends on ARM64_HAS_NMI
+	 * Checks for conflict with pseudo-NMIs, giving them priority.
+	 */
+	{
+		.desc = "Non-maskable Interrupts",
+		.type = ARM64_CPUCAP_BOOT_CPU_FEATURE,
+		.capability = ARM64_NMI,
+		.matches = can_use_nmi,
+		.cpu_enable = nmi_enable,
+	},
 #endif
 	{},
 };
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 9b85a84f6fd4..2117b3ef0b82 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -51,6 +51,7 @@ HAS_LS64_V
 HAS_LSUI
 HAS_MOPS
 HAS_NESTED_VIRT
+HAS_NMI
 HAS_BBML2_NOABORT
 HAS_PAN
 HAS_PMUV3
@@ -80,6 +81,7 @@ MTE
 MTE_ASYMM
 MTE_FAR
 MTE_STORE_ONLY
+NMI
 SME
 SME_FA64
 SME2
-- 
2.34.1


