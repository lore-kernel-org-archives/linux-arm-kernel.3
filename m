Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE3EC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 14:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LNlEoIgO0wR5QlrZitRJXlNwH+vSt8NW1jVCEZezapA=; b=imi4BBuNgrlrQBTDPkL6/Cmep3
	nLAIS/39Do5G26mm2ZnJzmO80jBRekel24gf+IKjEBk25pRTG4iWPIOkVKJKnl9i+QkfMignScaKE
	oRJNidz4K6Cic9ML1tEC2ex7dXWpcnu1w3k87oi9A41TlACYDEl4DI62QbSUc86TKNup8vuYYEd+G
	0Li5w5LofIFOBsXYCs3vR/kB3wt0s0z+SKQADUfw6riAQhrVjIgld4foishm2GLbuoTEJh/zDcrWq
	x/iHGLJOIVmHNl6KpleiFR2O6iWx24Mb4A0THJZkl6rsnp2R/4k1e3DA2OWr/rIiYEALPswR4NDWQ
	nTqoWUSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts0Qu-00000005xHS-0Nf5;
	Tue, 11 Mar 2025 14:18:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts0Oo-00000005wpz-2U42
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 14:16:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 097451516;
	Tue, 11 Mar 2025 07:16:13 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 120FE3F694;
	Tue, 11 Mar 2025 07:16:00 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: joro@8bytes.org,
	will@kernel.org
Cc: iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	yong.wu@mediatek.com
Subject: [PATCH] iommu/mediatek-v1: Support COMPILE_TEST
Date: Tue, 11 Mar 2025 14:15:56 +0000
Message-Id: <a8d7c0b4393b360ce556f5f15e229d1e2fe73c83.1741702556.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_071602_716352_124E748A 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
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

Add COMPILE_TEST support to Mediatek v1 so I have less chance of
breaking it again in future. This just needs the ARM dma-iommu API
stubbing out for now.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/Kconfig        |  3 +--
 drivers/iommu/mtk_iommu_v1.c | 11 ++++++++++-
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index ec1b5e32b972..d935b59abb35 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -483,8 +483,7 @@ config MTK_IOMMU
 
 config MTK_IOMMU_V1
 	tristate "MediaTek IOMMU Version 1 (M4U gen1) Support"
-	depends on ARM
-	depends on ARCH_MEDIATEK || COMPILE_TEST
+	depends on (ARCH_MEDIATEK && ARM) || COMPILE_TEST
 	select ARM_DMA_USE_IOMMU
 	select IOMMU_API
 	select MEMORY
diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index 3e724e7f10f0..66824982e05f 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -27,11 +27,20 @@
 #include <linux/spinlock.h>
 #include <linux/string_choices.h>
 #include <asm/barrier.h>
-#include <asm/dma-iommu.h>
 #include <dt-bindings/memory/mtk-memory-port.h>
 #include <dt-bindings/memory/mt2701-larb-port.h>
 #include <soc/mediatek/smi.h>
 
+#if defined(CONFIG_ARM)
+#include <asm/dma-iommu.h>
+#else
+#define arm_iommu_create_mapping(...) NULL
+#define arm_iommu_attach_device(...)	-ENODEV
+struct dma_iommu_mapping {
+	struct iommu_domain *domain;
+};
+#endif
+
 #define REG_MMU_PT_BASE_ADDR			0x000
 
 #define F_ALL_INVLD				0x2
-- 
2.39.2.101.g768bb238c484.dirty


