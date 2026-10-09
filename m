Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B15CCA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 10:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WYSgkojUIOOFSakZfuOsqMsk7C7YRFQkXbxsw2sUAiY=; b=MFvHVc0a2/LcqSG3rEL9nSRLDg
	XiYySdqmHPI7TbVzFIeNBxTfsuRSCiEq8cZ4d2OaEstTv0XvRRH9qdF0VB56+3oj4txkwbirdWdXg
	Pft5pNchFIO9gBHopSZy/62xZZKn9q+nVejJ9Ocv6omuPyjDC+YS8EyW0bOSReCBuW7gnm5houPPl
	+CEcaVGx4hM3hEzPo3FbQnPnz4w+BRZKMPfDQ8Y8PIezhudz9Aqg8M0DSEhaokJp4aAZrQAaouiMv
	LadO8PxiZc6mSRB2FprnA2Ne91SnY8LdAA46IMnup/bAOQ5Bo/ivA7rslM7Utf0VfWD1rUPFxtQbC
	L4vvUfwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7Wd-00000005zGL-0dx0;
	Fri, 09 Oct 2026 10:08:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7Wc-00000005zEp-0OSM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 10:08:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 85A5960DCA;
	Fri,  9 Oct 2026 10:08:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B7771F000FF;
	Fri,  9 Oct 2026 10:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540505;
	bh=WYSgkojUIOOFSakZfuOsqMsk7C7YRFQkXbxsw2sUAiY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DhulJfg8FudNr7pOa25veRB1y+16+Hgad6hQ0a1ziMgB2QyWzInHG/pzC3YqGchL1
	 HZurgur5CEGE3/01H5XWucUBtDHWNpPOxvO5QJJ+E8CZx5+HcJtUndCkOuoES9LliP
	 Oo5CH6yZjzOqyNTIkxSWRgtP4D2wx7u2iu+LS+0AAJ8JGljg2MBSaJ+kc9dvrrnIm+
	 NZDHeHR8GBlZrPVbDgyEBMvNHDJCn+jGg2f79I9KsbJzUVOGZEmQEQYanP3/HYQ6xZ
	 EuGVyZuR/N8C2EtRNZTHns3WQ29J92/APXUOOedJO8AQjXsBioV3tZ8wlS+mbAS3Qg
	 67J7XuqpbRquw==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	=?UTF-8?q?=C8=98tefania=20Ion?= <stefion@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Tarun Sahu <tarunsahu@google.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH v2 10/23] arm64: smp: Tidy up cpuinfo init and cpufeature updates
Date: Fri,  9 Oct 2026 11:07:21 +0100
Message-ID: <20261009100738.31288-11-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261009100738.31288-1-will@kernel.org>
References: <20261009100738.31288-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Populating the 'cpuinfo_arm64' structure during CPU bringup and
subsequently checking/updating cpufeature structures is slightly
convoluted and differs unnecessarily between the boot CPU and secondary
CPUs.

Rework the code so that cpuinfo_store_cpu() is used to populate the
'cpuinfo_arm64' structure for each CPU, with secondary CPUs then calling
update_cpu_features() to update the global view of the available
features. This allows us to internalise init_cpu_features() and the
'boot_cpu_data' in cpufeature.c and paves the way for parallelising the
ID register probing during bring-up of secondary CPUs.

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/cpu.h   |  5 +----
 arch/arm64/kernel/cpufeature.c | 21 +++++++++++++++++----
 arch/arm64/kernel/cpuinfo.c    | 11 -----------
 arch/arm64/kernel/smp.c        |  3 ++-
 4 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/include/asm/cpu.h b/arch/arm64/include/asm/cpu.h
