Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C89C54F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 16:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=frlyNymqGXt0pnIVkKKvRVE5D0NMSUG3wLunq5u5Wxo=; b=katIJ4tSbII7Fn1ftljX6wZS91
	0Nb9QWAgbiFErhrdiSiAfXq37nXRkoklWGeH60P45dUnsuT9uxvpWKFP39LabBjabwcm++wkyb1xt
	RhUA0a2J1vDrLOgG3xKECAKUdW1tnjnhMXDeHQNDrpn8nj08HSAEh4LMnkuIJEtjaB69iN03PvXug
	WgivoaKpASR7FHOXN5Yyk9OOOThImQlXSkshohbJ8vQNnrAwkrYH0ejE/WdMjCAlTeY+ko/rmHCjR
	2mCKL6/wEVcXEoNSXnwVZpfD2sXgldSDpNeE2SsafbKbP6+8Qj8Cr+czgZDAm3v8EYia/PuykJTGT
	zci+vOFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpqXK-0000000DBrM-1JAu;
	Fri, 31 Jul 2026 16:56:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpqXG-0000000DBqi-1WRr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 16:56:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1DD16204C;
	Fri, 31 Jul 2026 09:56:33 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DC4183F86F;
	Fri, 31 Jul 2026 09:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785516997; bh=CMU0imILpAq7DOm5KpqtMDsZevIKfaMPIhQP5iA97/c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oRRI93TWNDB5PU4eFPBQBy8m/ninfDZDBACMIedG4Hd/FEKhh6c2Pj7slJgZYupBU
	 cxKigUPRsDGsCZ/W8i9jZChM4CftbRfew/ggLzv/magOLzTwC8AAfModwiwWMM8gzv
	 jC2TpCatM1u9dZaLPv9vwfVOeFBpcuWcuvm8asHU=
Message-ID: <9431b95f-89c4-498a-87bd-ff4583124f0a@arm.com>
Date: Fri, 31 Jul 2026 18:56:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/10] arm_mpam: change MPAM-Fb error IRQ to use a
 threaded IRQ handler
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
 Niyas Sait <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
 Ritwick Sharma <ritwick.sharma@arm.com>, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260730152539.2712312-1-andre.przywara@arm.com>
 <20260730152539.2712312-10-andre.przywara@arm.com>
 <0b190985-3a71-43fb-9530-d6b50faf2e27@arm.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <0b190985-3a71-43fb-9530-d6b50faf2e27@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_095638_872598_DAEC3BE9 
X-CRM114-Status: GOOD (  29.80  )
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

