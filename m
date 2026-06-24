Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 169FDCDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 09:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mieu95MHGOCQPSEh0wCzkUvvYOX+yIxJiHobJLWZ7sA=; b=Mtbh781OAeXSDUjxjigaClvj6u
	rw/+3SqXQE8CYuXNlgRm0FlTIsGjCS5FGVBv1ggSQxlNczEpwTWSycvb4e5q++6pvJq/gQafkC2lF
	RNWaXLciax06XdHGp8nvEGF+wshd47A80OrfgwGIO2bwE0hdh16dYU9hDeLKj9/+VIMVmGRWN92ef
	O32+nX6QlUjj6gYwUBfHF+VySHWu7Qpf2vDqrzcKwp3fft6u3P0CvD15cd9DByxHqYSkOMJ+ELq7K
	dy9J0q27JG3mi2uBMXGkf4wQrXAoL+I3serpqJPC2KFJ526fs6fHkkuZizz7T1mrxE+D6hlRzrHd5
	kuXro90w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcJs7-00000007Upc-2P6c;
	Wed, 24 Jun 2026 09:26:15 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcJs2-00000007Ulb-3HYo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 09:26:13 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Mieu95MHGOCQPSEh0wCzkUvvYOX+yIxJiHobJLWZ7sA=;
	b=JxJ1KdpaxFu7YpP+SYjQhdAUn7PgqhCjmiBYFvkDQWa33tjd7sW58S/2Sd+Qgaa4nt7JNgzOe
	w1RCKoee4zOS1OQujBz08Tx8yc7auGQDg7X1/0yGNV6f/PHl+8K0QGNhIqXZZT1ZV6DzZ5F2PoO
	Ggvk9TLmNUaUb20eqdnIY+o=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4glbt51GG5z1prKy;
	Wed, 24 Jun 2026 17:17:01 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 7C6E02012A;
	Wed, 24 Jun 2026 17:26:08 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 24 Jun
 2026 17:26:06 +0800
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
Subject: [PATCH v3 08/12] arm64: cpu_ops: Introduce get_secondary_cpu_ops()
Date: Wed, 24 Jun 2026 17:25:33 +0800
Message-ID: <20260624092537.2916971-9-ruanjinjie@huawei.com>
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
X-CRM114-CacheID: sfid-20260624_022611_314191_B333B512 
X-CRM114-Status: GOOD (  15.42  )
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

Introduce get_secondary_cpu_ops() to retrieve a pointer to the
'cpu_operations' structure for the non-boot CPUs and use it instead of
get_cpu_ops() where we are dealing with secondary CPUs.

This is a pre-requisite for enabling parallel CPU bring-up.

Signed-off-by: Will Deacon <will@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/cpu_ops.h |  1 +
 arch/arm64/kernel/cpu_ops.c      |  5 +++++
 arch/arm64/kernel/smp.c          | 19 +++++++------------
 3 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/include/asm/cpu_ops.h b/arch/arm64/include/asm/cpu_ops.h
index a444c8915e88..cd298a8710d8 100644
--- a/arch/arm64/include/asm/cpu_ops.h
+++ b/arch/arm64/include/asm/cpu_ops.h
@@ -48,6 +48,7 @@ struct cpu_operations {
 
 int __init init_cpu_ops(int cpu);
 extern const struct cpu_operations *get_cpu_ops(int cpu);
+extern const struct cpu_operations *get_secondary_cpu_ops(void);
 
 static inline void __init init_bootcpu_ops(void)
 {
diff --git a/arch/arm64/kernel/cpu_ops.c b/arch/arm64/kernel/cpu_ops.c
index eacfb88a0c0c..7d183ca31dc8 100644
--- a/arch/arm64/kernel/cpu_ops.c
+++ b/arch/arm64/kernel/cpu_ops.c
@@ -127,3 +127,8 @@ const struct cpu_operations *get_cpu_ops(int cpu)
 
 	return NULL;
 }
+
+const struct cpu_operations *get_secondary_cpu_ops(void)
+{
+	return cpu_ops;
+}
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 9482e8d38b98..6b9586a69429 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -99,7 +99,7 @@ static inline int op_cpu_kill(unsigned int cpu)
  */
 static int boot_secondary(unsigned int cpu, struct task_struct *idle)
 {
-	const struct cpu_operations *ops = get_cpu_ops(cpu);
+	const struct cpu_operations *ops = get_secondary_cpu_ops();
 
 	if (ops->cpu_boot)
 		return ops->cpu_boot(cpu);
@@ -234,7 +234,7 @@ asmlinkage notrace void secondary_start_kernel(void)
 	rcutree_report_cpu_starting(cpu);
 	trace_hardirqs_off_finish();
 
-	ops = get_cpu_ops(cpu);
+	ops = get_secondary_cpu_ops();
 	if (ops->cpu_postboot)
 		ops->cpu_postboot();
 
@@ -334,7 +334,7 @@ int __cpu_disable(void)
 
 static int op_cpu_kill(unsigned int cpu)
 {
-	const struct cpu_operations *ops = get_cpu_ops(cpu);
+	const struct cpu_operations *ops = get_secondary_cpu_ops();
 
 	/*
 	 * If we have no means of synchronising with the dying CPU, then assume
@@ -375,7 +375,7 @@ void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu)
 void __noreturn cpu_die(void)
 {
 	unsigned int cpu = smp_processor_id();
-	const struct cpu_operations *ops = get_cpu_ops(cpu);
+	const struct cpu_operations *ops = get_secondary_cpu_ops();
 
 	idle_task_exit();
 
@@ -501,7 +501,7 @@ static int __init smp_cpu_setup(int cpu)
 	if (init_cpu_ops(cpu))
 		return -ENODEV;
 
-	ops = get_cpu_ops(cpu);
+	ops = get_secondary_cpu_ops();
 	if (ops->cpu_init(cpu))
 		return -ENODEV;
 
@@ -780,7 +780,7 @@ void __init smp_init_cpus(void)
 
 void __init smp_prepare_cpus(unsigned int max_cpus)
 {
-	const struct cpu_operations *ops;
+	const struct cpu_operations *ops = get_secondary_cpu_ops();
 	unsigned int cpu;
 	int err;
 
@@ -806,10 +806,6 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 		if (cpu == 0)
 			continue;
 
-		ops = get_cpu_ops(cpu);
-		if (!ops)
-			continue;
-
 		err = ops->cpu_prepare(cpu);
 		if (err)
 			continue;
@@ -1299,8 +1295,7 @@ bool smp_crash_stop_failed(void)
 static bool have_cpu_die(void)
 {
 #ifdef CONFIG_HOTPLUG_CPU
-	int any_cpu = raw_smp_processor_id();
-	const struct cpu_operations *ops = get_cpu_ops(any_cpu);
+	const struct cpu_operations *ops = get_secondary_cpu_ops();
 
 	if (ops && ops->cpu_die)
 		return true;
-- 
2.34.1


