Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF8C4D2F011
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 13:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S28p8j3rIGudLqc/Cg3MyXbzy5II9B0UyFHSxXkc0l4=; b=qQ2XP65s8f6K2HGoTOw4t0vbEx
	83VDApSm54V8ATDNZ3liKldi9ephR8qyq5bH3+6AC6pzlRP446O/QzdJsc1HlvtPpZoT9enBNWeIw
	dg7IBb2vVuD5P8NgC38MrJHuR7ND36lXyInmdEeK6rkX3dmUZX6n2g1OA63g5JZVA7lFT23wnP2rs
	UZXpPanOGr/T8+DEWYhVtu9xMqpgT5/SROUZ5fmkIJAwkjGy4g6v1WA/9SrxNxnxWDS51q3wVHg4f
	6faeUgb+jre+W5XmWhmSLqGt8h38oUwMgfB/TF7Dx7LnOmmaEl+Q84yfqGJdUOcgU6SGPc+byqGw2
	i9yTNlhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkj5Q-0000000EJJe-0lh3;
	Tue, 27 Jan 2026 13:26:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkj5M-0000000EJJ3-0b7u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 13:26:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2CC611595;
	Tue, 27 Jan 2026 05:26:17 -0800 (PST)
Received: from [10.1.37.210] (XHFQ2J9959.cambridge.arm.com [10.1.37.210])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9F9E53F632;
	Tue, 27 Jan 2026 05:26:21 -0800 (PST)
Message-ID: <63283f63-f62f-4e8b-9611-94e6a64c49b7@arm.com>
Date: Tue, 27 Jan 2026 13:26:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/13] arm64: mm: Push __TLBI_VADDR() into
 __tlbi_level()
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>,
 Dev Jain <dev.jain@arm.com>, Linu Cherian <Linu.Cherian@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260119172202.1681510-1-ryan.roberts@arm.com>
 <20260119172202.1681510-5-ryan.roberts@arm.com>
 <20260127113758.00005bea@huawei.com>
From: Ryan Roberts <ryan.roberts@arm.com>
Content-Language: en-GB
In-Reply-To: <20260127113758.00005bea@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_052625_340270_2081A024 
X-CRM114-Status: GOOD (  15.14  )
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

On 27/01/2026 11:37, Jonathan Cameron wrote:
> On Mon, 19 Jan 2026 17:21:51 +0000
> Ryan Roberts <ryan.roberts@arm.com> wrote:
> 
>> From: Will Deacon <will@kernel.org>
>>
>> The __TLBI_VADDR() macro takes an ASID and an address and converts them
>> into a single argument formatted correctly for a TLB invalidation
>> instruction.
>>
>> Rather than have callers worry about this (especially in the case where
>> the ASID is zero), push the macro down into __tlbi_level() via a new
>> __tlbi_level_asid() helper.
>>
>> Signed-off-by: Will Deacon <will@kernel.org>
>> Reviewed-by: Linu Cherian <linu.cherian@arm.com>
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> One comment inline, but not particularly important given it's
> about reducing readability of a workaround a little
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> 
>> @@ -674,6 +679,7 @@ static inline bool huge_pmd_needs_flush(pmd_t oldpmd, pmd_t newpmd)
>>  #define huge_pmd_needs_flush huge_pmd_needs_flush
>>  
>>  #undef __tlbi_user
>> +#undef __TLBI_VADDR
>>  #endif
>>  
>>  #endif
>> diff --git a/arch/arm64/kernel/sys_compat.c b/arch/arm64/kernel/sys_compat.c
>> index 4a609e9b65de..ad4857df4830 100644
>> --- a/arch/arm64/kernel/sys_compat.c
>> +++ b/arch/arm64/kernel/sys_compat.c
>> @@ -36,7 +36,7 @@ __do_compat_cache_op(unsigned long start, unsigned long end)
>>  			 * The workaround requires an inner-shareable tlbi.
>>  			 * We pick the reserved-ASID to minimise the impact.
>>  			 */
>> -			__tlbi(aside1is, __TLBI_VADDR(0, 0));
>> +			__tlbi(aside1is, 0UL);
> 
> Dropping the explicit ASID sort of looses some meaning here vs the comment just
> above it.  Meh, it's in a work around so most folk will ignore it anyway
> if reading this code, so I don't mind that much.

Agreed; personally I think the comment makes it clear what that zero is.

Thanks for all your reviews so far!

> 
>>  			dsb(ish);
>>  		}
>>  
> 


