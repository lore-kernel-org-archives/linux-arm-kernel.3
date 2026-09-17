Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F01AFC982CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 01:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aOKc3GAX/DzVO/6pOM5G/XYbmrZwk8wVPbh4MkPLzqQ=; b=Sq3/vKXAOYYuC1Ro1uLmZcHIcy
	IYQkYWFNroxnP+G3+uKLdUUlHty20NAZlgudWJgg9EpwIRz1rq2+q7gxdVJpZ6O1qgEdDsyQzXtVK
	WcXliYtL0VjyyTZg7ZB3kBeWy2qIJNk5+6lGYkI453/JTDKSghmL0du9ImFAgSCmEYqqLyQRs9Hu4
	nDnINkin1uw9FOWFciEVVBXPjiS5wKivwPnVElovsuhul8K3fuWuvGVvcGQGu58P+ilBlemT7F9ZY
	w9JPJwggKKbNPsBGi1ea1iEkpM9cUxmxJQsD/oSALJEeoogvfzvbm24u+4vXV44egyBBoRR3+HsBG
	RVFh2lvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x70Zo-0000000ANxR-0ion;
	Thu, 17 Sep 2026 01:06:12 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x70Zk-0000000ANx4-2Ngz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 01:06:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=aOKc3GAX/DzVO/6pOM5G/XYbmrZwk8wVPbh4MkPLzqQ=; b=c5X+lKH9a7oYqzQuFsSU95KQqk
	hEU+bBiBtc/rK/h1uO1JctQKYG0gBcurBp2bzk2YyIa3pRSEwkAuWv816qQtTjHu8DFND9UD3c7cp
	Ak6cxgjxzHKN7X/3Bhy7C1HJ83LVWh/juo4wTygdpJK2hqGwgsCSEZdBOEnGBk6TwXI/XHPQW4xz5
	rcc+GXDmPUYoaENkDLuXpzDBmtW9Oo3LN1XDcSqKBldHVsUsjRImj1qbluGYCcLjungiF4HMGy8Wm
	U5yiWU3u0Zi1Hiuo6WPT02TE/ogy7o6E6mtMvau0Tdfquns3ERICyX4eBAJykKjDAvX5tgufCCMss
	ol5XfzdQ==;
Received: from [177.172.123.214] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1x70ZI-003BpB-F1; Thu, 17 Sep 2026 03:05:40 +0200
Message-ID: <4cc1a199-8917-4a93-91f8-138ca1511cff@igalia.com>
Date: Wed, 16 Sep 2026 22:05:38 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/4] arm64: vdso: Prepare for robust futex unlock
 support
To: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Peter Zijlstra <peterz@infradead.org>, Florian Weimer <fweimer@redhat.com>,
 Darren Hart <dvhart@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 Davidlohr Bueso <dave@stgolabs.net>, Arnd Bergmann <arnd@arndb.de>,
 Uros Bizjak <ubizjak@gmail.com>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
 <linux@weissschuh.net>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 kernel-dev@igalia.com
References: <20260821-tonyk-robust_arm-v8-0-077707b6f1c7@igalia.com>
 <20260821-tonyk-robust_arm-v8-1-077707b6f1c7@igalia.com>
 <aqqmmNTDnzT5d-ZT@J2N7QTR9R3>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <aqqmmNTDnzT5d-ZT@J2N7QTR9R3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_180608_799725_2FDBF36D 
X-CRM114-Status: GOOD (  41.40  )
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

Em 16/09/2026 11:24, Mark Rutland escreveu:
> Hi André,
> 
> I have a few comments here; mostly minor nits.
> 

Thanks for the review!

> On Fri, Aug 21, 2026 at 06:50:42PM -0300, André Almeida wrote:
>> To solve the robust futex's list_pending_op clearing race condition,
>> prepare for implement __vdso_futex_robust_try_unlock() for arm64 with the
>> following steps:
>>
>> - Create a helper function that sets the struct futex_mm_data with the
>> VDSO's labels addresses. The robust futex fixup mechanism needs to
>> compare the current instruction pointer to the VDSO instructions range.
>>
>> - Split vdso_mremap() in vdso_mremap() and aarch32_mremap(), this allows
>> the VDSO to be setup correctly regarding the instructions addresses for
>> both ABIs when a mremap happens.
> 
> When I commented back on v5, I'd meant that the mremap changes should be
> a separate patch. I've included a patch for that below; are you're happy
> to take that as a prefix of this series?
> 

Sure thing, thanks for the patch :)

