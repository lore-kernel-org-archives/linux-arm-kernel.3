Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99226CC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 10:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GekRjwqq9HiLl3MVX3ePIJd60B4hFQQSWwFg9TJmd4c=; b=qP7x5C0XjvTHRCgNXbealOANvC
	cQCrkU4245bXlNktgLC6Nn/8j4h+DC80gy9soX3sibaP74enyen78DWyMibxTSaEW1L9f4HvQIvhl
	yOvW3u3j+UPp6z0sWyT8jm9sW6soO/8TbY+x0+rZWJMOfxNQdV/6s/C9ZlSFBH+NN2X8W+Hn1eBxI
	pytwYV5E0Eu6XsYS4+dbOuwdqPCPliXhKHADdyjraoFR4NvzWp5QeV00Na2hEd+PA7RROdkPBHb0S
	e3gIlzeYjWItHRjASTQhB5G7ar7+56ea2J+0X4MJQpuv2+BGZR7LoBfH7EicdZl82l409tGJ5/jx/
	Xhfv+p9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIJ6-0000000HNQV-2Rmt;
	Thu, 15 Oct 2026 10:03:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIJ3-0000000HNPR-2Qm9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 10:03:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A83322F;
	Thu, 15 Oct 2026 03:03:20 -0700 (PDT)
Received: from [10.33.8.90] (e142021.arm.com [10.33.8.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 70B5B3F871;
	Thu, 15 Oct 2026 03:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792058603; bh=jQfSLed4h//EKi1zFvLaF3DZxizTMwuRBrKZKA0SkCk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ospqc/jotDB57wXSnGWpaAnDpiiDDQypchsf84aZpuHa47m/33nzc41Dr5AHsIt8v
	 jjfBUGLOvZh2OtCykrhLpsW1fqaFB1I8QKCmxsXQVprsUY9NFXFXOf8WkrTs/EqZXK
	 JK5o31xXcjuwy68k94tHKRt1vKs7A4PR48vD3600=
Message-ID: <03b070de-b0b0-44d9-89ce-891e6c3ac4d2@arm.com>
Date: Thu, 15 Oct 2026 11:03:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] cache: add SMCCC-backed cache invalidate provider
To: =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <bence.csokas@arm.com>,
 Srirangan Madhavan <smadhavan@nvidia.com>, mark.rutland@arm.com,
 lpieralisi@kernel.org, sudeep.holla@kernel.org, conor@kernel.org,
 jic23@kernel.org
Cc: catalin.marinas@arm.com, will@kernel.org, aneesh.kumar@kernel.org,
 Souvik.Chakravarty@arm.com, treding@nvidia.com, jonathanh@nvidia.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20261013070205.3566865-1-smadhavan@nvidia.com>
 <20261013070205.3566865-3-smadhavan@nvidia.com>
 <23e9b66f-083a-4a77-8214-25f30c08057a@arm.com>
 <c0c04151-1ba9-473c-86a4-e066d6881858@arm.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <c0c04151-1ba9-473c-86a4-e066d6881858@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_030325_835786_979F6623 
X-CRM114-Status: GOOD (  23.16  )
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

On 10/15/26 09:43, Bence Csókás wrote:
> Hi,
> 
> On 2026. 10. 14. 17:38, Andre Przywara wrote:
>>> +static int smccc_cache_probe(struct arm_smccc_device *sdev)
>>> +{
>>> +    struct arm_smccc_res res = {};
>>> +    struct smccc_cache *cache;
>>> +    int ret;
>>> +
>>> +    arm_smccc_1_1_invoke(sdev->func_id, &res);
>>
>> I think you should provide the explicit function ID name here, and not 
>> rely on which function exactly is used to probe for the interface's 
>> existence.
> 
> I thought that was the point of the matcher, that you could in theory

But that probe() function here is not a "matcher" or a check function, 
that is done in the SMCCC bus generic code, using a function ID that has 
no side effects and does not return -1.

The reason for this SMC call here is to learn the attributes, they are 
used below to fill the latency and rate_limit fields in the struct.
So we should then make this explicit, I think, by using the 
ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION_ATTRIBUTES name.
> assign the same probe handler to any function ID? For example if there's 
> some FW that implements this (or a compatible) function, but at a 
> different ID, you would only update the match table? At least that's how 
> most subsystems (I2C, PCI, USB) do it.

Not sure I understand this, this is a driver specifically for the 
CLEANINV_MEM_REGION SMCCC interface, I don't see how you would reuse 
that, or plug any other interfaces to it.

>>> +    if ((s32)res.a0)
>>> +        return -ENODEV;
>>> +
>>> +    cache = cache_coherency_ops_instance_alloc(&smccc_cache_ops,
>>> +                           struct smccc_cache, cci);
>>> +    if (!cache)
>>> +        return -ENOMEM;
>>> +
>>> +    mutex_init(&cache->lock);
>>> +    cache->latency_us = lower_32_bits(res.a2);
>>> +    cache->rate_limit = res.a3;
>>
>> According to the spec you would need lower_32_bits() for a3 as well - 
>> if we are going to use this value. But I don't think we need to, see 
>> above.
> Where does it say that? My copy of DEN 0028 1.7 H, released 2026/Jul/24, 
> only says the following:
> 
>    X3 (uint64_t attr_2)
>      Rate Limit: The maximum number of SMCCCC_ARCH_CLEAN_INV_MEMREGION 
> calls allowed per second. If set to 0, it indicates that this field is 
> not reported by the implementation.
> 
> See my second-to-last comment on v2 of this patch:
> 
> https://lore.kernel.org/lkml/591e7ac9-310e-40f4-ab22-161d6ea8f487@arm.com/
> 
> Maybe I have an outdated copy already? ;_;

No, I had! Mine said v1.7H, but is was an early version, which had the 
upper 32 bits of rate_limit as reserved.
Indeed in the later public version it's a 64-bit field, so ignore my 
comment. Sorry for the noise!

Cheers,
Andre


