Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C21CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 12:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I1wrTOQk3HC+Fo1aBvEzngNPe9+LVpiTcP6T08Zz9dc=; b=Vs3HnA511yrSBALVT9km7gJJvE
	/7t6CDAoVgHw26c3+JvYVAc5D1rzi9+TWnJWMeP4gWcF4jIxP4EVH40KlZHdYb1tYsIJs9A/dRPJV
	QKgPB8WaYL/hd8UvBvCLhCKaoMB2MnUVva0YQjDuv6RiQph8fVN0Yx3vZtYlA95YJCMPgA/x8GCL3
	/a6lgcrxfp9CxOD0kSitvvgtyeKOoUh55fXwnA8W8cFiN69aAK2QrpxDIx3xttjBjY3GWSUaoti4X
	HvxOOn9BQ/02rW4LkviuvVgvy47SYq9jT4iFbbYr4uKUD6QVI2R7gEe/yk1OV5geAljSZ8yRlqfl1
	Zk676t6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3w9q-00000007vhY-0Cyv;
	Wed, 01 Oct 2025 12:42:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3w9n-00000007vgg-2rrQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 12:42:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A8CF16F2;
	Wed,  1 Oct 2025 05:41:58 -0700 (PDT)
Received: from [10.57.66.40] (unknown [10.57.66.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E1733F66E;
	Wed,  1 Oct 2025 05:42:00 -0700 (PDT)
Message-ID: <6dc0b5c8-b485-4fe1-b85b-7dcd00214d1b@arm.com>
Date: Wed, 1 Oct 2025 14:41:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v5 00/18] pkeys-based page table hardening
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 "yang@os.amperecomputing.com" <yang@os.amperecomputing.com>,
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
 <98c9689f-157b-4fbb-b1b4-15e5a68e2d32@os.amperecomputing.com>
 <8e4e5648-9b70-4257-92c5-14c60928e240@arm.com>
 <8f7b3f4e-bf56-4030-952f-962291e53ccc@arm.com>
 <6e5d24de6a6661f83442741f6be8daf691a05a20.camel@intel.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <6e5d24de6a6661f83442741f6be8daf691a05a20.camel@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_054207_825209_06AD8CBA 
X-CRM114-Status: GOOD (  29.37  )
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

On 18/09/2025 19:31, Edgecombe, Rick P wrote:
> On Thu, 2025-09-18 at 16:15 +0200, Kevin Brodsky wrote:
>> This is where I have to apologise to Rick for not having studied his
>> series more thoroughly, as patch 17 [2] covers this issue very well in
>> the commit message.
>>
>> It seems fair to say there is no ideal or simple solution, though.
>> Rick's patch reserves enough (PTE-mapped) memory for fully splitting the
>> linear map, which is relatively simple but not very pleasant. Chatting
>> with Ryan Roberts, we figured another approach, improving on solution 1
>> mentioned in [2]. It would rely on allocating all PTPs from a special
>> pool (without using set_memory_pkey() in pagetable_*_ctor), along those
>> lines:
> Oh I didn't realize ARM split the direct map now at runtime. IIRC it used to
> just map at 4k if there were any permissions configured.

Until recently the linear map was always PTE-mapped on arm64 if
rodata=full (default) or in other situations (e.g. DEBUG_PAGEALLOC), so
that it never needed to be split at runtime. Since [1b] landed though,
there is support for setting permissions at the block level and
splitting, meaning that the linear map can be block-mapped in most cases
(see force_pte_mapping() in patch 3 for details). This is only enabled
on systems with the BBML2_NOABORT feature though.

[1b]
https://lore.kernel.org/all/20250917190323.3828347-1-yang@os.amperecomputing.com/

>> 1. 2 pages are reserved at all times (with the appropriate pkey)
>> 2. Try to allocate a 2M block. If needed, use a reserved page as PMD to
>> split a PUD. If successful, set its pkey - the entire block can now be
>> used for PTPs. Replenish the reserve from the block if needed.
>> 3. If no block is available, make an order-2 allocation (4 pages). If
>> needed, use 1-2 reserved pages to split PUD/PMD. Set the pkey of the 4
>> pages, take 1-2 pages to replenish the reserve if needed.
> Oh, good idea!
>
>> This ensures that we never run out of PTPs for splitting. We may get
>> into an OOM situation more easily due to the order-2 requirement, but
>> the risk remains low compared to requiring a 2M block. A bigger concern
>> is concurrency - do we need a per-CPU cache? Reserving a 2M block per
>> CPU could be very much overkill.
>>
>> No matter which solution is used, this clearly increases the complexity
>> of kpkeys_hardened_pgtables. Mike Rapoport has posted a number of RFCs
>> [3][4] that aim at addressing this problem more generally, but no
>> consensus seems to have emerged and I'm not sure they would completely
>> solve this specific problem either.
>>
>> For now, my plan is to stick to solution 3 from [2], i.e. force the
>> linear map to be PTE-mapped. This is easily done on arm64 as it is the
>> default, and is required for rodata=full, unless [1] is applied and the
>> system supports BBML2_NOABORT. See [1] for the potential performance
>> improvements we'd be missing out on (~5% ballpark).
>>
> I continue to be surprised that allocation time pkey conversion is not a
> performance disaster, even with the directmap pre-split.
>
>> I'm not quite sure
>> what the picture looks like on x86 - it may well be more significant as
>> Rick suggested.
> I think having more efficient direct map permissions is a solvable problem, but
> each usage is just a little too small to justify the infrastructure for a good
> solution. And each simple solution is a little too much overhead to justify the
> usage. So there is a long tail of blocked usages:
>  - pkeys usages (page tables and secret protection)
>  - kernel shadow stacks
>  - More efficient executable code allocations (BPF, kprobe trampolines, etc)
>
> Although the BPF folks started doing their own thing for this. But I don't think
> there are any fundamentally unsolvable problems for a generic solution. It's a
> question of a leading killer usage to justify the infrastructure. Maybe it will
> be kernel shadow stack.
It seems to be exactly the situation yes. Given Will's feedback, I'll
try to implement such a dedicated allocator one more time (based on the
scheme I suggested above) and see how it goes. Hopefully that will
create more momentum for a generic infrastructure :) - Kevin

