Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D279E606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 20:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=s+QqvEj8;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OHx6Tdho
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ijWY+Z2NJRFFaxPZ787h43DbKEzbnR08iWE8GXg21g8=; b=s+QqvEj8nRSKNiIpWGP4qRhaR6
	Z52efIV+8Cp1lrrxKpK/OqHK0FxIMu9qEEyuIdF0EmqlzTA0N1lxn8SVtIG4nYRlXYl4U7dTH3fjE
	/bnFcTKmVVjVDN5YmS11nBSqISGjm9iDDMb+GYWkBJt+MBVAaVD9gd+q9l+uRmripbOHWKwUPWlR6
	irPpy7ruuTlEsks6+Cm2Uonq9rOz+skctpycQnS7JTeTpFof1YAa9YKj/luShjYQM65+uyMM/7CD2
	S4p4yAAFSuil4PO95pNgpLatAWCWT7i9tQZ9/zh+G3g4xweg1aurK5PjoiLFAb+zIkG+nmmEoQAj3
	yKxWA6MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP3w6-0000000AXw5-08o5;
	Thu, 05 Nov 2026 20:19:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP3w3-0000000AXvv-3CN1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 20:19:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id CD45E60147;
	Thu,  5 Nov 2026 20:19:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 08E651F0089F;
	Thu,  5 Nov 2026 20:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793909986;
	bh=ijWY+Z2NJRFFaxPZ787h43DbKEzbnR08iWE8GXg21g8=;
	h=From:To:Cc:Subject:Date;
	b=OHx6TdhotcaC6TMSXEfvA2ru0DsBB+t/DOejKXSp2mkAmUYBKLHRVWJCtBlfEbmMs
	 UO5WgoIsMcp1pw/OP7RjzZEoPBLC4xPS2DHY+Y9KYDiMHPValbhEoSOFxDyz030Kuz
	 a2dsVVjIV5/FHVGQGAfCu/ePxoUtz1OOGXx7oHb0egzINwi7wLQMM9tt4Oi4q7HQVi
	 1IlPKM0PXkbVcHeEiudoYKUlfgJylyMqyrkrIO7Ao28UWsq53/WeN/OhE8Iwv4zyrO
	 OhqMbP0NmhRVSiT2klGIBeJxM0SxiejpXbjmdiCOBndevLwvib6FjySd0xvs+SSI3u
	 j0Mn74sQCjKHA==
From: "syzbot" <syzbot@kernel.org>
To: syzkaller-bugs@googlegroups.com, Uladzislau Zhauniarovich <uladzislau.zhauniarovich@gmail.com>, "Catalin Marinas" <catalin.marinas@arm.com>, <linux-arm-kernel@lists.infradead.org>, "Will Deacon" <will@kernel.org>, "Peter Zijlstra" <peterz@infradead.org>
Subject: [PATCH] arm64: suspend: Only track cpuidle context for idle tasks
Message-ID: <c49d0138-9e6d-40d4-b46c-518240685bf1@mail.kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Date: Thu,  5 Nov 2026 20:19:45 +0000 (UTC)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, syzbot@lists.linux.dev, ruanjinjie@huawei.com, linux-kernel@vger.kernel.org, vladimir.murzin@arm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Uladzislau Zhauniarovich <uladzislau.zhauniarovich@gmail.com>

Commit 19235e472798 ("cpuidle, arm64: Fix the ARM64 cpuidle logic") moved
the calls to ct_cpuidle_enter() and ct_cpuidle_exit() into cpu_suspend() so
that arm64 cpuidle could keep RCU watching longer and manage context
tracking internally. However, cpu_suspend() is called not only by cpuidle
via psci_cpu_suspend_enter() (which runs in the context of the idle task),
but also during system suspend via psci_system_suspend_enter() (which runs
in the context of the task initiating suspend, such as a process writing to
/sys/power/state).

When entering system suspend, current is a non-idle task. Calling
ct_cpuidle_enter() invokes ct_kernel_exit() from kernel space (!user) on a
non-idle task. With CONFIG_RCU_EQS_DEBUG enabled, this violates context
tracking invariants and triggers a warning:

