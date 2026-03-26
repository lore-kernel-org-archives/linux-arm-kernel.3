Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B9C10A1E77
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 11:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HGPKj/TRzPmN2Ik58tT9FnvetsUYhm2GXve+aIyOCI8=; b=3wnETvMwRmM4d8NA80AHyfvRE+
	dxtIwc8ZDUET5BecjsrmSpdyT68bSTlxLKYwwzisKmATH1Xu+t5/LAkbLzY3Mir8bu7h5kKkKkxjx
	JtF2X5/WqEq+cFE00TN0lobATC4pEOXFNdaOGkO5EwUELKoZrZ89x/b3QVSNB0Zl4PemFKwmAekfc
	lAOQXqmhwyG5mbhtvAqYOyP2hovviaIT/tXt/CTOPkFMUtvV49m2nJPnmkUUJr0CoWRL2g/VQmFfP
	1L8kDnTJV/fV2qnu1AUBpaIIytIYAB4CaPXu0nFsKc/oMPia+4W6KLuK0JgL+EB5z5h/RQYBKdO2G
	abI+s3GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5iip-00000005LTz-2uMb;
	Thu, 26 Mar 2026 11:17:55 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5iii-00000005LSq-26pW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 11:17:55 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-668d70fabc4so1566860a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 04:17:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774523866; cv=none;
        d=google.com; s=arc-20240605;
        b=VjN9AxqkXjMb1mqH60JuFwURJorJJa/frTckrzT7Uq+tDvwmc6RtM1/sQyeqUGWFD+
         oh0r1EgpX8BmzPrrkJsI3fYbwd6aXK1OIRxpB9gLx/wcFPXsAFeGhmdd1/gbUPVFJt9h
         +41+XRBfKvj5topdAn496LxzEap3X4rSJLVIrWq/OZK0JMfuUlUUVBToQV/urj5JSAcu
         BQEhrzsomffsV4vZdXLDQ9BcNycPF4pRcroa0XUG4HgkXPwNjKLxfnMpWG6Wf/S+8bUe
         8vx0Ua+cRqPWWXXBhE8y/bNgl7vTavMOgD4Rer6XJpTGrYS/38g5Ucb5i+EzsJMuNE06
         XWEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HGPKj/TRzPmN2Ik58tT9FnvetsUYhm2GXve+aIyOCI8=;
        fh=8y2uRw7OPNWD8qFC3Rp/Yb1sc0jKGOC6tsnFAcZGdzM=;
        b=HXrjPFoms4AhyZteeRulW4FIsHqSGDp/peWmb9Y5Dol6VDR8UxUnUOQCDB59brqZ75
         i5HaVmR/zQaPHPheKaeDgZC3Z1iJG9Mqo84Kn+kicWlaIEh3VuOIi8IB5WBYnINypO6y
         w/W711b9RLJ7+CTVPe9ZMiHJzNcA3zDxHov9l3SAiSI+mPTqrHijVtUgkDeIj/WWdlzI
         6YnmZFywgkFt91nn0+5oa1oAjPadMH3jU47TStYXTBCOztG2rzLKshiSuPMFq5nSwqxh
         S1BZmrQ9B0fJCPhm41jiLR+n1DNJnMvFtLJZ4seGDAkXTV+RyhtT2dF34lLX9Z9pi5m3
         +FiQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774523866; x=1775128666; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HGPKj/TRzPmN2Ik58tT9FnvetsUYhm2GXve+aIyOCI8=;
        b=Ggyl8h++cT9l4HgUviZ8+xAGjREbgv9QfqLh9z5WgMf9N6v4NuisgF/vwIUV8f9OKm
         qY6hMFxYjBf95yUScEV7AZv4Wxd48D5+0CppTwuwWJNuRbZfDeGuqgZUygQKuYP91RtU
         gwhhqufLP8DVKDzoa7A4fThfovU37FAWCqYoicbBzQsFj45OqJYYr2jj7+Jw1lQGT0JK
         Vil2KFV6y1jkdV8lx3wlwneZmfPcz/4tCqSg+6cJpfynAtORU/bG3nWpznmdZOAJyWFd
         VW3DM0ZcH3hBw8T23z+Ry0TSbeGUD0ejQz25Nq74Yd8fx0s3ZRqqJaU716sXh0l6XW6L
         OYYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774523866; x=1775128666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HGPKj/TRzPmN2Ik58tT9FnvetsUYhm2GXve+aIyOCI8=;
        b=A1pNpyaRwFEyXKlpmfs45P4LzE3FjKtkYs5IiXinM5Dxb1nyvVgHicwz1wHaJ6XCfY
         y1f7WJ+sYcqt404tAVvNfPpe7xrOpqrO1LStaTG5w8d9Yn37juJhl4D22GMQqclk1DKw
         LF2CsmxEqTGXLokxOXhfvR0w9tlm9dI7YsRuW4p0R89Cd1oCHcer49wCfzVN5WJ2LPaE
         veowRu9RrI5kOChRwi00ZYT1NfioT62p6TD0Ee4iQQ5ZBdgMu+KZ+SGaEWTccWeM21GO
         /U1++6rBq2cwiI4rZdcACYxkRQNi6pu3VkIUDOOXMopv8hvy16E9xKG0quTvPsyXrU/2
         PTyg==
