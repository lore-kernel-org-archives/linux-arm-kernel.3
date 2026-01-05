Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCC3C79FA7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 17:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fx2nE7GEtYBOEncCLLjUx+UCvxrL3VBofuFzfQVI9KQ=; b=cM/8SKZNbALekK1kzKryMbwo41
	GHMSZQjqSEaMSXj79XZHqjCQuBfuQwyIoAAc+NecYYpz0KKhJFrTsJfRDCeYs67ioTf7g/1KJzzrz
	eyqVtFnNnNDwwHBBn0qyBNlGClmT0jz0AcKSWgTMvGqb23104D5qQL4an9M/xeLuCyAcWZOMTk8Ir
	6vxH10r90W5F3lZRHidx8RmSynAT+TrJ6zrYGeydsejLd1hr69PuUmXEkM8Nqs68t3FJp5u3DZSjY
	APTndcpBkmYYbOmV1TgQQ30ldUcg8fu0or3PXK22d2BKa0eT5BSvTSiX310NS0/DYjfLhxB62ZDNl
	ReQMDcIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcoZ2-0000000BqwH-0shN;
	Mon, 05 Jan 2026 17:40:20 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcoYv-0000000Bqu7-49PQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 17:40:18 +0000
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dlM526ZjtzHnGcc;
	Tue,  6 Jan 2026 01:40:06 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 83CB840539;
	Tue,  6 Jan 2026 01:40:09 +0800 (CST)
Received: from localhost (10.126.174.38) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 5 Jan
 2026 17:40:07 +0000
Date: Mon, 5 Jan 2026 17:40:05 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Ben Horgan <ben.horgan@arm.com>
CC: <amitsinght@marvell.com>, <baisheng.gao@unisoc.com>,
	<baolin.wang@linux.alibaba.com>, <carl@os.amperecomputing.com>,
	<dave.martin@arm.com>, <david@kernel.org>, <dfustini@baylibre.com>,
	<fenghuay@nvidia.com>, <gshan@redhat.com>, <james.morse@arm.com>,
	<kobak@nvidia.com>, <lcherian@marvell.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<peternewman@google.com>, <punit.agrawal@oss.qualcomm.com>,
	<quic_jiles@quicinc.com>, <reinette.chatre@intel.com>,
	<rohit.mathew@arm.com>, <scott@os.amperecomputing.com>,
	<sdonthineni@nvidia.com>, <tan.shaopeng@fujitsu.com>,
	<xhao@linux.alibaba.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<corbet@lwn.net>, <maz@kernel.org>, <oupton@kernel.org>,
	<joey.gouly@arm.com>, <suzuki.poulose@arm.com>, <kvmarm@lists.linux.dev>
Subject: Re: [PATCH v2 15/45] arm_mpam: resctrl: Add boilerplate cpuhp and
 domain allocation
Message-ID: <20260105174005.00001ba0@huawei.com>
In-Reply-To: <20251219181147.3404071-16-ben.horgan@arm.com>
References: <20251219181147.3404071-1-ben.horgan@arm.com>
	<20251219181147.3404071-16-ben.horgan@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.174.38]
X-ClientProxiedBy: lhrpeml100009.china.huawei.com (7.191.174.83) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_094016_518823_9372CA60 
X-CRM114-Status: GOOD (  26.04  )
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

On Fri, 19 Dec 2025 18:11:17 +0000
Ben Horgan <ben.horgan@arm.com> wrote:

> From: James Morse <james.morse@arm.com>
> 
> resctrl has its own data structures to describe its resources. We can't use
> these directly as we play tricks with the 'MBA' resource, picking the MPAM
> controls or monitors that best apply. We may export the same component as
> both L3 and MBA.
> 
> Add mpam_resctrl_exports[] as the array of class->resctrl mappings we are
> exporting, and add the cpuhp hooks that allocated and free the resctrl
> domain structures.
> 
> While we're here, plumb in a few other obvious things.
> 
> CONFIG_ARM_CPU_RESCTRL is used to allow this code to be built even though
> it can't yet be linked against resctrl.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Domain list is an rcu list
> Add synchronize_rcu() to free the deleted element
> Code flow simplification (Jonathan)

