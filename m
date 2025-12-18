Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C7E6D6ACE9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 11:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6g7sDoS/m6JftSAitV3RdhtQIWTNuuVX15nCgNWBpbs=; b=vBpAZgdx/YNzJmalDtPGV0BPYJ
	+yzF+y1MvEEElFjfjynx0ICqHQnsN49+uQx0dpvcC0+swCg/9U90F0yStr4DmApGVZK1G+A74vt65
	SPK3Oc5xP6vhTR6zFtDjlOZCI5jQwUw/LtjrtxUE2h5w2QiEFY8C3Tn8VCNZjyjuP5AfaXi8WjKkw
	9Mi2pIUDhh9A1nqwyEJJRcm6h4EAtQcURxU6npJHl1pwAmBglb8bZtBMhqFU7lbNvV0nZdmy66bOn
	iD0XBoBaNDl/2FK0jX5iASnG5XwuIs558UY8HFkC84SHrpiXp064W8gHU+FVoBMG1MU37hVKOKYhc
	TWw5HWvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWCKx-00000008MEy-3BaE;
	Thu, 18 Dec 2025 11:38:27 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWCKu-00000008MBG-25nV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 11:38:25 +0000
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dX7vH1YCQzJ46CX;
	Thu, 18 Dec 2025 19:37:47 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 1F12E40086;
	Thu, 18 Dec 2025 19:38:18 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 18 Dec
 2025 11:38:16 +0000
Date: Thu, 18 Dec 2025 11:38:15 +0000
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
Subject: Re: [RFC PATCH 08/38] arm_mpam: resctrl: Pick the caches we will
 use as resctrl resources
Message-ID: <20251218113815.000055e7@huawei.com>
In-Reply-To: <20251205215901.17772-9-james.morse@arm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
	<20251205215901.17772-9-james.morse@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_033824_824834_7B4DCA3D 
X-CRM114-Status: GOOD (  29.16  )
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

On Fri, 5 Dec 2025 21:58:31 +0000
James Morse <james.morse@arm.com> wrote:

> Systems with MPAM support may have a variety of control types at any
> point of their system layout. We can only expose certain types of
> control, and only if they exist at particular locations.
> 
> Start with the well-know caches. These have to be depth 2 or 3
> and support MPAM's cache portion bitmap controls, with a number
> of portions fewer than resctrl's limit.

Another one that is a bit random on wrap point.  Probably worth tidying
up formatting of all the commit messages so fussy people like me stop
moaning ;)

Otherwise trivial stuff inline.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
>  drivers/resctrl/mpam_resctrl.c | 91 +++++++++++++++++++++++++++++++++-
>  1 file changed, 89 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 320cebbd37ce..ceaf11af4fc1 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -60,10 +60,96 @@ struct rdt_resource *resctrl_arch_get_resource(enum resctrl_res_level l)
>  	return &mpam_resctrl_controls[l].resctrl_res;
>  }
>  
> +static bool cache_has_usable_cpor(struct mpam_class *class)
> +{
> +	struct mpam_props *cprops = &class->props;
> +
> +	if (!mpam_has_feature(mpam_feat_cpor_part, cprops))
> +		return false;
> +
> +	/* resctrl uses u32 for all bitmap configurations */
> +	return (class->props.cpbm_wd <= 32);

For me those brackets aren't adding anything. It's not like
anyone forgets precedence wrt return vs operators.

> +}
> +
> +/* Test whether we can export MPAM_CLASS_CACHE:{2,3}? */
> +static void mpam_resctrl_pick_caches(void)
> +{
> +	struct mpam_class *class;
> +	struct mpam_resctrl_res *res;
> +
> +	lockdep_assert_cpus_held();
> +
> +	guard(srcu)(&mpam_srcu);
> +	list_for_each_entry_srcu(class, &mpam_classes, classes_list,
> +				 srcu_read_lock_held(&mpam_srcu)) {
> +		if (class->type != MPAM_CLASS_CACHE) {
> +			pr_debug("class %u is not a cache\n", class->level);

Lots of things aren't caches and seems unlikely that is a case that will
make people wonder why pick caches didn't happen. So maybe this debug
print is excessive?

> +			continue;
> +		}
> +
> +		if (class->level != 2 && class->level != 3) {
> +			pr_debug("class %u is not L2 or L3\n", class->level);
> +			continue;
> +		}
> +
> +		if (!cache_has_usable_cpor(class)) {
> +			pr_debug("class %u cache misses CPOR\n", class->level);
> +			continue;
> +		}
> +
> +		if (!cpumask_equal(&class->affinity, cpu_possible_mask)) {
> +			pr_debug("class %u has missing CPUs\n", class->level);
> +			pr_debug("class %u mask %*pb != %*pb\n", class->level,
> +				 cpumask_pr_args(&class->affinity),
> +				 cpumask_pr_args(cpu_possible_mask));

Unless this is getting more complex in later patches, doesn't seem like
			pr_debug("class %u has missing CPUs, mask %*pb != %*pb\n",
is too much to put on one line.

					 
> +			continue;
> +		}
> +
> +		if (class->level == 2)
> +			res = &mpam_resctrl_controls[RDT_RESOURCE_L2];
> +		else
> +			res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
> +		res->class = class;
> +		exposed_alloc_capable = true;
> +	}
> +}
> +
>  static int mpam_resctrl_control_init(struct mpam_resctrl_res *res,
>  				     enum resctrl_res_level type)
>  {
> -	/* TODO: initialise the resctrl resources */
> +	struct mpam_class *class = res->class;
> +	struct rdt_resource *r = &res->resctrl_res;
> +
> +	switch (res->resctrl_res.rid) {

	switch (r->rid) { ?

> +	case RDT_RESOURCE_L2:
> +	case RDT_RESOURCE_L3:
> +		r->alloc_capable = true;
> +		r->schema_fmt = RESCTRL_SCHEMA_BITMAP;
> +		r->cache.arch_has_sparse_bitmasks = true;
> +
> +		r->cache.cbm_len = class->props.cpbm_wd;
> +		/* mpam_devices will reject empty bitmaps */
> +		r->cache.min_cbm_bits = 1;
> +
> +		if (r->rid == RDT_RESOURCE_L2) {
> +			r->name = "L2";
> +			r->ctrl_scope = RESCTRL_L2_CACHE;
> +		} else {
> +			r->name = "L3";
> +			r->ctrl_scope = RESCTRL_L3_CACHE;
> +		}
> +
> +		/*
> +		 * Which bits are shared with other ...things...
> +		 * Unknown devices use partid-0 which uses all the bitmap
> +		 * fields. Until we configured the SMMU and GIC not to do this
> +		 * 'all the bits' is the correct answer here.
> +		 */
> +		r->cache.shareable_bits = resctrl_get_default_ctrl(r);
> +		break;
> +	default:
> +		break;
> +	}
>  
>  	return 0;
>  }
> @@ -286,7 +372,8 @@ int mpam_resctrl_setup(void)
>  		res->resctrl_res.rid = i;
>  	}
>  
> -	/* TODO: pick MPAM classes to map to resctrl resources */
> +	/* Find some classes to use for controls */
> +	mpam_resctrl_pick_caches();
>  
>  	/* Initialise the resctrl structures from the classes */
>  	for (i = 0; i < RDT_NUM_RESOURCES; i++) {


