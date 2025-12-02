Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2179ACFD376
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 09:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fW7H/urficMocfXwPRwAy/dwnmak8WIx1YZB7EB0w1k=; b=as7BWZpEWcx0lMhkYjqMM/FO5p
	vrNNnWSiRQeLpETAqBrUCwYtrePo/cqspfEqG2MtriRaad8ImeC4wB43hw9sEJABXU6uoCnKLuc7L
	/W92kQD4Gn2pfcAqH7cW4y3NjiBP1OVftdaJHZBRfbYdX8iIGJDuXV3Vt9YipqN2a0VWUs8M1MDEs
	uIy3635FD8dJxjq5+Sprsq57MHaPm0UR6Bj2ND7AeocnaaaUlvCYywj0JQR7ppUbLP/YiqXsn91qB
	zwyqwKJq3KZXXo1dj+liUosK3H3RktU+hZ+lrKGfIi0VO6fd7cNG9/mJ3A9HeWn8XEKaYhBdQDENN
	NXW1TtRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQMTz-000000055px-0vv5;
	Tue, 02 Dec 2025 09:15:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQMTx-000000055pn-2dkM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 09:15:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 51CF56017A
	for <linux-arm-kernel@lists.infradead.org>; Tue,  2 Dec 2025 09:15:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03469C19423
	for <linux-arm-kernel@lists.infradead.org>; Tue,  2 Dec 2025 09:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764666936;
	bh=b9JZ/9b867HgOxhfuCfHFuU5Zlq6dUjTHJIMq7OvdXo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=l0DQOGW5Nvby5zv4HbcrFQNSkXfigXxt9yOxruzs7Z9Bc3b9oYkXS6Mnoopjb7TiW
	 bZIcDWTjtgihqsCRvSlrsHSQ8+Gqv7mWtsm8GIplKJJu8DfIPONp957BZRvT42a+I5
	 9ts4bhk4ACwmU09zGxS2286uOQ6s9A+ePriHFcC3cy6s8E2H2PbjgV1C01BTPAIG+r
	 zmVm1/SdANOOer1ennUviT2BSuuyYLQqn101ESAM8uEK4m29MlgIuekJxibUwEOJOD
	 4m2D12mZNcnaLjxm6B4eWuQPHRkCTOvQT5d7pGDH+P5MQLG7TrYrrsXR3u3Ktq3MNJ
	 uVC4vVq79AIiA==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-37a33f49018so43203751fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 01:15:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU4aDHe23Vbmj4hnVmW/gvIn+8HJSuFxJiN7IpzMvq3p0Oec4TRfo6/oDLHANbg6gHJekHZW15eWKxhUC5fe/z3@lists.infradead.org
X-Gm-Message-State: AOJu0YwQ15gEhpUEsdbUxRIIjkJU+yYMxoQdbxR/ZupwpwOQ68fR88ON
	E5sQFK6NdKTfG5aYuW5ZYAp7Ab3VJvVdhnyjhHZej1aSWsJpyYP5HVVRGUW8+Or7vyE1u+WzE2V
	zvQ8vsVTP5vXoQ+vBf7NLykW8MeXIFiQ=
X-Google-Smtp-Source: AGHT+IF0C79JB38yU6KMu2bD0taBG1CYqGrCeqMTYdJgV/vjr4ympFA4D9VFbXEwegznrtURQTdg2BGWuvWNNniR1Fw=
X-Received: by 2002:a05:6512:3b93:b0:595:7cf5:f7cf with SMTP id
 2adb3069b0e04-596a3ede9dcmr14182023e87.38.1764666934245; Tue, 02 Dec 2025
 01:15:34 -0800 (PST)
MIME-Version: 1.0
References: <20251127105958.2427758-1-ryan.roberts@arm.com>
 <20251127105958.2427758-3-ryan.roberts@arm.com> <CAMj1kXFY1RXk8T4f46bkm_sr0nJfBoO+ii68JK4+CsRiDwKdCg@mail.gmail.com>
 <9097505d-b18b-4f85-a02c-7f2865ad8bca@arm.com>
In-Reply-To: <9097505d-b18b-4f85-a02c-7f2865ad8bca@arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 2 Dec 2025 10:15:22 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHX1W2Kz5NJehtzDhOCKWEd6y1sp8+ViOMHGsq9e8=7Pw@mail.gmail.com>
X-Gm-Features: AWmQ_bkvk2Lylh9ZBNVWQbeJ2lY90jVEEA6b3x_hJfV43wB8DcjmAAS0L0aVmc0
Message-ID: <CAMj1kXHX1W2Kz5NJehtzDhOCKWEd6y1sp8+ViOMHGsq9e8=7Pw@mail.gmail.com>
Subject: Re: [RFC PATCH v1 2/2] randomize_kstack: Unify random source across arches
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Kees Cook <kees@kernel.org>, Ard Biesheuvel <ardb+git@google.com>, Will Deacon <will@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Jeremy Linton <jeremy.linton@arm.com>, 
	Catalin Marinas <Catalin.Marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>, linux-hardening@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Mon, 1 Dec 2025 at 19:20, Ryan Roberts <ryan.roberts@arm.com> wrote:
