Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3016CC88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 06:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1cEK84YffFel1AiBdyK5aZ97aPbYe5nFneMEiJOWaKE=; b=O+8LJWd0pD8sYqb+vAv0k37+6K
	EWxLU9j0fU0uBr8vd8G/+Vd4it0GfB0rHBSa517wW9VLTzpHipA59jJFOnbSMAN68hKmbxNUC6ZVh
	7mu4cuGCgmUSzOhEAraR6tFvAZokIVZGliB4VnhsVf6BGPMq4cNRl2YapwKTAsgEuprH5v9++LI+A
	ojpyu7U7WaDs2ZEL78hlLBGO1+oGdGlQeiHxjn7lVXI5RKW9VOtC5lnFXflhmiBoN/GCegJnAFpgp
	Sdu++nD40jeADCuXpFoRlvYnUW7S+/ZXQg5RluRCqpn5L8HuYdHv4V8MOxcTnkQi+WPvVZvSz6YX0
	mSHVAYCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x60Gn-00000002S0a-3OD3;
	Mon, 14 Sep 2026 06:34:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x60Gl-00000002Rzp-0qbQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 06:34:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 09A641570;
	Sun, 13 Sep 2026 23:34:18 -0700 (PDT)
Received: from [10.57.10.40] (unknown [10.57.10.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C28623F7B4;
	Sun, 13 Sep 2026 23:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789367661; bh=3UFhIq4QHq9TytrWQywRZzXOkkTaNlRDCVMLHz/qIj0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MK8BiM95/KvV+tBcwk8Ima8+QslWVJKy2xivHr6522TXYYXfDNC/qhggcF5gATKdR
	 TrrjiHONVKxa17sth4M+XYpVIG6qhwn4cZl8lIPEQxa9SjrixubT0ENswtzTlv5p5Y
	 PaCRo9aJG3WP7tak+IsS8z2yN/Q22Li8OhMIbb3s=
Message-ID: <a9587df6-b866-4d3b-880e-638537a96e3a@arm.com>
Date: Mon, 14 Sep 2026 07:34:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 3/7] firmware: arm_rmm: Configure the RMM with the
 host's page size
Content-Language: en-GB
To: Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260912083611.2513845-1-suzuki.poulose@arm.com>
 <20260912083611.2513845-4-suzuki.poulose@arm.com>
 <6d204c05-1338-4ee5-9ac9-5d9447e329ee@redhat.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <6d204c05-1338-4ee5-9ac9-5d9447e329ee@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_233423_319766_9B62DCAE 
X-CRM114-Status: GOOD (  19.42  )
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

On 14/09/2026 02:21, Gavin Shan wrote:
> On 9/12/26 6:36 PM, Suzuki K Poulose wrote:
>> From: Steven Price <steven.price@arm.com>
>>
>> RMM v2.0 brings the ability to set the RMM's granule size. Check the
>> feature registers and configure the RMM so that it matches the host's
>> page size. This means that operations can be done with a granularity
>> equal to PAGE_SIZE.
>>
>> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> ---
>>   Changes since v17:
>>    * Move rmi_config_set() out of the header file.
>>    * Print the error message for rmi_config_set if it fails
>>   Changes since v15:
>>    * Actually check the feature register for the host's page-size 
>> support.
>>   Changes since v14:
>>    * Move the implementation into drivers/firmware/arm_rmm.
>>   Changes since v13:
>>    * Moved out of KVM.
>> ---
>>   drivers/firmware/arm_rmm/rmi.c | 79 ++++++++++++++++++++++++++++++++++
>>   1 file changed, 79 insertions(+)
>>
>> diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/ 
>> arm_rmm/rmi.c
>> index 2fd538c937dca..5b0e342ce3d58 100644
>> --- a/drivers/firmware/arm_rmm/rmi.c
>> +++ b/drivers/firmware/arm_rmm/rmi.c
>> @@ -35,6 +35,25 @@ static int rmi_features(unsigned long index, 
>> unsigned long *out)
>>       return args.a0;
>>   }
>> +/**
>> + * rmi_rmm_config_set() - Configure the RMM
>> + * @cfg_ptr: PA of a struct rmm_config
>> + *
>> + * Sets configuration options on the RMM.
>> + *
>> + * Return: RMI return code
>> + */
>> +static int rmi_rmm_config_set(unsigned long cfg_ptr)
>> +{
>> +    struct arm_smccc_1_2_regs regs = {
>> +        SMC_RMI_RMM_CONFIG_SET, cfg_ptr,
>> +    };
>> +
>> +    rmi_smccc_invoke(&regs);
>> +
>> +    return regs.a0;
>> +}
>> +
> 
> The comments for rmi_rmm_config_set() can be dropped since its logic is 
> simply enough and
> the code is self-explainning. Besides, I would move this right before 
> its only caller
> rmi_configure().

Ack

> 
> I would suggest drop this function by combining its logics into the only 
> caller
> rmi_configure(), seeing below for more details.

That looks a bit odd in the middle of a function, given the argument 
setting. I have moved it closer to the configure().

Cheers
Suzuki



