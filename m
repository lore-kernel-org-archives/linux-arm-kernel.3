Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B26C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 20:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yp9Z/2QTyMOyDYIkU7CbCU89ReiAiNnkjU7WZOcGUCk=; b=WctwxOEw/2/9YjwB5rA18di+U7
	oItjoyiE0Qe33EAm032v+X4nUYNP+8eq1c8k5mMNPobQY7bUm8YX06gDIfI07ohPD+u1ANv9WJfL5
	0imm8eEgcC2NRKOJL88TeJB0cFqFJMCBoPGGRhT+bWnlz7O7EYWnvOAFhW0O4Lj1Fy48XmohXYf25
	w3L9jIchi1dVy/XN2i7rJAtSN8lIu3ZuXt6N5k93q0S1wEQElwbDcOENHTyq9Qmju5NpdVKOf5Ok4
	BwULfVzA8lnPMsRG07qzDfwd5pMSjhw/XhOHJTsjPNl1JZnzBEXtCjvuPjwd/8O7nnAzt64QrY3Bc
	MswUJ++g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaKAD-0000000Fm0H-2ENn;
	Fri, 11 Jul 2025 20:16:09 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaIox-0000000FZxK-3g08
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 18:50:09 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2357c61cda7so24295ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 11:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752259806; x=1752864606; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yp9Z/2QTyMOyDYIkU7CbCU89ReiAiNnkjU7WZOcGUCk=;
        b=t+QShKLf8WX8N98dYkokRW7XpfrYUcPq7Cx6MSyCAP3O3kBvkgYvzehQQ3MF1TgTwN
         UJaS6gZPrKaKsDehSwNOWUefsWqpApmZzDS0vG5DsfITV4NUaiDWJdE7KFc5ytD5hmAV
         WnQOkzCZG3j8/l19m1LdxBFL7ihzewg0aDm+v1G1bf0/CmCMUSyctzhNWp/4UIQpfSuS
         Vd++g23jNAxu5ulUeQ1tm/5biIRmr71yLxHsNnkri/GbkZuW5bWoT8HKORUdic/Q9o9g
         v5i4pMSR9DuKiyjGIJifH8VdRwB89aiv5qS2ltu6ZPiqtRg8fKTaBAMMcRbp5tEO4IbC
         mjdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752259806; x=1752864606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yp9Z/2QTyMOyDYIkU7CbCU89ReiAiNnkjU7WZOcGUCk=;
        b=TuJYuyOVAGilP9x5AoKocesX5ANiQ8Y/1xT3W4VPyn5It4uISaOOZlEf2+vCyBgyia
         JFn1UwNyjEtuT2T41Ojbuae40v0QsLM5AfX2hzbPZ+TWKW8O4Ebr3LWhuM5mva72b+EU
         QFwmf4Q+OUxOcX+SP67Nwvoxyy++ZniXzh9467r+bvcJn5TP7vXz5MjBHfpLhtT3Az0J
         XyEHaIjpPStP9/v3FgeX8dV0Nx/h2pKXUG72dbL9/7FpFGn1ojMh1HsdTEugO6gsPSGj
         RL4Y1G+0AN+m/abqJXByjnt8xzBC5rHMvP8CAwuH/9CeZX5GW/iYVlxP2J09w8eUfLXm
         argA==
X-Forwarded-Encrypted: i=1; AJvYcCXoeAxST6FFLxFA7KDlciN4hthS5JcUx1ufvsJ/yXgL4BnIzpyuraJfddCLq064Ogh2UYKTui20rumRUdFPXDOr@lists.infradead.org
X-Gm-Message-State: AOJu0YzKcB/fTOopmVrNflqAoHCX4UU/wHJ1/WxyxiBynPgm0Ra2JmRf
	3jXHl6lbxUuflxKwSF0EX1f+Qn02Fz75T7aNQx8TQG232NdvPXTca041ZZzd5jrxuyuynLt/RF6
	jfKwqD/l6wdyJjxLCwIZATEuVrnHr2JmfSqDFFOxI
X-Gm-Gg: ASbGnctqvBUIzrUF3Oazbr0cCTScgq9w+3XKAaB+v7Ved1isjL4Tjb0AYNzrgqN3TNs
	idE1VvzZz1TY8iSkTMTXKd8eRYmbKr9S/GLbOIl5BGQhoPm006z0bLBKhhnMGbBf6MdDffXIXK8
	Vso5T9kpsefH74jEeFhHZ/ngmzrFTiBS7JbbmNRmF+Jfz00XjM8x5rTnJ5MfpmYXUJOdJZHX2mv
	kaB
X-Google-Smtp-Source: AGHT+IHU8vaSeRw3fnyhcApiWIogTWqlYunNBPIhkLH9T3BHCSjrfAUuHQ1RgOSIgmx/uz7hFi2rTfco22+EbD0PTx8=
X-Received: by 2002:a17:903:1b0c:b0:215:65f3:27ef with SMTP id
 d9443c01a7336-23df6954f30mr379485ad.12.1752259806082; Fri, 11 Jul 2025
 11:50:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250505223437.3722164-4-samitolvanen@google.com>
 <20250505223437.3722164-6-samitolvanen@google.com> <aHEfJZjW9dTXCgw3@willie-the-truck>
