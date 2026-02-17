Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05CB9E6817D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 12:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M8vjpXwBYqHTGgLeO7mfZbw/zRtPy35wLTMbPEUqNJY=; b=Nux0YgicMaIPZT5qcLiGIZBOlD
	3RGPFes71t26w4FROqQi5BS00YrF6TblalNLd69tuaka2QUdryAaevJ7fa8LEQpH2/nKHrPib8qv8
	PDURgWYBWDBEppE/uGmiyrVEy11S5Qfc74KuY5PvnhPpXq5cHxttxVcdGNkYhJZEQaxDwFGL0cQ4t
	gHuCpLVUwX/Nz+C6TF2tJatARcCWqAiVP0KPU3G0cfcLXd9masjhrG3j5hiQiP5nQQt96fmADzbHG
	1F+mdCOJdkKD0s6JAZZ5jGcKqCeTEnJtXaL94VtjQKtBDICWO7aeJ0ecrI1qEOHoDJtLtaI3e8s0W
	18e6v0wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsKBV-00000008Cvp-13OQ;
	Tue, 17 Feb 2026 12:28:09 +0000
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsKBR-00000008Cv3-3xK2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 12:28:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=M8vjpXwBYqHTGgLeO7mfZbw/zRtPy35wLTMbPEUqNJY=; t=1771331286;
	x=1771936086; b=a/NWSNYvAbIDHr/Ta8UacQMMpT4//+iUX1ig6Pdcjd+lCySF9V1leXAmpgWXI
	4alXstNdZG7VRHNnHBqv3KppfPEKzx8GbEtyA6PnD353L5CkMr21LfVUjljJ5l8BzrHI9IOHNBXUx
	QQABP+DDaLcWMlHr+mWuyUIJeh1dvvhRkzFcvWAGEZ0w4IMQlAGnpH0lKNrru9AKBereT8v2B1BKM
	mf5Psvu6J+bHtAsG0BiDzs1zXCuqGRiz9NTDzMnxqgnKe5l6/SQPCPmVmo3gBIG7sthONhsjLUOfU
	2miHzYY7yPkd0eqnhkhP6lW613o2F3DTmusEmFR9A8Adk0ApCQ==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.99)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1vsKAq-00000002WEs-0TOS; Tue, 17 Feb 2026 13:27:28 +0100
Received: from p5dc55f29.dip0.t-ipconnect.de ([93.197.95.41] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.99)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1vsKAp-000000026vw-3EPk; Tue, 17 Feb 2026 13:27:27 +0100
Message-ID: <e294484787a5032c531dcd40071b22362bddcad4.camel@physik.fu-berlin.de>
Subject: Re: [PATCH v5 11/14] sparc: Use physical address DMA mapping
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Leon Romanovsky <leon@kernel.org>, Marek Szyprowski	
 <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Russell
 King	 <linux@armlinux.org.uk>, Juergen Gross <jgross@suse.com>, Stefano
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
Date: Tue, 17 Feb 2026 13:27:26 +0100
In-Reply-To: <20251015-remove-map-page-v5-11-3bbfe3a25cdf@kernel.org>
References: <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
	 <20251015-remove-map-page-v5-11-3bbfe3a25cdf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 93.197.95.41
X-ZEDAT-Hint: PO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_042806_318466_35DBE9C1 
X-CRM114-Status: GOOD (  26.51  )
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

Hello Leon,

