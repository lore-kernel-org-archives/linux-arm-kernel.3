Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F79FC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 11:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c02abhHVFEdqDQiBq5z2yqG6TQE5ipoCqgc71cPZ6jg=; b=AiLmCyJ30OjwVou8f5OqA9uS33
	/HXhy5RBVuOdQc2yYFUj6fJOjrbtYVronkdtzFEB4ewseCWBBwz3/0h1PT7ZdPLnA7oo5TWHgHLVV
	ELbDS6uW2UcArT9pegMhGMgsnyo2QNpwoby2PEwK1W33naIAXpNtxuMNuRrfnXknhip0iqx/jPtzT
	DvVCob+0kGaKywHT8xGJCns371cDKxaqybYOg6zJt2w5BrgPCVPUpaLxIgeV7sR+EupDZ77dWr0cY
	9K4F4nLWqBJ16MR6rONWxQ8f6JNO+VvlQECCk36rrXsI0a0pi8cEuiYEkrHFz+kBc9W89SwBUgjOY
	rJvTQuWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3tYc-00000008pqR-0xNL;
	Tue, 08 Sep 2026 11:00:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3tYY-00000008pq1-3Ltb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 11:00:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788865201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c02abhHVFEdqDQiBq5z2yqG6TQE5ipoCqgc71cPZ6jg=;
	b=OG2Kiw/gJJ6FU1kDXMRsoFhnaf4/3dWVX3Qge+bNL0R72R+gDDtbTKtVbWe1JGUHT5LIua
	CFtPK8a2CFksl5ZmE9Xdgz484lvOr17FlOw6Vpn7xnQo9nZdw1KupZq8l/wSMOSikMvoEB
	wstKwBbDQ7AiDGQ09uOrVl3E2OPtVA8=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-297-aXbg4UsPPGqNQKsXCk9Fpg-1; Tue, 08 Sep 2026 06:59:59 -0400
X-MC-Unique: aXbg4UsPPGqNQKsXCk9Fpg-1
X-Mimecast-MFC-AGG-ID: aXbg4UsPPGqNQKsXCk9Fpg_1788865198
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ce7dff6253so23249815ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 03:59:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788865198; x=1789469998;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c02abhHVFEdqDQiBq5z2yqG6TQE5ipoCqgc71cPZ6jg=;
        b=Q96BnW60i4WKCU9Yne8GSgecZRJdQ+MUB7HkrDb2YMVAHjC7R+sVUSBAOG2B0Jk734
         sW9v2JNye7vOcktdsRCU3kiEr+p32jkBGbCykZIO7BQdLUCLddRmBSjP2EunS4Ca2gcz
         qeRf9oPIb2CRD5fS9Vr/XP5N8quaKNcdIlwazGjED0FoCbvsOCo/5q2S2251RVrSWxFP
         vp5KWzpzIQ74IVx/Zt1wMLzH+Pk/m2XsYUnO4cV2MklU2xSOudMGZ7xCWM9G8DHsL2cu
         7jodYKoxTL18Llh1ARWh4YBuDkmE7NfGLCcxzJecdDghhMausa6+nDrLyY7UAoyQRAXx
         oIfQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAtdtQNOoeJgTTnCD2FKYkEQ5hG0BMMeNBPIiUDD8d3Uy9e8tF8f766cLNNb2NS4oiOXU33QvrPuC2iiUE6vZF@lists.infradead.org
X-Gm-Message-State: AFuF++ku6r8qSLZB4ntXaJmqCPrqVl9PuDwDibhCVbqqyOKFZwF+5vN/
	UIKF6EfSC+ySPgKGkcUKSdf7giTj8sjGeSpUANFSvtAxO/Wh0Ag+UiikshOGMj3/pVdS8fT6bU2
	w6dhdNWRMMVdDupCk1RUTIiT2tE+VVhShVBsa7sDN9ym1lRhzLXdqSj1RVWywMGo5P1vsxImtZE
	Kz
