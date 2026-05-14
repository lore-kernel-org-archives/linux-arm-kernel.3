Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A19CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 06:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lVwzh7YuBLKrnB/3wy8MuXgNUlPj7/YkEbnMaWT4mW0=; b=voqp3OqrW4RK1ZAvEyPuTdnkQ1
	/hMUswMAhjw0UkLEkXm9GPUqYwlPul3Yi2n2gbiwgicWvK0j8rwpNfEnO0bo7A99T5PYsPPA+1z+5
	KPQN34OPhv7MyZjbR145ISXmtcUw5N9HUF53MRCIrEO5KeIVKjWMpGGVUNzqry8dYyt2nZeTyLIUw
	ZyLJEdNqyoUMfdUgIbEeSC3TZ/nORAf5nDvYh5dlKpkYHNkfAfbMDQdAiJfVnHKKRrwF27+ps5Cg5
	C+Pd3LMKhRBWYv/BfT3JBHB/e7LBQ6LLbWwenZ5SrmNLFDpKGc/caiijP7uZg8dXaSAA1KouzrmBX
	8xiVpang==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNPUz-00000004i58-43AT;
	Thu, 14 May 2026 06:24:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNPUy-00000004i4u-2VWE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 06:24:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F0FEE600AE;
	Thu, 14 May 2026 06:24:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A983DC2BCB7;
	Thu, 14 May 2026 06:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778739883;
	bh=ecGsHNVV/zGWfQo2KCz+UMgNIz0oxNVr7CL3H1ueicQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VIFBftDkTqQvTeGSGdUb63C6Y5jX6Qcf/aCnqTSus57moAmWsHaY20Ek8+NzNXF7I
	 r30wh4vj1ifGB0fA2KjcIkRogw3gf/w/DwCz8rVK9iAc/K453wPiIu8E8hBCt7TUx+
	 djavHnjghAjLiadXV9zorYImb47+oIv4wV/oN58jnzuEcvJqM5fABJjEe+zUiHiIwr
	 2QhZIGpd2mWiRm0jNgOlqLkPgQDFCTqrCKFDe2+QllPsd7D5xi2BKD5Z4yDZF3gpjR
	 +BGATD5Q3YuIez48+zWs0mHgv5HFqviNpKfMGsjB3Cx0lI1Sy1ANa46iOb/RUQrXqA
	 h/GpqX2YIjQlQ==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>,
	Mostafa Saleh <smostafa@google.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>,
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
In-Reply-To: <20260513172450.GR7702@ziepe.ca>
References: <20260512090408.794195-1-aneesh.kumar@kernel.org>
 <20260512090408.794195-5-aneesh.kumar@kernel.org>
 <agSKQrSIhizCXKwx@google.com> <20260513172450.GR7702@ziepe.ca>
Date: Thu, 14 May 2026 11:54:30 +0530
Message-ID: <yq5aecjea4pt.fsf@kernel.org>
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

Jason Gunthorpe <jgg@ziepe.ca> writes:

>> And that brings us to the same point whether it=E2=80=99s better to retu=
rn
>> the memory along with it=E2=80=99s state or we pass the requested state.
>> I think for other cases it=E2=80=99s fine for the device/DMA-API to dict=
ate
>> the attrs, but not in restricted-dma case, the firmware just knows bette=
r.
>
> The memory type must be returned back at some level so downstream
> things can do the right transformation of the phys_addr_t.
>
> One of the aspirational CC things that should work is a T=3D1 device
> tries to DMA from a decrypted page, finds the address is above the dma
> limit of the device, so it bounces it with SWIOTLB to an encrypted low
> address page and then the DMA API internal flow switiches from working
> with decrypted to encrypted phys_addr_t.
>
> If we can make that work then maybe the flows are designed correctly.
>

That is what this patch series aims to do. dma_direct_map_phys() will
derive the DMA address based on the attributes of the physical address:

if (attrs & DMA_ATTR_CC_SHARED)
        dma_addr =3D phys_to_dma_unencrypted(dev, phys);
else
        dma_addr =3D phys_to_dma_encrypted(dev, phys);

If that fails the dma_capable() check, we fall back to swiotlb_map():

if (unlikely(!dma_capable(dev, dma_addr, size, true, attrs)))
        return swiotlb_map(dev, phys, size, dir, attrs);

We currently do not have an encrypted SWIOTLB pool, but once that is
supported, swiotlb_map() should do the right thing and return the
correct encrypted dma_addr_t based on io_tlb_mem->unencrypted:

if (dev->dma_io_tlb_mem->unencrypted) {
        dma_addr =3D phys_to_dma_unencrypted(dev, swiotlb_addr);
        attrs |=3D DMA_ATTR_CC_SHARED;
} else {
        dma_addr =3D phys_to_dma_encrypted(dev, swiotlb_addr);
}

-aneesh

