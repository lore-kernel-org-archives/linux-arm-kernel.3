Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 612F1C021BD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 13:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KtNByZl9qAP9GjlXryzLItO1F76DSdCbtTtd89ojuxM=; b=pIli+7icjARW+2wc3mZl4udA2N
	f9Jcch/s/SNLypHnra9nI6SxTLYZhvItROQnTyt4cmfuj/B9Lcxk655InaK4gNnAB/yeU47TdeTz2
	GeiQLt/h2R2rne104sKGcSf7i94Xoryk+QgNDmVfp6hnu7FunUDNMSeLy4A16R9HJCIUWVv4BCdjS
	3dmpASrK0uTuVdiuNqNiK+XEqGMOT/hxjONxYoRnoClN63epMKZz9cBAhx6PijCM1Kf586lVSOrAE
	Bvs9LpxqU/WkCxMKUQ7wGX6/I7IowLuPTc6RB/3VoEdunrk9sxo8zF2arMzHGQMU00lyIdLMyw4KD
	EacejjwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYHq-0000000DntO-2q9V;
	Mon, 24 Feb 2025 13:14:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmXXX-0000000Dgc6-0aFB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 12:26:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 61DC01756;
	Mon, 24 Feb 2025 04:26:43 -0800 (PST)
Received: from [10.1.27.150] (XHFQ2J9959.cambridge.arm.com [10.1.27.150])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 842BD3F6A8;
	Mon, 24 Feb 2025 04:26:24 -0800 (PST)
Message-ID: <90195b91-e9b3-41aa-bb39-45f6a49b171b@arm.com>
Date: Mon, 24 Feb 2025 12:26:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/14] arm64/mm: Avoid barriers for invalid or
 userspace mappings
Content-Language: en-GB
To: Kevin Brodsky <kevin.brodsky@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 David Hildenbrand <david@redhat.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250217140809.1702789-1-ryan.roberts@arm.com>
 <20250217140809.1702789-8-ryan.roberts@arm.com>
 <fc199d7c-ab09-4278-b641-962184bff14d@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <fc199d7c-ab09-4278-b641-962184bff14d@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_042627_270962_D3E6C7D2 
X-CRM114-Status: GOOD (  22.53  )
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

On 20/02/2025 16:54, Kevin Brodsky wrote:
> On 17/02/2025 15:07, Ryan Roberts wrote:
>> __set_pte_complete(), set_pmd(), set_pud(), set_p4d() and set_pgd() are
> 
> Nit: it would be more accurate to say __set_pte() instead of
> __set_pte_complete(), as it is the former that actually writes the PTE
> (and then issues barriers).

Yeah, fair enough. Will fix in the next version.

> 
>> used to write entries into pgtables. And they issue barriers (currently
>> dsb and isb) to ensure that the written values are observed by the table
>> walker prior to any program-order-future memory access to the mapped
>> location.
>>
>> Over the years some of these functions have received optimizations: In
>> particular, commit 7f0b1bf04511 ("arm64: Fix barriers used for page
>> table modifications") made it so that the barriers were only emitted for
>> valid-kernel mappings for set_pte() (now __set_pte_complete()). And
>> commit 0795edaf3f1f ("arm64: pgtable: Implement p[mu]d_valid() and check
>> in set_p[mu]d()") made it so that set_pmd()/set_pud() only emitted the
>> barriers for valid mappings. set_p4d()/set_pgd() continue to emit the
>> barriers unconditionally.
>>
>> This is all very confusing to the casual observer; surely the rules
>> should be invariant to the level? Let's change this so that every level
>> consistently emits the barriers only when setting valid, non-user
>> entries (both table and leaf).
>>
>> It seems obvious that if it is ok to elide barriers all but valid kernel
>> mappings at pte level, it must also be ok to do this for leaf entries at
>> other levels: If setting an entry to invalid, a tlb maintenance
>> operation must surely follow to synchronise the TLB and this contains
>> the required barriers. If setting a valid user mapping, the previous
>> mapping must have been invalid and there must have been a TLB
>> maintenance operation (complete with barriers) to honour
>> break-before-make. So the worst that can happen is we take an extra
>> fault (which will imply the DSB + ISB) and conclude that there is
>> nothing to do. These are the arguments for doing this optimization at
>> pte level and they also apply to leaf mappings at other levels.
>>
>> For table entries, the same arguments hold: If unsetting a table entry,
>> a TLB is required and this will emit the required barriers. If setting a
> 
> s/TLB/TLB maintenance/
> 
>> table entry, the previous value must have been invalid and the table
>> walker must already be able to observe that. Additionally the contents
>> of the pgtable being pointed to in the newly set entry must be visible
>> before the entry is written and this is enforced via smp_wmb() (dmb) in
>> the pgtable allocation functions and in __split_huge_pmd_locked(). But
>> this last part could never have been enforced by the barriers in
>> set_pXd() because they occur after updating the entry. So ultimately,
>> the wost that can happen by eliding these barriers for user table
> 
> s/wost/worst/
> 
> - Kevin
> 
>> entries is an extra fault.
>>
>> [...]
> 


