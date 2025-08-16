Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4860ECA0EE9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Aug 2025 15:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=INpo4ZGiyqYm7Aw9/xIgKfImea5bD5vhYmnUmNC+ki4=; b=iJ6pd0uxBz/VswBasfDSFKlTEA
	TUs5G199NANjcX308/mSCaA1g1wfBK4Z0GnMzl4KPKNVlo/cRq17DJoaAtxk3oyECBVzTWoXG8WHn
	0W3AKBQLRHekv0luEDLZGHNrTHgQZOGx82ih350gLPlgcx2lYrgX/t2hu+8DR00u9wEVcIp1vvtAN
	30VzbyO9SmyUiZ7YmhLRfGRJPLhBpw0wCnRkeTIGKbh3ENBbN4WGYp3GKXGsVcrJZzBOz9NDccXAv
	xH4OwZzXIkwBS1UabTPOEGfLSArTa6IGRfPTC6u8tyA1dzKv3yqzQHUtGMgvhUrCNxcfu/IJ6/4R/
	aJkQD7Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unJIc-00000004sIw-2Qe6;
	Sat, 16 Aug 2025 15:58:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unInf-00000004qCC-0kjV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 Aug 2025 15:26:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E1B435C26E1;
	Sat, 16 Aug 2025 15:26:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A586C4CEEF;
	Sat, 16 Aug 2025 15:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755357989;
	bh=Pc4q8yjY8pxZXyMW5NA6zIA9FgLD4a52pcg6bXs53hc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=i0UR2x2/Uy/VCJta0LcRf9hVPfE+cxny4aiT/Uz048xnKZOhwlKu5x0IAxYyy4JHT
	 or+hmzQ3DUbdoerIvupVraj4bRIBoEmkqj0psjRoSLkIj1yh5SUu7OSBEupL8x4Fd4
	 ut2pXLlFTcDQ/GnW2dmKOrQ2sVMy42jnVN+AsXuaZ0VZHzZKJUiZKaXCkHRGQLAL8S
	 fxmKYy4aE4yo1kg7e/AJOi1A+FkmkGs3EeuFkO/ft5ObauSVo0/yqNvtbmPP9uBjZB
	 3nfFQCQLsRx95RBPCpEJ92LY25sRARzi53yrsD0bUt8fu3YH503wQmkLfLUXaxi+n/
	 Rsvd3Y8dShXfg==
Message-ID: <b0dfb39b-e72e-4b8f-bd4a-bc8320aae98f@kernel.org>
Date: Sat, 16 Aug 2025 17:26:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] iommu: apple-dart: Add 4-level page table support
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>,
 Hector Martin <marcan@marcan.st>
References: <20250814-apple-dart-4levels-v1-0-db2214a78c08@jannau.net>
 <20250814-apple-dart-4levels-v1-3-db2214a78c08@jannau.net>
 <c9440d31-add4-4c0f-ac2a-184e771ab455@kernel.org>
 <2d3e818d-5bc3-4156-a0c6-6d756f814c86@app.fastmail.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <2d3e818d-5bc3-4156-a0c6-6d756f814c86@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_082631_411639_89290DCB 
X-CRM114-Status: GOOD (  19.28  )
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

