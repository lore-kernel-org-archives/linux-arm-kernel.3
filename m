Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A76CD6E68
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 08:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4aF9+d8jwgDAX56PY9Oecf4wOZ9YOQdZwhZO6X/dmDA=; b=bpKdS1tG5ND1YNouXXed5t+V2V
	ZXVannrUnsGojHNBeH0MGJIh3icF1aXs3Qa+JL8TQuqFFr8DUOYmftDmIicbLa4MKtPzDqzwp20Bv
	Ye6YdKIHO8i8YsCGg0B7lb/UBhuv7qeYqi+++iJtrgNb+L6QXSDQNqqaEK98nw2S7Oj7tJ5ju7mc0
	7EHlLR/NI3Lj6BoipWskNH8iC8hAqqbCE1fmmB4QJudfNUuyjSaSPbdeivovZ3A0bAompW1QZlZnY
	GAgiU1MZiCkCEsSQGyNi7I1bYw4srYHtMCJy3ufPPMFynG/VvLVjqyDeHpSbXO2ivAdH4/oDCjYkx
	02eHRd1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV3cl-0000000GNwq-3s3z;
	Thu, 04 Jun 2026 08:40:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV3cl-0000000GNwL-07Rf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 08:40:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C3E0D432E9;
	Thu,  4 Jun 2026 08:40:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC06B1F00898;
	Thu,  4 Jun 2026 08:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780562422;
	bh=4aF9+d8jwgDAX56PY9Oecf4wOZ9YOQdZwhZO6X/dmDA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZSAcfFlhwVoXj+bvE9YfbowEqQBV1/lgoSIeAFRJcpkKHwSs/j6JzCILJWkoZrYhQ
	 kFn6+KM7tJBsYQQBgnfTV2opqNsAG0x3D+sFC7a+6IWdM24Wvu579IiQJr5KPHuhpk
	 +Q9cG9POofUpPzLkKXLr2AZMA1JBJtglWRqpYpO92nmXndSknhtqkGaYmPxAYJnxBB
	 L1c6KC8V5RRssQOFW3NZC1aoelPWsOtMhR8NSBtEEqbQMOE0yOwQoHtOgjbBM/1abX
	 9MjBsnZeCbQt1ioCBWhXC62eBjVL0V2x4ezbsIA4JafSB7JeyX+7WS922MqP2zcwpf
	 bk1DLeIniUmLw==
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
	x86@kernel.org,
	Halil Pasic <pasic@linux.ibm.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Jaehoon Kim <jhkim@linux.ibm.com>
Subject: [PATCH v6 01/20] s390: Expose protected virtualization through cc_platform_has()
Date: Thu,  4 Jun 2026 14:09:40 +0530
Message-ID: <20260604083959.1265923-2-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
References: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
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

Protected virtualization guests use memory encryption, so advertise that to
the rest of the kernel through cc_platform_has(CC_ATTR_MEM_ENCRYPT).

s390 already forces DMA mappings to be unencrypted for protected
virtualization guests through force_dma_unencrypted(). Add
ARCH_HAS_CC_PLATFORM and provide the matching cc_platform_has()
implementation

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
Cc: Halil Pasic <pasic@linux.ibm.com>
Cc: Matthew Rosato <mjrosato@linux.ibm.com>
Cc: Jaehoon  Kim <jhkim@linux.ibm.com>
---
 arch/s390/Kconfig   |  1 +
 arch/s390/mm/init.c | 14 ++++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index ecbcbb781e40..9b5e6029e043 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -87,6 +87,7 @@ config S390
 	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
 	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
 	select ARCH_HAS_CC_CAN_LINK
+	select ARCH_HAS_CC_PLATFORM
 	select ARCH_HAS_CPU_FINALIZE_INIT
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DEBUG_VIRTUAL
diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
index 1f72efc2a579..ad3c6d92b801 100644
--- a/arch/s390/mm/init.c
+++ b/arch/s390/mm/init.c
@@ -50,6 +50,7 @@
 #include <linux/virtio_anchor.h>
 #include <linux/virtio_config.h>
 #include <linux/execmem.h>
+#include <linux/cc_platform.h>
 
 pgd_t swapper_pg_dir[PTRS_PER_PGD] __section(".bss..swapper_pg_dir");
 pgd_t invalid_pg_dir[PTRS_PER_PGD] __section(".bss..invalid_pg_dir");
@@ -140,6 +141,19 @@ bool force_dma_unencrypted(struct device *dev)
 	return is_prot_virt_guest();
 }
 
+
+bool cc_platform_has(enum cc_attr attr)
+{
+	switch (attr) {
+	case CC_ATTR_MEM_ENCRYPT:
+		return is_prot_virt_guest();
+
+	default:
+		return false;
+	}
+}
+EXPORT_SYMBOL_GPL(cc_platform_has);
+
 /* protected virtualization */
 static void __init pv_init(void)
 {
-- 
2.43.0


