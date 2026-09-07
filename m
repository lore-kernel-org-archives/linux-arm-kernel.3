Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A2BC79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 15:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uK8qwWRARBfH5Gy9AWfGwymhf1CzcvU1cSkswRjCB3k=; b=lVZRElxA0EZMvH7fq2W8L1y12u
	96I0CUyZPiUPVa7INM5MhmrO3xF63/7du8YUunG0UnDM3DHhvFRt3e/kumgF0zwKcmi0I1TqRfbG5
	gy9dtN9pxUXyydAB1gwQq0W1cNbwULqFAP671ZuoOd2ye3JohtSxKkWo6MPXBF4EltDOFIjAjhtmO
	F27ebzW8OWFAf4udq5Wa0NBPAJXub+vSipUPnuDdOUtkTzJfjqSK2711C97bPbkLPsWL3PBZ8HWCx
	XhMOMLkpvA1E2l5SsJBCpMlyJrcQRa+f/OYOnjD7ywauUTkcTnfn4mO5izH7FS3Yrax/FoOFtk8Nc
	2eFqTDeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3beI-00000007Ekf-3Azz;
	Mon, 07 Sep 2026 15:52:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3beG-00000007Ek8-03kB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 15:52:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55F861477;
	Mon,  7 Sep 2026 08:52:38 -0700 (PDT)
Received: from [10.57.6.26] (unknown [10.57.6.26])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A60473F7B4;
	Mon,  7 Sep 2026 08:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788796362; bh=1M0VbCBYRIVwvuz1Ziz5LEHR5vyGozoVj/HRYFkUpHQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iW1r4M47ZzYRpwxcxdOYtGK95O9RFQq3qSOfQBkbNtQb6iyGGZJq1Qq7WyOSdxPQS
	 tiShrG7ZcImz3k48GHsbWe18tgI+V91qts8G+Ozl/c1K/FnMZbBAW99fxzFgwYDpeM
	 ak7fGiCiqqU5MYmeGM83AcxJymFeIBMfc/qcUG8k=
Message-ID: <bdba5b54-8733-4d47-952d-e1bd958a1ead@arm.com>
Date: Mon, 7 Sep 2026 17:52:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v9 12/25] mm: kpkeys: Protect regular page tables
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-hardening@vger.kernel.org, Andrew Morton
 <akpm@linux-foundation.org>, Andy Lutomirski <luto@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David Hildenbrand (Arm)" <david@kernel.org>, Jann Horn <jannh@google.com>,
 Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>,
 Kees Cook <kees@kernel.org>, Linu Cherian <linu.cherian@arm.com>,
 Linus Walleij <linusw@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Mark Brown <broonie@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Maxwell Bland <mbland@motorola.com>, Peter Zijlstra <peterz@infradead.org>,
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
 <20260818-kpkeys-v9-12-743ad31b2c8f@arm.com>
 <178877845406.3691569.12554855722197968629.b4-review@b4>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <178877845406.3691569.12554855722197968629.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_085244_135723_E5534FB0 
X-CRM114-Status: GOOD (  16.52  )
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

On 07/09/2026 12:54, Mike Rapoport wrote:
>> [...]
>>
>>  static inline struct ptdesc *pagetable_alloc_noprof(gfp_t gfp, unsigned int order)
>>  {
>> -	struct page *page = alloc_pages_noprof(gfp | __GFP_COMP, order);
>> +	struct page *page;
>> +
>> +	if (kpkeys_hardened_pgtables_enabled())
>> +		page = kpkeys_pgtable_alloc(gfp | __GFP_COMP, order);
>> +	else
>> +		page = alloc_pages_noprof(gfp | __GFP_COMP, order);
> Can we make it a sequence rahter than a branch?
>
> kpkeys_pgtable_alloc() does alloc_pages and then sets their pkeys, so I
> think something like this should work:
>
> 	page = alloc_pages_noprof(gfp | __GFP_COMP, order);
> 	if (!page)
> 		return NULL;
> 	err = kpkeys_pgtable_alloc(page);
> 	if (err) {
> 		__free_pages(page, order);
> 		return NULL;
>
> with if (kpkeys_hardened_pgtables_enabled()) folded into
> kpkeys_pgtable_alloc().

I agree this would be less ugly. In fact this is pretty much what this
series did up to RFC v5 (albeit in the ctor/dtor instead of alloc/free).
We could go back to this API, *but* the big issue is that it makes it
impossible to use a smarter allocation strategy for protected pages.
Patch 14 in RFC v6 [1] will give you an idea of what such an allocator
(with support for large blocks and splitting) would look like.

As discussed with David H we're first trying to land this feature
without large block support (fully PTE-mapped direct map), but we do
want to support large blocks eventually [2] and I would prefer the core
API to be already compatible with that objective. Very happy to hear
about suggestions as to how to avoid the explicit condition in
pagetable_alloc() though!

- Kevin

[1]
https://lore.kernel.org/linux-hardening/20260227175518.3728055-15-kevin.brodsky@arm.com/
[2] https://lore.kernel.org/all/aMwd7IJVECEy8mzf@willie-the-truck/

