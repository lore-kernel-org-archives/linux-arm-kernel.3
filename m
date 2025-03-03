Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4CB0C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 10:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SIyZUKYWMYzLj3p+4j1rlsjrhZvLG0ewUVskiNWMKJQ=; b=NFnCGpzZtMOk5zRR0uXjGjC6hA
	LadQC0n9KFUzjQpROmtIvN6UMu1TwQhyInPNvfQhk2e+01aQAXm3OdIXxTxRDs9l327VS1j/vTBxL
	1TcFqs73h9PHyH7vjbRu7lTr5oI0Eg9v1VnvpobGKMWS96V1Xj5F21sZ5FQ+swxGq6IL5mcni+mBp
	DJ2wO94UBYB0ft8kJeK2tjpMIsNateKoawUiNkVmG7jRAKW4BgFqygkIrAnA05kpDqJsUAe7Pf7lK
	LAVAQrZ+7Y7dZOez7h3K3+cGoNLfH9hwdZ2gyJP6x6sk4sKThSRaQy4Q9i9rYT8Q6eh6zO83yo8eC
	qZvX6Pqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3Us-00000000QYO-26U5;
	Mon, 03 Mar 2025 10:58:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3St-00000000Q5z-3Jqs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 10:56:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 836CD113E;
	Mon,  3 Mar 2025 02:56:16 -0800 (PST)
Received: from e133081.arm.com (unknown [10.57.37.136])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 77DE73F673;
	Mon,  3 Mar 2025 02:55:58 -0800 (PST)
Date: Mon, 3 Mar 2025 10:55:47 +0000
From: =?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>
To: David Hildenbrand <david@redhat.com>
Cc: ryan.roberts@arm.com, suzuki.poulose@arm.com,
	yang@os.amperecomputing.com, catalin.marinas@arm.com,
	will@kernel.org, joro@8bytes.org, jean-philippe@linaro.org,
	mark.rutland@arm.com, joey.gouly@arm.com, oliver.upton@linux.dev,
	james.morse@arm.com, broonie@kernel.org, maz@kernel.org,
	akpm@linux-foundation.org, jgg@ziepe.ca, nicolinc@nvidia.com,
	mshavit@google.com, jsnitsel@redhat.com, smostafa@google.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev
Subject: Re: [PATCH v2 3/4] arm64/mm: Elide tlbi in contpte_convert() under
 BBML2
Message-ID: <20250303105539.GA74129@e133081.arm.com>
References: <20250228182403.6269-2-miko.lenczewski@arm.com>
 <20250228182403.6269-5-miko.lenczewski@arm.com>
 <f270bb5d-aa54-45d3-89ed-2b757ab3a4b0@redhat.com>
 <20250303094947.GB13345@e133081.arm.com>
 <7e987f17-ffcb-45e0-8588-2d569d90f776@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7e987f17-ffcb-45e0-8588-2d569d90f776@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_025603_918586_BA70B40D 
X-CRM114-Status: GOOD (  40.47  )
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

On Mon, Mar 03, 2025 at 10:57:21AM +0100, David Hildenbrand wrote:
> On 03.03.25 10:49, Mikołaj Lenczewski wrote:
> > Hi David,
> > 
> > Thanks for taking the time to review.
> > 
> > On Mon, Mar 03, 2025 at 10:17:12AM +0100, David Hildenbrand wrote:
> > > On 28.02.25 19:24, Mikołaj Lenczewski wrote:
> > > > If we support bbml2 without conflict aborts, we can avoid the final
> > > > flush and have hardware manage the tlb entries for us. Avoiding flushes
> > > > is a win.
> > > > 
> > > > Signed-off-by: Mikołaj Lenczewski <miko.lenczewski@arm.com>
> > > > Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
> > > > ---
> > > >    arch/arm64/mm/contpte.c | 3 ---
> > > >    1 file changed, 3 deletions(-)
> > > > 
> > > > diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
> > > > index 145530f706a9..77ed03b30b72 100644
> > > > --- a/arch/arm64/mm/contpte.c
> > > > +++ b/arch/arm64/mm/contpte.c
> > > > @@ -72,9 +72,6 @@ static void contpte_convert(struct mm_struct *mm, unsigned long addr,
> > > >    		__flush_tlb_range(&vma, start_addr, addr, PAGE_SIZE, true, 3);
> > > >    	__set_ptes(mm, start_addr, start_ptep, pte, CONT_PTES);
> > > > -
> > > > -	if (system_supports_bbml2_noabort())
> > > > -		__flush_tlb_range(&vma, start_addr, addr, PAGE_SIZE, true, 3);
> > > >    }
> > > >    void __contpte_try_fold(struct mm_struct *mm, unsigned long addr,
> > > 
> > > What's the point of not squashing this into #2? :)
> > > 
> > > If this split was requested during earlier review, at least seeing patch #2
> > > on its own confused me.
> > 
> > This split is a holdover from an earlier patchset, where it was still
> > unknown whether the removal of the second flush was permitted with
> > BBML2. Partly this was due to us being worried about conflict aborts
> > after the removal, and partly this was because the "delay" is a separate
> > optimisation that we could apply even if it turned out the final patch
> > was not architecturally sound.
> > 
> > Now that we do not handle conflict aborts (preferring only systems that
> > handle BBML2 without ever raising aborts), the first issue is not a
> > problem. The reasoning behind the second patch is also a little bit
> > outdated, but I can see the logical split between a tlbi reorder, and
> > the removal of the tlbi. If this is truly redundant though, I would be
> > happy to squash the two into a single patch.
> 
> Thanks for the information.
> 
> Does patch #2 (reordering the tlbi) have any benefit on its own? I read
> "other threads will not see an invalid pagetable entry", but I am not sure
> that is correct. A concurrent HW page table walker would still find the
> invalid PTE? It's just a matter of TLB state.

I think I understand what you mean. I agree that it is possible for a
concurrent walk to see an invalid TLBI state, if it is on the same TLB
that the repaint is happening on. For other TLBs, the flush has not yet
propagated our invalidated PTEs (from `__ptep_get_and_clear()`) though?
That invalidation will only be seen by other TLBs after the
`__flush_tlb_range()`, so we should save a few faults because only
"local" threads will ever see the invalid entry, as opposed to all
threads that try to read our modified range? Or it is the case that I
have misunderstood something basic here, or that I have misinterpreted
what you have written?

> If there is no benefit in having patch #2 independently, I'd just squash
> them. Reordering to then remove is more complicated than just removing it
> IMHO.
> 
> -- 
> Cheers,
> 
> David / dhildenb
> 

-- 
Kind regards,
Mikołaj Lenczewski

