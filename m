Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 776B1E784BE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Dec 2025 14:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8qhOusxf4dxP7MAPnwhWCSLJO8UJneTCYQK6EyQF2xk=; b=rytoyyT6Ys2qx7yfswCvC9Id8Z
	+AU7q0Yt1czXk8elj/9Qj48CcYfjundAjscd+vwOJoiRz1g/gthdIM6WQUjLCPNp3wcfyFvpa8Ri6
	GtWkOwFt8cELF7ORa3CykUFqKcvLDxKWcQFHRRM2neQT0e9YkEPaDqoICSxOf1X2AqDyEFRbengfe
	AvqEYKsilWm3AOaDPC6ELrkeyJH4TxwXh9Cbz/7ovFY3+mrv1YqTlgDtHsy/s8+U+d2gxWhM0l/mq
	1wZtyujdV/04wC50VWUtlc+V3xPYbehObda8O5pcVKSNtYbYNqAdRYs/c7oDTNYsXEsDa5I2hENj4
	vvTpj3qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZs57-00000002ooC-3Uix;
	Sun, 28 Dec 2025 14:49:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZs55-00000002onq-0Cjc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Dec 2025 14:49:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5D15F403D6;
	Sun, 28 Dec 2025 14:49:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D38BC4CEFB;
	Sun, 28 Dec 2025 14:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766933354;
	bh=KsIQ/N3MhVA4l2rlxf/X6rqlexltaiPqA/C+R9KBRrw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qxr7ascqLWsFOwQZLmWr4VaoaU6kLt3JWfsyukATtuABzJxpEZhqUFeO5FQAhs+ir
	 u+cu2HY3hReFb+9sXcFor11aS/eIJMyuJ68Nmt/L+c2T0y3p+0rkU3gMrVEqEGGT26
	 hNG//3ORDr7c1ijghi5Ug5ZvJpG77gZxoqnLrhKcMTDOR0VSqIASJ2vv+Y8cPZIU/R
	 TyyELt1hdTT3RjWVZtdsFz/Yn3kHtB6+BiS+aVF/R8MuwUvFb7nETSS2aMOFPcoJA6
	 bNJ47oEeKqGd4FlgSKH6xIdPpwQG0Fv+x+JMZG7xHiN0aummhOQwA1dvg6SgWN7Jkc
	 XiChRt88500Gg==
Date: Sun, 28 Dec 2025 16:49:09 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Barry Song <21cnbao@gmail.com>
Subject: Re: [PATCH v2 4/8] dma-mapping: Separate DMA sync issuing and
 completion waiting
Message-ID: <20251228144909.GR11869@unreal>
References: <20251226225254.46197-1-21cnbao@gmail.com>
 <20251226225254.46197-5-21cnbao@gmail.com>
 <20251227200706.GN11869@unreal>
 <CAGsJ_4zyascnpQ1cB-BMO9PDeeRZTBAh8Z-j-ip=RcxApa4zSg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGsJ_4zyascnpQ1cB-BMO9PDeeRZTBAh8Z-j-ip=RcxApa4zSg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_064915_134098_18262D7C 
