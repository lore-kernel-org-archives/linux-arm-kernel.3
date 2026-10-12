Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD652CA9EC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 13:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nua+XVEY2vij3Fr22xOyNCUp1hfLgqE/Wz0Aff8l2UY=; b=iVY1fEo6mEtAQE1TLr0uGOZCPD
	MkV3nqWqXgW46v4A2bcDoj7fr7hRiyiMujvm+uJzjUvzBSnSTcw7Ky7y8bIvj3Yk/6SSAKA6bDL+/
	PqmSFV5U52WwxjkJnynmg6axwTeARUMDBF+APUbnDvTRGnGewT8QZBny03QpFQi1KfiZLMyUlOjRw
	p+It7eoa7fd5djiSGvhpqFASN7XduUOaZUqMwgIDIIQH0JzMADnemXhE5qd6dwLMj21C+6Q/BF+ay
	QNKMzAEL0cpcoqH509aXq/QvKbLqPR3Mmj2tdz8B56fJCXv1r+LzzrvjpXe200XD9LgwHJIlsfdUe
	MJgGkDHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGG6O-0000000AZVA-0bm2;
	Mon, 12 Oct 2026 13:30:04 +0000
Received: from out-210.mta0.migadu.com ([2001:41d0:1004:224b::d2] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGG6H-0000000AZTa-3qWl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 13:29:59 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=GGn8drrlO6i+jPM1cQp3kvDlxLXSPfm+i8X2a7OAoPo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791811795; v=1; x=1792416595;
 b=HKcQEqzMc0b9qa3T1l/MT1XX0glz8eLZEWBDc5AJJkcuEAlLFd65BvG/PK8qVzy9Mf/fZPNW
 8dO6QDotEkdH3rj8UjNe2IE6iaeogMiaoXnpuJZZMWnJAHGZ7ImhKIfqy5LwDxPo2JXY+v+V0D/
 FTFz2JY0x35Bi0yTNwGvHeEk=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by mta11.migadu.com with ESMTPS id d7c9edd7e757cc90;
	Mon, 12 Oct 2026 13:29:55 +0000
X-Mizu-Trace-ID: d7c9edd7e757cc90
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH v2 1/4] mm: fix missing page-table destructor in
 pagetable_free()
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <919fcaa9-5ebe-4940-b4fc-59ea0c655ec3@kernel.org>
Date: Mon, 12 Oct 2026 21:29:35 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>,
 Dave Hansen <dave.hansen@intel.com>,
 Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Alistair Popple <apopple@nvidia.com>,
 linux-mm@kvack.org,
 linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <77D942CF-B657-4735-9B95-1C6B38DD0F46@linux.dev>
References: <20261010112457.49485-1-songmuchun@bytedance.com>
 <20261010112457.49485-2-songmuchun@bytedance.com>
 <919fcaa9-5ebe-4940-b4fc-59ea0c655ec3@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: Apple Mail (2.3901.100.1.1.12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_062958_159362_2AF4AA3D 
X-CRM114-Status: GOOD (  21.98  )
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



> On Oct 12, 2026, at 21:27, David Hildenbrand (Arm) <david@kernel.org> =
wrote:
>=20
> On 10/10/26 13:24, Muchun Song wrote:
>> Since commit 49f599666420 ("mm: call ctor/dtor for kernel PTEs"),
>> pte_alloc_one_kernel() runs the page-table constructor for kernel PTE
>> tables.
>>=20
>> HVO (HugeTLB Vmemmap Optimization) uses pte_alloc_one_kernel() when
>> splitting a PMD. Restoring the vmemmap backing pages does not =
collapse
>> the PTE table, so a later memory hot-remove eventually frees it =
through
>> pagetable_free() on x86-64. That releases the page without running =
the
>> matching destructor and leaves NR_PAGETABLE elevated.
>>=20
>> Make pagetable_free() detect constructor-backed pages and run the
>> destructor before releasing their memory to fix the problem.
>>=20
>> Fixes: 49f599666420 ("mm: call ctor/dtor for kernel PTEs")
>> Cc: stable@vger.kernel.org
>> Assisted-by: LLM
>> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>> ---
>> v2:
>> - Move destructor handling from x86 into pagetable_free() (suggested =
by
>>  David Hildenbrand)
>> - Trim and update the commit message (requested by Dave Hansen)
>> ---
>> include/linux/mm.h | 37 ++++++++++++++++++++-----------------
>> 1 file changed, 20 insertions(+), 17 deletions(-)
>>=20
>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> index 5cca90fc1df6..771a7d60b0a5 100644
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -3969,23 +3969,6 @@ static inline void =
pagetable_free_kernel(struct ptdesc *pt)
>> __pagetable_free(pt);
>> }
>> #endif
>> -/**
>> - * pagetable_free - Free pagetables
>> - * @pt: The page table descriptor
>> - *
>> - * pagetable_free frees the memory of all page tables described by a =
page
>> - * table descriptor and the memory for the descriptor itself.
>> - */
>> -static inline void pagetable_free(struct ptdesc *pt)
>> -{
>> - if (ptdesc_test_kernel(pt)) {
>> - ptdesc_clear_kernel(pt);
>> - pagetable_free_kernel(pt);
>> - } else {
>> - __pagetable_free(pt);
>> - }
>> -}
>> -
>> #if defined(CONFIG_SPLIT_PTE_PTLOCKS)
>> #if ALLOC_SPLIT_PTLOCKS
>> void __init ptlock_cache_init(void);
>> @@ -4078,6 +4061,26 @@ static inline void pagetable_dtor(struct =
ptdesc *ptdesc)
>> lruvec_stat_sub_folio(folio, NR_PAGETABLE);
>> }
>>=20
>> +/**
>> + * pagetable_free - Free pagetables
>> + * @pt: The page table descriptor
>> + *
>> + * pagetable_free frees the memory of all page tables described by a =
page
>> + * table descriptor and the memory for the descriptor itself.
>> + */
>> +static inline void pagetable_free(struct ptdesc *pt)
>> +{
>> + if (PageTable(ptdesc_page(pt)))
>> + pagetable_dtor(pt);
>=20
>=20
> We do have
>=20
> static inline void pagetable_dtor_free(struct ptdesc *ptdesc)
> {
> 	pagetable_dtor(ptdesc);
> 	pagetable_free(ptdesc);
> }
>=20
> ... can we now get rid of pagetable_dtor_free() and simply use =
pagetable_free() ?
> (separate cleanup)

You're right, that's exactly my plan.

>=20
>> +
>> + 	if (ptdesc_test_kernel(pt)) {
>> + 		ptdesc_clear_kernel(pt);
>> + 		pagetable_free_kernel(pt);
>> + 	} else {
>> + 		__pagetable_free(pt);
>> + 	}
>=20
>=20
> This goes into the right direction. I'm still confused, but the less =
freeing
> functions we have the better.
>=20
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>

Thanks David.

>=20
> --=20
> Cheers,
>=20
> David


