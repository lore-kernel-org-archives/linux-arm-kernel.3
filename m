Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F91F9D0FE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 01:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HKfrD0lzQq9gH4/y0f+y8Q+Jm6wjNjgq0stAYlHk0iU=; b=ec7KJFz9//3HN9xINwnAhWw0aS
	tUYjkdRNQPS13cVFwq2HaVSZyyBAbdf3Ou/Pu+JdJzbzRmuNAd70eQjjK3zmv/4P+gIfTLeEohl/l
	aXcQP/F/Lj1Wfu+kTZueUg2adnXlbsoEUSD7lotYOtagPZl5gZcMJIV3q0+gvvKJ3NBA4dhEvizRQ
	znrtM+oVP7+2Ukowk1Zj2mXTA7L2eUwpmI7cCWWo6tm0GArkircunFBhPFFaos7TnhrizcmRv5vfU
	077towHgAfSw5rogtgLsje7GmNh9W7ByPFMtf/2uadvdVTOT4I3o8p6abUJ+CvxIJRl9YPMInNkQ/
	V6WD62xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCpTe-00000000RYR-0CAh;
	Wed, 15 Apr 2026 01:55:38 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCpTZ-00000000RXY-3mIv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 01:55:36 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-682d981b025so3585714eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 18:55:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776218132; cv=none;
        d=google.com; s=arc-20240605;
        b=WrqL6QOO82n7ozSsdeJlQqHpEEqmEpLk8h30ERzclDElJYko57UjY9b7yh7j6Bzab5
         mahy3XegcxgrED9A7hNTHXO643pS7j7efloBJpfH5Iuj8Gf7kWzAObXaioOaJNXVgHUZ
         m4OXJ3kxRIxKvOdBCabEcTS9qmWtq7L9vLkXz0qT96ATqgXsqxfSw8aexdFG2TIvVWds
         DBauEwAYDa1Nh3Ti3QngB/20TMmraRxtrviuaLp/r4vfnsFUNrsU8/+3IdrGKgW6h+0v
         dS6RtVHf8A8K/Siz+sRVySYnFqokdxgbnuH7RtFYKMakxVn1xVN3+5VdHZ8Ub1YFF14n
         o/ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HKfrD0lzQq9gH4/y0f+y8Q+Jm6wjNjgq0stAYlHk0iU=;
        fh=QzcnCeChrt5SBefkUcLwgUyGhQLIO1cAYaDmFnmDWzw=;
        b=d2T8vGT5aGJm34V14vxkAAI3UIj04YBadN4Vmwmoq1LsWzWOPenQ6DML/+LDJquly2
         IQgCDVw9Re5Sjbb5EJmbL/PRFbDbK99/RS7so/IAZ9yxXEsIZwZ1hhEaEiSVf3n6hmKh
         LvP1wldah4AFbImyh4M0R9H0Ajxd+tGE/gm/5yVuR2YXE8VIFWFLD3JBNOVintewd6qR
         xFZ2yBV4bnlFnczNejEQ+ePcOE3p5Mv7tipyy+MtsW2gkj4aX0LppwY0tf4fvLO3TTVw
         KFroKKhp8mpl9ZnOFItLqlt9gb2IsxP3Dhfk8W3KEUuxQtDjykIrT47kSai+j7b80SMX
         99Eg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776218132; x=1776822932; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HKfrD0lzQq9gH4/y0f+y8Q+Jm6wjNjgq0stAYlHk0iU=;
        b=gV0pIKXIBO7w4dkcKB6DUDWcwegZ4mOvYdBBd/H+OOvxOVVOTn1bXtISKUzO5AlNAB
         310YepjXdgvlttkFA5lPTNVZS9IxINuwbprMet/V2wEm+f0RNQm1o1fx8orff6vct2x+
         /Me+GBizROn1mqtcv/CvS+NL7cHrvSoEAShyjmFxI3wTFKRrQBTa4thSocWlpYJ1mJuY
         fBtHwD/jM4V1lAXGO5We4TPMuQM9IRjTAKp3hUpfiNJB8PadLP19PzuFEGMce/bT3Bw3
         Ltjn3CTcF7w2XuC9E9jGsPoESfj+5017nROBeYnEhPM70rUsr3bOYddnIBIz1QHQtiyT
         81UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776218132; x=1776822932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HKfrD0lzQq9gH4/y0f+y8Q+Jm6wjNjgq0stAYlHk0iU=;
        b=cYFqI7NQnNN6ywnzOxtSXPJpiP2g+iSmp1+hI1wZP2vcPjxHXDkvtDXnQEGw/TfNZJ
         miE0MeFtWc8+hCAIPs/dqQLR2I8+WiMRC3C5DIkW8P1eyz+r6c4hQ5OVnmBWJWx2XqJC
         HG4vY3h0vztCUybnJQj9lr3+Y5QHJsw2nWWnqHzkuWxdNBpYB3n6LHP4ua7Y2/x8R/9S
         EeLTXdLscrxM37x1hzHXYTlB/lWmmH7yI5yZK8o7smw/1BrWamf2OPHOuWiky02pFU/K
         eUMaB8L8rjUnCM94GDqqNmddLpq2kLeB7KHI8YUKOMQgHHR+nz+AvsWbHUNGEFDyCT8i
         Xqtg==
X-Forwarded-Encrypted: i=1; AFNElJ82/zpAVvk3leoej8Vk+1xB44sX+o5KjSQ1mY5ouzLivExNVI+Zcp1slgFphdQhtqnCyH1C30t1BCs383X7wKQu@lists.infradead.org
X-Gm-Message-State: AOJu0YymOs5Brq2R0D44wnQ1fU5PYZKzKZBenUCkyg726MV3C/O1tHmm
	8pzfQdlDbdoqjp4RzC83klWKDrrWLzUIexcK3b1XY4A5wJ9a1Wqviz4567edF46zpd09e+WoNrL
	NKPCQy3+GDH0gk6XLdexCo0XBjgpbeHU=
X-Gm-Gg: AeBDievhgssOxAWKhZFJbaRfj3jp8C5perSvp2E4BIrWK5w3xPIy3irNcHwhgMOSaAs
	UFFIea72vWhjAXHL6n1cctngIRVqMxkcfsWYogc4q1ZP7TZ49bNosnZ+7SqyCapeps3rATDxTIa
	fWVYdJvwEt+C3rlbRqeHp2JvXx4CIS8YB6jOwcfrh+FmpHs+ysZ/P/KWUEVOFwkzobXgN2Gs91j
	Gp9YUc4zLcLaGnBFira2URez7ZeaJ0ChHXJY9KG771Xaxoxg2qMLTfYdC5/jOlz6xRnkWEuYlVB
	S35eJFXRR67aHoqaew==
X-Received: by 2002:a05:6820:4dc3:b0:684:bf61:ed25 with SMTP id
 006d021491bc7-68be671f6c7mr10532179eaf.19.1776218131485; Tue, 14 Apr 2026
 18:55:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1776062885.git.xukuohai@hotmail.com> <7d88904b4028cbe124bbaba5739c525663bedc64.1776062885.git.xukuohai@hotmail.com>
In-Reply-To: <7d88904b4028cbe124bbaba5739c525663bedc64.1776062885.git.xukuohai@hotmail.com>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Wed, 15 Apr 2026 09:55:19 +0800
X-Gm-Features: AQROBzAGRf4G7Q7j00v152ufQn5ID6m7G5LzuuL96-9X47tlAllwRQh6MBGEgAM
Message-ID: <CAEyhmHSoW+D_3wB=zt+mi-8JeDM4kLJ8EP33ph01JhMtpv2Cdg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v14 1/5] bpf: Move constants blinding out of
 arch-specific JITs
To: Xu Kuohai <xukuohai@huaweicloud.com>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Yonghong Song <yonghong.song@linux.dev>, 
	Puranjay Mohan <puranjay@kernel.org>, Anton Protopopov <a.s.protopopov@gmail.com>, 
	=?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>, 
	Shahab Vahedi <list+bpf@vahedi.org>, Russell King <linux@armlinux.org.uk>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, Johan Almbladh <johan.almbladh@anyfinetworks.com>, 
	Paul Burton <paulburton@kernel.org>, Hari Bathini <hbathini@linux.ibm.com>, 
	Christophe Leroy <chleroy@kernel.org>, Naveen N Rao <naveen@kernel.org>, 
	Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Pu Lehui <pulehui@huawei.com>, Ilya Leoshkevich <iii@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	"David S . Miller" <davem@davemloft.net>, Wang YanQing <udknight@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_185534_120728_2ABD9E09 
X-CRM114-Status: GOOD (  39.24  )
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

On Mon, Apr 13, 2026 at 9:07=E2=80=AFPM Xu Kuohai <xukuohai@huaweicloud.com=
> wrote:
>
> From: Xu Kuohai <xukuohai@huawei.com>
>
> During the JIT stage, constants blinding rewrites instructions but only
> rewrites the private instruction copy of the JITed subprog, leaving the
> global env->prog->insnsi and env->insn_aux_data untouched. This causes a
> mismatch between subprog instructions and the global state, making it
> difficult to use the global data in the JIT.
>
> To avoid this mismatch, and given that all arch-specific JITs already
> support constants blinding, move it to the generic verifier code, and
> switch to rewrite the global env->prog->insnsi with the global states
> adjusted, as other rewrites in the verifier do.
>
> This removes the constants blinding calls in each JIT, which are largely
> duplicated code across architectures.
>
> Since constants blinding is only required for JIT, and there are two
> JIT entry functions, jit_subprogs() for BPF programs with multiple
> subprogs and bpf_prog_select_runtime() for programs with no subprogs,
> move the constants blinding invocation into these two functions.
>
> In the verifier path, bpf_patch_insn_data() is used to keep global
> verifier auxiliary data in sync with patched instructions. A key
> question is whether this global auxiliary data should be restored
> on the failure path.
>
> Besides instructions, bpf_patch_insn_data() adjusts:
>   - prog->aux->poke_tab
>   - env->insn_array_maps
>   - env->subprog_info
>   - env->insn_aux_data
>
> For prog->aux->poke_tab, it is only used by JIT or only meaningful after
> JIT succeeds, so it does not need to be restored on the failure path.
>
> For env->insn_array_maps, when JIT fails, programs using insn arrays
> are rejected by bpf_insn_array_ready() due to missing JIT addresses.
> Hence, env->insn_array_maps is only meaningful for JIT and does not need
> to be restored.
>
> For subprog_info, if jit_subprogs fails and CONFIG_BPF_JIT_ALWAYS_ON
> is not enabled, kernel falls back to interpreter. In this case,
> env->subprog_info is used to determine subprogram stack depth. So it
> must be restored on failure.
>
> For env->insn_aux_data, it is freed by clear_insn_aux_data() at the
> end of bpf_check(). Before freeing, clear_insn_aux_data() loops over
> env->insn_aux_data to release jump targets recorded in it. The loop
> uses env->prog->len as the array length, but this length no longer
> matches the actual size of the adjusted env->insn_aux_data array after
> constants blinding.
>
> To address it, a simple approach is to keep insn_aux_data as adjusted
> after failure, since it will be freed shortly, and record its actual size
> for the loop in clear_insn_aux_data(). But since clear_insn_aux_data()
> uses the same index to loop over both env->prog->insnsi and env->insn_aux=
_data,
> this approach results in incorrect index for the insnsi array. So an
> alternative approach is adopted: clone the original env->insn_aux_data
> before blinding and restore it after failure, similar to env->prog.
>
> For classic BPF programs, constants blinding works as before since it
> is still invoked from bpf_prog_select_runtime().
>
> Reviewed-by: Anton Protopopov <a.s.protopopov@gmail.com> # v8
> Reviewed-by: Hari Bathini <hbathini@linux.ibm.com> # powerpc jit
> Reviewed-by: Pu Lehui <pulehui@huawei.com> # riscv jit
> Signed-off-by: Xu Kuohai <xukuohai@huawei.com>
> ---

