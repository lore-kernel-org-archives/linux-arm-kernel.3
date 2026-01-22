Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B04D3EE8A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 16:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=U5RekFzJh3yLIQs1SywOGsNGakUv11/WNDSzc4EMU7c=; b=NyJ+syYVV3e0sA
	qanXVr9d4ZemsgpusczZwCaEDkv5i766bX9+HJjo1IxrYkqQ66/eBJ5EGvTWJCdSd/cu0jIsacFyo
	iO5Y6pi6PNJlMGLHOqhZLyrj4kt/THEc/TSrcps8AjvgxdHeHYyJMQu7z3WRVBjKrA4os8N9d/U3j
	vv0OmP6EroaZSmfJaVUkpBMxPO2M87I0cFROU0+bWbesFAulEpVg0edFHvgQTCFzNvaGXtWwl+iMV
	5DCI0YHB+wjU4cXJQRSyYhgamYgK5dN1etg2kGW0pkamkEEI2VqH+6/HilcRBAdqwSUiUKi0apoBf
	CsQDjUeImIIgT+Pe4G/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixKu-00000007Ok0-1LXI;
	Thu, 22 Jan 2026 16:15:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixKt-00000007Oje-0bHV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 16:15:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 91780600CB;
	Thu, 22 Jan 2026 16:15:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2086AC116C6;
	Thu, 22 Jan 2026 16:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769098506;
	bh=SJFHQ6Dsh1f3ySZRRJ37Il23iv7ykfQoJASPEADlhj4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=tLh5e7xwyLi35ByP+P/zx+FUIZG0/Y/cKNIGwGFiXAL/PUM7LOTUcK1jbPF0zrhbW
	 QfWcHJziaTjycIc0UZky0Lxqkn5JXMqzA8amcf0V+QDYCC6W+IF0ubb4WgKlUZj5gc
	 2fhR+uq+lWXlGDORM4eoBcJ8MpPpG8puVbwZ4QnvuSU2bbfCDufoO668SdQkAa2w0Y
	 m9HgVWsHLrT86aXF56xvPBBAM1ivknGyvZ3Z2g9KgKceVnABiMNnxJqLkQQy53rbvp
	 5weW0+uOX4bDc/i0DBPfurqkJVpfu0nO90iejA1w1Euge0UvXu/MHizO9U1La6QwEY
	 GDcYIFh5457qg==
Date: Thu, 22 Jan 2026 10:15:05 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>,
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
Subject: Re: [PATCH 23/33] PCI: Remove superfluous HK_TYPE_WQ check
Message-ID: <20260122161505.GA1250310@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260101221359.22298-24-frederic@kernel.org>
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

On Thu, Jan 01, 2026 at 11:13:48PM +0100, Frederic Weisbecker wrote:
> It doesn't make sense to use nohz_full without also isolating the
> related CPUs from the domain topology, either through the use of
> isolcpus= or cpuset isolated partitions.
> 
> And now HK_TYPE_DOMAIN includes all kinds of domain isolated CPUs.
> 
> This means that HK_TYPE_KERNEL_NOISE (of which HK_TYPE_WQ is only an
> alias) should always be a subset of HK_TYPE_DOMAIN.
> 
> Therefore sane configurations verify:
> 
> 	HK_TYPE_KERNEL_NOISE | HK_TYPE_DOMAIN == HK_TYPE_DOMAIN
> 
> Simplify the PCI probe target election accordingly.
> 
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  drivers/pci/pci-driver.c | 17 +++--------------
>  1 file changed, 3 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
> index b902d8adf9a5..a9590601835a 100644
> --- a/drivers/pci/pci-driver.c
> +++ b/drivers/pci/pci-driver.c
> @@ -384,16 +384,9 @@ static int pci_call_probe(struct pci_driver *drv, struct pci_dev *dev,
>  	    pci_physfn_is_probed(dev)) {
>  		error = local_pci_probe(&ddi);
>  	} else {
> -		cpumask_var_t wq_domain_mask;
>  		struct pci_probe_arg arg = { .ddi = &ddi };
>  
> -		if (!zalloc_cpumask_var(&wq_domain_mask, GFP_KERNEL)) {
> -			error = -ENOMEM;
> -			goto out;
> -		}
> -
>  		INIT_WORK_ONSTACK(&arg.work, local_pci_probe_callback);
> -
>  		/*
>  		 * The target election and the enqueue of the work must be within
>  		 * the same RCU read side section so that when the workqueue pool
> @@ -402,12 +395,9 @@ static int pci_call_probe(struct pci_driver *drv, struct pci_dev *dev,
>  		 * targets.
>  		 */
>  		rcu_read_lock();
> -		cpumask_and(wq_domain_mask,
> -			    housekeeping_cpumask(HK_TYPE_WQ),
> -			    housekeeping_cpumask(HK_TYPE_DOMAIN));
> -
>  		cpu = cpumask_any_and(cpumask_of_node(node),
> -				      wq_domain_mask);
> +				      housekeeping_cpumask(HK_TYPE_DOMAIN));
> +
>  		if (cpu < nr_cpu_ids) {
>  			struct workqueue_struct *wq = pci_probe_wq;
>  
> @@ -422,10 +412,9 @@ static int pci_call_probe(struct pci_driver *drv, struct pci_dev *dev,
>  			error = local_pci_probe(&ddi);
>  		}
>  
> -		free_cpumask_var(wq_domain_mask);
>  		destroy_work_on_stack(&arg.work);
>  	}
> -out:
> +
>  	dev->is_probed = 0;
>  	cpu_hotplug_enable();
>  	return error;
> -- 
> 2.51.1
> 

