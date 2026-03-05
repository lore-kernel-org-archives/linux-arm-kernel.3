Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDF3F30928
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 09:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AQZLec4BAneo8BhInQA5agN2qdzjXNpGaV/sLShC5Io=; b=GBWn3yAzaPSe+y5FsWRmpPzeSJ
	86LNZit50DJ7BA1LPZiCWexrmI1kcFdM5hqriI+KnH+s2EGD0ithuK91d++3uMkVdy8Lnmz4cQx3d
	tnBEsFFUh7BlZrnOxXSiXOXlb/9o4mRb/1W4uRB/7Y7VmbwCGKgDGLZkY+cmGnXHfOKgQD6UHWD+d
	sTkfpy7PoKc196VDWKY9aHBZOXLoY60EfT3XLxUlIIicMr5EjNJGwx+SvEKvVa87J3utke3r6v9mR
	1e8Nb6VICuOgg+lsLW8rKDVVbdwbgaBG0sHOEBWrUL1jH+0VSxIWn5zzblu6WGIcCQ7SID32wDgDF
	3+rdw+xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5As-00000001QJE-2J1i;
	Thu, 05 Mar 2026 09:39:18 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5Aq-00000001QIp-3Fu1
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Mar 2026 09:39:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=AQZLec4BAneo8BhInQA5agN2qdzjXNpGaV/sLShC5Io=; b=lVy2BNBo02bKsSgfM71yPWMrkL
	0tohFKZw1GmRvfeVnESEHj62qgPfNQnJ/GUJprpjXcTIkhFEkW1ONG41mLMFj33sc0YfghMcfSYRv
	6E0fflnhEVG3z/BtnbbUEExnoWNgyym1KaO//EwejPvM+1HHhoviOtdIoX2I5eT7f0/u9PgRgK8+g
	uvOGUUfqiYck/5Sk88cuMqFlpnEpKicIp6LlgmiRm3KMsfUh9FzQ2l/7nbboD5uDyDqgWyCsgly/d
	ao4wPMiPmzqg5pN7on6tBxmaxd9V871zd4t2kobcdmqjweQ9wcJYm5qtQPneFIS0auXUKq25AkUWA
	wJeHE3DA==;
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5An-0000000ElAl-1h6r
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 09:39:15 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=AQZLec4BAneo8BhInQA5agN2qdzjXNpGaV/sLShC5Io=;
	b=DMN7BrRaySUoQIncAzgL91m7t6EL8KkrdjCtskwDaAvv0bqFp5mIGOekePkbVmNmpwY3NzwFl
	4zZKHzJPpaN9HV9Xtms61DIJ6ktWBzLnKwD4JdbFX0v1kAzFgOeKvTIUXoscdDvqOaZSAatS4GD
	w+pbrCszYAfWyYaFETZX/bI=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4fRPW932C4znTWB;
	Thu,  5 Mar 2026 17:34:13 +0800 (CST)
Received: from kwepemr500001.china.huawei.com (unknown [7.202.194.229])
	by mail.maildlp.com (Postfix) with ESMTPS id 77BFF402AB;
	Thu,  5 Mar 2026 17:38:49 +0800 (CST)
Received: from [10.174.179.248] (10.174.179.248) by
 kwepemr500001.china.huawei.com (7.202.194.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 5 Mar 2026 17:38:47 +0800
Message-ID: <e8d5ba16-3071-4b4a-b6a1-d492cc46e8c2@huawei.com>
Date: Thu, 5 Mar 2026 17:38:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 2/4] mm/pgtable: Make pfn_pte() filter out huge
 page attributes
