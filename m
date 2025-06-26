Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C2CC7EE33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 08:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vd7tMTohoa6LeQOn+qr9faH9kFeLhtHVyKmiHETqjmE=; b=nl8muEnFh7VRPk1A/vMjp6Vcon
	eTFDFmpkJQqoGamm0phZRu8lM/8H/uCEHDujltNPgm3yPfc33gatWnCuzQH9MUwRc3dpRfs1VArgw
	LPyZvQvVDSg89OMNGB3oqfr0Vwi4G4HBUXZ4NZFSO39fcHXZ8b2hU6DlY14TIIvkkd0eaDouDQ/sa
	R99eR/i46rQjSD++MyEvCoWO7lID6/Jj5u2hbVKC6l/+BMjBysDl0oxXbDLx7YIhwHY8xF60GdZ8Q
	LqzsUievjyHQXgZhp4m8QSzqfZ0U7xL1T4h5gtk8aYyYQlLNntrHyxFmKVDe9QUeGIZPur9YyaRyN
	Fs945zIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUiP5-0000000B3d7-1Acg;
	Thu, 26 Jun 2025 08:56:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUhlC-0000000AvY6-3Yli
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 08:15:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 143371063;
	Thu, 26 Jun 2025 01:14:48 -0700 (PDT)
Received: from [10.57.84.221] (unknown [10.57.84.221])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 97D7B3F58B;
	Thu, 26 Jun 2025 01:15:02 -0700 (PDT)
Message-ID: <48400a85-3f0f-4b4c-81aa-0e7d1dc14c9d@arm.com>
Date: Thu, 26 Jun 2025 09:15:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: pageattr: Use pagewalk API to change memory
 permissions
Content-Language: en-GB
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org, david@redhat.com,
 catalin.marinas@arm.com, will@kernel.org
Cc: lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, suzuki.poulose@arm.com, steven.price@arm.com,
 gshan@redhat.com, linux-arm-kernel@lists.infradead.org,
 yang@os.amperecomputing.com, anshuman.khandual@arm.com
References: <20250613134352.65994-1-dev.jain@arm.com>
 <20250613134352.65994-2-dev.jain@arm.com>
 <1bb09534-56bd-4aba-b7e8-dad8bf6e9200@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <1bb09534-56bd-4aba-b7e8-dad8bf6e9200@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_011506_969658_D0CFE657 
X-CRM114-Status: GOOD (  20.12  )
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

