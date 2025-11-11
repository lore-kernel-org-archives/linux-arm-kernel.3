Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA48CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 14:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YJClTiVhQO2lpOVkm3xLhfT6tH+P5ZaZ8U69qhtIJFM=; b=R5Nh7geeZfhEHexsZmvAmXY6M/
	x7Bz5U92xJ/JRLGK1N2bb8cgsKRdIfgn7hjZ3RMzg6evEe63oZaoiBROvk6rdHgDtHIKQy1vJ2BDW
	IFj1Ue7PNXzu63qDmZc1J7kb6BrIJFstw/+OjdrMUqbM5UGU2uVPBKSgBmDTmsLbkuvSnqjVK75/J
	8VDYrqoOD3bnKapeGIGhfxKukdoL58ckVoNn3NqUHgTUw2KRjgTcGTVqYW3nq/W6CIohp1IsbH+A4
	C+4ZRx18r3eresbgF7EVqgCTHKo+uchUs0k2zLxBiv/KQZTULGpeO5aA2rbaXgrgh1Mm32sZ2Wz5K
	wAfGSxXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIpAn-00000007Iqc-1EwV;
	Tue, 11 Nov 2025 14:16:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIpAl-00000007Iq4-0Qkw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 14:16:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 80DAB2F;
	Tue, 11 Nov 2025 06:16:30 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BCE293F63F;
	Tue, 11 Nov 2025 06:16:36 -0800 (PST)
Message-ID: <b9ecd05c-094a-42d3-83fd-27d73a4713ee@arm.com>
Date: Tue, 11 Nov 2025 14:16:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/15] coresight: trbe: Save and restore state across
 CPU low power state
To: James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Yabin Cui <yabinc@google.com>, Yuanfang Zhang <quic_yuanfang@quicinc.com>
References: <20251104-arm_coresight_path_power_management_improvement-v4-0-3d4bba674709@arm.com>
 <20251104-arm_coresight_path_power_management_improvement-v4-13-3d4bba674709@arm.com>
 <61dc6f04-41da-4272-82b1-1789201eb06d@linaro.org>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <61dc6f04-41da-4272-82b1-1789201eb06d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_061639_222124_591D4DF2 
X-CRM114-Status: GOOD (  22.10  )
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

On 10/11/2025 12:01, James Clark wrote:
> 
> 
> On 04/11/2025 3:21 pm, Leo Yan wrote:
>> From: Yabin Cui <yabinc@google.com>
>>
>> Similar to ETE, TRBE may lose its context when a CPU enters low power
>> state. To make things worse, if ETE is restored without TRBE being
>> restored, an enabled source device with no enabled sink devices can
>> cause CPU hang on some devices (e.g., Pixel 9).
>>
>> The save and restore flows are described in the section K5.5 "Context
>> switching" of Arm ARM (ARM DDI 0487 L.a). This commit adds save and
>> restore callbacks with following the software usages defined in the
>> architecture manual.
>>
>> Signed-off-by: Yabin Cui <yabinc@google.com>
>> Co-developed-by: Leo Yan <leo.yan@arm.com>
>> Signed-off-by: Leo Yan <leo.yan@arm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-trbe.c | 84 ++++++++++++++++++ 
>> +++++++++-
>>   1 file changed, 83 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/ 
>> hwtracing/coresight/coresight-trbe.c
>> index 
>> 3c82ab4394fde1e3dd4371a9b1703da4d8f6db9d..9888a153bc2f99b4826f6103bdbc12304c9c94cb 100644
>> --- a/drivers/hwtracing/coresight/coresight-trbe.c
>> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
>> @@ -116,6 +116,20 @@ static int trbe_errata_cpucaps[] = {
>>    */
>>   #define TRBE_WORKAROUND_OVERWRITE_FILL_MODE_SKIP_BYTES    256
>> +/*
>> + * struct trbe_save_state: Register values representing TRBE state
>> + * @trblimitr        - Trace Buffer Limit Address Register value
>> + * @trbbaser        - Trace Buffer Base Register value
>> + * @trbptr        - Trace Buffer Write Pointer Register value
>> + * @trbsr        - Trace Buffer Status Register value
>> + */
>> +struct trbe_save_state {
>> +    u64 trblimitr;
>> +    u64 trbbaser;
>> +    u64 trbptr;
>> +    u64 trbsr;
>> +};
>> +
>>   /*
>>    * struct trbe_cpudata: TRBE instance specific data
>>    * @trbe_flag        - TRBE dirty/access flag support
>> @@ -134,6 +148,7 @@ struct trbe_cpudata {
>>       enum cs_mode mode;
>>       struct trbe_buf *buf;
>>       struct trbe_drvdata *drvdata;
>> +    struct trbe_save_state save_state;
>>       DECLARE_BITMAP(errata, TRBE_ERRATA_MAX);
>>   };
>> @@ -1189,6 +1204,71 @@ static irqreturn_t arm_trbe_irq_handler(int 
>> irq, void *dev)
>>       return IRQ_HANDLED;
>>   }
>> +static int arm_trbe_save(struct coresight_device *csdev)
>> +{
>> +    struct trbe_cpudata *cpudata = dev_get_drvdata(&csdev->dev);
>> +    struct trbe_save_state *state = &cpudata->save_state;
>> +
>> +    if (cpudata->mode == CS_MODE_DISABLED)
>> +        return 0;
>> +
>> +    /*
>> +     * According to the section K5.5 Context switching, Arm ARM (ARM DDI
>> +     * 0487 L.a), the software usage VKHHY requires a TSB CSYNC 
>> instruction
>> +     * to ensure the program-flow trace is flushed, which has been 
>> executed
>> +     * in ETM driver.
>> +     */
>> +
>> +    /* Disable trace buffer unit */
>> +    state->trblimitr = read_sysreg_s(SYS_TRBLIMITR_EL1);
>> +    write_sysreg_s(state->trblimitr & ~TRBLIMITR_EL1_E, 
>> SYS_TRBLIMITR_EL1);
>> +
>> +    /*
>> +     * Execute a further Context synchronization event. Ensure the 
>> writes to
>> +     * memory are complete.
>> +     */
>> +    trbe_drain_buffer();
>> +
>> +    /* Synchronize the TRBE disabling */
>> +    isb();
> 
> Can we use set_trbe_disabled() here, and set_trbe_enabled() for restore 
> below. There is a bit of duplication and they do the same thing except 
> this version here always has trbe_drain_buffer() rather than it being 
> conditional. I'm not sure if that is correct as they should both be the 
> same?
> 
> set_trbe_disabled() already reads TRBLIMITR_EL1 so you can return it.

+1

>> +    if (trbe_needs_ctxt_sync_after_enable(cpudata))
>> +        isb();
> 
> Especially this double isb() part shouldn't be duplicated as that could 
> get broken in a refactor in the future.

+1

Suzuki

