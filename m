Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C730C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 15:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dv6Oir83VkqXJYmuYui1QMciEK9D/3WCwgKT0ox5/Hk=; b=wtpU5p3y04D9eAFNkGEUzPumgl
	8ZxcixyNyD3vxkdQZrLG48m7KX2Ls7DLMUD75TaNIkYKOL5OrsUVNrfqB/AdaYsZEjkmR9cbccWmW
	u5wA4oh+QaOT118WKuDiN8kxKFh0wzICRDNj2cVcxc7ih1FT7DQK0ylYR5aVRYXwj/NDA7Amd6sEl
	qRwciWx2IB8vdqi0VQE1jNulnFZLkDWGeAas/LvtpQYqqeaT/k3Ryk3N79L+vtTVWT5L3L3lFLlp1
	6f4PDRNATDvLq8bYF8JGKyWEPJ8rZoL4AMIJzk7BmkW0NvtxP++ENZd457clBhgfeDl/oPGX72jPZ
	yn2F8c0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZzv-00000003xoq-029c;
	Tue, 29 Sep 2026 15:44:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZzh-00000003xlv-3Ze6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 15:43:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 054B3152B;
	Tue, 29 Sep 2026 08:43:45 -0700 (PDT)
Received: from e143943.arm.com (unknown [10.57.78.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 38FFE3F85F;
	Tue, 29 Sep 2026 08:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790696628; bh=30kWXte11aw+T+S+ROMC4dJdbpx7xEHcx/BYte9SRdA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TA7eyCtr/ojCwnuHq9kHiNp/OqUTeHKudhKjn4RoE6x16XU1h9IVqUP7McgzHfA6f
	 pofp30GQDmAubeN+jKXy0Vzgex/VZBBoBjrhf+mtwitz3mxa3ff8w1qvXy33gEGlUS
	 IFXGlAQ6hEDFqMFgGqN7Y8PWCAWzcRMuZQA1lHjg=
From: Beata Michalska <beata.michalska@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Vladimir.Murzin@arm.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	suzuki.poulose@arm.com,
	James.Morse@arm.com,
	xuewen.yan94@gmail.com,
	seanwang1@lenovo.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] arm64: errata: Factor out broken AMU const counter cap
Date: Tue, 29 Sep 2026 17:42:13 +0200
Message-ID: <20260929154325.3416271-2-beata.michalska@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929154325.3416271-1-beata.michalska@arm.com>
References: <20260929154325.3416271-1-beata.michalska@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_084349_978826_2492C459 
X-CRM114-Status: GOOD (  18.60  )
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

Move the workaround from the erratum 2457168-specific cpucap to a generic
broken AMU constant-counter one. This keeps the existing Cortex-A510
handling unchanged while allowing other errata with similar AMU constant
counter issue to share the capability bit and call sites.

Cc: <stable@vger.kernel.org>
Signed-off-by: Beata Michalska <beata.michalska@arm.com>
---
 arch/arm64/Kconfig             |  8 ++++++++
 arch/arm64/kernel/cpu_errata.c | 23 +++++++++++++++++------
 arch/arm64/kernel/cpufeature.c |  2 +-
 arch/arm64/kernel/topology.c   |  7 ++++---
 arch/arm64/tools/cpucaps       |  2 +-
 5 files changed, 31 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b5a51b0ef9440..3b6c052d46a18 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1040,9 +1040,17 @@ config ARM64_ERRATUM_1902691
 
 	  If unsure, say Y.
 
+config ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT
+	bool
+	# Targeting errata affecting AMEVCNTR01, the AMU constant counter.
+	# On affected CPUs the counter may not increment at the expected rate,
+	# making it unreliable. As a result, AMU users should treat it as
+	# unavailable rather than relying on misleading counter values.
+
 config ARM64_ERRATUM_2457168
 	bool "Cortex-A510: 2457168: workaround for AMEVCNTR01 incrementing incorrectly"
 	depends on ARM64_AMU_EXTN
+	select ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT
 	default y
 	help
 	  This option adds the workaround for ARM Cortex-A510 erratum 2457168.
diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index 5db8f0619e4bc..f18683e56184b 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -381,6 +381,18 @@ static const struct arm64_cpu_capabilities arm64_repeat_tlbi_list[] = {
 };
 #endif
 
+#ifdef CONFIG_ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT
+static const struct arm64_cpu_capabilities arm64_repeat_amu_constcnt_list[] = {
+#ifdef CONFIG_ARM64_ERRATUM_2457168
+	{
+		/* Cortex-A510 r0p0-r1p1 */
+		CAP_MIDR_RANGE(MIDR_CORTEX_A510, 0, 0, 1, 1)
+	},
+#endif
+	{}
+};
+#endif /* CONFIG_ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT */
+
 #ifdef CONFIG_CAVIUM_ERRATUM_23154
 static const struct midr_range cavium_erratum_23154_cpus[] = {
 	MIDR_ALL_VERSIONS(MIDR_THUNDERX),
@@ -916,14 +928,13 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
 		ERRATA_MIDR_REV_RANGE(MIDR_CORTEX_A510, 0, 0, 2)
 	},
 #endif
-#ifdef CONFIG_ARM64_ERRATUM_2457168
+#ifdef CONFIG_ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT
 	{
-		.desc = "ARM erratum 2457168",
-		.capability = ARM64_WORKAROUND_2457168,
+		.desc = "Broken AMU AMEVCNTR01 (const counter)",
+		.capability = ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT,
 		.type = ARM64_CPUCAP_WEAK_LOCAL_CPU_FEATURE,
-
-		/* Cortex-A510 r0p0-r1p1 */
-		CAP_MIDR_RANGE(MIDR_CORTEX_A510, 0, 0, 1, 1)
+		.matches = cpucap_multi_entry_cap_matches,
+		.match_list = arm64_repeat_amu_constcnt_list
 	},
 #endif
 #ifdef CONFIG_ARM64_ERRATUM_2038923
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 17b83a2518a8f..1569f84214763 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2064,7 +2064,7 @@ static void cpu_amu_enable(struct arm64_cpu_capabilities const *cap)
 		cpumask_set_cpu(smp_processor_id(), &amu_cpus);
 
 		/* 0 reference values signal broken/disabled counters */
-		if (!this_cpu_has_cap(ARM64_WORKAROUND_2457168))
+		if (!this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT))
 			update_freq_counters_refs();
 	}
 }
diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index d28438f8b83f1..64588554e7f76 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -402,7 +402,7 @@ static void cpu_read_constcnt(void *val)
 	 * the counter is disabled. A return value of 0 at counter read is
 	 * properly handled as an error case by the users of the counter.
 	 */
-	*(u64 *)val = this_cpu_has_cap(ARM64_WORKAROUND_2457168) ?
+	*(u64 *)val = this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT) ?
 		      0UL : read_constcnt();
 }
 
@@ -463,8 +463,9 @@ static void amu_read_core_const_ctrs(void *val)
 
 	/*
 	 * cpu_read_constcnt() incurs slight latency due to the
-	 * ARM64_WORKAROUND_2457168 check. Read it first to minimize
-	 * the sampling skew between the const and core counters.
+	 * ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT check.
+	 * Read it first to minimize the sampling skew between the const
+	 * and core counters.
 	 */
 	cpu_read_constcnt(&ctrs->constcnt);
 	cpu_read_corecnt(&ctrs->corecnt);
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 2775ba3359cfe..58b6c084f9f25 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -105,7 +105,6 @@ WORKAROUND_1902691
 WORKAROUND_2038923
 WORKAROUND_2064142
 WORKAROUND_2077057
-WORKAROUND_2457168
 WORKAROUND_2645198
 WORKAROUND_2658417
 WORKAROUND_4193714
@@ -132,3 +131,4 @@ WORKAROUND_REPEAT_TLBI_SYNC
 WORKAROUND_SPECULATIVE_AT
 WORKAROUND_SPECULATIVE_SSBS
 WORKAROUND_SPECULATIVE_UNPRIV_LOAD
+WORKAROUND_BROKEN_AMU_CONSTCNT
-- 
2.43.0


