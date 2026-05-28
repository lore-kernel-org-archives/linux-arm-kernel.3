Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6D6CD6E44
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 13:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gcv6nQ8dpSH8YzwYljJWvOEr6zw9pQuy9bPIsQ9LImE=; b=A+E4OyMUEJcfp2t9XB66G1m5xS
	oj6oMW3STprL2eXK6yVYmknDsmpuiDfaJcK0UJOzPNs17phAavG6BAwudngpzIpaM5Gy9AQpwLuL+
	QU1bRwM6uhjbND/oFrsWIFTOE8J9wAK2qwaAEB1ReM5VCOzfbbjcO6lvYKwwtwcLJleAxPSQt8Cz+
	JbiS2QajYg6H4DZ6z0QGI92dneqDceIFFWb5nvoPkbnRZb8eGg70yVccZk2O5ma9keUptxMDC18vT
	DeJNXWpM4wZ6w31FkinkLTtIHhDweHGKwSTdgS54uB0YX9NBAxzIxrryWHVCnBojCHNZMUZvXvAx6
	J00Pf99w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSb12-00000005noG-2kVS;
	Thu, 28 May 2026 13:43:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSb0z-00000005nnP-3Mty
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 13:43:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7313D442DB;
	Thu, 28 May 2026 13:43:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE8E81F000E9;
	Thu, 28 May 2026 13:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779975793;
	bh=gcv6nQ8dpSH8YzwYljJWvOEr6zw9pQuy9bPIsQ9LImE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lPOotcwfyS0TUGFf3G53f77pEG5IuYGlVooKyBOBNNQWMgiysyCnMh5IreHyPjm7W
	 TpP/a/EPnqf8MOPPUgvdJhJXrWnoMcOY2p/LibGjv8e0uk6Q0s9/9ZI/MGNLU1Th3/
	 E67jJeS17nNOuv3b3STcgXpJoKUmncu34lnD92mrGCvvrF93+Tn+hiSQBIU+IAWvSb
	 AbLVPynpG/LRqwpsURbim+z/Bpy2h6wAL638PnU144mNWDa1b8knuyvHR1R/e1bycZ
	 opKYXlYYBB/pEvnr3vRgemHwtTcm8ktMXFbQdZ08TPS57WO007lShyNlwuxxe8c/SJ
	 SeUvNbJ1bU7XA==
Date: Thu, 28 May 2026 14:43:08 +0100
From: Will Deacon <will@kernel.org>
To: Puranjay Mohan <puranjay@kernel.org>
Cc: bpf@vger.kernel.org, Yonghong Song <yonghong.song@linux.dev>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>, Xu Kuohai <xukuohai@huaweicloud.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH bpf-next v2 2/3] bpf, arm64: Add JIT support for stack
 arguments
Message-ID: <ahhGbFY_4Dai1NjR@willie-the-truck>
References: <20260427234801.2104511-1-puranjay@kernel.org>
 <20260427234801.2104511-3-puranjay@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427234801.2104511-3-puranjay@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_064314_102630_B3F614DD 
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

On Mon, Apr 27, 2026 at 04:47:59PM -0700, Puranjay Mohan wrote:
> Implement stack argument passing for BPF-to-BPF and kfunc calls with
> more than 5 parameters on arm64, following the AAPCS64 calling
> convention.
> 
> BPF R1-R5 already map to x0-x4. With BPF_REG_0 moved to x8 by the
> previous commit, x5-x7 are free for arguments 6-8. Arguments 9-12
> spill onto the stack at [SP+0], [SP+8], ... and the callee reads
> them from [FP+16], [FP+24], ... (above the saved FP/LR pair).

How does that work with kfuncs? I think the PCS means that they will
expect to pick the stack arguments starting at [SP+0]. Or are you
saying that SP == FP+16 on entry to the callee? It's hard to reconcile
that with the ASCII art in build_prologue() because neither "current
A64_FP" nor "BPF_FP" point below A64_SP and it's not clear which of them
you're referring to when you refer to "FP" on its own.

