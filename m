Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9AAACD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 18:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RD2ago3uhfLFERZDkG+iyVWVaGQ5Iu9jUcy0tbiCgPM=; b=u7DWYmW3aJ+uXyt9B3Wf7eCN8C
	WHtqmfkqsOgR7JTeg9+dlU9q4ow6QXtLLGI9b+BL8jZ7ig8wXH3GgXUfg5ppxV5rb7qqAA5NpB4XV
	+cmwLrhWLaRZNorMmQsxgSM7q/iLEcAwv1ugdtsgyioC7BtqVejUlEaAS5oJncKa8ZNw6x8ooQtC5
	9FNw77wOTOJCEzu9l5O0IB/gmYwLjpugU+40mMbcpy1sTWJ2SZQAiixx4AfGFZNJHJXNmi15zOxed
	LxKvZCDXzbk5PbLU0FR5eZIc4qLXeBgF++IZLoY8rDj2d/Ux2yu2V9E7Xxb/xJe6F76bliEYxgwEC
	yO/vwSLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYpnl-0000000DEmn-3Joz;
	Sun, 14 Jun 2026 18:43:21 +0000
Received: from mail.cyberchaos.dev ([195.39.247.168])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYpnj-0000000DEmT-1KCp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 18:43:20 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1781462575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RD2ago3uhfLFERZDkG+iyVWVaGQ5Iu9jUcy0tbiCgPM=;
	b=KBXDXFU9z7PIZRMV1j/brkGwP06gIbr8lf6+HizZ2NMJbPkiR07697P/oqfXclMMSjt/19
	Ff+u9I4NyRGkF+llEgUQP1dZqalAESdIvew/2+HxiYyvagA5Ll+G558PLRur73BxvvLICZ
	0SDe3KI8858SzccZdITqLeKboTgbRJ0=
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Yureka Lilian <yureka@cyberchaos.dev>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sven@kernel.org,
	j@jannau.net,
	k@chaosmail.tech,
	towinchenmi@gmail.com
Subject: [PATCH] arm64: errata: Handle Apple WFI State Loss
Date: Sun, 14 Jun 2026 20:42:41 +0200
Message-ID: <20260614-wfi-erratum-v1-1-d9899792d4fd@cyberchaos.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20260614-wfi-erratum-7a9f305f601f
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_114319_528413_D8A5E7C0 
X-CRM114-Status: GOOD (  14.77  )
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

Apple Silicon CPUs can lose register state in WFI, leading to crashes
in the idle loop early in the boot process.
This applies to any previous Apple Silicon CPUs too, but is worked
around by configuring the WFI mode in SYS_IMP_APL_CYC_OVRD sysreg
during m1n1's chickens setup.
This workaround no longer exists since M4.

Add a workaround capability for replacing wfi and wfit with nop, and
an erratum to enable it on the affected CPUs if the workaround using the
sysreg is not already applied. Leave the decision whether the sysreg
workaround can be used up to the earlier parts of the boot chain which
already configure the Apple Silicon chicken bits.

This alternative has to be applied in early boot, since otherwise some
cores might enter the idle loop before apply_alternatives_all() is run.

Reviewed-by: Sasha Finkelstein <k@chaosmail.tech>
Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
Tested on M4 and M4 Pro (which now sometimes nondeterministically
crash later during boot).
Successfully booted on M3 Max with the SYS_IMP_APL_CYC_OVRD
workaround disabled in the bootloader, as well as A18 Pro (which,
like M4 / M4 Pro, doesn't have SYS_IMP_APL_CYC_OVRD).

There is probably a better place for the SYS_IMP_APL_CYC_OVRD
defines, which I currently put in the middle of cpu_errata.c, but I
wouldn't know where.
---
 arch/arm64/Kconfig               | 12 ++++++++++++
 arch/arm64/include/asm/barrier.h | 19 ++++++++++++++++---
 arch/arm64/kernel/cpu_errata.c   | 19 +++++++++++++++++++
 arch/arm64/tools/cpucaps         |  1 +
 4 files changed, 48 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b3afe0688919..8c8ff069856f 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -453,6 +453,18 @@ config AMPERE_ERRATUM_AC04_CPU_23
 
 	  If unsure, say Y.
 
+config APPLE_ERRATUM_WFI_STATE
+	bool "Apple Silicon: WFI loses state"
+	default y
+	help
+	  This option adds an alternative code sequence to work around some
+	  Apple Silicon CPUs losing register state during wfi and wfit
+	  instructions.
+
+	  As a workaround, the wfi and wfit instructions are replaced with nop
+	  operations via the alternative framework if an affected CPU is
+	  detected.
+
 config ARM64_WORKAROUND_CLEAN_CACHE
 	bool
 
diff --git a/arch/arm64/include/asm/barrier.h b/arch/arm64/include/asm/barrier.h
index 9495c4441a46..f72eddc7c434 100644
--- a/arch/arm64/include/asm/barrier.h
+++ b/arch/arm64/include/asm/barrier.h
@@ -20,9 +20,22 @@
 #define wfe()		asm volatile("wfe" : : : "memory")
 #define wfet(val)	asm volatile("msr s0_3_c1_c0_0, %0"	\
 				     : : "r" (val) : "memory")
