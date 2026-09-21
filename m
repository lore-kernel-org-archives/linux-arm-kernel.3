Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B95BCC982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 06:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fFLFmWm1E4cYQvctfCBtN7dfMLeyqysLCL+XSA6T+I0=; b=uo998Gwn6T5Rdkvz0jbn8LKS5g
	340iiyY/MDPg+lifEP80rUMpqLus6Lp2mf00Cicg/2/3M5dEm3amPjIGXJbEgdglIz9hSJGfsFfXz
	hePPyGeyMz0oHA5peOfgcp3UxbiKzXVbVt9MJapVMQBrJ9wPAA7S7VPic6hOZS+PHDPYmfXeeywnv
	QvYPiSTIP3EOz/Ev3oqMOYoD26sWZNzif6Z8KRcC+HIVCL2EhXrO4gteOtgyFHbaQuk7DLHVy+Wml
	ps5p76nKbT6LBaddRWlzXTVFEhc2Hmss6OyFwA0B1EH3IwE8p+9vXR8XI6WUlLgaK+9II/xy8gn/O
	ofk7dO1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Xf9-000000013Wf-0oez;
	Mon, 21 Sep 2026 06:38:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Xf8-000000013Vq-1Gp9;
	Mon, 21 Sep 2026 06:38:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 102F0405BB;
	Mon, 21 Sep 2026 06:38:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C2311F00893;
	Mon, 21 Sep 2026 06:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789972681;
	bh=fFLFmWm1E4cYQvctfCBtN7dfMLeyqysLCL+XSA6T+I0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZzMXPOCTNLT/Q06TPayEJbdJT7MQQSUndDMUDLI3EMDAYQ+ZfmB9ubQwVZW+enXMt
	 uT90JLd+XDvkd0sD6UcZZgSwd4/rSGIVYnHuOlGMF6f2zIm1TBOB3cllrOXnZwMF/P
	 1pJEuMwCRcF8JyzZRuK0U7VkO/lD2WKx+me+XlL8hLFUHKqX7y64RzH1AoYguyG2GU
	 FC4ngD0nR5T7IQWneSJer06E8CkgWGsL1FfDUbjCNF+4oqtNOBRAYegt1bngwv2fzp
	 t9y2vsjkaS7nevJRsRxHDS/J850Unx3q5CdI+f0YtOFCMlA/x5M0tQc/ZOJrn2O6yw
	 wrDjlEyssQp3w==
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
Subject: [PATCH v5 5/6] dma: swiotlb: Add an overridable architecture pool opt-out
Date: Mon, 21 Sep 2026 12:06:27 +0530
Message-ID: <20260921063628.362078-6-aneesh.kumar@kernel.org>
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

On x86, iommu=off historically prevented SWIOTLB initialization by not
setting SWIOTLB_INIT_ADDRESSING_LIMIT. This overloads that flag: it
controls both whether a pool is selected and where the pool is
allocated. If another requirement, swiotlb=force selects a pool
independently, omitting SWIOTLB_INIT_ADDRESSING_LIMIT may place it above
the addressable range of devices which need bounce buffering.

Add SWIOTLB_INIT_FORCE_DISABLE to let an architecture opt out of normal
pool initialization without discarding the pool placement constraints.

Unlike swiotlb_force_disable, which is set by swiotlb=noforce and
unconditionally prevents pool initialization, the new flag is an
architecture default. Explicit requirements such as memory encryption,
architecture remapping, or swiotlb=force take precedence over it.

iommu=soft retains SWIOTLB_INIT_ADDRESSING_LIMIT because it requests
software bounce buffering for devices whose DMA masks cannot address all
system memory. Such devices must be able to reach the bounce pool.

Clear both flags for Xen because Xen explicitly requires a remapped
SWIOTLB pool and may allocate it anywhere in directly mapped memory.

With no override, iommu=off disables both hardware IOMMU translation and
SWIOTLB bouncing. Direct DMA remains available; mappings outside a
device's addressable range fail instead of being bounced.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 arch/x86/kernel/pci-dma.c | 11 ++++++++---
 include/linux/swiotlb.h   |  2 ++
 kernel/dma/swiotlb.c      | 10 ++++++++--
 3 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/pci-dma.c b/arch/x86/kernel/pci-dma.c
index 0cff255827ba..ce257b20ea9c 100644
--- a/arch/x86/kernel/pci-dma.c
+++ b/arch/x86/kernel/pci-dma.c
@@ -44,9 +44,13 @@ static unsigned int x86_swiotlb_flags;
 static void __init pci_swiotlb_detect(void)
 {
 	/* don't initialize swiotlb if iommu=off (no_iommu=1) */
-	if (!no_iommu && max_possible_pfn > MAX_DMA32_PFN) {
-		x86_swiotlb_enable = true;
+	if (no_iommu)
+		x86_swiotlb_flags |= SWIOTLB_INIT_DEFAULT_OFF;
+
+	if (max_possible_pfn > MAX_DMA32_PFN) {
 		x86_swiotlb_flags |= SWIOTLB_INIT_ADDRESSING_LIMIT;
+		if (!no_iommu)
+			x86_swiotlb_enable = true;
 	}
 
 	/*
@@ -84,7 +88,8 @@ static void __init pci_xen_swiotlb_init(void)
 		return;
 	x86_swiotlb_enable = true;
 	/* Xen can use a SWIOTLB pool anywhere in directly mapped memory. */
-	x86_swiotlb_flags &= ~SWIOTLB_INIT_ADDRESSING_LIMIT;
+	x86_swiotlb_flags &= ~(SWIOTLB_INIT_ADDRESSING_LIMIT |
+			       SWIOTLB_INIT_DEFAULT_OFF);
 	x86_swiotlb_flags |= SWIOTLB_INIT_REMAP | SWIOTLB_ANY;
 	swiotlb_init_remap(x86_swiotlb_flags, xen_swiotlb_fixup);
 	dma_ops = &xen_swiotlb_dma_ops;
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index be3962a33fc6..466c33795db0 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -20,6 +20,8 @@ struct scatterlist;
 #define SWIOTLB_INIT_ADDRESSING_LIMIT	(1 << 2)
 /* Initialize a default-sized pool that requires architecture remapping. */
 #define SWIOTLB_INIT_REMAP		(1 << 3)
+/* Do not initialize a pool unless SWIOTLB is explicitly required. */
+#define SWIOTLB_INIT_DEFAULT_OFF		(1 << 4)
 
 /*
  * Maximum allowable number of contiguous slabs to map,
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index c19675846fc1..46b789eb0806 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -563,10 +563,16 @@ swiotlb_select_pool_policy(unsigned int flags)
 	if (flags & SWIOTLB_INIT_REMAP)
 		return SWIOTLB_POOL_DEFAULT;
 
-	if (flags & SWIOTLB_INIT_ADDRESSING_LIMIT)
+	if (swiotlb_force_bounce)
 		return SWIOTLB_POOL_DEFAULT;
 
-	if (swiotlb_force_bounce)
+	/*
+	 * Explicit requirements above override an architecture's default opt-out.
+	 */
+	if (flags & SWIOTLB_INIT_DEFAULT_OFF)
+		return SWIOTLB_POOL_NONE;
+
+	if (flags & SWIOTLB_INIT_ADDRESSING_LIMIT)
 		return SWIOTLB_POOL_DEFAULT;
 
 	if (swiotlb_kmalloc_needs_bounce())
-- 
2.43.0


