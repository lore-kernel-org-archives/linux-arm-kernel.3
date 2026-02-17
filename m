Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB9CE909A3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 13:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pwz8t6PMdZ7Eyt0zG9XbbpQPro+70AXMQDf5xeeq3xY=; b=OnKP3x2XIh0QEdliZSxH/Mye46
	OQ7FSypOoHYFGRI8N2iGibaIvgHl3P/5lTiifIneFQG/tW4tRpHZB/0wSAY3wwj/VK3lUdH7xIdfu
	wPi8H828OHJAC4f8AZg1CNBENKCaUroEE2zic62bs0l4u9+sQ/lnK+Rl3DdgROV0gWUAQDqJtWp0W
	dEYgfo71Nwc1Qy265eW/reFpeqRxFO7pC8a0sGhRv+f7Yr5lxJHt2qOp4zj4BHBlR25Tsy/ePTMLV
	EDRUqkM2/8kcjC9ULq8e4zqiAzSwrfUoQokWLdzRRsHHaCB7zFYI6hqIOGtKVJYm1cNLVkMOduOrP
	lSjMEZ0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsLaR-00000008NaQ-39dn;
	Tue, 17 Feb 2026 13:57:59 +0000
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsLaN-00000008NYf-1nLB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 13:57:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=Pwz8t6PMdZ7Eyt0zG9XbbpQPro+70AXMQDf5xeeq3xY=; t=1771336675;
	x=1771941475; b=pEzfYLSF0Zrl7sE7egWk1hryAK7YmqO7wjfr504wpzZN12kycQzIrXQTITcRg
	QrN75FN3uYEbNWmsHhUOp0s3VQnx0el8mPLjdD3z9eTP2Qj/Q2yOw0b8/e4XAFoFTHPLIZY3mqXj3
	Gp1X7zaQusV7iGJQojs15OelYSdTAnsa9YezLg+J7q1m0kNK06GCIqyNp/yXRVQX2V9by4224gj6D
	xnpOCQKSWIyAgLRjDNOs9GifDAR1w0oMYHvz2izjWEvR+Z307EKaHf6ddb7m2lvrsxHkoLiAaBB2d
	qCz3c6FjmViZH9NidwPuucrfULP108tw50TN1d4v8+SmDeUhpg==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.99)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1vsLa1-00000003Yoo-11bO; Tue, 17 Feb 2026 14:57:33 +0100
Received: from p5dc55f29.dip0.t-ipconnect.de ([93.197.95.41] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.99)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1vsLa0-00000002m9f-3s0R; Tue, 17 Feb 2026 14:57:33 +0100
Message-ID: <8317613a286ab637ac29740433ff51286ebbbaca.camel@physik.fu-berlin.de>
Subject: Re: [PATCH v5 11/14] sparc: Use physical address DMA mapping
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Marek Szyprowski <m.szyprowski@samsung.com>, Leon Romanovsky	
 <leon@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Russell King	
 <linux@armlinux.org.uk>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini	 <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>,  Richard Henderson
 <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, Thomas
 Bogendoerfer	 <tsbogend@alpha.franken.de>, "James E.J. Bottomley"	
 <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, 
 Madhavan Srinivasan	 <maddy@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin	 <npiggin@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Geoff Levand <geoff@infradead.org>,
 "David S. Miller" <davem@davemloft.net>, Andreas Larsson	
 <andreas@gaisler.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar	
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen	
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, xen-devel@lists.xenproject.org, 
	linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, sparclinux
	 <sparclinux@vger.kernel.org>
Date: Tue, 17 Feb 2026 14:57:31 +0100
In-Reply-To: <7131d609-b083-4264-818a-21de38c1c3ed@samsung.com>
References: <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
		<20251015-remove-map-page-v5-11-3bbfe3a25cdf@kernel.org>
		<CGME20260217123216eucas1p2d74189a3cdf08e9301bebf1840491364@eucas1p2.samsung.com>
		<e294484787a5032c531dcd40071b22362bddcad4.camel@physik.fu-berlin.de>
	 <7131d609-b083-4264-818a-21de38c1c3ed@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 93.197.95.41
X-ZEDAT-Hint: PO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_055755_620491_D94226D1 
X-CRM114-Status: GOOD (  27.11  )
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

Hi Marek,

