Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17DEFC5518F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 14:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PelFJfpMUVWx4wAXFn+gu8GLtPt9aoHBAUHqUA8PnkI=; b=OsHUvLvleMPSFsqUaE5VN1mhOf
	xjuvMOhFsBGU4WS6GGTGKCetbgl7yRyhm8nn3r0ANXnOY4G93BoyAA+BZMk2BDKOvvI6c0CCzbIgi
	t8goes+WlirLgwK0jlzhp55mywP5MV+rI4yyge6ljaOJ4ACsRh6uqT1qZMStz5bRaeqxG9YJmgwMN
	Gp++rlUsf9EdDNZvK0SR/rUkMqR1Mia1MV0OIVNxFbNEz2OfGGNCdfe/M29c++NvG4JcUE3TYJ2hV
	uIvZlQ8iQD79OUmuZpNFsmrtktDa4Z0ik7jZbZTBr+UFTCrk/DuKicxfUwXjJQBPNjprj8nGaf9vo
	lPPDdXBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrG6B-000000024w6-3H1F;
	Tue, 04 Aug 2026 14:26:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrG6A-000000024vv-27Zf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 14:26:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E525C439BD;
	Tue,  4 Aug 2026 14:26:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CFC51F000E9;
	Tue,  4 Aug 2026 14:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785853589;
	bh=PelFJfpMUVWx4wAXFn+gu8GLtPt9aoHBAUHqUA8PnkI=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=eWnB4YxUbd0F4Wxv78JgmC5Xiiemfv3K2guBpnet9V+L3kq1YvbLq9+isqRrWkicA
	 fyEy8gEhkW2yxgL076tbksoMK3XTMmgGXqFrggxncjestrR5MZsZverKo1pXsO8NJ0
	 DpYrtVwaRQf1sBuYRqRSrvWdyijNqODbtUra7+qnfGFosOM9xx7/pGtP+KrDELPtCG
	 UbaDqKNFnBdYn5KbDTUxU5wJvASnAH5Oqpi3FoecBzhfDJIuDJ7grJgMXmBKTRLjrY
	 cSb4af6JvGzIKkigLkJMDH17VcWogZth24uwSNgbWnpwTVjsLZBqc00vGNdwpqZZD4
	 /PI34qt8IPL/g==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id DD8EF198003A;
	Tue,  4 Aug 2026 10:26:27 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Tue, 04 Aug 2026 10:26:27 -0400
X-ME-Sender: <xms:kvZxan95IQjLMlSZ4du7d58veQ5-8l129Za3QbG2ZVnAxjdDlh3BOg>
    <xme:kvZxauioC4j4LwIQ-y8V0ZoTfte9KuqzZvQDwnyABVhTuw4-ThZK5-BRCdaeLyQfp
    tgm_a2QTBiwAtCLo4OFqzFnK8peXG3_zOaMNkjRBYgzriU69pKiwyQ>
X-ME-Proxy-Cause: dmFkZTFKHVQGEqDmo3SDF0r6Cc9Ia0uzvZkavOJuz4/prGRps0FSchWWYe7PWL+/GPCrXb
    L1oN5a0nX1msSCtY5iV612yj5/NweJY0/gx9B4P1MisVt8QWAo3SzLHLvdJdVOQpLERSFp
    4qaiUjWtixU5H766rm7PV4opLg121bGXFIz1iL6cx/DsnLzAcpHdf4yw1uiK4eRmZSHAZQ
    BrO4m0tONBk8vGVJ+qWfZ0WLc8ehboN7rRBzjP/Gw2uHhnROMCFZCx298h+RqnWcopcTaj
    qJ40t5B9UwlBKWExpU5gyFRhCHWcONiyg4HDuU1re0SMjaJ4HN7QyiHoto3MQ1nBOfF2YP
    PNwkf3uLjT4a1tMx0w6d+rPJofIzxpnJX4NCZBw18jhIGABLj19N2zYmaa6ifaETplus3a
    cZldv/0UNMk7XiE+eugIPX3eauvj/fBVMhgCsgqBj5gJMyQlFOIWWj2pR4gX100LKOtnxX
    l5NvKHEuj9cjYHHezTddDGREBE+gXam0FHcHgwyFN4ypGbQO3OfD1jxfy3eshNHAAjHWRk
    sQAsJ0XaxR3ar9VAShnKsBEGBy4GnC1IMze1AYVkw4+VswbTmzVPAzp/QIsZKQd4JZBBmz
    oIzKlnhVQ45k2eY2o1SRGv5UvZig1l+uawogl8BKtOJHmFV3595EiW0Y2+IQ
X-ME-Proxy: <xmx:k_ZxatdNj5U7cBVQSMTkxbKvXqDX-eYyit-9kH3McwSBihu9ZiXOYQ>
    <xmx:k_ZxamJtVzG4S3KwewIFEGN7Ssv26qMpGjJKhpzvPBxxBAbG1HSHwQ>
    <xmx:k_ZxalgV4G6PX4SYE9W4eHLy6sDEL-spsOPXhAHQ5dYcDsvaAa89hg>
    <xmx:k_ZxasQqhISLRzhahQB6T5pAv3XHC4wMLYDtZD8fZlVWHgREpMTqGA>
    <xmx:k_ZxanUppnplKySqmmvAy0uCTr4f_elI3cRfwacox_OOG-ilxlmZjOAa>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 0967BF80060; Tue,  4 Aug 2026 10:26:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 04 Aug 2026 17:24:33 +0300
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Will Deacon" <will@kernel.org>, liulhong617@163.comm
Cc: "Catalin Marinas" <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 liulhong617 <liulhong617@gmail.com>
Message-Id: <ea0c8525-adf6-4c11-a3ec-02fe2f3b883b@app.fastmail.com>
In-Reply-To: <aljkLPTfyAbPaT98@willie-the-truck>
References: <20260513010255.3764038-1-liulhong617@163.com>
 <aljkLPTfyAbPaT98@willie-the-truck>
