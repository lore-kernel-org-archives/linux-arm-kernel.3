Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D960D7879F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 18:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oudq9qWHcOe8tU1iAxBOlGEnib6VaS6CN57aHmQag4g=; b=dWxe6GYgKVIGjP46I9251DHFbM
	s28S4y9P5lgPRyVONZNCjgS1ramVg79YoQ6hetCyLr7MJYMukK7B5tmn4xmIPelzWs1oJG0PzdxMm
	AG5MnYCsNrlpNLiTJ7o/8t27hXLGVhQzl4RhuC3NYBPyt3XeAFw3BV/6YFsnmAOZ23NMI8PhH2tKD
	NwbACiLQfcpY8NO5IfTb8uFVmCaq6uNrceVvUr+xTDYf6o57HgBczupkSH4tF6YV1cV7dEKPWwllL
	+DDqZEak5WBcWq/gmUZRZfEFGdWcwkBoiLrCxHdbB+LBgj/ZKIpI5vsBuF0xcaZBo8v5lZVfRSZ4I
	6EGWZzOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWf8u-0000000ApP2-3XxN;
	Fri, 19 Dec 2025 18:23:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWf8s-0000000ApOe-0Hyt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 18:23:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B3D5442E7
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 18:23:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B9A3C16AAE
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 18:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766168633;
	bh=IQUpviy+SHL1m2AGCU0Phcex95pxeDnlr5HcvWpAflI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oe5QuZIOJN98CStdAkRuNoCNjBu/wZ4WvP9adTQuGOn6rjvm7NbL6sXbnVI9Hq0y8
	 yYnJP5iCrnMHevOdZ1oZWV7QlM/QxDotn8XkfS7mWy/mbrVEuLusamXAmee1QfaoaH
	 lgAEJOErNNnD+dSBz7lJ8iJ0nrcfvIDtNs9OXnrrH0X3AqN9cOlAs4Vl7hu/j0Fl1V
	 3qv17NcFcseUHFJJJJkHsOgqQV9U4KfmhfOg1DmCd8DNa9XxrdzA8HrSsLd9ZZlpfs
	 hkEvG/egzmhHR6V+GK4tiContTjoz51DgwRdU3GfQxB5sIrPHxTi2qX1iLCUAGmobw
	 yifdl9XqL6h3A==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so288766066b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 10:23:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWCtT99dCDot7Lz+OSW+w6w2UcMqUY/Jlq119o6afSqtknsci0886QYjULrF9OdC8NvwE6XzO4vozVieaLvHk2P@lists.infradead.org
X-Gm-Message-State: AOJu0YxBW8VsHossT3U8WiJ66EpPr5HUtuwTZULdFDNsnsSjTlGfTi7R
	hwiLVpRckZewKzPHoA0He3YEsDO9aRRu3pEAdu12B2SrHvLQVdizSPNyp9iGuGlaupncCoppyMG
	HMBnoEi3uyeDFjHojxICM2qA4n7Sm+yA=
X-Google-Smtp-Source: AGHT+IFjUlxRf0zx6cGLNJ3Qo5wrQw2AAItRc97zHUPkb9+LEQBsKoHb9ZtmYfg3Js/RmCbPN8US/NJMfkimXUpNiGU=
X-Received: by 2002:a17:907:6d23:b0:b72:77c7:d8ad with SMTP id
 a640c23a62f3a-b8037058bbbmr367812466b.35.1766168631674; Fri, 19 Dec 2025
 10:23:51 -0800 (PST)
MIME-Version: 1.0
References: <20251217233608.2374187-1-puranjay@kernel.org> <20251217233608.2374187-3-puranjay@kernel.org>
 <1728d4e1-ce5c-476e-b057-b8a9a7621e1b@linux.dev>
In-Reply-To: <1728d4e1-ce5c-476e-b057-b8a9a7621e1b@linux.dev>
From: Puranjay Mohan <puranjay@kernel.org>
Date: Fri, 19 Dec 2025 18:23:38 +0000
X-Gmail-Original-Message-ID: <CANk7y0iGCwKss5Mbdq8+-Xp8d_TRr1tPY4DcAFCPgpFiQW8otg@mail.gmail.com>
X-Gm-Features: AQt7F2qJa8mVqEoknWmPGcn4C9_EwmdJdPhPcZoj-YEjjWHRm79i4XMNMjDAHvY
Message-ID: <CANk7y0iGCwKss5Mbdq8+-Xp8d_TRr1tPY4DcAFCPgpFiQW8otg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20251219_102354_147618_D5CF0C5C 
X-CRM114-Status: GOOD (  32.12  )
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

I will just use val =3D le32_to_cpu(*(__le32 *)active);

Thanks,
Puranjay

