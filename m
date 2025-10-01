Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B237CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 17:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KtHH5slsD8Ox5MoPLqaiqd9jBeTgdv0YVlgjsuTd720=; b=zbrWBpfH7XkAXmKjAvZH2U+9am
	Elx6B7fMUn+XPu8wnpzL7gymrs939QI4PcdUDyehAwQ5PnoflabZDnOW84IEJTMsVqBh+/aUbH4zM
	zhDXEREguYtafeuIrMaiIKWGhDV4Bjg8U5349oDt3l9MhK+zY32shWEjo+xssvMHl1+Rv9EIVk/uu
	Ak4HHsDIbe3fM2NcsIoEbATvxX3gJH+y7lVUYFvGYLehxI4Ndd+YKqMyvwa/2qLme7rY9x6NRPFk/
	gT9ofrG6Rse9KbBEJh3vqQBJjnuLJ0g/SqjbthPAitLEU/EEHMoNfUBUPbVvNukgaIMctJR2+PaMD
	SIuAxcng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v40XB-00000008dXA-0wbn;
	Wed, 01 Oct 2025 17:22:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v40X8-00000008dVJ-3fvc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 17:22:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DDF2116F8;
	Wed,  1 Oct 2025 10:22:19 -0700 (PDT)
Received: from [10.57.66.40] (unknown [10.57.66.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 30AE33F59E;
	Wed,  1 Oct 2025 10:22:22 -0700 (PDT)
Message-ID: <69b1c489-b4cb-4bee-aff1-6c76fc48cf29@arm.com>
Date: Wed, 1 Oct 2025 19:22:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v5 13/18] mm: Map page tables with privileged pkey
To: David Hildenbrand <david@redhat.com>, linux-hardening@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Andy Lutomirski <luto@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Ira Weiny <ira.weiny@intel.com>, Jann Horn <jannh@google.com>,
 Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>,
 Kees Cook <kees@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Marc Zyngier <maz@kernel.org>,
 Mark Brown <broonie@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Maxwell Bland <mbland@motorola.com>, "Mike Rapoport (IBM)"
 <rppt@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Pierre Langlois <pierre.langlois@arm.com>,
 Quentin Perret <qperret@google.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, x86@kernel.org
References: <20250815085512.2182322-1-kevin.brodsky@arm.com>
 <20250815085512.2182322-14-kevin.brodsky@arm.com>
 <48ed62b1-cceb-4bce-923c-25c11dbccc37@redhat.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <48ed62b1-cceb-4bce-923c-25c11dbccc37@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_102231_024423_6ED06562 
X-CRM114-Status: GOOD (  21.91  )
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

On 01/10/2025 17:28, David Hildenbrand wrote:
> On 15.08.25 10:55, Kevin Brodsky wrote:
>
> Just wondering, should the patch subject be:
>
> "mm: protect page tables with privileged pkey" ?
>
> At least patch #2 tells me that set_memory_pkey() will set the
> protection key, and the function is called
> "kpkeys_protect_pgtable_memory"?
>
> Just trying to connect the dots here :)

That's fair! I suppose I meant "map with privileged pkey" in the sense
of "modify the mapping/PTE to set the pkey". But I see how that can be
confusing, as we're not creating any mapping. I'll reword that in v6.

>
>> If CONFIG_KPKEYS_HARDENED_PGTABLES is enabled, map allocated page
>> table pages using a privileged pkey (KPKEYS_PKEY_PGTABLES), so that
>> page tables can only be written under guard(kpkeys_hardened_pgtables).
>>
>> This patch is a no-op if CONFIG_KPKEYS_HARDENED_PGTABLES is disabled
>> (default).
>>
>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> ---
>>   include/linux/mm.h | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> index d9371d992033..4880cb7a4cb9 100644
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -34,6 +34,7 @@
>>   #include <linux/slab.h>
>>   #include <linux/cacheinfo.h>
>>   #include <linux/rcuwait.h>
>> +#include <linux/kpkeys.h>
>>     struct mempolicy;
>>   struct anon_vma;
>> @@ -2979,6 +2980,8 @@ static inline bool __pagetable_ctor(struct
>> ptdesc *ptdesc)
>>         __folio_set_pgtable(folio);
>>       lruvec_stat_add_folio(folio, NR_PAGETABLE);
>> +    if (kpkeys_protect_pgtable_memory(folio))
>> +        return false;
>>       return true;
>>   }
>>   @@ -2989,6 +2992,7 @@ static inline void pagetable_dtor(struct
>> ptdesc *ptdesc)
>>       ptlock_free(ptdesc);
>>       __folio_clear_pgtable(folio);
>>       lruvec_stat_sub_folio(folio, NR_PAGETABLE);
>> +    kpkeys_unprotect_pgtable_memory(folio);
>
> This is all rather nasty. Not your fault.
>
> In the near future page tables will not be folios, and the whole
> ptdesc_folio() conversion will not make any sense.

Ah, interesting. Any patches/series I should be aware of?

>
> Likely you should make kpkeys_protect_pgtable_memory() etc. consume an
> address range, or a page range right from the start.

Got it. That said, as per the discussion on the cover letter [1], it's
quite likely that we'll have to change the approach completely anyway
(i.e. allocate PTPs from a dedicated pool where the pkey is already set).

- Kevin

[1] lore.kernel.org/r/aMwd7IJVECEy8mzf@willie-the-truck

