Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B8FCD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 08:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AWwFa4pj4HdftCfFhlpM5f3biTFRHPg+OaCJzQMTcbM=; b=NKpyKPAFoRVmPruhoJlQ1aJELm
	2q2m4DzILX6c0lmsk5uwDVht6Tr8ZGhmkRsSAko6QS+F4YCVacsHjiB1mj2sQxsxXbIK6reqAFLCa
	PWJnBYZSjFnveTiCLvqABNi1zitFqYphpatoX8iE/d6g0Jh9ebZ2qpCCNdk8ySofEfpalNCUD/t+A
	ysRD84JTjqJRcdO/H6jkkm1CKpA8EsaWR04UdpYZDqUUfkAPH37IQl3oXNSLQxZ759P1I96WyTlcN
	MeYMg/SoaQi6j6XYj8a3JedNM7YnJgI6eZIeCP08V2NyARG3DCL2rzqAsDOiyEdxYWf+hpHEBhVsw
	66sVp86g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLGdI-000000060Xg-2eoL;
	Fri, 08 May 2026 08:32:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLGdH-000000060XN-2vgR
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 08 May 2026 08:32:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=AWwFa4pj4HdftCfFhlpM5f3biTFRHPg+OaCJzQMTcbM=; b=TypbNU4/rMqZIBC80IFiG5uTES
	Jx9/dmHTHbM4LB3Ir0+RZnVfdJi14y1U9f3myNV23lmCzZBDbU25UPqOLqXtssKRDdNB7nZjA4CzG
	ntI47cOpd7xp25a2l1pp+ZW7d5VMv556EGrAYkDw5VjGqIOh898+b7S5cZj8TZn5mNlR2UUx4ulwy
	RKXxxsS96I/MA0rWdrJAdh2F98hsEM4Ch1KDR/bRNvb1kAN3JAaa8HPv1v6EHgWPa6eJbtoRtAfTz
	V0OBNtumTVEWNcseYRGj6N9BZ/ACTY1t5aHher0cSjoXpA8zZX7TnkzCpXpMSgk5s52u2WBpxY4sd
	GwzIhzJQ==;
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLGd2-00000005ivT-1TUS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 08:32:26 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso17221435e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 01:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778229131; x=1778833931; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AWwFa4pj4HdftCfFhlpM5f3biTFRHPg+OaCJzQMTcbM=;
        b=jZtNV7zpVfHTqS4rV797lrpDifOmj8x+2nJ/sYfNGL4s0AHCkcS7QTuIyGZIJuxuT5
         DdK1BfDKijL7zcONaE3n8lrhdquLMvI9qgymgYef+r+gCiBPuHK1bs8aLS2sFZj6ANn8
         V7f1y2xl2KeGjzXrAQsl58WZtk+gc3b4DhUqkyK/Vyr+oAt7tJMKQX9bHhKvwtCILjCF
         oINlxw2U6Ra5vnN85DOmn8my4SCLv3Sxv5TiiRJU32zKmkX7iTIECrDQS0QJ45DGO0Mt
         t15UOZMfRkB2H9ivGLxQEt9Bxx2bdRSQ2bXJPmugsgr3JEjsjzuYVMFH9bj930jtC9AC
         zcqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778229131; x=1778833931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AWwFa4pj4HdftCfFhlpM5f3biTFRHPg+OaCJzQMTcbM=;
        b=rOyENRMSaDVQj+Ku/k/XkeMiWCFz5S13yUH9F9wG4Sff9dCfKaCeoN0k/IJIcHX5gD
         xIkYbXigl+jYD7t6YPxxdegktXDIIcC//b54n3uBW/LCXtm/wr6QGDKfaA0ZZjeBcpvd
         fYhPdPaZz/VMOnmhZTzRTgJc7fOIl7j9F4dozDJfIaa+M1m7qKiWurmyfhIKp5Gd7fce
         ps/s00SYvuQG8xA+m8PTUUjzlXRu6ZOWMUKvsWBZHZE05rls/qcggD54A0eZATdjxkzo
         h0bxiteWmvtgYtFC4in2FyTt+2MXpu7FhWZVgE5grOuZYDmafkJ2stBqJrKM9hlsNdFg
         OeUg==
X-Forwarded-Encrypted: i=1; AFNElJ/iD7JyleBMOcSKHS2oY6kQn1f2DQ0IBJkNw34F9k1KLLN/VWWWSHM2srAv1eU9XL0VspeVKEB3gtu5S7iNy7LX@lists.infradead.org
X-Gm-Message-State: AOJu0Yxp/8yFSFnudUiZj5VjPH4dr6wXdZ1XarDrLauSDpkMG/8NDxgc
	LpE/Vv7E5EKzsWdF2I2c8p6rfImkC7+muoi+DqDOIQXa/xvrTSlOy/AU
