Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE483C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 08:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gi0wJmxVBZXyKBxA+aOLOq98emOlx/Z25W5ZIR7FAIw=; b=DELdypsd1oZ/2M5HvS4898wwZ9
	IFJKSn2oTQnfSjDMP4P+cYuEIVroVVtGpyBMLobEKo2vcFf9B/0jJNsDzMMYaQVnlFj9xnft/n4HR
	3uM2y77Ivi+s4jgiU+1CjysWiMtuRU8PNZ9mCAkGwgstUPF7+Pp3BIP75V+NKztqmT3FEoy8s0fgz
	ldjLohU2qa+JtEEs+eqjh3ucEpbONBFhgSOmwm2RkScsIkne9sY4GQTDgtwDJkR5CKauwIe5/eNhP
	BlKN7ohgQG1w4GCmY2smCEzTGKmsospOUcJ0bY23sUFQzVN7lrf6JhALHY7lO2seFRxI1mWhxb3jz
	p98M/3+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4x3N-0000000GBvb-44b8;
	Fri, 11 Sep 2026 08:56:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4x3K-0000000GBuj-1PQA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 08:56:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6FE7A16A3;
	Fri, 11 Sep 2026 01:56:05 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F1CED3F7B4;
	Fri, 11 Sep 2026 01:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789116969; bh=mPcxAHu3KYHI6pGhTtcvzaAlBrH1n1Q4zJ/2mJJUMPE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=P7mkOT24uSdxWqA8jPAny9fmmKdRuCez9zivlFL3QbNQuVEdreVcChQMiV3DvwIzk
	 rrdc/6RxTi0bFuJWvqtTr1h74BQ3yd2b6Qe2Uefghl43RYD90MA01Q6fr+KpC97tBX
	 N9jg0PAiqjM977hyHX0WRd+g6MSB4bijquUUJsPk=
Message-ID: <d403b92c-aae8-499f-8c73-933a2d757fba@arm.com>
Date: Fri, 11 Sep 2026 09:56:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] arm_mpam: resctrl: Separate MPAM domains
To: Reinette Chatre <reinette.chatre@intel.com>, james.morse@arm.com,
 Dave.Martin@arm.com, fenghuay@nvidia.com
Cc: tony.luck@intel.com, babu.moger@amd.com, yu.c.chen@intel.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev
References: <85ca29e89eacf12cfa7071249419e7cadb8f0691.1788220029.git.reinette.chatre@intel.com>
 <0b0eef2d-ce3b-48c8-af08-5889e7396e4f@arm.com>
 <a492ffb3-c12e-4986-8f36-c907382c67e5@intel.com>
 <96eda554-64a1-4f1e-9608-98cd106b00da@arm.com>
 <a3cf9362-007d-4c6c-8f6f-1c9b8b41b1b9@intel.com>
 <ad1f8ed5-266a-4d79-91ef-ad8ab3febfb8@arm.com>
 <26e294a0-76a6-4ec0-9df8-021a76bf8ed9@intel.com>
 <86603611-b20d-4a0a-a247-8cebb11b3432@arm.com>
 <071d3dc6-6c18-4287-af26-719b89304058@intel.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <071d3dc6-6c18-4287-af26-719b89304058@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_015611_129853_4B6FF3ED 
X-CRM114-Status: GOOD (  35.53  )
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

Hi Reinette,

