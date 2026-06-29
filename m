Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF4A8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 10:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fBp6OuObxFe8cl4ertkrt04rChKyI1WH8wlJM8pAU0g=; b=JHvJi4jZIQMGZoeZAdKuyV0GWB
	RW2JWbr6TQMjM48r9bOKrkM2Hb9xdm2aJbYyzUN5sjuP28spmpHhtg8EIQzpJHffwDhk/2t7ZnrOV
	o4vRTWJFseMaJo0Y8kAiHioCb+bI/CwsPC9VBQEHcaOsAjgVStcj4U7lUmAdYRIYNhN7bVMUFgpbP
	ZYk89uIhXlS9UlUP53NPYAD75JbqGZhMx5YDQ3qMZrMIgofKiHbq9Iw0GBUnm7m0gys++PxhgwBl+
	qpeA9zr024RcYnsPuHim5fq8TokJ8F+tqLstym+ro4HCfNj/EswhIQxJAIKkZuolUq4U1rM2Jt95M
	CfKc8Pcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8wI-0000000EJEy-1322;
	Mon, 29 Jun 2026 10:10:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8wD-0000000EJBY-2Kfg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 10:10:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 680FB1595;
	Mon, 29 Jun 2026 03:09:54 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 401243F836;
	Mon, 29 Jun 2026 03:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782727798; bh=ZkYhVWkscmHsVAy3vYI6Sgo9cnrqBXRLBahlIBcYoyE=;
	h=From:To:Cc:Subject:Date:From;
	b=bMzXtt6AIbvs6Rx0ndHjC8yo8HhVkHZHuEBJ8c+dM5ag0KD2F6BbKbzkZKEgFUaG8
	 P/nTYDZKHF5JfTdCMxPu+1/TMy1lirbTbswGjYOCdmJ1+Uu4ycyj7Ua74mjbeY57qN
	 Jc3R+fpV1dFrysJq5KaeCPz5xRa4RTA+6ro6auTA=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	mark.rutland@arm.com,
	will@kernel.org
Subject: [PATCH] arm64: Clarify ARM64_WORKAROUND_REPEAT_TLBI semantics
Date: Mon, 29 Jun 2026 11:09:53 +0100
Message-Id: <20260629100953.385435-1-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_031001_768472_CD62A3BC 
X-CRM114-Status: GOOD (  21.68  )
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

Will notes that the ARM64_WORKAROUND_REPEAT_TLBI name is potentially
misleading, and that it would be nice to rename that and add some
documentation. See:

  https://lore.kernel.org/linux-arm-kernel/ajKn_Pt50CmOUrsP@willie-the-truck/

To that end, I've renamed the Kconfig symbol and hwcap from:

  [CONFIG_]ARM64_WORKAROUND_REPEAT_TLBI

... to:

  [CONFIG_]ARM64_WORKAROUND_REPEAT_TLBI_SYNC

... and I've added some rationale alongside the Kconfig. As the Kconfig
symbol isn't user selectable, the usual 'help' section won't appear in
menuconfig, so I've added this as a comment.

The rename was scripted with:

  git grep -l REPEAT_TLBI | while read F; do
    sed -i '{ s/WORKAROUND_REPEAT_TLBI\>/WORKAROUND_REPEAT_TLBI_SYNC/g }' $F;
  done

Bikeshedding-wise, I considered a few names, including:

* ARM64_WORKAROUND_REPEAT_TLBI_SYNC
* ARM64_WORKAROUND_TLBI_REPEAT_SYNC
* ARM64_WORKAROUND_BROADCAST_TLBI_REPEAT_SYNC

... and I settled on ARM64_WORKAROUND_REPEAT_TLBI_SYNC to try keep
things simple, and to avoid unnecessary churn caused by moving
definitions to retain alphabetical order. I'm happy to defer to Will and
Catalin's preference.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/Kconfig                | 34 +++++++++++++++++++++++++------
 arch/arm64/include/asm/cpucaps.h  |  4 ++--
 arch/arm64/include/asm/tlbflush.h |  2 +-
 arch/arm64/kernel/cpu_errata.c    |  6 +++---
 arch/arm64/tools/cpucaps          |  2 +-
 5 files changed, 35 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b3afe0688919b..7571104215435 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -701,12 +701,34 @@ config ARM64_ERRATUM_1530923
 
 	  If unsure, say Y.
 
