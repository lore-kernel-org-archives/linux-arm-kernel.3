Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24FA2E8384B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 13:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2hzhBGgDkYDfFunUaGLunBT1xzGB/bv/VhpSq++X7ck=; b=muZGaey6KsOLiKT2YalBBEpeQS
	HMb8EH/SlQ5R66zgKtN25zt8x/aQjzCA6vMixBXSqIVshmLoIN0f4ZxcEJp+jw8o11S3z95/MOnca
	mVomqq6PWJfHQR4cAiB7txOgaYxo3aVUKrDaVtVpyfAB30N1y0OkuwnA/9U7ihawiqZ1feme9LbAh
	kvqZFAPpuHmRgT7vdFx0JbOEa99eMmc/5+1R5x/SVe+bJSBiX8NsIzVru96qV2BDzJCnGexOGLzp0
	qnip67XfSXPPcADz3DNTpHYZf6z5pIJyyy46Q4Y2om0PuCx10KhHAiwCLKlkbCGIITblcaE2rWmTe
	oc1nr3XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsKvM-00000008Hxs-2xvs;
	Tue, 17 Feb 2026 13:15:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsKvK-00000008HxF-1D4U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 13:15:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 43946406EF;
	Tue, 17 Feb 2026 13:15:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BCD7C4CEF7;
	Tue, 17 Feb 2026 13:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771334129;
	bh=IFqWRnMOe90PHPZ6ogIhD60Li5AyK3EFhOC6WZ8V4S8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F44Ix8zfCzwWI4AQs9GQP2t1ynVHWLNSCY3twBxZFDsxlSu/RfSxZcW9hg0L7WEMK
	 DVLz5necSLs8Vd9sUbcqNxHiXhSe1wgYUNVz9W3t3HjIlpnMvOSIidbsZRLiskWn68
	 xItdSgwjZ64haQEHc9AA+Car4oFuKE6jJy6K1oZ9qp0NfO17s8m5QhB5G3se54yqng
	 +Woyi/px6vIOOUpaq+Jzvi7e5oKdunoebhikfsFPd3HTxF9VWSvih4dM6ug2R8hcj/
	 MvelNqZrwI6p0ECzsvxqAg+vPD6IuKSVLKEs3YzKCjc2YZAO5l2Mn9P1+IofP43CvT
	 66YAmYLUGAOHw==
Date: Tue, 17 Feb 2026 15:15:25 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Robin Murphy <robin.murphy@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Geoff Levand <geoff@infradead.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org, linux-alpha@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux <sparclinux@vger.kernel.org>
Subject: Re: [PATCH v5 11/14] sparc: Use physical address DMA mapping
Message-ID: <20260217131525.GK12989@unreal>
References: <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
 <20251015-remove-map-page-v5-11-3bbfe3a25cdf@kernel.org>
 <CGME20260217123216eucas1p2d74189a3cdf08e9301bebf1840491364@eucas1p2.samsung.com>
 <e294484787a5032c531dcd40071b22362bddcad4.camel@physik.fu-berlin.de>
 <7131d609-b083-4264-818a-21de38c1c3ed@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7131d609-b083-4264-818a-21de38c1c3ed@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_051530_389337_93DD0976 
X-CRM114-Status: GOOD (  23.80  )
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

On Tue, Feb 17, 2026 at 01:55:56PM +0100, Marek Szyprowski wrote:
> On 17.02.2026 13:27, John Paul Adrian Glaubitz wrote:
> > On Wed, 2025-10-15 at 12:12 +0300, Leon Romanovsky wrote:
> >> From: Leon Romanovsky <leonro@nvidia.com>
> >>
> >> Convert sparc architecture DMA code to use .map_phys callback.
> >>
> >> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> >> ---
> >>   arch/sparc/kernel/iommu.c     | 30 +++++++++++++++++-----------
> >>   arch/sparc/kernel/pci_sun4v.c | 31 ++++++++++++++++++-----------
> >>   arch/sparc/mm/io-unit.c       | 38 ++++++++++++++++++-----------------
> >>   arch/sparc/mm/iommu.c         | 46 ++++++++++++++++++++++---------------------
> >>   4 files changed, 82 insertions(+), 63 deletions(-)

<...>

> >> @@ -296,7 +305,6 @@ static dma_addr_t dma_4u_map_page(struct device *dev, struct page *page,
> >>   	bus_addr = (iommu->tbl.table_map_base +
> >>   		    ((base - iommu->page_table) << IO_PAGE_SHIFT));
> >>   	ret = bus_addr | (oaddr & ~IO_PAGE_MASK);
> >> -	base_paddr = __pa(oaddr & IO_PAGE_MASK);
> >>   	if (strbuf->strbuf_enabled)
> >>   		iopte_protection = IOPTE_STREAMING(ctx);
> >>   	else
> >> @@ -304,8 +312,8 @@ static dma_addr_t dma_4u_map_page(struct device *dev, struct page *page,
> >>   	if (direction != DMA_TO_DEVICE)
> >>   		iopte_protection |= IOPTE_WRITE;
> >>   
> >> -	for (i = 0; i < npages; i++, base++, base_paddr += IO_PAGE_SIZE)
> >> -		iopte_val(*base) = iopte_protection | base_paddr;
> >> +	for (i = 0; i < npages; i++, base++, phys += IO_PAGE_SIZE)
> >> +		iopte_val(*base) = iopte_protection | phys;
> 
> 'base_paddr' was aligned to start of a page before this patch, while 
> 'phys' includes the offset within a page.

Thanks for the fix. I had assumed we needed to revert all changes in
iounit_get_area().

Thanks

> 
> 
> Could You check if the following change fixes the issue?
> 
> diff --git a/arch/sparc/kernel/iommu.c b/arch/sparc/kernel/iommu.c
> index 46ef88bc9c26..edb0ffb21e2f 100644
> --- a/arch/sparc/kernel/iommu.c
> +++ b/arch/sparc/kernel/iommu.c
> @@ -312,6 +312,7 @@ static dma_addr_t dma_4u_map_phys(struct device 
> *dev, phys_addr_t phys,
>          if (direction != DMA_TO_DEVICE)
>                  iopte_protection |= IOPTE_WRITE;
> 
> +       phys -= offset_in_page(phys);
>          for (i = 0; i < npages; i++, base++, phys += IO_PAGE_SIZE)
>                  iopte_val(*base) = iopte_protection | phys;
> 
>  >> ...
> 
> Best regards
> -- 
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
> 

