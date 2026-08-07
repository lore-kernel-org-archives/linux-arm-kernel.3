Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733FFC5AC80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 09:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n1DOBxxHQjvAtdVCr2XmzOoDCY/LkKFWumLIHDVnml4=; b=pMefpPWVpLkTLpdcghbOrbA3UN
	AOAIjSDWg3en6rFU5dRWdrlDXE0v9og9ERMdMwte1eixPY2g1Br5OceO+oSWBnT58YUFsDkwIaFz6
	cw2YQ4T/cX8Y397zE2fBZOot6tv/oKSdQVVgXiPqWxoxREDU1dqtRf3mY3plzGxBE0WyQKyYo4xAu
	wGZLWp70rd3cJPXlp9E/H1Dv3iagPuJQ3v7RLfOBkmQbGeOPpWuKPry6onXksWCBRViL0syKot9fX
	DEky1Ro8wO/2kvO/R3mfDysK2n7aLoNIbvKhHOh4Ma8AuBF8g1d/psxZQWPPAhX26bM7T1o50OeYm
	1WCFV5Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsGqS-00000007W7o-26am;
	Fri, 07 Aug 2026 09:26:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsGqR-00000007W7g-09Vk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 09:26:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5464760AB0;
	Fri,  7 Aug 2026 09:26:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B15F61F000E9;
	Fri,  7 Aug 2026 09:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786094786;
	bh=n1DOBxxHQjvAtdVCr2XmzOoDCY/LkKFWumLIHDVnml4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KfRd+7a/nQO5IHNyvsOPwguzYdeKqDRBtEiWacDi8mGZTtLnEJKuLyO6lsWudhrXX
	 Vjjh9c97Ixvp/GYuP/+8kczArrIotpjs+kee9O4So34wX1//sc1uZ4vU5zKkxj5o8C
	 ybxndGlgdAlKbBuROyiRVYbKZnwpCrnt+bqJe/XwtNOLHjc6fybJgRFYODdA3/hHsd
	 1iBuJRXBPFB4CfqFWpvLpZJSf3wPTHCNFxEieHBehqy968HIRk80iepSvtieSEy2DJ
	 OqfvvdvfLrRXVQ4vx9/D1V+LE6LR6bnyPivnccbVVWDr5bA4t1vmy5GyKPlCdC5712
	 NlmIj347nR/FQ==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev
Cc: Robin Murphy <robin.murphy@arm.com>,
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
	Christophe Leroy <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	x86@kernel.org,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Subject: [PATCH] arm64: swiotlb: Keep the default size for protected guests
Date: Fri,  7 Aug 2026 14:56:12 +0530
Message-ID: <20260807092612.2202005-1-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717180442.110954-18-aneesh.kumar@kernel.org>
References: <20260717180442.110954-18-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Realm guests and protected KVM guests may require swiotlb for device DMA
even when all system RAM is addressable by the DMA zones.

Do not reduce the SWIOTLB buffer to the kmalloc-bouncing size for these
guests, as the reduced number of slots can be exhausted during CCA guest
operation.

Fixes: 30c5e45ee2c5 ("dma-direct: make dma_direct_map_phys() honor DMA_ATTR_CC_SHARED")
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 arch/arm64/mm/init.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index e308a7cabd12..24caaf10e755 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -339,7 +339,8 @@ void __init arch_mm_preinit(void)
 {
 	unsigned int flags = SWIOTLB_VERBOSE;
 
-	if (max_pfn <= PFN_DOWN(arm64_dma_phys_limit)) {
+	if (!cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT) &&
+	    max_pfn <= PFN_DOWN(arm64_dma_phys_limit)) {
 		/*
 		 * If no bouncing needed for ZONE_DMA, reduce the swiotlb
 		 * buffer for kmalloc() bouncing to 1MB per 1GB of RAM.
-- 
2.43.0


