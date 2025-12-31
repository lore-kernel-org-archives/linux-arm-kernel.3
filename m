Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 324BAEE6428
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 15:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VCjFp+pDGdRxDrsKK6M4AzYjr8nKeM2d1aD4T1BGjPU=; b=D2goFt7GdiGwYBK29Tco7768kk
	iU7WdG9eY+YNd+sciFLuoF3zEfYevJxulORkwaiezEbG5AH7FASwCHh47O9j0B7Vx7aL6PefqD9k6
	T5IBlmlXj9hthz3srQEDCWYC522ku527NOW1bYbRhF9dk/UfbByIg0CwF6P9k945bYefuBaeuY8Fl
	nqiEneAi0mAxiT/8KzC3TwozH8hs2X8ix8cqINT9AtrBy3tSovcvTwSpJTy5jYj5mV5/6sFMnkjQQ
	+m1V8jONtCgUjjO0OWC+Fg/wmqafJJLAn4L2DEOHJNn861yfR8QJv9lg6TZ/7lr26FV6MpWk+Xtda
	YqZGnABQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vayVa-000000066ex-3pvD;
	Wed, 31 Dec 2025 15:53:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vayVX-000000066eQ-3oH7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 15:53:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CA2EF405A3;
	Wed, 31 Dec 2025 15:53:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1961DC113D0;
	Wed, 31 Dec 2025 15:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767196386;
	bh=WuZtOdVS5pt77HE6C/4UqSC04WxBcGthdWDuudQRYgg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VxDab8BYNIAerqtNV5zwvbjoskp/SPlehgZo8EmzUsqwfpTjb+PHLvjB3/Qja0h31
	 UULkJOtXQH1SfmAb7vyAh6oIHb0OjR053QxyQL9jp1E2EPXisgst2fDkb6Pwm1biyT
	 VWmvvozz2gG6CzWs1cAr3cftru801On2WHgnh2PLITLRtRFg3votB3ExybxAyD/TCc
	 E9pfkXScaZOYlT/k3gRfSRJG9ofOzMXgcL5MwRQUb7FcyRsFHUs49yU5OMxzP78nXN
	 a9Vs6QnYfGFU1BHGsY59xWhfGdN5QneBF7NTvxT2/ddwqD5zYUeX9DP8WxIh0e0M9/
	 Gody5xZN6Kx0w==
Date: Wed, 31 Dec 2025 16:53:03 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Waiman Long <llong@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Chen Ridong <chenridong@huawei.com>,
	Danilo Krummrich <dakr@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Gabriele Monaco <gmonaco@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	Jens Axboe <axboe@kernel.dk>, Johannes Weiner <hannes@cmpxchg.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>,
	Paolo Abeni <pabeni@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>, Phil Auld <pauld@redhat.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Simon Horman <horms@kernel.org>, Tejun Heo <tj@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
	cgroups@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-block@vger.kernel.org, linux-mm@kvack.org,
	linux-pci@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 19/33] cpuset: Propagate cpuset isolation update to
 timers through housekeeping
Message-ID: <aVVG3-NBYIhJmVsk@localhost.localdomain>
References: <20251224134520.33231-1-frederic@kernel.org>
 <20251224134520.33231-20-frederic@kernel.org>
 <a8262eaf-169d-415d-949e-70f1a17b1e38@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a8262eaf-169d-415d-949e-70f1a17b1e38@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_075307_998769_445DC510 
X-CRM114-Status: GOOD (  20.05  )
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

Le Fri, Dec 26, 2025 at 03:40:25PM -0500, Waiman Long a écrit :
> On 12/24/25 8:45 AM, Frederic Weisbecker wrote:
> > Until now, cpuset would propagate isolated partition changes to
> > timer migration so that unbound timers don't get migrated to isolated
> > CPUs.
> > 
> > Since housekeeping now centralizes, synchronize and propagates isolation
> > cpumask changes, perform the work from that subsystem for consolidation
> > and consistency purposes.
> > 
> > Signed-off-by: Frederic Weisbecker<frederic@kernel.org>
> > ---
> >   kernel/cgroup/cpuset.c   | 3 ---
> >   kernel/sched/isolation.c | 5 +++++
> >   2 files changed, 5 insertions(+), 3 deletions(-)
> > 
> > diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> > index a492d23dd622..25ac6c98113c 100644
> > --- a/kernel/cgroup/cpuset.c
> > +++ b/kernel/cgroup/cpuset.c
> > @@ -1487,9 +1487,6 @@ static void update_isolation_cpumasks(void)
> >   	ret = housekeeping_update(isolated_cpus, HK_TYPE_DOMAIN);
> >   	WARN_ON_ONCE(ret < 0);
> > -	ret = tmigr_isolated_exclude_cpumask(isolated_cpus);
> > -	WARN_ON_ONCE(ret < 0);
> > -
> >   	isolated_cpus_updating = false;
> >   }
> > diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
> > index d224bca299ed..84a257d05918 100644
> > --- a/kernel/sched/isolation.c
> > +++ b/kernel/sched/isolation.c
> > @@ -150,7 +150,12 @@ int housekeeping_update(struct cpumask *isol_mask, enum hk_type type)
> >   	pci_probe_flush_workqueue();
> >   	mem_cgroup_flush_workqueue();
> >   	vmstat_flush_workqueue();
> > +
> >   	err = workqueue_unbound_housekeeping_update(housekeeping_cpumask(type));
> > +	WARN_ON_ONCE(err < 0);
> > +
> > +	err = tmigr_isolated_exclude_cpumask(isol_mask);
> > +	WARN_ON_ONCE(err < 0);
> >   	kfree(old);
> 
> If you are doing "WARN_ON_ONCE() in housekeeping_update(), you don't need to
> do it in update_isolation_cpumask() to avoid double warnings. Actually, you
> don't need to return an error code from housekeeping_update() at all.
> 
> Cheers, Longman

Ok, I'm keeping the error return for allocation failures at the beginning of
housekeeping_update() but the rest will only warn in place.

Thanks.

-- 
Frederic Weisbecker
SUSE Labs

