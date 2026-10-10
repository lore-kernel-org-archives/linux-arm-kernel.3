Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 985AFCA6017
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 03:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RPMsSbn+X287AkmXHu+Myu3LsKJD6Xma5zbMLCbaM+Y=; b=P/Vc2G/zWjxp72c91sLn5961R+
	q5C8bPKhpqCfYAuIE2Ztnl307r/4BcxzBuc03/sW6FnlOapZr1yjA88zPsgjQvWejsTag8nRDvfxo
	ZZpMtdAofxOU9FyHQqJKELFR6qeTpohe/X8Fn/tLjEjf2iTKdMJINgA7YiI2wKpVsUhF4BI5TbFPo
	+HAgJC6kPvhiSL6+QXz6gEMu6qJZ5sE/fqrVP4dmz0KgUzJHPVeVDkx2qotycafS+nDZ3u3GaprWj
	IjX+kLFrJzvmVpaOxDejvC70XcAQ2nDTLI77DHwm709MzvQqlJ/fWgq3RuGbDu3CVK3XHEPTdMSgB
	lBmQ/Avg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFNzw-00000007TmV-121v;
	Sat, 10 Oct 2026 03:43:48 +0000
Received: from out-154.mta1.migadu.com ([2001:41d0:203:375::9a] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFNzt-00000007Tlk-2Rnc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 03:43:47 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=e2Gg2A0pOiUOVFvGVHWV6wr7kkqR+muGcjituStXuzA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791603823; v=1; x=1792208623;
 b=knhHF/JDy9lkKxtZQnxgn3u7UyjAyvUOTckxSbLlK7a1iULv3C7sntUsb9k9jijBoEqjPsVM
 glo48k56/pu9rwM90gWWg3q6OH00dLjyEQldwtk9MV10cDWKYN/Fz1G82iksnDzUo8iWdJ3p3Nw
 lAciycb8CyOb7GiowS9UrO94=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 14bbb4f2a2970250;
	Sat, 10 Oct 2026 03:43:43 +0000
X-Mizu-Trace-ID: 14bbb4f2a2970250
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH 4/4] arm64/mm: fix destructor for unconstructed hotplug
 page tables
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <d47bdf83-1db4-4601-a516-7e23488ea9cf@kernel.org>
Date: Sat, 10 Oct 2026 11:43:23 +0800
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
Message-Id: <DDFF90A3-86D7-42D6-844A-5D29A44BAB4D@linux.dev>
References: <20261008073021.2512665-1-songmuchun@bytedance.com>
 <20261008073021.2512665-5-songmuchun@bytedance.com>
 <d47bdf83-1db4-4601-a516-7e23488ea9cf@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: Apple Mail (2.3901.100.1.1.12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_204346_125254_BB25A622 
X-CRM114-Status: GOOD (  19.59  )
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



> On Oct 10, 2026, at 04:43, David Hildenbrand (Arm) <david@kernel.org> =
wrote:
>=20
> On 10/8/26 09:30, Muchun Song wrote:
>> Commit c594b83457cc ("arm64: mm: call pagetable dtor when freeing
>> hot-removed page tables") made free_hotplug_pgtable_page()
>> unconditionally run the page-table destructor. This matches page =
tables
>> allocated by the arm64 mapping code, which runs the corresponding
>> constructors.
>>=20
>> However, arm64 also uses the generic sparse-vmemmap population code.
>> Runtime intermediate page tables allocated by that code do not run a
>> page-table constructor.
>=20
> Why do we have that inconsistency? It seems to cause pain :)

Ha, yeah, it's a bit painful :)

I think it's because the arch folks didn't realize that vmemmap =
population
does not run a page-table constructor.

But the inconsistency is temporary =E2=80=94 I deliberately kept it so =
the bug fixes
are easier to backport. After those fixes land, I'll follow up with the
unified series, which will make vmemmap population run a page-table
constructor.

>=20
>> Freeing one during memory hot-remove therefore
>> runs a destructor without a matching constructor and corrupts
>> NR_PAGETABLE accounting.
>>=20
>> Use PageTable() to run the destructor only for page-table pages whose
>> constructor initialized them. This keeps the arm64-created page-table
>> lifecycle balanced while safely freeing constructor-free vmemmap =
tables.
>>=20
>> Fixes: c594b83457cc ("arm64: mm: call pagetable dtor when freeing =
hot-removed page tables")
>> Cc: stable@vger.kernel.org
>> Assisted-by: LLM
>> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>> ---
>> arch/arm64/mm/mmu.c | 3 ++-
>> 1 file changed, 2 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index 7343ac9294f8..688b33095651 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -1495,7 +1495,8 @@ static void free_hotplug_page_range(struct page =
*page, size_t size,
>>=20
>> static void free_hotplug_pgtable_page(struct page *page)
>> {
>> - 	pagetable_dtor(page_ptdesc(page));
>> + 	if (PageTable(page))
>> + 		pagetable_dtor(page_ptdesc(page));
>> 	free_hotplug_page_range(page, PAGE_SIZE, NULL);
>=20
> That results in a __free_pages() for  ones allocated by sparse-vmemmap
> population code. Are we sure that's the right thing to do?

Good point. free_hotplug_pgtable_page() is used to free intermediate
page-table pages, so pagetable_free() is the more appropriate interface
here.

>=20
> This is all so inconsistent and confusing :(

Yeah, so I'm working on removing these inconsistencies.

Thanks,
Muchun

>=20
> --=20
> Cheers,
>=20
> David



