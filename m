Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 111FAC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 12:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xTHwImVBA6Now6JLic6qOSBNksfKUNyQ/PEqin0QjFo=; b=fQkELisESF6OS+
	1K+iL8qXFXBSfy1I6HRBniu7+KkKitE25WHDF+N5rXJmzfbOjciQ6umL2KPcF7uhj52MODmkh6az+
	f0Lo0aD47YMSu1A7dVLXhLQoffIKipZnmqSaeD9z0//IPP4Kn7x4HiApG3MOyhGeeS3JQRitKyHQ6
	bOmrPXNnk9MgjT3JiQ4H0WElAU+A3O0G/A1Hw1odNmvxbki4bIMLgRETi8hFqi5ReswymgtxX1n9t
	551sYN3F/LLy6xkdZmQ9oggFuTS9ryjviqW6Qoh0akemFMaks0n/qaRaLHv3kZ5bWAS0RVMR153mK
	HbUCvjuxKqbJ+z/kxozA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umAOI-0000000DcRe-40db;
	Wed, 13 Aug 2025 12:15:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um9tj-0000000DXyE-0WhO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 11:44:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 354C712FC;
	Wed, 13 Aug 2025 04:43:52 -0700 (PDT)
Received: from [10.57.1.244] (unknown [10.57.1.244])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3BC853F738;
	Wed, 13 Aug 2025 04:43:57 -0700 (PDT)
Message-ID: <0d90f4c0-3eb8-4004-b22e-1a840d69fb50@arm.com>
Date: Wed, 13 Aug 2025 12:43:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] arm64: Sleeping function called from invalid context in
 do_debug_exception on PREEMPT_RT
To: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>, Yunseong Kim <ysk@kzalloc.com>
References: <c36e8dca-d466-40ad-ad51-2b75e769ff47@kzalloc.com>
 <aJw3L7B7u5qAPOMz@e129823.arm.com>
 <17f91b9a-0a3a-47e1-bdfb-06237ae5da55@kzalloc.com>
 <aJxT2ie1wW2+/OCg@e129823.arm.com> <aJxjvh4sAcUOJT2V@uudg.org>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <aJxjvh4sAcUOJT2V@uudg.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_044403_263030_8D5C4B58 
