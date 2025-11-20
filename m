Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1968CFA441
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 20:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W1SjqVDeK/2NMBT5s/3OBPDk5kx6fZIu5b/UVlPsHdI=; b=jI/lZkYPS1y66xtlNhzad8qRh6
	hQXM3h9ALx3GyphcZ2o90LHGCu9FwGpmBO0uraoKkfh4yTHCEqiqRcLVquGQGms4aO5CyR0EI0Exy
	KcGyJVsQyX0/WJ4Q5PV2MRcQHf2hfe3iCCb4ABNBmHtnJvdvCiH9WcdEDtj10g5LP6HZoLql3llZM
	vMpyeD3YGqFSlgdpDMs1hATmhblckcdW2qaqJs7axqmQyzzuhMYOysn3AOh2VjUvwN7zDECI8p8GI
	9vwOuhILRl6GxRaS5bQ0lZSaDyUtnVCpWXw2LWK9X9TkTG4GAXIz+MBsUWq6zz4RoyzqvNXml0Pw1
	8rV0Hydw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMB1k-00000007Ki1-3C7M;
	Thu, 20 Nov 2025 20:13:12 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMB1j-00000007Khn-03y1;
	Thu, 20 Nov 2025 20:13:11 +0000
Message-ID: <669d4bbb-4011-493c-b056-34e682a1ac26@infradead.org>
Date: Thu, 20 Nov 2025 12:13:10 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64, lib: make ARM64 select
 ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION not GENERIC_CPU_CACHE_MAINTENANCE
To: Conor Dooley <conor@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Will Deacon
 <will@kernel.org>, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
References: <20251119-zippy-distinct-1e2a7da7b69b@spud>
 <aR9QRuUigBsxxelm@arm.com> <20251120-ruined-liability-9ecbf53affd1@spud>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251120-ruined-liability-9ecbf53affd1@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 11/20/25 11:29 AM, Conor Dooley wrote:
> On Thu, Nov 20, 2025 at 05:30:46PM +0000, Catalin Marinas wrote:
>> On Wed, Nov 19, 2025 at 07:08:27PM +0000, Conor Dooley wrote:
>>> index 09aec4a1e13f..ac223e627bc5 100644
>>> --- a/lib/Kconfig
>>> +++ b/lib/Kconfig
>>> @@ -544,8 +544,9 @@ config ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
>>>  	bool
>>>  
>>>  config GENERIC_CPU_CACHE_MAINTENANCE
>>> -	bool
>>> -	select ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
>>> +	def_bool y
>>> +	depends on ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
>>> +	depends on ARM64
>>
>> That's what we do if GENERIC_CPU_CACHE_MAINTENANCE depends on some arch
>> code but that's not the case here. GENERIC_CPU_CACHE_MAINTENANCE is an
>> alternative implementation that an arch can select if it does not
>> provide its own. I find the current code without the above patch better.
> 
> Right, I am going to leave it as-is for now then. That's both you and I
> (and presumably Jonathan) finding the current form more natural. Sorry
> Randy!

Thanks. I tried.

I still say that it makes no sense for something generic
(GENERIC_CPU_CACHE_MAINTENANCE in lib/Kconfig) to inform the
config system that the config has something $ARCH-specific
(ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION).

>>
>> Maybe what gets confusing here is that the core code uses
>> ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION directly. A more involved fix
>> would be something like:
>>
>> config CPU_CACHE_INVALIDATE_MEMREGION
>> 	def_bool y
>> 	depends on ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION ||
>> 		GENERIC_CPU_CACHE_MAINTENANCE
>>
>> and then go and change all the uses of
>> ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION.
>>
>> Up to you, the current code also works for me.
>>
>> -- 
>> Catalin

-- 
~Randy


