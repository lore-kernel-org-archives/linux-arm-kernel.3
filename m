Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E28D5C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 06:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XWKv0vmBFIRxRHZRfY0mPzGvOE36zYWQ+wZMqnQZqqY=; b=e1/EHXe5PecqC1UpLoFtP4PzQA
	QIyepX9v8sgUwHoANGrqBVhGUW7NlhtSMgdk2kce8W8mFOn/UMYKN29QW+0KvNvdva+D1kbq1SWNy
	6HcV5SiWrz+0889tSVvAl2VnQOXWK5Yr2fukdJWWvedkQXb/qm3+T9wadJsOgjMJCxg7iWVJvZFzq
	F8zogxM/NYR4dVuh/uqqA/7lZuLsCVDNSgkSE/0qh9HAQiAR16yzU5JRaurksGN6IYrL+kqj6dumc
	KLGvt68RzsnDA0VA95kjn6Sfo6kZJwvJHcvStXg947RPmX326XHADMR3z+U6FPrHAFXuUvGMJVh81
	7KhVJa6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Xew-000000013MY-1mO4;
	Mon, 21 Sep 2026 06:37:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Xev-000000013Le-2fWx;
	Mon, 21 Sep 2026 06:37:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1561A600D1;
	Mon, 21 Sep 2026 06:37:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D0F21F000FF;
	Mon, 21 Sep 2026 06:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789972668;
	bh=XWKv0vmBFIRxRHZRfY0mPzGvOE36zYWQ+wZMqnQZqqY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ASi2VLnGU59x3Xy4QYKMAoJACoxb7T7+dZYOuYeonTZk86BctpiYcNMWx2inztEjI
	 d/mS4xlOrnertI7+ik0iUg1yvcGe6XbJaYb+tToVtDvml9/OqYdLypjhFjHqoNGd7B
	 +dyPTJtK3HKkJfpqrGTq+eHyVt/SR+5tit0DcbR64uRph3ENIFSp/ziPKiAd1+zGJN
	 ujbvSeWtRrdmrSDKq5lUNDzjY3+4bt0Fs51bEhiVs9TyxhdWPOtmMVLN9nUdYHC1XB
	 q+rBDh6CaU0Xlv+QmG94LP0riH+YX1oaabIKx8wR3r6Jyjj0GvYdVHBH8ipoM4rOmn
	 qI42IYij61dfQ==
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
Subject: [PATCH v5 4/6] dma: swiotlb: Centralize memory-encryption pool sizing
Date: Mon, 21 Sep 2026 12:06:26 +0530
Message-ID: <20260921063628.362078-5-aneesh.kumar@kernel.org>
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

Memory-encrypted guests use shared or unencrypted memory for DMA and may
route all DMA through SWIOTLB. The default pool can therefore be too
small for I/O-intensive workloads.

Move the existing x86 guest-sizing policy into the SWIOTLB core. For
SWIOTLB_POOL_CC_GUEST, size the pool to 6% of guest memory, clamped
between the normal default and 1 GiB. Preserve an explicit swiotlb=
size.

Provide swiotlb_adjusted_size() so early users, including the x86 crash
kernel reservation, can account for the prospective guest pool size
before SWIOTLB initialization. Use the same area-aware alignment for
both the prospective and allocated sizes.

Host memory encryption still selects a normal-sized shared pool and
does not use the guest-sizing policy.

A restricted DMA pool already provides shared bounce buffers for its
devices. Record its presence during reserved-memory initialization and
do not select the confidential-guest default-pool policy solely because
guest memory encryption is active.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 arch/x86/include/asm/crash_reserve.h |  6 ++--
 arch/x86/mm/mem_encrypt.c            | 24 --------------
 include/linux/swiotlb.h              |  6 ++++
 kernel/dma/swiotlb.c                 | 47 +++++++++++++++++++++++++++-
 4 files changed, 56 insertions(+), 27 deletions(-)

