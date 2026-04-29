Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5841ECD13D2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 15:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lkm0lfKEDuqhzeWjwT5+p/LQIt4rwROCyMCOGCvE1F8=; b=W0Yg08tU0g0LqNGqtxWsXXIanX
	4/2ZHtXk7MQqRF9/AaoEda5GXm0EX/VLSY2rox9CpI1hltYgYPVbli3BYdWLZpht2hGkNXECI4A1U
	6TjJOgnt0OFTOZFjIL1LHboYiwSb3YFLjKmqpUN36orql3ehJPwJ8Y0wDp4LFRmXPlTTBo3gTfdLp
	LsyKdDXxW0VPOFvLbdpbvYvd65bXAVtAqA1RasA0DNyFe/TP9USU8w5vGFbIRh4bugRS6IaAgh3dl
	xLVEfrOtcvfkfX5IzVrJxZdtwiyr9harfQ0GvtXJZd78fR4ReCk14zw72KtnnIKMz7obB1O2VTYQJ
	caDDjxwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI6o2-00000003q5I-0Hhq;
	Wed, 29 Apr 2026 15:26:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI6nz-00000003q3N-2XWn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 15:26:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B75ED1655;
	Wed, 29 Apr 2026 08:26:15 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B3003F763;
	Wed, 29 Apr 2026 08:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777476381; bh=ToHBbsGGf1LD2+ZDgJuZjsnXK7XLE8KJHIPpOy6olpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DVR5A69YL3Q+LStcdhQecow5PpoUUUb3PLHRQdvqty0reh/1ncGgWmmiKXTgSK9At
	 XIdCnhZ+gv3B2UuYEsOdIL7aGkJe8GNfPRLmDsFxcY58+0G23kboLqTRD4D64V94BA
	 62YpRlDnNvetzvGDJ3vs9upWOmCgsx1CCaeQVYAw=
Date: Wed, 29 Apr 2026 16:26:12 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Dylan Hatch <dylanbhatch@google.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>,
	Weinan Liu <wnliu@google.com>, Will Deacon <will@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Indu Bhagat <ibhagatgnu@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Kosina <jikos@kernel.org>, Jens Remus <jremus@linux.ibm.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>,
	joe.lawrence@redhat.com, linux-toolchains@vger.kernel.org,
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v5 3/8] arm64: entry: add unwind info for various kernel
 entries
Message-ID: <afIjFLbUrdxWA6eR@J2N7QTR9R3.cambridge.arm.com>
References: <20260428183643.3796063-1-dylanbhatch@google.com>
 <20260428183643.3796063-4-dylanbhatch@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428183643.3796063-4-dylanbhatch@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_082627_731666_7A06E660 
X-CRM114-Status: GOOD (  24.23  )
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

Hi Dylan,

On Tue, Apr 28, 2026 at 06:36:38PM +0000, Dylan Hatch wrote:
> From: Weinan Liu <wnliu@google.com>
> 
> DWARF CFI (Call Frame Information) specifies how to recover the return
> address and callee-saved registers at each PC in a given function.
> Compilers are able to generate the CFI annotations when they compile
> the code to assembly language. For handcrafted assembly, we need to
> annotate them by hand.
> 
> Annotate minimal CFI to enable stacktracing using SFrame for kernel
> exception entries through el1*_64_*() paths 

I thought we were only consuming SFrame when unwinding an exeption
boundary?

We shouldn't be taking exceptions _from_ the entry assembly functions
unless something has gone horribly wrong, and so I don't see why we'd
need CFI entries for the entry assembly functions.

Am I missing some reason we need CFI entries for the entry assembly
functions? I strongly suspect it is not necessary to add these, and I'd
prefer to omit them.

> and irq entries through call_on_irq_stack()

Needing some sort of unwind annotations for call_on_irq_stack() makes
sense to me, but don't we need something for other assembly functions
too?

We can interrupt things like memset(); I assume we'll treat those as
unreliable until annotated?

Mark.

> Signed-off-by: Weinan Liu <wnliu@google.com>
> Suggested-by: Jens Remus <jremus@linux.ibm.com>
> Reviewed-by: Jens Remus <jremus@linux.ibm.com>
> Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
> ---
>  arch/arm64/kernel/entry.S | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
> index f8018b5c1f9a..dc55b0b19cfa 100644
> --- a/arch/arm64/kernel/entry.S
> +++ b/arch/arm64/kernel/entry.S
> @@ -30,6 +30,12 @@
>  #include <asm/asm-uaccess.h>
>  #include <asm/unistd.h>
>  
> +/*
> + * Do not generate .eh_frame.  Only generate .debug_frame and optionally
> + * .sframe (via assembler option --gsframe[-N]).
> + */
> +	.cfi_sections .debug_frame
> +
>  	.macro	clear_gp_regs
>  	.irp	n,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29
>  	mov	x\n, xzr
> @@ -575,7 +581,16 @@ SYM_CODE_START_LOCAL(el\el\ht\()_\regsize\()_\label)
>  	.if \el == 0
>  	b	ret_to_user
>  	.else
> +	/*
> +	 * Minimal DWARF CFI for unwinding across the call above.
> +	 * Enable unwinding for el1*_64_*() path only.
> +	 */
> +	.cfi_startproc
> +	.cfi_def_cfa_offset PT_REGS_SIZE
> +	.cfi_offset 29, S_FP - PT_REGS_SIZE
> +	.cfi_offset 30, S_LR - PT_REGS_SIZE
>  	b	ret_to_kernel
> +	.cfi_endproc
>  	.endif
>  SYM_CODE_END(el\el\ht\()_\regsize\()_\label)
>  	.endm
> @@ -872,6 +887,7 @@ NOKPROBE(ret_from_fork)
>   * Calls func(regs) using this CPU's irq stack and shadow irq stack.
>   */
>  SYM_FUNC_START(call_on_irq_stack)
> +	.cfi_startproc
>  	save_and_disable_daif x9
>  #ifdef CONFIG_SHADOW_CALL_STACK
>  	get_current_task x16
> @@ -882,6 +898,9 @@ SYM_FUNC_START(call_on_irq_stack)
>  	/* Create a frame record to save our LR and SP (implicit in FP) */
>  	stp	x29, x30, [sp, #-16]!
>  	mov	x29, sp
> +	.cfi_def_cfa 29, 16
> +	.cfi_offset 29, -16
> +	.cfi_offset 30, -8
>  
>  	ldr_this_cpu x16, irq_stack_ptr, x17
>  
> @@ -897,9 +916,13 @@ SYM_FUNC_START(call_on_irq_stack)
>  	 */
>  	mov	sp, x29
>  	ldp	x29, x30, [sp], #16
> +	.cfi_restore 29
> +	.cfi_restore 30
> +	.cfi_def_cfa 31, 0
>  	scs_load_current
>  	restore_irq x9
>  	ret
> +	.cfi_endproc
>  SYM_FUNC_END(call_on_irq_stack)
>  NOKPROBE(call_on_irq_stack)
>  
> -- 
> 2.54.0.545.g6539524ca2-goog
> 

