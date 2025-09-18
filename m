Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 972DFCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 20:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FQxYS1dAbmhO6FAb7ObzU1xBZ8sB3zGVzggqjXATzLw=; b=jNB2ahJSYDSsg7jP6ip6iYs3cC
	YcbsDdC0KT/z2rmNZnFV+gI7hEURusgfmAE81wBv9rlA14lxxEUImddWDxGNvMszMQi8EAH1KOZpN
	qrdXUx63F3mcelm8RMY8miE+QuYZ41XkMMk93u1/rbZc8HHl71B4pmKBJ5yGDgHW1+Wdy5f7v41ek
	Jb899hXVS0BiW64l/y6n6vXafvHkuw7KqnSyKjobKE7cQshQ30n85uOEtI70q4sDDdc9tnTP4wGVj
	WpeNbdNeWKetCexF5g2TIekhuPlJY4dx9TGZZlwhXf42bjuLOzlWelI6KOncy+JLSq0z6nBM4dVy3
	NNtODFJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzKsm-000000013pN-2yY1;
	Thu, 18 Sep 2025 20:05:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzKsk-000000013oV-00EZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 20:05:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5831F443DF;
	Thu, 18 Sep 2025 20:05:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02954C4CEE7;
	Thu, 18 Sep 2025 20:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758225929;
	bh=PQIMs0F7qBnCSupIdEq0faegbRGXgcQzWl1UXppJGbM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MHXnZyZM8mmUiXmySeoga6YEwlAuUym90fpQsvxBtazDC9J2vBBK/2cKyENL8ZZu7
	 NyuC/fsSYikHLmuHuihMMB9G6jgy1k6E6R/xJ8DcdfGUS26EiL+MjosTAKllF7m1TY
	 Or/Wfzxgl59lHT/058iyjD8l/XIRejR8pT57ChS07D6CAA9XWqvQ8UelMJVcipOUpg
	 8owRDGRgOYOKt2HGSDMbRQCc4tV5mAe7T4V/lkdZ5jMimDyaPTmtZBtQsaI20kCCA4
	 Q5y4Ei6XDYcM90nA/5ag4RXb5hSaDJJSx15phpSANwIbrq4gv1DOnqX+aJCy0pCC95
	 kLAJU8qUUKb/A==
Date: Thu, 18 Sep 2025 21:05:22 +0100
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
Subject: Re: [PATCH v5 2/5] arm64: barrier: Add
 smp_cond_load_relaxed_timeout()
Message-ID: <aMxmAuK-adVaVezk@willie-the-truck>
References: <20250911034655.3916002-1-ankur.a.arora@oracle.com>
 <20250911034655.3916002-3-ankur.a.arora@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911034655.3916002-3-ankur.a.arora@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_130530_071471_ACB54029 
X-CRM114-Status: GOOD (  21.67  )
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

On Wed, Sep 10, 2025 at 08:46:52PM -0700, Ankur Arora wrote:
> Add smp_cond_load_relaxed_timeout(), a timed variant of
> smp_cond_load_relaxed().
> 
> This uses __cmpwait_relaxed() to do the actual waiting, with the
> event-stream guaranteeing that we wake up from WFE periodically
> and not block forever in case there are no stores to the cacheline.
> 
> For cases when the event-stream is unavailable, fallback to
> spin-waiting.
> 
> Cc: Will Deacon <will@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Reviewed-by: Haris Okanovic <harisokn@amazon.com>
> Tested-by: Haris Okanovic <harisokn@amazon.com>
> Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
> ---
>  arch/arm64/include/asm/barrier.h | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/barrier.h b/arch/arm64/include/asm/barrier.h
> index f5801b0ba9e9..4f0d9ed7a072 100644
> --- a/arch/arm64/include/asm/barrier.h
> +++ b/arch/arm64/include/asm/barrier.h
> @@ -219,6 +219,29 @@ do {									\
>  	(typeof(*ptr))VAL;						\
>  })
>  
> +/* Re-declared here to avoid include dependency. */
> +extern bool arch_timer_evtstrm_available(void);
> +
> +#define smp_cond_load_relaxed_timeout(ptr, cond_expr, time_check_expr)	\
> +({									\
> +	typeof(ptr) __PTR = (ptr);					\
> +	__unqual_scalar_typeof(*ptr) VAL;				\
> +	bool __wfe = arch_timer_evtstrm_available();			\
> +									\
> +	for (;;) {							\
> +		VAL = READ_ONCE(*__PTR);				\
> +		if (cond_expr)						\
> +			break;						\
> +		if (time_check_expr)					\
> +			break;						\
> +		if (likely(__wfe))					\
> +			__cmpwait_relaxed(__PTR, VAL);			\
> +		else							\
> +			cpu_relax();					\

It'd be an awful lot nicer if we could just use the generic code if
wfe isn't available. One option would be to make that available as
e.g. __smp_cond_load_relaxed_timeout_cpu_relax() and call it from the
arch code when !arch_timer_evtstrm_available() but a potentially cleaner
version would be to introduce something like cpu_poll_relax() and use
that in the core code.

So arm64 would do:

#define SMP_TIMEOUT_SPIN_COUNT	1
#define cpu_poll_relax(ptr, val)	do {				\
	if (arch_timer_evtstrm_available())				\
		__cmpwait_relaxed(ptr, val);				\
	else								\
		cpu_relax();						\
} while (0)

and then the core code would have:

#ifndef cpu_poll_relax
#define cpu_poll_relax(p, v)	cpu_relax()
#endif

and could just use cpu_poll_relax() in the generic implementation of
smp_cond_load_relaxed_timeout().

Will

