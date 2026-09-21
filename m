Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0979EC982DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 09:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TmdEjNT3QsvLxGFQxg1V+0Owxm6zG0u/XRcs38Q6LjM=; b=dotOIexmGb9YRqdJ5o4HTFWzzK
	4X8lNNiZ4MEfte6Yn8/XZGyBSggnAqN/e+WDLHlui3P3dT/3B/AeHP4y+aowqRShONeJUNh/5gebp
	aP7vdvXqWD+cXaOW2UXY5o/Jd6FUt8l/pPRroLYGkj4ufH3rnnUbpN94c/j4qkFbzbh23H9VajYQn
	qv8CAzjSfazgkwwbiid18zHcU/rL3hWTd1lqtj5wI52ItEEQolAxoRXRCwymzBC1KGXm+8CMxBbi7
	IaO6kjIjFGuREOoC5ixO0aCsqAVhH1yzshQkNSmwHrjIzUSjo8i+q4tuhp6CiXlyOhdTEk6/NOXxk
	iI12JtIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8aOY-00000001WtH-2aSg;
	Mon, 21 Sep 2026 09:33:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8aOV-00000001WsC-2oZK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 09:33:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EAEA61476;
	Mon, 21 Sep 2026 02:32:58 -0700 (PDT)
Received: from [10.0.128.141] (unknown [10.0.128.141])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 28C9B3F86F;
	Mon, 21 Sep 2026 02:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789983182; bh=B+BCQeVg0IeeUhu6Ob/UgCt/CZY7OCEK8gMHWMyBohk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vrTxUkU5EokJyM+O6vocnZOre+9Hm/zL/psZb2j5wq0ib0aPS77g8TxaTl+R6pBo7
	 vxkpDKVN4HocH01hrrylZzzdL9upfpdvpXEealrDA1Ba5SMWmFOqqaqVjfxjeLR5jt
	 DSNnAGCwoigCPtBiotCwuNvfddJajT2mvtAGQIxM=
Message-ID: <65b0c03b-36b9-4e60-aa55-c3b4b85e21ee@arm.com>
Date: Mon, 21 Sep 2026 10:32:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 6/7] firmware: arm_rmm: Ensure the RMM has GPT entries
 for memory
Content-Language: en-GB
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
 will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
 aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260912083611.2513845-1-suzuki.poulose@arm.com>
 <20260912083611.2513845-7-suzuki.poulose@arm.com>
 <178978126543.2352296.12214136703168879825.b4-review@b4>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <178978126543.2352296.12214136703168879825.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_023303_794318_766BEE24 
X-CRM114-Status: GOOD (  27.94  )
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

On 19/09/2026 02:27, Jonathan Cameron wrote:
>> The RMM maintains the state of all the granules in the system to make
>> sure that the host is abiding by the rules. This state can be maintained
>> at different granularity, per page (TRACKING_FINE) or per region
>> (TRACKING_COARSE or TRACKING_INTERMEDIATE). The region size depends on the
>> underlying "RMI_GRANULE_SIZE". For a "coarse"/"intermediate" region, all pages
>> in the region must be of the same state, this implies we need to have "fine"
>> tracking for DRAM, so that we can delegate individual pages.
>>
>> For now we only support a statically carved out memory for tracking
>> granules for the "fine" regions. This can be extended in the future to
>> allow modifying the tracking granularity and remove the need for a
>> static allocation by the firmware.
>>
>> Similarly, the firmware may create L0 GPT entries describing the total
>> address space. But if we change the "PAS" (Physical Address Space) of a
>> granule, then the firmware may need to create L1 tables to track the PAS
>> at a finer granularity. Linux therefore checks if the platform firmware manages
>> the PAR region. i.e., the firmware is in charge of managing the L1 GPTs
>> (creation and the required memory for the GPT tables - via static carveouts)
>> without host intervention. Support for dynamic GPT creation by the host will be
>> added later.
>>
>> If the firmware requires us to manage the tracking or GPT memory, Deactivate
>> the RMM and reclaim any memory donated at RMM activation.
>>
>> Apply the same checks when hotplugged memory is brought online.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> [ Switch to RMI_GPT_L1_INFO for checking GPTs and deactivate RMM ]
>> Co-Developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> A few comments inline.
> 
> 
>> ---
>>   Changes since v17:
>>       * Move wrappers that may not be used elsewhere, out of arm-rmi-cmds.h
>>   Changes since v16:
>>       * Check fine tracking and create L1 GPTs for hotplug-added memory.
>>       * Clarify the L1 GPT setup and move the explanatory comment.
>>       * Switch to using RMI_GPT_INFO command for checking the GPTs.
>>       * Deactivate the RMM and reclaim the memory if we can't proceed.
>>   Changes since v15:
>>       * Skip firmware-reserved NOMAP memory in rmi_init_metadata()
>>       * Handle negative error codes from wrappers.
>>   Changes since v14:
>>       * Move the implementation into drivers/firmware/arm_rmm.
>>   Changes since v13:
>>       * Moved out of KVM
>> ---
>>   drivers/firmware/arm_rmm/rmi.c | 200 +++++++++++++++++++++++++++++++++
>>   include/linux/arm-rmi-cmds.h   |   2 +
>>   2 files changed, 202 insertions(+)
>>
>> diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/arm_rmm/rmi.c
>> index ecc89e91d264..583e1aca9b15 100644
>> --- a/drivers/firmware/arm_rmm/rmi.c
>> +++ b/drivers/firmware/arm_rmm/rmi.c
> 
> 
>> + */
>> +static inline long rmi_gpt_info(unsigned long start, unsigned long end,
> 
> Why inline vs letting compiler make it's mind up?
> Same in other places
> 
>> +				unsigned long *out_top,
>> +				unsigned long *out_gpt_par_state)
>> +{
>> +	struct arm_smccc_1_2_regs regs = {
>> +		SMC_RMI_GPT_INFO, start, end,
>> +	};
>> +
>> +	rmi_smccc_invoke(&regs);
>> +	if (regs.a0 != RMI_SUCCESS)
>> +		return regs.a0;
>> +
>> +	if (out_top)
>> +		*out_top = regs.a1;
>> +	if (out_gpt_par_state)
>> +		*out_gpt_par_state = regs.a2;
>> +
>> +	return RMI_SUCCESS;
>> +}
> 
> 
> 
>>   static int __init arm64_init_rmi(void)
>>   {
>>   	int ret;
>> @@ -786,8 +970,24 @@ static int __init arm64_init_rmi(void)
>>   	if (ret) {
>>   		pr_err("RMM activate failed\n");
>>   		ret = ret < 0 ? ret : -ENXIO;
>> +		return ret;
> 
> Why did this change?

Rebase messed up. I will restore it.

> 
>>   	}
>>   
>> +	ret = rmi_init_metadata();
>> +	if (ret)
> 
> And this is hitting another bit of guidance in cleanup.h.
> Functions shouldn't be mixing __free and friends with
> gotos.  Again, not a bug here but there are large ugly
> monsters around this stuff, hence the blanket guidance.
> I haven't thought that hard on how you avoid it here, but
> usually it's a combination of suitable helpers and wrappers
> and resulting code is often more readable as a result.
> 

I will see if I can improve it.

Cheers
Suzuki


