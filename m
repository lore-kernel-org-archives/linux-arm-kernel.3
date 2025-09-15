Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B06CCAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 11:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ynvDuVyor9glDC06eC6Uh5B21zx5N8e1q2/b468urH0=; b=DV5LTt+LfU0gzdFmyJ5jgsXqsX
	tlmiXG/6AuHc7quqh6+iHiQ2ruYiBNft2zVTOCpiKaDSozTqqEdY11DY1w7ewgPGVpJ5Hr1mRgKIr
	hGYQHEAuAqB+Miv2YMIkxUskwswlpqChNDv45RweaRGesKEvdtLlFrMYdXhLSlkkqnqIUCPIQqxZ8
	oYqHIPaG4ubQE4KYlMytiLh8s7CcRgl2YT1YSLN3zgPn8BFrAutW6dqM/YBw53dBH4FDiaSQQsTGX
	fX8SUdpUybZSvGWx00dLnMpz2JjHmh6tEMxCDA8Tg1K9erxHJ90/eMc9iBeCMh3dGSiv18O1yGFCd
	izemJ34A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy78l-00000003rA2-2Z07;
	Mon, 15 Sep 2025 11:12:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy78i-00000003r9I-41Rv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 11:12:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 21D1844413;
	Mon, 15 Sep 2025 11:12:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E26BBC4CEF1;
	Mon, 15 Sep 2025 11:12:52 +0000 (UTC)
Date: Mon, 15 Sep 2025 12:12:50 +0100
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
Subject: Re: [PATCH v5 0/5] barrier: Add smp_cond_load_*_timeout()
Message-ID: <aMf0sjveqxZXulEi@arm.com>
References: <20250911034655.3916002-1-ankur.a.arora@oracle.com>
 <aMLd2QOFrZnaKcWf@arm.com>
 <87tt18k5y7.fsf@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tt18k5y7.fsf@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_041257_016487_135F8423 
X-CRM114-Status: GOOD (  23.98  )
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

On Thu, Sep 11, 2025 at 02:57:52PM -0700, Ankur Arora wrote:
> Catalin Marinas <catalin.marinas@arm.com> writes:
> > On Wed, Sep 10, 2025 at 08:46:50PM -0700, Ankur Arora wrote:
> >> This series adds waited variants of the smp_cond_load() primitives:
> >> smp_cond_load_relaxed_timeout(), and smp_cond_load_acquire_timeout().
> >>
> >> As the name suggests, the new interfaces are meant for contexts where
> >> you want to wait on a condition variable for a finite duration. This
> >> is easy enough to do with a loop around cpu_relax() and a periodic
> >> timeout check (pretty much what we do in poll_idle(). However, some
> >> architectures (ex. arm64) also allow waiting on a cacheline. So,
> >>
> >>   smp_cond_load_relaxed_timeout(ptr, cond_expr, time_check_expr)
> >>   smp_cond_load_acquire_timeout(ptr, cond_expr, time_check_expr)
> >>
> >> do a mixture of spin/wait with a smp_cond_load() thrown in.
> >>
> >> The added parameter, time_check_expr, determines the bail out condition.
> >>
> >> There are two current users for these interfaces. poll_idle() with
> >> the change:
> >>
> >>   poll_idle() {
> >>       ...
> >>       time_end = local_clock_noinstr() + cpuidle_poll_time(drv, dev);
> >>
> >>       raw_local_irq_enable();
> >>       if (!current_set_polling_and_test())
> >>       	 flags = smp_cond_load_relaxed_timeout(&current_thread_info()->flags,
> >>       					(VAL & _TIF_NEED_RESCHED),
> >>       					((local_clock_noinstr() >= time_end)));
> >>       dev->poll_time_limit = !(flags & _TIF_NEED_RESCHED);
> >>       raw_local_irq_disable();
> >>       ...
> >>   }
> >
> > You should have added this as a patch in the series than include the
> > implementation in the cover letter.
> 
> This was probably an overkill but I wanted to not add another subsystem
> to this series.

If you include it, it's easier to poke the cpuidle maintainers and ask
if they are ok with the proposed API as I want to avoid changing it
afterwards. It doesn't mean they'll have to be merged together, they can
go upstream via separate routes.

> Will take care of the cpuidle changes in the arm64 polling in idle series.

Thanks. We also need Will, Peter Z and Arnd to ack the API and the
generic changes (probably once you added the linux/atomic.h changes).

-- 
Catalin

