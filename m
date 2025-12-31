Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2523EE642F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 14:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NWHiYn4n+zWsJ54dXyXzY0GI3GkAZQGiV077bTpVEIE=; b=OKSN53w0ZNq0Xfz3lZ0URiaZF1
	AWsTrSNzDtBZXA0dxPB2+oRbXAaHyIzWwwoqk1xVGEBMVX7j6OLNXtbVjvaqVFqiI6PWpa7+CNN8i
	/zm0f2xLcjIckgLWObL7WOswjjw3s81bgJO23KAqN01KDyGoQBettV6SNCbXwaJbgykKERcqBlYBJ
	zo2Fx1Lx1wqEcfzbd4jDBeRv7R+ObBnX8FyI1GOe1b6W0eKpTsTUgy7efxoKlSmw+m/HpdMYHX3BN
	nTyZ9rhTeDq7r6XzZayOtJ+/B0ej8P4tJQP8DH0UHDevofDMTtaOktDwEUT3tqgFHJ3ZbzzsuqlDQ
	nyNv3aKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vawmf-000000061Sl-1AJZ;
	Wed, 31 Dec 2025 14:02:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vawmc-000000061Sd-3qHd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 14:02:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C0D5660017;
	Wed, 31 Dec 2025 14:02:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAA17C113D0;
	Wed, 31 Dec 2025 14:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767189757;
	bh=CBFfLku7dIdIU6H6oIpUvPWYyR6ucYYMUyo6GlFZdAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V/KYCPL7ZtkMijc6GCGy07DqTpJm2bcO1Hyk7oeLdmLDr4cryXHiAbYSa0rdHoTmz
	 xO1R86BMlXOvB7Bi6HCf0I6MrrXlvW4Tifmo/YaGV1r6/hXHdzochqy+Rx9CDugnW8
	 KL0pY73twndKcZdjNDfVh7l6tZDUjQW4VDWv/nAL9ad6qz6ZAUtNrHXDCfP2Cywtm6
	 ugYPs4h+jagAwy6hsofbysUt3OS9gH+6R84kJxL4x3DsSiKIXbQvIHr3qZRG6sMKpf
	 M6jkkbfhDqzpVpnYKxH0r6jDyw29DBX9RAwbViO1Y+CIGYDKBMqcVEFznqc1PXd0Hw
	 Qai/24OW/4z9w==
Date: Wed, 31 Dec 2025 15:02:34 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
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
	Johannes Weiner <hannes@cmpxchg.org>,
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
Subject: Re: [PATCH 09/33] block: Protect against concurrent isolated cpuset
 change
Message-ID: <aVUs-mFYCO2qGmqT@localhost.localdomain>
References: <20251224134520.33231-1-frederic@kernel.org>
 <20251224134520.33231-10-frederic@kernel.org>
 <0f65c4fe-8b10-403d-b5b6-ed33fc4eb69c@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0f65c4fe-8b10-403d-b5b6-ed33fc4eb69c@kernel.dk>
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

Le Mon, Dec 29, 2025 at 05:37:29PM -0700, Jens Axboe a écrit :
> On 12/24/25 6:44 AM, Frederic Weisbecker wrote:
> > The block subsystem prevents running the workqueue to isolated CPUs,
> > including those defined by cpuset isolated partitions. Since
> > HK_TYPE_DOMAIN will soon contain both and be subject to runtime
> > modifications, synchronize against housekeeping using the relevant lock.
> > 
> > For full support of cpuset changes, the block subsystem may need to
> > propagate changes to isolated cpumask through the workqueue in the
> > future.
> > 
> > Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> > ---
> >  block/blk-mq.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/block/blk-mq.c b/block/blk-mq.c
> > index 1978eef95dca..0037af1216f3 100644
> > --- a/block/blk-mq.c
> > +++ b/block/blk-mq.c
> > @@ -4257,12 +4257,16 @@ static void blk_mq_map_swqueue(struct request_queue *q)
> >  
> >  		/*
> >  		 * Rule out isolated CPUs from hctx->cpumask to avoid
> > -		 * running block kworker on isolated CPUs
> > +		 * running block kworker on isolated CPUs.
> > +		 * FIXME: cpuset should propagate further changes to isolated CPUs
> > +		 * here.
> >  		 */
> > +		rcu_read_lock();
> >  		for_each_cpu(cpu, hctx->cpumask) {
> >  			if (cpu_is_isolated(cpu))
> >  				cpumask_clear_cpu(cpu, hctx->cpumask);
> >  		}
> > +		rcu_read_unlock();
> 
> Want me to just take this one separately and get it out of your hair?
> Doesn't seem to have any dependencies.

The patch could be applied alone but the rest of the patchset needs it,
otherwise it may dereference freed memory. So I fear it needs to stay
within the lot.

I appreciate the offer though. But an ack would help, even if I must admit
this single patch (which doesn't change current behaviour) leaves a
bitter taste because complete handling of cpuset isolated partition change
will require more work.

Speaking of, is there a way that I missed to define/overwrite the above
hctx->cpumask on runtime?

Thanks.
-- 
Frederic Weisbecker
SUSE Labs

