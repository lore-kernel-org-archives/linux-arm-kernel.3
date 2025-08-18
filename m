Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A9B9CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 17:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4QNxJ3AwcrmxWJXei7lx3D+jrxggbeNTcJnx6MBtMsk=; b=knqMpsiG0XjCHNBuPYvp3/o/og
	0cEqLz0QzCvK2UegI5BzshRMq63oTMG8LOJJiUPxNRmF3SK0tN7L/IiE88/Q0/s2HcAwQyW7DxUnZ
	dCYXnZiPu29YshsA4DiViJGeVnAHN85jE0gOx/NYUtxvs0V/atB10LPtaA++qSE8DTAE7VNSyXe3a
	QSXiIeX0xVWdR2NJUeAbFdlkxIAox27X/eJxtK652s3T8rdg/2ATSH6X5KAUd1q/pu/vHBDTx/kpD
	1zAq0uWkDWsfSLDGcd38+pVeRios0RSYsrItrFbZaDB0ctiYwgZC9NBQpnn/XjtCKE6JvtmTI3oUa
	PVsFzbDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3jN-00000008BwO-2UYZ;
	Mon, 18 Aug 2025 17:33:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo2Jy-00000007z5E-0236
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 16:02:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5ECF31596;
	Mon, 18 Aug 2025 09:02:44 -0700 (PDT)
Received: from [10.57.58.12] (unknown [10.57.58.12])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB0343F63F;
	Mon, 18 Aug 2025 09:02:46 -0700 (PDT)
Message-ID: <b6579c2a-2262-4279-81a5-8235092bea13@arm.com>
Date: Mon, 18 Aug 2025 18:02:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v5 13/18] mm: Map page tables with privileged pkey
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>
Cc: "maz@kernel.org" <maz@kernel.org>, "luto@kernel.org" <luto@kernel.org>,
 "willy@infradead.org" <willy@infradead.org>,
 "mbland@motorola.com" <mbland@motorola.com>,
 "david@redhat.com" <david@redhat.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "rppt@kernel.org" <rppt@kernel.org>, "joey.gouly@arm.com"
 <joey.gouly@arm.com>, "akpm@linux-foundation.org"
 <akpm@linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "Weiny, Ira" <ira.weiny@intel.com>, "vbabka@suse.cz" <vbabka@suse.cz>,
 "pierre.langlois@arm.com" <pierre.langlois@arm.com>,
 "jeffxu@chromium.org" <jeffxu@chromium.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>,
 "kees@kernel.org" <kees@kernel.org>,
 "ryan.roberts@arm.com" <ryan.roberts@arm.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "jannh@google.com" <jannh@google.com>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "will@kernel.org" <will@kernel.org>,
 "qperret@google.com" <qperret@google.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "broonie@kernel.org" <broonie@kernel.org>, "x86@kernel.org" <x86@kernel.org>
References: <20250815085512.2182322-1-kevin.brodsky@arm.com>
 <20250815085512.2182322-14-kevin.brodsky@arm.com>
 <616011cf17f1654ac3ad8757f0f33425b3af1ddd.camel@intel.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <616011cf17f1654ac3ad8757f0f33425b3af1ddd.camel@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_090254_122053_D458FEEE 
X-CRM114-Status: GOOD (  16.43  )
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

On 15/08/2025 18:37, Edgecombe, Rick P wrote:
> On Fri, 2025-08-15 at 09:55 +0100, Kevin Brodsky wrote:
>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> index d9371d992033..4880cb7a4cb9 100644
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -34,6 +34,7 @@
>>  #include <linux/slab.h>
>>  #include <linux/cacheinfo.h>
>>  #include <linux/rcuwait.h>
>> +#include <linux/kpkeys.h>
>>  
>>  struct mempolicy;
>>  struct anon_vma;
>> @@ -2979,6 +2980,8 @@ static inline bool __pagetable_ctor(struct ptdesc *ptdesc)
>>  
>>  	__folio_set_pgtable(folio);
>>  	lruvec_stat_add_folio(folio, NR_PAGETABLE);
>> +	if (kpkeys_protect_pgtable_memory(folio))
>> +		return false;
>>  	return true;
>>  }
> It seems like this does a kernel range shootdown for every page table that gets
> allocated? If so it throws a pretty big wrench into the carefully managed TLB
> flush minimization logic in the kernel.
>
> Obviously this is much more straightforward then the x86 series' page table
> conversion batching stuff, but TBH I was worried that even that was going to
> have a performance hit. I think how to efficiently do direct map permissions is
> the key technical problem to solve for pkeys security usages. They can switch on
> and off fast, but applying the key is just as much of a hit as any other kernel
> memory permission. (I assume this works the similarly to x86's?)

The benchmarking results (see cover letter) don't seem to point to a
major performance hit from setting the pkey on arm64 (worth noting that
the linear mapping is PTE-mapped on arm64 today so no splitting should
occur when setting the pkey). The overhead may well be substantially
higher on x86.

I agree this is worth looking into, though. I will check the overhead
added by set_memory_pkey() specifically (ignoring pkey register
switches), and maybe try to allocate page tables with a dedicated
kmem_cache instead, reusing this patch [1] from my other kpkeys series.
A kmem_cache won't be as optimal as a dedicated allocator, but batching
the page freeing may already improve things substantially.

- Kevin

[1]
https://lore.kernel.org/linux-hardening/20250815090000.2182450-4-kevin.brodsky@arm.com/


