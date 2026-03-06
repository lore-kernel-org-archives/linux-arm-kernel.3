Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8896CF513F4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 04:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jvulmaWHVHLTxELsaUcupjwHmyR9DBqU5/UhJVjUTkk=; b=eKh+9kqMrzqNb5fZhGVdNiPkTB
	LuEw+iJoNHSTdMoN48VLDQoaYwUKncDSSD3BOV2G4ZXY6nYNfqyw3QEjydViRokg2VFgN6eO2HVqX
	pHUJL3SqST0w3dTdYNZuYTzcA+ZjzRoiz13I0hRWjicqSVVD1HXYcU+Nw6Q+QIu9Rs84MnVJDnOt2
	vmulN5xV+Xukhx/rmdgt/6rvZ9CQmNdXJCYxN/h5FJpoXK7p38D6PSwAfVK6a0zrEKJoKnXNKY62x
	EtDT1eAIEwtuZ9/ZYa2UhG9ZkJrYg7kKTO4UTi601x4ASsMTOBNZkwnYuOXlWMcL3THBBRoMqdsaO
	hRUd1jog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyMl8-000000030db-1RqG;
	Fri, 06 Mar 2026 04:25:54 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyMl5-000000030dH-2fB4
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 06 Mar 2026 04:25:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=jvulmaWHVHLTxELsaUcupjwHmyR9DBqU5/UhJVjUTkk=; b=aFzYSKfNpDK4g1CCGvw7X8T2jh
	fISPftxcZZHFmW/uVYj00QjQoeOE+cnxCCfNGf60xcAITo155VewGg8b94KHAJDmgSmxDFO2xybGm
	lS9KOpNbj3XTlNAgb2fA1YpjhDE8FN/l3OVKD83XpfLFxTVQpOieJ3IMP0XnnrB3IRERiRApue4lg
	IdqoYajTIgG3LUGOW+QUYzwKSVc1bAPidLbWXo4yK4LXIhi9nuTQLcc/2qb5TalHrcpKGAtk2TQV7
	IhT7WXpVDek3hi1swmixTb654rh4P0qCodoYra7NlWmKoya92mTQQ1VcLMa/i8nueZDSJfFlNUaF3
	4LBCnnHw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyMkv-0000000G8pR-0PfW;
	Fri, 06 Mar 2026 04:25:41 +0000
Date: Fri, 6 Mar 2026 04:25:40 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Yin Tirui <yintirui@huawei.com>
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, david@kernel.org,
	catalin.marinas@arm.com, will@kernel.org, tglx@kernel.org,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	hpa@zytor.com, luto@kernel.org, peterz@infradead.org,
	akpm@linux-foundation.org, lorenzo.stoakes@oracle.com,
	ziy@nvidia.com, baolin.wang@linux.alibaba.com,
	Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
	dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev,
	vbabka@suse.cz, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
	anshuman.khandual@arm.com, rmclure@linux.ibm.com,
	kevin.brodsky@arm.com, apopple@nvidia.com, ajd@linux.ibm.com,
	pasha.tatashin@soleen.com, bhe@redhat.com, thuth@redhat.com,
	coxu@redhat.com, dan.j.williams@intel.com, yu-cheng.yu@intel.com,
	baolu.lu@linux.intel.com, conor.dooley@microchip.com,
	Jonathan.Cameron@huawei.com, riel@surriel.com,
	Kefeng Wang <wangkefeng.wang@huawei.com>, chenjun102@huawei.com
Subject: Re: [PATCH RFC v3 2/4] mm/pgtable: Make pfn_pte() filter out huge
 page attributes
Message-ID: <aapXRN4KjWtUUJ0g@casper.infradead.org>
References: <20260228070906.1418911-1-yintirui@huawei.com>
 <20260228070906.1418911-3-yintirui@huawei.com>
 <5eaf3846-01db-471e-9903-b0b239d7838d@suse.com>
 <e8d5ba16-3071-4b4a-b6a1-d492cc46e8c2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e8d5ba16-3071-4b4a-b6a1-d492cc46e8c2@huawei.com>
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