diff --git a/arch/x86/include/asm/crash_reserve.h b/arch/x86/include/asm/crash_reserve.h
index 7835b2cdff04..c1f5bf5d4182 100644
--- a/arch/x86/include/asm/crash_reserve.h
+++ b/arch/x86/include/asm/crash_reserve.h
@@ -18,7 +18,9 @@
  * no good way to detect the paging mode of the target kernel which will be
  * loaded for dumping.
  */
-extern unsigned long swiotlb_size_or_default(void);
+#ifdef CONFIG_X86_64
+unsigned long __init swiotlb_adjusted_size(void);
+#endif
 
 #ifdef CONFIG_X86_32
 # define CRASH_ADDR_LOW_MAX     SZ_512M
@@ -33,7 +35,7 @@ extern unsigned long swiotlb_size_or_default(void);
 static inline unsigned long crash_low_size_default(void)
 {
 #ifdef CONFIG_X86_64
-	return max(swiotlb_size_or_default() + (8UL << 20), 256UL << 20);
+	return max(swiotlb_adjusted_size() + (8UL << 20), 256UL << 20);
 #else
 	return 0;
 #endif
diff --git a/arch/x86/mm/mem_encrypt.c b/arch/x86/mm/mem_encrypt.c
index 95bae74fdab2..912f22ca838f 100644
--- a/arch/x86/mm/mem_encrypt.c
+++ b/arch/x86/mm/mem_encrypt.c
@@ -101,9 +101,6 @@ void __init mem_encrypt_init(void)
 
 void __init mem_encrypt_setup_arch(void)
 {
-	phys_addr_t total_mem = memblock_phys_mem_size();
-	unsigned long size;
-
 	/*
 	 * Do RMP table fixups after the e820 tables have been setup by
 	 * e820__memory_setup().
@@ -114,27 +111,6 @@ void __init mem_encrypt_setup_arch(void)
 	if (!cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT))
 		return;
 
-	/*
-	 * For SEV and TDX, all DMA has to occur via shared/unencrypted pages.
-	 * Kernel uses SWIOTLB to make this happen without changing device
-	 * drivers. However, depending on the workload being run, the
-	 * default 64MB of SWIOTLB may not be enough and SWIOTLB may
-	 * run out of buffers for DMA, resulting in I/O errors and/or
-	 * performance degradation especially with high I/O workloads.
-	 *
-	 * Adjust the default size of SWIOTLB using a percentage of guest
-	 * memory for SWIOTLB buffers. Also, as the SWIOTLB bounce buffer
-	 * memory is allocated from low memory, ensure that the adjusted size
-	 * is within the limits of low available memory.
-	 *
-	 * The percentage of guest memory used here for SWIOTLB buffers
-	 * is more of an approximation of the static adjustment which
-	 * 64MB for <1G, and ~128M to 256M for 1G-to-4G, i.e., the 6%
-	 */
-	size = total_mem * 6 / 100;
-	size = clamp_val(size, IO_TLB_DEFAULT_SIZE, SZ_1G);
-	swiotlb_adjust_size(size);
-
 	/* Set restricted memory access for virtio. */
 	virtio_set_mem_acc_cb(virtio_require_restricted_mem_acc);
 }
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index d69370c08094..be3962a33fc6 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -193,6 +193,7 @@ void swiotlb_dev_init(struct device *dev);
 size_t swiotlb_max_mapping_size(struct device *dev);
 bool is_swiotlb_allocated(void);
 bool is_swiotlb_active(struct device *dev);
+unsigned long __init swiotlb_adjusted_size(void);
 void __init swiotlb_adjust_size(unsigned long size);
 phys_addr_t default_swiotlb_base(void);
 phys_addr_t default_swiotlb_limit(void);
@@ -232,6 +233,11 @@ static inline bool is_swiotlb_active(struct device *dev)
 	return false;
 }
 
