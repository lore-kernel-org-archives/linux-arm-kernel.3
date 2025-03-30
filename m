Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E32C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Mar 2025 08:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9encVq/hWhozGLul6bese47ogF/3MJbX2d/5fRGcC9c=; b=f0r8bKP1aD+hTxjgvxsAhKznES
	ZGw9qT+3MrxQp3OQong1WLrHkCZmtehs1zRT1K10nxBMibe1lwllAQ+OuhWbaG9YaK4EFarm1rwsw
	C572LcUe0wXhZl70Gmhxitx6aCeWV1IM29boRrvffoT4yB6albAIDK3jzmuAe0zViIK+U/KNn3QtQ
	UTDh00tH42iGR5hyaiAnknm6StP7VyqFv9HDvqMwyYQP9SgyCj+aN2LPQjFkUO0cXz7YZjCWhqb1i
	kmGQSFFFlZ5+wxnsatmk7ZTj5iEYAhtUGqXTCTxG3qHA52iNyzIkuPpPoqzD7/CWNLc6bye5mjhMi
	lkZrE+yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyoBZ-0000000FxaA-3iRV;
	Sun, 30 Mar 2025 08:38:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyo9r-0000000FxUU-1cGg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Mar 2025 08:36:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7014B61127;
	Sun, 30 Mar 2025 08:36:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18A1FC4CEDD;
	Sun, 30 Mar 2025 08:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743323802;
	bh=kOFOJm39FkXH+rwD+36WlO5jTjLl36ZB3AYPctsbP88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B1H9fmPwgNZ8nM0tHdayf7Ir9hlQgGnpZPiRWgV94jiu7g8SP3pgHLHY5s2MlRYul
	 9pCKDTNJbGboAItH7ZuQFjJpvWyOfAjJFQMyK7Q+dDywXIPuuQpPGlmIyq0Jz/bRMi
	 HxjYlDNgLXzIC8oES4Hs60N78eVn31UrlDlV1/MmR3PHPZhowZZvCcTrBFQF2CHVlZ
	 fbMzHmERVLTUq8jiXHMuZwBLcj0TkUo6Ce/mGkgxaMd1VSI+Wq9yryJ5edJLQKO20C
	 AeiNKSwhMwJYx8NprmqCf/ti597kztA2EAtgtXv8JZtDAwKNywIXtJD1IqIkEfEE1Q
	 R4r1jzkSN5xPA==
Date: Sun, 30 Mar 2025 11:36:34 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Dev Jain <dev.jain@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, catalin.marinas@arm.com,
	will@kernel.org, gshan@redhat.com, steven.price@arm.com,
	suzuki.poulose@arm.com, tianyaxiong@kylinos.cn, ardb@kernel.org,
	david@redhat.com, urezki@gmail.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: pageattr: Explicitly bail out when changing
 permissions for vmalloc_huge mappings
Message-ID: <Z-kCkh1XWX8Rwjwz@kernel.org>
References: <20250328062103.79462-1-dev.jain@arm.com>
 <Z-cnmklGUojMzsUF@kernel.org>
 <deedf5e2-4a25-4c1f-a5d8-a661a2eb16d2@arm.com>
 <Z-jzouwNZwk8Ft-j@kernel.org>
 <b7be0b9c-89fa-470d-8f6d-7db6282b3c68@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7be0b9c-89fa-470d-8f6d-7db6282b3c68@arm.com>
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

On Sun, Mar 30, 2025 at 01:53:57PM +0530, Dev Jain wrote:
> 
> 
> On 30/03/25 1:02 pm, Mike Rapoport wrote:
> > On Sat, Mar 29, 2025 at 09:46:56AM +0000, Ryan Roberts wrote:
> > > On 28/03/2025 18:50, Mike Rapoport wrote:
> > > > On Fri, Mar 28, 2025 at 11:51:03AM +0530, Dev Jain wrote:
> > > > > arm64 uses apply_to_page_range to change permissions for kernel VA mappings,
> > > > 
> > > >                                                       for vmalloc mappings ^
> > > > 
> > > > arm64 does not allow changing permissions to any VA address right now.
> > > > 
> > > > > which does not support changing permissions for leaf mappings. This function
> > > > > will change permissions until it encounters a leaf mapping, and will bail
> > > > > out. To avoid this partial change, explicitly disallow changing permissions
> > > > > for VM_ALLOW_HUGE_VMAP mappings.
> > > > > 
> > > > > Signed-off-by: Dev Jain <dev.jain@arm.com>
> > > 
> > > I wonder if we want a Fixes: tag here? It's certainly a *latent* bug.
> > 
> > We have only a few places that use vmalloc_huge() or VM_ALLOW_HUGE_VMAP and
> > if there was a code that plays permission games on these allocations, x86
> > set_memory would blow up immediately, so I don't think Fixes: is needed
> > here.
> 
> But I think x86 can handle this (split_large_page() in __change_page_attr())
> ?

Yes, but it also updates corresponding direct map entries when vmalloc
permissions change and the direct map update presumes physical contiguity
of the range. 

> > > > > ---
> > > > >   arch/arm64/mm/pageattr.c | 4 ++--
> > > > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > > > 
> > > > > diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> > > > > index 39fd1f7ff02a..8337c88eec69 100644
> > > > > --- a/arch/arm64/mm/pageattr.c
> > > > > +++ b/arch/arm64/mm/pageattr.c
> > > > > @@ -96,7 +96,7 @@ static int change_memory_common(unsigned long addr, int numpages,
> > > > >   	 * we are operating on does not result in such splitting.
> > > > >   	 *
> > > > >   	 * Let's restrict ourselves to mappings created by vmalloc (or vmap).
> > > > > -	 * Those are guaranteed to consist entirely of page mappings, and
> > > > > +	 * Disallow VM_ALLOW_HUGE_VMAP vmalloc mappings so that
> > > > 
> > > > I'd keep mention of page mappings in the comment, e.g
> > > > 
> > > > 	* Disallow VM_ALLOW_HUGE_VMAP mappings to guarantee that only page
> > > > 	* mappings are updated and splitting is never needed.
> > > > 
> > > > With this and changelog updates Ryan asked for
> > > > 
> > > > Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > > > 
> > > > 
> > > > >   	 * splitting is never needed.
> > > > >   	 *
> > > > >   	 * So check whether the [addr, addr + size) interval is entirely
> > > > > @@ -105,7 +105,7 @@ static int change_memory_common(unsigned long addr, int numpages,
> > > > >   	area = find_vm_area((void *)addr);
> > > > >   	if (!area ||
> > > > >   	    end > (unsigned long)kasan_reset_tag(area->addr) + area->size ||
> > > > > -	    !(area->flags & VM_ALLOC))
> > > > > +	    ((area->flags & (VM_ALLOC | VM_ALLOW_HUGE_VMAP)) != VM_ALLOC))
> > > > >   		return -EINVAL;
> > > > >   	if (!numpages)
> > > > > -- 
> > > > > 2.30.2
> > > > > 
> > > > 
> > > 
> > 
> 

-- 
Sincerely yours,
Mike.

