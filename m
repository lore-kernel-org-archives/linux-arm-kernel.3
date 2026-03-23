Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14950D58CBF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 23:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HaZ0P3BfwTmatVVttL1AZYEXcEIdcJsUw4WJL661gw4=; b=fjs3W1Gr9vRd8ac+nUNFbEsJyB
	nYi0jsLZv5kmdXhzpT/JIql2hXiytOdncB7pgmX1gvVf1S6VPU2s94DWKJxFo8XTdbVoH1SnmrAew
	157KyE25/sXWvCo0cph4vSOmt6a21I5ihKCC5huvj/fIhmUnVaLH9RYACtuuNFE4rcFfrpkFByFGs
	XkuQFVXS9q8KCBzyg7sh7jsmJqzA9mal1QETZReVYRmmlCdIX2tmEwYa+Ih/AYZ0UEA/656ZWfyTR
	64kjjBHPDybkyQaizxQGORRxL/hO+bmyV4wE1827KFl7TMCP8oATnpmya0IFvShr/1Q0HRA2CN3gA
	nh3LN5jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4oP4-000000007Vi-3uti;
	Mon, 23 Mar 2026 23:09:46 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4oP2-000000007VJ-0zST
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 23:09:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774307382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HaZ0P3BfwTmatVVttL1AZYEXcEIdcJsUw4WJL661gw4=;
	b=Y+R2E10uOfn5YXmoAGaIDGHo4w6Ov19fHQTfQmHE+mLuvaEsHp1M+D7zlkiQWwJtwK19zY
	/+3Xs/joLUZ4S5VrK0pFk27subqY6criiWaXp5padnqp8vGKn8Se/NDWtAefpMCZTV5qQZ
	5L0ygYlUF/GS7zqsQgI/P7zhgUGSpF4=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-WUvzGW4yPcalpZRJuMZQ9Q-1; Mon, 23 Mar 2026 19:09:39 -0400
X-MC-Unique: WUvzGW4yPcalpZRJuMZQ9Q-1
X-Mimecast-MFC-AGG-ID: WUvzGW4yPcalpZRJuMZQ9Q_1774307378
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-829a655f5e4so1927550b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 16:09:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774307378; x=1774912178;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HaZ0P3BfwTmatVVttL1AZYEXcEIdcJsUw4WJL661gw4=;
        b=OqCQ+TBJdpu2UCCd5dYr9iz1WD3o0f7HfgJu5KtoPYBM4pwLUf0+iBL7j0iXsrk5Tz
         KThs9Rz2SGvVmfI3STFkBU7ie5bHntekVnayd2kV9g6feSVgYNQRfg/47qEMazWpn71h
         foqq5Mncb0AWsMBPlLrldPZm2uiA8bIpDVKl0d76YgviFeyOmYJJmafx6Fd83T+4dgBn
         kwdX7+Cr55anaJw0BLFp5fdRyw3AeaEIy+7LL1y5xXW1LxYVJnqv1KZJ/D3G1mUNfumh
         uurPRqqzXfJg+5w8VtAsZ2rQckGWdjXCLcm5IDjxxUkMaOaI77DdHjXqw7lIoJfYjv3l
         vsrg==
X-Forwarded-Encrypted: i=1; AJvYcCW+V5/rERRs9Y7Ok7yjBufR30kgclalpQUyjvWNV+0ARb44lVnwKSHJhnK5onmgsVTSVmL7LSczkAC58rsUHvrU@lists.infradead.org
X-Gm-Message-State: AOJu0YzfjaxMYf7ec21/wZDhmUALTCtaMOxu0bcTVOku3qb9S3DH1zvl
	8dSCCFRZWtKIaUSOKXwuwnx1cDFuClwa2ST2oEipkZ+B2tOO+tPeOVbuKpDPWZI5V3rRcLF2aGu
	bf1yrqd21ysGcuSfR3bM1sy+HmTpM5xkwJ2CdBXcclKoZdTWayKKZYuQbWeZyeSaFC13fW/KVjV
	Zr
X-Gm-Gg: ATEYQzybbFsaORTNAeso31PnhHQe+/lF9YIlrK03uiz+qrj8k/MERIUzUfPBg8iaqOO
	U0Q7msB/AfT5yvXP7L2CMS7mBOLesv/N0WK5Bvb9YbW4zZWAd/z+5grpnNJQkCe+Vg+H+03CCIX
	cNnXcSt6/MRoA244NG63SRKF0k2Si7EkIA/WtlTBTIFjax8LPZvTTrQPd8oDFxgsnsLZbzfJUzC
	I1DGPBqh81lA/XlvhbsfUjmCpEzRRJz3XrPJSUlE+1EM1MCvt0a1ldJcpvc9cNMYp2Z6gambRvf
	GdgVjSX06Na73pSL35XweJrCYKpdYbG11pcAtRTD0xpYy8BDuC9kQ5oRDbzPAeHXfu927j8lY6M
	sSDIf6oa1TlXSR4qs+J3eflHQKX5pI4ayihvRQ+zhtPmxL7+GeLH5GZxMTGlIeJ0f
