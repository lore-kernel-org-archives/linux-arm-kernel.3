Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B8CD0E6DF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 13:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fu2j3Z8jbZ+kpNaRrM/0NBec0F/o4Ciz6mw9E1Xq4KY=; b=gu2YGfvRK2t01Zbzy9R7su2peh
	IZ3HNNFbcJD+lRuJSmnTAUwOzHu5WyTwI0JsSCMDzCfItZDJQXT/HemPjOtxWx1tX+bsKdHFf1ohX
	TikkNqmVwkMy30uxI4xHFSYYXVRculpamnt0YAHfwK2ZpgfG/5m33Ys45apuzrQsdKneJpDmgq8za
	KbnboPES2nhTCZ7oIk665zCGIzb9OGz02r33CoujT5MzyWo5nKBQF1p5STbSuled+onuzUsj21zTK
	u+D7SNPHWZRFYzdtle/0hREJ+AO89SDt8BCtqtKoNxcWLym7dgs6Pbzzky2C62HRkvjOUTkggLlk0
	0+03XqJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNsow-0000000DK45-2dJi;
	Tue, 25 Nov 2025 13:11:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNsot-0000000DK3i-3DJ1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 13:11:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 327A51684;
	Tue, 25 Nov 2025 05:10:51 -0800 (PST)
Received: from [10.44.160.56] (e126510-lin.lund.arm.com [10.44.160.56])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 82DA93F73B;
	Tue, 25 Nov 2025 05:10:52 -0800 (PST)
Message-ID: <1a8034b2-bb8f-4e73-b205-11453df6d02b@arm.com>
Date: Tue, 25 Nov 2025 14:10:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 08/11] entry: Add
 arch_ptrace_report_syscall_entry/exit()
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
 <20251117133048.53182-9-ruanjinjie@huawei.com>
 <55e1345f-94d7-41a9-8f0a-694fd56f63ed@arm.com>
 <8489ee0d-8b9c-080a-04a0-b299549e86cf@huawei.com>
 <247aa84f-0550-42d9-8d65-615297e78a74@arm.com>
 <48b7443a-2dd9-9764-fbe5-12dc9eef1363@huawei.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <48b7443a-2dd9-9764-fbe5-12dc9eef1363@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_051059_943580_4898E5AE 
X-CRM114-Status: GOOD (  17.97  )
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

On 25/11/2025 03:43, Jinjie Ruan wrote:
>
> On 2025/11/24 23:23, Kevin Brodsky wrote:
>> On 24/11/2025 10:34, Jinjie Ruan wrote:
>>> On 2025/11/19 1:13, Kevin Brodsky wrote:
>>>> On 17/11/2025 14:30, Jinjie Ruan wrote:
>>>>> [...]
>>>>>
>>>>> diff --git a/kernel/entry/syscall-common.c b/kernel/entry/syscall-common.c
>>>>> index 66e6ba7fa80c..27310e611567 100644
>>>>> --- a/kernel/entry/syscall-common.c
>>>>> +++ b/kernel/entry/syscall-common.c
>>>>> @@ -17,6 +17,25 @@ static inline void syscall_enter_audit(struct pt_regs *regs, long syscall)
>>>>>  	}
>>>>>  }
>>>>>  
>>>>> +/**
>>>>> + * arch_ptrace_report_syscall_entry - Architecture specific
>>>>> + *				      ptrace_report_syscall_entry().
>>>>> + *
>>>>> + * Invoked from syscall_trace_enter() to wrap ptrace_report_syscall_entry().
>>>>> + * Defaults to ptrace_report_syscall_entry.
>>>>> + *
>>>>> + * The main purpose is to support arch-specific ptrace_report_syscall_entry()
>>>>> + * implementation.
>>>>> + */
>>>>> +static __always_inline int arch_ptrace_report_syscall_entry(struct pt_regs *regs);
>>>>> +
>>>>> +#ifndef arch_ptrace_report_syscall_entry
>>>>> +static __always_inline int arch_ptrace_report_syscall_entry(struct pt_regs *regs)
>>>>> +{
>>>>> +	return ptrace_report_syscall_entry(regs);
>>>> I saw that Thomas suggested this approach on v4, and it makes sense to
>>>> me, but I find the naming surprising. If an architecture does need extra
>>>> handling, then the generic function should never be called from generic
>>>> code. So it seems to me that the more logical change would be:
>>>>
>>>> * Rename: ptrace_report_syscall_entry -> __ptrace_report_syscall_entry
>>>> * Introduce ptrace_report_syscall_entry(), defaults to
>>>> __ptrace_report_syscall_entry()
>>> If ptrace_report_syscall_entry() is defined in linux/ptrace.h, and an
>>> architecture also needs to redefine this function, but the
>>> architecture's own <asm/entry-common.h> must include <linux/ptrace.h>,
>>> the function will end up being defined twice and cause a "duplicate
>>> definition" compile error.
>> There's plenty of arch-defined functions in <linux/ptrace.h> already.
>> __ptrace_report_syscall_entry() should be defined inside an #ifndef and
>> architectures can define their own implementation in <asm/ptrace.h>,
>> like force_successful_syscall_return() for instance.
> Shared functions like ptrace_report_syscall() are all defined in
> <linux/ptrace.h>.
> When we want to override __ptrace_report_syscall_entry() in
> <asm/ptrace.h> we still have to include <linux/ptrace.h> again,then the
> redefine problem occurs again.
>
> What we actually need to reuse is ptrace_report_syscall_entry() (or
> __ptrace_report_syscall_entry()).

You're right, this is yet another of those circular definition problems...

> The arch version need to reuse and wrap ptrace_report_syscall_entry(),
> because for instance arm64 needs to perform additional operations before
> and after this step. Therefore, I believe the current implementation is
> appropriate.

I'm still not fond of arch_X() wrapping X() as this is unusual, but I
don't have a better idea so let's stick to that. It also makes sense to
have this done in syscall-common.c rather than a header considering the
risk of circular dependency.

- Kevin

