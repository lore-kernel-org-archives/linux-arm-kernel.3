Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3264ACFD31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 09:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sjlq7g7grLypsLFxiWaQ0uEfp4S5BaKJKJLeYr1uM3E=; b=gMJD+XMQFeFy2p46i6MbbbDiii
	T2rNlgQ8nJqYWlN3B2FG1FPtDFwW4Vo3zr5yoaMmHBoHx6JQGmI9pZF87nlLGFhObHJTJJ2BxtznC
	ovXfsSAZ50VdE4LAyeQRS18+n6AGilng4Fa/BUyA9cZHU1626Bplw0CNRt7oQSXrp0lgpLseb4iN9
	rBPPASejXpRUD2R2IJUE4NW/chqkSa1oNCuvEpwSfqcSB2gMhPfiLTNKaadzYGUk85GXnbN7uJuGd
	85owopkKKCN88pP41Gc/C8yrKyBvPcnI50a22MHgTpcMhGP/eqEvTMjRglPAZTjRsG+GoIHzoErs2
	jmjuqNxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNSgo-0000000BKJq-0Pga;
	Mon, 24 Nov 2025 09:16:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNSgk-0000000BKJ6-2R1j
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 09:16:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D6FFA339;
	Mon, 24 Nov 2025 01:16:39 -0800 (PST)
Received: from [10.57.40.193] (unknown [10.57.40.193])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B1B043F73B;
	Mon, 24 Nov 2025 01:16:41 -0800 (PST)
Message-ID: <f6350045-d1a1-4d1c-b2d3-68da841f7e34@arm.com>
Date: Mon, 24 Nov 2025 10:16:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/11] arm64/ptrace: Handle
 ptrace_report_syscall_entry() error
To: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, oleg@redhat.com, tglx@linutronix.de, peterz@infradead.org,
 luto@kernel.org, shuah@kernel.org, kees@kernel.org, wad@chromium.org,
 akpm@linux-foundation.org, ldv@strace.io, macro@orcam.me.uk, deller@gmx.de,
 mark.rutland@arm.com, song@kernel.org, mbenes@suse.cz, ryan.roberts@arm.com,
 ada.coupriediaz@arm.com, anshuman.khandual@arm.com, broonie@kernel.org,
 pengcan@kylinos.cn, dvyukov@google.com, kmal@cock.li, lihongbo22@huawei.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20251117133048.53182-1-ruanjinjie@huawei.com>
 <20251117133048.53182-6-ruanjinjie@huawei.com>
 <ba8450ad-e5ab-4b4f-868f-9b0da274f406@arm.com>
 <d1b5ed89-6667-a325-d209-3b43005a778b@huawei.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <d1b5ed89-6667-a325-d209-3b43005a778b@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_011650_770486_490579A7 
X-CRM114-Status: GOOD (  22.22  )
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

On 21/11/2025 05:15, Jinjie Ruan wrote:
>
> On 2025/11/19 1:12, Kevin Brodsky wrote:
>> On 17/11/2025 14:30, Jinjie Ruan wrote:
>>> The generic entry handle error of ptrace_report_syscall_entry(), but
>>> arm64 not.
>> This suggests that arm64 ignores the error completely, which isn't the
>> case: no syscall will be performed, but tracing will still occur as normal.
>>
>> What this patch seems to be doing is to abort the _enter sequence if
>> ptrace_report_syscall_entry() errors out. The commit title and message
>> should be reworded accordingly.
> You are right,the description is unclear .
>
>>> As the comment said, the calling arch code should abort the system
>> Which comment?
> ptrace_report_syscall_entry()

I found that later, this should be clarified in the commit message.

>>> call and must prevent normal entry so no system call is
>>> made if ptrace_report_syscall_entry() return nonzero.
>> This is already the case since we're calling forget_syscall().
> Yes. it is similar with the generic entry returns NO_SYSCALL.

My point is that this patch is not changing this - arm64 was already
skipping the syscall if ptrace_report_syscall_entry() returns an error.

>>> In preparation for moving arm64 over to the generic entry code,
>>> return early if ptrace_report_syscall_entry() encounters an error.
>>>
>>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>>> ---
>>>  arch/arm64/kernel/ptrace.c | 16 +++++++++++-----
>>>  1 file changed, 11 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
>>> index 95984bbf53db..707951ad5d24 100644
>>> --- a/arch/arm64/kernel/ptrace.c
>>> +++ b/arch/arm64/kernel/ptrace.c
>>> @@ -2317,10 +2317,10 @@ enum ptrace_syscall_dir {
>>>  	PTRACE_SYSCALL_EXIT,
>>>  };
>>>  
>>> -static void report_syscall_enter(struct pt_regs *regs)
>>> +static int report_syscall_enter(struct pt_regs *regs)
>>>  {
>>> -	int regno;
>>>  	unsigned long saved_reg;
>>> +	int regno, ret;
>>>  
>>>  	/*
>>>  	 * We have some ABI weirdness here in the way that we handle syscall
>>> @@ -2342,9 +2342,13 @@ static void report_syscall_enter(struct pt_regs *regs)
>>>  	saved_reg = regs->regs[regno];
>>>  	regs->regs[regno] = PTRACE_SYSCALL_ENTER;
>>>  
>>> -	if (ptrace_report_syscall_entry(regs))
>>> +	ret = ptrace_report_syscall_entry(regs);
>>> +	if (ret)
>>>  		forget_syscall(regs);
>> The generic syscall_trace_enter() doesn't do this (i.e. setting
>> regs->syscallno to NO_SYSCALL). Is that an oversight or do we just not
>> need it? In principle this does have a visible effect (e.g. via
>> REGSET_SYSTEM_CALL).
> We just not need it because the original syscall_trace_enter() need use
> regs->syscallno as the return value, but now we return early by using
> NO_SYSCALL.

Calling forget_syscall() means setting regs->syscallno to NO_SYSCALL. It
is indeed no longer required for the entry sequence, but it does have
visible side effects. For instance, regs->syscallno can be inspected via
ptrace(PTRACE_GETREGSET, REGSET_SYSTEM_CALL). So the question is whether
we need to deviate from the generic path on arm64 (this is mostly a
question for arm64 maintainers).

- Kevin

