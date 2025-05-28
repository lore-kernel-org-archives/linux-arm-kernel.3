Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B624C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 10:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=umPgGolI9JpgcSwcDb2YRnvBQFwC30dhCFEIIdk4Pnk=; b=EctgocPYxuyXND
	taID2mLLhO7zjo/b/yivG3i08F/WxlknZ0ZQDs46g+SH05YyQZUKLewW8kKSlr3B6iMBlbtUevZak
	oYLk7+6PAYGxgiUF4cLYBuxKUhV5r6osCdbae2/2uWMXWpC7WLIwEGxjMRAivG7KSOJhhoq3D1a5V
	40DfKi6P+oOBbz/gcE7bXkVNLvz5+0os21rNbyjvVvIRNXQGvzfBbcUMX6OauMToiAjJXIPbaySS+
	l85WmOFil6ep+/YJNEgwqGykBioJjXTcPDtyU+x4Wyjen1jh/5z7MWdahrFBlZTJiR2zXH/eOXtmm
	d+5yOGvs2KlpX2MsKM6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKEDt-0000000Cs7Z-1JBz;
	Wed, 28 May 2025 10:41:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKEAq-0000000Crdl-18ya
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 10:38:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 665181FC7;
	Wed, 28 May 2025 03:37:57 -0700 (PDT)
Received: from [10.1.34.177] (e137867.arm.com [10.1.34.177])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 92EA53F673;
	Wed, 28 May 2025 03:38:12 -0700 (PDT)
Message-ID: <c3a88ec3-623b-420b-9087-8ad124d1b0f7@arm.com>
Date: Wed, 28 May 2025 11:38:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/11] arm64: debug: remove hook registration, split
 exception entry
To: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
References: <20250512174326.133905-1-ada.coupriediaz@arm.com>
 <aCM6KOHu2i0NqaBC@uudg.org> <068c3ea3-2de3-4e5e-99c1-09a9668b80da@arm.com>
 <aCcoEc-URtvk5w7P@uudg.org>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <aCcoEc-URtvk5w7P@uudg.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_033816_480512_64C5D1EC 
X-CRM114-Status: GOOD (  26.95  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 16/05/2025 12:57, Luis Claudio R. Goncalves wrote:

> On Tue, May 13, 2025 at 04:19:26PM +0100, Ada Couprie Diaz wrote:
>> Re-sending with proper text format, apologies for the noise...
>>
>> On 13/05/2025 13:25, Luis Claudio R. Goncalves wrote:
>>
>>> On Mon, May 12, 2025 at 06:43:15PM +0100, Ada Couprie Diaz wrote:
>>>> [...]
>>>>
>>>> Single Step Exception
>>>> ===
>>>>
>> Hi Luis,
>>
>> Thanks for taking the time to test, I'm glad it seems OK for now.
>>> Is there any specific test you would like me to run on that test setup I
>>> have?
>> There are a couple of edge-cases that might be problematic if my conclusions
>> are wrong : 1. Race between a step exception being taken, and the related
>> hardware breakpoint/watchpoint being removed 2. Migration of a task stepping
>> a CPU-bound breakpoint/watchpoint
>> [...]
> I ran the two tests you listed above, along with some variations just to
> make sure I got the details right, and all those tests completed flawlessly
> on both machines, on the 4 kernel configurations I tests (all with
> PREEMPT_RT enabled, with and without LOCKDEP and assorted debug features).
Thanks a lot for taking the time to test so exhaustively ! I'm happy to 
hear that this part is holding up : I am confident it should be OK.
>>>> Testing examples
>>>> ===
>>>> [...]
>>>>
>>>> GDB commands (for EL0):
>>>> ~~~
>>>> [...]
> This is the only test where I (consistently) hit backtraces. If I run the
> test with "gdb -x ${COMMAND_LIST_FILE} ..." I get a single backtrace, every
> time:
>
> [  263.890424] BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48
> [  263.890444] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 5744, name: gdb_prog1
> [  263.890445] preempt_count: 1, expected: 0
> [  263.890446] RCU nest depth: 0, expected: 0
> [  263.890447] 1 lock held by gdb_prog1/5744:
> [  263.890448]  #0: ffff100028496f58 (&sighand->siglock){+.+.}-{3:3}, at: force_sig_info_to_task+0x30/0x150
> [  263.890468] Preemption disabled at:
> [  263.890469] [<ffff8000800391a8>] debug_exception_enter+0x18/0x78
> [  263.890484] CPU: 114 UID: 0 PID: 5744 Comm: gdb_prog1 Tainted: G        W           6.15.0-rc6-rt1__dbg #2 PREEMPT_{RT,(lazy)}
> [  263.890487] Tainted: [W]=WARN
> [  263.890488] Hardware name: Supermicro ARS-221GL-NR-01/G1SMH, BIOS 2.0 07/12/2024
> [  263.890490] Call trace:
> [  263.890492]  show_stack+0x30/0x88 (C)
> [  263.890495]  dump_stack_lvl+0xa0/0xe0
> [  263.890498]  dump_stack+0x14/0x2c
> [  263.890499]  __might_resched+0x170/0x240
> [  263.890506]  rt_spin_lock+0x6c/0x1a0
> [  263.890512]  force_sig_info_to_task+0x30/0x150
> [  263.890513]  force_sig_fault+0x68/0xa0
> [  263.890515]  arm64_force_sig_fault+0x44/0x80
> [  263.890518]  send_user_sigtrap+0x60/0xa8
> [  263.890520]  do_brk64+0x40/0x88
> [  263.890522]  el0_brk64+0x50/0x1c0
> [  263.890526]  el0t_64_sync_handler+0x60/0xe0
> [  263.890528]  el0t_64_sync+0x184/0x188
>
> Quite similar to the problem originally reported, where sending signals
> with preemption disabled could trigger the "rtlock_might_resched();" check
> if CONFIG_DEBUG_ATOMIC_SLEEP is enabled.

Oh, indeed : I can confirm that this happens both with my series and on 
mainline tags v6.15-rc6, v6.15.

I didn't see it originally, but as you point out it shows up 
consistently with CONFIG_DEBUG_ATOMIC_SLEEP enabled.

> If I call gdb and run manually the sequence of commands you described, I
> get the backtrace above three times. The only difference is that on the
> second backtrace I get these extra elements on the header:
>
>    [48052.129422] RCU nest depth: 1, expected: 1
>    [48052.129424] 2 locks held by gdb_prog1/27451:
>    [48052.129425]  #0: ffff8000828315c8 (rcu_read_lock){....}-{1:3}, at: breakpoint_handler+0xd8/0x318
>    [48052.129439]  #1: ffff00008abd92d8 (&sighand->siglock){+.+.}-{3:3}, at: force_sig_info_to_task+0x30/0x150
>
> So, when I enter manually the GDB command you suggested, the result is:
>
>      start           <--- Backtrace#1:   preempt_count: 1
>      hbreak 3
>      watch target
>      commands 2
>      continue
>      end
>      commands 3
>      continue
>      end
>      continue        <--- Backtrace#2:   preempt_count: 1   RCU nest depth: 1
>      jump 11         <--- Backtrace#3:   preempt_count: 1
>      continue
>      quit
>
> I hope this report is helpful.

Very much so, thanks !

I am looking into fixing this in v3, I feel this series is a good 
opportunity to do it.

> IMHO, even with these backtraces, there was a considerable enhancement when
> compared to the original scenario we reported.
>
> Best regards,
> Luis

I'm glad that the fix works well under more heavy testing.

Best regards,
Ada


