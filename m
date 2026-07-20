Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CCB9C44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 15:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5eL2/hlhR0h6mB5FNRsuKpoiCOudunr1kmgotOxjuIE=; b=jgeQCFlVbcNmxoc1Dhq+stiynd
	174gT7Sqz1p9O+pzwEPMz5fqmMMT4etY3wDTzGb+HF+R14oh7iXlHjoIQqRGC2eY+ULR7EB62yzu7
	ZoaIebJHCcF+eo/I3MQTseVm3OgI+WF8Fm59Z9/ML0YmoUljFIc14OlS8Su7dzco8P+0xjS7r1jKb
	5JV1p+6tCFswNN2WWCAf0U9W88Ebk+ljS53BduruMu/elRLZPvnuoqk4EfWXF5WL3QK2E4F7+oZY2
	3wcGdVDLiuXm2ZGorwzv2q7YeCESQz9l7H2VYtNeFvArO0kAkeA6yuc+KDF3DzGeHgvt6fz1jyf3t
	y1GtNjeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqO2-00000007HnN-3j35;
	Mon, 20 Jul 2026 15:58:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqO0-00000007HmU-2G94
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 15:58:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 917581476;
	Mon, 20 Jul 2026 08:58:26 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5E4733FA1F;
	Mon, 20 Jul 2026 08:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784563110; bh=T0i5/VK4eXd5fjFHT3NRijuMkPzh2ODPJtS9Dxu+TyQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=G48JwyriVe2354tw2abbvCHRjIosDv57WtMjqkGkc27eycSt1DxErU8ZRCA8lXMUh
	 474u8p2INVroyy5GoycCYBc0DtR9ylpyn/1qbZguCDTHYddafqif88M6VLl23g4O7i
	 0+sDC3uVGI/mrXjI3CDf+jK9kTV7um3b2VrE3TFQ=
Message-ID: <e7bd727f-0078-4292-84a0-5eb44108d1bf@arm.com>
Date: Mon, 20 Jul 2026 17:58:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/16] arm_mpam: propagate MSC read errors for wrapper
 functions
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
 Niyas Sait <niyas.sait@arm.com>, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260710144520.917375-1-andre.przywara@arm.com>
 <20260710144520.917375-3-andre.przywara@arm.com>
 <20260710112158.0000490d@oss.qualcomm.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260710112158.0000490d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_085832_660477_44C80C07 
X-CRM114-Status: GOOD (  28.74  )
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

