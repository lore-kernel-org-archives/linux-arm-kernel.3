Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 685EFCA6004
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 03:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RiOsm0VLiWvZ3CXjkpAdill8SJJnyR3xUUM9KZWiffY=; b=uE5pAFPgL0i9yT5dOI6DMahd8I
	M/5q9bjcZbgrsp9M2yl8brBgyjXD8I3JYI9TVxge8lGMck/nYfZMF8rx5ux83oCheYdF3j0iuKsS/
	dr7zq55g7FHPMSeSmK5J4c06bxa9MuoO4XI0TFypehPtXIqDZjnLGeN+hQTiLJGgXyfVZO4CesWqd
	Us6UKsgyC74SJ/lYZg65vgoAq5RFkUgKi8X6fZ82eKG86osJFyaGYzYT41Za+CujR66QJjTgXWWxW
	TgAVsvMKP7y8O8D/B1Bwrkn7Jqfga3ylCUaO6fNJtUHyezpfCL2W06St7qhKHjWlKjgYCgUfWpMlC
	Gj15i7JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFO6d-00000007URm-0t8E;
	Sat, 10 Oct 2026 03:50:43 +0000
Received: from out-72.mta0.migadu.com ([2001:41d0:1004:224b::48] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFO6a-00000007URF-1zkT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 03:50:41 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=ejj+1mQ7GORhSID6jODIShDthWwWtiPSHyMLfZ3/AqU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791604238; v=1; x=1792209038;
 b=oXXbzJ4JEVIIlXmLSFRm9OK+stur3MstaTSM8R7gazaCRKIGrKwCfpn8L2p7Dj5L16p8FS71
 p+ORylMMHzgTMoR/YNm9X2+lSyxkj632ly8gHzZ2g0ei1Jyxvu/lJPvz/2amZ+UA2nLFH41br1x
 pIxXRgA80hDqODcHgG5tXZrI=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 9484aa877343ee44;
	Sat, 10 Oct 2026 03:50:15 +0000
X-Mizu-Trace-ID: 9484aa877343ee44
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH 1/4] x86/mm: fix missing pgtable destructor for vmemmap
 tables
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <39ae6c48-7fcc-41d5-bfaf-fe626071861e@kernel.org>
Date: Sat, 10 Oct 2026 11:49:57 +0800
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
Message-Id: <98481914-D123-4F58-97FA-C2F34469D34C@linux.dev>
References: <20261008073021.2512665-1-songmuchun@bytedance.com>
 <20261008073021.2512665-2-songmuchun@bytedance.com>
 <b8769c67-1683-4d84-94c9-916c305dafc0@kernel.org>
 <39ae6c48-7fcc-41d5-bfaf-fe626071861e@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: Apple Mail (2.3901.100.1.1.12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_205040_716488_98E38FFD 
X-CRM114-Status: GOOD (  12.25  )
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



> On Oct 10, 2026, at 04:36, David Hildenbrand (Arm) <david@kernel.org> =
wrote:
>=20
> On 10/9/26 22:33, David Hildenbrand (Arm) wrote:
>> On 10/8/26 09:30, Muchun Song wrote:
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
>>> + 	else if (PageTable(page))
>>> + 		pagetable_dtor_free(page_ptdesc(page));
>>> 	else
>>> 		pagetable_free(page_ptdesc(page));
>>> }
>>=20
>> pagetable_free() will do ptdesc_test_kernel(pt) -> =
pagetable_free_kernel(pt) ->
>> pagetable_dtor_free().
>=20
> Ah, behavior depends on CONFIG_ASYNC_KERNEL_PGTABLE_FREE$ ...
>=20
> Why not do the right thing in pagetable_free() instead?

Good point. More easy to this issue on different architecture. I'll fix
pagetable_free next version.

Thanks,
Muchun

>=20
> --=20
> Cheers,
>=20
> David