>
> On 28/11/2025 11:01, Ard Biesheuvel wrote:
> > On Thu, 27 Nov 2025 at 12:00, Ryan Roberts <ryan.roberts@arm.com> wrote:
> >>
> >> Previously different architectures were using random sources of
> >> differing strength and cost to decide the random kstack offset. A number
> >> of architectures (loongarch, powerpc, s390, x86) were using their
> >> timestamp counter, at whatever the frequency happened to be. Other
> >> arches (arm64, riscv) were using entropy from the crng via
> >> get_random_u16().
> >>
> >> There have been concerns that in some cases the timestamp counters may
> >> be too weak, because they can be easily guessed or influenced by user
> >> space. And get_random_u16() has been shown to be too costly for the
> >> level of protection kstack offset randomization provides.
> >>
> >> So let's use a common, architecture-agnostic source of entropy; a
> >> per-task prng, seeded at fork-time from the crng. This has a few
> >> benefits:
> >>
> >>   - We can remove choose_random_kstack_offset(); That was only there to
> >>     try to make the timestamp counter value a bit harder to influence
> >>     from user space.
> >>
> >>   - The architecture code is simplified. All it has to do now is call
> >>     add_random_kstack_offset() in the syscall path.
> >>
> >>   - The strength of the randomness can be reasoned about independently
> >>     of the architecture.
> >>
> >>   - Arches previously using get_random_u16() now have much faster
> >>     syscall paths, see below results.
> >>
> >> There have been some claims that a prng may be less strong than the
> >> timestamp counter if not regularly reseeded. But the prng has a period
> >> of about 2^113. So as long as the prng state remains secret, it should
> >> not be possible to guess. If the prng state can be accessed, we have
> >> bigger problems.
> >>
> >> Additionally, we are only consuming 6 bits to randomize the stack, so
> >> there are only 64 possible random offsets. I assert that it would be
> >> trivial for an attacker to brute force by repeating their attack and
> >> waiting for the random stack offset to be the desired one. The prng
> >> approach seems entirely proportional to this level of protection.
> >>
> >> Performance data are provided below. The baseline is v6.18-rc5 with
> >> rndstack on for each respective arch. (I)/(R) indicate statistically
> >> significant improvement/regression. arm64 platform is AWS Graviton3.
> >> x86_64 platform is AWS Sapphire Rapids:
> >>
> >> +-----------------+--------------+---------------+---------------+
> >> | Benchmark       | Result Class | per-task-prng | per-task-prng |
> >> |                 |              |         arm64 |        x86_64 |
> >> +=================+==============+===============+===============+
> >> | syscall/getpid  | mean (ns)    |   (I) -10.54% |    (I) -7.69% |
> >> |                 | p99 (ns)     |   (I) -59.53% |         4.14% |
> >> |                 | p99.9 (ns)   |   (I) -59.90% |         2.68% |
> >> +-----------------+--------------+---------------+---------------+
> >> | syscall/getppid | mean (ns)    |   (I) -10.49% |    (I) -5.98% |
> >> |                 | p99 (ns)     |   (I) -59.83% |        -3.11% |
> >> |                 | p99.9 (ns)   |   (I) -59.88% |     (R) 9.84% |
> >> +-----------------+--------------+---------------+---------------+
> >> | syscall/invalid | mean (ns)    |    (I) -9.28% |    (I) -6.94% |
> >> |                 | p99 (ns)     |   (I) -61.06% |    (I) -5.57% |
> >> |                 | p99.9 (ns)   |   (I) -61.40% |    (R) 10.53% |
> >> +-----------------+--------------+---------------+---------------+
> >>
> >> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> >> ---
> >>  arch/Kconfig                         |  5 ++--
> >>  arch/arm64/kernel/syscall.c          | 11 -------
> >>  arch/loongarch/kernel/syscall.c      | 11 -------
> >>  arch/powerpc/kernel/syscall.c        | 12 --------
> >>  arch/riscv/kernel/traps.c            | 12 --------
> >>  arch/s390/include/asm/entry-common.h |  8 ------
> >>  arch/x86/include/asm/entry-common.h  | 12 --------
> >>  include/linux/prandom.h              |  7 ++++-
> >>  include/linux/randomize_kstack.h     | 43 ++++++++--------------------
> >>  include/linux/sched.h                |  3 +-
> >>  10 files changed, 22 insertions(+), 102 deletions(-)
> >>
> >
> > I think this is a substantial improvement over the status quo,
> > especially with all the dodgy uses of monotonic counters with
> > unspecified granularity.
> >
> > So with two comments below:
> >
> > Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
>
> Thanks!
>
> I shall plan to re-post without the RFC tag against -rc1 then, and we will see
> if anyone pushes back.
>