On 7/10/26 20:21, Jonathan Cameron wrote:
> On Fri, 10 Jul 2026 16:45:06 +0200
> Andre Przywara <andre.przywara@arm.com> wrote:
> 
>> Allow the wrapper functions for IDR and ESR accesses to return an
>> error, and propagate read errors from the lower level up.
>>
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Hi Andre,
> 
> Just a few superficial code style comments.
> 
> Thanks,
> 
> Jonathan
> 
>> ---
>>   drivers/resctrl/mpam_devices.c | 53 ++++++++++++++++++++++++----------
>>   1 file changed, 38 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index df14b4513382..8fd2c38c821c 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -247,27 +247,38 @@ static bool mpam_msc_check_aidr(struct mpam_msc *msc)
>>   	return true;
>>   }
>>   
>> -static u64 mpam_msc_read_idr(struct mpam_msc *msc)
>> +static int mpam_msc_read_idr(struct mpam_msc *msc, u64 *res)
>>   {
>>   	u32 idr_high = 0, idr_low;
>> +	int ret;
>>   
>>   	lockdep_assert_held(&msc->part_sel_lock);
>>   
>> -	mpam_read_partsel_reg(msc, IDR, &idr_low);
>> +	ret = mpam_read_partsel_reg(msc, IDR, &idr_low);
>> +	if (ret)
>> +		return ret;
>> +
>>   	if (FIELD_GET(MPAMF_IDR_EXT, idr_low))
>> -		mpam_read_partsel_reg(msc, IDR + 4, &idr_high);
>> +		ret = mpam_read_partsel_reg(msc, IDR + 4, &idr_high);
>> +	if (ret)
>> +		return ret;
> 
>  From a readability point of view, I'd indent the if (ret) as well
> given that will then make it visually clear the check only applies
> when the if is taken.
> 
> 	if (FIELD_GET()) {
> 		ret = mpam_read_partsel_reg(msc, IDR + 4 &idr_high);
> 		if (ret)
> 			return ret;
> 	}

Sure, done. Was indeed not consistent with other places.

>> +
>> +	*res = ((u64)idr_high << 32) | idr_low;
>>   
>> -	return ((u64)idr_high << 32) | idr_low;
>> +	return 0;
>>   }
>>   
>> -static void mpam_msc_clear_esr(struct mpam_msc *msc)
>> +static int mpam_msc_clear_esr(struct mpam_msc *msc)
>>   {
>>   	u32 esr_low;
>> +	int ret;
>>   
>> -	__mpam_read_reg(msc, MPAMF_ESR, &esr_low);
>> +	ret = __mpam_read_reg(msc, MPAMF_ESR, &esr_low);
>> +	if (ret)
>> +		return ret;
>>   
>>   	if (!esr_low)
>> -		return;
>> +		return 0;
>>   
>>   	/*
>>   	 * Clearing the high/low bits of MPAMF_ESR can not be atomic.
>> @@ -277,18 +288,30 @@ static void mpam_msc_clear_esr(struct mpam_msc *msc)
>>   	 */
>>   	if (msc->has_extd_esr)
>>   		__mpam_write_reg(msc, MPAMF_ESR + 4, 0);
>> +
> 
> Might be valid, but to me that smells like an unrelated cleanup
> that shouldn't really be in a patch doing more meaningful work.  Perhaps

I guess you mean the added line? That looks like a rebasing artefact, 
sorry for that. Will remove it.

> makes sense when you circle back to do writes.  BTW, I'm not sure
> there is real benefit in separate patches doing reads from those doing writes!

The reason was just to split them up in a) smaller, but b) still 
bisectable chunks, that c) ideally group similar change patterns, to 
help review. As reads require an interface change while writes do not, I 
decided to split them up this way.

I didn't really think too hard to find a better grouping (I guess any 
alternative would be subject to discussion as well), but instead 
focussed on generating smallish patches that allow reviewing a bunch of 
them without having to skip lunch ;-)

Cheers,
Andre

> Mind you I haven't read all the way through yet, so maybe I'm missing some
> subtlety.
> 
>>   	__mpam_write_reg(msc, MPAMF_ESR, 0);
>> +
>> +	return 0;
>>   }
>>   
>> -static u64 mpam_msc_read_esr(struct mpam_msc *msc)
>> +static int mpam_msc_read_esr(struct mpam_msc *msc, u64 *res)
>>   {
>>   	u32 esr_high = 0, esr_low;
>> +	int ret;
>>   
>> -	__mpam_read_reg(msc, MPAMF_ESR, &esr_low);
>> -	if (msc->has_extd_esr)
>> -		__mpam_read_reg(msc, MPAMF_ESR + 4, &esr_high);
>> +	ret = __mpam_read_reg(msc, MPAMF_ESR, &esr_low);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (msc->has_extd_esr) {
>> +		ret = __mpam_read_reg(msc, MPAMF_ESR + 4, &esr_high);
>> +		if (ret)
>> +			return ret;
> 
> So this is the style I suggest above. Good, but check for consistency.
> It may feel like a really small thing (and it is :) but keeping code
> very consistent helps a surprising amount when it comes to readability.
> 
>> +	}
>> +
>> +	*res = ((u64)esr_high << 32) | esr_low;
>>   
>> -	return ((u64)esr_high << 32) | esr_low;
>> +	return 0;
>>   }
> 


