Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B92FC87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 10:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IFhny3VFiboY054+1efvXUQLDCPYLfS+4nn6nUu8P+s=; b=EvofpAG1xHABZEQx3pqMA9V4MQ
	n8vSJGycJIQzklH86XRvpkdqkLXXNqF/+wH7/HCo4+wPJ4uk0vjMkyU1ewMmslYyerP9ARli2vy/k
	HKuf0XbyRqNbeDqCfmO+cguaXfNCGcsp9qwAldQquzqbLTzOo3ofJ1F2MLvphsm1/CDRa7F4TzADN
	pQqqIUIW+OnCfXmshpTM/YbodvGc8vkOZu0AMO6r0PpvRKhE7NCzbSFrwtUOQGqgv1j1dMi76UlsC
	f34IWdXLh/GZtfghIE41gU6aiG0JMit7IELzzUltg6m3uLbP9wgTdcPJs4VueKnnEXDSjML7EuJYf
	IgPYge3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukKk8-00000002cia-41Vr;
	Fri, 08 Aug 2025 10:54:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukKhe-00000002cWo-0Mpl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 10:52:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9CD7F44404;
	Fri,  8 Aug 2025 10:52:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48690C4CEED;
	Fri,  8 Aug 2025 10:51:58 +0000 (UTC)
Date: Fri, 8 Aug 2025 11:51:55 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
	arnd@arndb.de, will@kernel.org, peterz@infradead.org,
	akpm@linux-foundation.org, mark.rutland@arm.com,
	harisokn@amazon.com, cl@gentwo.org, ast@kernel.org,
	memxor@gmail.com, zhenglifeng1@huawei.com,
	xueshuai@linux.alibaba.com, joao.m.martins@oracle.com,
	boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Subject: Re: [PATCH v3 1/5] asm-generic: barrier: Add
 smp_cond_load_relaxed_timewait()
Message-ID: <aJXWyxzkA3x61fKA@arm.com>
References: <20250627044805.945491-1-ankur.a.arora@oracle.com>
 <20250627044805.945491-2-ankur.a.arora@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627044805.945491-2-ankur.a.arora@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_035202_167785_B98DC99F 
X-CRM114-Status: GOOD (  34.56  )
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

On Thu, Jun 26, 2025 at 09:48:01PM -0700, Ankur Arora wrote:
> diff --git a/include/asm-generic/barrier.h b/include/asm-generic/barrier.h
> index d4f581c1e21d..d33c2701c9ee 100644
> --- a/include/asm-generic/barrier.h
> +++ b/include/asm-generic/barrier.h
> @@ -273,6 +273,101 @@ do {									\
>  })
>  #endif
>  
> +#ifndef SMP_TIMEWAIT_SPIN_BASE
> +#define SMP_TIMEWAIT_SPIN_BASE		16
> +#endif
> +
> +/*
> + * Policy handler that adjusts the number of times we spin or
> + * wait for cacheline to change before evaluating the time-expr.
> + *
> + * The generic version only supports spinning.
> + */
> +static inline u64 ___smp_cond_spinwait(u64 now, u64 prev, u64 end,
> +				       u32 *spin, bool *wait, u64 slack)
> +{
> +	if (now >= end)
> +		return 0;
> +
> +	*spin = SMP_TIMEWAIT_SPIN_BASE;
> +	*wait = false;
> +	return now;
> +}
> +
> +#ifndef __smp_cond_policy
> +#define __smp_cond_policy ___smp_cond_spinwait
> +#endif
> +
> +/*
> + * Non-spin primitive that allows waiting for stores to an address,
> + * with support for a timeout. This works in conjunction with an
> + * architecturally defined policy.
> + */
> +#ifndef __smp_timewait_store
> +#define __smp_timewait_store(ptr, val)	do { } while (0)
> +#endif
> +
> +#ifndef __smp_cond_load_relaxed_timewait
> +#define __smp_cond_load_relaxed_timewait(ptr, cond_expr, policy,	\
> +					 time_expr, time_end,		\
> +					 slack) ({			\
> +	typeof(ptr) __PTR = (ptr);					\
> +	__unqual_scalar_typeof(*ptr) VAL;				\
> +	u32 __n = 0, __spin = SMP_TIMEWAIT_SPIN_BASE;			\
> +	u64 __prev = 0, __end = (time_end);				\
> +	u64 __slack = slack;						\
> +	bool __wait = false;						\
> +									\
> +	for (;;) {							\
> +		VAL = READ_ONCE(*__PTR);				\
> +		if (cond_expr)						\
> +			break;						\
> +		cpu_relax();						\
> +		if (++__n < __spin)					\
> +			continue;					\
> +		if (!(__prev = policy((time_expr), __prev, __end,	\
> +					  &__spin, &__wait, __slack)))	\
> +			break;						\
> +		if (__wait)						\
> +			__smp_timewait_store(__PTR, VAL);		\
> +		__n = 0;						\
> +	}								\
> +	(typeof(*ptr))VAL;						\
> +})
> +#endif

