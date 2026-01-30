Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AEBDE6BF02
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 11:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:Subject:MIME-Version:Date:
	Message-ID:Reply-To:To:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QS4SrZ2qJg3isIlOI4fro1BFCyZQE8jMARKnJOFnpFk=; b=BALBfjvomo5XNFiCpWhJKI9YMr
	m/fkjDbxqzNmYC3QUYDsRA6seRuWaI4hbKHrb4sqC1qjZt7kewisoEE3PE+1zsDubItpPSAZ6x7ti
	341qurIZGPtMp7+tPSzuU9fimLvPqHNBsL2WCds18ny+avUN5iBquGDHbKtOiwO1wqmsR6M7M5l9W
	2Ni5MQTxVk12UQvQDOMHIdz30vEGD0RPcj1MwVzoDBvlw40unacoQh3z4UHfFH0j7YVexd7oBm1GL
	D3VBQStUsC4CnmMZcnrAZ50dl2GToiN9OI1NWfaKY+Z+xIguVMK2q9ODRwYMUhuM0Yj3N1j4+aW52
	mB1dW/YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlmXL-00000001Q04-1C6c;
	Fri, 30 Jan 2026 11:19:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlmXI-00000001Pzc-3qpX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 11:19:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0EE3A153B;
	Fri, 30 Jan 2026 03:19:29 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A74593F73F;
	Fri, 30 Jan 2026 03:19:30 -0800 (PST)
Message-ID: <c97c3b57-7cfe-4c26-9c1c-f790371748b0@arm.com>
Date: Fri, 30 Jan 2026 11:19:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 28/47] arm_mpam: resctrl: Add support for csu counters
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, gshan@redhat.com, james.morse@arm.com,
 jonathan.cameron@huawei.com, kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev
References: <20260112165914.4086692-1-ben.horgan@arm.com>
 <20260112165914.4086692-29-ben.horgan@arm.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20260112165914.4086692-29-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_031937_051149_9CD99A73 
X-CRM114-Status: GOOD (  34.57  )
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

Replying to myself...