X-Gm-Gg: AeBDietF5P61MlqTFDKWvVXql9rRrzoQ11ubSj0n0zNyGXaud7nSz6ws0ic1p4CN46P
	yQ+qmQelFLjrXOcXWbvVr6Mlwgi33h58BcwqSIPYsUleKZ5fZmG3BI45nk+LnxuRHBKZ5fEWgzr
	jpq6MhuNcf/uUOUKAOYKUfGgY3AaaJTJbwXXumeY2v7flh/MrYHFVRZGxRtiWcQpGTgQxqSXcYj
	SPKdnFuyOMdkU6VsZQ6B203ujQhQOPmYmPjg2lFrr2CMrJr8MKwpS/EUS/wY+fFvjS82g379vb/
	etuu6IwM0vNWrLvhJGFM5UiZcLbkapqb0RqAIfDs35n67X3DqjH72fZoUxkrzt1i6YcQWtg07fg
	DzcIMxRrRyJtVOAYlwxWynx2bIIGTbUlNASmExd60D/YCrceYg7HZf002FMyjm361TvKPXS/Yj9
	V8RNxVvPYukCk48N/w5AJP4G62LcWgvGpxdtWxXt7JBlsM+Sa7rh+rThwNOf9SStb0
X-Received: by 2002:a05:600c:1d11:b0:48a:7f90:2231 with SMTP id 5b1f17b1804b1-48e51f364f3mr189545395e9.19.1778229129820;
        Fri, 08 May 2026 01:32:09 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e68ef5209sm20514445e9.15.2026.05.08.01.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 01:32:08 -0700 (PDT)
Date: Fri, 8 May 2026 09:32:06 +0100
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
Message-ID: <20260508093206.389d9af2@pumpkin>
In-Reply-To: <87lddujttz.fsf@oracle.com>
References: <20260408122538.3610871-1-ankur.a.arora@oracle.com>
	<20260408122538.3610871-2-ankur.a.arora@oracle.com>
	<874iklm1uy.fsf@oracle.com>
	<20260506095836.216d9cc5@pumpkin>
	<87o6isl0nl.fsf@oracle.com>
	<20260507105721.66ba1e45@pumpkin>
	<87lddujttz.fsf@oracle.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_093220_244929_D6B0371D 
X-CRM114-Status: GOOD (  73.67  )
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

On Thu, 07 May 2026 23:31:20 -0700
Ankur Arora <ankur.a.arora@oracle.com> wrote:

