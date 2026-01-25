Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 677A5E63CAD
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 16:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bl6Fy3qkKjqqNdMdshjjsUDfUOfp45YX0OWM4M+0XLI=; b=ATxCA+Gbs58MvPiifyd5L8hSbY
	HqK4H3cLNz+8H+9jF3GKIKJiZN/KBGy84nfwNTrnFQgFbNRDTdvmMhjYHdCanCwQyEOFCgr7XoNE5
	HB702IyejATTa4LcIr3jLO4BXjtFzIQ4z1S8ENNk/Hx7VqhODkJZJndsQhpnr2eD0std7+fSUDDWZ
	U5oFBrr5KZoQmnS/UvA8zR0VAV385+rorFIHwDfSkigu4F+jPloAeAVutdwLZ0/XXgPaYRdbdPjmB
	TTzcXCDShnd18X7+rXvclFnrelaNW5HJyLjnSN10dumNoGDCt6A66WpoZyOIkCf1GhraP5XrbDu87
	8b8YBMZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk3Ar-0000000BK4Q-1Q9B;
	Sun, 25 Jan 2026 16:41:17 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk3Ao-0000000BK3F-1QnH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Jan 2026 16:41:15 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2a09d981507so25111515ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Jan 2026 08:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769359273; x=1769964073; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bl6Fy3qkKjqqNdMdshjjsUDfUOfp45YX0OWM4M+0XLI=;
        b=FjZ6aSVvk7N0f8l3eEaGyTPd9ZbfRb2OPvlaoetgXxI+tvflWuduSZvbO7xZuBjKPE
         4fh7TddaXevuvtQPt5UKmHVLyIUN6YN41HbJvrAtnAv5RV4WIMRUdmM2xhG5DJH8ejQ2
         e433129WVkDWGAxBrURlbnKYF8VasbtW6PDAVfRedSRhIb/cbEsZP2Pq5JyO9DBC0Yte
         kmkoJpOeoIqyv9kNPAC0ow5LMwN2HL7SClGAZsXnw83AJmFF73Jiyej295I0Am06sDNR
         0eH1a6b829jyP5oMSgdjUyVWtxpjxT3YIL32rdXPBcjG+AQNE98/O6/UmsLxZ4QN2sMP
         1flQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769359273; x=1769964073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bl6Fy3qkKjqqNdMdshjjsUDfUOfp45YX0OWM4M+0XLI=;
        b=UwnUkQ+MddDDCVRGu+F7xDl79ldm/NgANFmvlig8FiHvcwfGpWTM66Jm2YuHC+0yvt
         Pk2Qj7BI+byFoBDP0B97CXSJFDtAZENKOEC4qnhuMN+SokGVorsngFKZlzu5rkw/OoSq
         PYqEH+9b40fJN7o0SpbviicDsJ4j58R4Z4TovvCTmWFM8qX/czbrD9dCvZWThUYWzTM0
         AN81sZeKADgA8CAmM/S/b4QD7uPJvziDdqtA2WdKhn5L/a6LJK67/Dhy3Txdq+6c1tq5
         uT2JoiJPIKAABPhvYSzngsJpf7TaAAQNmrTyyBcwavYkQnyyhPx/OF6NghqhRmz4HUwU
         vlfg==
X-Gm-Message-State: AOJu0YxFQ0F55KTQjkrZuF4C1NazauSs9xy3H7RPf3xT2siqaaD9CAyz
	aX7Mm1kH4jDDAO2UoYL8y9JBQRew5Bw+g1yIq5teusGA3VFCuypBoVP9
