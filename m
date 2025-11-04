Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FCDBCCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 12:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mZ9qcuzvV5gyjLDS3oC8cNuh8deaDHKiS2Q5ZgYVvec=; b=06IWY4pwy2c/dyE9Gp6jW0eBRs
	qt1EDAc3xhdywzSZ2yRoFq5h+pXz2C1CIu2/s8ZPjlBSGG9E9ubYBwpBJyjrY0ghyaY4YwBYa0Be9
	uw9v92B9B3m577APZc4u+cnLBXjXchr1wa/Eu/ere+gD7H1Eap+AYx5BsAnTHez7+Edp+uA5IJtz0
	r2eTGDJTJMgB9X42Bz2qv4vHEsB6SsbyChkjhpb4IHV/C4cdJc+JWCqdER9FHUWF7WmG+uyH+1sdI
	DOHrdWmN9l9Hj6Fn4QOjrtijw9NMAQ++vzyR8cLpann+7uP7PWRPnLn+mrzAz6Xu9eGMDgKWHFods
	5xT70JbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGGap-0000000Boqv-25iJ;
	Tue, 04 Nov 2025 12:56:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGGan-0000000Boqm-1uxC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 12:56:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AFAB6601EA;
	Tue,  4 Nov 2025 12:56:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E155C4CEF7;
	Tue,  4 Nov 2025 12:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762261016;
	bh=yAg+tERBdKRNZ0IdDqAnoxM1iraHSr76qEFW7dj6LJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Es8m/lqo2xcbXfmgYsqaTaqqFIhG5CbL7Oqmhluokzz/4BxSWfZEirw6fJWpiEhsE
	 N4UHDU0C1opIC9ZssXXZmoBYUNkUr9+K6ROAep/F8uN/ggAIO2K6m+oEU2aGikhqhl
	 AhGyS4W5ARQuJDyh4mDnkWUALqVXgy4dUBVk6HP+AupdeG1/VKltnHNL7fKQX2JW5C
	 rDPK1rWrh2uA6ZeohkTHDngog6mN0TimA+8D472DY64h8mzsOOBo7UkZOtDr+AqgEA
	 5E7ChlbG2xpJQqtSCTg3bKfhB0YRfQ5Ji2AKP+BjZsHFB4trPVsM8+lgkPRdE4tr01
	 GuorBXLEmJrzA==
Date: Tue, 4 Nov 2025 12:56:51 +0000
From: Will Deacon <will@kernel.org>
To: Dev Jain <dev.jain@arm.com>
Cc: Yang Shi <yang@os.amperecomputing.com>, catalin.marinas@arm.com,
	ryan.roberts@arm.com, rppt@kernel.org,
	shijie@os.amperecomputing.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] arm64/pageattr: Propagate return value from
 __change_memory_common
Message-ID: <aQn4EwKar66UZ7rz@willie-the-truck>
References: <20251103061306.82034-1-dev.jain@arm.com>
 <aQjHQt2rYL6av4qw@willie-the-truck>
 <f594696b-ba33-4c04-9cf5-e88767221ae0@os.amperecomputing.com>
 <f8b899cf-d377-4dc7-a57c-82826ea5e1ea@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f8b899cf-d377-4dc7-a57c-82826ea5e1ea@arm.com>
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

On Tue, Nov 04, 2025 at 09:06:12AM +0530, Dev Jain wrote:
> On 04/11/25 12:15 am, Yang Shi wrote:
> > On 11/3/25 7:16 AM, Will Deacon wrote:
> > > On Mon, Nov 03, 2025 at 11:43:06AM +0530, Dev Jain wrote:
> > > > Post a166563e7ec3 ("arm64: mm: support large block mapping when
> > > > rodata=full"),
> > > > __change_memory_common has a real chance of failing due to split
> > > > failure.
> > > > Before that commit, this line was introduced in c55191e96caa,
> > > > still having
> > > > a chance of failing if it needs to allocate pagetable memory in
> > > > apply_to_page_range, although that has never been observed to be true.
> > > > In general, we should always propagate the return value to the caller.
> > > > 
> > > > Cc: stable@vger.kernel.org
> > > > Fixes: c55191e96caa ("arm64: mm: apply r/o permissions of VM
> > > > areas to its linear alias as well")
> > > > Signed-off-by: Dev Jain <dev.jain@arm.com>
> > > > ---
> > > > Based on Linux 6.18-rc4.
> > > > 
> > > >   arch/arm64/mm/pageattr.c | 5 ++++-
> > > >   1 file changed, 4 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> > > > index 5135f2d66958..b4ea86cd3a71 100644
> > > > --- a/arch/arm64/mm/pageattr.c
> > > > +++ b/arch/arm64/mm/pageattr.c
> > > > @@ -148,6 +148,7 @@ static int change_memory_common(unsigned
> > > > long addr, int numpages,
> > > >       unsigned long size = PAGE_SIZE * numpages;
> > > >       unsigned long end = start + size;
> > > >       struct vm_struct *area;
> > > > +    int ret;
> > > >       int i;
> > > >         if (!PAGE_ALIGNED(addr)) {
> > > > @@ -185,8 +186,10 @@ static int change_memory_common(unsigned
> > > > long addr, int numpages,
> > > >       if (rodata_full && (pgprot_val(set_mask) == PTE_RDONLY ||
> > > >                   pgprot_val(clear_mask) == PTE_RDONLY)) {
> > > >           for (i = 0; i < area->nr_pages; i++) {
> > > > - __change_memory_common((u64)page_address(area->pages[i]),
> > > > +            ret =
> > > > __change_memory_common((u64)page_address(area->pages[i]),
> > > >                              PAGE_SIZE, set_mask, clear_mask);
> > > > +            if (ret)
> > > > +                return ret;
> > > Hmm, this means we can return failure half-way through the operation. Is
> > > that something callers are expecting to handle? If so, how can they tell
> > > how far we got?
> > 
> > IIUC the callers don't have to know whether it is half-way or not
> > because the callers will change the permission back (e.g. to RW) for the
> > whole range when freeing memory.
> 
> Yes, it is the caller's responsibility to set VM_FLUSH_RESET_PERMS flag.
> Upon vfree(), it will change the direct map permissions back to RW.

Ok, but vfree() ends up using update_range_prot() to do that and if we
need to worry about that failing (as per your commit message), then
we're in trouble because the calls to set_area_direct_map() are unchecked.

In other words, this patch is either not necessary or it is incomplete.

Will

