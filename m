Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C5D8C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 16:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=va4hEoVVnZxhPHxpMSlDZN7m5s0titWsto8y7/v9Cjw=; b=tZgnY5EDwnSEPIhZLWaWMi0fG2
	lYap7IACbMvwy/yVocKN5mdXsX41NTrWft+C9l4YQTZqsdEMqpE2VaqDpoSNR7qB1Zp+exUjONRFQ
	B7g/XAMrVOZzUrglmuorFZf7RDWwcHDfMT6FbeHoVRC09WbyviaHM4XIvvR4xqZsQrEzoWHFKq2jc
	/nBsllVuUldMqq2lP1fm/H+RAa0NIV5aSSJIvSwoZQlEhQw8fR1uG0eKvUq16C3cNl0pdSNIPJ2E8
	96dG9PbIOYQeK4napMPxsixsHotzGUmY7+Q2kBxDhrjfJc1XN1ar+CZmFhBWIkBfpmhmhErQ5lEKL
	z8EGjxUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x542A-0000000HCyD-0itG;
	Fri, 11 Sep 2026 16:23:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5427-0000000HCwv-2qsO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 16:23:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6ABE32BC3;
	Fri, 11 Sep 2026 09:23:18 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 19FF43F7B4;
	Fri, 11 Sep 2026 09:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789143802; bh=cF2rHoPHNtjoruLUsmFFA7ElnvzZvWiENPhyyCo2U5s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pw9zKi+/2eQ2NOfn6/sMAztLIfuDRe4HCfj8AQSTTYeoXZnCahELPnENpWUd4PbfF
	 fkzHla2qIVd0I3QS6KXvmciOV4HOpiZA6ExqiaqfYeD9NW784K5Pgeoph1Owv44hGR
	 zWnCmmi9zr6zlN8gyvxB8GbrjujNUqc6Lv8qWqhg=
Message-ID: <37db65c7-db4a-4085-a586-62931d73299f@arm.com>
Date: Fri, 11 Sep 2026 17:23:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 08/14] arm_mpam: propagate MSC access errors for
 interrupt control
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
 Niyas Sait <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
 Ritwick Sharma <ritwick.sharma@arm.com>, Gavin Shan <gshan@redhat.com>,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260911112835.714162-1-andre.przywara@arm.com>
 <20260911112835.714162-9-andre.przywara@arm.com>
 <89a13b60-a1fe-442f-ab0d-b0d37a118ad1@arm.com>
 <a305546a-29f4-45fb-a3e6-09a051733a2a@arm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <a305546a-29f4-45fb-a3e6-09a051733a2a@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_092323_813660_5FE2D638 
X-CRM114-Status: GOOD (  22.30  )
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

On 11/09/2026 17:19, Andre Przywara wrote:
> Hi Ben,
> 
> On 9/11/26 16:26, Ben Horgan wrote:
>> Hi Andre,
>>
>> On 11/09/2026 12:28, Andre Przywara wrote:
>>> Allow the functions dealing with interrupt registration and enablement
>>> to check for and return errors, and propagate MSC read and write errors
>>> from the lower level up.
>>> This does not cover the IRQ handler yet, as this needs some more
>>> attention.
>>>
>>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>>> Reviewed-by: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
>>
>> Commenting here as this is the last error propagation patch. I think we need a clean boundary for
>> the error propagation. As you said a while back I think we can propagate error for all non-static
>> functions from mpam_devices.c and the callers can discard the errors if appropriate. For instance,
>> mpam_reset_class_locked() should propagate any error.
> 
> So I checked all non-static functions in mpam_devices.c: most either don't deal with MSCs at all, or
> already propagate errors.
> The two outliers are mpam_disable(), which must be "void", due to it being called via DECLARE_WORK,
> and mpam_reset_class_locked(), as you write above. The latter is a bit sad, because the caller is
> void, so any errors would be discarded there anyway, but for the sake of completeness we should
> indeed propagate here.
> 
> And I guess it doesn't make sense to continue the vMSC or RIS list iterations after detecting the
> first error, but we just bail out immediately? Because any error would trigger mpam_disable() anyway?

