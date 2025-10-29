Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A57BCCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 14:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JkwLXX74hnkGoiSg/wJw07lJJDix5irvrSVum7JvkiE=; b=RloPgoHk8N7ksIPdwznfc5HsYH
	eB12/oniUReSi6dGPyzJYn03bMdUjnWa3popetqaEynoTLgPeU9UrTepHHx6Z4zOQbPAtn6VnWKwr
	677Ts5LKnoMRwFXuPW7Rix56nAMG43emgEabGHPFLR4VvA8PH5Y30fkxGbqvx4D8keLV3BvhmnZGr
	6/D59wDqoLyUj5bbVrL9bPkL/Y2hJ5UI89SOASSpJIzBPipX2mMwWRodvn/swP30qCkC2wb0fhZeC
	EkmwvdlbEp0/pr5EidrbwNZGfsjuSQxKHj8BbZwpMFhHnbIzoqjajq/LkfKQjG+gbP3mLMGYsc+kY
	hHFFAYvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE7F5-00000001bHR-16ZV;
	Wed, 29 Oct 2025 14:33:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE7F3-00000001bF3-1gQS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 14:33:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 918791AC1;
	Wed, 29 Oct 2025 07:33:26 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B60463F66E;
	Wed, 29 Oct 2025 07:33:32 -0700 (PDT)
Date: Wed, 29 Oct 2025 14:33:26 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Ben Niu <benniu@meta.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, tytso@mit.edu, Jason@zx2c4.com,
	Ben Niu <niuben003@gmail.com>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tracing: Enable kprobe tracing for Arm64 asm functions
Message-ID: <aQIltqoIVDwh4A6p@J2N7QTR9R3>
References: <20251027181749.240466-1-benniu@meta.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027181749.240466-1-benniu@meta.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_073337_520494_EB32C1F5 
X-CRM114-Status: GOOD (  26.91  )
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

On Mon, Oct 27, 2025 at 11:17:49AM -0700, Ben Niu wrote:
> Currently, Arm64 assembly functions always have a bti c
> instruction inserted before the prologue. When ftrace is enabled,
> no padding nops are inserted at all.
> 
> This breaks kprobe tracing for asm functions, which assumes that
> proper nops are added before and within functions (when ftrace is
> enabled) and bti c is only present when CONFIG_ARM64_BTI_KERNEL is
> defined.

What exactly do you mean by "breaks kprobe tracing"?

The kprobes code knows NOTHING about those ftrace NOPs, so I cannot see
how those are relevant.

The patch adds entries to __patchable_function_entries, which is owned
by ftrace, and has NOTHING to do with kprobes.

> The patch fixes the bug by inserting nops and bti c in Arm64 asm
> in the same way as compiled C code.

As it stands, NAK to this change.

I'm not averse to making (some) assembly functions traceable by ftrace,
and hence giving those NOPs. However, that's not safe generally (e.g.
due to noinstr requirements), and so special care will need to be taken.

The rationale above does not make sense; it conflates distinct things,
and I think a more complete explanation is necessary.

Mark.

