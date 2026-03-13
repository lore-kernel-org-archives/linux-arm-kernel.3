Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB91F107BCD9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 19:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dcR5tWU0ZU+jYis8iRbUuTj0aoWXm2TZU5idmPqxVks=; b=RmeQ+0gpa2pPQUKj6pg3nFNl9Q
	FbfgbDYpxY6CuyCsGAECFowoFdmEYHvU+4NEwihJw7mth4z+s5sqs2pbJ+R8Vl4c13M26nar6+fEw
	Dz0z6JMZM/bClXxccbt8T286SBcGmdRNIY0EWLrct4ZUywAEEaENOSBy/UVnI6XxnfFW8ATFQCPhj
	35SS5lsPI0hGUmZMGmh/cybvKuY85+JDeUcWXwT5JD/K9VTCbdiabGP3SF9F7qzPAB//pHRaiOF1p
	RmrbG0goyQDd4kEwndhC/PGhWSoC8ruIT4WWa6+uMACCdy/XPyRkuIuGyvli3cscl3oa87hdwpjtY
	Nao/U7XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w18Je-000000015Lb-1L3Q;
	Fri, 13 Mar 2026 19:36:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w18Jc-000000015L7-1nq2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 19:36:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBBA21758;
	Fri, 13 Mar 2026 12:36:48 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 48CBD3F694;
	Fri, 13 Mar 2026 12:36:52 -0700 (PDT)
Date: Fri, 13 Mar 2026 19:36:50 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v3 0/5] dma-mapping: arm64: support batched cache sync
Message-ID: <abRnUk-vfvS51FtW@arm.com>
References: <CGME20260228221143eucas1p12a276d4216b6ce0f3c374b093f73acd5@eucas1p1.samsung.com>
 <20260228221125.59863-1-21cnbao@gmail.com>
 <3ece80c7-697e-4d46-a6f8-49c07b0117a1@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3ece80c7-697e-4d46-a6f8-49c07b0117a1@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_123656_508877_92E6F69D 
X-CRM114-Status: GOOD (  17.85  )
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
Cc: Juergen Gross <jgross@suse.com>, Tangquan Zheng <zhengtangquan@oppo.com>, Barry Song <baohua@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, Leon Romanovsky <leon@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>, will@kernel.org, Joerg Roedel <joro@8bytes.org>, Barry Song <21cnbao@gmail.com>, linux-kernel@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>, iommu@lists.linux.dev, Xueyuan Chen <xueyuan.chen21@gmail.com>, Marc Zyngier <maz@kernel.org>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, robin.murphy@arm.com, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org, Huacai Zhou <zhouhuacai@oppo.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Mar 03, 2026 at 05:33:37PM +0100, Marek Szyprowski wrote:
> On 28.02.2026 23:11, Barry Song wrote:
> > From: Barry Song <baohua@kernel.org>
> >
> > Many embedded ARM64 SoCs still lack hardware cache coherency support, which
> > causes DMA mapping operations to appear as hotspots in on-CPU flame graphs.
> >
> > For an SG list with *nents* entries, the current dma_map/unmap_sg() and DMA
> > sync APIs perform cache maintenance one entry at a time. After each entry,
> > the implementation synchronously waits for the corresponding region’s
> > D-cache operations to complete. On architectures like arm64, efficiency can
> > be improved by issuing all entries’ operations first and then performing a
> > single batched wait for completion.
> >
> > Tangquan's results show that batched synchronization can reduce
> > dma_map_sg() time by 64.61% and dma_unmap_sg() time by 66.60% on an MTK
> > phone platform (MediaTek Dimensity 9500). The tests were performed by
> > pinning the task to CPU7 and fixing the CPU frequency at 2.6 GHz,
> > running dma_map_sg() and dma_unmap_sg() on 10 MB buffers (10 MB / 4 KB
> > sg entries per buffer) for 200 iterations and then averaging the
> > results.
> >
> > Thanks to Xueyuan for volunteering to take on the testing tasks. He
> > put significant effort into validating paths such as IOVA link/unlink
> > and SWIOTLB on RK3588 boards with NVMe.
> 
> Catalin, Will, I would like to merge this to dma-mapping tree, give Your 
> ack or comment if You are okay with ARM64 related parts.

Sorry for the delay. Yes, feel free to pick them up. I doubt there would
be any conflicts in this area with what I'm merging through the arm64
tree.

Thanks.

-- 
Catalin

