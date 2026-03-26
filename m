Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9BEE106F306
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 08:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C5amtAtRHZ72rNdHTDvarx3XPPfDXwH6R2ES1qo6940=; b=Fm4fcvViFdEvqq
	LgfHxMUOcqnnM7Yc8uf/pUBgla8F7MindjsksLt49K8iXZ9uSFRUFL2L7ciWUyaIQtwG6vxLg/SAo
	zt8/Cg9xCE/JvxDzi3w4Js1FW8I7aAux8lt/TWb3VJorUkbKbsVop6aO/njFUKIzZLx97p2fSENAE
	GAMNnESefKp/DB8OVOCf8BuVzjBFDG8NV3RzQhqhJvFmN6t8ZPLvalNVhgchHVV8zVTYhifYOvTdG
	K0eLxovGSU3zbK6eJSzty0HZe9n6ArJfxgne9RHptYvNNLn4OOSYsukLizZDzc30TaiyKt9l2WwtU
	ageTxpGS2gg71XMEZDdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gWY-000000054yj-3tAe;
	Thu, 26 Mar 2026 08:57:06 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gWW-000000054yC-093j
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 08:57:05 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=C5amtAtRHZ72rNdHTDvarx3XPPfDXwH6R2ES1qo6940=;
	b=1+NDixKlNWyhkSDjpVLzGx2OWl9s3QiMsMfWGKC339eKMZvj1fguQKl06UVIEwhz2RBdM61SG
	4zGC3tDxs5/E84P/Mj/zok9ZodMxjJjnaxRhQ3ugIq8WLwfK0YdKSUMaYj3meezS0IAOm9aWdqe
	qSYopO0TVwgEsRMEeydUuYg=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4fhHYN3rNZzmV6K;
	Thu, 26 Mar 2026 16:50:48 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 2743540562;
	Thu, 26 Mar 2026 16:56:56 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 26 Mar 2026 16:56:55 +0800
Message-ID: <bd8dd8fc-d9fa-3340-f069-464adfc557f9@huawei.com>
Date: Thu, 26 Mar 2026 16:56:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 1/2] arm64/entry: Fix involuntary preemption exception
 masking
Content-Language: en-US
To: Thomas Gleixner <tglx@kernel.org>, Mark Rutland <mark.rutland@arm.com>
References: <20260320113026.3219620-1-mark.rutland@arm.com>
 <20260320113026.3219620-2-mark.rutland@arm.com> <87eclek0mb.ffs@tglx>
 <ab1prenkP-tFgUzK@J2N7QTR9R3.cambridge.arm.com> <87341ujwl4.ffs@tglx>
 <ab2EZAXvL6bYcuKt@J2N7QTR9R3.cambridge.arm.com> <87fr5six4d.ffs@tglx>
 <acPAzdtjK5w-rNqC@J2N7QTR9R3> <87ecl7gbeu.ffs@tglx>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <87ecl7gbeu.ffs@tglx>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_015704_434256_8B5C4C1B 
X-CRM114-Status: GOOD (  20.92  )
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
Cc: vladimir.murzin@arm.com, peterz@infradead.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, luto@kernel.org, will@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 2026/3/25 23:46, Thomas Gleixner wrote:
> On Wed, Mar 25 2026 at 11:03, Mark Rutland wrote:
>> On Sun, Mar 22, 2026 at 12:25:06AM +0100, Thomas Gleixner wrote:
>>> The current sequence on entry is:
>>>
>>>   // interrupts are disabled by interrupt/exception entry
>>>   enter_from_kernel_mode()
>>>      irqentry_enter(regs);
>>>      mte_check_tfsr_entry();
>>>      mte_disable_tco_entry();
>>>      daif_inherit(regs);
>>>      // interrupts are still disabled
>>
>> That last comment isn't quite right: we CAN and WILL enable interrupts
>> in local_daif_inherit(), if and only if they were enabled in the context
>> the exception was taken from.
> 
> Ok.
> 
>> As mentioned above, when handling an interrupt (rather than a
>> synchronous exception), we don't use local_daif_inherit(), and instead
>> use a different DAIF function to unmask everything except interrupts.
>>
>>> which then becomes:
>>>
>>>   // interrupts are disabled by interrupt/exception entry
>>>   irqentry_enter(regs)
>>>      establish_state();
>>>      // RCU is watching
>>>      arch_irqentry_enter_rcu()
>>>         mte_check_tfsr_entry();
>>>         mte_disable_tco_entry();
>>>         daif_inherit(regs);
>>>      // interrupts are still disabled
>>>           
>>> Which is equivalent versus the MTE/DAIF requirements, no?
>>
>> As above, we can't use local_daif_inherit() here because we want
>> different DAIF masking behavior for entry to interrupts and entry to
>> synchronous exceptions. While we could pass some token around to
>> determine the behaviour dynamically, that's less clear, more
>> complicated, and results in worse code being generated for something we
>> know at compile time.
> 
> I get it. Duh what a maze.
> 
>> If we can leave DAIF masked early on during irqentry_enter(), I don't
>> see why we can't leave all DAIF exceptions masked until the end of
>> irqentry_enter().
> 
> Yes. Entry is not an issue.
> 
>> I *think* what would work for us is we could split some of the exit
>> handling (including involuntary preemption) into a "prepare" step, as we
>> have for return to userspace. That way, arm64 could handle exiting
>> something like:
>>
>> 	local_irq_disable();
>> 	irqentry_exit_prepare(); // new, all generic logic
>> 	local_daif_mask();
>> 	arm64_exit_to_kernel_mode() {
>> 		...
>> 		irqentry_exit(); // ideally irqentry_exit_to_kernel_mode().
>> 		...
>> 	}
>>
>> ... and other architectures can use a combined exit_to_kernel_mode() (or
>> whatever we call that), which does both, e.g.
>>
>> 	// either noinstr, __always_inline, or a macro
>> 	void irqentry_prepare_and_exit(void)
> 
> That's a bad idea as that would require to do a full kernel rename of
> all existing irqentry_exit() users.

I see your point about the rename. However, we can avoid a tree-wide
rename by keeping the irqentry_exit() name and interface exactly as it is.
The idea is to perform an internal refactoring: split the existing logic
into two helpers (e.g., irqentry_exit_prepare() and a core helper), and
then have the original irqentry_exit() call both of them. This way,
existing users like RISC-V remain untouched, while arm64 can choose to
call the two sub-functions individually to insert the DAIF masking in
between."

> 
>> 	{
>> 		irqentry_exit_prepare();
>> 		irqentry_exit();
>> 	}
> 
> Aside of the naming that should work.
> 
> Thanks,
> 
>         tglx
> 
> 
> 
> 
> 

