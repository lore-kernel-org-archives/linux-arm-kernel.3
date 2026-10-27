Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF87606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 01:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I0p9HNMu;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=TDudzL6u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+bPn0ocWqbaD9RySURiCm2ZhdZQ5PclNXcJ9a3ESUkU=; b=I0p9HNMuvabVSP
	8a3P2XVkYsd1LrPB2WrF7jf9mS32C4n3EZXCEYfOtSsuxT1mRhlJGIE+WVYqdo/6DXaOaa0iCGPNm
	jyqFVbEDBRrtwfhl01FxHjRWBu3QvPF6BLljgHDHhstnb1x34slyL5j67k2WjmDErX4ZeMRBeghYM
	Fnt9OaFR3qhJNiti+pB89kguCvCw4YUyHF1r96oxy8bebO8ckU6UFts+0VmxiNiCym3GBcsSB7q4L
	Uq6oXlb0MtKQ1M30s6+COm+9SR9UpJeV+MI8jr4+RkIC1caGrmzHwoyw3MVrzlBWbJeto21O+tTcs
	9CNIsRaz1g44Ia/rg/ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLVjv-00000003a4k-0q0H;
	Tue, 27 Oct 2026 01:12:35 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLVjr-00000003a4F-3Ioo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 01:12:34 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=+bPn0ocWqbaD9RySURiCm2ZhdZQ5PclNXcJ9a3ESUkU=;
	b=TDudzL6uUHYc2/3JUMSVAxqWxtSliJQJEh8JXqNqlED9NUEglJYPOYjEhRzKtPnSSMG5nKHBn
	P9IrZvQ1dK0Vq8MpmmciRADKm+dl4+fc2gEn9S9fG0EY1uWt8B0z7EfgcSxQeZR5Gs9Y/9p3jX9
	0yz0hHYusoOWfLh5tovbFZM=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4jDCC41DP3zRhQq;
	Tue, 27 Oct 2026 09:12:16 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id E0E4F4058E;
	Tue, 27 Oct 2026 09:12:23 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 27 Oct
 2026 09:12:23 +0800
Message-ID: <1a4baea3-9741-4144-b12f-d4d85ad5bc31@huawei.com>
Date: Tue, 27 Oct 2026 09:12:22 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 05/10] arm_mpam: resctrl: Give the monitoring
 domain its own structure
To: Reinette Chatre <reinette.chatre@intel.com>, <ben.horgan@arm.com>,
	<james.morse@arm.com>, <Dave.Martin@arm.com>, <fenghuay@nvidia.com>
CC: <tony.luck@intel.com>, <yu.c.chen@intel.com>, <babu.moger@amd.com>,
	<fustini@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <patches@lists.linux.dev>
References: <cover.1792443633.git.reinette.chatre@intel.com>
 <2238eab97cc66852d0d0d1a5c6ff191c03ce9e0d.1792443633.git.reinette.chatre@intel.com>
 <52fdd67b-49b6-44b6-8eaa-17b29fd92947@huawei.com>
 <f288691b-6064-456e-89fc-2c4b2e6712b6@intel.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <f288691b-6064-456e-89fc-2c4b2e6712b6@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_181232_505748_BA2192A4 
