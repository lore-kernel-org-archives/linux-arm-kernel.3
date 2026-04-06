Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64CC2FB5178
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 23:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qFmDYcnnDgWKdH7Fx1pvQvOvhn076UMYFbFndXl8P/A=; b=Yf/hd8yuBBPFZihCbonviHP7w4
	5fm8lVO54E3nKbU/jaEZEzZbZxt1/D5dKmKYXDLgNnDjq7J2Ubui6CLNXmdZ9L52r7rME/T9K9zxO
	XVJMpfHIylYBNrrbOvo5Ny1TBFLRccWrl7Fhc6K6CA/wvcKkAcsCKgMzWL4XQZk6l1yEV+fpYBCBe
	mzV0FH7FBRYWnKv9ry6HmEbYvwhXkOgE592/poCzvmMmvvJoufGnBt4bV4TOQSNTkT2v7i9eqfwFP
	Ed+YJFVcRDgdhwDtRpCHk+awSbxzV2oN9YSGLPuCWNsK55MZIdSh15BYFrwatcNZaf/GmV3FYozvg
	q+qodpDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9tKH-00000005cBP-2Rix;
	Mon, 06 Apr 2026 23:25:49 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9tKC-00000005c7L-2DOI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 23:25:46 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-2bdcf5970cdso3113289eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Apr 2026 16:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1775517943; x=1776122743; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qFmDYcnnDgWKdH7Fx1pvQvOvhn076UMYFbFndXl8P/A=;
        b=Wznt3Pyb3FomJP+A/Cq5/dG8+/yszC4mcutrEilc4rEbkgWgEWybPtDNH5Ri8oxONC
         VzlAmzxjMWjc3Wexm96uhZnm6330VxR7ccN/pRq/Ix2RPzKo1byhtcS/E82zq27gCVyI
         Z0Y3ScvZ3IDrSbC5B3lsgIFFnimwu0MRaTeTQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775517943; x=1776122743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qFmDYcnnDgWKdH7Fx1pvQvOvhn076UMYFbFndXl8P/A=;
        b=qfOiUE00WvuFxe5BC9Le14O9qjD08G8bRndh9ZxJ68b0GvTIF0Y9/tq1MnN6D4aEBb
         WK4MqMHQCFKV1AQcoyy5sdujIS1iAVv7l6kNbithVKm05g0PNwjI53uu9AmpcTbHFCMS
         aErfNPhE6mPfp7RD9ciMZCe4PyYV/wDAuWZd9YmgmBqWygLeMXVu8nHaZ28fCnm0D8B0
         tfX4VzK7MCgEYm1nDYRRpEVmETqMak4gKGVgvkQv1xQ6OR5MWUbKsOlngfFS6HJqUSVG
         3i5MVAT3ejSvUB17UGpugUL1DQN2s9XO0Ixm7pW33rYPpTiWB8NuZG3FyeEOFu6GgaQv
         dShA==
X-Forwarded-Encrypted: i=1; AJvYcCUVCFl8K4EqSjPjKMz80mWE5AwLuD93mboke6+TCbo3JkbFf7B91sj8ltK+lwyzZtTfhWstOpoGw3IaXQ3dJ5fu@lists.infradead.org
X-Gm-Message-State: AOJu0YxDOFl2xZYh9jGsoFyxMYmTmD4s5TDVeoD6JyvL+sPEbBWwbMC8
	DphAm1I6XqHVA4+fYR7noSXvSzNEzFHJ+ErqxLtmmY9iRKfZMxpVbROc0pEf6UmL9w==
X-Gm-Gg: AeBDiesXJiod1NCFqZTi5BLr3UVz4UmOz1Edbu7HCAwnghaaa3s8REg4MjeTX1691Tf
	TvJwClf0ae7irvWg9o9uUVXIqvIvbBpSVbk9jlJuHvbrYku/qa85sdlQtNufwVv7EKCAuObNogQ
	IUpn0kwzv1n9c4AnB52M1Pj+K8KSNxBj73yF6MpUbz/zi72ek2vFLZFuIXT2fX8X8gaAbGULVPK
	pSqOrKiTdrTeO6mnlmxZLjX0mnBhFVoV4tW4lbDXzj2ILWOvubAeGbUsDnDvGKvISCLlggIUh8d
	+7sC/O/kCpIXTboEUn57wCyWezHM+7xnLB67sdVgN1ZliodsKuiNJ9hAeHYKf16AFpQA7OuQKyZ
	7oXyVWllDM113EIRSlxpGnrdZUAVGJ/xOboPmjyAZvGs5rvtm9J4LkAKiWVGzFLvEpBcfdjs2cy
	r2sLIL89T2+p/ZShdM8RAACFwLF8hxNBVFLCVFfuRiuE3FFdqhrnqS/2/SwZaNYgS5UfG2V6y/p
	OUjuJvaoCl8hM4OWvAK
