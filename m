Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F91D3EE8A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 16:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=9aRzvjV+Wif6zegr+a6nCLd0Tck/+9rU+CVjUc1JMr0=; b=Fu9TyKPXXkxHQB
	ydbhGOcN6KGLt2xPjKST5FEKW3hxt4ZFkuY1c6KoEM8j0ozjYVXBMagCExGLrnxypy8s+FXA7AZB2
	S7ZdLnjoNRWnjwAfGsN0Fh0mtfOvdjHfljWfVpPpMRzN5R2Q15HezsP5S7pN50gvJCkcoOwovrJgb
	8jVgPjZrSn7P/3uTmEB7z4jfeC2nGFGShCcqV0gS27hx1l6ppgIJB79LGwGWkIJK1ZFQv3n+CL/X+
	igiy2FkCzVLA7X6UAm2Bx0szclERlRLZY40PiXPKO2+uRQ+yoFx9AmhdT9CzLcsXSfFCmlouZVduo
	WiUmVztsyS5CIKwFwtLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixKS-00000007Oct-0qt6;
	Thu, 22 Jan 2026 16:14:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixKQ-00000007OcJ-1ZWe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 16:14:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DDFE441B6E;
	Thu, 22 Jan 2026 16:14:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 911A5C116C6;
	Thu, 22 Jan 2026 16:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769098476;
	bh=GrBl0GmB4EskXynUW6bH8pp7knC2vNONOphZtdopzwU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=hpSHO+ghl6+V/2A9sZcw97dKURkfaqnoh6fz57v7b/GtWXdfzXyy1Yby0UyhDjKvn
	 2W+GC9cq47CPQ+TyiGLDn45Swl8siTnsyFJ7on/xxPH49i5KT8MfQ3vmfWawrqtvS/
	 e0XgagEPSQy8S8MSzhOzpR/YURn2bktJ0b47/jNeBbGfV3QYbH+giEwsut0bvtVELK
	 rpWCghXqtrEljSmHQ2BL3Elb1FNkrsKZfXYGCYyUHca2y5JEbBVE6ebqtSPa8N/6sE
	 xvWIAneDy9J19bcgL4eE88SS3YXNHupckNIR5dM3vOtcnyqIgrEjM/GhgZcu+RgECE
	 P9HBLzh+xmLPQ==
Date: Thu, 22 Jan 2026 10:14:35 -0600
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
Subject: Re: [PATCH 17/33] PCI: Flush PCI probe workqueue on cpuset isolated
 partition change
Message-ID: <20260122161435.GA1250260@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260101221359.22298-18-frederic@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_081438_460700_4A1FBE9A 
X-CRM114-Status: GOOD (  27.43  )
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

On Thu, Jan 01, 2026 at 11:13:42PM +0100, Frederic Weisbecker wrote:
> The HK_TYPE_DOMAIN housekeeping cpumask is now modifiable at runtime. In
> order to synchronize against PCI probe works and make sure that no
> asynchronous probing is still pending or executing on a newly isolated
> CPU, the housekeeping subsystem must flush the PCI probe works.
> 
> However the PCI probe works can't be flushed easily since they are
> queued to the main per-CPU workqueue pool.
> 
> Solve this with creating a PCI probe-specific pool and provide and use
> the appropriate flushing API.
> 
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  drivers/pci/pci-driver.c | 17 ++++++++++++++++-
>  include/linux/pci.h      |  3 +++
>  kernel/sched/isolation.c |  2 ++
>  3 files changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
> index a6111140755c..b902d8adf9a5 100644
> --- a/drivers/pci/pci-driver.c
> +++ b/drivers/pci/pci-driver.c
> @@ -337,6 +337,8 @@ static int local_pci_probe(struct drv_dev_and_id *ddi)
>  	return 0;
>  }
>  
> +static struct workqueue_struct *pci_probe_wq;
> +
>  struct pci_probe_arg {
>  	struct drv_dev_and_id *ddi;
>  	struct work_struct work;
> @@ -407,7 +409,11 @@ static int pci_call_probe(struct pci_driver *drv, struct pci_dev *dev,
>  		cpu = cpumask_any_and(cpumask_of_node(node),
>  				      wq_domain_mask);
>  		if (cpu < nr_cpu_ids) {
> -			schedule_work_on(cpu, &arg.work);
> +			struct workqueue_struct *wq = pci_probe_wq;
> +
> +			if (WARN_ON_ONCE(!wq))
> +				wq = system_percpu_wq;
> +			queue_work_on(cpu, wq, &arg.work);
>  			rcu_read_unlock();
>  			flush_work(&arg.work);
>  			error = arg.ret;
> @@ -425,6 +431,11 @@ static int pci_call_probe(struct pci_driver *drv, struct pci_dev *dev,
>  	return error;
>  }
>  
> +void pci_probe_flush_workqueue(void)
> +{
> +	flush_workqueue(pci_probe_wq);
> +}
> +
>  /**
>   * __pci_device_probe - check if a driver wants to claim a specific PCI device
>   * @drv: driver to call to check if it wants the PCI device
> @@ -1762,6 +1773,10 @@ static int __init pci_driver_init(void)
>  {
>  	int ret;
>  
> +	pci_probe_wq = alloc_workqueue("sync_wq", WQ_PERCPU, 0);
> +	if (!pci_probe_wq)
> +		return -ENOMEM;
> +
>  	ret = bus_register(&pci_bus_type);
>  	if (ret)
>  		return ret;
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 864775651c6f..f14f467e50de 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -1206,6 +1206,7 @@ struct pci_bus *pci_create_root_bus(struct device *parent, int bus,
>  				    struct pci_ops *ops, void *sysdata,
>  				    struct list_head *resources);
>  int pci_host_probe(struct pci_host_bridge *bridge);
> +void pci_probe_flush_workqueue(void);
>  int pci_bus_insert_busn_res(struct pci_bus *b, int bus, int busmax);
>  int pci_bus_update_busn_res_end(struct pci_bus *b, int busmax);
>  void pci_bus_release_busn_res(struct pci_bus *b);
> @@ -2079,6 +2080,8 @@ static inline int pci_has_flag(int flag) { return 0; }
>  _PCI_NOP_ALL(read, *)
>  _PCI_NOP_ALL(write,)
>  
> +static inline void pci_probe_flush_workqueue(void) { }
> +
>  static inline struct pci_dev *pci_get_device(unsigned int vendor,
>  					     unsigned int device,
>  					     struct pci_dev *from)
> diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
> index ec3f15164fd1..5239f556745d 100644
> --- a/kernel/sched/isolation.c
> +++ b/kernel/sched/isolation.c
> @@ -8,6 +8,7 @@
>   *
>   */
>  #include <linux/sched/isolation.h>
> +#include <linux/pci.h>
>  #include "sched.h"
>  
>  enum hk_flags {
> @@ -142,6 +143,7 @@ int housekeeping_update(struct cpumask *isol_mask)
>  
>  	synchronize_rcu();
>  
> +	pci_probe_flush_workqueue();
>  	mem_cgroup_flush_workqueue();
>  	vmstat_flush_workqueue();
>  
> -- 
> 2.51.1
> 