X-CRM114-Status: GOOD (  32.11  )
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
Cc: Juergen Gross <jgross@suse.com>, Tangquan Zheng <zhengtangquan@oppo.com>, Stefano Stabellini <sstabellini@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, will@kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>, catalin.marinas@arm.com, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>, iommu@lists.linux.dev, Marc Zyngier <maz@kernel.org>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, xen-devel@lists.xenproject.org, robin.murphy@arm.com, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sun, Dec 28, 2025 at 10:45:13AM +1300, Barry Song wrote:
> On Sun, Dec 28, 2025 at 9:07 AM Leon Romanovsky <leon@kernel.org> wrote:
> >
> > On Sat, Dec 27, 2025 at 11:52:44AM +1300, Barry Song wrote:
> > > From: Barry Song <baohua@kernel.org>
> > >
> > > Currently, arch_sync_dma_for_cpu and arch_sync_dma_for_device
> > > always wait for the completion of each DMA buffer. That is,
> > > issuing the DMA sync and waiting for completion is done in a
> > > single API call.
> > >
> > > For scatter-gather lists with multiple entries, this means
> > > issuing and waiting is repeated for each entry, which can hurt
> > > performance. Architectures like ARM64 may be able to issue all
> > > DMA sync operations for all entries first and then wait for
> > > completion together.
> > >
> > > To address this, arch_sync_dma_for_* now issues DMA operations in
> > > batch, followed by a flush. On ARM64, the flush is implemented
> > > using a dsb instruction within arch_sync_dma_flush().
> > >
> > > For now, add arch_sync_dma_flush() after each
> > > arch_sync_dma_for_*() call. arch_sync_dma_flush() is defined as a
> > > no-op on all architectures except arm64, so this patch does not
> > > change existing behavior. Subsequent patches will introduce true
> > > batching for SG DMA buffers.
> > >
> > > Cc: Leon Romanovsky <leon@kernel.org>
> > > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > > Cc: Will Deacon <will@kernel.org>
> > > Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> > > Cc: Robin Murphy <robin.murphy@arm.com>
> > > Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> > > Cc: Ard Biesheuvel <ardb@kernel.org>
> > > Cc: Marc Zyngier <maz@kernel.org>
> > > Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> > > Cc: Ryan Roberts <ryan.roberts@arm.com>
> > > Cc: Suren Baghdasaryan <surenb@google.com>
> > > Cc: Joerg Roedel <joro@8bytes.org>
> > > Cc: Juergen Gross <jgross@suse.com>
> > > Cc: Stefano Stabellini <sstabellini@kernel.org>
> > > Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > > Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> > > Signed-off-by: Barry Song <baohua@kernel.org>
> > > ---
> > >  arch/arm64/include/asm/cache.h |  6 ++++++
> > >  arch/arm64/mm/dma-mapping.c    |  4 ++--
> > >  drivers/iommu/dma-iommu.c      | 37 +++++++++++++++++++++++++---------
> > >  drivers/xen/swiotlb-xen.c      | 24 ++++++++++++++--------
> > >  include/linux/dma-map-ops.h    |  6 ++++++
> > >  kernel/dma/direct.c            |  8 ++++++--
> > >  kernel/dma/direct.h            |  9 +++++++--
> > >  kernel/dma/swiotlb.c           |  4 +++-
> > >  8 files changed, 73 insertions(+), 25 deletions(-)
> >
> > <...>
> >
> > > +#ifndef arch_sync_dma_flush
> > > +static inline void arch_sync_dma_flush(void)
> > > +{
> > > +}
> > > +#endif
> >
> > Over the weekend I realized a useful advantage of the ARCH_HAVE_* config
> > options: they make it straightforward to inspect the entire DMA path simply
> > by looking at the .config.
> 
> I am not quite sure how much this benefits users, as the same
> information could also be obtained by grepping for
> #define arch_sync_dma_flush in the source code.

It differs slightly. Users no longer need to grep around or guess whether this
platform used the arch_sync_dma_flush path. A simple grep for ARCH_HAVE_ in
/proc/config.gz provides the answer.

> 
> >
> > Thanks,
> > Reviewed-by: Leon Romanovsky <leonro@nvidia.com>
> 
> Thanks very much, Leon, for reviewing this over the weekend. One thing
> you might have missed is that I place arch_sync_dma_flush() after all
> arch_sync_dma_for_*() calls, for both single and sg cases. I also
> used a Python script to scan the code and verify that every
> arch_sync_dma_for_*() is followed by arch_sync_dma_flush(), to ensure
> that no call is left out.
> 
> In the subsequent patches, for sg cases, the per-entry flush is
> replaced by a single flush of the entire sg. Each sg case has
> different characteristics: some are straightforward, while others
> can be tricky and involve additional contexts.

I didn't overlook it, and I understand your rationale. However, this is
not how kernel patches should be structured. You should not introduce
code in patch X and then move it elsewhere in patch X + Y.

Place the code in the correct location from the start. Your patches are
small enough to review as is.

Thanks"
> 
> Thanks
> Barry

