Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D97CDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 16:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mbyuAlSoRh47aaPkX7JF2oGMTEIdF1Zcr15uiIt8usA=; b=GJdIzqPSh9tUk5L/eztG49mmze
	PS6nQG8hQh7JIZeVFXljHSIs1UEvO+RuljROg/sbou4kznsA3dSGAnwPc8oZ+ChBuoNEmzUAIIuz9
	0054XKtvg6/9/LzpzdWUG4hWZUcDwWHYsDUvQVRCg1tUpvAqUte6yI088Unm460J38OCuelkHhhmO
	xKufhbhXhoaRsnGreJWJ9LCTDDyCZ6Bnds9rP2O/CptizGAbciawJMzVzy0NOiADSnBv+29oSoyb1
	LmW8x2KLgcEnxIAup/FeewbNO7cLuI6YZwIRpMrg7CeuwsHKT1Ma8TlcFbHOMb868g5fDrRfRoq6x
	lYPHVf9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcQUR-000000086Kb-0hg7;
	Wed, 24 Jun 2026 16:30:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcQUP-000000086KC-0pIF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 16:30:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7CB3260123;
	Wed, 24 Jun 2026 16:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 939161F00AC4;
	Wed, 24 Jun 2026 16:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782318612;
	bh=mbyuAlSoRh47aaPkX7JF2oGMTEIdF1Zcr15uiIt8usA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=od2yYyf/sl8pz4IJPQDnQOrhYkXrpXNEKFtjPgBBO8QmuXmuUJUW1LX14FDxlYUHS
	 Kw2kXlsRYdoRkjieZwt375+G5/EYfc5MLvG0MXBfetqiJGWAU7reZ5yiJUSXhZyrRO
	 V9QwT7TTke2/Ucc705VGL2T6GpiWzVWpsj62SWyo=
Date: Wed, 24 Jun 2026 17:29:00 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>, Ben Hutchings <ben@decadent.org.uk>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	patches@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Sasha Levin <sashal@kernel.org>,
	stable <stable@vger.kernel.org>, mark.rutland@arm.com
Subject: Re: [PATCH 6.1 337/522] arm64/mm: Enable batched TLB flush in
 unmap_hotplug_range()
Message-ID: <2026062451-bluff-coherent-672d@gregkh>
References: <20260616145125.307082728@linuxfoundation.org>
 <20260616145141.584613180@linuxfoundation.org>
 <b0d5836032ce3135bfc473f6bff791306d086925.camel@decadent.org.uk>
 <ajqXWqiAol6Shdd6@willie-the-truck>
 <d2a633c8-496e-48e1-bfa0-a0fc75bd0a08@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2a633c8-496e-48e1-bfa0-a0fc75bd0a08@arm.com>
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

On Wed, Jun 24, 2026 at 04:05:01PM +0100, Ryan Roberts wrote:
> On 23/06/2026 15:25, Will Deacon wrote:
> > On Sun, Jun 21, 2026 at 05:02:27PM +0200, Ben Hutchings wrote:
> >> On Tue, 2026-06-16 at 20:28 +0530, Greg Kroah-Hartman wrote:
> >>> 6.1-stable review patch.  If anyone has any objections, please let me know.
> >>>
> >>> ------------------
> >>>
> >>> From: Anshuman Khandual <anshuman.khandual@arm.com>
> >>>
> >>> [ Upstream commit 48478b9f791376b4b89018d7afdfd06865498f65 ]
> >> [...]
> >>> @@ -949,15 +953,14 @@ static void unmap_hotplug_pmd_range(pud_
> >>>  		WARN_ON(!pmd_present(pmd));
> >>>  		if (pmd_sect(pmd)) {
> >>>  			pmd_clear(pmdp);
> >>> -
> >>> -			/*
> >>> -			 * One TLBI should be sufficient here as the PMD_SIZE
> >>> -			 * range is mapped with a single block entry.
> >>> -			 */
> >>> -			flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> >>> -			if (free_mapped)
> >>> +			if (free_mapped) {
> >>> +				/* CONT blocks are not supported in the vmemmap */
> >>> +				WARN_ON(pmd_cont(pmd));
> >>> +				flush_tlb_kernel_range(addr, addr + PMD_SIZE);
> >>
> >> It wasn't clear to me from the commit message why this now adds PMD_SIZE
> >> rather than PAGE_SIZE.  It seems like this change is fine for Linux
> >> 6.13+ with a CPU that supports TLB range flushing, but otherwise results
> >> in unnecessarily executing multiple TLB invalidations at intervals of
> >> the base page size.
> > 
> > Hmm, the commit message also makes very little sense to me and so I don't
> > understand why this patch has us doing multiple TLB invalidations when
> > we run into a !cont, block mapping at the PMD level. The old comment
> > (which this patch removes) should still apply afaict.
> > 
> > Anshuman, Ryan, any ideas what's going on here?
> 
> I think this change was probably my fault; Given the API is called
> flush_tlb_kernel_range() it seemed like an abuse/hack to pretend we are only
> flushing the first PAGE_SIZE of the range. But as I understand it, even if the
> HW shatters a block mapping into multiple TLB entries, all of the entries
> relating to the block mapping will be invalidated if just one of them intersects
> the TLBI range/address. So it should be safe to reapply this hack.
> 
> Although ideally I think it would be better if this API took a stride argument;
> then intent is clear.
> 
> What's the best way to handle this? Submit a patch for mainline that reverts
> this part, then get it backported to stable (implying this current patch will
> have been applied to stable)?

yes, that's probably the best way.

thanks,

greg k-h

