Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE32E92724
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 14:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CRfY/dhjT+kc1MJcMd3D1c3qtCXwz9d6dfF50jNi7zM=; b=K/Z9PnrXtvBqnYFyvToIWjPnAb
	iDWZm7nev86UTyWE4Iw7UlE3eCid9FLFp+IKAF40sfPcROAbT+Pr4oELLpohmfc++cVTURtbGi30o
	dGlMNWKOVZWAM5GzjOtAARjy/WTzgbZZbdRxgSXrcghq1fQRRPvKuIQabuHN9esAZZQ+/SlmEFXoW
	UZvVAiX9xxMW2GBT2iOqV+7Y7j7mGNGazYJohlg7md652jN6Fy31KgXGNPsodWwl9PBhec6htv3Ex
	EJNv+y4VQh8n2mBicHlppokBL2TtqVTNR2RCCWvEkp9WcIpa7X02R5k6zW+YBSlBiKs20EaEsZq82
	SWHuMc4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaEQ3-00000003nAP-4AD1;
	Mon, 29 Dec 2025 14:40:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaEPz-00000003n9Y-1Ivy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 14:40:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2031943445;
	Mon, 29 Dec 2025 14:40:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E160C16AAE;
	Mon, 29 Dec 2025 14:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767019218;
	bh=95eNv0h9dSeUKHPEZrk+7tpopWsRyVF7shUNwo04uqc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DszPpcjz/Spb2AyOl63ty/4z8XQXdNDT2k5mex3OvCAL3GdXV9aZIJusPmtNqz3rv
	 aMpD13xVXd9F6++80Vo1rqKhu2Ga2X8v/s+If0TACH4BOK0SOpTYDAwmAq+3imQSqX
	 TU2dgZQ3bGgJvLI+4AKBpfP48IAYG3OSGTJbGAl+h/VcM6+mA+OexW0F+EIc4a49N9
	 0IorIwjny+Ch/PyYfbziHYxnL5aVuMOQ2JKnD5Qs5cdZ6dFWJQFiTuT5Vt71qWYiJS
	 oWyNFHfT7qew344ucLY53r6xzG5+5DuL6XWs5/PDNykw9rtP/xzBZr5VoOvdsQfsZo
	 TfBOjJLvXo88Q==
Date: Mon, 29 Dec 2025 16:40:12 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Barry Song <21cnbao@gmail.com>
Subject: Re: [PATCH v2 4/8] dma-mapping: Separate DMA sync issuing and
 completion waiting
Message-ID: <20251229144012.GT11869@unreal>
References: <20251226225254.46197-1-21cnbao@gmail.com>
 <20251226225254.46197-5-21cnbao@gmail.com>
 <20251227200706.GN11869@unreal>
 <CAGsJ_4zyascnpQ1cB-BMO9PDeeRZTBAh8Z-j-ip=RcxApa4zSg@mail.gmail.com>
 <20251228144909.GR11869@unreal>
 <CAGsJ_4y=yoYZn+_ztdfuOCj_dS-M0h8YWO51AXubPbeR1FH6uQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGsJ_4y=yoYZn+_ztdfuOCj_dS-M0h8YWO51AXubPbeR1FH6uQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_064019_390995_D5F15FA2 
X-CRM114-Status: GOOD (  48.90  )
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

