Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F7BC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 14:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NNGt/cdIwueFx7Ue6yDIXK/D8t6ekwaqkK2fcP5cSBk=; b=HanpARIRgFRub/EG8kyN1TcOSz
	+ADHL2k2k1XqEvucv2GwKHFyyeymW1cCdDwSVyampBc59CCLD+num03SGmcjFwZpENJGBGmbNlKyI
	d2/43PBqQmG272Keh8kPE/R0zTh6+sWmqfeWaADvkXYrm5Yfe2UdUKTxGnkDg8AuiOuovuZWuzScI
	sHyE3a9ZSesALqLQQI6+zbpvHVfDGi8DvAxWGT+X2LdbCg0jZVvq1MbBAwrziw+NqnWVSBd8I/t+d
	+/oLMqiqwc1kySPmDzB64EjsvxdincdNL5fjw+jENeGZ8XVmTCzL0dGScWTz0uPdS32Uy3UrTVPiF
	0ljKGnEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaEkX-0000000F1f4-3Xvg;
	Fri, 11 Jul 2025 14:29:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaEiC-0000000F1WE-0Io1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 14:26:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1941B44F95;
	Fri, 11 Jul 2025 14:26:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AF5EC4CEED;
	Fri, 11 Jul 2025 14:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752244011;
	bh=FfMiSRStzxbidMZH6QNfoVJy9vPSxpBAXuFX/AKkUTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QIVGggrWKr1C79TZ+faVFd+qIm3hNfpOEAsggnq1KS5E6JH54f4jlpyxw84/ffkM0
	 UhNDiitZygkABnadoJTramixMFe8jMYM9YNcobIOD2n158aeupvUfcWjD5VaoE7rsq
	 jXQDMyun50Cn/TvATapcy547Df4To9+JV+hX5wGSNlhxytvKCWYyJPSrU0+g6tdIht
	 hmslsCwlgs0kX5vQA25uOBS8tl2DLiPAO+NnVZx6bjW9qasYK8XGBv2QUp/pqx2Ru1
	 AJTFVq2PYIASFEt/+vQYlFsXmaD8/EcRmpMGFp1PIgeobp1Q4l6Q1mG0WggAQudeT5
	 6ouPluY19RsUA==
Date: Fri, 11 Jul 2025 15:26:45 +0100
From: Will Deacon <will@kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: bpf@vger.kernel.org, Puranjay Mohan <puranjay@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Maxwell Bland <mbland@motorola.com>,
	Puranjay Mohan <puranjay12@gmail.com>,
	Dao Huang <huangdao1@oppo.com>
Subject: Re: [PATCH bpf-next v9 2/2] arm64/cfi,bpf: Support kCFI + BPF on
 arm64
Message-ID: <aHEfJZjW9dTXCgw3@willie-the-truck>
References: <20250505223437.3722164-4-samitolvanen@google.com>
 <20250505223437.3722164-6-samitolvanen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250505223437.3722164-6-samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_072652_152568_0C589B4C 
X-CRM114-Status: GOOD (  29.34  )
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

On Mon, May 05, 2025 at 10:34:40PM +0000, Sami Tolvanen wrote:
> From: Puranjay Mohan <puranjay12@gmail.com>
> 
> Currently, bpf_dispatcher_*_func() is marked with `__nocfi` therefore
> calling BPF programs from this interface doesn't cause CFI warnings.
> 
> When BPF programs are called directly from C: from BPF helpers or
> struct_ops, CFI warnings are generated.
> 
> Implement proper CFI prologues for the BPF programs and callbacks and
> drop __nocfi for arm64. Fix the trampoline generation code to emit kCFI
> prologue when a struct_ops trampoline is being prepared.
> 
> Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>
> Co-developed-by: Maxwell Bland <mbland@motorola.com>
> Signed-off-by: Maxwell Bland <mbland@motorola.com>
> Co-developed-by: Sami Tolvanen <samitolvanen@google.com>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> Tested-by: Dao Huang <huangdao1@oppo.com>
> ---
>  arch/arm64/include/asm/cfi.h    | 23 +++++++++++++++++++++++
>  arch/arm64/kernel/alternative.c | 25 +++++++++++++++++++++++++
>  arch/arm64/net/bpf_jit_comp.c   | 22 +++++++++++++++++++---
>  3 files changed, 67 insertions(+), 3 deletions(-)
>  create mode 100644 arch/arm64/include/asm/cfi.h
> 
> diff --git a/arch/arm64/include/asm/cfi.h b/arch/arm64/include/asm/cfi.h
> new file mode 100644
> index 000000000000..670e191f8628
> --- /dev/null
> +++ b/arch/arm64/include/asm/cfi.h
> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_ARM64_CFI_H
> +#define _ASM_ARM64_CFI_H
> +
> +#ifdef CONFIG_CFI_CLANG
> +#define __bpfcall
> +static inline int cfi_get_offset(void)
> +{
> +	return 4;

Needs a comment.

> +}
> +#define cfi_get_offset cfi_get_offset
> +extern u32 cfi_bpf_hash;
> +extern u32 cfi_bpf_subprog_hash;
> +extern u32 cfi_get_func_hash(void *func);
> +#else
> +#define cfi_bpf_hash 0U
> +#define cfi_bpf_subprog_hash 0U
> +static inline u32 cfi_get_func_hash(void *func)
> +{
> +	return 0;
> +}
> +#endif /* CONFIG_CFI_CLANG */
> +#endif /* _ASM_ARM64_CFI_H */

