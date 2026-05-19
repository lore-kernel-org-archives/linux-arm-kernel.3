Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F396DCD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 12:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=giGCMqDpZvOYaPXFHvByTdWlAM3FpvuXoYiriOAx8IA=; b=UhigvE8xcU++tMchwCQjbkQYYy
	DmAZ3xeaPNnYG8W61df/SjiCRTgJUpMNLB/aCoxBX/Is2abXDQyOBvQB/UfePcXkFs/D2wU9iKxN4
	9bIqzd6n1gmI/CEJgDpqaMFXoZNBBm4pqRI1fotaW1GTTxwFNM7vwrQ1B9Ds+2Vjra29SZqZH9EVM
	dRRG4q3Hsp5lHvZlZm/ZxphiKm668+MYJ7GMcTZoLTUz4SB1/mSIFxAEwrv382GulbJRAp1JRA3po
	ZXb76Hkhg0tnQxOOZe4+Gn37QdyZU3ac4DEa+PdWTmg2WuCJIjdQ/UOxV/Ie/CRLPrIdJ1y0F3rZN
	F3lnNWJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPJY8-00000001TNA-3ku7;
	Tue, 19 May 2026 12:27:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPJY7-00000001TMe-2Xnb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 12:27:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7BAFC60126;
	Tue, 19 May 2026 12:27:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32C3FC2BCB3;
	Tue, 19 May 2026 12:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779193670;
	bh=oh5xPm7aO87/jnT+7JZsE59suIMOg+uwG7kUANkSuuI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=s3oeSiK56KkasaDy21lXdRfQDszSI3yWcCMnoLlKn+41S+6zU+PAJqEy2hv5A8k+E
	 GtFnA/KesjHZTSVPVbtE0+H6iwxJYXPK16SxOeloY4HxuZnWheY5jMOXopVGzmD/tX
	 x0estu0/tyUMY5mo9AOcnX4J4MK/2WrIN/uHZSCL9536avpyokio0u8SsTUgEz0JZS
	 krheaIjJ+T0JM9+sgG7PVkxCYbXPfMPvZiIraW7/42ON+11dSoUaWtXRmITP+pQZ6v
	 MR6kg+qxSRKziQEl05pFMLwJ1RLRLf5uTVMWAk0hWiC8FQd6nHG9rmr97bALIPojqF
	 8G/bTvvjCUjWw==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Subject: Re: [PATCH v4 04/13] dma: swiotlb: track pool encryption state and
 honor DMA_ATTR_CC_SHARED
In-Reply-To: <agxDxdxynp4KEovA@google.com>
References: <20260512090408.794195-1-aneesh.kumar@kernel.org>
 <20260512090408.794195-5-aneesh.kumar@kernel.org>
 <agSKQrSIhizCXKwx@google.com> <yq5ah5oaa63h.fsf@kernel.org>
 <agW5rhE9n2gDQ0w5@google.com> <yq5apl2y5f96.fsf@kernel.org>
 <agXaby-7L7yS3Vva@google.com> <yq5ah5oa59wy.fsf@kernel.org>
 <agxDxdxynp4KEovA@google.com>
Date: Tue, 19 May 2026 17:57:39 +0530
Message-ID: <yq5amrxvshxg.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Mostafa Saleh <smostafa@google.com> writes:

> On Thu, May 14, 2026 at 08:13:25PM +0530, Aneesh Kumar K.V wrote:
>> >>=20
>> >> What I meant was that we need a generic way to identify a pKVM guest,=
 so