X-CRM114-Status: GOOD (  26.82  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



在 2026/10/27 0:55, Reinette Chatre 写道:
> Hi Jinjie,
> 
> On 10/26/26 5:14 AM, Jinjie Ruan wrote:
>> 在 2026/10/20 6:07, Reinette Chatre 写道:
> 
> ...
> 
>>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
>>> index 246560247a28..ce5519635c51 100644
>>> --- a/drivers/resctrl/mpam_resctrl.c
>>> +++ b/drivers/resctrl/mpam_resctrl.c
> 
> ...
> 
>>> @@ -542,7 +542,7 @@ int resctrl_arch_cntr_read(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
>>>  			   enum resctrl_event_id eventid, u64 *val)
>>>  {
>>>  	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[eventid];
>>> -	struct mpam_resctrl_dom *l3_dom;
>>> +	struct mpam_resctrl_mon_dom *l3_dom;
>>>  	struct mpam_component *mon_comp;
>>>  
>>>  	if (!mpam_is_enabled())
>>> @@ -551,7 +551,7 @@ int resctrl_arch_cntr_read(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
>>>  	if (eventid == QOS_L3_OCCUP_EVENT_ID || !mon->class)
>>>  		return -EINVAL;
>>>  
>>> -	l3_dom = container_of(d, struct mpam_resctrl_dom, resctrl_mon_dom);
>>> +	l3_dom = container_of(d, struct mpam_resctrl_mon_dom, resctrl_mon_dom);
>>>  	mon_comp = l3_dom->mon_comp[eventid];
>>
>> Maybe following code could be extracted into a helper
>>
>> 553 >-------if (!mpam_is_enabled())
>>  554 >------->-------return -EINVAL;
>>  555
>>  556 >-------if (eventid == QOS_L3_OCCUP_EVENT_ID || !mon->class)
>>  557 >------->-------return -EINVAL;
>>  558
>>  559 >-------l3_dom = container_of(d, struct mpam_resctrl_dom,
>> resctrl_mon_dom);
>>  560 >-------mon_comp = l3_dom->mon_comp[eventid];
>>
> 
> Below shows an example of such helper created (for convenience) on top of this
> series. Only compile tested. Is this what you had in mind? If it looks ok I will
> rebase to the beginning of this series as a new preparatory patch since it refactors
> code adjacent to this series.

Right. It looks fine to me. resctrl_arch_rmid_read() seems a little
different.

> 
> ---8<---
>  drivers/resctrl/mpam_resctrl.c | 62 ++++++++++++++++++++++------------
>  1 file changed, 41 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 61fbde9c0960..d75954f8a0ad 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -7,6 +7,7 @@
>  #include <linux/cacheinfo.h>
>  #include <linux/cpu.h>
>  #include <linux/cpumask.h>
> +#include <linux/err.h>
>  #include <linux/errno.h>
>  #include <linux/limits.h>
>  #include <linux/list.h>
> @@ -536,26 +537,51 @@ int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_domain_hdr *hdr,
>  				 closid, rmid, val);
>  }
>  
> -/* MBWU counters when in ABMC mode */
> -int resctrl_arch_cntr_read(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
> -			   u32 closid, u32 rmid, int mon_idx,
> -			   enum resctrl_event_id eventid, u64 *val)
> +/**
> + * find_mbwu_mon_comp() - Find the component counting @eventid in a domain
> + * @d:		The monitoring domain to search.
> + * @eventid:	The event to find the counting component for.
> + *
> + * The counters reached through this component are the monitors MPAM
> + * pre-allocated for bandwidth counting. Cache occupancy is not counted by
> + * those monitors, it is read on demand via resctrl_arch_rmid_read().
> + *
> + * Return: the component counting @eventid in @d, or an error pointer when
> + * MPAM is disabled, when @eventid is cache occupancy, or when no class was
> + * picked to count @eventid.
> + */
> +static struct mpam_component *find_mbwu_mon_comp(struct rdt_l3_mon_domain *d,
> +						 enum resctrl_event_id eventid)
>  {
> -	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[eventid];
>  	struct mpam_resctrl_mon_dom *l3_dom;
> -	struct mpam_component *mon_comp;
> +	struct mpam_resctrl_mon *mon;
>  
>  	if (!mpam_is_enabled())
> -		return -EINVAL;
> +		return ERR_PTR(-EINVAL);
>  
> +	mon = &mpam_resctrl_counters[eventid];
>  	if (eventid == QOS_L3_OCCUP_EVENT_ID || !mon->class)
> -		return -EINVAL;
> +		return ERR_PTR(-EINVAL);
>  
>  	l3_dom = container_of(d, struct mpam_resctrl_mon_dom, resctrl_mon_dom);
> -	mon_comp = l3_dom->mon_comp[eventid];
>  
> -	return read_mon_cdp_safe(mon, mon_comp, mpam_feat_msmon_mbwu,
> -				 USE_PRE_ALLOCATED, closid, rmid, val);
> +	return l3_dom->mon_comp[eventid];
> +}
> +
> +/* MBWU counters when in ABMC mode */
> +int resctrl_arch_cntr_read(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
> +			   u32 closid, u32 rmid, int mon_idx,
> +			   enum resctrl_event_id eventid, u64 *val)
> +{
> +	struct mpam_component *mon_comp;
> +
> +	mon_comp = find_mbwu_mon_comp(d, eventid);
> +	if (IS_ERR(mon_comp))
> +		return PTR_ERR(mon_comp);
> +
> +	return read_mon_cdp_safe(&mpam_resctrl_counters[eventid], mon_comp,
> +				 mpam_feat_msmon_mbwu, USE_PRE_ALLOCATED,
> +				 closid, rmid, val);
>  }
>  
>  static void __reset_mon(struct mpam_resctrl_mon *mon, struct mpam_component *mon_comp,
> @@ -598,20 +624,14 @@ void resctrl_arch_reset_cntr(struct rdt_resource *r, struct rdt_l3_mon_domain *d
>  			     u32 closid, u32 rmid, int cntr_id,
>  			     enum resctrl_event_id eventid)
>  {
> -	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[eventid];
> -	struct mpam_resctrl_mon_dom *l3_dom;
>  	struct mpam_component *mon_comp;
>  
> -	if (!mpam_is_enabled())
> -		return;
> -
> -	if (eventid == QOS_L3_OCCUP_EVENT_ID || !mon->class)
> +	mon_comp = find_mbwu_mon_comp(d, eventid);
> +	if (IS_ERR(mon_comp))
>  		return;
>  
> -	l3_dom = container_of(d, struct mpam_resctrl_mon_dom, resctrl_mon_dom);
> -	mon_comp = l3_dom->mon_comp[eventid];
> -
> -	reset_mon_cdp_safe(mon, mon_comp, USE_PRE_ALLOCATED, closid, rmid);
> +	reset_mon_cdp_safe(&mpam_resctrl_counters[eventid], mon_comp,
> +			   USE_PRE_ALLOCATED, closid, rmid);
>  }
>  
>  /*
> ---8<--- 
> 
>>> @@ -1770,11 +1723,97 @@ mpam_resctrl_get_domain_from_cpu(int cpu, struct mpam_resctrl_res *res)
>>>  			return dom;
>>>  	}
>>>  
>>> -	if (r->rid != RDT_RESOURCE_L3)
>>> -		return NULL;
>>> +	return NULL;
>>
>> LGTM
>> Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
>>
> Thank you very much.
> 
> Reinette

-- 
Best regards,
Jinjie


