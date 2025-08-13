Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 915B6C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 17:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cpX/5/hqjExM51ev8WXXPlf2sbWq8Ohb8LIuGpo5QF4=; b=hqUcGNkQfIbXUGmfbPv6kxWMMR
	CghT4GWiqZFi07JV2nXtyipP7oFr1w9Sk3IB2VIbUKFj1PWZBzceWDqX+UwV0XKHKfyauwRjE+zEQ
	itk6c/l052yOQbj8pNaXV/bLK/XTeI02pIYC0tLmOnzEtL4v2DyyEv+yJ/dQSbxRw1qrGVnR0WVv5
	6VlfwQ7PFBLgZCs04/4mCIcdLsOCVpBrhGKeMeAg3uRtor703dfcM6s1b7XsQ5LGIKUovBb3WQ93O
	Ev+7HwB04QNJNQLsnrqiyY0xslJQh1YWbEVJ588eA261eCPJDDW6LnNJRev9iqJKnQEIFpPe75fQC
	7BzER/mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umF1O-0000000EYR0-1lGE;
	Wed, 13 Aug 2025 17:12:18 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umE3D-0000000EKMz-1ccI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 16:10:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 14062A57E12;
	Wed, 13 Aug 2025 16:10:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39C8CC4CEEB;
	Wed, 13 Aug 2025 16:10:02 +0000 (UTC)
Date: Wed, 13 Aug 2025 17:09:59 +0100
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
Message-ID: <aJy414YufthzC1nv@arm.com>
References: <20250627044805.945491-1-ankur.a.arora@oracle.com>
 <20250627044805.945491-2-ankur.a.arora@oracle.com>
 <aJXWyxzkA3x61fKA@arm.com>
 <877bz98sqb.fsf@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877bz98sqb.fsf@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_091007_564074_1F2CCDEA 
X-CRM114-Status: GOOD (  75.51  )
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

On Mon, Aug 11, 2025 at 02:15:56PM -0700, Ankur Arora wrote:
> Catalin Marinas <catalin.marinas@arm.com> writes:
> > On Thu, Jun 26, 2025 at 09:48:01PM -0700, Ankur Arora wrote:
> >> +#ifndef __smp_cond_load_relaxed_timewait
> >> +#define __smp_cond_load_relaxed_timewait(ptr, cond_expr, policy,	\
> >> +					 time_expr, time_end,		\
> >> +					 slack) ({			\
> >> +	typeof(ptr) __PTR = (ptr);					\
> >> +	__unqual_scalar_typeof(*ptr) VAL;				\
> >> +	u32 __n = 0, __spin = SMP_TIMEWAIT_SPIN_BASE;			\
> >> +	u64 __prev = 0, __end = (time_end);				\
> >> +	u64 __slack = slack;						\
> >> +	bool __wait = false;						\
> >> +									\
> >> +	for (;;) {							\
> >> +		VAL = READ_ONCE(*__PTR);				\
> >> +		if (cond_expr)						\
> >> +			break;						\
> >> +		cpu_relax();						\
> >> +		if (++__n < __spin)					\
> >> +			continue;					\
> >> +		if (!(__prev = policy((time_expr), __prev, __end,	\
> >> +					  &__spin, &__wait, __slack)))	\
> >> +			break;						\
> >> +		if (__wait)						\
> >> +			__smp_timewait_store(__PTR, VAL);		\
> >> +		__n = 0;						\
> >> +	}								\
> >> +	(typeof(*ptr))VAL;						\
> >> +})
> >> +#endif
> >
> > TBH, this still looks over-engineered to me, especially with the second
> > patch trying to reduce the spin loops based on the remaining time. Does
> > any of the current users of this interface need it to get more precise?
> 
> No, neither of rqspinlock nor poll_idle() really care about precision.
> And, the slack even in this series is only useful for the waiting
> implementation.

I pretty much came to the same conclusion. I guess it depends on how we
implement it. With WFET, the precision depends on the hardware clock.
For WFE, we could use the 100us event stream only or we could do like
__delay() and fall back to busy spinning for smaller (or end of)
intervals.

The spinning variant may have some random slack depending on how long it
loops before checking the clock.

