Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE709109C033
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 15:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q1LS0X8D9rZPgYlkNBeJn/Dx7bozYXvugGmOCFqbL4g=; b=443FjHkjFGc18ld5wCllsqqBFl
	Vniyieael1n3YCH/e+hfDjpuCs52TBby9bgnSxhNCVF/hIBtD2Vk5sbwij1nWzgR/+R/kbef7GvYP
	g7t5OpLvQ5cECklzxsF/uor8Cho/XlqYDxVYFkXNfC2uh2HIHgShqTGAdI6EM1DdPjRWAuGAZYPaC
	0vyvMw/sdb+hK29rrh/6wwjKCrVEFsrq7TeVDR4ZvwCVFFXSzsqeUnafRk6gEDbPBr8QihaSM/0J2
	eJmLkH5YfbgfEr/jIrhoo3lX3nMEmB4j1G9ufBp9QTISt3hFyJc3+6YRd+XENrzvPAsCZwMcI2s5z
	5SBScsDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5QQr-00000003oZB-2FhL;
	Wed, 25 Mar 2026 15:46:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5QQo-00000003oYp-2NFg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 15:46:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6A37644059;
	Wed, 25 Mar 2026 15:46:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A706C4CEF7;
	Wed, 25 Mar 2026 15:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774453565;
	bh=arMQUtpWwBD53gpZC5IP4lyPB/8JTDtY7XN8FKKRdJw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=f7Pvn7FOqlxQL5CTuUG3hf1FdjCwUJoHZtWXhRQBXygUAT8aAaPSzaqN+LuH9zCt0
	 ZrHG5KjFAlPW4BGx0wD2hX3P6/4CQDH3VlC6SQ5/2NoVHRoCSJExAt/IjoTjHmJJ1P
	 Ig+Uf3Tzh0Ba5/BGSMMzMjrFIs2F6BrT8132jwo33eb3JBPrz0vYibk6PCTJ5/5FlN
	 PrgcuwOJCwktxtZNEldGT/5XrdyyU6sg4jbWQy/wt3CMOE4nVFagrt95JLOoS+nYbZ
	 XbJ29EGeQqHNyvtXnwITA5yggwUwYnRXnDZKMyt0RKc6UnnnKDgA+MhEFdnpOTCNbo
	 kAkabPaEfIgpw==
From: Thomas Gleixner <tglx@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/2] arm64/entry: Fix involuntary preemption exception
 masking
In-Reply-To: <acPAzdtjK5w-rNqC@J2N7QTR9R3>
References: <20260320113026.3219620-1-mark.rutland@arm.com>
 <20260320113026.3219620-2-mark.rutland@arm.com> <87eclek0mb.ffs@tglx>
 <ab1prenkP-tFgUzK@J2N7QTR9R3.cambridge.arm.com> <87341ujwl4.ffs@tglx>
 <ab2EZAXvL6bYcuKt@J2N7QTR9R3.cambridge.arm.com> <87fr5six4d.ffs@tglx>
 <acPAzdtjK5w-rNqC@J2N7QTR9R3>
Date: Wed, 25 Mar 2026 16:46:01 +0100
Message-ID: <87ecl7gbeu.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_084606_655707_CC9D58AC 
X-CRM114-Status: GOOD (  20.12  )
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
Cc: vladimir.murzin@arm.com, peterz@infradead.org, catalin.marinas@arm.com, ruanjinjie@huawei.com, linux-kernel@vger.kernel.org, luto@kernel.org, will@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Mar 25 2026 at 11:03, Mark Rutland wrote:
> On Sun, Mar 22, 2026 at 12:25:06AM +0100, Thomas Gleixner wrote:
>> The current sequence on entry is:
>> 
>>   // interrupts are disabled by interrupt/exception entry
>>   enter_from_kernel_mode()
>>      irqentry_enter(regs);
>>      mte_check_tfsr_entry();
>>      mte_disable_tco_entry();
>>      daif_inherit(regs);
>>      // interrupts are still disabled
>
> That last comment isn't quite right: we CAN and WILL enable interrupts
> in local_daif_inherit(), if and only if they were enabled in the context
> the exception was taken from.

Ok.

> As mentioned above, when handling an interrupt (rather than a
> synchronous exception), we don't use local_daif_inherit(), and instead
> use a different DAIF function to unmask everything except interrupts.
>
>> which then becomes:
>> 
>>   // interrupts are disabled by interrupt/exception entry
>>   irqentry_enter(regs)
>>      establish_state();
>>      // RCU is watching
>>      arch_irqentry_enter_rcu()
>>         mte_check_tfsr_entry();
>>         mte_disable_tco_entry();
>>         daif_inherit(regs);
>>      // interrupts are still disabled
>>           
>> Which is equivalent versus the MTE/DAIF requirements, no?
>
> As above, we can't use local_daif_inherit() here because we want
> different DAIF masking behavior for entry to interrupts and entry to
> synchronous exceptions. While we could pass some token around to
> determine the behaviour dynamically, that's less clear, more
> complicated, and results in worse code being generated for something we
> know at compile time.

I get it. Duh what a maze.

> If we can leave DAIF masked early on during irqentry_enter(), I don't
> see why we can't leave all DAIF exceptions masked until the end of
> irqentry_enter().

Yes. Entry is not an issue.

> I *think* what would work for us is we could split some of the exit
> handling (including involuntary preemption) into a "prepare" step, as we
> have for return to userspace. That way, arm64 could handle exiting
> something like:
>
> 	local_irq_disable();
> 	irqentry_exit_prepare(); // new, all generic logic
> 	local_daif_mask();
> 	arm64_exit_to_kernel_mode() {
> 		...
> 		irqentry_exit(); // ideally irqentry_exit_to_kernel_mode().
> 		...
> 	}
>
> ... and other architectures can use a combined exit_to_kernel_mode() (or
> whatever we call that), which does both, e.g.
>
> 	// either noinstr, __always_inline, or a macro
> 	void irqentry_prepare_and_exit(void)

That's a bad idea as that would require to do a full kernel rename of
all existing irqentry_exit() users.

> 	{
> 		irqentry_exit_prepare();
> 		irqentry_exit();
> 	}

Aside of the naming that should work.

Thanks,

        tglx





