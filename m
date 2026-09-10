Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E46C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 13:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C8B8lBpAnPZTwqaVrMt/bWxIFxQwmuOiBheTClveH70=; b=T0PJ7Z0LvuFv+A
	AIYymBFzUXWfwdYtfBtNV12gZkbeuksyoPwDZh8bTUHAmtCPXWY84/38QK4R42jPFy24hnr4jta9x
	3GRTlZf7UK4wGtzG5P7xsMfGPXrGFwF8+9k61JazEnJGPb7VaBcKDYrdBCHemlQK52PMuc2CL9w+R
	D3lW7QBJPE3ysoHW0RpOoLWjlYPZC8zy08yapsxgXkSY6tjH+rrJSCLz9jmzTtKa9e/juJKcPeEBu
	8jq9L3MhuHbqRS5RRYEPthpBm3aIyIlpDHPdw7CLSk9HlSDEvR/FMhaSGq2xoeVWy6qWe2r9iy5XW
	MdIqKUBPXAWzZ3vCNg+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eU0-0000000EQrW-39vF;
	Thu, 10 Sep 2026 13:06:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eTy-0000000EQqI-1ABl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 13:06:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E0669153B;
	Thu, 10 Sep 2026 06:06:20 -0700 (PDT)
Received: from [10.0.152.207] (unknown [10.0.152.207])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8FFDF3F528;
	Thu, 10 Sep 2026 06:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789045584; bh=9oh0tRsiE7/HLFt8r6X8tMaYM8mBg3BROU8swZkRWsQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lAfSamYliz+Q0kxriRDfahYx7Nc3nPsVXdPfieSxUc7MIr99c9ZYLex0O8CgNlSDx
	 Ccrn2p8xcHVCMkP3Ji5+sRlrLrxHgsszXQ15gbR6O13D0Qva206Z5Xr/PNIabxLTMJ
	 i2vMs5qsX6L7KRxrHyj0DP2jpyzZLwgHsBCg7U+M=
Message-ID: <fd611971-17dd-44a6-acf0-f498f58bb1c0@arm.com>
Date: Thu, 10 Sep 2026 14:06:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/21] arm64: entry: sdei: Make 'tsk' available
To: Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
References: <20260908151741.394589-1-mark.rutland@arm.com>
 <20260908151741.394589-14-mark.rutland@arm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20260908151741.394589-14-mark.rutland@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_060626_400699_C41AC292 
X-CRM114-Status: GOOD (  19.63  )
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
Cc: ryan.roberts@arm.com, usama.anjum@arm.com, peterz@infradead.org, catalin.marinas@arm.com, david.laight.linux@gmail.com, stable@vger.kernel.org, ruanjinjie@huawei.com, james.morse@arm.com, yang@os.amperecomputing.com, cl@gentwo.org, maz@kernel.org, david@kernel.org, ljs@kernel.org, will@kernel.org, ardb@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 9/8/26 16:17, Mark Rutland wrote:
> For regular entry/exit sequences, we use 'tsk' (x28) to hold the current
> task pointer, allowing this to be used by various assembly macros. The
> SDEI entry/exit sequence uses x28 to hold the value of the interrupted
> sp_el0, and doesn't retain the current task pointer in a register.
> 
> These differences makes it awkward to share assembly macros across
> regular entry/exit and SDEI entry/exit, and risk surprises.
> 
> Align the SDEI entry/exit sequence with regular entry/exit, keeping the
> current task pointer in 'tsk', and preserving the interrupted sp_el0 in
> another (callee-saved) register. I've used x20 as x19 was already in
> used for the relevant sdei_registered_event, and these are the
> lowest-numbered registers above x18 (which we must preserve for shadow
> call stack).
> 
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: James Morse <james.morse@arm.com>
> Cc: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Vladimir Murzin <vladimir.murzin@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Yang Shi <yang@os.amperecomputing.com>
> ---
>  arch/arm64/kernel/entry.S | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
> index a6ec5c5a2d29c..0902c1bd9dd3d 100644
> --- a/arch/arm64/kernel/entry.S
> +++ b/arch/arm64/kernel/entry.S
> @@ -1023,11 +1023,12 @@ SYM_CODE_START(__sdei_asm_handler)
>  
>  	/*
>  	 * We may have interrupted userspace, or a guest, or exit-from or
> -	 * return-to either of these. We can't trust sp_el0, restore it.
> +	 * return-to either of these. Preserve the interrupted sp_el0, and
> +	 * initialize sp_el0 to the current task.
>  	 */
> -	mrs	x28, sp_el0
> -	ldr_this_cpu	dst=x0, sym=__entry_task, tmp=x1
> -	msr	sp_el0, x0
> +	mrs	x20, sp_el0
> +	ldr_this_cpu    dst=tsk, sym=__entry_task, tmp=x1
> +	msr	sp_el0, tsk
>  
>  	/* If we interrupted the kernel point to the previous stack/frame. */
>  	and     x0, x3, #0xc
> @@ -1043,7 +1044,7 @@ SYM_CODE_START(__sdei_asm_handler)
>  	mov	x1, x19
>  	bl	__sdei_handler
>  
> -	msr	sp_el0, x28
> +	msr	sp_el0, x20
>  	/* restore regs >x17 that firmware won't restore */
>  	mov	x4, x19         // keep x4 for __sdei_asm_exit_trampoline
>  	ldp	x18, x19, [x4, #SDEI_EVENT_INTREGS + 16 * 9]
> -- 2.30.2
> 

I'm sure you are already pretty much aware that Will's series touches
this code as well... :)  

FWIW,

Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>

