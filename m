Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49EE7C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 09:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wGZGaTg1zkwDlQ10Ox2zKCG+gQ73oFiUtcYCuUqVTsA=; b=XPGkM/z5oYL/Rz5qniQQ7u8YPj
	v6S+6UWXLEk0oPxi6tNCru6bRAgyvrMrikRyC07rB0LDybyEIX4rNfyhE509cIpX1JDO1kKsdqLMc
	AB+uTeBRb0owOwqzpOwj88guK0zfl2yEQQWZKTwIPcPeJbGvGlHgFeIofUKbvEDX7GGps9kwUVCAR
	HF8PnK09rFO+EqBtOxtv8ajsMURHw27s6JdLwTiNAzTcWTZ1hEOu2poRbjAQeEYG+AV6sIzpx9KEO
	SXF2VC2rkkxYX9vGZxoDGl82FnC/vnk0FAM8xA0UxFkcen9slGo6hbCddjKrMQ//YKsq4M0/0YjgW
	hOjFpRKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukJbK-00000002TIN-1qIu;
	Fri, 08 Aug 2025 09:41:26 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukJYq-00000002SxV-27ng
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 09:38:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 29579A55BA2;
	Fri,  8 Aug 2025 09:38:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB714C4CEED;
	Fri,  8 Aug 2025 09:38:47 +0000 (UTC)
Date: Fri, 8 Aug 2025 10:38:44 +0100
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
Subject: Re: [PATCH v3 3/5] asm-generic: barrier: Add
 smp_cond_load_acquire_timewait()
Message-ID: <aJXFpKEm7-abCAFc@arm.com>
References: <20250627044805.945491-1-ankur.a.arora@oracle.com>
 <20250627044805.945491-4-ankur.a.arora@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627044805.945491-4-ankur.a.arora@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_023852_611737_D4B61102 
X-CRM114-Status: GOOD (  17.79  )
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

On Thu, Jun 26, 2025 at 09:48:03PM -0700, Ankur Arora wrote:
> diff --git a/arch/arm64/include/asm/rqspinlock.h b/arch/arm64/include/asm/rqspinlock.h
> index 9ea0a74e5892..f1b6a428013e 100644
> --- a/arch/arm64/include/asm/rqspinlock.h
> +++ b/arch/arm64/include/asm/rqspinlock.h
> @@ -86,7 +86,7 @@
>  
>  #endif
>  
> -#define res_smp_cond_load_acquire(v, c) smp_cond_load_acquire_timewait(v, c, 0, 1)
> +#define res_smp_cond_load_acquire(v, c) smp_cond_load_acquire_timewait(v, c, 0ULL, 1ULL, 0)
>  
>  #include <asm-generic/rqspinlock.h>
>  
> diff --git a/include/asm-generic/barrier.h b/include/asm-generic/barrier.h
> index 8299c57d1110..dd7c9ca2dff3 100644
> --- a/include/asm-generic/barrier.h
> +++ b/include/asm-generic/barrier.h
> @@ -388,6 +388,28 @@ static inline u64 ___smp_cond_spinwait(u64 now, u64 prev, u64 end,
>  	(typeof(*ptr))_val;						\
>  })
>  
> +/**
> + * smp_cond_load_acquire_timewait() - (Spin) wait for cond with ACQUIRE ordering
> + * until a timeout expires.
> + *
> + * Arguments: same as smp_cond_load_relaxed_timeout().
> + *
> + * Equivalent to using smp_cond_load_acquire() on the condition variable with
> + * a timeout.
> + */
> +#ifndef smp_cond_load_acquire_timewait
> +#define smp_cond_load_acquire_timewait(ptr, cond_expr,			\
> +				       time_expr, time_end,		\
> +				       slack) ({			\
> +	__unqual_scalar_typeof(*ptr) _val;				\
> +	_val = smp_cond_load_relaxed_timewait(ptr, cond_expr,		\
> +					      time_expr, time_end,	\
> +					      slack);			\
> +	/* Depends on the control dependency of the wait above. */	\
> +	smp_acquire__after_ctrl_dep();					\
> +	(typeof(*ptr))_val;						\
> +})
> +#endif

Using #ifndef in the generic file is the correct thing to do, it allows
architectures to redefine it. Why we have a similar #ifndef in the arm64
rqspinlock.h, no idea, none of the arm64 maintainers acked that patch
(shouldn't have gone in really, we were still discussing the
implementation at the time; I also think it's slightly wrong).

Your change above to rqspinlock.h makes this even more confusing when
you look at the overall result with all the patches applied. We end up
with the same macro in asm/rqspinlock.h but with different number of
arguments.

I'd start with ripping out the current arm64 implementation, add a
generic implementation to barrier.h and then override it in the arch
code.

-- 
Catalin

