Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00ADCCD6E44
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 14:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=123Sb8xW7IFMcJuJcw7GfUYEiZQJLjxktTy++FJHDN8=; b=o38gkJQTTPPmgNZY6zzcSt6mRD
	SAZJtGbNWvaacUeKpjhmnM8g5Zg/WUUjuoOwUAMi049ttf0pdO7plqwrcfLCb4Oo9c49O+YUMn+2R
	AbvqG1injH5FEfQEznLpTYYIGX4VH1z7Yphl65ALDAB9ZbbciEzfOxQpF4Q+Dvo4beE7BGO7hkhU9
	LwsjALJMoHz95LDN0O+NI6abI4pbuu+058lMf5HpBemgGORHJXf5zgK22/FiMSWHa9Jnp6BJ+3OBg
	ePhagqLQkjb6Rzr/faSx2ibkgHGCZYsv+4Om1CgM1zCpthvR7/zfJtitpVns4qJWm2xbXkLB6DwLL
	NeCyL8zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSbeJ-00000005qIa-3YnT;
	Thu, 28 May 2026 14:23:51 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSbeG-00000005qHw-3Dyx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 14:23:50 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-68b2229b48eso1053316a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 07:23:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779978226; cv=none;
        d=google.com; s=arc-20240605;
        b=QjVeiJdTMENyXWzX9QZqr/ZVpprG3o7TJDtz/Sf4hK7kZZhjT8Nf9DHlIp8LQ7LMwx
         vY1bEn88Jba7vFmCCLLl28x0Dk8jKlDcBnL8A3gikygYZnnYbIChveFrA76NyMlexiGV
         xVjvSf25HMqB3UrwZKktO8ewpnR92DFqdzs1Vj80HeZVWxChUU4nYzIspt2ZziUnNTzU
         n6QNpqGPrGCEHqEHxBvFwKjHypfDgVPbvIPJX1NGSsIxfEKnTgfH1uQD+TmQ2p8bgWCQ
         2nwfceqbFsjYyVNoXdCko8GDK/+UIIiiZiJB6WPlc/5io9lYQCRQNoYKQVkmaWhzv79C
         Wq1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=123Sb8xW7IFMcJuJcw7GfUYEiZQJLjxktTy++FJHDN8=;
        fh=JPEWLwp70TsEla43rbYw7jwQTcKyYOfWcIBUmacw24k=;
        b=ZfTk5vGXEp7drkYkf0+S9MRjl7EJgfL09ilGf0uEoevhMNwq0PWQSEaXr0lQRDMlNX
         49COJogQgF+mgLcgzYDpNRQ4dOREoHxASUC0AsCYqtKvqDNjvkeeDPhvA3F6YeEVF/9Z
         7indNO2cY+I6gsio5bSPPS+51/c1+x2YL9J2Mt5SmwU7DN4KUGVhfFKMz0c4PwuqAQQd
         qVOmUrrhtjvXlyH1iNwFlCdKLh1+8WFiN3jsjn5kgllgUfEeQTTx2nGIVvH4gzCm/TJi
         jeYHHcUxDab5StO+PewiR44N8P/FqiI0YrjYCtueGNJJ8MXtdFCq3QQ9PD4z7OKanaYH
         ELIw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779978226; x=1780583026; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=123Sb8xW7IFMcJuJcw7GfUYEiZQJLjxktTy++FJHDN8=;
        b=hOQzKJjtKLq2AILkatYRLVDk8OtVACptmj0NMgPcaMXaRo7lA4qxpzY1MKeW6vAqoC
         LZGMNARgg33TzhBbN0auE5yLW2i9Z9APK2gafQsA0ZTPuIcSc7QwZv7wyd94m7y05vYE
         LRVX74XEk3l/mQ5wolVN+hm6tyBDoKxcCHRg/Miku7ioD1uGxnG9SMThW0FrNZKiIyGf
         HM7Pw4sSAcHQcratR5IN6bDI2uAeLvVmQmPG13VVyJIiL7+8o2KKw3rEdhhsOgG0YMYm
         caz1SeY5Nzcsw67IJiXYMPdtmgqBLWUiekaopJlTBraiVjxnGoFaWWm/gDDdxnDEApHd
         WHfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779978226; x=1780583026;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=123Sb8xW7IFMcJuJcw7GfUYEiZQJLjxktTy++FJHDN8=;
        b=KDCZ1cbJMYQ95ORn5zD0HaFX0+cayHX7MMNjcWUc0/tuHfI7UXepF7cysTIUlvXp3h
         N7o+A9l+8GyvbSffFL32HeHEpApafGIjeXm+WeRcHZ7JOyYAhCfVJ4cqLUye9xvTEYce
         AIMXmMsw6F+xqvGg30tGyIMTfxiFXvzC1D57gPwotufFn7tUYFdERwrFLSDflvhkCWw/
         6//BPMi5yfj6iVM8phUjVaWPoMwMrm9zouyxkaVMe5SxSMllrdiB4LXCo2/Nc1GLLVMF
         vZGBsOyzjxyUTQvx1TfA5epoN8NR+nznx2+cX7uvRaIzrVVu8kDDIE9At+0rfCszdJur
         5ydg==
