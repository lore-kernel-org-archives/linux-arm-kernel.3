Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B44DCCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 16:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vKgmFp8nWO8h1GDsmGQ0ELe9pnrWzbP46AUHBVd32Bk=; b=UOasYiV6HwcqxY0hKU8JCgibll
	/vllfIwDcJOsRtVeqHyOMOfHWi8kxOSgOMAj3RhIKPNl+s3/gr0p6hzj2Hb2cG0GBXhTHVCco4VQR
	pDkDOL3F6QDMVjaxaqByQl6UrRy4ry+HXsY3uouYzezxbcse+XVRsElRgPtwr0/eMH1YG5/5Zxef8
	/RGphh83s1jFPZ+6odB/y3k/Q+7XYROu796+8AxT8WV9eZeiHnKld781BVxFFGyHm250GIvg/CElX
	v1JZpG7/fg+4lKoZqaydZ2h7MV5F0wOceSdexaZKlmUli7WMm2kmHkxy2d7UpCGnBavjsTcId65Bk
	nuWZG9kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGgok-0000000E7ST-1jPg;
	Wed, 05 Nov 2025 16:57:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGgoh-0000000E7RM-42Eq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 16:57:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 224DB43FDE;
	Wed,  5 Nov 2025 16:57:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61FC2C4CEF5;
	Wed,  5 Nov 2025 16:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762361823;
	bh=nhM7jbKOW56d3hh/niEe2UapYbSyWoAGZQptKDlqI44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XkrNSQmVRGDQ0lt4n06gp9o429LO1OThSwSo+tIIP2EJBJlS8ww/ro7sMmGiVdhrM
	 t1rgH6uGlaXnjmVa+q0tT6T/wHZzevQNMI/p1TJa24pvFPEM/3OqPC7DF47OIz9o9m
	 rS7nbd/l2kvzZuGV09bu3MD4TN55uh1avGCcK3xopWmiC5ZLktsFp0az7HaETHuJoY
	 Vh1Stje19/PGgTlt9Jb499Vr+Bcz3Vt9T3rYp8qWR+6Y0CAW4VMy94J4OlikA0BiAP
	 dy2pVF6eF1/01q9zF36JMleysXGqAX5oXg57tsMBxZrtmIJQPGP9L3s7oIbUpsJ6fD
	 yvwf0f0RHi11g==
Date: Wed, 5 Nov 2025 17:57:00 +0100
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
Subject: Re: [PATCH 22/33] kthread: Include unbound kthreads in the managed
 affinity list
Message-ID: <aQuB3Oy7i6Z0SJlA@localhost.localdomain>
References: <20251013203146.10162-1-frederic@kernel.org>
 <20251013203146.10162-23-frederic@kernel.org>
 <ba437129-062a-4a2f-a753-64945e9a13ff@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ba437129-062a-4a2f-a753-64945e9a13ff@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_085704_048963_1C0FE484 
X-CRM114-Status: GOOD (  36.76  )
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

