Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 238F3CFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 15:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r2j1WT/JPisBzFeuejv5Ew7uC27JuAkmwt9Wvom+d2o=; b=UcMaORsSVrYrWfZ7Npp445AIpn
	36Mu+0L8/u9BSwxDlM3et1hog1Mf3vK8L3oWj2pm0B+5PSbqb0JhNp21J+6Pt+naoBf9mDJ8E3iCa
	f14r3ANuxH3Er+X3V+QzIbxCOWWWrfeZqSnAqyvSnRDOuWUBdfZjB0X6XWGV/y790b1vP1m7xa1Sw
	RR8NEiDkHeZlCklBRD8+XCKpslrpHTcP304Ouv4bdSSRE5UhO8DiV3BTIjfJ44sYUkZUZS0EpIPLH
	jLEdTXIz2Tujk2mHXPYeG6YjH+MwJunbPVttXeyHUmS998QOn0d7d6qquAsRCjhOdCDp+f0VCSsXG
	bcvcDvkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNYPI-0000000Buf2-3yar;
	Mon, 24 Nov 2025 15:23:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNYPG-0000000Buef-2J5z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 15:23:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F081497;
	Mon, 24 Nov 2025 07:23:01 -0800 (PST)
Received: from [10.57.40.218] (unknown [10.57.40.218])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 02BE23F73B;
	Mon, 24 Nov 2025 07:23:03 -0800 (PST)
Message-ID: <247aa84f-0550-42d9-8d65-615297e78a74@arm.com>
Date: Mon, 24 Nov 2025 16:23:01 +0100
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
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <8489ee0d-8b9c-080a-04a0-b299549e86cf@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_072310_866540_0E2C48F3 
X-CRM114-Status: GOOD (  15.04  )
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

On 24/11/2025 10:34, Jinjie Ruan wrote:
>
> On 2025/11/19 1:13, Kevin Brodsky wrote:
>> On 17/11/2025 14:30, Jinjie Ruan wrote:
>>> [...]
>>>
>>> diff --git a/kernel/entry/syscall-common.c b/kernel/entry/syscall-common.c
>>> index 66e6ba7fa80c..27310e611567 100644
>>> --- a/kernel/entry/syscall-common.c
>>> +++ b/kernel/entry/syscall-common.c
>>> @@ -17,6 +17,25 @@ static inline void syscall_enter_audit(struct pt_regs *regs, long syscall)
>>>  	}
>>>  }
>>>  
>>> +/**
>>> + * arch_ptrace_report_syscall_entry - Architecture specific
>>> + *				      ptrace_report_syscall_entry().
>>> + *
>>> + * Invoked from syscall_trace_enter() to wrap ptrace_report_syscall_entry().
>>> + * Defaults to ptrace_report_syscall_entry.
>>> + *
>>> + * The main purpose is to support arch-specific ptrace_report_syscall_entry()
>>> + * implementation.
>>> + */
>>> +static __always_inline int arch_ptrace_report_syscall_entry(struct pt_regs *regs);
>>> +
>>> +#ifndef arch_ptrace_report_syscall_entry
>>> +static __always_inline int arch_ptrace_report_syscall_entry(struct pt_regs *regs)
>>> +{
>>> +	return ptrace_report_syscall_entry(regs);
>> I saw that Thomas suggested this approach on v4, and it makes sense to
>> me, but I find the naming surprising. If an architecture does need extra
>> handling, then the generic function should never be called from generic
>> code. So it seems to me that the more logical change would be:
>>
>> * Rename: ptrace_report_syscall_entry -> __ptrace_report_syscall_entry
>> * Introduce ptrace_report_syscall_entry(), defaults to
>> __ptrace_report_syscall_entry()
> If ptrace_report_syscall_entry() is defined in linux/ptrace.h, and an
> architecture also needs to redefine this function, but the
> architecture's own <asm/entry-common.h> must include <linux/ptrace.h>,
> the function will end up being defined twice and cause a "duplicate
> definition" compile error.

There's plenty of arch-defined functions in <linux/ptrace.h> already.
__ptrace_report_syscall_entry() should be defined inside an #ifndef and
architectures can define their own implementation in <asm/ptrace.h>,
like force_successful_syscall_return() for instance.

- Kevin

>> All this would be done in <linux/ptrace.h>, where it clearly belongs.
>> The __ prefix makes it clear that the generic function is not the main
>> interface. Even better, no need to change any caller with that approach.
>>
>> - Kevin
>>
>>> [...]