-config ARM64_WORKAROUND_REPEAT_TLBI
+config ARM64_WORKAROUND_REPEAT_TLBI_SYNC
 	bool
+	# This workaround is (only) suitable for TLB invalidation errata where
+	# all of the following conditions are true:
+	#
+	# - The effects of the errata are only a loss of ordering/completion
+	#   for explicit memory accesses when the TLBI is completed with a DSB.
+	#   The removal of TLB entries is not affected.
+	#
+	#   Note that architecturally, S2-only invalidation does not remove
+	#   combined S1+S2 entries, and does not complete accesses translated
+	#   via those S1+S2 entries. Consequently, where this condition holds,
+	#   the errata do not affect S2-only invalidation.
+	#
+	# - The errata only affect broadcast TLB invalidation operations (e.g.
+	#   TLBI VMALLE1IS), and do not affect local TLB invalidation
+	#   operations (e.g. TLBI VMALLE1).
+	#
+	# - After any number of affected TLBI operations are completed with a
+	#   DSB, the errata can be mitigated by executing a single arbitrary
+	#   broadcast TLBI (which targets an arbitrary translation regime),
+	#   followed by a DSB.
+	#
+	# For more rationale, see commit a8f78680ee6bf795.
 
 config ARM64_ERRATUM_2441007
 	bool "Cortex-A55: Completion of affected memory accesses might not be guaranteed by completion of a TLBI (rare)"
-	select ARM64_WORKAROUND_REPEAT_TLBI
+	select ARM64_WORKAROUND_REPEAT_TLBI_SYNC
 	help
 	  This option adds a workaround for ARM Cortex-A55 erratum #2441007.
 
@@ -722,7 +744,7 @@ config ARM64_ERRATUM_2441007
 
 config ARM64_ERRATUM_1286807
 	bool "Cortex-A76: Modification of the translation table for a virtual address might lead to read-after-read ordering violation (rare)"
-	select ARM64_WORKAROUND_REPEAT_TLBI
+	select ARM64_WORKAROUND_REPEAT_TLBI_SYNC
 	help
 	  This option adds a workaround for ARM Cortex-A76 erratum 1286807.
 
@@ -944,7 +966,7 @@ config ARM64_ERRATUM_2224489
 
 config ARM64_ERRATUM_2441009
 	bool "Cortex-A510: Completion of affected memory accesses might not be guaranteed by completion of a TLBI (rare)"
-	select ARM64_WORKAROUND_REPEAT_TLBI
+	select ARM64_WORKAROUND_REPEAT_TLBI_SYNC
 	help
 	  This option adds a workaround for ARM Cortex-A510 erratum #2441009.
 
@@ -1156,7 +1178,7 @@ config ARM64_ERRATUM_4193714
 config ARM64_ERRATUM_4118414
 	bool "Various: Completion of affected memory accesses might not be guaranteed by completion of a TLBI"
 	default y
-	select ARM64_WORKAROUND_REPEAT_TLBI
+	select ARM64_WORKAROUND_REPEAT_TLBI_SYNC
 	help
 	  This option adds a workaround for the following errata:
 
@@ -1340,7 +1362,7 @@ config QCOM_FALKOR_ERRATUM_1003
 config QCOM_FALKOR_ERRATUM_1009
 	bool "Falkor E1009: Prematurely complete a DSB after a TLBI"
 	default y
-	select ARM64_WORKAROUND_REPEAT_TLBI
+	select ARM64_WORKAROUND_REPEAT_TLBI_SYNC
 	help
 	  On Falkor v1, the CPU may prematurely complete a DSB following a
 	  TLBI xxIS invalidate maintenance operation. Repeat the TLBI operation