Just trivial stuff and that one what do we loop over thing that
we continued discussing in the RFC thread (I think you already
tidied that up)  Nothing here to stop:
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
(which is another way of saying I'm not planning to read it again :)


> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> new file mode 100644
> index 000000000000..4beeeded00ff
> --- /dev/null
> +++ b/drivers/resctrl/mpam_resctrl.c

> +
> +static int mpam_resctrl_pick_domain_id(int cpu, struct mpam_component *comp)
> +{
> +	struct mpam_class *class = comp->class;
> +
> +	if (class->type == MPAM_CLASS_CACHE)
> +		return comp->comp_id;
> +
> +	/* TODO: repaint domain ids to match the L3 domain ids */
> +	/*
> +	 * Otherwise, expose the ID used by the firmware table code.
Maybe more turns up in here. Otherwise, easily fits in single line comment.
> +	 */
> +	return comp->comp_id;
> +}

> +static struct mpam_resctrl_dom *
> +mpam_resctrl_get_domain_from_cpu(int cpu, struct mpam_resctrl_res *res)
> +{
> +	struct mpam_resctrl_dom *dom;
> +	struct rdt_ctrl_domain *ctrl_d;
> +	struct rdt_resource *r = &res->resctrl_res;
> +
> +	lockdep_assert_cpus_held();
> +
> +	list_for_each_entry_rcu(ctrl_d, &r->ctrl_domains, hdr.list) {

As a reminder, though I think you already changed this, discussion carried
on wrt to the RFC version of this loop.

> +		dom = container_of(ctrl_d, struct mpam_resctrl_dom,
> +				   resctrl_ctrl_dom);
> +
> +		if (cpumask_test_cpu(cpu, &dom->ctrl_comp->affinity))
> +			return dom;
> +	}
> +
> +	return NULL;
> +}

> +
> +void mpam_resctrl_offline_cpu(unsigned int cpu)
> +{
> +	resctrl_offline_cpu(cpu);
> +
> +	guard(mutex)(&domain_list_lock);
> +	for (int i = 0; i < RDT_NUM_RESOURCES; i++) {
> +		struct mpam_resctrl_res *res;
> +		struct mpam_resctrl_dom *dom;
> +		struct rdt_mon_domain *mon_d;
> +		struct rdt_ctrl_domain *ctrl_d;
> +		bool ctrl_dom_empty, mon_dom_empty;
> +
> +		res = &mpam_resctrl_controls[i];
> +		if (!res->class)
> +			continue;	// dummy resource
> +
> +		dom = mpam_resctrl_get_domain_from_cpu(cpu, res);
> +		if (WARN_ON_ONCE(!dom))
> +			continue;
> +
> +		ctrl_dom_empty = true;
> +		if (exposed_alloc_capable) {
> +			ctrl_d = &dom->resctrl_ctrl_dom;
> +			ctrl_dom_empty = mpam_resctrl_offline_domain_hdr(cpu, &ctrl_d->hdr);
> +			if (ctrl_dom_empty)
> +				resctrl_offline_ctrl_domain(&res->resctrl_res, ctrl_d);
> +		}
really small thing but I'd do 
		} else {
			ctrl_dom_empty = true;
		}
here to make it visually obvious why that is set to true. The initialize and override
if we have more info pattern is to me less readable.

> +
> +		mon_dom_empty = true;
> +		if (exposed_mon_capable) {
> +			mon_d = &dom->resctrl_mon_dom;
> +			mon_dom_empty = mpam_resctrl_offline_domain_hdr(cpu, &mon_d->hdr);
> +			if (mon_dom_empty)
> +				resctrl_offline_mon_domain(&res->resctrl_res, mon_d);
> +		}
Similar for this one.
> +
> +		if (ctrl_dom_empty && mon_dom_empty)
> +			kfree(dom);
> +	}
> +}


