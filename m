Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F09FACAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 10:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Lem4DnDV5vr4R6cKuOeGAvY2IiL1FM5ULrpKdE+dOE=; b=nXUwskQcmHN13fc2be2fN2YSUm
	VlpkBGHRVYdycSrM1ML35cMIB/vTBurMekagRs/N4D9HXX+rNHnttPN6FuuVK8e3Mg5RaoX15na0A
	Ki/bMujHhg1rzBiQQJ+lYJRX8DhvWeK31kWt7tO9Oxp8BQgOSODo+00HBcsCwtebjMdC1RvOUNv5y
	M88GXURj5oT6DF9bUei3uX0/AkdQVwp0jE1epTPECVazrKOvTaXSdla+uz2bnI5a0P4vJXWIMpI5Y
	yfgHjWtH2rsr26cIQCM7muXG9ARKMqe0XRVzue5cogS4DHDhUYDyn5GmUfs4eH2YKHZXY2p+FCx9Z
	kQCTe40Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0e4h-0000000A7AA-426O;
	Mon, 22 Sep 2025 10:47:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0e4f-0000000A79U-2o73
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 10:47:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 54B3640919;
	Mon, 22 Sep 2025 10:47:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD375C4CEF0;
	Mon, 22 Sep 2025 10:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758538033;
	bh=5wrwo5Dx5awItaR1obuaJIJiS37s0dpVkSAowpkf4PM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hp6NooUDuR6ilyAslj7UVm2g2vpSqNkg+z+eMVhbwssw1WXb1E/8Ia14HGZb+l8M0
	 T/RgvS/XYaOX7f7Nu369N4YDMiCKrMFpqLdx9n/RDXH/6To4XDG3117gyNQRb4FeCx
	 J8JR2sv8SN1RPwqlWGRqMQ0dYlEj47fwzIXsr0Amr4xf9sK7Sd09jpLURop3jznx2H
	 nel+4I8KqdQgG/fl6bXshFzmlhjkN8A8slYGzdSByIM0YASn3kFCvUYP70cFZraduW
	 1B7P8FERT9KL9Zbips19SUJY7oFRIJvR0tNi4GpDYkCdCMxIJgUDXnVDlXFdqL2rUW
	 1iKX9VieytiRg==
Date: Mon, 22 Sep 2025 11:47:06 +0100
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
Message-ID: <aNEpKjjwO_Ms6U7S@willie-the-truck>
References: <20250911034655.3916002-1-ankur.a.arora@oracle.com>
 <20250911034655.3916002-2-ankur.a.arora@oracle.com>
 <aMxgsh3AVO5_CCqf@willie-the-truck>
 <87qzw2f1rv.fsf@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87qzw2f1rv.fsf@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_034713_725855_D4CC83C6 
X-CRM114-Status: GOOD (  19.60  )
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

On Fri, Sep 19, 2025 at 04:41:56PM -0700, Ankur Arora wrote:
> Will Deacon <will@kernel.org> writes:
> > On Wed, Sep 10, 2025 at 08:46:51PM -0700, Ankur Arora wrote:
> >> +	for (;;) {							\
> >> +		VAL = READ_ONCE(*__PTR);				\
> >> +		if (cond_expr)						\
> >> +			break;						\
> >> +		cpu_relax();						\
> >> +		if (++__n < __spin)					\
> >> +			continue;					\
> >> +		if (time_check_expr)					\
> >> +			break;						\
> >
> > There's a funny discrepancy here when compared to the arm64 version in
> > the next patch. Here, if we time out, then the value returned is
> > potentially quite stale because it was read before the last cpu_relax().
> > In the arm64 patch, the timeout check is before the cmpwait/cpu_relax(),
> > which I think is better.
> 
> So, that's a good point. But, the return value being stale also seems to
> be incorrect.
> 
> > Regardless, I think having the same behaviour for the two implementations
> > would be a good idea.
> 
> Yeah agreed.
> 
> As you outlined in the other mail, how about something like this:
> 
> #ifndef smp_cond_load_relaxed_timeout
> #define smp_cond_load_relaxed_timeout(ptr, cond_expr, time_check_expr)	\
> ({									\
> 	typeof(ptr) __PTR = (ptr);					\
> 	__unqual_scalar_typeof(*ptr) VAL;				\
> 	u32 __n = 0, __poll = SMP_TIMEOUT_POLL_COUNT;			\
> 									\
> 	for (;;) {							\
> 		VAL = READ_ONCE(*__PTR);				\
> 		if (cond_expr)						\
> 			break;						\
> 		cpu_poll_relax();					\
> 		if (++__n < __poll)					\
> 			continue;					\
> 		if (time_check_expr) {					\
> 			VAL = READ_ONCE(*__PTR);			\
> 			break;						\
> 		}							\
> 		__n = 0;						\
> 	}								\
> 	(typeof(*ptr))VAL;						\
> })
> #endif

That looks better to me, thanks.

Will

