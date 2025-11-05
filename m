Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 619AFCCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 15:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=69Av0KmPY+24sP5NTMN6vf2Kt/djTSytmW8AbmQUrVg=; b=1fPrQ8QatAmrrrZ5TVgqydh801
	f341Fl1thbJ1OGMnmKlRpRV9UC//JjSkIPVIj4x3Dy8sT6STxVML/0I/Xf8Ep2GOEcfFwZLILd+YZ
	o68ekNMH3s//B+n+cw7xI9aWuFPIA43AsU6rsIMSaKwErJNFIGAXf2CVw/HqnjTl1CB2pFIZNXUSu
	Zn59Ou1BC5z+ckXPchxzYJuT7vMmby898V4mhA2uKxCU8XUvLaJVggUxnv5IhhgBu+15M1oFQXdqy
	glC84tVBTfsQ2W6RrjXiQehkY9mnFWlvQNMxLFuTJK9mQcS0cX6ZXLhiutHfxJYBa0bmu97MDOPvE
	t/IodpvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGfel-0000000DyBl-0FgN;
	Wed, 05 Nov 2025 15:42:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGfej-0000000DyBT-2exl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 15:42:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9999E6021E;
	Wed,  5 Nov 2025 15:42:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C476DC4CEF5;
	Wed,  5 Nov 2025 15:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762357360;
	bh=boPYeqvdKW7/3CnEhFVgNn0FsAC8XrMy6K95gzM+WjE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qW/SfRcZancAa0hsqKFnQRd29sYyNjQPo/6bgXUIdWQkQrCQ8SrjNfLEv2gd6QIbJ
	 KNvHuiS8u4kGDpix1rUv2FrtZNIpRj8+YRbgkYtOcqokgdP5Lelomta91mDjj2utK2
	 pJNN+t5ySqiy5B4IWOvfB+wUu7vtmplfUpxRFlJl/ItWWlSKTIKtO8NPw3lyVBm6hy
	 PX81LQiCi7jb6e0lest8AkXP8Ttp7CHR2CEtZJBks+yM2bue/m166kiurBIXHdyHQN
	 xXNTc0DdAqJPwKz19FVfa5KCbSwDOT4ZdNrwR2USJYY4x2nd++Gx+PqPUsZ/tGWHsn
	 0JuvFbPfX+vtQ==
Date: Wed, 5 Nov 2025 16:42:37 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Waiman Long <llong@redhat.com>
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
	Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
	cgroups@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-block@vger.kernel.org, linux-mm@kvack.org,
	linux-pci@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 13/33] cpuset: Update HK_TYPE_DOMAIN cpumask from cpuset
Message-ID: <aQtwbRrFBCUoQ2Yj@localhost.localdomain>
References: <20251013203146.10162-1-frederic@kernel.org>
 <20251013203146.10162-14-frederic@kernel.org>
 <0e02915f-bde7-4b04-b760-89f34fb0a436@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0e02915f-bde7-4b04-b760-89f34fb0a436@redhat.com>
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