On Wed, 2025-10-15 at 12:12 +0300, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
>=20
> Convert sparc architecture DMA code to use .map_phys callback.
>=20
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  arch/sparc/kernel/iommu.c     | 30 +++++++++++++++++-----------
>  arch/sparc/kernel/pci_sun4v.c | 31 ++++++++++++++++++-----------
>  arch/sparc/mm/io-unit.c       | 38 ++++++++++++++++++-----------------
>  arch/sparc/mm/iommu.c         | 46 ++++++++++++++++++++++---------------=
------
>  4 files changed, 82 insertions(+), 63 deletions(-)
>=20
> diff --git a/arch/sparc/kernel/iommu.c b/arch/sparc/kernel/iommu.c
> index da0363692528..46ef88bc9c26 100644
> --- a/arch/sparc/kernel/iommu.c
> +++ b/arch/sparc/kernel/iommu.c
> @@ -260,26 +260,35 @@ static void dma_4u_free_coherent(struct device *dev=
, size_t size,
>  		free_pages((unsigned long)cpu, order);
>  }
> =20
> -static dma_addr_t dma_4u_map_page(struct device *dev, struct page *page,
> -				  unsigned long offset, size_t sz,
> -				  enum dma_data_direction direction,
> +static dma_addr_t dma_4u_map_phys(struct device *dev, phys_addr_t phys,
> +				  size_t sz, enum dma_data_direction direction,
>  				  unsigned long attrs)
>  {
>  	struct iommu *iommu;
>  	struct strbuf *strbuf;
>  	iopte_t *base;
>  	unsigned long flags, npages, oaddr;
> -	unsigned long i, base_paddr, ctx;
> +	unsigned long i, ctx;
>  	u32 bus_addr, ret;
>  	unsigned long iopte_protection;
> =20
> +	if (unlikely(attrs & DMA_ATTR_MMIO))
> +		/*
> +		 * This check is included because older versions of the code
> +		 * lacked MMIO path support, and my ability to test this path
> +		 * is limited. However, from a software technical standpoint,
> +		 * there is no restriction, as the following code operates
> +		 * solely on physical addresses.
> +		 */
> +		goto bad_no_ctx;
> +
>  	iommu =3D dev->archdata.iommu;
>  	strbuf =3D dev->archdata.stc;
> =20
>  	if (unlikely(direction =3D=3D DMA_NONE))
>  		goto bad_no_ctx;
> =20
> -	oaddr =3D (unsigned long)(page_address(page) + offset);
> +	oaddr =3D (unsigned long)(phys_to_virt(phys));
>  	npages =3D IO_PAGE_ALIGN(oaddr + sz) - (oaddr & IO_PAGE_MASK);
>  	npages >>=3D IO_PAGE_SHIFT;
> =20
> @@ -296,7 +305,6 @@ static dma_addr_t dma_4u_map_page(struct device *dev,=
 struct page *page,
>  	bus_addr =3D (iommu->tbl.table_map_base +
>  		    ((base - iommu->page_table) << IO_PAGE_SHIFT));
>  	ret =3D bus_addr | (oaddr & ~IO_PAGE_MASK);
> -	base_paddr =3D __pa(oaddr & IO_PAGE_MASK);
>  	if (strbuf->strbuf_enabled)
>  		iopte_protection =3D IOPTE_STREAMING(ctx);
>  	else
> @@ -304,8 +312,8 @@ static dma_addr_t dma_4u_map_page(struct device *dev,=
 struct page *page,
>  	if (direction !=3D DMA_TO_DEVICE)
>  		iopte_protection |=3D IOPTE_WRITE;
> =20
> -	for (i =3D 0; i < npages; i++, base++, base_paddr +=3D IO_PAGE_SIZE)
> -		iopte_val(*base) =3D iopte_protection | base_paddr;
> +	for (i =3D 0; i < npages; i++, base++, phys +=3D IO_PAGE_SIZE)
> +		iopte_val(*base) =3D iopte_protection | phys;
> =20
>  	return ret;
> =20
> @@ -383,7 +391,7 @@ static void strbuf_flush(struct strbuf *strbuf, struc=
t iommu *iommu,
>  		       vaddr, ctx, npages);
>  }
> =20
> -static void dma_4u_unmap_page(struct device *dev, dma_addr_t bus_addr,
> +static void dma_4u_unmap_phys(struct device *dev, dma_addr_t bus_addr,
>  			      size_t sz, enum dma_data_direction direction,
>  			      unsigned long attrs)
>  {
> @@ -753,8 +761,8 @@ static int dma_4u_supported(struct device *dev, u64 d=
evice_mask)
>  static const struct dma_map_ops sun4u_dma_ops =3D {
>  	.alloc			=3D dma_4u_alloc_coherent,
>  	.free			=3D dma_4u_free_coherent,
> -	.map_page		=3D dma_4u_map_page,
> -	.unmap_page		=3D dma_4u_unmap_page,
> +	.map_phys		=3D dma_4u_map_phys,
> +	.unmap_phys		=3D dma_4u_unmap_phys,
>  	.map_sg			=3D dma_4u_map_sg,
>  	.unmap_sg		=3D dma_4u_unmap_sg,
>  	.sync_single_for_cpu	=3D dma_4u_sync_single_for_cpu,
> diff --git a/arch/sparc/kernel/pci_sun4v.c b/arch/sparc/kernel/pci_sun4v.=
c
> index b720b21ccfbd..791f0a76665f 100644
> --- a/arch/sparc/kernel/pci_sun4v.c
> +++ b/arch/sparc/kernel/pci_sun4v.c
> @@ -352,9 +352,8 @@ static void dma_4v_free_coherent(struct device *dev, =
size_t size, void *cpu,
>  		free_pages((unsigned long)cpu, order);
>  }
> =20
> -static dma_addr_t dma_4v_map_page(struct device *dev, struct page *page,
> -				  unsigned long offset, size_t sz,
> -				  enum dma_data_direction direction,
> +static dma_addr_t dma_4v_map_phys(struct device *dev, phys_addr_t phys,
> +				  size_t sz, enum dma_data_direction direction,
>  				  unsigned long attrs)
>  {
>  	struct iommu *iommu;
> @@ -362,18 +361,27 @@ static dma_addr_t dma_4v_map_page(struct device *de=
v, struct page *page,
>  	struct iommu_map_table *tbl;
>  	u64 mask;
>  	unsigned long flags, npages, oaddr;
> -	unsigned long i, base_paddr;
> -	unsigned long prot;
> +	unsigned long i, prot;
>  	dma_addr_t bus_addr, ret;
>  	long entry;
> =20
> +	if (unlikely(attrs & DMA_ATTR_MMIO))
> +		/*
> +		 * This check is included because older versions of the code
> +		 * lacked MMIO path support, and my ability to test this path
> +		 * is limited. However, from a software technical standpoint,
> +		 * there is no restriction, as the following code operates
> +		 * solely on physical addresses.
> +		 */
> +		goto bad;
> +
>  	iommu =3D dev->archdata.iommu;
>  	atu =3D iommu->atu;
> =20
>  	if (unlikely(direction =3D=3D DMA_NONE))
>  		goto bad;
> =20
> -	oaddr =3D (unsigned long)(page_address(page) + offset);
> +	oaddr =3D (unsigned long)(phys_to_virt(phys));
>  	npages =3D IO_PAGE_ALIGN(oaddr + sz) - (oaddr & IO_PAGE_MASK);
>  	npages >>=3D IO_PAGE_SHIFT;
> =20
> @@ -391,7 +399,6 @@ static dma_addr_t dma_4v_map_page(struct device *dev,=
 struct page *page,
> =20
>  	bus_addr =3D (tbl->table_map_base + (entry << IO_PAGE_SHIFT));
>  	ret =3D bus_addr | (oaddr & ~IO_PAGE_MASK);
> -	base_paddr =3D __pa(oaddr & IO_PAGE_MASK);
>  	prot =3D HV_PCI_MAP_ATTR_READ;
>  	if (direction !=3D DMA_TO_DEVICE)
>  		prot |=3D HV_PCI_MAP_ATTR_WRITE;
> @@ -403,8 +410,8 @@ static dma_addr_t dma_4v_map_page(struct device *dev,=
 struct page *page,
> =20
>  	iommu_batch_start(dev, prot, entry);
> =20
> -	for (i =3D 0; i < npages; i++, base_paddr +=3D IO_PAGE_SIZE) {
> -		long err =3D iommu_batch_add(base_paddr, mask);
> +	for (i =3D 0; i < npages; i++, phys +=3D IO_PAGE_SIZE) {
> +		long err =3D iommu_batch_add(phys, mask);
>  		if (unlikely(err < 0L))
>  			goto iommu_map_fail;
>  	}
> @@ -426,7 +433,7 @@ static dma_addr_t dma_4v_map_page(struct device *dev,=
 struct page *page,
>  	return DMA_MAPPING_ERROR;
>  }
> =20
> -static void dma_4v_unmap_page(struct device *dev, dma_addr_t bus_addr,
> +static void dma_4v_unmap_phys(struct device *dev, dma_addr_t bus_addr,
>  			      size_t sz, enum dma_data_direction direction,
>  			      unsigned long attrs)
>  {
> @@ -686,8 +693,8 @@ static int dma_4v_supported(struct device *dev, u64 d=
evice_mask)
>  static const struct dma_map_ops sun4v_dma_ops =3D {
>  	.alloc				=3D dma_4v_alloc_coherent,
>  	.free				=3D dma_4v_free_coherent,
> -	.map_page			=3D dma_4v_map_page,
> -	.unmap_page			=3D dma_4v_unmap_page,
> +	.map_phys			=3D dma_4v_map_phys,
> +	.unmap_phys			=3D dma_4v_unmap_phys,
>  	.map_sg				=3D dma_4v_map_sg,
>  	.unmap_sg			=3D dma_4v_unmap_sg,
>  	.dma_supported			=3D dma_4v_supported,
> diff --git a/arch/sparc/mm/io-unit.c b/arch/sparc/mm/io-unit.c
> index d8376f61b4d0..d409cb450de4 100644
> --- a/arch/sparc/mm/io-unit.c
> +++ b/arch/sparc/mm/io-unit.c
> @@ -94,13 +94,14 @@ static int __init iounit_init(void)
>  subsys_initcall(iounit_init);
> =20
>  /* One has to hold iounit->lock to call this */
> -static unsigned long iounit_get_area(struct iounit_struct *iounit, unsig=
ned long vaddr, int size)
> +static dma_addr_t iounit_get_area(struct iounit_struct *iounit,
> +				  phys_addr_t phys, int size)
>  {
>  	int i, j, k, npages;
>  	unsigned long rotor, scan, limit;
>  	iopte_t iopte;
> =20
> -        npages =3D ((vaddr & ~PAGE_MASK) + size + (PAGE_SIZE-1)) >> PAGE=
_SHIFT;
> +	npages =3D (offset_in_page(phys) + size + (PAGE_SIZE - 1)) >> PAGE_SHIF=
T;
> =20
>  	/* A tiny bit of magic ingredience :) */
>  	switch (npages) {
> @@ -109,7 +110,7 @@ static unsigned long iounit_get_area(struct iounit_st=
ruct *iounit, unsigned long
>  	default: i =3D 0x0213; break;
>  	}
>  =09
> -	IOD(("iounit_get_area(%08lx,%d[%d])=3D", vaddr, size, npages));
> +	IOD(("%s(%pa,%d[%d])=3D", __func__, &phys, size, npages));
>  =09
>  next:	j =3D (i & 15);
>  	rotor =3D iounit->rotor[j - 1];
> @@ -124,7 +125,8 @@ nexti:	scan =3D find_next_zero_bit(iounit->bmap, limi=
t, scan);
>  		}
>  		i >>=3D 4;
>  		if (!(i & 15))
> -			panic("iounit_get_area: Couldn't find free iopte slots for (%08lx,%d)=
\n", vaddr, size);
> +			panic("iounit_get_area: Couldn't find free iopte slots for (%pa,%d)\n=
",
> +			      &phys, size);
>  		goto next;
>  	}
>  	for (k =3D 1, scan++; k < npages; k++)
> @@ -132,30 +134,29 @@ nexti:	scan =3D find_next_zero_bit(iounit->bmap, li=
mit, scan);
>  			goto nexti;
>  	iounit->rotor[j - 1] =3D (scan < limit) ? scan : iounit->limit[j - 1];
>  	scan -=3D npages;
> -	iopte =3D MKIOPTE(__pa(vaddr & PAGE_MASK));
> -	vaddr =3D IOUNIT_DMA_BASE + (scan << PAGE_SHIFT) + (vaddr & ~PAGE_MASK)=
;
> +	iopte =3D MKIOPTE(phys & PAGE_MASK);
> +	phys =3D IOUNIT_DMA_BASE + (scan << PAGE_SHIFT) + offset_in_page(phys);
>  	for (k =3D 0; k < npages; k++, iopte =3D __iopte(iopte_val(iopte) + 0x1=
00), scan++) {
>  		set_bit(scan, iounit->bmap);
>  		sbus_writel(iopte_val(iopte), &iounit->page_table[scan]);
>  	}
> -	IOD(("%08lx\n", vaddr));
> -	return vaddr;
> +	IOD(("%pa\n", &phys));
> +	return phys;
>  }
> =20
> -static dma_addr_t iounit_map_page(struct device *dev, struct page *page,
> -		unsigned long offset, size_t len, enum dma_data_direction dir,
> -		unsigned long attrs)
> +static dma_addr_t iounit_map_phys(struct device *dev, phys_addr_t phys,
> +		size_t len, enum dma_data_direction dir, unsigned long attrs)
>  {
> -	void *vaddr =3D page_address(page) + offset;
>  	struct iounit_struct *iounit =3D dev->archdata.iommu;
> -	unsigned long ret, flags;
> +	unsigned long flags;
> +	dma_addr_t ret;
>  =09
>  	/* XXX So what is maxphys for us and how do drivers know it? */
>  	if (!len || len > 256 * 1024)
>  		return DMA_MAPPING_ERROR;
> =20
>  	spin_lock_irqsave(&iounit->lock, flags);
> -	ret =3D iounit_get_area(iounit, (unsigned long)vaddr, len);
> +	ret =3D iounit_get_area(iounit, phys, len);
>  	spin_unlock_irqrestore(&iounit->lock, flags);
>  	return ret;
>  }
> @@ -171,14 +172,15 @@ static int iounit_map_sg(struct device *dev, struct=
 scatterlist *sgl, int nents,
>  	/* FIXME: Cache some resolved pages - often several sg entries are to t=
he same page */
>  	spin_lock_irqsave(&iounit->lock, flags);
>  	for_each_sg(sgl, sg, nents, i) {
> -		sg->dma_address =3D iounit_get_area(iounit, (unsigned long) sg_virt(sg=
), sg->length);
> +		sg->dma_address =3D
> +			iounit_get_area(iounit, sg_phys(sg), sg->length);
>  		sg->dma_length =3D sg->length;
>  	}
>  	spin_unlock_irqrestore(&iounit->lock, flags);
>  	return nents;
>  }
> =20
> -static void iounit_unmap_page(struct device *dev, dma_addr_t vaddr, size=
_t len,
> +static void iounit_unmap_phys(struct device *dev, dma_addr_t vaddr, size=
_t len,
>  		enum dma_data_direction dir, unsigned long attrs)
>  {
>  	struct iounit_struct *iounit =3D dev->archdata.iommu;
> @@ -279,8 +281,8 @@ static const struct dma_map_ops iounit_dma_ops =3D {
>  	.alloc			=3D iounit_alloc,
>  	.free			=3D iounit_free,
>  #endif
> -	.map_page		=3D iounit_map_page,
> -	.unmap_page		=3D iounit_unmap_page,
> +	.map_phys		=3D iounit_map_phys,
> +	.unmap_phys		=3D iounit_unmap_phys,
>  	.map_sg			=3D iounit_map_sg,
>  	.unmap_sg		=3D iounit_unmap_sg,
>  };
> diff --git a/arch/sparc/mm/iommu.c b/arch/sparc/mm/iommu.c
> index 5a5080db800f..f48adf62724a 100644
> --- a/arch/sparc/mm/iommu.c
> +++ b/arch/sparc/mm/iommu.c
> @@ -181,18 +181,20 @@ static void iommu_flush_iotlb(iopte_t *iopte, unsig=
ned int niopte)
>  	}
>  }
> =20
> -static dma_addr_t __sbus_iommu_map_page(struct device *dev, struct page =
*page,
> -		unsigned long offset, size_t len, bool per_page_flush)
> +static dma_addr_t __sbus_iommu_map_phys(struct device *dev, phys_addr_t =
paddr,
> +		size_t len, bool per_page_flush, unsigned long attrs)
>  {
>  	struct iommu_struct *iommu =3D dev->archdata.iommu;
> -	phys_addr_t paddr =3D page_to_phys(page) + offset;
> -	unsigned long off =3D paddr & ~PAGE_MASK;
> +	unsigned long off =3D offset_in_page(paddr);
>  	unsigned long npages =3D (off + len + PAGE_SIZE - 1) >> PAGE_SHIFT;
>  	unsigned long pfn =3D __phys_to_pfn(paddr);
>  	unsigned int busa, busa0;
>  	iopte_t *iopte, *iopte0;
>  	int ioptex, i;
> =20
> +	if (unlikely(attrs & DMA_ATTR_MMIO))
> +		return DMA_MAPPING_ERROR;
> +
>  	/* XXX So what is maxphys for us and how do drivers know it? */
>  	if (!len || len > 256 * 1024)
>  		return DMA_MAPPING_ERROR;
> @@ -202,10 +204,10 @@ static dma_addr_t __sbus_iommu_map_page(struct devi=
ce *dev, struct page *page,
>  	 * XXX Is this a good assumption?
>  	 * XXX What if someone else unmaps it here and races us?
>  	 */
> -	if (per_page_flush && !PageHighMem(page)) {
> +	if (per_page_flush && !PhysHighMem(paddr)) {
>  		unsigned long vaddr, p;
> =20
> -		vaddr =3D (unsigned long)page_address(page) + offset;
> +		vaddr =3D (unsigned long)phys_to_virt(paddr);
>  		for (p =3D vaddr & PAGE_MASK; p < vaddr + len; p +=3D PAGE_SIZE)
>  			flush_page_for_dma(p);
>  	}
> @@ -231,19 +233,19 @@ static dma_addr_t __sbus_iommu_map_page(struct devi=
ce *dev, struct page *page,
>  	return busa0 + off;
>  }
> =20
> -static dma_addr_t sbus_iommu_map_page_gflush(struct device *dev,
> -		struct page *page, unsigned long offset, size_t len,
> -		enum dma_data_direction dir, unsigned long attrs)
> +static dma_addr_t sbus_iommu_map_phys_gflush(struct device *dev,
> +		phys_addr_t phys, size_t len, enum dma_data_direction dir,
> +		unsigned long attrs)
>  {
>  	flush_page_for_dma(0);
> -	return __sbus_iommu_map_page(dev, page, offset, len, false);
> +	return __sbus_iommu_map_phys(dev, phys, len, false, attrs);
>  }
> =20
> -static dma_addr_t sbus_iommu_map_page_pflush(struct device *dev,
> -		struct page *page, unsigned long offset, size_t len,
> -		enum dma_data_direction dir, unsigned long attrs)
> +static dma_addr_t sbus_iommu_map_phys_pflush(struct device *dev,
> +		phys_addr_t phys, size_t len, enum dma_data_direction dir,
> +		unsigned long attrs)
>  {
> -	return __sbus_iommu_map_page(dev, page, offset, len, true);
> +	return __sbus_iommu_map_phys(dev, phys, len, true, attrs);
>  }
> =20
>  static int __sbus_iommu_map_sg(struct device *dev, struct scatterlist *s=
gl,
> @@ -254,8 +256,8 @@ static int __sbus_iommu_map_sg(struct device *dev, st=
ruct scatterlist *sgl,
>  	int j;
> =20
>  	for_each_sg(sgl, sg, nents, j) {
> -		sg->dma_address =3D__sbus_iommu_map_page(dev, sg_page(sg),
> -				sg->offset, sg->length, per_page_flush);
> +		sg->dma_address =3D __sbus_iommu_map_phys(dev, sg_phys(sg),
> +				sg->length, per_page_flush, attrs);
>  		if (sg->dma_address =3D=3D DMA_MAPPING_ERROR)
>  			return -EIO;
>  		sg->dma_length =3D sg->length;
> @@ -277,7 +279,7 @@ static int sbus_iommu_map_sg_pflush(struct device *de=
v, struct scatterlist *sgl,
>  	return __sbus_iommu_map_sg(dev, sgl, nents, dir, attrs, true);
>  }
> =20
> -static void sbus_iommu_unmap_page(struct device *dev, dma_addr_t dma_add=
r,
> +static void sbus_iommu_unmap_phys(struct device *dev, dma_addr_t dma_add=
r,
>  		size_t len, enum dma_data_direction dir, unsigned long attrs)
>  {
>  	struct iommu_struct *iommu =3D dev->archdata.iommu;
> @@ -303,7 +305,7 @@ static void sbus_iommu_unmap_sg(struct device *dev, s=
truct scatterlist *sgl,
>  	int i;
> =20
>  	for_each_sg(sgl, sg, nents, i) {
> -		sbus_iommu_unmap_page(dev, sg->dma_address, sg->length, dir,
> +		sbus_iommu_unmap_phys(dev, sg->dma_address, sg->length, dir,
>  				attrs);
>  		sg->dma_address =3D 0x21212121;
>  	}
> @@ -426,8 +428,8 @@ static const struct dma_map_ops sbus_iommu_dma_gflush=
_ops =3D {
>  	.alloc			=3D sbus_iommu_alloc,
>  	.free			=3D sbus_iommu_free,
>  #endif
> -	.map_page		=3D sbus_iommu_map_page_gflush,
> -	.unmap_page		=3D sbus_iommu_unmap_page,
> +	.map_phys		=3D sbus_iommu_map_phys_gflush,
> +	.unmap_phys		=3D sbus_iommu_unmap_phys,
>  	.map_sg			=3D sbus_iommu_map_sg_gflush,
>  	.unmap_sg		=3D sbus_iommu_unmap_sg,
>  };
> @@ -437,8 +439,8 @@ static const struct dma_map_ops sbus_iommu_dma_pflush=
_ops =3D {
>  	.alloc			=3D sbus_iommu_alloc,
>  	.free			=3D sbus_iommu_free,
>  #endif
> -	.map_page		=3D sbus_iommu_map_page_pflush,
> -	.unmap_page		=3D sbus_iommu_unmap_page,
> +	.map_phys		=3D sbus_iommu_map_phys_pflush,
> +	.unmap_phys		=3D sbus_iommu_unmap_phys,
>  	.map_sg			=3D sbus_iommu_map_sg_pflush,
>  	.unmap_sg		=3D sbus_iommu_unmap_sg,
>  };

This change has just been reported to cause a regression with the igb
driver on some SPARC server systems:

Feb 16 15:20:22 sparcy kernel: igb 0000:0c:00.0 enp12s0f0: igb: enp12s0f0 N=
IC Link is Up 1000 Mbps Full Duplex, Flow Control: RX/TX=20
Feb 16 15:20:23 sparcy kernel: iommu_batch_flush: ATU map of [00000400:2:10=
00000000a7d:1:2736c000] failed with status 8=20
Feb 16 15:20:23 sparcy kernel: igb 0000:0c:00.0: TX DMA map failed=20
Feb 16 15:20:23 sparcy kernel: iommu_batch_flush: ATU map of [00000400:2:10=
00000000a7e:1:2736c000] failed with status 8=20
Feb 16 15:20:23 sparcy kernel: igb 0000:0c:00.0: TX DMA map failed=20
Feb 16 15:20:23 sparcy kernel: igb 0000:0c:00.1 enp12s0f1: igb: enp12s0f1 N=
IC Link is Up 100 Mbps Full Duplex, Flow Control: RX=20
Feb 16 15:20:23 sparcy kernel: iommu_batch_flush: ATU map of [00000400:2:10=
000001c02af:1:2736e000] failed with status 8=20
Feb 16 15:20:23 sparcy kernel: iommu_batch_flush: ATU map of [00000400:2:10=
0000038009f:1:27390000] failed with status 8=20
Feb 16 15:20:23 sparcy kernel: igb 0000:0c:00.1: TX DMA map failed=20
Feb 16 15:20:23 sparcy last message buffered 1 times=20
Feb 16 15:20:23 sparcy kernel: iommu_batch_flush: ATU map of [00000400:2:10=
000001c02b1:1:2736e000] failed with status 8=20
Feb 16 15:20:23 sparcy kernel: igb 0000:0c:00.0: TX DMA map failed=20
Feb 16 15:20:24 sparcy kernel: iommu_batch_flush: ATU map of [00000400:2:10=
00000000a80:1:2736c000] failed with status 8=20
Feb 16 15:20:24 sparcy kernel: igb 0000:0c:00.0: TX DMA map failed=20
Feb 16 15:20:24 sparcy kernel: iommu_batch_flush: ATU map of [00000400:2:10=
00000000a81:1:2736c000] failed with status 8=20
Feb 16 15:20:24 sparcy kernel: igb 0000:0c:00.0: TX DMA map failed=20
Feb 16 15:20:24 sparcy kernel: iommu_batch_flush: ATU map of [00000400:2:10=
00000200000:1:2738e000] failed with status 8=20
Feb 16 15:20:24 sparcy kernel: igb 0000:0c:00.1: TX DMA map failed=20
Feb 16 15:20:24 sparcy kernel: iommu_batch_flush: ATU map of [00000400:2:10=
00000000a82:1:2736c000] failed with status 8=20
Feb 16 15:20:24 sparcy kernel: igb 0000:0c:00.1: TX DMA map failed

Please see also the discussion in [1].

Adrian

> [1] https://github.com/sparclinux/issues/issues/75

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

