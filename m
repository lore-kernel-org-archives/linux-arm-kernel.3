Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D80ECD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 22:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vAB44BGqZ+fuUDNGrRoAE7PFPdrgJUI60GqrOp9DD1k=; b=vInYYq+UlujnaWjs53ZzzCP6dI
	ohr9/K00NYf0RKMKZtrfaQUTmr70y/tR6FP1pXmdWecWzIPngHOHicGVDr99aQq8fVmSGI5nCqh6y
	sacmBft/P4EITvVR4pEPA4dPZ7Dn9Wezhldnm9mPCLKRhoM7hdITC5rGzvdy91EpdfA99Opcs3swV
	PVMn7gL7J0VOJDnHKkXm0UV0I9NcgCGLlfsNyjtAXPSf8Oy0PSfbREYDlig8tR5QG84GOUWzhHWSl
	I0QN5YMMPOleMGMUoDHXwzePVp4JngprYaDSiBjFOrMRNKLOUXzWlloZPOa9eHwWdHO6g4BoV9q9y
	wvOeiesA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPSsr-00000002wZu-0A83;
	Tue, 19 May 2026 22:25:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPSso-00000002wZ1-1f5q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 22:25:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779229547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vAB44BGqZ+fuUDNGrRoAE7PFPdrgJUI60GqrOp9DD1k=;
	b=PukbmEN5i9YisSyy3uwhoK/gMORZ1FKwwpIf3benZA2uAylsaOm8Bl0Z6WFERAvYKyKdEj
	pQL2ty6sYTW2wj+BQzDJGJ1zb+khFmlSUA/rvRE+12d72BK9KwP9s7gKpPk6mhayBy+cYF
	qru/tG04pJ4+cFj0KUR9blrCvSxMA2w=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-459-AzZW7v-RMy2avixHHnyFbw-1; Tue,
 19 May 2026 18:25:42 -0400
X-MC-Unique: AzZW7v-RMy2avixHHnyFbw-1
X-Mimecast-MFC-AGG-ID: AzZW7v-RMy2avixHHnyFbw_1779229540
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DCCCD1956046;
	Tue, 19 May 2026 22:25:39 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.westford.csb (unknown [10.22.65.90])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 04B5519560A2;
	Tue, 19 May 2026 22:25:36 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	Waiman Long <longman@redhat.com>
Subject: [PATCH] arm64/entry: Don't disable preemption in debug_exception_enter() with RT kernel
Date: Tue, 19 May 2026 18:25:24 -0400
Message-ID: <20260519222524.886454-1-longman@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: qGj4UvsTlsFbgpkeT9yQldyDQwbbMNaTvDCmt8E4V7U_1779229540
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_152550_508168_A130E3BE 
X-CRM114-Status: GOOD (  11.94  )
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

Commit d8bb6718c4db ("arm64: Make debug exception handlers visible from
RCU") introduces debug_exception_enter() and debug_exception_exit()
where preemption is explicitly disabled. With a PREEMPT_RT debug kernel,
the following bug report can happen.

  BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48
  in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 15255, name: gdb_app
  preempt_count: 1, expected: 0
  RCU nest depth: 0, expected: 0
  1 lock held by gdb_app/15255:
  #0: ffff10007f41b7d8 (&sighand->siglock){..}-{3:3}, at: force_sig_info_to_task+0x34/0x130
  Preemption disabled at:
  [<ffff800080081ea8>] debug_exception_enter+0x18/0x70
    :
  Call trace:
  dump_backtrace+0xac/0x130
  show_stack+0x1c/0x24
  dump_stack_lvl+0xa0/0xe0
  dump_stack+0x14/0x2c
  __might_resched+0x178/0x230
  rt_spin_lock+0x58/0x120
  force_sig_info_to_task+0x34/0x130
  force_sig_fault+0x58/0x80
  arm64_force_sig_fault+0x44/0x70
  send_user_sigtrap+0x5c/0xa0
  brk_handler+0x38/0x5c
  do_debug_exception+0x78/0x110
  el0_dbg+0x50/0x1e0
  el0t_64_sync_handler+0x114/0x150
  el0t_64_sync+0x17c/0x180

Fix that by blocking the preempt_disable()/preempt_enable_no_resched()
calls when CONFIG_PREEMPT_RT is enabled.

Signed-off-by: Waiman Long <longman@redhat.com>
---
 arch/arm64/kernel/entry-common.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index c7a23f7c2212..191441b22b7c 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -290,15 +290,17 @@ static __always_inline void fpsimd_syscall_exit(void)
 }
 
 /*
- * In debug exception context, we explicitly disable preemption despite
- * having interrupts disabled.
+ * In debug exception context, we explicitly disable preemption except for
+ * PREEMPT_RT kernel as rt_spin_lock() can be called.
+ *
  * This serves two purposes: it makes it much less likely that we would
  * accidentally schedule in exception context and it will force a warning
  * if we somehow manage to schedule by accident.
  */
 static void debug_exception_enter(struct pt_regs *regs)
 {
-	preempt_disable();
+	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
+		preempt_disable();
 
 	/* This code is a bit fragile.  Test it. */
 	RCU_LOCKDEP_WARN(!rcu_is_watching(), "exception_enter didn't work");
@@ -307,7 +309,8 @@ NOKPROBE_SYMBOL(debug_exception_enter);
 
 static void debug_exception_exit(struct pt_regs *regs)
 {
-	preempt_enable_no_resched();
+	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
+		preempt_enable_no_resched();
 }
 NOKPROBE_SYMBOL(debug_exception_exit);
 
-- 
2.54.0