> BPF convention uses fixed offsets from BPF_REG_PARAMS (r11): off=-8 is
> always arg 6, off=-16 arg 7, etc. The verifier invalidates all outgoing
> stack arg slots after each call, so the compiler must re-store before
> every call. This means x5-x7 don't need to be saved on stack.
> 
> Signed-off-by: Yonghong Song <yonghong.song@linux.dev>
> Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
> ---
>  arch/arm64/net/bpf_jit_comp.c | 87 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 86 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
> index 085e650662e3..cd8279880795 100644
> --- a/arch/arm64/net/bpf_jit_comp.c
> +++ b/arch/arm64/net/bpf_jit_comp.c
> @@ -86,6 +86,7 @@ struct jit_ctx {
>  	__le32 *image;
>  	__le32 *ro_image;
>  	u32 stack_size;
> +	u16 stack_arg_size;
>  	u64 user_vm_start;
>  	u64 arena_vm_start;
>  	bool fp_used;
> @@ -533,13 +534,19 @@ static int build_prologue(struct jit_ctx *ctx, bool ebpf_from_cbpf)
>  	 *                        |     |
>  	 *                        +-----+ <= (BPF_FP - prog->aux->stack_depth)
>  	 *                        |RSVD | padding
> -	 * current A64_SP =>      +-----+ <= (BPF_FP - ctx->stack_size)
> +	 *                        +-----+ <= (BPF_FP - ctx->stack_size)
> +	 *                        |     |
> +	 *                        | ... | outgoing stack args (9+, if any)
> +	 *                        |     |
> +	 * current A64_SP =>      +-----+
>  	 *                        |     |
>  	 *                        | ... | Function call stack
>  	 *                        |     |
>  	 *                        +-----+
>  	 *                          low
>  	 *
> +	 * Stack args 6-8 are passed in x5-x7, args 9+ at [SP].
> +	 * Incoming args 9+ are at [FP + 16], [FP + 24], ...
>  	 */

I assume the arguments being passed are all <= 64-bit scalar types? If
we ever want to pass anything with > 64-bit alignment or to a varargs
function, then the rules for allocation get a little hairy.

>  	emit_kcfi(is_main_prog ? cfi_bpf_hash : cfi_bpf_subprog_hash, ctx);
> @@ -613,6 +620,9 @@ static int build_prologue(struct jit_ctx *ctx, bool ebpf_from_cbpf)
>  	if (ctx->stack_size && !ctx->priv_sp_used)
>  		emit(A64_SUB_I(1, A64_SP, A64_SP, ctx->stack_size), ctx);
>  
> +	if (ctx->stack_arg_size)
> +		emit(A64_SUB_I(1, A64_SP, A64_SP, ctx->stack_arg_size), ctx);

How do you ensure that the stack pointer is always 16-byte aligned? We
run with SP alignment checking enabled, so you need to take care of that.

> @@ -1191,6 +1207,41 @@ static int add_exception_handler(const struct bpf_insn *insn,
>  	return 0;
>  }
>  
> +static const u8 stack_arg_reg[] = { A64_R(5), A64_R(6), A64_R(7) };
> +
> +#define NR_STACK_ARG_REGS	ARRAY_SIZE(stack_arg_reg)
> +
> +static void emit_stack_arg_load(u8 dst, s16 bpf_off, struct jit_ctx *ctx)
> +{
> +	int idx = bpf_off / sizeof(u64) - 1;
> +
> +	if (idx < NR_STACK_ARG_REGS)
> +		emit(A64_MOV(1, dst, stack_arg_reg[idx]), ctx);
> +	else
> +		emit(A64_LDR64I(dst, A64_FP, (idx - NR_STACK_ARG_REGS) * sizeof(u64) + 16), ctx);
> +}

Is it worth asserting that bpf_off >= 8 here or can we rely on that? I
struggled to find any details about how bpf passes arguments on the
stack (beyond what you describe in the commit message) and grepping for
BPF_REG_PARAMS didn't help either.

> +static void emit_stack_arg_store(u8 src_a64, s16 bpf_off, struct jit_ctx *ctx)
> +{
> +	int idx = -bpf_off / sizeof(u64) - 1;
> +
> +	if (idx < NR_STACK_ARG_REGS)
> +		emit(A64_MOV(1, stack_arg_reg[idx], src_a64), ctx);
> +	else
> +		emit(A64_STR64I(src_a64, A64_SP, (idx - NR_STACK_ARG_REGS) * sizeof(u64)), ctx);
> +}
> +
> +static void emit_stack_arg_store_imm(s32 imm, s16 bpf_off, const u8 tmp, struct jit_ctx *ctx)
> +{
> +	int idx = -bpf_off / sizeof(u64) - 1;
> +
> +	emit_a64_mov_i(1, tmp, imm, ctx);
> +	if (idx < NR_STACK_ARG_REGS)
> +		emit(A64_MOV(1, stack_arg_reg[idx], tmp), ctx);

nit: You seem to have redundant MOVs here.

> @@ -2065,6 +2137,14 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_pr
>  	ctx.user_vm_start = bpf_arena_get_user_vm_start(prog->aux->arena);
>  	ctx.arena_vm_start = bpf_arena_get_kern_vm_start(prog->aux->arena);
>  
> +	if (prog->aux->stack_arg_depth > prog->aux->incoming_stack_arg_depth) {
> +		u16 outgoing = prog->aux->stack_arg_depth - prog->aux->incoming_stack_arg_depth;
> +		int nr_on_stack = outgoing / sizeof(u64) - NR_STACK_ARG_REGS;
> +
> +		if (nr_on_stack > 0)
> +			ctx.stack_arg_size = round_up(nr_on_stack * sizeof(u64), 16);
> +	}

ah, that's presumably where you handle the SP alignment. I think a
comment would really help folks here... In fact, how does this interact
with the same sort of SP adjustment that already exists in build_prologue()?
Can we avoid the pointless re-alignment?

Will

