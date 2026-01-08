Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F69D1D495
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 21:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CCqVmwEYGvuoO8ZStY2Wfo+Alh/jtZ3DP8KhCBeoYu0=; b=30J8EuP2Kyt3L/dq2mmj+NsIV4
	05O85mfRa1O8J7w/HkmVNG5Xot8TI5U3OKE75sOm/nCt7rwqS2PliucvGHBKx70Tby9kX0q9zS2+s
	ce8N2dOhXSPZSg1rMpbK7P6N5YWI9FjtDO11R+nkAOsYp6V5RJYHHG8RIMUFiYgrrWSbkFGE2m7Fc
	s3S6c7A9bzCdArp1GP5dFTeYXHb0C6403is9FtWmVa1JUDSHKs9uIOmaeLHUf68MpYQfA0IstEohX
	2VLqlWsOnvq+W0yqeC0n4bAeJ0oU+0TuMnKlGlAs9OORjlB0FaM2UC0OrJY+g3aM1ie8jmFMPOFzP
	pat6N9lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdxff-00000000uyJ-2yIZ;
	Thu, 08 Jan 2026 21:35:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdxfd-00000000uxy-3WKi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 21:35:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B75F42E29;
	Thu,  8 Jan 2026 21:35:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCB41C116C6;
	Thu,  8 Jan 2026 21:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767908153;
	bh=RYTc/j72DSJS6wvoSkh81+TKqgFZgRCTQkO2un1ijM0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y6S6ftNbmXXW0NysORAKoesBalPZCAHs3vhEl1XKviZ8aGUT+rkYbX+89sY1BH6Bu
	 IDuaw5rtrfiadKN9BlQdam9Vv9jp3Goe8wpCMxsOugTx3KsG/drreadnhAfoiCOPkQ
	 J+r6EYbK72MpG+7aSljrzhCKyvgrVLXfAd0hAIRWRpsD7v3c90oczl4D0U/LYegu/i
	 sKBmG632pcGxeyceXA2jEYF/+QZdSS5yQv6Dduhpb+dCeH6lA4sziidz9QIKST3peM
	 RciUgkFv1yKETzqr3mr/SPoDiKjV7xPdrnnpoqsb9cCZTjjUvCXkN2QsY7NodcrDjQ
	 ByslcFSRZ9xvQ==
Date: Thu, 8 Jan 2026 21:35:45 +0000
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
Subject: Re: [PATCH v8 04/12] arm64: support WFET in
 smp_cond_relaxed_timeout()
Message-ID: <aWAjMbSqN2g7v58Z@willie-the-truck>
References: <20251215044919.460086-1-ankur.a.arora@oracle.com>
 <20251215044919.460086-5-ankur.a.arora@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215044919.460086-5-ankur.a.arora@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_133553_900022_F775A9BB 
X-CRM114-Status: UNSURE (   8.31  )
X-CRM114-Notice: Please train this message.
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

On Sun, Dec 14, 2025 at 08:49:11PM -0800, Ankur Arora wrote:
> +#define __CMPWAIT_CASE(w, sfx, sz)						\
> +static inline void __cmpwait_case_##sz(volatile void *ptr,			\
> +				       unsigned long val,			\
> +				       s64 timeout_ns)				\
> +{										\
> +	unsigned long tmp;							\
> +										\
> +	if (!alternative_has_cap_unlikely(ARM64_HAS_WFXT) || timeout_ns <= 0) {	\
> +		asm volatile(							\
> +		"	sevl\n"							\
> +		"	wfe\n"							\
> +		"	ldxr" #sfx "\t%" #w "[tmp], %[v]\n"			\
> +		"	eor	%" #w "[tmp], %" #w "[tmp], %" #w "[val]\n"	\
> +		"	cbnz	%" #w "[tmp], 1f\n"				\
> +		"	wfe\n"							\
> +		"1:"								\
> +		: [tmp] "=&r" (tmp), [v] "+Q" (*(u##sz *)ptr)			\
> +		: [val] "r" (val));						\
> +	} else {								\
> +		u64 ecycles = arch_timer_read_counter() +			\
> +				NSECS_TO_CYCLES(timeout_ns);			\
> +		asm volatile(							\
> +		"	sevl\n"							\
> +		"	wfe\n"							\
> +		"	ldxr" #sfx "\t%" #w "[tmp], %[v]\n"			\
> +		"	eor	%" #w "[tmp], %" #w "[tmp], %" #w "[val]\n"	\
> +		"	cbnz	%" #w "[tmp], 2f\n"				\
> +		"	msr s0_3_c1_c0_0, %[ecycles]\n"				\
> +		"2:"								\
> +		: [tmp] "=&r" (tmp), [v] "+Q" (*(u##sz *)ptr)			\
> +		: [val] "r" (val), [ecycles] "r" (ecycles));			\
> +	}									\

Why not have a separate helper for the WFXT version and avoid the runtime
check on timeout_ns?

Will