Acked-by: Hengqi Chen <hengqi.chen@gmail.com> # loongarch jit

>  arch/arc/net/bpf_jit_core.c      |  39 +++------
>  arch/arm/net/bpf_jit_32.c        |  41 ++-------
>  arch/arm64/net/bpf_jit_comp.c    |  72 +++++-----------
>  arch/loongarch/net/bpf_jit.c     |  59 ++++---------
>  arch/mips/net/bpf_jit_comp.c     |  20 +----
>  arch/parisc/net/bpf_jit_core.c   |  73 +++++++---------
>  arch/powerpc/net/bpf_jit_comp.c  |  68 ++++++---------
>  arch/riscv/net/bpf_jit_core.c    |  61 +++++--------
>  arch/s390/net/bpf_jit_comp.c     |  59 +++++--------
>  arch/sparc/net/bpf_jit_comp_64.c |  61 +++++--------
>  arch/x86/net/bpf_jit_comp.c      |  43 ++-------
>  arch/x86/net/bpf_jit_comp32.c    |  33 +------
>  include/linux/filter.h           |  33 ++++++-
>  kernel/bpf/core.c                |  69 +++++++++++++--
>  kernel/bpf/fixups.c              | 144 ++++++++++++++++++++++++++-----
>  15 files changed, 400 insertions(+), 475 deletions(-)
>
> diff --git a/arch/arc/net/bpf_jit_core.c b/arch/arc/net/bpf_jit_core.c
> index 1421eeced0f5..973ceae48675 100644
> --- a/arch/arc/net/bpf_jit_core.c
> +++ b/arch/arc/net/bpf_jit_core.c
> @@ -79,7 +79,6 @@ struct arc_jit_data {
>   * The JIT pertinent context that is used by different functions.
>   *
>   * prog:               The current eBPF program being handled.
> - * orig_prog:          The original eBPF program before any possible cha=
nge.
>   * jit:                        The JIT buffer and its length.
>   * bpf_header:         The JITed program header. "jit.buf" points inside=
 it.
>   * emit:               If set, opcodes are written to memory; else, a dr=
y-run.
> @@ -94,12 +93,10 @@ struct arc_jit_data {
>   * need_extra_pass:    A forecast if an "extra_pass" will occur.
>   * is_extra_pass:      Indicates if the current pass is an extra pass.
>   * user_bpf_prog:      True, if VM opcodes come from a real program.
> - * blinded:            True if "constant blinding" step returned a new "=
prog".
>   * success:            Indicates if the whole JIT went OK.
>   */
>  struct jit_context {
>         struct bpf_prog                 *prog;
> -       struct bpf_prog                 *orig_prog;
>         struct jit_buffer               jit;
>         struct bpf_binary_header        *bpf_header;
>         bool                            emit;
> @@ -114,7 +111,6 @@ struct jit_context {
>         bool                            need_extra_pass;
>         bool                            is_extra_pass;
>         bool                            user_bpf_prog;
> -       bool                            blinded;
>         bool                            success;
>  };
>
> @@ -161,13 +157,7 @@ static int jit_ctx_init(struct jit_context *ctx, str=
uct bpf_prog *prog)
>  {
>         memset(ctx, 0, sizeof(*ctx));
>
> -       ctx->orig_prog =3D prog;
> -
> -       /* If constant blinding was requested but failed, scram. */
> -       ctx->prog =3D bpf_jit_blind_constants(prog);
> -       if (IS_ERR(ctx->prog))
> -               return PTR_ERR(ctx->prog);
> -       ctx->blinded =3D (ctx->prog !=3D ctx->orig_prog);
> +       ctx->prog =3D prog;
>
>         /* If the verifier doesn't zero-extend, then we have to do it. */
>         ctx->do_zext =3D !ctx->prog->aux->verifier_zext;
> @@ -214,14 +204,6 @@ static inline void maybe_free(struct jit_context *ct=
x, void **mem)
>   */
>  static void jit_ctx_cleanup(struct jit_context *ctx)
>  {
> -       if (ctx->blinded) {
> -               /* if all went well, release the orig_prog. */
> -               if (ctx->success)
> -                       bpf_jit_prog_release_other(ctx->prog, ctx->orig_p=
rog);
> -               else
> -                       bpf_jit_prog_release_other(ctx->orig_prog, ctx->p=
rog);
> -       }
> -
>         maybe_free(ctx, (void **)&ctx->bpf2insn);
>         maybe_free(ctx, (void **)&ctx->jit_data);
>
> @@ -229,12 +211,19 @@ static void jit_ctx_cleanup(struct jit_context *ctx=
)
>                 ctx->bpf2insn_valid =3D false;
>
>         /* Freeing "bpf_header" is enough. "jit.buf" is a sub-array of it=
. */
> -       if (!ctx->success && ctx->bpf_header) {
> -               bpf_jit_binary_free(ctx->bpf_header);
> -               ctx->bpf_header =3D NULL;
> -               ctx->jit.buf    =3D NULL;
> -               ctx->jit.index  =3D 0;
> -               ctx->jit.len    =3D 0;
> +       if (!ctx->success) {
> +               if (ctx->bpf_header) {
> +                       bpf_jit_binary_free(ctx->bpf_header);
> +                       ctx->bpf_header =3D NULL;
> +                       ctx->jit.buf    =3D NULL;
> +                       ctx->jit.index  =3D 0;
> +                       ctx->jit.len    =3D 0;
> +               }
> +               if (ctx->is_extra_pass) {
> +                       ctx->prog->bpf_func =3D NULL;
> +                       ctx->prog->jited =3D 0;
> +                       ctx->prog->jited_len =3D 0;
> +               }
>         }
>
>         ctx->emit =3D false;
> diff --git a/arch/arm/net/bpf_jit_32.c b/arch/arm/net/bpf_jit_32.c
> index deeb8f292454..e6b1bb2de627 100644
> --- a/arch/arm/net/bpf_jit_32.c
> +++ b/arch/arm/net/bpf_jit_32.c
> @@ -2144,9 +2144,7 @@ bool bpf_jit_needs_zext(void)
>
>  struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
>  {
> -       struct bpf_prog *tmp, *orig_prog =3D prog;
>         struct bpf_binary_header *header;
> -       bool tmp_blinded =3D false;
>         struct jit_ctx ctx;
>         unsigned int tmp_idx;
>         unsigned int image_size;
> @@ -2156,20 +2154,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_pr=
og *prog)
>          * the interpreter.
>          */
>         if (!prog->jit_requested)
> -               return orig_prog;
> -
> -       /* If constant blinding was enabled and we failed during blinding
> -        * then we must fall back to the interpreter. Otherwise, we save
> -        * the new JITed code.
> -        */
> -       tmp =3D bpf_jit_blind_constants(prog);
> -
> -       if (IS_ERR(tmp))
> -               return orig_prog;
> -       if (tmp !=3D prog) {
> -               tmp_blinded =3D true;
> -               prog =3D tmp;
> -       }
> +               return prog;
>
>         memset(&ctx, 0, sizeof(ctx));
>         ctx.prog =3D prog;
> @@ -2179,10 +2164,8 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_pr=
og *prog)
>          * we must fall back to the interpreter
>          */
>         ctx.offsets =3D kcalloc(prog->len, sizeof(int), GFP_KERNEL);
> -       if (ctx.offsets =3D=3D NULL) {
> -               prog =3D orig_prog;
> -               goto out;
> -       }
> +       if (ctx.offsets =3D=3D NULL)
> +               return prog;
>
>         /* 1) fake pass to find in the length of the JITed code,
>          * to compute ctx->offsets and other context variables
> @@ -2194,10 +2177,8 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_pr=
og *prog)
>          * being successful in the second pass, so just fall back
>          * to the interpreter.
>          */
> -       if (build_body(&ctx)) {
> -               prog =3D orig_prog;
> +       if (build_body(&ctx))
>                 goto out_off;
> -       }
>
>         tmp_idx =3D ctx.idx;
>         build_prologue(&ctx);
> @@ -2213,10 +2194,8 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_pr=
og *prog)
>         ctx.idx +=3D ctx.imm_count;
>         if (ctx.imm_count) {
>                 ctx.imms =3D kcalloc(ctx.imm_count, sizeof(u32), GFP_KERN=
EL);
> -               if (ctx.imms =3D=3D NULL) {
> -                       prog =3D orig_prog;
> +               if (ctx.imms =3D=3D NULL)
>                         goto out_off;
> -               }
>         }
>  #else
>         /* there's nothing about the epilogue on ARMv7 */
> @@ -2238,10 +2217,8 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_pr=
og *prog)
>         /* Not able to allocate memory for the structure then
>          * we must fall back to the interpretation
>          */
> -       if (header =3D=3D NULL) {
> -               prog =3D orig_prog;
> +       if (header =3D=3D NULL)
>                 goto out_imms;
> -       }
>
>         /* 2.) Actual pass to generate final JIT code */
>         ctx.target =3D (u32 *) image_ptr;
> @@ -2278,16 +2255,12 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_p=
rog *prog)
>  #endif
>  out_off:
>         kfree(ctx.offsets);
> -out:
> -       if (tmp_blinded)
> -               bpf_jit_prog_release_other(prog, prog =3D=3D orig_prog ?
> -                                          tmp : orig_prog);
> +
>         return prog;
>
>  out_free:
>         image_ptr =3D NULL;
>         bpf_jit_binary_free(header);
> -       prog =3D orig_prog;
>         goto out_imms;
>  }
>
> diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.=
c
> index adf84962d579..cd5a72fff500 100644
> --- a/arch/arm64/net/bpf_jit_comp.c
> +++ b/arch/arm64/net/bpf_jit_comp.c
> @@ -2009,14 +2009,12 @@ struct arm64_jit_data {
>  struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
>  {
>         int image_size, prog_size, extable_size, extable_align, extable_o=
ffset;
> -       struct bpf_prog *tmp, *orig_prog =3D prog;
>         struct bpf_binary_header *header;
>         struct bpf_binary_header *ro_header =3D NULL;
>         struct arm64_jit_data *jit_data;
>         void __percpu *priv_stack_ptr =3D NULL;
>         bool was_classic =3D bpf_prog_was_classic(prog);
>         int priv_stack_alloc_sz;
> -       bool tmp_blinded =3D false;
>         bool extra_pass =3D false;
>         struct jit_ctx ctx;
>         u8 *image_ptr;
> @@ -2025,26 +2023,13 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_p=
rog *prog)
>         int exentry_idx;
>
>         if (!prog->jit_requested)
> -               return orig_prog;
> -
> -       tmp =3D bpf_jit_blind_constants(prog);
> -       /* If blinding was requested and we failed during blinding,
> -        * we must fall back to the interpreter.
> -        */
> -       if (IS_ERR(tmp))
> -               return orig_prog;
> -       if (tmp !=3D prog) {
> -               tmp_blinded =3D true;
> -               prog =3D tmp;
> -       }
> +               return prog;
>
>         jit_data =3D prog->aux->jit_data;
>         if (!jit_data) {
>                 jit_data =3D kzalloc_obj(*jit_data);
> -               if (!jit_data) {
> -                       prog =3D orig_prog;
> -                       goto out;
> -               }
> +               if (!jit_data)
> +                       return prog;
>                 prog->aux->jit_data =3D jit_data;
>         }
>         priv_stack_ptr =3D prog->aux->priv_stack_ptr;
> @@ -2056,10 +2041,8 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_pr=
og *prog)
>                 priv_stack_alloc_sz =3D round_up(prog->aux->stack_depth, =
16) +
>                                       2 * PRIV_STACK_GUARD_SZ;
>                 priv_stack_ptr =3D __alloc_percpu_gfp(priv_stack_alloc_sz=
, 16, GFP_KERNEL);
> -               if (!priv_stack_ptr) {
> -                       prog =3D orig_prog;
> +               if (!priv_stack_ptr)
>                         goto out_priv_stack;
> -               }
>
>                 priv_stack_init_guard(priv_stack_ptr, priv_stack_alloc_sz=
);
>                 prog->aux->priv_stack_ptr =3D priv_stack_ptr;
> @@ -2079,10 +2062,8 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_pr=
og *prog)
>         ctx.prog =3D prog;
>
>         ctx.offset =3D kvzalloc_objs(int, prog->len + 1);
> -       if (ctx.offset =3D=3D NULL) {
> -               prog =3D orig_prog;
> +       if (ctx.offset =3D=3D NULL)
>                 goto out_off;
> -       }
>
>         ctx.user_vm_start =3D bpf_arena_get_user_vm_start(prog->aux->aren=
a);
>         ctx.arena_vm_start =3D bpf_arena_get_kern_vm_start(prog->aux->are=
na);
> @@ -2095,15 +2076,11 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_p=
rog *prog)
>          * BPF line info needs ctx->offset[i] to be the offset of
>          * instruction[i] in jited image, so build prologue first.
>          */
> -       if (build_prologue(&ctx, was_classic)) {
> -               prog =3D orig_prog;
> +       if (build_prologue(&ctx, was_classic))
>                 goto out_off;
> -       }
>
> -       if (build_body(&ctx, extra_pass)) {
> -               prog =3D orig_prog;
> +       if (build_body(&ctx, extra_pass))
>                 goto out_off;
> -       }
>
>         ctx.epilogue_offset =3D ctx.idx;
>         build_epilogue(&ctx, was_classic);
> @@ -2121,10 +2098,8 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_pr=
og *prog)
>         ro_header =3D bpf_jit_binary_pack_alloc(image_size, &ro_image_ptr=
,
>                                               sizeof(u64), &header, &imag=
e_ptr,
>                                               jit_fill_hole);
> -       if (!ro_header) {
> -               prog =3D orig_prog;
> +       if (!ro_header)
>                 goto out_off;
> -       }
>
>         /* Pass 2: Determine jited position and result for each instructi=
on */
>
> @@ -2152,10 +2127,8 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_pr=
og *prog)
>         /* Dont write body instructions to memory for now */
>         ctx.write =3D false;
>
> -       if (build_body(&ctx, extra_pass)) {
> -               prog =3D orig_prog;
> +       if (build_body(&ctx, extra_pass))
>                 goto out_free_hdr;
> -       }
>
>         ctx.epilogue_offset =3D ctx.idx;
>         ctx.exentry_idx =3D exentry_idx;
> @@ -2164,19 +2137,15 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_p=
rog *prog)
>
>         /* Pass 3: Adjust jump offset and write final image */
>         if (build_body(&ctx, extra_pass) ||
> -               WARN_ON_ONCE(ctx.idx !=3D ctx.epilogue_offset)) {
> -               prog =3D orig_prog;
> +               WARN_ON_ONCE(ctx.idx !=3D ctx.epilogue_offset))
>                 goto out_free_hdr;
> -       }
>
>         build_epilogue(&ctx, was_classic);
>         build_plt(&ctx);
>
>         /* Extra pass to validate JITed code. */
> -       if (validate_ctx(&ctx)) {
> -               prog =3D orig_prog;
> +       if (validate_ctx(&ctx))
>                 goto out_free_hdr;
> -       }
>
>         /* update the real prog size */
>         prog_size =3D sizeof(u32) * ctx.idx;
> @@ -2193,16 +2162,13 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_p=
rog *prog)
>                 if (extra_pass && ctx.idx > jit_data->ctx.idx) {
>                         pr_err_once("multi-func JIT bug %d > %d\n",
>                                     ctx.idx, jit_data->ctx.idx);
> -                       prog->bpf_func =3D NULL;
> -                       prog->jited =3D 0;
> -                       prog->jited_len =3D 0;
>                         goto out_free_hdr;
>                 }
>                 if (WARN_ON(bpf_jit_binary_pack_finalize(ro_header, heade=
r))) {
> -                       /* ro_header has been freed */
> +                       /* ro_header and header has been freed */
>                         ro_header =3D NULL;
> -                       prog =3D orig_prog;
> -                       goto out_off;
> +                       header =3D NULL;
> +                       goto out_free_hdr;
>                 }
>                 /*
>                  * The instructions have now been copied to the ROX regio=
n from
> @@ -2245,13 +2211,15 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_p=
rog *prog)
>                 kfree(jit_data);
>                 prog->aux->jit_data =3D NULL;
>         }
> -out:
> -       if (tmp_blinded)
> -               bpf_jit_prog_release_other(prog, prog =3D=3D orig_prog ?
> -                                          tmp : orig_prog);
> +
>         return prog;
>
>  out_free_hdr:
> +       if (extra_pass) {
> +               prog->bpf_func =3D NULL;
> +               prog->jited =3D 0;
> +               prog->jited_len =3D 0;
> +       }
>         if (header) {
>                 bpf_arch_text_copy(&ro_header->size, &header->size,
>                                    sizeof(header->size));
> diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
> index 9cb796e16379..fcc8c0c29fb0 100644
> --- a/arch/loongarch/net/bpf_jit.c
> +++ b/arch/loongarch/net/bpf_jit.c
> @@ -1922,43 +1922,26 @@ int arch_bpf_trampoline_size(const struct btf_fun=
c_model *m, u32 flags,
>
>  struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
>  {
> -       bool tmp_blinded =3D false, extra_pass =3D false;
> +       bool extra_pass =3D false;
>         u8 *image_ptr, *ro_image_ptr;
>         int image_size, prog_size, extable_size;
>         struct jit_ctx ctx;
>         struct jit_data *jit_data;
>         struct bpf_binary_header *header;
>         struct bpf_binary_header *ro_header;
> -       struct bpf_prog *tmp, *orig_prog =3D prog;
>
>         /*
>          * If BPF JIT was not enabled then we must fall back to
>          * the interpreter.
>          */
>         if (!prog->jit_requested)
> -               return orig_prog;
> -
> -       tmp =3D bpf_jit_blind_constants(prog);
> -       /*
> -        * If blinding was requested and we failed during blinding,
> -        * we must fall back to the interpreter. Otherwise, we save
> -        * the new JITed code.
> -        */
> -       if (IS_ERR(tmp))
> -               return orig_prog;
> -
> -       if (tmp !=3D prog) {
> -               tmp_blinded =3D true;
> -               prog =3D tmp;
> -       }
> +               return prog;
>
>         jit_data =3D prog->aux->jit_data;
>         if (!jit_data) {
>                 jit_data =3D kzalloc_obj(*jit_data);
> -               if (!jit_data) {
> -                       prog =3D orig_prog;
> -                       goto out;
> -               }
> +               if (!jit_data)
> +                       return prog;
>                 prog->aux->jit_data =3D jit_data;
>         }
>         if (jit_data->ctx.offset) {
> @@ -1978,17 +1961,13 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_p=
rog *prog)
>         ctx.user_vm_start =3D bpf_arena_get_user_vm_start(prog->aux->aren=
a);
>
>         ctx.offset =3D kvcalloc(prog->len + 1, sizeof(u32), GFP_KERNEL);
> -       if (ctx.offset =3D=3D NULL) {
> -               prog =3D orig_prog;
> +       if (ctx.offset =3D=3D NULL)
>                 goto out_offset;
> -       }
>
>         /* 1. Initial fake pass to compute ctx->idx and set ctx->flags */
>         build_prologue(&ctx);
> -       if (build_body(&ctx, extra_pass)) {
> -               prog =3D orig_prog;
> +       if (build_body(&ctx, extra_pass))
>                 goto out_offset;
> -       }
>         ctx.epilogue_offset =3D ctx.idx;
>         build_epilogue(&ctx);
>
> @@ -2004,10 +1983,8 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_pr=
og *prog)
>         /* Now we know the size of the structure to make */
>         ro_header =3D bpf_jit_binary_pack_alloc(image_size, &ro_image_ptr=
, sizeof(u32),
>                                               &header, &image_ptr, jit_fi=
ll_hole);
> -       if (!ro_header) {
> -               prog =3D orig_prog;
> +       if (!ro_header)
>                 goto out_offset;
> -       }
>
>         /* 2. Now, the actual pass to generate final JIT code */
>         /*
> @@ -2027,17 +2004,13 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_p=
rog *prog)
>         ctx.num_exentries =3D 0;
>
>         build_prologue(&ctx);
> -       if (build_body(&ctx, extra_pass)) {
> -               prog =3D orig_prog;
> +       if (build_body(&ctx, extra_pass))
>                 goto out_free;
> -       }
>         build_epilogue(&ctx);
>
>         /* 3. Extra pass to validate JITed code */
> -       if (validate_ctx(&ctx)) {
> -               prog =3D orig_prog;
> +       if (validate_ctx(&ctx))
>                 goto out_free;
> -       }
>
>         /* And we're done */
>         if (bpf_jit_enable > 1)
> @@ -2050,9 +2023,9 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_pro=
g *prog)
>                         goto out_free;
>                 }
>                 if (WARN_ON(bpf_jit_binary_pack_finalize(ro_header, heade=
r))) {
> -                       /* ro_header has been freed */
> +                       /* ro_header and header have been freed */
>                         ro_header =3D NULL;
> -                       prog =3D orig_prog;
> +                       header =3D NULL;
>                         goto out_free;
>                 }
>                 /*
> @@ -2084,13 +2057,15 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_p=
rog *prog)
>                 prog->aux->jit_data =3D NULL;
>         }
>
> -out:
> -       if (tmp_blinded)
> -               bpf_jit_prog_release_other(prog, prog =3D=3D orig_prog ? =
tmp : orig_prog);
> -
>         return prog;
>
>  out_free:
> +       if (extra_pass) {
> +               prog->bpf_func =3D NULL;
> +               prog->jited =3D 0;
> +               prog->jited_len =3D 0;
> +       }
> +
>         if (header) {
>                 bpf_arch_text_copy(&ro_header->size, &header->size, sizeo=
f(header->size));
>                 bpf_jit_binary_pack_free(ro_header, header);
> diff --git a/arch/mips/net/bpf_jit_comp.c b/arch/mips/net/bpf_jit_comp.c
> index e355dfca4400..d2b6c955f18e 100644
> --- a/arch/mips/net/bpf_jit_comp.c
> +++ b/arch/mips/net/bpf_jit_comp.c
> @@ -911,10 +911,8 @@ bool bpf_jit_needs_zext(void)
>
>  struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
>  {
> -       struct bpf_prog *tmp, *orig_prog =3D prog;
>         struct bpf_binary_header *header =3D NULL;
>         struct jit_context ctx;
> -       bool tmp_blinded =3D false;
>         unsigned int tmp_idx;
>         unsigned int image_size;
>         u8 *image_ptr;
> @@ -925,19 +923,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog=
 *prog)
>          * the interpreter.
>          */
>         if (!prog->jit_requested)
> -               return orig_prog;
> -       /*
> -        * If constant blinding was enabled and we failed during blinding
> -        * then we must fall back to the interpreter. Otherwise, we save
> -        * the new JITed code.
> -        */
> -       tmp =3D bpf_jit_blind_constants(prog);
> -       if (IS_ERR(tmp))
> -               return orig_prog;
> -       if (tmp !=3D prog) {
> -               tmp_blinded =3D true;
> -               prog =3D tmp;
> -       }
> +               return prog;
>
>         memset(&ctx, 0, sizeof(ctx));
>         ctx.program =3D prog;
> @@ -1025,14 +1011,10 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_p=
rog *prog)
>         prog->jited_len =3D image_size;
>
>  out:
> -       if (tmp_blinded)
> -               bpf_jit_prog_release_other(prog, prog =3D=3D orig_prog ?
> -                                          tmp : orig_prog);
>         kfree(ctx.descriptors);
>         return prog;
>
>  out_err:
> -       prog =3D orig_prog;
>         if (header)
>                 bpf_jit_binary_free(header);
>         goto out;
> diff --git a/arch/parisc/net/bpf_jit_core.c b/arch/parisc/net/bpf_jit_cor=
e.c
> index a5eb6b51e27a..35dca372b5df 100644
> --- a/arch/parisc/net/bpf_jit_core.c
> +++ b/arch/parisc/net/bpf_jit_core.c
> @@ -44,30 +44,19 @@ bool bpf_jit_needs_zext(void)
>  struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
>  {
>         unsigned int prog_size =3D 0, extable_size =3D 0;
> -       bool tmp_blinded =3D false, extra_pass =3D false;
> -       struct bpf_prog *tmp, *orig_prog =3D prog;
> +       bool extra_pass =3D false;
>         int pass =3D 0, prev_ninsns =3D 0, prologue_len, i;
>         struct hppa_jit_data *jit_data;
>         struct hppa_jit_context *ctx;
>
>         if (!prog->jit_requested)
> -               return orig_prog;
> -
> -       tmp =3D bpf_jit_blind_constants(prog);
> -       if (IS_ERR(tmp))
> -               return orig_prog;
> -       if (tmp !=3D prog) {
> -               tmp_blinded =3D true;
> -               prog =3D tmp;
> -       }
> +               return prog;
>
>         jit_data =3D prog->aux->jit_data;
>         if (!jit_data) {
>                 jit_data =3D kzalloc_obj(*jit_data);
> -               if (!jit_data) {
> -                       prog =3D orig_prog;
> -                       goto out;
> -               }
> +               if (!jit_data)
> +                       return prog;
>                 prog->aux->jit_data =3D jit_data;
>         }
>
> @@ -81,10 +70,8 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *=
prog)
>
>         ctx->prog =3D prog;
>         ctx->offset =3D kzalloc_objs(int, prog->len);
> -       if (!ctx->offset) {
> -               prog =3D orig_prog;
> -               goto out_offset;
> -       }
> +       if (!ctx->offset)
> +               goto out_err;
>         for (i =3D 0; i < prog->len; i++) {
>                 prev_ninsns +=3D 20;
>                 ctx->offset[i] =3D prev_ninsns;
> @@ -93,10 +80,8 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *=
prog)
>         for (i =3D 0; i < NR_JIT_ITERATIONS; i++) {
>                 pass++;
>                 ctx->ninsns =3D 0;
> -               if (build_body(ctx, extra_pass, ctx->offset)) {
> -                       prog =3D orig_prog;
> -                       goto out_offset;
> -               }
> +               if (build_body(ctx, extra_pass, ctx->offset))
> +                       goto out_err;
>                 ctx->body_len =3D ctx->ninsns;
>                 bpf_jit_build_prologue(ctx);
>                 ctx->prologue_len =3D ctx->ninsns - ctx->body_len;
> @@ -116,10 +101,8 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog=
 *prog)