To: Matthew Wilcox <willy@infradead.org>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
	<jgross@suse.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <david@kernel.org>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <luto@kernel.org>, <peterz@infradead.org>,
	<akpm@linux-foundation.org>, <lorenzo.stoakes@oracle.com>, <ziy@nvidia.com>,
	<baolin.wang@linux.alibaba.com>, <Liam.Howlett@oracle.com>,
	<npache@redhat.com>, <ryan.roberts@arm.com>, <dev.jain@arm.com>,
	<baohua@kernel.org>, <lance.yang@linux.dev>, <vbabka@suse.cz>,
	<rppt@kernel.org>, <surenb@google.com>, <mhocko@suse.com>,
	<anshuman.khandual@arm.com>, <rmclure@linux.ibm.com>,
	<kevin.brodsky@arm.com>, <apopple@nvidia.com>, <ajd@linux.ibm.com>,
	<pasha.tatashin@soleen.com>, <bhe@redhat.com>, <thuth@redhat.com>,
	<coxu@redhat.com>, <dan.j.williams@intel.com>, <yu-cheng.yu@intel.com>,
	<baolu.lu@linux.intel.com>, <conor.dooley@microchip.com>,
	<Jonathan.Cameron@huawei.com>, <riel@surriel.com>, Kefeng Wang
	<wangkefeng.wang@huawei.com>, <chenjun102@huawei.com>
References: <20260228070906.1418911-1-yintirui@huawei.com>
 <20260228070906.1418911-3-yintirui@huawei.com>
 <5eaf3846-01db-471e-9903-b0b239d7838d@suse.com>
From: Yin Tirui <yintirui@huawei.com>
In-Reply-To: <5eaf3846-01db-471e-9903-b0b239d7838d@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.248]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemr500001.china.huawei.com (7.202.194.229)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_093914_006046_8B7FB845 
X-CRM114-Status: GOOD (  18.21  )
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


