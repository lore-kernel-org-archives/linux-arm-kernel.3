Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D59BEE57F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 15:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2pdAd0KBpKEzOG9SIUhcuMaXAWyHGcb00rsjHnz/GSg=; b=hL7PEGfIP4jT84YrWahP0ycveV
	NwEGcLz/jNJqECSDL/kkUjDWgDWk5Vls/RTSGf6KRZRQBkJGQEYsei7I34t6RG4BwT8SWQIE6lse1
	z/6QO6AYr6+uVevK4UkMexgld2FoBtcRIs5TrZZONJgTDq/3oIYWwkL/5gzwviCRq6Y5QBz2awhIf
	exWMtGdD7VF5TX44DT7yFkjS0QLFoVPkVmqr7t734kj1doEzNry3NA1mTbGryTZUyoUr+2Uw+GUDL
	6jnLNO/DiSUDNzYgz6GqyZ2S+ihdacYAcs8cFT5Fb7h7d/Uty2KygwU1h5Txy1ECH/MBjlRtQ8xWP
	5CYWaTog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vay5C-000000064uK-4C6t;
	Wed, 31 Dec 2025 15:25:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vay5C-000000064u5-0vFv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 15:25:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4977B60008;
	Wed, 31 Dec 2025 15:25:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72AAFC113D0;
	Wed, 31 Dec 2025 15:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767194753;
	bh=3zCSe0pygUa6B0hxj7uhQQbY3y5VvVFZcfM1W6inRQ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s/MiUltoCktzz6D0wiCqcLuak2qC1jPP+t9uF/Wpp9NyhlhUYJRh4a7DANVK3dS3Y
	 5TBAIkOcZD7Uzm31uIRNg+KPXeRfrFDCHo5KImNpcVVxeo6H0CXL4UnXKcwUINX/Ll
	 U1vQ9nn+42I+5DqP4hDp4p5tUlokQFV23MAaxYG5+JRLq2JJ2SJ1zhhHcouBH7kW4n
	 j7tnzqkJRksmGaZ82fg+JWX+rpM1JKmvmvmVA/5WAT8i/ukuaEkGR1UaA6w9uc8YRq
	 7msaf9wYLApzpxDT1X8VKz50GKA//Mk01dWdH2ak+Kw+9n2yKX+4XwtHIVWi3pdEqj
	 QbzdgFhA2MRZA==
Date: Wed, 31 Dec 2025 16:25:49 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Waiman Long <llong@redhat.com>
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
	Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
	cgroups@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-block@vger.kernel.org, linux-mm@kvack.org,
	linux-pci@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 33/33] doc: Add housekeeping documentation
Message-ID: <aVVAfb2eaeyd7l-h@localhost.localdomain>
References: <20251224134520.33231-1-frederic@kernel.org>
 <20251224134520.33231-34-frederic@kernel.org>
 <370149fc-1624-4a16-ac47-dd9b2dd0ed29@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <370149fc-1624-4a16-ac47-dd9b2dd0ed29@redhat.com>
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

Le Fri, Dec 26, 2025 at 07:39:28PM -0500, Waiman Long a écrit :
> On 12/24/25 8:45 AM, Frederic Weisbecker wrote:
> > Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> > ---
> >   Documentation/core-api/housekeeping.rst | 111 ++++++++++++++++++++++++
> >   Documentation/core-api/index.rst        |   1 +
> >   2 files changed, 112 insertions(+)
> >   create mode 100644 Documentation/core-api/housekeeping.rst
> > 
> > diff --git a/Documentation/core-api/housekeeping.rst b/Documentation/core-api/housekeeping.rst
> > new file mode 100644
> > index 000000000000..e5417302774c
> > --- /dev/null
> > +++ b/Documentation/core-api/housekeeping.rst
> > @@ -0,0 +1,111 @@
> > +======================================
> > +Housekeeping
> > +======================================
> > +
> > +
> > +CPU Isolation moves away kernel work that may otherwise run on any CPU.
> > +The purpose of its related features is to reduce the OS jitter that some
> > +extreme workloads can't stand, such as in some DPDK usecases.
> Nit: "usecases" => "use cases"

Are you sure? I'm not a native speaker but at least the kernel
has established its use:

$ git grep usecase | wc -l
517

> > +
> > +The kernel work moved away by CPU isolation is commonly described as
> > +"housekeeping" because it includes ground work that performs cleanups,
> > +statistics maintainance and actions relying on them, memory release,
> > +various deferrals etc...
> > +
> > +Sometimes housekeeping is just some unbound work (unbound workqueues,
> > +unbound timers, ...) that gets easily assigned to non-isolated CPUs.
> > +But sometimes housekeeping is tied to a specific CPU and requires
> > +elaborated tricks to be offloaded to non-isolated CPUs (RCU_NOCB, remote
> > +scheduler tick, etc...).
> > +
> > +Thus, a housekeeping CPU can be considered as the reverse of an isolated
> > +CPU. It is simply a CPU that can execute housekeeping work. There must
> > +always be at least one online housekeeping CPU at any time. The CPUs that
> > +are not	isolated are automatically assigned as housekeeping.
> Nit: extra white spaces between "not" and "isolated".

Somehow it has disappeared in my tree, some Brunaidh must have fixed
that while I was sleeping. That's nice!

> > diff --git a/Documentation/core-api/index.rst b/Documentation/core-api/index.rst
> > index 5eb0fbbbc323..79fe7735692e 100644
> > --- a/Documentation/core-api/index.rst
> > +++ b/Documentation/core-api/index.rst
> > @@ -25,6 +25,7 @@ it.
> >      symbol-namespaces
> >      asm-annotations
> >      real-time/index
> > +   housekeeping.rst
> >   Data structures and low-level utilities
> >   =======================================
> Acked-by: Waiman Long <longman@redhat.com>

Thanks! 

-- 
Frederic Weisbecker
SUSE Labs

