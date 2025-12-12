Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC77AD4336B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 04:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tPLwoUwGjEHAvimSj8cQdy88azT+F1V9CLbQw5PbX84=; b=0N0oSOWyadnKtUFiKAkB/Adtqj
	DCClsIYQbT/KMHRGOXHe2SV+uYfAUsLfcL8x1bo+JmUpd4mP1Dbyp33JjcvjSeO19MMS1IlCSiNgR
	nPKGaLs8QagtrSnufDzAXHqKGCDR5R75WarQPf//unuWY6jOvgyHJGGdF1Ml/SBk7ubiCqct97KDC
	7x0iOrnCrnphg4QdOpIFXxpGSLqJD/8xS8URV5aZJE5Ko1Q/aFrJLzF555nuk+sFpwnNmYiVv+4jC
	fPZgyCs2hntZfJ7ItewSVzLgPihMjWvgTVUrcvq4vI6297KdlN1VBT8/HoLc8ssiwzHEJtETRv3KU
	Vs2BYrew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTuKv-000000002zJ-1lgw;
	Fri, 12 Dec 2025 04:00:57 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTuKs-000000002yh-2hs4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 04:00:56 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=tPLwoUwGjEHAvimSj8cQdy88azT+F1V9CLbQw5PbX84=;
	b=c8LsiV1sC3ls4lji4WJcHUdAykhOZiXd4EVUNzayikuB2KRAtHW+AbS0eaSOrru3Pu5zAFwIF
	9nK6mAjcNnJfWV7Cs69SRWPCHX4yIDwcyIYljpfL47dcwwmYhHk10+yPsDSYecPUhFcBYgm8+gS
	u22GXj8SSPleEg4RF5NTFbw=
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4dSFzk2MrkzpStQ;
	Fri, 12 Dec 2025 11:58:10 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 3A948140121;
	Fri, 12 Dec 2025 12:00:45 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 12 Dec 2025 12:00:43 +0800
Message-ID: <051fe45b-f158-85be-3f8e-60c830fb47a2@huawei.com>
Date: Fri, 12 Dec 2025 12:00:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v9 03/16] arm64/ptrace: Return early for
 ptrace_report_syscall_entry() error
Content-Language: en-US
To: Kevin Brodsky <kevin.brodsky@arm.com>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <oleg@redhat.com>, <tglx@linutronix.de>,
	<peterz@infradead.org>, <luto@kernel.org>, <shuah@kernel.org>,
	<kees@kernel.org>, <wad@chromium.org>, <deller@gmx.de>, <macro@orcam.me.uk>,
	<charlie@rivosinc.com>, <ldv@strace.io>, <mark.rutland@arm.com>,
	<song@kernel.org>, <ryan.roberts@arm.com>, <ada.coupriediaz@arm.com>,
	<anshuman.khandual@arm.com>, <broonie@kernel.org>, <pengcan@kylinos.cn>,
	<dvyukov@google.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
References: <20251204082123.2792067-1-ruanjinjie@huawei.com>
 <20251204082123.2792067-4-ruanjinjie@huawei.com>
 <52f63e40-541f-4ed8-9d05-626eab4b39cb@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <52f63e40-541f-4ed8-9d05-626eab4b39cb@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_200055_297363_F95336A5 
X-CRM114-Status: GOOD (  15.96  )
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



On 2025/12/9 21:46, Kevin Brodsky wrote:
> On 04/12/2025 09:21, Jinjie Ruan wrote:
>> The generic entry abort the syscall_trace_enter() sequence if
>> ptrace_report_syscall_entry() errors out, but arm64 not.
>>
>> As the ptrace_report_syscall_entry() comment said, the calling arch code
>> should abort the system call and must prevent normal entry so no system
>> call is made if ptrace_report_syscall_entry() return nonzero.
> 
> This patch is now in the right position, which means that arm64 does
> abort the syscall already without this patch. What we're changing here
> is that the tracing sequence is interrupted. The comment you're
> referring to says nothing about tracing so I'm not sure it helps to
> refer to it.

I think “must prevent normal entry ”means When ptrace requests
interception, all subsequent processing, including audit and seccomp,
should completely bypassed.

> 
> Otherwise:
> 
> Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
> 
>> In preparation for moving arm64 over to the generic entry code,
>> return early if ptrace_report_syscall_entry() encounters an error.
>>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  arch/arm64/kernel/ptrace.c | 14 +++++++++-----
>>  1 file changed, 9 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
>> index 4532e9831856..3926ce6aa268 100644
>> --- a/arch/arm64/kernel/ptrace.c
>> +++ b/arch/arm64/kernel/ptrace.c
>> @@ -2346,15 +2346,18 @@ static __always_inline unsigned long ptrace_save_reg(struct pt_regs *regs,
>>  	return saved_reg;
>>  }
>>  
>> -static void report_syscall_entry(struct pt_regs *regs)
>> +static int report_syscall_entry(struct pt_regs *regs)
>>  {
>>  	unsigned long saved_reg;
>> -	int regno;
>> +	int regno, ret;
>>  
>>  	saved_reg = ptrace_save_reg(regs, PTRACE_SYSCALL_ENTER, &regno);
>> -	if (ptrace_report_syscall_entry(regs))
>> +	ret = ptrace_report_syscall_entry(regs);
>> +	if (ret)
>>  		forget_syscall(regs);
>>  	regs->regs[regno] = saved_reg;
>> +
>> +	return ret;
>>  }
>>  
>>  static void report_syscall_exit(struct pt_regs *regs)
>> @@ -2381,10 +2384,11 @@ static void report_syscall_exit(struct pt_regs *regs)
>>  int syscall_trace_enter(struct pt_regs *regs)
>>  {
>>  	unsigned long flags = read_thread_flags();
>> +	int ret;
>>  
>>  	if (flags & (_TIF_SYSCALL_EMU | _TIF_SYSCALL_TRACE)) {
>> -		report_syscall_entry(regs);
>> -		if (flags & _TIF_SYSCALL_EMU)
>> +		ret = report_syscall_entry(regs);
>> +		if (ret || (flags & _TIF_SYSCALL_EMU))
>>  			return NO_SYSCALL;
>>  	}
>>  
> 