>                                                      &jit_data->image,
>                                                      sizeof(long),
>                                                      bpf_fill_ill_insns);
> -                       if (!jit_data->header) {
> -                               prog =3D orig_prog;
> -                               goto out_offset;
> -                       }
> +                       if (!jit_data->header)
> +                               goto out_err;
>
>                         ctx->insns =3D (u32 *)jit_data->image;
>                         /*
> @@ -134,8 +117,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog =
*prog)
>                 pr_err("bpf-jit: image did not converge in <%d passes!\n"=
, i);
>                 if (jit_data->header)
>                         bpf_jit_binary_free(jit_data->header);
> -               prog =3D orig_prog;
> -               goto out_offset;
> +               goto out_err;
>         }
>
>         if (extable_size)
> @@ -148,8 +130,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog =
*prog)
>         bpf_jit_build_prologue(ctx);
>         if (build_body(ctx, extra_pass, NULL)) {
>                 bpf_jit_binary_free(jit_data->header);
> -               prog =3D orig_prog;
> -               goto out_offset;
> +               goto out_err;
>         }
>         bpf_jit_build_epilogue(ctx);
>
> @@ -160,20 +141,19 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_pro=
g *prog)
>                         { extern int machine_restart(char *); machine_res=
tart(""); }
>         }
>
> +       if (!prog->is_func || extra_pass) {
> +               if (bpf_jit_binary_lock_ro(jit_data->header)) {
> +                       bpf_jit_binary_free(jit_data->header);
> +                       goto out_err;
> +               }
> +               bpf_flush_icache(jit_data->header, ctx->insns + ctx->nins=
ns);
> +       }
> +
>         prog->bpf_func =3D (void *)ctx->insns;
>         prog->jited =3D 1;
>         prog->jited_len =3D prog_size;
>
> -       bpf_flush_icache(jit_data->header, ctx->insns + ctx->ninsns);
> -
>         if (!prog->is_func || extra_pass) {
> -               if (bpf_jit_binary_lock_ro(jit_data->header)) {
> -                       bpf_jit_binary_free(jit_data->header);
> -                       prog->bpf_func =3D NULL;
> -                       prog->jited =3D 0;
> -                       prog->jited_len =3D 0;
> -                       goto out_offset;
> -               }
>                 prologue_len =3D ctx->epilogue_offset - ctx->body_len;
>                 for (i =3D 0; i < prog->len; i++)
>                         ctx->offset[i] +=3D prologue_len;
> @@ -183,14 +163,19 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_pro=
g *prog)
>                 kfree(jit_data);
>                 prog->aux->jit_data =3D NULL;
>         }
> -out:
> +
>         if (HPPA_JIT_REBOOT)
>                 { extern int machine_restart(char *); machine_restart("")=
; }
>
> -       if (tmp_blinded)
> -               bpf_jit_prog_release_other(prog, prog =3D=3D orig_prog ?
> -                                          tmp : orig_prog);
>         return prog;
> +
> +out_err:
> +       if (extra_pass) {
> +               prog->bpf_func =3D NULL;
> +               prog->jited =3D 0;
> +               prog->jited_len =3D 0;
> +       }
> +       goto out_offset;
>  }
>
>  u64 hppa_div64(u64 div, u64 divisor)
> diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_c=
omp.c
> index a62a9a92b7b5..711028bebea3 100644
> --- a/arch/powerpc/net/bpf_jit_comp.c
> +++ b/arch/powerpc/net/bpf_jit_comp.c
> @@ -142,9 +142,6 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog =
*fp)
>         int flen;
>         struct bpf_binary_header *fhdr =3D NULL;
>         struct bpf_binary_header *hdr =3D NULL;
> -       struct bpf_prog *org_fp =3D fp;
> -       struct bpf_prog *tmp_fp;
> -       bool bpf_blinded =3D false;
>         bool extra_pass =3D false;
>         u8 *fimage =3D NULL;
>         u32 *fcode_base;
> @@ -152,24 +149,13 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_pro=
g *fp)
>         u32 fixup_len;
>
>         if (!fp->jit_requested)
> -               return org_fp;
> -
> -       tmp_fp =3D bpf_jit_blind_constants(org_fp);
> -       if (IS_ERR(tmp_fp))
> -               return org_fp;
> -
> -       if (tmp_fp !=3D org_fp) {
> -               bpf_blinded =3D true;
> -               fp =3D tmp_fp;
> -       }
> +               return fp;
>
>         jit_data =3D fp->aux->jit_data;
>         if (!jit_data) {
>                 jit_data =3D kzalloc_obj(*jit_data);
> -               if (!jit_data) {
> -                       fp =3D org_fp;
> -                       goto out;
> -               }
> +               if (!jit_data)
> +                       return fp;
>                 fp->aux->jit_data =3D jit_data;
>         }
>
> @@ -194,10 +180,8 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog=
 *fp)
>         }
>
>         addrs =3D kcalloc(flen + 1, sizeof(*addrs), GFP_KERNEL);
> -       if (addrs =3D=3D NULL) {
> -               fp =3D org_fp;
> -               goto out_addrs;
> -       }
> +       if (addrs =3D=3D NULL)
> +               goto out_err;
>
>         memset(&cgctx, 0, sizeof(struct codegen_context));
>         bpf_jit_init_reg_mapping(&cgctx);
> @@ -211,11 +195,9 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog=
 *fp)
>         cgctx.exception_cb =3D fp->aux->exception_cb;
>
>         /* Scouting faux-generate pass 0 */
> -       if (bpf_jit_build_body(fp, NULL, NULL, &cgctx, addrs, 0, false)) =
{
> +       if (bpf_jit_build_body(fp, NULL, NULL, &cgctx, addrs, 0, false))
>                 /* We hit something illegal or unsupported. */
> -               fp =3D org_fp;
> -               goto out_addrs;
> -       }
> +               goto out_err;
>
>         /*
>          * If we have seen a tail call, we need a second pass.
> @@ -226,10 +208,8 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog=
 *fp)
>          */
>         if (cgctx.seen & SEEN_TAILCALL || !is_offset_in_branch_range((lon=
g)cgctx.idx * 4)) {
>                 cgctx.idx =3D 0;
> -               if (bpf_jit_build_body(fp, NULL, NULL, &cgctx, addrs, 0, =
false)) {
> -                       fp =3D org_fp;
> -                       goto out_addrs;
> -               }
> +               if (bpf_jit_build_body(fp, NULL, NULL, &cgctx, addrs, 0, =
false))
> +                       goto out_err;
>         }
>
>         bpf_jit_realloc_regs(&cgctx);
> @@ -250,10 +230,8 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog=
 *fp)
