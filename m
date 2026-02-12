Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E09EB48F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 09:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Phtp8Z4ei388aKllZFARYn5zwlBsIT6J1/fUx6EVP8E=; b=aDERKQd01/VCyZ55Thv1ioeqOc
	Gi89rngTAsSMPLNeairZLq+iy21oglGV+c7abYHlplVHBMOeRvhIn7CHarlyd4NrDxqQy0DRRBQ//
	f6hBWuDJ+KKSSVazLfueLdbznw/8FibRe0GkpgiUzqJND9VGzbCNU0VU0Vu50x+8PGEey79XMX7YQ
	lyqvej5QJL1wE8Jf243pX5RnxBAboEMvpKCHUIOobUvoeFJX7oD0vStoGuOzTb6Fx9KY5I5qzU3hw
	TmmTLuLMBh2VQmXI268lJrRx2pg/wJrk69ShocR49gfOF+ly30mRNemsBupM5m5m/tyzoO4gjGzLB
	Ryi4kt1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqTQx-00000001sI1-0keE;
	Thu, 12 Feb 2026 09:56:27 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqTQv-00000001sHY-2RAk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 09:56:26 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4832701b9b7so35598665e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Feb 2026 01:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770890183; x=1771494983; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Phtp8Z4ei388aKllZFARYn5zwlBsIT6J1/fUx6EVP8E=;
        b=iFX+2yjV4Cdzgy0y5xpTXD4pWCqifSqou45MZ3Mh16R9IFYV2Mm5KsuLbmXnSGxOZ5
         xGc0WqbZ/06LuKP0L5N4kuu1AZ5qQ6rOnzg+IvkTKxBjRmRAuBMjoWCSmliuaiQHa6jg
         KqFslmZc1kFtBhRhHgMA6EAXwh2fs/2y73HiIU2f2bvnkRGc97lDET7QpJIMQtfaFUkb
         ltrKt8MHW3OxTVKxwkDyYmlGSSx2Tj8McZnwmQjpGvaC1y8ApczMWf04nHHhMHxwpcmY
         Fc/FuagJVWbkDQ0/XBheHwNsM+yYZG24Z4KPXxNs4fGEpIpRNG4TQtY/oSxgUGH9QQhu
         on6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770890183; x=1771494983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Phtp8Z4ei388aKllZFARYn5zwlBsIT6J1/fUx6EVP8E=;
        b=LCJd7SPbAw6fUFwfpbQQm8517hPksEt9xcdfzszE6wBx1IPbnKuz5DPg/0sM5o6hRM
         r8uQmICu26P4k//z8y8mX5rpBRq2f46ZTSK6Dn+SpmCN3zkdOJYxsu9N8gL3m+y8FVjj
         ZuE5WwuBD4i+XaU9drpH/cvxPEgF6wInao4EdDFUFHGqKl0wVDwlL/GVhJv9N+2SmTQQ
         vaUurnuRp1GDneLKGyJZ5yPJ60jz3bcymHXnwNNr//q6t322+Z0GX2Q6ZRxTQUfEhTIs
         yPnm0qRViO7hXFS6ZLTHO34sEy13xUDd63TNHvIWKMLvTVviyLtXBqMvK2GELJpq5cuE
         mxrA==
X-Forwarded-Encrypted: i=1; AJvYcCXA4Z0lUrpTHFVFa0yCRwtbaOj415eiz+1vzcO8QDFYnBQI/nv0twHBiR4dqFEIbrIenMsq5Hp65Cfg9zBKo3RV@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5HoVY+k4c6KtvqGrdTHHTjdLKJHGgENQN38cWRq0FtpAUfpbS
	KJQR+egycyMLgRtW17/onoCCtHKAkLhHKrTGoY+qhxfg6vM0NHcPZNSY
