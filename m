Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96468CF857F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 11:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wo9AYU4ZP87/cRBaweFBQ81kmpPLnOM/YafttZhjfmw=; b=mj4bJ3dweVY2d49XXFvH5qQRHy
	lttVptVM3v08/IodSbZoIbgd2ABVlLm/kHRWQKFGubhZFCdPIXr9dkmAxJXMrDbx3tjxyM8RGcTBP
	E+8l4xseAvd/f73DNwCpmnHI1DDFQZhj1Pcxp5d/ZRY5qP7La18AopMo42EcyE97bK5v5lD1JC3II
	Lf7W/t36dddBSbxXNf/1Xk/24CDTfOov2o0LUhLr4sPPFQqiKVZL6jl5f9H7RNlM/r2xJCJF1lCLK
	JwFufgVkMXeI34xLiEeQApXIFxOEj1oc06LO5UkK6qPXl6mwcGpfrwbdeUc8h17NBscuzZdBLxois
	VUtCggYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM2UQ-00000006Y0p-29x1;
	Thu, 20 Nov 2025 11:06:14 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM2UM-00000006Y0E-3PmB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 11:06:12 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Wo9AYU4ZP87/cRBaweFBQ81kmpPLnOM/YafttZhjfmw=;
	b=wzxAJriXfqmkwATr2VfoB44bwdVdEKqh609g0CKJOI6NRNJY599ufGo3ZNKLJjSdgRoZxEs50
	WHwFmKXT+BmBiyQxYZWxkvFlZnpZMReGlT7dOSggzWM+4XmAdk8ZRfniz9Hz6TZrPL0eotNl++8
	f2TK84FQnY7aQE2ktME8pTM=
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4dBwTm2nTqz12LHn;
	Thu, 20 Nov 2025 19:04:28 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 619C8140144;
	Thu, 20 Nov 2025 19:05:55 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 20 Nov 2025 19:05:53 +0800
Message-ID: <d1aeb83e-d380-be80-9bd7-72f95a9aa09a@huawei.com>
Date: Thu, 20 Nov 2025 19:05:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v7 02/11] arm64/ptrace: Refactor
 syscall_trace_enter/exit()
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
 <20251117133048.53182-3-ruanjinjie@huawei.com>
 <4984d8e6-1431-4dcc-9723-c5470b5bcd49@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <4984d8e6-1431-4dcc-9723-c5470b5bcd49@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_030611_526457_CFC4B4EB 
X-CRM114-Status: GOOD (  12.90  )
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



On 2025/11/19 1:09, Kevin Brodsky wrote:
> On 17/11/2025 14:30, Jinjie Ruan wrote:
>> [...]
>>
>> @@ -2386,19 +2384,27 @@ int syscall_trace_enter(struct pt_regs *regs)
>>  	if (secure_computing() == -1)
>>  		return NO_SYSCALL;
>>  
>> -	if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
>> -		trace_sys_enter(regs, regs->syscallno);
>> +	/* Either of the above might have changed the syscall number */
>> +	syscall = syscall_get_nr(current, regs);
>> +
>> +	if (test_thread_flag(TIF_SYSCALL_TRACEPOINT)) {
>> +		trace_sys_enter(regs, syscall);
>>  
>> -	audit_syscall_entry(regs->syscallno, regs->orig_x0, regs->regs[1],
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
>>  	return regs->syscallno;
> 
> It would be good to align the return with the generic version as well.

Right, could be aligned with the return with the generic version.

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
>> index aba7ca6bca2d..6e3fe760e0bb 100644
>> --- a/arch/arm64/kernel/syscall.c
>> +++ b/arch/arm64/kernel/syscall.c
>> @@ -124,7 +124,7 @@ static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
>>  		 */
>>  		if (scno == NO_SYSCALL)
>>  			syscall_set_return_value(current, regs, -ENOSYS, 0);
>> -		scno = syscall_trace_enter(regs);
>> +		scno = syscall_trace_enter(regs, regs->syscallno, flags);
> 
> Nit: could use scno instead of regs->syscallno.

That is ok.

> 
> - Kevin
> 
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

