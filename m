Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F31FDC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 16:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YXip+8EHh2ypNOoBorunFDEUw5MyrFtxt+U05eKFX+s=; b=EEzUBrkQXD5a/u
	ekt6l5cRQqCHu/xxiyMpf6UTurcpIg1IDqA4Qq4J+y3BQRvBmrEdDNMZHwVI/WAmmoA15wEsDI9yL
	dswnw3MSVzPTfsGojm7a7z3klxjqNnUnFW2ZkKGHFYZEZROnc3MPJgwSGb3/y8ydH25ye38hkkxa+
	jUTVNpepLj73SpvBhOvs64EWa/WNf3qsML6TXdpMki76hTKMtNo/bW+A3pl0m2cplZ3GL9yfKM97K
	tVhvELHK2kComwQ8k2hHNstPBDqVCzkOW4mOjZQNJrzLyFbFTErCw/QjYixyHfcCPNpV+0wlU6oZm
	8koqNn078BHBNRAa1CcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMUFz-0000000BNOy-3AQF;
	Tue, 03 Jun 2025 16:12:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMUDn-0000000BNFu-1Vkx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 16:10:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E8F112FC;
	Tue,  3 Jun 2025 09:10:21 -0700 (PDT)
Received: from [10.1.39.137] (e137867.arm.com [10.1.39.137])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 094F13F59E;
	Tue,  3 Jun 2025 09:10:36 -0700 (PDT)
Message-ID: <e86c5c3a-6666-46a7-b7ec-e803212a81a1@arm.com>
Date: Tue, 3 Jun 2025 17:10:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/11] arm64: debug: remove hook registration, split
 exception entry
To: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
References: <20250512174326.133905-1-ada.coupriediaz@arm.com>
 <aCM6KOHu2i0NqaBC@uudg.org> <068c3ea3-2de3-4e5e-99c1-09a9668b80da@arm.com>
 <aCcoEc-URtvk5w7P@uudg.org> <c3a88ec3-623b-420b-9087-8ad124d1b0f7@arm.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <c3a88ec3-623b-420b-9087-8ad124d1b0f7@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_091039_492128_9C1F1B25 
X-CRM114-Status: GOOD (  20.92  )
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

On 28/05/2025 11:38, Ada Couprie Diaz wrote:

> On 16/05/2025 12:57, Luis Claudio R. Goncalves wrote:
>> On Tue, May 13, 2025 at 04:19:26PM +0100, Ada Couprie Diaz wrote:
>>
>> This is the only test where I (consistently) hit backtraces. If I run 
>> the
>> test with "gdb -x ${COMMAND_LIST_FILE} ..." I get a single backtrace, 
>> every
>> time:
>>
>> [  263.890424] BUG: sleeping function called from invalid context at 
>> kernel/locking/spinlock_rt.c:48
>> [  263.890444] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 
>> 5744, name: gdb_prog1
>> [  263.890445] preempt_count: 1, expected: 0
>> [  263.890446] RCU nest depth: 0, expected: 0
>> [  263.890447] 1 lock held by gdb_prog1/5744:
>> [  263.890448]  #0: ffff100028496f58 (&sighand->siglock){+.+.}-{3:3}, 
>> at: force_sig_info_to_task+0x30/0x150
>> [  263.890468] Preemption disabled at:
>> [  263.890469] [<ffff8000800391a8>] debug_exception_enter+0x18/0x78
>> [  263.890484] CPU: 114 UID: 0 PID: 5744 Comm: gdb_prog1 Tainted: 
>> G        W           6.15.0-rc6-rt1__dbg #2 PREEMPT_{RT,(lazy)}
>> [  263.890487] Tainted: [W]=WARN
>> [  263.890488] Hardware name: Supermicro ARS-221GL-NR-01/G1SMH, BIOS 
>> 2.0 07/12/2024
>> [  263.890490] Call trace:
>> [  263.890492]  show_stack+0x30/0x88 (C)
>> [  263.890495]  dump_stack_lvl+0xa0/0xe0
>> [  263.890498]  dump_stack+0x14/0x2c
>> [  263.890499]  __might_resched+0x170/0x240
>> [  263.890506]  rt_spin_lock+0x6c/0x1a0
>> [  263.890512]  force_sig_info_to_task+0x30/0x150
>> [  263.890513]  force_sig_fault+0x68/0xa0
>> [  263.890515]  arm64_force_sig_fault+0x44/0x80
>> [  263.890518]  send_user_sigtrap+0x60/0xa8
>> [  263.890520]  do_brk64+0x40/0x88
>> [  263.890522]  el0_brk64+0x50/0x1c0
>> [  263.890526]  el0t_64_sync_handler+0x60/0xe0
>> [  263.890528]  el0t_64_sync+0x184/0x188
>>
>> Quite similar to the problem originally reported, where sending signals
>> with preemption disabled could trigger the "rtlock_might_resched();" 
>> check
>> if CONFIG_DEBUG_ATOMIC_SLEEP is enabled.
>
> Oh, indeed : I can confirm that this happens both with my series and 
> on mainline tags v6.15-rc6, v6.15.
>
> I didn't see it originally, but as you point out it shows up 
> consistently with CONFIG_DEBUG_ATOMIC_SLEEP enabled.
>
> [...]
>
> I am looking into fixing this in v3, I feel this series is a good 
> opportunity to do it.
>
As you mentioned the issue is very similar to the single-step one,
and we already have done most of the work for the fix.
Indeed, the handling of the software breakpoint instruction
from EL0 is very similar to the single step exception.
In fact : the exact same logic applies and we can safely
enable preemption before calling `do_brk64()`, given that the only
possible path from EL0 is the uprobe handler, which sets a TIF
to be handled on exit, as with the single step.

So this is fixed in v3.


However, as the other traces you hit suggested : there is also an issue
with the hardware breakpoint and watchpoint handlers.
Here it is much more painful though.
Indeed : the signal is sent from within the ptrace handler
`ptrace_hbptriggered()`, itself called from the `perf_bp_event()`, called
in a loop in the handlers to find matching {break,watch}points.
This makes it *very* impractical to enable preemption at any point
for those debug exceptions.

Looking into how x86 handles it, they do not seem to have the issue
as they do not send a signal in their hardware breakpoint handler,
rather they set a "virtual register" that should be seen by userspace.
(If my understanding is correct !)

However, they use a `notify_die()` callback to call their hardware
breakpoint handler : `hw_breakpoint_exceptions_notify()`.
We do have it for arm64, but it is a stub.
We might be able to use this callback to delay the signal until we
are done operating on the hardware registers, which definitely needs
preemption disabled.


However, this is becoming a much larger change whose scope I am
not sure of yet, so I will not be looking into fixing it in this series.
Hopefully it can be done at a later date !

Best,
Ada


