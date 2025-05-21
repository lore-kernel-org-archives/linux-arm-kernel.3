Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67748C54E71
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 18:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MjLMBlisobMsFr+5HBXUEdXHhEOEGqVYPUicHiCYiEQ=; b=sCO61eebOhDccsGcwty7YnidsO
	aaMAWZR17lD7zZCZJ4BeVtAo7NsUx5B6p4VRDKiKEZRS1LdPgPJXKGIjIbwxNRsgyG0S7BCu/N0Zl
	SpVc489hUysfRSxbH4VT5hWvC0G/HzxQE2j0pnodWSpyE9rNMJDS6IFPGD8Y1i2CBHxWDkIQBW2Ov
	QAvaFYDKr3hp76IIHvJNnhLolyG7RR7UJotMLZu206B5kmpVdAG2/tswujtROeNBYQNCl/FQRDB1q
	OdyK8XluCpLYQtUDiznP2+qzjw8pJfd3wixanPqFdFrFs0ONbMEGs6wwm+KQtzpFGpHwcLQ2hGEnj
	Uhqt69/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHoMB-0000000GfTq-1gmE;
	Wed, 21 May 2025 18:39:59 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHoK0-0000000GfJm-2XIW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 18:37:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 413FFA4F1EF;
	Wed, 21 May 2025 18:37:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1811C4CEE4;
	Wed, 21 May 2025 18:37:39 +0000 (UTC)
Date: Wed, 21 May 2025 19:37:37 +0100
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
Subject: Re: [PATCH v2 1/7] asm-generic: barrier: add
 smp_cond_load_relaxed_timewait()
Message-ID: <aC4dcZ2veeavM2dR@arm.com>
References: <20250502085223.1316925-1-ankur.a.arora@oracle.com>
 <20250502085223.1316925-2-ankur.a.arora@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502085223.1316925-2-ankur.a.arora@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_113744_774703_282569A9 
X-CRM114-Status: GOOD (  29.26  )
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

Hi Ankur,

Sorry, it took me some time to get back to this series (well, I tried
once and got stuck on what wait_policy is supposed to mean, so decided
to wait until I had more coffee ;)).

On Fri, May 02, 2025 at 01:52:17AM -0700, Ankur Arora wrote:
> diff --git a/include/asm-generic/barrier.h b/include/asm-generic/barrier.h
> index d4f581c1e21d..a7be98e906f4 100644
> --- a/include/asm-generic/barrier.h
> +++ b/include/asm-generic/barrier.h
> @@ -273,6 +273,64 @@ do {									\
>  })
>  #endif
>  
> +/*
> + * Non-spin primitive that allows waiting for stores to an address,
> + * with support for a timeout. This works in conjunction with an
> + * architecturally defined wait_policy.
> + */
> +#ifndef __smp_timewait_store
> +#define __smp_timewait_store(ptr, val) do { } while (0)
> +#endif
> +
> +#ifndef __smp_cond_load_relaxed_timewait
> +#define __smp_cond_load_relaxed_timewait(ptr, cond_expr, wait_policy,	\
> +					 time_expr, time_end) ({	\
> +	typeof(ptr) __PTR = (ptr);					\
> +	__unqual_scalar_typeof(*ptr) VAL;				\
> +	u32 __n = 0, __spin = 0;					\
> +	u64 __prev = 0, __end = (time_end);				\
> +	bool __wait = false;						\
> +									\
> +	for (;;) {							\
> +		VAL = READ_ONCE(*__PTR);				\
> +		if (cond_expr)						\
> +			break;						\
> +		cpu_relax();						\
> +		if (++__n < __spin)					\
> +			continue;					\
> +		if (!(__prev = wait_policy((time_expr), __prev, __end,	\
> +					  &__spin, &__wait)))		\
> +			break;						\
> +		if (__wait)						\
> +			__smp_timewait_store(__PTR, VAL);		\
> +		__n = 0;						\
> +	}								\
> +	(typeof(*ptr))VAL;						\
> +})
> +#endif
> +
> +/**
> + * smp_cond_load_relaxed_timewait() - (Spin) wait for cond with no ordering
> + * guarantees until a timeout expires.
> + * @ptr: pointer to the variable to wait on
> + * @cond: boolean expression to wait for
> + * @wait_policy: policy handler that adjusts the number of times we spin or
> + *  wait for cacheline to change (depends on architecture, not supported in
> + *  generic code.) before evaluating the time-expr.
> + * @time_expr: monotonic expression that evaluates to the current time
> + * @time_end: compared against time_expr
> + *
> + * Equivalent to using READ_ONCE() on the condition variable.
> + */
> +#define smp_cond_load_relaxed_timewait(ptr, cond_expr, wait_policy,	\
> +					 time_expr, time_end) ({	\
> +	__unqual_scalar_typeof(*ptr) _val;;				\
> +	_val = __smp_cond_load_relaxed_timewait(ptr, cond_expr,		\
> +					      wait_policy, time_expr,	\
> +					      time_end);		\
> +	(typeof(*ptr))_val;						\
> +})

IIUC, a generic user of this interface would need a wait_policy() that
is aware of the arch details (event stream, WFET etc.), given the
__smp_timewait_store() implementation in patch 3. This becomes clearer
in patch 7 where one needs to create rqspinlock_cond_timewait().

The __spin count can be arch specific, not part of some wait_policy,
even if such policy is most likely implemented in the arch code (as the
generic caller has no clue what it means). The __wait decision, again, I
don't think it should be the caller of this API to decide how to handle,
it's something internal to the API implementation based on whether the
event stream (or later WFET) is available.

The ___cond_timewait() implementation in patch 4 sets __wait if either
the event stream of WFET is available. However, __smp_timewait_store()
only uses WFE as per the __cmpwait_relaxed() implementation. So you
can't really decouple wait_policy() from how the spinning is done, in an
arch-specific way. In this implementation, wait_policy() would need to
say how to wait - WFE, WFET. That's not captured (and I don't think it
should, we can't expand the API every time we have a new method of
waiting).

I still think this interface can be simpler and fairly generic, not with
wait_policy specific to rqspinlock or poll_idle. Maybe you can keep a
policy argument for an internal __smp_cond_load_relaxed_timewait() if
it's easier to structure the code this way but definitely not for
smp_cond_*().

Another aspect I'm not keen on is the arbitrary fine/coarse constants.
Can we not have the caller pass a slack value (in ns or 0 if it doesn't
care) to smp_cond_load_relaxed_timewait() and let the arch code decide
which policy to use?

In summary, I see the API something like:

#define smp_cond_load_relaxed_timewait(ptr, cond_expr,
				       time_expr, time_end, slack_ns)

We can even drop time_end if we capture it in time_expr returning a bool
(like we do with cond_expr).

Thanks.

-- 
Catalin