>> - Implement arch_futex_robust_unlock_get_pop() for arm64, checking for r2
>> and r3 registers values for the fixup function. The role of this registers
>> is explained in the commit that implement the assembly portion of the VDSO.
>>
>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>> ---
>> v6:
>>   - Restructured this commit. Move the arch bits away, kept just the
>>   generic/helper functions.
>>
>> v4:
>> - Guard symbols from vdso.lds.S with ifdef
>> - drop update_ips() from sigpage remap function
>>
>> v3:
>>   - Fix adding vdso base addr twice
>>   - Call vdso_futex_robust_unlock_update_ips() on remap as well
>> v2:
>>   - Fixed linker not finding VDSO symbols
>> ---
>> ---
>>   arch/arm64/include/asm/futex_robust.h | 19 +++++++++++++++++++
>>   arch/arm64/kernel/vdso.c              | 27 ++++++++++++++++++++++++++-
>>   2 files changed, 45 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/include/asm/futex_robust.h b/arch/arm64/include/asm/futex_robust.h
>> new file mode 100644
>> index 000000000000..4ff783bb2dc3
>> --- /dev/null
>> +++ b/arch/arm64/include/asm/futex_robust.h
>> @@ -0,0 +1,19 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +#ifndef _ASM_ARM64_FUTEX_ROBUST_H
>> +#define _ASM_ARM64_FUTEX_ROBUST_H
>> +
>> +#include <asm/ptrace.h>
>> +
>> +static __always_inline void __user *arm64_futex_robust_unlock_get_pop(struct pt_regs *regs)
>> +{
>> +	/*
>> +	 * w3 stores the result of the stlxr instruction. If it's zero, the then
>> +	 * the ll/sc cmpxchg succeeded and the pending op pointer needs to be cleared.
>> +	 */
> 
> It would be good if the comment could refer to the functions with the
> critical sections, e.g.
> 
> 	/*
> 	 * In the asm for __vdso_futex_robust_list{64,32}_try_unlock(), ...
> 	 */
> 
> That way it will be easier for folk to cross-reference this later.
> 
>> +	return (regs->user_regs.regs[3]) ? NULL : (void __user *) regs->user_regs.regs[2];
> 
> You can use 'regs->regs[n]' in place of 'regs->user_regs.regs[n]' here,
> which will make this a bit shorter and easier to read.
> 
> I reckon this might also be clearer as:
> 
> | 	if (regs->regs[3])
> | 		return NULL;
> | 	
> | 	return (void __user *)regs->regs[2];
> 
> Do we need a __force cast here, or is sparse happy without that?

I've just re-compiled those patches with C=1, and didn't find any 
warning for this.

> 
>> +}
>> +
>> +#define arch_futex_robust_unlock_get_pop(regs) \
>> +	arm64_futex_robust_unlock_get_pop(regs)
>> +
>> +#endif /* _ASM_ARM64_FUTEX_ROBUST_H */
>> diff --git a/arch/arm64/kernel/vdso.c b/arch/arm64/kernel/vdso.c
>> index 592dd8668de4..3ef331b5b240 100644
>> --- a/arch/arm64/kernel/vdso.c
>> +++ b/arch/arm64/kernel/vdso.c
>> @@ -11,6 +11,7 @@
>>   #include <linux/clocksource.h>
>>   #include <linux/elf.h>
>>   #include <linux/err.h>
>> +#include <linux/futex.h>
>>   #include <linux/errno.h>
>>   #include <linux/gfp.h>
>>   #include <linux/kernel.h>
>> @@ -57,6 +58,22 @@ static struct vdso_abi_info vdso_info[] __ro_after_init = {
>>   #endif /* CONFIG_COMPAT_VDSO */
>>   };
>>   
>> +#ifdef CONFIG_FUTEX_ROBUST_UNLOCK
>> +static inline void __vdso_futex_update_ips(struct mm_struct *mm, bool is_32bit, void *startp,
>> +					   void *endp)
>> +{
>> +	unsigned long start = (unsigned long) startp;
>> +	unsigned long end = (unsigned long) endp;
> 
> Nit: there shouldn't be a space between the cast and the expression:
> 
> 	unsigned long start = (unsigned long)startp;
> 	unsigned long end = (unsigned long)endp;
> 
>> +	struct futex_mm_data *fd = &mm->futex;
>> +
>> +	futex_set_vdso_cs_range(fd, is_32bit ? 1 : 0, start, end, is_32bit);
> 
> On arm64 (and every architecture other than x86, AFAICT), the
> native/compat VDSOs are mutually exclusive, and a single mm can only
> have one of them.
> 
> Given that, I think we can make this:
> 
> 	futex_set_vdso_cs_range(fd, 0, start, end, is_32bit);
> 
> That way we'll avoid confusing/bikesheeding over 'is_32bit ? 1 : 0',
> without having to add mnemnonics for the native/compat CS indices.

Perfect, I will simplify that then.

> 
> That said, what's the plan for 32-bit robust lists on a 64-bit host?
> IIUC you wanted that for emulation, and AFAICT you have no way to call
> __vdso_futex_robust_list32_try_unlock() from a native task.

Yes, the plan is to be able to use the 32-bit robust lists on a 64-bit 
hosts, with a new interface (set/get_robust_list2[1]). That means that a 
64-bit kernel will be able to process an user robust list made of 32-bit 
pointers. So the emulator will call set_robust_list2() one time for it's 
own list, and another time for the emulated app list.

However, what we have agreed for the moment is that, while there's no 
support for that, we will not expose the 32-bit functions yet [2]:

"...that requires also the ability to register a 32-bit robust list for 
a 64-bit process, which is not supported right now. So no, we are not 
exposing something half functional..."

So yes, in the near future I will need to expose 
__vdso_futex_robust_list32_try_unlock() to 64-bit apps as well, to be 
able to do this handling with 32-bit pointers, but we are not doing it 
right now.

[1] 
https://lore.kernel.org/lkml/20251122-tonyk-robust_futex-v6-0-05fea005a0fd@igalia.com/

[2] https://lore.kernel.org/lkml/878q9vwote.ffs@tglx/