X-Received: by 2002:a05:6a00:f88:b0:81f:852b:a91e with SMTP id d2e1a72fcca58-82a8c39ec60mr11026960b3a.59.1774307378138;
        Mon, 23 Mar 2026 16:09:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:f88:b0:81f:852b:a91e with SMTP id d2e1a72fcca58-82a8c39ec60mr11026933b3a.59.1774307377640;
        Mon, 23 Mar 2026 16:09:37 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0409b455sm10539686b3a.28.2026.03.23.16.09.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 16:09:37 -0700 (PDT)
Message-ID: <3ae3356d-a901-4b71-90df-557d468e4785@redhat.com>
Date: Tue, 24 Mar 2026 09:09:20 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 25/40] arm_mpam: resctrl: Add support for 'MB' resource
To: Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, james.morse@arm.com, jonathan.cameron@huawei.com,
 kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev,
 zengheng4@huawei.com, linux-doc@vger.kernel.org,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20260313144617.3420416-1-ben.horgan@arm.com>
 <20260313144617.3420416-26-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260313144617.3420416-26-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 16aCALilaQu7UeoVoZ8yWS3Y6T8VGPJOEjJVlQgETXQ_1774307378
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_160944_427680_54D7E6C2 
X-CRM114-Status: GOOD (  50.71  )
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

Hi Ben,

On 3/14/26 12:46 AM, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> resctrl supports 'MB', as a percentage throttling of traffic from the
> L3. This is the control that mba_sc uses, so ideally the class chosen
> should be as close as possible to the counters used for mbm_total. If there
> is a single L3, it's the last cache, and the topology of the memory matches
> then the traffic at the memory controller will be equivalent to that at
> egress of the L3. If these conditions are met allow the memory class to
> back MB.
> 
> MB's percentage control should be backed either with the fixed point
> fraction MBW_MAX or bandwidth portion bitmaps. The bandwidth portion
> bitmaps is not used as its tricky to pick which bits to use to avoid
> contention, and may be possible to expose this as something other than a
> percentage in the future.
> 
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Zeng Heng <zengheng4@huawei.com>
> Tested-by: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
> Reviewed-by: Zeng Heng <zengheng4@huawei.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Co-developed-by: Dave Martin <Dave.Martin@arm.com>
> Signed-off-by: Dave Martin <Dave.Martin@arm.com>
> Signed-off-by: James Morse <james.morse@arm.com>>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since v2:
> Code flow change
> Commit message 'or'
> 
> Changes since v3:
> initialise tmp_cpumask
> update commit message
> check the traffic matches l3
> update comment on candidate_class update, only mbm_total
> drop tags due to rework
> 
> Changes since v4:
> Move __free declarations to point of first use
> New line for a '{'
> set r->alloc_capable last (Reinette)
> 
> Changes since v5:
> Mention L3 needs to be the last cache in commit message
> Consider memory side caches and numa nodes
> ---
>   drivers/resctrl/mpam_resctrl.c | 287 ++++++++++++++++++++++++++++++++-
>   1 file changed, 286 insertions(+), 1 deletion(-)
> 

