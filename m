Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D878CA600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 11:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EXzZkr9qT6NMHiIPYkMhbu7eTjz0R5QmQok3N0POnAI=; b=sreZN7UUQjKDKa
	Fw8VEI1bUzdN6OBzRGAH1t8iLQ990erCJ7tUgnaVpoA/D9ZHOoui9JOdRCFvv4FgFsSz4LQkTopRG
	rT7WF5uzfbrMGbqo4m9oFvqjX9G9MG7fag4a0jNQP7QiP2iN1/tCweAyS30WLAe6K6pys0p32zZSx
	+6yMNDgyk862pHLJ2xIlJxRr23RRx4pSBvU1z5JAiwxymFsXBa1V9PkTq9fXqym9+SlRzYfs+ijDX
	Mn5r3VEVEQMz17YBSuaJsq0UCkI7LF6q6V3Y7bEbr8epx4a+wAvj77H2Z1ydQODolUqbGMoPlR9n3
	VPpAYmwXFUhXhgCjO24Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmmi-00000004JEo-3vLY;
	Thu, 08 Oct 2026 11:59:40 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmmf-00000004JDy-2XUn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 11:59:39 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=EXzZkr9qT6NMHiIPYkMhbu7eTjz0R5QmQok3N0POnAI=;
	b=yWTNNxBygJvS173H3H6bFpxiw0lOv4//r5FsuD9I/DFDvz2Rdcv08Sd2Sru0WOxAQL95EFEgp
	5BLrjbGyz5ygSQO2shGVdRWph0l45LeVpG0vBKWOOhUHtFC46btGDsinMvFRZsNgLvpZXVUEldN
	yXdddCZLIH2oOhtIRHUWD1s=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4j0pBJ4KHjzKm52;
	Thu,  8 Oct 2026 19:47:04 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id A11F040572;
	Thu,  8 Oct 2026 19:59:22 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 8 Oct
 2026 19:59:21 +0800
Message-ID: <80514dc0-857f-4c04-aa30-21ecd35b2a18@huawei.com>
Date: Thu, 8 Oct 2026 19:59:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/21] arm64: entry: Use SPSel to switch to overflow
 stack
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20260918161407.2300-1-will@kernel.org>
 <20260918161407.2300-18-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260918161407.2300-18-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.68]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_045937_951577_4EF212AF 
