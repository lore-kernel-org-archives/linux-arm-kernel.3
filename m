Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E4AC9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 14:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DW86GxN3U0In9nQqY5i8JYB7ib5fdu3QBo+zlzAh8X8=; b=RE106zzyIiZjAg6KKLOumVdE5y
	oYQ0e8QMiSZFL70Yjl2iI8eX+eV3ebve6IdNCIz0BsKiwqZli4j2xurVj3ElJkhcOLGiN8QJ+8dYK
	gko63S+MBFKcuchWjlPuE8L+/8wx3QDPA8hd5WR6hmPD6T6iABd86b+O0ofeJjh+FHChJCrgoEhXJ
	mZZvuySahlFu6adlCnPAEaoHJlW5Q6Oc6JP3xeYgcIS5WXD4N2lnfF8lucwtCfgLmZ/ZaFQMg7MUr
	jCSlD/xI1etDNTVq02BLD5abPe07VQ3hB5f6g7AQuyzrTNHjzeavUlfguXXY8pOrdfnwZ5QJEwyzw
	hZET+BRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7MH-0000000DfK3-334X;
	Fri, 25 Sep 2026 14:57:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7ME-0000000DfJ4-2Fq3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 14:57:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B4F71688;
	Fri, 25 Sep 2026 07:56:56 -0700 (PDT)
Received: from [10.57.10.17] (unknown [10.57.10.17])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E8C133F85F;
	Fri, 25 Sep 2026 07:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790348219; bh=RZHBsgyig+278+Pk9MVvJjizLmN6flpWBBaUvmoly5M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=brYYPVQzJiNqSbLCXvb+WIW2JFJOqyWjRA/7kKfpsPdcZYLdSjMpdW5GHK3KWBmu9
	 zjMbEt3eF5s6OZuBfCkDDun6Moq3PRvKUKiS6jTOSFWrIVdTOjKW1kp0Cca83G44oY
	 IUmJK9GDdDXHpfPhIWW40zZRav/PzcdzRodv8Nm0=
Message-ID: <bb4a6fa1-721c-44f8-a8d2-54e80b5449c6@arm.com>
Date: Fri, 25 Sep 2026 15:56:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 3/7] firmware: arm_rmm: Configure the RMM with the
 host's page size
Content-Language: en-GB
To: Venkata Rao Kakani <venkata.kakani@oss.qualcomm.com>,
 Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
 will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
 aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, trilok.soni@oss.qualcomm.com
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
 <20260924135201.850038-4-suzuki.poulose@arm.com>
 <20260924100313.00003be7@oss.qualcomm.com>
 <d4b768e5-c942-43cf-aea2-c266a8bab353@oss.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <d4b768e5-c942-43cf-aea2-c266a8bab353@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_075702_668574_A4361814 
X-CRM114-Status: GOOD (  23.70  )
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

On 25/09/2026 14:23, Venkata Rao Kakani wrote:
> Hi Suzuki,
> 

Hi Venkat,

> Now, with this patch Host can set RMM Granule size equal to PAGE_SIZE. 
> Does RMM send the request to root to set GPT physical granule size = 
> PAGE_SIZE?

I don't think FIRME lets you do that and it would be too complex. Please
remember that the GPT is not just for the Non-secure/Realm world, but
also for the Secure world.
So, the Physical Granule size would be statically configured to 4KB on a
platform unless it supports the 4KB granule size, to support all
possible Sofware components.


> 
> In a scenario where, GPT granule size (|GPCCR_EL3|) set to 64K and Host 
> PAGE_SIZE set to 4K, how does root handle GPT granule mappings, when 
> Host send RMI_GRANULE_DELEGATE(PAGE_SIZE)?

If GPCCR_EL3 is set to 64K, RMM must not report it supports 4K GRANULE
size.

nit: Please avoid top posting your comments and use plain text for
discussions on the list.

Suzuki




