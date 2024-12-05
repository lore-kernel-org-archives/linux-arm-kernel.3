Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B51ABE7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 15:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nsjN6htrc2a4gXIpVuxLe154FflrTvXRPUY1c/3k4CY=; b=a/moRcRyzI7aw5ka62vSDVhM1B
	cIGo67/10CgWuMT1S2qgE/yPOu+rmR7FXKAvdn2fViVjNYV/XzbM98+M+8l+FyJxZEecUpl6MvxeU
	c8o75SlOfuoUliR5G13HJY2y/CW0md5VmyVz9kooHMVWTXLSj0EyIeq5nqWo9lbrAaygdSXd7JxQV
	aSw+R9rbB//rxt3di/dH+l422Jp7gFpJ/KrPuDHDNjpzYJAsTw1ZfRlwHZrqbm37p36sWlQr/pUKj
	GNKqtdNLcM4WO4E1AA4yjm0/T+jozCMhArhGfcBTxk4KKLo6CWLil7rv2MUz4d5KewXDkFJRGA/rj
	LuPHk8Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJEDh-0000000Gdzz-1aqr;
	Thu, 05 Dec 2024 15:56:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJECC-0000000GdjT-2LKF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 15:55:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 54CD41063;
	Thu,  5 Dec 2024 07:55:42 -0800 (PST)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DC4DD3F5A1;
	Thu,  5 Dec 2024 07:55:12 -0800 (PST)
Message-ID: <6129a590-6b1b-4368-8bcc-a09a8754bbe5@arm.com>
Date: Thu, 5 Dec 2024 15:55:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: cpufeature: Add GCS to cpucap_is_possible()
To: Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>
Cc: will@kernel.org, joro@8bytes.org, jean-philippe@linaro.org,
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 mark.rutland@arm.com, joey.gouly@arm.com, ryan.roberts@arm.com
References: <68a37b00a720f0827cac0e4f40e4d3a688924054.1733406275.git.robin.murphy@arm.com>
 <416c7369fcdce4ebb2a8f12daae234507be27e38.1733406275.git.robin.murphy@arm.com>
 <051c017c-a60f-48a7-b09f-07f0f32e48e3@sirena.org.uk>
 <Z1HF3i-mAAXDHKUP@arm.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <Z1HF3i-mAAXDHKUP@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_075516_641575_30191A51 
X-CRM114-Status: GOOD (  12.85  )
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

On 05/12/2024 3:25 pm, Catalin Marinas wrote:
> On Thu, Dec 05, 2024 at 03:04:11PM +0000, Mark Brown wrote:
>> On Thu, Dec 05, 2024 at 01:48:10PM +0000, Robin Murphy wrote:
>>> Since system_supports_gcs() ends up referring to cpucap_is_possible(),
>>> teach the latter about GCS for consistency with similar features.
>>
>> Not clear why this is part of a series, there's no obvious relationship
>> with patch 1?
> 
> No, probably Robing forgot to pass --no-thread to git.

Yeah, this was just a tangent from poking around figuring out how to 
detect GCS being enabled for the main patch.

>>>   static inline bool system_supports_gcs(void)
>>>   {
>>> -	return IS_ENABLED(CONFIG_ARM64_GCS) &&
>>> -		alternative_has_cap_unlikely(ARM64_HAS_GCS);
>>> +	return alternative_has_cap_unlikely(ARM64_HAS_GCS);
>>>   }
>>
>> Ah, this is bitrot since the series was on the list for so long.  As
>> well as HAFT which Rutland mentioned it looks like _bti_kernel(),
>> _irq_prio_masking() and possibly others have the same thing.  Ideally
>> we'd have no uses of IS_ENABLED() in these functions so it's a bit more
>> obvious.  In any case
>>
>> Reviewed-by: Mark Brown <broonie@kernel.org>
> 
> Thanks. This patch will go in via the arm64 tree. I'll leave the other
> for the smmu tree.

Thanks!

Robin.

