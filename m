Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 417B0D25923
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 03:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LECAear6oZ7wAC861/+kjDghiRGgmPGN0pG+1RSutYI=; b=zcGKiQLyWI/UAn
	eVdgaLnKZ/Q4wq6oMAJqdU/l7aEUXH/R274WfvWRSTqiO8S6eXJEMR1FJKfrPJm38ONjJyw1+PbA7
	bIiB2JtwsDXkn8auVlja51MJCyZ/ppU3GBQ0LHiznKwNBALZ563DuVAFkN678eVyAprWA+k1BEO1S
	kRF1sAZVNEFyMSAOr3KMdToEBoK+VvkoHucQMQaMzziSqQXijzn9bCQwGOH8NhGaFTqpKcHu1Myim
	7PTkH+9rmYQfAQxkt07SYUQeo0hHxXesb+o1ocMp8MfntEZTIMZe/lhBn/erWVanZXLGUe32jngMu
	WVoVzEyymyhpCNhJyqTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkZKh-0000000DXiH-2lIq;
	Tue, 27 Jan 2026 03:01:35 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkZKf-0000000DXhA-0gXB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 03:01:35 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=LECAear6oZ7wAC861/+kjDghiRGgmPGN0pG+1RSutYI=;
	b=U9UeUm0ZfuMBkWsdJBQ66gsKFmQ8yMAxWC/2wnbT/jj7tMyVpuy1U2Hkv5iDrl2zP71o1d+2V
	HgwXSkD0T35iH+Ire1hJJIcW5axr80jQ4k/B6gBeRMxhLvmxjCEgFqrqiG9h6Y0UIuYrluHOHMg
	byOerm1ChfV/bgwWY7TmE9k=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4f0VSy4kQyz1prR2;
	Tue, 27 Jan 2026 10:57:54 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id DB91C4056A;
	Tue, 27 Jan 2026 11:01:22 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 27 Jan 2026 11:01:17 +0800
Message-ID: <4f07254d-b158-a1ce-69a7-4fa4b0f339c1@huawei.com>
Date: Tue, 27 Jan 2026 11:01:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v10 04/16] arm64/ptrace: Refactor
 syscall_trace_enter/exit()
Content-Language: en-US
To: Will Deacon <will@kernel.org>
References: <20251222114737.1334364-1-ruanjinjie@huawei.com>
 <20251222114737.1334364-5-ruanjinjie@huawei.com>
 <aXeZdh3CtznU8u6L@willie-the-truck>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <aXeZdh3CtznU8u6L@willie-the-truck>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_190133_816824_865452AA 
X-CRM114-Status: GOOD (  17.55  )
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
Cc: mark.rutland@arm.com, peterz@infradead.org, catalin.marinas@arm.com, ldv@strace.io, song@kernel.org, linux-kselftest@vger.kernel.org, shuah@kernel.org, kees@kernel.org, linux-arm-kernel@lists.infradead.org, kmal@cock.li, thuth@redhat.com, ryan.roberts@arm.com, anshuman.khandual@arm.com, kevin.brodsky@arm.com, charlie@rivosinc.com, pengcan@kylinos.cn, broonie@kernel.org, luto@kernel.org, tglx@linutronix.de, richard.weiyang@gmail.com, dvyukov@google.com, wad@chromium.org, oleg@redhat.com, linux-kernel@vger.kernel.org, liqiang01@kylinos.cn, akpm@linux-foundation.org, reddybalavignesh9979@gmail.com, macro@orcam.me.uk
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 2026/1/27 0:42, Will Deacon wrote:
> On Mon, Dec 22, 2025 at 07:47:25PM +0800, Jinjie Ruan wrote:
>> The generic syscall entry code has the following form, which use
>> the input syscall work flag and syscall number:
>>
>> | syscall_trace_enter(struct pt_regs *regs, long syscall,
>> |		      unsigned long work)
>> |
>> | syscall_exit_work(struct pt_regs *regs, unsigned long work)
>>
>> In preparation for moving arm64 over to the generic entry code,
>> refactor syscall_trace_enter/exit() to also pass thread flags, and
>> get syscall number by syscall_get_nr() helper.
>>
>> No functional changes.
>>
>> Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  arch/arm64/include/asm/syscall.h |  4 ++--
>>  arch/arm64/kernel/ptrace.c       | 25 ++++++++++++++++---------
>>  arch/arm64/kernel/syscall.c      |  5 +++--
>>  3 files changed, 21 insertions(+), 13 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/syscall.h b/arch/arm64/include/asm/syscall.h
>> index 5e4c7fc44f73..cef1d9ce6e1b 100644
>> --- a/arch/arm64/include/asm/syscall.h
>> +++ b/arch/arm64/include/asm/syscall.h
>> @@ -120,7 +120,7 @@ static inline int syscall_get_arch(struct task_struct *task)
>>  	return AUDIT_ARCH_AARCH64;
>>  }
>>  
>> -int syscall_trace_enter(struct pt_regs *regs);
>> -void syscall_trace_exit(struct pt_regs *regs);
>> +int syscall_trace_enter(struct pt_regs *regs, long syscall, unsigned long flags);
>> +void syscall_trace_exit(struct pt_regs *regs, unsigned long flags);
>>  
>>  #endif	/* __ASM_SYSCALL_H */
>> diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
>> index f333791ffba6..79762ff33945 100644
>> --- a/arch/arm64/kernel/ptrace.c
>> +++ b/arch/arm64/kernel/ptrace.c
>> @@ -2407,9 +2407,8 @@ static void report_syscall_exit(struct pt_regs *regs)
>>  	}
>>  }
>>  
>> -int syscall_trace_enter(struct pt_regs *regs)
>> +int syscall_trace_enter(struct pt_regs *regs, long syscall, unsigned long flags)
>>  {
>> -	unsigned long flags = read_thread_flags();
>>  	int ret;
>>  
>>  	if (flags & (_TIF_SYSCALL_EMU | _TIF_SYSCALL_TRACE)) {
>> @@ -2422,19 +2421,27 @@ int syscall_trace_enter(struct pt_regs *regs)
>>  	if (secure_computing() == -1)
>>  		return NO_SYSCALL;
>>  
>> -	if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
>> -		trace_sys_enter(regs, regs->syscallno);
>> +	/* Either of the above might have changed the syscall number */
>> +	syscall = syscall_get_nr(current, regs);
> 
> I understand that you're gradually making the arch code more similar to
> the core code so that we can switch over to it, but I'm struggling to
> understand why syscall_trace_enter() takes the 'syscall' argument.
> 
> Even the core code just seems to use it as a local variable, which it
> overrides before it ever uses it. What am I missing?

Hi,

You're absolutely right. The 'syscall' parameter is indeed treated as a
local variable and gets overridden before any real use. Should we
refactor to remove the parameter entirely in generic entry?

Regards,
Jinjie

> 
> Will
> 