In-Reply-To: <aHEfJZjW9dTXCgw3@willie-the-truck>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 11 Jul 2025 11:49:29 -0700
X-Gm-Features: Ac12FXxCyxWVkaFXO4hBzmagkiWunDFY19ZG9WQU670r1_7gDr_nTSfNwBp2hpE
Message-ID: <CABCJKued2XsLp5+ZW1ZWQn6=CgYkhjEDyJdfTRTR1MGkvDtmXg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v9 2/2] arm64/cfi,bpf: Support kCFI + BPF on arm64
To: Will Deacon <will@kernel.org>
Cc: bpf@vger.kernel.org, Puranjay Mohan <puranjay@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Maxwell Bland <mbland@motorola.com>, 
	Puranjay Mohan <puranjay12@gmail.com>, Dao Huang <huangdao1@oppo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_115007_917488_83D9FB47 
X-CRM114-Status: GOOD (  39.22  )
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

On Fri, Jul 11, 2025 at 7:26=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> On Mon, May 05, 2025 at 10:34:40PM +0000, Sami Tolvanen wrote:
> > From: Puranjay Mohan <puranjay12@gmail.com>
> >
> > Currently, bpf_dispatcher_*_func() is marked with `__nocfi` therefore
> > calling BPF programs from this interface doesn't cause CFI warnings.
> >
> > When BPF programs are called directly from C: from BPF helpers or
> > struct_ops, CFI warnings are generated.
> >
> > Implement proper CFI prologues for the BPF programs and callbacks and
> > drop __nocfi for arm64. Fix the trampoline generation code to emit kCFI
> > prologue when a struct_ops trampoline is being prepared.
> >
> > Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>
> > Co-developed-by: Maxwell Bland <mbland@motorola.com>
> > Signed-off-by: Maxwell Bland <mbland@motorola.com>
> > Co-developed-by: Sami Tolvanen <samitolvanen@google.com>
> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > Tested-by: Dao Huang <huangdao1@oppo.com>
> > ---
> >  arch/arm64/include/asm/cfi.h    | 23 +++++++++++++++++++++++
> >  arch/arm64/kernel/alternative.c | 25 +++++++++++++++++++++++++
> >  arch/arm64/net/bpf_jit_comp.c   | 22 +++++++++++++++++++---
> >  3 files changed, 67 insertions(+), 3 deletions(-)
> >  create mode 100644 arch/arm64/include/asm/cfi.h
> >
> > diff --git a/arch/arm64/include/asm/cfi.h b/arch/arm64/include/asm/cfi.=
h
> > new file mode 100644
> > index 000000000000..670e191f8628
> > --- /dev/null
> > +++ b/arch/arm64/include/asm/cfi.h
> > @@ -0,0 +1,23 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef _ASM_ARM64_CFI_H
> > +#define _ASM_ARM64_CFI_H
> > +
> > +#ifdef CONFIG_CFI_CLANG
> > +#define __bpfcall
> > +static inline int cfi_get_offset(void)
> > +{
> > +     return 4;
>
> Needs a comment.

Ack.

> > +}
> > +#define cfi_get_offset cfi_get_offset
> > +extern u32 cfi_bpf_hash;
> > +extern u32 cfi_bpf_subprog_hash;
> > +extern u32 cfi_get_func_hash(void *func);
> > +#else
> > +#define cfi_bpf_hash 0U
> > +#define cfi_bpf_subprog_hash 0U
> > +static inline u32 cfi_get_func_hash(void *func)
> > +{
> > +     return 0;
> > +}
> > +#endif /* CONFIG_CFI_CLANG */
> > +#endif /* _ASM_ARM64_CFI_H */
>
> This looks like an awful lot of boiler plate to me. The only thing you
> seem to need is the CFI offset -- why isn't that just a constant that we
> can define (or a Kconfig symbol?).