X-Forwarded-Encrypted: i=1; AFNElJ9HzGRpTjH0rRdotBuOpZg6jvf6GfRmiw5zUsPCJbwXz8cXoMP+mtdGYGybZkBGCiUW18/f29qKN2vwPVqwrqLT@lists.infradead.org
X-Gm-Message-State: AOJu0Yw52CYVDjCc/rH/Q36gPUK2LgfHhPjJghLe1z3GU82RyMPwenRf
	Drl9pbgDU0OHiPs9EkHaMTnxiU+sfBAhlTjajcMmwP2RuWri//S7IBgoJ04xR6ACeoGgZwMlGBU
	kCVrbNcZ/ljf1pcA8SE9y1Z7fq1gvBlM=
X-Gm-Gg: Acq92OEUHAnnmmbSZEMoy8Y7ycGy/SCLTpqrytiOK1KDPSwIjyI5YVDZaTvPx4j+YAE
	4fZVVT6OMxzYjHEpiD9sZgUF2IHs5xhWa1Axj1TLf+0DcDxwhjIVZjuu/kXBPSWya4Mk0ZpGtK9
	vqXSTHTRKhy8VWgt2AgqkLWUdnabk7hzf7l50FbnPWFn6/X/xvRrFE2iEiTEzBj1MJTbY8Rn9Sl
	XuLWyYYVN6pJSs2EG/pA3HBgL4Sfz/ObjkUm5baQ6Q6rilvOZR33Uj/uIsAUQF0yZRmgn+F3nro
	jZwLgD8qoDK6POoXGuHA9vuNQJe3R19KxSwMZEvxg4Tz
X-Received: by 2002:a05:6402:320f:b0:688:1697:ab72 with SMTP id
 4fb4d7f45d1cf-6889cc66198mr15216309a12.26.1779978226023; Thu, 28 May 2026
 07:23:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260427234801.2104511-1-puranjay@kernel.org> <20260427234801.2104511-3-puranjay@kernel.org>
 <ahhGbFY_4Dai1NjR@willie-the-truck>
In-Reply-To: <ahhGbFY_4Dai1NjR@willie-the-truck>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Thu, 28 May 2026 15:23:32 +0100
X-Gm-Features: AVHnY4LMDXcfZ1LqI3sJaif56UHbwagykFTXGHoWIwt3IHTuM31YvK58EmfPoYk
Message-ID: <CANk7y0j6JecSuJVZg1phn2tSHrcHPDqqmoaDBy1LdnMo-1qsFg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 2/3] bpf, arm64: Add JIT support for stack arguments
To: Will Deacon <will@kernel.org>
Cc: bpf@vger.kernel.org, Yonghong Song <yonghong.song@linux.dev>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_072348_846609_2556C67D 
X-CRM114-Status: GOOD (  37.65  )
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

