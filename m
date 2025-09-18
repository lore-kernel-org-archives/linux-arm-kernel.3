Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F50ECAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 19:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YrT63GBhqEpR5WgJ+h+K35RdmziBafFcfnxgsHw/ppg=; b=Fihla0FvB3RXyNLhO8MJ2nxFI+
	5ff2/7occk96lvyZx6KyGjL2dz4I8USbIOBfneV4kvNSKzCKH7yPWHTihXrgKNRWvARsE/ZGiHSWA
	NgUF0fdIKSnl2kRPQ4Jwk6vlmlolpzTdW5iyRxF8Bb179o547EV357RlEHNSXKYX99dZhkragTKpA
	WqYnlyvIpgkNV6Q/HNmVj++gD/PZTebImk7Z0+OocXWRn/QFNG7GpdVPSd7feMAHg8KIZLnxloSrt
	2H3GgVwASaQEiESDbyW40zkSJkhuLzQTFu8E432LDJ//rRBQuIkRpy4HgNSPmgnbyFXkHYS245jJw
	ZvaE1iuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzKWr-000000010vW-2FMc;
	Thu, 18 Sep 2025 19:42:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzKWo-000000010v9-3MrA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 19:42:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 30FE540BE1;
	Thu, 18 Sep 2025 19:42:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B097EC4CEE7;
	Thu, 18 Sep 2025 19:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758224569;
	bh=80s6EU2PHaHFue3+G09GZK98h4BmkrZlLT7WXXnyY3Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uTraG5KVrM9q6OFeTaJV+aEPHYI4rOJGKWFXc93LgVImNtlkPgm9zsOGuGnOa46An
	 Vs2IWSrfYN1Hxy4jgIwOt+xJx6xfEBkTwz76KbwcgF06E7Cn2LOMUL5oQJgnttZAUV
	 H8bm/SlxpbZ/w/pOHI7Zv/LyEadATKp1Iy3JkCdgq2NG2U73Tf4Oij1lm/XdBwLwLT
	 s9oen8O3FEewQaM4Z3/KaMkTCbAxT/1MwRd80sxjk/KIlPmhuZh9R/H8y1fg0ZWask
	 5kMVtaKYZ7JnQuXNY47clmxnGRb0n3j5Rcy5f9CQULBpe5y6gTroM9iIaQkniXGMdW
	 66+L4fidi7h3A==
Date: Thu, 18 Sep 2025 20:42:42 +0100
From: Will Deacon <will@kernel.org>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
	arnd@arndb.de, catalin.marinas@arm.com, peterz@infradead.org,
	akpm@linux-foundation.org, mark.rutland@arm.com,
	harisokn@amazon.com, cl@gentwo.org, ast@kernel.org,
	memxor@gmail.com, zhenglifeng1@huawei.com,
	xueshuai@linux.alibaba.com, joao.m.martins@oracle.com,
	boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Subject: Re: [PATCH v5 1/5] asm-generic: barrier: Add
 smp_cond_load_relaxed_timeout()
Message-ID: <aMxgsh3AVO5_CCqf@willie-the-truck>
References: <20250911034655.3916002-1-ankur.a.arora@oracle.com>
 <20250911034655.3916002-2-ankur.a.arora@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911034655.3916002-2-ankur.a.arora@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_124250_874050_FE313A1D 
X-CRM114-Status: GOOD (  24.37  )
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

On Wed, Sep 10, 2025 at 08:46:51PM -0700, Ankur Arora wrote:
> Add smp_cond_load_relaxed_timeout(), which extends
> smp_cond_load_relaxed() to allow waiting for a duration.
> 
> The additional parameter allows for the timeout check.
> 
> The waiting is done via the usual cpu_relax() spin-wait around the
> condition variable with periodic evaluation of the time-check.
> 
> The number of times we spin is defined by SMP_TIMEOUT_SPIN_COUNT
> (chosen to be 200 by default) which, assuming each cpu_relax()
> iteration takes around 20-30 cycles (measured on a variety of x86
> platforms), amounts to around 4000-6000 cycles.
> 
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: linux-arch@vger.kernel.org
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Reviewed-by: Haris Okanovic <harisokn@amazon.com>
> Tested-by: Haris Okanovic <harisokn@amazon.com>
> Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
> ---
>  include/asm-generic/barrier.h | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/include/asm-generic/barrier.h b/include/asm-generic/barrier.h
> index d4f581c1e21d..8483e139954f 100644
> --- a/include/asm-generic/barrier.h
> +++ b/include/asm-generic/barrier.h
> @@ -273,6 +273,41 @@ do {									\
>  })
>  #endif
>  
> +#ifndef SMP_TIMEOUT_SPIN_COUNT
> +#define SMP_TIMEOUT_SPIN_COUNT		200
> +#endif
> +
> +/**
> + * smp_cond_load_relaxed_timeout() - (Spin) wait for cond with no ordering
> + * guarantees until a timeout expires.
> + * @ptr: pointer to the variable to wait on
> + * @cond: boolean expression to wait for
> + * @time_check_expr: expression to decide when to bail out
> + *
> + * Equivalent to using READ_ONCE() on the condition variable.
> + */
> +#ifndef smp_cond_load_relaxed_timeout
> +#define smp_cond_load_relaxed_timeout(ptr, cond_expr, time_check_expr)	\
> +({									\
> +	typeof(ptr) __PTR = (ptr);					\
> +	__unqual_scalar_typeof(*ptr) VAL;				\
> +	u32 __n = 0, __spin = SMP_TIMEOUT_SPIN_COUNT;			\
> +									\
> +	for (;;) {							\
> +		VAL = READ_ONCE(*__PTR);				\
> +		if (cond_expr)						\
> +			break;						\
> +		cpu_relax();						\
> +		if (++__n < __spin)					\
> +			continue;					\
> +		if (time_check_expr)					\
> +			break;						\

There's a funny discrepancy here when compared to the arm64 version in
the next patch. Here, if we time out, then the value returned is
potentially quite stale because it was read before the last cpu_relax().
In the arm64 patch, the timeout check is before the cmpwait/cpu_relax(),
which I think is better.

Regardless, I think having the same behaviour for the two implementations
would be a good idea.

Will

