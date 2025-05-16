Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF6FC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 12:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8CPMdQhFzMswE5n/+ZdMvVgngFjzv6kNMgzS9jOPIaM=; b=u18fCTqBLa9WeCnM9SHE7wwX3L
	GfWeRVYl+Cpogl1+g9M9Fc3pRjRwocN/NGClv/jOMwxRBrkDKrZHjdaPAH6eYUovLPyI0aS7UfHGo
	LDhGKbL+l55Eoin+PZPxLRzUmXamRKFqKFYFzxoJGfNDqeo9QGJ6yyy1lqEpkW4kQfpVmprVe2wQF
	x8ujFTOE16pPTJCLaNG11rE1t/JOc/BY6SY92PXdlk+Z4U9FJdpjbb4awaI0qk5AnSCksiFQJWqzA
	WORL17AwRLKL64msiax8LIM/19FTPFLDeu2YzfA6ba2WIXW7xHust2iJo7SmPD71yC8MV5cE/KU8M
	ZAJ4KR8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFtkF-00000003KDX-0588;
	Fri, 16 May 2025 12:00:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFtgg-00000003Jke-2gJV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 11:57:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747396632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8CPMdQhFzMswE5n/+ZdMvVgngFjzv6kNMgzS9jOPIaM=;
	b=NsvHqooRGTB7KPfMcIBMDV++Zej7exNl1st58m6IgGBm075O3dMBE0OTQF03CPBPlJyHFG
	Dq1l2eZFgew/vW3K1eCFz1vFgF75BDlw8syQj1oumHFx5by7VSUK9iajuHKJvIo4WiVyJc
	UTLjmer+6OHx8kJnefWzUo1Aml3chbM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-84-rwiwR32HMVeX7iPqHAxl7A-1; Fri,
 16 May 2025 07:57:09 -0400
X-MC-Unique: rwiwR32HMVeX7iPqHAxl7A-1
X-Mimecast-MFC-AGG-ID: rwiwR32HMVeX7iPqHAxl7A_1747396628
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B842C19560AE;
	Fri, 16 May 2025 11:57:07 +0000 (UTC)
Received: from localhost (unknown [10.22.64.127])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 067C11800268;
	Fri, 16 May 2025 11:57:06 +0000 (UTC)
Date: Fri, 16 May 2025 08:57:05 -0300
From: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH v2 00/11] arm64: debug: remove hook registration, split
 exception entry
Message-ID: <aCcoEc-URtvk5w7P@uudg.org>
References: <20250512174326.133905-1-ada.coupriediaz@arm.com>
 <aCM6KOHu2i0NqaBC@uudg.org>
 <068c3ea3-2de3-4e5e-99c1-09a9668b80da@arm.com>
MIME-Version: 1.0
In-Reply-To: <068c3ea3-2de3-4e5e-99c1-09a9668b80da@arm.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZHXnvd6_CqGNw47k54AQmU4xia1fkbUp3Y1_VX7SlYA_1747396628
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_045714_748088_562737A7 
X-CRM114-Status: GOOD (  39.39  )
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

On Tue, May 13, 2025 at 04:19:26PM +0100, Ada Couprie Diaz wrote:
> Re-sending with proper text format, apologies for the noise...
> 
> On 13/05/2025 13:25, Luis Claudio R. Goncalves wrote:
> 
> > On Mon, May 12, 2025 at 06:43:15PM +0100, Ada Couprie Diaz wrote:
> > > [...]
> > > 
> > > Single Step Exception
> > > ===
...
> Hi Luis,
> 
> Thanks for taking the time to test, I'm glad it seems OK for now.
> > Is there any specific test you would like me to run on that test setup I
> > have?
> 
> There are a couple of edge-cases that might be problematic if my conclusions
> are wrong : 1. Race between a step exception being taken, and the related
> hardware breakpoint/watchpoint being removed 2. Migration of a task stepping
> a CPU-bound breakpoint/watchpoint
> 
> I have been stress testing them on an AMD Seattle board with 4 cores, but
> more extensive testing is always welcome.
> 
> I'll describe my testing below, but it is a bit messy and might be unclear,
> my apologies.
> 
> I have been using the following very rough program (compiled with -O0) :
> 
...
> 
> Which runs continuously, repeatedly changing a fixed addressed, so that a
> hardware watchpoint can be set externally via perf and be CPU-bound :
> 
> 	perf stat -C $CPU -emem:0x6000000000/8:w
> 
> 
> So to test 1. I run perf in a loop, with --timeout 10 so that it
> adds/removes the watchpoint repeatedly, one for each CPU.
> 
> 	while true; do perf stat --timeout 10 -C $CPU -emem:0x6000000000/8:w ; done
> 
> 
> My machine has 4 hardware watchpoints, so I can cover all cores and see that
> the counts are consistent, even if the target task switches cores.
> (It is never 0 on all cores, no errors are produced, it is consistent with
> the count when perf is ran on all-cores rather than core-by-core (-a) or
> with the task PID (-p) )
> 
> To test 2. I again set one perf monitor per CPU, this time without timeout,
> and then load the system to try to force preemption (with ssdd for example),
> similarly waiting for inconsistencies, errors, or the count stopping.
> 
> However, this might be more difficult if the number of cores is much greater
> than the number of hardware watchpoints.
> For 1. the task could be pinned to a core, but for 2. the task could be
> limited to as many cores as the system has hardware watchpoints.

I ran the two tests you listed above, along with some variations just to
make sure I got the details right, and all those tests completed flawlessly
on both machines, on the 4 kernel configurations I tests (all with
PREEMPT_RT enabled, with and without LOCKDEP and assorted debug features).

