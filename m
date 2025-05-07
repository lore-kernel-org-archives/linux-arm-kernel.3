Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D83B4C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 05:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SewgzpKFishJzRCxirTQSaQ+FXU2EZJ0r1ydXvgKur0=; b=fQkJw0Fn7Ld2vqAFj/1uuhCgYV
	d7QuNWUo5sXgJMEh/AIEmDu617b+qOTxXysY6qc5a7we/2vxm3Jm/UrVA9/zBk4qW5RZ9AIfp9HCy
	X/66rhR+o5e6iFnNN7f7OOZszVkVPVDJ8ZHELm1/8A9zqswcAXjNveEe0OUjLDrK6DwN8pJi3fw8U
	VH2FwUwLeVF2U8bpCzpEmDu3RupH0kVZtjamL+q6W7zYP9PvbA/dr/DQx5u4z5BAmOBHQR6jVcpxa
	scLlVLWEn4qtz9IU5qCEmOjCM3c7TSLE8r1xD6VtJHtnvuiZ6D/L0+RaKzJJZJtOwQsAR7S/Te2W5
	2a2zOMFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCXjG-0000000EJE0-0ELn;
	Wed, 07 May 2025 05:54:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCXhI-0000000EJ2e-3PDL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 05:52:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C5C92F;
	Tue,  6 May 2025 22:51:42 -0700 (PDT)
Received: from [192.168.0.12] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 910583F5A1;
	Tue,  6 May 2025 22:51:48 -0700 (PDT)
Message-ID: <b93cb084-de85-47ff-856d-c18556ec00fa@arm.com>
Date: Wed, 7 May 2025 11:21:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/9] coresight: Consolidate clock enabling
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250423151726.372561-1-leo.yan@arm.com>
 <20250423151726.372561-8-leo.yan@arm.com>
 <08690315-ce0e-4b2e-b85e-d8b9a82f4b11@arm.com>
 <20250506105352.GE177796@e132581.arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250506105352.GE177796@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_225200_946940_C7B76254 
X-CRM114-Status: GOOD (  24.08  )
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



On 5/6/25 16:23, Leo Yan wrote:
> On Mon, May 05, 2025 at 12:58:06PM +0530, Anshuman Khandual wrote:
> 
> [...]
> 
>>> --- a/drivers/hwtracing/coresight/coresight-core.c
>>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>>> @@ -1645,6 +1645,51 @@ int coresight_etm_get_trace_id(struct coresight_device *csdev, enum cs_mode mode
>>>  }
>>>  EXPORT_SYMBOL_GPL(coresight_etm_get_trace_id);
>>>  
>>> +/*
>>> + * Attempt to find and enable programming clock (pclk) and trace clock (atclk)
>>> + * for the given device.
>>> + *
>>> + * The AMBA bus driver will cover the pclk, to avoid duplicate operations,
>>> + * skip to get and enable the pclk for an AMBA device.
>>> + *
>>> + * atclk is an optional clock, it will be only enabled when it is existed.
>>> + * Otherwise, a NULL pointer will be returned to caller.
>>> + *
>>> + * Returns: '0' on Success; Error code otherwise.
>>> + */
>>> +int coresight_get_enable_clocks(struct device *dev, struct clk **pclk,
>>> +				struct clk **atclk)
>>
>> These arguments probably could be arranged better as pclk and atclk are
>> always contained inside 'xxx_drvdata' structure, which could be derived
>> from the 'dev' structure itself, if [dev|platform]_set_drvdata() always
>> ensured to be called earlier.
> 
> Seems to me, the conclusion "pclk and atclk ... could be derived from
> the 'dev' structure itself" is not true.
> 
> The reason is the coresight_get_enable_clocks() function is located in
> the CoreSight core layer, it has no knowledge for driver data
> definitions (see etmv4_drvdata, funnel_drvdata, etc).  as a result, it
> cannot directly access the fields "drvdata->pclk" and "drvdata->atclk".

That's correct because all device's drvdata structure definitions are
local to their drivers and not really available in the core coresight
layer. Trying to make them available might create more code churn and
also break the abstraction.

I guess then a struct device and two clock double pointers are needed
for these optional clocks to be assigned and enabled as proposed here.

> 
>> Currently there are only two instances where a NULL is being passed to
>> indicate that 'atclk' clock is not to be probed or enabled. Could not
>> individual clock requirements be passed in a flag argument instead ?
>>
>> #define CORESIGHT_ENABLE_PCLK	0x1
>> #define CORESIGHT_ENABLE_ATCLK	0x2
>>
>> coresight_get_enable_clocks(struct device *dev, unsigned long flags)
>>
>> - atclk/pclk derived from drdvata which in turn from dev
>> - flags can be checked for pclk/atclk requirements
>>
>> Even better - as atlck is the only optional clock here, it could just
>> have a boolean flag argument to indicate for atclk clock.
>>
>>> +{
>>> +	WARN_ON(!pclk);
>>> +
>>> +	if (!dev_is_amba(dev)) {
>>> +		/*
>>> +		 * "apb_pclk" is the default clock name for an Arm Primecell
>>> +		 * peripheral, while "apb" is used only by the CTCU driver.
>>> +		 *
>>> +		 * For easier maintenance, CoreSight drivers should use
>>> +		 * "apb_pclk" as the programming clock name.
>>> +		 */
>>> +		*pclk = devm_clk_get_enabled(dev, "apb_pclk");
>>> +		if (IS_ERR(*pclk))
>>> +			*pclk = devm_clk_get_enabled(dev, "apb");
>>> +		if (IS_ERR(*pclk))
>>> +			return PTR_ERR(*pclk);
>>> +	} else {
>>> +		/* Don't enable pclk for an AMBA device */
>>> +		*pclk = NULL;
>>> +	}
>>
>> Might be better to invert this conditional check as if (dev_is_amba(dev))
>> for better readability.
> 
> Will refine code for this.

Sure

