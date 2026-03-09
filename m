Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D22F3EA855F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 05:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	Content-Type:Content-Transfer-Encoding:Date:Message-ID:In-Reply-To:CC:To:From
	:Subject:Mime-Version:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ruhENHRq3MyvC0eNDlJwB6hgLWsmtwvw7jdAy3CyXEQ=; b=t0caWxHpmuQmxzhr96vn3n994v
	2vJmPwc/lmRYWpsNJsHwc85VBTADHakd+pObsAAUCvdR2UMLhOu/NlD/sBJLDUqNtHyhZCyvazi9L
	+8iloaaxq0dFNsQ2bnN+1cdgZCtN/YfeRe0dVhqV1y2WA6zLB/wBBbUwGe1viij3Zxnr1csOeyaX6
	pL4Sk8xe1ut4VMNV6Z8Xki+Vg/5yR2jGPtgMpZw97sXuTspnc6+s+kI2m9nUYS89utSUzCBH1gOjE
	bBT5bR0VMTVDbU6T2xtQAd6lkJwy5faCXASmhJMyqVfSQVzgq3gqu85UHvQ9RETn1/DvKN69HF9Sh
	IYdGIKxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzTYm-00000006hXR-0xic;
	Mon, 09 Mar 2026 05:53:44 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzTYf-00000006hWe-11by
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 05:53:42 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20260309055329epoutp02edd561f442c4edde6361f10a81fb830d~bFn4bPDPR2462524625epoutp02j
	for <linux-arm-kernel@lists.infradead.org>; Mon,  9 Mar 2026 05:53:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20260309055329epoutp02edd561f442c4edde6361f10a81fb830d~bFn4bPDPR2462524625epoutp02j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1773035609;
	bh=ruhENHRq3MyvC0eNDlJwB6hgLWsmtwvw7jdAy3CyXEQ=;
	h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
	b=nW2BNq5CJ+gPyQWusb/WYHbSpIkljcOkMzdwIcUva/OYipLEq5QLqcOYCDIF45NBr
	 f8/E4F3KsI0Bw58oqvULWmj1cSouChQdpv4vilfbIM6fehjOgY3OfcdmU1yAhSkeoO
	 LUpwNYZCaokhyQjikIIN4GABH7Evd+2/iHsrbxhs=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20260309055328epcas5p35f33f77f135a7d153e4627e3ea58306a~bFn4HJodU0532305323epcas5p3M;
	Mon,  9 Mar 2026 05:53:28 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.41.42]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4fTmQc5mWkz2SSKX; Mon,  9 Mar
	2026 05:53:28 +0000 (GMT)
Mime-Version: 1.0
Subject: RE: [PATCH 1/1] arm: get task_stack reference before dump_backtrace
From: Maninder Singh <maninder1.s@samsung.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
CC: "bigeasy@linutronix.de" <bigeasy@linutronix.de>, "peterz@infradead.org"
	<peterz@infradead.org>, "kees@kernel.org" <kees@kernel.org>,
	"ardb@kernel.org" <ardb@kernel.org>, "keithpac@amazon.com"
	<keithpac@amazon.com>, "linusw@kernel.org" <linusw@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <aa4Lo30Nq_t7qDqK@shell.armlinux.org.uk>
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20260309055328epcms5p56d16f6cb1e3a5295987c935f35be1d2e@epcms5p5>
Date: Mon, 09 Mar 2026 11:23:28 +0530
X-CMS-MailID: 20260309055328epcms5p56d16f6cb1e3a5295987c935f35be1d2e
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CMS-RootMailID: 20260305070534epcas5p378bb22ef9f1a895d7736ed2272c19ec6
References: <aa4Lo30Nq_t7qDqK@shell.armlinux.org.uk>
	<20260305070527.719073-1-maninder1.s@samsung.com>
	<CGME20260305070534epcas5p378bb22ef9f1a895d7736ed2272c19ec6@epcms5p5>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_225337_964972_A009B89D 
X-CRM114-Status: GOOD (  25.61  )
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
Reply-To: maninder1.s@samsung.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

