Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EAFBC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 17:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U31Xbtndyw9wKdxoAQK5VnD6sVH1D2nZ+zp+rLJieFA=; b=p2V7JjqObq9GI02YrNNrXHfmdS
	M85Qih3Dheeia7ABu1xpN/ltUGwwK+EECVtvUyHs5JJqnzLBohkx86udqLm+8gGi55FBHwOIqCZnE
	ufurI0KdR04jynbxFthllvAn8Mc+YvlsU23qR/iPHKLuN31GhwtU84SsI4qo8v2h5v3cqxBHlkjZ0
	bNT+4LXJm8hxWV0TrY1PZ50uAJE1CWkUqMG01o7g7WdtAomdTFIW+NWK3nQ188++rhuKgUsfBnQqa
	8uOUbaFN7K2TmKX+l+dWzDmxnIveygahWRYOTn8uuBmfT8cwS16Nk7dCSeGZyL+7jcx2J3sHradsq
	EmIgV/tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVDHN-0000000FSAH-3Aih;
	Fri, 27 Jun 2025 17:54:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVC6R-0000000FIzQ-2K8K
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 16:39:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F196328C7;
	Fri, 27 Jun 2025 09:38:45 -0700 (PDT)
Received: from [10.1.197.43] (eglon.cambridge.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D764F3F58B;
	Fri, 27 Jun 2025 09:39:01 -0700 (PDT)
Message-ID: <77874f70-a6e9-4388-b7ba-71bf8b44455b@arm.com>
Date: Fri, 27 Jun 2025 17:39:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: cacheinfo: Provide helper to compress MPIDR
 value into u32
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, sudeep.holla@arm.com,
 Rob Herring <robh@kernel.org>, Ben Horgan <ben.horgan@arm.com>
References: <20250613130356.8080-1-james.morse@arm.com>
 <20250613130356.8080-4-james.morse@arm.com>
 <20250617171410.000004cf@huawei.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20250617171410.000004cf@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_093903_715412_EF2F3731 
X-CRM114-Status: GOOD (  24.84  )
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

Hi Jonathan,

On 17/06/2025 17:14, Jonathan Cameron wrote:
> On Fri, 13 Jun 2025 13:03:54 +0000
> James Morse <james.morse@arm.com> wrote:
> 
>> Filesystems like resctrl use the cache-id exposed via sysfs to identify
>> groups of CPUs. The value is also used for PCIe cache steering tags. On
>> DT platforms cache-id is not something that is described in the
>> device-tree, but instead generated from the smallest MPIDR of the CPUs
>> associated with that cache. The cache-id exposed to user-space has
>> historically been 32 bits.
>>
>> MPIDR values may be larger than 32 bits.
>>
>> MPIDR only has 32 bits worth of affinity data, but the aff3 field lives
>> above 32bits. The corresponding lower bits are masked out by
>> MPIDR_HWID_BITMASK and contain an SMT flag and Uni-Processor flag.
>>
>> Swizzzle the aff3 field into the bottom 32 bits and using that.
>>
>> In case more affinity fields are added in the future, the upper RES0
>> area should be checked. Returning a value greater than 32 bits from
>> this helper will cause the caller to give up on allocating cache-ids.

> I'd mention that in the code via a comment, not just the commit message.

Sure!


>> Signed-off-by: James Morse <james.morse@arm.com>
> 
> Seems a few unrelated tiny things snuck in here.
> 
> Otherwise seems fine to me.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

Thanks!


>> diff --git a/arch/arm64/include/asm/cache.h b/arch/arm64/include/asm/cache.h
>> index 99cd6546e72e..f8798dc96364 100644
>> --- a/arch/arm64/include/asm/cache.h
>> +++ b/arch/arm64/include/asm/cache.h
>> @@ -42,6 +42,7 @@
>>  
>>  #include <asm/cputype.h>
>>  #include <asm/mte-def.h>
>> +#include <asm/suspend.h>

> That seems a little random?  Why?

That's a hangover from a much earlier version that tried to use the MPIDR 'hash' that
cpu-suspend already creates. But the advice was to avoid that as if we find platforms with
wildly sparse MPIDR values, we'd need to make that 'hash' smarter to save memory - and
having an ABI hanging from it would be a hindrance.

Hence the swizzle.

>>  #include <asm/sysreg.h>
>>  
>>  #ifdef CONFIG_KASAN_SW_TAGS
>> @@ -87,6 +88,19 @@ int cache_line_size(void);
>>  
>>  #define dma_get_cache_alignment	cache_line_size
>>  
>> +/* Compress a u64 MPIDR value into 32 bits. */
>> +static inline u64 arch_compact_of_hwid(u64 id)
>> +{
>> +	u64 aff3 = MPIDR_AFFINITY_LEVEL(id, 3);
>> +
>> +	/* These bits are expected to be RES0 */
>> +	if (FIELD_GET(GENMASK_ULL(63, 40), id))
>> +		return id;
> 
> I would add a comment that the way this fails is to ensure
> there are bits in the upper bits.  It is a little unusual
> as APIs go but matches the not defined variant so sort of
> makes sense.

Yup, subtle enough that its worth a comment!

|	/*
|	 * These bits are expected to be RES0. If not, return a value with
|	 * the upper 32 bits set to force the caller to give up on 32 bit
|	 * cache ids.
|	 */


>> +
>> +	return (aff3 << 24) | FIELD_GET(GENMASK_ULL(23, 0), id);
>> +}
>> +#define arch_compact_of_hwid	arch_compact_of_hwid
>> +
>>  /*
>>   * Read the effective value of CTR_EL0.
>>   *
>> diff --git a/arch/arm64/kernel/sleep.S b/arch/arm64/kernel/sleep.S
>> index f093cdf71be1..ebc23304d430 100644
>> --- a/arch/arm64/kernel/sleep.S
>> +++ b/arch/arm64/kernel/sleep.S
>> @@ -50,6 +50,7 @@
>>  	lsr	\mask ,\mask, \rs3
>>  	orr	\dst, \dst, \mask		// dst|=(aff3>>rs3)
>>  	.endm
>> +
> 
> Stray change.

This is a left over from trying to use the above 'hash' directly.

All fixed,


Thanks!

James

