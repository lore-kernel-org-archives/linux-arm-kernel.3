Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C078D29C28
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 13:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pZv852bcLztcTLSi5EObZUcU1LbOOI1cMahq1+EKgqo=; b=qKaZK8Xh6p8teFcCh1XntY7dM3
	8lKZBdgXY+IUxe/rtBbOfUdFPGj+kBcqmqgfR0eZ8oBFvcxSktZdqgCVe479ws/xy7MB8ge0GQng1
	ZDAmwbnuEoJNG2bbzEgsvMJllVG3PvqWW55+sViy4Yqbs+BwSFwbCtzJ3BWTsaI+8kOmGx8kLf3G0
	jBn1hGCJM2nyPTB0GgLC0SUo7JKA6gjrADi7X70WyXcVV/Zf5WxRoiz1/QZrTogxNrFY8y4XWY/Rr
	/TdiA739moYJlE+j8Dk7QsptLSjXsKRnjvi3jsAhhRVhGeC2t78HhbUm8l89XJ2RIpMTwPMZ5L/xb
	AkBZsy8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhphG-00000002BmL-0gax;
	Mon, 19 Jan 2026 13:53:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhphD-00000002Bly-23oY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 13:53:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E2262497;
	Mon, 19 Jan 2026 05:53:23 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8B35C3F632;
	Mon, 19 Jan 2026 05:53:25 -0800 (PST)
Message-ID: <7fb08df4-7f57-489c-9f3e-de049a0172e1@arm.com>
Date: Mon, 19 Jan 2026 13:53:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 27/47] arm_mpam: resctrl: Add support for 'MB' resource
To: Gavin Shan <gshan@redhat.com>
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
 Zeng Heng <zengheng4@huawei.com>
References: <20260112165914.4086692-1-ben.horgan@arm.com>
 <20260112165914.4086692-28-ben.horgan@arm.com>
 <36e12dad-833f-4498-a6da-f4fc2ca081d3@redhat.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <36e12dad-833f-4498-a6da-f4fc2ca081d3@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_055331_613292_08EE4B51 
X-CRM114-Status: GOOD (  24.51  )
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

Hi Gavin,