-#define wfi()		asm volatile("wfi" : : : "memory")
-#define wfit(val)	asm volatile("msr s0_3_c1_c0_1, %0"	\
-				     : : "r" (val) : "memory")
+#define wfi()							\
+	do {							\
+		asm volatile(					\
+		ALTERNATIVE("wfi",				\
+			    "nop",				\
+			    ARM64_WORKAROUND_WFI_STATE)		\
+		: : : "memory");				\
+	} while (0)
+#define wfit(val)						\
+	do {							\
+		asm volatile(					\
+		ALTERNATIVE("msr s0_3_c1_c0_1, %0",		\
+			    "nop",				\
+			    ARM64_WORKAROUND_WFI_STATE)		\
+		: : "r" (val) : "memory");			\
+	} while (0)
 
 #define isb()		asm volatile("isb" : : : "memory")
 #define dmb(opt)	asm volatile("dmb " #opt : : : "memory")
diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index 1995e1198648..04c8c312b27d 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -309,6 +309,17 @@ static void cpu_enable_impdef_pmuv3_traps(const struct arm64_cpu_capabilities *_
 	sysreg_clear_set_s(SYS_HACR_EL2, 0, BIT(56));
 }
 
+#ifdef CONFIG_APPLE_ERRATUM_WFI_STATE
+static bool has_apple_erratum_wfi_state(const struct arm64_cpu_capabilities *entry, int scope)
+{
+#define SYS_IMP_APL_CYC_OVRD   sys_reg(3, 5, 15, 5, 0)
+#define CYC_OVRD_WFI_MODE_MASK GENMASK(26, 24)
+	if (read_cpuid_implementor() != ARM_CPU_IMP_APPLE)
+		return false;
+	return FIELD_GET(CYC_OVRD_WFI_MODE_MASK, read_sysreg_s(SYS_IMP_APL_CYC_OVRD)) != 2;
+}
+#endif
+
 #ifdef CONFIG_ARM64_WORKAROUND_REPEAT_TLBI
 static const struct arm64_cpu_capabilities arm64_repeat_tlbi_list[] = {
 #ifdef CONFIG_QCOM_FALKOR_ERRATUM_1009
@@ -1009,6 +1020,14 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
 		.matches = has_impdef_pmuv3,
 		.cpu_enable = cpu_enable_impdef_pmuv3_traps,
 	},
+#ifdef CONFIG_APPLE_ERRATUM_WFI_STATE
+	{
+		.desc = "Apple WFI loses state",
+		.capability = ARM64_WORKAROUND_WFI_STATE,
+		.type = ARM64_CPUCAP_SCOPE_BOOT_CPU | ARM64_CPUCAP_OPTIONAL_FOR_LATE_CPU,
+		.matches = has_apple_erratum_wfi_state,
+	},
+#endif
 	{
 	}
 };
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 9b85a84f6fd4..bbf8c15d79b0 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -128,3 +128,4 @@ WORKAROUND_REPEAT_TLBI
 WORKAROUND_SPECULATIVE_AT
 WORKAROUND_SPECULATIVE_SSBS
 WORKAROUND_SPECULATIVE_UNPRIV_LOAD
+WORKAROUND_WFI_STATE

---
base-commit: c425609d6ac4012c8bbf01ec2e10e801b1923a7b
change-id: 20260614-wfi-erratum-7a9f305f601f

Best regards,
--  
Yureka Lilian <yureka@cyberchaos.dev>


