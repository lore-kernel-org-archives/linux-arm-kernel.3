Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B54CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 08:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9gtqh4xOUV+/BTJfQh8l0NiLkWHwZTkE1BMphbhqj24=; b=qMsB97u0i064qEc5SIQtHs/YTZ
	y4s1jXZLoaewaefN21RNXoAmOlqbGljx4ssfWOJPZXPR5G2j2VOYCo8lOhh+N9vsO9n/6jQXq7o0A
	GedTnjl+G58kTySZJNdJsqchgbB5nFEiQ7MxYcUjkChedFolgtx+MePElvHek5eD68hAD9MMChM+P
	+t81UH7JBYx35wKx7c7KJEX5NKfRAvYz1dqfJhX3xvSMV0/SUOWWZariw+W/0hzJCaVIiG5n9cu/H
	JuE9ck8PXw7uSl3D85yjIQNw/Zvgi29ubkJtn1jDTrjzIJIA9GZv+dU6S7LDqQG96WiiLeAqYc3TC
	kXJDVdHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRnRV-00000001PrG-2OeN;
	Tue, 26 May 2026 08:47:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRnRU-00000001PqS-0CQ9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 08:47:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33A991692;
	Tue, 26 May 2026 01:47:07 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 494B33F7D8;
	Tue, 26 May 2026 01:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779785232; bh=5N7+lkiFxV7RLcXzh/0yKBJesDKuIOo8kIVz26kvfHk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ax+ATAT/7SL7Pz5JsziWD+iHXwnqmDVZLS1KIpvhzduOwyvghjvbnuAOGP3d2+ocN
	 dL6mr81fEFKe/LudHDWQj07SSDMAr6pZOpi2tkftSPlV/6sHR5LedoUXn8mPuVucey
	 AUxe06S15rx+dOH7ExIomt0LUtHlOMA+zRLGLXdc=
Message-ID: <4103d7b6-7f69-4e9a-b31c-488f54d36e66@arm.com>
Date: Tue, 26 May 2026 09:47:06 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v4 2/5] arm_mpam: resctrl: Pre-allocate assignable
 monitors
To: Koba Ko <kobak@nvidia.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, gshan@redhat.com, james.morse@arm.com,
 jic23@kernel.org, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, zengheng4@huawei.com,
 x86@kernel.org
References: <20260520212458.1797221-1-ben.horgan@arm.com>
 <20260520212458.1797221-3-ben.horgan@arm.com>
 <1aea92be-0e7c-459c-a96c-5a54cea073ff@nvidia.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <1aea92be-0e7c-459c-a96c-5a54cea073ff@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_014716_175642_78B52FB2 
X-CRM114-Status: GOOD (  18.15  )
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

Hi Koba,