X-Received: by 2002:a05:693c:300c:b0:2be:acac:af7f with SMTP id 5a478bee46e88-2cad6ab1abfmr6524179eec.7.1775517943447;
        Mon, 06 Apr 2026 16:25:43 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:c071:3b78:5a5:824a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca760b0518sm14730975eec.0.2026.04.06.16.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 16:25:41 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
	Johan Hovold <johan@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Leon Romanovsky <leon@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Robin Murphy <robin.murphy@arm.com>,
	maz@kernel.org,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank.Li@kernel.org,
	alex@ghiti.fr,
	andre.przywara@arm.com,
	andrew@lunn.ch,
	aou@eecs.berkeley.edu,
	catalin.marinas@arm.com,
	dmaengine@vger.kernel.org,
	driver-core@lists.linux.dev,
	gregory.clement@bootlin.com,
	iommu@lists.linux.dev,
	jgg@ziepe.ca,
	kees@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-snps-arc@lists.infradead.org,
	linux@armlinux.org.uk,
	m.szyprowski@samsung.com,
	palmer@dabbelt.com,
	peter.ujfalusi@gmail.com,
	pjw@kernel.org,
	sebastian.hesselbarth@gmail.com,
	tsbogend@alpha.franken.de,
	vgupta@kernel.org,
	will@kernel.org,
	willy@infradead.org
Subject: [PATCH v5 7/9] driver core: Replace dev->dma_coherent with dev_dma_coherent()
Date: Mon,  6 Apr 2026 16:23:00 -0700
Message-ID: <20260406162231.v5.7.If839f6dde98979fce177f70c6c74689a1904ee76@changeid>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
In-Reply-To: <20260406232444.3117516-1-dianders@chromium.org>
References: <20260406232444.3117516-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_162544_584780_EDD4DEF3 
X-CRM114-Status: GOOD (  26.11  )
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

In C, bitfields are not necessarily safe to modify from multiple
threads without locking. Switch "dma_coherent" over to the "flags"
field so modifications are safe.

Cc: Christoph Hellwig <hch@lst.de>
Reviewed-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>
Reviewed-by: Danilo Krummrich <dakr@kernel.org>
Acked-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Not fixing any known bugs; problem is theoretical and found by code
inspection. Change is done somewhat manually and only lightly tested
(mostly compile-time tested).

NOTE: even though previously we only took up a bit if
CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE, CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU,
or CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL, in this change I reserve the
bit unconditionally.  While we could get the "dynamic" behavior by
changing the flags definition to be an unnumbered "enum", Greg has
requested that the numbers be stable.

(no changes since v4)

Changes in v4:
- Use accessor functions for flags

Changes in v3:
- New

 arch/arc/mm/dma.c                 |  4 ++--
 arch/arm/mach-highbank/highbank.c |  2 +-
 arch/arm/mach-mvebu/coherency.c   |  2 +-
 arch/arm/mm/dma-mapping-nommu.c   |  4 ++--
 arch/arm/mm/dma-mapping.c         | 28 ++++++++++++++--------------
 arch/arm64/mm/dma-mapping.c       |  2 +-
 arch/mips/mm/dma-noncoherent.c    |  2 +-
 arch/riscv/mm/dma-noncoherent.c   |  2 +-
 drivers/base/core.c               |  2 +-
 drivers/dma/ti/k3-udma-glue.c     |  6 +++---
 drivers/dma/ti/k3-udma.c          |  6 +++---
 include/linux/device.h            | 11 ++++-------
 include/linux/dma-map-ops.h       |  2 +-
 13 files changed, 35 insertions(+), 38 deletions(-)