X-Gm-Gg: AYBFou0N4uiH7tSgGzj5EHuaGfoPu/JkdFIelaE+bsInmkGzJzROrF+je23siMBpLdj
	prVveT26gN2IycBgAgpXnoyybU3bxvdtRPC2J8hWyVocIve2AQnicBuoihey3RjelQS344EMJvK
	NGX2p6ENRmUpL6nY+GGswy4hs2WwmS0ioAkzHrG1h8oPDqVxt+6GWoaXgrS24yByybPbT3pTpkU
	aaOXtEmjxBxkdBCOQ09MVoD15bPclQFPSyKlcrMY/xJAu+42OdJ7wJr35GmR7eGtUn+jNExTMOw
	2HKYmy5U6dqS4mp1fYORVSD7GnEDhY5dhcUsegOfuGQhanEvgnEgUJ8kegmevks409ff5PnCZq5
	0FIJmGSy3FKCFsV0iYsvJVEFhIducJ6zwf1S8lXiTzg==
X-Received: by 2002:a17:902:e944:b0:2cf:7db9:e13e with SMTP id d9443c01a7336-2db6fe6d0f8mr58961725ad.3.1788865198165;
        Tue, 08 Sep 2026 03:59:58 -0700 (PDT)
X-Received: by 2002:a17:902:e944:b0:2cf:7db9:e13e with SMTP id d9443c01a7336-2db6fe6d0f8mr58961265ad.3.1788865197629;
        Tue, 08 Sep 2026 03:59:57 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1495acf7sm57511075ad.25.2026.09.08.03.59.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 03:59:56 -0700 (PDT)
Message-ID: <9706a0b9-b686-4502-bfae-08aabe05fb84@redhat.com>
Date: Tue, 8 Sep 2026 20:59:45 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 3/7] firmware: arm_rmm: Configure the RMM with the
 host's page size
To: Kohei Enju <enju.kohei@fujitsu.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev, maz@kernel.org, will@kernel.org,
 catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
 aneesh.kumar@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
 tabba@google.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev,
 gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com,
 alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com,
 lpieralisi@kernel.org
References: <20260907095942.1140734-1-suzuki.poulose@arm.com>
 <20260907095942.1140734-4-suzuki.poulose@arm.com>
 <10893135-4757-44de-91b5-180a9774d868@redhat.com>
 <ap--9pJdD_Y_j1aY@FCCLS0092175.localdomain>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <ap--9pJdD_Y_j1aY@FCCLS0092175.localdomain>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vuDkidd28JuYDaT8WwfGmGZPwEjXqeV4z-qRVkjuWqo_1788865198
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_040002_923213_C3DA6FDF 
X-CRM114-Status: GOOD (  26.50  )
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

Hi Kohei,

