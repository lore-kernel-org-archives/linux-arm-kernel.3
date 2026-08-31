Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA32C61DE2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 11:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZplZYncnRKFZipftv7wfZbHiyWAoIb0g/sXD3GATNRI=; b=u5qHRXMH+Z6EGD4zeaNtiad1Va
	JuB+MmHEDZhsMW61ixKf2o8pTxfqUI533V0Jq+Eh/5Md65Q8G4rA0IGSgzbS73z7MgAGAOReF2uow
	t0uPzKAMZwi+9NsVtuBtDSkN+2yd8qyYHhnmxt+2d68s/xWcYKK7o9JsCbIFbQdUwGHtDXbOGnBbu
	mbfZvQC3E9o4H7Qvlrq6lw+e9znmDojfHWweTpPQU6tIcZGjLt7Lx38EtjtvAmHIzG85YiEBd8YZm
	svqh68ThJI/4j6BeXedo/wb0p9J/RV0nGAlc+7OGWQtGoz4VblS6NrDlSZL196estlBcOOInzkggt
	+ZyYnV9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x10Uf-00000009F60-1XcQ;
	Mon, 31 Aug 2026 11:48:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x10Ud-00000009F5l-0u6o
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 11:48:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2474260232;
	Mon, 31 Aug 2026 11:48:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 523D91F000E9;
	Mon, 31 Aug 2026 11:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788176881;
	bh=ZplZYncnRKFZipftv7wfZbHiyWAoIb0g/sXD3GATNRI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UHxa2HoVnTkRM9dXAL4NlPRAfXc44P7fjNSKtyf2HRLbEz4v2On+DWypCl44RJlC3
	 Cx6JCPXv9NPqa/RXFI3Q5+46AACLKpTG2gkyIKi7bQiAQweXLk6GwCcCrmRI8+3xz+
	 1qqouYAqKauRD1DvD9+IBwTri70T0Xabk6xHAe/E=
Date: Mon, 31 Aug 2026 13:47:57 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, stable@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6.6.y] arm64: mm: clear extra idmap level before use
Message-ID: <2026083151-mascot-unshaken-5f46@gregkh>
References: <20260831054247.33352-1-kmehltretter@gmail.com>
 <2026083125-upbeat-series-9565@gregkh>
 <7f744f2a-409b-454f-bdb9-fccb5031640d@app.fastmail.com>
 <apVbNN_gtowKWVhR@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apVbNN_gtowKWVhR@gmail.com>
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

On Mon, Aug 31, 2026 at 01:00:34PM +0200, Karl Mehltretter wrote:
> On Mon, Aug 31, 2026 at 08:15:52AM +0100, Ard Biesheuvel wrote:
> > 
> > 
> > On Mon, 31 Aug 2026, at 07:54, Greg Kroah-Hartman wrote:
> > > On Mon, Aug 31, 2026 at 07:42:47AM +0200, Karl Mehltretter wrote:
> > >> The 6.6.y adaptation of commit 0e9df1c905d8 ("arm64: mm: Don't remap
> > >> pgtables for allocate vs populate") removes the clearing performed by
> > >> early_pgtable_alloc().  Its replacement clears allocations made by the
> > >> generic page-table walkers, but 6.6's create_idmap() still allocates an
> > >> extra root level directly when a sub-48-bit VA kernel is loaded
> > >> sufficiently high in physical memory.
> > >> 
> > >> memblock_phys_alloc_range() does not zero the returned memory.  The direct
> > >> caller therefore publishes an uncleared root page and passes it to
> > >> __create_pgd_mapping().  A stale nonzero entry can trip the bad-descriptor
> > >> BUG_ON or be followed as a page-table descriptor, preventing the kernel
> > >> from booting.
> > >> 
> > >> Clear the direct allocation through its linear alias before publishing it.
> > >> init_clear_pgtable() also supplies the barrier required before the table
> > >> descriptor becomes visible.
> > >> 
> > >> Mainline is not affected because commit e6128a8e523c ("arm64: mm: Use
> > >> 48-bit virtual addressing for the permanent ID map") removed the dynamic
> > >> extra level before page-table initialization moved out of the allocator.
> > >
> > > Why can't we take that change instead?
> > >
> > 
> > Nope. That relies on a massive refactoring of the arm64 startup code.
> > 
> > Can we just revert 0e9df1c905d8 (aka 54322d95309d) instead?
> > 
> 
> Yes, that fixes the issue too.
> 
> The commit was patch 3/3 of the following speedup series:
> 
> https://lore.kernel.org/r/20240412131908.433043-1-ryan.roberts@arm.com
> 
> Patches 1 and 2 accounted for most of the speedup.
> 
> I'll wait a bit to give the others a chance to comment.
> 
> I can send the revert as v2, or my original patch as v2 with the
> missing "Assisted-by: LLM" and "Signed-off-by:" trailers.

REvert would be great, thanks!

greg k-h

