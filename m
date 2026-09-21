Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA3DC982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 06:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VoCg32Arx4e7KaF2GJEfcwJzh1ShvNusNafOCb8ICO0=; b=EijT6cs7SJV6ZyjWRnKdA5Z6mB
	cNX+GR2N1O/lsp0SJ6Kjx8+yX+k13rOh359O3uqAbXfjzNRUT6Er5fB2OAUvHkkh+9Eb8zNWGoz0O
	ebIYDogZul1b+VE8OwqPQibKs14EzNL1HdAUe+8Hva76FW6zd0KXZMEZ84/A3Pw0b3a7+vjR5Vyzc
	W3eoGg3RPtUPiDiVL7l33B2OvQgKSjhhOgn7mdPzjezsfg7bo7FBPAs1YqxG2myepWBIEQ4AJ4AYP
	awVUbpFx5tAJCenxwUDSMWvLwBGa/Po1xvnA5fnLVoDHhF4+Ms/YWqIIoDA9r/S0Sc9MZSIh6Gxqs
	xMLVTjWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8XfN-000000013iI-2GoN;
	Mon, 21 Sep 2026 06:38:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8XfL-000000013g0-27d5;
	Mon, 21 Sep 2026 06:38:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3E870405BB;
	Mon, 21 Sep 2026 06:38:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9341A1F000FF;
	Mon, 21 Sep 2026 06:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789972695;
	bh=VoCg32Arx4e7KaF2GJEfcwJzh1ShvNusNafOCb8ICO0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jIq/flJRY3S5laEIT+Wa5u9H4XzbVTG73lEvv3r80VBqC4d4gx2R4rPz/4iRfl+FS
	 T6wvnzWrCYCSrJ9jduv4Hi4hvZmj7+Rp8DdiuCZWhpb4wC2QAk14pe8YwzDbTbzob/
	 5XsqIPaBZBiYB/OBhqr7ZaFUtIxWNm4rA9fuRNv5aT0GRKaM5P3x7AQzIRdvxQVz5i
	 vhLUG13WQhfQov1qCVQmey56rKz+067+EwWOoaeLlTRKhqQr22C9XSlq+YNCQKkKj8
	 X3UFdT52k2baLO2qi5Cs3dBJorRVGHCGxy1fyZqxLbV3Hv3Ix9tQo9SAAn0a4ffJCA
	 WoE8T/WIg/byg==
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
Subject: [PATCH v5 6/6] dma: swiotlb: Remove SWIOTLB_ANY
Date: Mon, 21 Sep 2026 12:06:28 +0530
Message-ID: <20260921063628.362078-7-aneesh.kumar@kernel.org>
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

swiotlb pools are currently allocated below the architecture's low
address limit by default. SWIOTLB_ANY overrides this and permits
allocation anywhere in directly mapped memory.

SWIOTLB_INIT_ADDRESSING_LIMIT now explicitly identifies callers which
need a pool that is reachable by devices with limited DMA addressing.
Use it as the placement constraint and remove SWIOTLB_ANY.

This changes the default behavior for callers which do not set either
flag. Previously, omitting SWIOTLB_ANY placed the default pool below the
architecture's low address limit and also constrained dynamically
allocated pools to the same range. After this change, omitting
SWIOTLB_INIT_ADDRESSING_LIMIT permits both static and dynamic pools to
use any directly mapped memory.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 Documentation/core-api/swiotlb.rst |  8 ++++----
 arch/powerpc/mm/mem.c              |  6 ++++--
 arch/riscv/mm/init.c               | 16 ----------------
 arch/s390/mm/init.c                |  2 +-
 arch/x86/kernel/pci-dma.c          |  2 +-
 include/linux/swiotlb.h            |  7 +++----
 kernel/dma/swiotlb.c               | 17 ++++++-----------
 7 files changed, 19 insertions(+), 39 deletions(-)

