Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE871C624A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 15:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SuDeWaf7WgpqHSI1yoOLmbbz1EkZzpYkobKoVll1c/k=; b=CxSqnVI3/2djOY8yqQyqMj1Yux
	bTxWu8f3TdRubu/l9T8uCr/I4QVOBNJ9eiG//1Qrd3YnbMd3Jy0KwtWO3lbw3HKPt85vrv06V4LAi
	5N+Zg9CCxjE7yBTj1FL05X4pXOn8sLotVdQD28YDfQYf7M8cihsBpg9vpsQEmhSyrPbJCM2csxxsQ
	3Nv16ieTHDtuGfaiQS6GUX828OY3/ToQIVKzWFk4hyuaAPrpIWsWSDAxo+0VpD8BiP/sRDDHlh9lb
	qNbZLwj7pXzXqaZ/qrE/0/fU/N5ro/TcubqofRa2IULVouGZrS4Vdv8fvGk4F2I2u+QkeGb6HshXW
	NiMnpRGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13wC-00000009rTV-1j7C;
	Mon, 31 Aug 2026 15:28:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13w9-00000009rSW-2kLr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 15:28:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B49A14BF;
	Mon, 31 Aug 2026 08:28:34 -0700 (PDT)
Received: from [10.57.6.141] (unknown [10.57.6.141])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F3BBE3F882;
	Mon, 31 Aug 2026 08:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788190118; bh=SuDeWaf7WgpqHSI1yoOLmbbz1EkZzpYkobKoVll1c/k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CREezQe4GnXa4C8RGGDKvHVjF22t/L5J5b6UfZ5AXfZ4spJQ1gMP8m1du77D9yAnj
	 xflZERFG8KqRDlopy1LEHijk2M/I09pIur66mG5W1QsRPHMLbWbvd2DFbNAL2icWhg
	 drjXdEdwODQ0wCXxFG7WTRhQtDzhabUMNmya4Kds=
Message-ID: <7af32e98-f2ab-4961-9e3c-72b8a21416c0@arm.com>
Date: Mon, 31 Aug 2026 17:28:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v9 13/25] mm: kpkeys: Introduce early page table
 allocator
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 linux-hardening@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Andy Lutomirski <luto@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Jann Horn <jannh@google.com>, Jeff Xu <jeffxu@chromium.org>,
 Joey Gouly <joey.gouly@arm.com>, Kees Cook <kees@kernel.org>,
 Linu Cherian <linu.cherian@arm.com>, Linus Walleij <linusw@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Maxwell Bland <mbland@motorola.com>,
 "Mike Rapoport (IBM)" <rppt@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Pierre Langlois <pierre.langlois@arm.com>,
 =?UTF-8?Q?Pierre-Cl=C3=A9ment_Tosi?= <ptosi@google.com>,
 Quentin Perret <qperret@google.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Vlastimil Babka <vbabka@kernel.org>,
 Will Deacon <will@kernel.org>, Yang Shi <yang@os.amperecomputing.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org, x86@kernel.org, Ira Weiny <iweiny@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Thomas Gleixner <tglx@kernel.org>
References: <20260818-kpkeys-v9-0-743ad31b2c8f@arm.com>
 <20260818-kpkeys-v9-13-743ad31b2c8f@arm.com>
 <1dc8739e-4eb6-4a71-9534-e03a15afd620@kernel.org>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <1dc8739e-4eb6-4a71-9534-e03a15afd620@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_082841_797951_2A2ED297 
X-CRM114-Status: GOOD (  21.24  )
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

On 27/08/2026 20:08, David Hildenbrand (Arm) wrote:
> On 8/18/26 16:08, Kevin Brodsky wrote:
>> The kpkeys_hardened_pgtables feature aims to protect all page table
>> pages (PTPs) by mapping them with a privileged pkey. This is primarily
>> handled by kpkeys_pgtable_alloc(), called from pagetable_alloc().
>> However, this does not cover PTPs allocated early, before the
>> buddy allocator is available. These PTPs are allocated by architecture
>> code, either 1. from static pools or 2. using the memblock allocator,
>> and should also be protected.
>>
>> This patch addresses the second category: PTPs allocated via memblock.
>> Such PTPs are notably used to create the linear map. Protecting them as
>> soon as they are allocated would require modifying the linear map while
>> it is being created, which seems at best difficult. Instead, a
>> simple allocator is introduced, obtaining pages from memblock and
>> keeping track of all allocated ranges to set their pkey once it is
>> safe to do so. PTPs allocated at that stage are not freed, so there
>> is no need to manage a free list.
> I'm think of ways to avoid remembering these ranges. I guess we get called that
> early that we don't even have a ptdesc where we could just link the pages.

Correct, in both the direct map and (early) vmemmap cases we can't rely
on struct page as storage.

> If only page tables would be linked in some datastructure where we could find
> them all ... ;)
>
> ... why can't we just scan the page table hierarchy to find all page tables that
> need protection?

It makes sense doesn't it :) In fact this is exactly what RFC v5 did [1]
(a year ago already...). Then in RFC v6 I attempted to support block
mappings, and things got a lot more complicated. In that case there are
(at least) two issues with protecting the early page tables by walking them:

1. On arm64 with BBML3 we cannot split blocks in the direct map until
all secondary cores are up. This makes locking pretty difficult if we're
to walk all page tables at that later stage.

2. Without modifying the allocation strategy, early page tables may not
be contiguous and setting their pkey would generate fragmentation.

Naturally neither of these issues is relevant to the present series,
where we force page granularity in the direct map. I still kept the same
approach as in RFC v6 though, as the goal remains to support block
mappings eventually.

That said, as discussed offline it may be sensible to revert to the
"walk early page tables" approach to start with, even if we would
probably need to change it later. This allows us to drop quite a few
patches, since init_pg_dir no longer needs to be explicitly protected.

One caveat is that in RFC v5, any page table page installed after
smp_prepare_boot_cpu() is called, and allocated using memblock (or
anything else but the buddy allocator), won't be protected. Codex can't
find any such case though so we should be good for now.

- Kevin

[1]
https://lore.kernel.org/linux-hardening/20250815085512.2182322-11-kevin.brodsky@arm.com/


