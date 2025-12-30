Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F76AEE57C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 22:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j4A5MkkssdopRAR93WJD4DYIHbsjcxApDg+nSlq5QCc=; b=b8sJtWv7Og8UzuvPOymAMTSMoV
	KsQdaztYasDJaAov8KzJwl9x3VDE+1eN/wqW784yum2NwdItxPtfUQpE3/ZVIUNO8p+34cxkR4p0/
	cV/68I7n7/wwPfl/HRNCpPiLeAMPh+KSrgncfTfZhklvdQ3pDG8YjQAW5Gdxq4SAMEZaJREWs/Yjc
	GEiuHdCYf9KoSaqkiCjBuy2Fayv8yq1wpgXfQVY/Mouwx8FWHumBKSJL4jXGaJ7ehJ1pcls/5SgNB
	LKb86KIhLHCTY8+y8fafuvnQaPBEia+uIlLgTweMi38YNyvs6s93QCfXY9qWlsonY1BytLnJHIAzW
	6s0cLJYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaiM4-00000005Lkh-1bId;
	Tue, 30 Dec 2025 22:38:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaiM2-00000005Lkb-3FAR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 22:38:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3876A60017;
	Tue, 30 Dec 2025 22:38:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69369C4CEFB;
	Tue, 30 Dec 2025 22:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767134292;
	bh=Tb3tynnxxnwuANiHqkonp4fihfVrESQp6TRTMLE8/iI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b2cOJ8YL9H3+tcxp0RAQnc5CQYnXPXOwJghUPMxwUA9nJ6+jdDVbBaf+CVtGr49mj
	 NcFoZvSde20KbB6f29qNdHoYvCrrD9KXIKSkLSESSZU3CeFKhgKvmeLsIKz36l3BDv
	 ZqHDMjOeFqTCfC1E3RRn+MqTIhX3ZzoVKL9GVwFxgm5PZpPnoEShKS6g+GEHhM3T5R
	 Ak3KCLfwYwDPNgJrx7tv306BftuJfE5/umRJJVfDTi/6tf7wCvTJtzXWSTNibia4VO
	 e+wO+Ccg/vgWi85o7qxny3KxKBVON1mdMm8lbrc3w/6NSbRmm//YBotNrxpr9frRna
	 8XuNauqTZD6tg==
Date: Tue, 30 Dec 2025 23:38:09 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Zhang Qiao <zhangqiao22@huawei.com>
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
Subject: Re: [PATCH 01/33] PCI: Prepare to protect against concurrent
 isolated cpuset change
Message-ID: <aVRUUXa6kJKHHQ_n@pavilion.home>
References: <20251224134520.33231-1-frederic@kernel.org>
 <20251224134520.33231-2-frederic@kernel.org>
 <e01189e1-d8ef-2791-632c-90d4d897859b@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e01189e1-d8ef-2791-632c-90d4d897859b@huawei.com>
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

Le Mon, Dec 29, 2025 at 11:23:56AM +0800, Zhang Qiao a écrit :
> Hi, Weisbecker，
> 
> 在 2025/12/24 21:44, Frederic Weisbecker 写道:
> > HK_TYPE_DOMAIN will soon integrate cpuset isolated partitions and
> > therefore be made modifiable at runtime. Synchronize against the cpumask
> > update using RCU.
> > 
> > The RCU locked section includes both the housekeeping CPU target
> > election for the PCI probe work and the work enqueue.
> > 
> > This way the housekeeping update side will simply need to flush the
> > pending related works after updating the housekeeping mask in order to
> > make sure that no PCI work ever executes on an isolated CPU. This part
> > will be handled in a subsequent patch.
> > 
> > Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> > ---
> >  drivers/pci/pci-driver.c | 47 ++++++++++++++++++++++++++++++++--------
> >  1 file changed, 38 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
> > index 7c2d9d596258..786d6ce40999 100644
> > --- a/drivers/pci/pci-driver.c
> > +++ b/drivers/pci/pci-driver.c
> > @@ -302,9 +302,8 @@ struct drv_dev_and_id {
> >  	const struct pci_device_id *id;
> >  };
> >  
> > -static long local_pci_probe(void *_ddi)
> > +static int local_pci_probe(struct drv_dev_and_id *ddi)
> >  {
> > -	struct drv_dev_and_id *ddi = _ddi;
> >  	struct pci_dev *pci_dev = ddi->dev;
> >  	struct pci_driver *pci_drv = ddi->drv;
> >  	struct device *dev = &pci_dev->dev;
> > @@ -338,6 +337,19 @@ static long local_pci_probe(void *_ddi)
> >  	return 0;
> >  }
> >  
> > +struct pci_probe_arg {
> > +	struct drv_dev_and_id *ddi;
> > +	struct work_struct work;
> > +	int ret;
> > +};
> > +
> > +static void local_pci_probe_callback(struct work_struct *work)
> > +{
> > +	struct pci_probe_arg *arg = container_of(work, struct pci_probe_arg, work);
> > +
> > +	arg->ret = local_pci_probe(arg->ddi);
> > +}
> > +
> >  static bool pci_physfn_is_probed(struct pci_dev *dev)
> >  {
> >  #ifdef CONFIG_PCI_IOV
> > @@ -362,34 +374,51 @@ static int pci_call_probe(struct pci_driver *drv, struct pci_dev *dev,
> >  	dev->is_probed = 1;
> >  
> >  	cpu_hotplug_disable();
> > -
> >  	/*
> >  	 * Prevent nesting work_on_cpu() for the case where a Virtual Function
> >  	 * device is probed from work_on_cpu() of the Physical device.
> >  	 */
> >  	if (node < 0 || node >= MAX_NUMNODES || !node_online(node) ||
> >  	    pci_physfn_is_probed(dev)) {
> > -		cpu = nr_cpu_ids;
> > +		error = local_pci_probe(&ddi);
> >  	} else {
> >  		cpumask_var_t wq_domain_mask;
> > +		struct pci_probe_arg arg = { .ddi = &ddi };
> > +
> > +		INIT_WORK_ONSTACK(&arg.work, local_pci_probe_callback);
> >  
> >  		if (!zalloc_cpumask_var(&wq_domain_mask, GFP_KERNEL)) {
> >  			error = -ENOMEM;
> 
> If we return from here, arg.work will not be destroyed.

Good catch! Thanks.

-- 
Frederic Weisbecker
SUSE Labs