+static inline unsigned long __init swiotlb_adjusted_size(void)
+{
+	return 0;
+}
+
 static inline void swiotlb_adjust_size(unsigned long size)
 {
 }
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index f368a73f4ed0..c19675846fc1 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -80,6 +80,7 @@ struct io_tlb_slot {
 
 static bool swiotlb_force_bounce;
 static bool swiotlb_force_disable;
+static bool restricted_dma_pool_present __initdata;
 
 enum swiotlb_pool_policy {
 	SWIOTLB_POOL_NONE,
@@ -480,6 +481,46 @@ static bool __init swiotlb_kmalloc_needs_bounce(void)
 	       (dma_get_cache_alignment() > 1);
 }
 
+/**
+ * swiotlb_adjusted_size() - get the prospective adjusted SWIOTLB size
+ *
+ * Return the size that confidential-computing guest sizing would select for
+ * the default pool, without changing the configured SWIOTLB size. An
+ * explicit swiotlb= size is always preserved. An explicit area count is
+ * included in the size calculation. Automatic area sizing is initialized
+ * later from the running kernel's possible CPU map and any resulting size
+ * adjustment is therefore not reflected in the returned size.
+ */
+unsigned long __init swiotlb_adjusted_size(void)
+{
+	unsigned long nslabs, size = swiotlb_size_or_default();
+
+	if (swiotlb_default_size_changed() ||
+	    !cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT))
+		return size;
+	/*
+	 * For SEV and TDX and CCA, all DMA has to occur via
+	 * shared/unencrypted pages. Kernel uses SWIOTLB to make this
+	 * happen without changing device drivers. However, depending on
+	 * the workload being run, the default 64MB of SWIOTLB may not be
+	 * enough and SWIOTLB may run out of buffers for DMA, resulting in
+	 * I/O errors and/or performance degradation especially with high
+	 * I/O workloads.
+	 *
+	 * Adjust the default size of SWIOTLB using a percentage of guest
+	 * memory for SWIOTLB buffers.
+	 *
+	 * The percentage of guest memory used here for SWIOTLB buffers is
+	 * more of an approximation of the static adjustment which 64MB for
+	 * <1G, and ~128M to 256M for 1G-to-4G, i.e., the 6%
+	 */
+	size = memblock_phys_mem_size() * 6 / 100;
+	size = clamp_val(size, IO_TLB_DEFAULT_SIZE, SZ_1G);
+	nslabs = swiotlb_aligned_nslabs(size);
+
+	return nslabs << IO_TLB_SHIFT;
+}
+
 static void __init
 swiotlb_adjust_pool_size(enum swiotlb_pool_policy policy)
 {
@@ -496,6 +537,7 @@ swiotlb_adjust_pool_size(enum swiotlb_pool_policy policy)
 		break;
 	}
 	case SWIOTLB_POOL_CC_GUEST:
+		swiotlb_adjust_size(swiotlb_adjusted_size());
 		break;
 	case SWIOTLB_POOL_NONE:
 		WARN(true, "Cannot adjust SWIOTLB size without a pool\n");
@@ -511,7 +553,8 @@ swiotlb_select_pool_policy(unsigned int flags)
 	if (swiotlb_force_disable)
 		return SWIOTLB_POOL_NONE;
 
-	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT))
+	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT) &&
+	    !restricted_dma_pool_present)
 		return SWIOTLB_POOL_CC_GUEST;
 
 	if (cc_platform_has(CC_ATTR_HOST_MEM_ENCRYPT))
@@ -2157,6 +2200,8 @@ static int __init rmem_swiotlb_setup(unsigned long node,
 	    of_get_flat_dt_prop(node, "no-map", NULL))
 		return -EINVAL;
 
+	restricted_dma_pool_present = true;
+
 	pr_info("Reserved memory: created restricted DMA pool at %pa, size %ld MiB\n",
 		&rmem->base, (unsigned long)rmem->size / SZ_1M);
 	return 0;
-- 
2.43.0


