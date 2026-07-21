Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6815DC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 12:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hHR20QdKLO7v/A9MVkG/crlJxAvTVIREme8pDXPWdpk=; b=ICe7b54dZeJH1EI5AJdVxJQSbj
	IcaTuioklYh3YvHfe8cPsws2s++DELOWUF73wv+fdPIxMriiaxSFsvoqvlCES/JHUv9Pt5eMBdZeG
	meYaDcfWdiBKa9dRrQuSkPVPwBbSeDS86sr3WO9ZQ+sweRjNi1oHFkuBe/A/jmHqEGTyn1oA4SgZx
	fw0HVfYbqGHMOvaPCdvfl9BJ0k6lwk3yH9wcwQ+NUs39FGA80w9Rg9v6qaAzGSr19Lzq07YMHP8Me
	0FCZWol0GVmZ1hSVOoQytv3B+RwDqz1RjHPWCggXtVBsx7vA169J/9hkShjkhbLxhYJI7O5sNrq+b
	7LQDYSKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm9mS-00000009RNp-2Cnk;
	Tue, 21 Jul 2026 12:41:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm9mQ-00000009RNh-3uRn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 12:41:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6A5D7404B3;
	Tue, 21 Jul 2026 12:41:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 192681F000E9;
	Tue, 21 Jul 2026 12:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784637662;
	bh=hHR20QdKLO7v/A9MVkG/crlJxAvTVIREme8pDXPWdpk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NAJKKs0mp2HmwOSTJulMZY5zyU9KSHD4BEHyX/3KSxaa6O0e2VNfyFDvHcEQrBIUW
	 bd82xmmgnk756BP7oXclO74C3UoYQ1RpyBCIMyFCTPKScXjr6JuhakROp532PhlGii
	 7+tvviJq58faR47mZtEi7AqNFpFYy9IdeQC20flk26Vt7yInq2BpBVQ+uTWDrRFQIw
	 +FUaxo2v+2zrzcANJTXCpP90ZjjCTSjtH3May7B81OOEfG5gnjI+7xflXFP/VICNWm
	 ngwbXG7eIyqM2nFDwd/Nrju8ruvTr6mFAlwtP7QUprRc0YvAWx8z4toMr8/O9/l88w
	 etg8T2ReDZfXA==
Date: Tue, 21 Jul 2026 15:40:56 +0300
From: Leon Romanovsky <leon@kernel.org>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Jason Gunthorpe <jgg@ziepe.ca>,
	Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
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
Subject: Re: [PATCH v8 00/23] dma-mapping: Track shared DMA state through
 direct, pool and swiotlb paths
Message-ID: <20260721124056.GK110966@unreal>
References: <20260717180442.110954-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717180442.110954-1-aneesh.kumar@kernel.org>
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

On Fri, Jul 17, 2026 at 11:34:18PM +0530, Aneesh Kumar K.V (Arm) wrote:
> This series tracks confidential-computing shared DMA state through the
> dma-direct, dma-pool, and swiotlb paths so that encrypted and decrypted
> DMA buffers are handled consistently.

<...>

> - makes dma_direct_map_phys() choose the DMA address encoding from
>   DMA_ATTR_CC_SHARED and fall back to swiotlb when a shared DMA request
>   cannot use the direct mapping, which lets arm64 and x86 CCA guests stop
>   relying on SWIOTLB_FORCE for DMA mappings

Why don't we continue the effort to remove "struct page" entirely
from the DMA API internals?

IMHO, everything not exposed to DMA API users should use
phys_addr_t, including the DMA address pool.

Thanks

