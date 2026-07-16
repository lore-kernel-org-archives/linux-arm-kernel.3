Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 093E6C44507
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 02:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pst/StPngv8ShBTab1FrQHjH5vwx66QtxnAZK63izbI=; b=BizoIzry36mXGGYBHc9iDY4nVn
	68zhw5H6ajwezafUZJCNIc2ZEcstsEae6tXU/xXNYgHTpYUyDyCHvhvnk0EAWglY1AheHV+c4V6vo
	4EK4xmyEr9J61790a9AKk4l5BiTCVFV5dsglqW5IW7PMfUqALJip0QL+QfHEBCmxxybgZ+X++IrXm
	adn+iW6d+UKjiaDu6C4JgD7skzjXjEVWbLYN2fL1HhQYHMD+N97NzCHCZSRcz/Pea24PSWgDGtSzN
	TbwVFbNoy3bJMAEw4EEuTK23OmAcydv21GiONoqwumcnj5TJUQucA2V7UpxfleHbYStjx3wBIEN7O
	6o8HYGyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkBY8-0000000GFJ6-1MT9;
	Thu, 16 Jul 2026 02:10:08 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkBY4-0000000GFIY-38CM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 02:10:07 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Pst/StPngv8ShBTab1FrQHjH5vwx66QtxnAZK63izbI=;
	b=vEg7SmeNNTzLyro5RFgJkx2//D/ax1L8Aw9qvWlQjOR+18ByvtbGxdtVYCbH/Fccs5fIwmSpB
	Kh0URGThiCDrbdk+MLSplor1tHYEDpMAmfWf8/YYSAHZDik1UjDv67ttgH62JWwIAWHblMa6jec
	UCCZTRX5BFycXCIUIeRee8o=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4h0x8Y2NBbz1T4hl;
	Thu, 16 Jul 2026 10:00:45 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id EF60F40561;
	Thu, 16 Jul 2026 10:09:56 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 16 Jul 2026 10:09:56 +0800
Message-ID: <d95814b4-511c-4210-85c3-f4f922838140@huawei.com>
Date: Thu, 16 Jul 2026 10:09:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: syscall: Ensure saved x0 is kept in-sync with
 tracer updates
To: Will Deacon <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Kees Cook <kees@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Yiqi Sun
	<sunyiqixm@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>
References: <20260714143600.23853-1-will@kernel.org>
 <55b6734e-39b9-40bb-93ae-b869f17476d5@huawei.com>
 <aleILaiTXssk066q@willie-the-truck>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <aleILaiTXssk066q@willie-the-truck>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_191005_478407_07F8009B 
X-CRM114-Status: GOOD (  24.61  )
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



