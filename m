Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50468CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 16:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lhjTkmtMONvz0jLGVmrmeT6vS5BgZl+Bih4u4tUfo3A=; b=Hakm2m1kUnll1L0oPA0yAAIakh
	nni1wEt7iXG4hhPtfl/CNgp8fXrr+s09E+uk+HON9Fce+RzkUL+gehsWr1UVK1l/N8Ie+z8y3ERGW
	sxLcUq5F3lkZDmmY7VGR5l1u6C2hWum8I7mw/Qc1EPH3DBAdjEmy4BCVzBxkUCk+6ii6YgF1iBrhd
	/ufJdqMwSRhniLGUt0a9kqR2AgKPkyY97Tge1SEY/mlLRt2XJRJqnO4zUY6Xkv1MG/+cG/QLOxNVC
	wWN3FF/QfBw0F7KCFN7o2+TqOyA0Nn/KwJtQ/uW2GqXZHrrqFRBVPiEFvuKGfrPMEGb7l9gjNS0Kj
	JncevDKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzdoX-00000003VhB-02m3;
	Fri, 19 Sep 2025 16:18:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzdoU-00000003Vfw-2JYm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 16:18:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8191944F56;
	Fri, 19 Sep 2025 16:18:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4260CC4CEFD;
	Fri, 19 Sep 2025 16:18:18 +0000 (UTC)
Date: Fri, 19 Sep 2025 17:18:15 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Ankur Arora <ankur.a.arora@oracle.com>, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	bpf@vger.kernel.org, arnd@arndb.de, peterz@infradead.org,
	akpm@linux-foundation.org, mark.rutland@arm.com,
	harisokn@amazon.com, cl@gentwo.org, ast@kernel.org,
	memxor@gmail.com, zhenglifeng1@huawei.com,
	xueshuai@linux.alibaba.com, joao.m.martins@oracle.com,
	boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Subject: Re: [PATCH v5 2/5] arm64: barrier: Add
 smp_cond_load_relaxed_timeout()
Message-ID: <aM2CR3peZkQlL0S1@arm.com>
References: <20250911034655.3916002-1-ankur.a.arora@oracle.com>
 <20250911034655.3916002-3-ankur.a.arora@oracle.com>
 <aMxmAuK-adVaVezk@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMxmAuK-adVaVezk@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_091822_610138_AFAA0349 
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

On Thu, Sep 18, 2025 at 09:05:22PM +0100, Will Deacon wrote:
> > +/* Re-declared here to avoid include dependency. */
> > +extern bool arch_timer_evtstrm_available(void);
> > +
> > +#define smp_cond_load_relaxed_timeout(ptr, cond_expr, time_check_expr)	\
> > +({									\
> > +	typeof(ptr) __PTR = (ptr);					\
> > +	__unqual_scalar_typeof(*ptr) VAL;				\
> > +	bool __wfe = arch_timer_evtstrm_available();			\
> > +									\
> > +	for (;;) {							\
> > +		VAL = READ_ONCE(*__PTR);				\
> > +		if (cond_expr)						\
> > +			break;						\
> > +		if (time_check_expr)					\
> > +			break;						\
> > +		if (likely(__wfe))					\
> > +			__cmpwait_relaxed(__PTR, VAL);			\
> > +		else							\
> > +			cpu_relax();					\
> 
> It'd be an awful lot nicer if we could just use the generic code if
> wfe isn't available. One option would be to make that available as
> e.g. __smp_cond_load_relaxed_timeout_cpu_relax() and call it from the
> arch code when !arch_timer_evtstrm_available() but a potentially cleaner
> version would be to introduce something like cpu_poll_relax() and use
> that in the core code.
> 
> So arm64 would do:
> 
> #define SMP_TIMEOUT_SPIN_COUNT	1
> #define cpu_poll_relax(ptr, val)	do {				\
> 	if (arch_timer_evtstrm_available())				\
> 		__cmpwait_relaxed(ptr, val);				\
> 	else								\
> 		cpu_relax();						\
> } while (0)
> 
> and then the core code would have:
> 
> #ifndef cpu_poll_relax
> #define cpu_poll_relax(p, v)	cpu_relax()
> #endif

A slight problem here is that we have two users that want different spin
counts: poll_idle() uses 200, rqspinlock wants 16K. They've been
empirically chosen but I guess it also depends on what they call in
time_check_expr and the resolution they need. From the discussion on
patch 5, Kumar would like to override the spin count to 16K from the
current one of 200 (or if poll_idle works with 16K, we just set that as
the default; we have yet to hear from the cpuidle folk).

I guess on arm64 we'd first #undef it and redefine it as 1. The
non-event stream variant is for debug only really, I'd expect it to
always have it on in production (or go for WFET).

So yeah, I think the above would work. Ankur proposed something similar
in the early versions but I found it too complicated (a spin and wait
policy callback populating the spin variable). Your proposal looks a lot
simpler.

Thanks.

-- 
Catalin