X-Forwarded-Encrypted: i=1; AJvYcCXPR8r6S3ovF6VoU7Pco416VL/Tgsd3I5mB7F0DXYtxULQc1i7VYNQSjQERAbFCZ7owbSCBqUUN99UG3HoDySxm@lists.infradead.org
X-Gm-Message-State: AOJu0YzeH53an0LYiNFeUBIUPxjXaj78EZS173dE0hNUFnyWokGGjuxE
	zEG/aJacNwQbly4AvMoqjSMKQctY6sEEBfBcrNtiQUqW/Rq+OqpXgaQis56H9yr2Z7rd+eKDXJm
	UYEs90YHF74Mvo9kr/uM1ymhJ57AHc8o=
X-Gm-Gg: ATEYQzxCx8WvDnwRYbGxgfuAYVQ7A7YuzpGktTvNvtr4DIJ8xvAaS4OKo4SX4hDsHPC
	AudSq/Mh0symr8ckXtWEnuA3jse677vem6o83MJsVQSMoBp70kscwXOPhZyKFNO+zZt3kaw2i6p
	+IVFE5BOeJWBKQElegOSaOKCxelpDvWcj6oACygXybOlNFitFa1fgGIPGSjTN4BN+kVYXaR0pQH
	JKK5fo+zXrwmbAny0YOTaO4l8dbCG/xRR6Y/UnEWMIge6Rt7JHplke3nyzUMIdCslUeULm49QZg
	EU9zVPllMNErzEn+ndXxniY=
X-Received: by 2002:a05:6402:3251:b0:66a:6c0b:938a with SMTP id
 4fb4d7f45d1cf-66a82618419mr4014232a12.2.1774523866080; Thu, 26 Mar 2026
 04:17:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260326102608.1855088-1-puranjay@kernel.org> <acURahmSDqFYgcIz@willie-the-truck>
In-Reply-To: <acURahmSDqFYgcIz@willie-the-truck>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Thu, 26 Mar 2026 11:17:34 +0000
X-Gm-Features: AQROBzAZkkiGlI2jm6-OxaPdxKJ5ecrTm7aGYa4l0T4VkdM7mjPVBzubvkR7fc0
Message-ID: <CANk7y0hhSoegJD+D03bnHzCNzUKzvbbb1ivoVOWqBxZb0D3UUA@mail.gmail.com>
Subject: Re: [PATCH] srcu: Optimize SRCU-fast per-CPU counter increments on arm64
To: Will Deacon <will@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Josh Triplett <josh@joshtriplett.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, rcu@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_041748_581039_DF3FFE69 
X-CRM114-Status: GOOD (  36.58  )
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