On 16.08.25 16:19, Janne Grunau wrote:
> Hej,
> 
> On Sat, Aug 16, 2025, at 15:50, Sven Peter wrote:
>> On 14.08.25 10:40, Janne Grunau wrote:
>>> From: Hector Martin <marcan@marcan.st>
>>>
>>> The T8110 variant DART implementation on T602x SoCs indicates an IAS
>>> of 42, which requires an extra page table level. The extra level is
>>> optional, but let's implement it.
>>>
>>> Since the driver failed at IO page table creation with 42-bit IAS add
>>> "apple,t6020-dart" as separate compatible using the T8110 HW data.
>>
>> Is the commit description outdated? I don't see this change anywhere.
> 
> yes, I decided to handle this as missing feature / bug. Both end up with
> the same result and as far as we can tell it is fully compatible.
> Removed locally.
> 
>>> Later it might be useful to restrict this based on the actual
>>> attached devices, since most won't need that much address space
>>> anyway.
>>>
>>> Signed-off-by: Hector Martin <marcan@marcan.st> Signed-off-by: Janne
>>> Grunau <j@jannau.net>
>>> ---
>>>    drivers/iommu/apple-dart.c | 23 +++++++++++++++++------ 1 file
>>>    changed, 17 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
>>> index e72a93e78e26ca61b233c83d439dbdfadf040fc6..bb48e8603d6c84bcf107-
>>> 294d851c2f2fc1273298 100644 --- a/drivers/iommu/apple-dart.c +++ b/drivers/iommu/apple-
>>> dart.c @@ -133,6 +133,7 @@  #define DART_T8110_TCR
>>> 0x1000  #define DART_T8110_TCR_REMAP            GENMASK(11, 8)
>>> #define DART_T8110_TCR_REMAP_EN         BIT(7) +#define
>>> DART_T8110_TCR_FOUR_LEVEL       BIT(3)  #define
>>> DART_T8110_TCR_BYPASS_DAPF      BIT(2)  #define
>>> DART_T8110_TCR_BYPASS_DART      BIT(1)  #define
>>> DART_T8110_TCR_TRANSLATE_ENABLE BIT(0) @@ -177,6 +178,7 @@ struct
>>> apple_dart_hw {     u32 tcr_enabled;     u32 tcr_disabled;     u32
>>> tcr_bypass;
>>> +    u32 tcr_4level;
>>>
>>>       u32 ttbr; u32 ttbr_valid; @@ -217,6 +219,7 @@ struct apple_dart
>>>       { u32 pgsize; u32 num_streams; u32 supports_bypass : 1;
>>> +    u32 four_level : 1;
>>>
>>>       struct iommu_group *sid2group[DART_MAX_STREAMS]; struct
>>>       iommu_device iommu; @@ -305,13 +308,16 @@ static struct
>>>       apple_dart_domain *to_dart_domain(struct iommu_domain *dom) }
>>>
>>>    static void -apple_dart_hw_enable_translation(struct
>>>    apple_dart_stream_map *stream_map)
>>>    +apple_dart_hw_enable_translation(struct apple_dart_stream_map
>>>    *stream_map, int levels) {   struct apple_dart *dart = stream_map-
>>>    >dart;   int sid;
>>>
>>> +    WARN_ON(levels != 3 && levels != 4);
>>> +    WARN_ON(levels == 4 && !dart->four_level); for_each_set_bit(sid,
>>>       stream_map->sidmap, dart->num_streams)
>>> -            writel(dart->hw->tcr_enabled, dart->regs +
>>>               DART_TCR(dart, sid));
>>> +            writel(dart->hw->tcr_enabled | (levels == 4 ? dart->hw-
>>>               >tcr_4level : 0),
>>> +                   dart->regs + DART_TCR(dart, sid));
>>
>> This is a bit hard to read, I'd prefer an explicit if (dart->hw-
>>> tcr_4level) here.
> 
> you mean `if (levels == 4)`? `dart->hw->tcr_4level` will be `BIT(3)` for
> t8110 darts even when they use just 3 page table levels.

yup, I must've copy/pasted the wrong thing.

> 
> Changed locally to
> 
> u32 tcr = dart->hw->tcr_enabled; if (levels == 4)        tcr |= dart->hw-
>> tcr_4level;
> 
> and then writel(tcr, ...) in the loop.
Great, I didn't even realize you could move that entire thing out of the 
loop.

> I've change prefix of all commits in this series to "iommu/apple-dart"
> and "iommu/io-pgtable-dart".

Feel free to add my Reviewed-by for this commit as well then.



Thanks,

Sven


