Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D61EC531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 11:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0XCpsJAqCYxGYojcg9DEoI/e9HAbdyQHyC39UugqkAw=; b=mmPl2Iego5OEpufNAcXr4tb1dx
	hv1Ct2ybsG/Hq0Zlft8GuLmSi9HXqm+36HieJNONK/GHBX0iH/1C2NCp63iUS/UeVGU3bPc046qWH
	z0EHVv1W6su6G3j3KJcJwSOHHHsQjxZcOj9TGGt6HlKgkU/mvlc+qd4XLHDtQNPfHkhrCf0vHhOTw
	d0XKwLZ2NOuV+CaCAnMUb4uhOUU7VXug1YXtzma+Hmts7piFudebMDA/La775vEx0tI3ItN592B6Z
	lgRi0ekaj5+UE1uWXfBfz9bF6jnOxFSinb9tLn0cfsfaDr6VrMU7vw188Tq+d5ghHEi8OBRJyImvp
	v61YkbwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnDw5-0000000GHP8-21Qh;
	Fri, 24 Jul 2026 11:19:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnDw3-0000000GHOG-06ZS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 11:19:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04AF31477;
	Fri, 24 Jul 2026 04:19:17 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DD6543F59E;
	Fri, 24 Jul 2026 04:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784891961; bh=6DmPCA8NJHL/ZnEaVWd3asm4aMXes0MHBhltqBYPzUM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rt8qOQDUCbtSI1jimM0mrdL+fE4d2WYXQ0SO9UgDHn+T4tx7DW6bqmzbBBifj/dxV
	 4RxZlqG4EdGj9kRiYhgQUeu+0CAH0+se3xveU5a34dmf0LOZBG/mRD9qu9shMX0sRb
	 mPsuEhchgGPJesQC0IwJ7alze55pAHkDENU8Ce4c=
Message-ID: <e182f2ac-6fd9-4a25-9409-9617012584ed@arm.com>
Date: Fri, 24 Jul 2026 13:19:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/10] arm_mpam: propagate MSC access errors for state
 saving function
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Hanjun Guo <guohanjun@huawei.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu
 <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
 Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
 Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
 Trilok Soni <tsoni@quicinc.com>, Srinivas Ramana <sramana@qti.qualcomm.com>,
 Niyas Sait <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260723155454.1760823-1-andre.przywara@arm.com>
 <20260723155454.1760823-7-andre.przywara@arm.com>
 <20260724-important-curassow-of-support-ce4777@sudeepholla>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260724-important-curassow-of-support-ce4777@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_041923_341940_961C4990 
X-CRM114-Status: GOOD (  17.18  )
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

On 7/24/26 12:07, Sudeep Holla wrote:
> On Thu, Jul 23, 2026 at 05:54:50PM +0200, Andre Przywara wrote:
>> Allow the mpam_save_mbwu_state() function to return an error, and
>> propagate read and write errors from the lower level up.
>>
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>> ---
>>   drivers/resctrl/mpam_devices.c | 29 ++++++++++++++++++++++-------
>>   1 file changed, 22 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index bcff53477133..6329443c451f 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -1833,22 +1833,37 @@ static int mpam_save_mbwu_state(void *arg)
>>   
>>   		mon_sel = FIELD_PREP(MSMON_CFG_MON_SEL_MON_SEL, i) |
>>   			  FIELD_PREP(MSMON_CFG_MON_SEL_RIS, ris->ris_idx);
>> -		mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
>> -		mpam_read_monsel_reg(msc, CFG_MBWU_FLT, &cur_flt);
>> -		mpam_read_monsel_reg(msc, CFG_MBWU_CTL, &cur_ctl);
>> -		mpam_write_monsel_reg(msc, CFG_MBWU_CTL, 0);
>> +		ret = mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
>> +		if (ret)
>> +			return ret;
>> +		ret = mpam_read_monsel_reg(msc, CFG_MBWU_FLT, &cur_flt);
>> +		if (ret)
>> +			return ret;
>> +		ret = mpam_read_monsel_reg(msc, CFG_MBWU_CTL, &cur_ctl);
>> +		if (ret)
>> +			return ret;
> 
> How does it work in general with PCC. Now that you can fail at any point,
> what happens to the write that occurs before a failed read like above one.
> Who will take care of erasing those new writes or it doesn't matter ?
> Just checking as I don't have much knowledge on MPAM intrinsics.

TBH I don't know, but I think we consider MPAM botched at this point, 
and just stop the driver, similar to an error IRQ? But I am not sure 
this is properly implemented at this point. The focus of these first six 
patches was merely to lay the dirty groundwork for *being able* to 
handle errors, and do this now rather than in the future.

Cheers,
Andre

