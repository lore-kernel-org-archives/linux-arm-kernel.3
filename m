Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A60D7497F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 16:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LvuO1ViQ0Ob71UZ6awKGpC8247YEXMq6MRqHTPjtgoE=; b=CZ5+u4SdTuTApzrd/c3l03IMQx
	4A+IPaqcAvBpViqKcr6u5oSdPgxVhwWQlzgSMZN2b1Hut7KKb1IIwBWR+cE7EVuciQJK4L3cih2CN
	F477fJOSWnD4GYkx+YizHGHX2mLDOIPMEVQtPqBFKwe2sqeAmOTpx85xrcKIAGHL1EPONkOJ9G7of
	g2qCZx43sSobvHPFaV1WBm5HLeitfKV9MWsN+IkK6jmD7yfjaBWN/0wmfGnNVIzGk118D19bmEbTO
	H/AmTewzKNZkt1muYkXp08obOofs98pLZ/A3tjuNha7ELcmFEvZTl3P6HMRRXNRRQZLrh1eXl17Il
	V+EbRamQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWdXT-0000000Af48-1Y5a;
	Fri, 19 Dec 2025 16:41:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWdXN-0000000Af3m-09vm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 16:41:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B6CB744070
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 16:41:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D0F0C19424
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 16:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766162463;
	bh=PlNgCFLWP1sflSNg7tigi2WDl62KM7a41QAwKhaVpaM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hseb6uVWoB7IAkj1OJ8DsM/ePVhzU815GZwAZd6C1JXgAP1CsKyWopo/Q2RVRlz7a
	 6splEHqWI3ttNkhTuyv+Uu4KMIKr01JoZw2pAhqrPTnNLcgYr8vS+0bsyWH7l+I3MK
	 l0r0lQ9qIJcJKJRP0q4FTsRrmHui2UeASTCYoRRMHaH39J3m6da0fLRQqV2fijMFqb
	 WJvEDeycLr6q1OsOjv8bDT9nVQfiPeXxg+iNodWolLh350ggCx1ZoF5DANPlB1Xq/A
	 SPE/uA2cW3F/dvxw5LlqPgU64BSJe+7DtMkcvAVoCDUME6b8PyLl/Ozjfhijpe/CXv
	 ZaDONJL0MVd1Q==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64ba1a1ea06so864465a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 08:41:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWinZOzxG7fnkv3kr9u/J5hMjicYxhaEmyA2Z8CCFG2z1iE6JIIaQJE03v52JfGBxuOcfoUSHMpDMaOM8ZrInGS@lists.infradead.org
X-Gm-Message-State: AOJu0YxjYIezO3vFO5kfkfDTajaxdgCZp5DBbaM61SUlKRuSvLyGjOfx
	GLDsdIlAqyflgF1MSrxxyP+FHH0NvhyvQWQHTdvksXXyijEOD3Q0PT1uaE9T4wFwzjVtVQNZ61j
	hI5AAZs88+EyzWIC0HNCCalMZMiXJxvY=
X-Google-Smtp-Source: AGHT+IG3JMxK9+f+aKtrDqj92Mm3pfwAOTLKaX5/1tmaxUvKOPQ5vMBzAhZsVwGvZtA4hozbU/aji1fgU4Fj+OoHJUU=
X-Received: by 2002:a05:6402:1d55:b0:64b:4540:ef94 with SMTP id
 4fb4d7f45d1cf-64b8eb618d0mr2880511a12.21.1766162462076; Fri, 19 Dec 2025
 08:41:02 -0800 (PST)
MIME-Version: 1.0
References: <20251217233608.2374187-1-puranjay@kernel.org> <20251217233608.2374187-3-puranjay@kernel.org>
 <1728d4e1-ce5c-476e-b057-b8a9a7621e1b@linux.dev>
In-Reply-To: <1728d4e1-ce5c-476e-b057-b8a9a7621e1b@linux.dev>
From: Puranjay Mohan <puranjay@kernel.org>
Date: Fri, 19 Dec 2025 16:40:45 +0000
X-Gmail-Original-Message-ID: <CANk7y0gRJ4u-R+Pzv9M1LTJtRgTR+BxxFJia8q_u0cY-kM0JzA@mail.gmail.com>
X-Gm-Features: AQt7F2rvl-ovAXOzmsq69b_3L79BATrKKY5QTW4qNzx-IhMT7QjvWwyYryCPIJ0
Message-ID: <CANk7y0gRJ4u-R+Pzv9M1LTJtRgTR+BxxFJia8q_u0cY-kM0JzA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 2/2] bpf: arm64: Optimize recursion detection
 by not using atomics
To: Yonghong Song <yonghong.song@linux.dev>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Martin KaFai Lau <martin.lau@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, kernel-team@meta.com, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_084105_144107_E3801DA6 
X-CRM114-Status: GOOD (  33.90  )
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