> David Laight <david.laight.linux@gmail.com> writes:
> 
> > On Wed, 06 May 2026 13:54:06 -0700
> > Ankur Arora <ankur.a.arora@oracle.com> wrote:
> >  
> >> David Laight <david.laight.linux@gmail.com> writes:
> >>  
> >> > On Wed, 06 May 2026 00:30:29 -0700
> >> > Ankur Arora <ankur.a.arora@oracle.com> wrote:
> >> >  
> >> >> Ankur Arora <ankur.a.arora@oracle.com> writes:
> >> >>  
> >> >> > Add smp_cond_load_relaxed_timeout(), which extends
> >> >> > smp_cond_load_relaxed() to allow waiting for a duration.
> >> >> >
> >> >> > We loop around waiting for the condition variable to change while
> >> >> > peridically doing a time-check. The loop uses cpu_poll_relax() to slow
> >> >> > down the busy-wait, which, unless overridden by the architecture
> >> >> > code, amounts to a cpu_relax().
> >> >> >
> >> >> > Note that there are two ways for the time-check to fail: the timeout
> >> >> > case or, @time_expr_ns returning an invalid value (negative or zero).
> >> >> > The second failure mode allows for clocks attached to the clock-domain
> >> >> > of @cond_expr --  which might cease to operate meaningfully once some
> >> >> > state internal to @cond_expr has changed -- to fail.
> >> >> >
> >> >> > Evaluation of @time_expr_ns: in the fastpath we want to keep the
> >> >> > performance close to smp_cond_load_relaxed(). So defer evaluation
> >> >> > of the potentially costly @time_expr_ns to the slowpath.
> >> >> >
> >> >> > This also means that there will always be some hardware dependent
> >> >> > duration that has passed in cpu_poll_relax() iterations at the time
> >> >> > of first evaluation. Additionally cpu_poll_relax() is not guaranteed
> >> >> > to return at timeout boundary. In sum, expect timeout overshoot when
> >> >> > we exit due to expiration of the timeout.
> >> >> >
> >> >> > The number of spin iterations before time-check, SMP_TIMEOUT_POLL_COUNT
> >> >> > is chosen to be 200 by default. With a cpu_poll_relax() iteration
> >> >> > taking ~20-30 cycles (measured on a variety of x86 platforms), we
> >> >> > expect a time-check every ~4000-6000 cycles.
> >> >> >
> >> >> > The outer limit of the overshoot is double that when working with the
> >> >> > parameters above. This might be higher or lower depending on the
> >> >> > implementation of cpu_poll_relax() across architectures.
> >> >> >
> >> >> > Lastly, config option ARCH_HAS_CPU_RELAX indicates availability of a
> >> >> > cpu_poll_relax() that is cheaper than polling. This might be relevant
> >> >> > for cases with a long timeout.
> >> >> >
> >> >> > Cc: Arnd Bergmann <arnd@arndb.de>
> >> >> > Cc: Will Deacon <will@kernel.org>
> >> >> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> >> >> > Cc: Peter Zijlstra <peterz@infradead.org>
> >> >> > Cc: linux-arch@vger.kernel.org
> >> >> > Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> >> >> > Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
> >> >> > ---
> >> >> > Notes:
> >> >> >    - add a comment mentioning that smp_cond_load_relaxed_timeout() might
> >> >> >      be using architectural primitives that don't support MMIO.
> >> >> >      (David Laight, Catalin Marinas)
> >> >> >
> >> >> >  include/asm-generic/barrier.h | 69 +++++++++++++++++++++++++++++++++++
> >> >> >  1 file changed, 69 insertions(+)
> >> >> >
> >> >> > diff --git a/include/asm-generic/barrier.h b/include/asm-generic/barrier.h
> >> >> > index d4f581c1e21d..e5a6a1c04649 100644
> >> >> > --- a/include/asm-generic/barrier.h
> >> >> > +++ b/include/asm-generic/barrier.h
> >> >> > @@ -273,6 +273,75 @@ do {									\
> >> >> >  })
> >> >> >  #endif
> >> >> >
> >> >> > +/*
> >> >> > + * Number of times we iterate in the loop before doing the time check.
> >> >> > + * Note that the iteration count assumes that the loop condition is
> >> >> > + * relatively cheap.
> >> >> > + */
> >> >> > +#ifndef SMP_TIMEOUT_POLL_COUNT
> >> >> > +#define SMP_TIMEOUT_POLL_COUNT		200
> >> >> > +#endif
> >> >> > +
> >> >> > +/*
> >> >> > + * Platforms with ARCH_HAS_CPU_RELAX have a cpu_poll_relax() implementation
> >> >> > + * that is expected to be cheaper (lower power) than pure polling.
> >> >> > + */
> >> >> > +#ifndef cpu_poll_relax
> >> >> > +#define cpu_poll_relax(ptr, val, timeout_ns)	cpu_relax()
> >> >> > +#endif
> >> >> > +
> >> >> > +/**
> >> >> > + * smp_cond_load_relaxed_timeout() - (Spin) wait for cond with no ordering
> >> >> > + * guarantees until a timeout expires.
> >> >> > + * @ptr: pointer to the variable to wait on.
> >> >> > + * @cond_expr: boolean expression to wait for.
> >> >> > + * @time_expr_ns: expression that evaluates to monotonic time (in ns) or,
> >> >> > + *  on failure, returns a negative value.
> >> >> > + * @timeout_ns: timeout value in ns
> >> >> > + * Both of the above are assumed to be compatible with s64; the signed
> >> >> > + * value is used to handle the failure case in @time_expr_ns.
> >> >> > + *
> >> >> > + * Equivalent to using READ_ONCE() on the condition variable.
> >> >> > + *
> >> >> > + * Callers that expect to wait for prolonged durations might want
> >> >> > + * to take into account the availability of ARCH_HAS_CPU_RELAX.
> >> >> > + *
> >> >> > + * Note that @ptr is expected to point to a memory address. Using this
> >> >> > + * interface with MMIO will be slower (since SMP_TIMEOUT_POLL_COUNT is
> >> >> > + * tuned for memory) and might also break in interesting architecture
> >> >> > + * dependent ways.
> >> >> > + */
> >> >> > +#ifndef smp_cond_load_relaxed_timeout
> >> >> > +#define smp_cond_load_relaxed_timeout(ptr, cond_expr,			\
> >> >> > +				      time_expr_ns, timeout_ns)		\
> >> >> > +({									\
> >> >> > +	typeof(ptr) __PTR = (ptr);					\  
> >
> > 		auto __PTR = ptr;
> >  
> >> >> > +	__unqual_scalar_typeof(*ptr) VAL;				\  
> >
> > It can't matter if integer promotions before assigning to VAL.
> > So something like:
> > 		auto VAL = 1 ? 0 : *__PTR + 0;
> > will generate a suitable writable variable.
> > (The '+ 0' is needed because some versions of gcc incorrectly propagate
> > 'const'.)  
> 
> Thanks. This is useful to know. However, we use the unqualified typeof
> dictum all over barrier.h. I didn't really see the need to depart from
> that.

The have been discussions in other threads, my interpretation of the result
is that the use of __unqual_scalar_typeof() should be limited to a few places
where there really is no other option.
If you've ever looked at the preprocessor output you'll understand part of the
problem.

> 
> >> >> > +	u32 __n = 0, __spin = SMP_TIMEOUT_POLL_COUNT;			\
> >> >> > +	s64 __timeout = (s64)timeout_ns;				\  
> >
> > The (s64) cast can only hide errors.
> >  
> >> >> > +	s64 __time_now, __time_end = 0;					\
> >> >> > +									\
> >> >> > +	for (;;) {							\
> >> >> > +		VAL = READ_ONCE(*__PTR);				\
> >> >> > +		if (cond_expr)						\
> >> >> > +			break;						\
> >> >> > +		cpu_poll_relax(__PTR, VAL, (u64)__timeout);		\  
> >
> > That doesn't look right, __timeout is relative; if the underlying code
> > uses the timeout then the code delays for 200 * timeout_ns before even
> > looking at the actual time.
> >
> > If you want to spin then you may not even want the cpu_relax() at all.
> > (Or with a very short timeout as in the version below.)  
> 
> Yeah, BPF uses this in the fastpath where we want to avoid looking at
> the clock in the fastpath.
> Overshooting the deadline was a minor problem in comparison.
> 
> But I agree the version below with the shorter timeout works better.
> Unfortunately it doesn't help on arm64 if we are using WFE.

Yes, the code is ok if cpu_poll_relax() ignores the timeout.
But for WFE it is all broken.

Perhaps refactoring/optimising the WFE code might help.
IIRC it converts the relative timeout_ns into an absolute 'end time'
(of some other clock).
So if you do that conversion once, returning 0 (usually compile-time)
when WFE isn't in use then it should be possible to make this code work.

Actually, if you assume/require that the converted time is either 0 or
greater than 200 then it can be used as the initialiser for __n.

Even if the timeout passed to cpu_poll_relax() is relative, it doesn't
necessarily need reducing.
I'd expect that the timeout is only a 'guard' timeout to detect lockups.
So just documenting that the timeout might be double the specified value
would solve that problem.

> 
> >> >> > +		if (++__n < __spin)					\
> >> >> > +			continue;					\
> >> >> > +		__time_now = (s64)(time_expr_ns);			\  
> >
> > Another cast that can only hide bugs.
> >  
> >> >> > +		if (unlikely(__time_end == 0))				\
> >> >> > +			__time_end = __time_now + __timeout;		\
> >> >> > +		__timeout = __time_end - __time_now;			\
> >> >> > +		if (__time_now <= 0 || __timeout <= 0) {		\
> >> >> > +			VAL = READ_ONCE(*__PTR);			\
> >> >> > +			break;						\
> >> >> > +		}							\
> >> >> > +		__n = 0;						\  
> >
> > Resetting the spin count doesn't look right at all.
> > In principle the code will delay for 200 * __timeout.
> > Possibly the earlier check should be:
> > 			if (__n < __spin) {
> > 				__n++;
> > 				continue;
> > 			}
> > (Or just don't worry that the code will spin again after 4M loops.
> > The problem you have is that if cpu_poll_relay() ignores the timeout you
> > probably want to spin 'for a bit' in code that only accesses local data
> > (in particular avoiding evaluating cond_expr or time_expr_ns).  
> 
> Yeah we do avoid evaluating the time_expr_ns. And I agree we don't want
> to hammer the cond_expr but the cpu_relax() should help with that.
> (In my measurements I see an IPC of ~0.05 in a cpu_relax() loop of this
> kind.)

I'm not sure what cpu_relax() really does.
I suspect it helps if hyperthreading is in use, and may reduce power a bit
(and may be quite slow).
But the cpu will still be hammering cond_expr.
This is probably fine most of the time - since it will just hit the local
d-cache. Even if the line is evicted I'd expect the cost to mainly be load
on the inter-cpu bus (slowing down cond_expr won't matter).

I have a feeling that one of the reasons that WFE was better than just
spinning was that the expressions read a per-cpu variable; and doing that
on arm64 required locked bus cycles so affected system performance.
I'm sure that using mwait (or equivalent) will almost always increase latency
over just reading the variable, it is lower power - but that is different.

...

> >> >> I think this is worth cleaning up a bit. The change is mostly around
> >> >> introducing a u32 __itertime and explicitly computing the waiting time.
> >> >> And adding a check to ensure that we start with a valid value.
> >> >>
> >> >> This does make the implementation a little more involved. So just wanted
> >> >> to see if people have any opinions on this?
> >> >>
> >> >> +#ifndef smp_cond_load_relaxed_timeout
> >> >> +#define smp_cond_load_relaxed_timeout(ptr, cond_expr,          \
> >> >> +                                     time_expr_ns, timeout_ns) \
> >> >> +({                                                             \
> >> >> +       typeof(ptr) __PTR = (ptr);                              \
> >> >> +       __unqual_scalar_typeof(*(ptr)) VAL;                     \
> >> >> +       u32 __count = 0, __spin = SMP_TIMEOUT_POLL_COUNT;       \
> >> >> +       s64 __timeout = (s64)(timeout_ns);                      \
> >> >> +       s64 __time_now, __time_end = 0;                         \
> >> >> +       u32 __maybe_unused __itertime;                          \
> >> >> +                                                               \
> >> >> +       for (__itertime = NSEC_PER_USEC;                        \  
> >
> > Ok, so that limits the initial 'spin' to 200 usecs.
> > That gets added to any caller-specified timeout.
> >  
> >> >> +               VAL = READ_ONCE(*__PTR), __timeout > 0; ) {     \  
> >
> > Broken indentation.
> > I'd change it back to a for (;;) loop.
> >
> > If __timeout <= 0 then the code goes through the 'timer expired'
> > path (below) on the first iteration.
> > So the extra check is just bloat.  
> 
> Yes, but by the time of the first check we've done this
> computation with it:
> >> >> +               if (unlikely(__time_end == 0))                  \
> >> >> +                       __time_end = __time_now + __timeout;    \
> >> >> +               __timeout = __time_end - __time_now;            \  

Yep, but you don't expect 0 so there is no point optimising for it.

> >> >> +               if (cond_expr)                                  \
> >> >> +                       break;                                  \
> >> >> +               cpu_poll_relax(__PTR, VAL, __itertime);         \
> >> >> +               if (++__count < __spin)                         \
> >> >> +                       continue;                               \
> >> >> +               __time_now = (s64)(time_expr_ns);               \
> >> >> +               if (unlikely(__time_end == 0))                  \
> >> >> +                       __time_end = __time_now + __timeout;    \
> >> >> +               __timeout = __time_end - __time_now;            \
> >> >> +               if (__time_now <= 0 || __timeout <= 0) {        \
> >> >> +                       VAL = READ_ONCE(*__PTR);                \
> >> >> +                       break;                                  \
> >> >> +               }                                               \  
> >
> > How about:
> > 			if (unlikely(__time_end == 0)) {
> > 				if (__time_now <= 0)
> > 					goto timed_out;
> > 				__time_end = __time_now + __timeout;
> > 			} else {
> > 				if (__time_now >= __time_end) {
> > timed_out:
> > 					VAL = READ_ONCE(*__PTR);
> > 					break;
> > 				}
> > 				__timeout = __time_end - __time_now;
> > 			}  
> 
> I had a version like that for one of the iterations. One of the problems
> with it was that needed a named goto (because the whole thing is wrapped
> in a macro). I don't tihnk the extra check is expensive enough in the
> slowpath that it's worth rewriting this code.

It is probably possible to write it all in one condition - but it would
be unreadable :-)

Actually if you require that time_expr_ns be -1 on failure and use u64
(not s64) then you can do:
	if (!__time_end)
		__time_end = __time_now + __timeout;
	if (__time_now >= __time_end) {
		VAL = READ_ONCE(*__PTR);
		break;
	}
That relies on the '+' wrapping when the initial time_expr_ns fails.

> 
> >> >> +               __itertime = __timeout % NSEC_PER_MSEC +        \
> >> >> +                               NSEC_PER_USEC;                  \  
> >
> > That seems to just be putting a bound on the timeout.
> > So the '% NSEC_PER_MSEC' could be '& ((1u << 20) - 1)'
> > replacing an expensive signed divide with a cheap mask.  
> 
> I think this is a good idea. Let me do something like that instead.
> 
> > But overall this is a lot of code to inline.  
> 
> Sure. But it's a small number of callsites (and it's a relatively niche
> interface) so I don't think inlining it is a huge problem.

Until 'next week' :-)

	David

