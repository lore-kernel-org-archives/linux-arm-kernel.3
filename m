Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1926CCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 09:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vhLkLTolbyFKFrJFgOsn5aZNEw5iIaEfKoEnlONf3Ys=; b=wSm93P14k4f0sKDoFnf20ZQFsy
	le+m9s3Qz/L9J49gmweXUuD16kUZ7V4phHC+c1L2HcJ0j/wwWLKTo6DFFOOB+lnrNUa+10TYo1/1D
	MybYF4KgF0185zkqIaWBlsCoYqC1LX5Xz4GcjmtshybrkYhlkywOtcJP0Qg4F59g8dH6TLOxh7wNm
	2MB1yHrGZ8XA6xIc8YA+mU1kJUoHBVzidKbhiksZoLc+eVutKdUkPUzEkxjCNFljNdOaFcd1RZ9jM
	BolT1N+EmxlOgvOXdge4LiO0ineN/3/VVt3+qQGirGarHGSqkmtgKJMbiQswiIAcSVXD7ptOH1+ob
	YmyYXmvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKvU0-00000003PxV-3Y3D;
	Thu, 07 May 2026 09:57:28 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKvTy-00000003PwS-04fS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 09:57:27 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-488ad135063so5861635e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 02:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778147843; x=1778752643; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vhLkLTolbyFKFrJFgOsn5aZNEw5iIaEfKoEnlONf3Ys=;
        b=cb39xyw12q/5F7ubLrK9HJBptEPlg0TceEzgL4neXVy+Dv5ncgWkHhLgpMiDw4Ouwu
         GWaxJVgHXNpbfaAv8yqf0ivZiwujVVuFIdnKOY9CZK/oMleOU/DTqeh5mHB1dE/2Bw83
         KV2D5PqvQV3YG6Avo8YpW5g+a/JxQd6DtLRFFVTPne8MmUtWQFoxxtD33Q9lRnON2qwt
         p7syByG4Q9gGzovYxHsj6FRosCLpGrfVSuY/l4jbRMx/kouCw6Ssd0nEPY7EKmizc7qi
         99oB8nFxMA8BGUZn4NlQIDNT0rHY6P+Sj4vssmhBlYnOAsXZnOSx5K6l+IV6yylTXemL
         NULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778147843; x=1778752643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vhLkLTolbyFKFrJFgOsn5aZNEw5iIaEfKoEnlONf3Ys=;
        b=lx0IEht3AXGeueFpeGjykeiZt5wUwJgzbooZhrfUy+7BlzOnP6t6COH78V77b/UCPJ
         m+HLEeMTZMsdjTQCB3Y3bfo8YMb8zdTD8doAF9Vh3fFpbjjIHVZowxdghOdBN1eVdYjv
         ZCjXzdoKVOOxDJ/qqDQVywCMwhnCEAA8dZDJyxv3u9PVfK9IqKfoU6euF6KROLO+n+JR
         LecYNZO3p446Bn0bpBr90wt875g3zfIhxgDg34ONzm01Ip+yYgwXw57iuMzN3C3/k0L9
         eY2xRpKnkyuu3q8o6PRsUvHfdGb/ruezzi5Bu7KYSPm8QEZsP+Y2C0H20MK/+MYitosZ
         wQAg==
X-Forwarded-Encrypted: i=1; AFNElJ9ZhWEGpwl73hdFmgo/lGxAWb4wX6u0m1cmoLmWKZRzt2kJKeq0zSw7bhstJ73gL6YaSiOyDFRiVkCqbTsBEB5G@lists.infradead.org
X-Gm-Message-State: AOJu0YyFw0u/nBfcaFt4nGYo5k0sWoUAjEsz7H5wgx0PbNMxT4RjJhPN
	p84Ay+2aA8QjzQSqEiRqiRrez6xhTXvNhmXX4NnbqhQV9Yd1kHkzGEYOEeOjUpAl