On 5/26/26 03:50, Koba Ko wrote:
> 
>>
>> +/*
>> + * This must run after all event counters have been picked so that any free
>> + * running counters have already been allocated.
>> + */
>> +static int mpam_resctrl_monitor_init_abmc(struct mpam_resctrl_mon *mon)
>> +{
>> +       struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
>> +       size_t num_rmid = resctrl_arch_system_num_rmid_idx();
>> +       struct rdt_resource *l3 = &res->resctrl_res;
>> +       struct mpam_class *class = mon->class;
>> +       u16 num_mbwu_mon;
>> +       int *cntrs;
>> +
>> +       int *rmid_array __free(kvfree) = kvmalloc_objs(*rmid_array, num_rmid);
>> +       if (!rmid_array) {
>> +               pr_debug("Failed to allocate RMID array\n");
>> +               return -ENOMEM;
>> +       }
>> +       memset(rmid_array, -1, num_rmid * sizeof(*rmid_array));
>> +
>> +       num_mbwu_mon = class->props.num_mbwu_mon;
>> +       cntrs = __alloc_mbwu_array(mon->class, num_mbwu_mon);
> 
> hi Ben,
> One thing double-checking here.
> The allocation path uses class->props.num_mbwu_mon,
> but teardown frees using l3_num_allocated_mbwu,
> which is the global minimum exposed counter counter.
> If classes can have different num_mbwu_mon values, a class with more
> monitors than the global minimum may leak the tail of assigned_counters during
> teardown.
> 
> koba

Thanks for bringing this up. The l3_num_allocated_mbwu is a hangover from when
this code supported both mbm_total_bytes and mbm_local_bytes with a separate
class for each. As we've now decided that mbm_total_bytes is the only bandwidth
counter it makes sense to support we will always have at most single class with
allocated bandwidth counters. Hence, I don't think there is a leak but
l3_num_allocated_mbwu adds unneeeded complication so I'll have a go at removing it.

Thanks,

Ben

> 
>> +       if (IS_ERR(cntrs))
>> +               return PTR_ERR(cntrs);
>> +       mon->assigned_counters = cntrs;
>> +       mon->mbwu_idx_to_mon = no_free_ptr(rmid_array);
>> +
>> +       l3->mon.mbm_cntr_assignable = true;
>> +       l3->mon.mbm_assign_on_mkdir = true;
>> +       l3->mon.mbm_cntr_configurable = false;
>> +       l3->mon.mbm_cntr_assign_fixed = true;
>> +
>> +       mpam_resctrl_monitor_sync_abmc_vals(l3);
>> +
>> +       return 0;
>> +}
>> +
>>   static int mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
>>                                       enum resctrl_event_id type)
>>   {
>> @@ -1133,8 +1234,21 @@ static int mpam_resctrl_monitor_init(struct
>> mpam_resctrl_mon *mon,
>>           */
>>          l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx();
>>
>> -       if (resctrl_enable_mon_event(type, false, 0, NULL))
>> -               l3->mon_capable = true;
>> +       if (type == QOS_L3_MBM_TOTAL_EVENT_ID) {
>> +               int err;
>> +
>> +               err = mpam_resctrl_monitor_init_abmc(mon);
>> +               if (err)
>> +                       return err;
>> +
>> +               static_assert(MAX_EVT_CONFIG_BITS == 0x7f);
>> +               l3->mon.mbm_cfg_mask = MAX_EVT_CONFIG_BITS;
>> +       }
>> +
>> +       if (!resctrl_enable_mon_event(type, false, 0, NULL))
>> +               return -EINVAL;
>> +
>> +       l3->mon_capable = true;
>>
>>          return 0;
>>   }
>> @@ -1697,6 +1811,23 @@ void mpam_resctrl_exit(void)
>>          resctrl_exit();
>>   }
>>
>> +static void mpam_resctrl_teardown_mon(struct mpam_resctrl_mon *mon, struct
>> mpam_class *class)
>> +{
>> +       u32 num_mbwu_mon = l3_num_allocated_mbwu;
>> +
>> +       if (!mon->mbwu_idx_to_mon)
>> +               return;
>> +
>> +       if (mon->assigned_counters) {
>> +               __free_mbwu_mon(class, mon->assigned_counters, num_mbwu_mon);
>> +               kvfree(mon->assigned_counters);
>> +               mon->assigned_counters = NULL;
>> +       }
>> +
>> +       kvfree(mon->mbwu_idx_to_mon);
>> +       mon->mbwu_idx_to_mon = NULL;
>> +}
>> +
>>   /*
>>    * The driver is detaching an MSC from this class, if resctrl was using it,
>>    * pull on resctrl_exit().
>> @@ -1719,6 +1850,8 @@ void mpam_resctrl_teardown_class(struct mpam_class *class)
>>          for_each_mpam_resctrl_mon(mon, eventid) {
>>                  if (mon->class == class) {
>>                          mon->class = NULL;
>> +
>> +                       mpam_resctrl_teardown_mon(mon, class);
>>                          break;
>>                  }
>>          }
>> -- 
>> 2.43.0
>>


