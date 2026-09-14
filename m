Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C477C88E6E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 16:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G3dzWGekt97z/Ed1xd41cjLmbg304qMffuI/kLrXrpY=; b=SvAI+PGjqsMCW3jmpdwn4MZs6g
	MoaF54mXszbgkgVJlvEEi8WIx679Clo2LErXXSPfYU97WLBHrSWeV765yewtLaTH0m7CPDwfbVT7A
	P0mEH1pdj/ltnOUiB4WjvpmQ+3uTv4ISN8rLdAiubJhqHpN6mXC6jS+tLr6cKg9Y6dR+0lvQPeYOF
	kFUv5Jr+Y4YBxMO/4+gdpKQLmhkbUD0/0O2wuFltv3H7iOvRj8Npd30SGxt71neilUE0A7BSEJM2T
	zEtil3Uozw+GBRRW6SjZfmxv5bDEr9jiAl2vV6kN+wJjEZIXF6PMse9VCSCohEv9Hd2iaTUYTFlku
	LYOXgtFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x69Gz-00000004GI6-0oOC;
	Mon, 14 Sep 2026 16:11:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x69Gw-00000004GHM-07lF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 16:11:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC266152B;
	Mon, 14 Sep 2026 09:11:02 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 61E713F86F;
	Mon, 14 Sep 2026 09:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789402266; bh=5bDDncVTuIQ3/y7kgAm8DlF4dJ4tTwsaEm4bIaA/vq0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iSBAPkX/xPbvyOphzRefa8zokZzrVGhnxREfSd2JuYZrtkfDKP2KLWWCTlgBXFJy0
	 Q07GbFiCHpfS8dR7CghzldruRZnseiUzK/eGfNqUDoXfdGIk3K7y9Zg7izgzITQ0X9
	 KZAPYBfj4Azz8kWx77a4v6TD7ShqqCXWRO4n26ro=
Message-ID: <3571430b-15b5-4451-97e4-455f9fd46f01@arm.com>
Date: Mon, 14 Sep 2026 17:11:04 +0100
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
 <d403b92c-aae8-499f-8c73-933a2d757fba@arm.com>
 <3595fe1b-0621-4599-b94d-a027336a2ce4@intel.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <3595fe1b-0621-4599-b94d-a027336a2ce4@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_091110_152773_417818C4 
X-CRM114-Status: GOOD (  27.45  )
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

On 14/09/2026 16:16, Reinette Chatre wrote:
> Hi Ben,
> 
> On 9/11/26 1:56 AM, Ben Horgan wrote:
>> On 10/09/2026 19:10, Reinette Chatre wrote:
> 
>>>
>>> Do (admittedly crude) guardrails like below capture the existing driver requirements?
>>>
>>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
>>> index 9d223057953a..dbd06371890c 100644
>>> --- a/drivers/resctrl/mpam_resctrl.c
>>> +++ b/drivers/resctrl/mpam_resctrl.c
>>> @@ -1681,11 +1681,18 @@ mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
>>>  				continue;       // dummy resource
>>>  
>>>  			mon_comp = find_component(mon->class, cpu);
>>> +			if (!mon_comp) {
>>> +				WARN_ON_ONCE(0);
>>> +				err = -EFAULT;
>>> +				goto offline_ctrl_domain;
>>> +			}
>>>  			dom->mon_comp[eventid] = mon_comp;
>>> -			if (mon_comp)
>>> -				any_mon_comp = mon_comp;
>>> +			any_mon_comp = mon_comp;
>>
>> This first part which ensures that if there is a class for the monitor then a component can always
>> be found for the given CPU.
>>
>>>  		}
>>> -		if (!any_mon_comp) {
>>
>> The any_mon_comp check could still be useful to confirm that if r->mon_capable then there is a
>> component for at least one of the events.
> 
> resctrl fs does not handle such scenario. r->mon_capable guides whether the resource
> supports monitoring and if it is then all domains belonging to the resource is expected to
> support all monitoring events associated with the resource. resctrl fs will expose all the
> monitoring event files based on r->mon_capable and which monitoring events are enabled, there
> is no finer grained support to expose/hide events per domain.

Yes. I wasn't intending to suggest anything different. If r->mon_capable then the MPAM driver does
support all enabled events. Maybe I would would have been more to correct to just say if
r->mon_capable is true we confirm that we can do some monitoring.

> 
> If any_mon_comp is true while one of the mon_comp is NULL then resctrl will still expose the
> event to user space and pass attempts to read the data to MPAM driver.
> 
> Is this a scenario that the MPAM driver needs to support? That is, users will see event files
> but reading the data will succeed in some domains but fail in others? 

No, we don't expect the MPAM driver to support any features inconsistently across resctrl domains.
If the hardware did happen to be mismatched then we sanitize it, in __class_props_mismatch() we
ensure the class only exposes the features that are common to all the child components.

Thanks,

Ben

>>> +
>>> +		/* hack */
>>> +		if (!cpumask_equal(&dom->mon_comp[QOS_L3_OCCUP_EVENT_ID]->affinity,
>>> +				   &dom->mon_comp[QOS_L3_MBM_TOTAL_EVENT_ID]->affinity)) {
>>
>> There doesn't necessary need to be a monitoring class associated with any particular event. If there
>> are classes and so components for each of the two supported events then this check looks correct.
>> You could ensure that by checking existence:
>>
>> if (dom->mon_comp[QOS_L3_OCCUP_EVENT_ID] && dom->mon_comp[QOS_L3_MBM_TOTAL_EVENT_ID] &&
>>     !cpumask_equal(&dom->mon_comp[QOS_L3_OCCUP_EVENT_ID]->affinity,
>> 	           &dom->mon_comp[QOS_L3_MBM_TOTAL_EVENT_ID]->affinity))
> 
> Right thanks, this needs to be more robust. Essentially this is the finer grained check that
> ensures that if the domain supports both events then the backing components have the same "shape".
> 
> Reinette
> 


