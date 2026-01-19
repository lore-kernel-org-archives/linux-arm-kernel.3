Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51BD9CCF2F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 11:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tyj6uNMCFoW5fF4G2dbHO9MqaihjqT5fM5v3O8Ea3wY=; b=bN7/zH5TjrkrbDxU6nrZ482Sec
	RDxPVIJTLO1fbM1Q5r7qi6Oyv63PAhXuv81mWZmXRLvGcQ2h5o8iOGDJGVcj4nJBtn2SQonZtenf6
	01MX99l5Ifd7QJx2YtHkTn0IfjXjOPEM6DeHT9X24GMU+v/dMJhkHUnCBHuNteN/1UVsQwB0DZtYA
	5Ud7ycTXYLh3UZfVkBVklnqQi+n6pFMqGerqKWWiuIdo9LepwLxoQt5I900m/FFD4TYWnlPnbcI8Y
	krjb9AbbO7nCOUbqC9jELjqzIwipbnue0UY2Nqmx6ejZUH3jfYR5rAjzMtdnv9BshgKp7/SM+vkDD
	9zZFGAOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhnpL-00000001vFf-1D4i;
	Mon, 19 Jan 2026 11:53:47 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhnpI-00000001vEv-0inO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 11:53:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768823623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tyj6uNMCFoW5fF4G2dbHO9MqaihjqT5fM5v3O8Ea3wY=;
	b=Dw4VRL//e1Dcp5GUPy+Nxe6bd2yP5xFS4fVc74YGnsDHxeZ5VVw9jKBola24UlEmyFYM4o
	X+E9HLR6Yg8lS1joSocDlcTVcAG8fXpNHT2u5wJ+aqlruLK+jgnIXXoSqU36KKeGu+3k9D
	13ZANCgh1i4vW1ujX5+gNBEdPJjPNOI=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-359-jW9FUHuRN_qvGMVpS_8pPg-1; Mon, 19 Jan 2026 06:53:41 -0500
X-MC-Unique: jW9FUHuRN_qvGMVpS_8pPg-1
X-Mimecast-MFC-AGG-ID: jW9FUHuRN_qvGMVpS_8pPg_1768823620
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29f2381ea85so95203415ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 03:53:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768823620; x=1769428420;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tyj6uNMCFoW5fF4G2dbHO9MqaihjqT5fM5v3O8Ea3wY=;
        b=IGpfFcl6xqhI7FZqS9ubRne/8BeS5ulrZomaOCJ+/Xjl+RyKL0sBdzlvOZmFmfyEOI
         mf/m/PA3gOfdSx5wIIZekxXT4ToQatrTANAz2gZUQYguVgBuUJ1+s9r0DTy5yo1G6q1c
         2y+ZNWrIlN6OD+YYCuVBdBjJ40Acs9cLF2c2spA6oauRDTzSTkJqpGg6cH53u/fWr+ub
         THVkGR6OCw6uiqyC3c9kzD9vms4yWqhpKYi+OR0eEuI6Mo3YG1MHfsZ14eI3EimkLy6m
         VzoHC/+No1cjXIwCI9RFzbOHPNA+9dlJ+vSj6iQNAlZSoMsAFcW4RRyb84yH8gZuTUEu
         5Flw==
X-Forwarded-Encrypted: i=1; AJvYcCX3SvoluUR05VbmA4VmKZALIcwHYrmq+Yf3n0/W/JQQY1amk12MjF1CG67A5SOUcvj5KxkZGhIM0TQW65uQB8mt@lists.infradead.org
X-Gm-Message-State: AOJu0YydLg2iPJykjMLHbkRrlHo2hRcQ1B5xlgSHY3d5EqxJi/cwu683
	YEJ21+yRsWw2aDr6Z/2+vXDHie2uj1ko8xaYM+jhTCedouOAsx8WpS0o2oqehuV3XFg4946Lqb3
	f7KK0Sp+Wu7xrJOczg9OZ7IP4xi7uJlw+DVzOx0eYrmQO8iuvdeqJaNcSRXjeBb45xx0E8Y6xVm
	rc
X-Gm-Gg: AZuq6aLdCBgwzUJxPEobcNVnHkynViuA4B8AndHiy0tQkllpHUTicmG0u+VG6QmoaW+
	OFvwJkaQJSyhk/NgYSg71/pdQEXS5vgunZrbFBINhO28tV2TSBOOx1sAx2GTU5fdS3lxk927IiA
	lLtOkzzQn6y3c0oLiDGi3cQiXL66ljPVJ6ldiYgTCzfs2HqbouTgMqonTOfZ+FiF2MsYYmjqoPk
	oj/DWMnVOlmg1tnNgziptOFUW+kVv/OYmbfFlD32ywGwNMyLHIJ19V6TXYbgJuhEQNnsHDVzVOq
	FVZPvV8vlAMwbHfvFef5qvMChO/jEw/Xl/hsQ9lhnbTp0hwM4ta1fcZHyymKEG7PUCYGh+sB10Q
	Ess2EVsqours=
X-Received: by 2002:a17:903:1104:b0:29e:9c82:a920 with SMTP id d9443c01a7336-2a7188589bcmr104434545ad.6.1768823620180;
        Mon, 19 Jan 2026 03:53:40 -0800 (PST)
