Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B1C7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 14:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FZidfra1OEKhogkC2HXYCg2cBCh5erxMqJGy/hmUltA=; b=ZsY5Vq5Cdd7ZpNXLIgIVbGi4Cb
	B9tGNIdH/GWsklHNhQ6SnY7ylK4OJTrUrKpwOW7l8GFJAmGpFk3arM7W6ZlfuDP5ydZkS81sOe0FL
	XNsosdV2L8GCdXYWK0bGM6UWgSAWGmul4lC07gLAy5aGBNkbXVZ7TfdKRQ4O9NyVrBfhYFC1ZnYv8
	VlvegEp7Z0tFqznM1z7fkCveG8ynB2OSQ5DNpmF+6Vx16BTdY2FfJN8LgnRbU4QGRiLu5jkbUi2TT
	3j8O/yeA/7DlA4FWW/q/K/ONoaWQyU1mWIeX5yptQK4sDqoFNB/mMgVyBcGBltdt/WvWU2teqOLJP
	MuBW+8zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgkOU-0000000Cl5u-43f2;
	Mon, 06 Jul 2026 14:33:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgkOU-0000000Cl5m-07aL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 14:33:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A4D5F4198B;
	Mon,  6 Jul 2026 14:33:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F21E51F000E9;
	Mon,  6 Jul 2026 14:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783348437;
	bh=FZidfra1OEKhogkC2HXYCg2cBCh5erxMqJGy/hmUltA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZyapHbIXG2NOcX3c+KDvES77zPIfYC5Bs4Q4FFYAasXEnMjfTOePXBiFkIhg/Tu/G
	 Y/6ucLjGeBbKx0HIrozVJWwICiV9tf/iAkNZ+vjINfKF7xpJtqR4wm1irD3FsSxbWY
	 jgy97oLF3tBtPT5jdw5BxPPt+DJOvQ9CVy84JZEmZBn1seEWg+p9RgsB7djqL8KfMx
	 V/Lf9hv8eajAPJhZn4BKMFolvLtnDZnwpslNcaoZcbTIb4Pr14oYR3evwi+O5v4GmO
	 VIJ4ij81BAjKbCP85lKm0inpcq26Gxo2YLkfFoShz8dWYIO1PvSwPJ3YpJfFgGn0SJ
	 vYfUGFTmbf8Iw==
Date: Mon, 6 Jul 2026 17:33:50 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, David Hildenbrand <david@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>, Christoph Lameter <cl@gentwo.org>,
	Yang Shi <yang@os.amperecomputing.com>,
	Brendan Jackman <jackmanb@google.com>,
	Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [RFC PATCH 6/6] arm64: mm: support PMD page coalescing in the
 linear map
Message-ID: <aku8zidRtXPe_Rle@kernel.org>
References: <20260611130144.1385343-1-abarnas@google.com>
 <20260611130144.1385343-7-abarnas@google.com>
 <799181c3-a1a1-4de7-bc6a-576d3282efb0@arm.com>
 <akuieSDlbYdHnkCV@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <akuieSDlbYdHnkCV@google.com>
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

On Mon, Jul 06, 2026 at 12:41:29PM +0000, Adrian Barnaś wrote:
> Hi Mike,
> 
> On Fri, Jun 19, 2026 at 02:40:40PM +0100, Ryan Roberts wrote:
> 
> > I don't think this is safe in general. Let's say we have a 2M region split into
> > 512 x 4K PTEs. It's possible that the first 1M is one object and the second 1M
> > is another object. Different CPUs could set_memory_*() on those 2 objects
> > concurrently. If one of them then calls this function, we could end up
> > collapsing the whole 2M while the other is trying to modify the PTEs and they
> > will race.
> > 
> > Note that splitting _is_ safe (and protected by this lock) because you'd have 2
> > objects backed by the same PMD, so they would both have to split before
> > modifying the PTEs.
> > 
> > I think you'd need to ensure mutual exclusion at a higher level if doing this;
> > probably execmem is the place that can ensure that no objects within a 2M region
> > are racily trying to modify their permissions?
> > 
> > Thanks,
> > Ryan
> 
> I wonder what do you think about enforcing mutual exclusion for permission
> changes to the ROX_CACHE block as Ryan sugest?
> 
> Would it be appropriate to add locks (over `&execmem_cache.mutex`) to
> `execmem_force_rw` and `execmem_restore_rox`?
>                                                                             I
> see that x86 has a lock that wraps entire process of updating attributes
> (including spliting and collapsing pages):
> ```
> spin_lock(&cpa_lock);
> ret = __change_page_attr(cpa, primary);
> spin_unlock(&cpa_lock);                                            ```
> As I understand it makes it safe already.
> However, on ARM64 there is a split lock (which works fine for spliting) but
> for collapsing at least on my implementation it is not sufficient as
> Ryan pointed out.

I think the lock should be at set_memory level so that set_memory callers
shouldn't care about the differences in arch implementations.

I also suspect that the lockless page table walk in update_range_prot()
isn't safe today.
 
> Best regards
> Adrian

-- 
Sincerely yours,
Mike.