WARNING: kernel/context_tracking.c:120 at ct_kernel_exit+0x1b4/0x1f4
kernel/context_tracking.c:118
Call trace:
 ct_kernel_exit+0x1b4/0x1f4 kernel/context_tracking.c:118
 ct_idle_enter+0x20/0x34 kernel/context_tracking.c:299
 ct_cpuidle_enter include/linux/cpuidle.h:134 [inline]
 cpu_suspend+0x264/0x474 arch/arm64/kernel/suspend.c:136
 psci_system_suspend_enter+0x4c/0x80 drivers/firmware/psci/psci.c:544
 suspend_enter kernel/power/suspend.c:468 [inline]
 suspend_devices_and_enter+0x88c/0xd0c kernel/power/suspend.c:533
 enter_state kernel/power/suspend.c:618 [inline]
 pm_suspend+0x498/0x698 kernel/power/suspend.c:644
 state_store+0x14c/0x1fc kernel/power/main.c:819
 kobj_attr_store+0x6c/0x90 lib/kobject.c:842
 sysfs_kf_write+0xe0/0x108 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x260/0x3b8 fs/kernfs/file.c:345
 vfs_write+0x51c/0xa0c fs/read_write.c:687
 ksys_write+0x12c/0x228 fs/read_write.c:739

A corresponding warning is subsequently triggered in ct_kernel_enter() via
ct_cpuidle_exit() upon resume.

Fix this by checking is_idle_task(current) in cpu_suspend() and only
invoking ct_cpuidle_enter() and ct_cpuidle_exit() when executing in the
context of an idle task.

Fixes: 19235e472798 ("cpuidle, arm64: Fix the ARM64 cpuidle logic")
Assisted-by: Gemini:gemini-3.8-flash Gemini:gemini-3.1-pro-preview syzbot
Reported-by: syzbot+79883955da3a62652a80@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=79883955da3a62652a80
Link: https://syzkaller.appspot.com/ai_job?id=5359e16f-013b-4850-9cbc-ddfb3bac95e5
Signed-off-by: Uladzislau Zhauniarovich <uladzislau.zhauniarovich@gmail.com>

---
diff --git a/arch/arm64/kernel/suspend.c b/arch/arm64/kernel/suspend.c
index c41724a40..cde0b8c19 100644
--- a/arch/arm64/kernel/suspend.c
+++ b/arch/arm64/kernel/suspend.c
@@ -5,6 +5,7 @@
 #include <linux/uaccess.h>
 #include <linux/pgtable.h>
 #include <linux/cpuidle.h>
+#include <linux/sched.h>
 #include <asm/alternative.h>
 #include <asm/cacheflush.h>
 #include <asm/cpufeature.h>
@@ -99,6 +100,7 @@ int cpu_suspend(unsigned long arg, int (*fn)(unsigned long))
 	int ret = 0;
 	unsigned long flags;
 	struct sleep_stack_data state;
+	bool idle = is_idle_task(current);
 
 	/*
 	 * Some portions of CPU state (e.g. PSTATE.{PAN,DIT}) are initialized
@@ -133,7 +135,8 @@ int cpu_suspend(unsigned long arg, int (*fn)(unsigned long))
 	 */
 	pause_graph_tracing();
 
-	ct_cpuidle_enter();
+	if (idle)
+		ct_cpuidle_enter();
 
 	if (__cpu_suspend_enter(&state)) {
 		/* Call the suspend finisher */
@@ -149,9 +152,11 @@ int cpu_suspend(unsigned long arg, int (*fn)(unsigned long))
 		if (!ret)
 			ret = -EOPNOTSUPP;
 
-		ct_cpuidle_exit();
+		if (idle)
+			ct_cpuidle_exit();
 	} else {
-		ct_cpuidle_exit();
+		if (idle)
+			ct_cpuidle_exit();
 		__cpu_suspend_exit();
 	}
 


base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
-- 
See https://goo.gle/syzbot-ai-patches for information about AI-generated patches.
The person who has signed off on the patch is responsible for
addressing comments.
syzbot engineers can be reached at syzkaller@googlegroups.com.