Sounds good.

...
> >> diff --git a/include/linux/prandom.h b/include/linux/prandom.h
> >> index f2ed5b72b3d6..827edde11cb9 100644
> >> --- a/include/linux/prandom.h
> >> +++ b/include/linux/prandom.h
> >> @@ -10,13 +10,18 @@
> >>
> >>  #include <linux/types.h>
> >>  #include <linux/once.h>
> >> -#include <linux/percpu.h>
> >>  #include <linux/random.h>
> >>
> >>  struct rnd_state {
> >>         __u32 s1, s2, s3, s4;
> >>  };
> >>
> >> +/*
> >> + * percpu.h includes sched.h, which requires struct rnd_state. So defer until
> >> + * after struct rnd_state is defined.
> >> + */
> >> +#include <linux/percpu.h>
> >> +
> >
> > Yuck. Is this the best we can do to disentangle this?
>
> I think I might be able to remove some stuff out of sched.h into alloc_tag.h
> (looks to me like it should have been there all along). And that will allow
> removing the sched.h include from percpu.h. I think that will solve it.
>

OK.

> >> diff --git a/include/linux/randomize_kstack.h b/include/linux/randomize_kstack.h
> >> index 089b1432f7e6..83c7e6710f6d 100644
> >> --- a/include/linux/randomize_kstack.h
> >> +++ b/include/linux/randomize_kstack.h
> >> @@ -6,6 +6,7 @@
> >>  #include <linux/kernel.h>
> >>  #include <linux/jump_label.h>
> >>  #include <linux/percpu-defs.h>
> >> +#include <linux/prandom.h>
> >>
> >>  DECLARE_STATIC_KEY_MAYBE(CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT,
> >>                          randomize_kstack_offset);
> >> @@ -45,9 +46,13 @@ DECLARE_STATIC_KEY_MAYBE(CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT,
> >>  #define KSTACK_OFFSET_MAX(x)   ((x) & 0b1111111100)
> >>  #endif
> >>
> >> +static __always_inline u32 get_update_kstack_offset(void)
> >> +{
> >> +       return prandom_u32_state(&current->kstack_rnd_state);
>
> I've got bot warnings because this is being called from noinstr code. I guess
> the best option is to just move add_random_kstack_offset() to after
> instrumentation is enabled for the affected arches.
>

Just put instrumentation_begin()/instrumentation_end() around the call
to prandom_u32_state() - that seems to be the common approach for
punching holes into the 'noinstr' validation.


> >> +}
> >> +
> >>  /**
> >> - * add_random_kstack_offset - Increase stack utilization by previously
> >> - *                           chosen random offset
> >> + * add_random_kstack_offset - Increase stack utilization by a random offset.
> >>   *
> >>   * This should be used in the syscall entry path after user registers have been
> >>   * stored to the stack. Preemption may be enabled. For testing the resulting
> >> @@ -56,46 +61,22 @@ DECLARE_STATIC_KEY_MAYBE(CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT,
> >>  #define add_random_kstack_offset() do {                                        \
> >>         if (static_branch_maybe(CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT, \
> >>                                 &randomize_kstack_offset)) {            \
> >> -               u32 offset = current->kstack_offset;                    \
> >> +               u32 offset = get_update_kstack_offset();                \
> >>                 u8 *ptr = __kstack_alloca(KSTACK_OFFSET_MAX(offset));   \
> >>                 /* Keep allocation even after "ptr" loses scope. */     \
> >>                 asm volatile("" :: "r"(ptr) : "memory");                \
> >>         }                                                               \
> >>  } while (0)
> >>
> >> -/**
> >> - * choose_random_kstack_offset - Choose the random offset for the next
> >> - *                              add_random_kstack_offset()
> >> - *
> >> - * This should only be used during syscall exit. Preemption may be enabled. This
> >> - * position in the syscall flow is done to frustrate attacks from userspace
> >> - * attempting to learn the next offset:
> >> - * - Maximize the timing uncertainty visible from userspace: if the
> >> - *   offset is chosen at syscall entry, userspace has much more control
> >> - *   over the timing between choosing offsets. "How long will we be in
> >> - *   kernel mode?" tends to be more difficult to predict than "how long
> >> - *   will we be in user mode?"
> >> - * - Reduce the lifetime of the new offset sitting in memory during
> >> - *   kernel mode execution. Exposure of "thread-local" memory content
> >> - *   (e.g. current, percpu, etc) tends to be easier than arbitrary
> >> - *   location memory exposure.
> >> - */
> >> -#define choose_random_kstack_offset(rand) do {                         \
> >> -       if (static_branch_maybe(CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT, \
> >> -                               &randomize_kstack_offset)) {            \
> >> -               u32 offset = current->kstack_offset;                    \
> >> -               offset = ror32(offset, 5) ^ (rand);                     \
> >> -               current->kstack_offset = offset;                        \
> >> -       }                                                               \
> >> -} while (0)
> >> -
> >>  static inline void random_kstack_task_init(struct task_struct *tsk)
> >>  {
> >> -       current->kstack_offset = 0;
> >> +       if (static_branch_maybe(CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT,
> >> +                               &randomize_kstack_offset)) {
> >> +               prandom_seed_state(&tsk->kstack_rnd_state, get_random_u64());
> >
> > We should either fix prandom_seed_state() not to truncate the u64 to
> > u32, or even better, refactor prandom_seed_full_state() so we can
> > reuse it here, and use a 128-bit seed directly.
>
> How about something like this:
>

Looks good to me, but it does make we wonder why a full prandom state
(i.e., one per cpu) isn't sufficient here, and why we are putting one
in every task. Is it just to avoid the overhead of dis/enabling
preemption on every syscall entry?





>
> ---8<---
> diff --git a/include/linux/prandom.h b/include/linux/prandom.h
> index f2ed5b72b3d6..9b651c9b3448 100644
> --- a/include/linux/prandom.h
> +++ b/include/linux/prandom.h
> @@ -19,10 +19,11 @@ struct rnd_state {
>
>  u32 prandom_u32_state(struct rnd_state *state);
>  void prandom_bytes_state(struct rnd_state *state, void *buf, size_t nbytes);
> -void prandom_seed_full_state(struct rnd_state __percpu *pcpu_state);
> +void prandom_seed_full_state_one(struct rnd_state *state);
> +void prandom_seed_full_state_all(struct rnd_state __percpu *pcpu_state);
>
>  #define prandom_init_once(pcpu_state)                  \
> -       DO_ONCE(prandom_seed_full_state, (pcpu_state))
> +       DO_ONCE(prandom_seed_full_state_all, (pcpu_state))
>
>  /*
>   * Handle minimum values for seeds
> diff --git a/lib/random32.c b/lib/random32.c
> index 24e7acd9343f..50d8f5f9fca7 100644
> --- a/lib/random32.c
> +++ b/lib/random32.c
> @@ -107,24 +107,28 @@ static void prandom_warmup(struct rnd_state *state)
>         prandom_u32_state(state);
>  }
>
> -void prandom_seed_full_state(struct rnd_state __percpu *pcpu_state)
> +void prandom_seed_full_state_one(struct rnd_state *state)
>  {
> -       int i;
> +       u32 seeds[4];
>
> -       for_each_possible_cpu(i) {
> -               struct rnd_state *state = per_cpu_ptr(pcpu_state, i);
> -               u32 seeds[4];
> +       get_random_bytes(&seeds, sizeof(seeds));
> +       state->s1 = __seed(seeds[0],   2U);
> +       state->s2 = __seed(seeds[1],   8U);
> +       state->s3 = __seed(seeds[2],  16U);
> +       state->s4 = __seed(seeds[3], 128U);
>
> -               get_random_bytes(&seeds, sizeof(seeds));
> -               state->s1 = __seed(seeds[0],   2U);
> -               state->s2 = __seed(seeds[1],   8U);
> -               state->s3 = __seed(seeds[2],  16U);
> -               state->s4 = __seed(seeds[3], 128U);
> +       prandom_warmup(state);
> +}
> +EXPORT_SYMBOL(prandom_seed_full_state_one);
>
> -               prandom_warmup(state);
> -       }
> +void prandom_seed_full_state_all(struct rnd_state __percpu *pcpu_state)
> +{
> +       int i;
> +
> +       for_each_possible_cpu(i)
> +               prandom_seed_full_state_one(per_cpu_ptr(pcpu_state, i));
>  }
> -EXPORT_SYMBOL(prandom_seed_full_state);
> +EXPORT_SYMBOL(prandom_seed_full_state_all);
>
>  #ifdef CONFIG_RANDOM32_SELFTEST
>  static struct prandom_test1 {
> ---8<---
>

