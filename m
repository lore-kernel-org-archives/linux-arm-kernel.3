Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE63C9831E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 23:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MiIjojAjmMaUfc8kyT2uoWNcTnP/qYYCfo0ShEyxvSA=; b=YqyQqeEUyE43YtrVPmAQETtXxt
	wX2oJzuSCXUwdT+AX7oGx2JVsQ5FipnQwSs7GqTJFEzMRJ4u1mj1dvXeBzU5VcIhTpK1wAEuhmLGi
	NFfu7Qi2QvMXKqIlftzERhzvXOGsQIW7a3ac1IGyfmCUr5pDpbflKxkQtGc4rFbFuo2cafFxfjCQb
	j5B+Fo1iB8CMzUUKdVRlb9IlnoGEax4Oz1JyKzPpHrmaOZmkAzomLmOHx7rjeo4C4P0s0rtDuMqr6
	sv8FxdmOhwMqaO0aAlwIl0bSlDumFz6R2HqcFba8qC1+0M+qY/fST5krw2NSN7YfBrcXzZELV0WkD
	SGV/h+mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9stk-0000000CNkk-0Tnm;
	Thu, 24 Sep 2026 23:30:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9sth-0000000CNkO-00w3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 23:30:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 286471E5E;
	Thu, 24 Sep 2026 16:30:31 -0700 (PDT)
Received: from [10.57.10.88] (unknown [10.57.10.88])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 339BE3F632;
	Thu, 24 Sep 2026 16:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790292634; bh=o5jjLLvdLx+mHh34vmnUPVowLVRcHX+QrLaCzvpL7t8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WF54MV3RqxVOWL0I8myGWcAs0hbJK8pEQz6EoOmO6ClVhbMVRW7r2NvLpbYPu//JK
	 Wp8X7oqpfqlcLy7qCXer7xKkbwVLcZU/6aGpAWEHwnrmkFf4iMTkQLvHGUTi9GyABy
	 XzJ8SYbRVKAOstgcBy3PkFhcnFqi/TcASycuxwGU=
Message-ID: <14c6a10d-2891-42ce-8dd8-9745be2f7347@arm.com>
Date: Fri, 25 Sep 2026 00:30:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 6/7] firmware: arm_rmm: Ensure the RMM has GPT entries
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
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
 <20260924135201.850038-7-suzuki.poulose@arm.com>
 <20260924143821.00003491@oss.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260924143821.00003491@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_163037_229430_A46FA2BF 
X-CRM114-Status: GOOD (  26.42  )
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

On 24/09/2026 22:38, Jonathan Cameron wrote:
> On Thu, 24 Sep 2026 14:52:00 +0100
> Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
> 
>> From: Steven Price <steven.price@arm.com>
>>
>> The RMM maintains the state of all the granules in the system to make
>> sure that the host is abiding by the rules. This state can be maintained
>> at different granularity, per page (TRACKING_FINE) or per region
>> (TRACKING_COARSE or TRACKING_INTERMEDIATE). The region size depends on the

...

>>
>> If the firmware requires us to manage the tracking or GPT memory,
>> deactivate the RMM and reclaim any memory donated at RMM activation.
>>
>> Apply the same checks when hotplugged memory is brought online.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> [ Switch to RMI_GPT_L1_INFO for checking GPTs and deactivate RMM ]
>> Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> A few trivial comments. Either way on those
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

Thank you !
> 
>> ---
>>   drivers/firmware/arm_rmm/rmi.c | 218 ++++++++++++++++++++++++++++++++-
>>   include/linux/arm-rmi-cmds.h   |   2 +
>>   2 files changed, 219 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/arm_rmm/rmi.c
>> index 0859f256e192b..1a8f3debd844a 100644
>> --- a/drivers/firmware/arm_rmm/rmi.c
>> +++ b/drivers/firmware/arm_rmm/rmi.c
> 
> 
>> +
>> +/*
>> + * rmi_gpt_info - Query the GPT info for the given PAR.
>> + * @start: Base of the physical address region
>> + * @end: Top of the physical address region
>> + * @out_top: Top of the physical address region for which
>> + *		the GPT @out_gpt_par_state is valid
> 
> wrap to 80.
> 

Ack

>> + * @out_gpt_par_state: State of the GPT covered by [start, out_top)
>> + */
>> +static long rmi_gpt_info(unsigned long start, unsigned long end,
>> +			 unsigned long *out_top,
>> +			 unsigned long *out_gpt_par_state)
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
>> +
>> +/*
>> + * We do not support creating L1 GPTs yet. So, make sure that
>> + * all the regions are managed by the firmware.
> Wrap to 80 chars.
> 
> Not relevant to this patch, but when are you thinking we will support that?

Once we have a full firmware stack that implements the L1GPT (Firme in 
tf-a and tf-RMM) we will take it up. That won't come before the first
drop of KVM is merged.

>> +
>> +static int rmi_init_metadata(void)
>> +{
>> +	phys_addr_t start, end;
>> +	struct memblock_region *r;
>> +
>> +	for_each_mem_region(r) {
>> +		int ret;
>> +
>> +		/* Firmware-reserved NOMAP regions are not usable system RAM */
>> +		if (memblock_is_nomap(r))
>> +			continue;
>> +
>> +		start = PAGE_ALIGN(r->base);
>> +		end = PAGE_ALIGN_DOWN(r->base + r->size);
> 
> Add a comment on why rounding down.  Doe we expect that to ever be relevant?

Do we really need a comment here ? We always deal with PAGE_SIZE and if
in the odd case this region boundary is not PAGE aligned we stick to the
page that we can use from the region. I can stick in a comment if you
really think so.


...

>> @@ -843,9 +1049,19 @@ static int __init arm64_init_rmi(void)

...

>> -	return ret;
>> +	ret = rmi_init_memory();
>> +	if (ret) {
>> +		/* Deactivate the RMM */
>> +		WARN_ON(rmi_sro_memxfer_cmd(sro, GFP_KERNEL, SMC_RMI_RMM_DEACTIVATE));
>> +		return ret;
>> +	}
>> +
>> +	arm64_rmi_is_available = true;
>> +	pr_info("RMI configured\n");
> 
> Blank line nice for the eye to spot the return.

Ack

Thanks for your review !

Suzuki

