Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E12C44524
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 04:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L59gGa8NjFg1bSDckxpWx71Mjqfafs/TFzsqxM1X1hM=; b=n/XawulkZeqTf81Va3a3/BbK7+
	s/HPr/eCQ1XGUR0pgqJYrcjyc3wA6XirKCMW76n+hgJJe8pQmZE+kLI/d4cJKlbNhnscQY6tMIp9t
	lpMVendxErdCgrqMmtYvqAav6nKJDCbbQSIWjzdK5gDh++CNsQeExWIg/Pij02eOUT3lIZtKxnq9s
	d7e+Ep8nG2Cwz7Ztj/2y6sTleW/tMJCTenqSHj7R5DwDjGzVPs1xa49D2c9sR/cfgaXhuJX0w5yGb
	tDW5CV2O/BkCzcNHj/dMHv7vEtsHr6PPqx18yKl+4JCATmCwicd6/a9aJgvafSobowTrBwKW+fSsd
	tRWFRKOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmknw-0000000DNaB-2mxY;
	Thu, 23 Jul 2026 04:13:04 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmkns-0000000DNZK-0521
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 04:13:02 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=L59gGa8NjFg1bSDckxpWx71Mjqfafs/TFzsqxM1X1hM=;
	b=3vCs6pZ+YwUN+DPztHqzehdWPRQrBIh5DnjbeFBK/X1ml0A+bId3sWYzwcMpau8nRd/wuDOXm
	lUYkUr50FKyWhBQfmxj5BC8LJsOprYfUXDpRAJyt1f4OSDoCB5UXA7ef3R7TBG487/3n0+vfz4z
	JbCx5N5abrwDHerw9BtceZ0=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4h5HXy0fCFz1T4Kv;
	Thu, 23 Jul 2026 12:03:30 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id C2BEA40538;
	Thu, 23 Jul 2026 12:12:51 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 23 Jul 2026 12:12:50 +0800
Message-ID: <2f39a7af-597a-4558-8645-9b1534c5373d@huawei.com>
Date: Thu, 23 Jul 2026 12:12:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jinjie Ruan <ruanjinjie@huawei.com>
Subject: Re: [PATCH v2] arm64: syscall: Ensure saved x0 is kept in-sync with
 tracer updates
To: Will Deacon <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <catalin.marinas@arm.com>,
	<kernel-team@android.com>, <linux-kernel@vger.kernel.org>, Kees Cook
	<kees@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Yiqi Sun
	<sunyiqixm@gmail.com>
References: <20260716120640.6590-1-will@kernel.org>
 <178420908877.33796.2351583216856259313.b4-ty@kernel.org>
 <alpsSRyTU_mquZyA@willie-the-truck>
 <8d3d3ea7-b250-4022-8ed7-6d438b43a518@huawei.com>
 <al98jdcleu-6tMDL@willie-the-truck>
In-Reply-To: <al98jdcleu-6tMDL@willie-the-truck>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_211300_378244_D7AD898E 
X-CRM114-Status: GOOD (  35.97  )
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



