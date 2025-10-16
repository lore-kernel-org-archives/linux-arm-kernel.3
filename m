Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E35CCD194
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 06:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gg9vVYRYme0Oph6wt3GX580TIGz/cMrpJz2YK85M9sI=; b=PfMgRjz3cXpQP3jXq0HHlqZbKB
	5Hn44hwjct9+rhgHWVDg1iPgdYO1YAy5mMWNWKSnkPlh57J4Znbe5cKsvA+zqdFW4zdQ8lCBk6rY2
	a/EKis2lxZDKHNvhWPj2uY8Dr0WZL2/m9OIwA0X6TF8OahDfVPOR9oktZgsvgNmQczJiLbeb6u9vo
	IAwI8zZJ9GOaGYI+cwXeKhFfQjNSahlxu54OnaCzM+3iPynkL2PP3t2MdYs7ctp6NmYTVEHtCFevs
	x6MyTd086GYrleiAb2OnIxkTOZ5qxqlqGSpxtPvaNMhTBqY0wqhfYFzggxiRupPlul8BsdRS5KDWh
	V/bJh5gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9H7F-00000003ZF9-3PrB;
	Thu, 16 Oct 2025 06:05:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9H7C-00000003ZEc-3zu1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 06:05:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9F8B1688;
	Wed, 15 Oct 2025 23:05:21 -0700 (PDT)
Received: from [10.163.68.150] (unknown [10.163.68.150])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 95DB03F738;
	Wed, 15 Oct 2025 23:05:24 -0700 (PDT)
Message-ID: <5280450d-e18e-4362-b48c-0f759c8d37e5@arm.com>
Date: Thu, 16 Oct 2025 11:35:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64/mm: Allow __create_pgd_mapping() to
 propagate pgtable_alloc() errors
To: Kevin Brodsky <kevin.brodsky@arm.com>, Linu Cherian
 <linu.cherian@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Ryan Roberts <ryan.roberts@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
 Zhenhua Huang <quic_zhenhuah@quicinc.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Yang Shi <yang@os.amperecomputing.com>,
 Chaitanya S Prakash <chaitanyas.prakash@arm.com>, stable@vger.kernel.org
References: <20251015112758.2701604-1-linu.cherian@arm.com>
 <20251015112758.2701604-2-linu.cherian@arm.com>
 <965b11fd-3e29-4f29-a1bf-b8e98940b322@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <965b11fd-3e29-4f29-a1bf-b8e98940b322@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_230531_089018_17BEB6E6 
X-CRM114-Status: GOOD (  20.02  )
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


On 15/10/25 9:35 pm, Kevin Brodsky wrote:
> On 15/10/2025 13:27, Linu Cherian wrote:
>> From: Chaitanya S Prakash <chaitanyas.prakash@arm.com>
>>
>> arch_add_memory() is used to hotplug memory into a system but as a part
>> of its implementation it calls __create_pgd_mapping(), which uses
>> pgtable_alloc() in order to build intermediate page tables. As this path
>> was initally only used during early boot pgtable_alloc() is designed to
>> BUG_ON() on failure. However, in the event that memory hotplug is
>> attempted when the system's memory is extremely tight and the allocation
>> were to fail, it would lead to panicking the system, which is not
>> desirable. Hence update __create_pgd_mapping and all it's callers to be
>> non void and propagate -ENOMEM on allocation failure to allow system to
>> fail gracefully.
>>
>> But during early boot if there is an allocation failure, we want the
>> system to panic, hence create a wrapper around __create_pgd_mapping()
>> called early_create_pgd_mapping() which is designed to panic, if ret
>> is non zero value. All the init calls are updated to use this wrapper
>> rather than the modified __create_pgd_mapping() to restore
>> functionality.
>>
>> Fixes: 4ab215061554 ("arm64: Add memory hotplug support")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Chaitanya S Prakash <chaitanyas.prakash@arm.com>
>> Signed-off-by: Linu Cherian <linu.cherian@arm.com>
> A couple more nits below (sorry I didn't catch them earlier), but otherwise:
>
> Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
>
>> ---
>> Changelog:
>>
>> v3:
>> * Fixed a maybe-uninitialized case in alloc_init_pud
>> * Added Fixes tag and CCed stable
>> * Few other trivial cleanups
>>
>>   arch/arm64/mm/mmu.c | 210 ++++++++++++++++++++++++++++----------------
>>   1 file changed, 132 insertions(+), 78 deletions(-)
>>
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index b8d37eb037fc..638cb4df31a9 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -49,6 +49,8 @@
>>   #define NO_CONT_MAPPINGS	BIT(1)
>>   #define NO_EXEC_MAPPINGS	BIT(2)	/* assumes FEAT_HPDS is not used */
>>   
>> +#define INVALID_PHYS_ADDR	(-1ULL)
>> +
>>   DEFINE_STATIC_KEY_FALSE(arm64_ptdump_lock_key);
>>   
>>   u64 kimage_voffset __ro_after_init;
>> @@ -194,11 +196,11 @@ static void init_pte(pte_t *ptep, unsigned long addr, unsigned long end,
>>   	} while (ptep++, addr += PAGE_SIZE, addr != end);
>>   }
>>   
>> -static void alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
>> -				unsigned long end, phys_addr_t phys,
>> -				pgprot_t prot,
>> -				phys_addr_t (*pgtable_alloc)(enum pgtable_type),
>> -				int flags)
>> +static int alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
>> +			       unsigned long end, phys_addr_t phys,
>> +			       pgprot_t prot,
>> +			       phys_addr_t (*pgtable_alloc)(enum pgtable_type),
>> +			       int flags)
>>   {
>>   	unsigned long next;
>>   	pmd_t pmd = READ_ONCE(*pmdp);
>> @@ -213,6 +215,8 @@ static void alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
>>   			pmdval |= PMD_TABLE_PXN;
>>   		BUG_ON(!pgtable_alloc);
>>   		pte_phys = pgtable_alloc(TABLE_PTE);
>> +		if (pte_phys == INVALID_PHYS_ADDR)
>> +			return -ENOMEM;
>>   		ptep = pte_set_fixmap(pte_phys);
>>   		init_clear_pgtable(ptep);
>>   		ptep += pte_index(addr);
>> @@ -244,12 +248,15 @@ static void alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
>>   	 * walker.
>>   	 */
>>   	pte_clear_fixmap();
>> +
>> +	return 0;
>>   }
>>   
>> -static void init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
>> -		     phys_addr_t phys, pgprot_t prot,
>> -		     phys_addr_t (*pgtable_alloc)(enum pgtable_type), int flags)
>> +static int init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
>> +		    phys_addr_t phys, pgprot_t prot,
>> +		    phys_addr_t (*pgtable_alloc)(enum pgtable_type), int flags)
>>   {
>> +	int ret;
> Nit: that could be added to the else block instead (makes it clearer
> it's not used for the final return, that got me confused when re-reading
> this patch).

+1.

Reviewed-by: Dev Jain <dev.jain@arm.com>

>
>
> [...]

