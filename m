Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A739D2F000
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 12:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J9/EIz4N/PqvzPN862/dmJctkdzBuE9L42PE6AXKKCs=; b=NX0gsbOXABl9l5X3wklWun3668
	TJd5YVaAghQ7nGGFWUrJ1oGIj8x8z2r/hfGKfYZ39owai/QcFbrO7hF+S7FNuzpHlS/h2BFPYwdgK
	jJdKgG6Ufi66pns4ldnZB8hunzWsX+bcIyVtw7+czj/nHYcnvnbbnuApp91d5egR6p8Ybuh54lbFB
	dD+Lr48pCoBdatvJqi9w/9XDAJfyXEpaZtQujsbofsMRoNWx1w0xeK/1R9KkQTsBnVf4iTyOnpWuj
	E+2Lxlh5yR98HgdYAIXlt1FNysBBAfz2UMe1Vh+DbsQ0A43q+GHdfiLKJBgJDv8jcauaLbqPJLrFi
	SPrJJbMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkiRa-0000000EGNJ-0fn3;
	Tue, 27 Jan 2026 12:45:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkiRS-0000000EGMr-3kAB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 12:45:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 52A93419E6;
	Tue, 27 Jan 2026 12:45:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AACFEC116C6;
	Tue, 27 Jan 2026 12:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769517909;
	bh=ofe10jGZoPAqJE9FQOSEtDptbVaYpx/CGbuhre/HHNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZqptSIfLm29TLryUzU52GQpI9Y5j/egT2jG8/oQhaPPiFuy2brZcTTjX8upURbbwK
	 O2avXbgCiqu9oze4K2pbYNChHpLvtm1Jz9vMFgmPsvm1Qg+qCGw0xz/oS/xiGbbAQa
	 SpjcCq8AzzyIPMh00tl2Kgj9nT4Pwz/av8vbzs9TI8IvS0TbBOA5TPk5EJhldEKCd8
	 z9JwUU8X8St7FkUL33asPHS0EmzbQdBqKLrg7pOsDN/QpZKsgStUPPRJtFFRc43nWE
	 6CsKod/Uczqk8wBl9Y2/65PFXOSK8XPZjs8cgK1siNQjv5//Rrl9afMnIDi/jt4EBR
	 gt2lbSbmoncAQ==
Date: Tue, 27 Jan 2026 13:45:06 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Michal Hocko <mhocko@suse.com>
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
	Muchun Song <muchun.song@linux.dev>,
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
Subject: Re: [PATCH 03/33] memcg: Prepare to protect against concurrent
 isolated cpuset change
Message-ID: <aXizUsfywjtIIN50@localhost.localdomain>
References: <20260125224541.50226-1-frederic@kernel.org>
 <20260125224541.50226-4-frederic@kernel.org>
 <aXeZQoSHJ9QX7B6W@tiehlicka>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aXeZQoSHJ9QX7B6W@tiehlicka>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_044513_256390_41A5A18D 
X-CRM114-Status: GOOD (  19.84  )
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

Le Mon, Jan 26, 2026 at 05:41:38PM +0100, Michal Hocko a écrit :
> On Sun 25-01-26 23:45:10, Frederic Weisbecker wrote:
> > The HK_TYPE_DOMAIN housekeeping cpumask will soon be made modifiable at
> > runtime. In order to synchronize against memcg workqueue to make sure
> > that no asynchronous draining is pending or executing on a newly made
> > isolated CPU, target and queue a drain work under the same RCU critical
> > section.
> > 
> > Whenever housekeeping will update the HK_TYPE_DOMAIN cpumask, a memcg
> > workqueue flush will also be issued in a further change to make sure
> > that no work remains pending after a CPU has been made isolated.
> > 
> > Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> > ---
> >  mm/memcontrol.c | 21 +++++++++++++++++----
> >  1 file changed, 17 insertions(+), 4 deletions(-)
> > 
> > diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> > index be810c1fbfc3..2289a0299331 100644
> > --- a/mm/memcontrol.c
> > +++ b/mm/memcontrol.c
> > @@ -2003,6 +2003,19 @@ static bool is_memcg_drain_needed(struct memcg_stock_pcp *stock,
> >  	return flush;
> >  }
> >  
> > +static void schedule_drain_work(int cpu, struct work_struct *work)
> > +{
> > +	/*
> > +	 * Protect housekeeping cpumask read and work enqueue together
> > +	 * in the same RCU critical section so that later cpuset isolated
> > +	 * partition update only need to wait for an RCU GP and flush the
> > +	 * pending work on newly isolated CPUs.
> > +	 */
> > +	guard(rcu)();
> > +	if (!cpu_is_isolated(cpu))
> > +		schedule_work_on(cpu, work);
> 
> Shouldn't this in the guarded rcu section?

This is what guard(rcu)() does, right?
Or am I missing something?

Thanks.

-- 
Frederic Weisbecker
SUSE Labs

