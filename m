Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 806E1C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 15:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aCSHNBSR/zc07b6eK8axuoyED9kemV5KakmrqNmNy6c=; b=W8fhL7J+sEo8rSQKL4M3qmum/g
	c84YKpZloybZoQQJaM8wesiWETPGD2YOm7PSmX4iGPesVNHLgPx0a8c+ZRONsvvTcEGDZHsWfukA9
	F/8aO/k/sWIQvFz5s3lR5th1bUdo/8Oq/m83u4ydPBAtxPbOSML0qN6kD127Zc9yghyyOA1lhP5g3
	ZJzhBwvC85712Bl6o4cMeCoooy9OjjY++xK49jkVL0AghMKv9T8WLsFjyB7Yl0c/x4GtH+Q1oc4ow
	QcvFNpOWBl7YqZbcVqk6DXuXkrZv4XxtXT7y0epvzukX4uo8O/RpG7SeFvnKH1yCsaKG69+IIKZoA
	v8BDmnrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqNS-00000007HcH-21t0;
	Mon, 20 Jul 2026 15:57:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqNP-00000007Hc2-3mEs
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Jul 2026 15:57:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=aCSHNBSR/zc07b6eK8axuoyED9kemV5KakmrqNmNy6c=; b=LcF/HoS2o2vfnGBq9Ight0YWEf
	5qs4C7/rgG3Pv67khJMSUHRaJqDjIHoYFDeoMagQKtVpGFKzsdNcqzZm3C/o6yUd7bn8Gq6vdcyjk
	OddZr2+39I2RronuIZTzAIXaV+NXvbnJHU9YsMVUdN0Z60+HZvzkc6H25MXMIIzDud7aBZtPi8pgt
	mmly16tNyP6RABK+ce1TCaBexkR8XfVvUPlaEt58S+MB8oQJSYrcCGqmInNagz/sy5oHuUcK2yf3Y
	Ef+NwzrQjqDrKp9HtyYCIEKURsUGb1B2dXD75OWC6819a9PASn6z+KslG6nA4js3pVQxAmKaMaGJf
	qPS7uVCw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wlqNM-0000000GlHb-0dr1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 15:57:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 18C4E143D;
	Mon, 20 Jul 2026 08:57:45 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A33083F86F;
	Mon, 20 Jul 2026 08:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784563069; bh=9ww7f0PYnEgmYOOmpY2ymfpW2dHK2p9Smdx186oiZO4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SkLsPBP6cBYQTQTr/KYiC8ZO+TW/7yYvMMnaY48czCW5eKskuOt2M07IgTpJ5JNGS
	 v5KCrNYJKtF0rq5GsicBxp6y46Y4sTPmRVfC81dRhJpNmeatpgMBgIk7c2aIPEpPSL
	 fafQP22w5+EdkguH26ftPb91Zy3qr0yzBGv5+Vn4=
Message-ID: <7cf37e20-b62c-4a42-8c10-8db5a5b4cf44@arm.com>
Date: Mon, 20 Jul 2026 17:57:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/16] arm_mpam: __ris_msmon_read(): get rid of nrdy
 special handling
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
 <20260710144520.917375-8-andre.przywara@arm.com>
 <20260710115656.00001345@oss.qualcomm.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260710115656.00001345@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_165752_952864_B422763E 
X-CRM114-Status: GOOD (  29.16  )
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