On 9/8/26 6:00 PM, Kohei Enju wrote:
> Hi Gavin,
> 
> On 09/08 17:04, Gavin Shan wrote:
>> Hi Suzuki,
>>
>> On 9/7/26 7:59 PM, Suzuki K Poulose wrote:
>>> From: Steven Price <steven.price@arm.com>
>>>
>>> RMM v2.0 brings the ability to set the RMM's granule size. Check the
>>> feature registers and configure the RMM so that it matches the host's
>>> page size. This means that operations can be done with a granularity
>>> equal to PAGE_SIZE.
>>>
>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>>> ---
>>>    Changes since v15:
>>>     * Actually check the feature register for the host's page-size support.
>>>    Changes since v14:
>>>     * Move the implementation into drivers/firmware/arm_rmm.
>>>    Changes since v13:
>>>     * Moved out of KVM.
>>> ---
>>>    drivers/firmware/arm_rmm/rmi.c | 58 ++++++++++++++++++++++++++++++++++
>>>    include/linux/arm-rmi-cmds.h   | 17 ++++++++++
>>>    2 files changed, 75 insertions(+)
>>>
>>> diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/arm_rmm/rmi.c
>>> index 008a783407b4e..76f91c145e1fd 100644
>>> --- a/drivers/firmware/arm_rmm/rmi.c
>>> +++ b/drivers/firmware/arm_rmm/rmi.c
>>> @@ -77,6 +77,60 @@ static int rmi_read_features(void)
>>>    	return 0;
>>>    }
>>> +static int rmi_configure(void)
>>> +{
>>> +	unsigned long granule_feature;
>>> +	unsigned long granule_size;
>>> +	int ret = 0;
>>> +	struct rmm_config *config;
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
>>> +	config = (struct rmm_config *)get_zeroed_page(GFP_KERNEL);
>>> +	if (!config)
>>> +		return -ENOMEM;
>>
>> An error message is needed here.
>>
>> 	if (!config) {
>> 		pr_err("Unable to alloc RMM config memory\n");
>> 		return -ENOMEM;
>> 	}
> 
> I largely agree with your suggestions, and they look reasonable to me.
> 
> However, wouldn't this be redundant? Since __GFP_NOWARN is not set, the
> page allocator would normally emit an allocation failure warning with a
> stack trace anyway.
> 
> I don't have a strong preference, but as per "14) Allocating memory" in
> the coding style, I believe it would be considered unnecessary.
> 

You're correct that the error message is most likely redundant here and we
needn't it. However, it's notable the allocation failure warning and stack
trace isn't 100% raised when looking at mm/page_alloc.c::warn_alloc(). At least,
it depends on !__ratelimit(&nopage_rs) even it's less likely to happen. Similarly,
there are conditions to raise a warning and stack track in case of the injected
allocation error in lib/fault-inject.c::fail_dump().

Thanks,
Gavin

> Thanks,
> Kohei
> 
>>
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
>>> +		pr_err("RMM config set failed\n");
>>> +		ret = -EINVAL;
>>> +	}
>>
>> The error code from rmi_rmm_config_set() is indicative sometimes. Also, -ENXIO
>> would be more appropriate than -EINVAL?
>>
>> 	if (ret) {
>> 		pr_err("RMM config set failed (%d)\n", ret);
>> 		ret = -ENXIO;
>> 	}
>>
>>> +
>>> +	free_page((unsigned long)config);
>>> +	return ret;
>>> +}
>>> +
>>>    static int __init arm64_init_rmi(void)
>>>    {
>>>    	int ret;
>>> @@ -90,6 +144,10 @@ static int __init arm64_init_rmi(void)
>>>    	if (ret)
>>>    		return ret;
>>> +	ret = rmi_configure();
>>> +	if (ret)
>>> +		return ret;
>>> +
>>>    	return 0;
>>>    }
>>> diff --git a/include/linux/arm-rmi-cmds.h b/include/linux/arm-rmi-cmds.h
>>> index 2fb1f7f86d71e..9aa27697e2377 100644
>>> --- a/include/linux/arm-rmi-cmds.h
>>> +++ b/include/linux/arm-rmi-cmds.h
>>> @@ -12,6 +12,23 @@
>>>    unsigned long rmi_feat_reg(unsigned long id);
>>> +/**
>>> + * rmi_rmm_config_set() - Configure the RMM
>>> + * @cfg_ptr: PA of a struct rmm_config
>>> + *
>>> + * Sets configuration options on the RMM.
>>> + *
>>> + * Return: RMI return code
>>> + */
>>> +static inline int rmi_rmm_config_set(unsigned long cfg_ptr)
>>> +{
>>> +	struct arm_smccc_res res;
>>> +
>>> +	arm_smccc_1_1_invoke(SMC_RMI_RMM_CONFIG_SET, cfg_ptr, &res);
>>> +
>>> +	return res.a0;
>>> +}
>>> +
>>
>> rmi_rmm_config_set() is used for once by rmi.c::rmi_configure(), I would not expose
>> rmi_rmm_config_set() by combining the logic to rmi.c::rmi_configure().
>>
>>>    /**
>>>     * rmi_features() - Read feature register
>>>     * @index: Feature register index
>>
>> Thanks,
>> Gavin
>>
> 