One comment below and it deserves to be addressed if we have another respin:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 93c8a9608ed4..cad65cf7d12d 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -267,6 +267,33 @@ static bool cache_has_usable_cpor(struct mpam_class *class)
>   	return class->props.cpbm_wd <= 32;
>   }
>   
> +static bool mba_class_use_mbw_max(struct mpam_props *cprops)
> +{
> +	return (mpam_has_feature(mpam_feat_mbw_max, cprops) &&
> +		cprops->bwa_wd);
> +}
> +
> +static bool class_has_usable_mba(struct mpam_props *cprops)
> +{
> +	return mba_class_use_mbw_max(cprops);
> +}
> +
> +/*
> + * Calculate the worst-case percentage change from each implemented step
> + * in the control.
> + */
> +static u32 get_mba_granularity(struct mpam_props *cprops)
> +{
> +	if (!mba_class_use_mbw_max(cprops))
> +		return 0;
> +
> +	/*
> +	 * bwa_wd is the number of bits implemented in the 0.xxx
> +	 * fixed point fraction. 1 bit is 50%, 2 is 25% etc.
> +	 */
> +	return DIV_ROUND_UP(MAX_MBA_BW, 1 << cprops->bwa_wd);
> +}
> +
>   /*
>    * Each fixed-point hardware value architecturally represents a range
>    * of values: the full range 0% - 100% is split contiguously into
> @@ -317,6 +344,166 @@ static u16 percent_to_mbw_max(u8 pc, struct mpam_props *cprops)
>   	return val;
>   }
>   
> +static u32 get_mba_min(struct mpam_props *cprops)
> +{
> +	if (!mba_class_use_mbw_max(cprops)) {
> +		WARN_ON_ONCE(1);
> +		return 0;
> +	}
> +
> +	return mbw_max_to_percent(0, cprops);
> +}
> +
> +/* Find the L3 cache that has affinity with this CPU */
> +static int find_l3_equivalent_bitmask(int cpu, cpumask_var_t tmp_cpumask)
> +{
> +	u32 cache_id = get_cpu_cacheinfo_id(cpu, 3);
> +
> +	lockdep_assert_cpus_held();
> +
> +	return mpam_get_cpumask_from_cache_id(cache_id, 3, tmp_cpumask);
> +}
> +
> +/*
> + * topology_matches_l3() - Is the provided class the same shape as L3
> + * @victim:		The class we'd like to pretend is L3.
> + *
> + * resctrl expects all the world's a Xeon, and all counters are on the
> + * L3. We allow some mapping counters on other classes. This requires
> + * that the CPU->domain mapping is the same kind of shape.
> + *
> + * Using cacheinfo directly would make this work even if resctrl can't
> + * use the L3 - but cacheinfo can't tell us anything about offline CPUs.
> + * Using the L3 resctrl domain list also depends on CPUs being online.
> + * Using the mpam_class we picked for L3 so we can use its domain list
> + * assumes that there are MPAM controls on the L3.
> + * Instead, this path eventually uses the mpam_get_cpumask_from_cache_id()
> + * helper which can tell us about offline CPUs ... but getting the cache_id
> + * to start with relies on at least one CPU per L3 cache being online at
> + * boot.
> + *
> + * Walk the victim component list and compare the affinity mask with the
> + * corresponding L3. The topology matches if each victim:component's affinity
> + * mask is the same as the CPU's corresponding L3's. These lists/masks are
> + * computed from firmware tables so don't change at runtime.
> + */
> +static bool topology_matches_l3(struct mpam_class *victim)
> +{
> +	int cpu, err;
> +	struct mpam_component *victim_iter;
> +
> +	lockdep_assert_cpus_held();
> +
> +	cpumask_var_t __free(free_cpumask_var) tmp_cpumask = CPUMASK_VAR_NULL;
> +	if (!alloc_cpumask_var(&tmp_cpumask, GFP_KERNEL))
> +		return false;
> +
> +	guard(srcu)(&mpam_srcu);
> +	list_for_each_entry_srcu(victim_iter, &victim->components, class_list,
> +				 srcu_read_lock_held(&mpam_srcu)) {
> +		if (cpumask_empty(&victim_iter->affinity)) {
> +			pr_debug("class %u has CPU-less component %u - can't match L3!\n",
> +				 victim->level, victim_iter->comp_id);
> +			return false;
> +		}
> +
> +		cpu = cpumask_any_and(&victim_iter->affinity, cpu_online_mask);
> +		if (WARN_ON_ONCE(cpu >= nr_cpu_ids))
> +			return false;
> +
> +		cpumask_clear(tmp_cpumask);
> +		err = find_l3_equivalent_bitmask(cpu, tmp_cpumask);
> +		if (err) {
> +			pr_debug("Failed to find L3's equivalent component to class %u component %u\n",
> +				 victim->level, victim_iter->comp_id);
> +			return false;
> +		}
> +
> +		/* Any differing bits in the affinity mask? */
> +		if (!cpumask_equal(tmp_cpumask, &victim_iter->affinity)) {
> +			pr_debug("class %u component %u has Mismatched CPU mask with L3 equivalent\n"
> +				 "L3:%*pbl != victim:%*pbl\n",
> +				 victim->level, victim_iter->comp_id,
> +				 cpumask_pr_args(tmp_cpumask),
> +				 cpumask_pr_args(&victim_iter->affinity));
> +
> +			return false;
> +		}
> +	}
> +
> +	return true;
> +}
> +
> +/*
> + * Test if the traffic for a class matches that at egress from the L3. For
> + * MSC at memory controllers this is only possible if there is a single L3
> + * as otherwise the counters at the memory can include bandwidth from the
> + * non-local L3.
> + */
> +static bool traffic_matches_l3(struct mpam_class *class)
> +{
> +	int err, cpu;
> +
> +	lockdep_assert_cpus_held();
> +
> +	if (class->type == MPAM_CLASS_CACHE && class->level == 3)
> +		return true;
> +
> +	if (class->type == MPAM_CLASS_CACHE && class->level != 3) {
> +		pr_debug("class %u is a different cache from L3\n", class->level);
> +		return false;
> +	}
> +
> +	if (class->type != MPAM_CLASS_MEMORY) {
> +		pr_debug("class %u is neither of type cache or memory\n", class->level);
> +		return false;
> +	}
> +

We bail if the calss isn't MPAM_CLASS_MEMORY here ...

> +	cpumask_var_t __free(free_cpumask_var) tmp_cpumask = CPUMASK_VAR_NULL;
> +	if (!alloc_cpumask_var(&tmp_cpumask, GFP_KERNEL)) {
> +		pr_debug("cpumask allocation failed\n");
> +		return false;
> +	}
> +
> +	if (class->type != MPAM_CLASS_MEMORY) {
> +		pr_debug("class %u is neither of type cache or memory\n",
> +			 class->level);
> +		return false;
> +	}
> +

Duplicated check here as the previous one. So this check can be dropped.

> +	cpu = cpumask_any_and(&class->affinity, cpu_online_mask);
> +	err = find_l3_equivalent_bitmask(cpu, tmp_cpumask);
> +	if (err) {
> +		pr_debug("Failed to find L3 downstream to cpu %d\n", cpu);
> +		return false;
> +	}
> +
> +	if (!cpumask_equal(tmp_cpumask, cpu_possible_mask)) {
> +		pr_debug("There is more than one L3\n");
> +		return false;
> +	}
> +
> +	/* Be strict; the traffic might stop in the intermediate cache. */
> +	if (get_cpu_cacheinfo_id(cpu, 4) != -1) {
> +		pr_debug("L3 isn't the last level of cache\n");
> +		return false;
> +	}
> +
> +	if (num_possible_nodes() > 1) {
> +		pr_debug("There is more than one numa node\n");
> +		return false;
> +	}
> +
> +#ifdef CONFIG_HMEM_REPORTING
> +	if (node_devices[cpu_to_node(cpu)]->cache_dev) {
> +		pr_debug("There is a memory side cache\n");
> +		return false;
> +	}
> +#endif
> +
> +	return true;
> +}
> +
>   /* Test whether we can export MPAM_CLASS_CACHE:{2,3}? */
>   static void mpam_resctrl_pick_caches(void)
>   {
> @@ -358,9 +545,68 @@ static void mpam_resctrl_pick_caches(void)
>   	}
>   }
>   
> +static void mpam_resctrl_pick_mba(void)
> +{
> +	struct mpam_class *class, *candidate_class = NULL;
> +	struct mpam_resctrl_res *res;
> +
> +	lockdep_assert_cpus_held();
> +
> +	guard(srcu)(&mpam_srcu);
> +	list_for_each_entry_srcu(class, &mpam_classes, classes_list,
> +				 srcu_read_lock_held(&mpam_srcu)) {
> +		struct mpam_props *cprops = &class->props;
> +
> +		if (class->level != 3 && class->type == MPAM_CLASS_CACHE) {
> +			pr_debug("class %u is a cache but not the L3\n", class->level);
> +			continue;
> +		}
> +
> +		if (!class_has_usable_mba(cprops)) {
> +			pr_debug("class %u has no bandwidth control\n",
> +				 class->level);
> +			continue;
> +		}
> +
> +		if (!cpumask_equal(&class->affinity, cpu_possible_mask)) {
> +			pr_debug("class %u has missing CPUs\n", class->level);
> +			continue;
> +		}
> +
> +		if (!topology_matches_l3(class)) {
> +			pr_debug("class %u topology doesn't match L3\n",
> +				 class->level);
> +			continue;
> +		}
> +
> +		if (!traffic_matches_l3(class)) {
> +			pr_debug("class %u traffic doesn't match L3 egress\n",
> +				 class->level);
> +			continue;
> +		}
> +
> +		/*
> +		 * Pick a resource to be MBA that as close as possible to
> +		 * the L3. mbm_total counts the bandwidth leaving the L3
> +		 * cache and MBA should correspond as closely as possible
> +		 * for proper operation of mba_sc.
> +		 */
> +		if (!candidate_class || class->level < candidate_class->level)
> +			candidate_class = class;
> +	}
> +
> +	if (candidate_class) {
> +		pr_debug("selected class %u to back MBA\n",
> +			 candidate_class->level);
> +		res = &mpam_resctrl_controls[RDT_RESOURCE_MBA];
> +		res->class = candidate_class;
> +	}
> +}
> +
>   static int mpam_resctrl_control_init(struct mpam_resctrl_res *res)
>   {
>   	struct mpam_class *class = res->class;
> +	struct mpam_props *cprops = &class->props;
>   	struct rdt_resource *r = &res->resctrl_res;
>   
>   	switch (r->rid) {
> @@ -392,6 +638,19 @@ static int mpam_resctrl_control_init(struct mpam_resctrl_res *res)
>   		r->cache.shareable_bits = resctrl_get_default_ctrl(r);
>   		r->alloc_capable = true;
>   		break;
> +	case RDT_RESOURCE_MBA:
> +		r->schema_fmt = RESCTRL_SCHEMA_RANGE;
> +		r->ctrl_scope = RESCTRL_L3_CACHE;
> +
> +		r->membw.delay_linear = true;
> +		r->membw.throttle_mode = THREAD_THROTTLE_UNDEFINED;
> +		r->membw.min_bw = get_mba_min(cprops);
> +		r->membw.max_bw = MAX_MBA_BW;
> +		r->membw.bw_gran = get_mba_granularity(cprops);
> +
> +		r->name = "MB";
> +		r->alloc_capable = true;
> +		break;
>   	default:
>   		return -EINVAL;
>   	}
> @@ -406,7 +665,17 @@ static int mpam_resctrl_pick_domain_id(int cpu, struct mpam_component *comp)
>   	if (class->type == MPAM_CLASS_CACHE)
>   		return comp->comp_id;
>   
> -	/* TODO: repaint domain ids to match the L3 domain ids */
> +	if (topology_matches_l3(class)) {
> +		/* Use the corresponding L3 component ID as the domain ID */
> +		int id = get_cpu_cacheinfo_id(cpu, 3);
> +
> +		/* Implies topology_matches_l3() made a mistake */
> +		if (WARN_ON_ONCE(id == -1))
> +			return comp->comp_id;
> +
> +		return id;
> +	}
> +
>   	/* Otherwise, expose the ID used by the firmware table code. */
>   	return comp->comp_id;
>   }
> @@ -446,6 +715,12 @@ u32 resctrl_arch_get_config(struct rdt_resource *r, struct rdt_ctrl_domain *d,
>   	case RDT_RESOURCE_L3:
>   		configured_by = mpam_feat_cpor_part;
>   		break;
> +	case RDT_RESOURCE_MBA:
> +		if (mpam_has_feature(mpam_feat_mbw_max, cprops)) {
> +			configured_by = mpam_feat_mbw_max;
> +			break;
> +		}
> +		fallthrough;
>   	default:
>   		return resctrl_get_default_ctrl(r);
>   	}
> @@ -457,6 +732,8 @@ u32 resctrl_arch_get_config(struct rdt_resource *r, struct rdt_ctrl_domain *d,
>   	switch (configured_by) {
>   	case mpam_feat_cpor_part:
>   		return cfg->cpbm;
> +	case mpam_feat_mbw_max:
> +		return mbw_max_to_percent(cfg->mbw_max, cprops);
>   	default:
>   		return resctrl_get_default_ctrl(r);
>   	}
> @@ -504,6 +781,13 @@ int resctrl_arch_update_one(struct rdt_resource *r, struct rdt_ctrl_domain *d,
>   		cfg.cpbm = cfg_val;
>   		mpam_set_feature(mpam_feat_cpor_part, &cfg);
>   		break;
> +	case RDT_RESOURCE_MBA:
> +		if (mpam_has_feature(mpam_feat_mbw_max, cprops)) {
> +			cfg.mbw_max = percent_to_mbw_max(cfg_val, cprops);
> +			mpam_set_feature(mpam_feat_mbw_max, &cfg);
> +			break;
> +		}
> +		fallthrough;
>   	default:
>   		return -EINVAL;
>   	}
> @@ -775,6 +1059,7 @@ int mpam_resctrl_setup(void)
>   
>   	/* Find some classes to use for controls */
>   	mpam_resctrl_pick_caches();
> +	mpam_resctrl_pick_mba();
>   
>   	/* Initialise the resctrl structures from the classes */
>   	for_each_mpam_resctrl_control(res, rid) {

Thanks,
Gavin


