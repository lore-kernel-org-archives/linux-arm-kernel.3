Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C34C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 09:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MHHsEE66Ry9jJLQT14dzKfWrkx5XPuhiP8ZeCfgLMMo=; b=wRQsrX08UAabckQbbSwVloikG9
	TvHbCC16QpTXukIACdZVJ0knJQzFwKi00Fprl0q9YiaKIc8aAbGaiW36XoJGhGcwm0gICKL2nx4pV
	ck+P55ZphPl3wa1uMTMZj059CBJSr6D1PmTUrU5VClXJ7EsStraQhKs9tZNiYIuS6SIdhzn07pLZh
	el3Wi0rxwgrNhwyZrNfTL7PkhKwV+osAGAj/8+5tHaVZ7/1ottjlIrpm+MxT03iFxIWuowSH2lXFV
	pDXVaPIbMpEgiw4U9lrllOKPHtFKz8QB7pWJCR3g0bMUZPdM4MNOgYGJYLdQT/p95jZaIwXn/gbSE
	KL5DjwTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrBFg-00000001QVL-2Rpn;
	Tue, 04 Aug 2026 09:16:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrBFd-00000001QUl-25T8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 09:15:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A74481476;
	Tue,  4 Aug 2026 02:15:48 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 392623F66F;
	Tue,  4 Aug 2026 02:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785834952; bh=ypKVoyxUQha04oEuezCrJ1jrJPm6kYyRBpLg4CeoxKY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=de21VQQdeG+0BiF4L8HN3BwKpSEowJslOMvEY6Ahyj3qySm0/+6+8MiCzwCYly5YO
	 xkV4OvOFoDtBXBTncAj2ro2HczGbro3K4HT3e7jv7L657/Q5/pg+2fy4qg4cgZEh4L
	 icfDxofz3a5g77yw6ZauJnZvjrSdUT+ZwkMazhGE=
Message-ID: <0e73b685-da3a-411a-bbb7-d4369fc30d1d@arm.com>
Date: Tue, 4 Aug 2026 11:15:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/11] arm_mpam: propagate MSC access errors for
 mpam_reprogram_ris_partid()
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu
 <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
 Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
 Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
 Trilok Soni <tsoni@quicinc.com>, Srinivas Ramana <sramana@qti.qualcomm.com>,
 Niyas Sait <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
 Ritwick Sharma <ritwick.sharma@arm.com>, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260731170324.2927758-1-andre.przywara@arm.com>
 <20260731170324.2927758-8-andre.przywara@arm.com>
 <20260803152859.00006590@oss.qualcomm.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260803152859.00006590@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_021557_715776_4165A4B6 
X-CRM114-Status: GOOD (  25.91  )
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

Hi Jonathan,

On 8/4/26 00:28, Jonathan Cameron wrote:
> On Fri, 31 Jul 2026 19:03:20 +0200
> Andre Przywara <andre.przywara@arm.com> wrote:
> 
>> Allow the mpam_reprogram_ris_partid() function check for and return
> 
> function to check
> 
>> errors, and propagate MSC read and write errors from the lower level up.
>> This also covers the callers of this function: mpam_reset_ris() and
>> apply_config().
>>
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> One thing below to perhaps modify if you are respinning
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

Thanks!

>> ---
>>   drivers/resctrl/mpam_devices.c | 136 ++++++++++++++++++++++-----------
>>   1 file changed, 93 insertions(+), 43 deletions(-)
>>
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index 38450c55e45e..32088ad1d67e 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -1601,7 +1601,7 @@ void mpam_msmon_reset_mbwu(struct mpam_component *comp, struct mon_cfg *ctx)
>>   	}
>>   }
>>   
>> -static void mpam_reset_msc_bitmap(struct mpam_msc *msc, u16 reg, u16 wd)
>> +static int mpam_reset_msc_bitmap(struct mpam_msc *msc, u16 reg, u16 wd)
>>   {
>>   	u32 num_words, msb;
>>   	u32 bm = ~0;
>> @@ -1610,15 +1610,19 @@ static void mpam_reset_msc_bitmap(struct mpam_msc *msc, u16 reg, u16 wd)
>>   	lockdep_assert_held(&msc->part_sel_lock);
>>   
>>   	if (wd == 0)
>> -		return;
>> +		return 0;
>>   
>>   	/*
>>   	 * Write all ~0 to all but the last 32bit-word, which may
>>   	 * have fewer bits...
>>   	 */
>>   	num_words = DIV_ROUND_UP(wd, 32);
>> -	for (i = 0; i < num_words - 1; i++, reg += sizeof(bm))
>> -		__mpam_write_reg(msc, reg, bm);
>> +	for (i = 0; i < num_words - 1; i++, reg += sizeof(bm)) {
> 
> Not really related to what you are doing here, but if you like you could
> reduce the scope of i via
> 
> 	for (int i = 0;...
> 
> as it isn't used outside of this loop.

Yeah, true, but I'd rather keep it, otherwise I might get comments about 
unrelated changes ;-)

> 
>> +		int ret = __mpam_write_reg(msc, reg, bm);
>> +
>> +		if (ret)
>> +			return ret;
> Personally I don't like this style but feel free to ignore as this is

I know what you mean, I am always in conflict about the on-the-spot 
initialisation and the empty line requirement, tearing apart the error 
check here. Changed to what you suggested.

Thanks,
Andre.


> very much a personal taste thing. I'd do
> 		int ret;
> 
> 		ret = __mpam_write_reg(msc, reg, bm);
> 		if (ret)
> 			return ret;
> 	}
> just to keep the source of error and check for error next to each other.
> 
>> +	}
> 
> 


