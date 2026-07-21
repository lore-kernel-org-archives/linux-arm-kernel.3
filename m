Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1457C44532
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 15:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+lgjyQfd9IBZzvvE9TuW5SVrvl8Nrnir0IRKOwvBQbE=; b=nKKYXaNhLAhYHd
	AaB9P5ny29qHk/WI8B0Tt7R4bzD8SYSMInMXI66xJXcZcVllHjfaOWInmkmSus9XFgTkXhN/bXXzN
	GuOsKDyBPj4cCNIfjNawprFy/kc4qnFujAh6o16+dnNjvr4Ei5D9l/5E+TvSM6FnzLFxStTwut4bz
	2ZlyAsHi+xLBAtR62olxTvAMNpklG1/y3ngSaa6lf/BNtAN9S4QmMvMk8j9g86NNlgPlcMSGD8WSG
	pLiexCbVCvDapO3j0aXG2vJ33kFh8CPVCoZsy+CAd24k2OOEhYqd9L6SKBC/vd/dUGlL9ZVOM/FUD
	Gja9Gc9aSGdGv9CVsPBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmC50-00000009kKh-0NnK;
	Tue, 21 Jul 2026 15:08:22 +0000
Received: from latitanza.investici.org ([2a12:4180:dc1:929::42])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmC4x-00000009kIw-0qjv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 15:08:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grrlz.net;
	s=stigmate; t=1784646495;
	bh=+lgjyQfd9IBZzvvE9TuW5SVrvl8Nrnir0IRKOwvBQbE=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=hgjVPJaklw2o0BqGpXGqWF6E+k39a9F/ofEeeoVTuh5kU5Pws3JUEBkGtez++xE+T
	 5ZfFmOHnV6Ok/98h41zYZGkoL/HXterLPz+atZPbVaShEIjdfnbhgen+iFiT5Yh59b
	 xo9QtzSuuDIveZLj7W4ONjIJiC3kxPl26w9StfVc=
Received: from mx3.investici.org (unknown [127.0.0.1])
	by latitanza.investici.org (Postfix) with ESMTP id 4h4LNv50shzGpKs;
	Tue, 21 Jul 2026 15:08:15 +0000 (UTC)
Received: by mx3.investici.org (Postfix) id 4h4LNv2SL5zGpKK;
	Tue, 21 Jul 2026 15:08:15 +0000 (UTC)
Date: Tue, 21 Jul 2026 16:08:16 +0100
From: Bradley Morgan <include@grrlz.net>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] arm64: entry: dedup SDEI event priority selection
In-Reply-To: <al-HJCeXy8cJW57B@J2N7QTR9R3.cambridge.arm.com>
References: <20260718185447.25706-1-include@grrlz.net> <al-HJCeXy8cJW57B@J2N7QTR9R3.cambridge.arm.com>
Message-ID: <1AF396B3-B1BD-48A1-A2A0-70605F020C53@grrlz.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_080819_656630_FCB8FFD6 
X-CRM114-Status: GOOD (  18.70  )
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
Cc: anshuman.khandual@arm.com, kees@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, will@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On July 21, 2026 3:50:12 PM GMT+01:00, Mark Rutland <mark.rutland@arm.com>
wrote:
>On Sat, Jul 18, 2026 at 06:54:47PM +0000, Bradley Morgan wrote:
>> __sdei_asm_handler open codes the same branch ladder four times to pick
>> the normal or critical variant of a per CPU variable based on the SDEI
>> event priority: when recording the active event, when selecting the
>> SDEI stack, when selecting the shadow call stack, and when clearing the
>> active-event record on exit.
>> 
>> Add a sdei_choose macro, using \@ local labels like the files existing
>> macros, and replace the four open coded copies with it. This also drops
>> the repeated reuse of the 1:/2:/3:/4: numeric labels in this handler.
>> 
>> No functional change intended.
>> 
>> Signed-off-by: Bradley Morgan <include@grrlz.net>
>> ---
>>  arch/arm64/kernel/entry.S | 39 +++++++++++++++++++--------------------
>>  1 file changed, 19 insertions(+), 20 deletions(-)
>
>Looking at the patch below, the result is far less readable, and this
>has only saved a single line.
>
>I don't think this is worthwhile; please leave this as-is.
>
>Mark.

ok, fair enough, I wasn't highly expecting for this to get accepted,
the one I think that would, would be [1]

[1] https://lore.kernel.org/all/20260717114746.15109-1-include@grrlz.net/