On 10/09/2026 19:10, Reinette Chatre wrote:
> Hi Ben,
> 
> On 9/10/26 9:28 AM, Ben Horgan wrote:
>> Hi Reinette,
>>
>> On 10/09/2026 16:37, Reinette Chatre wrote:
>>> Hi Ben,
>>>
>>> On 9/10/26 4:11 AM, Ben Horgan wrote:
>>>> On 08/09/2026 22:12, Reinette Chatre wrote:
>>>>> On 9/7/26 10:01 AM, Ben Horgan wrote:
>>>>>> On 03/09/2026 16:29, Reinette Chatre wrote:
>>>>>>> On 9/2/26 9:10 AM, Ben Horgan wrote:
>>>>>>>> On 01/09/2026 00:54, Reinette Chatre wrote:
>>>
>>> ...
>>>
>>>>>>> It is not clear to me if a mon_comp of NULL is able to handle all scenarios since it looks
>>>>>>> like mpam_resctrl_get_mon_domain_from_cpu() and mpam_resctrl_online_domain_hdr() does not
>>>>>>> consider the component at all. Would that not cause monitoring features to depend on which
>>>>>>> CPU of a domain comes online first?
>>>>>>>
>>>>>>> Could mon_comp perhaps be required to be !NULL here as a replacement for the earlier
>>>>>>> "ctrl_comp" check to ensure there is a component with the CPU in its affinity mask?
>>>>>>
>>>>>> Doesn't the !any_mon_comp check provide this?
>>>>>
>>>>> This is the part that I do not understand since any_mon_comp seems to support the scenario
>>>>> where a mon_comp may be NULL which is a scenario that I do not think resctrl can support.
>>>>
>>>> Ah, I see what you are getting at. As the monitor components are only considered when there topology
>>>> matches the l3 cache (same cpu affinity for each instance) then the find_component() call will never
>>>> fail and so mon_comp can't be NULL at this point.
>>>>
>>>>>
>>>>> At a high level there seems to be three affinity masks used by the monitoring code:
>>>>> the CPU affinity of the component belonging to the control resource class, the CPU affinity
>>>>> of each component supporting each monitoring event, while these are three separate masks with
>>>>> code sometimes treating them as though they can be different they are actually required to be the same?
>>>>
>>>> Monitor component CPU affinity is enforced by topology_matches_l3() to be the same as the L3.
>>>> Additionally, traffic_matches_l3() adds extra conditions that mean that there can be considered an
>>>> uninterrupted link between l3 and memory and so an MSC at either end is effectively the same. Namely
>>>> the same restrictions I've mentioned before, only a single l3 cache, a single NUMA node and no
>>>> intermediate caches.
>>>>
>>>> You list two rather than three here? Possibly you are also thinking the MSC cpu affinity which can
>>>
>>> I did mention three masks. Thank you for clarifying how the one mask (the "ctrl_comp" one) is associated with
>>> either that of the control class or the same as the class associated with the first event. 
>>
>> Ah yes, I misunderstood.
>>
>>>
>>> Regarding the other two masks: it seems to me as though the CPU masks associated with the two supported events
>>> are managed separately. This means that theoretically the class associated with QOS_L3_OCCUP_EVENT_ID could have
>>> components with different affinity from the components of the class associated with QOS_L3_MBM_TOTAL_EVENT_ID. A CPU
>>> being onlined could thus be associated with QOS_L3_OCCUP_EVENT_ID (resulting in mon_comp being
>>> initialized for this CPU) but not with QOS_L3_MBM_TOTAL_EVENT_ID (mon_comp is NULL for the same CPU). In
>>> this scenario, "any_mon_comp" will be true and the domain created and onlined while it does not
>>> actually support both events?
>>
>> Hmm, it depends what you mean by "theoretically". In mpam_resctrl_pick_counters() the class to back
>> each event is chosen. For QOS_L3_OCCUP_EVENT_ID it will always be the class at the L3. For
>> QOS_L3_MBM_TOTAL_EVENT_ID the topology_matches_l3() call will check the cpu mask matches the L3.
>> Does that answer query or am I missing something else?
> I mean "theoretically" because it seems that the CPU online code (specifically domain creation) supports
> the scenario where these CPU masks of the two events are different (mon_comp can be set for one event but
> not the other) while the rest of the driver seems to make an effort to keep these CPU masks identical (as
> you highlight) and there is not actually support for them being different.
> 
> The planned changes discussed here are for the domain creation and will touch the code handling this
> scenario. I was hoping to just change the data structures while maintaining the current flows as closely
> as possible. I currently struggle with maintaining this flow that can never, and more importantly should
> never, be encountered.

I see, makes sense.

> 
> Do (admittedly crude) guardrails like below capture the existing driver requirements?
> 
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 9d223057953a..dbd06371890c 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -1681,11 +1681,18 @@ mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
>  				continue;       // dummy resource
>  
>  			mon_comp = find_component(mon->class, cpu);
> +			if (!mon_comp) {
> +				WARN_ON_ONCE(0);
> +				err = -EFAULT;
> +				goto offline_ctrl_domain;
> +			}
>  			dom->mon_comp[eventid] = mon_comp;
> -			if (mon_comp)
> -				any_mon_comp = mon_comp;
> +			any_mon_comp = mon_comp;

This first part which ensures that if there is a class for the monitor then a component can always
be found for the given CPU.

>  		}
> -		if (!any_mon_comp) {

The any_mon_comp check could still be useful to confirm that if r->mon_capable then there is a
component for at least one of the events.

> +
> +		/* hack */
> +		if (!cpumask_equal(&dom->mon_comp[QOS_L3_OCCUP_EVENT_ID]->affinity,
> +				   &dom->mon_comp[QOS_L3_MBM_TOTAL_EVENT_ID]->affinity)) {

There doesn't necessary need to be a monitoring class associated with any particular event. If there
are classes and so components for each of the two supported events then this check looks correct.
You could ensure that by checking existence:

if (dom->mon_comp[QOS_L3_OCCUP_EVENT_ID] && dom->mon_comp[QOS_L3_MBM_TOTAL_EVENT_ID] &&
    !cpumask_equal(&dom->mon_comp[QOS_L3_OCCUP_EVENT_ID]->affinity,
	           &dom->mon_comp[QOS_L3_MBM_TOTAL_EVENT_ID]->affinity))


Thanks,

Ben


>  			WARN_ON_ONCE(0);
>  			err = -EFAULT;
>  			goto offline_ctrl_domain;
> 
> 
> Reinette
> 
> 