On 1/19/26 11:53, Gavin Shan wrote:
> Hi Ben,
> 
> On 1/13/26 12:58 AM, Ben Horgan wrote:
>> From: James Morse <james.morse@arm.com>
>>
>> resctrl supports 'MB', as a percentage throttling of traffic somewhere
>> after the L3. This is the control that mba_sc uses, so ideally the class
>> chosen should be as close as possible to the counters used for mba_local.
>>
>> MB's percentage control should be backed either with the fixed point
>> fraction MBW_MAX or bandwidth portion bitmaps. The bandwidth portion
>> bitmaps is not used as its tricky to pick which bits to use to avoid
>> contention, and may be possible to expose this as something other than a
>> percentage in the future.
>>
>> CC: Zeng Heng <zengheng4@huawei.com>
>> Co-developed-by: Dave Martin <Dave.Martin@arm.com>
>> Signed-off-by: Dave Martin <Dave.Martin@arm.com>
>> Signed-off-by: James Morse <james.morse@arm.com>>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>> ---
[...]
>> +static bool topology_matches_l3(struct mpam_class *victim)
>> +{
>> +    int cpu, err;
>> +    struct mpam_component *victim_iter;
>> +    cpumask_var_t __free(free_cpumask_var) tmp_cpumask;
>> +
> 
> A warning reported by checkpatch.pl like below.
> 
> WARNING: Missing a blank line after declarations
> #117: FILE: drivers/resctrl/mpam_resctrl.c:375:
> +    struct mpam_component *victim_iter;
> +    cpumask_var_t __free(free_cpumask_var) tmp_cpumask;

I expect this is because __free() declarations don't need to be at the
top of a scope and so checkpatch doesn't treat them as normal
declarations. I don't think anything needs changing here.

> 
> Besides, it'd better to initialize @tmp_cpumask:
> 
> cpumask_var_t __free(free_cpumask_var) tmp_cpumask = CPUMASK_VAR_NULL;

Yep, I'll update.

> 
>> +    if (!alloc_cpumask_var(&tmp_cpumask, GFP_KERNEL))
>> +        return false;
>> +
>> +    guard(srcu)(&mpam_srcu);
>> +    list_for_each_entry_srcu(victim_iter, &victim->components,
>> class_list,
>> +                 srcu_read_lock_held(&mpam_srcu)) {
>> +        if (cpumask_empty(&victim_iter->affinity)) {
>> +            pr_debug("class %u has CPU-less component %u - can't
>> match L3!\n",
>> +                 victim->level, victim_iter->comp_id);
>> +            return false;
>> +        }
>> +
>> +        cpu = cpumask_any(&victim_iter->affinity);
>> +        if (WARN_ON_ONCE(cpu >= nr_cpu_ids))
>> +            return false;
>> +
>> +        cpumask_clear(tmp_cpumask);
>> +        err = find_l3_equivalent_bitmask(cpu, tmp_cpumask);
>> +        if (err) {
>> +            pr_debug("Failed to find L3's equivalent component to
>> class %u component %u\n",
>> +                 victim->level, victim_iter->comp_id);
>> +            return false;
>> +        }
>> +
>> +        /* Any differing bits in the affinity mask? */
>> +        if (!cpumask_equal(tmp_cpumask, &victim_iter->affinity)) {
>> +            pr_debug("class %u component %u has Mismatched CPU mask
>> with L3 equivalent\n"
>> +                 "L3:%*pbl != victim:%*pbl\n",
>> +                 victim->level, victim_iter->comp_id,
>> +                 cpumask_pr_args(tmp_cpumask),
>> +                 cpumask_pr_args(&victim_iter->affinity));
>> +
>> +            return false;
>> +        }
>> +    }
>> +
>> +    return true;
>> +}
>> +
>>   /* Test whether we can export MPAM_CLASS_CACHE:{2,3}? */
>>   static void mpam_resctrl_pick_caches(void)
>>   {
>> @@ -340,9 +455,62 @@ static void mpam_resctrl_pick_caches(void)
>>       }
>>   }
>>   +static void mpam_resctrl_pick_mba(void)
>> +{
>> +    struct mpam_class *class, *candidate_class = NULL;
>> +    struct mpam_resctrl_res *res;
>> +
>> +    lockdep_assert_cpus_held();
>> +
>> +    guard(srcu)(&mpam_srcu);
>> +    list_for_each_entry_srcu(class, &mpam_classes, classes_list,
>> +                 srcu_read_lock_held(&mpam_srcu)) {
>> +        struct mpam_props *cprops = &class->props;
>> +
>> +        if (class->level < 3) {
>> +            pr_debug("class %u is before L3\n", class->level);
>> +            continue;
>> +        }
>> +
>> +        if (!class_has_usable_mba(cprops)) {
>> +            pr_debug("class %u has no bandwidth control\n",
>> +                 class->level);
>> +            continue;
>> +        }
>> +
>> +        if (!cpumask_equal(&class->affinity, cpu_possible_mask)) {
>> +            pr_debug("class %u has missing CPUs\n", class->level);
>> +            continue;
>> +        }
>> +
>> +        if (!topology_matches_l3(class)) {
>> +            pr_debug("class %u topology doesn't match L3\n",
>> +                 class->level);
>> +            continue;
>> +        }
>> +
>> +        /*
>> +         * mba_sc reads the mbm_local counter, and waggles the MBA
>> +         * controls. mbm_local is implicitly part of the L3, pick a
>> +         * resource to be MBA that as close as possible to the L3.
>> +         */
>> +        if (!candidate_class || class->level < candidate_class->level)
>> +            candidate_class = class;
>> +    }
>> +
>> +    if (candidate_class) {
>> +        pr_debug("selected class %u to back MBA\n",
>> +             candidate_class->level);
>> +        res = &mpam_resctrl_controls[RDT_RESOURCE_MBA];
>> +        res->class = candidate_class;
>> +        exposed_alloc_capable = true;
>> +    }
>> +}
>> +
>>   static int mpam_resctrl_control_init(struct mpam_resctrl_res *res)
>>   {
>>       struct mpam_class *class = res->class;
>> +    struct mpam_props *cprops = &class->props;
>>       struct rdt_resource *r = &res->resctrl_res;
>>         switch (r->rid) {
>> @@ -372,6 +540,19 @@ static int mpam_resctrl_control_init(struct
>> mpam_resctrl_res *res)
>>            */
>>           r->cache.shareable_bits = resctrl_get_default_ctrl(r);
>>           break;
>> +    case RDT_RESOURCE_MBA:
>> +        r->alloc_capable = true;
>> +        r->schema_fmt = RESCTRL_SCHEMA_RANGE;
>> +        r->ctrl_scope = RESCTRL_L3_CACHE;
>> +
>> +        r->membw.delay_linear = true;
>> +        r->membw.throttle_mode = THREAD_THROTTLE_UNDEFINED;
>> +        r->membw.min_bw = get_mba_min(cprops);
>> +        r->membw.max_bw = MAX_MBA_BW;
>> +        r->membw.bw_gran = get_mba_granularity(cprops);
>> +
>> +        r->name = "MB";
>> +        break;
>>       default:
>>           return -EINVAL;
>>       }
>> @@ -386,7 +567,17 @@ static int mpam_resctrl_pick_domain_id(int cpu,
>> struct mpam_component *comp)
>>       if (class->type == MPAM_CLASS_CACHE)
>>           return comp->comp_id;
>>   -    /* TODO: repaint domain ids to match the L3 domain ids */
>> +    if (topology_matches_l3(class)) {
>> +        /* Use the corresponding L3 component ID as the domain ID */
>> +        int id = get_cpu_cacheinfo_id(cpu, 3);
>> +
>> +        /* Implies topology_matches_l3() made a mistake */
>> +        if (WARN_ON_ONCE(id == -1))
>> +            return comp->comp_id;
>> +
>> +        return id;
>> +    }
>> +
>>       /* Otherwise, expose the ID used by the firmware table code. */
>>       return comp->comp_id;
>>   }
>> @@ -426,6 +617,12 @@ u32 resctrl_arch_get_config(struct rdt_resource
>> *r, struct rdt_ctrl_domain *d,
>>       case RDT_RESOURCE_L3:
>>           configured_by = mpam_feat_cpor_part;
>>           break;
>> +    case RDT_RESOURCE_MBA:
>> +        if (mpam_has_feature(mpam_feat_mbw_max, cprops)) {
>> +            configured_by = mpam_feat_mbw_max;
>> +            break;
>> +        }
>> +        fallthrough;
>>       default:
>>           return resctrl_get_default_ctrl(r);
>>       }
>> @@ -437,6 +634,8 @@ u32 resctrl_arch_get_config(struct rdt_resource
>> *r, struct rdt_ctrl_domain *d,
>>       switch (configured_by) {
>>       case mpam_feat_cpor_part:
>>           return cfg->cpbm;
>> +    case mpam_feat_mbw_max:
>> +        return mbw_max_to_percent(cfg->mbw_max, cprops);
>>       default:
>>           return resctrl_get_default_ctrl(r);
>>       }
>> @@ -481,6 +680,13 @@ int resctrl_arch_update_one(struct rdt_resource
>> *r, struct rdt_ctrl_domain *d,
>>           cfg.cpbm = cfg_val;
>>           mpam_set_feature(mpam_feat_cpor_part, &cfg);
>>           break;
>> +    case RDT_RESOURCE_MBA:
>> +        if (mpam_has_feature(mpam_feat_mbw_max, cprops)) {
>> +            cfg.mbw_max = percent_to_mbw_max(cfg_val, cprops);
>> +            mpam_set_feature(mpam_feat_mbw_max, &cfg);
>> +            break;
>> +        }
>> +        fallthrough;
>>       default:
>>           return -EINVAL;
>>       }
>> @@ -764,6 +970,7 @@ int mpam_resctrl_setup(void)
>>         /* Find some classes to use for controls */
>>       mpam_resctrl_pick_caches();
>> +    mpam_resctrl_pick_mba();
>>         /* Initialise the resctrl structures from the classes */
>>       for_each_mpam_resctrl_control(res, rid) {
> 
> Thanks,
> Gavin
> 

Thanks,

Ben