On 7/21/2026 10:05 PM, Will Deacon wrote:
> Hi Jinjie,
> 
> On Mon, Jul 20, 2026 at 11:48:40AM +0800, Jinjie Ruan wrote:
>> On 7/18/2026 1:54 AM, Will Deacon wrote:
>>> On Thu, Jul 16, 2026 at 05:48:01PM +0100, Will Deacon wrote:
>>>> On Thu, 16 Jul 2026 13:06:39 +0100, Will Deacon wrote:
>>>>> When seccomp support was originally added to arm64 in a1ae65b21941
>>>>> ("arm64: add seccomp support"), seccomp was erroneously called _before_
>>>>> the ptrace syscall-enter-stop and therefore the tracer could trivially
>>>>> manipulate the syscall register state after the seccomp check had
>>>>> passed. This was subsequently fixed in a5cd110cb836 ("arm64/ptrace: run
>>>>> seccomp after ptrace") by moving the seccomp check after the tracer has
>>>>> run. Unfortunately, a decade later, that fix has been reported to be
>>>>> incomplete.
>>>>>
>>>>> [...]
>>>>
>>>> Applied to arm64 (for-next/fixes), thanks!
>>>>
>>>> [1/1] arm64: syscall: Ensure saved x0 is kept in-sync with tracer updates
>>>>       https://git.kernel.org/arm64/c/e057b9477232
>>>
>>> Bah, I've had to revert this. I think Sashiko makes a good point here
>>> that the seccomp interaction is still broken when the filter is
>>> re-evaluated after the tracer stop, because that all happens inside
>>> secure_computing() so we don't get a chance to update 'orig_x0':
>>>
>>> https://sashiko.dev/#/patchset/20260716120640.6590-1-will@kernel.org
>>>
>>
>> Yes, I also think the point raised by Sashiko is meaningful.
>>
>> After reviewing the relevant code, I believe that the issue Sashiko
>> pointed out regarding the compat task also exists.
>>
>> My confusion is that on arm64 compat mode, both audit and trace use
>> orig_x0, but the first parameter used for executing system calls is
>> regs->reg[0]. If x0 is modified at the system call entry point in ptrace
>> but orig_x0 is not modified, or if orig_x0 is modified but x0 is not,
>> then the first parameter for audit and the actual system call being
>> executed will be out of sync. Could there be any issues here? Is it the
>> responsibility of ptrace to ensure that orig_x0 and x0 are synchronized
>> at the system call entry point on arm64 compat mode?
> 
> Even with orig_r0, I think compat suffers from some similar issues here.
> However, I really don't want to diverge from the arch/arm/ behaviour, so
> the 32-bit code should be fixed first if we want to change anything there.

Hi Will,

I will try to clarify whether 32-bit code has similar issues.

> Having said that, I notice we're already different in how we invoke
> audit_syscall_entry() :(

Yes, arm32 use regs->ARM_r0 instead of orig_r0 for audit, which is
different from using orig_x0 for arm64 compat mode.

871 >-------audit_syscall_entry(scno, regs->ARM_r0, regs->ARM_r1,
regs->ARM_r2,
872 >------->------->-------    regs->ARM_r3);

> 
> I also don't know what the correct behaviour should be when both r0 and
> orig_r0 are exposed to the tracer. I have a horrible feeling it probably

Yes, more discussion and historical background research are needed here.
I will try to look into what the correct behavior for ptrace should be
in this context.

> all worked until the API in syscall.h came along, at which point orig_r0
> was suddenly used for more than restarting.
> 
>> Whether it is ptrace or the kernel, ensuring that orig_x0 and x0 are
>> synchronized at the entry point of a system call, I believe it is
>> reasonable to use orig_x0 as the first parameter of the system call
>> execution and pre-set an error code in advance, as this way orig_x0
>> always retains the latest value of x0.
>>
>> diff --git a/arch/arm64/include/asm/syscall_wrapper.h
>> b/arch/arm64/include/asm/syscall_wrapper.h
>> index abb57bc54305..6b13d7c8ad95 100644
>> --- a/arch/arm64/include/asm/syscall_wrapper.h
>> +++ b/arch/arm64/include/asm/syscall_wrapper.h
>> @@ -12,7 +12,7 @@
>>
>>  #define SC_ARM64_REGS_TO_ARGS(x, ...)                          \
>>         __MAP(x,__SC_ARGS                                       \
>> -             ,,regs->regs[0],,regs->regs[1],,regs->regs[2]     \
>> +             ,,regs->orig_x0,,regs->regs[1],,regs->regs[2]     \
>>               ,,regs->regs[3],,regs->regs[4],,regs->regs[5])
> 
> I quite like this idea, but I think we'll have to limit it to native
> (64-bit) tasks. The 32-bit code in arch/arm/ looks like it passes
> regs[0] for the first argument and so tracers could easily be relying on

Yes, compat mode uses regs[0], which is consistent with 32-bit code
behavior, so it is reasonable to only modify 64-bit code.

> that.
> 
> I'll do that as a follow-up patch.

Thank you for doing this.

Best regards,
Jinjie

> 
>>  #ifdef CONFIG_COMPAT
>> diff --git a/arch/arm64/kernel/syscall.c b/arch/arm64/kernel/syscall.c
>> index 2535cae9413d..a978bab59924 100644
>> --- a/arch/arm64/kernel/syscall.c
>> +++ b/arch/arm64/kernel/syscall.c
>> @@ -62,6 +62,7 @@ static __always_inline void el0_svc_common(struct
>> pt_regs *regs, int scno, int s
>>         unsigned long work;
>>
>>         regs->orig_x0 = regs->regs[0];
>> +       syscall_set_return_value(current, regs, -ENOSYS, 0);
> 
> I don't think it's safe to do this unconditionally as tracers could be
> relying on reading X0 with ptrace to retrieve the first syscall argument.
> 
> Will


