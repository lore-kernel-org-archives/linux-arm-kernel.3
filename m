Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39862CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 08:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xuoEzlKQ+jbZWqfDSTbKAzWgKBkKNvhhYOyvNjByjFw=; b=r9b1YZkPW2t+yFOcQ/lPrdi8aW
	jl3uzTZTojPQ0s6FbU4m5ucOYvWDgYQgy053SB57tu7wCx081RKQocy2zydK3PF3bCNERdj6Y7HoT
	FDGigXEUy/pOT+G23Mg7twivsShDP14KOa7oHx/YcqBNSPc/WR31FP7U3IljfFWsqTftgqpe9MeMc
	kRh724s6vLeWg8MEhY3FZ+KYww/rONt4uOFQ8d09XzigVmRWjsKOeOBARe99hqzV9Dk+CFO3j+4vm
	s371HlBQskQ3OTpZmCsWZ8nYGvSGNGJVLdjiqTjPdXenewQL8qYjRZALEDKj1k0asYkcJVVh72uyL
	RbPV3PQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIN1s-000000052ZL-2o6C;
	Thu, 30 Apr 2026 08:45:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIN1s-000000052ZC-08Rt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 08:45:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3532B60583;
	Thu, 30 Apr 2026 08:45:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ABDBC2BCB3;
	Thu, 30 Apr 2026 08:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777538750;
	bh=+MBhZkziafGe9boIFxf7Lv1bigAUU/KzlTMIHJ2Vi3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vFDt5+4ORGzFWPnYEcamCPOAZJQoO/abaBIsk6lC6+NMTXdB2QMEX9ypUPp7QmWJs
	 rNI2Ys0BxlLYbFkYEqs9b1ohRRPwwq2I11hLwqPf0utvNtgT2myhvd7Bez+uIHB253
	 BwLURQ6V71f5oT4bq22zqYjcP1b3EwS+SgGaFoJbQCrJgTcS9xkFaR8NoVfo92NLv1
	 o7IJmrXvhcPwqszl2lX1aKwZ3TUH8lurZy/ALEg6rJoErpIyq5jG9Fht0xH//QFXV8
	 G+WKqJ/LSqVptJu56t1X1TEvFk8jgGrE4iQhFv1op00lqDs2BgqtVrQ/qlb5MWUQQG
	 zho0BCGT4MaaA==
Date: Thu, 30 Apr 2026 10:45:43 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Kameron Carr <kameroncarr@linux.microsoft.com>, will@kernel.org,
	suzuki.poulose@arm.com, steven.price@arm.com, ryan.roberts@arm.com,
	dev.jain@arm.com, yang@os.amperecomputing.com,
	shijie@os.amperecomputing.com, kevin.brodsky@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] arm64: mm: support set_memory_encrypted/decrypted
 for vmalloc addresses
Message-ID: <afMWt5Saisw6NX-t@kernel.org>
References: <20260406213317.216171-1-kameroncarr@linux.microsoft.com>
 <adjZpFIgXQYOvyTq@arm.com>
 <001301dcc932$21cb6d80$65624880$@linux.microsoft.com>
 <ad5vTmfDWSAVrLab@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad5vTmfDWSAVrLab@arm.com>
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

Hi Catalin,

On Tue, Apr 14, 2026 at 05:46:06PM +0100, Catalin Marinas wrote:
> On Fri, Apr 10, 2026 at 02:36:42PM -0700, Kameron Carr wrote:
> > On Friday, April 10, 2026 4:06 AM, Catalin Marinas wrote:
> > > Could you give more details about the user of set_memory_decrypted() on
> > > vmalloc()'ed addresses? I think this came up in the past and I wondered
> > > whether something like GFP_DECRYPTED would be simpler to implement (even
> > > posted a hack but without vmalloc() support). If it is known upfront
> > > that the memory will be decrypted, it's easier/cheaper to do this on the
> > > page allocation time to change the linear map and just use
> > > pgprot_decrypted() for vmap(). No need to rewrite the page table after
> > > mapping the pages.
> [...]
> > In this use case, whether to decrypt the memory can always be known at
> > time of allocation, so a solution like GFP_DECRYPTED is an option.
> > 
> > I think I found the hack you mentioned
> > (https://lore.kernel.org/linux-arm-kernel/ZmNJdSxSz-sYpVgI@arm.com/). The
> > feedback in Michael Kelley's reply covers the key considerations well.
> 
> Yes, that's the thread. It started originally as a GICv3 need
> (eventually we went for genpool).
> 
> > He likely had netvsc's use of vmalloc in mind when he made the point
> > "GFP_DECRYPTED should work for the three memory allocation interfaces and
> > their variants: alloc_pages(), kmalloc(), and vmalloc()." His other
> > points already cover the concerns I had in mind around handling errors
> > from set_memory_decrypted()/encrypted(), etc.
> > 
> > What is the current status of your proposed GFP_DECRYPTED implementation?
> > Is this something you are actively working on?
> 
> Not really. But I've been looking at it again and I think it adds more
> problems than it solves. A GFP flag would be passed down to
> kmem_cache_alloc() and confuse the slab management if some pages are
> encrypted, others not for the same kmem_cache (SLAB_NO_MERGE wouldn't
> help). I wonder whether something like SLAB_DECRYPTED would work better
> for this if we really need it (not aware of any user though).
> 
> Anyway, let's ignore slab for now and look at vmalloc(). I can see
> hv_ringbuffer_init() using an explicit vmap(pgprot_decrypted()). While
> you could do this, it might be better to just add a VM_DECRYPTED flag
> and a few wrappers like vmalloc_decrypted(). It would call
> set_memory_decrypted() for the allocated pages and use
> pgprot_decrypted() for vmap. On vfree(), it will have to set the pages
> back to encrypted. It should be fairly mechanical to do (or a 5 min job
> for an LLM ;)).
 
A GFP + SLAB flag is semantically better than only implementing decrypted
allocations only in vmalloc, but it's surely way more complex and intrusive
and we are running low on gfp flags on 32 bits :)

But I think we can push the _decrypted to kvmalloc() that would do either
kmalloc() + set_memory_decrypted() or vmalloc_decrypted() and it seems that
x86 and drivers could use that instead of alloc_pages() +
set_memory_decrypted().

We also would want also to make x86::set_memory_decrypted() to only accept
linear^w direct map addresses to ensure consistency between architectures.

> -- 
> Catalin
> 

-- 
Sincerely yours,
Mike.

