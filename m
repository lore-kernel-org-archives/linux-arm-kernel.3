Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0C5CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 18:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wbrNH7TIUxdhw455CFBoFPt1I7SPMGi4pZXVg39xlto=; b=d60wV5j479JIdECWpBacBncteq
	6/yZ/BUi+0myaipJhKW8BFKe3afJvBQSP8/B97lnBRx7ZJ6AYdwfOI79fpB7UXEkUOyY7bVcE2FiF
	9PNlpnr5UcAk/d/wiLAjOxVB1ACysiQkHjJ7d5GGtQrk8J/ZBOU3KWzSfUGd1+UnVN+C+ef7SjGBz
	EPnSigb0Y7ZB9yWKAPauPd5kz9BW6MY//BiWwuPY9jXsmHYhLAupTYZ8FrPqhMizMtw418ZaPlOr9
	BM073HfZqj2Q6qZ+zYyORz94EAtbupGQof+stJrxVG05xWqHcFi+uCTrKE14n+xYTeRggDny6xDFS
	+K9aRU1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo4fJ-00000008Mi3-2Yy7;
	Mon, 18 Aug 2025 18:33:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo44b-00000008GEk-1NaU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 17:55:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7E6D5601E0;
	Mon, 18 Aug 2025 17:55:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A47FDC4CEEB;
	Mon, 18 Aug 2025 17:55:04 +0000 (UTC)
Date: Mon, 18 Aug 2025 18:55:02 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
	arnd@arndb.de, will@kernel.org, peterz@infradead.org,
	akpm@linux-foundation.org, mark.rutland@arm.com,
	harisokn@amazon.com, cl@gentwo.org, ast@kernel.org,
	memxor@gmail.com, zhenglifeng1@huawei.com,
	xueshuai@linux.alibaba.com, joao.m.martins@oracle.com,
	boris.ostrovsky@oracle.com, konrad.wilk@oracle.com,
	rafael@kernel.org, daniel.lezcano@linaro.org
Subject: Re: [PATCH v3 1/5] asm-generic: barrier: Add
 smp_cond_load_relaxed_timewait()
Message-ID: <aKNo9pxx2w9sjJjc@arm.com>
References: <20250627044805.945491-1-ankur.a.arora@oracle.com>
 <20250627044805.945491-2-ankur.a.arora@oracle.com>
 <aJXWyxzkA3x61fKA@arm.com>
 <877bz98sqb.fsf@oracle.com>
 <aJy414YufthzC1nv@arm.com>
 <87bjoi2wdf.fsf@oracle.com>
 <aJ3K4tQCztOXF6hO@arm.com>
 <87plctwq7x.fsf@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87plctwq7x.fsf@oracle.com>
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

On Sun, Aug 17, 2025 at 03:14:26PM -0700, Ankur Arora wrote:
> So, I tried to pare back the code and the following (untested) is
> what I came up with. Given the straight-forward rate-limiting, and the
> current users not needing accurate timekeeping, this uses a
> bool time_check_expr. Figured I'd keep it simple until someone actually
> needs greater complexity as you suggested.
> 
> diff --git a/include/asm-generic/barrier.h b/include/asm-generic/barrier.h
> index d4f581c1e21d..e8793347a395 100644
> --- a/include/asm-generic/barrier.h
> +++ b/include/asm-generic/barrier.h
> @@ -273,6 +273,34 @@ do {                                                                       \
>  })
>  #endif
> 
> +
> +#ifndef SMP_TIMEWAIT_SPIN_COUNT
> +#define SMP_TIMEWAIT_SPIN_COUNT                200
> +#endif
> +
> +#ifndef smp_cond_load_relaxed_timewait
> +#define smp_cond_load_relaxed_timewait(ptr, cond_expr,                 \
> +                                       time_check_expr)                \
> +({                                                                     \
> +       typeof(ptr) __PTR = (ptr);                                      \
> +       __unqual_scalar_typeof(*ptr) VAL;                               \
> +       u32 __n = 0, __spin = SMP_TIMEWAIT_SPIN_COUNT;                  \
> +                                                                       \
> +       for (;;) {                                                      \
> +               VAL = READ_ONCE(*__PTR);                                \
> +               if (cond_expr)                                          \
> +                       break;                                          \
> +               cpu_relax();                                            \
> +               if (++__n < __spin)                                     \
> +                       continue;                                       \
> +               if ((time_check_expr))                                  \
> +                       break;                                          \
> +               __n = 0;                                                \
> +       }                                                               \
> +       (typeof(*ptr))VAL;                                              \
> +})
> +#endif

This looks fine, at least as it would be used by poll_idle(). The only
reason for not folding time_check_expr into cond_expr is the poll_idle()
requirement to avoid calling time_check_expr too often.