On 3/4/2026 3:52 PM, Jürgen Groß wrote:
> On 28.02.26 08:09, Yin Tirui wrote:
>> A fundamental principle of page table type safety is that `pte_t` 
>> represents
>> the lowest level page table entry and should never carry huge page 
>> attributes.
>>
>> Currently, passing a pgprot with huge page bits (e.g., extracted via
>> pmd_pgprot()) into pfn_pte() creates a malformed PTE that retains the 
>> huge
>> attribute, leading to the necessity of the ugly `pte_clrhuge()` anti- 
>> pattern.
>>
>> Enforce type safety by making `pfn_pte()` inherently filter out huge page
>> attributes:
>> - On x86: Strip the `_PAGE_PSE` bit.
>> - On ARM64: Mask out the block descriptor bits in `PTE_TYPE_MASK` and
>>    enforce the `PTE_TYPE_PAGE` format.
>> - On RISC-V: No changes required, as RISC-V leaf PMDs and PTEs share the
>>    exact same hardware format and do not use a distinct huge bit.
>>
>> Signed-off-by: Yin Tirui <yintirui@huawei.com>
>> ---
>>   arch/arm64/include/asm/pgtable.h | 4 +++-
>>   arch/x86/include/asm/pgtable.h   | 4 ++++
>>   2 files changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/ 
>> asm/pgtable.h
>> index b3e58735c49b..f2a7a40106d2 100644
>> --- a/arch/arm64/include/asm/pgtable.h
>> +++ b/arch/arm64/include/asm/pgtable.h
>> @@ -141,7 +141,9 @@ static inline pteval_t 
>> __phys_to_pte_val(phys_addr_t phys)
>>   #define pte_pfn(pte)        (__pte_to_phys(pte) >> PAGE_SHIFT)
>>   #define pfn_pte(pfn,prot)    \
>> -    __pte(__phys_to_pte_val((phys_addr_t)(pfn) << PAGE_SHIFT) | 
>> pgprot_val(prot))
>> +    __pte(__phys_to_pte_val((phys_addr_t)(pfn) << PAGE_SHIFT) | \
>> +        ((pgprot_val(prot) & ~(PTE_TYPE_MASK & ~PTE_VALID)) | \
>> +        (PTE_TYPE_PAGE & ~PTE_VALID)))
>>   #define pte_none(pte)        (!pte_val(pte))
>>   #define pte_page(pte)        (pfn_to_page(pte_pfn(pte)))
>> diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/ 
>> pgtable.h
>> index 1662c5a8f445..a4dbd81d42bf 100644
>> --- a/arch/x86/include/asm/pgtable.h
>> +++ b/arch/x86/include/asm/pgtable.h
>> @@ -738,6 +738,10 @@ static inline pgprotval_t check_pgprot(pgprot_t 
>> pgprot)
>>   static inline pte_t pfn_pte(unsigned long page_nr, pgprot_t pgprot)
>>   {
>>       phys_addr_t pfn = (phys_addr_t)page_nr << PAGE_SHIFT;
>> +
>> +    /* Filter out _PAGE_PSE to ensure PTEs never carry the huge page 
>> bit */
>> +    pgprot = __pgprot(pgprot_val(pgprot) & ~_PAGE_PSE);
> 
> Is it really a good idea to silently drop the bit?
> 
> Today it can either be used for a large page (which should be a pmd,
> of course), or - much worse - you'd strip the _PAGE_PAT bit, which is
> at the same position in PTEs.
> 
> So basically you are removing the ability to use some cache modes.
> 
> NACK!
> 
> 
> Juergen

Hi Willy and Jürgen,

Following up on the x86 _PAGE_PSE and _PAGE_PAT aliasing issue.

To achieve the goal of keeping pfn_pte() pure and completely eradicating 
the pte_clrhuge() anti-pattern, we need a way to ensure pfn_pte() never 
receives a pgprot with the huge bit set.

@Jürgen:
Just to be absolutely certain: is there any safe way to filter out the 
huge page attributes directly inside x86's pfn_pte() without breaking 
PAT? Or does the hardware bit-aliasing make this strictly impossible at 
the pfn_pte() level?

@Willy @Jürgen:
Assuming it is impossible to filter this safely inside pfn_pte() on x86, 
we must translate the pgprot before passing it down. To maintain strict 
type-safety and still drop pte_clrhuge(), I plan to introduce two 
arch-neutral wrappers:

x86:
/* Translates large prot to 4K. Shifts PAT back to bit 7, inherently 
clearing _PAGE_PSE */
#define pgprot_huge_to_pte(prot)    pgprot_large_2_4k(prot)
/* Translates 4K prot to large. Shifts PAT to bit 12, strictly sets 
_PAGE_PSE */
#define pgprot_pte_to_huge(prot) 
__pgprot(pgprot_val(pgprot_4k_2_large(prot)) | _PAGE_PSE)

arm64:
/*
  * Drops Block marker, enforces Page marker.
  * Strictly preserves the PTE_VALID bit to avoid validating PROT_NONE 
pages.
  */
#define pgprot_huge_to_pte(prot) \
      __pgprot((pgprot_val(prot) & ~(PMD_TYPE_MASK & ~PTE_VALID)) | \
             (PTE_TYPE_PAGE & ~PTE_VALID))
/*
  * Drops Page marker, sets Block marker.
  * Strictly preserves the PTE_VALID bit.
  */
#define pgprot_pte_to_huge(prot) \
      __pgprot((pgprot_val(prot) & ~(PTE_TYPE_MASK & ~PTE_VALID)) | \
             (PMD_TYPE_SECT & ~PTE_VALID))

Usage:
1.  Creating a huge pfnmap (remap_try_huge_pmd)
pgprot_t huge_prot = pgprot_pte_to_huge(prot);

/* No need for pmd_mkhuge() */
pmd_t entry = pmd_mkspecial(pfn_pmd(pfn, huge_prot));
set_pmd_at(mm, addr, pmd, entry);

2. Splitting a huge pfnmap (__split_huge_pmd_locked)
pgprot_t small_prot = pgprot_huge_to_pte(pmd_pgprot(old_pmd));

/* No need for pte_clrhuge() */
pte_t entry = pfn_pte(pmd_pfn(old_pmd), small_prot);
set_ptes(mm, haddr, pte, entry, HPAGE_PMD_NR);


Willy, is there a better architectural approach to handle this and 
satisfy the type-safety requirement given the x86 hardware constraints?

-- 
Thanks,
Yin Tirui