Le Tue, Oct 21, 2025 at 12:10:16AM -0400, Waiman Long a écrit :
> On 10/13/25 4:31 PM, Frederic Weisbecker wrote:
> > Until now, HK_TYPE_DOMAIN used to only include boot defined isolated
> > CPUs passed through isolcpus= boot option. Users interested in also
> > knowing the runtime defined isolated CPUs through cpuset must use
> > different APIs: cpuset_cpu_is_isolated(), cpu_is_isolated(), etc...
> > 
> > There are many drawbacks to that approach:
> > 
> > 1) Most interested subsystems want to know about all isolated CPUs, not
> >    just those defined on boot time.
> > 
> > 2) cpuset_cpu_is_isolated() / cpu_is_isolated() are not synchronized with
> >    concurrent cpuset changes.
> > 
> > 3) Further cpuset modifications are not propagated to subsystems
> > 
> > Solve 1) and 2) and centralize all isolated CPUs within the
> > HK_TYPE_DOMAIN housekeeping cpumask.
> > 
> > Subsystems can rely on RCU to synchronize against concurrent changes.
> > 
> > The propagation mentioned in 3) will be handled in further patches.
> > 
> > Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> > ---
> >   include/linux/sched/isolation.h |  2 +
> >   kernel/cgroup/cpuset.c          |  2 +
> >   kernel/sched/isolation.c        | 75 ++++++++++++++++++++++++++++++---
> >   kernel/sched/sched.h            |  1 +
> >   4 files changed, 74 insertions(+), 6 deletions(-)
> > 
> > diff --git a/include/linux/sched/isolation.h b/include/linux/sched/isolation.h
> > index da22b038942a..94d5c835121b 100644
> > --- a/include/linux/sched/isolation.h
> > +++ b/include/linux/sched/isolation.h
> > @@ -32,6 +32,7 @@ extern const struct cpumask *housekeeping_cpumask(enum hk_type type);
> >   extern bool housekeeping_enabled(enum hk_type type);
> >   extern void housekeeping_affine(struct task_struct *t, enum hk_type type);
> >   extern bool housekeeping_test_cpu(int cpu, enum hk_type type);
> > +extern int housekeeping_update(struct cpumask *mask, enum hk_type type);
> >   extern void __init housekeeping_init(void);
> >   #else
> > @@ -59,6 +60,7 @@ static inline bool housekeeping_test_cpu(int cpu, enum hk_type type)
> >   	return true;
> >   }
> > +static inline int housekeeping_update(struct cpumask *mask, enum hk_type type) { return 0; }
> >   static inline void housekeeping_init(void) { }
> >   #endif /* CONFIG_CPU_ISOLATION */
> > diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> > index aa1ac7bcf2ea..b04a4242f2fa 100644
> > --- a/kernel/cgroup/cpuset.c
> > +++ b/kernel/cgroup/cpuset.c
> > @@ -1403,6 +1403,8 @@ static void update_unbound_workqueue_cpumask(bool isolcpus_updated)
> >   	ret = workqueue_unbound_exclude_cpumask(isolated_cpus);
> >   	WARN_ON_ONCE(ret < 0);
> > +	ret = housekeeping_update(isolated_cpus, HK_TYPE_DOMAIN);
> > +	WARN_ON_ONCE(ret < 0);
> >   }
> >   /**
> > diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
> > index b46c20b5437f..95d69c2102f6 100644
> > --- a/kernel/sched/isolation.c
> > +++ b/kernel/sched/isolation.c
> > @@ -29,18 +29,48 @@ static struct housekeeping housekeeping;
> >   bool housekeeping_enabled(enum hk_type type)
> >   {
> > -	return !!(housekeeping.flags & BIT(type));
> > +	return !!(READ_ONCE(housekeeping.flags) & BIT(type));
> >   }
> >   EXPORT_SYMBOL_GPL(housekeeping_enabled);
> > +static bool housekeeping_dereference_check(enum hk_type type)
> > +{
> > +	if (IS_ENABLED(CONFIG_LOCKDEP) && type == HK_TYPE_DOMAIN) {
> > +		/* Cpuset isn't even writable yet? */
> > +		if (system_state <= SYSTEM_SCHEDULING)
> > +			return true;
> > +
> > +		/* CPU hotplug write locked, so cpuset partition can't be overwritten */
> > +		if (IS_ENABLED(CONFIG_HOTPLUG_CPU) && lockdep_is_cpus_write_held())
> > +			return true;
> > +
> > +		/* Cpuset lock held, partitions not writable */
> > +		if (IS_ENABLED(CONFIG_CPUSETS) && lockdep_is_cpuset_held())
> > +			return true;
> 
> I have some doubt about this condition as the cpuset_mutex may be held in
> the process of making changes to an isolated partition that will impact
> HK_TYPE_DOMAIN cpumask.

Indeed and therefore if the current process is holding the cpuset mutex,
it is guaranteed that no other process will update the housekeeping cpumask
concurrently.

So the housekeeping mask is guaranteed to be stable, right? Of course
the current task may be changing it but while it is changing it, it is
not reading it.

Thanks.

> 
> Cheers,
> Longman
> 

-- 
Frederic Weisbecker
SUSE Labs