X-CRM114-Status: GOOD (  20.03  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, "Paul E. McKenney" <paulmck@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Naresh Kamboju <naresh.kamboju@linaro.org>, Austin Kim <austindh.kim@gmail.com>, stable@vger.kernel.org, syzkaller@googlegroups.com, Masami Hiramatsu <mhiramat@kernel.org>, Will Deacon <will@kernel.org>, linux-rt-devel@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi all,

On 13/08/2025 11:06, Luis Claudio R. Goncalves wrote:
> On Wed, Aug 13, 2025 at 09:59:06AM +0100, Yeoreum Yun wrote:
>> +Ada Couprie Diaz
Thanks for the ping !
>>> Hi Yeoreum,
>>>
>>> Thank you for pointing it!
>>>
>>> On 8/13/25 3:56 PM, Yeoreum Yun wrote:
>>>> Hi Yunseong,
>>>>
>>>>> | BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48
>>>>> | in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 20466, name: syz.0.1689
>>>>> | preempt_count: 1, expected: 0
>>>>> | RCU nest depth: 0, expected: 0
>>>>> | Preemption disabled at:
>>>>> | [<ffff800080241600>] debug_exception_enter arch/arm64/mm/fault.c:978 [inline]
>>>>> | [<ffff800080241600>] do_debug_exception+0x68/0x2fc arch/arm64/mm/fault.c:997
>>>>> | CPU: 0 UID: 0 PID: 20466 Comm: syz.0.1689 Not tainted 6.16.0-rc1-rt1-dirty #12 PREEMPT_RT
>>>>> | Hardware name: QEMU KVM Virtual Machine, BIOS 2025.02-8 05/13/2025
>>>>> | Call trace:
>>>>> |  show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:466 (C)
>>>>> |  __dump_stack+0x30/0x40 lib/dump_stack.c:94
>>>>> |  dump_stack_lvl+0x148/0x1d8 lib/dump_stack.c:120
>>>>> |  dump_stack+0x1c/0x3c lib/dump_stack.c:129
>>>>> |  __might_resched+0x2e4/0x52c kernel/sched/core.c:8800
>>>>> |  __rt_spin_lock kernel/locking/spinlock_rt.c:48 [inline]
>>>>> |  rt_spin_lock+0xa8/0x1bc kernel/locking/spinlock_rt.c:57
>>>>> |  spin_lock include/linux/spinlock_rt.h:44 [inline]
>>>>> |  force_sig_info_to_task+0x6c/0x4a8 kernel/signal.c:1302
>>>>> |  force_sig_fault_to_task kernel/signal.c:1699 [inline]
>>>>> |  force_sig_fault+0xc4/0x110 kernel/signal.c:1704
>>>>> |  arm64_force_sig_fault+0x6c/0x80 arch/arm64/kernel/traps.c:265
>>>>> |  send_user_sigtrap arch/arm64/kernel/debug-monitors.c:237 [inline]
>>>>> |  single_step_handler+0x1f4/0x36c arch/arm64/kernel/debug-monitors.c:257
>>>>> |  do_debug_exception+0x154/0x2fc arch/arm64/mm/fault.c:1002
>>>>> |  el0_dbg+0x44/0x120 arch/arm64/kernel/entry-common.c:756
>>>>> |  el0t_64_sync_handler+0x3c/0x108 arch/arm64/kernel/entry-common.c:832
>>>>> |  el0t_64_sync+0x1ac/0x1b0 arch/arm64/kernel/entry.S:600
>>>>>
>>>>>
>>>>> It seems that commit eaff68b32861 ("arm64: entry: Add entry and exit functions
>>>>> for debug exception") in 6.17-rc1, also present as 6fb44438a5e1 in mainline,
>>>>> removed code that previously avoided sleeping context issues when handling
>>>>> debug exceptions:
>>>>> Link: https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/commit/arch/arm64/mm/fault.c?id=eaff68b3286116d499a3d4e513a36d772faba587
>>>> No. Her patch commit 31575e11ecf7 (arm64: debug: split brk64 exception entry)
>>>> solves your splat since el0_brk64() doesn't call debug_exception_enter()
>>>> by spliting el0/el1 brk64 entry exception entry.
>>>>
>>>> Formerly, el(0/1)_dbg() are handled in do_debug_exception() together
>>>> and it calls debug_exception_enter() disabling preemption and this makes
>>>> your splat while handling brk excepttion from el0.
That's correct : one of the goal of the series was to be able to
adapt each debug exception handler to what is needed,
which allowed us to keep preemption enabled, or re-enable it
much earlier, to prevent issues as above for some exceptions.
>>> Do you think a fix is necessary if this issue also affects the LTS kernel
>>> before 6.17-rc1? As far as I know, most production RT kernels are still
>>> based on the existing LTS versions.
Luis originally reported the issue on kernels 6.13-rt and 6.14-rc1[1].
After some quick testing, the issue is present on
6.1-rt, 6.6-rt and 6.12-rt as well.
5.15-rt either doesn't have the issue, or doesn't report it.
>> IMHO, I think her patch should be backedported.
> I also strongly suggest backporting Ada's patch series, as without them
> using anything that resorts to debug exceptions (ptrace, gdb, ...) on
> aarch64 with PREEMPT_RT enabled may result in a backtrace or worse.
>
> Luis
Hopefully it shouldn't be too hard to backport for recent kernels,
as I don't think those areas change a lot, but I haven't looked into it.

I'm not sure when I would have time to work on backporting, but
I'd be happy to help anyway or do it if I have the time in the future,
given there seems to be some interest (and good reasons).
>> [0]: https://lore.kernel.org/all/20250707114109.35672-1-ada.coupriediaz@arm.com/
>>
>> Thanks.
>>
>> --
>> Sincerely,
>> Yeoreum Yun
Best,
Ada
[1]: https://lore.kernel.org/linux-arm-kernel/Z6YW_Kx4S2tmj2BP@uudg.org/