X-Gm-Gg: AeBDievaxDCzv2jjyPwKpzd38QRV0zt486VQMQ3ZTvs37Y1aRdhKU1Y8yMdPHYkML6m
	qTRPay8djT/81hmxcI7T93hAqRKGgOjfOYoszi5o4mB5hfajaqSsdDoa6i0HB1oWKue+J8iCM3C
	lHAQhvYN6ly4q7xbMJbn5O4Zi78YbzEUKnhfbAwTYGesb8JV27Mnqm2n2UWWahZqSpcSQRRFBzG
	mqxVXWtNKJEFbcsSeAuiCQ/+DM/v4X83brnOs6rpULx8VZ9uixO0V1Qw59FQUCg4i5KcfR+ZyYe
	02l2U8Y1EAIEpH9mFCu2fdgt1v8ysAGmlwssY+BIMKeAKkC7zL4X5sRD+Mvy4myFLxwE1y8pMUK
	CxUgBMtuySumzTLyRY3mF/oazH51pOGZLjeHDICcIei0ZRaLtv4aAvXCzVDSnrKPXfrfw34Bp5n
	pBllkyKBt0ozhR/wC/En7TQMRV/IQymZpvpegjy2kxee9450OHfjVwbff7AWnLmk16uunutLs=
X-Received: by 2002:a05:600c:1e8a:b0:488:fd7e:1063 with SMTP id 5b1f17b1804b1-48e51f4cdcdmr114717615e9.29.1778147843159;
        Thu, 07 May 2026 02:57:23 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e538ca8c0sm104145975e9.13.2026.05.07.02.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 02:57:22 -0700 (PDT)
Date: Thu, 7 May 2026 10:57:21 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 bpf@vger.kernel.org, arnd@arndb.de, catalin.marinas@arm.com,
 will@kernel.org, peterz@infradead.org, akpm@linux-foundation.org,
 mark.rutland@arm.com, harisokn@amazon.com, cl@gentwo.org, ast@kernel.org,
 rafael@kernel.org, daniel.lezcano@linaro.org, memxor@gmail.com,
 zhenglifeng1@huawei.com, xueshuai@linux.alibaba.com, rdunlap@infradead.org,
 joao.m.martins@oracle.com, boris.ostrovsky@oracle.com,
 konrad.wilk@oracle.com, ashok.bhat@arm.com
Subject: Re: [PATCH v11 01/14] asm-generic: barrier: Add
 smp_cond_load_relaxed_timeout()
Message-ID: <20260507105721.66ba1e45@pumpkin>
In-Reply-To: <87o6isl0nl.fsf@oracle.com>
References: <20260408122538.3610871-1-ankur.a.arora@oracle.com>
	<20260408122538.3610871-2-ankur.a.arora@oracle.com>
	<874iklm1uy.fsf@oracle.com>
	<20260506095836.216d9cc5@pumpkin>
	<87o6isl0nl.fsf@oracle.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_025726_134766_6425CDF1 
X-CRM114-Status: GOOD (  64.54  )
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

On Wed, 06 May 2026 13:54:06 -0700
Ankur Arora <ankur.a.arora@oracle.com> wrote:

