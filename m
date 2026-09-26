Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5582C98332
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 12:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1iBLZkIxA8ap1qqaUdvl37Rh8tiElL4QP7IPYChkI5I=; b=o3Png/xh79PaaU58zEs9zKkFQS
	CoduVXR2P3xDZymxPFgUU9hzmf32fcMP33WYyU64q+sS6byn6vVTALrAGxJy9376jWQUMKun9Snph
	9Aq2m/2DHBLXZ+LCRTe1m4qJ8f6yZAqeTyt2E4y+aUtftcu7rPmJgmuk1z7P1DfHn1J9exnmRLaxG
	MKJHEnN/qqHdK1WASvr3UeKREhQyT0yqF4wCZnmJ0cTPQS5YvhZw4W51vJwF4JmT2EvMkyXWTalZM
	kFyoj1pr8Xc29jlxtf/BAsm9Wu1dsKkTRaSSoO9MQlGR2wrZoa7ffr6nFhQAVSRJrkMeStmnlxf+Y
	BXyvXrhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xARHM-0000000FMCu-08om;
	Sat, 26 Sep 2026 12:13:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xARHK-0000000FMCj-2SNe
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Sep 2026 12:13:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F2F1A43EA1;
	Sat, 26 Sep 2026 12:13:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 308001F000FF;
	Sat, 26 Sep 2026 12:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790424797;
	bh=1iBLZkIxA8ap1qqaUdvl37Rh8tiElL4QP7IPYChkI5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dqVt/WH/30yxap89q3hdsyv/l61o3KLu/CiWmh2GBWsGOMCAyDd4oeItuV0KhN+p0
	 8X1zpWVayYa47zet2Ur/sfY1kFJQbab8BoOoxfXHV/YQI1RJpJcGzgkU0qRjc535uU
	 dggfLeW1RAGQ6iAvuoLIhb9T4V0FhhXIBy9i/I8pCdGeLVYzIySIXLMOZwMi3YRe/f
	 zKl3WL7aj0w8pTnJ2Nyfs5DX0DqPx3wVLkn3TmGkc+E39Db2pmRZ/OB9D3wxZRvvWf
	 SDM2RCWwifBB//vbUuDdgvoBbZaeCV/2vJDbDTyZiZ4mMxvo0MoVSBtV+WGkAlY0zm
	 09Lh/Q+rpzwkA==
Date: Sat, 26 Sep 2026 17:43:08 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Will Deacon <will@kernel.org>, brendan.jackman@linux.dev
Cc: Vincent Donnefort <vdonnefort@google.com>, catalin.marinas@arm.com,
	rppt@kernel.org, akpm@linux-foundation.org, sudeep.holla@kernel.org,
	jenswi@kernel.org, robh@kernel.org, mark.rutland@arm.com,
	ardb@kernel.org, thierry.reding@kernel.org, david@kernel.org,
	danielmentz@google.com, linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org, op-tee@lists.trustedfirmware.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/8] arm64: Unmap FF-A lent memory from direct map
Message-ID: <are21BjeS1O3RYE3@sumit-xelite>
Mail-Followup-To: Will Deacon <will@kernel.org>, brendan.jackman@linux.dev,
	Vincent Donnefort <vdonnefort@google.com>, catalin.marinas@arm.com,
	rppt@kernel.org, akpm@linux-foundation.org, sudeep.holla@kernel.org,
	jenswi@kernel.org, robh@kernel.org, mark.rutland@arm.com,
	ardb@kernel.org, thierry.reding@kernel.org, david@kernel.org,
	danielmentz@google.com, linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org, op-tee@lists.trustedfirmware.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260921110050.3977591-1-vdonnefort@google.com>
 <arIYtjmSKCs14SqO@sumit-xelite>
 <arKW_91EeKA-w96m@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <arKW_91EeKA-w96m@willie-the-truck>
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

Adding Brendan to this thread.

Will,

Looks like you dropped me from your reply.