X-Received: by 2002:a17:903:1104:b0:29e:9c82:a920 with SMTP id d9443c01a7336-2a7188589bcmr104434415ad.6.1768823619707;
        Mon, 19 Jan 2026 03:53:39 -0800 (PST)
Received: from [10.72.112.128] ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190ce2ebsm94819245ad.32.2026.01.19.03.53.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 03:53:38 -0800 (PST)
Message-ID: <36e12dad-833f-4498-a6da-f4fc2ca081d3@redhat.com>
Date: Mon, 19 Jan 2026 19:53:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 27/47] arm_mpam: resctrl: Add support for 'MB' resource
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
 Zeng Heng <zengheng4@huawei.com>
References: <20260112165914.4086692-1-ben.horgan@arm.com>
 <20260112165914.4086692-28-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260112165914.4086692-28-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: L652wxbLPENEs8jQYkIjPKSekPyXcWxmpHhVDVBVw2c_1768823620
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_035344_389574_ECB3C697 
X-CRM114-Status: GOOD (  43.45  )
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

On 1/13/26 12:58 AM, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> resctrl supports 'MB', as a percentage throttling of traffic somewhere
> after the L3. This is the control that mba_sc uses, so ideally the class
> chosen should be as close as possible to the counters used for mba_local.
> 
> MB's percentage control should be backed either with the fixed point
> fraction MBW_MAX or bandwidth portion bitmaps. The bandwidth portion
> bitmaps is not used as its tricky to pick which bits to use to avoid
> contention, and may be possible to expose this as something other than a
> percentage in the future.
> 
> CC: Zeng Heng <zengheng4@huawei.com>
> Co-developed-by: Dave Martin <Dave.Martin@arm.com>
> Signed-off-by: Dave Martin <Dave.Martin@arm.com>
> Signed-off-by: James Morse <james.morse@arm.com>>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since v2:
> Code flow change
> Commit message 'or'
> ---
>   drivers/resctrl/mpam_resctrl.c | 209 ++++++++++++++++++++++++++++++++-
>   1 file changed, 208 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 3ca977527698..7402bf4293b6 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -248,6 +248,33 @@ static bool cache_has_usable_cpor(struct mpam_class *class)
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
> @@ -298,6 +325,94 @@ static u16 percent_to_mbw_max(u8 pc, struct mpam_props *cprops)
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
> + * L3. We play fast and loose with this, mapping counters on other
> + * classes - provided the CPU->domain mapping is the same kind of shape.
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
> +	cpumask_var_t __free(free_cpumask_var) tmp_cpumask;
> +

A warning reported by checkpatch.pl like below.

WARNING: Missing a blank line after declarations
#117: FILE: drivers/resctrl/mpam_resctrl.c:375:
+	struct mpam_component *victim_iter;
+	cpumask_var_t __free(free_cpumask_var) tmp_cpumask;

Besides, it'd better to initialize @tmp_cpumask:

cpumask_var_t __free(free_cpumask_var) tmp_cpumask = CPUMASK_VAR_NULL;

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
> +		cpu = cpumask_any(&victim_iter->affinity);
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
>   /* Test whether we can export MPAM_CLASS_CACHE:{2,3}? */
>   static void mpam_resctrl_pick_caches(void)
>   {
> @@ -340,9 +455,62 @@ static void mpam_resctrl_pick_caches(void)
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
> +		if (class->level < 3) {
> +			pr_debug("class %u is before L3\n", class->level);
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
> +		/*
> +		 * mba_sc reads the mbm_local counter, and waggles the MBA
> +		 * controls. mbm_local is implicitly part of the L3, pick a
> +		 * resource to be MBA that as close as possible to the L3.
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
> +		exposed_alloc_capable = true;
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
> @@ -372,6 +540,19 @@ static int mpam_resctrl_control_init(struct mpam_resctrl_res *res)
>   		 */
>   		r->cache.shareable_bits = resctrl_get_default_ctrl(r);
>   		break;
> +	case RDT_RESOURCE_MBA:
> +		r->alloc_capable = true;
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
> +		break;
>   	default:
>   		return -EINVAL;
>   	}
> @@ -386,7 +567,17 @@ static int mpam_resctrl_pick_domain_id(int cpu, struct mpam_component *comp)
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
> @@ -426,6 +617,12 @@ u32 resctrl_arch_get_config(struct rdt_resource *r, struct rdt_ctrl_domain *d,
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
> @@ -437,6 +634,8 @@ u32 resctrl_arch_get_config(struct rdt_resource *r, struct rdt_ctrl_domain *d,
>   	switch (configured_by) {
>   	case mpam_feat_cpor_part:
>   		return cfg->cpbm;
> +	case mpam_feat_mbw_max:
> +		return mbw_max_to_percent(cfg->mbw_max, cprops);
>   	default:
>   		return resctrl_get_default_ctrl(r);
>   	}
> @@ -481,6 +680,13 @@ int resctrl_arch_update_one(struct rdt_resource *r, struct rdt_ctrl_domain *d,
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
> @@ -764,6 +970,7 @@ int mpam_resctrl_setup(void)
>   
>   	/* Find some classes to use for controls */
>   	mpam_resctrl_pick_caches();
> +	mpam_resctrl_pick_mba();
>   
>   	/* Initialise the resctrl structures from the classes */
>   	for_each_mpam_resctrl_control(res, rid) {

Thanks,
Gavin


