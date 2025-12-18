Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70871D6ACE6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 11:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y6MwEjwjdScbzd8kxXE3wdLf6lbXHR6C2NLq7TXCJuQ=; b=48AXOC5EMi+brJVgUcqKFX5mtx
	ldKT3TDGbVnJUxr8QTdwRypKmu6B6XEFLosT/Cg+A8Ca9VYoV1N5Wo2wc2x6jd+AP/YE+OCtwHZEE
	dZ6K3y1yzIv2hV/NmMsMZzwlTPtyVksOsxVGYgFlHVwlWmWDv8BNCo/balUKySwtBo7pPBkP9l/4g
	uMI+ePsT7yDtqpCk25Jx8qKYXrqJUEFU0kHH/StamlZ9Z4qQznu9vlnXxdmYRK620jEMVIRUzUlNd
	f/KBnDoYqSPr+SSP/TCo2BTS2s4FtQ9jwp+CCawJexhX0Xdf5c+LMdh8sh0FC+S5gru0qWYWPvpO1
	i7HrImyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWCDJ-00000008Jkx-3rDn;
	Thu, 18 Dec 2025 11:30:33 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWCDD-00000008JkY-3BlL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 11:30:31 +0000
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dX7k55k9MzHnH84;
	Thu, 18 Dec 2025 19:29:49 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id D26E240571;
	Thu, 18 Dec 2025 19:30:16 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 18 Dec
 2025 11:30:15 +0000
Date: Thu, 18 Dec 2025 11:30:14 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: James Morse <james.morse@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, D
 Scott Phillips OS <scott@os.amperecomputing.com>,
	<carl@os.amperecomputing.com>, <lcherian@marvell.com>,
	<bobo.shaobowang@huawei.com>, <tan.shaopeng@fujitsu.com>,
	<baolin.wang@linux.alibaba.com>, Jamie Iles <quic_jiles@quicinc.com>, "Xin
 Hao" <xhao@linux.alibaba.com>, <peternewman@google.com>,
	<dfustini@baylibre.com>, <amitsinght@marvell.com>, David Hildenbrand
	<david@kernel.org>, Dave Martin <dave.martin@arm.com>, Koba Ko
	<kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
	<fenghuay@nvidia.com>, <baisheng.gao@unisoc.com>, Gavin Shan
	<gshan@redhat.com>, Ben Horgan <ben.horgan@arm.com>, <rohit.mathew@arm.com>,
	<reinette.chatre@intel.com>, Punit Agrawal <punit.agrawal@oss.qualcomm.com>
Subject: Re: [RFC PATCH 07/38] arm_mpam: resctrl: Add boilerplate cpuhp and
 domain allocation
Message-ID: <20251218113014.00002691@huawei.com>
In-Reply-To: <20251205215901.17772-8-james.morse@arm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
	<20251205215901.17772-8-james.morse@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_033030_066065_53C12438 
X-CRM114-Status: GOOD (  36.39  )
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

On Fri, 5 Dec 2025 21:58:30 +0000
James Morse <james.morse@arm.com> wrote:

> resctrl has its own data structures to describe its resources. We
> can't use these directly as we play tricks with the 'MBA' resource,
> picking the MPAM controls or monitors that best apply. We may export
> the same component as both L3 and MBA.
> 
> Add mpam_resctrl_exports[] as the array of class->resctrl mappings we
> are exporting, and add the cpuhp hooks that allocated and free the
> resctrl domain structures.
> 
> While we're here, plumb in a few other obvious things.
> 
> CONFIG_ARM_CPU_RESCTRL is used to allow this code to be built
> even though it can't yet be linked against resctrl.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
Hi,

A few code flow related comments. Fairly trivial stuff but I think
some parts of this can be made more readable / maintainable with
minor reorganization.

Jonathan


> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 2996ad93fc3e..efaf7633bc35 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
...