X-Gm-Gg: AZuq6aLDZNKNDxNa5yXz9LjRAbEAWCvkhDLOAigW4lzXZ7tAts5HoIMEpQt+F51PJ9O
	xjIXrZtwmztdjx/eNEvwk4bbKItdzAb0hD0xTy9WXp89/atbqTsVpCdh0MV8/folPj1HfyI3Xzd
	KNF8dUKV5IaoqUpTHokMPx1PpyDJlbRBS+OVkHqwEl2vkbpqWNqVfMq8QfA7X3hKZB6iJLBO92N
	qO7OnPbGxvsG0Hxebl2krK1CPDUCuGz0gWsjssL11ncJ+2JFtTD5do7aOX8gTbJDn5Qx771p3Oe
	90xzm4xsbx5QETI1fJXKqiis3ZJnSIDBH7CCNmZS74n0sKnxrCC5TmEf4IxJCdFUZn+0LRrDFz/
	bk/2bfIiHZakpkRiA6Nr/dmdmJ/pFLysN3p34K5TLBliA/A1HZn20M/e4SQGV5AyKy6aWOMMm3l
	Ya0W5eIItKxdxU+NnNRu6Y/m6R/1qrSEo=
X-Received: by 2002:a17:903:1cb:b0:2a7:77cd:2fef with SMTP id d9443c01a7336-2a845586aa7mr16454465ad.19.1769359273331;
        Sun, 25 Jan 2026 08:41:13 -0800 (PST)
Received: from DESKTOP-3LEPQG8.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802f97667sm70633225ad.56.2026.01.25.08.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 08:41:12 -0800 (PST)
From: Xie Yuanbin <qq570070308@gmail.com>
To: linux@armlinux.org.uk,
	johannes@sipsolutions.net,
	masahiroy@kernel.org,
	jgross@suse.com,
	nsc@kernel.org,
	kees@kernel.org,
	tglx@kernel.org,
	mingo@kernel.org,
	frederic@kernel.org,
	paulmck@kernel.org,
	peterz@infradead.org,
	mathieu.desnoyers@efficios.com,
	luto@kernel.org,
	edumazet@google.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xie Yuanbin <qq570070308@gmail.com>
Subject: [PATCH 3/9] ARM: entry: fix wrong lockdep hardirqs state
Date: Mon, 26 Jan 2026 00:40:10 +0800
Message-ID: <20260125164016.331257-4-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260125164016.331257-1-qq570070308@gmail.com>
References: <20260125164016.331257-1-qq570070308@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_084114_382728_4B5C4A10 
X-CRM114-Status: GOOD (  15.75  )
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

When CONFIG_PROVE_LOCKING=y, CONFIG_TRACE_IRQFLAGS=y, CONFIG_NO_HZ_FULL=y,
and nohz_full is correctly enabled, if a user program returns to user mode
on the nohz_full CPUs, the following WARNING will be triggered:
```log
[    4.763050] ------------[ cut here ]------------
[    4.763244] WARNING: kernel/context_tracking.c:450 at __ct_user_enter+0x180/0x184, CPU#0: bash/1
[    4.764815] Modules linked in:
[    4.765386] CPU: 0 UID: 0 PID: 1 Comm: bash Not tainted 6.19.0-rc6-next-20260123 #1 VOLUNTARY
[    4.765761] Hardware name: Generic DT based system
[    4.766105] Call trace:
[    4.766151]  unwind_backtrace from show_stack+0x10/0x14
[    4.766686]  show_stack from dump_stack_lvl+0x68/0x80
[    4.766919]  dump_stack_lvl from __warn+0xf0/0x270
[    4.767140]  __warn from warn_slowpath_fmt+0xc0/0x194
[    4.767542]  warn_slowpath_fmt from __ct_user_enter+0x180/0x184
[    4.767792]  __ct_user_enter from user_enter_callable+0x64/0x6c
[    4.768105]  user_enter_callable from no_work_pending+0x8/0x4c
[    4.768415] Exception stack(0xf0849fb0 to 0xf0849ff8)
[    4.768816] 9fa0:                                     00000000 00000000 00000000 00000000
[    4.769060] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    4.769335] 9fe0: 00000000 beaf2ef0 00000000 b6f10dec 00000010 00000000
[    4.769669] irq event stamp: 211021
[    4.770932] hardirqs last  enabled at (211021): [<c0300114>] no_work_pending+0x4/0x4c
[    4.771687] hardirqs last disabled at (211020): [<c032a064>] do_work_pending+0x48/0xa4
[    4.772290] softirqs last  enabled at (210994): [<c0371354>] handle_softirqs+0x434/0x4dc
[    4.772902] softirqs last disabled at (210987): [<c0371654>] __irq_exit_rcu+0xd0/0x204
[    4.773359] ---[ end trace 0000000000000000 ]---
```

