Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54AB9D3B7EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 15:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SngIfUchuhCOgyFhy9jpPTxNholJPy7bYAm9+28jnyU=; b=Ii39VTh4xl9A51WYq7N6g4RW+e
	f7k6nA2h9rErqxqc3RWYcZz43GKC19WujY5Zx1sY07tuMo1GDG7AvCy/P/vvj0lgH7Evemn+NsoH6
	r2Qiz1/Ef92FxNZQR+vt2oudSVNnLVhLD9bCyyRje3BB2gH+B3/C6meEPDYn/imj01/YcAbrR7j7G
	rqi8Qosky3p9jlUdUZa6QRy3y31v/qqlZdPOIkzzBOEHCkkb5SIIg879y+z3POH704H/pYTaqBc3G
	1Zm2UEj+ozjDa0V5JoKsOxFzkS40on/ah6844TWzaulI9TWw0QXuilp5Zs1yJ3l2LTwojEOvl1rza
	1RtI9Frg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSzs1-0000000ESuG-3KwE;
	Tue, 09 Dec 2025 15:43:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSzrz-0000000EStr-1pQk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 15:43:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C2900175D;
	Tue,  9 Dec 2025 07:43:10 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 975B33F762;
	Tue,  9 Dec 2025 07:43:14 -0800 (PST)
Message-ID: <357f747b-055c-4dcf-bd63-32600dab7fe7@arm.com>
Date: Tue, 9 Dec 2025 15:43:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 07/38] arm_mpam: resctrl: Add boilerplate cpuhp and
 domain allocation
To: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@kernel.org>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Gavin Shan
 <gshan@redhat.com>, rohit.mathew@arm.com, reinette.chatre@intel.com,
 Punit Agrawal <punit.agrawal@oss.qualcomm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
 <20251205215901.17772-8-james.morse@arm.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20251205215901.17772-8-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_074319_574107_04067FD6 
X-CRM114-Status: GOOD (  38.03  )
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

Hi James,

On 12/5/25 21:58, James Morse wrote:
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
> ---
>  drivers/resctrl/Makefile        |   1 +
>  drivers/resctrl/mpam_devices.c  |  12 ++
>  drivers/resctrl/mpam_internal.h |  22 +++
>  drivers/resctrl/mpam_resctrl.c  | 329 ++++++++++++++++++++++++++++++++
>  include/linux/arm_mpam.h        |   3 +
>  5 files changed, 367 insertions(+)
>  create mode 100644 drivers/resctrl/mpam_resctrl.c
> 
[...]
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
> +
> +/*
> + * The classes we've picked to map to resctrl resources, wrapped
> + * in with their resctrl structure.
> + * Class pointer may be NULL.
> + */
> +static struct mpam_resctrl_res mpam_resctrl_controls[RDT_NUM_RESOURCES];
> +
> +/* The lock for modifying resctrl's domain lists from cpuhp callbacks. */
> +static DEFINE_MUTEX(domain_list_lock);
> +
> +static bool exposed_alloc_capable;
> +static bool exposed_mon_capable;
> +
> +bool resctrl_arch_alloc_capable(void)
> +{
> +	return exposed_alloc_capable;
> +}
> +
> +bool resctrl_arch_mon_capable(void)
> +{
> +	return exposed_mon_capable;
> +}
> +
> +/*
> + * MSC may raise an error interrupt if it sees an out or range partid/pmg,
> + * and go on to truncate the value. Regardless of what the hardware supports,
> + * only the system wide safe value is safe to use.
> + */
> +u32 resctrl_arch_get_num_closid(struct rdt_resource *ignored)
> +{
> +	return mpam_partid_max + 1;
> +}
> +
> +struct rdt_resource *resctrl_arch_get_resource(enum resctrl_res_level l)
> +{
> +	if (l >= RDT_NUM_RESOURCES)
> +		return NULL;
> +
> +	return &mpam_resctrl_controls[l].resctrl_res;
> +}
> +
> +static int mpam_resctrl_control_init(struct mpam_resctrl_res *res,
> +				     enum resctrl_res_level type)
> +{
> +	/* TODO: initialise the resctrl resources */
> +
> +	return 0;
> +}
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
> +	 */
> +	return comp->comp_id;
> +}
> +
> +static void mpam_resctrl_domain_hdr_init(int cpu, struct mpam_component *comp,
> +					 struct rdt_domain_hdr *hdr)
> +{
> +	lockdep_assert_cpus_held();
> +
> +	INIT_LIST_HEAD(&hdr->list);
> +	hdr->id = mpam_resctrl_pick_domain_id(cpu, comp);
> +	cpumask_set_cpu(cpu, &hdr->cpu_mask);
> +}
> +
> +/**
> + * mpam_resctrl_offline_domain_hdr() - Update the domain header to remove a CPU.
> + * @cpu:	The CPU to remove from the domain.
> + * @hdr:	The domain's header.
> + *
> + * Removes @cpu from the header mask. If this was the last CPU in the domain,
> + * the domain header is removed from its parent list and true is returned,
> + * indicating the parent structure can be freed.
> + * If there are other CPUs in the domain, returns false.
> + */
> +static bool mpam_resctrl_offline_domain_hdr(unsigned int cpu,
> +					    struct rdt_domain_hdr *hdr)
> +{
> +	cpumask_clear_cpu(cpu, &hdr->cpu_mask);
> +	if (cpumask_empty(&hdr->cpu_mask)) {
> +		list_del(&hdr->list);

list_del_rcu(). I'll check some more as I'm not yet convinced we need
rcu for these lists.

> +		return true;
> +	}
> +
> +	return false;
> +}
> +
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
> +
> +void mpam_resctrl_offline_cpu(unsigned int cpu)
> +{
> +	int i;
> +	struct mpam_resctrl_res *res;
> +	struct mpam_resctrl_dom *dom;
> +	struct rdt_mon_domain *mon_d;
> +	struct rdt_ctrl_domain *ctrl_d;
> +	bool ctrl_dom_empty, mon_dom_empty;
> +
> +	resctrl_offline_cpu(cpu);
> +
> +	guard(mutex)(&domain_list_lock);
> +	for (i = 0; i < RDT_NUM_RESOURCES; i++) {
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
> +
> +		mon_dom_empty = true;
> +		if (exposed_mon_capable) {
> +			mon_d = &dom->resctrl_mon_dom;
> +			mon_dom_empty = mpam_resctrl_offline_domain_hdr(cpu, &mon_d->hdr);
> +			if (mon_dom_empty)
> +				resctrl_offline_mon_domain(&res->resctrl_res, mon_d);
> +		}
> +
> +		if (ctrl_dom_empty && mon_dom_empty)
> +			kfree(dom);
> +	}
> +}
> +
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
> diff --git a/include/linux/arm_mpam.h b/include/linux/arm_mpam.h
> index 7f00c5285a32..2c7d1413a401 100644
> --- a/include/linux/arm_mpam.h
> +++ b/include/linux/arm_mpam.h
> @@ -49,6 +49,9 @@ static inline int mpam_ris_create(struct mpam_msc *msc, u8 ris_idx,
>  }
>  #endif
>  
> +bool resctrl_arch_alloc_capable(void);
> +bool resctrl_arch_mon_capable(void);
> +
>  /**
>   * mpam_register_requestor() - Register a requestor with the MPAM driver
>   * @partid_max:		The maximum PARTID value the requestor can generate.

Thanks,

Ben


