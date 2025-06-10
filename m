Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB67AC71132
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 12:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VyKsOwn7w0G897aCXWkYp/LNkCAEsPpyQZ7kYNiJuso=; b=jXnNtfomO2TQwpeIA+q8bHQWHs
	3I/w1f0EL/U9ZvRDfqmmqd6r7vXO0oM6uIsV0CVIE5NC3bE/8kp+dN525GVijeKopyVukkAM7USEJ
	sAUwxkroJNqXFvIh3oRrvtLnmxHgsj4Yn9+yZ7KgsdQLJt2v5xXVVC9nCaecuSTsv3/7QaTYS5SMu
	oJ8sVOLE62JJz58OavsxS8/ZAqKprPAkohtDZT7uvfQ/MRSREfckmB38rwPCziIz7uYXdXZaRi54R
	ROKsZZhqhzi+7M8jAXSmB9QeK5nhb0E3DkDLFCYrfMJd0osh5a3iOW6HCwB6sqt7EaKMJtvfq9UY4
	ijhUKqCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxmo-00000006iuu-2DPn;
	Tue, 10 Jun 2025 12:09:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOwOK-00000006W0d-0Heg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 10:39:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E698169C;
	Tue, 10 Jun 2025 03:39:20 -0700 (PDT)
Received: from [10.163.32.103] (unknown [10.163.32.103])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E93173F673;
	Tue, 10 Jun 2025 03:39:35 -0700 (PDT)
Message-ID: <b20a6309-ae31-496d-a1ad-61ea358ad7a9@arm.com>
Date: Tue, 10 Jun 2025 16:09:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/9] coresight: Avoid enable programming clock
 duplicately
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250609-arm_cs_fix_clock_v3_public-v3-0-423b3f1f241d@arm.com>
 <20250609-arm_cs_fix_clock_v3_public-v3-6-423b3f1f241d@arm.com>
 <b30fc361-a04f-4a48-b8e2-f7c2da213e6c@arm.com>
 <20250609171413.GO8020@e132581.arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250609171413.GO8020@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_033940_151366_C3BB8334 
X-CRM114-Status: GOOD (  13.17  )
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



On 09/06/25 10:44 PM, Leo Yan wrote:
> On Mon, Jun 09, 2025 at 05:58:34PM +0100, Suzuki Kuruppassery Poulose wrote:
> 
> [...]
> 
>>>   static inline struct clk *coresight_get_enable_apb_pclk(struct device *dev)
>>>   {
>>> -	struct clk *pclk;
>>> +	struct clk *pclk = NULL;
>>> -	pclk = devm_clk_get_enabled(dev, "apb_pclk");
>>> -	if (IS_ERR(pclk))
>>> -		pclk = devm_clk_get_enabled(dev, "apb");
>>> +	if (!dev_is_amba(dev)) {
>>> +		pclk = devm_clk_get_enabled(dev, "apb_pclk");
>>> +		if (IS_ERR(pclk))
>>> +			pclk = devm_clk_get_enabled(dev, "apb");
>>
>> AMBA driver doesn't handle "apb" clock ? So we may need to retain that here
>> ?
> 
> Here checks the condition "if (!dev_is_amba(dev))", it means the device
> is not an AMBA device (e.g., a platform device), the APB clock is
> enabled at here.

Just exit early for AMBA devices when 'pclk' clock is still NULL ?

	if (dev_is_amba(dev))
		return pclk;

> 
> Otherwise, for a AMBA device, the AMBA bus layer will help to enable
> APB clock.
> 
>> Otherwise looks good to me.
>>
>> Suzuki
>>> +	}
>>>   	return pclk;
>>>   }
>>>
>>



