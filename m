Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94532CFA457
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 23:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r/yOkojlG4VD+pIIVD7qud3d5hgnfLW9r4pFZjJytls=; b=VkWFFrzhsyO0k9wTrasGKH2jQ0
	MLaP/1N/c8wZfPkyrAxmw7XtEX3ie7LVx4JY1rKDeCLOfsR3fZMFNJgx7HAynr0lXlgHMKYLQtK7c
	FVag97XRpWyiWtvBJB/UTRMIxzhr9MIIEtbIp8iTWFsPw5iZ2uZl7FZ1roCD7n99GuL2Ffv50fJJF
	WuZQ5kDDMmHR/2laCshQfVLc1fqrwozF3ptl2rzYFS53c5uQfhuaJ58Oz/45gtAqqNWNyrRoKBg3z
	rK/IKoWg+rrGRZ9ANPMYHa4Cy7B2ZIjnE38ivHvWGzZzX38fnohgWAzDyCdF3HOMZOefGFE1IsZxj
	Fz4/s2Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vME2B-00000007Yyd-3GMb;
	Thu, 20 Nov 2025 23:25:51 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vME27-00000007YyQ-0a2A;
	Thu, 20 Nov 2025 23:25:47 +0000
Message-ID: <a6fff5b6-7e7f-4883-b905-500d55dbf21e@infradead.org>
Date: Thu, 20 Nov 2025 15:25:46 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64, lib: make ARM64 select
 ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION not GENERIC_CPU_CACHE_MAINTENANCE
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Conor Dooley <conor@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Will Deacon
 <will@kernel.org>, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
References: <20251119-zippy-distinct-1e2a7da7b69b@spud>
 <aR9QRuUigBsxxelm@arm.com> <20251120-ruined-liability-9ecbf53affd1@spud>
 <669d4bbb-4011-493c-b056-34e682a1ac26@infradead.org>
 <aR-KxRIDvGNlW2jy@arm.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <aR-KxRIDvGNlW2jy@arm.com>
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



On 11/20/25 1:40 PM, Catalin Marinas wrote:
> On Thu, Nov 20, 2025 at 12:13:10PM -0800, Randy Dunlap wrote:
>> On 11/20/25 11:29 AM, Conor Dooley wrote:
>>> On Thu, Nov 20, 2025 at 05:30:46PM +0000, Catalin Marinas wrote:
>>>> On Wed, Nov 19, 2025 at 07:08:27PM +0000, Conor Dooley wrote:
>>>>> index 09aec4a1e13f..ac223e627bc5 100644
>>>>> --- a/lib/Kconfig
>>>>> +++ b/lib/Kconfig
>>>>> @@ -544,8 +544,9 @@ config ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
>>>>>  	bool
>>>>>  
>>>>>  config GENERIC_CPU_CACHE_MAINTENANCE
>>>>> -	bool
>>>>> -	select ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
>>>>> +	def_bool y
>>>>> +	depends on ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
>>>>> +	depends on ARM64
>>>>
>>>> That's what we do if GENERIC_CPU_CACHE_MAINTENANCE depends on some arch
>>>> code but that's not the case here. GENERIC_CPU_CACHE_MAINTENANCE is an
>>>> alternative implementation that an arch can select if it does not
>>>> provide its own. I find the current code without the above patch better.
>>>
>>> Right, I am going to leave it as-is for now then. That's both you and I
>>> (and presumably Jonathan) finding the current form more natural. Sorry
>>> Randy!
>>
>> Thanks. I tried.
>>
>> I still say that it makes no sense for something generic
>> (GENERIC_CPU_CACHE_MAINTENANCE in lib/Kconfig) to inform the
>> config system that the config has something $ARCH-specific
>> (ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION).
> 
> Yes, that's not great either but the solution with the GENERIC depending
> on ARCH does work since there's no actual dependency between them.
> 
> As an alternative, I'm happy for arm64 to select both the ARCH and
> GENERIC options if you think that works better.
> 

Yes, I think that would be much better.
Thanks.

-- 
~Randy