> Note: although this patch unblocks kprobe tracing, fentry is still
> broken because no BTF info gets generated from assembly files. A
> separate patch is needed to fix that.
> 
> I built this patch with different combos of the following features
> and confirmed kprobe tracing for asm function __arch_copy_to_user
> worked in all cases:
> 
> CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS
> CONFIG_DYNAMIC_FTRACE_WITH_ARGS
> CONFIG_ARM64_BTI_KERNEL
> 
> Signed-off-by: Ben Niu <benniu@meta.com>
> ---
>  arch/arm64/include/asm/linkage.h           | 103 ++++++++++++++++-----
>  arch/arm64/kernel/vdso/vgetrandom-chacha.S |   2 +-
>  2 files changed, 81 insertions(+), 24 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/linkage.h b/arch/arm64/include/asm/linkage.h
> index d3acd9c87509..f3f3bc168162 100644
> --- a/arch/arm64/include/asm/linkage.h
> +++ b/arch/arm64/include/asm/linkage.h
> @@ -5,8 +5,47 @@
>  #include <asm/assembler.h>
>  #endif
>  
> -#define __ALIGN		.balign CONFIG_FUNCTION_ALIGNMENT
> -#define __ALIGN_STR	".balign " #CONFIG_FUNCTION_ALIGNMENT
> +#define __ALIGN .balign CONFIG_FUNCTION_ALIGNMENT
> +#define __ALIGN_STR ".balign " #CONFIG_FUNCTION_ALIGNMENT
> +
> +#ifdef CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS
> +
> +#define PRE_FUNCTION_NOPS                                                   \
> +	ALIGN;                                                              \
> +	nops CONFIG_FUNCTION_ALIGNMENT / 4 - 2;                             \
> +	.pushsection __patchable_function_entries, "awo", @progbits, .text; \
> +	.p2align 3;                                                         \
> +	.8byte 1f;                                                          \
> +	.popsection;                                                        \
> +	1 :;                                                                \
> +	nops 2;
> +
> +#define PRE_PROLOGUE_NOPS nops 2;
> +
> +#elif defined(CONFIG_DYNAMIC_FTRACE_WITH_ARGS)
> +
> +#define PRE_FUNCTION_NOPS
> +
> +#define PRE_PROLOGUE_NOPS                                                   \
> +	.pushsection __patchable_function_entries, "awo", @progbits, .text; \
> +	.p2align 3;                                                         \
> +	.8byte 1f;                                                          \
> +	.popsection;                                                        \
> +	1 :;                                                                \
> +	nops 2;
> +
> +#else
> +
> +#define PRE_FUNCTION_NOPS
> +#define PRE_PROLOGUE_NOPS
> +
> +#endif
> +
> +#ifdef CONFIG_ARM64_BTI_KERNEL
> +#define BTI_C bti c;
> +#else
> +#define BTI_C
> +#endif
>  
>  /*
>   * When using in-kernel BTI we need to ensure that PCS-conformant
> @@ -15,32 +54,50 @@
>   * everything, the override is done unconditionally so we're more
>   * likely to notice any drift from the overridden definitions.
>   */
> -#define SYM_FUNC_START(name)				\
> -	SYM_START(name, SYM_L_GLOBAL, SYM_A_ALIGN)	\
> -	bti c ;
> +#define SYM_FUNC_START(name)                       \
> +	PRE_FUNCTION_NOPS                          \
> +	SYM_START(name, SYM_L_GLOBAL, SYM_A_ALIGN) \
> +	BTI_C                                      \
> +	PRE_PROLOGUE_NOPS
> +
> +#define SYM_FUNC_START_NOTRACE(name)               \
> +	SYM_START(name, SYM_L_GLOBAL, SYM_A_ALIGN) \
> +	BTI_C
>  
> -#define SYM_FUNC_START_NOALIGN(name)			\
> -	SYM_START(name, SYM_L_GLOBAL, SYM_A_NONE)	\
> -	bti c ;
> +#define SYM_FUNC_START_NOALIGN(name)              \
> +	PRE_FUNCTION_NOPS                         \
> +	SYM_START(name, SYM_L_GLOBAL, SYM_A_NONE) \
> +	BTI_C                                     \
> +	PRE_PROLOGUE_NOPS
>  
> -#define SYM_FUNC_START_LOCAL(name)			\
> -	SYM_START(name, SYM_L_LOCAL, SYM_A_ALIGN)	\
> -	bti c ;
> +#define SYM_FUNC_START_LOCAL(name)                \
> +	PRE_FUNCTION_NOPS                         \
> +	SYM_START(name, SYM_L_LOCAL, SYM_A_ALIGN) \
> +	BTI_C                                     \
> +	PRE_PROLOGUE_NOPS
>  
> -#define SYM_FUNC_START_LOCAL_NOALIGN(name)		\
> -	SYM_START(name, SYM_L_LOCAL, SYM_A_NONE)	\
> -	bti c ;
> +#define SYM_FUNC_START_LOCAL_NOALIGN(name)       \
> +	PRE_FUNCTION_NOPS                        \
> +	SYM_START(name, SYM_L_LOCAL, SYM_A_NONE) \
> +	BTI_C                                    \
> +	PRE_PROLOGUE_NOPS
>  
> -#define SYM_FUNC_START_WEAK(name)			\
> -	SYM_START(name, SYM_L_WEAK, SYM_A_ALIGN)	\
> -	bti c ;
> +#define SYM_FUNC_START_WEAK(name)                \
> +	PRE_FUNCTION_NOPS                        \
> +	SYM_START(name, SYM_L_WEAK, SYM_A_ALIGN) \
> +	BTI_C                                    \
> +	PRE_PROLOGUE_NOPS
>  
> -#define SYM_FUNC_START_WEAK_NOALIGN(name)		\
> -	SYM_START(name, SYM_L_WEAK, SYM_A_NONE)		\
> -	bti c ;
> +#define SYM_FUNC_START_WEAK_NOALIGN(name)       \
> +	PRE_FUNCTION_NOPS                       \
> +	SYM_START(name, SYM_L_WEAK, SYM_A_NONE) \
> +	BTI_C                                   \
> +	PRE_PROLOGUE_NOPS
>  
> -#define SYM_TYPED_FUNC_START(name)				\
> -	SYM_TYPED_START(name, SYM_L_GLOBAL, SYM_A_ALIGN)	\
> -	bti c ;
> +#define SYM_TYPED_FUNC_START(name)                       \
> +	PRE_FUNCTION_NOPS                                \
> +	SYM_TYPED_START(name, SYM_L_GLOBAL, SYM_A_ALIGN) \
> +	BTI_C                                            \
> +	PRE_PROLOGUE_NOPS
>  
>  #endif
> diff --git a/arch/arm64/kernel/vdso/vgetrandom-chacha.S b/arch/arm64/kernel/vdso/vgetrandom-chacha.S
> index 67890b445309..21c27b64cf9f 100644
> --- a/arch/arm64/kernel/vdso/vgetrandom-chacha.S
> +++ b/arch/arm64/kernel/vdso/vgetrandom-chacha.S
> @@ -40,7 +40,7 @@
>   *	x2: 8-byte counter input/output
>   *	x3: number of 64-byte block to write to output
>   */
> -SYM_FUNC_START(__arch_chacha20_blocks_nostack)
> +SYM_FUNC_START_NOTRACE(__arch_chacha20_blocks_nostack)
>  
>  	/* copy0 = "expand 32-byte k" */
>  	mov_q		x8, 0x3320646e61707865
> -- 
> 2.47.3
> 
> 

