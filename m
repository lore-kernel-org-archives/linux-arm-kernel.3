Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABBF3C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 13:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ynUNGRzVuwVOMeY0f5WVxGgiIhQLatsH+3LCjXA6BVc=; b=iazLCUqzkmsj1QoYQTyS6T+kzu
	DWpu+LBJWsOREc10fgQhae4svgKCDxXC8wn3960Cv80CWnV6up/+GXP9ZkGEvtR9tnFkGYdY/P+Ao
	NSSl1nijAoT6BUH78yvE9ewn+s9oZHvVpF5sVh/UeJmc3k7amyezQA+JwqSIy0Q1BGjLaxbH1vcYs
	XdkaXbEdETm/5KUG2sspwZBUyTnSnjcGpopMAHwdtf7oFFElFonM6D4Xll7t+pe6KmbsbEbRe5rit
	6zAWA1YOgfni8ZptgY4Zjh09o+z1dZX5Nx+3DKB7q6yLERFLOumI5pPbkyl8zx2E0S5rPvYVcr3Kg
	KutSnPdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFYHY-00000000fss-2eGD;
	Thu, 15 May 2025 13:05:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFY8D-00000000e9B-0pWQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 12:56:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 76455614BC;
	Thu, 15 May 2025 12:56:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47426C4CEEB;
	Thu, 15 May 2025 12:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747313772;
	bh=XjaA4euigQSgEh5o8KfHZkKho3kN1DiJAA1xWUvIMWo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EM12WOIao1+ZILoI/QChBsE2hjpGrOwBOP9fd0v/f9IsoWMv+o9xrViP/7wSm/ch8
	 QkdBxpSwxwAFduwPN42UnsAWCQ9Ip7zqEAr9QtkIifmAwju7VsOBW7K5/cyC83O/i2
	 nedqpvu0TdLW/7S3ke7oVUnDCdaiSZ8+I+XkAqDFmrEN0QAbNSf4cFKsUuorF0wgQ+
	 dnPd1jw7r5vIS+1dTk2kZyrQSxl5QngYSwA8UEg0nFu6F8FiJFAMDQp0+o7AbaP9MH
	 HmHULpthiu+owl4gZdu6JfpFUHFGrmlrSDi8VSG/hkcwuz+vM3UBZCW5k4W+xzH7yL
	 ydOEAJutUySaQ==
Date: Thu, 15 May 2025 13:56:07 +0100
From: Will Deacon <will@kernel.org>
To: David Hildenbrand <david@redhat.com>
Cc: Dev Jain <dev.jain@arm.com>, catalin.marinas@arm.com,
	ryan.roberts@arm.com, anshuman.khandual@arm.com,
	mark.rutland@arm.com, yang@os.amperecomputing.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] arm64: Check pxd_leaf() instead of !pxd_table() while
 tearing down page tables
Message-ID: <20250515125606.GA11878@willie-the-truck>
References: <20250515063450.86629-1-dev.jain@arm.com>
 <332ecda7-14c4-4dc3-aeff-26801b74ca04@redhat.com>
 <4904d02f-6595-4230-a321-23327596e085@arm.com>
 <6fe7848c-485e-4639-b65c-200ed6abe119@redhat.com>
 <35ef7691-7eac-4efa-838d-c504c88c042b@arm.com>
 <c06930f0-f98c-4089-aa33-6789b95fd08f@redhat.com>
 <91fc96c3-4931-4f07-a0a9-507ac7b5ae6d@arm.com>
 <a005b0c3-861f-4e73-a747-91e0a15c85de@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a005b0c3-861f-4e73-a747-91e0a15c85de@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Thu, May 15, 2025 at 11:32:22AM +0200, David Hildenbrand wrote:
> On 15.05.25 11:27, Dev Jain wrote:
> > 
> > 
> > On 15/05/25 2:23 pm, David Hildenbrand wrote:
> > > On 15.05.25 10:47, Dev Jain wrote:
> > > > 
> > > > 
> > > > On 15/05/25 2:06 pm, David Hildenbrand wrote:
> > > > > On 15.05.25 10:22, Dev Jain wrote:
> > > > > > 
> > > > > > 
> > > > > > On 15/05/25 1:43 pm, David Hildenbrand wrote:
> > > > > > > On 15.05.25 08:34, Dev Jain wrote:
> > > > > > > > Commit 9c006972c3fe removes the pxd_present() checks because the
> > > > > > > > caller
> > > > > > > > checks pxd_present(). But, in case of vmap_try_huge_pud(), the caller
> > > > > > > > only
> > > > > > > > checks pud_present(); pud_free_pmd_page() recurses on each pmd
> > > > > > > > through
> > > > > > > > pmd_free_pte_page(), wherein the pmd may be none.
> > > > > > > The commit states: "The core code already has a check for pXd_none()",
> > > > > > > so I assume that assumption was not true in all cases?
> > > > > > > 
> > > > > > > Should that one problematic caller then check for pmd_none() instead?
> > > > > > 
> > > > > >     From what I could gather of Will's commit message, my
> > > > > > interpretation is
> > > > > > that the concerned callers are vmap_try_huge_pud and vmap_try_huge_pmd.
> > > > > > These individually check for pxd_present():
> > > > > > 
> > > > > > if (pmd_present(*pmd) && !pmd_free_pte_page(pmd, addr))
> > > > > >       return 0;
> > > > > > 
> > > > > > The problem is that vmap_try_huge_pud will also iterate on pte entries.
> > > > > > So if the pud is present, then pud_free_pmd_page -> pmd_free_pte_page
> > > > > > may encounter a none pmd and trigger a WARN.
> > > > > 
> > > > > Yeah, pud_free_pmd_page()->pmd_free_pte_page() looks shaky.
> > > > > 
> > > > > I assume we should either have an explicit pmd_none() check in
> > > > > pud_free_pmd_page() before calling pmd_free_pte_page(), or one in
> > > > > pmd_free_pte_page().
> > > > > 
> > > > > With your patch, we'd be calling pte_free_kernel() on a NULL pointer,
> > > > > which sounds wrong -- unless I am missing something important.
> > > > 
> > > > Ah thanks, you seem to be right. We will be extracting table from a none
> > > > pmd. Perhaps we should still bail out for !pxd_present() but without the
> > > > warning, which the fix commit used to do.
> > > 
> > > Right. We just make sure that all callers of pmd_free_pte_page() already
> > > check for it.
> > > 
> > > I'd just do something like:
> > > 
> > > diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> > > index 8fcf59ba39db7..e98dd7af147d5 100644
> > > --- a/arch/arm64/mm/mmu.c
> > > +++ b/arch/arm64/mm/mmu.c
> > > @@ -1274,10 +1274,8 @@ int pmd_free_pte_page(pmd_t *pmdp, unsigned long
> > > addr)
> > > 
> > >           pmd = READ_ONCE(*pmdp);
> > > 
> > > -       if (!pmd_table(pmd)) {
> > > -               VM_WARN_ON(1);
> > > -               return 1;
> > > -       }
> > > +       VM_WARN_ON(!pmd_present(pmd));
> > > +       VM_WARN_ON(!pmd_table(pmd));
> > 
> > And also return 1?
> 
> I'll leave that to Catalin + Will.
> 
> I'm not a friend for adding runtime-overhead for soemthing that should not
> happen and be caught early during testing -> VM_WARN_ON_ONCE().

I definitely think we should return early if the pmd isn't a table.
Otherwise, we could end up descending into God-knows-what!

Will