On 7/31/26 15:33, Ben Horgan wrote:
> Hi Andre,
> 
> On 7/30/26 16:25, Andre Przywara wrote:
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
>> The change is minimal, we just check for the first MSC access error and
>> bail out early. MMIO based MSCs keep using a hard-IRQ handler, since
>> they must be at least non-migrate-able when doing MSC accesses, for the
>> CPU affinity check to work.
>> Also forbid per-CPU interrupts (PPIs) for MPAM-Fb, as we cannot use a
>> threaded IRQ here.
>>
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>> ---
>>   drivers/resctrl/mpam_devices.c | 64 ++++++++++++++++++++++++++--------
>>   1 file changed, 49 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index daaf3cf48475..606ae4af2be9 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -2660,24 +2660,38 @@ static int mpam_disable_msc_ecr(void *_msc)
>>   	return 0;
>>   }
>>   
>> +/*
>> + * This will run as the threaded IRQ handler part when using MPAM-Fb, but
>> + * as the sole hard-IRQ handler for MMIO based accesses.
>> + */
>>   static irqreturn_t __mpam_irq_handler(int irq, struct mpam_msc *msc)
>>   {
>>   	u64 reg;
>> +	int ret;
>>   	u16 partid;
>>   	u8 errcode, pmg, ris;
>>   
>> -	if (WARN_ON_ONCE(!msc) ||
>> +	if (WARN_ON_ONCE(!msc))
>> +		return IRQ_NONE;
>> +
>> +	if (msc->iface == MPAM_IFACE_MMIO &&
>>   	    WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(),
>>   					   &msc->accessibility)))
>>   		return IRQ_NONE;
>>   
>> -	mpam_msc_read_esr(msc, &reg);
>> +	ret = mpam_msc_read_esr(msc, &reg);
>> +	if (ret) {
>> +		pr_err_ratelimited("unknown error irq from msc:%u\n", msc->id);
>> +
>> +		/* Try out best here ... */
>> +		goto out_disable;
>> +	}
>>   
>>   	errcode = FIELD_GET(MPAMF_ESR_ERRCODE, reg);
>>   	if (!errcode)
>>   		return IRQ_NONE;
>>   
>> -	/* Clear level triggered irq */
>> +	/* Clear level triggered irq. Ignore errors, we need to proceed. */
>>   	mpam_msc_clear_esr(msc);
>>   
>>   	partid = FIELD_GET(MPAMF_ESR_PARTID_MON, reg);
>> @@ -2688,19 +2702,19 @@ static irqreturn_t __mpam_irq_handler(int irq, struct mpam_msc *msc)
>>   			   msc->id, mpam_errcode_names[errcode], partid, pmg,
>>   			   ris);
>>   
>> -	/* Disable this interrupt. */
>> +out_disable:
>> +	/* Disable this interrupt. Ignore errors, we need to proceed anyway. */
>>   	mpam_disable_msc_ecr(msc);
> 
> If we fail to disable the interrupt then I don't think we can claim we handled it.
> Shouldn't we, after scheduling broken work, return IRQ_NONE?

That's tricky, I'd say. IRQ_NONE means the handler is not recognising 
the interrupt, so it probably becomes spurious, which doesn't sound right.
So I think IRQ_HANDLED is the least worst of the two. We are somewhat 
doomed, but eventually mpam_disable() will unregister the IRQ, so it 
won't fire again. And we protect again repeated calls to mpam_disable(), 
should the IRQ handler be called again.

Cheers,
Andre

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
>>   
>>   	return IRQ_HANDLED;
>>   }
>> @@ -2736,6 +2750,11 @@ static int mpam_register_irqs(void)
>>   		/* The MPAM spec says the interrupt can be SPI, PPI or LPI */
>>   		/* We anticipate sharing the interrupt with other MSCs */
>>   		if (irq_is_percpu(irq)) {
>> +			if (msc->iface != MPAM_IFACE_MMIO) {
>> +				dev_err(&msc->pdev->dev,
>> +					"Only MMIO MSCs can use per-CPU interrupts\n");
>> +				return -EINVAL;
>> +			}
>>   			err = request_percpu_irq(irq, &mpam_ppi_handler,
>>   						 "mpam:msc:error",
>>   						 msc->error_dev_id);
>> @@ -2747,9 +2766,24 @@ static int mpam_register_irqs(void)
>>   					       &_enable_percpu_irq, &irq,
>>   					       true);
>>   		} else {
>> -			err = devm_request_irq(&msc->pdev->dev, irq,
>> -					       &mpam_spi_handler, IRQF_SHARED,
>> -					       "mpam:msc:error", msc);
>> +			irq_handler_t hard, threaded;
>> +
>> +			/*
>> +			 * MPAM-Fb needs a sleepable context for the MSC
>> +			 * accesses, whereas MMIO requires at least a
>> +			 * non-migrateable context for the processor ID check.
>> +			 */
>> +			if (msc->iface == MPAM_IFACE_MMIO) {
>> +				hard = &mpam_spi_handler;
>> +				threaded = NULL;
>> +			} else {
>> +				hard = NULL;
>> +				threaded = &mpam_spi_handler;
>> +			}
>> +			err = devm_request_threaded_irq(&msc->pdev->dev, irq,
>> +							hard, threaded,
>> +							IRQF_SHARED | IRQF_ONESHOT,
>> +							"mpam:msc:error", msc);
>>   			if (err)
>>   				return err;
>>   		}
> 


