Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D19E784BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 03:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+BDGPe6Wz623mn9DQDdS+J7GvS2xhqJ99bp8antJarY=; b=AQjde3vabDtGqo+YuE5NcSRpje
	hCExAtrms6unrOGVdgxqVY0bOZ+i0Jh40elA1NuCJUOBUjzYjt51u4LJ3zexDWGmxBXjP6Y5OKGxR
	59er1iOmAxjm3j7Fagz3DBDGFMcnUKRZjYM+W4/J+Zj7Ze0cjSl6bxqAB5sStb5Ec4B0vfB5dXJR0
	fKlJ3hIvR/0Zs0YUOaNQMcQX5UxAVNLgDQcTdqKnUFCQrtH/zWhgCTYzIsx/hQp1hD7EygrIfv5N4
	qheBfGvVfMdm+wKq+A9S68nSRQVmHy5y4EfBh/FHJFghrV79rNhsk98DUKLLwmbguU659xlenoJqi
	L5n1nEYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va3rg-00000003HM6-0T19;
	Mon, 29 Dec 2025 03:24:12 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va3rd-00000003HLW-03gf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 03:24:11 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=+BDGPe6Wz623mn9DQDdS+J7GvS2xhqJ99bp8antJarY=;
	b=S5oznL7E1P+omaU+fUcM+wvPVZ/3cp/IsoQKCRwXkrHP4luHaqG+eOUxh9smTTkbEqw7uNvL0
	c4F1Wz+fPO5F6LWQgHy3huRbvjOsFw6aJ5tzPzxeXifnT01IAPtQc9PeSF0XS6pqphA89L2jlAL
	eTXaNu0tOj/1OwY7Cqz7TxY=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4dfhLm6PbPzmVYJ;
	Mon, 29 Dec 2025 11:20:48 +0800 (CST)