Thanks for the review.

>> 
>> diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
>> index e0db14e9c843..29ef4a0d28a8 100644
>> --- a/arch/arm64/kernel/entry.S
>> +++ b/arch/arm64/kernel/entry.S
>> @@ -916,6 +916,15 @@ NOKPROBE(call_on_irq_stack)
>>  	b	.
>>  .endm
>>  
>> +/* Set \dst using \op and the \normal or \critical sym, based on \prio
>*/
>> +.macro sdei_choose op:req, dst:req, prio:req, normal:req, critical:req,
>tmp:req
>> +	cbnz	\prio, .Lcritical\@
>> +	\op dst=\dst, sym=\normal, tmp=\tmp
>> +	b	.Ldone\@
>> +.Lcritical\@:	\op dst=\dst, sym=\critical, tmp=\tmp
>> +.Ldone\@:
>> +.endm
>> +
>>  #ifdef CONFIG_UNMAP_KERNEL_AT_EL0
>>  /*
>>   * The regular SDEI entry point may have been unmapped along with the
>rest of
>> @@ -997,32 +1006,24 @@ SYM_CODE_START(__sdei_asm_handler)
>>  
>>  	/* Store the registered-event for crash_smp_send_stop() */
>>  	ldrb	w4, [x19, #SDEI_EVENT_PRIORITY]
>> -	cbnz	w4, 1f
>> -	adr_this_cpu dst=x5, sym=sdei_active_normal_event, tmp=x6
>> -	b	2f
>> -1:	adr_this_cpu dst=x5, sym=sdei_active_critical_event, tmp=x6
>> -2:	str	x19, [x5]
>> +	sdei_choose adr_this_cpu, x5, w4, sdei_active_normal_event, \
>> +		    sdei_active_critical_event, x6
>> +	str	x19, [x5]
>>  
>>  	/*
>>  	 * entry.S may have been using sp as a scratch register, find whether
>>  	 * this is a normal or critical event and switch to the appropriate
>>  	 * stack for this CPU.
>>  	 */
>> -	cbnz	w4, 1f
>> -	ldr_this_cpu dst=x5, sym=sdei_stack_normal_ptr, tmp=x6
>> -	b	2f
>> -1:	ldr_this_cpu dst=x5, sym=sdei_stack_critical_ptr, tmp=x6
>> -2:	mov	x6, #SDEI_STACK_SIZE
>> +	sdei_choose ldr_this_cpu, x5, w4, sdei_stack_normal_ptr, sdei_stack_critical_ptr, x6
>> +	mov	x6, #SDEI_STACK_SIZE
>>  	add	x5, x5, x6
>>  	mov	sp, x5
>>  
>>  #ifdef CONFIG_SHADOW_CALL_STACK
>>  	/* Use a separate shadow call stack for normal and critical events */
>> -	cbnz	w4, 3f
>> -	ldr_this_cpu dst=scs_sp, sym=sdei_shadow_call_stack_normal_ptr, tmp=x6
>> -	b	4f
>> -3:	ldr_this_cpu dst=scs_sp, sym=sdei_shadow_call_stack_critical_ptr, tmp=x6
>> -4:
>> +	sdei_choose ldr_this_cpu, scs_sp, w4, sdei_shadow_call_stack_normal_ptr, \
>> +		    sdei_shadow_call_stack_critical_ptr, x6
>>  #endif
>>  
>>  	/*
>> @@ -1068,11 +1069,9 @@ SYM_CODE_START(__sdei_asm_handler)
>>  
>>  	/* Clear the registered-event seen by crash_smp_send_stop() */
>>  	ldrb	w3, [x4, #SDEI_EVENT_PRIORITY]
>> -	cbnz	w3, 1f
>> -	adr_this_cpu dst=x5, sym=sdei_active_normal_event, tmp=x6
>> -	b	2f
>> -1:	adr_this_cpu dst=x5, sym=sdei_active_critical_event, tmp=x6
>> -2:	str	xzr, [x5]
>> +	sdei_choose adr_this_cpu, x5, w3, sdei_active_normal_event, \
>> +		    sdei_active_critical_event, x6
>> +	str	xzr, [x5]
>>  
>>  alternative_if_not ARM64_UNMAP_KERNEL_AT_EL0
>>  	sdei_handler_exit exit_mode=x2
>> -- 
>> 2.53.0
>> 
>> 
>

Thanks!

