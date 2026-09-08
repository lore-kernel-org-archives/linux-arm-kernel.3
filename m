Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18DFBC79FAE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 10:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UPCo69d3EiR2ELT/T7blPa3t8AvotauSYJ7gsj0UBpQ=; b=DNGtn6JaR46HXDvfjjeAS2Sxc3
	EwmLBQv76RkiXIE0x4E7UznedE8zteA94TScb4QQ1Do3AM4zb6waDq79a6flHNNCNXFv4wbXkX+mm
	OBHf57EJo84b+FfUdy5WMM0Ld2iFQQQcBDyy58E8lK/LR6LOObTU65qEXYXAhVyXXg+075aS0cJzB
	GdSo19dUsmGNGzk6uVP2y2p9hyj6y4eRluVtfZuuz8zkxHqXrd1crP4bpAzcgosyKIu+nJKdeGHXB
	3F/wjN4SAilu+3V1kLSXKyXfxwEhOzn/6Jtb5uuV5BMomNblOK7nh/KeOZGidrTp29hmIpXH8r85z
	LzLuyaHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3tIh-00000008o00-0Coh;
	Tue, 08 Sep 2026 10:43:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3tIc-00000008nyx-2Lyo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 10:43:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 600F01476;
	Tue,  8 Sep 2026 03:43:28 -0700 (PDT)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 725653F528;
	Tue,  8 Sep 2026 03:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788864212; bh=qWSAnx/2m4XMAWGRUdW5OZ4UAA1+skg43ZENO1oTeMw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=G/vHDFqX/gKrcuszE3VshjePNe3v4uqUSjCOjN8C4AXE0ccvtSMqJKDdEcsBh8QIr
	 4DQjNn9aFLMivvaX4bP08uncghR2Xgf+kYmaYVJ5OEX+xkdNgQTtow8PoqMjBd6urp
	 0OOBLobpwlJVfXtrye5nKnBPb70udqw48c915/Qg=
Message-ID: <27d26c01-f00e-4ef3-b262-63cbe06e85ff@arm.com>
Date: Tue, 8 Sep 2026 11:43:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 3/7] firmware: arm_rmm: Configure the RMM with the
 host's page size
To: Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260907095942.1140734-1-suzuki.poulose@arm.com>
 <20260907095942.1140734-4-suzuki.poulose@arm.com>
 <10893135-4757-44de-91b5-180a9774d868@redhat.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <10893135-4757-44de-91b5-180a9774d868@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_034334_689745_D0E55A4E 
X-CRM114-Status: GOOD (  24.64  )
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