On Tue, 2026-02-17 at 13:55 +0100, Marek Szyprowski wrote:
> On 17.02.2026 13:27, John Paul Adrian Glaubitz wrote:
> > On Wed, 2025-10-15 at 12:12 +0300, Leon Romanovsky wrote:
> > > From: Leon Romanovsky <leonro@nvidia.com>
> > >=20
> > > Convert sparc architecture DMA code to use .map_phys callback.
> > >=20
> > > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> > > ---
> > >   arch/sparc/kernel/iommu.c     | 30 +++++++++++++++++-----------
> > >   arch/sparc/kernel/pci_sun4v.c | 31 ++++++++++++++++++-----------
> > >   arch/sparc/mm/io-unit.c       | 38 ++++++++++++++++++--------------=
---
> > >   arch/sparc/mm/iommu.c         | 46 ++++++++++++++++++++++----------=
-----------
> > >   4 files changed, 82 insertions(+), 63 deletions(-)
> > >=20
> > > diff --git a/arch/sparc/kernel/iommu.c b/arch/sparc/kernel/iommu.c
> > > index da0363692528..46ef88bc9c26 100644
> > > --- a/arch/sparc/kernel/iommu.c
> > > +++ b/arch/sparc/kernel/iommu.c
> > > @@ -260,26 +260,35 @@ static void dma_4u_free_coherent(struct device =
*dev, size_t size,
> > >   		free_pages((unsigned long)cpu, order);
> > >   }
> > >  =20
> > > -static dma_addr_t dma_4u_map_page(struct device *dev, struct page *p=
age,
> > > -				  unsigned long offset, size_t sz,
> > > -				  enum dma_data_direction direction,
> > > +static dma_addr_t dma_4u_map_phys(struct device *dev, phys_addr_t ph=
ys,
> > > +				  size_t sz, enum dma_data_direction direction,
> > >   				  unsigned long attrs)
> > >   {
> > >   	struct iommu *iommu;
> > >   	struct strbuf *strbuf;
> > >   	iopte_t *base;
> > >   	unsigned long flags, npages, oaddr;
> > > -	unsigned long i, base_paddr, ctx;
> > > +	unsigned long i, ctx;
> > >   	u32 bus_addr, ret;
> > >   	unsigned long iopte_protection;
> > >  =20
> > > +	if (unlikely(attrs & DMA_ATTR_MMIO))
> > > +		/*
> > > +		 * This check is included because older versions of the code
> > > +		 * lacked MMIO path support, and my ability to test this path
> > > +		 * is limited. However, from a software technical standpoint,
> > > +		 * there is no restriction, as the following code operates
> > > +		 * solely on physical addresses.
> > > +		 */
> > > +		goto bad_no_ctx;
> > > +
> > >   	iommu =3D dev->archdata.iommu;
> > >   	strbuf =3D dev->archdata.stc;
> > >  =20
> > >   	if (unlikely(direction =3D=3D DMA_NONE))
> > >   		goto bad_no_ctx;
> > >  =20
> > > -	oaddr =3D (unsigned long)(page_address(page) + offset);
> > > +	oaddr =3D (unsigned long)(phys_to_virt(phys));
> > >   	npages =3D IO_PAGE_ALIGN(oaddr + sz) - (oaddr & IO_PAGE_MASK);
> > >   	npages >>=3D IO_PAGE_SHIFT;
> > >  =20
> > > @@ -296,7 +305,6 @@ static dma_addr_t dma_4u_map_page(struct device *=
dev, struct page *page,
> > >   	bus_addr =3D (iommu->tbl.table_map_base +
> > >   		    ((base - iommu->page_table) << IO_PAGE_SHIFT));
> > >   	ret =3D bus_addr | (oaddr & ~IO_PAGE_MASK);
> > > -	base_paddr =3D __pa(oaddr & IO_PAGE_MASK);
> > >   	if (strbuf->strbuf_enabled)
> > >   		iopte_protection =3D IOPTE_STREAMING(ctx);
> > >   	else
> > > @@ -304,8 +312,8 @@ static dma_addr_t dma_4u_map_page(struct device *=
dev, struct page *page,
> > >   	if (direction !=3D DMA_TO_DEVICE)
> > >   		iopte_protection |=3D IOPTE_WRITE;
> > >  =20
> > > -	for (i =3D 0; i < npages; i++, base++, base_paddr +=3D IO_PAGE_SIZE=
)
> > > -		iopte_val(*base) =3D iopte_protection | base_paddr;
> > > +	for (i =3D 0; i < npages; i++, base++, phys +=3D IO_PAGE_SIZE)
> > > +		iopte_val(*base) =3D iopte_protection | phys;
>=20
> 'base_paddr' was aligned to start of a page before this patch, while=20
> 'phys'=C2=A0includes the offset within a page.
>=20
>=20
> Could You check if the following change fixes the issue?
>=20
> diff --git a/arch/sparc/kernel/iommu.c b/arch/sparc/kernel/iommu.c
> index 46ef88bc9c26..edb0ffb21e2f 100644
> --- a/arch/sparc/kernel/iommu.c
> +++ b/arch/sparc/kernel/iommu.c
> @@ -312,6 +312,7 @@ static dma_addr_t dma_4u_map_phys(struct device=20
> *dev, phys_addr_t phys,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (direction !=3D DMA_TO_DEV=
ICE)
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 iopte_protection |=3D IOPTE_WRITE;
>=20
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 phys -=3D offset_in_page(phys);
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < npages; i++=
, base++, phys +=3D IO_PAGE_SIZE)
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 iopte_val(*base) =3D iopte_protection | phys;

Thanks, I have forwarded your patch and asked the user to answer here if po=
ssible [1].

Adrian

> [1] https://github.com/sparclinux/issues/issues/75#issuecomment-391479186=
2

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

