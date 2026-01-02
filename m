Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC8C0FA3748
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 14:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wskbq3AOu0NxErRGQplrcDGU1PpejFz3bTarOqSrRXU=; b=ezrPg9oQdL1rgNspNH9LnyxQyH
	/RpgZ26yvoCwc78dzVPOHfEaua9Vwv/nCQP6NJQE9Iz9uq7ImkE2zC8sSw7uqBr6WXS1cugwq+zJp
	vvt9xyMDdWpDXlPKtX7nX4eRn/RfRDHTcQ6XGs+jpRCJa+Tr8PGhLfY0uJ6MMW70Cisp7Lb34bn/v
	hKhcyOSZHcCWIdyeyht4+LdkKBbMIbgb/iqgsfAjKTXjbTxYMziayCqsS29rjwT8hGlLa8bYi84NO
	K2KMo+zNY6tGPNPrxtLltK4mv6pXZhI5EJsfdu19eU9qwcQZOtxXtMmxCcbXrmNOJMmNJmBaSJZyD
	oAh+MJ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbfzR-00000008Lq9-0kOD;
	Fri, 02 Jan 2026 14:18:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbfzP-00000008LpO-1hm7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 14:18:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6EB18497;
	Fri,  2 Jan 2026 06:18:42 -0800 (PST)
Received: from [10.57.94.221] (unknown [10.57.94.221])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 943E03F63F;
	Fri,  2 Jan 2026 06:18:46 -0800 (PST)
Message-ID: <de91c62d-e7f8-4005-bb62-d3a2dfe57da4@arm.com>
Date: Fri, 2 Jan 2026 14:18:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/13] arm64: mm: Re-implement the __tlbi_level macro
 as a C function
Content-Language: en-GB
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>,
 Dev Jain <dev.jain@arm.com>, Linu Cherian <Linu.Cherian@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251216144601.2106412-1-ryan.roberts@arm.com>
 <20251216144601.2106412-2-ryan.roberts@arm.com>
 <20251216175309.00001935@huawei.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20251216175309.00001935@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_061851_492779_3027C71B 
X-CRM114-Status: GOOD (  13.45  )
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

Happy new year!


On 16/12/2025 17:53, Jonathan Cameron wrote:
> On Tue, 16 Dec 2025 14:45:46 +0000
> Ryan Roberts <ryan.roberts@arm.com> wrote:
> 
>> As part of efforts to reduce our reliance on complex preprocessor macros
>> for TLB invalidation routines, convert the __tlbi_level macro to a C
>> function for by-level TLB invalidation.
>>
>> Each specific tlbi level op is implemented as a C function and the
>> appropriate function pointer is passed to __tlbi_level(). Since
>> everything is declared inline and is statically resolvable, the compiler
>> will convert the indirect function call to a direct inline execution.
>>
>> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>> ---
> 
>> +static __always_inline void __tlbi_level(tlbi_op op, u64 addr, u32 level)
>> +{
>> +	u64 arg = addr;
>> +
>> +	if (alternative_has_cap_unlikely(ARM64_HAS_ARMv8_4_TTL) && level <= 3) {
>> +		u64 ttl = level | (get_trans_granule() << 2);
>> +
>> +		arg &= ~TLBI_TTL_MASK;
>> +		arg |= FIELD_PREP(TLBI_TTL_MASK, ttl);
> 
> Probably don't care, but I think you could do
> 		FIELD_MODIFY(TLBI_TTL_MASK, &arg, ttl);
> instead of those two lines. Code generation hopefully similar?
> So depends on which macros you find more readable.

Yeah that's probably slightly neater - I'll switch to this for the next version.

Thanks,
Ryan

> 
>> +	}
>> +
>> +	op(arg);
>> +}
>>  
>>  #define __tlbi_user_level(op, arg, level) do {				\
>>  	if (arm64_kernel_unmapped_at_el0())				\
> 


