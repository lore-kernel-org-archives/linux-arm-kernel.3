Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B5EC36017
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 10:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2jDJ/qOSkVLpyxjdNlHyfwyDjsQbJOs58lUquUo8cbM=; b=rRNYXU7Z5JxAzENZZE9yCUjuUO
	9cf6GTOxXCSrSr8rWphKRfm6ZVFo0IwgvFPg3s2c1M8xlJMy1h9OPxtsVatmWJrdzeGYxNIcrK7ad
	AgIHzjkqcN5LTOcEOnRfwM4mrAoF61caJCeM3QBzY/gyeuksnttAzHXMjt/c0nW4Hspaue5FVbd6P
	sxH93PvopJzQDvW8rdesozxcOsEKlEAag5SGj0Dc5OgrkYLPuAcG3gt84A8AAZRYuOKJui7m95Dmh
	i4RfzJBD8SW9WNbfSGsit3HBBvnmLTWxL9z5c/dR1djwOKLEF/ivooXB4eZ17/B6Vjuw4udImMF4u
	zev1Q5BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzYxy-00000002dyc-0xC9;
	Tue, 01 Apr 2025 10:35:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzYbi-00000002apd-2elJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 10:12:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1825B61138;
	Tue,  1 Apr 2025 10:12:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EFCFC4CEE4;
	Tue,  1 Apr 2025 10:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743502353;
	bh=xAL++FE93adr27VON8GPMhrsRR7Iv7WswJqOqriBV4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uq2D60Pquq75DNTPmBUzl9Z6jk0WPoeHehqBemxUhzoWGEi06gLXQ9bhsONLjzpqB
	 inffZewEWMlf4GFNfJiGoGjxhdHXW11fKYUI8ZvN9ZDsATUM3CYcef7qWX8KsFnqfL
	 2mF/hs0YkqJ1Lzvddbt6MtnUg4Hnsf3HIu89tnmYCS/q7jFmgFNGGMOM0PtpCmXX1v
	 RWlfIHRPGUyYlRlJsiJSEYSTTEsGRt6nn1OI7TEIJ9fP2y5815f0naaUTAUoBGMfqv
	 hpoWTYQwQ7WTfB6BFAE8FSJtBiQ+lmFiHIwpGLHM3nX1yJVgC1kPcFGQitiizyI7y4
	 RsLJuufRUFzTA==
Date: Tue, 1 Apr 2025 13:12:25 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Dev Jain <dev.jain@arm.com>, catalin.marinas@arm.com, will@kernel.org,
	gshan@redhat.com, steven.price@arm.com, suzuki.poulose@arm.com,
	tianyaxiong@kylinos.cn, ardb@kernel.org, david@redhat.com,
	urezki@gmail.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: pageattr: Explicitly bail out when changing
 permissions for vmalloc_huge mappings
Message-ID: <Z-u8Cc7i_l0xM5TT@kernel.org>
References: <20250328062103.79462-1-dev.jain@arm.com>
 <Z-cnmklGUojMzsUF@kernel.org>
 <deedf5e2-4a25-4c1f-a5d8-a661a2eb16d2@arm.com>
 <Z-jzouwNZwk8Ft-j@kernel.org>
 <0aac96b5-b3ac-47ee-97af-7ca5d927bdd0@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0aac96b5-b3ac-47ee-97af-7ca5d927bdd0@arm.com>
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

Hi Ryan,

On Tue, Apr 01, 2025 at 10:43:01AM +0100, Ryan Roberts wrote:
> On 30/03/2025 03:32, Mike Rapoport wrote:
> > On Sat, Mar 29, 2025 at 09:46:56AM +0000, Ryan Roberts wrote:
> >> On 28/03/2025 18:50, Mike Rapoport wrote:
> >>> On Fri, Mar 28, 2025 at 11:51:03AM +0530, Dev Jain wrote:
> >>>> arm64 uses apply_to_page_range to change permissions for kernel VA mappings,
> >>>
> >>>                                                      for vmalloc mappings ^
> >>>
> >>> arm64 does not allow changing permissions to any VA address right now.
> >>>
> >>>> which does not support changing permissions for leaf mappings. This function
> >>>> will change permissions until it encounters a leaf mapping, and will bail
> >>>> out. To avoid this partial change, explicitly disallow changing permissions
> >>>> for VM_ALLOW_HUGE_VMAP mappings.
> >>>>
> >>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
> >>
> >> I wonder if we want a Fixes: tag here? It's certainly a *latent* bug.
> > 
> > We have only a few places that use vmalloc_huge() or VM_ALLOW_HUGE_VMAP and
> > if there was a code that plays permission games on these allocations, x86
> > set_memory would blow up immediately, so I don't think Fixes: is needed
> > here.
> 
> Hi Mike,
> 
> I think I may have misunderstood your comments when we spoke at LSF/MM the other
> day, as this statement seems to contradict. I thought you said that on x86 BPF
> allocates memory using vmalloc_huge()/VM_ALLOW_HUGE_VMAP and then it's
> sub-allocator will set_memory_*() on a sub-region of that allocation? (And we
> then agreed that it would be good for arm64 to eventually support this with BBML2).

I misremembered :)
They do allocate several PMD_SIZE chunks at once, but they don't use
vmalloc_huge(), so everything there is mapped with base pages.

And now they are using execmem rather than vmalloc directly, and execmem
doesn't use VM_ALLOW_HUGE_VMAP anywhere except modules on x86.
 
> Anyway, regardless, I think this change is useful first step to improving
> vmalloc as it makes us more defensive against any future attempt to change
> permissions on a huge allocation. In the long term I'd like to get to the point
> where arm64 (with BBML2) can map with VM_ALLOW_HUGE_VMAP by default.
> 
> Thanks,
> Ryan

-- 
Sincerely yours,
Mike.