> 
> 
> -- Venkat
> 
> On 24-09-2026 10:33 pm, Jonathan Cameron wrote:
>> On Thu, 24 Sep 2026 14:51:57 +0100
>> Suzuki K Poulose<suzuki.poulose@arm.com> wrote:
>>
>>> RMM v2.0 brings the ability to set the RMM's granule size. Check the
>>> feature registers and configure the RMM so that it matches the host's
>>> page size. This means that operations can be done with a granularity
>>> equal to PAGE_SIZE.
>>>
>>> Signed-off-by: Steven Price<steven.price@arm.com>
>>> Signed-off-by: Suzuki K Poulose<suzuki.poulose@arm.com>
>> Hi Suzuki,
>>
>> Some trivial stuff inline.  Assuming that is addressed.
>>
>> Reviewed-by: Jonathan Cameron<jonathan.cameron@oss.qualcomm.com>
>>
>>> ---
>>>   drivers/firmware/arm_rmm/rmi.c | 70 ++++++++++++++++++++++++++++++++++
>>>   1 file changed, 70 insertions(+)
>>>
>>> diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/arm_rmm/rmi.c
>>> index 3baba931f92e4..c9ea964fd9081 100644
>>> --- a/drivers/firmware/arm_rmm/rmi.c
>>> +++ b/drivers/firmware/arm_rmm/rmi.c
>>> +
>>> +static int rmi_configure(void)
>>> +{
>>> +	unsigned long granule_feature;
>>> +	unsigned long granule_size;
>>> +	int ret = 0;
>> Value not used.  Fine if it is future churn reduction, but I didn't spot
>> where if so. I'm guessing left over from refactoring
>>
>>> +
>>> +	switch (PAGE_SIZE) {
>>> +	case SZ_4K:
>>> +		granule_size = RMI_GRANULE_SIZE_4KB;
>>> +		granule_feature = RMI_FEATURE_REGISTER_1_RMI_GRAN_SZ_4KB;
>>> +		break;
>>> +	case SZ_16K:
>>> +		granule_size = RMI_GRANULE_SIZE_16KB;
>>> +		granule_feature = RMI_FEATURE_REGISTER_1_RMI_GRAN_SZ_16KB;
>>> +		break;
>>> +	case SZ_64K:
>>> +		granule_size = RMI_GRANULE_SIZE_64KB;
>>> +		granule_feature = RMI_FEATURE_REGISTER_1_RMI_GRAN_SZ_64KB;
>>> +		break;
>>> +	default:
>>> +		BUILD_BUG();
>>> +	}
>>> +
>>> +	if (!(rmi_feat_reg(1) & granule_feature)) {
>>> +		pr_err("RMM does not support %luKB granules\n",
>>> +		       PAGE_SIZE >> 10);
>>> +		return -ENXIO;
>>> +	}
>>> +
>>> +	struct rmm_config *config __free(free_page) =
>>> +		(struct rmm_config *)get_zeroed_page(GFP_KERNEL);
>>> +
>>> +	if (!config) {
>>> +		pr_err("Unable to allocate memory for RMM config\n");
>>> +		return -ENOMEM;
>>> +	}
>>> +
>>> +	config->rmi_granule_size = granule_size;
>>> +
>>> +	/*
>>> +	 * For now we set the tracking_region_size to 0 which is the only option
>>> +	 * for 4KB PAGE_SIZE (1GB for 4KB PAGE_SIZE, 32MB/512MB for 16KB/64KB).
>>> +	 * TODO: Support other tracking sizes via Kconfig option for other
>>> +	 * PAGE_SIZES
>>> +	 */
>>> +	config->tracking_region_size = 0;
>>> +
>>> +	ret = rmi_rmm_config_set(virt_to_phys(config));
>>> +	if (ret) {
>>> +		pr_err("RMM config set failed (%d)\n", ret);
>>> +		ret = -EINVAL;
>> 		return -EINVAL;
>>
>>> +	}
>>> +
>>> +	return ret;
>> 	return 0;
>>
>> So obvious this is the good path without anyone having to think about it!
>>
>> I did quick check on whether this was to reduce churn due to later changes
>> but couldn't immediately spot anything
>>
>>
>>> +}


