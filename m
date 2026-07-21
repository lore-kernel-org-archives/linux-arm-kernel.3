Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 162EDC44532
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 14:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6PiGqvryI5UqT7XsGdg3wKGCgzU7GmG1C/caVsWc/kc=; b=WlLgmzOW05O5rGbHu4eyD+2fXR
	TeS9Tmx1WCVNrCOgvBXgyR2PY6LFtHZTEkKb15U8kFU2UqucKDOaE9A1QBiikpUai7xMUd5rxSikf
	ZS7bY6fwEFZth2941UMqv1jxNGWyiT09LPrnBZaOdcAQeq2/gvF4syEa1yGOr5qrRYSQlCZdMBMQi
	s764id6BWJa0PBc79r2hGJLvKl5lK1XaRtzBhblf7oSF19k3gsle7kfn1b8PKmSGBq88EwS5SVZyp
	ir7RXDsQiOcnM9/AJtfhsu0olQXnF/vxtnWA6ZrL2aqlBVbOPLF9flYuEPXUGJ58a4dBni2yg1OAo
	iBzaA88Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmBnc-00000009hSj-1nPY;
	Tue, 21 Jul 2026 14:50:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmBnZ-00000009hS5-1TSu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 14:50:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1217A152B;
	Tue, 21 Jul 2026 07:50:15 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 20A3E3F86F;
	Tue, 21 Jul 2026 07:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784645419; bh=BFIQ2rmaR+B+A3UpkqoBtMlytLAwir6V9zbZ8CrLzWM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BYH7mAvYqKsBZ9ZMw/YBAzZDl2fSUpsL1tcnU4P8fFi5M3No05d8YV5jVFx58Cfbc
	 czODkUdI1n85l/hgWGvcIuzz7enOeBcD5cd/ZngrC2xq7JlUP5/PhBqBjLQ7WXTRO6
	 wdunmJJ/k3iA2F8VK8vGf5aHSVcVmhPX9f6z876A=
Date: Tue, 21 Jul 2026 15:50:12 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Bradley Morgan <include@grrlz.net>
Subject: Re: [PATCH] arm64: entry: dedup SDEI event priority selection
Message-ID: <al-HJCeXy8cJW57B@J2N7QTR9R3.cambridge.arm.com>
References: <20260718185447.25706-1-include@grrlz.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260718185447.25706-1-include@grrlz.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_075021_505078_3120689A 
X-CRM114-Status: GOOD (  23.89  )
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

On Sat, Jul 18, 2026 at 06:54:47PM +0000, Bradley Morgan wrote:
> __sdei_asm_handler open codes the same branch ladder four times to pick
> the normal or critical variant of a per CPU variable based on the SDEI
> event priority: when recording the active event, when selecting the
> SDEI stack, when selecting the shadow call stack, and when clearing the
> active-event record on exit.
> 
> Add a sdei_choose macro, using \@ local labels like the files existing
> macros, and replace the four open coded copies with it. This also drops
> the repeated reuse of the 1:/2:/3:/4: numeric labels in this handler.
> 
> No functional change intended.
> 
> Signed-off-by: Bradley Morgan <include@grrlz.net>
> ---
>  arch/arm64/kernel/entry.S | 39 +++++++++++++++++++--------------------
>  1 file changed, 19 insertions(+), 20 deletions(-)

Looking at the patch below, the result is far less readable, and this
has only saved a single line.

I don't think this is worthwhile; please leave this as-is.

Mark.

> 
> diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
> index e0db14e9c843..29ef4a0d28a8 100644
> --- a/arch/arm64/kernel/entry.S
> +++ b/arch/arm64/kernel/entry.S
> @@ -916,6 +916,15 @@ NOKPROBE(call_on_irq_stack)
>  	b	.
>  .endm
>  
> +/* Set \dst using \op and the \normal or \critical sym, based on \prio */
> +.macro sdei_choose op:req, dst:req, prio:req, normal:req, critical:req, tmp:req
> +	cbnz	\prio, .Lcritical\@
> +	\op dst=\dst, sym=\normal, tmp=\tmp
> +	b	.Ldone\@
> +.Lcritical\@:	\op dst=\dst, sym=\critical, tmp=\tmp
> +.Ldone\@:
> +.endm
> +
>  #ifdef CONFIG_UNMAP_KERNEL_AT_EL0
>  /*
>   * The regular SDEI entry point may have been unmapped along with the rest of
> @@ -997,32 +1006,24 @@ SYM_CODE_START(__sdei_asm_handler)
>  
>  	/* Store the registered-event for crash_smp_send_stop() */
>  	ldrb	w4, [x19, #SDEI_EVENT_PRIORITY]
> -	cbnz	w4, 1f
> -	adr_this_cpu dst=x5, sym=sdei_active_normal_event, tmp=x6
> -	b	2f
> -1:	adr_this_cpu dst=x5, sym=sdei_active_critical_event, tmp=x6
> -2:	str	x19, [x5]
> +	sdei_choose adr_this_cpu, x5, w4, sdei_active_normal_event, \
> +		    sdei_active_critical_event, x6
> +	str	x19, [x5]
>  
>  	/*
>  	 * entry.S may have been using sp as a scratch register, find whether
>  	 * this is a normal or critical event and switch to the appropriate
>  	 * stack for this CPU.
>  	 */
> -	cbnz	w4, 1f
> -	ldr_this_cpu dst=x5, sym=sdei_stack_normal_ptr, tmp=x6
> -	b	2f
> -1:	ldr_this_cpu dst=x5, sym=sdei_stack_critical_ptr, tmp=x6
> -2:	mov	x6, #SDEI_STACK_SIZE
> +	sdei_choose ldr_this_cpu, x5, w4, sdei_stack_normal_ptr, sdei_stack_critical_ptr, x6
> +	mov	x6, #SDEI_STACK_SIZE
>  	add	x5, x5, x6
>  	mov	sp, x5
>  
>  #ifdef CONFIG_SHADOW_CALL_STACK
>  	/* Use a separate shadow call stack for normal and critical events */
> -	cbnz	w4, 3f
> -	ldr_this_cpu dst=scs_sp, sym=sdei_shadow_call_stack_normal_ptr, tmp=x6
> -	b	4f
> -3:	ldr_this_cpu dst=scs_sp, sym=sdei_shadow_call_stack_critical_ptr, tmp=x6
> -4:
> +	sdei_choose ldr_this_cpu, scs_sp, w4, sdei_shadow_call_stack_normal_ptr, \
> +		    sdei_shadow_call_stack_critical_ptr, x6
>  #endif
>  
>  	/*
> @@ -1068,11 +1069,9 @@ SYM_CODE_START(__sdei_asm_handler)
>  
>  	/* Clear the registered-event seen by crash_smp_send_stop() */
>  	ldrb	w3, [x4, #SDEI_EVENT_PRIORITY]
> -	cbnz	w3, 1f
> -	adr_this_cpu dst=x5, sym=sdei_active_normal_event, tmp=x6
> -	b	2f
> -1:	adr_this_cpu dst=x5, sym=sdei_active_critical_event, tmp=x6
> -2:	str	xzr, [x5]
> +	sdei_choose adr_this_cpu, x5, w3, sdei_active_normal_event, \
> +		    sdei_active_critical_event, x6
> +	str	xzr, [x5]
>  
>  alternative_if_not ARM64_UNMAP_KERNEL_AT_EL0
>  	sdei_handler_exit exit_mode=x2
> -- 
> 2.53.0
> 
> 

