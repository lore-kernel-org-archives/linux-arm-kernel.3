Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE615C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 10:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vgKQijptlsuzxuAX5DklXoNvmIiuH/6P/5aISzNMB0c=; b=eRP8pU3lDmmc2GfDL1AbpmEBgI
	XWeTy4TaW7BZrmicH7cjA2JUApu3P8GoQhbGIWRIqGOg3Xtm+f+fgJVQG6nRtrbBELuMwJZL5PQlP
	fAOqK6P/LJUzgmD+8Ea1DfeiGcBOgVxdHHFwwx2v/l1pPNQmxJHLpv+hR9XBQGnem4IL2m3r167OR
	/jY5UGOgYKg21D3HXErzpcwEdxNGgyI8Ra08CZCYZVLKIMvo9enM1AkTV4L68DznwrA8ukWMkGkCm
	6yRCN5bk+XdvOOCVk7iZocSxSzdQ29dDV4CvcbBOUrHsOmW+vyhGA4gFw2DiMOhhrnAxFAcQSp68N
	+WaWncqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjwlN-0000000ERE4-2NTh;
	Wed, 15 Jul 2026 10:22:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjwlK-0000000ERDJ-3qlH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 10:22:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784110965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vgKQijptlsuzxuAX5DklXoNvmIiuH/6P/5aISzNMB0c=;
	b=QTNOwnW1WJsDdqnq6ZPn7FaYPtR4IUbGq/WiIMnXwqW9A1N8ijB9EX3eiAbWq5J+a7zCtI
	1Uh8aIXgb/NpkcIzX6XH8/GHBgsqicjjJloC2qslQzchNt2CP87EWi+qXGk8JpLjRZ4ome
	HCT2/fgPYOXGPjjD6jpFEM5xOz8t++A=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-620-PzMyCTsKO5mdP7OsJa3IXg-1; Wed, 15 Jul 2026 06:22:43 -0400
X-MC-Unique: PzMyCTsKO5mdP7OsJa3IXg-1
X-Mimecast-MFC-AGG-ID: PzMyCTsKO5mdP7OsJa3IXg_1784110963
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8484ba00601so2691838b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 03:22:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784110963; x=1784715763;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vgKQijptlsuzxuAX5DklXoNvmIiuH/6P/5aISzNMB0c=;
        b=MmHslNLF3gOmzEiQm3rhmr8+hu/JGQlaS20q0lmM1FjEwC60a3LQimV5edTy7qVpz1
         khB2t/cpzHXWGIH3GPg/D09QFkAVpR4h6hM6Obfp1b4DDrwCtwn6cMjobJQ+ktutcQtE
         J+yy16O+zky67DyJD0AdPLSmIweVLdWThgISlkA0RC+8PQw8UzXHfhZCu9CUqmJcPkIN
         bt5qjqqFdrz6cGR8dXPwFzk44Yx4/woSxvesUQRbRN8NVJaFTBsJNF/Gdn38DAIWWIT4
         SRbK4hvEsdluZCAiGlBqaMhtGLigw07aEQW3cQbQTaVtQSqn+Ocrdik4j6/rHeifocSs
         6ajw==
X-Forwarded-Encrypted: i=1; AHgh+RoEEdjar8gPv9x7DFOCsjZWVsBmoa/okO5uCnWgUHuIrBUuWGeM7sRCj2kTUHANLJjDpGR0QmMciR6dfZtrvKYZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxxgWkdDs8oRTKdgnKfQAZsWJqfDj7GhCSptoqudTq4cK3sj7Ek
	a2fmLxrZls0n5AU2ieaC+QKxncs15KhO2kaRy5vWxR0rwFagTIaE+QoJLY4GesAjdDqn4WrYtfn
	O+cABDEWF/aq8oie4JRMnFBd8BbEHs91zK7/YOunMlREWfFezXKTLZOoKB91pKRGcSXSG5GlG7I
	qt
X-Gm-Gg: AfdE7cm5fBy7b6uMZktNVI/IdZnpP7ExKLOpbPBiaNIfhjcxtUvIDzWpRkG7hmF5Uyq
	Eu+20dHIGbAMpHWCvq0AvYTEDUGK3psp9u+k47xU1luRDaCZMaVALrtmYZA6AChMdKgbzhTTdT7
	Msmi/S4LK7tiNRPNBEul8NRsQfPhIQJmULrnN8Pc7e32fB3MZH2ORShLkgHpuie6jyQQWYRUUad
	P92oZHWanaUlOY6GKF4sqKPBUHYzwXc43d9uXfiy3KUzKf0NBZCgTu+E+LZeUq+4IeKez2dCIcu
	vHSJzmKgyZFKAweyVd6NKCmdhKl3kTUeRFRPdNuMw9M6z0ZozwHAUa9y7MmDnSsGBN7gR4zldCo
	hPL+OpH9duqgiybibVsfxz6vZomB1fIgQKriv8Z8UbaWNDC/sie7jhw==