Subject: Re: [PATCH] arm64: mm: fix accidental linear mapping of no-map reserved memory
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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


On Thu, 16 Jul 2026, at 17:01, Will Deacon wrote:
> [+Ard]
>
> On Wed, May 13, 2026 at 09:02:55AM +0800, liulhong617@163.com wrote:
>> From: liulhong617 <liulhong617@gmail.com>
>>=20
>> When reserved-memory regions with the "no-map" property are not
>> page-aligned, the kernel may accidentally map them into the linear
>> mapping, contradicting the no-map semantics.
>
> Crikey, I wonder what the semantics are for "no-map" if the region isn=
't
> page aligned? If the remaining part of the page is advertised as memory
> but doesn't have the "no-map" property, then we can't really satisfy
> what we're being asked to do.
>
>> The root cause is a mismatch between /proc/iomem's address boundaries
>> and the actual page table mapping boundaries:
>>=20
>> 1. /proc/iomem derives its ranges from memblock via
>>    memblock_region_reserved_base_pfn/memblock_region_reserved_end_pfn,
>>    which perform PFN rounding so the displayed boundaries are
>>    page-aligned. This gives the impression that the no-map region
>>    occupies whole pages.
>>=20
>> 2. However, memblock_mark_nomap() splits memblock.memory regions at
>>    exact byte boundaries (memblock_isolate_range preserves raw DT
>>    base/size with no alignment). When for_each_mem_range iterates the
>>    non-NOMAP regions adjacent to a no-map region, it returns start/end
>>    values that are NOT page-aligned =E2=80=94 they are the precise by=
te
>>    boundaries from the memblock split.
>>=20
>> 3. These sub-page-aligned values are passed to
>>    __create_pgd_mapping_locked(), which does:
>>      phys &=3D PAGE_MASK;
>>      addr =3D virt & PAGE_MASK;
>>      end =3D PAGE_ALIGN(virt + size);
>>    The downward rounding of phys via PAGE_MASK extends the mapped
>>    range backward into the adjacent no-map region, effectively
>>    including no-map memory in the linear mapping.
>>=20
>> For example, with 64K pages, reserved_region@A2000000 (base=3D0xA2000=
000,
>> size=3D0x8000, no-map) causes for_each_mem_range to return
>> start=3D0xA2008000 for the next mappable region. After phys &=3D PAGE=
_MASK,
>> the actual mapping starts at 0xA2000000 =E2=80=94 the entire no-map r=
egion is
>> incorrectly mapped.
>>=20
>> Fix this by rounding the mappable range inward to PAGE_SIZE boundaries
>> before passing it to __map_memblock: start is rounded UP and end is
>> rounded DOWN. This ensures the mapped area never overlaps with adjace=
nt
>> no-map regions. The cost is at most one page of unmapped gap at each
>> boundary, which is preferable to violating no-map semantics.
>>=20
>> Signed-off-by: liulhong617 <liulhong617@gmail.com>
>> ---
>>  arch/arm64/mm/mmu.c | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>=20
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index dd85e093f..bc8ac7622 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -1175,6 +1175,20 @@ static void __init map_mem(pgd_t *pgdp)
>>  	for_each_mem_range(i, &start, &end) {
>>  		if (start >=3D end)
>>  			break;
>> +		/*
>> +		 * for_each_mem_range may return sub-page-aligned boundaries
>> +		 * after memblock_mark_nomap() splits regions at byte precision.
>> +		 * __create_pgd_mapping_locked aligns phys down to PAGE_MASK,
>> +		 * which could accidentally map no-map memory on the boundary.
>> +		 * Round the mappable range inward: start UP, end DOWN, so
>> +		 * that the mapped area never overlaps with adjacent no-map
>> +		 * regions. The cost is at most one page of unmapped gap at
>> +		 * each boundary.
>> +		 */
>> +		start =3D PAGE_ALIGN(start);
>> +		end =3D end & PAGE_MASK;
>> +		if (start >=3D end)
>> +			continue;
>
> Maybe I'm over-worrying here, but I've seen firmware describe parts of
> memory as lots of small, adjacent regions in some cases and so I'm
> worried we'd fail to map the pages with this change.
>
> I'd be more in favour of detecting sub-page sized "no-map" regions that
> are adjacent to normal memory regions, emitting a warning/firmware tai=
nt
> and then doing... precisely nothing about it. What practical issues are
> you seeing on your system?
>

I think this change is conceptually sound: for_each_mem_range() will pre=
sent
a set of coalesced memory ranges, so any sub-[OS-]page regions will have
been stitched together by this time. The only sane way to handle no-map
regions is to round them outward, even if this might result in issues if=
 the
bootloader is being thick and e.g., puts part of the initramfs (which the
kernel assumes is accessible via the linear map) in a region that remains
unmapped as a result.

I do wonder if it wouldn't be better if __create_pgd_mapping_locked() did
inward rounding, or even better, did no rounding at all, and left it to =
the
callers to perform the rounding.




