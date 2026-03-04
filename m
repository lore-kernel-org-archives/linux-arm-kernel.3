Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95172EB7EAC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 10:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+3GcVJzJOaMrQj6u+FGtRxjCJVOJSzeAFf3bB9pddjs=; b=Sr3gS9ZyEO3mj/05Qv3ODfbExb
	geIsI0ApY5Xx3li3ketRtMeugMjyhTafH62V3nuXY35WwAvSZ19eNPsM55qoOb+KyXePSgnb8QV4O
	9MQa+ZDvn112M0OMdIKx7DlakEjORcBMmgGtA4LZn+moLALkArt/70J1PNVARGu4u5VmBTNiv3q9X
	EV8jto7+xV8JO9C7K+cL26RC0QqLJp8hfe6P72OKbcxoMOXzz4RMztWhr+vB9E+vA5L5Il6OYzGyg
	62RROpcDNWsIVG7lzdzvy0Bs2TQXE+JsXyWcLtlWpAfq8UMyyc7X2juHNXR0KFZI9IQnGeQ0ovpak
	aBLAP4fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxj9b-0000000GxGc-3AZj;
	Wed, 04 Mar 2026 10:08:31 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxj9Y-0000000GxG8-28SI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 10:08:30 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=+3GcVJzJOaMrQj6u+FGtRxjCJVOJSzeAFf3bB9pddjs=;
	b=3Sd8e7IlxgM+6czm7SzeGmkr1MLLDXO3tCM90f/PRMZbGdwZOlHMpSuUd0Q7wVWYXYDDWFnoe
	ifUJTiBz8rrZ+72EuC7XFQzC7tBFGqehMQ2spOylh/k/yN9fCSWrN12T24KcxcjdV8ejC7I90vW
	4/cJZkYdSaqj2n/xxhpwW1g=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4fQpCJ5647z1prkr;
	Wed,  4 Mar 2026 18:03:24 +0800 (CST)
Received: from kwepemr500001.china.huawei.com (unknown [7.202.194.229])
	by mail.maildlp.com (Postfix) with ESMTPS id 2A63C40363;
	Wed,  4 Mar 2026 18:08:18 +0800 (CST)
Received: from [10.174.179.248] (10.174.179.248) by
 kwepemr500001.china.huawei.com (7.202.194.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 4 Mar 2026 18:08:16 +0800
Message-ID: <204de22f-335a-46f3-8f96-f1cbdcf7f2bf@huawei.com>
Date: Wed, 4 Mar 2026 18:08:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 2/4] mm/pgtable: Make pfn_pte() filter out huge
 page attributes
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	<linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <willy@infradead.org>,
	<david@kernel.org>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <luto@kernel.org>,
	<peterz@infradead.org>, <akpm@linux-foundation.org>,
	<lorenzo.stoakes@oracle.com>, <ziy@nvidia.com>,
	<baolin.wang@linux.alibaba.com>, <Liam.Howlett@oracle.com>,
	<npache@redhat.com>, <ryan.roberts@arm.com>, <dev.jain@arm.com>,
	<baohua@kernel.org>, <lance.yang@linux.dev>, <vbabka@suse.cz>,
	<rppt@kernel.org>, <surenb@google.com>, <mhocko@suse.com>,
	<anshuman.khandual@arm.com>, <rmclure@linux.ibm.com>,
	<kevin.brodsky@arm.com>, <apopple@nvidia.com>, <ajd@linux.ibm.com>,
	<pasha.tatashin@soleen.com>, <bhe@redhat.com>, <thuth@redhat.com>,
	<coxu@redhat.com>, <dan.j.williams@intel.com>, <yu-cheng.yu@intel.com>,
	<yangyicong@hisilicon.com>, <baolu.lu@linux.intel.com>,
	<conor.dooley@microchip.com>, <Jonathan.Cameron@huawei.com>,
	<riel@surriel.com>
CC: <wangkefeng.wang@huawei.com>, <chenjun102@huawei.com>
References: <20260228070906.1418911-1-yintirui@huawei.com>
 <20260228070906.1418911-3-yintirui@huawei.com>
 <5eaf3846-01db-471e-9903-b0b239d7838d@suse.com>
From: Yin Tirui <yintirui@huawei.com>
In-Reply-To: <5eaf3846-01db-471e-9903-b0b239d7838d@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.248]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemr500001.china.huawei.com (7.202.194.229)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_020829_221923_26C8A513 
X-CRM114-Status: GOOD (  17.93  )
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

Hi Jürgen,

You are absolutely right. I missed the fact that `_PAGE_PSE` aliases 
with `_PAGE_PAT` on 4K PTEs.

The intention here was to follow previous feedback to enforce type 
safety by filtering out huge page attributes directly inside 
`pfn_pte()`. However, doing it this way obviously breaks the cache modes 
on x86.

I agree with the NACK. I will drop this approach and rethink how to 
handle the huge-to-normal pgprot conversion safely for v4.

-- 
Thanks,
Yin Tirui


