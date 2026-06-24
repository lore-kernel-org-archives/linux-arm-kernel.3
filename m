Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55040CDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 09:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=269hNQ1p4cIjqbezzaw6v9wgPOTXlh6wi8NjKdw9eVE=; b=IPxqfEb3ZAPJD2udZ1ugDfdCiU
	2lD6M2jKEMsrAhBavluXfW20F6mqVi+7WoUYDDz0eWMMwWH7WgdVjnJm2BHmyNSJhk0ny8jB0p5U/
	mfEbTS/9168OTA3wUvHVTW7gVPTfcsOHcVjxu5VhTLfr+Ofpe0uuEeWaZDYmLOTD/lXIwIkvK2jVW
	CIgf1p2P2KHpDU/t+/vIjoZrAjlt76tvVX9KwBPjic5E53s9MiCy3D8zsFFLxh9YbEKH+GHpBcElG
	6fsveOIob7K3/1QraEn6gJIUzORpIc20Xy7UVerAG3/gd9IzsMamlHRgpkwXeNGxTWNCIxLd2aAyi
	V6Q+wsOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcJs7-00000007Up3-0jgv;
	Wed, 24 Jun 2026 09:26:15 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcJrv-00000007Uha-06Rk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 09:26:04 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=269hNQ1p4cIjqbezzaw6v9wgPOTXlh6wi8NjKdw9eVE=;
	b=HhYAa1UHUa2N4hO0mw7zi85r3AOnTx0QeurzyAHb71kYHyk+6PCIN6MjNl4xxNYqWXlj9yxUe
	kdCCdn2xSDatK5efwclBtWcOhA6ZpsPN8K6OiuLnivcUnqq2HF8ApghSflEFRo/fV1PvlYLk7a1
	LZ41DqPFbXXH0r/XZ5C2sN4=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4glbsz1p0fz1cyTM;
	Wed, 24 Jun 2026 17:16:55 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 290E640539;
	Wed, 24 Jun 2026 17:25:59 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 24 Jun
 2026 17:25:56 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <tsbogend@alpha.franken.de>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <peterz@infradead.org>,
	<kees@kernel.org>, <nathan@kernel.org>, <linusw@kernel.org>,
	<ojeda@kernel.org>, <david.kaplan@amd.com>, <lukas.bulwahn@redhat.com>,
	<ryan.roberts@arm.com>, <maz@kernel.org>, <timothy.hayes@arm.com>,
	<lpieralisi@kernel.org>, <thuth@redhat.com>, <menglong8.dong@gmail.com>,
	<oupton@kernel.org>, <yeoreum.yun@arm.com>, <miko.lenczewski@arm.com>,
	<broonie@kernel.org>, <kevin.brodsky@arm.com>, <james.clark@linaro.org>,
	<yangyicong@hisilicon.com>, <tabba@google.com>, <osandov@fb.com>,
	<arnd@arndb.de>, <anshuman.khandual@arm.com>, <david@kernel.org>,
	<akpm@linux-foundation.org>, <ljs@kernel.org>, <dev.jain@arm.com>,
	<yang@os.amperecomputing.com>, <chaitanyas.prakash@arm.com>,
	<kprateek.nayak@amd.com>, <chenl311@chinatelecom.cn>,
	<sshegde@linux.ibm.com>, <thorsten.blum@linux.dev>,
	<chang.seok.bae@intel.com>, <tim.c.chen@linux.intel.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mips@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v3 04/12] arm64: smp: Tidy up cpuinfo init and cpufeature updates
Date: Wed, 24 Jun 2026 17:25:29 +0800
Message-ID: <20260624092537.2916971-5-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260624092537.2916971-1-ruanjinjie@huawei.com>
References: <20260624092537.2916971-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_022603_410954_4F3C9D52 
X-CRM114-Status: GOOD (  18.55  )
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

From: Will Deacon <will@kernel.org>

Populating the 'cpuinfo_arm64' structure during CPU bringup and
subsequently checking/updating cpufeature structures is slightly
convoluted and differs unnecessarily between the boot CPU and secondary
CPUs.

Rework the code so that cpuinfo_store_cpu() is used to populate the
'cpuinfo_arm64' structure for each CPU, with secondary CPUs then calling
update_cpu_features() to update the global view of the available
features. This allows us to internalise the 'boot_cpu_data' in
cpufeature.c and paves the way for parallelising the ID register probing
during bring-up of secondary CPUs.