On Thu, Dec 18, 2025 at 5:56=E2=80=AFPM Yonghong Song <yonghong.song@linux.=
dev> wrote:
>
>
>
> On 12/17/25 3:35 PM, Puranjay Mohan wrote:
> > BPF programs detect recursion using a per-CPU 'active' flag in struct
> > bpf_prog. The trampoline currently sets/clears this flag with atomic
> > operations.
> >
> > On some arm64 platforms (e.g., Neoverse V2 with LSE), per-CPU atomic
> > operations are relatively slow. Unlike x86_64 - where per-CPU updates
> > can avoid cross-core atomicity, arm64 LSE atomics are always atomic
> > across all cores, which is unnecessary overhead for strictly per-CPU
> > state.
> >
> > This patch removes atomics from the recursion detection path on arm64 b=
y
> > changing 'active' to a per-CPU array of four u8 counters, one per
> > context: {NMI, hard-irq, soft-irq, normal}. The running context uses a
> > non-atomic increment/decrement on its element.  After increment,
> > recursion is detected by reading the array as a u32 and verifying that
> > only the expected element changed; any change in another element
> > indicates inter-context recursion, and a value > 1 in the same element
> > indicates same-context recursion.
> >
> > For example, starting from {0,0,0,0}, a normal-context trigger changes
> > the array to {0,0,0,1}.  If an NMI arrives on the same CPU and triggers
> > the program, the array becomes {1,0,0,1}. When the NMI context checks
> > the u32 against the expected mask for normal (0x00000001), it observes
> > 0x01000001 and correctly reports recursion. Same-context recursion is
> > detected analogously.
> >
> > Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
>
> LGTM with a few nits below.
>
> Acked-by: Yonghong Song <yonghong.song@linux.dev>
>
> > ---
> >   include/linux/bpf.h | 33 ++++++++++++++++++++++++++++++---
> >   kernel/bpf/core.c   |  3 ++-
> >   2 files changed, 32 insertions(+), 4 deletions(-)
> >
> > diff --git a/include/linux/bpf.h b/include/linux/bpf.h
> > index 2da986136d26..5ca2a761d9a1 100644
> > --- a/include/linux/bpf.h
> > +++ b/include/linux/bpf.h
> > @@ -31,6 +31,7 @@
> >   #include <linux/static_call.h>
> >   #include <linux/memcontrol.h>
> >   #include <linux/cfi.h>
> > +#include <linux/unaligned.h>
> >   #include <asm/rqspinlock.h>
> >
> >   struct bpf_verifier_env;
> > @@ -1746,6 +1747,8 @@ struct bpf_prog_aux {
> >       struct bpf_map __rcu *st_ops_assoc;
> >   };
> >
> > +#define BPF_NR_CONTEXTS        4       /* normal, softirq, hardirq, NM=
I */
> > +
> >   struct bpf_prog {
> >       u16                     pages;          /* Number of allocated pa=
ges */
> >       u16                     jited:1,        /* Is our filter JIT'ed? =
*/
> > @@ -1772,7 +1775,7 @@ struct bpf_prog {
> >               u8 tag[BPF_TAG_SIZE];
> >       };
> >       struct bpf_prog_stats __percpu *stats;
> > -     int __percpu            *active;
> > +     u8 __percpu             *active;        /* u8[BPF_NR_CONTEXTS] fo=
r rerecursion protection */
> >       unsigned int            (*bpf_func)(const void *ctx,
> >                                           const struct bpf_insn *insn);
> >       struct bpf_prog_aux     *aux;           /* Auxiliary fields */
> > @@ -2006,12 +2009,36 @@ struct bpf_struct_ops_common_value {
> >
> >   static inline bool bpf_prog_get_recursion_context(struct bpf_prog *pr=
og)
> >   {
> > -     return this_cpu_inc_return(*(prog->active)) =3D=3D 1;
> > +#ifdef CONFIG_ARM64
> > +     u8 rctx =3D interrupt_context_level();
> > +     u8 *active =3D this_cpu_ptr(prog->active);
> > +     u32 val;
> > +
> > +     preempt_disable();
> > +     active[rctx]++;
> > +     val =3D get_unaligned_le32(active);
>
> The 'active' already aligned with 8 (or 4 with my below suggestion).
> The get_unaligned_le32() works, but maybe we could use le32_to_cpu()
> instead. Maybe there is no performance difference between
> get_unaligned_le32() and le32_to_cpu() so you pick get_unaligned_le32()?
> It would be good to clarify in commit message if get_unaligned_le32()
> is used.
>
> > +     preempt_enable();
> > +     if (val !=3D BIT(rctx * 8))
> > +             return false;
> > +
> > +     return true;
> > +#else
> > +     return this_cpu_inc_return(*(int __percpu *)(prog->active)) =3D=
=3D 1;
> > +#endif
> >   }
> >
> >   static inline void bpf_prog_put_recursion_context(struct bpf_prog *pr=
og)
> >   {
> > -     this_cpu_dec(*(prog->active));
> > +#ifdef CONFIG_ARM64
> > +     u8 rctx =3D interrupt_context_level();
> > +     u8 *active =3D this_cpu_ptr(prog->active);
> > +
> > +     preempt_disable();
> > +     active[rctx]--;
> > +     preempt_enable();
> > +#else
> > +     this_cpu_dec(*(int __percpu *)(prog->active));
> > +#endif
> >   }
> >
> >   #if defined(CONFIG_BPF_JIT) && defined(CONFIG_BPF_SYSCALL)
> > diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
> > index c66316e32563..b5063acfcf92 100644
> > --- a/kernel/bpf/core.c
> > +++ b/kernel/bpf/core.c
> > @@ -112,7 +112,8 @@ struct bpf_prog *bpf_prog_alloc_no_stats(unsigned i=
nt size, gfp_t gfp_extra_flag
> >               vfree(fp);
> >               return NULL;
> >       }
> > -     fp->active =3D alloc_percpu_gfp(int, bpf_memcg_flags(GFP_KERNEL |=
 gfp_extra_flags));
> > +     fp->active =3D __alloc_percpu_gfp(sizeof(u8[BPF_NR_CONTEXTS]), 8,
> > +                                     bpf_memcg_flags(GFP_KERNEL | gfp_=
extra_flags));
>
> Here, the alignment is 8. Can it be 4 since the above reads a 32bit value=
?

Yes, It should be 4. Will change in next version and add your acked by.

Thanks,
Puranjay