On 7/10/26 20:56, Jonathan Cameron wrote:
> On Fri, 10 Jul 2026 16:45:11 +0200
> Andre Przywara <andre.przywara@arm.com> wrote:
> 
>> Although so far MSC accesses couldn't fail, there is one special
>> condition that would create an error: when the MBWU counter wouldn't be
>> able to read a stable value, we were setting bit 63 to mark this value
>> as unstable, and return this as an error later.
>> Now since the functions can return a proper error value, we can get rid of
>> this kludge and use the return value directly.
>>
>> Remove the "nrdy" error flag variable, and assign -EBUSY to "ret" to handle
>> this case.
>>
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Hi Andre
> 
> I'm still fussing about code flow and style :(
> 
> Obviously none of this is that important, but it does help make
> the code more maintainable in the long run.
> 
> Jonathan
> 
>> ---
>>   drivers/resctrl/mpam_devices.c | 38 +++++++++++++++-------------------
>>   1 file changed, 17 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index 84a8715464be..530ac0fe97b5 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -1306,7 +1306,6 @@ static void __ris_msmon_read(void *arg)
>>   	u64 now;
>>   	int ret;
>>   	u32 now32;
>> -	bool nrdy = false;
>>   	bool config_mismatch;
>>   	bool overflow = false;
>>   	struct mon_read *m = arg;
>> @@ -1371,14 +1370,18 @@ static void __ris_msmon_read(void *arg)
>>   	switch (m->type) {
>>   	case mpam_feat_msmon_csu:
>>   		ret = mpam_read_monsel_reg(msc, CSU, &now32);
>> +		if (!ret) {
>> +			if ((now32 & MSMON___NRDY))
>> +				ret = -EBUSY;
>> +
>> +			if (mpam_has_quirk(IGNORE_CSU_NRDY, msc) &&
>> +			    m->waited_timeout)
>> +				ret = 0;
> Whilst it is from existing code, this pattern of set and error then clear it
> is less than ideal.  Maybe
> 
> 			if ((now32 & MSMON___NRDY) &&
> 			    !(mpam_has_quirk(IGNORE_CS_NRDY, MSC && m->waited_timeout))
> 				ret = -EBUSY;
> 
> is clearer as that odd intermediate state of ret never happens.

Is it? I see where you are coming from, and I actually had it like this 
before, but I found this combination of conditions harder to read. Also 
this is a quirk, so an exception, and I think the extra check makes this 
clearer that this is some unfortunate mishap we don't really want, but 
have to deal with.

But it's of course easy to change ...

> 
>> +		}
>>   		if (ret)
>>   			goto out_unlock;
>> -		nrdy = now32 & MSMON___NRDY;
>> -		now = FIELD_GET(MSMON___VALUE, now32);
>> -
>> -		if (mpam_has_quirk(IGNORE_CSU_NRDY, msc) && m->waited_timeout)
>> -			nrdy = false;
>>   
>> +		now = FIELD_GET(MSMON___VALUE, now32);
>>   		break;
>>   	case mpam_feat_msmon_mbwu_31counter:
>>   	case mpam_feat_msmon_mbwu_44counter:
>> @@ -1394,9 +1397,11 @@ static void __ris_msmon_read(void *arg)
>>   				now = FIELD_GET(MSMON___L_VALUE, now);
>>   		} else {
>>   			ret = mpam_read_monsel_reg(msc, MBWU, &now32);
>> +			if (!ret && (now32 & MSMON___NRDY))
>> +				ret = -EBUSY;
>>   			if (ret)
>>   				goto out_unlock;
>> -			nrdy = now32 & MSMON___NRDY;
>> +
>>   			now = FIELD_GET(MSMON___VALUE, now32);
>>   		}
>>   
>> @@ -1404,9 +1409,6 @@ static void __ris_msmon_read(void *arg)
>>   		    m->type != mpam_feat_msmon_mbwu_63counter)
>>   			now *= 64;
>>   
>> -		if (nrdy)
>> -			break;
>> -
>>   		mbwu_state = &ris->mbwu_state[ctx->mon];
>>   
>>   		if (overflow)
>> @@ -1419,22 +1421,16 @@ static void __ris_msmon_read(void *arg)
>>   		now += mbwu_state->correction;
>>   		break;
>>   	default:
>> -		m->err = -EINVAL;
>> +		ret = -EINVAL;
>>   	}
>> -	mpam_mon_sel_unlock(msc);
>> -
>> -	if (nrdy)
>> -		m->err = -EBUSY;
>> -
>> -	if (!m->err)
>> -		*m->val += now;
>> -
>> -	return;
>>   
>>   out_unlock:
>>   	mpam_mon_sel_unlock(msc);
>>   
>> -	m->err = ret;
>> +	if (ret)
>> +		m->err = ret;
>> +	else
>> +		*m->val += now;
> 
> If you do the earlier suggestion of ACQUIRE() this all get simpler, but if you do keep
> this, then burn a line or two of code to make it obvious what is error and what isn't.
> 
> 	if (ret) {
> 		m->err = ret;
> 		return;
> 	}
> 
> 	*m->val += now;
>>   }
> 

So I started to put scoped_guard's and ACQUIRE() everywhere now, will 
see how this turns out.

Cheers,
Andre


