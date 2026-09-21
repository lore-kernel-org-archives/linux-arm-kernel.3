Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 901E1C982DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 06:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K+b48+bUbw9Zp4TfNEQmI2aqQxUfqoVbbM+1xt10BLE=; b=cN2b43T9UCxmZWEh776ORsOp07
	L1RVZ8jFgad34Gce/Ts99rkDK43H/QyqsBenr4LojdPpKR/KUT0zxjYZkyd66wv4MhdZXW6o1LhuX
	bZpgCCLXQH+GxTkFCNPVY0WZnVn5bvzRDwlH/Xw4oWv0cA4uBAAKKXkh+9VFZ+kHfKf1aYpjgJ9b0
	sEN/QJqtj0VEt9du/WtmZr2yDtfHEDxx9F/DJzNHg+PKfCEDyiugeth80WWul764uyBNUWpYdgUw0
	QW48/K+eyeuVkrPfAc/B3kU8QRG1KwavOQdDxZHqfvhRozEr60hSUqHKQUiyyOj5ARMXn14Ndv/+h
	G0TkLLxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Xej-000000013Bz-0Wo1;
	Mon, 21 Sep 2026 06:37:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Xei-000000013Az-0Fdu;
	Mon, 21 Sep 2026 06:37:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A13554031F;
	Mon, 21 Sep 2026 06:37:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 096271F0089B;
	Mon, 21 Sep 2026 06:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789972655;
	bh=K+b48+bUbw9Zp4TfNEQmI2aqQxUfqoVbbM+1xt10BLE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=i1lXqpcv+CPfidLk/96Fek4pilhGGmkGJ7Nr4F2IHCJJ6FuqR0PTsYqukoIkeg7gt
	 XEB9TgelNnrAWy/D50/VDHEv9mauRfXNtb4u80xZDG/3sIG+NIxMhNyTAwCt1FY/O4
	 758rYhWOpB4ZClrdEKI2yugVJBN9iGbpxqHZv8446bbnmfrCn+S1xVmOXvWyIe/17B
	 h8gETpRxuPbaozRiXDcHU9TPq4ltfM6zu83g6IuiarcsJqrjY4S8y1tgFU+5lKC1rv
	 ZuU3QfyH0StC3QqvAVG4LCTAwEFMRG1wXe65yq7rUqmD2xPy6QvChT0gB5/jz8a/Bb
	 JJoEXmVRzmg5Q==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
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
	Russell King <linux@armlinux.org.uk>,
	Huacai Chen <chenhuacai@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v5 3/6] dma: swiotlb: Centralize minimal pool sizing
Date: Mon, 21 Sep 2026 12:06:25 +0530
Message-ID: <20260921063628.362078-4-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921063628.362078-1-aneesh.kumar@kernel.org>
References: <20260921063628.362078-1-aneesh.kumar@kernel.org>
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

A default SWIOTLB pool used only for unaligned kmalloc bouncing can be
smaller than one required for limited DMA addressing. Arm64 and RISC-V
currently implement this sizing independently, using 1 MiB of SWIOTLB
space per GiB of RAM.

The SWIOTLB core now identifies this case with SWIOTLB_POOL_MINIMAL.
Size that policy in swiotlb_adjust_pool_size() and remove the
architecture-specific adjustments.

Explicit swiotlb= sizing remains unchanged because swiotlb_adjust_size()
preserves a user-configured size.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 arch/arm64/mm/init.c | 11 -----------
 arch/riscv/mm/init.c |  4 ----
 kernel/dma/swiotlb.c | 11 ++++++++++-
 3 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 7d51fb5f5a71..95075b5c8207 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -340,17 +340,6 @@ void __init arch_mm_preinit(void)
 {
 	unsigned int flags = SWIOTLB_VERBOSE;
 
-	if (max_pfn <= PFN_DOWN(arm64_dma_phys_limit)) {
-		/*
-		 * If no bouncing needed for ZONE_DMA, reduce the swiotlb
-		 * buffer for kmalloc() bouncing to 1MB per 1GB of RAM.
-		 */
-		unsigned long size =
-			DIV_ROUND_UP(memblock_phys_mem_size(), 1024);
-
-		swiotlb_adjust_size(min(swiotlb_size_or_default(), size));
-	}
-
 	if (max_pfn > PFN_DOWN(arm64_dma_phys_limit))
 		flags |= SWIOTLB_INIT_ADDRESSING_LIMIT;
 
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index e0e4c103d603..96856114b387 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -183,10 +183,6 @@ void __init arch_mm_preinit(void)
 		 * memory when DRAM starts above dma32_phys_limit.  Allocate
 		 * ~1 MB per 1 GB of RAM.
 		 */
-		unsigned long size =
-			DIV_ROUND_UP(memblock_phys_mem_size(), 1024);
-		swiotlb_adjust_size(min(swiotlb_size_or_default(), size));
-		swiotlb = true;
 		swiotlb_flags |= SWIOTLB_ANY;
 	}
 
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 8f86deb25be2..f368a73f4ed0 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -483,9 +483,18 @@ static bool __init swiotlb_kmalloc_needs_bounce(void)
 static void __init
 swiotlb_adjust_pool_size(enum swiotlb_pool_policy policy)
 {
+	if (swiotlb_default_size_changed())
+		return;
+
 	switch (policy) {
-	case SWIOTLB_POOL_MINIMAL:
+	case SWIOTLB_POOL_MINIMAL: {
+		unsigned long size;
+
+		/* Use 1MB per 1GB of RAM for kmalloc() bouncing. */
+		size = DIV_ROUND_UP(memblock_phys_mem_size(), 1024);
+		swiotlb_adjust_size(min(swiotlb_size_or_default(), size));
 		break;
+	}
 	case SWIOTLB_POOL_CC_GUEST:
 		break;
 	case SWIOTLB_POOL_NONE:
-- 
2.43.0