> Hopefully that makes sense, but I understand it's a bit involved.
> 
...
> > > Testing examples
> > > ===
> > > 
> > > Perf (for EL1):
> > > ~~~
> > > Assuming that `perf` is on your $PATH and building with `kallsyms`
> > > 
> > >    #!/bin/bash
> > >    watch_addr=$(sudo cat /proc/kallsyms | grep "D jiffies$" | cut -f1 -d\  )
> > >    break_addr=$(sudo cat /proc/kallsyms | grep "clock_nanosleep$" | cut -f1 -d\  )
> > >    cmd="sleep 0.01"
> > >    sudo perf stat -a -e mem:0x${watch_addr}/8:w -e mem:0x${break_addr}:x ${cmd}
> > > 
> > > NB: This does /not/ test EL1 BRKs.
> > > 
> > > 
> > > GDB commands (for EL0):
> > > ~~~
> > > The following C example, compiled with `-g -O0`
> > > 
> > >    int main() {
> > >            int add = 0xAA;
> > >            int target = 0;
> > > 
> > >            target += add;
> > > 
> > >    #ifdef COMPAT
> > >        __asm__("BKPT");
> > >    #else
> > >        __asm__("BRK 1");
> > >    #endif
> > >            return target;
> > >    }
> > > 
> > > Combined with the following GDB command-list
> > > 
> > >    start
> > >    hbreak 3
> > >    watch target
> > >    commands 2
> > >    continue
> > >    end
> > >    commands 3
> > >    continue
> > >    end
> > >    continue
> > >    jump 11
> > >    continue
> > >    quit
> > > 
> > > Executed as such : `gdb -x ${COMMAND_LIST_FILE} ./a.out`
> > > should go through the whole program, return 0252/170/0xAA, and
> > > exercise all EL0 debug exception entries.

This is the only test where I (consistently) hit backtraces. If I run the
test with "gdb -x ${COMMAND_LIST_FILE} ..." I get a single backtrace, every
time:

[  263.890424] BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48
[  263.890444] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 5744, name: gdb_prog1
[  263.890445] preempt_count: 1, expected: 0
[  263.890446] RCU nest depth: 0, expected: 0
[  263.890447] 1 lock held by gdb_prog1/5744:
[  263.890448]  #0: ffff100028496f58 (&sighand->siglock){+.+.}-{3:3}, at: force_sig_info_to_task+0x30/0x150
[  263.890468] Preemption disabled at:
[  263.890469] [<ffff8000800391a8>] debug_exception_enter+0x18/0x78
[  263.890484] CPU: 114 UID: 0 PID: 5744 Comm: gdb_prog1 Tainted: G        W           6.15.0-rc6-rt1__dbg #2 PREEMPT_{RT,(lazy)}
[  263.890487] Tainted: [W]=WARN
[  263.890488] Hardware name: Supermicro ARS-221GL-NR-01/G1SMH, BIOS 2.0 07/12/2024
[  263.890490] Call trace:
[  263.890492]  show_stack+0x30/0x88 (C)
[  263.890495]  dump_stack_lvl+0xa0/0xe0
[  263.890498]  dump_stack+0x14/0x2c
[  263.890499]  __might_resched+0x170/0x240
[  263.890506]  rt_spin_lock+0x6c/0x1a0
[  263.890512]  force_sig_info_to_task+0x30/0x150
[  263.890513]  force_sig_fault+0x68/0xa0
[  263.890515]  arm64_force_sig_fault+0x44/0x80
[  263.890518]  send_user_sigtrap+0x60/0xa8
[  263.890520]  do_brk64+0x40/0x88
[  263.890522]  el0_brk64+0x50/0x1c0
[  263.890526]  el0t_64_sync_handler+0x60/0xe0
[  263.890528]  el0t_64_sync+0x184/0x188

Quite similar to the problem originally reported, where sending signals
with preemption disabled could trigger the "rtlock_might_resched();" check
if CONFIG_DEBUG_ATOMIC_SLEEP is enabled.

If I call gdb and run manually the sequence of commands you described, I
get the backtrace above three times. The only difference is that on the
second backtrace I get these extra elements on the header:

  [48052.129422] RCU nest depth: 1, expected: 1
  [48052.129424] 2 locks held by gdb_prog1/27451:
  [48052.129425]  #0: ffff8000828315c8 (rcu_read_lock){....}-{1:3}, at: breakpoint_handler+0xd8/0x318
  [48052.129439]  #1: ffff00008abd92d8 (&sighand->siglock){+.+.}-{3:3}, at: force_sig_info_to_task+0x30/0x150

So, when I enter manually the GDB command you suggested, the result is:

    start           <--- Backtrace#1:   preempt_count: 1
    hbreak 3
    watch target
    commands 2
    continue
    end
    commands 3
    continue
    end
    continue        <--- Backtrace#2:   preempt_count: 1   RCU nest depth: 1
    jump 11         <--- Backtrace#3:   preempt_count: 1
    continue
    quit

I hope this report is helpful.

IMHO, even with these backtraces, there was a considerable enhancement when
compared to the original scenario we reported.

Best regards,
Luis

> > > By using a cross-compiler and passing and additional `-DCOMPAT` argument
> > > during compilation, the `BKPT32` path can also be tested.
> > > NOTE: `BKPT` *will* make GDB loop infinitely, that is expected. Sending
> > > SIGINT to GDB will break the loop and the execution should complete.
> > > 
> > > [...]
> 
---end quoted text---


