Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3195CCCFA02
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 16:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gd1NRlaG7p73EaWZZGtzoqnB/qnKqpG/Nvm6jBDd4iY=; b=kVgjsN16tGKCX4hcavPabI3dW2
	Uj62HO1AIQ1AXJvAtRCUFt+LO/7+M3yW+wDAbGGx2CwjwFNO6fRfglpK1jRYtji7wRkHrAEzClBpj
	l2I9xYCQj0gxSpewArp77J/DRVvJCB8EpeD2DO+KgPbxgL2tUt3IMlOERoyWp67Cs5+ww86a/t1Oz
	EhPNd2Sjpyf02hF0V2EeVZAtxyDoig+lt2CngpnOVJpE+jt0xAzJT1Q13Bc4Yw5DPqBXs9ZQr3IYV
	b+k9Fam/j59YklQvvDiRQ5Laoat1+T03+mjhIbrzr6Affp/4SGeOF1GinhkG7rk5TZeKs9SaQWjT6
	XcCWGrOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vErfj-00000006NMQ-1YIa;
	Fri, 31 Oct 2025 16:08:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vErfh-00000006NLT-0Rjc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 16:08:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7307C43AD6;
	Fri, 31 Oct 2025 16:08:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDA40C4CEE7;
	Fri, 31 Oct 2025 16:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761926892;
	bh=DBnRWCc9yOikTyJAePQMQXl8JnrzRu+fPN1hD2Ld8qU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lNm3q3FxkqsL5QWMXLypsadCbVDHoS7srbuL3umgOILAgP2CmodbUjbmVgoYLqLve
	 gqW5tz1EPBizlAZk5MqElD4DQfIHAxzmtN19JFglozpQKcQGBxYMl7yLPgL06f0Alc
	 Wmr5T7iw805pUJEirQ0gG/+y+Tb8PrWnxbGm6rEfbp7xc7L8cnr1zQFwXjAnhR1hBH
	 leAVv9GH6W28+5E2FEe+8vxpWiPWLa7dvgRWsbm9oHb0ZrOKO2qaDT1p5UMDci9pYi
	 2qfoSEzL1lmFVYHaphzP0WGPUKmYmpipLpz2ALLuOYx0tXFwTP1Ngxt7pTzWQPBIkK
	 d4ltC1wGy9Gzg==
Date: Fri, 31 Oct 2025 17:08:09 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Chen Ridong <chenridong@huaweicloud.com>
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
	Vlastimil Babka <vbabka@suse.cz>, Waiman Long <longman@redhat.com>,
	Will Deacon <will@kernel.org>, cgroups@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org,
	linux-mm@kvack.org, linux-pci@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 11/33] cpuset: Provide lockdep check for cpuset lock held
Message-ID: <aQTe6X5XXSp8_3z5@localhost.localdomain>
References: <20251013203146.10162-1-frederic@kernel.org>
 <20251013203146.10162-12-frederic@kernel.org>
 <b94f6159-a280-4890-a02a-f19ff808de5b@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b94f6159-a280-4890-a02a-f19ff808de5b@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_090813_190239_775DEA10 
X-CRM114-Status: GOOD (  20.28  )
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

Le Tue, Oct 14, 2025 at 09:29:25PM +0800, Chen Ridong a écrit :
> 
> 
> On 2025/10/14 4:31, Frederic Weisbecker wrote:
> > cpuset modifies partitions, including isolated, while holding the cpuset
> > mutex.
> > 
> > This means that holding the cpuset mutex is safe to synchronize against
> > housekeeping cpumask changes.
> > 
> > Provide a lockdep check to validate that.
> > 
> > Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> > ---
> >  include/linux/cpuset.h | 2 ++
> >  kernel/cgroup/cpuset.c | 7 +++++++
> >  2 files changed, 9 insertions(+)
> > 
> > diff --git a/include/linux/cpuset.h b/include/linux/cpuset.h
> > index 2ddb256187b5..051d36fec578 100644
> > --- a/include/linux/cpuset.h
> > +++ b/include/linux/cpuset.h
> > @@ -18,6 +18,8 @@
> >  #include <linux/mmu_context.h>
> >  #include <linux/jump_label.h>
> >  
> > +extern bool lockdep_is_cpuset_held(void);
> > +
> >  #ifdef CONFIG_CPUSETS
> >  
> >  /*
> > diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> > index 8595f1eadf23..aa1ac7bcf2ea 100644
> > --- a/kernel/cgroup/cpuset.c
> > +++ b/kernel/cgroup/cpuset.c
> > @@ -279,6 +279,13 @@ void cpuset_full_unlock(void)
> >  	cpus_read_unlock();
> >  }
> >  
> > +#ifdef CONFIG_LOCKDEP
> > +bool lockdep_is_cpuset_held(void)
> > +{
> > +	return lockdep_is_held(&cpuset_mutex);
> > +}
> > +#endif
> > +
> >  static DEFINE_SPINLOCK(callback_lock);
> >  
> >  void cpuset_callback_lock_irq(void)
> 
> Is the lockdep_is_cpuset_held function actually being used?
> If CONFIG_LOCKDEP is disabled, compilation would fail with an "undefined reference to
> lockdep_is_cpuset_held" error.

Although counter-intuitive, this is how the lockdep_is_held() functions family
do work.

This allows this kind of trick:

if (IS_ENABLED(CONFIG_LOCKDEP))
   WARN_ON_ONCE(!lockdep_is_held(&some_lock))

This works during the compilation because the prototype of lockdep_is_held()
is declared. And since the IS_ENABLED() is resolved during compilation as well,
the conditional code is wiped out and therefore not linked. As a result the
linker doesn't even look for the definition of lockdep_is_held() and we don't
need to define an off case that would return a wrong assumption.

Thanks.

-- 
Frederic Weisbecker
SUSE Labs

