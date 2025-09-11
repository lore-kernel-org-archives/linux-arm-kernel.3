Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3311DCAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 14:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=isoS7iLp3i1Cz1MMskPCA9cJCwQs8S5vV77yduiBT4o=; b=IG+OUfytFKlwqZXyqBoCcyS+E/
	2XeFJPF3seud7OV/+yW/UZRj7FEtTaaFY2HqsW88MXL24r/dYOKgPggLi/US/AekHhEuH6OdT1Pmd
	YQ012h4F5f31yTZEwt8HI8nAgOzT4ODtP7iqcM8P+6FMmN+9180N7k4Ufz7fN4qLtD4ZBm1L5XbEM
	G3YwO7a7PPH/9e2gFdLotRhreHDE2zyREu+mtRuiy7J8ADk6kDDWCEj3zQmA1thFX5YH1STZ0UiBG
	L8k/HTDkw4inaWkZZM0kDXIfhx7TftjH890Qb4Njha065dsk/Iy+K8nr8g4Mw74qfUk7OSyliHFgh
	IHFBrKvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwiLS-00000003ZZq-2FTX;
	Thu, 11 Sep 2025 14:32:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwiLP-00000003ZXW-46K2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 14:32:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1A0A5438D8;
	Thu, 11 Sep 2025 14:32:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9786C4CEF0;
	Thu, 11 Sep 2025 14:32:10 +0000 (UTC)
Date: Thu, 11 Sep 2025 15:32:07 +0100
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
Subject: Re: [PATCH v5 5/5] rqspinlock: Use smp_cond_load_acquire_timeout()
Message-ID: <aMLdZyjYqFY1xxFD@arm.com>
References: <20250911034655.3916002-1-ankur.a.arora@oracle.com>
 <20250911034655.3916002-6-ankur.a.arora@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911034655.3916002-6-ankur.a.arora@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_073216_033377_42A9CE66 
X-CRM114-Status: GOOD (  14.47  )
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

On Wed, Sep 10, 2025 at 08:46:55PM -0700, Ankur Arora wrote:
> Switch out the conditional load inerfaces used by rqspinlock
> to smp_cond_read_acquire_timeout().
> This interface handles the timeout check explicitly and does any
> necessary amortization, so use check_timeout() directly.

It's worth mentioning that the default smp_cond_load_acquire_timeout()
implementation (without hardware support) only spins 200 times instead
of 16K times in the rqspinlock code. That's probably fine but it would
be good to have confirmation from Kumar or Alexei.

> diff --git a/kernel/bpf/rqspinlock.c b/kernel/bpf/rqspinlock.c
> index 5ab354d55d82..4d2c12d131ae 100644
> --- a/kernel/bpf/rqspinlock.c
> +++ b/kernel/bpf/rqspinlock.c
[...]
> @@ -313,11 +307,8 @@ EXPORT_SYMBOL_GPL(resilient_tas_spin_lock);
>   */
>  static DEFINE_PER_CPU_ALIGNED(struct qnode, rqnodes[_Q_MAX_NODES]);
>  
> -#ifndef res_smp_cond_load_acquire
> -#define res_smp_cond_load_acquire(v, c) smp_cond_load_acquire(v, c)
> -#endif
> -
> -#define res_atomic_cond_read_acquire(v, c) res_smp_cond_load_acquire(&(v)->counter, (c))
> +#define res_atomic_cond_read_acquire_timeout(v, c, t)		\
> +	smp_cond_load_acquire_timeout(&(v)->counter, (c), (t))

BTW, we have atomic_cond_read_acquire() which accesses the 'counter' of
an atomic_t. You might as well add an atomic_cond_read_acquire_timeout()
in atomic.h than open-code the atomic_t internals here.

Otherwise the patch looks fine to me, much simpler than the previous
attempt.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