> > Also I feel the spinning added to poll_idle() is more of an architecture
> > choice as some CPUs could not cope with local_clock() being called too
> > frequently.
> 
> Just on the frequency point -- I think it might be a more general
> problem that just on specific architectures.
> 
> Architectures with GENERIC_SCHED_CLOCK could use a multitude of
> clocksources and from a quick look some of them do iomem reads.
> (AFAICT GENERIC_SCHED_CLOCK could also be selected by the clocksource
> itself, so an architecture header might not need to be an arch choice
> at  all.)
> 
> Even for something like x86 which doesn't use GENERIC_SCHED_CLOCK,
> we might be using tsc or jiffies or paravirt-clock all of which would
> have very different performance characteristics. Or, just using a
> clock more expensive than local_clock(); rqspinlock uses
> ktime_get_mono_fast_ns().
> 
> So, I feel we do need a generic rate limiter.

That's a good point but the rate limiting is highly dependent on the
architecture, what a CPU does in the loop, how fast a loop iteration is.
That's why I'd keep it hidden in the arch code.

> > The above generic implementation takes a spin into
> > consideration even if an arch implementation doesn't need it (e.g. WFET
> > or WFE). Yes, the arch policy could set a spin of 0 but it feels overly
> > complicated for the generic implementation.
> 
> Agree with the last point. My thought was that it might be okay to always
> optimistically spin a little, just because WFE*/MWAITX etc might (?)
> have a entry/exit cost even when the wakeup is immediate.

They key is whether the cost is more expensive than some spinning. On
arm64, cpu_relax() doesn't do anything, so WFE is not any worse even if
it exits immediately (e.g. a SEVL+WFE loop). The only benefit would be
if the cost of local_clock() is more expensive than some busy spinning.
The arch code is better placed to know what kind of spinning is best.

> Though the code is wrong in that it always waits right after evaluating
> the policy. I should have done something like this instead:
> 
> +#define __smp_cond_load_relaxed_timewait(ptr, cond_expr, policy,       \
> +                                        time_expr, time_end,           \
> +                                        slack) ({                      \
> +       typeof(ptr) __PTR = (ptr);                                      \
> +       __unqual_scalar_typeof(*ptr) VAL;                               \
> +       u32 __n = 0, __spin = SMP_TIMEWAIT_SPIN_BASE;                   \
> +       u64 __prev = 0, __end = (time_end);                             \
> +       u64 __slack = slack;                                            \
> +       bool __wait = false;                                            \
> +                                                                       \
> +       for (;;) {                                                      \
> +               VAL = READ_ONCE(*__PTR);                                \
> +               if (cond_expr)                                          \
> +                       break;                                          \
> +               cpu_relax();                                            \
> +               if (++__n < __spin)                                     \
> +                       continue;                                       \
> +               if (__wait)                                             \
> +                       __smp_timewait_store(__PTR, VAL);               \
> +               if (!(__prev = policy((time_expr), __prev, __end,       \
> +                                         &__spin, &__wait, __slack)))  \
> +                       break;                                          \
> +               __n = 0;                                                \
> +       }                                                               \
> +       (typeof(*ptr))VAL;                                              \
> +})

I think both variants work just fine. The original one made more sense
with waiting immediately after the policy decided that it is needed.
With the above, you go through the loop one more time before detecting
__wait == true.

I thought the current __smp_cond_load_acquire_timewait() is not doing
the right thing but it does check cond_expr immediately after exiting
__cmpwait_relaxed() (if no timeout), so no unnecessary waiting.

> >> +#define __check_time_types(type, a, b)			\
> >> +		(__same_type(typeof(a), type) &&	\
> >> +		 __same_type(typeof(b), type))
> >> +
> >> +/**
> >> + * smp_cond_load_relaxed_timewait() - (Spin) wait for cond with no ordering
> >> + * guarantees until a timeout expires.
> >> + * @ptr: pointer to the variable to wait on
> >> + * @cond: boolean expression to wait for
> >> + * @time_expr: monotonic expression that evaluates to the current time
> >> + * @time_end: end time, compared against time_expr
> >> + * @slack: how much timer overshoot can the caller tolerate?
> >> + * Useful for when we go into wait states. A value of 0 indicates a high
> >> + * tolerance.
> >> + *
> >> + * Note that all times (time_expr, time_end, and slack) are in microseconds,
> >> + * with no mandated precision.
> >> + *
> >> + * Equivalent to using READ_ONCE() on the condition variable.
> >> + */
> >> +#define smp_cond_load_relaxed_timewait(ptr, cond_expr, time_expr,	\
> >> +				       time_end, slack) ({		\
> >> +	__unqual_scalar_typeof(*ptr) _val;				\
> >> +	BUILD_BUG_ON_MSG(!__check_time_types(u64, time_expr, time_end),	\
> >> +			 "incompatible time units");			\
> >> +	_val = __smp_cond_load_relaxed_timewait(ptr, cond_expr,		\
> >> +						__smp_cond_policy,	\
> >> +						time_expr, time_end,	\
> >> +						slack);			\
> >> +	(typeof(*ptr))_val;						\
> >> +})
> >
> > Looking at the current user of the acquire variant - rqspinlock, it does
> > not even bother with a time_expr but rather added the time condition to
> > cond_expr. I don't think it has any "slack" requirements, only that
> > there's no deadlock eventually.
> 
> So, that code only uses smp_cond_load_*_timewait() on arm64. Everywhere
> else it just uses smp_cond_load_acquire() and because it jams both
> of these interfaces together, it doesn't really use time_expr.
> 
> But, it needs more extensive rework so all platforms can use
> __smp_cond_load_acquire_timewait with the deadlock check folded
> inside its own policy handler.

