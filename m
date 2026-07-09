Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80904C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 10:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DOoIJVHRWsyOpW55vTJGgugNcFYv/4dJlWhKUx42kV4=; b=0sTZm0nf6O4OehhfryQ7VIRmZ5
	zXVS5LV74+BzddkIi/2OzDd4C503jhee56Nw/cKoGwNKdJ2t/9e8xEZLxwOrDRNvLc6YFws5BWUEd
	2XtetCOHt8aRpyRW+vJfRhHqJ9/VpS9HUz7iG/wYzjbkbj66Sv2+EFGXTm7kIdcAGs7ubGQvSGFC+
	PqqOe2zYkFAJ72mNJB1M5gPbXs9kYx2/hgXlSCyGlr8WKXvuGG7y6lb05lWBbc2NnFd8v3ckCiDz/
	LsGaLB4gnaVd/pZgS/2o+QA+9ksxvySNWV173ET5KXLMxmYUfMjNLYCl5I59Av4J3LBfqe2QIPfP7
	DwEOMFtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlb7-00000001rM4-46cP;
	Thu, 09 Jul 2026 10:03:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlb3-00000001rL7-3ddN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 10:03:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF0F9357C;
	Thu,  9 Jul 2026 03:03:03 -0700 (PDT)
Received: from [10.41.150.148] (e142021.arm.com [10.41.150.148])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 287803F7B4;
	Thu,  9 Jul 2026 03:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783591388; bh=ecLtVnEwb3NP4soxChOKajrwfO3Sl/4YUqD3QznhpYs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ooBPQon+vGBTV5jo+7tu6X1T4i29xOLgqNL8HUdyjPh8ZLWLNeyLIf9Qqw0Y7Eu3n
	 DeIaW22GaUUVClAfamohQb2ua55C9PHP1MNQI0jTLbY94ROaSSX/1UduhoDv3AXCRu
	 lU+hs0CyEiS/cnSueZDDsOLCwj2BH/tNUK3yt8hE=
Message-ID: <9498c202-ed82-49ae-b960-df44b53596e6@arm.com>
Date: Thu, 9 Jul 2026 12:03:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/15] arm_mpam: propagate MSC read errors for state
 saving functions
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
 <20260702162229.4008659-8-andre.przywara@arm.com>
 <fa9440a9-cfbe-4eef-a255-a4aed196640e@arm.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <fa9440a9-cfbe-4eef-a255-a4aed196640e@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_030309_990334_D9D7514D 
X-CRM114-Status: GOOD (  17.19  )
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

On 7/1/26 22:19, Ben Horgan wrote:
> Hi Andre,
> 
> On 7/2/26 17:22, Andre Przywara wrote:
>> Allow the mpam_save_mbwu_state() function to return an error, and
>> propagate read errors from the lower level up.
>>
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>> ---
>>   drivers/resctrl/mpam_devices.c | 47 +++++++++++++++++++++-------------
>>   1 file changed, 29 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index d18c7be86aaa..c50ca0e4f426 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -1773,6 +1773,7 @@ static int mpam_save_mbwu_state(void *arg)
>>   {
>>   	int i;
>>   	u64 val;
>> +	int ret;
>>   	struct mon_cfg *cfg;
>>   	u32 cur_flt, cur_ctl, mon_sel;
>>   	struct mpam_msc_ris *ris = arg;
>> @@ -1789,31 +1790,41 @@ static int mpam_save_mbwu_state(void *arg)
>>   		mon_sel = FIELD_PREP(MSMON_CFG_MON_SEL_MON_SEL, i) |
>>   			  FIELD_PREP(MSMON_CFG_MON_SEL_RIS, ris->ris_idx);
>>   		mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
>> -		mpam_read_monsel_reg(msc, CFG_MBWU_FLT, &cur_flt);
>> -		mpam_read_monsel_reg(msc, CFG_MBWU_CTL, &cur_ctl);
>> -		mpam_write_monsel_reg(msc, CFG_MBWU_CTL, 0);
>> +		ret = mpam_read_monsel_reg(msc, CFG_MBWU_FLT, &cur_flt);
>> +		if (!ret)
>> +			ret = mpam_read_monsel_reg(msc, CFG_MBWU_CTL, &cur_ctl);
>> +		if (!ret)
>> +			mpam_write_monsel_reg(msc, CFG_MBWU_CTL, 0);
>>   
>> -		if (mpam_ris_has_mbwu_long_counter(ris)) {
>> -			val = mpam_msc_read_mbwu_l(msc);
>> -			mpam_msc_zero_mbwu_l(msc);
>> -		} else {
>> -			u32 val32;
>> +		if (!ret) {
>> +			if (mpam_ris_has_mbwu_long_counter(ris)) {
>> +				val = mpam_msc_read_mbwu_l(msc);
>> +				mpam_msc_zero_mbwu_l(msc);
>> +			} else {
>> +				u32 val32;
>>   
>> -			mpam_read_monsel_reg(msc, MBWU, &val32);
>> -			val = val32;
>> -			mpam_write_monsel_reg(msc, MBWU, 0);
>> +				ret = mpam_read_monsel_reg(msc, MBWU, &val32);
>> +				if (!ret) {
>> +					val = val32;
>> +					mpam_write_monsel_reg(msc, MBWU, 0);
>> +				}
>> +			}
>>   		}
>>   
>> -		cfg->mon = i;
>> -		cfg->pmg = FIELD_GET(MSMON_CFG_x_FLT_PMG, cur_flt);
>> -		cfg->match_pmg = FIELD_GET(MSMON_CFG_x_CTL_MATCH_PMG, cur_ctl);
>> -		cfg->partid = FIELD_GET(MSMON_CFG_x_FLT_PARTID, cur_flt);
>> -		mbwu_state->correction += val;
>> -		mbwu_state->enabled = FIELD_GET(MSMON_CFG_x_CTL_EN, cur_ctl);
>> +		if (!ret && val != MSMON___L_NRDY) {
>> +			cfg->mon = i;
>> +			cfg->pmg = FIELD_GET(MSMON_CFG_x_FLT_PMG, cur_flt);
>> +			cfg->match_pmg = FIELD_GET(MSMON_CFG_x_CTL_MATCH_PMG, cur_ctl);
>> +			cfg->partid = FIELD_GET(MSMON_CFG_x_FLT_PARTID, cur_flt);
>> +			mbwu_state->correction += val;
>> +			mbwu_state->enabled = FIELD_GET(MSMON_CFG_x_CTL_EN, cur_ctl);
>> +		}
>>   		mpam_mon_sel_unlock(msc);
>> +		if (ret)
>> +			break;
> 
> There is a lot of if(!ret) in this loop. Does it not end up cleaner to
> add an out_unlock label after the loop and jump to that in the failure
> cases?

Yeah, I changed it, I guess the diff looks better. Not entirely sure 
it's cleaner, there is now this little bitter taste of a global unlock 
where the current lock/unlock pair is *inside* the loop. Feel free to 
have a look and comment on an eventual v3 post.

Cheers,
Andre

> 
> Thanks,
> 
> Ben
> 
>>   	}
>>   
>> -	return 0;
>> +	return ret;
>>   }
>>   
>>   /*
> 


