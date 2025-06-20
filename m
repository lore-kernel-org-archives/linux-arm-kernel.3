Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF57C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 22:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B04AT7MFHG8Yb9RGYoXRnuyNJElKUcMmWAkRLE6Mm40=; b=UNk3cIyTMnzuFx
	DTW8tquGG2NSacV+hvLwhhsOQj7G6fytuhehYAWPc4l468vze/Z6OjqjEj66CsBN/81XW56d7Hhkl
	LZxsX/esxFdnnZSAo/AidSMKjJuZiG34+13r0YApw87sbvcDmKl1SDaoCG+7B+/7s1haN15q7tsyk
	MMHucnsQgy81z6Y7+bdQX20gELPgFqd+MrTNe9Yz3XP28NvKLhzC4G/zCJP9msoI39mw41bDCReYu
	SsEmbl39AZYHQhoLJNdblaKFTO3d5Q3LY+/ailcllpCYPL+0hiZA/IlL78CNMAMtiYudCBpVwwEIL
	MB7ASEeDJlfXR+yag8PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSjnQ-0000000Gfsb-46LK;
	Fri, 20 Jun 2025 22:01:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSjAK-0000000GbcW-0Rhv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 21:20:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BAD12169C;
	Fri, 20 Jun 2025 14:20:31 -0700 (PDT)
Received: from [10.57.50.192] (unknown [10.57.50.192])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F28A3F673;
	Fri, 20 Jun 2025 14:20:49 -0700 (PDT)
Message-ID: <6407b655-c5b8-4dc9-bdca-51b04c8f5306@arm.com>
Date: Fri, 20 Jun 2025 22:20:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/13] arm64: debug: split single stepping exception
 entry
To: Mark Rutland <mark.rutland@arm.com>
References: <20250609173413.132168-1-ada.coupriediaz@arm.com>
 <20250609173413.132168-10-ada.coupriediaz@arm.com>
 <aFLjLYIF8U1wFq7U@J2N7QTR9R3.cambridge.arm.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <aFLjLYIF8U1wFq7U@J2N7QTR9R3.cambridge.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_142052_195254_34F35B5E 
X-CRM114-Status: GOOD (  18.79  )
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
Cc: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 18/06/2025 17:02, Mark Rutland wrote:

> This looks good; one comment below.
>
> On Mon, Jun 09, 2025 at 06:34:09PM +0100, Ada Couprie Diaz wrote:
>> +void do_softstep(unsigned long esr, struct pt_regs *regs)
>>   {
>> -	/*
>> -	 * If we are stepping a pending breakpoint, call the hw_breakpoint
>> -	 * handler first.
>> -	 */
>> -	if (try_step_suspended_breakpoints(regs))
>> -		return 0;
>> -
>>   	if (call_step_hook(regs, esr) == DBG_HOOK_HANDLED)
>> -		return 0;
>> +		return;
>>   
>>   	if (user_mode(regs)) {
>>   		send_user_sigtrap(TRAP_TRACE);
>> @@ -219,10 +212,8 @@ static int single_step_handler(unsigned long unused, unsigned long esr,
>>   		 */
>>   		set_regs_spsr_ss(regs);
>>   	}
>> -
>> -	return 0;
>>   }
>> -NOKPROBE_SYMBOL(single_step_handler);
>> +NOKPROBE_SYMBOL(do_softstep);
> With the EL0/EL1 entry paths split up, it would be nice to split this
> into separate do_el{0,1}_softstep() handlers, like we do for
> do_el{0,1}_undef(). With the relevant portions of call_step_hook()
> folded in, that'd leave us with:
>
> | void do_el0_softstep(struct pt_regs *regs, unsigned long esr)
> | {
> | 	if (uprobe_singlestep_handler(regs, esr) == DBG_HOOK_HANDLED)
> | 		return;
> | 	
> | 	send_user_sigtrap(TRAP_TRACE);
> | 	/*
> | 	 * ptrace will disable single step unless explicitly asked to
> | 	 * re-enable it. For other clients, it makes sense to leave it
> | 	 * enabled (i.e. rewind the controls to the active-not-pending
> | 	 * state).
> | 	 */
> | 	 user_rewind_single_step(current);
> | }
> |
> | void do_el1_softstep(struct pt_regs *regs, unsigned long esr)
> | {
> | 	if (kgdb_singlestep_handler(regs, esr) == DBG_HOOK_HANDLED)
> | 		return;
> | 	
> | 	pr_warn("Unexpected kernel single-step exception at EL1\n");
> | 	/*
> | 	 * Re-enable stepping since we know that we will be
> | 	 * returning to regs.
> | 	 */
> | 	set_regs_spsr_ss(regs);
> | }
> | NOKPROBE_SYMBOL(do_el1_softstep):
>
> Doing that would remove some indirection, and make this a bit easier to
> follow. That would also permit the EL0 handler to be kprobed (which is
> safe since there's no risk of recursion in the EL0 handler).
>
> Mark.
Agree, that's really nice and being able to probe a bit more is quite 
useful !

I split the EL0/EL1 handlers for the soft step and BRK64 in v4.

Thanks Mark,
Ada