The cfi_get_offset function was originally added in commit
4f9087f16651 ("x86/cfi,bpf: Fix BPF JIT call") because the offset can
change on x86 depending on which CFI scheme is enabled at runtime.
Starting with commit 2cd3e3772e41 ("x86/cfi,bpf: Fix bpf_struct_ops
CFI") the function is also called by the generic BPF code, so we can't
trivially replace it with a constant. However, since this defaults to
`4` unless the architecture adds pre-function NOPs, I think we could
simply move the default implementation to include/linux/cfi.h (and
also drop the RISC-V version). Come to think of it, we could probably
move most of this boilerplate to generic code. I'll refactor this and
send a new version.

> > diff --git a/arch/arm64/kernel/alternative.c b/arch/arm64/kernel/altern=
ative.c
> > index 8ff6610af496..71c153488dad 100644
> > --- a/arch/arm64/kernel/alternative.c
> > +++ b/arch/arm64/kernel/alternative.c
> > @@ -8,11 +8,13 @@
> >
> >  #define pr_fmt(fmt) "alternatives: " fmt
> >
> > +#include <linux/cfi_types.h>
> >  #include <linux/init.h>
> >  #include <linux/cpu.h>
> >  #include <linux/elf.h>
> >  #include <asm/cacheflush.h>
> >  #include <asm/alternative.h>
> > +#include <asm/cfi.h>
> >  #include <asm/cpufeature.h>
> >  #include <asm/insn.h>
> >  #include <asm/module.h>
> > @@ -298,3 +300,26 @@ noinstr void alt_cb_patch_nops(struct alt_instr *a=
lt, __le32 *origptr,
> >               updptr[i] =3D cpu_to_le32(aarch64_insn_gen_nop());
> >  }
> >  EXPORT_SYMBOL(alt_cb_patch_nops);
> > +
> > +#ifdef CONFIG_CFI_CLANG
> > +struct bpf_insn;
> > +
> > +/* Must match bpf_func_t / DEFINE_BPF_PROG_RUN() */
> > +extern unsigned int __bpf_prog_runX(const void *ctx,
> > +                                 const struct bpf_insn *insn);
> > +DEFINE_CFI_TYPE(cfi_bpf_hash, __bpf_prog_runX);
> > +
> > +/* Must match bpf_callback_t */
> > +extern u64 __bpf_callback_fn(u64, u64, u64, u64, u64);
> > +DEFINE_CFI_TYPE(cfi_bpf_subprog_hash, __bpf_callback_fn);
> > +
> > +u32 cfi_get_func_hash(void *func)
> > +{
> > +     u32 hash;
> > +
> > +     if (get_kernel_nofault(hash, func - cfi_get_offset()))
> > +             return 0;
> > +
> > +     return hash;
> > +}
> > +#endif /* CONFIG_CFI_CLANG */
>
> I don't think this should be in alternative.c. It's probably better off
> either as a 'static inline' in the new cfi.h header.

Sure, I'll find a better place for this. RISC-V again seems to have
the exact same function, so I think a __weak implementation in
kernel/cfi.c would work here, allowing x86 to still conveniently
override the function.

> > diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_com=
p.c
> > index 70d7c89d3ac9..3b3691e88dd5 100644
> > --- a/arch/arm64/net/bpf_jit_comp.c
> > +++ b/arch/arm64/net/bpf_jit_comp.c
> > @@ -9,6 +9,7 @@
> >
> >  #include <linux/bitfield.h>
> >  #include <linux/bpf.h>
> > +#include <linux/cfi.h>
> >  #include <linux/filter.h>
> >  #include <linux/memory.h>
> >  #include <linux/printk.h>
> > @@ -164,6 +165,12 @@ static inline void emit_bti(u32 insn, struct jit_c=
tx *ctx)
> >               emit(insn, ctx);
> >  }
> >
> > +static inline void emit_kcfi(u32 hash, struct jit_ctx *ctx)
> > +{
> > +     if (IS_ENABLED(CONFIG_CFI_CLANG))
> > +             emit(hash, ctx);
> > +}
> > +
> >  /*
> >   * Kernel addresses in the vmalloc space use at most 48 bits, and the
> >   * remaining bits are guaranteed to be 0x1. So we can compose the addr=
ess
> > @@ -474,7 +481,6 @@ static int build_prologue(struct jit_ctx *ctx, bool=
 ebpf_from_cbpf)
> >       const bool is_main_prog =3D !bpf_is_subprog(prog);
> >       const u8 fp =3D bpf2a64[BPF_REG_FP];
> >       const u8 arena_vm_base =3D bpf2a64[ARENA_VM_START];
> > -     const int idx0 =3D ctx->idx;
> >       int cur_offset;
> >
> >       /*
> > @@ -500,6 +506,9 @@ static int build_prologue(struct jit_ctx *ctx, bool=
 ebpf_from_cbpf)
> >        *
> >        */
> >
> > +     emit_kcfi(is_main_prog ? cfi_bpf_hash : cfi_bpf_subprog_hash, ctx=
);
> > +     const int idx0 =3D ctx->idx;
> > +
> >       /* bpf function may be invoked by 3 instruction types:
> >        * 1. bl, attached via freplace to bpf prog via short jump
> >        * 2. br, attached via freplace to bpf prog via long jump
> > @@ -2009,9 +2018,9 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_p=
rog *prog)
> >               jit_data->ro_header =3D ro_header;
> >       }
> >
> > -     prog->bpf_func =3D (void *)ctx.ro_image;
> > +     prog->bpf_func =3D (void *)ctx.ro_image + cfi_get_offset();
> >       prog->jited =3D 1;
> > -     prog->jited_len =3D prog_size;
> > +     prog->jited_len =3D prog_size - cfi_get_offset();
>
> Why do we add the offset even when CONFIG_CFI_CLANG is not enabled?

The function returns zero if CFI is not enabled, so I believe it's
just to avoid extra if (IS_ENABLED(CONFIG_CFI_CLANG)) statements in
the code. IMO this is cleaner, but I can certainly change this if you
prefer.

Thanks for taking a look!

Sami

