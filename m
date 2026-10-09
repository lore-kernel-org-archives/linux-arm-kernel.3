Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99F2CA601C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 10:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dyEq6AztHdIBBOkiupS58UYnEU85W9CUNoQa+4uF6NE=; b=DhcZ3hBNvHx9e282YuoN+VP+Ik
	2y37d4HtcRhbxjEEk8sVqb6x1boTb6L+6uqMgQZ8Gk4d5b8DymkC3KFCktTLB1qW36Xk+ow05ZahX
	GLBkKYBIFRSM60bfZBzUpvaDVvbTsB17QB5TJKFbYg21ELR+dFglrO3Z+ItfNxZ6leT+5sWh/1uQw
	g8NnVDn/ACO/kxQIwz8XRJQHboQdDjcSNaOQ9Woqj/HLspKu5UnAO7pLV0HTNoYu13vtA8iU2YWb3
	paqr2UTRpwtqBH3fw63nBez4ovq/ZgZVx20PF32VW1UA867SkBwdhcqr8Mh/Hz7u+H4lrFnrKE8Gy
	nwdnZPRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7WF-00000005yvx-3JDP;
	Fri, 09 Oct 2026 10:08:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7WF-00000005yvI-0lGE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 10:08:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9C6A960DC2;
	Fri,  9 Oct 2026 10:08:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 199201F00893;
	Fri,  9 Oct 2026 10:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540482;
	bh=dyEq6AztHdIBBOkiupS58UYnEU85W9CUNoQa+4uF6NE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JiqaNfIlAXBd+I/uQl+5h9SL0X/vdMYNY3SHk6oixZSSEhep02CsotnCUmJdMjy+I
	 YzhCLpzLWKp9EvP+byIh4Uipe5ley7QIgPNVRVIYTZe9k7siLQw5KtCuwDKu0O/rqO
	 8+avGMGVRDIEjG66uMKvVuUVFDqR10g+o+U6/P8Df3ls2Ku2JyeKVdWU7c3VQHX6lT
	 xgdo/rQ/2X+7DylQIwskhHyom9R2nN41507UJEbmJfdkcDZk3IJ7DB/ojg3EcmD5mK
	 q+EQ/9/3qDBMrEcgBDA1kezUpZpBtbV+qYZvkV4LZtwR2wJpsJd/pwXwQjKEYaxWwx
	 4kepyE+SLYUHw==
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
Subject: [PATCH v2 04/23] cpu/hotplug: Propagate bring-up status to arch_cpuhp_cleanup_kick_cpu()
Date: Fri,  9 Oct 2026 11:07:15 +0100
Message-ID: <20261009100738.31288-5-will@kernel.org>
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

In preparation for enabling the generic CPU hotplug machinery on arm64,
which has architecture-specific handling of early bringup failures,
extend arch_cpuhp_cleanup_kick_cpu() to take an additional argument
indicating whether or not the target AP reached the alive state.

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/x86/kernel/smpboot.c  | 4 ++--
 include/linux/cpuhotplug.h | 2 +-
 kernel/cpu.c               | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index ba01a9e919b7..f10c64504244 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -1074,7 +1074,7 @@ static int do_boot_cpu(u32 apicid, unsigned int cpu, struct task_struct *idle)
 
 	/* If the wakeup mechanism failed, cleanup the warm reset vector */
 	if (ret)
-		arch_cpuhp_cleanup_kick_cpu(cpu);
+		arch_cpuhp_cleanup_kick_cpu(cpu, false);
 	return ret;
 }
 
@@ -1122,7 +1122,7 @@ int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct *tidle)
 	return smp_ops.kick_ap_alive(cpu, tidle);
 }
 
-void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu)
+void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu, bool is_alive)
 {
 	/* Cleanup possible dangling ends... */
 	if (smp_ops.kick_ap_alive == native_kick_ap && x86_platform.legacy.warm_reset)
diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
index feb32949aeea..cbdcf1659d90 100644
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -510,7 +510,7 @@ struct task_struct;
 
 void cpuhp_ap_sync_alive(void);
 void arch_cpuhp_sync_state_poll(void);
-void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu);
+void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu, bool is_alive);
 int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct *tidle);
 bool arch_cpuhp_init_parallel_bringup(void);
 
diff --git a/kernel/cpu.c b/kernel/cpu.c
index 786c3191431c..df3b6bc4c86b 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -426,7 +426,7 @@ static bool cpuhp_can_boot_ap(unsigned int cpu)
 	return true;
 }
 
-void __weak arch_cpuhp_cleanup_kick_cpu(unsigned int cpu) { }
+void __weak arch_cpuhp_cleanup_kick_cpu(unsigned int cpu, bool is_alive) { }
 
 /*
  * Early CPU bringup synchronization point. Cannot use cpuhp_state::done_up
@@ -445,7 +445,7 @@ static int cpuhp_bp_sync_alive(unsigned int cpu)
 	}
 
 	/* Let the architecture cleanup the kick alive mechanics. */
-	arch_cpuhp_cleanup_kick_cpu(cpu);
+	arch_cpuhp_cleanup_kick_cpu(cpu, !ret);
 	return ret;
 }
 #else /* CONFIG_HOTPLUG_CORE_SYNC_FULL */
-- 
2.56.0.385.gd3acb90ef8-goog