Yeah, bailing early makes sense to me.

Thanks,

Ben

> 
> Cheers,
> Andre
> 
> 
>>
>> Thanks,
>>
>> Ben
>>
>>> ---
>>>   drivers/resctrl/mpam_devices.c | 31 +++++++++++++++----------------
>>>   1 file changed, 15 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>>> index 558efab75f911..eb26c25b9f970 100644
>>> --- a/drivers/resctrl/mpam_devices.c
>>> +++ b/drivers/resctrl/mpam_devices.c
>>> @@ -1105,7 +1105,9 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
>>>       }
>>>         /* Clear any stale errors */
>>> -    mpam_msc_clear_esr(msc);
>>> +    ret = mpam_msc_clear_esr(msc);
>>> +    if (ret)
>>> +        return ret;
>>>         spin_lock(&partid_max_lock);
>>>       mpam_partid_max = min(mpam_partid_max, msc->partid_max);
>>> @@ -2668,9 +2670,7 @@ static int mpam_enable_msc_ecr(void *_msc)
>>>   {
>>>       struct mpam_msc *msc = _msc;
>>>   -    __mpam_write_reg(msc, MPAMF_ECR, MPAMF_ECR_INTEN);
>>> -
>>> -    return 0;
>>> +    return __mpam_write_reg(msc, MPAMF_ECR, MPAMF_ECR_INTEN);
>>>   }
>>>     /* This can run in mpam_disable(), and the interrupt handler on the same CPU */
>>> @@ -2678,9 +2678,7 @@ static int mpam_disable_msc_ecr(void *_msc)
>>>   {
>>>       struct mpam_msc *msc = _msc;
>>>   -    __mpam_write_reg(msc, MPAMF_ECR, 0);
>>> -
>>> -    return 0;
>>> +    return __mpam_write_reg(msc, MPAMF_ECR, 0);
>>>   }
>>>     static irqreturn_t __mpam_irq_handler(int irq, struct mpam_msc *msc)
>>> @@ -2777,11 +2775,13 @@ static int mpam_register_irqs(void)
>>>                   return err;
>>>           }
>>>   -        mutex_lock(&msc->error_irq_lock);
>>> -        msc->error_irq_req = true;
>>> -        mpam_touch_msc(msc, mpam_enable_msc_ecr, msc);
>>> -        msc->error_irq_hw_enabled = true;
>>> -        mutex_unlock(&msc->error_irq_lock);
>>> +        scoped_guard(mutex, &msc->error_irq_lock) {
>>> +            msc->error_irq_req = true;
>>> +            err = mpam_touch_msc(msc, mpam_enable_msc_ecr, msc);
>>> +            if (err)
>>> +                return err;
>>> +            msc->error_irq_hw_enabled = true;
>>> +        }
>>>       }
>>>         return 0;
>>> @@ -2800,10 +2800,10 @@ static void mpam_unregister_irqs(void)
>>>           if (irq <= 0)
>>>               continue;
>>>   -        mutex_lock(&msc->error_irq_lock);
>>> +        guard(mutex)(&msc->error_irq_lock);
>>>           if (msc->error_irq_hw_enabled) {
>>> -            mpam_touch_msc(msc, mpam_disable_msc_ecr, msc);
>>> -            msc->error_irq_hw_enabled = false;
>>> +            if (!mpam_touch_msc(msc, mpam_disable_msc_ecr, msc))
>>> +                msc->error_irq_hw_enabled = false;
>>>           }
>>>             if (msc->error_irq_req) {
>>> @@ -2815,7 +2815,6 @@ static void mpam_unregister_irqs(void)
>>>               }
>>>               msc->error_irq_req = false;
>>>           }
>>> -        mutex_unlock(&msc->error_irq_lock);
>>>       }
>>>   }
>>>   
>>
> 


