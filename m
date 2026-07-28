Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C33C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 11:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WlmiKyS45RjP6Jk0Unm1wk0Df9MNbq2BvK85BROaIyw=; b=rhjYA5fT+qFqZzjvJveYIYKArR
	37qOGIjg1wnvKsauIDd0YS0j55J4ia4QraI7ZFefjqDN69Cft8MVT2KZ1kqWfOAVV2m9NEPx0nYgl
	YJKXogJSF0EkIRVU8AT5emZ99gufrjCR5AdRQP2gTQkbPkI5riUO4YR9ZnmrAbh2F1AEkgJWgvtIO
	dnWRXHnJbUUR+EzOzi7z6Z50GrTglBI7dzmfPAf9KWWgBwV9pjOY7XxGnEqBZ9gu9JTk4J+B7Olr5
	3AWNUrfvNKmcpcBqrETw2qEnKofoKxx5LccYZOKb7vcUxUmCN8JWLDkNVoVdcBtJOS/JFs3QqgDcA
	OgZ5OIPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wog7f-000000055yb-2yDJ;
	Tue, 28 Jul 2026 11:37:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wog7c-000000055xY-23jP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 11:37:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 28CFD43237;
	Tue, 28 Jul 2026 11:37:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C1341F000E9;
	Tue, 28 Jul 2026 11:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785238640;
	bh=WlmiKyS45RjP6Jk0Unm1wk0Df9MNbq2BvK85BROaIyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FFLzm+BzjamxA0umMXZlmuy+NQsVtww3sldK4LN7vydtjSnFD4E4o5dIIOBj8e1bY
	 YoWvUEqv5NQCMaScNjoZNdpiwgZbVVgx4pXSdq/Qae0T3nP26jYLOsVLc3CRBOGq2Q
	 UEbjPr0XBd7Mo0PFQlpXYuoPSR/MBtdsUSFthkR2BUVpeg3MxOkFhhrfLqiIk7YyGR
	 DZjqZe5f0NnUHyIGlL+RSFcek4krfJTe0f+qSrerxp+amAabhndHKYFvGheBgcfX/5
	 ZksOWw4iudVYkxxkpxe67+7BOwE0wOlTW4aV6Cbti2QFth58S22+sFOP/yt5ndjKob
	 Dg9rjkEudxLpQ==
Date: Tue, 28 Jul 2026 12:37:03 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: Yang Shi <yang@os.amperecomputing.com>, catalin.marinas@arm.com, 
	ryan.roberts@arm.com, cl@gentwo.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [v8 PATCH] arm64: mm: show direct mapping use in /proc/meminfo
Message-ID: <amh96rPdlc7UEobt@lucifer>
References: <20260609214205.1260279-1-yang@os.amperecomputing.com>
 <255744ec-2a58-492c-a69a-850357440183@os.amperecomputing.com>
 <amCqBzwIYDOvRI1S@willie-the-truck>
 <79d7069b-2895-4be3-a2a0-327ad3444bf3@os.amperecomputing.com>
 <amh19c6vtDNKsl3C@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amh19c6vtDNKsl3C@willie-the-truck>
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

On Tue, Jul 28, 2026 at 10:27:17AM +0100, Will Deacon wrote:
> On Mon, Jul 27, 2026 at 12:50:59PM -0700, Yang Shi wrote:
> > On 7/22/26 4:31 AM, Will Deacon wrote:
> > > > Yes, it may race with memory hotplug. I missed memory hotplug for v7
> > > > Sashiko. Two options to solve it:
> > > >
> > > > 1. Use atomic variables. Make lm_meminfo[NR_LM_TYPE] atomic_long_t, then
> > > > manipulate it with atomic ops.
> > > > 2. Protect it with a spin lock.
> > > >
> > > > The contention for the cache line or the spin lock should be rare since
> > > > memory hotplug should happen rarely. Any preference?
> > > I'd vote for keeping it simple and using a lock. Might be worth looking
> > > at the ongoing work from Lorenzo:
> > >
> > > https://lore.kernel.org/all/20260717-series-vmap-race-fix-v5-0-606a0ac6d3e5@kernel.org/
> >
> > Thanks, Will. Took a look at Lorenzo's work. IIUC he used init_mm mmap_lock
> > to protect vmalloc area and linear mapping collapse on x86 in order to
> > serialize against ptdump. I don't think we should use init_mm mmap_lock. We
> > want to serialize linear mapping counter update between split and memory
> > hotplug, but neither of them takes init_mm mmap_lock. We can let them take
> > init_mm mmap_lock, but it sounds too overkilling.
>
> Hmm, but if split and hotplug don't take the mmap_lock, how are they
> serialised against ptdump? From what I understood, Lorenzo's patches
> change ptdump to take it for write in order to serialise against other
> walkers.

As for memory hotplug - ptdump already takes that lock in
ptdump_walk_pgd() so you'd need to add that on split I think?

So I think you need to take it in the split code and in
arch_report_meminfo.

So that solves that, you can get ptdump serialisation by ALSO taking the
init_mm read map on split.

That way you can rely on core ptdump stuff without having to add new
locking in arm64-specific ptdump.

And would you also need the pgtable_split_lock in arch_report_meminfo() to
serialise lm_meminfo access?

(Side-note: I am going to try to implement RCU kernel page table freeing at
some point... so then maybe ptdump won't need the init_mm lock any
more. But we could still take it there for this at least :)

>
> Will

Cheers, Lorenzo

