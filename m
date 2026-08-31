Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 217C6C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 05:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=USN4d79UJ49yqpib476gxNiB1WI2UqXv3xsLWvCnIjw=; b=vvHoLbXjUq1CURKU/vZHYd9Xjm
	0efW8uOtTXee4ph6gLhXKsuWlCJeuvR4+nZF0Z2i0e8u9eVYsdrcxVOZ9K4WsMZ2Sc8uKHF2xIzHH
	mOC6M+uJ25E26s/agYPcRNZPhEUXumNo3onuvvvxj91fnf67mZVuw07YPLjN5wgQ0cKPH/tM0MwQC
	/8inNpFTLdHU+Q05LajeCo27kaSAwF2z5jkYucQTPxAx6CoZK9kMQ2NeY7YVPqSAQGSRbYoh3dPYk
	kr2FO1dPV9zoqxvGbQvjUjtNdVlDrh1I7LtkRfVWvpmI2Uhvya6WJoBf/uV/e5hqQr1KDn4xsYbRa
	DVjW81kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0v0Z-00000008a2I-3huB;
	Mon, 31 Aug 2026 05:56:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0v0Y-00000008a29-2XGB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 05:56:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 70D7F601DB;
	Mon, 31 Aug 2026 05:56:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C1A71F000E9;
	Mon, 31 Aug 2026 05:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788155797;
	bh=USN4d79UJ49yqpib476gxNiB1WI2UqXv3xsLWvCnIjw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NEvzNMbTQZQ5Z9PWIZ/1dcKiKGFUWwSwk71T1wKJoGGDj+fy3Hk8LCrIITmovC2Lp
	 yQXubfXW37fNJsD4U2mL46KIc09MBNvfgaifm3uxHopJMVVZRCyF8opS/ZiwY4184p
	 ZxLZPuWaw7rZEQa1Q04D/b3aQ3GgjPduTrwbaKFU=
Date: Mon, 31 Aug 2026 07:54:54 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: stable@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6.6.y] arm64: mm: clear extra idmap level before use
Message-ID: <2026083125-upbeat-series-9565@gregkh>
References: <20260831054247.33352-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831054247.33352-1-kmehltretter@gmail.com>
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

On Mon, Aug 31, 2026 at 07:42:47AM +0200, Karl Mehltretter wrote:
> The 6.6.y adaptation of commit 0e9df1c905d8 ("arm64: mm: Don't remap
> pgtables for allocate vs populate") removes the clearing performed by
> early_pgtable_alloc().  Its replacement clears allocations made by the
> generic page-table walkers, but 6.6's create_idmap() still allocates an
> extra root level directly when a sub-48-bit VA kernel is loaded
> sufficiently high in physical memory.
> 
> memblock_phys_alloc_range() does not zero the returned memory.  The direct
> caller therefore publishes an uncleared root page and passes it to
> __create_pgd_mapping().  A stale nonzero entry can trip the bad-descriptor
> BUG_ON or be followed as a page-table descriptor, preventing the kernel
> from booting.
> 
> Clear the direct allocation through its linear alias before publishing it.
> init_clear_pgtable() also supplies the barrier required before the table
> descriptor becomes visible.
> 
> Mainline is not affected because commit e6128a8e523c ("arm64: mm: Use
> 48-bit virtual addressing for the permanent ID map") removed the dynamic
> extra level before page-table initialization moved out of the allocator.

Why can't we take that change instead?

> 
> Fixes: 54322d95309d ("arm64: mm: Don't remap pgtables for allocate vs populate")

No signed-off-by?

thanks,

greg k-h