On 1/12/26 16:58, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> resctrl exposes a counter via a file named llc_occupancy. This isn't really
> a counter as its value goes up and down, this is a snapshot of the cache
> storage usage monitor.
> 
> Add some picking code to find a cache as close as possible to the L3 that
> supports the CSU monitor.
> 
> If there is an L3, but it doesn't have any controls, force the L3 resource
> to exist. The existing topology_matches_l3() and
> mpam_resctrl_domain_hdr_init() code will ensure this looks like the L3,
> even if the class belongs to a later cache.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Co-developed-by: Dave Martin <dave.martin@arm.com>
> Signed-off-by: Dave Martin <dave.martin@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since rfc:
> Allow csu counters however many partid or pmg there are
> else if -> if
> reduce scope of local variables
> drop has_csu
> 
> Changes since v2:
> return -> break so works for mbwu in later patch
> add for_each_mpam_resctrl_mon
> return error from mpam_resctrl_monitor_init(). It may fail when is abmc
> allocation introduced in a later patch.
> Squashed in patch from Dave Martin:
> https://lore.kernel.org/lkml/20250820131621.54983-1-Dave.Martin@arm.com/
> ---
>  drivers/resctrl/mpam_internal.h |   6 ++
>  drivers/resctrl/mpam_resctrl.c  | 173 +++++++++++++++++++++++++++++++-
>  2 files changed, 174 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index f89ceaf7623d..21cc776e57aa 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -349,6 +349,12 @@ struct mpam_resctrl_res {
>  	struct rdt_resource	resctrl_res;
>  };
>  
> +struct mpam_resctrl_mon {
> +	struct mpam_class	*class;
> +
> +	/* per-class data that resctrl needs will live here */
> +};
> +
>  static inline int mpam_alloc_csu_mon(struct mpam_class *class)
>  {
>  	struct mpam_props *cprops = &class->props;
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 7402bf4293b6..5020a5faed96 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -37,6 +37,21 @@ static struct mpam_resctrl_res mpam_resctrl_controls[RDT_NUM_RESOURCES];
>  /* The lock for modifying resctrl's domain lists from cpuhp callbacks. */
>  static DEFINE_MUTEX(domain_list_lock);
>  
> +/*
> + * The classes we've picked to map to resctrl events.
> + * Resctrl believes all the worlds a Xeon, and these are all on the L3. This
> + * array lets us find the actual class backing the event counters. e.g.
> + * the only memory bandwidth counters may be on the memory controller, but to
> + * make use of them, we pretend they are on L3.
> + * Class pointer may be NULL.
> + */
> +static struct mpam_resctrl_mon mpam_resctrl_counters[QOS_NUM_EVENTS];
> +
> +#define for_each_mpam_resctrl_mon(mon, eventid)					\
> +	for (eventid = 0, mon = &mpam_resctrl_counters[eventid];		\
> +	     eventid < QOS_NUM_EVENTS;						\
> +	     eventid++, mon = &mpam_resctrl_counters[eventid])
> +
>  static bool exposed_alloc_capable;
>  static bool exposed_mon_capable;
>  
> @@ -259,6 +274,28 @@ static bool class_has_usable_mba(struct mpam_props *cprops)
>  	return mba_class_use_mbw_max(cprops);
>  }
>  
> +static bool cache_has_usable_csu(struct mpam_class *class)
> +{
> +	struct mpam_props *cprops;
> +
> +	if (!class)
> +		return false;
> +
> +	cprops = &class->props;
> +
> +	if (!mpam_has_feature(mpam_feat_msmon_csu, cprops))
> +		return false;
> +
> +	/*
> +	 * CSU counters settle on the value, so we can get away with
> +	 * having only one.
> +	 */
> +	if (!cprops->num_csu_mon)
> +		return false;
> +
> +	return true;
> +}
> +
>  /*
>   * Calculate the worst-case percentage change from each implemented step
>   * in the control.
> @@ -507,6 +544,64 @@ static void mpam_resctrl_pick_mba(void)
>  	}
>  }
>  
> +static void counter_update_class(enum resctrl_event_id evt_id,
> +				 struct mpam_class *class)
> +{
> +	struct mpam_class *existing_class = mpam_resctrl_counters[evt_id].class;
> +
> +	if (existing_class) {
> +		if (class->level == 3) {
> +			pr_debug("Existing class is L3 - L3 wins\n");
> +			return;
> +		}
> +
> +		if (existing_class->level < class->level) {
> +			pr_debug("Existing class is closer to L3, %u versus %u - closer is better\n",
> +				 existing_class->level, class->level);
> +			return;
> +		}
> +	}
> +
> +	mpam_resctrl_counters[evt_id].class = class;
> +	exposed_mon_capable = true;
> +}
> +
> +static void mpam_resctrl_pick_counters(void)
> +{
> +	struct mpam_class *class;
> +
> +	lockdep_assert_cpus_held();
> +
> +	guard(srcu)(&mpam_srcu);
> +	list_for_each_entry_srcu(class, &mpam_classes, classes_list,
> +				 srcu_read_lock_held(&mpam_srcu)) {
> +		if (class->level < 3) {
> +			pr_debug("class %u is before L3", class->level);
> +			continue;
> +		}
> +
> +		if (!cpumask_equal(&class->affinity, cpu_possible_mask)) {
> +			pr_debug("class %u does not cover all CPUs",
> +				 class->level);
> +			continue;
> +		}
> +
> +		if (cache_has_usable_csu(class) && topology_matches_l3(class)) {
> +			pr_debug("class %u has usable CSU, and matches L3 topology",
> +				 class->level);
> +
> +			/* CSU counters only make sense on a cache. */
> +			switch (class->type) {
> +			case MPAM_CLASS_CACHE:
> +				counter_update_class(QOS_L3_OCCUP_EVENT_ID, class);

As the counter is named llc_occupancy (llc = last level cache) and we
are naming the resource L3 it would be surprising to have llc_occupancy
on anything other than an L3. Also, that L3 should be a last level
cache. I'll update this as part of a general push to tighten up the
heuristics in this series to make sure that in the future when more
fitting user visible interfaces are added in resctrl we are able to use
them rather than being stuck with something that almost fits.

> +				break;
> +			default:
> +				break;
> +			}
> +		}
> +	}
> +}
> +
[...]


Thanks,

Ben


