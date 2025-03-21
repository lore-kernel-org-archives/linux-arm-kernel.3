Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08606C36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 12:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y0Bfq4RisKeoN4RJfGqSrsliDfiosntwLr+iSEKNHzc=; b=y/VkH5SriOJSbff0QwEH4w5wqN
	/jk95/66NiR/iHkXWwq+A9/0OjVf/EGvxO6l9uMuuXOHI6RYcWP9A17yI2PqTjWCZRfMAiBWORV6f
	kOQmdllZyP39BXX2ZA72McEdQCgm7njqZFadbX7LJtMcoMXmWUj32K0S6GZT/nyIlv1zN8Nu3/6vR
	YnHFAEmAmIgaU8SpMwmTRpwBD0ZIfH2AqsoJDRCpj3NSUlRxVeoubKcCKXauBWu2l/kir+J0LQpGa
	2t6yNZGBwRGnfxXKby53B7qnuEvt8IqHMV1fpSdieQuJkR5ewHkJ8cmZBSolj7aRAK1MDc9xEhDol
	t6/O/F2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvblj-0000000Enze-2lxq;
	Fri, 21 Mar 2025 12:46:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvbhd-0000000En5s-0fke
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 12:42:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BFBA3106F;
	Fri, 21 Mar 2025 05:42:27 -0700 (PDT)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 23F393F63F;
	Fri, 21 Mar 2025 05:42:19 -0700 (PDT)
Message-ID: <2d3fb704-172c-4632-9e95-02bbfb8c0f90@arm.com>
Date: Fri, 21 Mar 2025 12:42:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] coresight: Convert tag clear function to take a
 struct cs_access
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, leo.yan@arm.com
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20250320-james-coresight-claim-tags-v3-0-d3145c153820@linaro.org>
 <20250320-james-coresight-claim-tags-v3-1-d3145c153820@linaro.org>
 <3bbf8aee-7b84-405a-8a3f-648c74196c2c@arm.com>
Content-Language: en-US
In-Reply-To: <3bbf8aee-7b84-405a-8a3f-648c74196c2c@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_054221_374216_3E50146A 
X-CRM114-Status: GOOD (  17.71  )
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

On 21/03/2025 11:02, Suzuki K Poulose wrote:
> On 20/03/2025 14:34, James Clark wrote:
>> The self hosted claim tag will be reset on device probe in a later
>> commit. We'll want to do this before coresight_register() is called so
>> won't have a coresight_device and have to use cs_access instead.
>>
>> Also make them public and create locked and unlocked versions for
>> later use.
>>
>> These look functions look like they set the whole tags register as one
>> value, but they only set and clear the self hosted bit using a SET/CLR
>> bits mechanism so also rename the functions to reflect this better.
>>
>> Reviewed-by: Leo Yan <leo.yan@arm.com>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   drivers/hwtracing/coresight/coresight-core.c | 27 ++++++++++++++++++ 
>> +--------
>>   include/linux/coresight.h                    |  3 ++-
>>   2 files changed, 21 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/ 
>> hwtracing/coresight/coresight-core.c
>> index fb43ef6a3b1f..8471aefeac76 100644
>> --- a/drivers/hwtracing/coresight/coresight-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>> @@ -144,19 +144,30 @@ static inline bool 
>> coresight_is_claimed_any(struct coresight_device *csdev)
>>       return coresight_read_claim_tags(csdev) != 0;
>>   }
>> -static inline void coresight_set_claim_tags(struct coresight_device 
>> *csdev)
>> +static inline void coresight_set_self_claim_tag(struct 
>> coresight_device *csdev)
> 
> nit: For consistency, this should be renamed to _unlocked ?
> 

minor nit on the subject;

s/cs_access/csdev_access/

Suzuki


> 

