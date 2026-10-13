Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36FF1CC6B0E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 06:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x3TJ+nLYXw+aqTgNhbnY0u+0hp8FGUc5AIcm44+MuiU=; b=lqT3LSuUupa5Fc3SriHreh6xtf
	Ionq/WxcU42N02DR0422WeW7e+ICDm4ygL47wlbLA1U+p2TKRoZedHc9zuK14Cwg/AymxPEZVKXbo
	nEQjvV4/1VFbx1PlChAdWYF6Mni2qKQooY8989wBRUS8kHY9jhpYYikKpaDf8DpYW4pmPyS67OQBM
	eWdfrrj+pggBS33UaAZNfKniZF6+h1qOOYFpHPTvnpdRBTkfAbhloXunzjuR5vyoc0kCMuT4HrczO
	TyiDvm9D3NuGLmsaj+/XdvgRNbgQmdrEw47UHtlgssiT9pQbrtchcj9x7ltjYdPm5HQUS0dmCRx3J
	khKfvyJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGW5Y-0000000C9Zs-3t3t;
	Tue, 13 Oct 2026 06:34:16 +0000
Received: from out-37.mta0.migadu.com ([2001:41d0:1004:224b::25] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGW5U-0000000C9Yc-0VhG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 06:34:14 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=x3TJ+nLYXw+aqTgNhbnY0u+0hp8FGUc5AIcm44+MuiU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791873249; v=1; x=1792478049;
 b=jPEz53G9zFtMf7S7MMA3ep20v99EcICky/EP9W6meqhELt5OpbuudGf6WopZUAQNGX9cbUKp
 oL5ue2WlC4wtiqVIRa6KGdXuVmtzRp5adDL+7FzQKnKieXPXu4d223bjJvrQA680vlem2AgFhI7
 Sdrm3rr1ohq7fHe9xPgdcgq0=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 4af039548b386c01;
	Tue, 13 Oct 2026 06:34:09 +0000
X-Mizu-Trace-ID: 4af039548b386c01
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH v2 1/4] mm: fix missing page-table destructor in
 pagetable_free()
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <3ab63358-8bbe-4457-b21c-bb81bca804cc@gmail.com>
Date: Tue, 13 Oct 2026 14:33:49 +0800
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <songmuchun@bytedance.com>,
 David Hildenbrand <david@kernel.org>,
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
Message-Id: <2B2F2818-9309-450B-A2A4-9F53D802F1C6@linux.dev>
References: <20261010112457.49485-1-songmuchun@bytedance.com>
 <20261010112457.49485-2-songmuchun@bytedance.com>
 <asy-b7_C3SjnmSaS@gmail.com> <145CD5DC-6457-4E1E-8B9D-AE7D1EDB0AB8@linux.dev>
 <3ab63358-8bbe-4457-b21c-bb81bca804cc@gmail.com>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
X-Mailer: Apple Mail (2.3901.100.1.1.12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_233412_292822_79A3A5EA 
X-CRM114-Status: GOOD (  13.10  )
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



> On Oct 13, 2026, at 01:21, Jose A. Perez de Azpillaga =
<azpijr@gmail.com> wrote:
>=20
> On 10/12/26 2:55 PM, Muchun Song wrote:
>>=20
>>=20
>>> On Oct 12, 2026, at 19:15, Jose A. Perez de Azpillaga =
<azpijr@gmail.com> wrote:
>>>=20
>>> On Sat, Oct 10, 2026 at 07:24:54PM +0800, Muchun Song wrote:
>>>> Since commit 49f599666420 ("mm: call ctor/dtor for kernel PTEs"),
>>>> pte_alloc_one_kernel() runs the page-table constructor for kernel =
PTE
>>>> tables.
>>>>=20
>>>> HVO (HugeTLB Vmemmap Optimization) uses pte_alloc_one_kernel() when
>>>> splitting a PMD. Restoring the vmemmap backing pages does not =
collapse
>>>> the PTE table, so a later memory hot-remove eventually frees it =
through
>>>> pagetable_free() on x86-64. That releases the page without running =
the
>>>> matching destructor and leaves NR_PAGETABLE elevated.
>>>>=20
>>>> Make pagetable_free() detect constructor-backed pages and run the
>>>> destructor before releasing their memory to fix the problem.
>>>>=20
>>>> Fixes: 49f599666420 ("mm: call ctor/dtor for kernel PTEs")
>>>> Cc: stable@vger.kernel.org
>>>=20
>>> is the x86 case covered for 6.16-6.18? as far as I can see, x86
>>> free_pagetable() only uses pagetable_free() since bf9e4e30f353
>>> ("x86/mm: use pagetable_free()") in v6.19, so the backport wouldn't
>>> change anything there. or am I missing something?
>>=20
>> Yes, you are absolutely right =E2=80=94 thanks for catching this.
>>=20
>> I double-checked and indeed x86's free_pagetable() only starts using
>> pagetable_free() since bf9e4e30f353 ("x86/mm: use pagetable_free()"),
>> which landed in v6.19. So for 6.16-6.18 the prerequisite is not =
present
>> and the backport would be a no-op there.
>>=20
>> The correct trailer is:
>>=20
>> Cc: <stable@vger.kernel.org> # 6.16-6.18: bf9e4e30f353: x86/mm: use =
pagetable_free()
>=20
> also, bf9e4e30f353 alone leaks PMD-sized vmemmap pages on those trees,
> it needs 39406c05f8f1 ("x86/mm: Fix freeing of PMD-sized vmemmap =
pages")
> as well :)

Yeah, you are so meticulous.

>=20
> Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
>=20

Thanks.

> --=20
> cheers,
> jose a. p-a