X-Gm-Gg: AZuq6aKcEpcH1dBKqk/GKeTMwt+Zyf3LpPsCEmMDyMY7RrTWWaSl6hT4fIda62xPCu3
	QhSijtUBeHMcusgS7psH4Wd9JMuX67Ch17wgx5V+lSG0euZ7aBgKKCUlRxCotoKlzcwI9F7FKhm
	s7wpbs4kz+BwJOP738GXV7SFOqQgL6hJIfLbeg7dith37ubitklRWutSZHPB5//S0/sBmmnDFGP
	hoL8E4evWN3kpb9/zoAnbY7RbGIiv5YjmzsKi5riG2gjwPDK4dTCnwAi+Wz0GcmExZqU0+kFm8d
	OwQuttXfMyfCuFpLl/7yVtWoMHkNF9Oo9yXn0Ynjl/nFdxDtxjzOQE40M0t4Xd8oaN+giNiESXM
	yeulyE92HaU66GborFqsIrE65uTL8msLGe3Ac0JK0oXYGQeUZscYY0KpMZLd9J9yhYoKb9ctE83
	qTz0U5nFd3huzaQtBv9E1s9smG5Zn98zTWxHsN7HP2jPHQGWOyvs1/8hzM5SQ9V6bf
X-Received: by 2002:a05:600c:4fcb:b0:480:1a9a:e571 with SMTP id 5b1f17b1804b1-4836570e48amr25658585e9.22.1770890183038;
        Thu, 12 Feb 2026 01:56:23 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d82a4c4sm330608855e9.10.2026.02.12.01.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 01:56:22 -0800 (PST)
Date: Thu, 12 Feb 2026 09:56:21 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 bpf@vger.kernel.org, arnd@arndb.de, catalin.marinas@arm.com,
 will@kernel.org, peterz@infradead.org, akpm@linux-foundation.org,
 mark.rutland@arm.com, harisokn@amazon.com, cl@gentwo.org, ast@kernel.org,
 rafael@kernel.org, daniel.lezcano@linaro.org, memxor@gmail.com,
 zhenglifeng1@huawei.com, xueshuai@linux.alibaba.com,
 joao.m.martins@oracle.com, boris.ostrovsky@oracle.com,
 konrad.wilk@oracle.com
Subject: Re: [PATCH v9 01/12] asm-generic: barrier: Add
 smp_cond_load_relaxed_timeout()
Message-ID: <20260212095621.4d99317b@pumpkin>
In-Reply-To: <20260209023153.2661784-2-ankur.a.arora@oracle.com>
References: <20260209023153.2661784-1-ankur.a.arora@oracle.com>
	<20260209023153.2661784-2-ankur.a.arora@oracle.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_015625_649721_04C569D2 
X-CRM114-Status: GOOD (  40.31  )
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

On Sun,  8 Feb 2026 18:31:42 -0800
Ankur Arora <ankur.a.arora@oracle.com> wrote:

> Add smp_cond_load_relaxed_timeout(), which extends
> smp_cond_load_relaxed() to allow waiting for a duration.
> 
> We loop around waiting for the condition variable to change while
> peridically doing a time-check. The loop uses cpu_poll_relax() to slow
> down the busy-waiting, which, unless overridden by the architecture
> code, amounts to a cpu_relax().
> 
> Note that there are two ways for the time-check to fail: the usual
> timeout case or, @time_expr_ns returning an invalid value (negative
> or zero). The second failure mode allows for clocks attached to the
> clock-domain of @cond_expr, which might cease to operate meaningfully
> once some state internal to @cond_expr has changed.
> 
> Evaluation of @time_expr_ns: in the fastpath we want to keep the
> performance close to smp_cond_load_relaxed(). To do that we defer
> evaluation of the potentially costly @time_expr_ns to when we hit
> the slowpath.
> 
> This also means that there will always be some hardware dependent
> duration that has passed in cpu_poll_relax() iterations at the time of
> first evaluation. Additionally cpu_poll_relax() is not guaranteed to
> return at timeout boundary. In sum, expect timeout overshoot when we
> exit due to expiration of the timeout.
> 
> The number of spin iterations before time-check, SMP_TIMEOUT_POLL_COUNT
> is chosen to be 200 by default. With a cpu_poll_relax() iteration
> taking ~20-30 cycles (measured on a variety of x86 platforms), we expect
> a tim-check every ~4000-6000 cycles.
    ^ time-check

Plus the cost of evaluating cond_expr 200 times.
I guess that isn't expected to contain a PCIe read :-)

	David