X-Received: by 2002:a05:6a00:3698:b0:845:a435:a2eb with SMTP id d2e1a72fcca58-848897166aamr15053721b3a.31.1784110962689;
        Wed, 15 Jul 2026 03:22:42 -0700 (PDT)
X-Received: by 2002:a05:6a00:3698:b0:845:a435:a2eb with SMTP id d2e1a72fcca58-848897166aamr15053690b3a.31.1784110962194;
        Wed, 15 Jul 2026 03:22:42 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f818eaesm2925654b3a.58.2026.07.15.03.22.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 03:22:39 -0700 (PDT)
Message-ID: <ff2b7718-903c-431b-b849-bc4cd0a522dd@redhat.com>
Date: Wed, 15 Jul 2026 20:22:26 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] arm_mpam: resctrl: Pre-allocate assignable
 monitors
To: Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, james.morse@arm.com, jic23@kernel.org,
 kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, zengheng4@huawei.com,
 x86@kernel.org, leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
 usama.arif@linux.dev, kernel-team@meta.com,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20260707162440.12132-1-ben.horgan@arm.com>
 <20260707162440.12132-3-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260707162440.12132-3-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UFoAHOnsgioycbyeyOjs8T9ryuQhtaP5U6SFdboeEvM_1784110963
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_032247_194825_83397392 
X-CRM114-Status: GOOD (  41.83  )
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

On 7/8/26 2:24 AM, Ben Horgan wrote:
> MPAM is able to emulate ABMC, i.e. mbm_event mode, by making memory
> bandwidth monitors assignable. Rather than supporting the 'default'
> mbm_assign_mode always use 'mbm_event' mode even if there are sufficient
> memory bandwidth monitors. The per monitor event configuration is only
> provided by resctrl when in 'mbm_event' mode and so only allowing
> 'mbm_event' mode will make it easier to support per-monitor event
> configuration for MPAM. For the moment, the only event supported is
> mbm_total_event with no bandwidth type configuration. The 'mbm_assign_mode'
> file will still show 'default' when there is no support for memory
> bandwidth monitoring.
> 
> The monitors need to be allocated from the driver, and mapped to whichever
> control/monitor group resctrl wants to use them with.
> 
> Add a second array to hold the monitor values indexed by resctrl's cntr_id.
> 
> When CDP is in use, two monitors are needed so the available number of
> counters halves. Platforms with one monitor will have zero monitors when
> CDP is in use.
> 
> Co-developed-by: James Morse <james.morse@arm.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
> ---
> Changes since rfc v1:
> abmc enabled even if enough counters
> Helpers from dropped free running commits
> carry on with zero counters if using cdp
> set config bits
> use kmalloc_objs
> drop tags for rework
> Configure mbm_cntr_configurable, mbm_cntr_assign_fixed
> 
> Changes since rfc v2:
> Don't set mon->assigned_counters to an error pointer
> Fix mpam_resctrl_teardown_mon()
> Remove free running check
> Separate cleanup allocations, e.g. __free(), from the rest
> Restrict scope on err in mpam_resctrl_monitor_init()
> 
> Changes since v3:
> Correct NULL check in mpam_resctrl_teardown_mon() (Shaopeng)
> variable allocation ordering in mpam_resctrl_pick_domain_id() (Shaopeng)
> Move mon.* assignments from mpam_resctrl_monitor_sync_abmc_vals()
> to mpam_resctrl_monitor_init_abmc() counters (Sashiko)
> use kvmalloc_obj() for allocations that may be big on some
> platforms (Sashiko)
> 
> Changes since v4:
> Remove l3_num_allocated_mbwu (Koba)
> indexed by idx -> indexed by resctrl's cntr_id (Fenghua)
> ---
>   drivers/resctrl/mpam_internal.h |   6 +-
>   drivers/resctrl/mpam_resctrl.c  | 143 +++++++++++++++++++++++++++++++-
>   2 files changed, 145 insertions(+), 4 deletions(-)
> 

