Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F01CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 10:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ybf0+jTINfMOxIVudO0rvz89EkDqS1LjNEy+tFtTCEQ=; b=ZT6GW9jUC0u9g/zozHlYL5y9pv
	4vbbFiHjjT+K33NFB+kydDGvw30fF+yYOLvv1YTa82rBZbSQUmuPaDwlx4mHXGXxCyvwYWoOkEXCu
	LLHJXXiFyXNi5uVHfFWi9R6AEjbI/55PfC61xliQsx6f9Bpw6qmcVwCdrLN2uKEEpcBdJazMAcZwR
	Gu/CretROCsqCNuQ3l4v5C+Kh3kD6+6Zk7YVmbQQDKqB7TPUr1f28ICQnRdHQyBC0yYeYQndO0N6o
	Y9GmKgjxrrD4b+o3AZhkg9KaxAvQr9aadkMExmCo3Rmbg2s+81Zd0+KitCutAjg8LXvRPnqhnnFNf
	IlJz7wow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0nf-00000008VWk-3ynU;
	Fri, 12 Sep 2025 10:14:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0nf-00000008VVr-0r3a
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 10:14:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9B6EC601AF;
	Fri, 12 Sep 2025 10:14:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A1AFC4CEF1;
	Fri, 12 Sep 2025 10:14:35 +0000 (UTC)
Date: Fri, 12 Sep 2025 11:14:32 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
	arnd@arndb.de, will@kernel.org, peterz@infradead.org,
	akpm@linux-foundation.org, mark.rutland@arm.com,
	harisokn@amazon.com, cl@gentwo.org, ast@kernel.org,
	zhenglifeng1@huawei.com, xueshuai@linux.alibaba.com,
	joao.m.martins@oracle.com, boris.ostrovsky@oracle.com,
	konrad.wilk@oracle.com
Subject: Re: [PATCH v5 5/5] rqspinlock: Use smp_cond_load_acquire_timeout()
Message-ID: <aMPyiKuzGh4L4gD8@arm.com>
References: <20250911034655.3916002-1-ankur.a.arora@oracle.com>
 <20250911034655.3916002-6-ankur.a.arora@oracle.com>
 <aMLdZyjYqFY1xxFD@arm.com>
 <CAP01T74XjRJGzT7BV3PYQOQOwZVud3nL7HfcW3kzU_fPFekNHg@mail.gmail.com>
 <87o6rgk5xd.fsf@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o6rgk5xd.fsf@oracle.com>
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

On Thu, Sep 11, 2025 at 02:58:22PM -0700, Ankur Arora wrote:
> 
> Kumar Kartikeya Dwivedi <memxor@gmail.com> writes:
> 
> > On Thu, 11 Sept 2025 at 16:32, Catalin Marinas <catalin.marinas@arm.com> wrote:
> >>
> >> On Wed, Sep 10, 2025 at 08:46:55PM -0700, Ankur Arora wrote:
> >> > Switch out the conditional load inerfaces used by rqspinlock
> >> > to smp_cond_read_acquire_timeout().
> >> > This interface handles the timeout check explicitly and does any
> >> > necessary amortization, so use check_timeout() directly.
> >>
> >> It's worth mentioning that the default smp_cond_load_acquire_timeout()
> >> implementation (without hardware support) only spins 200 times instead
> >> of 16K times in the rqspinlock code. That's probably fine but it would
> >> be good to have confirmation from Kumar or Alexei.
> >>
> >
> > This looks good, but I would still redefine the spin count from 200 to
> > 16k for rqspinlock.c, especially because we need to keep
> > RES_CHECK_TIMEOUT around which still uses 16k spins to amortize
> > check_timeout.
> 
> By my count that amounts to ~100us per check_timeout() on x86
> systems I've tested with cpu_relax(). Which seems quite reasonable.
> 
> 16k also seems safer on CPUs where cpu_relax() is basically a NOP.

Does this spin count work for poll_idle()? I don't remember where the
200 value came from.

-- 
Catalin

