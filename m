Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B371CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 09:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VECIg4ov/FIyiC/SKOsbRM/La5dxB9QDanoGGZCeD2g=; b=jJk5GFLacQ5tCKbTnoNQGvNwOh
	Olglu97OyYK5jI6kX/w7RVGrgiwvMRrJGIRtN4tpXvIjroHUNB3O1mHv5yHi3w23pBz+jXX1+JX42
	SzmSbPQCybFD9gitsAWJAadBoxVz9Arh2MyFtcQN1e3rpcjnp8gNNxklQsJTbCJ8rEHQy+9A+qrib
	vTO3DNceWDGPdrGXf5wH05cQghpHVLSD7Dd0Rz/4RDbw5Bg5iP6fG4lojpS9+OI0MDLQUzRUPMO0x
	Rq8rcATUgA4jywSNjxCLFE1YGbppTnS1E+MScP8sxANvB0Shmg/2iexx5bS2feQo34za0mU1TIRoH
	qyWDkw6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcJrv-00000007UiL-1Eax;
	Wed, 24 Jun 2026 09:26:03 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcJrq-00000007UgY-1iik
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 09:26:02 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=VECIg4ov/FIyiC/SKOsbRM/La5dxB9QDanoGGZCeD2g=;
	b=jy8EJqo4anXrwcBUdjDQlQ/2fIQgMwafJN3ExhltFZXA4QUdsCUNedBiSg+g07TDlOHfetcAy
	nQYPSA9gE20aDubY11V2l40Pxy4aRp7HAV9fGpF28JxKIoJ3nAZKcBb9Xwze19XWTWcIoj6vJ7g
	90Jef6ANiCcAAEGKZY3+4HQ=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4glbtG3TGyznTVR;
	Wed, 24 Jun 2026 17:17:10 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 66E474048B;
	Wed, 24 Jun 2026 17:25:54 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 24 Jun
 2026 17:25:52 +0800
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
Subject: [PATCH v3 02/12] cpu/hotplug: Propagate bring-up status to arch_cpuhp_cleanup_kick_cpu()
Date: Wed, 24 Jun 2026 17:25:27 +0800
Message-ID: <20260624092537.2916971-3-ruanjinjie@huawei.com>
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
X-CRM114-CacheID: sfid-20260624_022559_040540_F5C6E873 
X-CRM114-Status: GOOD (  12.42  )
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

In preparation for enabling the generic CPU hotplug machinery on arm64,
which has architecture-specific handling of early bringup failures,
extend arch_cpuhp_cleanup_kick_cpu() to take an additional argument
indicating whether or not the target AP reached the alive state.

Signed-off-by: Will Deacon <will@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/x86/kernel/smpboot.c  | 4 ++--
 include/linux/cpuhotplug.h | 2 +-
 kernel/cpu.c               | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index 294a8ea60298..637660b15aee 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -1057,7 +1057,7 @@ static int do_boot_cpu(u32 apicid, unsigned int cpu, struct task_struct *idle)
 
 	/* If the wakeup mechanism failed, cleanup the warm reset vector */
 	if (ret)
-		arch_cpuhp_cleanup_kick_cpu(cpu);
+		arch_cpuhp_cleanup_kick_cpu(cpu, false);
 	return ret;
 }
 
@@ -1105,7 +1105,7 @@ int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct *tidle)
 	return smp_ops.kick_ap_alive(cpu, tidle);
 }
 
-void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu)
+void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu, bool is_alive)
 {
 	/* Cleanup possible dangling ends... */
 	if (smp_ops.kick_ap_alive == native_kick_ap && x86_platform.legacy.warm_reset)
diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
index 22ba327ec227..5c3b3e0bce47 100644
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -511,7 +511,7 @@ struct task_struct;
 
 void cpuhp_ap_sync_alive(void);
 void arch_cpuhp_sync_state_poll(void);
-void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu);
+void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu, bool is_alive);
 int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct *tidle);
 bool arch_cpuhp_init_parallel_bringup(void);
 
diff --git a/kernel/cpu.c b/kernel/cpu.c
index 5a90f60ff60e..b0e31e624623 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -427,7 +427,7 @@ static bool cpuhp_can_boot_ap(unsigned int cpu)
 	return true;
 }
 
-void __weak arch_cpuhp_cleanup_kick_cpu(unsigned int cpu) { }
+void __weak arch_cpuhp_cleanup_kick_cpu(unsigned int cpu, bool is_alive) { }
 
 /*
  * Early CPU bringup synchronization point. Cannot use cpuhp_state::done_up
@@ -446,7 +446,7 @@ static int cpuhp_bp_sync_alive(unsigned int cpu)
 	}
 
 	/* Let the architecture cleanup the kick alive mechanics. */
-	arch_cpuhp_cleanup_kick_cpu(cpu);
+	arch_cpuhp_cleanup_kick_cpu(cpu, !ret);
 	return ret;
 }
 #else /* CONFIG_HOTPLUG_CORE_SYNC_FULL */
-- 
2.34.1