>
>         fhdr =3D bpf_jit_binary_pack_alloc(alloclen, &fimage, 4, &hdr, &i=
mage,
>                                               bpf_jit_fill_ill_insns);
> -       if (!fhdr) {
> -               fp =3D org_fp;
> -               goto out_addrs;
> -       }
> +       if (!fhdr)
> +               goto out_err;
>
>         if (extable_len)
>                 fp->aux->extable =3D (void *)fimage + FUNCTION_DESCR_SIZE=
 + proglen + fixup_len;
> @@ -272,8 +250,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog =
*fp)
>                                        extra_pass)) {
>                         bpf_arch_text_copy(&fhdr->size, &hdr->size, sizeo=
f(hdr->size));
>                         bpf_jit_binary_pack_free(fhdr, hdr);
> -                       fp =3D org_fp;
> -                       goto out_addrs;
> +                       goto out_err;
>                 }
>                 bpf_jit_build_epilogue(code_base, &cgctx);
>
> @@ -295,15 +272,16 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_pro=
g *fp)
>         ((u64 *)image)[1] =3D local_paca->kernel_toc;
>  #endif
>
> +       if (!fp->is_func || extra_pass) {
> +               if (bpf_jit_binary_pack_finalize(fhdr, hdr))
> +                       goto out_err;
> +       }
> +
>         fp->bpf_func =3D (void *)fimage;
>         fp->jited =3D 1;
>         fp->jited_len =3D cgctx.idx * 4 + FUNCTION_DESCR_SIZE;
>
>         if (!fp->is_func || extra_pass) {
> -               if (bpf_jit_binary_pack_finalize(fhdr, hdr)) {
> -                       fp =3D org_fp;
> -                       goto out_addrs;
> -               }
>                 bpf_prog_fill_jited_linfo(fp, addrs);
>  out_addrs:
>                 kfree(addrs);
> @@ -318,11 +296,15 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_pro=
g *fp)
>                 jit_data->hdr =3D hdr;
>         }
>
> -out:
> -       if (bpf_blinded)
> -               bpf_jit_prog_release_other(fp, fp =3D=3D org_fp ? tmp_fp =
: org_fp);
> -
>         return fp;
> +
> +out_err:
> +       if (extra_pass) {
> +               fp->bpf_func =3D NULL;
> +               fp->jited =3D 0;
> +               fp->jited_len =3D 0;
> +       }
> +       goto out_addrs;
>  }
>
>  /*
> diff --git a/arch/riscv/net/bpf_jit_core.c b/arch/riscv/net/bpf_jit_core.=
c
> index b3581e926436..527baa50dc68 100644
> --- a/arch/riscv/net/bpf_jit_core.c
> +++ b/arch/riscv/net/bpf_jit_core.c
> @@ -44,29 +44,19 @@ bool bpf_jit_needs_zext(void)
>  struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
>  {
>         unsigned int prog_size =3D 0, extable_size =3D 0;
> -       bool tmp_blinded =3D false, extra_pass =3D false;
> -       struct bpf_prog *tmp, *orig_prog =3D prog;
> +       bool extra_pass =3D false;
>         int pass =3D 0, prev_ninsns =3D 0, i;
>         struct rv_jit_data *jit_data;
>         struct rv_jit_context *ctx;
>
>         if (!prog->jit_requested)
> -               return orig_prog;
> -
> -       tmp =3D bpf_jit_blind_constants(prog);
> -       if (IS_ERR(tmp))
> -               return orig_prog;
> -       if (tmp !=3D prog) {
> -               tmp_blinded =3D true;
> -               prog =3D tmp;
> -       }
> +               return prog;
>
>         jit_data =3D prog->aux->jit_data;
>         if (!jit_data) {
>                 jit_data =3D kzalloc_obj(*jit_data);
>                 if (!jit_data) {
> -                       prog =3D orig_prog;
> -                       goto out;
> +                       return prog;
>                 }
>                 prog->aux->jit_data =3D jit_data;
>         }
> @@ -83,15 +73,11 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog =
*prog)
>         ctx->user_vm_start =3D bpf_arena_get_user_vm_start(prog->aux->are=
na);
>         ctx->prog =3D prog;
>         ctx->offset =3D kzalloc_objs(int, prog->len);
> -       if (!ctx->offset) {
> -               prog =3D orig_prog;
> +       if (!ctx->offset)
>                 goto out_offset;
> -       }
>
> -       if (build_body(ctx, extra_pass, NULL)) {
> -               prog =3D orig_prog;
> +       if (build_body(ctx, extra_pass, NULL))
>                 goto out_offset;
> -       }
>
>         for (i =3D 0; i < prog->len; i++) {
>                 prev_ninsns +=3D 32;
> @@ -105,10 +91,8 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog =
*prog)
>                 bpf_jit_build_prologue(ctx, bpf_is_subprog(prog));
>                 ctx->prologue_len =3D ctx->ninsns;
>
> -               if (build_body(ctx, extra_pass, ctx->offset)) {
> -                       prog =3D orig_prog;
> +               if (build_body(ctx, extra_pass, ctx->offset))
>                         goto out_offset;
> -               }
>
>                 ctx->epilogue_offset =3D ctx->ninsns;
>                 bpf_jit_build_epilogue(ctx);
> @@ -126,10 +110,8 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog=
 *prog)
>                                                           &jit_data->ro_i=
mage, sizeof(u32),
>                                                           &jit_data->head=
er, &jit_data->image,
>                                                           bpf_fill_ill_in=
sns);
> -                       if (!jit_data->ro_header) {
> -                               prog =3D orig_prog;
> +                       if (!jit_data->ro_header)
>                                 goto out_offset;
> -                       }
>
>                         /*
>                          * Use the image(RW) for writing the JITed instru=
ctions. But also save
> @@ -150,7 +132,6 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog =
*prog)
>
>         if (i =3D=3D NR_JIT_ITERATIONS) {
>                 pr_err("bpf-jit: image did not converge in <%d passes!\n"=
, i);
> -               prog =3D orig_prog;
>                 goto out_free_hdr;
>         }
>
> @@ -163,26 +144,27 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_pro=
g *prog)
>         ctx->nexentries =3D 0;
>
>         bpf_jit_build_prologue(ctx, bpf_is_subprog(prog));
> -       if (build_body(ctx, extra_pass, NULL)) {
> -               prog =3D orig_prog;
> +       if (build_body(ctx, extra_pass, NULL))
>                 goto out_free_hdr;
> -       }
>         bpf_jit_build_epilogue(ctx);
>
>         if (bpf_jit_enable > 1)
>                 bpf_jit_dump(prog->len, prog_size, pass, ctx->insns);
>
> -       prog->bpf_func =3D (void *)ctx->ro_insns + cfi_get_offset();
> -       prog->jited =3D 1;
> -       prog->jited_len =3D prog_size - cfi_get_offset();
> -
>         if (!prog->is_func || extra_pass) {
>                 if (WARN_ON(bpf_jit_binary_pack_finalize(jit_data->ro_hea=
der, jit_data->header))) {
>                         /* ro_header has been freed */
>                         jit_data->ro_header =3D NULL;
> -                       prog =3D orig_prog;
> -                       goto out_offset;
> +                       jit_data->header =3D NULL;
> +                       goto out_free_hdr;
>                 }
> +       }
> +
> +       prog->bpf_func =3D (void *)ctx->ro_insns + cfi_get_offset();
> +       prog->jited =3D 1;
> +       prog->jited_len =3D prog_size - cfi_get_offset();
> +
> +       if (!prog->is_func || extra_pass) {
>                 /*
>                  * The instructions have now been copied to the ROX regio=
n from
>                  * where they will execute.
> @@ -198,14 +180,15 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_pro=
g *prog)
>                 kfree(jit_data);
>                 prog->aux->jit_data =3D NULL;
>         }
> -out:
>
> -       if (tmp_blinded)
> -               bpf_jit_prog_release_other(prog, prog =3D=3D orig_prog ?
> -                                          tmp : orig_prog);
>         return prog;
>
>  out_free_hdr:
> +       if (extra_pass) {
> +               prog->bpf_func =3D NULL;
> +               prog->jited =3D 0;
> +               prog->jited_len =3D 0;
> +       }
>         if (jit_data->header) {
>                 bpf_arch_text_copy(&jit_data->ro_header->size, &jit_data-=
>header->size,
>                                    sizeof(jit_data->header->size));
> diff --git a/arch/s390/net/bpf_jit_comp.c b/arch/s390/net/bpf_jit_comp.c
> index d08d159b6319..2dfc279b1be2 100644
> --- a/arch/s390/net/bpf_jit_comp.c
> +++ b/arch/s390/net/bpf_jit_comp.c
> @@ -2314,36 +2314,20 @@ static struct bpf_binary_header *bpf_jit_alloc(st=
ruct bpf_jit *jit,
>   */
>  struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
>  {
> -       struct bpf_prog *tmp, *orig_fp =3D fp;
>         struct bpf_binary_header *header;
>         struct s390_jit_data *jit_data;
> -       bool tmp_blinded =3D false;
>         bool extra_pass =3D false;
>         struct bpf_jit jit;
>         int pass;
>
>         if (!fp->jit_requested)
> -               return orig_fp;
> -
> -       tmp =3D bpf_jit_blind_constants(fp);
> -       /*
> -        * If blinding was requested and we failed during blinding,
> -        * we must fall back to the interpreter.
> -        */
> -       if (IS_ERR(tmp))
> -               return orig_fp;
> -       if (tmp !=3D fp) {
> -               tmp_blinded =3D true;
> -               fp =3D tmp;
> -       }
> +               return fp;
>
>         jit_data =3D fp->aux->jit_data;
>         if (!jit_data) {
>                 jit_data =3D kzalloc_obj(*jit_data);
> -               if (!jit_data) {
> -                       fp =3D orig_fp;
> -                       goto out;
> -               }
> +               if (!jit_data)
> +                       return fp;
>                 fp->aux->jit_data =3D jit_data;
>         }
>         if (jit_data->ctx.addrs) {
> @@ -2356,34 +2340,27 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_p=
rog *fp)
>
>         memset(&jit, 0, sizeof(jit));
>         jit.addrs =3D kvcalloc(fp->len + 1, sizeof(*jit.addrs), GFP_KERNE=
L);
> -       if (jit.addrs =3D=3D NULL) {
> -               fp =3D orig_fp;
> -               goto free_addrs;
> -       }
> +       if (jit.addrs =3D=3D NULL)
> +               goto out_err;
>         /*
>          * Three initial passes:
>          *   - 1/2: Determine clobbered registers
>          *   - 3:   Calculate program size and addrs array
>          */
>         for (pass =3D 1; pass <=3D 3; pass++) {
> -               if (bpf_jit_prog(&jit, fp, extra_pass)) {
> -                       fp =3D orig_fp;
> -                       goto free_addrs;
> -               }
> +               if (bpf_jit_prog(&jit, fp, extra_pass))
> +                       goto out_err;
>         }
>         /*
>          * Final pass: Allocate and generate program
>          */
>         header =3D bpf_jit_alloc(&jit, fp);
> -       if (!header) {
> -               fp =3D orig_fp;
> -               goto free_addrs;
> -       }
> +       if (!header)
> +               goto out_err;
>  skip_init_ctx:
>         if (bpf_jit_prog(&jit, fp, extra_pass)) {
>                 bpf_jit_binary_free(header);
> -               fp =3D orig_fp;
> -               goto free_addrs;
> +               goto out_err;
>         }
>         if (bpf_jit_enable > 1) {
>                 bpf_jit_dump(fp->len, jit.size, pass, jit.prg_buf);
> @@ -2392,8 +2369,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_pro=
g *fp)
>         if (!fp->is_func || extra_pass) {
>                 if (bpf_jit_binary_lock_ro(header)) {
>                         bpf_jit_binary_free(header);
> -                       fp =3D orig_fp;
> -                       goto free_addrs;
> +                       goto out_err;
>                 }
>         } else {
>                 jit_data->header =3D header;
> @@ -2411,11 +2387,16 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_p=
rog *fp)
>                 kfree(jit_data);
>                 fp->aux->jit_data =3D NULL;
>         }
> -out:
> -       if (tmp_blinded)
> -               bpf_jit_prog_release_other(fp, fp =3D=3D orig_fp ?
> -                                          tmp : orig_fp);
> +
>         return fp;
> +
> +out_err:
> +       if (extra_pass) {
> +               fp->bpf_func =3D NULL;
> +               fp->jited =3D 0;
> +               fp->jited_len =3D 0;
> +       }
> +       goto free_addrs;
>  }
>
>  bool bpf_jit_supports_kfunc_call(void)
> diff --git a/arch/sparc/net/bpf_jit_comp_64.c b/arch/sparc/net/bpf_jit_co=
mp_64.c
> index b23d1c645ae5..e83e29137566 100644
> --- a/arch/sparc/net/bpf_jit_comp_64.c
> +++ b/arch/sparc/net/bpf_jit_comp_64.c
> @@ -1479,37 +1479,22 @@ struct sparc64_jit_data {
>
>  struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
>  {
> -       struct bpf_prog *tmp, *orig_prog =3D prog;
>         struct sparc64_jit_data *jit_data;
>         struct bpf_binary_header *header;
>         u32 prev_image_size, image_size;
> -       bool tmp_blinded =3D false;
>         bool extra_pass =3D false;
>         struct jit_ctx ctx;
>         u8 *image_ptr;
>         int pass, i;
>
>         if (!prog->jit_requested)
> -               return orig_prog;
> -
> -       tmp =3D bpf_jit_blind_constants(prog);
> -       /* If blinding was requested and we failed during blinding,
> -        * we must fall back to the interpreter.
> -        */
> -       if (IS_ERR(tmp))
> -               return orig_prog;
> -       if (tmp !=3D prog) {
> -               tmp_blinded =3D true;
> -               prog =3D tmp;
> -       }
> +               return prog;
>
>         jit_data =3D prog->aux->jit_data;
>         if (!jit_data) {
>                 jit_data =3D kzalloc_obj(*jit_data);
> -               if (!jit_data) {
> -                       prog =3D orig_prog;
> -                       goto out;
> -               }
> +               if (!jit_data)
> +                       return prog;
>                 prog->aux->jit_data =3D jit_data;
>         }
>         if (jit_data->ctx.offset) {
> @@ -1527,10 +1512,8 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_pr=
og *prog)
>         ctx.prog =3D prog;
>
>         ctx.offset =3D kmalloc_array(prog->len, sizeof(unsigned int), GFP=
_KERNEL);
> -       if (ctx.offset =3D=3D NULL) {
> -               prog =3D orig_prog;
> -               goto out_off;
> -       }
> +       if (ctx.offset =3D=3D NULL)
> +               goto out_err;
>
>         /* Longest sequence emitted is for bswap32, 12 instructions.  Pre=
-cook
>          * the offset array so that we converge faster.
> @@ -1543,10 +1526,8 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_pr=
og *prog)
>                 ctx.idx =3D 0;
>
>                 build_prologue(&ctx);
> -               if (build_body(&ctx)) {
> -                       prog =3D orig_prog;
> -                       goto out_off;
> -               }
> +               if (build_body(&ctx))
> +                       goto out_err;
>                 build_epilogue(&ctx);
>
>                 if (bpf_jit_enable > 1)
> @@ -1569,10 +1550,8 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_pr=
og *prog)
>         image_size =3D sizeof(u32) * ctx.idx;
>         header =3D bpf_jit_binary_alloc(image_size, &image_ptr,
>                                       sizeof(u32), jit_fill_hole);
> -       if (header =3D=3D NULL) {
> -               prog =3D orig_prog;
> -               goto out_off;
> -       }
> +       if (header =3D=3D NULL)
> +               goto out_err;
>
>         ctx.image =3D (u32 *)image_ptr;
>  skip_init_ctx:
> @@ -1582,8 +1561,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_pro=
g *prog)
>
>         if (build_body(&ctx)) {
>                 bpf_jit_binary_free(header);
> -               prog =3D orig_prog;
> -               goto out_off;
> +               goto out_err;
>         }
>
>         build_epilogue(&ctx);
> @@ -1592,8 +1570,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_pro=
g *prog)
>                 pr_err("bpf_jit: Failed to converge, prev_size=3D%u size=
=3D%d\n",
>                        prev_image_size, ctx.idx * 4);
>                 bpf_jit_binary_free(header);
> -               prog =3D orig_prog;
> -               goto out_off;
> +               goto out_err;
>         }
>
>         if (bpf_jit_enable > 1)
> @@ -1604,8 +1581,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_pro=
g *prog)
>         if (!prog->is_func || extra_pass) {
>                 if (bpf_jit_binary_lock_ro(header)) {
>                         bpf_jit_binary_free(header);
> -                       prog =3D orig_prog;
> -                       goto out_off;
> +                       goto out_err;
>                 }
>         } else {
>                 jit_data->ctx =3D ctx;
> @@ -1624,9 +1600,14 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_pr=
og *prog)
>                 kfree(jit_data);
>                 prog->aux->jit_data =3D NULL;
>         }
> -out:
> -       if (tmp_blinded)
> -               bpf_jit_prog_release_other(prog, prog =3D=3D orig_prog ?
> -                                          tmp : orig_prog);
> +
>         return prog;
> +
> +out_err:
> +       if (extra_pass) {
> +               prog->bpf_func =3D NULL;
> +               prog->jited =3D 0;
> +               prog->jited_len =3D 0;
> +       }
> +       goto out_off;
>  }
> diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
> index e9b78040d703..77d00a8dec87 100644
> --- a/arch/x86/net/bpf_jit_comp.c
> +++ b/arch/x86/net/bpf_jit_comp.c
> @@ -3717,13 +3717,11 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_p=
rog *prog)
>  {
>         struct bpf_binary_header *rw_header =3D NULL;
>         struct bpf_binary_header *header =3D NULL;
> -       struct bpf_prog *tmp, *orig_prog =3D prog;
>         void __percpu *priv_stack_ptr =3D NULL;
>         struct x64_jit_data *jit_data;
>         int priv_stack_alloc_sz;
>         int proglen, oldproglen =3D 0;
>         struct jit_context ctx =3D {};
> -       bool tmp_blinded =3D false;
>         bool extra_pass =3D false;
>         bool padding =3D false;
>         u8 *rw_image =3D NULL;
> @@ -3733,27 +3731,13 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_p=
rog *prog)
>         int i;
>
>         if (!prog->jit_requested)
> -               return orig_prog;
> -
> -       tmp =3D bpf_jit_blind_constants(prog);
> -       /*
> -        * If blinding was requested and we failed during blinding,
> -        * we must fall back to the interpreter.
> -        */
> -       if (IS_ERR(tmp))
> -               return orig_prog;
> -       if (tmp !=3D prog) {
> -               tmp_blinded =3D true;
> -               prog =3D tmp;
> -       }
> +               return prog;
>
>         jit_data =3D prog->aux->jit_data;
>         if (!jit_data) {
>                 jit_data =3D kzalloc_obj(*jit_data);
> -               if (!jit_data) {
> -                       prog =3D orig_prog;
> -                       goto out;
> -               }
> +               if (!jit_data)
> +                       return prog;
>                 prog->aux->jit_data =3D jit_data;
>         }
>         priv_stack_ptr =3D prog->aux->priv_stack_ptr;
> @@ -3765,10 +3749,8 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_pr=
og *prog)
>                 priv_stack_alloc_sz =3D round_up(prog->aux->stack_depth, =
8) +
>                                       2 * PRIV_STACK_GUARD_SZ;
>                 priv_stack_ptr =3D __alloc_percpu_gfp(priv_stack_alloc_sz=
, 8, GFP_KERNEL);
> -               if (!priv_stack_ptr) {
> -                       prog =3D orig_prog;
> +               if (!priv_stack_ptr)
>                         goto out_priv_stack;
> -               }
>
>                 priv_stack_init_guard(priv_stack_ptr, priv_stack_alloc_sz=
);
>                 prog->aux->priv_stack_ptr =3D priv_stack_ptr;
> @@ -3786,10 +3768,8 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_pr=
og *prog)
>                 goto skip_init_addrs;
>         }
>         addrs =3D kvmalloc_objs(*addrs, prog->len + 1);
> -       if (!addrs) {
> -               prog =3D orig_prog;
> +       if (!addrs)
>                 goto out_addrs;
> -       }
>
>         /*
>          * Before first pass, make a rough estimation of addrs[]
> @@ -3820,8 +3800,6 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_pro=
g *prog)
>                                                    sizeof(rw_header->size=
));
>                                 bpf_jit_binary_pack_free(header, rw_heade=
r);
>                         }
> -                       /* Fall back to interpreter mode */
> -                       prog =3D orig_prog;
>                         if (extra_pass) {
>                                 prog->bpf_func =3D NULL;
>                                 prog->jited =3D 0;
> @@ -3852,10 +3830,8 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_pr=
og *prog)
>                         header =3D bpf_jit_binary_pack_alloc(roundup(prog=
len, align) + extable_size,
>                                                            &image, align,=
 &rw_header, &rw_image,
>                                                            jit_fill_hole)=
;
> -                       if (!header) {
> -                               prog =3D orig_prog;
> +                       if (!header)
>                                 goto out_addrs;
> -                       }
>                         prog->aux->extable =3D (void *) image + roundup(p=
roglen, align);
>                 }
>                 oldproglen =3D proglen;
> @@ -3908,8 +3884,6 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_pro=
g *prog)
>                 prog->bpf_func =3D (void *)image + cfi_get_offset();
>                 prog->jited =3D 1;
>                 prog->jited_len =3D proglen - cfi_get_offset();
> -       } else {
> -               prog =3D orig_prog;
>         }
>
>         if (!image || !prog->is_func || extra_pass) {
> @@ -3925,10 +3899,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_pr=
og *prog)
>                 kfree(jit_data);
>                 prog->aux->jit_data =3D NULL;
>         }
> -out:
> -       if (tmp_blinded)
> -               bpf_jit_prog_release_other(prog, prog =3D=3D orig_prog ?
> -                                          tmp : orig_prog);
> +
>         return prog;
>  }
>
> diff --git a/arch/x86/net/bpf_jit_comp32.c b/arch/x86/net/bpf_jit_comp32.=
c
> index dda423025c3d..5f259577614a 100644
> --- a/arch/x86/net/bpf_jit_comp32.c
> +++ b/arch/x86/net/bpf_jit_comp32.c
> @@ -2521,35 +2521,19 @@ bool bpf_jit_needs_zext(void)
>  struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
>  {
>         struct bpf_binary_header *header =3D NULL;
> -       struct bpf_prog *tmp, *orig_prog =3D prog;
>         int proglen, oldproglen =3D 0;
>         struct jit_context ctx =3D {};
> -       bool tmp_blinded =3D false;
>         u8 *image =3D NULL;
>         int *addrs;
>         int pass;
>         int i;
>
>         if (!prog->jit_requested)
> -               return orig_prog;
> -
> -       tmp =3D bpf_jit_blind_constants(prog);
> -       /*
> -        * If blinding was requested and we failed during blinding,
> -        * we must fall back to the interpreter.
> -        */
> -       if (IS_ERR(tmp))
> -               return orig_prog;
> -       if (tmp !=3D prog) {
> -               tmp_blinded =3D true;
> -               prog =3D tmp;
> -       }
> +               return prog;
>
>         addrs =3D kmalloc_objs(*addrs, prog->len);
> -       if (!addrs) {
> -               prog =3D orig_prog;
> -               goto out;
> -       }
> +       if (!addrs)
> +               return prog;
>
>         /*
>          * Before first pass, make a rough estimation of addrs[]
> @@ -2574,7 +2558,6 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_pro=
g *prog)
>                         image =3D NULL;
>                         if (header)
>                                 bpf_jit_binary_free(header);
> -                       prog =3D orig_prog;
>                         goto out_addrs;
>                 }
>                 if (image) {
> @@ -2588,10 +2571,8 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_pr=
og *prog)
>                 if (proglen =3D=3D oldproglen) {
>                         header =3D bpf_jit_binary_alloc(proglen, &image,
>                                                       1, jit_fill_hole);
> -                       if (!header) {
> -                               prog =3D orig_prog;
> +                       if (!header)
>                                 goto out_addrs;
> -                       }
>                 }
>                 oldproglen =3D proglen;
>                 cond_resched();
> @@ -2604,16 +2585,10 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_p=
rog *prog)
>                 prog->bpf_func =3D (void *)image;
>                 prog->jited =3D 1;
>                 prog->jited_len =3D proglen;
> -       } else {
> -               prog =3D orig_prog;
>         }
>
>  out_addrs:
>         kfree(addrs);
> -out:
> -       if (tmp_blinded)
> -               bpf_jit_prog_release_other(prog, prog =3D=3D orig_prog ?
> -                                          tmp : orig_prog);
>         return prog;
>  }
>
> diff --git a/include/linux/filter.h b/include/linux/filter.h
> index e40d4071a345..d396e55c9a1d 100644
> --- a/include/linux/filter.h
> +++ b/include/linux/filter.h
> @@ -1183,6 +1183,18 @@ static inline bool bpf_dump_raw_ok(const struct cr=
ed *cred)
>
>  struct bpf_prog *bpf_patch_insn_single(struct bpf_prog *prog, u32 off,
>                                        const struct bpf_insn *patch, u32 =
len);
> +
> +#ifdef CONFIG_BPF_SYSCALL
> +struct bpf_prog *bpf_patch_insn_data(struct bpf_verifier_env *env, u32 o=
ff,
> +                                    const struct bpf_insn *patch, u32 le=
n);
> +#else
> +static inline struct bpf_prog *bpf_patch_insn_data(struct bpf_verifier_e=
nv *env, u32 off,
> +                                                  const struct bpf_insn =
*patch, u32 len)
> +{
> +       return ERR_PTR(-ENOTSUPP);
> +}
> +#endif /* CONFIG_BPF_SYSCALL */
> +
>  int bpf_remove_insns(struct bpf_prog *prog, u32 off, u32 cnt);
>
>  static inline bool xdp_return_frame_no_direct(void)
> @@ -1309,9 +1321,14 @@ int bpf_jit_get_func_addr(const struct bpf_prog *p=
rog,
>
>  const char *bpf_jit_get_prog_name(struct bpf_prog *prog);
>
> -struct bpf_prog *bpf_jit_blind_constants(struct bpf_prog *fp);
> +struct bpf_prog *bpf_jit_blind_constants(struct bpf_verifier_env *env, s=
truct bpf_prog *prog);
>  void bpf_jit_prog_release_other(struct bpf_prog *fp, struct bpf_prog *fp=
_other);
>
> +static inline bool bpf_prog_need_blind(const struct bpf_prog *prog)
> +{
> +       return prog->blinding_requested && !prog->blinded;
> +}
> +
>  static inline void bpf_jit_dump(unsigned int flen, unsigned int proglen,
>                                 u32 pass, void *image)
>  {
> @@ -1450,6 +1467,20 @@ static inline void bpf_prog_kallsyms_del(struct bp=
f_prog *fp)
>  {
>  }
>
> +static inline bool bpf_prog_need_blind(const struct bpf_prog *prog)
> +{
> +       return false;
> +}
> +
> +static inline
> +struct bpf_prog *bpf_jit_blind_constants(struct bpf_verifier_env *env, s=
truct bpf_prog *prog)
> +{
> +       return prog;
> +}
> +
> +static inline void bpf_jit_prog_release_other(struct bpf_prog *fp, struc=
t bpf_prog *fp_other)
> +{
> +}
>  #endif /* CONFIG_BPF_JIT */
>
>  void bpf_prog_kallsyms_del_all(struct bpf_prog *fp);
> diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
> index 066b86e7233c..fc9fb3c07866 100644
> --- a/kernel/bpf/core.c
> +++ b/kernel/bpf/core.c
> @@ -1508,7 +1508,11 @@ static void adjust_insn_arrays(struct bpf_prog *pr=
og, u32 off, u32 len)
>  #endif
>  }
>
> -struct bpf_prog *bpf_jit_blind_constants(struct bpf_prog *prog)
> +/*
> + * Now this function is used only to blind the main prog and must be inv=
oked only when
> + * bpf_prog_need_blind() returns true.
> + */
> +struct bpf_prog *bpf_jit_blind_constants(struct bpf_verifier_env *env, s=
truct bpf_prog *prog)
>  {
>         struct bpf_insn insn_buff[16], aux[2];
>         struct bpf_prog *clone, *tmp;
> @@ -1516,13 +1520,17 @@ struct bpf_prog *bpf_jit_blind_constants(struct b=
pf_prog *prog)
>         struct bpf_insn *insn;
>         int i, rewritten;
>
> -       if (!prog->blinding_requested || prog->blinded)
> -               return prog;
> +       if (WARN_ON_ONCE(env && env->prog !=3D prog))
> +               return ERR_PTR(-EINVAL);
>
>         clone =3D bpf_prog_clone_create(prog, GFP_USER);
>         if (!clone)
>                 return ERR_PTR(-ENOMEM);
>
> +       /* make sure bpf_patch_insn_data() patches the correct prog */
> +       if (env)
> +               env->prog =3D clone;
> +
>         insn_cnt =3D clone->len;
>         insn =3D clone->insnsi;
>
> @@ -1550,21 +1558,35 @@ struct bpf_prog *bpf_jit_blind_constants(struct b=
pf_prog *prog)
>                 if (!rewritten)
>                         continue;
>
> -               tmp =3D bpf_patch_insn_single(clone, i, insn_buff, rewrit=
ten);
> -               if (IS_ERR(tmp)) {
> +               if (env)
> +                       tmp =3D bpf_patch_insn_data(env, i, insn_buff, re=
written);
> +               else
> +                       tmp =3D bpf_patch_insn_single(clone, i, insn_buff=
, rewritten);
> +
> +               if (IS_ERR_OR_NULL(tmp)) {
> +                       if (env)
> +                               /* restore the original prog */
> +                               env->prog =3D prog;
>                         /* Patching may have repointed aux->prog during
>                          * realloc from the original one, so we need to
>                          * fix it up here on error.
>                          */
>                         bpf_jit_prog_release_other(prog, clone);
> -                       return tmp;
> +                       return IS_ERR(tmp) ? tmp : ERR_PTR(-ENOMEM);
>                 }
>
>                 clone =3D tmp;
>                 insn_delta =3D rewritten - 1;
>
> -               /* Instructions arrays must be updated using absolute xla=
ted offsets */
> -               adjust_insn_arrays(clone, prog->aux->subprog_start + i, r=
ewritten);
> +               if (env)
> +                       env->prog =3D clone;
> +               else
> +                       /*
> +                        * Instructions arrays must be updated using abso=
lute xlated offsets.
> +                        * The arrays have already been adjusted by bpf_p=
atch_insn_data() when
> +                        * env is not NULL.
> +                        */
> +                       adjust_insn_arrays(clone, i, rewritten);
>
>                 /* Walk new program and skip insns we just inserted. */
>                 insn =3D clone->insnsi + i + insn_delta;
> @@ -2533,6 +2555,35 @@ static bool bpf_prog_select_interpreter(struct bpf=
_prog *fp)
>         return select_interpreter;
>  }
>
> +static struct bpf_prog *bpf_prog_jit_compile(struct bpf_prog *prog)
> +{
> +#ifdef CONFIG_BPF_JIT
> +       struct bpf_prog *orig_prog;
> +
> +       if (!bpf_prog_need_blind(prog))
> +               return bpf_int_jit_compile(prog);
> +
> +       orig_prog =3D prog;
> +       prog =3D bpf_jit_blind_constants(NULL, prog);
> +       /*
> +        * If blinding was requested and we failed during blinding, we mu=
st fall
> +        * back to the interpreter.
> +        */
> +       if (IS_ERR(prog))
> +               return orig_prog;
> +
> +       prog =3D bpf_int_jit_compile(prog);
> +       if (prog->jited) {
> +               bpf_jit_prog_release_other(prog, orig_prog);
> +               return prog;
> +       }
> +
> +       bpf_jit_prog_release_other(orig_prog, prog);
> +       prog =3D orig_prog;
> +#endif
> +       return prog;
> +}
> +
>  /**
>   *     bpf_prog_select_runtime - select exec runtime for BPF program
>   *     @fp: bpf_prog populated with BPF program
> @@ -2572,7 +2623,7 @@ struct bpf_prog *bpf_prog_select_runtime(struct bpf=
_prog *fp, int *err)
>                 if (*err)
>                         return fp;
>
> -               fp =3D bpf_int_jit_compile(fp);
> +               fp =3D bpf_prog_jit_compile(fp);
>                 bpf_prog_jit_attempt_done(fp);
>                 if (!fp->jited && jit_needed) {
>                         *err =3D -ENOTSUPP;
> diff --git a/kernel/bpf/fixups.c b/kernel/bpf/fixups.c
> index 67c9b28767e1..ec8afd6a9369 100644
> --- a/kernel/bpf/fixups.c
> +++ b/kernel/bpf/fixups.c
> @@ -232,8 +232,8 @@ static void adjust_poke_descs(struct bpf_prog *prog, =
u32 off, u32 len)
>         }
>  }
>
> -static struct bpf_prog *bpf_patch_insn_data(struct bpf_verifier_env *env=
, u32 off,
> -                                           const struct bpf_insn *patch,=
 u32 len)
> +struct bpf_prog *bpf_patch_insn_data(struct bpf_verifier_env *env, u32 o=
ff,
> +                                    const struct bpf_insn *patch, u32 le=
n)
>  {
>         struct bpf_prog *new_prog;
>         struct bpf_insn_aux_data *new_data =3D NULL;
> @@ -973,7 +973,45 @@ int bpf_convert_ctx_accesses(struct bpf_verifier_env=
 *env)
>         return 0;
>  }
>
> -int bpf_jit_subprogs(struct bpf_verifier_env *env)
> +static u32 *bpf_dup_subprog_starts(struct bpf_verifier_env *env)
> +{
> +       u32 *starts =3D NULL;
> +
> +       starts =3D kvmalloc_objs(u32, env->subprog_cnt, GFP_KERNEL_ACCOUN=
T);
> +       if (starts) {
> +               for (int i =3D 0; i < env->subprog_cnt; i++)
> +                       starts[i] =3D env->subprog_info[i].start;
> +       }
> +       return starts;
> +}
> +
> +static void bpf_restore_subprog_starts(struct bpf_verifier_env *env, u32=
 *orig_starts)
> +{
> +       for (int i =3D 0; i < env->subprog_cnt; i++)
> +               env->subprog_info[i].start =3D orig_starts[i];
> +}
> +
> +static struct bpf_insn_aux_data *bpf_dup_insn_aux_data(struct bpf_verifi=
er_env *env)
> +{
> +       size_t size;
> +       void *new_aux;
> +
> +       size =3D array_size(sizeof(struct bpf_insn_aux_data), env->prog->=
len);
> +       new_aux =3D __vmalloc(size, GFP_KERNEL_ACCOUNT);
> +       if (new_aux)
> +               memcpy(new_aux, env->insn_aux_data, size);
> +       return new_aux;
> +}
> +
> +static void bpf_restore_insn_aux_data(struct bpf_verifier_env *env,
> +                                     struct bpf_insn_aux_data *orig_insn=
_aux)
> +{
> +       /* the expanded elements are zero-filled, so no special handling =
is required */
> +       vfree(env->insn_aux_data);
> +       env->insn_aux_data =3D orig_insn_aux;
> +}
> +
> +static int jit_subprogs(struct bpf_verifier_env *env)
>  {
>         struct bpf_prog *prog =3D env->prog, **func, *tmp;
>         int i, j, subprog_start, subprog_end =3D 0, len, subprog;
> @@ -981,10 +1019,6 @@ int bpf_jit_subprogs(struct bpf_verifier_env *env)
>         struct bpf_insn *insn;
>         void *old_bpf_func;
>         int err, num_exentries;
> -       int old_len, subprog_start_adjustment =3D 0;
> -
> -       if (env->subprog_cnt <=3D 1)
> -               return 0;
>
>         for (i =3D 0, insn =3D prog->insnsi; i < prog->len; i++, insn++) =
{
>                 if (!bpf_pseudo_func(insn) && !bpf_pseudo_call(insn))
> @@ -1053,10 +1087,11 @@ int bpf_jit_subprogs(struct bpf_verifier_env *env=
)
>                         goto out_free;
>                 func[i]->is_func =3D 1;
>                 func[i]->sleepable =3D prog->sleepable;
> +               func[i]->blinded =3D prog->blinded;
>                 func[i]->aux->func_idx =3D i;
>                 /* Below members will be freed only at prog->aux */
>                 func[i]->aux->btf =3D prog->aux->btf;
> -               func[i]->aux->subprog_start =3D subprog_start + subprog_s=
tart_adjustment;
> +               func[i]->aux->subprog_start =3D subprog_start;
>                 func[i]->aux->func_info =3D prog->aux->func_info;
>                 func[i]->aux->func_info_cnt =3D prog->aux->func_info_cnt;
>                 func[i]->aux->poke_tab =3D prog->aux->poke_tab;
> @@ -1112,15 +1147,7 @@ int bpf_jit_subprogs(struct bpf_verifier_env *env)
>                 func[i]->aux->might_sleep =3D env->subprog_info[i].might_=
sleep;
>                 if (!i)
>                         func[i]->aux->exception_boundary =3D env->seen_ex=
ception;
> -
> -               /*
> -                * To properly pass the absolute subprog start to jit
> -                * all instruction adjustments should be accumulated
> -                */
> -               old_len =3D func[i]->len;
>                 func[i] =3D bpf_int_jit_compile(func[i]);
> -               subprog_start_adjustment +=3D func[i]->len - old_len;
> -
>                 if (!func[i]->jited) {
>                         err =3D -ENOTSUPP;
>                         goto out_free;
> @@ -1246,16 +1273,87 @@ int bpf_jit_subprogs(struct bpf_verifier_env *env=
)
>         }
>         kfree(func);
>  out_undo_insn:
> +       bpf_prog_jit_attempt_done(prog);
> +       return err;
> +}
> +
> +int bpf_jit_subprogs(struct bpf_verifier_env *env)
> +{
> +       int err, i;
> +       bool blinded =3D false;
> +       struct bpf_insn *insn;
> +       struct bpf_prog *prog, *orig_prog;
> +       struct bpf_insn_aux_data *orig_insn_aux;
> +       u32 *orig_subprog_starts;
> +
> +       if (env->subprog_cnt <=3D 1)
> +               return 0;
> +
> +       prog =3D orig_prog =3D env->prog;
> +       if (bpf_prog_need_blind(prog)) {
> +               orig_insn_aux =3D bpf_dup_insn_aux_data(env);
> +               if (!orig_insn_aux) {
> +                       err =3D -ENOMEM;
> +                       goto out_cleanup;
> +               }
> +               orig_subprog_starts =3D bpf_dup_subprog_starts(env);
> +               if (!orig_subprog_starts) {
> +                       vfree(orig_insn_aux);
> +                       err =3D -ENOMEM;
> +                       goto out_cleanup;
> +               }
> +               prog =3D bpf_jit_blind_constants(env, prog);
> +               if (IS_ERR(prog)) {
> +                       err =3D -ENOMEM;
> +                       prog =3D orig_prog;
> +                       goto out_restore;
> +               }
> +               blinded =3D true;
> +       }
> +
> +       err =3D jit_subprogs(env);
> +       if (err)
> +               goto out_jit_err;
> +
> +       if (blinded) {
> +               bpf_jit_prog_release_other(prog, orig_prog);
> +               kvfree(orig_subprog_starts);
> +               vfree(orig_insn_aux);
> +       }
> +
> +       return 0;
> +
> +out_jit_err:
> +       if (blinded) {
> +               bpf_jit_prog_release_other(orig_prog, prog);
> +               /* roll back to the clean original prog */
> +               prog =3D env->prog =3D orig_prog;
> +               goto out_restore;
> +       } else {
> +               if (err !=3D -EFAULT) {
> +                       /*
> +                        * We will fall back to interpreter mode when err=
 is not -EFAULT, before
> +                        * that, insn->off and insn->imm should be restor=
ed to their original
> +                        * values since they were modified by __jit_subpr=
ogs.
> +                        */
> +                       for (i =3D 0, insn =3D prog->insnsi; i < prog->le=
n; i++, insn++) {
> +                               if (!bpf_pseudo_call(insn))
> +                                       continue;
> +                               insn->off =3D 0;
> +                               insn->imm =3D env->insn_aux_data[i].call_=
imm;
> +                       }
> +               }
> +               goto out_cleanup;
> +       }
> +
> +out_restore:
> +       bpf_restore_subprog_starts(env, orig_subprog_starts);
> +       bpf_restore_insn_aux_data(env, orig_insn_aux);
> +       kvfree(orig_subprog_starts);
> +out_cleanup:
>         /* cleanup main prog to be interpreted */
>         prog->jit_requested =3D 0;
>         prog->blinding_requested =3D 0;
> -       for (i =3D 0, insn =3D prog->insnsi; i < prog->len; i++, insn++) =
{
> -               if (!bpf_pseudo_call(insn))
> -                       continue;
> -               insn->off =3D 0;
> -               insn->imm =3D env->insn_aux_data[i].call_imm;
> -       }
> -       bpf_prog_jit_attempt_done(prog);
>         return err;
>  }
>
> --
> 2.47.3
>

