Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C07CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 16:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WaW+IVAcw8V4+SUDNPsZ0jxs1KkpufLm07oO+WJVOBk=; b=3TCZfrn4ozip+I4WrixVV9KvCo
	5LwL8kA0xRagpsH7Zrua55BTmafnKewfS/SXlxKs5gzGfdl12WkSqhZuEF2hPmBZ01kfwEOwTCNvF
	/8z3kBhF+EjXoTaFuVf39igywGIdlu7bdqkgqEzDxFVuFSYiP6nfGZGB8ZglVm8blp1KXoLhwwA+a
	2cl+uzzJjQfC/h6j5szkWv45hRqlxgg/ab2C6k2VwGsRr+dHenOTsiz5s5wJcW64aHOOlFtuJORC/
	K2t/R92m3Kw0udh/8YL9dJS6//GdQjJtiWTY1wwJ6DO+E9wnzjKDPLkCxlasm8FQlhPD6233ubiqZ
	LNZL1W6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGgUZ-0000000E4wb-2D7j;
	Wed, 05 Nov 2025 16:36:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGgUW-0000000E4w1-3aa7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 16:36:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3DE23446A9;
	Wed,  5 Nov 2025 16:36:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98E76C116D0;
	Wed,  5 Nov 2025 16:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762360572;
	bh=6TrJvUK9Bi4MtE396O6mjFvQ4XSVRdM4jTat1mqDJ+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bJvV3GcjxVMkbPp2/HPHTvVQ3suklWsEfheD+VTVjPqA9H4nzGbxr2Z/oMCnFchhM
	 hx0phKZelWW3iUoT74SWOR0eAm/GMDUMSFZuJwRx3xLLzarjdMxhpnjROdsmqC1Bz9
	 MmxSP1G8Pm7sZ6X9Aw3/6NWdF7ILo/dLtzKjptrZcQKyjuY5ue+jqOiVpPmYroetzt
	 pSWR0IX5HMGCyAHJeRFyG1+DMWcS1izzqvM9K89t6srVDOjWc2wPYOBV+rjwy9RPKh
	 A6Jk4/1Jh9oT6si2+yJ2cfyT73UhwGEh/7aY2SdorDojoRR9eU1sKBBAVl6FGvx5cd
	 7YvIKTyAlo22A==
Date: Wed, 5 Nov 2025 17:36:09 +0100
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
Subject: Re: [PATCH 18/33] cpuset: Remove cpuset_cpu_is_isolated()
Message-ID: <aQt8-dzr4Ac3l3bt@localhost.localdomain>
References: <20251013203146.10162-1-frederic@kernel.org>
 <20251013203146.10162-19-frederic@kernel.org>
 <7821fb40-5082-4d11-b539-4c5abc2e572c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7821fb40-5082-4d11-b539-4c5abc2e572c@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_083612_934192_C1032EEF 
X-CRM114-Status: GOOD (  18.29  )
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

Le Wed, Oct 29, 2025 at 02:05:17PM -0400, Waiman Long a écrit :
> On 10/13/25 4:31 PM, Frederic Weisbecker wrote:
> > The set of cpuset isolated CPUs is now included in HK_TYPE_DOMAIN
> > housekeeping cpumask. There is no usecase left interested in just
> > checking what is isolated by cpuset and not by the isolcpus= kernel
> > boot parameter.
> > 
> > Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> > ---
> >   include/linux/cpuset.h          |  6 ------
> >   include/linux/sched/isolation.h |  3 +--
> >   kernel/cgroup/cpuset.c          | 12 ------------
> >   3 files changed, 1 insertion(+), 20 deletions(-)
> > 
> > diff --git a/include/linux/cpuset.h b/include/linux/cpuset.h
> > index 051d36fec578..a10775a4f702 100644
> > --- a/include/linux/cpuset.h
> > +++ b/include/linux/cpuset.h
> > @@ -78,7 +78,6 @@ extern void cpuset_lock(void);
> >   extern void cpuset_unlock(void);
> >   extern void cpuset_cpus_allowed(struct task_struct *p, struct cpumask *mask);
> >   extern bool cpuset_cpus_allowed_fallback(struct task_struct *p);
> > -extern bool cpuset_cpu_is_isolated(int cpu);
> >   extern nodemask_t cpuset_mems_allowed(struct task_struct *p);
> >   #define cpuset_current_mems_allowed (current->mems_allowed)
> >   void cpuset_init_current_mems_allowed(void);
> > @@ -208,11 +207,6 @@ static inline bool cpuset_cpus_allowed_fallback(struct task_struct *p)
> >   	return false;
> >   }
> > -static inline bool cpuset_cpu_is_isolated(int cpu)
> > -{
> > -	return false;
> > -}
> > -
> >   static inline nodemask_t cpuset_mems_allowed(struct task_struct *p)
> >   {
> >   	return node_possible_map;
> > diff --git a/include/linux/sched/isolation.h b/include/linux/sched/isolation.h
> > index 94d5c835121b..0f50c152cf68 100644
> > --- a/include/linux/sched/isolation.h
> > +++ b/include/linux/sched/isolation.h
> > @@ -76,8 +76,7 @@ static inline bool housekeeping_cpu(int cpu, enum hk_type type)
> >   static inline bool cpu_is_isolated(int cpu)
> >   {
> >   	return !housekeeping_test_cpu(cpu, HK_TYPE_DOMAIN) ||
> > -	       !housekeeping_test_cpu(cpu, HK_TYPE_TICK) ||
> > -	       cpuset_cpu_is_isolated(cpu);
> > +	       !housekeeping_test_cpu(cpu, HK_TYPE_TICK);
> >   }
> 
> You can also remove the "<linux/cpuset.h>" include from isolation.h which
> was added by commit 3232e7aad11e5 ("cgroup/cpuset: Include isolated cpuset
> CPUs in cpu_is_isolated() check") which introduces cpuset_cpu_is_isolated().

Done. Thanks!

-- 
Frederic Weisbecker
SUSE Labs

