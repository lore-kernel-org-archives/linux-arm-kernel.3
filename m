Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6405C624A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 15:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ExJGhlK8NZ9qSQmWeTV2cgX53bPWaT0Asusz7G6mkI8=; b=Gk+ns6HQBhhSGvcojrZmqT0Nvz
	WjF+L4Q7HzX9OEkFXAyyPi3s3k6Rv9Wfb+gNkNLlvGlrMr2l6ngbqvjfI2G2XBrp7TJ398w+F+UxW
	1S9idnF4jlf/vP53YjGOxLvCfXgWmYUH7OQ/lBtIjPcpPudOLYwLlSeWThsf3Qvs54utBahn0ArO3
	+ni/vv0MXn66vCU+MeW5csHlB/RoUsMfisv3MXrh9zgtRb210aM0AtMMEbNeAw1SEh/aVr0aTOSma
	dL2reDR1JbXrKXFXh3h/MsuXozoTx1y6/7wQ4NSUcsPoxEbT455KgSjewcfE5DVmmrLOMCzZD5l4a
	O5nTfR6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x141N-00000009sWD-07N1;
	Mon, 31 Aug 2026 15:34:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x141L-00000009sVh-3O4J
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 31 Aug 2026 15:34:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ExJGhlK8NZ9qSQmWeTV2cgX53bPWaT0Asusz7G6mkI8=; b=YsI5iqUUGyXEU+LLkpvHExzHCG
	YYj9fprwAIsMQ2E1dP4byiSZdiy//VCrMbv9trGZnFZmTnQIqwnVPeJySuxMh9uJUbns0gl5B0OTt
	DqMZNSjOdrIAccjOqf4+YTxT++XWb3myLE93brAdWIXPsPyaDcOzWw4Kbl+6AM2ONkxmhmKq5d6kC
	4cXt4S+EdmhxjXY1RCjmxpljsgeMhtzIeMMcgQmLKBj9YKys3e2Ddf/YS/VmAK4/cw+plkE0YO7vr
	N6zlMYlyLf8YzHbpvb8QiYWBen51F3ZkWb3cZKVZyjHtCe7+mKORoQ8/4xgFNj5dsee5iT9gBhOTK
	TM3NP+Fw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x141H-0000000A0GE-3yed
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 15:34:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CEB5214BF;
	Mon, 31 Aug 2026 08:33:54 -0700 (PDT)
Received: from [10.57.6.141] (unknown [10.57.6.141])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E05EF3F882;
	Mon, 31 Aug 2026 08:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788190438; bh=X9z6SyVZHNkQL1n6gdutBmZdrQmfESATqJ8v2NavtB4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MFHLjXqzK8YmsGP1D4zZK3RcXzt2oW9+8hlLXOvoV0Fn7AylvgVVKPoBc1U9jHEyU
	 Hg6K/c9dkeMJae718osmui/zp5HMLFDPQccfKI7Zo1sw1M4gobE+XIk7REGXMxLyVl
	 Uvx2AXIqqX+6lvDZTDPUgRGau8g2gMv80e87vdOY=
Message-ID: <51e7acb3-43e4-409e-84ef-d932495d356e@arm.com>
Date: Mon, 31 Aug 2026 17:33:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v9 14/25] mm: kpkeys: Protect vmemmap page tables
To: linux-hardening@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Andy Lutomirski <luto@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 "David Hildenbrand (Arm)" <david@kernel.org>, Jann Horn <jannh@google.com>,
 Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>,
 Kees Cook <kees@kernel.org>, Linu Cherian <linu.cherian@arm.com>,
 Linus Walleij <linusw@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Mark Brown <broonie@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Maxwell Bland <mbland@motorola.com>, "Mike Rapoport (IBM)"
 <rppt@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
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
 <20260818-kpkeys-v9-14-743ad31b2c8f@arm.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20260818-kpkeys-v9-14-743ad31b2c8f@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_163400_440116_7EC89936 
X-CRM114-Status: GOOD (  21.03  )
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

On 18/08/2026 16:08, Kevin Brodsky wrote:
> When the kpkeys_hardened_pgtables feature is enabled, make sure that
> vmemmap page tables are protected by using:
>
> * The standard pagetable_alloc() if the buddy allocator is
>   available, as it already allocates protected memory.
>
> * The memblock-based kpkeys allocator for early allocations.
>
> These allocators are not NUMA-aware, so the page tables may be
> allocated on any node. This could potentially incur some overhead on
> large NUMA systems.
>
> The arm64 hotplug code is also amended to use a matching
> pagetable_free(), ensuring that the pkey is reset when the page
> tables are freed. x86 already uses pagetable_free() on that path.
>
> Unlike in vmemmap_alloc_block(), __GFP_RETRY_MAYFAIL is not used as
> it isn't justified for allocating page tables - this disables the
> OOM and we do not have a fallback if we fail to allocate page
> tables. See previous discussion linked below.
>
> Link: https://lore.kernel.org/all/38d2a358-4146-bfc9-2a4f-68ce02f75c94@suse.cz/
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>
> This is a minimal patch to protect vmemmmap page tables. More work
> may be needed here:

Another issue that my friendly AI identified: using
kpkeys_physmem_pgtable_alloc() for vmemmap breaks the main assumption in
the previous patch, which is that those early page table pages are
contiguous. vmemmap backing pages and the PTPs that map them are
allocated serially, which means that we end up scattering vmemmap PTPs
in the middle of vmemmap backing pages. As a result we could run out of
space to track the early ranges to protect.

This was much less of an issue in RFC v6 [1] as early PTPs were
allocated in PMD-sized chunks. This removed most of the fragmentation
and allowed us to track all these early ranges without extra logic.

That said, allocating these pages in blocks adds complexity that isn't
really justified when we require the direct map to be PTE-mapped.
Considering David's comments on patch 13, the plan for the next version
[2] is instead to revert to the even earlier approach of walking all the
kernel page tables during early boot. This simplifies the whole series,
but it will need to be overhauled when we try to support block mappings
again.

- Kevin

[1]
https://lore.kernel.org/all/20260227175518.3728055-19-kevin.brodsky@arm.com/
[2]
https://lore.kernel.org/all/7af32e98-f2ab-4961-9e3c-72b8a21416c0@arm.com/

