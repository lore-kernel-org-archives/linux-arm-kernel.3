Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D34C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 18:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P+bGKrVdNNAGbL3UvcGr0rJCn0rZL6e6bELkPoLaqak=; b=o3nV0Z/Gz3AVW6
	KEMRu7KqbBD4wiP2xX8yfp3cssJB825gFRK5Qu5+FI5P6ME74HMThL10vew6ioGguNs15t1o7WqIp
	jFE+uZTixmKGjnqKNaiRekNJQI7RjqCYpnjfbKyyrfS4xxI2KDwKlFSxi4B0AlEjVFgCJRyQLHYJP
	iTFR2p+FsG8KTn7EE3CK0cs9pSVqlK9RAtdIOOZ6mxdSxvnbu7PKxmbEk2qrO7Zrb430QoQuhX8K8
	OpfSa+Ajvjpy5vQUlFdOXVdJhf+BNa+kRAI+TkhNS+NaNHJaNa4DPHgtLkqLOZrQSUm/br7R03iIF
	wXQIBPRAVxM8Nw0M8MGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf0o6-00000008DnY-3qiT;
	Thu, 24 Jul 2025 18:36:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf05b-000000089js-0WbN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 17:50:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF5482B;
	Thu, 24 Jul 2025 10:50:35 -0700 (PDT)
Received: from [10.57.3.78] (unknown [10.57.3.78])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5419D3F6A8;
	Thu, 24 Jul 2025 10:50:40 -0700 (PDT)
Message-ID: <f30c1eaf-6f5b-46c8-8d6c-fa81880da0cc@arm.com>
Date: Thu, 24 Jul 2025 18:50:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/entry: Mask DAIF in cpu_switch_to(),
 call_on_irq_stack()
To: Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>
References: <20250718142814.133329-1-ada.coupriediaz@arm.com>
 <aH5MPwJJzFZxOtfr@willie-the-truck>
 <CAMj1kXG40=hymhdL1GM0dDfp3F_-TzYqzkda3DY1CSRGAhme+g@mail.gmail.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <CAMj1kXG40=hymhdL1GM0dDfp3F_-TzYqzkda3DY1CSRGAhme+g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_105043_264891_863C2A0C 
X-CRM114-Status: GOOD (  32.40  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, Cristian Prundeanu <cpru@amazon.com>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

I think this has been clarified offline (?), but answering for the list.

On 22/07/2025 06:31, Ard Biesheuvel wrote:

> (cc Sami)
>
> On Tue, 22 Jul 2025 at 00:18, Will Deacon <will@kernel.org> wrote:
>> On Fri, Jul 18, 2025 at 03:28:14PM +0100, Ada Couprie Diaz wrote:
>>> `cpu_switch_to()` and `call_on_irq_stack()` manipulate SP to change
>>> to different stacks along with the Shadow Call Stack if it is enabled.
>>> Those two stack changes cannot be done atomically and both functions
>>> can be interrupted by SErrors or Debug Exceptions which, though unlikely,
>>> is very much broken : if interrupted, we can end up with mismatched stacks
>>> and Shadow Call Stack leading to clobbered stacks.
>>>
>>> In `cpu_switch_to()`, it can happen when SP_EL0 points to the new task,
>>> but x18 stills points to the old task's SCS. When the interrupt handler
>>> tries to save the task's SCS pointer, it will save the old task
>>> SCS pointer (x18) into the new task struct (pointed to by SP_EL0),
>>> clobbering it.
>>>
> In this case, the 'interrupt handler' is not the entry code, but
> call_on_irq_stack(), right?

That is correct yes.

[...]

> So AIUI, the problem is that both cpu_switch_to() and
> call_on_irq_stack() itself can be interrupted by the latter, resulting
> in the shadow call stack pointer recorded in the task struct to be
> incorrect, either because the task struct pointer is pointing to the
> wrong task, or the shadow stack pointer is pointing to the wrong
> stack.

Exactly : that is what I was trying to fix, which is why the commit message
is focused on this.

However, as per the other thread there's potentially other issues here
that I was not well aware of at the time for which masking DAIF is still
beneficial.

>
> Commit 59b37fe52f49955 changed this code to ensure that the shadow
> stack pointer is not preserved to/restored from the ordinary stack,
> because that turns call_on_irq_stack() into a rather useful gadget but
> use the task struct instead.
>
> What we could do instead is record the caller's SCS pointer on the IRQ
> shadow stack, avoiding the task struct altogether. This should be the
> only occurrence of scs_save that may interrupt cpu_switch_to(), so it
> should address both issues AFAICT.
Will has pulled the DAIF fix as per the other discussion, but I did test 
with
your patch below : it does indeed fix the panics that were reported
with pNMI+SCS as far as I can tell.

Thanks for the details !
Ada

> The only minor issue is that loading the IRQ shadow stack pointer
> before assigning SP is problematic, because when call_on_irq_stack()
> is re-entered over the top of an exception that is taken at that
> point, the clobbering of scs_sp will interfere with the return from
> that exception, and so scs_sp should be left untouched until after SP
> is assigned (which is what prevents call_on_irq_stack() from
> re-entering). This creates a tiny window where we may end up servicing
> a (nested) IRQ running on the IRQ stack but on the task shadow stack,
> but I don't think that is a thing to obsess about tbh. (Sami?) If it
> is, we'll need your DAIF changes to turn that into a proper critical
> section, but I doubt whether that is necessary.
>
>
> --- a/arch/arm64/kernel/entry.S
> +++ b/arch/arm64/kernel/entry.S
> @@ -874,12 +874,6 @@ NOKPROBE(ret_from_fork)
>    * Calls func(regs) using this CPU's irq stack and shadow irq stack.
>    */
>   SYM_FUNC_START(call_on_irq_stack)
> -#ifdef CONFIG_SHADOW_CALL_STACK
> -       get_current_task x16
> -       scs_save x16
> -       ldr_this_cpu scs_sp, irq_shadow_call_stack_ptr, x17
> -#endif
> -
>          /* Create a frame record to save our LR and SP (implicit in FP) */
>          stp     x29, x30, [sp, #-16]!
>          mov     x29, sp
> @@ -888,7 +882,23 @@ SYM_FUNC_START(call_on_irq_stack)
>
>          /* Move to the new stack and call the function there */
>          add     sp, x16, #IRQ_STACK_SIZE
> +#ifdef CONFIG_SHADOW_CALL_STACK
> +       mov     x16, scs_sp
> +       ldr_this_cpu scs_sp, irq_shadow_call_stack_ptr, x17
> +#ifdef CONFIG_DYNAMIC_SCS
> +       cbz     scs_sp, 0f
> +#endif
> +       str     x16, [scs_sp], #8
> +0:
> +#endif
>          blr     x1
> +#ifdef CONFIG_SHADOW_CALL_STACK
> +#ifdef CONFIG_DYNAMIC_SCS
> +       cbz     scs_sp, 1f
> +#endif
> +       ldr     scs_sp, [scs_sp, #-8]
> +1:
> +#endif
>
>          /*
>           * Restore the SP from the FP, and restore the FP and LR from the
> @@ -896,7 +906,6 @@ SYM_FUNC_START(call_on_irq_stack)
>           */
>          mov     sp, x29
>          ldp     x29, x30, [sp], #16
> -       scs_load_current
>          ret
>   SYM_FUNC_END(call_on_irq_stack)
>   NOKPROBE(call_on_irq_stack)