> David Laight <david.laight.linux@gmail.com> writes:
> 
> > On Wed, 06 May 2026 00:30:29 -0700
> > Ankur Arora <ankur.a.arora@oracle.com> wrote:
> >  
> >> Ankur Arora <ankur.a.arora@oracle.com> writes:
> >>  
> >> > Add smp_cond_load_relaxed_timeout(), which extends
> >> > smp_cond_load_relaxed() to allow waiting for a duration.
> >> >
> >> > We loop around waiting for the condition variable to change while
> >> > peridically doing a time-check. The loop uses cpu_poll_relax() to slow
> >> > down the busy-wait, which, unless overridden by the architecture
> >> > code, amounts to a cpu_relax().
> >> >
> >> > Note that there are two ways for the time-check to fail: the timeout
> >> > case or, @time_expr_ns returning an invalid value (negative or zero).
> >> > The second failure mode allows for clocks attached to the clock-domain
> >> > of @cond_expr --  which might cease to operate meaningfully once some
> >> > state internal to @cond_expr has changed -- to fail.
> >> >
> >> > Evaluation of @time_expr_ns: in the fastpath we want to keep the
> >> > performance close to smp_cond_load_relaxed(). So defer evaluation
> >> > of the potentially costly @time_expr_ns to the slowpath.
> >> >
> >> > This also means that there will always be some hardware dependent
> >> > duration that has passed in cpu_poll_relax() iterations at the time
> >> > of first evaluation. Additionally cpu_poll_relax() is not guaranteed
> >> > to return at timeout boundary. In sum, expect timeout overshoot when
> >> > we exit due to expiration of the timeout.
> >> >
> >> > The number of spin iterations before time-check, SMP_TIMEOUT_POLL_COUNT
> >> > is chosen to be 200 by default. With a cpu_poll_relax() iteration
> >> > taking ~20-30 cycles (measured on a variety of x86 platforms), we
> >> > expect a time-check every ~4000-6000 cycles.
> >> >
> >> > The outer limit of the overshoot is double that when working with the
> >> > parameters above. This might be higher or lower depending on the
> >> > implementation of cpu_poll_relax() across architectures.
> >> >
> >> > Lastly, config option ARCH_HAS_CPU_RELAX indicates availability of a
> >> > cpu_poll_relax() that is cheaper than polling. This might be relevant
> >> > for cases with a long timeout.
> >> >
> >> > Cc: Arnd Bergmann <arnd@arndb.de>
> >> > Cc: Will Deacon <will@kernel.org>
> >> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> >> > Cc: Peter Zijlstra <peterz@infradead.org>
> >> > Cc: linux-arch@vger.kernel.org
> >> > Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> >> > Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
> >> > ---
> >> > Notes:
> >> >    - add a comment mentioning that smp_cond_load_relaxed_timeout() might
> >> >      be using architectural primitives that don't support MMIO.
> >> >      (David Laight, Catalin Marinas)
> >> >
> >> >  include/asm-generic/barrier.h | 69 +++++++++++++++++++++++++++++++++++
> >> >  1 file changed, 69 insertions(+)
> >> >
> >> > diff --git a/include/asm-generic/barrier.h b/include/asm-generic/barrier.h
> >> > index d4f581c1e21d..e5a6a1c04649 100644
> >> > --- a/include/asm-generic/barrier.h
> >> > +++ b/include/asm-generic/barrier.h
> >> > @@ -273,6 +273,75 @@ do {									\
> >> >  })
> >> >  #endif
> >> >
> >> > +/*
> >> > + * Number of times we iterate in the loop before doing the time check.
> >> > + * Note that the iteration count assumes that the loop condition is
> >> > + * relatively cheap.
> >> > + */
> >> > +#ifndef SMP_TIMEOUT_POLL_COUNT
> >> > +#define SMP_TIMEOUT_POLL_COUNT		200
> >> > +#endif
> >> > +
> >> > +/*
> >> > + * Platforms with ARCH_HAS_CPU_RELAX have a cpu_poll_relax() implementation
> >> > + * that is expected to be cheaper (lower power) than pure polling.
> >> > + */
> >> > +#ifndef cpu_poll_relax
> >> > +#define cpu_poll_relax(ptr, val, timeout_ns)	cpu_relax()
> >> > +#endif
> >> > +
> >> > +/**
> >> > + * smp_cond_load_relaxed_timeout() - (Spin) wait for cond with no ordering
> >> > + * guarantees until a timeout expires.
> >> > + * @ptr: pointer to the variable to wait on.
> >> > + * @cond_expr: boolean expression to wait for.
> >> > + * @time_expr_ns: expression that evaluates to monotonic time (in ns) or,
> >> > + *  on failure, returns a negative value.
> >> > + * @timeout_ns: timeout value in ns
> >> > + * Both of the above are assumed to be compatible with s64; the signed
> >> > + * value is used to handle the failure case in @time_expr_ns.
> >> > + *
> >> > + * Equivalent to using READ_ONCE() on the condition variable.
> >> > + *
> >> > + * Callers that expect to wait for prolonged durations might want
> >> > + * to take into account the availability of ARCH_HAS_CPU_RELAX.
> >> > + *
> >> > + * Note that @ptr is expected to point to a memory address. Using this
> >> > + * interface with MMIO will be slower (since SMP_TIMEOUT_POLL_COUNT is
> >> > + * tuned for memory) and might also break in interesting architecture
> >> > + * dependent ways.
> >> > + */
> >> > +#ifndef smp_cond_load_relaxed_timeout
> >> > +#define smp_cond_load_relaxed_timeout(ptr, cond_expr,			\
> >> > +				      time_expr_ns, timeout_ns)		\
> >> > +({									\
> >> > +	typeof(ptr) __PTR = (ptr);					\

		auto __PTR = ptr;

> >> > +	__unqual_scalar_typeof(*ptr) VAL;				\

It can't matter if integer promotions before assigning to VAL.
So something like:
		auto VAL = 1 ? 0 : *__PTR + 0;
will generate a suitable writable variable.
(The '+ 0' is needed because some versions of gcc incorrectly propagate
'const'.)

> >> > +	u32 __n = 0, __spin = SMP_TIMEOUT_POLL_COUNT;			\
> >> > +	s64 __timeout = (s64)timeout_ns;				\

The (s64) cast can only hide errors.

> >> > +	s64 __time_now, __time_end = 0;					\
> >> > +									\
> >> > +	for (;;) {							\
> >> > +		VAL = READ_ONCE(*__PTR);				\
> >> > +		if (cond_expr)						\
> >> > +			break;						\
> >> > +		cpu_poll_relax(__PTR, VAL, (u64)__timeout);		\

That doesn't look right, __timeout is relative; if the underlying code
uses the timeout then the code delays for 200 * timeout_ns before even
looking at the actual time.
If you want to spin then you may not even want the cpu_relax() at all.
(Or with a very short timeout as in the version below.)

> >> > +		if (++__n < __spin)					\
> >> > +			continue;					\
> >> > +		__time_now = (s64)(time_expr_ns);			\

Another cast that can only hide bugs.

> >> > +		if (unlikely(__time_end == 0))				\
> >> > +			__time_end = __time_now + __timeout;		\
> >> > +		__timeout = __time_end - __time_now;			\
> >> > +		if (__time_now <= 0 || __timeout <= 0) {		\
> >> > +			VAL = READ_ONCE(*__PTR);			\
> >> > +			break;						\
> >> > +		}							\
> >> > +		__n = 0;						\

Resetting the spin count doesn't look right at all.
In principle the code will delay for 200 * __timeout.
Possibly the earlier check should be:
			if (__n < __spin) {
				__n++;
				continue;
			}
(Or just don't worry that the code will spin again after 4M loops.
The problem you have is that if cpu_poll_relay() ignores the timeout you
probably want to spin 'for a bit' in code that only accesses local data
(in particular avoiding evaluating cond_expr or time_expr_ns).

> >> > +	}								\
> >> > +	(typeof(*ptr))VAL;						\

That cast is pointless; the return value will be subject to 'integer promotion'
and converted to a rvalue - which removes any const/volatile qualifiers. 

> >> > +})
> >> > +#endif
> >> > +  
> >>
> >> A cluster of issues that got flagged by sashiko was around timeout_ns
> >> being specified as s64 and a bunch of potential edge cases around
> >> that.
> >>
> >> These were mostly caused by an implicit assumption in the code that
> >> the timeout specified by the caller is generally reasonable. So, way
> >> below S64_MAX, not 0 etc.  
> >
> > There are plenty of ways kernel code can break things.
> > Provided this code doesn't itself overwrite anywhere (rather than
> > just loop forever or return immediately etc) I'd be tempted to
> > just document the valid range rather than slow everything down
> > with the extra tests.  
> 
> I don't disagree. In this case, however, it's somewhat borderline.
> 
> On the pro side, we get rid of some of the implicit type conversions
> and assumptions around those.
> 
> On the negative, it adds an extra modulo operation in the slow path.
> And, the for loop is structured a little differently from the usual
> version.
> 
> On balance, I think this is a good change if only because it makes
> the types a little more explicit.
> 
> Ankur
> 
> > 	David
> >  
> >>
> >> I think this is worth cleaning up a bit. The change is mostly around
> >> introducing a u32 __itertime and explicitly computing the waiting time.
> >> And adding a check to ensure that we start with a valid value.
> >>
> >> This does make the implementation a little more involved. So just wanted
> >> to see if people have any opinions on this?
> >>
> >> +#ifndef smp_cond_load_relaxed_timeout
> >> +#define smp_cond_load_relaxed_timeout(ptr, cond_expr,          \
> >> +                                     time_expr_ns, timeout_ns) \
> >> +({                                                             \
> >> +       typeof(ptr) __PTR = (ptr);                              \
> >> +       __unqual_scalar_typeof(*(ptr)) VAL;                     \
> >> +       u32 __count = 0, __spin = SMP_TIMEOUT_POLL_COUNT;       \
> >> +       s64 __timeout = (s64)(timeout_ns);                      \
> >> +       s64 __time_now, __time_end = 0;                         \
> >> +       u32 __maybe_unused __itertime;                          \
> >> +                                                               \
> >> +       for (__itertime = NSEC_PER_USEC;                        \

Ok, so that limits the initial 'spin' to 200 usecs.
That gets added to any caller-specified timeout.

> >> +               VAL = READ_ONCE(*__PTR), __timeout > 0; ) {     \

Broken indentation.
I'd change it back to a for (;;) loop.

If __timeout <= 0 then the code goes through the 'timer expired'
path (below) on the first iteration.
So the extra check is just bloat.

> >> +               if (cond_expr)                                  \
> >> +                       break;                                  \
> >> +               cpu_poll_relax(__PTR, VAL, __itertime);         \
> >> +               if (++__count < __spin)                         \
> >> +                       continue;                               \
> >> +               __time_now = (s64)(time_expr_ns);               \
> >> +               if (unlikely(__time_end == 0))                  \
> >> +                       __time_end = __time_now + __timeout;    \
> >> +               __timeout = __time_end - __time_now;            \
> >> +               if (__time_now <= 0 || __timeout <= 0) {        \
> >> +                       VAL = READ_ONCE(*__PTR);                \
> >> +                       break;                                  \
> >> +               }                                               \

How about:
			if (unlikely(__time_end == 0)) {
				if (__time_now <= 0)
					goto timed_out;
				__time_end = __time_now + __timeout;
			} else {
				if (__time_now >= __time_end) {
timed_out:
					VAL = READ_ONCE(*__PTR);
					break;
				}
				__timeout = __time_end - __time_now;
			}
				
> >> +               __itertime = __timeout % NSEC_PER_MSEC +        \
> >> +                               NSEC_PER_USEC;                  \

That seems to just be putting a bound on the timeout.
So the '% NSEC_PER_MSEC' could be '& ((1u << 20) - 1)'
replacing an expensive signed divide with a cheap mask.

But overall this is a lot of code to inline.
It has to be possible to get it down to something like:
	struct info info = { .tmo_ns = timeout_ns };
	for (;;) {
		VAL = READ_ONCE(PTR);
		if (cond_expr)
			break;
		if (_smp_cond_load_relaxed_timeout(&info, PTR, VAL))
			break;
	}
	VAL;
(yes, I know it isn't that simple because the arm 'relax' code
has a re-read in it so needs to know the size.)

-- David


> >> +               __count = 0;                                    \
> >> +       }                                                       \
> >> +       (typeof(*(ptr)))VAL;                                    \
> >> +})
> >> +#endif
> >>
> >> Thanks
> >>
> >> --
> >> ankur
> >>  
> 
> 
> --
> ankur
> 