Received: from dggpemf100017.china.huawei.com (unknown [7.185.36.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 5B2D440565;
	Mon, 29 Dec 2025 11:23:59 +0800 (CST)
Received: from [10.67.111.186] (10.67.111.186) by
 dggpemf100017.china.huawei.com (7.185.36.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 29 Dec 2025 11:23:57 +0800
Message-ID: <e01189e1-d8ef-2791-632c-90d4d897859b@huawei.com>
Date: Mon, 29 Dec 2025 11:23:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH 01/33] PCI: Prepare to protect against concurrent isolated
 cpuset change
To: Frederic Weisbecker <frederic@kernel.org>, LKML
	<linux-kernel@vger.kernel.org>
CC: =?UTF-8?Q?Michal_Koutn=c3=bd?= <mkoutny@suse.com>, Andrew Morton
	<akpm@linux-foundation.org>, Bjorn Helgaas <bhelgaas@google.com>, Catalin
 Marinas <catalin.marinas@arm.com>, Chen Ridong <chenridong@huawei.com>,
	Danilo Krummrich <dakr@kernel.org>, "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Gabriele Monaco <gmonaco@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ingo Molnar
	<mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Jens Axboe
	<axboe@kernel.dk>, Johannes Weiner <hannes@cmpxchg.org>, Lai Jiangshan
	<jiangshanlai@gmail.com>, Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>, Paolo
 Abeni <pabeni@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Phil Auld
	<pauld@redhat.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Roman Gushchin
	<roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Simon
 Horman <horms@kernel.org>, Tejun Heo <tj@kernel.org>, Thomas Gleixner
	<tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, Waiman Long
	<longman@redhat.com>, Will Deacon <will@kernel.org>,
	<cgroups@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-block@vger.kernel.org>, <linux-mm@kvack.org>,
	<linux-pci@vger.kernel.org>, <netdev@vger.kernel.org>
References: <20251224134520.33231-1-frederic@kernel.org>
 <20251224134520.33231-2-frederic@kernel.org>
From: Zhang Qiao <zhangqiao22@huawei.com>
In-Reply-To: <20251224134520.33231-2-frederic@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.111.186]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf100017.china.huawei.com (7.185.36.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_192409_680431_63CE9B32 
X-CRM114-Status: GOOD (  25.11  )
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

Hi, Weisbecker，

在 2025/12/24 21:44, Frederic Weisbecker 写道:
> HK_TYPE_DOMAIN will soon integrate cpuset isolated partitions and
> therefore be made modifiable at runtime. Synchronize against the cpumask
> update using RCU.
> 
> The RCU locked section includes both the housekeeping CPU target
> election for the PCI probe work and the work enqueue.
> 
> This way the housekeeping update side will simply need to flush the
> pending related works after updating the housekeeping mask in order to
> make sure that no PCI work ever executes on an isolated CPU. This part
> will be handled in a subsequent patch.
> 
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> ---
>  drivers/pci/pci-driver.c | 47 ++++++++++++++++++++++++++++++++--------
>  1 file changed, 38 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
> index 7c2d9d596258..786d6ce40999 100644
> --- a/drivers/pci/pci-driver.c
> +++ b/drivers/pci/pci-driver.c
> @@ -302,9 +302,8 @@ struct drv_dev_and_id {
>  	const struct pci_device_id *id;
>  };
>  
> -static long local_pci_probe(void *_ddi)
> +static int local_pci_probe(struct drv_dev_and_id *ddi)
>  {
> -	struct drv_dev_and_id *ddi = _ddi;
>  	struct pci_dev *pci_dev = ddi->dev;
>  	struct pci_driver *pci_drv = ddi->drv;
>  	struct device *dev = &pci_dev->dev;
> @@ -338,6 +337,19 @@ static long local_pci_probe(void *_ddi)
>  	return 0;
>  }
>  
> +struct pci_probe_arg {
> +	struct drv_dev_and_id *ddi;
> +	struct work_struct work;
> +	int ret;
> +};
> +
> +static void local_pci_probe_callback(struct work_struct *work)
> +{
> +	struct pci_probe_arg *arg = container_of(work, struct pci_probe_arg, work);
> +
> +	arg->ret = local_pci_probe(arg->ddi);
> +}
> +
>  static bool pci_physfn_is_probed(struct pci_dev *dev)
>  {
>  #ifdef CONFIG_PCI_IOV
> @@ -362,34 +374,51 @@ static int pci_call_probe(struct pci_driver *drv, struct pci_dev *dev,
>  	dev->is_probed = 1;
>  
>  	cpu_hotplug_disable();
> -
>  	/*
>  	 * Prevent nesting work_on_cpu() for the case where a Virtual Function
>  	 * device is probed from work_on_cpu() of the Physical device.
>  	 */
>  	if (node < 0 || node >= MAX_NUMNODES || !node_online(node) ||
>  	    pci_physfn_is_probed(dev)) {
> -		cpu = nr_cpu_ids;
> +		error = local_pci_probe(&ddi);
>  	} else {
>  		cpumask_var_t wq_domain_mask;
> +		struct pci_probe_arg arg = { .ddi = &ddi };
> +
> +		INIT_WORK_ONSTACK(&arg.work, local_pci_probe_callback);
>  
>  		if (!zalloc_cpumask_var(&wq_domain_mask, GFP_KERNEL)) {
>  			error = -ENOMEM;

If we return from here, arg.work will not be destroyed.



>  			goto out;
>  		}
> +
> +		/*
> +		 * The target election and the enqueue of the work must be within
> +		 * the same RCU read side section so that when the workqueue pool
> +		 * is flushed after a housekeeping cpumask update, further readers
> +		 * are guaranteed to queue the probing work to the appropriate
> +		 * targets.
> +		 */
> +		rcu_read_lock();
>  		cpumask_and(wq_domain_mask,
>  			    housekeeping_cpumask(HK_TYPE_WQ),
>  			    housekeeping_cpumask(HK_TYPE_DOMAIN));
>  
>  		cpu = cpumask_any_and(cpumask_of_node(node),
>  				      wq_domain_mask);
> +		if (cpu < nr_cpu_ids) {
> +			schedule_work_on(cpu, &arg.work);
> +			rcu_read_unlock();
> +			flush_work(&arg.work);
> +			error = arg.ret;
> +		} else {
> +			rcu_read_unlock();
> +			error = local_pci_probe(&ddi);
> +		}
> +
>  		free_cpumask_var(wq_domain_mask);
> +		destroy_work_on_stack(&arg.work);
>  	}
> -
> -	if (cpu < nr_cpu_ids)
> -		error = work_on_cpu(cpu, local_pci_probe, &ddi);
> -	else
> -		error = local_pci_probe(&ddi);
>  out:
>  	dev->is_probed = 0;
>  	cpu_hotplug_enable();
> 

