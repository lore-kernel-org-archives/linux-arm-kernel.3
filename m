Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15DABD68BE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 13:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OZ2bFU04bfp53cT83OkWMoYLR5vqsZ4FHveM+5HVPQ8=; b=wptFsM7ApZXD15Ui6Aixr2A86n
	z2uRT/MXakF+vIz0+uXU4lzi53UNSnOmrLEw0lVKhLmy1kxiAC7jJVw2p6WOCl5SPThhVuXtDmEti
	Z9FehSfwow3CS9K85O/nZC+uf7D0fVGDow/3h1SQPeTddRjzKAxWhii58GUmhB3fCSxUIIEnVewv2
	QBMQlxCHVCHkJQ33ECAa+cVUYeU0R0q3LBhq/0o0XzjHJTSb/LFztSoFnRnARytT0mWnoXxYSQejo
	HO4cytf2EkRV6xu7zmcMi/XEWp6VEyeM+6VYSAwlH2X+GNGMi1GUPpSGTfUwCVSsXYaMhSvCXBBiE
	u5ceRtZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWEB7-00000008Xwh-0G7R;
	Thu, 18 Dec 2025 13:36:25 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWEB3-00000008Xvw-3sCO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 13:36:23 +0000
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dXBWM3S9YzJ46bj;
	Thu, 18 Dec 2025 21:35:43 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 818F340565;
	Thu, 18 Dec 2025 21:36:14 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 18 Dec
 2025 13:36:13 +0000
Date: Thu, 18 Dec 2025 13:36:11 +0000
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
Subject: Re: [RFC PATCH 19/38] arm_mpam: resctrl: pick classes for use as
 mbm counters
Message-ID: <20251218133611.00000a3c@huawei.com>
In-Reply-To: <20251205215901.17772-20-james.morse@arm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
	<20251205215901.17772-20-james.morse@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_053622_278591_4714E63E 
X-CRM114-Status: GOOD (  31.30  )
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

On Fri, 5 Dec 2025 21:58:42 +0000
James Morse <james.morse@arm.com> wrote:

> resctrl has two types of counters, NUMA-local and global. MPAM has only
> bandwidth counters, but the position of the MSC may mean it counts
> NUMA-local, or global traffic.
> 
> But the topology information is not available.
> 
> Apply a heuristic: the L2 or L3 supports bandwidth monitors, these are
> probably NUMA-local. If the memory controller supports bandwidth
> monitors, they are probably global.
> 
> This also allows us to assert that we don't have the same class
> backing two different resctrl events.
> 
> Because the class or component backing the event may not be 'the L3',
> it is necessary for mpam_resctrl_get_domain_from_cpu() to search
> the monitor domains too. This matters the most for 'monitor only'
> systems, where 'the L3' control domains may be empty, and the
> ctrl_comp pointer NULL.
> 
> resctrl expects there to be enough monitors for every possible control
> and monitor group to have one. Such a system gets called 'free running'
> as the monitors can be programmed once and left running.
> Any other platform will need to emulate ABMC.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> ---

> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index fc1f054f187e..9978eb48c1f4 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c

> @@ -586,7 +614,37 @@ static void mpam_resctrl_pick_counters(void)
>  				return;
>  			}
>  		}
> +
> +		has_mbwu = class_has_usable_mbwu(class);
> +		if (has_mbwu && topology_matches_l3(class)) {

Might get reused in later patches. If not
		if (class_has_usable_mbwu(class) && topology_matches_l3(class))

> +			pr_debug("class %u has usable MBWU, and matches L3 topology",
> +				 class->level);
> +
> +			/*
> +			 * MBWU counters may be 'local' or 'total' depending on
> +			 * where they are in the topology. Counters on caches
> +			 * are assumed to be local. If it's on the memory
> +			 * controller, its assumed to be global.
> +			 */
> +			switch (class->type) {
> +			case MPAM_CLASS_CACHE:
> +				counter_update_class(QOS_L3_MBM_LOCAL_EVENT_ID,
> +						     class);
> +				break;
> +			case MPAM_CLASS_MEMORY:
> +				counter_update_class(QOS_L3_MBM_TOTAL_EVENT_ID,
> +						     class);
> +				break;
> +			default:
> +				break;
> +			}
> +		}
>  	}
> +
> +	/* Allocation of MBWU monitors assumes that the class is unique... */
> +	if (mpam_resctrl_counters[QOS_L3_MBM_LOCAL_EVENT_ID].class)
> +		WARN_ON_ONCE(mpam_resctrl_counters[QOS_L3_MBM_LOCAL_EVENT_ID].class ==
> +			     mpam_resctrl_counters[QOS_L3_MBM_TOTAL_EVENT_ID].class);
>  }

>  
> +/*
> + * We know all the monitors are associated with the L3, even if there are no
> + * controls and therefore no control component. Find the cache-id for the CPU
> + * and use that to search for existing resctrl domains.
> + * This relies on mpam_resctrl_pick_domain_id() using the L3 cache-id
> + * for anything that is not a cache.
> + */
> +static struct mpam_resctrl_dom *mpam_resctrl_get_mon_domain_from_cpu(int cpu)
> +{
> +	u32 cache_id;
> +	struct rdt_mon_domain *mon_d;
> +	struct mpam_resctrl_dom *dom;
> +	struct mpam_resctrl_res *l3 = &mpam_resctrl_controls[RDT_RESOURCE_L3];
> +
> +	if (!l3->class)
> +		return NULL;
> +	/* TODO: how does this order with cacheinfo updates under cpuhp? */
> +	cache_id = get_cpu_cacheinfo_id(cpu, 3);
> +	if (cache_id == ~0)
> +		return NULL;
> +
> +	list_for_each_entry(mon_d, &l3->resctrl_res.mon_domains, hdr.list) {
> +		dom = container_of(mon_d, struct mpam_resctrl_dom, resctrl_mon_dom);

Similar comment to one on earlier patch. Can make the list iterator directly
provide dom as that's what it's actually a list of, not rdt_mon_domain structures.

> +
> +		if (mon_d->hdr.id == cache_id)
> +			return dom;
> +	}
> +
> +	return NULL;
> +}
> +
>  static struct mpam_resctrl_dom *
>  mpam_resctrl_get_domain_from_cpu(int cpu, struct mpam_resctrl_res *res)
>  {
>  	struct mpam_resctrl_dom *dom;
>  	struct rdt_ctrl_domain *ctrl_d;
> +	struct rdt_resource *r = &res->resctrl_res;

Push back to original patch.   

>  
>  	lockdep_assert_cpus_held();
>  
> -	list_for_each_entry_rcu(ctrl_d, &res->resctrl_res.ctrl_domains,
> -				hdr.list) {
> +	list_for_each_entry_rcu(ctrl_d, &r->ctrl_domains, hdr.list) {
>  		dom = container_of(ctrl_d, struct mpam_resctrl_dom,
>  				   resctrl_ctrl_dom);
>  



