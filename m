Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A62CF3186
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 09:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MPxV851xTjcWbDvstJF4MstyoLzb0xId1eTxrb2FLGI=; b=wRcuRFo47++lQsLyRuXzji5OH8
	9r3PzaCSukE9mSBvAbh4veIOSx8eqHKNhIRpXplsAGJ7l3oItTWmT+khHiAUQM1MVAswIPygiSyvp
	uWorlHzgMyt6GAwi47snCNox6ZLHIHg6hanvfpzGil7CqZgXDHzghfeUntB4xG8TWyRu1hxHQUWlG
	gJGk2+G9EKkkdbX/61WzCl3NfH6ODy9qfYDblesgDFOaMk2c6PaXuzfWN2ygiRRp8FdxBZMr2a3JD
	SyVH3haXcGFcUHBmf0HtbqA7oIZmHRihxaRizcr0lpomxh45LIBy05o3JdV4TpwIecB4k06s/bx8D
	gFalT9Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLepA-00000002txp-0BTT;
	Wed, 19 Nov 2025 09:50:04 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLep7-00000002tx2-2MtT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 09:50:03 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=MPxV851xTjcWbDvstJF4MstyoLzb0xId1eTxrb2FLGI=;
	b=5T82+hG886f1Lt/vohA/vBqbdt+zjEXAej2Pee5+nsD/NfI5oh71S6iVGp7im2EcQvcDJPAHZ
	mpGdHByK8YrH2fOY9WUAuovBEaTWrWouZ9VMmKKXmwPcyfSpBdOMBncBsixZGAIkvgRahC8IBLv
	gUQTuOgg251UY0dn/GBs4yY=
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4dBGr82Db7zmV8D;
	Wed, 19 Nov 2025 17:48:08 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 39A2F1A0188;
	Wed, 19 Nov 2025 17:49:52 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 19 Nov 2025 17:49:49 +0800
Message-ID: <9adaa51a-09d1-8450-afb0-838ace0f28e9@huawei.com>
Date: Wed, 19 Nov 2025 17:49:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v7 01/11] arm64/ptrace: Split report_syscall()
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
 <20251117133048.53182-2-ruanjinjie@huawei.com>
 <970d9689-4188-4c40-92e6-bdf1e589e8a2@arm.com>
Content-Language: en-US
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <970d9689-4188-4c40-92e6-bdf1e589e8a2@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_015002_152171_1DB93183 
X-CRM114-Status: GOOD (  18.78  )
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
>> The generic syscall entry code has the form:
>>
>> | syscall_trace_enter()
>> | {
>> |	ptrace_report_syscall_entry()
>> | }
>> |
>> | syscall_exit_work()
>> | {
>> |	ptrace_report_syscall_exit()
>> | }
>>
>> In preparation for moving arm64 over to the generic entry code, split
>> report_syscall() to two separate enter and exit functions to align
>> the structure of the arm64 code with syscall_trace_enter() and
>> syscall_exit_work() from the generic entry code.
>>
>> No functional changes.
>>
>> Suggested-by: Mark Rutland <mark.rutland@arm.com>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  arch/arm64/kernel/ptrace.c | 29 ++++++++++++++++++++---------
>>  1 file changed, 20 insertions(+), 9 deletions(-)
>>
>> diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
>> index 4b001121c72d..5534c175ceb7 100644
>> --- a/arch/arm64/kernel/ptrace.c
>> +++ b/arch/arm64/kernel/ptrace.c
>> @@ -2317,7 +2317,7 @@ enum ptrace_syscall_dir {
>>  	PTRACE_SYSCALL_EXIT,
>>  };
> 
> This is now unused so it should be removed.

Sure.

> 
>>  
>> -static void report_syscall(struct pt_regs *regs, enum ptrace_syscall_dir dir)
>> +static void report_syscall_enter(struct pt_regs *regs)
> 
> Nit: better to call it "report_syscall_entry" to match its final name.

That makes sense, thanks for the review.

> 
>>  {
>>  	int regno;
>>  	unsigned long saved_reg;
>> @@ -2340,13 +2340,24 @@ static void report_syscall(struct pt_regs *regs, enum ptrace_syscall_dir dir)
>>  	 */
>>  	regno = (is_compat_task() ? 12 : 7);
>>  	saved_reg = regs->regs[regno];
>> -	regs->regs[regno] = dir;
>> +	regs->regs[regno] = PTRACE_SYSCALL_ENTER;
>>  
>> -	if (dir == PTRACE_SYSCALL_ENTER) {
>> -		if (ptrace_report_syscall_entry(regs))
>> -			forget_syscall(regs);
>> -		regs->regs[regno] = saved_reg;
>> -	} else if (!test_thread_flag(TIF_SINGLESTEP)) {
>> +	if (ptrace_report_syscall_entry(regs))
>> +		forget_syscall(regs);
>> +	regs->regs[regno] = saved_reg;
>> +}
>> +
>> +static void report_syscall_exit(struct pt_regs *regs)
>> +{
>> +	int regno;
>> +	unsigned long saved_reg;
>> +
>> +	/* See comment for report_syscall_enter() above */
>> +	regno = (is_compat_task() ? 12 : 7);
> 
> Probably best not to duplicate such magic numbers, moving this line to a
> helper would be good.

That makes sense.  A helper will remove the duplicate.

> 
> - Kevin
> 
>> +	saved_reg = regs->regs[regno];
>> +	regs->regs[regno] = PTRACE_SYSCALL_EXIT;
>> +
>> +	if (!test_thread_flag(TIF_SINGLESTEP)) {
>>  		ptrace_report_syscall_exit(regs, 0);
>>  		regs->regs[regno] = saved_reg;
>>  	} else {
>> @@ -2366,7 +2377,7 @@ int syscall_trace_enter(struct pt_regs *regs)
>>  	unsigned long flags = read_thread_flags();
>>  
>>  	if (flags & (_TIF_SYSCALL_EMU | _TIF_SYSCALL_TRACE)) {
>> -		report_syscall(regs, PTRACE_SYSCALL_ENTER);
>> +		report_syscall_enter(regs);
>>  		if (flags & _TIF_SYSCALL_EMU)
>>  			return NO_SYSCALL;
>>  	}
>> @@ -2394,7 +2405,7 @@ void syscall_trace_exit(struct pt_regs *regs)
>>  		trace_sys_exit(regs, syscall_get_return_value(current, regs));
>>  
>>  	if (flags & (_TIF_SYSCALL_TRACE | _TIF_SINGLESTEP))
>> -		report_syscall(regs, PTRACE_SYSCALL_EXIT);
>> +		report_syscall_exit(regs);
>>  
>>  	rseq_syscall(regs);
>>  }
> 

