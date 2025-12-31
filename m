Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F16EE6440
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 14:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IZhm6FiEErHZWRKqhaamBZhn+rAQsirAJCfOeoMHpWU=; b=p6eUHVUxXLywycBIPP1eKLl/dQ
	21iOUYiIBhcTC5DBrh24pBKaxfPQmvNp+N0VJ09jZVfpbMA9ywx70T4Ao0c+O31bH9Wb6kFNaLl4X
	s+qJuuIPyvOg+P+eb0VUk7jrGFNeJWTt6kLshR3lTO3DoOUlCFSmUt8TJvdD7aiykRSaJFZNWDnAJ
	bihv/ueW34Vzf/mKw61aordbtA6ZZ1/TUkacKSfWYlPm59qaWp8mnKY3mvzw/TCJA6LrMPv1BBd6t
	vDjppTDnBnAcu1W3M21rTRoB2nTjHEzcQaQZYf5HGj7g1h0Yy7MjwD/MsMNE1LqkKUcWSWnFZhqcS
	hvC8r06A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaxKY-000000062ju-0aI4;
	Wed, 31 Dec 2025 14:37:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaxKX-000000062jm-01R4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 14:37:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B583D60017;
	Wed, 31 Dec 2025 14:37:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE058C113D0;
	Wed, 31 Dec 2025 14:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767191859;
	bh=rnNQxQRICVG0/bRCHLds18VIp4MhYcD23gBS1k4tm4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ug55uySx/TS9I8SDIbLCqdWvgFFvx7oQBG42eNACAkO9SMq2ggXfcXb2F44FGN50K
	 13mXv2fVVQh7P1dXLSg7Da7qFtZegjEtOHHfMgKfursGukFoc8GLy67UuFkBND8bmu
	 1hRTfjdoq07zNV+R2kWXv/+mIgcBQN7SPKkBEeQau5EEWxacetnIh3vIMdssmjat6M
	 H/l2aL8FQsS9UnMjZ/iiQf9qUG5o98tjDOaHYOou4DExuKYBxNh8n29IIOMSCteAyX
	 9Xsvmkd6qooprztWFYZy7sLZa63PRgX3T04lKq3mgg7JBGjIe3B//fShIC1zjPD6kx
	 ojzdtaOi8ppWA==
Date: Wed, 31 Dec 2025 15:37:36 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Chen Ridong <chenridong@huaweicloud.com>
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
	Vlastimil Babka <vbabka@suse.cz>, Waiman Long <longman@redhat.com>,
	Will Deacon <will@kernel.org>, cgroups@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org,
	linux-mm@kvack.org, linux-pci@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 17/33] PCI: Flush PCI probe workqueue on cpuset isolated
 partition change
Message-ID: <aVU1MIyJ3VH4V80O@localhost.localdomain>
References: <20251224134520.33231-1-frederic@kernel.org>
 <20251224134520.33231-18-frederic@kernel.org>
 <c724aac7-5647-4253-bf7b-4ea92ea5d167@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c724aac7-5647-4253-bf7b-4ea92ea5d167@huaweicloud.com>
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

Le Fri, Dec 26, 2025 at 04:48:10PM +0800, Chen Ridong a écrit :
> > @@ -145,6 +146,7 @@ int housekeeping_update(struct cpumask *isol_mask, enum hk_type type)
> >  
> >  	synchronize_rcu();
> >  
> > +	pci_probe_flush_workqueue();
> >  	mem_cgroup_flush_workqueue();
> >  	vmstat_flush_workqueue();
> >  
> 
> I am concerned that this flush work may slow down writes to the cpuset interface. I am not sure how
> significant the impact will be.

First, writing to cpuset is not something that should be considered as a fast
path. It is a preparation work at configuration time that can tolerate a few
milliseconds of delay, which I expect to be what we should encounter most
of time here.

Second, this is not a "usual" cpuset partition write. CPU isolation is a niche
usecase (real time or Data plane). User must expect tradeoffs against the offer.

Third, about this very patch, most pci probe should happen at boot time before
cgroup is even accessible to userspace.

> I'm concerned about potential deadlock risks. While preliminary investigation hasn't uncovered any
> issues, we must ensure that the cpu write lock is not held during the work(writing cpuset interface
> needs cpu read lock).

That's what we have lockdep for :-)

Thanks.

-- 
Frederic Weisbecker
SUSE Labs