diff --git a/Documentation/core-api/swiotlb.rst b/Documentation/core-api/swiotlb.rst
index 71b4e4c27eb5..06d9f88fdf7b 100644
--- a/Documentation/core-api/swiotlb.rst
+++ b/Documentation/core-api/swiotlb.rst
@@ -148,10 +148,10 @@ may also be adjusted
 due to other conditions, such as running in a CoCo VM, as described above. If
 CONFIG_SWIOTLB_DYNAMIC is enabled, additional pools may be allocated later in
 the life of the system. Each pool must be a contiguous range of physical
-memory. The default pool is allocated below the 4 GiB physical address line so
-it works for devices that can only address 32-bits of physical memory (unless
-architecture-specific code provides the SWIOTLB_ANY flag). In a CoCo VM, the
-pool memory must be decrypted before swiotlb is used.
+memory. The default pool is allocated below the architecture's low address
+limit when it is needed for devices with limited DMA addressing. Otherwise,
+it may be allocated anywhere in directly mapped memory. In a CoCo VM, the pool
+memory must be decrypted before swiotlb is used.
 
 Each pool is divided into "slots" of size IO_TLB_SIZE, which is 2 KiB with
 current definitions. IO_TLB_SEGSIZE contiguous slots (128 slots) constitute
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 006ed41097e9..1bdea6c03848 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -295,9 +295,11 @@ void __init arch_mm_preinit(void)
 		/*
 		 * Since the guest memory is inaccessible to the host,
 		 * devices always need to use the SWIOTLB buffer for DMA
-		 * even if dma_capable() says otherwise.
+		 * even if dma_capable() says otherwise. The hypervisor has
+		 * no addressing limitation, so the buffer may be allocated
+		 * anywhere.
 		 */
-		ppc_swiotlb_flags |= SWIOTLB_ANY;
+		ppc_swiotlb_flags &= ~SWIOTLB_INIT_ADDRESSING_LIMIT;
 	}
 
 	/*
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 96856114b387..734712230f35 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -165,27 +165,11 @@ static void print_vm_layout(void) { }
 
 void __init arch_mm_preinit(void)
 {
-	bool swiotlb = max_pfn > PFN_DOWN(dma32_phys_limit) &&
-		       memblock_start_of_DRAM() < dma32_phys_limit;
 	unsigned int swiotlb_flags = SWIOTLB_VERBOSE;
 #ifdef CONFIG_FLATMEM
 	BUG_ON(!mem_map);
 #endif /* CONFIG_FLATMEM */
 
-	if (IS_ENABLED(CONFIG_DMA_BOUNCE_UNALIGNED_KMALLOC) && !swiotlb &&
-	    dma_cache_alignment != 1) {
-		/*
-		 * No 32-bit DMA bouncing needed (either all DRAM is within
-		 * the 32-bit limit, or it all starts above it), but
-		 * kmalloc() buffers whose sizes are not cache-line-aligned
-		 * still require bouncing for non-coherent DMA.  Use
-		 * SWIOTLB_ANY so that the buffer can be allocated from high
-		 * memory when DRAM starts above dma32_phys_limit.  Allocate
-		 * ~1 MB per 1 GB of RAM.
-		 */
-		swiotlb_flags |= SWIOTLB_ANY;
-	}
-
 	if ((max_pfn > PFN_DOWN(dma32_phys_limit)) &&
 	     (memblock_start_of_DRAM() < dma32_phys_limit))
 		swiotlb_flags |= SWIOTLB_INIT_ADDRESSING_LIMIT;
diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
index 78f507e24ceb..ce10292447f1 100644
--- a/arch/s390/mm/init.c
+++ b/arch/s390/mm/init.c
@@ -166,7 +166,7 @@ static void __init pv_init(void)
 	virtio_set_mem_acc_cb(virtio_require_restricted_mem_acc);
 
 	/* make sure bounce buffers are shared */
-	swiotlb_init(SWIOTLB_VERBOSE | SWIOTLB_ANY);
+	swiotlb_init(SWIOTLB_VERBOSE);
 	swiotlb_update_mem_attributes();
 }
 
