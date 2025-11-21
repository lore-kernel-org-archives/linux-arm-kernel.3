Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA01CCFA46C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 04:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xh16cXuOqGv4XIE8j5Gws/hyQXDRJMfVOkGn4jKnE5U=; b=UnlfNJ0Z4zgmFBlAFEd6nS+Z7u
	jGD7GyZ+5csB965TED945KhiGUMD+Ruqjy6YahfCZmgqsWm+eapBIfhvRC9BFY7AMeLtcYEeF8VEq
	qxDLdXe7ZiBt2GT16z3zd/yEmwj6bcKk4TVZImmrwuyZ6C0g3XChzjTznX+oOAVAtQVgUFsjR85Pk
	xnFbHKJoTdyo2e3Fh71AteIxv50DU4uGPUdVkw/xdesJfRlDYYRSMggnlIyr5+/CUCrlAKhUBT5G6
	wR1W2fRHXTpnFtWnpvGmpTpg+gyeV0vQ+zt+DdqoIGwDolEScuT6uTu3qzJe0SJjZoAvQkDhXo3T9
	ei/ORZoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMIYU-00000007nMa-0cjV;
	Fri, 21 Nov 2025 04:15:30 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMIYQ-00000007nM6-0t3V
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 04:15:28 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=xh16cXuOqGv4XIE8j5Gws/hyQXDRJMfVOkGn4jKnE5U=;
	b=p+FzAWwSXpVTs1rdn7a0AeEy9805BsrdJg9FYeJOJLtti2OiYT4OXxmX0h+9GHmg8w50Y8elI
	alwZWgRHXiNTVn7Gh/G5XLOhNPQtRWtJ53dr++L6NCS9OOVv9LrQWNXL8fAyw5DbUh4F/jPb/3F
	njT276Ew1tglfJzL3WK9xKI=
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4dCMKB2Fngz1K96F;
	Fri, 21 Nov 2025 12:13:34 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 7FC651A016C;
	Fri, 21 Nov 2025 12:15:17 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 21 Nov 2025 12:15:15 +0800
Message-ID: <d1b5ed89-6667-a325-d209-3b43005a778b@huawei.com>
Date: Fri, 21 Nov 2025 12:15:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v7 05/11] arm64/ptrace: Handle
 ptrace_report_syscall_entry() error
Content-Language: en-US
To: Kevin Brodsky <kevin.brodsky@arm.com>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <oleg@redhat.com>, <tglx@linutronix.de>,
	<peterz@infradead.org>, <luto@kernel.org>, <shuah@kernel.org>,
	<kees@kernel.org>, <wad@chromium.org>, <akpm@linux-foundation.org>,
	<ldv@strace.io>, <macro@orcam.me.uk>, <deller@gmx.de>,
	<mark.rutland@arm.com>, <song@kernel.org>, <mbenes@suse.cz>,
	<ryan.roberts@arm.com>, <ada.coupriediaz@arm.com>,
	<anshuman.khandual@arm.com>, <broonie@kernel.org>, <pengcan@kylinos.cn>,
	<dvyukov@google.com>, <kmal@cock.li>, <lihongbo22@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>
References: <20251117133048.53182-1-ruanjinjie@huawei.com>
 <20251117133048.53182-6-ruanjinjie@huawei.com>
 <ba8450ad-e5ab-4b4f-868f-9b0da274f406@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <ba8450ad-e5ab-4b4f-868f-9b0da274f406@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_201526_899056_0DF57095 
X-CRM114-Status: GOOD (  22.19  )
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



On 2025/11/19 1:12, Kevin Brodsky wrote:
> On 17/11/2025 14:30, Jinjie Ruan wrote:
>> The generic entry handle error of ptrace_report_syscall_entry(), but
>> arm64 not.
> 
> This suggests that arm64 ignores the error completely, which isn't the
> case: no syscall will be performed, but tracing will still occur as normal.
> 
> What this patch seems to be doing is to abort the _enter sequence if
> ptrace_report_syscall_entry() errors out. The commit title and message
> should be reworded accordingly.

You are right,the description is unclear .

> 
>> As the comment said, the calling arch code should abort the system
> 
> Which comment?

ptrace_report_syscall_entry()

> 
>> call and must prevent normal entry so no system call is
>> made if ptrace_report_syscall_entry() return nonzero.
> 
> This is already the case since we're calling forget_syscall().

Yes. it is similar with the generic entry returns NO_SYSCALL.

> 
>> In preparation for moving arm64 over to the generic entry code,
>> return early if ptrace_report_syscall_entry() encounters an error.
>>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  arch/arm64/kernel/ptrace.c | 16 +++++++++++-----
>>  1 file changed, 11 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
>> index 95984bbf53db..707951ad5d24 100644
>> --- a/arch/arm64/kernel/ptrace.c
>> +++ b/arch/arm64/kernel/ptrace.c
>> @@ -2317,10 +2317,10 @@ enum ptrace_syscall_dir {
>>  	PTRACE_SYSCALL_EXIT,
>>  };
>>  
>> -static void report_syscall_enter(struct pt_regs *regs)
>> +static int report_syscall_enter(struct pt_regs *regs)
>>  {
>> -	int regno;
>>  	unsigned long saved_reg;
>> +	int regno, ret;
>>  
>>  	/*
>>  	 * We have some ABI weirdness here in the way that we handle syscall
>> @@ -2342,9 +2342,13 @@ static void report_syscall_enter(struct pt_regs *regs)
>>  	saved_reg = regs->regs[regno];
>>  	regs->regs[regno] = PTRACE_SYSCALL_ENTER;
>>  
>> -	if (ptrace_report_syscall_entry(regs))
>> +	ret = ptrace_report_syscall_entry(regs);
>> +	if (ret)
>>  		forget_syscall(regs);
> 
> The generic syscall_trace_enter() doesn't do this (i.e. setting
> regs->syscallno to NO_SYSCALL). Is that an oversight or do we just not
> need it? In principle this does have a visible effect (e.g. via
> REGSET_SYSTEM_CALL).

We just not need it because the original syscall_trace_enter() need use
regs->syscallno as the return value, but now we return early by using
NO_SYSCALL.

> 
> - Kevin
> 
>> +
>>  	regs->regs[regno] = saved_reg;
>> +
>> +	return ret;
>>  }
>>  
>>  static void report_syscall_exit(struct pt_regs *regs)
>> @@ -2374,9 +2378,11 @@ static void report_syscall_exit(struct pt_regs *regs)
>>  
>>  int syscall_trace_enter(struct pt_regs *regs, long syscall, unsigned long flags)
>>  {
>> +	int ret;
>> +
>>  	if (flags & (_TIF_SYSCALL_EMU | _TIF_SYSCALL_TRACE)) {
>> -		report_syscall_enter(regs);
>> -		if (flags & _TIF_SYSCALL_EMU)
>> +		ret = report_syscall_enter(regs);
>> +		if (ret || (flags & _TIF_SYSCALL_EMU))
>>  			return NO_SYSCALL;
>>  	}
>>  
> 

