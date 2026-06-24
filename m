Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0490BCDE002
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 09:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9M7PkUPtYpY4RUQreVnYGCM+Ox9OBHbooKtSZnyfcNU=; b=estvvQY8QP/T2MR75IvHyK6hwV
	O8wNIYkooyYPc1Uqc5Eu/IYrZWAGFNRR5ymg65ehH4A8cD0W0XjidxHaPUO82CHex9P350JDXMFmG
	g4DcGofxo2Pj01pNO2OKfxsBkop819jO0nyGY/oNczp49WLwIi93HDQ3CNQzMvqyzF9zBTHtY75Bc
	donALLND9Eu4iSwfUafNQmDCHjiJ3K2qYfe4MQlGPokxGObi/17qFTOTvQRK5GjFMbENk+oHYmpM7
	dHjcHvfy8MBqBobVnHAyxfslYNjOg+3vLCEwsvTKpCPdav1uSAyPNK7CHLVIMqJa8nxDnKuL00uVy
	ggEMtl6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcJs7-00000007UpM-1jCe;
	Wed, 24 Jun 2026 09:26:15 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcJry-00000007UjB-0YHL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 09:26:07 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=9M7PkUPtYpY4RUQreVnYGCM+Ox9OBHbooKtSZnyfcNU=;
	b=kMtLT1t8pO41raYIMLG3oelygw6Wl2zIt490i/hIKZhryX1NRx+KVJzT98BZNzWdBYJlAPmni
	sFrBfNgDCFi0pwplLwAp6bFJjFXDclXIwKSZUCs7vaY+XDt+/k2wWm4xdU8RTdOz0AfsmYhYApM
	UpP+FYcd7qGnxmXjMaA6XtU=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4glbtW6vNdzcb3r;
	Wed, 24 Jun 2026 17:17:23 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 7809A40561;
	Wed, 24 Jun 2026 17:26:01 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 24 Jun
 2026 17:25:59 +0800
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
Subject: [PATCH v3 05/12] arm64: smp: Defer RCU registration during secondary CPU bringup
Date: Wed, 24 Jun 2026 17:25:30 +0800
Message-ID: <20260624092537.2916971-6-ruanjinjie@huawei.com>
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
X-CRM114-CacheID: sfid-20260624_022606_522078_B2B8FE56 
X-CRM114-Status: GOOD (  16.59  )
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

Calling rcutree_report_cpu_starting() early during boot can lead to
livelocks with the generic CPU hotplug mechanism if the boot CPU blocks
on an RCU grace period while the CPU being onlined is spinning in
cpuhp_ap_sync_alive(). So cpuhp_ap_sync_alive() must be called
before rcutree_report_cpu_starting().

And to prevent a potential deadlock on the boot CPU,
check_local_cpu_capabilities() must be executed before
cpuhp_ap_sync_alive(). This ensures that if an early capability mismatch
occurs and the AP invokes cpu_die_early(), the boot CPU can detect
the boot timeout and proceed, rather than hanging indefinitely.

In preparation for enabling the generic CPU hotplug code on arm64, split
up the trace_hardirqs_off() call during secondary CPU bringup so that we
update lockdep early but defer the tracing updates until after
RCU is ready.

Furthermore, to support parallel bringup without triggering false RCU CPU
stall Warnings or deadlocks, the initialization order must be:

    secondary_start_kernel()
        -> lockdep_hardirqs_off()
        -> check_local_cpu_capabilities()
           -> cpuhp_ap_sync_alive()
        -> cpuhp_ap_sync_alive()
        -> rcutree_report_cpu_starting()
        -> trace_hardirqs_off_finish()

Because check_local_cpu_capabilities() must execute while RCU is still
offline on the local CPU, it normally triggers a false-positive lockdep
"suspicious RCU usage" splat during early lock acquisitions as commit
ce3d31ad3cac ("arm64/smp: Move rcu_cpu_starting() earlier") pointed out.

Resolve this lockdep splat by wrapping the early capability verification
path within lockdep_off() and lockdep_on(). This safely suppresses
false-positive RCU validation flags on the offline CPU while maintaining
the strictly mandated initialization order for race-free parallel bringup.

Signed-off-by: Will Deacon <will@kernel.org>
Co-developed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/smp.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index c14b179c595d..87f92cf9ffa8 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -35,6 +35,7 @@
 #include <linux/kgdb.h>
 #include <linux/kvm_host.h>
 #include <linux/nmi.h>
+#include <linux/lockdep.h>
 
 #include <asm/alternative.h>
 #include <asm/atomic.h>
@@ -215,15 +216,23 @@ asmlinkage notrace void secondary_start_kernel(void)
 	if (system_uses_irq_prio_masking())
 		init_gic_priority_masking();
 
-	rcutree_report_cpu_starting(cpu);
-	trace_hardirqs_off();
+	lockdep_hardirqs_off(CALLER_ADDR0);
 
+	/*
+	 * Since RCU is still offline on this CPU, any nested native printk
+	 * or lock acquisition would normally trigger a false-positive
+	 * "suspicious RCU usage" lockdep splat.
+	 */
+	lockdep_off();
 	/*
 	 * If the system has established the capabilities, make sure
 	 * this CPU ticks all of those. If it doesn't, the CPU will
 	 * fail to come online.
 	 */
 	check_local_cpu_capabilities();
+	lockdep_on();
+	rcutree_report_cpu_starting(cpu);
+	trace_hardirqs_off_finish();
 
 	ops = get_cpu_ops(cpu);
 	if (ops->cpu_postboot)
-- 
2.34.1