This looks like an awful lot of boiler plate to me. The only thing you
seem to need is the CFI offset -- why isn't that just a constant that we
can define (or a Kconfig symbol?).

> diff --git a/arch/arm64/kernel/alternative.c b/arch/arm64/kernel/alternative.c
> index 8ff6610af496..71c153488dad 100644
> --- a/arch/arm64/kernel/alternative.c
> +++ b/arch/arm64/kernel/alternative.c
> @@ -8,11 +8,13 @@
>  
>  #define pr_fmt(fmt) "alternatives: " fmt
>  
> +#include <linux/cfi_types.h>
>  #include <linux/init.h>
>  #include <linux/cpu.h>
>  #include <linux/elf.h>
>  #include <asm/cacheflush.h>
>  #include <asm/alternative.h>
> +#include <asm/cfi.h>
>  #include <asm/cpufeature.h>
>  #include <asm/insn.h>
>  #include <asm/module.h>
> @@ -298,3 +300,26 @@ noinstr void alt_cb_patch_nops(struct alt_instr *alt, __le32 *origptr,
>  		updptr[i] = cpu_to_le32(aarch64_insn_gen_nop());
>  }
>  EXPORT_SYMBOL(alt_cb_patch_nops);
> +
> +#ifdef CONFIG_CFI_CLANG
> +struct bpf_insn;
> +
> +/* Must match bpf_func_t / DEFINE_BPF_PROG_RUN() */
> +extern unsigned int __bpf_prog_runX(const void *ctx,
> +				    const struct bpf_insn *insn);
> +DEFINE_CFI_TYPE(cfi_bpf_hash, __bpf_prog_runX);
> +
> +/* Must match bpf_callback_t */
> +extern u64 __bpf_callback_fn(u64, u64, u64, u64, u64);
> +DEFINE_CFI_TYPE(cfi_bpf_subprog_hash, __bpf_callback_fn);
> +
> +u32 cfi_get_func_hash(void *func)
> +{
> +	u32 hash;
> +
> +	if (get_kernel_nofault(hash, func - cfi_get_offset()))
> +		return 0;
> +
> +	return hash;
> +}
> +#endif /* CONFIG_CFI_CLANG */

I don't think this should be in alternative.c. It's probably better off
either as a 'static inline' in the new cfi.h header.

> diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
> index 70d7c89d3ac9..3b3691e88dd5 100644
> --- a/arch/arm64/net/bpf_jit_comp.c
> +++ b/arch/arm64/net/bpf_jit_comp.c
> @@ -9,6 +9,7 @@
>  
>  #include <linux/bitfield.h>
>  #include <linux/bpf.h>
> +#include <linux/cfi.h>
>  #include <linux/filter.h>
>  #include <linux/memory.h>
>  #include <linux/printk.h>
> @@ -164,6 +165,12 @@ static inline void emit_bti(u32 insn, struct jit_ctx *ctx)
>  		emit(insn, ctx);
>  }
>  
> +static inline void emit_kcfi(u32 hash, struct jit_ctx *ctx)
> +{
> +	if (IS_ENABLED(CONFIG_CFI_CLANG))
> +		emit(hash, ctx);
> +}
> +
>  /*
>   * Kernel addresses in the vmalloc space use at most 48 bits, and the
>   * remaining bits are guaranteed to be 0x1. So we can compose the address
> @@ -474,7 +481,6 @@ static int build_prologue(struct jit_ctx *ctx, bool ebpf_from_cbpf)
>  	const bool is_main_prog = !bpf_is_subprog(prog);
>  	const u8 fp = bpf2a64[BPF_REG_FP];
>  	const u8 arena_vm_base = bpf2a64[ARENA_VM_START];
> -	const int idx0 = ctx->idx;
>  	int cur_offset;
>  
>  	/*
> @@ -500,6 +506,9 @@ static int build_prologue(struct jit_ctx *ctx, bool ebpf_from_cbpf)
>  	 *
>  	 */
>  
> +	emit_kcfi(is_main_prog ? cfi_bpf_hash : cfi_bpf_subprog_hash, ctx);
> +	const int idx0 = ctx->idx;
> +
>  	/* bpf function may be invoked by 3 instruction types:
>  	 * 1. bl, attached via freplace to bpf prog via short jump
>  	 * 2. br, attached via freplace to bpf prog via long jump
> @@ -2009,9 +2018,9 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
>  		jit_data->ro_header = ro_header;
>  	}
>  
> -	prog->bpf_func = (void *)ctx.ro_image;
> +	prog->bpf_func = (void *)ctx.ro_image + cfi_get_offset();
>  	prog->jited = 1;
> -	prog->jited_len = prog_size;
> +	prog->jited_len = prog_size - cfi_get_offset();

Why do we add the offset even when CONFIG_CFI_CLANG is not enabled?

Will