index 6d2a5ac4c2f8..3d1693aaf4e0 100644
--- a/arch/arm64/include/asm/cpu.h
+++ b/arch/arm64/include/asm/cpu.h
@@ -73,11 +73,8 @@ struct cpuinfo_arm64 {
 DECLARE_PER_CPU(struct cpuinfo_arm64, cpu_data);
 
 void cpuinfo_store_cpu(void);
-void __init cpuinfo_store_boot_cpu(void);
+void update_cpu_features(int cpu);
 
 void __init validate_ftr_regs(void);
-void __init init_cpu_features(struct cpuinfo_arm64 *info);
-void update_cpu_features(int cpu, struct cpuinfo_arm64 *info,
-				 struct cpuinfo_arm64 *boot);
 
 #endif /* __ASM_CPU_H */
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index d69a5b8304b6..5db456884ffa 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -117,6 +117,7 @@ EXPORT_SYMBOL(system_cpucaps);
 static struct arm64_cpu_capabilities const __ro_after_init *cpucap_ptrs[ARM64_NCAPS];
 
 DECLARE_BITMAP(boot_cpucaps, ARM64_NCAPS);
+static struct cpuinfo_arm64 boot_cpu_data;
 
 /*
  * arm64_use_ng_mappings must be placed in the .data section, otherwise it
@@ -1197,8 +1198,16 @@ static bool detect_ftr_has_mpam(void)
 	return id_aa64pfr0_mpam(pfr0) || id_aa64pfr1_mpamfrac(pfr1);
 }
 
-void __init init_cpu_features(struct cpuinfo_arm64 *info)
+static void __init init_cpu_features(void)
 {
+	struct cpuinfo_arm64 *info = &per_cpu(cpu_data, 0);
+
+	/*
+	 * We keep a copy of the boot CPU registers so that physical hotplug
+	 * of CPU 0 can still be properly checked.
+	 */
+	boot_cpu_data = *info;
+
 	init_cpu_ftr_reg(SYS_CTR_EL0, info->reg_ctr);
 	init_cpu_ftr_reg(SYS_DCZID_EL0, info->reg_dczid);
 	init_cpu_ftr_reg(SYS_CNTFRQ_EL0, info->reg_cntfrq);
@@ -1391,12 +1400,14 @@ static int update_32bit_cpu_features(int cpu, struct cpuinfo_32bit *info,
  * non-boot CPU. Also performs SANITY checks to make sure that there
  * aren't any insane variations from that of the boot CPU.
  */
-void update_cpu_features(int cpu,
-			 struct cpuinfo_arm64 *info,
-			 struct cpuinfo_arm64 *boot)
+void update_cpu_features(int cpu)
 {
+	struct cpuinfo_arm64 *boot, *info;
 	int taint = 0;
 
+	boot = &boot_cpu_data;
+	info = per_cpu_ptr(&cpu_data, cpu);
+
 	/*
 	 * The kernel can handle differing I-cache policies, but otherwise
 	 * caches should look identical. Userspace JITs will make use of
@@ -3963,6 +3974,8 @@ static void __init setup_boot_cpu_capabilities(void)
 
 void __init setup_boot_cpu_features(void)
 {
+	init_cpu_features();
+
 	/*
 	 * Initialize the indirect array of CPU capabilities pointers before we
 	 * handle the boot CPU.
diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
index 1b92e52989b1..dfb21bf5541d 100644
--- a/arch/arm64/kernel/cpuinfo.c
+++ b/arch/arm64/kernel/cpuinfo.c
@@ -31,7 +31,6 @@
  * values depending on configuration at or after reset.
  */
 DEFINE_PER_CPU(struct cpuinfo_arm64, cpu_data);
-static struct cpuinfo_arm64 boot_cpu_data;
 
 static inline const char *icache_policy_str(int l1ip)
 {
@@ -528,14 +527,4 @@ void cpuinfo_store_cpu(void)
 {
 	struct cpuinfo_arm64 *info = this_cpu_ptr(&cpu_data);
 	__cpuinfo_store_cpu(info);
-	update_cpu_features(smp_processor_id(), info, &boot_cpu_data);
-}
-
-void __init cpuinfo_store_boot_cpu(void)
-{
-	struct cpuinfo_arm64 *info = &per_cpu(cpu_data, 0);
-	__cpuinfo_store_cpu(info);
-
-	boot_cpu_data = *info;
-	init_cpu_features(&boot_cpu_data);
 }
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index d2aa949e33a3..e1b15cab9ed6 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -235,6 +235,7 @@ asmlinkage notrace void secondary_start_kernel(void)
 	 * Log the CPU info before it is marked online and might get read.
 	 */
 	cpuinfo_store_cpu();
+	update_cpu_features(cpu);
 	store_cpu_topology(cpu);
 
 	/*
@@ -457,7 +458,7 @@ void __init smp_prepare_boot_cpu(void)
 
 	/* Check arm64_ftr_regs[] before anything looks registers up in it. */
 	validate_ftr_regs();
-	cpuinfo_store_boot_cpu();
+	cpuinfo_store_cpu();
 	setup_boot_cpu_features();
 
 	/* Conditionally switch to GIC PMR for interrupt masking */
-- 
2.56.0.385.gd3acb90ef8-goog


