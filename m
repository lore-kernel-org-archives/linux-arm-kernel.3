Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4211AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 07:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nameEV+0DQA14P65XZurQsDCAJ5p3N3TEbqhk7lxywc=; b=23KgORmzEqzqGx2oFHp6MWDat5
	v/9uekVE+oGAd8d8NQ67YbkZzkYv3M3Q6rq+UcVm4ofmuN6xtYcvbtdKIHdgYqVkYjESX42HwU5FQ
	oZC9OdZo9uiEl/nwTwhFTUEZmGTafYmIA/U2kwEFMh7LoSaNEJrFegzB+KdXK8S7MQ05MzQUx6caS
	jXICrxEN/br0laAOMNbTEv+Bqa20pcwlnVEF+JB4dhl9JgS6Ck+Wdam5nqF8dA8g64qppySmyIimS
	ddZTtreUV0oozJ+AOuO0FrPZNqKxyOIiKKVLzLAxg3aqgA7mlIB0SHGjkfLho7kRyGOd7UQo959+3
	B8VyAU7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjIu-00000001Jbi-3uYT;
	Thu, 09 Jul 2026 07:36:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjIt-00000001Jaq-1qvC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 07:36:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 471E315A1;
	Thu,  9 Jul 2026 00:36:10 -0700 (PDT)
Received: from [10.41.150.148] (e142021.arm.com [10.41.150.148])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D28073F66F;
	Thu,  9 Jul 2026 00:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783582574; bh=8sfhycHbh/KxK1a8FZ4v3kkfMX38FffCMj8F1aGLOrE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UDmSLeWYCQ6eENgHGLBq2RT///VUSQA3jbHG4hIoVpBhilDuNu9yxytLHkYVSiUeK
	 xzRnXQLJOZp0AjABSNX3qkHZdwNhvHcebz0x47o0LDS/uIlVL9VMzZ4x1e4AEaqVGV
	 d9aj4bfQuRhm32Ixu++/v04/unD8kdPQ87UnG0/E=
Message-ID: <bc669ed1-a0d6-4ee5-b24e-6996af0f5d3a@arm.com>
Date: Thu, 9 Jul 2026 09:36:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/15] arm_mpam: propagate MSC read errors for
 mpam_msc_read_mbwu_l()
To: Ben Horgan <ben.horgan@arm.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Hanjun Guo <guohanjun@huawei.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 James Morse <james.morse@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
 Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
 Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
 Trilok Soni <tsoni@quicinc.com>, Srinivas Ramana <sramana@qti.qualcomm.com>,
 Niyas Sait <niyas.sait@arm.com>, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260702162229.4008659-1-andre.przywara@arm.com>
 <20260702162229.4008659-5-andre.przywara@arm.com>
 <717a2f77-7caa-4cf5-acd5-c2f86686e34e@arm.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <717a2f77-7caa-4cf5-acd5-c2f86686e34e@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_003615_585258_64B84E8D 
X-CRM114-Status: GOOD (  15.51  )
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

On 7/1/26 22:06, Ben Horgan wrote:
> Hi Andre,
> 
> On 7/2/26 17:22, Andre Przywara wrote:
>> Allow the mpam_msc_read_mbwu_l() function to return an error, and
>> propagate read errors from the lower level up.
>>
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>> ---
>>   drivers/resctrl/mpam_devices.c | 13 ++++++++++---
>>   1 file changed, 10 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index 011d1e3544d7..1d06902fb970 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -1106,6 +1106,7 @@ static bool mpam_ris_has_mbwu_long_counter(struct mpam_msc_ris *ris)
>>   
>>   static u64 mpam_msc_read_mbwu_l(struct mpam_msc *msc)
> 
> Now that your changing the other helpers to return an error and pass a
> pointer to hold the register value it would seem more consistent for
> this call to follow the same pattern.

Ah, I wasn't entirely sure whether this MSMON___L_NRDY is just some 
error flag (abuse), since NRDY is some kind of architecture feature.
If that's indeed here the case, I will be changing the prototype and 
adjust the function.

Cheers,
Andre

> Thanks,
> 
> Ben
> 
>>   {
>> +	int ret;
>>   	int retry = 3;
>>   	u32 mbwu_l_low;
>>   	u32 mbwu_l_high1, mbwu_l_high2;
>> @@ -1115,11 +1116,17 @@ static u64 mpam_msc_read_mbwu_l(struct mpam_msc *msc)
>>   	WARN_ON_ONCE((MSMON_MBWU_L + sizeof(u64)) > msc->mapped_hwpage_sz);
>>   	WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(), &msc->accessibility));
>>   
>> -	__mpam_read_reg(msc, MSMON_MBWU_L + 4, &mbwu_l_high2);
>> +	ret = __mpam_read_reg(msc, MSMON_MBWU_L + 4, &mbwu_l_high2);
>> +	if (ret)
>> +		return MSMON___L_NRDY;
>> +
>>   	do {
>>   		mbwu_l_high1 = mbwu_l_high2;
>> -		__mpam_read_reg(msc, MSMON_MBWU_L, &mbwu_l_low);
>> -		__mpam_read_reg(msc, MSMON_MBWU_L + 4, &mbwu_l_high2);
>> +		ret = __mpam_read_reg(msc, MSMON_MBWU_L, &mbwu_l_low);
>> +		if (!ret)
>> +			ret = __mpam_read_reg(msc, MSMON_MBWU_L + 4, &mbwu_l_high2);
>> +		if (ret)
>> +			return MSMON___L_NRDY;
>>   
>>   		retry--;
>>   	} while (mbwu_l_high1 != mbwu_l_high2 && retry > 0);
> 


