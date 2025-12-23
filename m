Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B4CE6F093
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 15:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XTeynD7R3f8TSWusp/I0+MZqGGvggeKphRRbdhM4fhk=; b=rhhIEWVIiZGDM4ONVtJpmWCc3d
	qtAu+hsMY4P6C6NxSjjDb/6+TgrCNRuspiuHZsUVZJEaomy7faR7f8UtQvnmHdV/sRMGP0r7mfFZI
	TO7Sf5463Hltj6QQ1mttor+BjGNoAjhSQuSHHJsdjCmjJ/zMdTBVcv7Wcls3wDxktYKgNGYqVPlHd
	nnOplhy0EVwAvbIQzlpMfXZOt6ahlLen1+sdC67Mjzd/7rP/cxjKpIY0ddxchRhCq/TF9FhO33omW
	wtyu0CjgBYridtdIJI7NMd+XxyGn/UEjGLniRXi3DkMhU1bN24FjYmENHCqBew5cvIayXqyxiiO74
	z70+vpkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY49D-0000000FfPZ-0pjH;
	Tue, 23 Dec 2025 15:18:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY49A-0000000FfP5-1I8I
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 15:18:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ED27943BD0;
	Tue, 23 Dec 2025 15:17:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C86DC113D0;
	Tue, 23 Dec 2025 15:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766503078;
	bh=xHMvPjpKyxjB5+zEUkjOy7aEQZr7/WEBY7QJCb1Hs8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qWsF7jIJOslT8s1S7u/8bjnxl+YQ/1ByeQ1ewt/+rY/9WYG7O1ARU2wUEC0MpvUkt
	 nJ29+l60fflZZupPoGJY+iB2n0drXAFhG9mh6pnuMBJb+Q3dWKObeiO7STxE+Fl2lq
	 /KJl7wC7I4QxiKm6M1Zpl1TE/4K8VCzBQpRQArSOLRIrhIRdNuylIsV4o8rCr8jETr
	 eubw6Onv5VRePw33jttvcPvJiaJCMvHFthEnaBXxiGC8xSNdWgKZcgBD+Fs1McLBoa
	 6Zqxp/0BvGVhgeE0KZ5Sh8GsmQJZ+tbuC+UMA/z97aVCaWhHitaOxuz7S+m+nR/Dcu
	 HtgrcvRm/JsRw==
Date: Tue, 23 Dec 2025 16:17:55 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Chen Ridong <chenridong@huaweicloud.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
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
	Vlastimil Babka <vbabka@suse.cz>, Waiman Long <longman@redhat.com>,
	Will Deacon <will@kernel.org>, cgroups@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org,
	linux-mm@kvack.org, linux-pci@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 17/31] cpuset: Propagate cpuset isolation update to
 workqueue through housekeeping
Message-ID: <aUqyo58-CDReEm10@localhost.localdomain>
References: <20251105210348.35256-1-frederic@kernel.org>
 <20251105210348.35256-18-frederic@kernel.org>
 <e0b3f050-ef2e-478e-9e22-5f800b86ee42@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e0b3f050-ef2e-478e-9e22-5f800b86ee42@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_071800_394484_40A07D92 
X-CRM114-Status: GOOD (  26.04  )
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

