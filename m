Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E319EEF30C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 07:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=G1nKJVAd8ykMh/lRoa5dFXntTG851gTRqMr2+jBpdAc=; b=y7gPh2xZPFEkVPAOXI9lQmUG2J
	Ou6lsE8c8I//YFIUq74J376iD6hoBiJ8oPgt9aqeMAu23T67QnEcXo2lZ69rGBZzpgVLEeEfAe5nN
	/0oa7yTTknzpP6SCi/o3WlMIAC2k+J9QTFUC36WE7/yTGUbdBX1FjX+7qK4isaK6yCWNhfd7Xo8oR
	Mq8KtXilDxX5uycYXIbn/p4QtQGbN288qo9cN8rPW4ltd5vwjAs/p/nbB4dxFBZPoRHO1+Q7VF89o
	iJ3AXtUqVEEh0zRd/SbR8/7Ktan4LFIvMGxF0EGN28E7fsyYJYg96XytvAZQ0AR9pS8J4Yge25oo5
	MV55Trbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy2mK-000000013qk-2JJQ;
	Thu, 05 Mar 2026 07:05:48 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy2mG-000000013qM-3KKk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 07:05:47 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260305070535epoutp0385810976fd8f26ac2afcd5b9bea87f16~Z4BsVilZw0159501595epoutp03M
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Mar 2026 07:05:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260305070535epoutp0385810976fd8f26ac2afcd5b9bea87f16~Z4BsVilZw0159501595epoutp03M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1772694335;
	bh=G1nKJVAd8ykMh/lRoa5dFXntTG851gTRqMr2+jBpdAc=;
	h=From:To:Cc:Subject:Date:References:From;
	b=fRnX9K0zyEuaZa5TFWQGQtn8USef/UfA9bHV06j/i4tR82N70eT1bwWV9O3U22Mcl
	 ziNnDRq3eaP4V/6dqv1NCj9vrDj+iSYSXNsn9BeMTjAmST7KyyYxDgFvYnpnXotSQN
	 kJnWCxyM+M31XzUCQP2OzmqsjPp2LyL2QmBQ1Vms=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20260305070534epcas5p38fe398fcd583a2269523f0e1ee873e0c~Z4BrzXOvA0513005130epcas5p39;
	Thu,  5 Mar 2026 07:05:34 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.41.42]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4fRLCf4nZhz6B9m9; Thu,  5 Mar
	2026 07:05:34 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20260305070534epcas5p378bb22ef9f1a895d7736ed2272c19ec6~Z4BrlV65x0512105121epcas5p3E;
	Thu,  5 Mar 2026 07:05:34 +0000 (GMT)
