Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD65C021BB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PMSevmP25jDlHbCmAt/SAJg02V/QK2/1dPbCM298kg0=; b=fJe61C5fk5J3j4zRx71SFWvgHV
	nNX2hYz8N3KxSYaKFcVVB1T765Wv69Y5DgiswM5FOQ16CRAfuz7caaZ85UDnUKMIK7v47JM2rPfTW
	ANq6L4VAftVEltTRdUk5MLVk+vt+YDROKdGSO7fzKp/40vQNw/vrJXs6kCrbnlZyzDvnU5DVqhcmz
	rB+hymqreVcJQAPPdJelMaytHAfLSU7v2qk9GIQZlYkoqlSF2ibdb38O0lP0yVi7+iljEeJTmgVw/
	OoeR/p1EkQnJCgZY+yGdcC0rkoZ2YJgnbYHTS+tcZe2t/KS8BhiMNVHEW+cj68oXVukq7E7XIXht9
	3P+m1x6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy2f-00000000OAX-2ubk;
	Tue, 25 Feb 2025 16:44:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmx5T-000000006Xs-3uEb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 15:43:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A0CD1BCB;
	Tue, 25 Feb 2025 07:43:27 -0800 (PST)
Received: from [10.1.27.154] (XHFQ2J9959.cambridge.arm.com [10.1.27.154])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF7D43F5A1;
	Tue, 25 Feb 2025 07:43:05 -0800 (PST)
Message-ID: <290f858c-07d4-4690-998c-2aefac664d7b@arm.com>
Date: Tue, 25 Feb 2025 15:43:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] mm: hugetlb: Add huge page size param to
 huge_ptep_get_and_clear()
Content-Language: en-GB
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Arnd Bergmann <arnd@arndb.de>,
 Muchun Song <muchun.song@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 David Hildenbrand <david@redhat.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, Dev Jain <dev.jain@arm.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20250217140419.1702389-1-ryan.roberts@arm.com>
 <20250217140419.1702389-2-ryan.roberts@arm.com>
 <Z73Szw4rSHSyfpoy@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <Z73Szw4rSHSyfpoy@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_074312_067502_4C751433 
X-CRM114-Status: GOOD (  22.08  )
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

On 25/02/2025 14:25, Alexander Gordeev wrote:
> On Mon, Feb 17, 2025 at 02:04:14PM +0000, Ryan Roberts wrote:
> 
> Hi Ryan,
> 
>> In order to fix a bug, arm64 needs to be told the size of the huge page
>> for which the huge_pte is being set in huge_ptep_get_and_clear().
>> Provide for this by adding an `unsigned long sz` parameter to the
>> function. This follows the same pattern as huge_pte_clear() and
>> set_huge_pte_at().
>>
>> This commit makes the required interface modifications to the core mm as
>> well as all arches that implement this function (arm64, loongarch, mips,
>> parisc, powerpc, riscv, s390, sparc). The actual arm64 bug will be fixed
>> in a separate commit.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: 66b3923a1a0f ("arm64: hugetlb: add support for PTE contiguous bit")
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>> ---
> ...
>> diff --git a/arch/s390/include/asm/hugetlb.h b/arch/s390/include/asm/hugetlb.h
>> index 7c52acaf9f82..420c74306779 100644
>> --- a/arch/s390/include/asm/hugetlb.h
>> +++ b/arch/s390/include/asm/hugetlb.h
>> @@ -26,7 +26,11 @@ void __set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
>>  pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr, pte_t *ptep);
>>  
>>  #define __HAVE_ARCH_HUGE_PTEP_GET_AND_CLEAR
>> -pte_t huge_ptep_get_and_clear(struct mm_struct *mm, unsigned long addr, pte_t *ptep);
>> +pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
>> +			      unsigned long addr, pte_t *ptep,
>> +			      unsigned long sz);
> 
> Please, format parameters similarily to set_huge_pte_at() few lines above.

Appologies. I've fixed this for the next version.

> 
>> +pte_t __huge_ptep_get_and_clear(struct mm_struct *mm,
>> +			      unsigned long addr, pte_t *ptep);
> 
> The formatting is broken, but please see below.

Formatting fixed here too.

> 
>>  static inline void arch_clear_hugetlb_flags(struct folio *folio)
>>  {
>> @@ -48,7 +52,7 @@ static inline void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
>>  static inline pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
>>  					  unsigned long address, pte_t *ptep)
>>  {
>> -	return huge_ptep_get_and_clear(vma->vm_mm, address, ptep);
>> +	return __huge_ptep_get_and_clear(vma->vm_mm, address, ptep);
>>  }
>>  
>>  #define  __HAVE_ARCH_HUGE_PTEP_SET_ACCESS_FLAGS
>> @@ -59,7 +63,7 @@ static inline int huge_ptep_set_access_flags(struct vm_area_struct *vma,
>>  	int changed = !pte_same(huge_ptep_get(vma->vm_mm, addr, ptep), pte);
>>  
>>  	if (changed) {
>> -		huge_ptep_get_and_clear(vma->vm_mm, addr, ptep);
>> +		__huge_ptep_get_and_clear(vma->vm_mm, addr, ptep);
>>  		__set_huge_pte_at(vma->vm_mm, addr, ptep, pte);
>>  	}
>>  	return changed;
>> @@ -69,7 +73,7 @@ static inline int huge_ptep_set_access_flags(struct vm_area_struct *vma,
>>  static inline void huge_ptep_set_wrprotect(struct mm_struct *mm,
>>  					   unsigned long addr, pte_t *ptep)
>>  {
>> -	pte_t pte = huge_ptep_get_and_clear(mm, addr, ptep);
>> +	pte_t pte = __huge_ptep_get_and_clear(mm, addr, ptep);
>>  
>>  	__set_huge_pte_at(mm, addr, ptep, pte_wrprotect(pte));
>>  }
>> diff --git a/arch/s390/mm/hugetlbpage.c b/arch/s390/mm/hugetlbpage.c
>> index d9ce199953de..52ee8e854195 100644
>> --- a/arch/s390/mm/hugetlbpage.c
>> +++ b/arch/s390/mm/hugetlbpage.c
>> @@ -188,8 +188,8 @@ pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
>>  	return __rste_to_pte(pte_val(*ptep));
>>  }
>>  
>> -pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
>> -			      unsigned long addr, pte_t *ptep)
>> +pte_t __huge_ptep_get_and_clear(struct mm_struct *mm,
>> +				unsigned long addr, pte_t *ptep)
>>  {
>>  	pte_t pte = huge_ptep_get(mm, addr, ptep);
>>  	pmd_t *pmdp = (pmd_t *) ptep;
>> @@ -202,6 +202,12 @@ pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
>>  	return pte;
>>  }
>>  
>> +pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
>> +			      unsigned long addr, pte_t *ptep, unsigned long sz)
>> +{
>> +	return __huge_ptep_get_and_clear(mm, addr, ptep);
>> +}
> 
> Is there a reason why this is not a header inline, as other callers of
> __huge_ptep_get_and_clear()?

I was trying to make the change as uninvasive as possible, so didn't want to
change the linkage in case I accidentally broke something. Happy to make this an
inline in the header though, if you prefer?

Thanks,
Ryan

> 
>>  pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
>>  			unsigned long addr, unsigned long sz)
>>  {
> ...
> 
> Thanks!


