Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0432CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 09:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KpCb7a3H9F8F15EmfeMLTB4Sq6tRF6n/NPt9w2wubf0=; b=M6zI1ha+NYN5/oN8tqsONEiFH0
	7ENCuIQ0aJRNXoKdZFpIVGqqhDSXi/s6dxOnx1FobGo2kPs0gH9mV7SGcLbHpPZ9EvSx4ej+ckAkg
	T7AEXkZeMPlF/z+9oXa/tIyZxTU6AAX4NMe0uPtF8NjSdIvUWLDt+0TFiJdDIwvdkmhyeUv6LxMy9
	DIgRVaSAphQzDf/WQ9VXKZ7ZoUtLkrDjKCg1dzuSl8x0SzkObnEsziNxkqJQ/WqUeLQnGZp6i/Y95
	BhmVjwdPpVEHg1tAtUYTx/YR/mFyabJyk+GFRxxN0/jus+JRU4UW1xCAblHifd4+ifXD0D7DRRHp7
	wH3Gjrtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMj4z-0000000GCki-33uo;
	Tue, 12 May 2026 09:07:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMj4w-0000000GCiM-3WoD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 09:07:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C1FE43D35;
	Tue, 12 May 2026 09:07:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B33B4C4AF0B;
	Tue, 12 May 2026 09:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778576822;
	bh=SSIb9AffiyCb4tbfwh2yXw5+hoFTxTK0yIF3uaiiYAE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GYt8EqYIRUIaavvPuaPJBda78vHlfhOtAKKCeYDhg/engtvJHFapVeF+Ah9i0/FJE
	 fmqDPRJJt7SSe8N9iKzSLfWg1ueFG/uoakkMNldaxV0NBL8W795piGnbSbOjFxer3x
	 tHzfEvWrtUMhKxo/JyVufOYkwYsug6srjyXOEIjelTyvy9oZ/2taZiPlIsn2rzbK3O
	 RiLHESdmu1hBj05ocJaxuEA7CLneYuZT5I0BkcjWHL1PfZiP2VuP1VgdVY++Z4b7Lu
	 bhpIZ1gADFwea0mdzaZWhQa/8g6VijT0S7COzlnLvOSszVAynSv150Z4ZnbbeAHNjR
	 D6fbBzbPj/3lw==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	linuxppc-dev@lists.ozlabs.org,
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
	Sven Schnelle <svens@linux.ibm.com>,
	x86@kernel.org
Subject: [PATCH v4 13/13] x86/amd-gart: preserve the direct DMA address until GART mapping succeeds
Date: Tue, 12 May 2026 14:34:08 +0530
Message-ID: <20260512090408.794195-14-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260512090408.794195-1-aneesh.kumar@kernel.org>
References: <20260512090408.794195-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_020703_396838_690A31AB 
X-CRM114-Status: GOOD (  10.38  )
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

gart_alloc_coherent() first allocates memory through dma_direct_alloc(),
which returns a direct-mapped DMA address in dma_addr. When force_iommu is
enabled, the buffer is then remapped.

Do not overwrite dma_addr before dma_map_area() has succeeded. Keep the
dma_map_area result in a temporary variable so the direct DMA address
remains available for dma_direct_free() on the error path.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 arch/x86/kernel/amd_gart_64.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/amd_gart_64.c b/arch/x86/kernel/amd_gart_64.c
index b5f1f031d45b..a109649c5649 100644
--- a/arch/x86/kernel/amd_gart_64.c
+++ b/arch/x86/kernel/amd_gart_64.c
@@ -467,18 +467,20 @@ gart_alloc_coherent(struct device *dev, size_t size, dma_addr_t *dma_addr,
 		    gfp_t flag, unsigned long attrs)
 {
 	void *vaddr;
+	dma_addr_t dma_map_addr;
 
 	vaddr = dma_direct_alloc(dev, size, dma_addr, flag, attrs);
 	if (!vaddr ||
 	    !force_iommu || dev->coherent_dma_mask <= DMA_BIT_MASK(24))
 		return vaddr;
 
-	*dma_addr = dma_map_area(dev, virt_to_phys(vaddr), size,
-				 DMA_BIDIRECTIONAL,
-				 (1UL << get_order(size)) - 1, attrs);
+	dma_map_addr = dma_map_area(dev, virt_to_phys(vaddr), size,
+				     DMA_BIDIRECTIONAL,
+				     (1UL << get_order(size)) - 1, attrs);
 	flush_gart();
-	if (unlikely(*dma_addr == DMA_MAPPING_ERROR))
+	if (unlikely(dma_map_addr == DMA_MAPPING_ERROR))
 		goto out_free;
+	*dma_addr = dma_map_addr;
 	return vaddr;
 out_free:
 	dma_direct_free(dev, size, vaddr, *dma_addr, attrs);
-- 
2.43.0


