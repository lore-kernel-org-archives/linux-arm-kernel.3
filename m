Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B8BC44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 17:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ENCjiUyFyqKTfowkYdXmyJGMEeUb4ui0gjmTnlKiIkg=; b=fF0axyYEJ5hyvZ6YT5WwTSmiGW
	7KfjtjQfoYVOndu4nGyHrNCFhcQ76dTmoqMjz9FeDrRTpZv0T4GW47mVz4kEiyn3ynjocqEJGr75E
	veG80I7UmFWgZJHUAGQ7eXth7419lb165nIccUKUx5wnZpcghn8qxqBekHdujas/TbeBRvOUVQ2GY
	l0VLx0+dP3oDlUtb0+JKnNVuj/hcu0/LWFhdzMkZijdWgLluYW6Dt15fZD0yiKNiQJufGsT+tTgJU
	grXMVzz7tEfdP2GgcJsOOtKxahTGTECOxO8fe1k08BIPBu/B9WUUHyX/OZ95cUJquRF3E8MVzhKlG
	3f81uDlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vibeo-00000005qy5-3tEH;
	Wed, 21 Jan 2026 17:06:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vibem-00000005qxP-0w7X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 17:06:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0271A43290;
	Wed, 21 Jan 2026 17:06:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A976C4CEF1;
	Wed, 21 Jan 2026 17:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769015170;
	bh=ida7uC1+IcLm3mH5OnwxhdYHy+GE2IR1NjNzomFuB9g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YurHeLrj0Kc1Z0kXwWObFZEVHgWtGcldhLnc/9rTtIWDrfOF5OHZhBDWWdjOE+462
	 fvExXn7KnbYEhXpWGo0kukD1NpS4gyjv+Pr7pHR+Giv+UGDKpFQR4jiFII2JYw6KuB
	 7Y8ozd5liCmajIIf/Gyx/RwYNYOZ5mWwJctr8S8J+TzMEv3rCWxOO3RhAdYzLaQL+n
	 6gnoTvdwYhSMdpeIgae4LwcnvIuh1RGjcBa0Uwy7/qPLVdXh1CzAp+l96r9ZaxuEan
	 Q0gajJnqRVo0ClKW8SRy7uN+F5eE04OGnRK255rIs66OEyyWUFcE6wDDLeD0IN5rPp
	 vKuYKaTb2eaLg==
Date: Wed, 21 Jan 2026 18:06:07 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Will Deacon <will@kernel.org>
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
	cgroups@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-block@vger.kernel.org, linux-mm@kvack.org,
	linux-pci@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 29/33] sched/arm64: Move fallback task cpumask to
 HK_TYPE_DOMAIN
Message-ID: <aXEHf5nbZMI8LT4b@localhost.localdomain>
References: <20260101221359.22298-1-frederic@kernel.org>
 <20260101221359.22298-30-frederic@kernel.org>
 <aW-cAlJCtI5Qtify@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aW-cAlJCtI5Qtify@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_090612_299067_B4BCE0BE 
X-CRM114-Status: GOOD (  27.66  )
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

Le Tue, Jan 20, 2026 at 03:15:14PM +0000, Will Deacon a écrit :
> Hi Frederic,
> 
> On Thu, Jan 01, 2026 at 11:13:54PM +0100, Frederic Weisbecker wrote:
> > When none of the allowed CPUs of a task are online, it gets migrated
> > to the fallback cpumask which is all the non nohz_full CPUs.
> > 
> > However just like nohz_full CPUs, domain isolated CPUs don't want to be
> > disturbed by tasks that have lost their CPU affinities.
> > 
> > And since nohz_full rely on domain isolation to work correctly, the
> > housekeeping mask of domain isolated CPUs should always be a superset of
> > the housekeeping mask of nohz_full CPUs (there can be CPUs that are
> > domain isolated but not nohz_full, OTOH there shouldn't be nohz_full
> > CPUs that are not domain isolated):
> > 
> > 	HK_TYPE_DOMAIN | HK_TYPE_KERNEL_NOISE == HK_TYPE_DOMAIN
> > 
> > Therefore use HK_TYPE_DOMAIN as the appropriate fallback target for
> > tasks and since this cpumask can be modified at runtime, make sure
> > that 32 bits support CPUs on ARM64 mismatched systems are not isolated
> > by cpusets.
> > 
> > Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> > Reviewed-by: Waiman Long <longman@redhat.com>
> > ---
> >  arch/arm64/kernel/cpufeature.c | 18 +++++++++++++++---
> >  include/linux/cpu.h            |  4 ++++
> >  kernel/cgroup/cpuset.c         | 17 ++++++++++++++---
> >  3 files changed, 33 insertions(+), 6 deletions(-)
> 
> tbh, I'd also be fine just saying that isolation isn't reliable on these
> systems and then you don't need to add the extra arch hook.

Hmm, I think I heard about nohz_full usage on arm64 but I'm not sure.
And I usually expect isolcpus or cpuset isolated partitions to be even
more broadly used, it's lighter isolation with less constraints.

Anyway you're probably right that we could remove isolation support here
but I don't want to break any existing user.

> Whatever you prefer, but please can you update the text in
> Documentation/arch/arm64/asymmetric-32bit.rst to cover the interaction
> between the asymmetric stuff and cpu isolation?

I'll keep that path and update the documentation. I guess we can still
consider removing that support afterward. If we do so anyway, it would
deserve its own patchset and shouldn't be hidden in this pile.

Thanks.

-- 
Frederic Weisbecker
SUSE Labs

