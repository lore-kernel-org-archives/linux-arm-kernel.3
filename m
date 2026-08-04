Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10EB7C5518F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 08:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5mhlOrDqM6Abk6PXs0bs3f29urTtJZH384d8wUv/GGk=; b=Tt+tp8+75uw3AAur8sAaVXmrzL
	ffrXeUeV7oT+9xcnXL2DLnY9HrkjqreK3UhIGuoaAWkwk5cbOvH60SYsKTbawckYORSbtPVwYJqim
	egBZnM88UupkIDsdBYoycxGHTvvBs0iCZyRnh16//H7/ePy3fG+Z8tIeg5x+5VNbSYo4pvg5jb+UE
	aGu631UgbfV0aIrr59OBHMsHKOt40ALZXWvszZ5m7wsss8C2TnmGhKZ64hQlTdyEXJCd/KHUaJZGP
	hzsklYVs22tIWzfMzbvTi8pCo5DdR2N3owR6TmCAGeM3REMm51fDvg+yHVRCSD5VCqEsngWkMsPuu
	hwiqCDUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrAD0-00000001I0p-2Mg7;
	Tue, 04 Aug 2026 08:09:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrACx-00000001I0D-2uCY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 08:09:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC4C71476;
	Tue,  4 Aug 2026 01:09:01 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7D47B3F66F;
	Tue,  4 Aug 2026 01:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785830945; bh=ShDQQbYIjhdqcor+fZ2OMprDSF8Ka12pFJXpLv6w/AY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hDeyRq3ikSPeaORl4kB716ioUT6tUGo4up0DFO8+7M77+t6dAOxI7iPJqX3CPX9Xy
	 bteTJ6ZUDA+zlgTo0IJCdRKh5GsmUFpEHMWeVxd11wxuR+rx050a5pTiqfcrhhwoU4
	 b3v+W3RdAvboNIyFP+mZS9wxi68xyqxJl8y0lt8w=
Message-ID: <aa43700f-0fe5-48a2-ac25-33759186317d@arm.com>
Date: Tue, 4 Aug 2026 10:09:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/11] arm_mpam: change MPAM-Fb error IRQ to use a
 threaded IRQ handler
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
 <20260731170324.2927758-11-andre.przywara@arm.com>
 <20260803154611.00007d6d@oss.qualcomm.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260803154611.00007d6d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_010907_854797_49D6618C 
X-CRM114-Status: GOOD (  33.28  )
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

On 8/4/26 00:46, Jonathan Cameron wrote:
> On Fri, 31 Jul 2026 19:03:23 +0200
> Andre Przywara <andre.przywara@arm.com> wrote:
> 
>> When an MPAM MSC gets into an error condition, it can trigger an error
>> IRQ. We cannot really do much about those errors, but we at least query
>> and log the error, then disable MPAM functionality.
>>
>> This error report relies on reading the MSC's error status register
>> (ESR) in the current hard-IRQ handler, which is not possible for MPAM-Fb
>> based MSC accesses, since they involve mailbox routines that might sleep.
>> The same is true for clearing the interrupt at the source, which requires
>> an MSC access as well.
>>
>> When an MSC is using MPAM-Fb, change the error IRQ to use a threaded IRQ
>> handler, with an empty hard IRQ routine, and doing all the MSC accesses
>> (to access the status and disable the IRQ line) in the threaded part.
>> Also forbid per-CPU interrupts (PPIs) for MPAM-Fb, as we cannot use a
>> threaded IRQ here.
>>
>> The change in the actual IRQ handler is minimal, we just check for the
>> first MSC access error and bail out early. MMIO based MSCs keep using a
>> hard-IRQ handler, since they must be at least non-migrate-able when doing
>> MSC accesses, for the CPU affinity check to work.
>>
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> 
> A small thing inline about a refactor that I can't spot a reason for.
> May it's one of those cases where the code evolved into something that
> would benefit from another look.
> 
> Either way I'm fine with this
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> 
>> ---
>>   drivers/resctrl/mpam_devices.c | 52 +++++++++++++++++++++++++---------
>>   1 file changed, 39 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index ea08c12f717a..b238feb559d4 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -2741,19 +2755,19 @@ static irqreturn_t __mpam_irq_handler(int irq, struct mpam_msc *msc)
>>   			   msc->id, mpam_errcode_names[errcode], partid, pmg,
>>   			   ris);
>>   
>> -	/* Disable this interrupt. */
>> +out_disable:
>> +	/* Disable this interrupt. Ignore errors, we need to proceed anyway. */
>>   	mpam_disable_msc_ecr(msc);
>>   
>> -	/* Are we racing with the thread disabling MPAM? */
>> -	if (!mpam_is_enabled())
>> -		return IRQ_HANDLED;
>> -
>>   	/*
>> -	 * Schedule the teardown work. Don't use a threaded IRQ as we can't
>> -	 * unregister the interrupt from the threaded part of the handler.
>> +	 * Schedule the teardown work. We have to defer it as we can't
>> +	 * unregister the interrupt from the threaded part of a handler.
>> +	 * Check whether we are racing with the thread disabling MPAM.
>>   	 */
>> -	mpam_disable_reason = "hardware error interrupt";
>> -	schedule_work(&mpam_broken_work);
>> +	if (mpam_is_enabled()) {
>> +		mpam_disable_reason = "hardware error interrupt";
>> +		schedule_work(&mpam_broken_work);
>> +	}
> 
> Why the logic flip here?  (!mpam_is_enabled() and early return vs
> if (mpam_is_enabled())
> 
> It seems to be doing exactly the same.
> Is it to couple the comment more tightly with the code?
> 
> I don't mind it done this way but it is a reasonable amount of churn
> for no strong benefit that I can immediately spot.

Yes, this went through several reworks. I think in this case it's not 
really an error, so doesn't really warrant the early-error-return 
pattern. And it makes further extensions harder. If there is ever 
something to be added later, we would probably need to change this flow 
first.

Also I prefer this simpler logic of: if (mpam_enabled()) disable_it(). I 
think that's less twisted than:
	if (!mpam_enabled())
		return;
	Do_what_you_wanted_to_do_if_mpam_was_enabled().

But of course that's probably just a matter of preference. I changed it 
to what you suggested, mostly just to keep the current flow.

Cheers,
Andre


> 
>>   
>>   	return IRQ_HANDLED;
>>   }


