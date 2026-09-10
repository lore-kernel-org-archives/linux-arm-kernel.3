Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A8DC79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 13:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vZU9gX1KkfZsEtD9UnHCrsR7TUYXPV6Jcm5y73SNx+0=; b=jaEj5iaVGqV4Uklzi/+AWWldXN
	RymmEocd+zrLaKadFlkYyH6q2Pt8iBe7AOmeo44GPmPl87w7dOvwfNiJk7kn4BDJwLGaZYm+5DVJZ
	OeyPgPR59mkgYw9U9ymOWj5z395J/jMY1g6TSucLzdR0VL2k5bH3N4nhU4ZCMhys8k7hwZDZi7aE3
	3S/4m2yRdhFAe+94H9JJxB5o//Xf7fk3+xyQQt3LstQLEFq9t5oMnHoQTl4zupzkc7mfw/WQ4JKZj
	UR/iVLoBrve0AyBn5MbJUXWNBQ+JSiMUxqQ+o/ztWOAHZaJUgsbr9yCTsPUbgj44nxhCQ4uaQf1Gn
	KSa6+7uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fHR-0000000EXSR-2Vkq;
	Thu, 10 Sep 2026 13:57:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fHP-0000000EXRr-0g4c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 13:57:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CBA9C153B;
	Thu, 10 Sep 2026 06:57:24 -0700 (PDT)
Received: from [10.0.152.207] (unknown [10.0.152.207])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 976423F59E;
	Thu, 10 Sep 2026 06:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789048648; bh=bTK3HSpYpk3PdlbnIluZycTpUClT0G6QQ/RwSZmtsmQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kXx7GlPfDLC5MBz1VhEylZ0qkPTPDvBHsMdJIKV059r92i+QFdeNQ7gISB9eE41mY
	 cbgAacwoa5HyDEGb6kTrc/mpwpHqZSzqhg1m8QZ8ycdozvqi3SQEvhVwhCVcJPFRm+
	 rSW8YbNy5s0rZi+7mjEXfIdK7H7Jc90ncj0Zm/C4=
Message-ID: <8339f3d3-3f1b-44c6-b701-3d800642c5c8@arm.com>
Date: Thu, 10 Sep 2026 14:57:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: mm: Fix pfn_is_map_memory() misreporting mapped
 memory
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
 liulhong617@gmail.com, ardb@kernel.org
References: <20260908162033.74509-1-vladimir.murzin@arm.com>
 <aqFflGnTdVQopWvQ@willie-the-truck>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <aqFflGnTdVQopWvQ@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_065731_238619_2A6D0315 
X-CRM114-Status: GOOD (  15.80  )
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

On 9/9/26 14:31, Will Deacon wrote:
> On Tue, Sep 08, 2026 at 05:20:33PM +0100, Vladimir Murzin wrote:
>> Commit 7ace06a01efa ("arm64: mm: fix accidental linear mapping of
>> no-map reserved memory") removed sub-page no-map regions from the
>> linear mapping. However, pfn_is_map_memory() can still report that
>> such a region is mapped.
>>
>> For instance, with 64K pages, say we have
>>
>> normal:        ...–0xa2007fff
>> no-map: 0xa2008000–0xa200ffff
>> normal: 0xa2010000–...
>>
>> The range 0xa2000000–0xa200ffff is not linearly mapped, but
>> pfn_is_map_memory(__phys_to_pfn(0xa2008000)) aligns the address to
>> page granularity and passes 0xa2000000 to memblock_is_map_memory().
>> That address belongs to the preceding normal memblock region, so the
>> no-map region is ignored and the function returns true.
>>
>> Fix that by checking if entire page is subset of memory block.
>>
>> Fixes: 7ace06a01efa ("arm64: mm: fix accidental linear mapping of no-map reserved memory")
>> Assisted-by: LLM
>> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
>> ---
>>  arch/arm64/mm/init.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
>> index fbf215ecc7d0..5da80e1e1727 100644
>> --- a/arch/arm64/mm/init.c
>> +++ b/arch/arm64/mm/init.c
>> @@ -172,7 +172,8 @@ int pfn_is_map_memory(unsigned long pfn)
>>  	if (PHYS_PFN(addr) != pfn)
>>  		return 0;
>>  
>> -	return memblock_is_map_memory(addr);
>> +	return memblock_is_region_memory(addr, PAGE_SIZE) &&
>> +		memblock_is_map_memory(addr);
>>  }
> Yuck, this is really grotty :(
> 
> Can we at least predicate the extra memblock_is_region_memory() check on
> having a page-size > 4k?
> 

The same can happen with 4K page size and subpage no-map and I have not seen
anything prohibiting subpage no-map ...

Cheers
Vladimir

> Will
> 


