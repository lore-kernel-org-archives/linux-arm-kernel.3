Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D7F2C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 10:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i0k/HI/bcvlOdY3uUk2PaTWHvR+HLRCqNH8Ek21Htnw=; b=wHWUE2pk/JrB8Rlao7+J4VulHv
	TmI8rFcayFNoV3A44yASVx0mIypNnU829ZHUpBXr6E8eiVgTVg5WKnXFG3fl5JDL3NG3HxuVg0hV9
	Ot87QoPjIv9ZV8NH91hZO147OjdHpEKL2sCORkJ51CHLarLh7AYfwd+OBF6Jq/eUiM8d96MZ+Fn1d
	PbEeF8tPbJ/z3qeFnGZ/ZQZ1jIBq3CqqCAhWkyUV5kNXxvTDlTb3bSyet2BqkHDZBGuIEdJKEeX3O
	HunKfi5Pu8tgFOqbfjxmd0um8H1OFZBM+FOqfedqJKx2Z51hgs+sJXZUJypCz1JMLB+OdiWRtP52k
	R2l3/Ctg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cRc-0000000E7YO-3QYx;
	Thu, 10 Sep 2026 10:55:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cRa-0000000E7YI-3NnU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 10:55:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8E50C42E68;
	Thu, 10 Sep 2026 10:55:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FEC91F00893;
	Thu, 10 Sep 2026 10:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789037750;
	bh=i0k/HI/bcvlOdY3uUk2PaTWHvR+HLRCqNH8Ek21Htnw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Sc/Krteyn26A4LgEQxcaQ3aIGJQrPiYPJoPeNp7tZ/hRMWj3NuGHWMPxFTWsGav5x
	 wptWbvudyVSj5LZah6hldUObO9gJUrw/FqALJrudU8w/ZQ6XvreENhQGhT5jqQCTlL
	 wSmYrFeJXRNV1yMOF7JEX2SjiQFpGARrQ57co0kwAGpS5uPPI5kaqKKFygGvNWIi/k
	 aAVPHnzVr63YkXDJzeXXEFWAGhCbsXdCoT6gg9W8eA4SNsvVlbC0YCx6d/o+PtdzIV
	 qZFNSKXnlpZpABb2WgKchhgOH+kvgIFxRFGXgBTsZ7GiiBy7ulWCz+t5k96ldf1zZR
	 UGrWVYbSz/0Fg==
Date: Thu, 10 Sep 2026 11:55:44 +0100
From: Will Deacon <will@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Christoph Hellwig <hch@lst.de>, Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH 0/2] ARM: preserve DMA_FROM_DEVICE buffer contents
Message-ID: <aqKMsKpYnAZOoKQo@willie-the-truck>
References: <20260910063620.17768-1-kmehltretter@gmail.com>
 <2ea28a17-f36f-4dfb-8e2a-375e7a3a4d6b@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ea28a17-f36f-4dfb-8e2a-375e7a3a4d6b@app.fastmail.com>
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

On Thu, Sep 10, 2026 at 11:14:28AM +0200, Arnd Bergmann wrote:
> On Thu, Sep 10, 2026, at 08:36, Karl Mehltretter wrote:
> > This series prevents a DMA_FROM_DEVICE map from discarding CPU-written
> > buffer contents on non-coherent 32-bit ARM. It is based on
> > v7.3-rc1-324-g986c24e0fe44.
> >
> > ARM currently invalidates these buffers before the device writes them.
> > If the device writes only part of a buffer, discarded dirty cache lines
> > can expose older memory contents in the untouched bytes. A stock USB
> > webcam demonstrated this through usbfs. Short isochronous packets left
> > gaps, and usbfs returned non-zero data to userspace from bytes it had
> > cleared.
> >
> > arm64 changed this handoff from invalidate to clean in 2022 with commit
> > c50f11c6196f ("arm64: mm: Don't invalidate FROM_DEVICE buffers at start
> > of DMA transfer"). Arnd Bergmann's 2023 ARM32 cache-maintenance series
> > left DMA_FROM_DEVICE preservation unresolved [1]. This series keeps the
> > existing ownership hooks.
> 
> I think the main problem here is that we remain inconsistent about the
> rules across CPU architectures, and changing Arm on its own does not
> mean we have a solution if another architecture decides to change it
> in the opposite direction at some point.
> 
> I see this as a tradeoff that can go either way:
> 
> - the current 32-bit Arm approach (also arc, hexagon, microblaze, mips,
>   nios2, openrisc, powerpc32, sh) is obviously faster as it avoids
>   the writeback, but it relies on device drivers to ensure no stale
>   data can leak back into userspace.
> 
> - Will's patch changed arm64 (later copied into riscv) to avoid that
>   risk by adding the overhead out of caution, and avoid having to
>   audit and fix all drivers.

How would you envisage fixing a driver for this? There were two issues
I tried to address by moving from invalidate to clean on arm64:

1. If the DMA transfer didn't write every cacheline in the buffer, then
   we could expose stale data in the gaps.

2. If the buffer has a pre-existing userspace mapping, then we expose
   stale data during the window between the DMA map() call and the DMA
   itself.

Fixing (1) in the driver would presumably require it to walk through the
buffer after the transfer and zero all the gaps, with an appreciation
for the cache writeback granule (!= cacheline size) and then (somehow)
clean those parts back to the PoC. Is that something any drivers attempt
today?

Fixing (2) in the driver would presumably require ruling out the
possibility of a user alias, which sounds hard and possibly ABI breaking
for some drivers (depending on how they manage their buffers).

> If we decide to align with arm64/riscv and take your series, I think
> we need two more parts:
> 
> - actually measure the performance overhead: you already did the
>   work to test this on three separate arm implementations but did
>   not share performance numbers.
>   Can you quantify how much this costs us on the hardware you used?

It's worth noting that many Arm CPUs upgrade invalidate to
clean+invalidate (either due to the micro-architecture, errata or because
of virtualisation).

Will