> @@ -2516,6 +2522,12 @@ static void mpam_enable_once(void)
>  	mutex_unlock(&mpam_list_lock);
>  	cpus_read_unlock();
>  
> +	if (!err) {
> +		err = mpam_resctrl_setup();
> +		if (err)
> +			pr_err("Failed to initialise resctrl: %d\n", err);
> +	}
> +
>  	if (err) {
>  		mpam_disable_reason = "Failed to enable.";
>  		schedule_work(&mpam_broken_work);

I'd be tempted to move this to an error handling block via a goto
making this bit
	if (err)
		goto err_disable_mpam;

	err = mpam_resctrl_setup();
	if (err) {
		pr_err();
		goto err_dsiable_mpam;
	}

Up to you though. Personally I like all my good paths as straight line
code with the errors handled in if (err) as that consistency really helps
readability.  

> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> new file mode 100644
> index 000000000000..320cebbd37ce
> --- /dev/null
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -0,0 +1,329 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (C) 2025 Arm Ltd.
> +
> +#define pr_fmt(fmt) "%s:%s: " fmt, KBUILD_MODNAME, __func__
> +
> +#include <linux/arm_mpam.h>
> +#include <linux/cacheinfo.h>
> +#include <linux/cpu.h>
> +#include <linux/cpumask.h>
> +#include <linux/errno.h>
> +#include <linux/list.h>
> +#include <linux/printk.h>
> +#include <linux/rculist.h>
> +#include <linux/resctrl.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>
> +
> +#include <asm/mpam.h>
> +
> +#include "mpam_internal.h"


> +static struct mpam_resctrl_dom *
> +mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
> +{
> +	int err;
> +	struct mpam_resctrl_dom *dom;
> +	struct rdt_mon_domain *mon_d;
> +	struct rdt_ctrl_domain *ctrl_d;
> +	struct mpam_class *class = res->class;
> +	struct mpam_component *comp_iter, *ctrl_comp;
> +	struct rdt_resource *r = &res->resctrl_res;
> +
> +	lockdep_assert_held(&domain_list_lock);
> +
> +	ctrl_comp = NULL;
> +	guard(srcu)(&mpam_srcu);
> +	list_for_each_entry_srcu(comp_iter, &class->components, class_list,
> +				 srcu_read_lock_held(&mpam_srcu)) {
> +		if (cpumask_test_cpu(cpu, &comp_iter->affinity)) {
> +			ctrl_comp = comp_iter;
> +			break;
> +		}
> +	}
> +
> +	/* class has no component for this CPU */
> +	if (WARN_ON_ONCE(!ctrl_comp))
> +		return ERR_PTR(-EINVAL);
> +
> +	dom = kzalloc_node(sizeof(*dom), GFP_KERNEL, cpu_to_node(cpu));
> +	if (!dom)
> +		return ERR_PTR(-ENOMEM);
> +
> +	if (exposed_alloc_capable) {
> +		dom->ctrl_comp = ctrl_comp;
> +
> +		ctrl_d = &dom->resctrl_ctrl_dom;
> +		mpam_resctrl_domain_hdr_init(cpu, ctrl_comp, &ctrl_d->hdr);
> +		ctrl_d->hdr.type = RESCTRL_CTRL_DOMAIN;
> +		/* TODO: this list should be sorted */
> +		list_add_tail_rcu(&ctrl_d->hdr.list, &r->ctrl_domains);
> +		err = resctrl_online_ctrl_domain(r, ctrl_d);
> +		if (err) {
> +			dom = ERR_PTR(err);
> +			goto offline_ctrl_domain;
> +		}
> +	} else {
> +		pr_debug("Skipped control domain online - no controls\n");
> +	}
> +
> +	if (exposed_mon_capable) {
> +		mon_d = &dom->resctrl_mon_dom;
> +		mpam_resctrl_domain_hdr_init(cpu, ctrl_comp, &mon_d->hdr);
> +		mon_d->hdr.type = RESCTRL_MON_DOMAIN;
> +		/* TODO: this list should be sorted */
> +		list_add_tail_rcu(&mon_d->hdr.list, &r->mon_domains);
> +		err = resctrl_online_mon_domain(r, mon_d);
> +		if (err) {
> +			dom = ERR_PTR(err);
> +			goto offline_mon_hdr;
> +		}
> +	} else {
> +		pr_debug("Skipped monitor domain online - no monitors\n");
> +	}
> +	goto out;

To keep flow simple, return here.  I thought maybe there was more stuff
that was always done (added in later patches) but not seeing that.
If there were then it would be a fairly strong indicator that a different
code structure makes more sense - probably with some helper functions.

> +
> +offline_mon_hdr:
> +	mpam_resctrl_offline_domain_hdr(cpu, &mon_d->hdr);
> +offline_ctrl_domain:
> +	resctrl_offline_ctrl_domain(r, ctrl_d);
> +out:
> +	return dom;
> +}
> +
> +static struct mpam_resctrl_dom *
> +mpam_resctrl_get_domain_from_cpu(int cpu, struct mpam_resctrl_res *res)
> +{
> +	struct mpam_resctrl_dom *dom;
> +	struct rdt_ctrl_domain *ctrl_d;
> +
> +	lockdep_assert_cpus_held();
> +
> +	list_for_each_entry_rcu(ctrl_d, &res->resctrl_res.ctrl_domains,
> +				hdr.list) {
> +		dom = container_of(ctrl_d, struct mpam_resctrl_dom,
> +				   resctrl_ctrl_dom);

I'm lazy so haven't checked for more code here in later patches, but
if not, why not iterate the list to access the domain directly rather
than jumping through the rdt_ctrl_domain?

Something along lines of:
	
	list_for_each_entry_rcu(dom, &res->resctrl_res.ctrl_domains,
				resctrl_ctrl_dom.hdr.list) {
	}

> +
> +		if (cpumask_test_cpu(cpu, &dom->ctrl_comp->affinity))
> +			return dom;
> +	}
> +
> +	return NULL;
> +}
> +
> +int mpam_resctrl_online_cpu(unsigned int cpu)
> +{
> +	int i;
> +	struct mpam_resctrl_dom *dom;
> +	struct mpam_resctrl_res *res;
> +
> +	guard(mutex)(&domain_list_lock);
> +	for (i = 0; i < RDT_NUM_RESOURCES; i++) {

I'd narrow the scope for dom and res to inside the loop.
Maybe put the iterator in the for loop init (now considered
acceptable in kernel code)

Similar applies in various other places.  No that important
for functions that more or less just consist of a loop though.

> +		res = &mpam_resctrl_controls[i];
> +		if (!res->class)
> +			continue;	// dummy_resource;
> +
> +		dom = mpam_resctrl_get_domain_from_cpu(cpu, res);
> +		if (!dom)
> +			dom = mpam_resctrl_alloc_domain(cpu, res);
> +		if (IS_ERR(dom))
> +			return PTR_ERR(dom);
> +	}
> +
> +	resctrl_online_cpu(cpu);
> +
> +	return 0;
> +}

> +int mpam_resctrl_setup(void)
> +{
> +	int err = 0;
> +	enum resctrl_res_level i;
> +	struct mpam_resctrl_res *res;
> +
> +	cpus_read_lock();
> +	for (i = 0; i < RDT_NUM_RESOURCES; i++) {
> +		res = &mpam_resctrl_controls[i];
> +		INIT_LIST_HEAD_RCU(&res->resctrl_res.ctrl_domains);
> +		INIT_LIST_HEAD_RCU(&res->resctrl_res.mon_domains);
> +		res->resctrl_res.rid = i;
> +	}
> +
> +	/* TODO: pick MPAM classes to map to resctrl resources */
> +
> +	/* Initialise the resctrl structures from the classes */
> +	for (i = 0; i < RDT_NUM_RESOURCES; i++) {
> +		res = &mpam_resctrl_controls[i];
> +		if (!res->class)
> +			continue;	// dummy resource
> +
> +		err = mpam_resctrl_control_init(res, i);
> +		if (err) {
> +			pr_debug("Failed to initialise rid %u\n", i);
> +			break;
> +		}
> +	}
> +	cpus_read_unlock();
> +
> +	if (err || (!exposed_alloc_capable && !exposed_mon_capable)) {
> +		if (err)
> +			pr_debug("Internal error %d - resctrl not supported\n",
> +				 err);
> +		else
> +			pr_debug("No alloc(%u) or monitor(%u) found - resctrl not supported\n",
> +				 exposed_alloc_capable, exposed_mon_capable);
> +		err = -EOPNOTSUPP;

return -EOPNOTSUPP; here to make the code flow simpler.
Mind you nice to avoid eating err if it is set and the sharing here doesn't seem
all that useful so perhaps just make this:

	if (err) {
		pr_debug("Internal error %d - resctrl not supported\n", err);
		return err;
	}

	if (!exposed_alloc_capable && !exposed_mon_capable) {
		pr_debug("No alloc(%u) or monitor(%u) found - resctrl not supported\n",
			 exposed_alloc_capable, exposed_mon_capable);
		return -EOPNOTSUPP;
	}


> +	}
> +
> +	if (!err) {
> +		if (!is_power_of_2(mpam_pmg_max + 1)) {
> +			/*
> +			 * If not all the partid*pmg values are valid indexes,
> +			 * resctrl may allocate pmg that don't exist. This
> +			 * should cause an error interrupt.
> +			 */
> +			pr_warn("Number of PMG is not a power of 2! resctrl may misbehave");
> +		}
> +
> +		/* TODO: call resctrl_init() */
> +	}
> +
> +	return err;
> +}

