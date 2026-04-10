Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44188F36BAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 04:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+9hZBB7Gf9kFgeqsM8opn55Bd+NuUJf4xQRMbeQ827c=; b=zOLvgo7Je7dyrVFGfqJvpcVpxm
	oYKvUzaddZNNC3gmrCDtnwCdrK4KbETbSbKEpTwU00f8Dec7lkkoQcaAw+LuGw8wiRFCjy3sx095f
	SJ2NOFjLnsQK9n87TYFJhDHTl4xDZVId4wZNhTkHs/b+ydQertXTSFfMXvfMWUVP236Sr6eUorPzc
	wWzHI5uI1y52DpmBj7oBnLEzF0DFJQE2yE0V8VMzPxHwL0nstvIlrzP153D2P+XEfPWBzVww0ht+K
	rTrNui2ibuF5BajZEW+z5QGdk63NDmj4CMx1tN8bOJfNsP0vq2/dHAy+EIrzcpKfyrIhg8JI+OOK/
	abdzl4Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB34j-0000000BZIM-41wm;
	Fri, 10 Apr 2026 04:02:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB34h-0000000BZHz-1VSU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 04:02:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 49A711D13;
	Thu,  9 Apr 2026 21:02:24 -0700 (PDT)
Received: from [10.163.181.174] (unknown [10.163.181.174])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 114033F641;
	Thu,  9 Apr 2026 21:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775793750; bh=SRztj8vW9IVfsNnDlWMXIQNZpY38AX6pQu/yOpn9X3Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dBYFArVv8DgQwTOhXcFrq5eacok3vrOckMgsfIeMP9E8+Tx8IlH/rbYfzpCQF7qxn
	 PrRVggjNP3h4nPwyft1ja8QH3WU2XnQJAXZWL+PfFMYFvgb7y6FMa2zRPKmMBCidc7
	 YW34P13UUVFhVmphad8ixLXOBqfVXQfHTsdBxjKA=
Message-ID: <e5558ba2-dad6-4090-87d0-2fdec426e815@arm.com>
Date: Fri, 10 Apr 2026 09:32:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC V1 11/16] arm64/mm: Route all pgtable atomics to central
 helpers
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Linu Cherian <linu.cherian@arm.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20260224051153.3150613-1-anshuman.khandual@arm.com>
 <20260224051153.3150613-12-anshuman.khandual@arm.com>
 <aeb1972c-57ba-4f21-8289-66424e4e619b@kernel.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <aeb1972c-57ba-4f21-8289-66424e4e619b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_210231_446862_32338883 
X-CRM114-Status: GOOD (  13.68  )
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

On 08/04/26 5:58 PM, David Hildenbrand (Arm) wrote:
> On 2/24/26 06:11, Anshuman Khandual wrote:
>> Route all cmpxchg() operations performed on various page table entries to a
>> new ptdesc_cmpxchg_relaxed() helper. Similarly route all xchg() operations
>> performed on page table entries to a new ptdesc_xchg_relaxed() helper.
>>
>> Currently these helpers just forward to the same APIs that were previously
>> called direct, but in future we will change the routing for D128 which is
>> too long to use the standard APIs.
>>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>>  arch/arm64/include/asm/pgtable.h | 23 +++++++++++++++++------
>>  arch/arm64/mm/fault.c            |  2 +-
>>  2 files changed, 18 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
>> index 42124d2f323d..cf69ce68f951 100644
>> --- a/arch/arm64/include/asm/pgtable.h
>> +++ b/arch/arm64/include/asm/pgtable.h
>> @@ -87,6 +87,17 @@ static inline void arch_leave_lazy_mmu_mode(void)
>>  #define ptdesc_get(x)		READ_ONCE(x)
>>  #define ptdesc_set(x, val)	WRITE_ONCE(x, val)
>>  
>> +static inline ptdesc_t ptdesc_cmpxchg_relaxed(ptdesc_t *ptep, ptdesc_t old,
>> +					      ptdesc_t new)
>> +{
>> +	return cmpxchg_relaxed(ptep, old, new);
>> +}
>> +
>> +static inline ptdesc_t ptdesc_xchg_relaxed(ptdesc_t *ptep, ptdesc_t new)
>> +{
>> +	return xchg_relaxed(ptep, new);
>> +}
>> +
> 
> We really want the rename of ptdesc_t before this change.
> 

Planning to rename ptdesc_t as ptent_t in a pre-requisite
patch early in the series.