diff --git a/arch/arc/mm/dma.c b/arch/arc/mm/dma.c
index 6b85e94f3275..9b9adb02b4c5 100644
--- a/arch/arc/mm/dma.c
+++ b/arch/arc/mm/dma.c
@@ -98,8 +98,8 @@ void arch_setup_dma_ops(struct device *dev, bool coherent)
 	 * DMA buffers.
 	 */
 	if (is_isa_arcv2() && ioc_enable && coherent)
-		dev->dma_coherent = true;
+		dev_set_dma_coherent(dev);
 
 	dev_info(dev, "use %scoherent DMA ops\n",
-		 dev->dma_coherent ? "" : "non");
+		 dev_dma_coherent(dev) ? "" : "non");
 }
diff --git a/arch/arm/mach-highbank/highbank.c b/arch/arm/mach-highbank/highbank.c
index 47335c7dadf8..8b7d0929dac4 100644
--- a/arch/arm/mach-highbank/highbank.c
+++ b/arch/arm/mach-highbank/highbank.c
@@ -98,7 +98,7 @@ static int highbank_platform_notifier(struct notifier_block *nb,
 	if (of_property_read_bool(dev->of_node, "dma-coherent")) {
 		val = readl(sregs_base + reg);
 		writel(val | 0xff01, sregs_base + reg);
-		dev->dma_coherent = true;
+		dev_set_dma_coherent(dev);
 	}
 
 	return NOTIFY_OK;
diff --git a/arch/arm/mach-mvebu/coherency.c b/arch/arm/mach-mvebu/coherency.c
index fa2c1e1aeb96..7234d487ff39 100644
--- a/arch/arm/mach-mvebu/coherency.c
+++ b/arch/arm/mach-mvebu/coherency.c
@@ -95,7 +95,7 @@ static int mvebu_hwcc_notifier(struct notifier_block *nb,
 
 	if (event != BUS_NOTIFY_ADD_DEVICE)
 		return NOTIFY_DONE;
-	dev->dma_coherent = true;
+	dev_set_dma_coherent(dev);
 
 	return NOTIFY_OK;
 }
diff --git a/arch/arm/mm/dma-mapping-nommu.c b/arch/arm/mm/dma-mapping-nommu.c
index fecac107fd0d..c6a70686507b 100644
--- a/arch/arm/mm/dma-mapping-nommu.c
+++ b/arch/arm/mm/dma-mapping-nommu.c
@@ -42,11 +42,11 @@ void arch_setup_dma_ops(struct device *dev, bool coherent)
 		 * enough to check if MPU is in use or not since in absence of
 		 * MPU system memory map is used.
 		 */
-		dev->dma_coherent = cacheid ? coherent : true;
+		dev_assign_dma_coherent(dev, cacheid ? coherent : true);
 	} else {
 		/*
 		 * Assume coherent DMA in case MMU/MPU has not been set up.
 		 */
-		dev->dma_coherent = (get_cr() & CR_M) ? coherent : true;
+		dev_assign_dma_coherent(dev, (get_cr() & CR_M) ? coherent : true);
 	}
 }
diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index f304037d1c34..f9bc53b60f99 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -1076,7 +1076,7 @@ static void *arm_iommu_alloc_attrs(struct device *dev, size_t size,
 	pgprot_t prot = __get_dma_pgprot(attrs, PAGE_KERNEL);
 	struct page **pages;
 	void *addr = NULL;
-	int coherent_flag = dev->dma_coherent ? COHERENT : NORMAL;
+	int coherent_flag = dev_dma_coherent(dev) ? COHERENT : NORMAL;
 
 	*handle = DMA_MAPPING_ERROR;
 	size = PAGE_ALIGN(size);
@@ -1124,7 +1124,7 @@ static int arm_iommu_mmap_attrs(struct device *dev, struct vm_area_struct *vma,
 	if (vma->vm_pgoff >= nr_pages)
 		return -ENXIO;
 
-	if (!dev->dma_coherent)
+	if (!dev_dma_coherent(dev))
 		vma->vm_page_prot = __get_dma_pgprot(attrs, vma->vm_page_prot);
 
 	err = vm_map_pages(vma, pages, nr_pages);
@@ -1141,7 +1141,7 @@ static int arm_iommu_mmap_attrs(struct device *dev, struct vm_area_struct *vma,
 static void arm_iommu_free_attrs(struct device *dev, size_t size, void *cpu_addr,
 	dma_addr_t handle, unsigned long attrs)
 {
-	int coherent_flag = dev->dma_coherent ? COHERENT : NORMAL;
+	int coherent_flag = dev_dma_coherent(dev) ? COHERENT : NORMAL;
 	struct page **pages;
 	size = PAGE_ALIGN(size);
 
@@ -1202,7 +1202,7 @@ static int __map_sg_chunk(struct device *dev, struct scatterlist *sg,
 		phys_addr_t phys = page_to_phys(sg_page(s));
 		unsigned int len = PAGE_ALIGN(s->offset + s->length);
 
-		if (!dev->dma_coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
+		if (!dev_dma_coherent(dev) && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
 			arch_sync_dma_for_device(sg_phys(s), s->length, dir);
 
 		prot = __dma_info_to_prot(dir, attrs);
@@ -1304,7 +1304,7 @@ static void arm_iommu_unmap_sg(struct device *dev,
 		if (sg_dma_len(s))
 			__iommu_remove_mapping(dev, sg_dma_address(s),
 					       sg_dma_len(s));
-		if (!dev->dma_coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
+		if (!dev_dma_coherent(dev) && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
 			arch_sync_dma_for_cpu(sg_phys(s), s->length, dir);
 	}
 }
@@ -1323,7 +1323,7 @@ static void arm_iommu_sync_sg_for_cpu(struct device *dev,
 	struct scatterlist *s;
 	int i;
 
-	if (dev->dma_coherent)
+	if (dev_dma_coherent(dev))
 		return;
 
 	for_each_sg(sg, s, nents, i)
@@ -1345,7 +1345,7 @@ static void arm_iommu_sync_sg_for_device(struct device *dev,
 	struct scatterlist *s;
 	int i;
 
-	if (dev->dma_coherent)
+	if (dev_dma_coherent(dev))
 		return;
 
 	for_each_sg(sg, s, nents, i)
@@ -1371,7 +1371,7 @@ static dma_addr_t arm_iommu_map_phys(struct device *dev, phys_addr_t phys,
 	dma_addr_t dma_addr;
 	int ret, prot;
 
-	if (!dev->dma_coherent &&
+	if (!dev_dma_coherent(dev) &&
 	    !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO)))
 		arch_sync_dma_for_device(phys, size, dir);
 
@@ -1412,7 +1412,7 @@ static void arm_iommu_unmap_phys(struct device *dev, dma_addr_t handle,
 	if (!iova)
 		return;
 
-	if (!dev->dma_coherent &&
+	if (!dev_dma_coherent(dev) &&
 	    !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO))) {
 		phys_addr_t phys = iommu_iova_to_phys(mapping->domain, iova);
 
@@ -1431,7 +1431,7 @@ static void arm_iommu_sync_single_for_cpu(struct device *dev,
 	unsigned int offset = handle & ~PAGE_MASK;
 	phys_addr_t phys;
 
-	if (dev->dma_coherent || !iova)
+	if (dev_dma_coherent(dev) || !iova)
 		return;
 
 	phys = iommu_iova_to_phys(mapping->domain, iova);
@@ -1446,7 +1446,7 @@ static void arm_iommu_sync_single_for_device(struct device *dev,
 	unsigned int offset = handle & ~PAGE_MASK;
 	phys_addr_t phys;
 
-	if (dev->dma_coherent || !iova)
+	if (dev_dma_coherent(dev) || !iova)
 		return;
 
 	phys = iommu_iova_to_phys(mapping->domain, iova);
@@ -1701,13 +1701,13 @@ static void arm_teardown_iommu_dma_ops(struct device *dev) { }
 void arch_setup_dma_ops(struct device *dev, bool coherent)
 {
 	/*
-	 * Due to legacy code that sets the ->dma_coherent flag from a bus
-	 * notifier we can't just assign coherent to the ->dma_coherent flag
+	 * Due to legacy code that sets the dma_coherent flag from a bus
+	 * notifier we can't just assign coherent to the dma_coherent flag
 	 * here, but instead have to make sure we only set but never clear it
 	 * for now.
 	 */
 	if (coherent)
-		dev->dma_coherent = true;
+		dev_set_dma_coherent(dev);
 
 	/*
 	 * Don't override the dma_ops if they have already been set. Ideally
diff --git a/arch/arm64/mm/dma-mapping.c b/arch/arm64/mm/dma-mapping.c
index b2b5792b2caa..dc1fce939451 100644
--- a/arch/arm64/mm/dma-mapping.c
+++ b/arch/arm64/mm/dma-mapping.c
@@ -48,7 +48,7 @@ void arch_setup_dma_ops(struct device *dev, bool coherent)
 		   dev_driver_string(dev), dev_name(dev),
 		   ARCH_DMA_MINALIGN, cls);
 
-	dev->dma_coherent = coherent;
+	dev_assign_dma_coherent(dev, coherent);
 
 	xen_setup_dma_ops(dev);
 }
diff --git a/arch/mips/mm/dma-noncoherent.c b/arch/mips/mm/dma-noncoherent.c
index ab4f2a75a7d0..30ef3e247eb7 100644
--- a/arch/mips/mm/dma-noncoherent.c
+++ b/arch/mips/mm/dma-noncoherent.c
@@ -139,6 +139,6 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
 #ifdef CONFIG_ARCH_HAS_SETUP_DMA_OPS
 void arch_setup_dma_ops(struct device *dev, bool coherent)
 {
-	dev->dma_coherent = coherent;
+	dev_assign_dma_coherent(dev, coherent);
 }
 #endif
diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
index cb89d7e0ba88..a1ec2d71d1c9 100644
--- a/arch/riscv/mm/dma-noncoherent.c
+++ b/arch/riscv/mm/dma-noncoherent.c
@@ -140,7 +140,7 @@ void arch_setup_dma_ops(struct device *dev, bool coherent)
 		   "%s %s: device non-coherent but no non-coherent operations supported",
 		   dev_driver_string(dev), dev_name(dev));
 
-	dev->dma_coherent = coherent;
+	dev_assign_dma_coherent(dev, coherent);
 }
 
 void riscv_noncoherent_supported(void)
diff --git a/drivers/base/core.c b/drivers/base/core.c
index e94749092345..8a83d7c93361 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -3173,7 +3173,7 @@ void device_initialize(struct device *dev)
 #if defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE) || \
     defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU) || \
     defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL)
-	dev->dma_coherent = dma_default_coherent;
+	dev_assign_dma_coherent(dev, dma_default_coherent);
 #endif
 	swiotlb_dev_init(dev);
 }
diff --git a/drivers/dma/ti/k3-udma-glue.c b/drivers/dma/ti/k3-udma-glue.c
index f87d244cc2d6..686dc140293e 100644
--- a/drivers/dma/ti/k3-udma-glue.c
+++ b/drivers/dma/ti/k3-udma-glue.c
@@ -312,7 +312,7 @@ k3_udma_glue_request_tx_chn_common(struct device *dev,
 
 	if (xudma_is_pktdma(tx_chn->common.udmax)) {
 		/* prepare the channel device as coherent */
-		tx_chn->common.chan_dev.dma_coherent = true;
+		dev_set_dma_coherent(&tx_chn->common.chan_dev);
 		dma_coerce_mask_and_coherent(&tx_chn->common.chan_dev,
 					     DMA_BIT_MASK(48));
 	}
@@ -1003,7 +1003,7 @@ k3_udma_glue_request_rx_chn_priv(struct device *dev, const char *name,
 
 	if (xudma_is_pktdma(rx_chn->common.udmax)) {
 		/* prepare the channel device as coherent */
-		rx_chn->common.chan_dev.dma_coherent = true;
+		dev_set_dma_coherent(&rx_chn->common.chan_dev);
 		dma_coerce_mask_and_coherent(&rx_chn->common.chan_dev,
 					     DMA_BIT_MASK(48));
 	}
@@ -1104,7 +1104,7 @@ k3_udma_glue_request_remote_rx_chn_common(struct k3_udma_glue_rx_channel *rx_chn
 
 	if (xudma_is_pktdma(rx_chn->common.udmax)) {
 		/* prepare the channel device as coherent */
-		rx_chn->common.chan_dev.dma_coherent = true;
+		dev_set_dma_coherent(&rx_chn->common.chan_dev);
 		dma_coerce_mask_and_coherent(&rx_chn->common.chan_dev,
 					     DMA_BIT_MASK(48));
 		rx_chn->single_fdq = false;
diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index c964ebfcf3b6..1cf158eb7bdb 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -428,18 +428,18 @@ static void k3_configure_chan_coherency(struct dma_chan *chan, u32 asel)
 		/* No special handling for the channel */
 		chan->dev->chan_dma_dev = false;
 
-		chan_dev->dma_coherent = false;
+		dev_clear_dma_coherent(chan_dev);
 		chan_dev->dma_parms = NULL;
 	} else if (asel == 14 || asel == 15) {
 		chan->dev->chan_dma_dev = true;
 
-		chan_dev->dma_coherent = true;
+		dev_set_dma_coherent(chan_dev);
 		dma_coerce_mask_and_coherent(chan_dev, DMA_BIT_MASK(48));
 		chan_dev->dma_parms = chan_dev->parent->dma_parms;
 	} else {
 		dev_warn(chan->device->dev, "Invalid ASEL value: %u\n", asel);
 
-		chan_dev->dma_coherent = false;
+		dev_clear_dma_coherent(chan_dev);
 		chan_dev->dma_parms = NULL;
 	}
 }
diff --git a/include/linux/device.h b/include/linux/device.h
index b7a8b902efb3..5b0fb6ad4c72 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -481,6 +481,8 @@ struct device_physical_location {
  * @DEV_FLAG_STATE_SYNCED: The hardware state of this device has been synced to
  *		match the software state of this device by calling the
  *		driver/bus sync_state() callback.
+ * @DEV_FLAG_DMA_COHERENT: This particular device is dma coherent, even if the
+ *		architecture supports non-coherent devices.
  */
 enum struct_device_flags {
 	DEV_FLAG_READY_TO_PROBE = 0,
@@ -489,6 +491,7 @@ enum struct_device_flags {
 	DEV_FLAG_DMA_SKIP_SYNC = 3,
 	DEV_FLAG_DMA_OPS_BYPASS = 4,
 	DEV_FLAG_STATE_SYNCED = 5,
+	DEV_FLAG_DMA_COHERENT = 6,
 
 	DEV_FLAG_COUNT
 };
@@ -572,8 +575,6 @@ enum struct_device_flags {
  * @offline:	Set after successful invocation of bus type's .offline().
  * @of_node_reused: Set if the device-tree node is shared with an ancestor
  *              device.
- * @dma_coherent: this particular device is dma coherent, even if the
- *		architecture supports non-coherent devices.
  * @flags:	DEV_FLAG_XXX flags. Use atomic bitfield operations to modify.
  *
  * At the lowest level, every device in a Linux system is represented by an
@@ -681,11 +682,6 @@ struct device {
 	bool			offline_disabled:1;
 	bool			offline:1;
 	bool			of_node_reused:1;
-#if defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE) || \
-    defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU) || \
-    defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL)
-	bool			dma_coherent:1;
-#endif
 
 	DECLARE_BITMAP(flags, DEV_FLAG_COUNT);
 };
@@ -718,6 +714,7 @@ __create_dev_flag_accessors(dma_iommu, DEV_FLAG_DMA_IOMMU);
 __create_dev_flag_accessors(dma_skip_sync, DEV_FLAG_DMA_SKIP_SYNC);
 __create_dev_flag_accessors(dma_ops_bypass, DEV_FLAG_DMA_OPS_BYPASS);
 __create_dev_flag_accessors(state_synced, DEV_FLAG_STATE_SYNCED);
+__create_dev_flag_accessors(dma_coherent, DEV_FLAG_DMA_COHERENT);
 
 #undef __create_dev_flag_accessors
 
diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index edd7de60a957..44dd9035b4fe 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -230,7 +230,7 @@ int dma_direct_set_offset(struct device *dev, phys_addr_t cpu_start,
 extern bool dma_default_coherent;
 static inline bool dev_is_dma_coherent(struct device *dev)
 {
-	return dev->dma_coherent;
+	return dev_dma_coherent(dev);
 }
 #else
 #define dma_default_coherent true
-- 
2.53.0.1213.gd9a14994de-goog


