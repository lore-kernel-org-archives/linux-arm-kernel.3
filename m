Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BEFBCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 06:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B0Ldfqr2ngs4tUVmrZGR8IuA8f+j0qWTUw7Wa6Derco=; b=QbYdxtXu2EiAt+wqJigmZIvi0F
	WbfGRYAnU26JtvDGhe5dIMLtxkGOJ3y+A+58qCZcQ0T0pDWTYDVSPB/T2QfUbYsc2E9rTZEvgYnEY
	DFwQvLVp7z/E5/O2vituiVXA/hTsCR+Wa7Hl5uW4GigK4ofxy3Ddj8NKeNkKNym1SsxEwAkANJ6vj
	0Dcl71pCmBIb+ObFoPn0kyKnE6E57L9znFutfo21+dC75teS+IfSGht+CDCKsj0ipjANbZRn0yyH/
	567P68q/Ytf3nOOAItoThARXNPWS4/ZLEPs6iy5xM372i8jH5mGAGmTjjNXhAIe/lharrEaMlU/xi
	+rtOhaaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDks-00000000ITl-06nq;
	Tue, 19 May 2026 06:16:38 +0000
Received: from out-173.mta1.migadu.com ([95.215.58.173])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDkp-00000000IQh-1fii
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 06:16:36 +0000
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779171385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B0Ldfqr2ngs4tUVmrZGR8IuA8f+j0qWTUw7Wa6Derco=;
	b=JNdTU86E7+9dgnEn/PyWB0Xi+hyY1F6UY7TXyMSJfQLBsJ5pgSSpGBUQt+sRbSeRDxbN0g
	YOmNImEkcvjwgHrhmUbS7A3//04gNtd84ukEHxFJLWq3/3HR0azT407rB2InuAWofz5Vie
	Ap+q313Af6Hx0+KVWHon9fPAtTjoykw=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.500.181\))
Subject: Re: [PATCH v2 2/5] arm64/mm: drop vmemmap_pmd helpers and use generic
 code
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <agsHINLR-D-tRiGd@willie-the-truck>
Date: Tue, 19 May 2026 14:15:32 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 linux-mm@kvack.org,
 akpm@linux-foundation.org,
 Ryan Roberts <ryan.roberts@arm.com>,
 David Hildenbrand <david@kernel.org>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Dev Jain <dev.jain@arm.com>,
 Lorenzo Stoakes <ljs@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Yang Shi <yang@os.amperecomputing.com>,
 Chaitanya S Prakash <chaitanyas.prakash@arm.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <93852370-3D0E-4C0F-8F63-B3EF57977E59@linux.dev>
References: <20260404122105.3989557-1-songmuchun@bytedance.com>
 <20260404122105.3989557-3-songmuchun@bytedance.com>
 <agsHINLR-D-tRiGd@willie-the-truck>
To: Will Deacon <will@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_231635_657313_EB8D90B7 
X-CRM114-Status: GOOD (  15.39  )
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



> On May 18, 2026, at 20:33, Will Deacon <will@kernel.org> wrote:
>=20
> On Sat, Apr 04, 2026 at 08:20:55PM +0800, Muchun Song wrote:
>> The generic implementations now suffice; remove the arm64 copies.
>>=20
>> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>> ---
>> arch/arm64/mm/mmu.c | 14 --------------
>> 1 file changed, 14 deletions(-)
>>=20
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index ec1c6971a561..b87053452641 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -1745,20 +1745,6 @@ static void free_empty_tables(unsigned long =
addr, unsigned long end,
>> }
>> #endif
>>=20
>> -void __meminit vmemmap_set_pmd(pmd_t *pmdp, void *p, int node,
>> -       unsigned long addr, unsigned long next)
>> -{
>> - 	pmd_set_huge(pmdp, __pa(p), __pgprot(PROT_SECT_NORMAL));
>> -}
>> -
>> -int __meminit vmemmap_check_pmd(pmd_t *pmdp, int node,
>> - unsigned long addr, unsigned long next)
>> -{
>> - 	vmemmap_verify((pte_t *)pmdp, node, addr, next);
>> -
>> - 	return pmd_sect(READ_ONCE(*pmdp));
>> -}
>=20
> I think this is fine:
>=20
> Acked-by: Will Deacon <will@kernel.org>

Thanks.

>=20
> but note that, since c25c4aa3f79a ("arm64: mm: Add PTE_DIRTY back to
> PAGE_KERNEL* to fix kexec/hibernation"), I think that using =
PAGE_KERNEL
> (like the generic code does in the first patch of this series) means
> that this change isn't a no-op -- it means that the huge entries will
> now be marked as dirty. That's possibly a bug fix (?)

I think you are right. We should mark kernel mapping as dirty.

Thanks,
Muchun

>=20
> Will


