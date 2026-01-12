Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3EA9CF45D2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 22:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iy8b6zJ4U4jEyrr5B3EF3LqIeY/TXDL9SqDPhwFS69w=; b=MtOZ64BkVY2CCbRj/uKEvDhrFZ
	6XIdWypnxlBDAbdDYyeLSI3uq1GGX5oxzIIR1p88NrbVBOtpG9al2nXwz5//ShvlCyvgCB/k0+DTl
	UM1TOdvlU6QRm6a8zjTnadVGDQiSXvN4xYvmuNyK747i+wVJrZ2cfkOyY/ajzz1xYJqwyizd5r9+Q
	dNO9oi/35qzWRMX70Z5/8tZUzq9vsEiUVRC0osYlGpWGvCeL79BpgcRRAzX6ixDIR2+ygSiAYtZzn
	4MnLMmHg735ZPh4y/T4soPxvKSaZ4pqIfUsw+VJbeKO0+0rVIKO/bdz6J3WltBzkYyQW7CK397Kdq
	uRUrx0Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfQ6f-00000006Esk-0xWD;
	Mon, 12 Jan 2026 22:09:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfQ6c-00000006EsN-1RH0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 22:09:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E12ED44224;
	Mon, 12 Jan 2026 22:09:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45A22C116D0;
	Mon, 12 Jan 2026 22:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768255784;
	bh=JxVAg6/16D5kLpXJf8cK2rWDDZ/WNlKo8ozqkYTbqEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nHVmYw6NZl/tZREwk9G9Iv5iR5Xne4iGKYto91hcu1bIgTvjlMqP9uaM6ySc0IvWD
	 GzwQTYft18Psn6A+Bm+D4w/vKek/yVT7FaibTOHAAloagBn8qak1jjX/wEEcoStPGc
	 OYKkWxAsSAceDzk8dx6fDIlAkg1ncsKO1kqC//f2u6pXkij7dIRCKwde18QYO1M7HP
	 wSyLeSrhK9sEZBOJAHFDO/0Eq+iYPd3s5/bzuXEuFpnApHEnp75LGhg+uc0YNsFytZ
	 rnA2gOsmzObCazuI/eA9GURbG8a1plnKfvXG+Ae88LjklzVw+RPhIIFkqBmQ3LHNw+
	 Wt1qBmrEKBjEg==
Date: Mon, 12 Jan 2026 23:09:41 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Waiman Long <llong@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Tejun Heo <tj@kernel.org>,
	Phil Auld <pauld@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Michal Koutny <mkoutny@suse.com>, netdev@vger.kernel.org,
	Roman Gushchin <roman.gushchin@linux.dev>,
	linux-block@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Eric Dumazet <edumazet@google.com>, Michal Hocko <mhocko@suse.com>,
	Bjorn Helgaas <bhelgaas@google.com>, Ingo Molnar <mingo@redhat.com>,
	Chen Ridong <chenridong@huawei.com>, cgroups@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"David S . Miller" <davem@davemloft.net>,
	Vlastimil Babka <vbabka@suse.cz>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jens Axboe <axboe@kernel.dk>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Simon Horman <horms@kernel.org>,
	Shakeel Butt <shakeel.butt@linux.dev>, linux-mm@kvack.org,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Gabriele Monaco <gmonaco@redhat.com>,
	Muchun Song <muchun.song@linux.dev>, Will Deacon <will@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Chen Ridong <chenridong@huaweicloud.com>
Subject: Re: [PATCH 00/33 v6] cpuset/isolation: Honour kthreads preferred
 affinity
Message-ID: <aWVxJVQYEWQiyO8Q@pavilion.home>
References: <20260101221359.22298-1-frederic@kernel.org>
 <437ccd7a-e839-4b40-840c-7c40d22f8166@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <437ccd7a-e839-4b40-840c-7c40d22f8166@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_140946_427715_DB1F8D5D 
X-CRM114-Status: GOOD (  25.68  )
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

Le Mon, Jan 12, 2026 at 01:23:40PM -0500, Waiman Long a écrit :
> On 1/1/26 5:13 PM, Frederic Weisbecker wrote:
> > Hi,
> > 
> > The kthread code was enhanced lately to provide an infrastructure which
> > manages the preferred affinity of unbound kthreads (node or custom
> > cpumask) against housekeeping constraints and CPU hotplug events.
> > 
> > One crucial missing piece is cpuset: when an isolated partition is
> > created, deleted, or its CPUs updated, all the unbound kthreads in the
> > top cpuset are affine to _all_ the non-isolated CPUs, possibly breaking
> > their preferred affinity along the way
> > 
> > Solve this with performing the kthreads affinity update from cpuset to
> > the kthreads consolidated relevant code instead so that preferred
> > affinities are honoured.
> > 
> > The dispatch of the new cpumasks to workqueues and kthreads is performed
> > by housekeeping, as per the nice Tejun's suggestion.
> > 
> > As a welcome side effect, HK_TYPE_DOMAIN then integrates both the set
> > from isolcpus= and cpuset isolated partitions. Housekeeping cpumasks are
> > now modifyable with specific synchronization. A big step toward making
> > nohz_full= also mutable through cpuset in the future.
> > 
> > Changes since v5:
> > 
> > * Add more tags
> > 
> > * Fix leaked destroy_work_on_stack() (Zhang Qiao, Waiman Long)
> > 
> > * Comment schedule_drain_work() synchronization requirement (Tejun)
> > 
> > * s/Revert of/Inverse of (Waiman Long)
> > 
> > * Remove housekeeping_update() needless (for now) parameter (Chen Ridong)
> > 
> > * Don't propagate housekeeping_update() failures beyond allocations (Waiman Long)
> > 
> > * Whitespace cleanup (Waiman Long)
> > 
> > 
> > git://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git
> > 	kthread/core-v6
> > 
> > HEAD: 811e87ca8a0a1e54eb5f23e71896cb97436cccdc
> > 
> > Happy new year,
> > 	Frederic
> 
> I don't see any major issue with this v6 version. There may be some minor
> issues that can be cleaned up later. Now the issue is which tree should this
> series go to as it touches a number of different subsystems with different
> maintainers.

It indeed crosses many subsystems. I would be fine if anybody takes it but
nobody volunteered so far.

The main purpose is to fix kthreads affinity (HK_TYPE_DOMAIN handling cpuset is
a bonus). And since I made the pull request myself to Linus when I introduced
kthreads managed affinity, I guess I could reiterate with this patchset. I
already pushed it to linux-next.

But if anybody wants to pull that to another tree, that's fine, just tell me
so that we synchronize to avoid duplication on linux-next.

Thanks.

-- 
Frederic Weisbecker
SUSE Labs