Rest looks fine to me
> 
> Suzuki
> 
> 
>>   {
>>       csdev_access_relaxed_write32(&csdev->access, 
>> CORESIGHT_CLAIM_SELF_HOSTED,
>>                        CORESIGHT_CLAIMSET);
>>       isb();
>>   }
>> -static inline void coresight_clear_claim_tags(struct coresight_device 
>> *csdev)
>> +void coresight_clear_self_claim_tag(struct csdev_access *csa)
>>   {
>> -    csdev_access_relaxed_write32(&csdev->access, 
>> CORESIGHT_CLAIM_SELF_HOSTED,
>> +    if (csa->io_mem)
>> +        CS_UNLOCK(csa->base);
>> +    coresight_clear_self_claim_tag_unlocked(csa);
>> +    if (csa->io_mem)
>> +        CS_LOCK(csa->base);
>> +}
>> +EXPORT_SYMBOL_GPL(coresight_clear_self_claim_tag);
>> +
>> +void coresight_clear_self_claim_tag_unlocked(struct csdev_access *csa)
>> +{
>> +    csdev_access_relaxed_write32(csa, CORESIGHT_CLAIM_SELF_HOSTED,
>>                        CORESIGHT_CLAIMCLR);
>>       isb();
>>   }
>> +EXPORT_SYMBOL_GPL(coresight_clear_self_claim_tag_unlocked);
>>   /*
>>    * coresight_claim_device_unlocked : Claim the device for self- 
>> hosted usage
>> @@ -176,11 +187,11 @@ int coresight_claim_device_unlocked(struct 
>> coresight_device *csdev)
>>       if (coresight_is_claimed_any(csdev))
>>           return -EBUSY;
>> -    coresight_set_claim_tags(csdev);
>> +    coresight_set_self_claim_tag(csdev);
>>       if (coresight_is_claimed_self_hosted(csdev))
>>           return 0;
>> -    /* There was a race setting the tags, clean up and fail */
>> -    coresight_clear_claim_tags(csdev);
>> +    /* There was a race setting the tag, clean up and fail */
>> +    coresight_clear_self_claim_tag_unlocked(&csdev->access);
>>       return -EBUSY;
>>   }
>>   EXPORT_SYMBOL_GPL(coresight_claim_device_unlocked);
>> @@ -201,7 +212,7 @@ int coresight_claim_device(struct coresight_device 
>> *csdev)
>>   EXPORT_SYMBOL_GPL(coresight_claim_device);
>>   /*
>> - * coresight_disclaim_device_unlocked : Clear the claim tags for the 
>> device.
>> + * coresight_disclaim_device_unlocked : Clear the claim tag for the 
>> device.
>>    * Called with CS_UNLOCKed for the component.
>>    */
>>   void coresight_disclaim_device_unlocked(struct coresight_device *csdev)
>> @@ -211,7 +222,7 @@ void coresight_disclaim_device_unlocked(struct 
>> coresight_device *csdev)
>>           return;
>>       if (coresight_is_claimed_self_hosted(csdev))
>> -        coresight_clear_claim_tags(csdev);
>> +        coresight_clear_self_claim_tag_unlocked(&csdev->access);
>>       else
>>           /*
>>            * The external agent may have not honoured our claim
>> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
>> index d79a242b271d..00134a80d358 100644
>> --- a/include/linux/coresight.h
>> +++ b/include/linux/coresight.h
>> @@ -685,7 +685,8 @@ extern int coresight_timeout_action(struct 
>> csdev_access *csa, u32 offset,
>>   extern int coresight_claim_device(struct coresight_device *csdev);
>>   extern int coresight_claim_device_unlocked(struct coresight_device 
>> *csdev);
>> -
>> +void coresight_clear_self_claim_tag(struct csdev_access *csa);
>> +void coresight_clear_self_claim_tag_unlocked(struct csdev_access *csa);
>>   extern void coresight_disclaim_device(struct coresight_device *csdev);
>>   extern void coresight_disclaim_device_unlocked(struct 
>> coresight_device *csdev);
>>   extern char *coresight_alloc_device_name(struct coresight_dev_list 
>> *devs,
>>
> 


