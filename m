Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9150C624A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 15:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lj8vVsbmTwPT0Cjl/ChRV/xwb94gczxM5UfDJ4T5bS8=; b=AyCuHFpnZbuqTg8EqrEsFeUZ7N
	XJWHvxuhAtZ2WsWE+jUFmhB2IutTxS+7bpy8W11fShry0TSMO9Mp8ojIJ1LCUAVycgvU2ZgQ93B8y
	WJWv/nnMZFHygemEsLcLSRTl2pCoKukqBFgKNPr5iKjH4la9HKVENViiQTcMgSeTFGJeCRWp+6EHT
	ZAVSYYqnpQcPNEi9rrxWE5nQ52wzlnG1vaq8x6HbByTr96qnIxRCZYL7RPb7Ofb5kGsZ1TIqQE8Vb
	dTScAdFDCVh+KoAMnKcB8vVz0S7binjyxtwKGdA2XK4CAO+ElxIdOMsF+hxAnLfZXe5cSSU71GZzw
	P83V9Ayg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13xu-00000009rxv-1Hh0;
	Mon, 31 Aug 2026 15:30:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13xr-00000009rxJ-2Gqj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 15:30:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ABB7814BF;
	Mon, 31 Aug 2026 08:30:22 -0700 (PDT)
Received: from [10.57.6.141] (unknown [10.57.6.141])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B254C3F882;
	Mon, 31 Aug 2026 08:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788190226; bh=lj8vVsbmTwPT0Cjl/ChRV/xwb94gczxM5UfDJ4T5bS8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Fu+LyaS3+WfBA0uqQccLp34N9VvHid4HkKzlLtdtlaQk+RXZfyDKkixn1BSnTypDV
	 TP0ZysmdYLKJmf1Dww5bQbi7CLiGF2s1vJLj2DtgVlo8wtBBX+DEGruHr6TsXqR8/V
	 FlL4M8MdbsuWb6O6g0Ogz9KAuTGmx2FQxRiu+xps=
Message-ID: <e0897ac4-1e5b-4f65-93fb-a718b27ecfb4@arm.com>
Date: Mon, 31 Aug 2026 17:30:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v9 13/25] mm: kpkeys: Introduce early page table
 allocator
To: Dave Hansen <dave.hansen@intel.com>, linux-hardening@vger.kernel.org
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
 <20260818-kpkeys-v9-13-743ad31b2c8f@arm.com>
 <9ab4d7b8-6be9-4219-a410-ed26ae25c47e@intel.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <9ab4d7b8-6be9-4219-a410-ed26ae25c47e@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_083027_671679_A395E1C4 
X-CRM114-Status: GOOD (  14.67  )
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

On 27/08/2026 20:17, Dave Hansen wrote:
> On 8/18/26 07:08, Kevin Brodsky wrote:
>> This patch addresses the second category: PTPs allocated via memblock.
>> Such PTPs are notably used to create the linear map. Protecting them as
>> soon as they are allocated would require modifying the linear map while
>> it is being created, which seems at best difficult. Instead, a
>> simple allocator is introduced, obtaining pages from memblock and
>> keeping track of all allocated ranges to set their pkey once it is
>> safe to do so.
> What makes setting a pkey on the memory "unsafe"? Is there something
> preventing just making access permissive during boot?

There are two issues at play here:

1. When allocating page tables to create the direct map, we cannot
reliably set their pkey because that itself requires modifying the
direct map (and we may not even have mapped this particular page yet).
There may be ways around this, but it feels at best uncomfortable.

2. Specifically in the context of relying on the BBML3 feature on arm64:
when we create the direct map with large block mappings, there is a
window during boot (before all the secondary cores are up) where we do
not allow splitting blocks. This has caused troubles for other features
as well, see [1].

My understanding is that 1. is a problem regardless of the architecture.
2. is not actually relevant when we force the direct map to be
PTE-mapped, as is the case in this version, but it had to be considered
in RFC v6 where we tried to support block mappings.

As per the discussion with David (also in reply to this patch), the plan
is now to return to an earlier design where we walk the early kernel
page tables to set their pkey. This circumvents the allocation question
completely, albeit with the requirement that the direct map is fully
PTE-mapped.

- Kevin

[1]
https://lore.kernel.org/all/0b2a4ae5-fc51-4d77-b177-b2e9db74f11d@huawei.com/
[2]
https://lore.kernel.org/all/20260227175518.3728055-19-kevin.brodsky@arm.com/


