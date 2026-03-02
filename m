Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85B7D58E4F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 04:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cMLe22ZH8ax/OwtpsGVAKqhua1x5KYk9QkH3LqCQoDk=; b=GWPoJ3+ppojcse8rbwkEOYpNH0
	2LVKQYXtAatZjKLrBnudUKPKSepvNBoe9fE4bx8Vj7cDZu6TZLGpNWXMyots95zuB6lUC5m14wkDm
	o9PKRc+NSvbDtrIC+uWH7Ibue0Qlh9ZeOHaT8wu8XOfkvdMUHoi3j8RFOlU+u7UX4lW4K/HbyLLWG
	d6YCdFXxYc1kDHZbTFBthfgeTNbYju+Hbq9aznwxrBzo/vO+4aCzLdkL4Ah+VUTfI+81VPoTQMZXY
	/EG2FyM2033s8gM3mxBfKvx0oyS9oyzSI8sFdFJUHTtjJWuwW0Svq1TlvkGiC9s3/IYtaigQyC3yc
	ZKE02u/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwuz4-0000000CGBF-3wGV;
	Mon, 02 Mar 2026 04:34:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwuz1-0000000CGAl-1csg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 04:34:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDEAB14BF;
	Sun,  1 Mar 2026 20:34:04 -0800 (PST)
Received: from [10.164.18.51] (unknown [10.164.18.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A82023F7BD;
	Sun,  1 Mar 2026 20:34:07 -0800 (PST)
Message-ID: <7f7130d0-f348-451e-960e-b7e6ae9c9ee7@arm.com>
Date: Mon, 2 Mar 2026 10:04:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC V1 09/16] arm64/mm: Route all pgtable reads via ptdesc_get()
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Linu Cherian <linu.cherian@arm.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20260224051153.3150613-1-anshuman.khandual@arm.com>
 <20260224051153.3150613-10-anshuman.khandual@arm.com>
 <aaLO3yOu1ShO2tNz@kernel.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <aaLO3yOu1ShO2tNz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_203415_632177_1045BA56 
X-CRM114-Status: GOOD (  15.54  )
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



On 28/02/26 4:47 PM, Mike Rapoport wrote:
> Hi Anshuman,
> 
> On Tue, Feb 24, 2026 at 10:41:46AM +0530, Anshuman Khandual wrote:
>> Define arm64 platform specific implementations for new pXdp_get() helpers.
>> These resolve into READ_ONCE(), thus ensuring required single copy atomic
>> semantics for the page table entry reads.
>>
>> In future this infrastructure can be used for D128 to maintain single copy
>> atomicity semantics with inline asm blocks.
>>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>>  arch/arm64/include/asm/pgtable.h | 28 +++++++++++++++++++++++++++-
>>  1 file changed, 27 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
>> index 257af1c3015d..804ef49aea88 100644
>> --- a/arch/arm64/include/asm/pgtable.h
>> +++ b/arch/arm64/include/asm/pgtable.h
>> @@ -84,6 +84,32 @@ static inline void arch_leave_lazy_mmu_mode(void)
>>  	arch_flush_lazy_mmu_mode();
>>  }
>>  
>> +#define ptdesc_get(x)		READ_ONCE(x)
> 
> This will be confusing with 'struct ptdesc' APIs, maybe ptent_get()?

Created 'ptdesc_t' earlier on arm64 platform as an unified data type, which could
represent page table entries including their protection fields and masks for any
level.

typedef u64 ptdesc_t;

typedef ptdesc_t pteval_t;
typedef ptdesc_t pmdval_t;
typedef ptdesc_t pudval_t;
typedef ptdesc_t p4dval_t;
typedef ptdesc_t pgdval_t;

But now it conflicts with generic 'struct ptdesc'. Agreed that overall renaming is
required. Probably ptent_t along with ptent_get/set() could be an option. But that
is probably orthogonal to the series and can be done later in a separate patch.

> 
>> +#define pmdp_get pmdp_get
>> +static inline pmd_t pmdp_get(pmd_t *pmdp)
>> +{
>> +	return ptdesc_get(*pmdp);
>> +}
>> +
>> +#define pudp_get pudp_get
>> +static inline pud_t pudp_get(pud_t *pudp)
>> +{
>> +	return ptdesc_get(*pudp);
>> +}
>> +
>> +#define p4dp_get p4dp_get
>> +static inline p4d_t p4dp_get(p4d_t *p4dp)
>> +{
>> +	return ptdesc_get(*p4dp);
>> +}
>> +
>> +#define pgdp_get pgdp_get
>> +static inline pgd_t pgdp_get(pgd_t *pgdp)
>> +{
>> +	return ptdesc_get(*pgdp);
>> +}
>> +
>>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>>  #define __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
>>  
>> @@ -384,7 +410,7 @@ static inline void __set_pte(pte_t *ptep, pte_t pte)
>>  
>>  static inline pte_t __ptep_get(pte_t *ptep)
>>  {
>> -	return READ_ONCE(*ptep);
>> +	return ptdesc_get(*ptep);
>>  }
>>  
>>  extern void __sync_icache_dcache(pte_t pteval);
>> -- 
>> 2.43.0
>>
> 


