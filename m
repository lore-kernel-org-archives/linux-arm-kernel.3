Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F377AC982C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 14:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+EhvbHvTRMfk+FNJc3PI+E8opF0dWbchhnbhCKCLtRY=; b=Dai65IklctLq/XQfnURLZ2d6Hk
	yaEIKiCmsQTfgdu3eNHQYWf3uwvgFrQ4nPkPl2mfiNumzAPeXIL67MupF/ekc5Xc6CivcNwwEU+Pd
	H6yFvPhLRq4X7tOy08dheuwbPEO8b44Lme/JEgECSKVA0VMUx0BC2diMg2tm6tq4IgY/XPdhbJEVp
	RtkqJcGTzRqT6hpg5mmNKbgg1o+XoqQSRFUZBwfwujRfIa1jTSPqfbZo55yIxwspEgFxdGV+xamMR
	Opg0TWbDXvsDUgIg8pclshwPJhfl9ESHZge35Nr17C5Xsp/Il4K2G9VQz9Do6xSxeIWg5SVQSw3Yb
	hqN1CYfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6r6o-00000009UDV-1i5N;
	Wed, 16 Sep 2026 14:59:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6r6l-00000009UCd-1b4S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 14:59:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FAC01516;
	Wed, 16 Sep 2026 07:59:29 -0700 (PDT)
Received: from [10.2.212.8] (unknown [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A69FE3F7B4;
	Wed, 16 Sep 2026 07:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789570772; bh=gdiAq7W2RiooAAYYrX9jy5tLi+pRLzukmFQakocw9j4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tRV2QeLsvP/HNcvwjbrB2SWTGZA/2PriicTdL/wlrw56ul7hEF+KtStM0SLTLYzzL
	 9a8cAXByTJ6kzMbSTe/EOe8Jm4x+zhOv7N50abVLITn6RzId1bB5US3fE3AntzBZgI
	 KSnm6IW2ift1VKmdYNE1VGr8BvnoYK6tUEqnOSU0=
Message-ID: <1f0a6421-109b-4578-910a-584bd80387ad@arm.com>
Date: Wed, 16 Sep 2026 15:59:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm_mpam: resctrl: Catch and propagate error from
 get_cpu_cacheinfo_id()
To: Andre Przywara <andre.przywara@arm.com>, James Morse <james.morse@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 Fenghua Yu <fenghuay@nvidia.com>, Tony Luck <tony.luck@intel.com>,
 Dave Martin <Dave.Martin@arm.com>, Yin Li <yin.li@oss.qualcomm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260902143757.3469690-1-andre.przywara@arm.com>
 <ea42f2a7-f4f7-46ab-a5e0-239c74174499@arm.com>
 <2c682691-3037-4d62-a941-bc41baca35aa@arm.com>
 <4f35abf6-6dac-4c60-9ece-c1af02a98c9c@arm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <4f35abf6-6dac-4c60-9ece-c1af02a98c9c@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_075935_613520_9A4EEE07 
X-CRM114-Status: GOOD (  24.53  )
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

Hi Andre,

On 16/09/2026 14:34, Andre Przywara wrote:
> Hi,
> 
> On 9/16/26 11:49, Ben Horgan wrote:
>> Hi Andre,
>>
>> On 07/09/2026 13:59, Ben Horgan wrote:
>>> Hi Andre,
>>>
>>> On 02/09/2026 15:37, Andre Przywara wrote:
>>>> get_cpu_cacheinfo_id() can fail, in which case it returns a negative
>>>> error value.
>>>>
>>>> Check the returned value for this error condition, before passing the
>>>> value on to other code, which would hide the negative number in some high
>>>> value in the unsigned type.
>>>>
>>>> Fixes: 36528c7681b8 ("arm_mpam: resctrl: Add support for 'MB' resource")
>>>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>>>
>>> This looks good to me. Out of interest what led you to find this?
>>>
>>> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
>>
>> I seem to have been a bit hasty here.
>>
>> Sashiko points out at [1] that 0xFFFFFFFF is the only value we were previously considering invalid
>> and that the value coming from dt or acpi can provid other valid values that would after this patch
>> be considered invalid.
> 
> Fair, and I can easily change the check to only check explicitly for -1.
> 
> But this is somewhat broken already, right? I mean the return type for the existing
> get_cpu_cacheinfo_id() has always been "int". It looks like this comes from the x86 world, where the
> cache IDs never get that large? I can have a deeper look, but my gut feeling is that this is

The cache_id being in the PPTT table is a fairly new addition introduced for PPTT table version 3
and introduced to drivers/acpi/pptt.c as part of the preparations for the MPAM driver at the end of
2025. At this point, it seems I neglected to consider any potential effect on
get_cpu_cacheinfo_id(). The pptt cacheid takes any u32 value apart from 0. I haven't joined all the
dots but I expect there might be some tidying up needed in this area.

> practically irrelevant, since we barely see Aff3 at all, not to mention high values of it.

Does Aff3 effect the cache id on acpi systems?

Thanks,

Ben>
> Cheers,
> Andre
> 
>>
>> [1] https://sashiko.dev/#/patchset/20260902143757.3469690-1-andre.przywara%40arm.com
>>
>> Thanks,
>>
>> Ben>
>>> Thanks,
>>>
>>> Ben
>>>
>>>> ---
>>>>   drivers/resctrl/mpam_resctrl.c | 5 ++++-
>>>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
>>>> index 9d223057953ab..a5e661eff86d7 100644
>>>> --- a/drivers/resctrl/mpam_resctrl.c
>>>> +++ b/drivers/resctrl/mpam_resctrl.c
>>>> @@ -786,7 +786,10 @@ static u32 get_mba_min(struct mpam_props *cprops)
>>>>   /* Find the L3 cache that has affinity with this CPU */
>>>>   static int find_l3_equivalent_bitmask(int cpu, cpumask_var_t tmp_cpumask)
>>>>   {
>>>> -    u32 cache_id = get_cpu_cacheinfo_id(cpu, 3);
>>>> +    int cache_id = get_cpu_cacheinfo_id(cpu, 3);
>>>> +
>>>> +    if (cache_id < 0)
>>>> +        return -ENOENT;
>>>>         lockdep_assert_cpus_held();
>>>>   
>>>
>>>
>>
> 


