Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50385CA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 10:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Vigy/juMXsMxO7jPK9oodOECQJjX/OUJcKZNlgqpCk=; b=l6DnwAgUDS5V9GImhSa2vpJiRu
	l3cDjYO0giBVhOPiX/7blwk1Bqiy9yNjgSqBw4NnYIYYpzI4z0H5RABzouh1zX/gcVUdShx9oPF8A
	SGeprMDoi/eJwvAND38ZfKnO8spwlF9nZLdX7eQQEwc9Vw3VPwRg3xr0edwS6zHDdLTH1Od/ZyXMw
	CR0I6Vrf2pKMTD6ikoBFzqguMJ9aX4bubnJYqP7mFn87WfYdFab/iztW4wVmaITNz9OnBUcYFC7qi
	gkSBV4xeDdTU0qRUI74ZVVOkHT5EgeGLv3Wb3V4pS2dRLtR00h5WzR+HqITMtRku/BHzYHBniFH6B
	vcn16T7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utkqV-0000000674O-1ktp;
	Wed, 03 Sep 2025 10:36:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utjm1-00000005vhn-0YI5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 09:27:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8DE6C44776;
	Wed,  3 Sep 2025 09:27:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52E21C4CEF0;
	Wed,  3 Sep 2025 09:27:21 +0000 (UTC)
Date: Wed, 3 Sep 2025 10:27:18 +0100
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
Subject: Re: [PATCH v4 0/5] barrier: Add smp_cond_load_*_timewait()
Message-ID: <aLgJ9iqQhq-LT9S0@arm.com>
References: <20250829080735.3598416-1-ankur.a.arora@oracle.com>
 <aLWITwwDg06F1eXu@arm.com>
 <87tt1kpj4z.fsf@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tt1kpj4z.fsf@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_022725_182697_9D8D6515 
X-CRM114-Status: GOOD (  23.74  )
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

On Tue, Sep 02, 2025 at 03:46:52PM -0700, Ankur Arora wrote:
> Catalin Marinas <catalin.marinas@arm.com> writes:
> > Can you have a go at poll_idle() to see how it would look like using
> > this API? It doesn't necessarily mean we have to merge them all at once
> > but it gives us a better idea of the suitability of the interface.
> 
> So, I've been testing with some version of the following:
> 
> diff --git a/drivers/cpuidle/poll_state.c b/drivers/cpuidle/poll_state.c
> index 9b6d90a72601..361879396d0c 100644
> --- a/drivers/cpuidle/poll_state.c
> +++ b/drivers/cpuidle/poll_state.c
> @@ -8,35 +8,25 @@
>  #include <linux/sched/clock.h>
>  #include <linux/sched/idle.h>
> 
> -#define POLL_IDLE_RELAX_COUNT	200
> -
>  static int __cpuidle poll_idle(struct cpuidle_device *dev,
>  			       struct cpuidle_driver *drv, int index)
>  {
> -	u64 time_start;
> -
> -	time_start = local_clock_noinstr();
> +	unsigned long flags;
> 
>  	dev->poll_time_limit = false;
> 
>  	raw_local_irq_enable();
>  	if (!current_set_polling_and_test()) {
> -		unsigned int loop_count = 0;
> -		u64 limit;
> +		u64 limit, time_end;
> 
>  		limit = cpuidle_poll_time(drv, dev);
> +		time_end = local_clock_noinstr() + limit;
> 
> -		while (!need_resched()) {
> -			cpu_relax();
> -			if (loop_count++ < POLL_IDLE_RELAX_COUNT)
> -				continue;
> +		flags = smp_cond_load_relaxed_timewait(&current_thread_info()->flags,
> +						       VAL & _TIF_NEED_RESCHED,
> +						       (local_clock_noinstr() >= time_end));

It makes sense to have the non-strict comparison, though it changes the
original behaviour slightly. Just mention it in the commit log.

> 
> -			loop_count = 0;
> -			if (local_clock_noinstr() - time_start > limit) {
> -				dev->poll_time_limit = true;
> -				break;
> -			}
> -		}
> +		dev->poll_time_limit = (local_clock_noinstr() >= time_end);

Could we do this instead and avoid another clock read:

		dev->poll_time_limit = !(flags & _TIF_NEED_RESCHED);

In the original code, it made sense since it had to check the clock
anyway and break the loop.

When you repost, please include the rqspinlock and poll_idle changes as
well to show how the interface is used.

-- 
Catalin