In ret_to_user() and ret_fast_syscall(), disable_irq_notrace() is called,
which skips trace_hardirqs_off(). On the other hand,
asm_trace_hardirqs_on() is called prematurely before user_enter(). This
causes lockdep's hardirqs to be recorded as enabled when user_enter() is
called, even if interrupts are disabled.

1. Do not skip the tracing when enabling/disabling interrupts before
returning to user mode, just like what other architectures do.
2. Call asm_trace_hardirqs_on() after user_enter().

Fixes: b04db8e19fc2 ("rcu: Use lockdep to assert IRQs are disabled/enabled")

Signed-off-by: Xie Yuanbin <qq570070308@gmail.com>
---
 arch/arm/kernel/entry-common.S | 14 ++++++--------
 arch/arm/kernel/signal.c       |  7 +------
 2 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index f579770fab71..0e462bbede2f 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -71,7 +71,7 @@ __ret_fast_syscall:
 	mov	r0, sp				@ 'regs'
 	bl	do_rseq_syscall
 #endif
-	disable_irq_notrace			@ disable interrupts
+	disable_irq save = 0			@ disable interrupts
 	ldr	r1, [tsk, #TI_FLAGS]		@ re-check for syscall tracing
 	movs	r1, r1, lsl #16
 	beq	no_work_pending
@@ -97,30 +97,28 @@ ENDPROC(ret_fast_syscall)
 
 /*
  * "slow" syscall return path.  "why" tells us if this was a real syscall.
- * IRQs may be enabled here, so always disable them.  Note that we use the
- * "notrace" version to avoid calling into the tracing code unnecessarily.
- * do_work_pending() will update this state if necessary.
+ * IRQs may be enabled here, so always disable them.
  */
 ENTRY(ret_to_user)
 ret_slow_syscall:
 #if IS_ENABLED(CONFIG_DEBUG_RSEQ)
 	/* do_rseq_syscall needs interrupts enabled. */
-	enable_irq_notrace			@ enable interrupts
+	enable_irq save = 0			@ enable interrupts
 	mov	r0, sp				@ 'regs'
 	bl	do_rseq_syscall
 #endif
-	disable_irq_notrace			@ disable interrupts
+	disable_irq save = 0			@ disable interrupts
 ENTRY(ret_to_user_from_irq)
 	ldr	r1, [tsk, #TI_FLAGS]
 	movs	r1, r1, lsl #16
 	bne	slow_work_pending
 no_work_pending:
-	asm_trace_hardirqs_on save = 0
-
 #ifdef CONFIG_CONTEXT_TRACKING_USER
 	bl	user_enter_callable
 #endif
 
+	asm_trace_hardirqs_on save = 0
+
 #ifdef CONFIG_KSTACK_ERASE
 	bl	stackleak_erase_on_task_stack
 #endif
diff --git a/arch/arm/kernel/signal.c b/arch/arm/kernel/signal.c
index 79a6730fa0eb..93e0a7637c81 100644
--- a/arch/arm/kernel/signal.c
+++ b/arch/arm/kernel/signal.c
@@ -601,12 +601,7 @@ static int do_signal(struct pt_regs *regs, int syscall)
 asmlinkage int
 do_work_pending(struct pt_regs *regs, unsigned int thread_flags, int syscall)
 {
-	/*
-	 * The assembly code enters us with IRQs off, but it hasn't
-	 * informed the tracing code of that for efficiency reasons.
-	 * Update the trace code with the current status.
-	 */
-	trace_hardirqs_off();
+	/* The assembly code enters us with IRQs off. */
 	do {
 		if (likely(thread_flags & _TIF_NEED_RESCHED)) {
 			schedule();
-- 
2.51.0