On Mon, Dec 29, 2025 at 10:38:26AM +1300, Barry Song wrote:
> On Mon, Dec 29, 2025 at 3:49 AM Leon Romanovsky <leon@kernel.org> wrote:
> >
> > On Sun, Dec 28, 2025 at 10:45:13AM +1300, Barry Song wrote:
> > > On Sun, Dec 28, 2025 at 9:07 AM Leon Romanovsky <leon@kernel.org> wrote:
> > > >
> > > > On Sat, Dec 27, 2025 at 11:52:44AM +1300, Barry Song wrote:
> > > > > From: Barry Song <baohua@kernel.org>
> > > > >
> > > > > Currently, arch_sync_dma_for_cpu and arch_sync_dma_for_device
> > > > > always wait for the completion of each DMA buffer. That is,
> > > > > issuing the DMA sync and waiting for completion is done in a
> > > > > single API call.
> > > > >
> > > > > For scatter-gather lists with multiple entries, this means
> > > > > issuing and waiting is repeated for each entry, which can hurt
> > > > > performance. Architectures like ARM64 may be able to issue all
> > > > > DMA sync operations for all entries first and then wait for
> > > > > completion together.
> > > > >
> > > > > To address this, arch_sync_dma_for_* now issues DMA operations in
> > > > > batch, followed by a flush. On ARM64, the flush is implemented
> > > > > using a dsb instruction within arch_sync_dma_flush().
> > > > >
> > > > > For now, add arch_sync_dma_flush() after each
> > > > > arch_sync_dma_for_*() call. arch_sync_dma_flush() is defined as a
> > > > > no-op on all architectures except arm64, so this patch does not
> > > > > change existing behavior. Subsequent patches will introduce true
> > > > > batching for SG DMA buffers.
> > > > >
> > > > > Cc: Leon Romanovsky <leon@kernel.org>
> > > > > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > > > > Cc: Will Deacon <will@kernel.org>
> > > > > Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> > > > > Cc: Robin Murphy <robin.murphy@arm.com>
> > > > > Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> > > > > Cc: Ard Biesheuvel <ardb@kernel.org>
> > > > > Cc: Marc Zyngier <maz@kernel.org>
> > > > > Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> > > > > Cc: Ryan Roberts <ryan.roberts@arm.com>
> > > > > Cc: Suren Baghdasaryan <surenb@google.com>
> > > > > Cc: Joerg Roedel <joro@8bytes.org>
> > > > > Cc: Juergen Gross <jgross@suse.com>
> > > > > Cc: Stefano Stabellini <sstabellini@kernel.org>
> > > > > Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > > > > Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> > > > > Signed-off-by: Barry Song <baohua@kernel.org>
> > > > > ---
> > > > >  arch/arm64/include/asm/cache.h |  6 ++++++
> > > > >  arch/arm64/mm/dma-mapping.c    |  4 ++--
> > > > >  drivers/iommu/dma-iommu.c      | 37 +++++++++++++++++++++++++---------
> > > > >  drivers/xen/swiotlb-xen.c      | 24 ++++++++++++++--------
> > > > >  include/linux/dma-map-ops.h    |  6 ++++++
> > > > >  kernel/dma/direct.c            |  8 ++++++--
> > > > >  kernel/dma/direct.h            |  9 +++++++--
> > > > >  kernel/dma/swiotlb.c           |  4 +++-
> > > > >  8 files changed, 73 insertions(+), 25 deletions(-)
> > > >
> > > > <...>
> > > >
> > > > > +#ifndef arch_sync_dma_flush
> > > > > +static inline void arch_sync_dma_flush(void)
> > > > > +{
> > > > > +}
> > > > > +#endif
> > > >
> > > > Over the weekend I realized a useful advantage of the ARCH_HAVE_* config
> > > > options: they make it straightforward to inspect the entire DMA path simply
> > > > by looking at the .config.
> > >
> > > I am not quite sure how much this benefits users, as the same
> > > information could also be obtained by grepping for
> > > #define arch_sync_dma_flush in the source code.
> >
> > It differs slightly. Users no longer need to grep around or guess whether this
> > platform used the arch_sync_dma_flush path. A simple grep for ARCH_HAVE_ in
> > /proc/config.gz provides the answer.
> 
> In any case, it is only two or three lines of code, so I am fine with
> either approach. Perhaps Marek, Robin, and others have a point here?
> 
> >
> > >
> > > >
> > > > Thanks,
> > > > Reviewed-by: Leon Romanovsky <leonro@nvidia.com>
> > >
> > > Thanks very much, Leon, for reviewing this over the weekend. One thing
> > > you might have missed is that I place arch_sync_dma_flush() after all
> > > arch_sync_dma_for_*() calls, for both single and sg cases. I also
> > > used a Python script to scan the code and verify that every
> > > arch_sync_dma_for_*() is followed by arch_sync_dma_flush(), to ensure
> > > that no call is left out.
> > >
> > > In the subsequent patches, for sg cases, the per-entry flush is
> > > replaced by a single flush of the entire sg. Each sg case has
> > > different characteristics: some are straightforward, while others
> > > can be tricky and involve additional contexts.
> >
> > I didn't overlook it, and I understand your rationale. However, this is
> > not how kernel patches should be structured. You should not introduce
> > code in patch X and then move it elsewhere in patch X + Y.
> 
> I am not quite convinced by this concern. This patch only
> separates DMA sync issuing from completion waiting, and it
> reflects that the development is done step by step.
> 
> >
> > Place the code in the correct location from the start. Your patches are
> > small enough to review as is.
> 
> My point is that this patch places the code in the correct locations
> from the start. It splits arch_sync_dma_for_*() into
> arch_sync_dma_for_*() plus arch_sync_dma_flush() everywhere, without
> introducing any functional changes from the outset.
> The subsequent patches clearly show which parts are truly batched.
> 
> In the meantime, I do not have a strong preference here. If you think
> it is better to move some of the straightforward batching code here,
> I can follow that approach. Perhaps I could move patch 5, patch 8,
> and the iommu_dma_iova_unlink_range_slow change from patch 7 here,
> while keeping
> 
>   [PATCH 6] dma-mapping: Support batch mode for
>   dma_direct_{map,unmap}_sg
> 
> and the IOVA link part from patch 7 as separate patches, since that
> part is not straightforward. The IOVA link changes affect both
> __dma_iova_link() and dma_iova_sync(), which are two separate
> functions and require a deeper understanding of the contexts to
> determine correctness. That part also lacks testing.

Don't worry about testing. NVME, RDMA and GPU are using this path
and someone will test it.

> 
> Would that be okay with you?

I don't know, need to see the code.

Thanks

> 
> Thanks
> Barry