Some nitpicks below, this looks good in either way:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index 04d1a59f02af..def0e3a65c23 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -409,7 +409,11 @@ struct mpam_resctrl_res {
>   struct mpam_resctrl_mon {
>   	struct mpam_class	*class;
>   
> -	/* per-class data that resctrl needs will live here */
> +	/* Array of allocated MBWU monitors, indexed by (closid, rmid). */
> +	int			*mbwu_idx_to_mon;
> +
> +	/* Array of assigned MBWU monitors, indexed by resctrl's cntr_id. */
> +	int			*assigned_counters;
>   };
>   
>   static inline int mpam_alloc_csu_mon(struct mpam_class *class)
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 0fce9703b869..91b589b110a2 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -140,7 +140,7 @@ int resctrl_arch_cntr_read(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
>   
>   bool resctrl_arch_mbm_cntr_assign_enabled(struct rdt_resource *r)
>   {
> -	return false;
> +	return (r == &mpam_resctrl_controls[RDT_RESOURCE_L3].resctrl_res);
>   }
>   
>   int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable)
> @@ -185,6 +185,26 @@ static void resctrl_reset_task_closids(void)
>   	read_unlock(&tasklist_lock);
>   }
>   
> +static void mpam_resctrl_monitor_sync_abmc_vals(struct rdt_resource *l3)
> +{
> +	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[QOS_L3_MBM_TOTAL_EVENT_ID];
> +
> +	if (!mon->class)
> +		return;
> +
> +	if (!mon->assigned_counters)
> +		return;
> +
> +	l3->mon.num_mbm_cntrs = mon->class->props.num_mbwu_mon;
> +	if (cdp_enabled)
> +		l3->mon.num_mbm_cntrs /= 2;
> +
> +	/*
> +	 * Continue as normal even if enabling cdp causes there to be
> +	 * zero counters. This avoids giving resctrl mixed messages.
> +	 */
> +}
> +
>   int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
>   {
>   	u32 partid_i = RESCTRL_RESERVED_CLOSID, partid_d = RESCTRL_RESERVED_CLOSID;
> @@ -244,6 +264,7 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
>   	WRITE_ONCE(arm64_mpam_global_default, mpam_get_regval(current));
>   
>   	resctrl_reset_task_closids();
> +	mpam_resctrl_monitor_sync_abmc_vals(l3);
>   
>   	for_each_possible_cpu(cpu)
>   		mpam_set_cpu_defaults(cpu, partid_d, partid_i, 0, 0);
> @@ -613,6 +634,9 @@ static bool class_has_usable_mbwu(struct mpam_class *class)
>   	if (!mpam_has_feature(mpam_feat_msmon_mbwu, cprops))
>   		return false;
>   
> +	if (!cprops->num_mbwu_mon)
> +		return false;
> +
>   	return true;
>   }
>   
> @@ -935,6 +959,50 @@ static void mpam_resctrl_pick_mba(void)
>   	}
>   }
>   
> +static void __free_mbwu_mon(struct mpam_class *class, int *array,
> +			    u16 num_mbwu_mon)
> +{
> +	for (int i = 0; i < num_mbwu_mon; i++) {
> +		if (array[i] < 0)
> +			continue;
> +
> +		mpam_free_mbwu_mon(class, array[i]);
> +		array[i] = ~0;

s/~0/-1. In long run, we may need a macro for this:

#define MPAM_MBWU_MON_INVALID_ID     (-1)

> +	}
> +}
> +
> +static int __alloc_mbwu_mon(struct mpam_class *class, int *array,
> +			    u16 num_mbwu_mon)
> +{
> +	for (int i = 0; i < num_mbwu_mon; i++) {
> +		int mbwu_mon = mpam_alloc_mbwu_mon(class);
> +
> +		if (mbwu_mon < 0) {
> +			__free_mbwu_mon(class, array, num_mbwu_mon);
> +			return mbwu_mon;
> +		}
> +		array[i] = mbwu_mon;
> +	}
> +
> +	return 0;
> +}
> +
> +static int *__alloc_mbwu_array(struct mpam_class *class, u16 num_mbwu_mon)
> +{
> +	int err;
> +
> +	int *array __free(kvfree) = kvmalloc_objs(*array, num_mbwu_mon);
> +	if (!array)
> +		return ERR_PTR(-ENOMEM);
> +
> +	memset(array, -1, num_mbwu_mon * sizeof(*array));

This looks a bit subtle. array[i] is split into 4-bytes and each of them
is filled with -1 (0xff), the combined output is correct that array[i] == -1.

> +
> +	err = __alloc_mbwu_mon(class, array, num_mbwu_mon);
> +	if (err)
> +		return ERR_PTR(err);
> +	return_ptr(array);
> +}
> +
>   static void counter_update_class(enum resctrl_event_id evt_id,
>   				 struct mpam_class *class)
>   {
> @@ -1091,6 +1159,43 @@ static int mpam_resctrl_pick_domain_id(int cpu, struct mpam_component *comp)
>   	return comp->comp_id;
>   }
>   
> +/*
> + * This must run after all event counters have been picked so that any free
> + * running counters have already been allocated.
> + */
> +static int mpam_resctrl_monitor_init_abmc(struct mpam_resctrl_mon *mon)
> +{
> +	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
> +	size_t num_rmid = resctrl_arch_system_num_rmid_idx();
> +	struct rdt_resource *l3 = &res->resctrl_res;
> +	struct mpam_class *class = mon->class;
> +	u16 num_mbwu_mon;
> +	int *cntrs;
> +
> +	int *rmid_array __free(kvfree) = kvmalloc_objs(*rmid_array, num_rmid);
> +	if (!rmid_array) {
> +		pr_debug("Failed to allocate RMID array\n");
> +		return -ENOMEM;
> +	}
> +	memset(rmid_array, -1, num_rmid * sizeof(*rmid_array));
> +

Same as above.

> +	num_mbwu_mon = class->props.num_mbwu_mon;
> +	cntrs = __alloc_mbwu_array(mon->class, num_mbwu_mon);
> +	if (IS_ERR(cntrs))
> +		return PTR_ERR(cntrs);
> +	mon->assigned_counters = cntrs;
> +	mon->mbwu_idx_to_mon = no_free_ptr(rmid_array);
> +
> +	l3->mon.mbm_cntr_assignable = true;
> +	l3->mon.mbm_assign_on_mkdir = true;
> +	l3->mon.mbm_cntr_configurable = false;
> +	l3->mon.mbm_cntr_assign_fixed = true;
> +
> +	mpam_resctrl_monitor_sync_abmc_vals(l3);
> +
> +	return 0;
> +}
> +
>   static int mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
>   				     enum resctrl_event_id type)
>   {
> @@ -1135,8 +1240,21 @@ static int mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
>   	 */
>   	l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx();
>   
> -	if (resctrl_enable_mon_event(type, false, 0, NULL))
> -		l3->mon_capable = true;
> +	if (type == QOS_L3_MBM_TOTAL_EVENT_ID) {
> +		int err;
> +
> +		err = mpam_resctrl_monitor_init_abmc(mon);
> +		if (err)
> +			return err;
> +
> +		static_assert(MAX_EVT_CONFIG_BITS == 0x7f);
> +		l3->mon.mbm_cfg_mask = MAX_EVT_CONFIG_BITS;
> +	}
> +
> +	if (!resctrl_enable_mon_event(type, false, 0, NULL))
> +		return -EINVAL;

I don't see wher the memory allocated by mpam_resctrl_monitor_init_abmc() is release
on errors. We may be tolerant to small memory leakage in this case, I guess.

> +
> +	l3->mon_capable = true;
>   
>   	return 0;
>   }
> @@ -1699,6 +1817,23 @@ void mpam_resctrl_exit(void)
>   	resctrl_exit();
>   }
>   
> +static void mpam_resctrl_teardown_mon(struct mpam_resctrl_mon *mon, struct mpam_class *class)
> +{
> +	u32 num_mbwu_mon = class->props.num_mbwu_mon;
> +
> +	if (!mon->mbwu_idx_to_mon)
> +		return;
> +
> +	if (mon->assigned_counters) {
> +		__free_mbwu_mon(class, mon->assigned_counters, num_mbwu_mon);
> +		kvfree(mon->assigned_counters);
> +		mon->assigned_counters = NULL;
> +	}
> +
> +	kvfree(mon->mbwu_idx_to_mon);
> +	mon->mbwu_idx_to_mon = NULL;
> +}
> +
>   /*
>    * The driver is detaching an MSC from this class, if resctrl was using it,
>    * pull on resctrl_exit().
> @@ -1721,6 +1856,8 @@ void mpam_resctrl_teardown_class(struct mpam_class *class)
>   	for_each_mpam_resctrl_mon(mon, eventid) {
>   		if (mon->class == class) {
>   			mon->class = NULL;
> +
> +			mpam_resctrl_teardown_mon(mon, class);
>   			break;
>   		}
>   	}

Thanks,
Gavin