> diff --git a/arch/arm64/include/asm/barrier.h b/arch/arm64/include/asm/barrier.h
> index f5801b0ba9e9..c9934ab68da2 100644
> --- a/arch/arm64/include/asm/barrier.h
> +++ b/arch/arm64/include/asm/barrier.h
> @@ -219,6 +219,43 @@ do {                                                                       \
>         (typeof(*ptr))VAL;                                              \
>  })
> 
> +extern bool arch_timer_evtstrm_available(void);
> +
> +#ifndef SMP_TIMEWAIT_SPIN_COUNT
> +#define SMP_TIMEWAIT_SPIN_COUNT                200
> +#endif
> +
> +#define smp_cond_load_relaxed_timewait(ptr, cond_expr,                 \
> +                                         time_check_expr)              \
> +({                                                                     \
> +       typeof(ptr) __PTR = (ptr);                                      \
> +       __unqual_scalar_typeof(*ptr) VAL;                               \
> +       u32 __n = 0, __spin = 0;                                        \
> +       bool __wfet = alternative_has_cap_unlikely(ARM64_HAS_WFXT);     \
> +       bool __wfe = arch_timer_evtstrm_available();                    \
> +       bool __wait = false;                                            \
> +                                                                       \
> +       if (__wfet || __wfe)                                            \
> +               __wait = true;                                          \
> +       else                                                            \
> +               __spin = SMP_TIMEWAIT_SPIN_COUNT;                       \
> +                                                                       \
> +       for (;;) {                                                      \
> +               VAL = READ_ONCE(*__PTR);                                \
> +               if (cond_expr)                                          \
> +                       break;                                          \
> +               cpu_relax();                                            \
> +               if (++__n < __spin)                                     \
> +                       continue;                                       \
> +               if ((time_check_expr))                                  \
> +                       break;                                          \
> +               if (__wait)                                             \
> +                       __cmpwait_relaxed(__PTR, VAL);                  \
> +               __n = 0;                                                \
> +       }                                                               \
> +       (typeof(*ptr))VAL;                                              \
> +})

For arm64, I wouldn't bother with the spin count. Since cpu_relax()
doesn't do anything, I doubt it makes any difference, especially as we
are likely to use WFE anyway. If we do add one, I'd like it backed by
some numbers to show it makes a difference in practice.

The question is whether 100us granularity is good enough for poll_idle()
(I came to the conclusion it's fine for rqspinlock, given their 1ms
deadlock check).

>  #include <asm-generic/barrier.h>
> 
> __cmpwait_relaxed() will need adjustment to set a deadline for WFET.

Yeah, __cmpwait_relaxed() doesn't use WFET as it doesn't need a timeout
(it just happens to have one with the event stream).

We could extend this or create a new one that uses WFET and takes an
argument. If extending this one, for example a timeout argument of 0
means WFE, non-zero means WFET cycles. This adds a couple of more
instructions.

What I had in mind of time_expr was a ktime_t would be something like:

	for (;;) {
		VAL = READ_ONCE(*__PTR);
		if (cond_expr)
			break;

		cycles = some_func_of(time_expr);	// see __udelay()
		if (cycles <= 0)
			break;

		if (__wfet) {
			__cmpwait_relaxed(__PTR, VAL, get_cycles() + cycles);
		} else if (__wfe && cycles >= timer_evt_period) {
			__cmpwait_relaxed(__PTR, VAL, 0);
		} else {
			cpu_relax();
		}
	}

Now, if we don't care about the time check granularity (for now) and
time_check_expr is a bool (this seems to work better for rqspinlock), I
think we could do something like:

	for (;;) {
		VAL = READ_ONCE(*__PTR);
		if (cond_expr)
			break;
		if (time_check_expr)
			break;

		if (__wfe) {
			__cmpwait_relaxed(__PTR, VAL, 0);
		} else if (__wfet) {
			__cmpwait_relaxed(__PTR, VAL, get_cycles() + timer_evt_period);
		} else {
			cpu_relax();
		}
	}

We go with WFE first in this case to avoid get_cycles() unnecessarily.

I'd suggest we add the WFET support in __cmpwait_relaxed() (or a
different function) as a separate patch, doesn't even need to be part of
this series. WFE is good enough to get things moving. WFET will only
make a difference if (1) we disable the event stream or (2) we need
better accuracy of the timeout.

> AFAICT the rqspinlock code should be able to work by specifying something
> like:
>   ((ktime_get_mono_fast_ns() > tval)) || (deadlock_check(&lock_context)))
> as the time_check_expr.

Why not the whole RES_CHECK_TIMEOUT(...) as in rqspinlock.c? It does the
deadlock check only after a timeout over a millisecond. Just follow the
res_atomic_cond_read_acquire() calls but replace '||' with a comma.

> I think they also want to rate limit how often deadlock_check() is
> called, so they can redefine SMP_TIMEWAIT_SPIN_COUNT to some large
> value for arm64.

Everyone would want a different rate of checking other stuff, so I think
this needs to go in their time_check_expr.

-- 
Catalin