On 26/06/2025 06:47, Dev Jain wrote:
> 
> On 13/06/25 7:13 pm, Dev Jain wrote:
>> arm64 currently changes permissions on vmalloc objects locklessly, via
>> apply_to_page_range, whose limitation is to deny changing permissions for
>> block mappings. Therefore, we move away to use the generic pagewalk API,
>> thus paving the path for enabling huge mappings by default on kernel space
>> mappings, thus leading to more efficient TLB usage. However, the API
>> currently enforces the init_mm.mmap_lock to be held. To avoid the
>> unnecessary bottleneck of the mmap_lock for our usecase, this patch
>> extends this generic API to be used locklessly, so as to retain the
>> existing behaviour for changing permissions. Apart from this reason, it is
>> noted at [1] that KFENCE can manipulate kernel pgtable entries during
>> softirqs. It does this by calling set_memory_valid() -> __change_memory_common().
>> This being a non-sleepable context, we cannot take the init_mm mmap lock.
>>
>> Add comments to highlight the conditions under which we can use the
>> lockless variant - no underlying VMA, and the user having exclusive control
>> over the range, thus guaranteeing no concurrent access.
>>
>> Since arm64 cannot handle kernel live mapping splitting without BBML2,
>> we require that the start and end of a given range lie on block mapping
>> boundaries. Return -EINVAL in case a partial block mapping is detected;
>> add a corresponding comment in ___change_memory_common() to warn that
>> eliminating such a condition is the responsibility of the caller.
>>
>> apply_to_page_range() currently performs all pte level callbacks while in
>> lazy mmu mode. Since arm64 can optimize performance by batching barriers
>> when modifying kernel pgtables in lazy mmu mode, we would like to continue
>> to benefit from this optimisation. Unfortunately walk_kernel_page_table_range()
>> does not use lazy mmu mode. However, since the pagewalk framework is not
>> allocating any memory, we can safely bracket the whole operation inside
>> lazy mmu mode ourselves. Therefore, wrap the call to
>> walk_kernel_page_table_range() with the lazy MMU helpers.
>>
>> [1] https://lore.kernel.org/linux-arm-kernel/89d0ad18-4772-4d8f-
>> ae8a-7c48d26a927e@arm.com/
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   arch/arm64/mm/pageattr.c | 157 +++++++++++++++++++++++++++++++--------
>>   include/linux/pagewalk.h |   3 +
>>   mm/pagewalk.c            |  26 +++++++
>>   3 files changed, 154 insertions(+), 32 deletions(-)
>>
>> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
>> index 04d4a8f676db..cfc5279f27a2 100644
>> --- a/arch/arm64/mm/pageattr.c
>> +++ b/arch/arm64/mm/pageattr.c
>> @@ -8,6 +8,7 @@
>>   #include <linux/mem_encrypt.h>
>>   #include <linux/sched.h>
>>   #include <linux/vmalloc.h>
>> +#include <linux/pagewalk.h>
>>     #include <asm/cacheflush.h>
>>   #include <asm/pgtable-prot.h>
>> @@ -20,6 +21,99 @@ struct page_change_data {
>>       pgprot_t clear_mask;
>>   };
>>   +static ptdesc_t set_pageattr_masks(ptdesc_t val, struct mm_walk *walk)
>> +{
>> +    struct page_change_data *masks = walk->private;
>> +
>> +    val &= ~(pgprot_val(masks->clear_mask));
>> +    val |= (pgprot_val(masks->set_mask));
>> +
>> +    return val;
>> +}
>> +
>> +static int pageattr_pgd_entry(pgd_t *pgd, unsigned long addr,
>> +                  unsigned long next, struct mm_walk *walk)
>> +{
>> +    pgd_t val = pgdp_get(pgd);
>> +
>> +    if (pgd_leaf(val)) {
>> +        if (WARN_ON_ONCE((next - addr) != PGDIR_SIZE))
>> +            return -EINVAL;
>> +        val = __pgd(set_pageattr_masks(pgd_val(val), walk));
>> +        set_pgd(pgd, val);
>> +        walk->action = ACTION_CONTINUE;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int pageattr_p4d_entry(p4d_t *p4d, unsigned long addr,
>> +                  unsigned long next, struct mm_walk *walk)
>> +{
>> +    p4d_t val = p4dp_get(p4d);
>> +
>> +    if (p4d_leaf(val)) {
>> +        if (WARN_ON_ONCE((next - addr) != P4D_SIZE))
>> +            return -EINVAL;
>> +        val = __p4d(set_pageattr_masks(p4d_val(val), walk));
>> +        set_p4d(p4d, val);
>> +        walk->action = ACTION_CONTINUE;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int pageattr_pud_entry(pud_t *pud, unsigned long addr,
>> +                  unsigned long next, struct mm_walk *walk)
>> +{
>> +    pud_t val = pudp_get(pud);
>> +
>> +    if (pud_leaf(val)) {
>> +        if (WARN_ON_ONCE((next - addr) != PUD_SIZE))
>> +            return -EINVAL;
>> +        val = __pud(set_pageattr_masks(pud_val(val), walk));
>> +        set_pud(pud, val);
>> +        walk->action = ACTION_CONTINUE;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int pageattr_pmd_entry(pmd_t *pmd, unsigned long addr,
>> +                  unsigned long next, struct mm_walk *walk)
>> +{
>> +    pmd_t val = pmdp_get(pmd);
>> +
>> +    if (pmd_leaf(val)) {
>> +        if (WARN_ON_ONCE((next - addr) != PMD_SIZE))
>> +            return -EINVAL;
>> +        val = __pmd(set_pageattr_masks(pmd_val(val), walk));
>> +        set_pmd(pmd, val);
>> +        walk->action = ACTION_CONTINUE;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int pageattr_pte_entry(pte_t *pte, unsigned long addr,
>> +                  unsigned long next, struct mm_walk *walk)
>> +{
>> +    pte_t val = __ptep_get(pte);
>> +
>> +    val = __pte(set_pageattr_masks(pte_val(val), walk));
>> +    __set_pte(pte, val);
>> +
>> +    return 0;
>> +}
> 
> I was wondering, now that we have vmalloc contpte support,
> do we need to ensure in this pte level callback that
> we don't partially cover a contpte block?

Yes good point!