On Thu, Mar 05, 2026 at 05:38:46PM +0800, Yin Tirui wrote:
> On 3/4/2026 3:52 PM, Jürgen Groß wrote:
> > Today it can either be used for a large page (which should be a pmd,
> > of course), or - much worse - you'd strip the _PAGE_PAT bit, which is
> > at the same position in PTEs.
> > 
> > So basically you are removing the ability to use some cache modes.
> > 
> > NACK!
> > 
> > 
> > Juergen
> 
> Hi Willy and Jürgen,
> 
> Following up on the x86 _PAGE_PSE and _PAGE_PAT aliasing issue.
> 
> To achieve the goal of keeping pfn_pte() pure and completely eradicating the
> pte_clrhuge() anti-pattern, we need a way to ensure pfn_pte() never receives
> a pgprot with the huge bit set.
> 
> @Jürgen:
> Just to be absolutely certain: is there any safe way to filter out the huge
> page attributes directly inside x86's pfn_pte() without breaking PAT? Or
> does the hardware bit-aliasing make this strictly impossible at the
> pfn_pte() level?
> 
> @Willy @Jürgen:
> Assuming it is impossible to filter this safely inside pfn_pte() on x86, we
> must translate the pgprot before passing it down. To maintain strict
> type-safety and still drop pte_clrhuge(), I plan to introduce two
> arch-neutral wrappers:
> 
> x86:
> /* Translates large prot to 4K. Shifts PAT back to bit 7, inherently
> clearing _PAGE_PSE */
> #define pgprot_huge_to_pte(prot)    pgprot_large_2_4k(prot)
> /* Translates 4K prot to large. Shifts PAT to bit 12, strictly sets
> _PAGE_PSE */
> #define pgprot_pte_to_huge(prot)
> __pgprot(pgprot_val(pgprot_4k_2_large(prot)) | _PAGE_PSE)

I don't think we should have pgprot_large_2_4k().  Or rather, I think it
should be embedded in pmd_pgprot() / pud_pgprot().  That is, we should
have an 'ideal' pgprot which, on x86, perhaps matches that used by the
4k level.  pfn_pmd() should be converting from the ideal pgprot to
that actually used by PMDs (and setting _PAGE_PSE?)

> arm64:
> /*
>  * Drops Block marker, enforces Page marker.
>  * Strictly preserves the PTE_VALID bit to avoid validating PROT_NONE pages.
>  */
> #define pgprot_huge_to_pte(prot) \
>       __pgprot((pgprot_val(prot) & ~(PMD_TYPE_MASK & ~PTE_VALID)) | \
>              (PTE_TYPE_PAGE & ~PTE_VALID))
> /*
>  * Drops Page marker, sets Block marker.
>  * Strictly preserves the PTE_VALID bit.
>  */
> #define pgprot_pte_to_huge(prot) \
>       __pgprot((pgprot_val(prot) & ~(PTE_TYPE_MASK & ~PTE_VALID)) | \
>              (PMD_TYPE_SECT & ~PTE_VALID))
> 
> Usage:
> 1.  Creating a huge pfnmap (remap_try_huge_pmd)
> pgprot_t huge_prot = pgprot_pte_to_huge(prot);
> 
> /* No need for pmd_mkhuge() */
> pmd_t entry = pmd_mkspecial(pfn_pmd(pfn, huge_prot));
> set_pmd_at(mm, addr, pmd, entry);
> 
> 2. Splitting a huge pfnmap (__split_huge_pmd_locked)
> pgprot_t small_prot = pgprot_huge_to_pte(pmd_pgprot(old_pmd));
> 
> /* No need for pte_clrhuge() */
> pte_t entry = pfn_pte(pmd_pfn(old_pmd), small_prot);
> set_ptes(mm, haddr, pte, entry, HPAGE_PMD_NR);
> 
> 
> Willy, is there a better architectural approach to handle this and satisfy
> the type-safety requirement given the x86 hardware constraints?
> 
> -- 
> Thanks,
> Yin Tirui
> 
> 