On Tue, 22 Sep 2026 at 15:55:59 +0100, Will Deacon wrote:
>On Tue, Sep 22, 2026 at 11:27:10AM +0530, Sumit Garg wrote:
>> On Mon, 21 Sep 2026 at 12:00:42 +0100, Vincent Donnefort wrote:
>> > This series is a follow-up to the discussion that has started here [1].
>> >
>> > When memory is lent to the Secure world via FF-A, CPU speculative
>> > accesses from NS to the lent pages can still occur as long as it retains
>> > a cacheable mapping to it.
>> >
>> > Ideally, lent memory would be "no-map" but that would mean giving up
>> > MiBs of useful memory, so let's try to do better with the help of a CMA
>> > pool.
>> >
>> > On arm64, modifying the direct map at runtime is generally restricted
>> > because the linear map defaults to block mapping and splitting blocks at
>> > runtime may trigger fatal page fault, unless the CPU implements BBML3
>> > or the entire direct map was mapped at page granularity from boot.
>> > Forcing last-level mappings system-wide incurs a severe penalty we want
>> > to avoid. Instead, this series introduces targeted last-level mappings
>> > for designated memory regions, along with the "arm,ffa-lend-pool" CMA
>> > driver to manage unmapping and remapping on lend/reclaim transitions:
>> >
>> > 1. memblock:
>> >   - Introduce MEMBLOCK_PTEMAP to force PTE mappings only for a specific region.
>> >
>> > 2. set_memory infrastructure:
>> >   - Introduce can_set_direct_map_range() to check if a specific address
>> >     range is mapped with last-level entries and can be modified safely.
>> >   - Introduce __set_direct_map_*() variants that bypass redundant checks
>> >     when the caller has already validated the range.
>> >
>> > 3. "arm,ffa-lend-pool" driver
>> >   - Introduce the "arm,ffa-lend-pool" CMA reserved-memory driver, which
>> >     unmaps pages prior to lending (ffa_prepare_lend()) and restores them
>> >     when reclaimed (ffa_lend_reclaimed()).
>> >
>> > 4. Optee support
>> >   - Hook OP-TEE dynamic protected memory pools to "arm,ffa-lend-pool" for
>> >     both SMC (via DT memory-region phandle) and FF-A (via
>> >     ffa_lend_pool_attach()) transports.
>>
>>
>> Thanks for your proposal in trying to solve this hard problem of
>> unmapping pages from kernel linear map. I remember discussing this
>> problem last year at LPC too.
>>
>> Have you had a chance to look at a more generic MM proposal around this
>> issue here [1]?
>>
>> One of the major concern for me with your proposal is tying the
>> protected memory allocation to fixed sized platform specific pool size
>> based on DT. Then the cost of granular mappings/unmapping if the
>> platforms choose to enlarge these pools.
>>
>> As you maybe aware one of the major use-cases here for protected DMAbufs
>> is the secure media pipeline use-case which is memory intensive
>> workload. IMO, the solution proposed at [1] seems to address it although
>> people have flagged rough edges there but should be addressable.
>>
>> Can you try a port of [1] for arm64 since the author did all the work
>> with x86 as reference?
>>
>> [1] https://lore.kernel.org/all/20260726-page_alloc-unmapped-v3-0-6f5729aa9832@google.com/
>
>I spoke to Brendan at LPC (?) last year but this doesn't really work
>for arm64 because it relies on being able to unmap arbitrary parts of
>the linear map, which isn't generally possible unless you force pte-level
>mappings for everything, which is prohibitive for perf/power.

As per the cover letter it's about allocating pages that are not present
in the direct map. This essentially fits the protected DMABufs use-case
where we don't want any kernel mapping to exist at any time. Bufers
allocated from protected DMABufs are only meant to be accessed by the
TEE implementation or HW accelerators like in the secure media pipeline.

>
>Vincent's series tackles that by using a pool so that only that part of
>memory requires the pte-level mappings in the linear map. That's the
>whole point of it, so I don't think it makes sense to drop it in favour
>of Brendan's approach (which doesn't work).
>

For protected DMABufs, we even don't require any pte-level mappings in
linear map. The whole idea of mapping and unmapping is just a bottleneck
for performance sensitive secure media pipeline use-cases. That's why if
we can support __GFP_UNMAPPED with the memory allocator on arm64 would
be the best fit for this use-case.

Now the question is why arm64 can't support __GFP_UNMAPPED similar to
how Brendan is doing it for x86?

-Sumit