TBH, this still looks over-engineered to me, especially with the second
patch trying to reduce the spin loops based on the remaining time. Does
any of the current users of this interface need it to get more precise?

Also I feel the spinning added to poll_idle() is more of an architecture
choice as some CPUs could not cope with local_clock() being called too
frequently. The above generic implementation takes a spin into
consideration even if an arch implementation doesn't need it (e.g. WFET
or WFE). Yes, the arch policy could set a spin of 0 but it feels overly
complicated for the generic implementation.

Can we instead have the generic implementation without any spinning?
Just polling a variable with cpu_relax() like
smp_cond_load_acquire/relaxed() with the additional check for time. We
redefine it in the arch code.

> +#define __check_time_types(type, a, b)			\
> +		(__same_type(typeof(a), type) &&	\
> +		 __same_type(typeof(b), type))
> +
> +/**
> + * smp_cond_load_relaxed_timewait() - (Spin) wait for cond with no ordering
> + * guarantees until a timeout expires.
> + * @ptr: pointer to the variable to wait on
> + * @cond: boolean expression to wait for
> + * @time_expr: monotonic expression that evaluates to the current time
> + * @time_end: end time, compared against time_expr
> + * @slack: how much timer overshoot can the caller tolerate?
> + * Useful for when we go into wait states. A value of 0 indicates a high
> + * tolerance.
> + *
> + * Note that all times (time_expr, time_end, and slack) are in microseconds,
> + * with no mandated precision.
> + *
> + * Equivalent to using READ_ONCE() on the condition variable.
> + */
> +#define smp_cond_load_relaxed_timewait(ptr, cond_expr, time_expr,	\
> +				       time_end, slack) ({		\
> +	__unqual_scalar_typeof(*ptr) _val;				\
> +	BUILD_BUG_ON_MSG(!__check_time_types(u64, time_expr, time_end),	\
> +			 "incompatible time units");			\
> +	_val = __smp_cond_load_relaxed_timewait(ptr, cond_expr,		\
> +						__smp_cond_policy,	\
> +						time_expr, time_end,	\
> +						slack);			\
> +	(typeof(*ptr))_val;						\
> +})

Looking at the current user of the acquire variant - rqspinlock, it does
not even bother with a time_expr but rather added the time condition to
cond_expr. I don't think it has any "slack" requirements, only that
there's no deadlock eventually.

About poll_idle(), are there any slack requirement or we get away
without?

I think we have two ways forward (well, at least):

1. Clearly define what time_end is and we won't need a time_expr at all.
   This may work for poll_idle(), not sure about rqspinlock. The
   advantage is that we can drop the 'slack' argument since none of the
   current users seem to need it. The downside is that we need to know
   exactly what this time_end is to convert it to timer cycles for a
   WFET implementation on arm64.

2. Drop time_end and only leave time_expr as a bool (we don't care
   whether it uses ns, jiffies or whatever underneath, it's just a
   bool). In this case, we could use a 'slack' argument mostly to make a
   decision on whether we use WFET, WFE or just polling with
   cpu_relax(). For WFET, the wait time would be based on the slack
   value rather than some absolute end time which we won't have.

I'd go with (2), it looks simpler. Maybe even drop the 'slack' argument
for the time being until we have a clear user. The fallback on arm64
would be from wfe (if event streaming available), wfet with the same
period as the event stream (in the absence of a slack argument) or
cpu_relax().

-- 
Catalin