On Thu, Mar 26, 2026 at 10:58=E2=80=AFAM Will Deacon <will@kernel.org> wrot=
e:
>
> On Thu, Mar 26, 2026 at 03:26:07AM -0700, Puranjay Mohan wrote:
> > On architectures like arm64, this_cpu_inc() wraps the underlying atomic
> > instruction (ldadd) with preempt_disable/enable to prevent migration
> > between the per-CPU address calculation and the atomic operation.
> > However, SRCU does not need this protection because it sums counters
> > across all CPUs for grace-period detection, so operating on a "stale"
> > CPU's counter after migration is harmless.
> >
> > This commit therefore introduces srcu_percpu_counter_inc(), which
> > consolidates the SRCU-fast reader counter updates into a single helper,
> > replacing the if/else dispatch between this_cpu_inc() and
> > atomic_long_inc(raw_cpu_ptr(...)) that was previously open-coded at
> > each call site.
> >
> > On arm64, this helper uses atomic_long_fetch_add_relaxed(), which
> > compiles to the value-returning ldadd instruction.  This is preferred
> > over atomic_long_inc()'s non-value-returning stadd because ldadd is
> > resolved in L1 cache whereas stadd may be resolved further out in the
> > memory hierarchy [1].
> >
> > On x86, where this_cpu_inc() compiles to a single "incl %gs:offset"
> > instruction with no preempt wrappers, the helper falls through to
> > this_cpu_inc(), so there is no change.  Architectures with
> > NEED_SRCU_NMI_SAFE continue to use atomic_long_inc(raw_cpu_ptr(...)),
> > again with no change.  All remaining architectures also use the
> > this_cpu_inc() path, again with no change.
> >
> > refscale measurements on a 72-CPU arm64 Neoverse-V2 system show ~11%
> > improvement in SRCU-fast reader duration:
> >
> >   Unpatched: median 9.273 ns, avg 9.319 ns (min 9.219, max 9.853)
> >     Patched: median 8.275 ns, avg 8.411 ns (min 8.186, max 9.183)
> >
> >   Command: kvm.sh --torture refscale --duration 1 --cpus 72 \
> >            --configs NOPREEMPT --trust-make --bootargs \
> >            "refscale.scale_type=3Dsrcu-fast refscale.nreaders=3D72 \
> >            refscale.nruns=3D100"
> >
> > [1] https://lore.kernel.org/r/e7d539ed-ced0-4b96-8ecd-048a5b803b85@paul=
mck-laptop
> >
> > Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
> > ---
> >  include/linux/srcutree.h | 51 +++++++++++++++++++++++++++-------------
> >  1 file changed, 35 insertions(+), 16 deletions(-)
> >
> > diff --git a/include/linux/srcutree.h b/include/linux/srcutree.h
> > index fd1a9270cb9a..4ff18de3edfd 100644
> > --- a/include/linux/srcutree.h
> > +++ b/include/linux/srcutree.h
> > @@ -286,15 +286,43 @@ static inline struct srcu_ctr __percpu *__srcu_ct=
r_to_ptr(struct srcu_struct *ss
> >   * on architectures that support NMIs but do not supply NMI-safe
> >   * implementations of this_cpu_inc().
> >   */
> > +
> > +/*
> > + * Atomically increment a per-CPU SRCU counter.
> > + *
> > + * On most architectures, this_cpu_inc() is optimal (e.g., on x86 it i=
s
> > + * a single "incl %gs:offset" instruction).  However, on architectures
> > + * like arm64, s390, and loongarch, this_cpu_inc() wraps the underlyin=
g
> > + * atomic instruction with preempt_disable/enable to prevent migration
> > + * between the per-CPU address calculation and the atomic operation.
> > + * SRCU does not need this protection because it sums counters across
> > + * all CPUs for grace-period detection, so operating on a "stale" CPU'=
s
> > + * counter after migration is harmless.
> > + *
> > + * On arm64, use atomic_long_fetch_add_relaxed() which compiles to the
> > + * value-returning ldadd instruction instead of atomic_long_inc()'s
> > + * non-value-returning stadd, because ldadd is resolved in L1 cache
> > + * whereas stadd may be resolved further out in the memory hierarchy.
> > + * https://lore.kernel.org/r/e7d539ed-ced0-4b96-8ecd-048a5b803b85@paul=
mck-laptop
> > + */
> > +static __always_inline void
> > +srcu_percpu_counter_inc(atomic_long_t __percpu *v)
> > +{
> > +#ifdef CONFIG_ARM64
> > +     (void)atomic_long_fetch_add_relaxed(1, raw_cpu_ptr(v));
> > +#elif IS_ENABLED(CONFIG_NEED_SRCU_NMI_SAFE)
> > +     atomic_long_inc(raw_cpu_ptr(v));
> > +#else
> > +     this_cpu_inc(v->counter);
> > +#endif
> > +}
>
> No, this is a hack. arm64 shouldn't be treated specially here.
>
> The ldadd issue was already fixed properly in
> git.kernel.org/linus/535fdfc5a2285. If you want to improve our preempt
> disable/enable code or add helpers that don't require that, then patches
> are welcome, but bodging random callers with arch-specific code for a
> micro-benchmark is completely the wrong approach.

Thanks for the feedback.

I basically want to remove the overhead of preempt disable/enable that
comes with this_cpu_*(), because in SRCU (and maybe at other places
too) we don't need that safety. One way would be to define
raw_cpu_add_* helpers in arch/arm64/include/asm/percpu.h but that
wouldn't be good for existing callers of raw_cpu_add() as currently
raw_cpu_add() resolves to raw_cpu_generic_to_op(pcp, val, +=3D), which
is not atomic. Another way would be to add new helpers that do per-CPU
atomics without preempt enable/disable.

And do you think this optimization is worth doing? or should I just not do =
it?

Thanks,
Puranjay