On 7/15/2026 9:16 PM, Will Deacon wrote:
> Hi Jinjie,
> 
> Thank you for having a look at this. We're nearly there!
> 
> On Wed, Jul 15, 2026 at 07:39:43PM +0800, Jinjie Ruan wrote:
>> On 7/14/2026 10:35 PM, Will Deacon wrote:
>>> diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
>>> index 4d08598e2891..57e8c6714d44 100644
>>> --- a/arch/arm64/kernel/ptrace.c
>>> +++ b/arch/arm64/kernel/ptrace.c
>>> @@ -2417,12 +2432,21 @@ int syscall_trace_enter(struct pt_regs *regs)
>>>  		ret = report_syscall_entry(regs);
>>>  		if (ret || (flags & _TIF_SYSCALL_EMU))
>>>  			return NO_SYSCALL;
>>> +
>>> +		/*
>>> +		 * Ensure ptrace changes to x0 are visible to seccomp
>>> +		 * ptrace exits (SECCOMP_RET_TRACE).
>>> +		 */
>>
>> After delving into the seccomp code, I believe the comments are not
>> quite accurate, I think SECCOMP_RET_TRACE not return to here.
>>
>> maybe,
>>
>> /*
>>  * Ensure ptrace changes to x0 during a regular syscall-enter-stop
>>  * (PTRACE_SYSCALL) are visible to subsequent seccomp and audit
>>  * checking.
>>  */
> 
> Yes, that's better. Seccomp BPF filters will get passed whatever comes
> back from syscall_get_arguments(), so mentioning SECCOMP_RET_TRACE is
> confusing here.
> 
>>> +		update_syscall_orig_x0_after_ptrace(regs);
>>>  	}
>>>  
>>>  	/* Do the secure computing after ptrace; failures should be fast. */
>>>  	if (secure_computing() == -1)
>>>  		return NO_SYSCALL;
>>>  
>>> +	/* Ensure seccomp updates to x0 are visible to audit. */
>>
>> This comment is also not quite accurate, it implies that Seccomp itself
>> (such as SECCOMP_RET_ERRNO) modifies x0, but in this scenario, the audit
>> is not executed, because __seccomp_filter() skip the syscall.
>>
>> 1279 >-------switch (action) {
>> 1280 >-------case SECCOMP_RET_ERRNO:
>> 1281 >------->-------/* Set low-order bits as an errno, capped at
>> MAX_ERRNO. */
>> 1282 >------->-------if (data > MAX_ERRNO)
>> 1283 >------->------->-------data = MAX_ERRNO;
>> 1284 >------->-------syscall_set_return_value(current, current_pt_regs(),
>> 1285 >------->------->------->------->------- -data, 0);
>> 1286 >------->-------goto skip;
>>                    ^^^^^^^^^^^^^<- we skip the syscall if
>> SECCOMP_RET_ERRNO changes x0
>>
>>
>> Here what we actually need to synchronize is the tracer's modification
>> of x0 in the SECCOMP_RET_TRACE path, the SECCOMP_RET_TRACE logic
>> notifies the tracer, the tracer modifies x0 and modifies the system call
>> number to a legal value and so we can continue the latter audit.
> 
> Right, the 'SECCOMP_RET_TRACE' example should be in _this_ comment, not
> the previous one.
> 
>> /*
>>  * Ensure tracer changes to x0 during SECCOMP_RET_TRACE processing
>>  * are visible to later trace and audit.
>> */
> 
> I'll tweak that, as I don't think the tracing part matters (it doesn't
> see orig_x0 afaict) and I'd like to be very clear that this is down
> to the secure_computing() call. So it becomes:

Hi Will,

Looking forward to your update.

I do not think so, I think the trace part also matters, because the
tracepoint also reads orig_x0 through syscall_get_arguments().

 18 TRACE_EVENT_SYSCALL(sys_enter,
 19
 20 >-------TP_PROTO(struct pt_regs *regs, long id),
 21
 22 >-------TP_ARGS(regs, id),
 23
 24 >-------TP_STRUCT__entry(
 25 >------->-------__field(>-------long,>-->-------id>----->-------)
 26 >------->-------__array(>-------unsigned long,>-args,>--6>------)
 27 >-------),
 28
 29 >-------TP_fast_assign(
 30 >------->-------__entry->id>----= id;
 31 >------->-------syscall_get_arguments(current, regs, __entry->args);
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

 32 >-------),
 33
 34 >-------TP_printk("NR %ld (%lx, %lx, %lx, %lx, %lx, %lx)",
 35 >------->-------  __entry->id,
 36 >------->-------  __entry->args[0], __entry->args[1], __entry->args[2],
 37 >------->-------  __entry->args[3], __entry->args[4], __entry->args[5]),
 38
 39 >-------syscall_regfunc, syscall_unregfunc
 40 );

Based on a fix patch by Kees six years ago, I understand that system
call parameters are similar to system call numbers. If ptrace or seccomp
modifies the system call parameters, then at that time, the tracing and
auditing mechanisms also need to be able to see this change.

I understand that the semantics of seccomp and trace/audit are intended
to reflect the latest relevant data of system calls that are "actually
executed" (invoke_syscall()).


Link: https://lkml.org/lkml/2020/9/11/1282

Best regards,
Jinjie

> 
>   /*
>    * Ensure tracer changes to x0 during seccomp ptrace exit processing
>    * (SECCOMP_RET_TRACE) are visible to audit.
>    */
> 
> Will