On 08/09/2026 08:04, Gavin Shan wrote:
> Hi Suzuki,
> 
> On 9/7/26 7:59 PM, Suzuki K Poulose wrote:
>> From: Steven Price <steven.price@arm.com>
>>
>> RMM v2.0 brings the ability to set the RMM's granule size. Check the
>> feature registers and configure the RMM so that it matches the host's
>> page size. This means that operations can be done with a granularity
>> equal to PAGE_SIZE.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> ---
>>   Changes since v15:
>>    * Actually check the feature register for the host's page-size 
>> support.
>>   Changes since v14:
>>    * Move the implementation into drivers/firmware/arm_rmm.
>>   Changes since v13:
>>    * Moved out of KVM.
>> ---
>>   drivers/firmware/arm_rmm/rmi.c | 58 ++++++++++++++++++++++++++++++++++
>>   include/linux/arm-rmi-cmds.h   | 17 ++++++++++
>>   2 files changed, 75 insertions(+)
>>
>> diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/ 
>> arm_rmm/rmi.c
>> index 008a783407b4e..76f91c145e1fd 100644
>> --- a/drivers/firmware/arm_rmm/rmi.c
>> +++ b/drivers/firmware/arm_rmm/rmi.c
>> @@ -77,6 +77,60 @@ static int rmi_read_features(void)
>>       return 0;
>>   }
>> +static int rmi_configure(void)
>> +{
>> +    unsigned long granule_feature;
>> +    unsigned long granule_size;
>> +    int ret = 0;
>> +    struct rmm_config *config;
>> +
>> +    switch (PAGE_SIZE) {
>> +    case SZ_4K:
>> +        granule_size = RMI_GRANULE_SIZE_4KB;
>> +        granule_feature = RMI_FEATURE_REGISTER_1_RMI_GRAN_SZ_4KB;
>> +        break;
>> +    case SZ_16K:
>> +        granule_size = RMI_GRANULE_SIZE_16KB;
>> +        granule_feature = RMI_FEATURE_REGISTER_1_RMI_GRAN_SZ_16KB;
>> +        break;
>> +    case SZ_64K:
>> +        granule_size = RMI_GRANULE_SIZE_64KB;
>> +        granule_feature = RMI_FEATURE_REGISTER_1_RMI_GRAN_SZ_64KB;
>> +        break;
>> +    default:
>> +        BUILD_BUG();
>> +    }
>> +
>> +    if (!(rmi_feat_reg(1) & granule_feature)) {
>> +        pr_err("RMM does not support %luKB granules\n",
>> +               PAGE_SIZE >> 10);
>> +        return -ENXIO;
>> +    }
>> +
>> +    config = (struct rmm_config *)get_zeroed_page(GFP_KERNEL);
>> +    if (!config)
>> +        return -ENOMEM;
> 
> An error message is needed here.
> 
>      if (!config) {
>          pr_err("Unable to alloc RMM config memory\n");
>          return -ENOMEM;
>      }
> 

I can add that, doesn't hurt.

>> +
>> +    config->rmi_granule_size = granule_size;
>> +
>> +    /*
>> +     * For now we set the tracking_region_size to 0 which is the only 
>> option
>> +     * for 4KB PAGE_SIZE (1GB for 4KB PAGE_SIZE, 32MB/512MB for 
>> 16KB/64KB).
>> +     * TODO: Support other tracking sizes via Kconfig option for other
>> +     * PAGE_SIZES
>> +     */
>> +    config->tracking_region_size = 0;
>> +
>> +    ret = rmi_rmm_config_set(virt_to_phys(config));
>> +    if (ret) {
>> +        pr_err("RMM config set failed\n");
>> +        ret = -EINVAL;
>> +    }
> 
> The error code from rmi_rmm_config_set() is indicative sometimes. Also, 
> -ENXIO
> would be more appropriate than -EINVAL?
> 
>      if (ret) {
>          pr_err("RMM config set failed (%d)\n", ret);
>          ret = -ENXIO;
>      }
> 

Ack

>> diff --git a/include/linux/arm-rmi-cmds.h b/include/linux/arm-rmi-cmds.h
>> index 2fb1f7f86d71e..9aa27697e2377 100644
>> --- a/include/linux/arm-rmi-cmds.h
>> +++ b/include/linux/arm-rmi-cmds.h
>> @@ -12,6 +12,23 @@
>>   unsigned long rmi_feat_reg(unsigned long id);
>> +/**
>> + * rmi_rmm_config_set() - Configure the RMM
>> + * @cfg_ptr: PA of a struct rmm_config
>> + *
>> + * Sets configuration options on the RMM.
>> + *
>> + * Return: RMI return code
>> + */
>> +static inline int rmi_rmm_config_set(unsigned long cfg_ptr)
>> +{
>> +    struct arm_smccc_res res;
>> +
>> +    arm_smccc_1_1_invoke(SMC_RMI_RMM_CONFIG_SET, cfg_ptr, &res);
>> +
>> +    return res.a0;
>> +}
>> +
> 
> rmi_rmm_config_set() is used for once by rmi.c::rmi_configure(), I would 
> not expose
> rmi_rmm_config_set() by combining the logic to rmi.c::rmi_configure().

Ack

Thank you for the review

Cheers
Suzuki



