Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3380CA6004
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 03:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M9jIPl6+yPgGMdnU4k2Tdgn8WLjevkl4iMb4e9aDeR0=; b=24xUkBA3TKeCxdSpqvEULW30mv
	a9p1eJ+dXZJHzR78AaHb8WRAKWXNQZaT69lLsUUUQMlHQWRhHjIocmqHVt21HlZYlXDDVuIjW5xlf
	QP1KMQtcGRLqVepRGoBbAm0SIsHuPirrj38gxi/vbzgkCKLb56V/UlqaVN+WBd57NCSfvLL+yQJEe
	O8JV28rhTowHaoWu1gIeOicnlu6oi0G2EXghLYS2/mnzCWb8mfVpICdRJe2Ph5S5tDkLs0vSrjLZ+
	5iYEy26BdmYC+nlBkYcfHEkEFbx8IeGETgLg0Okbhy8JqExe8+PpNW0HqkjC22j6eBL5l5IhAKb6k
	QtJirIFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFO0t-00000007Twu-2Mez;
	Sat, 10 Oct 2026 03:44:47 +0000
Received: from out-249.mta0.migadu.com ([2001:41d0:1004:224b::f9] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFO0r-00000007Tvs-0Vhn
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 03:44:46 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=0fo0QMf0rjH7MV2/iuitzfDF1YtJ7sax/S4uxQhGa9o=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791603883; v=1; x=1792208683;
 b=ZLC1yd49raPT2YE6fJK39fORSvmhoQ+qRo6TIfUNdICyeTRbOIPSyf7weuspuE38vRpSN4gb
 p6+0ej03LOD1jJNcm2KNzO7FGkozS57yvKefcmGG1STBSvbFYc8ZxVErWpNN3aCs/mFJRy4WJMv
 XBuUAQiDHwREqPS/v3U3almI=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 468dd143d2755872;
	Sat, 10 Oct 2026 03:44:43 +0000
X-Mizu-Trace-ID: 468dd143d2755872
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH 1/4] x86/mm: fix missing pgtable destructor for vmemmap
 tables
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <1a0f51d9-7931-45a3-ab36-e0642c199a37@kernel.org>
Date: Sat, 10 Oct 2026 11:44:26 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 akpm@linux-foundation.org,
 linux-mm@kvack.org,
 stable@vger.kernel.org,
 osalvador@suse.de,
 dave.hansen@linux.intel.com,
 luto@kernel.org,
 peterz@infradead.org,
 tglx@kernel.org,
 mingo@redhat.com,
 bp@alien8.de,
 x86@kernel.org,
 hpa@zytor.com,
 catalin.marinas@arm.com,
 will@kernel.org,
 mark.rutland@arm.com,
 linux-arm-kernel@lists.infradead.org,
 pjw@kernel.org,
 palmer@dabbelt.com,
 aou@eecs.berkeley.edu,
 alex@ghiti.fr,
 linux-riscv@lists.infradead.org,
 agordeev@linux.ibm.com,
 kevin.brodsky@arm.com,
 bjorn@rivosinc.com,
 apopple@nvidia.com,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <062E1067-B11D-4BF7-A2BA-C71B599A805C@linux.dev>
References: <20261008073021.2512665-1-songmuchun@bytedance.com>
 <20261008073021.2512665-2-songmuchun@bytedance.com>
 <ECC604FF-E74D-43B1-9105-A6683EEDE558@linux.dev>
 <1a0f51d9-7931-45a3-ab36-e0642c199a37@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: Apple Mail (2.3901.100.1.1.12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_204445_297207_2F2302AF 
X-CRM114-Status: GOOD (  13.20  )
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



> On Oct 10, 2026, at 04:29, David Hildenbrand (Arm) <david@kernel.org> =
wrote:
>=20
> On 10/8/26 10:32, Muchun Song wrote:
>>=20
>>=20
>>> On Oct 8, 2026, at 09:30, Muchun Song <songmuchun@bytedance.com> =
wrote:
>>>=20
>>> Since commit 49f599666420 ("mm: call ctor/dtor for kernel PTEs"),
>>> pte_alloc_one_kernel() runs the page-table constructor for kernel =
PTE
>>> tables.
>>>=20
>>> HugeTLB vmemmap optimization uses pte_alloc_one_kernel() when =
splitting
>>> a PMD. Restoring the vmemmap backing pages does not collapse the PTE
>>> table, so a later memory hot-remove eventually frees that table =
through
>>> free_pagetable(). That path currently calls pagetable_free() =
directly
>>> without decrementing NR_PAGETABLE.
>>>=20
>>> Use PageTable() to identify constructor-backed tables and run the
>>> matching destructor before freeing them. Keep reserved and
>>> constructor-free tables on their existing paths. This also prepares
>>> vmemmap teardown for generic runtime allocations through the normal
>>> pgalloc helpers.
>>>=20
>>> Fixes: 49f599666420 ("mm: call ctor/dtor for kernel PTEs")
>>> Cc: stable@vger.kernel.org
>>> Assisted-by: LLM
>>> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>>> ---
>>> arch/x86/mm/init_64.c | 2 ++
>>> 1 file changed, 2 insertions(+)
>>>=20
>>> diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
>>> index 70e682180291..a3ea627157ab 100644
>>> --- a/arch/x86/mm/init_64.c
>>> +++ b/arch/x86/mm/init_64.c
>>> @@ -1003,6 +1003,8 @@ static void __meminit free_pagetable(struct =
page *page)
>>> {
>>> 	if (PageReserved(page))
>>> 		free_reserved_page(page);
>>> +  	else if (PageTable(page))
>>> +  		pagetable_dtor_free(page_ptdesc(page));
>>=20
>> Sashiko mentioned that kernel page table pages and vmemmap pages are
>> freed to the buddy allocator before their parent entries are cleared
>> and before the TLB is flushed, creating a dangling pointer window.
>>=20
>> That's a a real but pre-existing issue, I will not fix that in this
>> series.
>=20
> Memory is getting removed, concurrent access to directmap+vmemmap is =
not
> expected unless BUG I think. That should make this less critical I =
think ...
> (except speculation? not sure if that applies)

Agree. So, I will ignore this.

Thanks,
Muchun

>=20
> --=20
> Cheers,
>=20
> David