X-CRM114-Status: GOOD (  24.01  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org, Mostafa Saleh <smostafa@google.com>, Marc Zyngier <maz@kernel.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



在 2026/9/19 0:14, Will Deacon 写道:
> When detecting a stack overflow on exception entry from EL1, use SPSel
> to switch to the overflow stack without corrupting any GPRs. Not only is
> this simpler than the previous logic, but it also opens the door to
> more complicated overflow checks (for example, based on per-task stack
> sizes or stacks which are not aligned to a specific page order) as well
> as the possibility of returning from a stack fault if we were able to
> resolve it.
> 
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/kernel/entry.S | 69 ++++++++++++---------------------------
>  1 file changed, 21 insertions(+), 48 deletions(-)
> 
> diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
> index 6958ee238649..b4df2f23ebe7 100644
> --- a/arch/arm64/kernel/entry.S
> +++ b/arch/arm64/kernel/entry.S
> @@ -51,11 +51,11 @@
>  	mov	x30, xzr
>  	.endif
>  .Lskip_tramp_vectors_cleanup\@:
> -	.endif
> -
> +	sub	sp, sp, #PT_REGS_SIZE
> +	.else	/* \el == 1 */
> +	.ifc	\ht, h
>  	sub	sp, sp, #PT_REGS_SIZE
>  
> -	.if	\el == 1
>  	/*
>  	 * Test whether the SP has overflowed, without corrupting a GPR.
>  	 * Task and IRQ stacks are aligned so that SP & (1 << THREAD_SHIFT)
> @@ -63,45 +63,16 @@
>  	 */
>  	add	sp, sp, x0			// sp' = sp + x0
>  	sub	x0, sp, x0			// x0' = sp' - x0 = (sp + x0) - x0 = sp
> -	tbnz	x0, #THREAD_SHIFT, 0f
> +	tbnz	x0, #THREAD_SHIFT, __bad_stack
>  	sub	x0, sp, x0			// x0'' = sp' - x0' = (sp + x0) - sp = x0
>  	sub	sp, sp, x0			// sp'' = sp' - x0 = (sp + x0) - x0 = sp
> +	.else	/* EL1t */
> +	msr	spsel, #0			// Stay on the overflow stack
> +	sub	sp, sp, #PT_REGS_SIZE
> +	.endif
>  	.endif
>  
>  	b	el\el\ht\()_\regsize\()_\label
> -
> -	.if	\el == 1
> -0:
> -	/*
> -	 * Either we've just detected an overflow, or we've taken an exception
> -	 * while on the overflow stack. Either way, we won't return to
> -	 * userspace, and can clobber EL0 registers to free up GPRs.
> -	 */
> -
> -	/* Stash the original SP (minus PT_REGS_SIZE) in tpidr_el0. */
> -	msr	tpidr_el0, x0
> -
> -	/* Recover the original x0 value and stash it in sp_el0 */
> -	sub	x0, sp, x0
> -	msr	sp_el0, x0
> -
> -	/* Switch to the overflow stack */
> -	adr_this_cpu sp, overflow_stack + OVERFLOW_STACK_SIZE, x0
> -
> -	/*
> -	 * Check whether we were already on the overflow stack. This may happen
> -	 * after panic() re-enables interrupts.
> -	 */
> -	mrs	x0, tpidr_el0			// sp of interrupted context
> -	sub	x0, sp, x0			// delta with top of overflow stack
> -	tst	x0, #~(OVERFLOW_STACK_SIZE - 1)	// within range?
> -	b.ne	__bad_stack			// no? -> bad stack pointer
> -
> -	/* We were already on the overflow stack. Restore sp/x0 and carry on. */
> -	sub	sp, sp, x0
> -	mrs	x0, sp_el0
> -	b	el\el\ht\()_\regsize\()_\label
> -	.endif
>  .org .Lventry_start\@ + 128	// Did we overflow the ventry slot?
>  	.endm
>  
> @@ -544,22 +515,24 @@ SYM_CODE_END(vectors)
>  
>  SYM_CODE_START_LOCAL(__bad_stack)
>  	/*
> -	 * We detected an overflow in kernel_ventry, which switched to the
> -	 * overflow stack. Stash the exception regs, and head to our overflow
> -	 * handler.
> +	 * We detected an overflow in kernel_ventry.
> +	 * Restore SP and X0.
>  	 */
> +	sub	x0, sp, x0
> +	sub	sp, sp, x0
> +	add	sp, sp, #PT_REGS_SIZE
>  
> -	/* Restore the original x0 value */
> -	mrs	x0, sp_el0
> +	/* Switch to the overflow stack */
> +	msr	spsel, #0
>  
> -	/*
> -	 * Store the original GPRs to the new stack. The orginal SP (minus
> -	 * PT_REGS_SIZE) was stashed in tpidr_el0 by kernel_ventry.
> -	 */
> +	/* Stash the exception regs */
>  	sub	sp, sp, #PT_REGS_SIZE
>  	kernel_entry 1
> -	mrs	x0, tpidr_el0
> -	add	x0, x0, #PT_REGS_SIZE
> +
> +	/* Fix-up the saved SP */
> +	msr	spsel, #1
> +	mov	x0, sp
> +	msr	spsel, #0

LGTM
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  	str	x0, [sp, #S_SP]
>  
>  	/* Stash the regs for handle_bad_stack */

-- 
Best regards,
Jinjie


