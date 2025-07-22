Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1634C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 14:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5PF6ylaxf/gzcoLgi7RbR7JAegQRu4QI8hjuHXDHN8A=; b=luDDj1Xr+vPboGnDdLTHo12Ukx
	9tg3vm0TghleL/Uzn21F+rc1dEgWrWIlww/5ePzOqNPJvLJ7ee2EzGMz01ieBsB6iQHfM/bEgXCUs
	AKFDtkQQSariK8xvSuhnfj989hgZMlQMSkqijJ1PxSBcl5vtNhXOoyhyxfk3KmAJXiRwub9F9AC3V
	vTsQmwJ5/C/bJsFTWZRpA9vnh4tvapf/K3/Nm+5nGPLsKW61QhFr5c+w/+JSqeLhqG2MdDsLqN9fW
	46TKZAISroRow2MZiUFVTDFLrzAV0hGqPsB4KvOp1t8KFKh6SwGGmYS1hY517uAb7/5HBB+M/nFNz
	7oNlNZXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueDZb-00000002d5R-1BnY;
	Tue, 22 Jul 2025 14:02:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueCzm-00000002Xak-0of7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 13:25:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 09304152B;
	Tue, 22 Jul 2025 06:25:20 -0700 (PDT)
Received: from [10.1.36.73] (Suzukis-MBP.cambridge.arm.com [10.1.36.73])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 570583F6A8;
	Tue, 22 Jul 2025 06:25:24 -0700 (PDT)
Message-ID: <8285b872-ecfa-42a6-9ead-e84ae409f79d@arm.com>
Date: Tue, 22 Jul 2025 14:25:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/10] coresight: Appropriately disable programming
 clocks
Content-Language: en-GB
To: Leo Yan <leo.yan@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250627-arm_cs_fix_clock_v4-v4-0-0ce0009c38f8@arm.com>
 <20250627-arm_cs_fix_clock_v4-v4-4-0ce0009c38f8@arm.com>
 <5a5f1355-563d-498a-9dec-3479a257b3e6@arm.com>
 <20250721104834.GC3137075@e132581.arm.com>
 <607c03a2-267c-46e6-a7fa-e733c1970e60@arm.com>
 <20250721135958.GE3137075@e132581.arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250721135958.GE3137075@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_062526_278840_46282787 
X-CRM114-Status: GOOD (  15.41  )
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

On 21/07/2025 14:59, Leo Yan wrote:
> On Mon, Jul 21, 2025 at 12:40:38PM +0100, Suzuki Kuruppassery Poulose wrote:
>> On 21/07/2025 11:48, Leo Yan wrote:
>>> On Mon, Jul 21, 2025 at 10:15:22AM +0100, Suzuki Kuruppassery Poulose wrote:
>>>
>>> [...]
>>>
>>>>> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
>>>>> index 4ac65c68bbf44b98db22c3dad2d83a224ce5278e..dd2b4cc7a2b70cf060a3207548fe80e3824c489f 100644
>>>>> --- a/include/linux/coresight.h
>>>>> +++ b/include/linux/coresight.h
>>>>> @@ -480,26 +480,16 @@ static inline bool is_coresight_device(void __iomem *base)
>>>>>      * Returns:
>>>>>      *
>>>>>      * clk   - Clock is found and enabled
>>>>> - * NULL  - clock is not found
>>>>
>>>> This is still valid, right ?
>>>
>>> No. Since this patch uses devm_clk_get_enabled() to get a clock, if the
>>> pclk is not found, it returns -ENOENT (see of_parse_clkspec()).
>>>
>>> Only the optional clock APIs (e.g., devm_clk_get_optional_enabled())
>>> return a NULL pointer instead of -ENOENT when the clock is not found.
>>
>> This will break ACPI based systems, as we may not have a "pclk" described
>> for them. We should be able to tolerate "no pclk"
> 
> Get it. How about change the code like below?
> 
>    static inline struct clk *coresight_get_enable_apb_pclk(struct device *dev)
>    {
>        struct clk *pclk;
> 
>        pclk = devm_clk_get_enabled(dev, "apb_pclk");
>        if (IS_ERR(pclk))
>            pclk = devm_clk_get_enabled(dev, "apb");
> 
>        /* Tolerate no pclk for ACPI device */
>        if ((pclk == ERR_PTR(-ENOENT)) && has_acpi_companion(dev))

That might be OK, please could you test this out ?




>            return NULL;
> 
>        return pclk;
>    }