>> With Support of THREAD_INFO_IN_TASK, stack of task can be
>> freed earlier than task (even if task's reference is taken),
>> and it needs separate reference with try_get_task_stack()
>> before using the stack.
>> Otherwise if someone calls show_stack() for task, it can oops
>> the kernel like below: (Tried with normal race of show_stack when
>> task still exists, but its stack is freed)
>
> Looking at x86, it also has THREAD_INFO_IN_TASK, but I see nothing like
> this in show_stack(). How come x86 isn't similarly buggy?

I think x86 also has same issue, some of other architectures which supports
THREAD_INFO_IN_TASK has added try_get_task_stack() in show_stack(), but not *all*

   8   2293  arch/powerpc/kernel/process.c <<show_stack>>
             if (!try_get_task_stack(tsk))

   4    488  arch/arm64/kernel/stacktrace.c <<dump_backtrace>>
             if (!try_get_task_stack(tsk))


>> 
>> ...
>
>"otherwise if someone calls show_stack() for task" ... and the stack
>trace given stops at show_stack() and doesn't show the "someone".
>
>I'd like to know _how_ this happens, and why ARM64 and now 32-bit ARM
>are different from x86.

I tried to simulate same thing on x86_64, it is also crashing.

Just a dummy code to save task_struct to reproduce the race:

+       rcu_read_lock();
+       for_each_process(p) {
+               if (!strcmp(p->comm, "sleep")) {
+                       check_task = p;
+                       get_task_struct(p);
+                       pr_emerg("get done for %s %d\n", p->comm, p->pid);
+               }
+       }
+       rcu_read_unlock();

// in mean time here sleep binary will be exited.

+       show_stack(check_task,  NULL, KERN_EMERG);

//OOPs

/ # cat /proc/meminfo
[   49.885891] Call Trace:
[   49.887151] BUG: unable to handle page fault for address: ffffb57400213de8
[   49.887563] #PF: supervisor read access in kernel mode
[   49.887737] #PF: error_code(0x0000) - not-present page
[   49.887999] PGD 1000067 P4D 1000067 PUD 113b067 PMD 1bcb067 PTE 0
[   49.888588] Oops: Oops: 0000 [#1] SMP NOPTI
[   49.889329] CPU: 0 UID: 0 PID: 68 Comm: cat Not tainted 7.0.0-rc2-next-20260302-00003-gb7e059f3a5ae-dirty #49 PREEMPT(lazy)
[   49.889789] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1 04/01/2014
[   49.890204] RIP: 0010:__unwind_start+0x118/0x1c0
[   49.890471] Code: 75 28 48 8d b8 ff 0f 00 00 48 81 e7 00 f0 ff ff e8 ed ce fb ff 85 c0 75 ae eb 9c 48 8b 86 08 0c 00 00 48 8d 78 38 48 89 7d 48 <48> 8b 50 28 48 89 55 50 48 8b 4c
[   49.891163] RSP: 0018:ffffb57400207b00 EFLAGS: 00000246
[   49.891385] RAX: ffffb57400213dc0 RBX: ffffb57400213dc0 RCX: 0000000000000000
[   49.891615] RDX: 0000000000000000 RSI: ffff99ec41b6cc40 RDI: ffffb57400213df8
[   49.891867] RBP: ffffb57400207b68 R08: ffffffffae53e908 R09: 00000000ffffdfff
[   49.892101] R10: ffffffffae45e920 R11: ffffffffae50e920 R12: 0000000000000000
[   49.892332] R13: ffff99ec41b6f298 R14: ffffb57400207b68 R15: ffffffffae24615e
[   49.892670] FS:  00000000081ed3c0(0000) GS:ffff99ec9887b000(0000) knlGS:0000000000000000
[   49.892950] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   49.893147] CR2: ffffb57400213de8 CR3: 0000000001d2d000 CR4: 00000000000006f0
[   49.893485] Call Trace:
[   49.893700]  <TASK>
[   49.893810]  __show_trace_log_lvl+0x31f/0x360
[   49.893988]  ? mas_store_prealloc+0x99/0x2c0
[   49.894169]  meminfo_proc_show+0xdd/0x9a0
[   49.894312]  ? seq_open+0x3b/0x60
[   49.894435]  ? __pfx_meminfo_proc_show+0x10/0x10
[   49.894568]  ? file_ra_state_init+0x10/0x30
[   49.894731]  ? __pte_offset_map+0x16/0xd0
[   49.894871]  ? seq_read_iter+0x38e/0x4b0
[   49.895004]  seq_read_iter+0x109/0x4b0
[   49.895125]  copy_splice_read+0x18f/0x330
[   49.895272]  splice_direct_to_actor+0xb4/0x250
[   49.895420]  ? __pfx_direct_splice_actor+0x10/0x10
[   49.895582]  do_splice_direct+0x71/0xb0
[   49.895730]  ? __pfx_direct_file_splice_eof+0x10/0x10
[   49.895908]  do_sendfile+0x361/0x420
[   49.896049]  do_syscall_64+0xf1/0x520
[   49.896197]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   49.896375] RIP: 0033:0x4a8d3e
[   49.896634] Code: c3 0f 1f 00 4c 89 d2 4c 89 c6 e9 fd fd ff ff 0f 1f 44 00 00 31 c0 c3 0f 1f 44 00 00 f3 0f 1e fa 49 89 ca b8 28 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c8
[   49.897221] RSP: 002b:00007ffe75342478 EFLAGS: 00000246 ORIG_RAX: 0000000000000028
[   49.897486] RAX: ffffffffffffffda RBX: 0000000001000000 RCX: 00000000004a8d3e
[   49.897747] RDX: 0000000000000000 RSI: 0000000000000003 RDI: 0000000000000001
[   49.897977] RBP: 0000000000000003 R08: 0000000000000001 R09: 0000000000000000
[   49.898221] R10: 0000000001000000 R11: 0000000000000246 R12: 0000000000000003
[   49.898489] R13: 0000000000000001 R14: 0000000000000000 R15: 0000000000000001
[   49.898764]  </TASK>
[   49.898898] Modules linked in:
[   49.899259] CR2: ffffb57400213de8
[   49.899762] ---[ end trace 0000000000000000 ]---
[   49.900187] RIP: 0010:__unwind_start+0x118/0x1c0
[   49.900391] Code: 75 28 48 8d b8 ff 0f 00 00 48 81 e7 00 f0 ff ff e8 ed ce fb ff 85 c0 75 ae eb 9c 48 8b 86 08 0c 00 00 48 8d 78 38 48 89 7d 48 <48> 8b 50 28 48 89 55 50 48 8b 4c
[   49.901001] RSP: 0018:ffffb57400207b00 EFLAGS: 00000246
[   49.901188] RAX: ffffb57400213dc0 RBX: ffffb57400213dc0 RCX: 0000000000000000
[   49.901431] RDX: 0000000000000000 RSI: ffff99ec41b6cc40 RDI: ffffb57400213df8
[   49.901680] RBP: ffffb57400207b68 R08: ffffffffae53e908 R09: 00000000ffffdfff
[   49.901918] R10: ffffffffae45e920 R11: ffffffffae50e920 R12: 0000000000000000
[   49.902182] R13: ffff99ec41b6f298 R14: ffffb57400207b68 R15: ffffffffae24615e
[   49.902417] FS:  00000000081ed3c0(0000) GS:ffff99ec9887b000(0000) knlGS:0000000000000000
[   49.902694] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   49.902896] CR2: ffffb57400213de8 CR3: 0000000001d2d000 CR4: 00000000000006f0


So It has to be same way for all archs, as mentioned in Help of THREAD_INFO_IN_TASK

config THREAD_INFO_IN_TASK
        bool
        help
          Select this to move thread_info off the stack into task_struct.  To
          make this work, an arch will need to remove all thread_info fields
          except flags and fix any runtime bugs.

          One subtle change that will be needed is to use try_get_task_stack()
          and put_task_stack() in save_thread_stack_tsk() and save_thread_stack_tsk().

alongwith save_thread_stack_tsk and save_thread_stack_tsk, same thing shall be done for show_stack also.

Thanks & Regards,
Maninder Singh

