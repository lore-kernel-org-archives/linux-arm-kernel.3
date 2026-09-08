Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 707EAC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 13:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ipsIz6kdEtC3jqxSus30l0DuD/gaAm/0YMo8PCL8/fU=; b=lnogIL9dcvFsL/
	Wm69Ia2FJ3f5fnng73nkX5rnNWkig/IhNkW6f7CquBNrM1Jx2/xKZz8laqqVYfCw3+ZL5to1j047d
	z+uJQTaPhmuzpk4+loaATj9I0+DVmljBBmbfxdfvgV0FDte+fmUeoa7wz4P9dthFD9wUq3kOJPMmb
	IbHM9AN71NtEQSiWwSYRF+MZPe8Fbe5emFIWvQy3ceSnhthMZdUEZdQ0PSaY3jrbvprwNBOff+ZIr
	IXTAg9xQUjc8X+XUfHcsujTuu89eIN6oPw7yV34LhJtBaAUrMcP3lzwKxXN6m5MtVra6nWCM+MJJ5
	fEvFy6goXKd9hdm28H6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3vk1-000000098Uc-24x0;
	Tue, 08 Sep 2026 13:20:04 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3vjy-000000098TQ-0x22
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 13:20:00 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-4843e397f74so5200989f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 06:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788873596; x=1789478396; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ipsIz6kdEtC3jqxSus30l0DuD/gaAm/0YMo8PCL8/fU=;
        b=cuS+wdbouJUdU4Y0r3rXT9Jj8Ee1MDIZG0rs5Z1jEftNydoswZyg/NafvJYzkyIaTx
         TGGwm06UpAAoRuyBb14kCMlX8tOTE01f80d0Iy4M2Rjtb3CO1OJE/Vpzevfx7BCGP6cx
         KoiLGonkgFxD//djeqJSDDVXIyOMzotW3UCrStNWVX8ik2dW5AqVNz90oGJOGgZhTJ9q
         LgbDsP1bT1KJdqSRYHE8jY+es9nWvGPbV0oinLOiQbk0p0Rw5aexxNpVBCsBb0pXKCqK
         PspC5/+ZWJV7R6RL+/8KffbrWAr+n/7BhaRD/qycWtcNJ4IMXHGDi7cVAFI/p0Z/YeMu
         FcXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788873596; x=1789478396;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ipsIz6kdEtC3jqxSus30l0DuD/gaAm/0YMo8PCL8/fU=;
        b=B6DYqAgBZS6NOb5zq35MD51AKpzbEzypJZniL+88+2kygTtDfFePlX38uUtcmdqDBz
         3jbEnPbtoehFLtD6PICG/xxndaZIIOLeQuRCahCb/TUXezcEFFLwKwnDsWM/mJSAYkSz
         jBXQcRw2i+HpQOUjx+LB3p/yc5dY6T7qqp4BRlBR7M+kBCkdU0bxzKft6gQiCoaeErlG
         0m9kUhLR/xGIMaLkeCyL+J1B8El48DU/SEYs0qr/6XsgkE00yFzGljpTs/kn5EwfNKM3
         1yx1brA/mUX52clfGkduhz9PntliOswBgjL/1cAnEXyakMeEkfrQfYzGFtxHKrIRiZVS
         uolQ==
X-Gm-Message-State: AFuF++lNeXiZWg865idljCnW27Cu/Fp2gYe+0FXfol7OieUTkwM/MBPK
	zTboGzzSBfbr4KclEN5x7daVaxO9nYyADDe/UZtAZn9B5Xzth1BZnHMKEDoGWX/4
X-Gm-Gg: AYBFou0/6zUjMY6q4MslDw9nD38sQJfgt/RVsUyKfxQKTAKIZlQbUy4h9q1AsM18goy
	MlGrTzcz9A0CZaYuKcVzmDFnvHSIdSo/bevPlocb0GQYNjPOvYde8takLvlIeA6c/Ffu4G+1feX
	ZRJQ9MZCP9nhUPSM1Yp7WhtNZp83hTLfSrJ1UTJJ5BJHCO2VyLGlNeJByUYVSe1xXZtFLlHsaJT
	oYojLiZJcimAZYF7jAmuy0Sv8zNceRF1Lhe34d+zPznh4H2AQdAKy7ynxeHqlbVt2y6IWu8ZRdU
	Z7RKh+Nn5ZGWUlslVrdlkTaQvLziu/6o406S3BUt3vGWeUroSF2RIG6n27eTUv4IfLz5sOFix6F
	4ntO+wZBrZ3HSP7xMxr43fch93T4s+gbgTXrgIVbAquMQo5Povz1hMYuTmlJ0BzRUhIxDAAAj04
	IC0LY7j//Ez8KxoyJBsRSswMcDxNUS97dSmJE/66hWVJG1KQ078ui2sVqA2XO24MgwXGRtA52ze
	PcoAQ2q0iX84dLAJwJCC3GOa7g=
