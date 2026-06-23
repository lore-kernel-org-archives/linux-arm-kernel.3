Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F19CCDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 14:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0QUJYWhSEioK+JAt/rckl71sDnr4lEuTQt7CEdx+e3o=; b=pfmXubGUbJWF7xH1FtKJGaRmxK
	IK0cmb7tSTKtXi10mYwSAoH2DWl2yka1LzBADy9oYhEdeTWBXgx1jpDM9BrEXh3fXrK8P9yYqLsKo
	mC0lvj2RHIN0BWCaDl1JkSkyD51vA3x+798BQ0JFhMHi7rHCdNj+VnazBFuILgSmHV7Ab7r1rPHSq
	qD/xKaDlQomReToP1XAnESI3d7NxXuriEkSau3IUn+EvTA0r+dvRvAjJxo2fP7qe/Jn/gMNeJZE02
	EJiVlMoPbjAHRTKGi/D89JsXvUP6lU4zUMCbTRi1Gxkp+EuEDfPyuJOH1G79QrhYmHiVd8UIneEK9
	LF/IQh2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc24M-00000006QxZ-4AGP;
	Tue, 23 Jun 2026 14:25:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc24G-00000006Qus-2rt5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 14:25:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EE0EC445E5;
	Tue, 23 Jun 2026 14:25:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86B3C1F000E9;
	Tue, 23 Jun 2026 14:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782224735;
	bh=0QUJYWhSEioK+JAt/rckl71sDnr4lEuTQt7CEdx+e3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dEOl01gseLaYw5LEJsqiq7nPWzVvX7ahq/VzUohcNBiL8espLOdZ/6knQJdxJbIkJ
	 OvKmz/HE5v06KqCWRCD1DRbOHiGJwKAqirEZdHQuIh9ICzEHghsRVKSK8TOOEhe6OQ
	 UPKPeHfzw5fT+WucHX0EyyJ5pqHicns8ucgFmKaYH52dMIpTe6raxAIho/5EJyGJEc
	 QhaIZp/FOV3OkclPTANdLJFA9kY8KgVmhhXl2YggRUrKjFeXkKPx3O+4nsvhO8FeAr
	 0qmMSANtBpHNG86K2zv2P3AKPLFgrSnhXi/YoJUQBa9oxwZQ40Jo1y1ht2rTBFVc/B
	 Oqh3Zklq1bTHQ==
Date: Tue, 23 Jun 2026 15:25:30 +0100
From: Will Deacon <will@kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>, patches@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Sasha Levin <sashal@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable <stable@vger.kernel.org>, mark.rutland@arm.com
Subject: Re: [PATCH 6.1 337/522] arm64/mm: Enable batched TLB flush in
 unmap_hotplug_range()
Message-ID: <ajqXWqiAol6Shdd6@willie-the-truck>
References: <20260616145125.307082728@linuxfoundation.org>
 <20260616145141.584613180@linuxfoundation.org>
 <b0d5836032ce3135bfc473f6bff791306d086925.camel@decadent.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b0d5836032ce3135bfc473f6bff791306d086925.camel@decadent.org.uk>
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

On Sun, Jun 21, 2026 at 05:02:27PM +0200, Ben Hutchings wrote:
> On Tue, 2026-06-16 at 20:28 +0530, Greg Kroah-Hartman wrote:
> > 6.1-stable review patch.  If anyone has any objections, please let me know.
> > 
> > ------------------
> > 
> > From: Anshuman Khandual <anshuman.khandual@arm.com>
> > 
> > [ Upstream commit 48478b9f791376b4b89018d7afdfd06865498f65 ]
> [...]
> > @@ -949,15 +953,14 @@ static void unmap_hotplug_pmd_range(pud_
> >  		WARN_ON(!pmd_present(pmd));
> >  		if (pmd_sect(pmd)) {
> >  			pmd_clear(pmdp);
> > -
> > -			/*
> > -			 * One TLBI should be sufficient here as the PMD_SIZE
> > -			 * range is mapped with a single block entry.
> > -			 */
> > -			flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> > -			if (free_mapped)
> > +			if (free_mapped) {
> > +				/* CONT blocks are not supported in the vmemmap */
> > +				WARN_ON(pmd_cont(pmd));
> > +				flush_tlb_kernel_range(addr, addr + PMD_SIZE);
> 
> It wasn't clear to me from the commit message why this now adds PMD_SIZE
> rather than PAGE_SIZE.  It seems like this change is fine for Linux
> 6.13+ with a CPU that supports TLB range flushing, but otherwise results
> in unnecessarily executing multiple TLB invalidations at intervals of
> the base page size.

Hmm, the commit message also makes very little sense to me and so I don't
understand why this patch has us doing multiple TLB invalidations when
we run into a !cont, block mapping at the PMD level. The old comment
(which this patch removes) should still apply afaict.

Anshuman, Ryan, any ideas what's going on here?

Will