Le Thu, Nov 06, 2025 at 08:55:42AM +0800, Chen Ridong a écrit :
> 
> 
> On 2025/11/6 5:03, Frederic Weisbecker wrote:
> > Until now, cpuset would propagate isolated partition changes to
> > workqueues so that unbound workers get properly reaffined.
> > 
> > Since housekeeping now centralizes, synchronize and propagates isolation
> > cpumask changes, perform the work from that subsystem for consolidation
> > and consistency purposes.
> > 
> > For simplification purpose, the target function is adapted to take the
> > new housekeeping mask instead of the isolated mask.
> > 
> > Suggested-by: Tejun Heo <tj@kernel.org>
> > Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> > ---
> >  include/linux/workqueue.h |  2 +-
> >  init/Kconfig              |  1 +
> >  kernel/cgroup/cpuset.c    | 14 ++++++--------
> >  kernel/sched/isolation.c  |  4 +++-
> >  kernel/workqueue.c        | 17 ++++++++++-------
> >  5 files changed, 21 insertions(+), 17 deletions(-)
> > 
> > diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
> > index dabc351cc127..a4749f56398f 100644
> > --- a/include/linux/workqueue.h
> > +++ b/include/linux/workqueue.h
> > @@ -588,7 +588,7 @@ struct workqueue_attrs *alloc_workqueue_attrs_noprof(void);
> >  void free_workqueue_attrs(struct workqueue_attrs *attrs);
> >  int apply_workqueue_attrs(struct workqueue_struct *wq,
> >  			  const struct workqueue_attrs *attrs);
> > -extern int workqueue_unbound_exclude_cpumask(cpumask_var_t cpumask);
> > +extern int workqueue_unbound_housekeeping_update(const struct cpumask *hk);
> >  
> >  extern bool queue_work_on(int cpu, struct workqueue_struct *wq,
> >  			struct work_struct *work);
> > diff --git a/init/Kconfig b/init/Kconfig
> > index cab3ad28ca49..a1b3a3b66bfc 100644
> > --- a/init/Kconfig
> > +++ b/init/Kconfig
> > @@ -1247,6 +1247,7 @@ config CPUSETS
> >  	bool "Cpuset controller"
> >  	depends on SMP
> >  	select UNION_FIND
> > +	select CPU_ISOLATION
> >  	help
> >  	  This option will let you create and manage CPUSETs which
> >  	  allow dynamically partitioning a system into sets of CPUs and
> > diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> > index b04a4242f2fa..ea102e4695a5 100644
> > --- a/kernel/cgroup/cpuset.c
> > +++ b/kernel/cgroup/cpuset.c
> > @@ -1392,7 +1392,7 @@ static bool partition_xcpus_del(int old_prs, struct cpuset *parent,
> >  	return isolcpus_updated;
> >  }
> >  
> > -static void update_unbound_workqueue_cpumask(bool isolcpus_updated)
> > +static void update_housekeeping_cpumask(bool isolcpus_updated)
> >  {
> >  	int ret;
> >  
> > @@ -1401,8 +1401,6 @@ static void update_unbound_workqueue_cpumask(bool isolcpus_updated)
> >  	if (!isolcpus_updated)
> >  		return;
> >  
> > -	ret = workqueue_unbound_exclude_cpumask(isolated_cpus);
> > -	WARN_ON_ONCE(ret < 0);
> >  	ret = housekeeping_update(isolated_cpus, HK_TYPE_DOMAIN);
> >  	WARN_ON_ONCE(ret < 0);
> >  }
> > @@ -1558,7 +1556,7 @@ static int remote_partition_enable(struct cpuset *cs, int new_prs,
> >  	list_add(&cs->remote_sibling, &remote_children);
> >  	cpumask_copy(cs->effective_xcpus, tmp->new_cpus);
> >  	spin_unlock_irq(&callback_lock);
> > -	update_unbound_workqueue_cpumask(isolcpus_updated);
> > +	update_housekeeping_cpumask(isolcpus_updated);
> >  	cpuset_force_rebuild();
> >  	cs->prs_err = 0;
> >  
> > @@ -1599,7 +1597,7 @@ static void remote_partition_disable(struct cpuset *cs, struct tmpmasks *tmp)
> >  	compute_excpus(cs, cs->effective_xcpus);
> >  	reset_partition_data(cs);
> >  	spin_unlock_irq(&callback_lock);
> > -	update_unbound_workqueue_cpumask(isolcpus_updated);
> > +	update_housekeeping_cpumask(isolcpus_updated);
> >  	cpuset_force_rebuild();
> >  
> >  	/*
> > @@ -1668,7 +1666,7 @@ static void remote_cpus_update(struct cpuset *cs, struct cpumask *xcpus,
> >  	if (xcpus)
> >  		cpumask_copy(cs->exclusive_cpus, xcpus);
> >  	spin_unlock_irq(&callback_lock);
> > -	update_unbound_workqueue_cpumask(isolcpus_updated);
> > +	update_housekeeping_cpumask(isolcpus_updated);
> >  	if (adding || deleting)
> >  		cpuset_force_rebuild();
> >  
> > @@ -2027,7 +2025,7 @@ static int update_parent_effective_cpumask(struct cpuset *cs, int cmd,
> >  		WARN_ON_ONCE(parent->nr_subparts < 0);
> >  	}
> >  	spin_unlock_irq(&callback_lock);
> > -	update_unbound_workqueue_cpumask(isolcpus_updated);
> > +	update_housekeeping_cpumask(isolcpus_updated);
> >  
> >  	if ((old_prs != new_prs) && (cmd == partcmd_update))
> >  		update_partition_exclusive_flag(cs, new_prs);
> > @@ -3047,7 +3045,7 @@ static int update_prstate(struct cpuset *cs, int new_prs)
> >  	else if (isolcpus_updated)
> >  		isolated_cpus_update(old_prs, new_prs, cs->effective_xcpus);
> >  	spin_unlock_irq(&callback_lock);
> > -	update_unbound_workqueue_cpumask(isolcpus_updated);
> > +	update_housekeeping_cpumask(isolcpus_updated);
> >  
> 
> The patch [1] has been applied to cgroup/for-next, you may have to adapt it.
> 
> [1]:
> https://lore.kernel.org/cgroups/20251105043848.382703-6-longman@redhat.com/T/#u

Right, I just waited for -rc1 to pop-up before doing that.
v5 will follow shortly.

Thanks.

> 
> -- 
> Best regards,
> Ridong
> 

-- 
Frederic Weisbecker
SUSE Labs