>> >> that we can use it in the conditional above.
>> >
>> > I have this patch, with that I can boot with your series unmodified,
>> > but I will need to do more testing.
>> >
>>=20
>> Thanks, I can add this to the series once you complete the required test=
ing.
>>=20
>
> I am still running more tests, but looking more into it. Setting
> force_dma_unencrypted() to true for pKVM guests is wrong, as the
> guest shouldn=E2=80=99t try to decrypt arbitrary memory as it can include
> sensitive information (for example in case of virtio sub-page
> allocation) and should strictly rely on the restricted-dma-pool
> for that.
>
> However, with my patch and setting force_dma_unencrypted() to false
> on top of this series, it fails on pKVM due to a missing shared
> attribute as Alexey mentioned, as now SWIOTLB rejects non shared
> attrs, so, the DMA-API has to pass it. With that, I can boot again:
>
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index 5103a04df99f..b19aeec03f27 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -286,6 +286,8 @@ void *dma_direct_alloc(struct device *dev, size_t siz=
e,
>  	}
>=20=20
>  	if (is_swiotlb_for_alloc(dev)) {
> +		attrs |=3D DMA_ATTR_CC_SHARED;
> +
>  		page =3D dma_direct_alloc_swiotlb(dev, size, attrs);
>  		if (page) {
>  			/*
> @@ -449,6 +451,8 @@ struct page *dma_direct_alloc_pages(struct device *de=
v, size_t size,
>  						  &cpu_addr, gfp, attrs);
>=20=20
>  	if (is_swiotlb_for_alloc(dev)) {
> +		attrs |=3D DMA_ATTR_CC_SHARED;
> +
>  		page =3D dma_direct_alloc_swiotlb(dev, size, attrs);
>  		if (!page)
>  			return NULL;
> diff --git a/kernel/dma/direct.h b/kernel/dma/direct.h
> index 4e35264ab6f8..8ee5bbf78cfb 100644
> --- a/kernel/dma/direct.h
> +++ b/kernel/dma/direct.h
> @@ -92,6 +92,7 @@ static inline dma_addr_t dma_direct_map_phys(struct dev=
ice *dev,
>  		if (attrs & (DMA_ATTR_MMIO | DMA_ATTR_REQUIRE_COHERENT))
>  			return DMA_MAPPING_ERROR;
>=20=20
> +		attrs |=3D DMA_ATTR_CC_SHARED;
>  		return swiotlb_map(dev, phys, size, dir, attrs);
>  	}
>=20=20
> --
>

How about the below?

modified   kernel/dma/direct.c
@@ -278,6 +278,10 @@ void *dma_direct_alloc(struct device *dev, size_t size,
 	}
=20
 	if (is_swiotlb_for_alloc(dev)) {
+
+		if (dev->dma_io_tlb_mem->unencrypted)
+			attrs |=3D DMA_ATTR_CC_SHARED;
+
 		page =3D dma_direct_alloc_swiotlb(dev, size, attrs);
 		if (page) {
 			/*
@@ -451,6 +455,10 @@ struct page *dma_direct_alloc_pages(struct device *dev=
, size_t size,
 						  &cpu_addr, gfp, attrs);
=20
 	if (is_swiotlb_for_alloc(dev)) {
+
+		if (dev->dma_io_tlb_mem->unencrypted)
+			attrs |=3D DMA_ATTR_CC_SHARED;
+
 		page =3D dma_direct_alloc_swiotlb(dev, size, attrs);
 		if (!page)
 			return NULL;
modified   kernel/dma/direct.h
@@ -92,6 +92,9 @@ static inline dma_addr_t dma_direct_map_phys(struct devic=
e *dev,
 		if (attrs & (DMA_ATTR_MMIO | DMA_ATTR_REQUIRE_COHERENT))
 			return DMA_MAPPING_ERROR;
=20
+		if (dev->dma_io_tlb_mem->unencrypted)
+			attrs |=3D DMA_ATTR_CC_SHARED;
+
 		return swiotlb_map(dev, phys, size, dir, attrs);
 	}
=20


>
>
> I will keep testing and let you know how it goes. If there is nothing
> else required to convert pKVM guests to CC, I can just post the patch
> separately as it has no dependency on this series.
>

That would be useful. I can then carry the patch as a dependent change,
which can also be merged separately

>
> Re force_dma_unencrypted(), I am looking into a safe way to use it
> for pKVM as I beleive it will be useful to eliminate some bouncing.
> However, that=E2=80=99s not critical for this series and can be added lat=
er
> as I am still investigating it, if I reach something I can post it
> along the pKVM patch above.
>
> Thanks,
> Mostafa
>
>>=20
>>=20
>> -aneesh

