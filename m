Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70492D3ABEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 06:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KzMFh8Xc9hn86bPrXJKSWmnPboYI/YYS/BmmUfgFs7M=; b=mCDRKkCK6tUdGGweyA6urN7VTy
	nkTTnU44t/sXnhffZdWEwUSro4hWkToxfCvqArWzXAztud/SHQ1MxtSWEDYpt5nK4jWE7kEgrnCkK
	eoubEov+wjLPFmMoRjZW07KnFcVJUvUf+Z50jpZsfvURog+UXOeRvMjGhCgrmnYJWGcXQPQE3E/iF
	lReepakp+mt72f+UZU2A6AhSXHG2oQAM91TUPUu20yD3Dm7lt6Kg2rP6J087nbGLebTKtepz+g9IF
	DKX0TYVgDtbG1EUJg+Ltst5oDK1nvvnGeO8jcuKnOE7jyOkSyiEo/JltMl4Myn1gkPVkFlAn3sI7h
	oAXSXi2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSUg5-0000000CgDu-2RtE;
	Mon, 08 Dec 2025 06:24:57 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSUg1-0000000CgCy-3uYX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 06:24:55 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=KzMFh8Xc9hn86bPrXJKSWmnPboYI/YYS/BmmUfgFs7M=;
	b=mBoy5hisy2n1S6lFUsiXjL1q+NUMuMhoUL4DSOZvNUvxozZZ1npVGBlZk0Y7W6g0j7rwWqRYs
	/zFT6NaT6FDi9g9KmXfjLz8ab/3DpO/s7LAdq9kp2dgN8LXruq7lpnZGdyoecbZp99qoSAnP0jN
	oqrPSNcLPdNTjgXHqu0DhVc=
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4dPsMg3PQ2zcZxm;
	Mon,  8 Dec 2025 14:22:07 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 3B68E180BD7;
	Mon,  8 Dec 2025 14:24:44 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 8 Dec 2025 14:24:42 +0800
Message-ID: <9102697c-9159-395d-e1b5-78439aa5a8b9@huawei.com>
Date: Mon, 8 Dec 2025 14:24:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v9 04/16] arm64/ptrace: Refactor
 syscall_trace_enter/exit()
Content-Language: en-US
To: Anshuman Khandual <anshuman.khandual@arm.com>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <oleg@redhat.com>, <tglx@linutronix.de>,
	<peterz@infradead.org>, <luto@kernel.org>, <shuah@kernel.org>,
	<kees@kernel.org>, <wad@chromium.org>, <deller@gmx.de>, <macro@orcam.me.uk>,
	<charlie@rivosinc.com>, <kevin.brodsky@arm.com>, <ldv@strace.io>,
	<mark.rutland@arm.com>, <song@kernel.org>, <ryan.roberts@arm.com>,
	<ada.coupriediaz@arm.com>, <broonie@kernel.org>, <pengcan@kylinos.cn>,
	<dvyukov@google.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
References: <20251204082123.2792067-1-ruanjinjie@huawei.com>
 <20251204082123.2792067-5-ruanjinjie@huawei.com>
 <dd3a1421-dfb0-445e-b2f7-7c273fa4a020@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <dd3a1421-dfb0-445e-b2f7-7c273fa4a020@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_222454_704881_443D010B 
X-CRM114-Status: GOOD (  14.33  )
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



On 2025/12/8 13:48, Anshuman Khandual wrote:
> On 04/12/25 1:51 PM, Jinjie Ruan wrote:
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
>> index 3926ce6aa268..b962cbcca11d 100644
>> --- a/arch/arm64/kernel/ptrace.c
>> +++ b/arch/arm64/kernel/ptrace.c
>> @@ -2381,9 +2381,8 @@ static void report_syscall_exit(struct pt_regs *regs)
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
>> @@ -2396,19 +2395,27 @@ int syscall_trace_enter(struct pt_regs *regs)
>>  	if (secure_computing() == -1)
>>  		return NO_SYSCALL;
>>  
>> -	if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
>> -		trace_sys_enter(regs, regs->syscallno);
>> +	/* Either of the above might have changed the syscall number */
>> +	syscall = syscall_get_nr(current, regs);
>>  
>> -	audit_syscall_entry(regs->syscallno, regs->orig_x0, regs->regs[1],
>> +	if (test_thread_flag(TIF_SYSCALL_TRACEPOINT)) {
>> +		trace_sys_enter(regs, syscall);
>> +
>> +		/*
>> +		 * Probes or BPF hooks in the tracepoint may have changed the
>> +		 * system call number as well.
>> +		 */
>> +		 syscall = syscall_get_nr(current, regs);
>> +	}
>> +
>> +	audit_syscall_entry(syscall, regs->orig_x0, regs->regs[1],
>>  			    regs->regs[2], regs->regs[3]);
>>  
>> -	return regs->syscallno;
>> +	return syscall;
> 
> regs->syscallno still remains unchanged even if syscall is evaluated to be different ?

No, arm64 syscall_get_nr() returns regs->syscallno, use syscall_get_nr()
helper here to get the local "syscall" is to stay consistent with the
generic entry, without any semantic change.

 23 static inline int syscall_get_nr(struct task_struct *task,
 24 >------->------->------->------- struct pt_regs *regs)
 25 {
 26 >-------return regs->syscallno;
 27 }

> 
>>  }
>>  
>> -void syscall_trace_exit(struct pt_regs *regs)
>> +void syscall_trace_exit(struct pt_regs *regs, unsigned long flags)
>>  {
>> -	unsigned long flags = read_thread_flags();
>> -
>>  	audit_syscall_exit(regs);
>>  
>>  	if (flags & _TIF_SYSCALL_TRACEPOINT)
>> diff --git a/arch/arm64/kernel/syscall.c b/arch/arm64/kernel/syscall.c
>> index aba7ca6bca2d..ec31f82d2e9f 100644
>> --- a/arch/arm64/kernel/syscall.c
>> +++ b/arch/arm64/kernel/syscall.c
>> @@ -124,7 +124,7 @@ static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
>>  		 */
>>  		if (scno == NO_SYSCALL)
>>  			syscall_set_return_value(current, regs, -ENOSYS, 0);
>> -		scno = syscall_trace_enter(regs);
>> +		scno = syscall_trace_enter(regs, scno, flags);
>>  		if (scno == NO_SYSCALL)
>>  			goto trace_exit;
>>  	}
>> @@ -143,7 +143,8 @@ static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
>>  	}
>>  
>>  trace_exit:
>> -	syscall_trace_exit(regs);
>> +	flags = read_thread_flags();
>> +	syscall_trace_exit(regs, flags);
>>  }
>>  
>>  void do_el0_svc(struct pt_regs *regs)
> 
> 

