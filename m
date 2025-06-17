Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89681C71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 10:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6lgDYXlSOK17HiJktKGHQ+MtBkXZpBrEpYBPjJekGmM=; b=DqsafnE4m68UTihnLrTTbEyJEJ
	Un/nxXIeLDbT+UHhZ0sShUiazSrG2o1iFzesnJ2IAy63u/E5U10BwNokr6pWDwYjNI4tEyt1/fiBi
	78B0yLsN9LUv4i3tfS/0GSCWfSlX/7qn2KB21BfusUrPCJM3kcRnmL+Kpsi81Tf54JrJfD1nq/lRE
	lRwnin5Yi1wqGKdHvOE0fX/b5e6FYcrzpVLOAyQWoKRUgpSH6AmdSYM+lHZPcsywxYIdT/ggw+nv7
	oSlSqhkIIcLqfEdR6yR9c9ldg7zAB7+A1e9WRq7rWzi/jtZuG4vghY247rEsyB6bKB7Y+ppHiumb4
	xQJeG2yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRTLx-00000006tLf-0k1r;
	Tue, 17 Jun 2025 10:15:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRSyP-00000006pOM-1Wbx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 09:51:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB83A15A1;
	Tue, 17 Jun 2025 02:50:59 -0700 (PDT)
Received: from mazurka.cambridge.arm.com (mazurka.cambridge.arm.com [10.2.80.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7F7A13F58B;
	Tue, 17 Jun 2025 02:51:17 -0700 (PDT)
From: =?UTF-8?q?Miko=C5=82aj=20Lenczewski?= <miko.lenczewski@arm.com>
To: ryan.roberts@arm.com,
	yang@os.amperecomputing.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	jean-philippe@linaro.org,
	robin.murphy@arm.com,
	joro@8bytes.org,
	maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	james.morse@arm.com,
	broonie@kernel.org,
	ardb@kernel.org,
	baohua@kernel.org,
	suzuki.poulose@arm.com,
	david@redhat.com,
	jgg@ziepe.ca,
	nicolinc@nvidia.com,
	jsnitsel@redhat.com,
	mshavit@google.com,
	kevin.tian@intel.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev
Cc: =?UTF-8?q?Miko=C5=82aj=20Lenczewski?= <miko.lenczewski@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>
Subject: [PATCH v7 1/4] arm64: cpufeature: Introduce MATCH_ALL_EARLY_CPUS capability type
Date: Tue, 17 Jun 2025 09:51:01 +0000
Message-ID: <20250617095104.6772-2-miko.lenczewski@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617095104.6772-1-miko.lenczewski@arm.com>
References: <20250617095104.6772-1-miko.lenczewski@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_025121_491002_511C5AB3 
X-CRM114-Status: GOOD (  23.22  )
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

From: Catalin Marinas <catalin.marinas@arm.com>

For system-wide capabilities, the kernel has the SCOPE_SYSTEM type. Such
capabilities are checked once the SMP boot has completed using the
sanitised ID registers. However, there is a need for a new capability
type similar in scope to the system one but with checking performed
locally on each CPU during boot (e.g. based on MIDR_EL1 which is not a
sanitised register).

Introduce ARM64_CPUCAP_MATCH_ALL_EARLY_CPUS which, together with
ARM64_CPUCAP_SCOPE_LOCAL_CPU, ensures that such capability is enabled
only if all early CPUs have it. For ease of use, define
ARM64_CPUCAP_EARLY_LOCAL_CPU_FEATURE which combines SCOPE_LOCAL_CPU,
PERMITTED_FOR_LATE_CPUS and MATCH_ALL_EARLY_CPUS.

Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Mikołaj Lenczewski <miko.lenczewski@arm.com>
Cc: Suzuki K Poulose <Suzuki.Poulose@arm.com>
---
 arch/arm64/include/asm/cpufeature.h | 23 +++++++++++
 arch/arm64/kernel/cpufeature.c      | 60 +++++++++++++++++++++++------
 2 files changed, 72 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index c4326f1cb917..155ebd040c55 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -275,6 +275,14 @@ extern struct arm64_ftr_reg arm64_ftr_reg_ctrel0;
 #define ARM64_CPUCAP_OPTIONAL_FOR_LATE_CPU	((u16)BIT(5))
 /* Panic when a conflict is detected */
 #define ARM64_CPUCAP_PANIC_ON_CONFLICT		((u16)BIT(6))
+/*
+ * When paired with SCOPE_LOCAL_CPU, all early CPUs must satisfy the
+ * condition. This is different from SCOPE_SYSTEM where the check is performed
+ * only once at the end of the SMP boot on the sanitised ID registers.
+ * SCOPE_SYSTEM is not suitable for cases where the capability depends on
+ * properties local to a CPU like MIDR_EL1.
+ */
+#define ARM64_CPUCAP_MATCH_ALL_EARLY_CPUS	((u16)BIT(7))
 
 /*
  * CPU errata workarounds that need to be enabled at boot time if one or
@@ -304,6 +312,16 @@ extern struct arm64_ftr_reg arm64_ftr_reg_ctrel0;
 	(ARM64_CPUCAP_SCOPE_LOCAL_CPU		|	\
 	 ARM64_CPUCAP_OPTIONAL_FOR_LATE_CPU	|	\
 	 ARM64_CPUCAP_PERMITTED_FOR_LATE_CPU)
+/*
+ * CPU feature detected at boot time and present on all early CPUs. Late CPUs
+ * are permitted to have the feature even if it hasn't been enabled, although
+ * the feature will not be used by Linux in this case. If all early CPUs have
+ * the feature, then every late CPU must have it.
+ */
+#define ARM64_CPUCAP_EARLY_LOCAL_CPU_FEATURE		\
+	 (ARM64_CPUCAP_SCOPE_LOCAL_CPU		|	\
+	  ARM64_CPUCAP_PERMITTED_FOR_LATE_CPU	|	\
+	  ARM64_CPUCAP_MATCH_ALL_EARLY_CPUS)
 
 /*
  * CPU feature detected at boot time, on one or more CPUs. A late CPU
@@ -391,6 +409,11 @@ static inline int cpucap_default_scope(const struct arm64_cpu_capabilities *cap)
 	return cap->type & ARM64_CPUCAP_SCOPE_MASK;
 }
 
+static inline bool cpucap_match_all_early_cpus(const struct arm64_cpu_capabilities *cap)
+{
+	return cap->type & ARM64_CPUCAP_MATCH_ALL_EARLY_CPUS;
+}
+
 /*
  * Generic helper for handling capabilities with multiple (match,enable) pairs
  * of call backs, sharing the same capability bit.
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index b34044e20128..f9c947166322 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -3370,18 +3370,49 @@ static void update_cpu_capabilities(u16 scope_mask)
 
 	scope_mask &= ARM64_CPUCAP_SCOPE_MASK;
 	for (i = 0; i < ARM64_NCAPS; i++) {
+		bool match_all = false;
+		bool caps_set = false;
+		bool boot_cpu = false;
+
 		caps = cpucap_ptrs[i];
-		if (!caps || !(caps->type & scope_mask) ||
-		    cpus_have_cap(caps->capability) ||
-		    !caps->matches(caps, cpucap_default_scope(caps)))
+		if (!caps || !(caps->type & scope_mask))
 			continue;
 
-		if (caps->desc && !caps->cpus)
+		match_all = cpucap_match_all_early_cpus(caps);
+		caps_set = cpus_have_cap(caps->capability);
+		boot_cpu = scope_mask & SCOPE_BOOT_CPU;
+
+		/*
+		 * Unless it's a match-all CPUs feature, avoid probing if
+		 * already detected.
+		 */
+		if (!match_all && caps_set)
+			continue;
+
+		/*
+		 * A match-all CPUs capability is only set when probing the
+		 * boot CPU. It may be cleared subsequently if not detected on
+		 * secondary ones.
+		 */
+		if (match_all && !caps_set && !boot_cpu)
+			continue;
+
+		if (!caps->matches(caps, cpucap_default_scope(caps))) {
+			if (match_all)
+				__clear_bit(caps->capability, system_cpucaps);
+			continue;
+		}
+
+		/*
+		 * Match-all CPUs capabilities are logged later when the
+		 * system capabilities are finalised.
+		 */
+		if (!match_all && caps->desc && !caps->cpus)
 			pr_info("detected: %s\n", caps->desc);
 
 		__set_bit(caps->capability, system_cpucaps);
 
-		if ((scope_mask & SCOPE_BOOT_CPU) && (caps->type & SCOPE_BOOT_CPU))
+		if (boot_cpu && (caps->type & SCOPE_BOOT_CPU))
 			set_bit(caps->capability, boot_cpucaps);
 	}
 }
