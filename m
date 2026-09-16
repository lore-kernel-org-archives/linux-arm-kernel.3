Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5687C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 13:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9FuvqUYTUk3zI7XdM9JIf0yiGW/Yy2hsDkmp1yVcauY=; b=q7baZF3DC3ATFfpZqAg1WREwc4
	lyeQEurtSAVL0hTdGHYAuEyu3gidMT+jbUK5r8OH6pTTYq6Qt0KoYXe2r+h7DVWQIUKxexdOV8RsO
	DEhg+X7FiIBSryDNTtI9up1eESYac+9E1TxHvZX1Q4Me74XqV0h+LCVz1fXP6FFTNw7AylkWf5YVT
	RLomuJpw4TDOaKB3/RHrTzN9z4zQYL2lLYMI72KQfZ7h9luO6CN/LwfcTKbTAOJCXpRlCjHRi1efE
	EcRjbIJXpmDf1bFOrW+EAu7hHN52+c7rqe1xy7PV3KBMDo/OgvPjUqfEQnyqpCrtP/fkxD3BvYbtQ
	hOdWXPmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6pmL-00000009GwC-31wu;
	Wed, 16 Sep 2026 13:34:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6pmI-00000009GvV-1VCy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 13:34:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B09F152B;
	Wed, 16 Sep 2026 06:34:17 -0700 (PDT)
Received: from [10.41.4.144] (e142021.arm.com [10.41.4.144])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 94C873F86F;
	Wed, 16 Sep 2026 06:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789565661; bh=ftIdCVik7QqH4xKTjNDb9LuQ3p0M9m/C7lYXHanN8u4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=al3ayKYA2ld+DoLtfVmbjgfXPiCPeVw7LGeHrB75PUIsZ/FCejl2MbsdfDN7P7v37
	 LaDa5paWpboAEyq7fpEuJRCqgMiJ+iIxZpKgSZu7Er74jM4wT5EKGvV5r459TEWfrl
	 9kneuZzDGCUYfXp/MkgEiO4JeXyu7DM7ghxzFkXs=
Message-ID: <4f35abf6-6dac-4c60-9ece-c1af02a98c9c@arm.com>
Date: Wed, 16 Sep 2026 15:34:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm_mpam: resctrl: Catch and propagate error from
 get_cpu_cacheinfo_id()
To: Ben Horgan <ben.horgan@arm.com>, James Morse <james.morse@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 Fenghua Yu <fenghuay@nvidia.com>, Tony Luck <tony.luck@intel.com>,
 Dave Martin <Dave.Martin@arm.com>, Yin Li <yin.li@oss.qualcomm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260902143757.3469690-1-andre.przywara@arm.com>
 <ea42f2a7-f4f7-46ab-a5e0-239c74174499@arm.com>
 <2c682691-3037-4d62-a941-bc41baca35aa@arm.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <2c682691-3037-4d62-a941-bc41baca35aa@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_063422_479909_73AA326B 
X-CRM114-Status: GOOD (  22.77  )
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

Hi,

On 9/16/26 11:49, Ben Horgan wrote:
> Hi Andre,
> 
> On 07/09/2026 13:59, Ben Horgan wrote:
>> Hi Andre,
>>
>> On 02/09/2026 15:37, Andre Przywara wrote:
>>> get_cpu_cacheinfo_id() can fail, in which case it returns a negative
>>> error value.
>>>
>>> Check the returned value for this error condition, before passing the
>>> value on to other code, which would hide the negative number in some high
>>> value in the unsigned type.
>>>
>>> Fixes: 36528c7681b8 ("arm_mpam: resctrl: Add support for 'MB' resource")
>>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>>
>> This looks good to me. Out of interest what led you to find this?
>>
>> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> 
> I seem to have been a bit hasty here.
> 
> Sashiko points out at [1] that 0xFFFFFFFF is the only value we were previously considering invalid
> and that the value coming from dt or acpi can provid other valid values that would after this patch
> be considered invalid.

Fair, and I can easily change the check to only check explicitly for -1.

But this is somewhat broken already, right? I mean the return type for 
the existing get_cpu_cacheinfo_id() has always been "int". It looks like 
this comes from the x86 world, where the cache IDs never get that large? 
I can have a deeper look, but my gut feeling is that this is practically 
irrelevant, since we barely see Aff3 at all, not to mention high values 
of it.

Cheers,
Andre

> 
> [1] https://sashiko.dev/#/patchset/20260902143757.3469690-1-andre.przywara%40arm.com
> 
> Thanks,
> 
> Ben>
>> Thanks,
>>
>> Ben
>>
>>> ---
>>>   drivers/resctrl/mpam_resctrl.c | 5 ++++-
>>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
>>> index 9d223057953ab..a5e661eff86d7 100644
>>> --- a/drivers/resctrl/mpam_resctrl.c
>>> +++ b/drivers/resctrl/mpam_resctrl.c
>>> @@ -786,7 +786,10 @@ static u32 get_mba_min(struct mpam_props *cprops)
>>>   /* Find the L3 cache that has affinity with this CPU */
>>>   static int find_l3_equivalent_bitmask(int cpu, cpumask_var_t tmp_cpumask)
>>>   {
>>> -	u32 cache_id = get_cpu_cacheinfo_id(cpu, 3);
>>> +	int cache_id = get_cpu_cacheinfo_id(cpu, 3);
>>> +
>>> +	if (cache_id < 0)
>>> +		return -ENOENT;
>>>   
>>>   	lockdep_assert_cpus_held();
>>>   
>>
>>
> 


