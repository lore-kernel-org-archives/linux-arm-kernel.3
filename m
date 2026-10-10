Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE427CA9EBB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 02:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xO/DrEb5NC2MoCMBPruLijcNX5+xKYf9pDjFHrKGsTY=; b=zHYR0vic7KZivhFHqqq0jOUP0t
	X2zDVDA8ZHTrfc/pGSWvYKxlnoxbkup9SPlTjROjT8+Uy2Ez2W+rveMu0DcVIMKgkvfaSH7OEVnO3
	NIZNtm+OaXk30mCukQ4+Rh3+2xVJbevh5/QWH08b3Tlyobx/KqGLlA4e1X+tN9jvHV5VvzWk+dZJh
	LYB/dSf1AfPeQiKY3nm9gkJULyPK7aDwFvjhE7JJk81mllKPlwhcHLzcA+Mc2h2F+32eoUTVd7ubr
	KPPvU49KGkYCEqsGkxtOBoyFd+Xxut/j1b35hZCgUfZkHFYRU1Rxfp6W/TALDovK/BSN6P9PRVtwX
	p/hr4cww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFNIb-00000007S0J-0nwg;
	Sat, 10 Oct 2026 02:59:01 +0000
Received: from out-204.mta0.migadu.com ([2001:41d0:1004:224b::cc] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFNIW-00000007RzC-0CqN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 02:58:57 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=fuKQv+8RzNOVU5ZBFPLwPT4hB6cWDIUsCSCLi5x0JgQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791601131; v=1; x=1792205931;
 b=PAj8h8hFf53pYA8bcbFfyagGuVs4DqfbJuXHEUnfv59QUS5S5psIkTHUuenHnzKs8/hsCMFW
 Y9qXKdb7ZS40BBEWtKNeHuAFhCPDS3wRLvIjGCOj+uzX/blKplHI+EZupUQhTBSUV88U9ZaJ57e
 hSGchvbD2wPg5sMocvPwtlqM=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 04bc35dd178ace7f;
	Sat, 10 Oct 2026 02:58:51 +0000
X-Mizu-Trace-ID: 04bc35dd178ace7f
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH 2/4] riscv/mm: fix hotplug page-table destructor handling
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <664510b2-3510-499f-aab5-ceddfcc82581@kernel.org>
Date: Sat, 10 Oct 2026 10:58:32 +0800
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
Message-Id: <F7FC1A28-A34E-4FE3-A6E8-92D842FFA0A8@linux.dev>
References: <20261008073021.2512665-1-songmuchun@bytedance.com>
 <20261008073021.2512665-3-songmuchun@bytedance.com>
 <664510b2-3510-499f-aab5-ceddfcc82581@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: Apple Mail (2.3901.100.1.1.12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_195856_523706_E292332C 
X-CRM114-Status: GOOD (  14.22  )
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



> On Oct 10, 2026, at 04:37, David Hildenbrand (Arm) <david@kernel.org> =
wrote:
>=20
> On 10/8/26 09:30, Muchun Song wrote:
>> RISC-V uses the same memory-hotplug teardown code for the linear map =
and
>> vmemmap, although their page-table pages are not always allocated in =
the
>> same way. Late linear-map allocations run page-table constructors, =
while
>> vmemmap and early allocations may provide constructor-free pages.
>>=20
>> The PTE path unconditionally runs the destructor, which is wrong for
>> constructor-free vmemmap tables. The PMD path avoids that problem by
>> using is_vmemmap as a proxy for constructor state, but that =
assumption
>> will no longer hold once runtime vmemmap allocations use the normal
>> pgalloc helpers.
>>=20
>> Page-table constructors record their state in PG_table. Centralize
>> page-table freeing and use PageTable() to decide whether the =
destructor
>> is required. Keep reserved and constructor-free pages on their =
existing
>> freeing paths.
>>=20
>> Fixes: c75a74f4ba19 ("riscv: mm: Add memory hotplugging support")
>> Cc: stable@vger.kernel.org
>> Assisted-by: LLM
>> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>> ---
>> arch/riscv/mm/init.c | 29 ++++++++++++++---------------
>> 1 file changed, 14 insertions(+), 15 deletions(-)
>>=20
>> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
>> index 857f9a55039c..429a0b015ec1 100644
>> --- a/arch/riscv/mm/init.c
>> +++ b/arch/riscv/mm/init.c
>> @@ -1486,10 +1486,19 @@ struct execmem_info __init =
*execmem_arch_setup(void)
>> #endif /* CONFIG_EXECMEM */
>>=20
>> #ifdef CONFIG_MEMORY_HOTPLUG
>> +static void __meminit free_pagetable(struct page *page)
>> +{
>> + 	if (PageReserved(page))
>> + 		free_reserved_page(page);
>> + 	else if (PageTable(page))
>> + 		pagetable_dtor_free(page_ptdesc(page));
>> + 	else
>> + 		pagetable_free(page_ptdesc(page));
>=20
> Similar thought, can't we detect that in pagetable_free() somehow and =
avoid
> requiring callers to handle that?

I think we can, then pagetable_dtor_free() can be removed because =
pagetable_free
can handle the case of pagetable_dtor_free.

Thanks,
Muchun

>=20
> --=20
> Cheers,
>=20
> David