Hi Will,

Thanks for your review.
These patches have already landed in bpf-next tree as a part of this
series: https://lore.kernel.org/all/20260513044949.2382019-1-yonghong.song@linux.dev/

I will take all your feedback and send fixes for all the required changes.

> How does that work with kfuncs? I think the PCS means that they will
> expect to pick the stack arguments starting at [SP+0]. Or are you
> saying that SP == FP+16 on entry to the callee? It's hard to reconcile
> that with the ASCII art in build_prologue() because neither "current
> A64_FP" nor "BPF_FP" point below A64_SP and it's not clear which of them
> you're referring to when you refer to "FP" on its own.

At entry to kfunc the arguments are starting at [SP+0] like a normal C
callee function would expect.

The line "callee reads them from [FP+16], [FP+24]" is for a BPF callee
which always emits a frame record.
So the caller puts the arguments at SP+0, SP+8, .. and then the callee
creates the frame record in the prologue which means the first
argument is at FP+16, ....
This is just an implementation detail about how the JITed BPF callee
programs can read stack arguments from FP+16, ... easily.

>
> > BPF convention uses fixed offsets from BPF_REG_PARAMS (r11): off=-8 is
> > always arg 6, off=-16 arg 7, etc. The verifier invalidates all outgoing
> > stack arg slots after each call, so the compiler must re-store before
> > every call. This means x5-x7 don't need to be saved on stack.
> >
> > Signed-off-by: Yonghong Song <yonghong.song@linux.dev>
> > Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
> > ---
> >  arch/arm64/net/bpf_jit_comp.c | 87 ++++++++++++++++++++++++++++++++++-
> >  1 file changed, 86 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
> > index 085e650662e3..cd8279880795 100644
> > --- a/arch/arm64/net/bpf_jit_comp.c
> > +++ b/arch/arm64/net/bpf_jit_comp.c
> > @@ -86,6 +86,7 @@ struct jit_ctx {
> >       __le32 *image;
> >       __le32 *ro_image;
> >       u32 stack_size;
> > +     u16 stack_arg_size;
> >       u64 user_vm_start;
> >       u64 arena_vm_start;
> >       bool fp_used;
> > @@ -533,13 +534,19 @@ static int build_prologue(struct jit_ctx *ctx, bool ebpf_from_cbpf)
> >        *                        |     |
> >        *                        +-----+ <= (BPF_FP - prog->aux->stack_depth)
> >        *                        |RSVD | padding
> > -      * current A64_SP =>      +-----+ <= (BPF_FP - ctx->stack_size)
> > +      *                        +-----+ <= (BPF_FP - ctx->stack_size)
> > +      *                        |     |
> > +      *                        | ... | outgoing stack args (9+, if any)
> > +      *                        |     |
> > +      * current A64_SP =>      +-----+
> >        *                        |     |
> >        *                        | ... | Function call stack
> >        *                        |     |
> >        *                        +-----+
> >        *                          low
> >        *
> > +      * Stack args 6-8 are passed in x5-x7, args 9+ at [SP].
> > +      * Incoming args 9+ are at [FP + 16], [FP + 24], ...
> >        */
>
> I assume the arguments being passed are all <= 64-bit scalar types? If
> we ever want to pass anything with > 64-bit alignment or to a varargs
> function, then the rules for allocation get a little hairy.

Yes, right now only 64-bit scalars are supported.

>
> >       emit_kcfi(is_main_prog ? cfi_bpf_hash : cfi_bpf_subprog_hash, ctx);
> > @@ -613,6 +620,9 @@ static int build_prologue(struct jit_ctx *ctx, bool ebpf_from_cbpf)
> >       if (ctx->stack_size && !ctx->priv_sp_used)
> >               emit(A64_SUB_I(1, A64_SP, A64_SP, ctx->stack_size), ctx);
> >
> > +     if (ctx->stack_arg_size)
> > +             emit(A64_SUB_I(1, A64_SP, A64_SP, ctx->stack_arg_size), ctx);
>
> How do you ensure that the stack pointer is always 16-byte aligned? We
> run with SP alignment checking enabled, so you need to take care of that.

Down below as you have already found, stack_arg_size is always aligned.

>
> > @@ -1191,6 +1207,41 @@ static int add_exception_handler(const struct bpf_insn *insn,
> >       return 0;
> >  }
> >
> > +static const u8 stack_arg_reg[] = { A64_R(5), A64_R(6), A64_R(7) };
> > +
> > +#define NR_STACK_ARG_REGS    ARRAY_SIZE(stack_arg_reg)
> > +
> > +static void emit_stack_arg_load(u8 dst, s16 bpf_off, struct jit_ctx *ctx)
> > +{
> > +     int idx = bpf_off / sizeof(u64) - 1;
> > +
> > +     if (idx < NR_STACK_ARG_REGS)
> > +             emit(A64_MOV(1, dst, stack_arg_reg[idx]), ctx);
> > +     else
> > +             emit(A64_LDR64I(dst, A64_FP, (idx - NR_STACK_ARG_REGS) * sizeof(u64) + 16), ctx);
> > +}
>
> Is it worth asserting that bpf_off >= 8 here or can we rely on that? I
> struggled to find any details about how bpf passes arguments on the
> stack (beyond what you describe in the commit message) and grepping for
> BPF_REG_PARAMS didn't help either.

This and other patches in this set has more information about this:
https://lore.kernel.org/all/20260513045015.2385013-1-yonghong.song@linux.dev/

>
> > +static void emit_stack_arg_store(u8 src_a64, s16 bpf_off, struct jit_ctx *ctx)
> > +{
> > +     int idx = -bpf_off / sizeof(u64) - 1;
> > +
> > +     if (idx < NR_STACK_ARG_REGS)
> > +             emit(A64_MOV(1, stack_arg_reg[idx], src_a64), ctx);
> > +     else
> > +             emit(A64_STR64I(src_a64, A64_SP, (idx - NR_STACK_ARG_REGS) * sizeof(u64)), ctx);
> > +}
> > +
> > +static void emit_stack_arg_store_imm(s32 imm, s16 bpf_off, const u8 tmp, struct jit_ctx *ctx)
> > +{
> > +     int idx = -bpf_off / sizeof(u64) - 1;
> > +
> > +     emit_a64_mov_i(1, tmp, imm, ctx);
> > +     if (idx < NR_STACK_ARG_REGS)
> > +             emit(A64_MOV(1, stack_arg_reg[idx], tmp), ctx);
>
> nit: You seem to have redundant MOVs here.

Ack, will fix this.

>
> > @@ -2065,6 +2137,14 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_pr
> >       ctx.user_vm_start = bpf_arena_get_user_vm_start(prog->aux->arena);
> >       ctx.arena_vm_start = bpf_arena_get_kern_vm_start(prog->aux->arena);
> >
> > +     if (prog->aux->stack_arg_depth > prog->aux->incoming_stack_arg_depth) {
> > +             u16 outgoing = prog->aux->stack_arg_depth - prog->aux->incoming_stack_arg_depth;
> > +             int nr_on_stack = outgoing / sizeof(u64) - NR_STACK_ARG_REGS;
> > +
> > +             if (nr_on_stack > 0)
> > +                     ctx.stack_arg_size = round_up(nr_on_stack * sizeof(u64), 16);
> > +     }
>
> ah, that's presumably where you handle the SP alignment. I think a
> comment would really help folks here... In fact, how does this interact
> with the same sort of SP adjustment that already exists in build_prologue()?
> Can we avoid the pointless re-alignment?

Yeah, you are right, if ctx->stack_size + ctx-> stack_arg_size is
aligned then we don't need to separately align these two, I can move
this from here and consolidate it in the build_prologue() function and
also add a comment there.

> Will

