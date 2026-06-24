Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C12CDE005
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 09:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P1LAsF3yfHMQr/lL87dOHp3Nz6XBq5TedJFrQXGK3yk=; b=Syw+6RgdktKcmvUBILFRuD2fT7
	4phxqdoV1nxwoRLnRlteMiCk2wbNsIMZW5mhKILwohJpJ2gZOodkRkBSt3QHUxZGBDuxPcwF64x0H
	CLQijjMzX0aSESvvFTMpA2ZLnVwfGvXVb1xoRmXwmH5izfiFZLx2a4qGgQFbbcdzFCm8rKosTTRVk
	m8odywQAH/zZNDc0bV4mqST3e4YIYNB+gHQ56v7XpxVxL9yHJZZ3FzohD1UwOT4lRBAEW3wOdGF2u
	msXfCASujokZ6cpN3MaWZEHesd1qVoHuXsu/PYGinpLwU1IBgUw4iwjJM53PemZiDRBV/VTLZGnfT
	vzzuHlYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcJs7-00000007Upy-3ClC;
	Wed, 24 Jun 2026 09:26:15 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcJs2-00000007UlM-3HQO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 09:26:13 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=P1LAsF3yfHMQr/lL87dOHp3Nz6XBq5TedJFrQXGK3yk=;
	b=CICxvjHPHPnQhaGdXXHk82TWbhOMxvazZEY8n0NI1CZBT7sh0mzQc3QpW5GSdSWoXAOs3WM1V
	Q291LgMeK327EHnOPflyEJdC/RJOfiqSfPxWJIx/cBxckLhTCnogX2xErLsud15Dz/jC0VC2doW
	6He3T5K8iS4HfLK206ZFFPY=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4glbt03tGmz1prKy;
	Wed, 24 Jun 2026 17:16:56 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id CF40640569;
	Wed, 24 Jun 2026 17:26:03 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 24 Jun
 2026 17:26:01 +0800
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
Subject: [PATCH v3 06/12] arm64: smp: Use generic HOTPLUG_SPLIT_STARTUP machinery for CPU onlining
Date: Wed, 24 Jun 2026 17:25:31 +0800
Message-ID: <20260624092537.2916971-7-ruanjinjie@huawei.com>
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
X-CRM114-CacheID: sfid-20260624_022611_173214_0ED0946B 
X-CRM114-Status: GOOD (  16.10  )
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

In preparation for enabling parallel bringup of secondary CPUs
on arm64, take the baby step of moving from HOTPLUG_CORE_SYNC_DEAD
to HOTPLUG_SPLIT_STARTUP.

To fully enable HOTPLUG_SPLIT_STARTUP, this patch implements:

1) arch_cpuhp_kick_ap_alive(). Kick the secondary CPU via firmware
without blocking.

2) arch_cpuhp_cleanup_kick_cpu(). Extracts early boot telemetry upon
AP bringup timeouts.

3) Callbacks to cpuhp_ap_sync_alive() inside secondary_start_kernel().
Enforces the initial pre-online boot handshake from the secondary
CPU side.

Signed-off-by: Will Deacon <will@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/Kconfig      |  2 +-
 arch/arm64/kernel/smp.c | 39 +++++++++++++++++++--------------------
 2 files changed, 20 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index fe60738e5943..24496e9967a8 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -231,7 +231,7 @@ config ARM64
 	select HAVE_KPROBES
 	select HAVE_KRETPROBES
 	select HAVE_GENERIC_VDSO
-	select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
+	select HOTPLUG_SPLIT_STARTUP if SMP
 	select HOTPLUG_SMT if HOTPLUG_CPU
 	select IRQ_DOMAIN
 	select IRQ_FORCED_THREADING
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 87f92cf9ffa8..9482e8d38b98 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -107,12 +107,9 @@ static int boot_secondary(unsigned int cpu, struct task_struct *idle)
 	return -EOPNOTSUPP;
 }
 
-static DECLARE_COMPLETION(cpu_running);
-
-int __cpu_up(unsigned int cpu, struct task_struct *idle)
+int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct *idle)
 {
 	int ret;
-	long status;
 
 	/*
 	 * We need to tell the secondary core where to find its stack and the
@@ -123,22 +120,22 @@ int __cpu_up(unsigned int cpu, struct task_struct *idle)
 
 	/* Now bring the CPU into our world */
 	ret = boot_secondary(cpu, idle);
-	if (ret) {
-		if (ret != -EPERM)
-			pr_err("CPU%u: failed to boot: %d\n", cpu, ret);
-		return ret;
-	}
+	if (ret && ret != -EPERM)
+		pr_err("CPU%u: failed to boot: %d\n", cpu, ret);
+	return ret;
+}
+
+void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu, bool is_alive)
+{
+	long status;
+
+	if (is_alive)
+		return;
 
 	/*
-	 * CPU was successfully started, wait for it to come online or
-	 * time out.
+	 * We failed to synchronise with the CPU, so check if it left us
+	 * any breadcrumbs.
 	 */
-	wait_for_completion_timeout(&cpu_running,
-				    msecs_to_jiffies(5000));
-	if (cpu_online(cpu))
-		return 0;
-
-	pr_crit("CPU%u: failed to come online\n", cpu);
 	secondary_data.task = NULL;
 	status = READ_ONCE(secondary_data.status);
 	if (status == CPU_MMU_OFF)
@@ -170,8 +167,6 @@ int __cpu_up(unsigned int cpu, struct task_struct *idle)
 	case CPU_PANIC_KERNEL:
 		panic("CPU%u detected unsupported configuration\n", cpu);
 	}
-
-	return -EIO;
 }
 
 static void init_gic_priority_masking(void)
@@ -231,6 +226,11 @@ asmlinkage notrace void secondary_start_kernel(void)
 	 */
 	check_local_cpu_capabilities();
 	lockdep_on();
+	/*
+	 * Synchronise with the core bringing us online so that it knows
+	 * we made it into the kernel. We're still not 'online'.
+	 */
+	cpuhp_ap_sync_alive();
 	rcutree_report_cpu_starting(cpu);
 	trace_hardirqs_off_finish();
 
@@ -264,7 +264,6 @@ asmlinkage notrace void secondary_start_kernel(void)
 					 read_cpuid_id());
 	update_cpu_boot_status(CPU_BOOT_SUCCESS);
 	set_cpu_online(cpu, true);
-	complete(&cpu_running);
 
 	/*
 	 * Secondary CPUs enter the kernel with all DAIF exceptions masked.
-- 
2.34.1


