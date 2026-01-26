Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F10D13C1D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 14:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PXhrAaNAEyGAqYGnD40N09zuJ4NyJC63T4DLFefKXgM=; b=StZv1T5UnQjFURFcfhjTtveXex
	M20M2Rz+9V/spHZoLc8kEC0YoYG3h3YgcI54geNdYglvRED2P6LftCc8HOOYVJCJog8Yz5VwRgL3z
	wf/Kq7sUw2DGvSy9QSLJE/zZ1peCW+xqM/KXlfAkOzWGkV+t+muJyhZ88GRejVRfKxQEYkevrGZNT
	fy1zWtY62m+xrEtJwaMtdZsO+dBKEwZKDTGHO6VJM9N8ZRg97jorCfC8Nhymm2DV8AW4voOn1JSai
	07kNS3DetCZuhxm75eN2HDONryBxYt5CZ6Z1ZrUiTktFeS8GobZAsmdrQ5iIjz+1z30vog8yeyfj8
	o8vq5QDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkNM6-0000000Cg1s-1W3q;
	Mon, 26 Jan 2026 14:14:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkNM4-0000000Cg1h-1VZ3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 14:14:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5BE7660051;
	Mon, 26 Jan 2026 14:14:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD346C116C6;
	Mon, 26 Jan 2026 14:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769436851;
	bh=9L2vbNiB8e+gXP7SCVXd/+3P+UwjPzUj+VSY+QAg374=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JIpLBDppW4b0HYFCWPlbZUCpkI9UA7XxbWvM9Ff9ZFw/zKn8xsHAAr6J5Y4HIFyyH
	 67kGvsaPuUli17E/MfdGm0n5e+O7LOUxrgVcNdoAh9/TWvef9rZlMfsvPH+mUxOI+a
	 UStFaM7ziGl1rlN/XDd/EFHw8YFYIbJjKkigUlN4O0cVPtFbTsfA+6dbcbKACRKvfK
	 vdelaljTritxf+obuKfZPzYfXbhTqASmxCetMpq11JCI5eYCFpaBzNVKxHi9TeMfRJ
	 rd/OX0dHvmYFI0XWFsAZx4Cn19P82wD8EECWTK6J2hhroC2+Dfv6ADx4u1WC21HMG6
	 ChOEM216uVXsw==
Date: Mon, 26 Jan 2026 14:14:06 +0000
From: Will Deacon <will@kernel.org>
To: Yang Shi <yang@os.amperecomputing.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, catalin.marinas@arm.com,
	cl@gentwo.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [v5 PATCH] arm64: mm: show direct mapping use in /proc/meminfo
Message-ID: <aXd2rud1E0Gff8-2@willie-the-truck>
References: <20260107002944.2940963-1-yang@os.amperecomputing.com>
 <aWZYXhrT6D2M-7-N@willie-the-truck>
 <bdd7bd07-dbed-432e-ae87-dc6381c05ddd@arm.com>
 <70b37582-fd26-4d23-a6d6-9a98e3f2eecf@os.amperecomputing.com>
 <b3122ea6-7bbc-4c07-b329-3355bbb16db9@arm.com>
 <a0aeed19-02d2-4d74-b82a-f906dc41e240@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0aeed19-02d2-4d74-b82a-f906dc41e240@os.amperecomputing.com>
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

On Thu, Jan 22, 2026 at 01:59:54PM -0800, Yang Shi wrote:
> On 1/22/26 6:43 AM, Ryan Roberts wrote:
> > On 21/01/2026 22:44, Yang Shi wrote:
> > > On 1/21/26 9:23 AM, Ryan Roberts wrote:
> > But it looks like all the higher level users will only ever unplug in the same
> > granularity that was plugged in (I might be wrong but that's the sense I get).
> > 
> > arm64 adds the constraint that it won't unplug any memory that was present at
> > boot - see prevent_bootmem_remove_notifier().
> > 
> > So in practice this is probably safe, though perhaps brittle.
> > 
> > Some options:
> > 
> >   - leave it as is and worry about it if/when something shifts and hits the
> >     problem.
> 
> Seems like the most simple way :-)
> 
> >   - Enhance prevent_bootmem_remove_notifier() to reject unplugging memory blocks
> >     whose boundaries are within leaf mappings.
> 
> I don't quite get why we should enhance prevent_bootmem_remove_notifier().
> If I read the code correctly, it just simply reject offline boot memory.
> Offlining a single memory block is fine. If you check the boundaries there,
> will it prevent from offlining a single memory block?
> 
> I think you need enhance try_remove_memory(). But kernel may unmap linear
> mapping by memory blocks if altmap is used. So you should need an extra page
> table walk with the start and the size of unplugged dimm before removing the
> memory to tell whether the boundaries are within leaf mappings or not IIUC.
> Can it be done in arch_remove_memory()? It seems not because
> arch_remove_memory() may be called on memory block granularity if altmap is
> used.
> 
> >   - For non-bbml2_noabort systems, map hotplug memory with a new flag to ensure
> >     that leaf mappings are always <= memory_block_size_bytes(). For
> >     bbml2_noabort, split at the block boundaries before doing the unmapping.
> 
> The linear mapping will be at most 128M (4K page size), it sounds sub
> optimal IMHO.
> 
> > Given I don't think this can happen in practice, probably the middle option is
> > the best? There is no runtime impact and it will give us a warning if it ever
> > does happen in future.
> > 
> > What do you think?
> 
> I agree it can't happen in practice, so why not just take option #1 given
> the complexity added by option #2?

It still looks broken in the case that a region that was mapped with the
contiguous bit is then unmapped. The sequence seems to iterate over
each contiguous PTE, zapping the entry and doing the TLBI while the
other entries in the contiguous range remain intact. I don't think
that's sufficient to guarantee that you don't have stale TLB entries
once you've finished processing the whole range.

For example, imagine you have an L1 TLB that only supports 4k entries
and an L2 TLB that supports 64k entries. Let's say that the contiguous
range is mapped by pte0 ... pte15 and we've zapped and invalidated
pte0 ... pte14. At that point, I think the hardware is permitted to use
the last remaining contiguous pte (pte15) to allocate a 64k entry in the
L2 TLB covering the whole range. A (speculative) walk via one of the
virtual addresses translated by pte0 ... pte14 could then hit that entry
and fill a 4k entry into the L1 TLB. So at the end of the sequence, you
could presumably still access the first 60k of the range thanks to stale
entries in the L1 TLB?

So it looks broken to me. What do you think? If you agree, then let's
fix this problem first before adding the new /proc/meminfo stuff.

Will