X-Received: by 2002:adf:e011:0:20b0:485:8e0c:641e with SMTP id ffacd0b85a97d-4858e0c648bmr19675304f8f.22.1788873595165;
        Tue, 08 Sep 2026 06:19:55 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485881353e8sm36104336f8f.1.2026.09.08.06.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:19:54 -0700 (PDT)
Date: Tue, 8 Sep 2026 14:19:50 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH 06/21] arm64: Store 'current' in TPIDRRO_EL0 instead of
 SP_EL0
Message-ID: <20260908141950.37e9ed3d@pumpkin>
In-Reply-To: <20260907164247.17223-7-will@kernel.org>
References: <20260907164247.17223-1-will@kernel.org>
	<20260907164247.17223-7-will@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_061959_185000_65EAEE29 
X-CRM114-Status: GOOD (  36.57  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org, Mostafa Saleh <smostafa@google.com>, Marc Zyngier <maz@kernel.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon,  7 Sep 2026 17:42:31 +0100
Will Deacon <will@kernel.org> wrote:

> To make SP_EL0 available to point at the per-cpu kernel overflow stack,
> we must relocate 'current' elsewhere. With TPIDRRO_EL0 now restored late
> in the return-to-user path, we can otherwise use it to hold 'current'
> and update the various accessors accordingly.
> 
> Move 'current' from SP_EL0 to TPIDRRO_EL0.

Is it worth having a #define for the name of the register that stores 'current'?
(And probably the other similar registers.)
That would avoid the bisection problems with the following two patches
and might make other code a bit more readable.

David

> 
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/include/asm/assembler.h |  2 +-
>  arch/arm64/include/asm/current.h   |  6 +++---
>  arch/arm64/kernel/entry.S          | 20 ++++++++++----------
>  arch/arm64/kernel/head.S           |  2 +-
>  arch/arm64/kernel/process.c        |  5 +++--
>  arch/arm64/net/bpf_jit_comp.c      |  4 ++--
>  6 files changed, 20 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
> index 0b58b550e8dc..fd1ae5337935 100644
> --- a/arch/arm64/include/asm/assembler.h
> +++ b/arch/arm64/include/asm/assembler.h
> @@ -587,7 +587,7 @@ alternative_else_nop_endif
>   * Return the current task_struct.
>   */
>  	.macro	get_current_task, rd
> -	mrs	\rd, sp_el0
> +	mrs	\rd, tpidrro_el0
>  	.endm
>  
>  /*
> diff --git a/arch/arm64/include/asm/current.h b/arch/arm64/include/asm/current.h
> index c92912eaf186..8c7efac05394 100644
> --- a/arch/arm64/include/asm/current.h
> +++ b/arch/arm64/include/asm/current.h
> @@ -14,11 +14,11 @@ struct task_struct;
>   */
>  static __always_inline struct task_struct *get_current(void)
>  {
> -	unsigned long sp_el0;
> +	unsigned long tpidrro_el0;
>  
> -	asm ("mrs %0, sp_el0" : "=r" (sp_el0));
> +	asm ("mrs %0, tpidrro_el0" : "=r" (tpidrro_el0));
>  
> -	return (struct task_struct *)sp_el0;
> +	return (struct task_struct *)tpidrro_el0;
>  }
>  
>  #define current get_current()
> diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
> index b5d8277f608a..a45be0a837c8 100644
> --- a/arch/arm64/kernel/entry.S
> +++ b/arch/arm64/kernel/entry.S
> @@ -81,9 +81,9 @@
>  	/* Stash the original SP (minus PT_REGS_SIZE) in tpidr_el0. */
>  	msr	tpidr_el0, x0
>  
> -	/* Recover the original x0 value and stash it in tpidrro_el0 */
> +	/* Recover the original x0 value and stash it in sp_el0 */
>  	sub	x0, sp, x0
> -	msr	tpidrro_el0, x0
> +	msr	sp_el0, x0
>  
>  	/* Switch to the overflow stack */
>  	adr_this_cpu sp, overflow_stack + OVERFLOW_STACK_SIZE, x0
> @@ -99,7 +99,7 @@
>  
>  	/* We were already on the overflow stack. Restore sp/x0 and carry on. */
>  	sub	sp, sp, x0
> -	mrs	x0, tpidrro_el0
> +	mrs	x0, sp_el0
>  	b	el\el\ht\()_\regsize\()_\label
>  	.endif
>  .org .Lventry_start\@ + 128	// Did we overflow the ventry slot?
> @@ -226,7 +226,7 @@ alternative_cb_end
>  	clear_gp_regs
>  	mrs	x21, sp_el0
>  	ldr_this_cpu	tsk, __entry_task, x20
> -	msr	sp_el0, tsk
> +	msr	tpidrro_el0, tsk
>  
>  	/*
>  	 * Ensure MDSCR_EL1.SS is clear, since we can unmask debug exceptions
> @@ -548,7 +548,7 @@ SYM_CODE_START_LOCAL(__bad_stack)
>  	 */
>  
>  	/* Restore the original x0 value */
> -	mrs	x0, tpidrro_el0
> +	mrs	x0, sp_el0
>  
>  	/*
>  	 * Store the original GPRs to the new stack. The orginal SP (minus
> @@ -843,7 +843,7 @@ SYM_FUNC_START(cpu_switch_to)
>  	ldp	x29, x9, [x8], #16
>  	ldr	lr, [x8]
>  	mov	sp, x9
> -	msr	sp_el0, x1
> +	msr	tpidrro_el0, x1
>  	ptrauth_keys_install_kernel x1, x8, x9, x10
>  	scs_save x0
>  	scs_load_current
> @@ -1031,11 +1031,11 @@ SYM_CODE_START(__sdei_asm_handler)
>  
>  	/*
>  	 * We may have interrupted userspace, or a guest, or exit-from or
> -	 * return-to either of these. We can't trust sp_el0, restore it.
> +	 * return-to either of these. We can't trust tpidrro_el0, restore it.
>  	 */
> -	mrs	x28, sp_el0
> +	mrs	x28, tpidrro_el0
>  	ldr_this_cpu	dst=x0, sym=__entry_task, tmp=x1
> -	msr	sp_el0, x0
> +	msr	tpidrro_el0, x0
>  
>  	/* If we interrupted the kernel point to the previous stack/frame. */
>  	and     x0, x3, #0xc
> @@ -1051,7 +1051,7 @@ SYM_CODE_START(__sdei_asm_handler)
>  	mov	x1, x19
>  	bl	__sdei_handler
>  
> -	msr	sp_el0, x28
> +	msr	tpidrro_el0, x28
>  	/* restore regs >x17 that we clobbered */
>  	mov	x4, x19         // keep x4 for __sdei_asm_exit_trampoline
>  	ldp	x28, x29, [x4, #SDEI_EVENT_INTREGS + 16 * 14]
> diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
> index 87a822e5c4ca..c33551ee6572 100644
> --- a/arch/arm64/kernel/head.S
> +++ b/arch/arm64/kernel/head.S
> @@ -193,7 +193,7 @@ SYM_CODE_END(preserve_boot_args)
>  	 * for consistency with user tasks and kthreads.
>  	 */
>  	.macro	init_cpu_task tsk, tmp1, tmp2
> -	msr	sp_el0, \tsk
> +	msr	tpidrro_el0, \tsk
>  
>  	ldr	\tmp1, [\tsk, #TSK_STACK]
>  	add	sp, \tmp1, #THREAD_SIZE
> diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
> index bfdc12166895..79a19be88ced 100644
> --- a/arch/arm64/kernel/process.c
> +++ b/arch/arm64/kernel/process.c
> @@ -551,8 +551,9 @@ static void ssbs_thread_switch(struct task_struct *next)
>  }
>  
>  /*
> - * We store our current task in sp_el0, which is clobbered by userspace. Keep a
> - * shadow copy so that we can restore this upon entry from userspace.
> + * We store our current task in tpidrro_el0, which is clobbered when returning
> + * to userspace. Keep a shadow copy so that we can restore this upon entry from
> + * userspace.
>   *
>   * This is *only* for exception entry from EL0, and is not valid until we
>   * __switch_to() a user task.
> diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
> index c18e005a41db..51d853b92443 100644
> --- a/arch/arm64/net/bpf_jit_comp.c
> +++ b/arch/arm64/net/bpf_jit_comp.c
> @@ -1694,7 +1694,7 @@ static int build_insn(const struct bpf_verifier_env *env, const struct bpf_insn
>  		if (insn->src_reg == 0 && insn->imm == BPF_FUNC_get_smp_processor_id) {
>  			cpu_offset = offsetof(struct thread_info, cpu);
>  
> -			emit(A64_MRS_SP_EL0(tmp), ctx);
> +			emit(A64_MRS_TPIDRRO_EL0(tmp), ctx);
>  			if (is_lsi_offset(cpu_offset, 2)) {
>  				emit(A64_LDR32I(r0, tmp, cpu_offset), ctx);
>  			} else {
> @@ -1707,7 +1707,7 @@ static int build_insn(const struct bpf_verifier_env *env, const struct bpf_insn
>  		/* Implement helper call to bpf_get_current_task/_btf() inline */
>  		if (insn->src_reg == 0 && (insn->imm == BPF_FUNC_get_current_task ||
>  					   insn->imm == BPF_FUNC_get_current_task_btf)) {
> -			emit(A64_MRS_SP_EL0(r0), ctx);
> +			emit(A64_MRS_TPIDRRO_EL0(r0), ctx);
>  			break;
>  		}
>  


