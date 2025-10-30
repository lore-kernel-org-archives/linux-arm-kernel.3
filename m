Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A33CCCF9FC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 13:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EV83WM6/jrqF5vDr8Ml3Shmm4SJDHQ5N0i6FQeqV0c8=; b=E1Hk1X3MQgdoWnrYOZH30T48YQ
	iYSIYM5Y5QlUSvCn0qSvotjignr2ELE0GNYYdLifEO2vbWrDW7A8vW/FDRx/iRJgF0LJXC3GgGzog
	qyN0ri4O2EAyCitzQjcZmtj/anYX7IPfVGsVmukmwHFguwT7ydjJnmZN4/jAkTYFWumSkYV26SOo0
	0GzN9RSBLPN7rM4qQMMIax2gtKNXFDKFitQl7jpzwMw8qaTcsOyUORkiaWg9pmudOMtSCSBxA35um
	vztwvcdkaNG/bDliFYonf0u0mE3WrpkZBv1v3pciEuwY0vOvAfm+afwHJrjV/YEryP3VpSXUbZGxf
	pcbynd1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vESWS-00000004Bhg-3BbU;
	Thu, 30 Oct 2025 13:17:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vESWR-00000004BhY-465D
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 13:17:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 076B4603F5;
	Thu, 30 Oct 2025 13:16:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3475FC4CEF1;
	Thu, 30 Oct 2025 13:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761830218;
	bh=p1oi9eqzR7XLk7EvgwixRFUvSNC+OJwVHhPFU4hofwE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h4Ddn9+Q6AGK4KmNZwJ9aj81oxsP7hNNhC8a1UPNcHaLH3tl3AYaG3cntuDB68B0a
	 hXhqX+9JB96h9/dJ36IFsv8YkblVSlmro2LVPBSqCT2dMi47gx3sjCwO2UiQ+fj6i9
	 XO4iecQ8IRf4p5CepuShE1LCi3G6pgC3QzdgH9jeDLiGr7LhtBtrTYzhSA0DaCeWOo
	 8YImVqW/ahkjVEqDr5ngaVRXljvOgDR9mQ+MY4/tZ37vQcf+UUinVhUGxGeMC5qmCS
	 SOSXPy1bVbr145CJ+8SXRy9dKn9BMReyPiuRDsTbd4AmsedIJxYZ5+aw5zNPL4ts5F
	 blkM0FjlZeOBA==
Date: Thu, 30 Oct 2025 13:16:53 +0000
From: Will Deacon <will@kernel.org>
To: Dev Jain <dev.jain@arm.com>
Cc: Yang Shi <yang@os.amperecomputing.com>, ryan.roberts@arm.com,
	cl@gentwo.org, catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: mm: relax VM_ALLOW_HUGE_VMAP if BBML2_NOABORT
 is supported
Message-ID: <aQNlRQO7oXUcR84A@willie-the-truck>
References: <20251013232803.3065100-1-yang@os.amperecomputing.com>
 <20251013232803.3065100-3-yang@os.amperecomputing.com>
 <eaa67b0d-e256-4db6-82e7-c4d56df70c09@arm.com>
 <05331884-9723-48ff-a3ce-c2ea023bbabd@os.amperecomputing.com>
 <ceae80d4-ae63-4bf7-bf97-1d6b5b090aad@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ceae80d4-ae63-4bf7-bf97-1d6b5b090aad@arm.com>
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

On Fri, Oct 17, 2025 at 09:20:10PM +0530, Dev Jain wrote:
> On 17/10/25 12:20 am, Yang Shi wrote:
> > On 10/14/25 11:50 PM, Dev Jain wrote:
> > > On 14/10/25 4:57 am, Yang Shi wrote:
> > > > When changing permissions for vmalloc area, VM_ALLOW_HUGE_VMAP area is
> > > > exclueded because kernel can't split the va mapping if it is called on
> > > > partial range.
> > > > It is no longer true if the machines support BBML2_NOABORT after commit
> > > > a166563e7ec3 ("arm64: mm: support large block mapping when
> > > > rodata=full").
> > > > So we can relax this restriction and update the comments accordingly.
> > > > 
> > > > Fixes: a166563e7ec3 ("arm64: mm: support large block mapping
> > > > when rodata=full")
> > > > Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
> > > > ---
> > > >   arch/arm64/mm/pageattr.c | 13 +++++++------
> > > >   1 file changed, 7 insertions(+), 6 deletions(-)
> > > > 
> > > > diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> > > > index c21a2c319028..b4dcae6273a8 100644
> > > > --- a/arch/arm64/mm/pageattr.c
> > > > +++ b/arch/arm64/mm/pageattr.c
> > > > @@ -157,13 +157,13 @@ static int change_memory_common(unsigned
> > > > long addr, int numpages,
> > > >         /*
> > > >        * Kernel VA mappings are always live, and splitting live section
> > > > -     * mappings into page mappings may cause TLB conflicts. This means
> > > > -     * we have to ensure that changing the permission bits of
> > > > the range
> > > > -     * we are operating on does not result in such splitting.
> > > > +     * mappings into page mappings may cause TLB conflicts on
> > > > the machines
> > > > +     * which don't support BBML2_NOABORT.
> > > >        *
> > > >        * Let's restrict ourselves to mappings created by vmalloc
> > > > (or vmap).
> > > > -     * Disallow VM_ALLOW_HUGE_VMAP mappings to guarantee that
> > > > only page
> > > > -     * mappings are updated and splitting is never needed.
> > > > +     * Disallow VM_ALLOW_HUGE_VMAP mappings if the systems
> > > > don't support
> > > > +     * BBML2_NOABORT to guarantee that only page mappings are
> > > > updated and
> > > > +     * splitting is never needed on those machines.
> > > >        *
> > > >        * So check whether the [addr, addr + size) interval is entirely
> > > >        * covered by precisely one VM area that has the VM_ALLOC
> > > > flag set.
> > > > @@ -171,7 +171,8 @@ static int change_memory_common(unsigned
> > > > long addr, int numpages,
> > > >       area = find_vm_area((void *)addr);
> > > >       if (!area ||
> > > >           end > (unsigned long)kasan_reset_tag(area->addr) +
> > > > area->size ||
> > > > -        ((area->flags & (VM_ALLOC | VM_ALLOW_HUGE_VMAP)) != VM_ALLOC))
> > > > +        !(area->flags & VM_ALLOC) || ((area->flags &
> > > > VM_ALLOW_HUGE_VMAP) &&
> > > > +        !system_supports_bbml2_noabort()))
> > > >           return -EINVAL;
> > > >         if (!numpages)
> > > 
> > > This will conflict with my upcoming vmalloc-huge series, so best to
> > > leave it to me,
> > > I already have this included :)
> > 
> > My point is that I hope this can be merged as a hotfix for 6.18. I have
> > no strong opinion on either the maintainers take this one or from your
> > series. But if this will go into 6.18 as a hotfix, it should be also a
> > prerequisite patch (standalone)  in your series, and the rest of your
> > series should be based on top of it. Of course this argument will not
> > stand if we don't care to have it fixed for 6.18.
> 
> I see what you mean, but I don't think this patch should be treated as a
> hotfix. We forgot to relax a
> 
> restriction - that's fine. That is not an incorrectness in the linear map
> series. A fix usually
> 
> fixes an incorrectness.

Right, unless there's a real functional issue that is affecting people
then I don't see the need to take any of this for 6.18.

Will

