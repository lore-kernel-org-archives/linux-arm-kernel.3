Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B0010F2848
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 15:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Z8Qe26KQx9x2Tka4TfS8zhPGh0H+CNCLVz/DV6cT7w=; b=VQON8KYoDqZShkNL/H2QlsZ0hB
	zw4voK2PDLxKPGMLLw8YhQ7W7WqELCMlNmqOGkHgx6JGHjkaL1F0LhiXkNH9UYOwehZ6ynIgI/ZTG
	pRELONLzTC89rcfFqeZHm3qVzD2nNbW2emWkwJOC/yMIcM40GPgKTgKNrkN9utdLpzXAshPuGA47U
	Rw5O8ERNRJhjo4R6R+efeviejaQkt88SniWjccRuiIE+ogdmxWo0+iuyy0rYlLmOj5peUbvLhQTqo
	9fblC096cTbSS2QlnKqPLPGSNpVK5YCE6IqG9GMCMqrhm5GYgzTk5YRDrQ1XJBJlI3OYv/7RrV+nm
	QbMg2P4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w69Q9-00000007ikT-3AEf;
	Fri, 27 Mar 2026 15:48:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w69Q6-00000007ijc-1dH4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 15:48:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DCFBC35CF;
	Fri, 27 Mar 2026 08:48:14 -0700 (PDT)
Received: from [10.1.196.96] (eglon.cambridge.arm.com [10.1.196.96])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E83D23FBF8;
	Fri, 27 Mar 2026 08:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774626500; bh=Mz0of4dB4grzS8/sla4sFrQXaHoAg9COSMULoORc3kw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RzN0SxWsNzrcmP4pXR5jI7uKag835WGhWZuJJyQPo1rBbmVBUKlWR4WGL1bWOx4YY
	 hA3ek6ETjh8Dq810bqwT4xU1sBPhwj/yhwkA2/z3/Nc6j3T4aLGDvYqNrpqn8jNHTf
	 fj0EFKu7pb6lxrKbfGn5uFkfgQ1sGCqe8CGgzcVY=
Message-ID: <50f7e984-0418-4538-b735-48047e5ccc8a@arm.com>
Date: Fri, 27 Mar 2026 15:48:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 36/40] arm_mpam: Add workaround for T241-MPAM-1
To: Gavin Shan <gshan@redhat.com>, Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, jonathan.cameron@huawei.com, kobak@nvidia.com,
 lcherian@marvell.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, peternewman@google.com,
 punit.agrawal@oss.qualcomm.com, quic_jiles@quicinc.com,
 reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev,
 zengheng4@huawei.com, linux-doc@vger.kernel.org,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20260313144617.3420416-1-ben.horgan@arm.com>
 <20260313144617.3420416-37-ben.horgan@arm.com>
 <7b73d10e-4bfd-434f-b05f-25c4859a7abd@redhat.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <7b73d10e-4bfd-434f-b05f-25c4859a7abd@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_084822_529183_3059BFBE 
X-CRM114-Status: GOOD (  23.41  )
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

Hi Gavin,

On 24/03/2026 04:16, Gavin Shan wrote:
> On 3/14/26 12:46 AM, Ben Horgan wrote:
>> From: Shanker Donthineni <sdonthineni@nvidia.com>
>>
>> The MPAM bandwidth partitioning controls will not be correctly configured,
>> and hardware will retain default configuration register values, meaning
>> generally that bandwidth will remain unprovisioned.
>>
>> To address the issue, follow the below steps after updating the MBW_MIN
>> and/or MBW_MAX registers.
>>
>>   - Perform 64b reads from all 12 bridge MPAM shadow registers at offsets
>>     (0x360048 + slice*0x10000 + partid*8). These registers are read-only.
>>   - Continue iterating until all 12 shadow register values match in a loop.
>>     pr_warn_once if the values fail to match within the loop count 1000.
>>   - Perform 64b writes with the value 0x0 to the two spare registers at
>>     offsets 0x1b0000 and 0x1c0000.
>>
>> In the hardware, writes to the MPAMCFG_MBW_MAX MPAMCFG_MBW_MIN registers
>> are transformed into broadcast writes to the 12 shadow registers. The
>> final two writes to the spare registers cause a final rank of downstream
>> micro-architectural MPAM registers to be updated from the shadow copies.
>> The intervening loop to read the 12 shadow registers helps avoid a race
>> condition where writes to the spare registers occur before all shadow
>> registers have been updated.

> One question below.
> 
> Reviewed-by: Gavin Shan <gshan@redhat.com>


>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index e66631f3f732..b1753498f07f 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -630,7 +640,45 @@ static struct mpam_msc_ris *mpam_get_or_create_ris(struct mpam_msc
>> *msc,
>>       return ERR_PTR(-ENOENT);
>>   }
>>   +static int mpam_enable_quirk_nvidia_t241_1(struct mpam_msc *msc,
>> +                       const struct mpam_quirk *quirk)
>> +{
>> +    s32 soc_id = arm_smccc_get_soc_id_version();
>> +    struct resource *r;
>> +    phys_addr_t phys;
>> +
>> +    /*
>> +     * A mapping to a device other than the MSC is needed, check
>> +     * SOC_ID is  NVIDIA T241 chip (036b:0241)
>> +     */
>> +    if (soc_id < 0 || soc_id != SMCCC_SOC_ID_T241)
>> +        return -EINVAL;
>> +
>> +    r = platform_get_resource(msc->pdev, IORESOURCE_MEM, 0);
>> +    if (!r)
>> +        return -EINVAL;
>> +
>> +    /* Find the internal registers base addr from the CHIP ID */
>> +    msc->t241_id = T241_CHIP_ID(r->start);
>> +    phys = FIELD_PREP(GENMASK_ULL(45, 44), msc->t241_id) | 0x19000000ULL;
>> +
>> +    t241_scratch_regs[msc->t241_id] = ioremap(phys, SZ_8M);
>> +    if (WARN_ON_ONCE(!t241_scratch_regs[msc->t241_id]))
>> +        return -EINVAL;
> 
> Those IO regions aren't unmapped when the MSCs are removed. I guess it would be
> something to be improved? :-)

It's just leaking some VA space in the unlikely event the error interrupt goes off.
That is never expected to happen - all the errors indicate a software bug, so its
not a case of being unlucky. (This assumes T241 supports the error interrupt!).

Adding some teardown would just be for this erratum, I expect it to be the only one
that needs to map some other device to poke at. I'm not sure its worth it.

I'm also very nervous changing this quirk as its difficult for me to test!


>> +
>> +    pr_info_once("Enabled workaround for NVIDIA T241 erratum T241-MPAM-1\n");
>> +
>> +    return 0;
>> +}
>> +
>>   static const struct mpam_quirk mpam_quirks[] = {
>> +    {
>> +    /* NVIDIA t241 erratum T241-MPAM-1 */
>> +    .init       = mpam_enable_quirk_nvidia_t241_1,
>> +    .iidr       = MPAM_IIDR_NVIDIA_T241,
>> +    .iidr_mask  = MPAM_IIDR_MATCH_ONE,
>> +    .workaround = T241_SCRUB_SHADOW_REGS,
> 
> Perhaps we need a more leading space for every line in the above block.

Sure, done locally.


>> +    },
>>       { NULL } /* Sentinel */
>>   };

Thanks,

James