> 
> The outer limit of the overshoot is double that when working with the
> parameters above. This might be higher or lower depending on the
> implementation of cpu_poll_relax() across architectures.
> 
> Lastly, config option ARCH_HAS_CPU_RELAX indicates availability of a
> cpu_poll_relax() that is cheaper than polling. This might be relevant
> for cases with a prolonged timeout.
> 
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: linux-arch@vger.kernel.org
> Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
> ---
> Notes:
>   - Defer evaluation of @time_expr_ns to when we hit the slowpath.
>   - This also helps get rid of the labelled gotos which were used to
>     handle the early failure case (since now there's no early init
>     to be concerned with.)
>   - Add a comment mentioning that the cpu_poll_relax() implementation
>     is better than polling if ARCH_HAS_CPU_RELAX.
> 
>  include/asm-generic/barrier.h | 72 +++++++++++++++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
> 
> diff --git a/include/asm-generic/barrier.h b/include/asm-generic/barrier.h
> index d4f581c1e21d..2738fe35c1df 100644
> --- a/include/asm-generic/barrier.h
> +++ b/include/asm-generic/barrier.h
> @@ -273,6 +273,68 @@ do {									\
>  })
>  #endif
>  
> +/*
> + * Number of times we iterate in the loop before doing the time check.
> + */
> +#ifndef SMP_TIMEOUT_POLL_COUNT
> +#define SMP_TIMEOUT_POLL_COUNT		200
> +#endif
> +
> +/*
> + * Platforms with ARCH_HAS_CPU_RELAX have a cpu_poll_relax() implementation
> + * that is expected to be cheaper (lower power) than pure polling.
> + */
> +#ifndef cpu_poll_relax
> +#define cpu_poll_relax(ptr, val, timeout_ns)	cpu_relax()
> +#endif
> +
> +/**
> + * smp_cond_load_relaxed_timeout() - (Spin) wait for cond with no ordering
> + * guarantees until a timeout expires.
> + * @ptr: pointer to the variable to wait on.
> + * @cond: boolean expression to wait for.
> + * @time_expr_ns: expression that evaluates to monotonic time (in ns) or,
> + *  on failure, returns a negative value.
> + * @timeout_ns: timeout value in ns
> + * Both of the above are assumed to be compatible with s64; the signed
> + * value is used to handle the failure case in @time_expr_ns.
> + *
> + * Equivalent to using READ_ONCE() on the condition variable.
> + *
> + * Callers that expect to wait for prolonged durations might want to
> + * take into account the availability of ARCH_HAS_CPU_RELAX.
> + */
> +#ifndef smp_cond_load_relaxed_timeout
> +#define smp_cond_load_relaxed_timeout(ptr, cond_expr,			\
> +				      time_expr_ns, timeout_ns)		\
> +({									\
> +	typeof(ptr) __PTR = (ptr);					\
> +	__unqual_scalar_typeof(*ptr) VAL;				\
> +	u32 __n = 0, __spin = SMP_TIMEOUT_POLL_COUNT;			\
> +	s64 __timeout = (s64)timeout_ns;				\
> +	s64 __time_now, __time_end = 0;					\
> +									\
> +	for (;;) {							\
> +		VAL = READ_ONCE(*__PTR);				\
> +		if (cond_expr) 						\
> +			break;						\
> +		cpu_poll_relax(__PTR, VAL, (u64)__timeout);		\
> +		if (++__n < __spin)					\
> +			continue;					\
> +		__time_now = (s64)(time_expr_ns);			\
> +		if (unlikely(__time_end == 0))				\
> +			__time_end = __time_now + __timeout;		\
> +		__timeout = __time_end - __time_now;			\
> +		if (__time_now <= 0 || __timeout <= 0) {		\
> +			VAL = READ_ONCE(*__PTR);			\
> +			break;						\
> +		}							\
> +		__n = 0;						\
> +	}								\
> +	(typeof(*ptr))VAL;						\
> +})
> +#endif
> +
>  /*
>   * pmem_wmb() ensures that all stores for which the modification
>   * are written to persistent storage by preceding instructions have