Signed-off-by: Will Deacon <will@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/cpu.h   |  6 ++----
 arch/arm64/kernel/cpufeature.c | 21 +++++++++++++++++----
 arch/arm64/kernel/cpuinfo.c    | 11 -----------
 arch/arm64/kernel/smp.c        |  3 ++-
 4 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/include/asm/cpu.h b/arch/arm64/include/asm/cpu.h
index 71493b760b83..b77af3b1bde6 100644
--- a/arch/arm64/include/asm/cpu.h
+++ b/arch/arm64/include/asm/cpu.h
@@ -73,10 +73,8 @@ struct cpuinfo_arm64 {
 DECLARE_PER_CPU(struct cpuinfo_arm64, cpu_data);
 
 void cpuinfo_store_cpu(void);
-void __init cpuinfo_store_boot_cpu(void);
 
-void __init init_cpu_features(struct cpuinfo_arm64 *info);
-void update_cpu_features(int cpu, struct cpuinfo_arm64 *info,
-				 struct cpuinfo_arm64 *boot);
+void __init init_cpu_features(void);
+void update_cpu_features(int cpu);
 
 #endif /* __ASM_CPU_H */
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 6d53bb15cf7b..be75e60d56ca 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -117,6 +117,7 @@ EXPORT_SYMBOL(system_cpucaps);
 static struct arm64_cpu_capabilities const __ro_after_init *cpucap_ptrs[ARM64_NCAPS];
 
 DECLARE_BITMAP(boot_cpucaps, ARM64_NCAPS);
+static struct cpuinfo_arm64 boot_cpu_data;
 
 /*
  * arm64_use_ng_mappings must be placed in the .data section, otherwise it
@@ -1164,11 +1165,19 @@ static __init void detect_system_supports_pseudo_nmi(void)
 static inline void detect_system_supports_pseudo_nmi(void) { }
 #endif
 
-void __init init_cpu_features(struct cpuinfo_arm64 *info)
+void __init init_cpu_features(void)
 {
+	struct cpuinfo_arm64 *info = &per_cpu(cpu_data, 0);
+
 	/* Before we start using the tables, make sure it is sorted */
 	sort_ftr_regs();
 
+	/*
+	 * We keep a copy of the boot CPU registers so that physical hotplug
+	 * of CPU 0 can still be properly checked.
+	 */
+	boot_cpu_data = *info;
+
 	init_cpu_ftr_reg(SYS_CTR_EL0, info->reg_ctr);
 	init_cpu_ftr_reg(SYS_DCZID_EL0, info->reg_dczid);
 	init_cpu_ftr_reg(SYS_CNTFRQ_EL0, info->reg_cntfrq);
@@ -1363,12 +1372,14 @@ static int update_32bit_cpu_features(int cpu, struct cpuinfo_32bit *info,
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
@@ -3924,6 +3935,8 @@ static void __init setup_boot_cpu_capabilities(void)
 
 void __init setup_boot_cpu_features(void)
 {
+	init_cpu_features();
+
 	/*
 	 * Initialize the indirect array of CPU capabilities pointers before we
 	 * handle the boot CPU.
diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
index 6149bc91251d..df740dc478b2 100644
--- a/arch/arm64/kernel/cpuinfo.c
+++ b/arch/arm64/kernel/cpuinfo.c
@@ -31,7 +31,6 @@
  * values depending on configuration at or after reset.
  */
 DEFINE_PER_CPU(struct cpuinfo_arm64, cpu_data);
-static struct cpuinfo_arm64 boot_cpu_data;
 
 static inline const char *icache_policy_str(int l1ip)
 {
@@ -523,14 +522,4 @@ void cpuinfo_store_cpu(void)
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
index e858d7d64d1f..c14b179c595d 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -233,6 +233,7 @@ asmlinkage notrace void secondary_start_kernel(void)
 	 * Log the CPU info before it is marked online and might get read.
 	 */
 	cpuinfo_store_cpu();
+	update_cpu_features(cpu);
 	store_cpu_topology(cpu);
 
 	/*
@@ -453,7 +454,7 @@ void __init smp_prepare_boot_cpu(void)
 	 */
 	set_my_cpu_offset(per_cpu_offset(smp_processor_id()));
 
-	cpuinfo_store_boot_cpu();
+	cpuinfo_store_cpu();
 	setup_boot_cpu_features();
 
 	/* Conditionally switch to GIC PMR for interrupt masking */
-- 
2.34.1


