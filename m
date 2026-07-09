Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B28BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 08:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ckK2RwEssTySA3oHIaQkKqHQVEUyMNHj+aPdXRefLNo=; b=ZbWHhRadDFBOps4YC09e2bCjnA
	d7FQrYAK484IuMhYVrUqRQ6V3vW1R6aWsI1KcmCugfBnGVAYBm57ZRKAp11m94VcrLID3yXE+OjU/
	83EbW6Fi86u+116CF5mrsz/j4G2NdTJ8g8GbjCC3R7pAmio/5zpJCbLzcDbpX1kw82Dqh3vQwXs3p
	/vf9+nBCLqWHZTnaBtHYTjTNXQQS9H0dPA5k8bV+P4u6wxKBXfimPNLphcjFDLL5Dsv4UoxLjYfjH
	kTMVD6bMYizgkwFv/a/wv52CSG9maDFo7vgCDFNKEZoj5+neZK7iM9gLNQTrI9Sl/sryyR4GR5PVa
	GtjprgkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkKs-00000001TDn-2LNf;
	Thu, 09 Jul 2026 08:42:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkKp-00000001T7z-0xl3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 08:42:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF2423569;
	Thu,  9 Jul 2026 01:42:10 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 70BCE3F7B4;
	Thu,  9 Jul 2026 01:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783586535; bh=zjBAqrENqI9UKJncydX8E7PPCy7T9YRwl+p8i+rrRGE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lDYx2BNSQhrqnFBtotVihF8a6KkjV8XFA9g50zpOYqFBge/0wS8+VXnZ9UQifg1BU
	 KxPo6RSJELf9baYOB5YAhmzcCxEKRsX4d+przm1pRCURJfAvjSTUfVV7NmBdPBXz65
	 kA+98SQAD3ZBY0Iy46odNBK13598yzEOTberXIAY=
Message-ID: <ff20c1e3-ac03-4581-b24a-23531f8383fd@arm.com>
Date: Thu, 9 Jul 2026 09:42:10 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v2 04/15] arm_mpam: propagate MSC read errors for
 mpam_msc_read_mbwu_l()
To: Andre Przywara <andre.przywara@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>,
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
 <bc669ed1-a0d6-4ee5-b24e-6996af0f5d3a@arm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <bc669ed1-a0d6-4ee5-b24e-6996af0f5d3a@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_014219_428495_219CD3C5 
X-CRM114-Status: GOOD (  16.66  )
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

On 7/9/26 08:36, Andre Przywara wrote:
> Hi Ben,
> 
> On 7/1/26 22:06, Ben Horgan wrote:
>> Hi Andre,
>>
>> On 7/2/26 17:22, Andre Przywara wrote:
>>> Allow the mpam_msc_read_mbwu_l() function to return an error, and
>>> propagate read errors from the lower level up.
>>>
>>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>>> ---
>>>   drivers/resctrl/mpam_devices.c | 13 ++++++++++---
>>>   1 file changed, 10 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/
>>> mpam_devices.c
>>> index 011d1e3544d7..1d06902fb970 100644
>>> --- a/drivers/resctrl/mpam_devices.c
>>> +++ b/drivers/resctrl/mpam_devices.c
>>> @@ -1106,6 +1106,7 @@ static bool
>>> mpam_ris_has_mbwu_long_counter(struct mpam_msc_ris *ris)
>>>     static u64 mpam_msc_read_mbwu_l(struct mpam_msc *msc)
>>
>> Now that your changing the other helpers to return an error and pass a
>> pointer to hold the register value it would seem more consistent for
>> this call to follow the same pattern.
> 
> Ah, I wasn't entirely sure whether this MSMON___L_NRDY is just some
> error flag (abuse), since NRDY is some kind of architecture feature.

Yeah, as only 32 bit reads are supported it's abused to report the case
where we can't get a stable reading of the upper bits. Architecturally,
NRDY is (optionally) used to say we haven't yet got a stable value after
a configuration.

Thanks,

Ben

> If that's indeed here the case, I will be changing the prototype and
> adjust the function.
> 
> Cheers,
> Andre
> 
>> Thanks,
>>
>> Ben
>>
>>>   {
>>> +    int ret;
>>>       int retry = 3;
>>>       u32 mbwu_l_low;
>>>       u32 mbwu_l_high1, mbwu_l_high2;
>>> @@ -1115,11 +1116,17 @@ static u64 mpam_msc_read_mbwu_l(struct
>>> mpam_msc *msc)
>>>       WARN_ON_ONCE((MSMON_MBWU_L + sizeof(u64)) > msc-
>>> >mapped_hwpage_sz);
>>>       WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(), &msc-
>>> >accessibility));
>>>   -    __mpam_read_reg(msc, MSMON_MBWU_L + 4, &mbwu_l_high2);
>>> +    ret = __mpam_read_reg(msc, MSMON_MBWU_L + 4, &mbwu_l_high2);
>>> +    if (ret)
>>> +        return MSMON___L_NRDY;
>>> +
>>>       do {
>>>           mbwu_l_high1 = mbwu_l_high2;
>>> -        __mpam_read_reg(msc, MSMON_MBWU_L, &mbwu_l_low);
>>> -        __mpam_read_reg(msc, MSMON_MBWU_L + 4, &mbwu_l_high2);
>>> +        ret = __mpam_read_reg(msc, MSMON_MBWU_L, &mbwu_l_low);
>>> +        if (!ret)
>>> +            ret = __mpam_read_reg(msc, MSMON_MBWU_L + 4,
>>> &mbwu_l_high2);
>>> +        if (ret)
>>> +            return MSMON___L_NRDY;
>>>             retry--;
>>>       } while (mbwu_l_high1 != mbwu_l_high2 && retry > 0);
>>
> 


