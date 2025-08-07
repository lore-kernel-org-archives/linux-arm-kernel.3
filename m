Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C32C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 11:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eWgEkb03sN/FCWZ7fhgs93lKgPLJn5Z8+hW4XEz6nG4=; b=BjWkETk/dwR1K2Cc5a/uSkR1lj
	UWJvtEDVvhRH+XycJtzvIMRb0bg5T0RIqdYU1WkX5nfGufIo+nvY952ltK/XuPH2//pvoZOliZwGy
	tWLn2lkdKLFR6KcTOxenUfrdtVR77eiAxtlBz+hbgnr42Ph5bEf5hwen/26tajl/rImtK+TXHxdmG
	2WhszoniJp8t/JwX2zai9KtPiCBxtyj5qYWHnPKU9fmfBIwpwHL5iEKPe9ikNt/r6ui/+ZCllFqG5
	X1rXGThnLMFXfpMrChDjju9v1jGZxs3Aw3qb+rTjT4fXcaxWuhRNnxfwSkLmq1HJ35Fhr2eW6nn6T
	SeqMQ4TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujyxo-00000000Oq4-0Ywm;
	Thu, 07 Aug 2025 11:39:16 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujyiC-00000000MUu-0v4V
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 11:23:10 +0000
X-UUID: dd2e0996738011f0b29709d653e92f7d-20250807
X-CID-CACHE: Type:Local,Time:202508071912+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:8ffeef84-cc78-4d9f-8f2f-9a0c2c155af6,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:6493067,CLOUDID:d140946473c6e663ff6cfd9239c73f90,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:5,IP:nil,URL
	:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SP
	R:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: dd2e0996738011f0b29709d653e92f7d-20250807
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <cuiguoqi@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 851429058; Thu, 07 Aug 2025 19:22:55 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id EC5D4E01A758;
	Thu,  7 Aug 2025 19:22:54 +0800 (CST)
X-ns-mid: postfix-68948C8C-7858575
Received: from localhost.localdomain (unknown [10.41.103.97])
	by mail.kylinos.cn (NSMail) with ESMTPA id BB3EFE0000B0;
	Thu,  7 Aug 2025 19:22:49 +0800 (CST)
From: cuiguoqi <cuiguoqi@kylinos.cn>
To: catalin.marinas@arm.com,
	will@kernel.org,
	bigeasy@linutronix.de,
	clrkwllms@kernel.org,
	rostedt@goodmis.org
Cc: farbere@amazon.com,
	guoqi0226@163.com,
	cuiguoqi@kylinos.cn,
	tglx@linutronix.de,
	pmladek@suse.com,
	akpm@linux-foundation.org,
	feng.tang@linux.alibaba.com,
	joel.granados@kernel.org,
	john.ogness@linutronix.de,
	namcao@linutronix.de,
	takakura@valinux.co.jp,
	sravankumarlpu@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: [PATCH] printk: Fix panic log flush to serial console during kdump in PREEMPT_RT kernels
Date: Thu,  7 Aug 2025 19:22:47 +0800
Message-Id: <20250807112247.170127-1-cuiguoqi@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_042308_556013_48269062 
X-CRM114-Status: GOOD (  12.50  )
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

When a system running a real-time (PREEMPT_RT) kernel panics and triggers=
 kdump,
the critical log messages (e.g., panic reason, stack traces) may fail to =
appear
on the serial console.

When kdump cannot be used properly, serial console logs are crucial,
whether for diagnosing kdump issues or troubleshooting the underlying pro=
blem.

This issue arises due to synchronization or deferred flushing of the prin=
tk buffer
in real-time contexts, where preemptible console locks or delayed workque=
ues prevent
timely log output before kexec transitions to the crash kernel.

The test results are as follows:
[  T197] Kernel panic - not syncing: sysrq triggered crash
[  T197] Call trace:
[  T197]  dump_backtrace+0x9c/0x120
[  T197]  show_stack+0x1c/0x30
[  T197]  dump_stack_lvl+0x34/0x88
[  T197]  dump_stack+0x14/0x20
[  T197]  panic+0x3c4/0x3f8
[  T197]  sysrq_handle_crash+0x20/0x28
[  T197]  __handle_sysrq+0xd4/0x1e0
[  T197]  write_sysrq_trigger+0x88/0x108
[  T197]  proc_reg_write+0x9c/0xf8
[  T197]  vfs_write+0xf4/0x450
[  T197]  ksys_write+0x70/0x100
[  T197]  __arm64_sys_write+0x20/0x30
[  T197]  invoke_syscall+0x48/0x110
[  T197]  el0_svc_common.constprop.0+0x44/0xe8
[  T197]  do_el0_svc+0x20/0x30
[  T197]  el0_svc+0x24/0x88
[  T197]  el0t_64_sync_handler+0xb8/0xc0
[  T197]  el0t_64_sync+0x14c/0x150
[  T197] SMP: stopping secondary CPUs
[  T197] Starting crashdump kernel...
[  T197] Bye!

Signed-off-by: cuiguoqi <cuiguoqi@kylinos.cn>
---
 arch/arm64/kernel/machine_kexec.c | 4 ++++
 kernel/panic.c                    | 4 ++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/machine_kexec.c b/arch/arm64/kernel/machin=
e_kexec.c
index 6f121a0..66c7d90 100644
--- a/arch/arm64/kernel/machine_kexec.c
+++ b/arch/arm64/kernel/machine_kexec.c
@@ -24,6 +24,7 @@
 #include <asm/page.h>
 #include <asm/sections.h>
 #include <asm/trans_pgd.h>
+#include <linux/console.h>
=20
 /**
  * kexec_image_info - For debugging output.
@@ -176,6 +177,9 @@ void machine_kexec(struct kimage *kimage)
=20
 	pr_info("Bye!\n");
=20
+	if (IS_ENABLED(CONFIG_PREEMPT_RT) && in_kexec_crash)
+		console_flush_on_panic(CONSOLE_FLUSH_PENDING);
+
 	local_daif_mask();
=20
 	/*
diff --git a/kernel/panic.c b/kernel/panic.c
index 72fcbb5..e0ad0df 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -437,6 +437,8 @@ void vpanic(const char *fmt, va_list args)
 	 */
 	kgdb_panic(buf);
=20
+	printk_legacy_allow_panic_sync();
+
 	/*
 	 * If we have crashed and we have a crash kernel loaded let it handle
 	 * everything else.
@@ -450,8 +452,6 @@ void vpanic(const char *fmt, va_list args)
=20
 	panic_other_cpus_shutdown(_crash_kexec_post_notifiers);
=20
-	printk_legacy_allow_panic_sync();
-
 	/*
 	 * Run any panic handlers, including those that might need to
 	 * add information to the kmsg dump output.
--=20
2.7.4