@@ -3782,17 +3813,24 @@ static void __init setup_system_capabilities(void)
 	enable_cpu_capabilities(SCOPE_ALL & ~SCOPE_BOOT_CPU);
 	apply_alternatives_all();
 
-	/*
-	 * Log any cpucaps with a cpumask as these aren't logged by
-	 * update_cpu_capabilities().
-	 */
 	for (int i = 0; i < ARM64_NCAPS; i++) {
 		const struct arm64_cpu_capabilities *caps = cpucap_ptrs[i];
 
-		if (caps && caps->cpus && caps->desc &&
-			cpumask_any(caps->cpus) < nr_cpu_ids)
+		if (!caps || !caps->desc)
+			continue;
+
+		/*
+		 * Log any cpucaps with a cpumask as these aren't logged by
+		 * update_cpu_capabilities().
+		 */
+		if (caps->cpus && cpumask_any(caps->cpus) < nr_cpu_ids)
 			pr_info("detected: %s on CPU%*pbl\n",
 				caps->desc, cpumask_pr_args(caps->cpus));
+
+		/* Log match-all CPUs capabilities */
+		if (cpucap_match_all_early_cpus(caps) &&
+		    cpus_have_cap(caps->capability))
+			pr_info("detected: %s\n", caps->desc);
 	}
 
 	/*
-- 
2.49.0