We can have a generic:

#define smp_cond_load_acquire_timewait(ptr, cond_expr, time_expr) \
	smp_cond_load_acquire(ptr, (cond_expr) || (time_expr))

with some big comment that it may deadlock if an architecture does not
regularly check timer_expr in the absence of a *ptr update.

Alternatively, just define res_smp_cond_load_acquire() in the bpf code
to take separate cond_expr and time_expr and do an 'or' between them in
the default implementation.

> > About poll_idle(), are there any slack requirement or we get away
> > without?
> 
> I don't believe there are any slack requirements. Definitely not for
> rqspinlock (given that it has a large timeout) and I believe also
> not for poll_idle() since a timeout delay only leads to a slightly
> delayed deeper sleep.
> 
> Question for Rafael, Daniel: With smp_cond_load_relaxed_timewait(), when
> used in waiting mode instead of via the usual cpu_relax() spin, we
> could overshoot by an architecturally defined granularity.
> On arm64, that could be ~100us in the worst case. Do we have hard
> requirements about timer overshoot in poll_idle()?

I can see a CPUIDLE_POLL_MIN and MAX defined as 10us and 250us
respectively (for a HZ of 250). Not sure it matters if we overshoot by
100us. If it does, we should do like the __delay() implementation with a
fall-back to a busy loop.

> > I think we have two ways forward (well, at least):
> >
> > 1. Clearly define what time_end is and we won't need a time_expr at all.
> >    This may work for poll_idle(), not sure about rqspinlock. The
> >    advantage is that we can drop the 'slack' argument since none of the
> >    current users seem to need it. The downside is that we need to know
> >    exactly what this time_end is to convert it to timer cycles for a
> >    WFET implementation on arm64.
> >
> > 2. Drop time_end and only leave time_expr as a bool (we don't care
> >    whether it uses ns, jiffies or whatever underneath, it's just a
> >    bool). In this case, we could use a 'slack' argument mostly to make a
> >    decision on whether we use WFET, WFE or just polling with
> >    cpu_relax(). For WFET, the wait time would be based on the slack
> >    value rather than some absolute end time which we won't have.
> >
> > I'd go with (2), it looks simpler. Maybe even drop the 'slack' argument
> > for the time being until we have a clear user. The fallback on arm64
> > would be from wfe (if event streaming available), wfet with the same
> > period as the event stream (in the absence of a slack argument) or
> > cpu_relax().
> 
> So I like the approach with (2) quite a bit. It'll simplify the time
> handling quite nicely. And, I think it is also good to drop slack
> unless there's a use for it.
> 
> There's just one problem, which is that a notion of time-remaining
> still seems quite important to me. Without it, it's difficult to know
> how often to do the time-check etc. I could use an arbitrary
> parameter, say evaluate time_expr once every N cpu_relax() loops etc
> but that seems worse than the current approach.
> 
> So, how about replacing the bool time_expr, with a time_remaining_expr
> (s32) which evaluates to a fixed time unit (ns).

I'd use ktime_t instead of s32. It is already signed and can represent
(negative) time deltas. The downside is that we need to use
ns_to_ktime() etc. for conversion.

However, in the absence of some precision requirement for the potential
two users of this interface, I think we complicate things unnecessarily.
The only advantage is if you want to make it future proof, in case we
ever need more precision.

> This also gives the WFET a clear end time (though it would still need
> to be converted to timer cycles) but the WFE path could stay simple
> by allowing an overshoot instead of falling back to polling.

For arm64, both WFE and WFET would be woken up by the event stream
(which is enabled on all production systems). The only reason to use
WFET is if you need smaller granularity than the event stream period
(100us). In this case, we should probably also add a fallback from WFE
to a busy loop.

-- 
Catalin

