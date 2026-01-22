Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B013C44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 11:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HTFmffWcUZMiXbLCD1+D1ZWQQg5xf8H7xFg9wcW8zuo=; b=ZxfpFVZuuoZJdaEFVxITJEVT56
	k5HGsMM7A5qwztcvHg6q6K399RBbRLyCBEaiFMlFZOc+2TtEyH9txRCa9UG6uPnlIUZFlCLlDfRIM
	kfYe/xSkj+QbWSQthfirvzDhBrJbDwZ/R/JSM4fajicSnTTywbz2uCrtuOipqeQTANjo2dccA2qbT
	esVRyfJ3ZwFboV+N7tHTfEnDA2xVFlYIZufNEBkoTYzCWoqPUcuvuSCjjJFcFh5dkiC0wxPWj53rP
	rixEhaECeoQMOhq2+lk2PeKP0j9SKDaLdjNX3e97xmOD42Do+MqYQJ4GraRCPJ59F7H9lrjlKGD+x
	zvwTFY7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viszJ-00000006ysj-2Vlw;
	Thu, 22 Jan 2026 11:36:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viszJ-00000006ysZ-0OhA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 11:36:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E7CF5600CB;
	Thu, 22 Jan 2026 11:36:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A76CC116C6;
	Thu, 22 Jan 2026 11:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769081791;
	bh=ENaX1Ni1MjEYqWK5DUAycRHraRvMcIc+oNSelx9/l2Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZDryn4r3pVEndSSCPyKyGmEaA5BTct8VAHmY8jYwQGX6bZIuzGBK2tyiehlMSViCM
	 Ei7gUubm2NpO0vLH1gLLEG7shYisa/qu58z1kPKCeHT7psSLc0dFIUNS20igfaqR8y
	 H0JYR5Y3GLo2UHCzTKrQTDQA5CIsBsQX04/nfiZiuS1HDLzqsOcDFUUSDSixFNi2cA
	 bcka/tqaxHdr2hWnQ1CWDAu9Vo3BBVN03Rl8iRMbmoAtVSYCecBSZ7PNzldFeiHaHe
	 bmQniStX0qxItibPa8e+b/txibvQDRMzP6YVhz2gBqk8YlXoX44FzT/wg3EmzCppge
	 Qf8lkGFsAGPRA==
Date: Thu, 22 Jan 2026 11:36:21 +0000
From: Will Deacon <will@kernel.org>
To: Frederic Weisbecker <frederic@kernel.org>
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
Message-ID: <aXILtazyRtpb3Yjy@willie-the-truck>
References: <20260101221359.22298-1-frederic@kernel.org>
 <20260101221359.22298-30-frederic@kernel.org>
 <aW-cAlJCtI5Qtify@willie-the-truck>
 <aXEHf5nbZMI8LT4b@localhost.localdomain>
 <aXH0TZU7UNowTmwc@willie-the-truck>
 <aXIKDduX5qUXvOUX@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aXIKDduX5qUXvOUX@localhost.localdomain>
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

On Thu, Jan 22, 2026 at 12:29:17PM +0100, Frederic Weisbecker wrote:
> Le Thu, Jan 22, 2026 at 09:56:29AM +0000, Will Deacon a écrit :
> > On Wed, Jan 21, 2026 at 06:06:07PM +0100, Frederic Weisbecker wrote:
> > > Le Tue, Jan 20, 2026 at 03:15:14PM +0000, Will Deacon a écrit :
> > > > Hi Frederic,
> > > > 
> > > > On Thu, Jan 01, 2026 at 11:13:54PM +0100, Frederic Weisbecker wrote:
> > > > > When none of the allowed CPUs of a task are online, it gets migrated
> > > > > to the fallback cpumask which is all the non nohz_full CPUs.
> > > > > 
> > > > > However just like nohz_full CPUs, domain isolated CPUs don't want to be
> > > > > disturbed by tasks that have lost their CPU affinities.
> > > > > 
> > > > > And since nohz_full rely on domain isolation to work correctly, the
> > > > > housekeeping mask of domain isolated CPUs should always be a superset of
> > > > > the housekeeping mask of nohz_full CPUs (there can be CPUs that are
> > > > > domain isolated but not nohz_full, OTOH there shouldn't be nohz_full
> > > > > CPUs that are not domain isolated):
> > > > > 
> > > > > 	HK_TYPE_DOMAIN | HK_TYPE_KERNEL_NOISE == HK_TYPE_DOMAIN
> > > > > 
> > > > > Therefore use HK_TYPE_DOMAIN as the appropriate fallback target for
> > > > > tasks and since this cpumask can be modified at runtime, make sure
> > > > > that 32 bits support CPUs on ARM64 mismatched systems are not isolated
> > > > > by cpusets.
> > > > > 
> > > > > Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> > > > > Reviewed-by: Waiman Long <longman@redhat.com>
> > > > > ---
> > > > >  arch/arm64/kernel/cpufeature.c | 18 +++++++++++++++---
> > > > >  include/linux/cpu.h            |  4 ++++
> > > > >  kernel/cgroup/cpuset.c         | 17 ++++++++++++++---
> > > > >  3 files changed, 33 insertions(+), 6 deletions(-)
> > > > 
> > > > tbh, I'd also be fine just saying that isolation isn't reliable on these
> > > > systems and then you don't need to add the extra arch hook.
> > > 
> > > Hmm, I think I heard about nohz_full usage on arm64 but I'm not sure.
> > > And I usually expect isolcpus or cpuset isolated partitions to be even
> > > more broadly used, it's lighter isolation with less constraints.
> > > 
> > > Anyway you're probably right that we could remove isolation support here
> > > but I don't want to break any existing user.
> > 
> > fwiw, I think it's only some Android markets using the mismatched 32-bit
> > support and we're definitely not using nohz_full there.
> 
> Now that removal becomes appealing. And what about isolcpus= / isolated cpuset
> which only consist in scheduler domain isolation? Probably not used by android
> either.
> 
> Ok but is there a way to detect on early boot that the system has mismatched
> 32 bits support? Because I need to fail nohz_full= and isolcpus= boot parameters
> early on top of this information without waiting for secondary CPUs boot.

Honestly, I'm not sure I'd bother trying to be smart here. Even if the
system has enabled support for mismatched 32-bit CPUs, things should
still work properly with nohz_full/isolcpus if all the tasks are 64-bit,
right?

In which case, I'd just document whatever weird behaviour you get if
somebody throws 32-bit tasks into the mix. Adding hooks to the generic
code for this use-case just seems like a waste, as they're not going to
be used in practice and it increases the maintenance burden.

Will

