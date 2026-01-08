Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C06ED1D496
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 21:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4zs3x97n7hmk/6fgg4x5rYCc5KQfB2i6Snapl8z1ePY=; b=CShsuXS5jXFdn9eJPJy8gLvMUH
	CyVzq+AeSnEnDmHE3++HD9guLJ3+smxHF2B/D2nR97QkJ33FR+olBOWeEYTW8t974hjx2RNbNwkve
	HmbWKKgRrKdMFxas5grGL+dzS0Hk/8Z0tGSL1WrfLFPtbfwK9y/lvJb8TEASusEXPyU7pS+aDNIqH
	J86jDF3W37WANQ9mlA91EWMmNVKtObfJWerQpB4bL8S5iybIgtwtSleu3DBHKgxfACeyS4n1zyBcr
	jdMBEmsA8kR70ohgsIIb9y8YMiNMCtUgPgzJ3KXCS0rqfmNNTrxse8zFeyMGN8vraQfOcfhj4v4je
	zGLRkVYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdxgG-00000000v1d-0E0o;
	Thu, 08 Jan 2026 21:36:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdxgB-00000000v0u-0ZBl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 21:36:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BD0E243D3A;
	Thu,  8 Jan 2026 21:36:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EB7AC116C6;
	Thu,  8 Jan 2026 21:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767908186;
	bh=696IrOu76SRxS3ELMb4EMuTyFrySf8d6GgyT3GbkOtE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QEvhVbYGzHaylLZ3smRb3VqvIOtYSaxbNOfYNnCKsrIfCEm/0stGFamSf4nPTK0cD
	 tl7y3UnHIp41qrwJXE3Q3pYCLRmJ9GadkWivw/kCsGnP2fv/Ch794cAK/nSu+TK+wL
	 CCtpT5RnLiiEyiwOtHvZ+BcZyuEZ9pv6pAPaCu5ZsSFeYbzy60s1rRF8wk6BRHGbNc
	 SYTGlJu9YRBBmZz0iV4froHl59Wc1g7PbOLQCRHbBkQYxf3M1Rp2fbnJJDq48Yl9Se
	 rFER0DCrMr6yPP8W4Ufm6UFgy0YOz7in6dq5BVR1hs8AJKdsfRMkrKDOFqvxChKHFP
	 FrlKvzl+xdIjA==
Date: Thu, 8 Jan 2026 21:36:19 +0000
From: Will Deacon <will@kernel.org>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	bpf@vger.kernel.org, arnd@arndb.de, catalin.marinas@arm.com,
	peterz@infradead.org, akpm@linux-foundation.org,
	mark.rutland@arm.com, harisokn@amazon.com, cl@gentwo.org,
	ast@kernel.org, rafael@kernel.org, daniel.lezcano@linaro.org,
	memxor@gmail.com, zhenglifeng1@huawei.com,
	xueshuai@linux.alibaba.com, joao.m.martins@oracle.com,
	boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Subject: Re: [PATCH v8 02/12] arm64: barrier: Support
 smp_cond_load_relaxed_timeout()
Message-ID: <aWAjU_QS7kwcyCse@willie-the-truck>
References: <20251215044919.460086-1-ankur.a.arora@oracle.com>
 <20251215044919.460086-3-ankur.a.arora@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215044919.460086-3-ankur.a.arora@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_133627_230745_5720FC1E 
X-CRM114-Status: GOOD (  24.55  )
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

On Sun, Dec 14, 2025 at 08:49:09PM -0800, Ankur Arora wrote:
> Support waiting in smp_cond_load_relaxed_timeout() via
> __cmpwait_relaxed(). To ensure that we wake from waiting in
> WFE periodically and don't block forever if there are no stores
> to ptr, this path is only used when the event-stream is enabled.
> 
> Note that when using __cmpwait_relaxed() we ignore the timeout
> value, allowing an overshoot by upto the event-stream period.
> And, in the unlikely event that the event-stream is unavailable,
> fallback to spin-waiting.
> 
> Also set SMP_TIMEOUT_POLL_COUNT to 1 so we do the time-check in
> each iteration of smp_cond_load_relaxed_timeout().
> 
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Suggested-by: Will Deacon <will@kernel.org>
> Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
> ---
> 
> Notes:
>    - cpu_poll_relax() now takes an additional parameter.
> 
>    - added a comment detailing why we define SMP_TIMEOUT_POLL_COUNT=1 and
>      how it ties up with smp_cond_load_relaxed_timeout().
> 
>    - explicitly include <asm/vdso/processor.h> for cpu_relax().
> 
>  arch/arm64/include/asm/barrier.h | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/barrier.h b/arch/arm64/include/asm/barrier.h
> index 9495c4441a46..6190e178db51 100644
> --- a/arch/arm64/include/asm/barrier.h
> +++ b/arch/arm64/include/asm/barrier.h
> @@ -12,6 +12,7 @@
>  #include <linux/kasan-checks.h>
>  
>  #include <asm/alternative-macros.h>
> +#include <asm/vdso/processor.h>
>  
>  #define __nops(n)	".rept	" #n "\nnop\n.endr\n"
>  #define nops(n)		asm volatile(__nops(n))
> @@ -219,6 +220,26 @@ do {									\
>  	(typeof(*ptr))VAL;						\
>  })
>  
> +/* Re-declared here to avoid include dependency. */
> +extern bool arch_timer_evtstrm_available(void);
> +
> +/*
> + * In the common case, cpu_poll_relax() sits waiting in __cmpwait_relaxed()
> + * for the ptr value to change.
> + *
> + * Since this period is reasonably long, choose SMP_TIMEOUT_POLL_COUNT
> + * to be 1, so smp_cond_load_{relaxed,acquire}_timeout() does a
> + * time-check in each iteration.
> + */
> +#define SMP_TIMEOUT_POLL_COUNT	1
> +
> +#define cpu_poll_relax(ptr, val, timeout_ns) do {			\
> +	if (arch_timer_evtstrm_available())				\
> +		__cmpwait_relaxed(ptr, val);				\
> +	else								\
> +		cpu_relax();						\
> +} while (0)

Acked-by: Will Deacon <will@kernel.org>

Will