diff --git a/arch/arm64/include/asm/cpucaps.h b/arch/arm64/include/asm/cpucaps.h
index 25c61cda901c5..76350b38f0d7a 100644
--- a/arch/arm64/include/asm/cpucaps.h
+++ b/arch/arm64/include/asm/cpucaps.h
@@ -60,8 +60,8 @@ cpucap_is_possible(const unsigned int cap)
 		return IS_ENABLED(CONFIG_CAVIUM_ERRATUM_23154);
 	case ARM64_WORKAROUND_DISABLE_CNP:
 		return IS_ENABLED(CONFIG_ARM64_WORKAROUND_DISABLE_CNP);
-	case ARM64_WORKAROUND_REPEAT_TLBI:
-		return IS_ENABLED(CONFIG_ARM64_WORKAROUND_REPEAT_TLBI);
+	case ARM64_WORKAROUND_REPEAT_TLBI_SYNC:
+		return IS_ENABLED(CONFIG_ARM64_WORKAROUND_REPEAT_TLBI_SYNC);
 	case ARM64_WORKAROUND_SPECULATIVE_SSBS:
 		return IS_ENABLED(CONFIG_ARM64_ERRATUM_3194386);
 	case ARM64_WORKAROUND_4193714:
diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index d52ac8c17190d..bd68ca6df62ba 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -268,7 +268,7 @@ static inline void __tlbi_level(tlbi_op op, u64 addr, u32 level)
 
 #define __repeat_tlbi_sync(op, arg...)						\
 do {										\
-	if (!alternative_has_cap_unlikely(ARM64_WORKAROUND_REPEAT_TLBI))	\
+	if (!alternative_has_cap_unlikely(ARM64_WORKAROUND_REPEAT_TLBI_SYNC))	\
 		break;								\
 	__tlbi(op, ##arg);							\
 	dsb(ish);								\
diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index 1995e1198648e..685077d44ad17 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -309,7 +309,7 @@ static void cpu_enable_impdef_pmuv3_traps(const struct arm64_cpu_capabilities *_
 	sysreg_clear_set_s(SYS_HACR_EL2, 0, BIT(56));
 }
 
-#ifdef CONFIG_ARM64_WORKAROUND_REPEAT_TLBI
+#ifdef CONFIG_ARM64_WORKAROUND_REPEAT_TLBI_SYNC
 static const struct arm64_cpu_capabilities arm64_repeat_tlbi_list[] = {
 #ifdef CONFIG_QCOM_FALKOR_ERRATUM_1009
 	{
@@ -733,10 +733,10 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
 		.match_list = qcom_erratum_1003_list,
 	},
 #endif
-#ifdef CONFIG_ARM64_WORKAROUND_REPEAT_TLBI
+#ifdef CONFIG_ARM64_WORKAROUND_REPEAT_TLBI_SYNC
 	{
 		.desc = "Broken broadcast TLBI completion",
-		.capability = ARM64_WORKAROUND_REPEAT_TLBI,
+		.capability = ARM64_WORKAROUND_REPEAT_TLBI_SYNC,
 		.type = ARM64_CPUCAP_LOCAL_CPU_ERRATUM,
 		.matches = cpucap_multi_entry_cap_matches,
 		.match_list = arm64_repeat_tlbi_list,
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 9b85a84f6fd49..f8368e5d81a8e 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -124,7 +124,7 @@ WORKAROUND_DISABLE_CNP
 WORKAROUND_PMUV3_IMPDEF_TRAPS
 WORKAROUND_QCOM_FALKOR_E1003
 WORKAROUND_QCOM_ORYON_CNTVOFF
-WORKAROUND_REPEAT_TLBI
+WORKAROUND_REPEAT_TLBI_SYNC
 WORKAROUND_SPECULATIVE_AT
 WORKAROUND_SPECULATIVE_SSBS
 WORKAROUND_SPECULATIVE_UNPRIV_LOAD
-- 
2.30.2


