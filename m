Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 896DBCCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 16:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=COWxrb9LS0V/QZx9QvRUsCiIJ0iMKWVcJzYfBuUtJQ0=; b=4kJR8JacQI68vwd0fogf8EMLy6
	4Qh8wLPOBPG32995kCYqqkC1y5sc2r1TNxq0IzgqK3H462p2aKIlUwD7VdRneHzvfAkB/ZZ8U3RKu
	zCVULAVka/h3/Uuh08pRvBj70qwOyZQ+uYMmh6G5UasukGO9V5F0/VRrGuviRv5qdHZrZNruUXekd
	J0qjYKUT4ez7sLNiVwg8rM0x5yiHaQnz/xwcarH+z10ceJu/hV8ZwFc63gLw+gnipeHOKNa6/qCs5
	btpMAxJ7lTXVuDHeKtJsDo6wsidfFSMjMUyKpfi6pPdS9CteKLQaEs/VKsUvlCEOITe3lsqS63YUL
	FpxLeanA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGgCJ-0000000E357-1Lov;
	Wed, 05 Nov 2025 16:17:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGgCH-0000000E34f-1Z9n
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 16:17:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 44311601DD;
	Wed,  5 Nov 2025 16:17:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EA00C4CEF5;
	Wed,  5 Nov 2025 16:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762359439;
	bh=m0WmoCYyOXZpK7uUlcvblqPFNrYVzKYbQ3i1eOPl5Zg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l0hjf0UiodG9bvlzR0teTF7/EOA6sdH3lJdRLlau9I8A/DseQMnymKV6dDPaF700i
	 /GM4BkXlPH1RycuSsw1W8H9JlsG+Bpucpt9ON/Yb5Lp8BhsF0xHuIPaLrfAj2uEL5x
	 FGHRWbLzd0GHQgdJxbcv9AuCCM02jjoLln2tMRrhAU4O51K57/fzGeuubEOv9trZh9
	 vwOscUOROGk2lS5YeTqltie7TWPT1TVeiQnqH89qkQQHLnjKNmuhBQSCx2JZFrhqQw
	 s6AEiUIsphHx7/SDFAYdbTpJoHq3d0onR71up8dRK9b/ZyB8C1jktq8jhvlYW0LWY/
	 sPiObTTJWLXrA==
Date: Wed, 5 Nov 2025 17:17:17 +0100
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
Subject: Re: [PATCH 14/33] sched/isolation: Flush memcg workqueues on cpuset
 isolated partition change
Message-ID: <aQt4jT9qqP_l_ZSF@localhost.localdomain>
References: <20251013203146.10162-1-frederic@kernel.org>
 <20251013203146.10162-15-frederic@kernel.org>
 <364e084a-ef37-42ab-a2ae-5f103f1eb212@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <364e084a-ef37-42ab-a2ae-5f103f1eb212@redhat.com>
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

Le Tue, Oct 21, 2025 at 03:16:45PM -0400, Waiman Long a écrit :
> > @@ -5134,6 +5141,9 @@ int __init mem_cgroup_init(void)
> >   	cpuhp_setup_state_nocalls(CPUHP_MM_MEMCQ_DEAD, "mm/memctrl:dead", NULL,
> >   				  memcg_hotplug_cpu_dead);
> > +	memcg_wq = alloc_workqueue("memcg", 0, 0);
> 
> Should we explicitly mark the memcg_wq as WQ_PERCPU even though I think
> percpu is the default. The schedule_work_on() schedules work on the
> system_percpu_wq.

Good catch, percpu is the default but that behaviour is scheduled for
deprecation. I'm adding WQ_PERCPU.

Thanks!

-- 
Frederic Weisbecker
SUSE Labs