Received: from localhost.localdomain (unknown [107.97.243.203]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260305070532epsmtip1003b8c1a79ea3652af5c2e5e8ee423e5~Z4Bpyn1L72807728077epsmtip1Q;
	Thu,  5 Mar 2026 07:05:32 +0000 (GMT)
From: Maninder Singh <maninder1.s@samsung.com>
To: linux@armlinux.org.uk, rmk+kernel@armlinux.org.uk,
	bigeasy@linutronix.de, peterz@infradead.org, kees@kernel.org,
	ardb@kernel.org, keithpac@amazon.com, linusw@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Maninder Singh <maninder1.s@samsung.com>
Subject: [PATCH 1/1] arm: get task_stack reference before dump_backtrace
Date: Thu,  5 Mar 2026 12:35:27 +0530
Message-Id: <20260305070527.719073-1-maninder1.s@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260305070534epcas5p378bb22ef9f1a895d7736ed2272c19ec6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CMS-RootMailID: 20260305070534epcas5p378bb22ef9f1a895d7736ed2272c19ec6
References: <CGME20260305070534epcas5p378bb22ef9f1a895d7736ed2272c19ec6@epcas5p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_230545_471048_112BA93F 
X-CRM114-Status: GOOD (  16.60  )
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

With Support of THREAD_INFO_IN_TASK, stack of task can be
freed earlier than task (even if task's reference is taken),
and it needs separate reference with try_get_task_stack()
before using the stack.
Otherwise if someone calls show_stack() for task, it can oops
the kernel like below: (Tried with normal race of show_stack when
task still exists, but its stack is freed)

8<--- cut here ---
Unable to handle kernel paging request at virtual address f8aebec4 when read
[f8aebec4] *pgd=83c2c811, *pte=00000000, *ppte=00000000
Internal error: Oops: 7 [#1] SMP ARM
..
CPU: 0 UID: 0 PID: 70 Comm: cat Not tainted 7.0.0-rc2-next-20260302+ #26 VOLUNTARY
..
PC is at __read_once_word_nocheck+0x0/0x8
LR is at unwind_frame+0x6b0/0xa90
...
Call trace:
 __read_once_word_nocheck from unwind_frame+0x6b0/0xa90
 unwind_frame from unwind_backtrace+0x178/0x1e0
 unwind_backtrace from show_stack+0x10/0x14
...

ARM64 also takes care of it in dump_backtrace(), so same logic
is added for ARM also.

Fixes: 18ed1c01a7dd ("ARM: smp: Enable THREAD_INFO_IN_TASK")
Signed-off-by: Maninder Singh <maninder1.s@samsung.com>
---
 arch/arm/kernel/traps.c  |  9 +++++++--
 arch/arm/kernel/unwind.c | 10 ++++++++--
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/arch/arm/kernel/traps.c b/arch/arm/kernel/traps.c
index afbd2ebe5c39..770dcb1dc683 100644
--- a/arch/arm/kernel/traps.c
+++ b/arch/arm/kernel/traps.c
@@ -221,11 +221,14 @@ void dump_backtrace(struct pt_regs *regs, struct task_struct *tsk,
 	unsigned int fp, mode;
 	int ok = 1;
 
-	printk("%sCall trace: ", loglvl);
-
 	if (!tsk)
 		tsk = current;
 
+	if (!try_get_task_stack(tsk))
+		return;
+
+	printk("%sCall trace: ", loglvl);
+
 	if (regs) {
 		fp = frame_pointer(regs);
 		mode = processor_mode(regs);
@@ -249,6 +252,8 @@ void dump_backtrace(struct pt_regs *regs, struct task_struct *tsk,
 
 	if (ok)
 		c_backtrace(fp, mode, loglvl);
+
+	put_task_stack(tsk);
 }
 #endif
 
diff --git a/arch/arm/kernel/unwind.c b/arch/arm/kernel/unwind.c
index c91cb0e1585e..990692714288 100644
--- a/arch/arm/kernel/unwind.c
+++ b/arch/arm/kernel/unwind.c
@@ -29,6 +29,7 @@
 #include <linux/spinlock.h>
 #include <linux/list.h>
 #include <linux/module.h>
+#include <linux/sched/task_stack.h>
 
 #include <asm/stacktrace.h>
 #include <asm/traps.h>
@@ -524,13 +525,16 @@ void unwind_backtrace(struct pt_regs *regs, struct task_struct *tsk,
 {
 	struct stackframe frame;
 
-	printk("%sCall trace: ", loglvl);
-
 	pr_debug("%s(regs = %p tsk = %p)\n", __func__, regs, tsk);
 
 	if (!tsk)
 		tsk = current;
 
+	if (!try_get_task_stack(tsk))
+		return;
+
+	printk("%sCall trace: ", loglvl);
+
 	if (regs) {
 		arm_get_current_stackframe(regs, &frame);
 		/* PC might be corrupted, use LR in that case. */
@@ -567,6 +571,8 @@ void unwind_backtrace(struct pt_regs *regs, struct task_struct *tsk,
 			break;
 		dump_backtrace_entry(where, frame.pc, frame.sp - 4, loglvl);
 	}
+
+	put_task_stack(tsk);
 }
 
 struct unwind_table *unwind_table_add(unsigned long start, unsigned long size,
-- 
2.34.1