diff --git a/arch/x86/kernel/pci-dma.c b/arch/x86/kernel/pci-dma.c
index ce257b20ea9c..74e92b457758 100644
--- a/arch/x86/kernel/pci-dma.c
+++ b/arch/x86/kernel/pci-dma.c
@@ -90,7 +90,7 @@ static void __init pci_xen_swiotlb_init(void)
 	/* Xen can use a SWIOTLB pool anywhere in directly mapped memory. */
 	x86_swiotlb_flags &= ~(SWIOTLB_INIT_ADDRESSING_LIMIT |
 			       SWIOTLB_INIT_DEFAULT_OFF);
-	x86_swiotlb_flags |= SWIOTLB_INIT_REMAP | SWIOTLB_ANY;
+	x86_swiotlb_flags |= SWIOTLB_INIT_REMAP;
 	swiotlb_init_remap(x86_swiotlb_flags, xen_swiotlb_fixup);
 	dma_ops = &xen_swiotlb_dma_ops;
 	if (IS_ENABLED(CONFIG_PCI))
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 466c33795db0..503e1446e0d8 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -15,13 +15,12 @@ struct page;
 struct scatterlist;
 
 #define SWIOTLB_VERBOSE	(1 << 0) /* verbose initialization */
-#define SWIOTLB_ANY	(1 << 1) /* allow any memory for the buffer */
 /* Initialize a default-sized pool for devices with limited DMA addressing. */
-#define SWIOTLB_INIT_ADDRESSING_LIMIT	(1 << 2)
+#define SWIOTLB_INIT_ADDRESSING_LIMIT	(1 << 1)
 /* Initialize a default-sized pool that requires architecture remapping. */
-#define SWIOTLB_INIT_REMAP		(1 << 3)
+#define SWIOTLB_INIT_REMAP		(1 << 2)
 /* Do not initialize a pool unless SWIOTLB is explicitly required. */
-#define SWIOTLB_INIT_DEFAULT_OFF		(1 << 4)
+#define SWIOTLB_INIT_DEFAULT_OFF	(1 << 3)
 
 /*
  * Maximum allowable number of contiguous slabs to map,
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 46b789eb0806..77d7c320de28 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -450,15 +450,10 @@ static void __init *swiotlb_memblock_alloc(unsigned long nslabs,
 	size_t bytes = PAGE_ALIGN(nslabs << IO_TLB_SHIFT);
 	void *tlb;
 
-	/*
-	 * By default allocate the bounce buffer memory from low memory, but
-	 * allow to pick a location everywhere for hypervisors with guest
-	 * memory encryption.
-	 */
-	if (flags & SWIOTLB_ANY)
-		tlb = memblock_alloc(bytes, PAGE_SIZE);
-	else
+	if (flags & SWIOTLB_INIT_ADDRESSING_LIMIT)
 		tlb = memblock_alloc_low(bytes, PAGE_SIZE);
+	else
+		tlb = memblock_alloc(bytes, PAGE_SIZE);
 
 	if (!tlb) {
 		pr_warn("%s: Failed to allocate %zu bytes tlb structure\n",
@@ -604,10 +599,10 @@ void __init swiotlb_init_remap(unsigned int flags,
 #ifdef CONFIG_SWIOTLB_DYNAMIC
 	if (!remap)
 		io_tlb_default_mem.can_grow = true;
-	if (flags & SWIOTLB_ANY)
-		io_tlb_default_mem.phys_limit = virt_to_phys(high_memory - 1);
-	else
+	if (flags & SWIOTLB_INIT_ADDRESSING_LIMIT)
 		io_tlb_default_mem.phys_limit = ARCH_LOW_ADDRESS_LIMIT;
+	else
+		io_tlb_default_mem.phys_limit = virt_to_phys(high_memory - 1);
 #endif
 
 	/* if we have host or guest memory encryption */
-- 
2.43.0