Le Tue, Oct 21, 2025 at 06:42:59PM -0400, Waiman Long a écrit :
> 
> On 10/13/25 4:31 PM, Frederic Weisbecker wrote:
> > The managed affinity list currently contains only unbound kthreads that
> > have affinity preferences. Unbound kthreads globally affine by default
> > are outside of the list because their affinity is automatically managed
> > by the scheduler (through the fallback housekeeping mask) and by cpuset.
> > 
> > However in order to preserve the preferred affinity of kthreads, cpuset
> > will delegate the isolated partition update propagation to the
> > housekeeping and kthread code.
> > 
> > Prepare for that with including all unbound kthreads in the managed
> > affinity list.
> > 
> > Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> > ---
> >   kernel/kthread.c | 59 ++++++++++++++++++++++++------------------------
> >   1 file changed, 30 insertions(+), 29 deletions(-)
> > 
> > diff --git a/kernel/kthread.c b/kernel/kthread.c
> > index c4dd967e9e9c..cba3d297f267 100644
> > --- a/kernel/kthread.c
> > +++ b/kernel/kthread.c
> > @@ -365,9 +365,10 @@ static void kthread_fetch_affinity(struct kthread *kthread, struct cpumask *cpum
> >   	if (kthread->preferred_affinity) {
> >   		pref = kthread->preferred_affinity;
> >   	} else {
> > -		if (WARN_ON_ONCE(kthread->node == NUMA_NO_NODE))
> > -			return;
> > -		pref = cpumask_of_node(kthread->node);
> > +		if (kthread->node == NUMA_NO_NODE)
> > +			pref = housekeeping_cpumask(HK_TYPE_KTHREAD);
> > +		else
> > +			pref = cpumask_of_node(kthread->node);
> >   	}
> >   	cpumask_and(cpumask, pref, housekeeping_cpumask(HK_TYPE_KTHREAD));
> > @@ -380,32 +381,29 @@ static void kthread_affine_node(void)
> >   	struct kthread *kthread = to_kthread(current);
> >   	cpumask_var_t affinity;
> > -	WARN_ON_ONCE(kthread_is_per_cpu(current));
> > +	if (WARN_ON_ONCE(kthread_is_per_cpu(current)))
> > +		return;
> > -	if (kthread->node == NUMA_NO_NODE) {
> > -		housekeeping_affine(current, HK_TYPE_KTHREAD);
> > -	} else {
> > -		if (!zalloc_cpumask_var(&affinity, GFP_KERNEL)) {
> > -			WARN_ON_ONCE(1);
> > -			return;
> > -		}
> > -
> > -		mutex_lock(&kthread_affinity_lock);
> > -		WARN_ON_ONCE(!list_empty(&kthread->affinity_node));
> > -		list_add_tail(&kthread->affinity_node, &kthread_affinity_list);
> > -		/*
> > -		 * The node cpumask is racy when read from kthread() but:
> > -		 * - a racing CPU going down will either fail on the subsequent
> > -		 *   call to set_cpus_allowed_ptr() or be migrated to housekeepers
> > -		 *   afterwards by the scheduler.
> > -		 * - a racing CPU going up will be handled by kthreads_online_cpu()
> > -		 */
> > -		kthread_fetch_affinity(kthread, affinity);
> > -		set_cpus_allowed_ptr(current, affinity);
> > -		mutex_unlock(&kthread_affinity_lock);
> > -
> > -		free_cpumask_var(affinity);
> > +	if (!zalloc_cpumask_var(&affinity, GFP_KERNEL)) {
> > +		WARN_ON_ONCE(1);
> > +		return;
> >   	}
> > +
> > +	mutex_lock(&kthread_affinity_lock);
> > +	WARN_ON_ONCE(!list_empty(&kthread->affinity_node));
> > +	list_add_tail(&kthread->affinity_node, &kthread_affinity_list);
> > +	/*
> > +	 * The node cpumask is racy when read from kthread() but:
> > +	 * - a racing CPU going down will either fail on the subsequent
> > +	 *   call to set_cpus_allowed_ptr() or be migrated to housekeepers
> > +	 *   afterwards by the scheduler.
> > +	 * - a racing CPU going up will be handled by kthreads_online_cpu()
> > +	 */
> > +	kthread_fetch_affinity(kthread, affinity);
> > +	set_cpus_allowed_ptr(current, affinity);
> > +	mutex_unlock(&kthread_affinity_lock);
> > +
> > +	free_cpumask_var(affinity);
> >   }
> >   static int kthread(void *_create)
> > @@ -924,8 +922,11 @@ static int kthreads_online_cpu(unsigned int cpu)
> >   			ret = -EINVAL;
> >   			continue;
> >   		}
> > -		kthread_fetch_affinity(k, affinity);
> > -		set_cpus_allowed_ptr(k->task, affinity);
> > +
> > +		if (k->preferred_affinity || k->node != NUMA_NO_NODE) {
> > +			kthread_fetch_affinity(k, affinity);
> > +			set_cpus_allowed_ptr(k->task, affinity);
> > +		}
> >   	}
> 
> My understanding of kthreads_online_cpu() is that hotplug won't affect the
> affinity returned from kthread_fetch_affinity().

It should. The onlining CPU is considered online at this point and might
be part of the returned kthread_fetch_affinity().

> However, set_cpus_allowed_ptr() will mask out all the offline CPUs. So if the given
> "cpu" to be brought online is in the returned affinity, we should call
> set_cpus_allowed_ptr() to add this cpu into its affinity mask though the
> current code will call it even it is not strictly necessary.

I'm not sure I understand what you mean.

> This change will not do this update to NUMA_NO_NODE kthread with no preferred_affinity,
> is this a problem?

Ah, so unbound kthreads without preferred affinity are already affine to all
possible CPUs (or housekeeping), whether those CPUs are online or not. So we
don't need to add newly online CPUs to them.

kthreads with a preferred affinity or node are different because if none of
their preferred CPUs are online, they must be affine to housekeeping. But as
soon as one of their preferred CPU becomes online, they must be affine to them.

Hence the different treatment. I'm adding a big comment to explain that.

Thanks!

-- 
Frederic Weisbecker
SUSE Labs

