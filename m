Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1936E77178
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 12:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eeCBlcIwLaY2mG6jZqfUVdEsB7Kam1ZpO0aPx+zXCZk=; b=p/hnFkZAmhpJtJrVZxwEmRic0B
	2JUUlkP61mbbwUuhu4+CzTMWczaDwuWEUUzxFRMiwNE2Zuk0bbWavO2aDJQqWIrsR0uc4cpzSh3Pe
	oH/6VHdy2x9bWRmuNb+gvzp5Nqm/ElNaHlO0GJiyR1BqPC639QjkgcufOoo223L5hiqwdOV1vXl1Q
	iKUTBYObOmF+QIfsFZS21NAlt/enVtssqEB33BHg2CwIw9LYP2QtKYey9yQRkbCRYaNEcK9J1vn+Z
	MYURS9QEHY2pMTDzkyA+xhakzt50XualYT7anRYH68OB8pYv+HwrMCv9/DDRDJ0vTWaLO3RlVSElS
	phLvIrhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIoxJ-0000000Case-3Z1C;
	Wed, 04 Dec 2024 12:58:13 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIolc-0000000CYQn-0GSO;
	Wed, 04 Dec 2024 12:46:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B40BAA40DA1;
	Wed,  4 Dec 2024 12:44:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55C02C4CED2;
	Wed,  4 Dec 2024 12:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733316366;
	bh=SWvLGrD5bHK6LkQqH6wSJ0wPWFyKPMKVEBv+X+6czU8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Pgksu6L1x9lwvYyaR3de4qE6JqwFDBovjtoTrN72K/hv52SRySq6bgOz66gXZLGNz
	 H2EBNr2q9g5m4CWtw9cseezfj2nVE+Iry+yaV9zSR8GNv4brlz+JLl6UTuG2H81bVv
	 2FN3KyehEeefVz6SXsPjW6TPGStkwp5ym8FrRqrfDNT3tHvaV072SLW6CfEE4BQIpF
	 1xunjw5GxcrqrdOe9U3Qmst0MPdobQtxSTMjfDXkQ/F4+IIZxAZq0CHKa63n0AzFpN
	 PgnLfWoiTX3zLNJcJkMRtOGh+Uz8yHIzFXGsv89qxKkuikpmQUAlXQByHh8pNRcD6d
	 l55O49e2iQl0w==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tIolY-000RHy-3p;
	Wed, 04 Dec 2024 12:46:04 +0000
From: Marc Zyngier <maz@kernel.org>
To: iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-pci@vger.kernel.org
Cc: Joerg Roedel <joro@8bytes.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Toan Le <toan@os.amperecomputing.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>
Subject: [PATCH 01/11] irqchip: Make irq-msi-lib.h globally available
Date: Wed,  4 Dec 2024 12:45:39 +0000
Message-Id: <20241204124549.607054-2-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241204124549.607054-1-maz@kernel.org>
References: <20241204124549.607054-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: iommu@lists.linux.dev, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org, joro@8bytes.org, suravee.suthikulpanit@amd.com, dwmw2@infradead.org, baolu.lu@linux.intel.com, tglx@linutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com, chenhuacai@kernel.org, kernel@xen0n.name, jiaxun.yang@flygoat.com, andrew@lunn.ch, gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com, anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org, bhelgaas@google.com, toan@os.amperecomputing.com, alyssa@rosenzweig.io
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_044608_242996_AC04C326 
X-CRM114-Status: GOOD (  13.95  )
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

Move irq-msi-lib.h into include/linux/irqchip, making it available
to compilation units outside of drivers/irqchip. This requires some
churn in drivers to fetch it from the new location.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-gic-v2m.c                    | 2 +-
 drivers/irqchip/irq-gic-v3-its-msi-parent.c      | 2 +-
 drivers/irqchip/irq-gic-v3-its.c                 | 2 +-
 drivers/irqchip/irq-gic-v3-mbi.c                 | 2 +-
 drivers/irqchip/irq-imx-mu-msi.c                 | 2 +-
 drivers/irqchip/irq-loongarch-avec.c             | 2 +-
 drivers/irqchip/irq-loongson-pch-msi.c           | 2 +-
 drivers/irqchip/irq-msi-lib.c                    | 2 +-
 drivers/irqchip/irq-mvebu-gicp.c                 | 2 +-
 drivers/irqchip/irq-mvebu-icu.c                  | 2 +-
 drivers/irqchip/irq-mvebu-odmi.c                 | 2 +-
 drivers/irqchip/irq-mvebu-sei.c                  | 2 +-
 {drivers => include/linux}/irqchip/irq-msi-lib.h | 6 +++---
 13 files changed, 15 insertions(+), 15 deletions(-)
 rename {drivers => include/linux}/irqchip/irq-msi-lib.h (84%)

diff --git a/drivers/irqchip/irq-gic-v2m.c b/drivers/irqchip/irq-gic-v2m.c
index be35c5349986a..db79ae622f3c4 100644
--- a/drivers/irqchip/irq-gic-v2m.c
+++ b/drivers/irqchip/irq-gic-v2m.c
@@ -26,7 +26,7 @@
 #include <linux/irqchip/arm-gic.h>
 #include <linux/irqchip/arm-gic-common.h>
 
-#include "irq-msi-lib.h"
+#include <linux/irqchip/irq-msi-lib.h>
 
 /*
 * MSI_TYPER:
diff --git a/drivers/irqchip/irq-gic-v3-its-msi-parent.c b/drivers/irqchip/irq-gic-v3-its-msi-parent.c
index e150365fbe892..b4adee2a1aaae 100644
--- a/drivers/irqchip/irq-gic-v3-its-msi-parent.c
+++ b/drivers/irqchip/irq-gic-v3-its-msi-parent.c
@@ -8,7 +8,7 @@
 #include <linux/pci.h>
 
 #include "irq-gic-common.h"
-#include "irq-msi-lib.h"
+#include <linux/irqchip/irq-msi-lib.h>
 
 #define ITS_MSI_FLAGS_REQUIRED  (MSI_FLAG_USE_DEF_DOM_OPS |	\
 				 MSI_FLAG_USE_DEF_CHIP_OPS |	\
diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 92244cfa04647..334fd15be1de1 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -41,7 +41,7 @@
 #include <asm/exception.h>
 
 #include "irq-gic-common.h"
-#include "irq-msi-lib.h"
+#include <linux/irqchip/irq-msi-lib.h>
 
 #define ITS_FLAGS_CMDQ_NEEDS_FLUSHING		(1ULL << 0)
 #define ITS_FLAGS_WORKAROUND_CAVIUM_22375	(1ULL << 1)
diff --git a/drivers/irqchip/irq-gic-v3-mbi.c b/drivers/irqchip/irq-gic-v3-mbi.c
index 3fe870f8ee174..63c658375fd55 100644
--- a/drivers/irqchip/irq-gic-v3-mbi.c
+++ b/drivers/irqchip/irq-gic-v3-mbi.c
@@ -18,7 +18,7 @@
 
 #include <linux/irqchip/arm-gic-v3.h>
 
-#include "irq-msi-lib.h"
+#include <linux/irqchip/irq-msi-lib.h>
 
 struct mbi_range {
 	u32			spi_start;
diff --git a/drivers/irqchip/irq-imx-mu-msi.c b/drivers/irqchip/irq-imx-mu-msi.c
index 4342a21de1eb0..b3f656c6e7708 100644
--- a/drivers/irqchip/irq-imx-mu-msi.c
+++ b/drivers/irqchip/irq-imx-mu-msi.c
@@ -24,7 +24,7 @@
 #include <linux/pm_domain.h>
 #include <linux/spinlock.h>
 
-#include "irq-msi-lib.h"
+#include <linux/irqchip/irq-msi-lib.h>
 
 #define IMX_MU_CHANS            4
 
diff --git a/drivers/irqchip/irq-loongarch-avec.c b/drivers/irqchip/irq-loongarch-avec.c
index 0f6e465dd3095..c95704707219d 100644
--- a/drivers/irqchip/irq-loongarch-avec.c
+++ b/drivers/irqchip/irq-loongarch-avec.c
@@ -18,7 +18,7 @@
 #include <asm/loongarch.h>
 #include <asm/setup.h>
 
-#include "irq-msi-lib.h"
+#include <linux/irqchip/irq-msi-lib.h>
 #include "irq-loongson.h"
 
 #define VECTORS_PER_REG		64
diff --git a/drivers/irqchip/irq-loongson-pch-msi.c b/drivers/irqchip/irq-loongson-pch-msi.c
index bd337ecddb409..3f6f4e9887c53 100644
--- a/drivers/irqchip/irq-loongson-pch-msi.c
+++ b/drivers/irqchip/irq-loongson-pch-msi.c
@@ -15,7 +15,7 @@
 #include <linux/pci.h>
 #include <linux/slab.h>
 
-#include "irq-msi-lib.h"
+#include <linux/irqchip/irq-msi-lib.h>
 #include "irq-loongson.h"
 
 static int nr_pics;
diff --git a/drivers/irqchip/irq-msi-lib.c b/drivers/irqchip/irq-msi-lib.c
index d8e29fc0d4068..514b2616d9559 100644
--- a/drivers/irqchip/irq-msi-lib.c
+++ b/drivers/irqchip/irq-msi-lib.c
@@ -4,7 +4,7 @@
 
 #include <linux/export.h>
 
-#include "irq-msi-lib.h"
+#include <linux/irqchip/irq-msi-lib.h>
 
 /**
  * msi_lib_init_dev_msi_info - Domain info setup for MSI domains
diff --git a/drivers/irqchip/irq-mvebu-gicp.c b/drivers/irqchip/irq-mvebu-gicp.c
index 2b6183919ea48..b206b7fe03f17 100644
--- a/drivers/irqchip/irq-mvebu-gicp.c
+++ b/drivers/irqchip/irq-mvebu-gicp.c
@@ -17,7 +17,7 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 
-#include "irq-msi-lib.h"
+#include <linux/irqchip/irq-msi-lib.h>
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 
diff --git a/drivers/irqchip/irq-mvebu-icu.c b/drivers/irqchip/irq-mvebu-icu.c
index b337f6c05f184..30d51a26ea05f 100644
--- a/drivers/irqchip/irq-mvebu-icu.c
+++ b/drivers/irqchip/irq-mvebu-icu.c
@@ -20,7 +20,7 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 
-#include "irq-msi-lib.h"
+#include <linux/irqchip/irq-msi-lib.h>
 
 #include <dt-bindings/interrupt-controller/mvebu-icu.h>
 
diff --git a/drivers/irqchip/irq-mvebu-odmi.c b/drivers/irqchip/irq-mvebu-odmi.c
index ff19bfd258dce..0ba39fbdb451f 100644
--- a/drivers/irqchip/irq-mvebu-odmi.c
+++ b/drivers/irqchip/irq-mvebu-odmi.c
@@ -18,7 +18,7 @@
 #include <linux/of_address.h>
 #include <linux/slab.h>
 
-#include "irq-msi-lib.h"
+#include <linux/irqchip/irq-msi-lib.h>
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 
diff --git a/drivers/irqchip/irq-mvebu-sei.c b/drivers/irqchip/irq-mvebu-sei.c
index 065166ab5dbc0..c12e650ae7c92 100644
--- a/drivers/irqchip/irq-mvebu-sei.c
+++ b/drivers/irqchip/irq-mvebu-sei.c
@@ -14,7 +14,7 @@
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
 
-#include "irq-msi-lib.h"
+#include <linux/irqchip/irq-msi-lib.h>
 
 /* Cause register */
 #define GICP_SECR(idx)		(0x0  + ((idx) * 0x4))
diff --git a/drivers/irqchip/irq-msi-lib.h b/include/linux/irqchip/irq-msi-lib.h
similarity index 84%
rename from drivers/irqchip/irq-msi-lib.h
rename to include/linux/irqchip/irq-msi-lib.h
index 681ceabb7bc74..dd8d1d1385449 100644
--- a/drivers/irqchip/irq-msi-lib.h
+++ b/include/linux/irqchip/irq-msi-lib.h
@@ -2,8 +2,8 @@
 // Copyright (C) 2022 Linutronix GmbH
 // Copyright (C) 2022 Intel
 
-#ifndef _DRIVERS_IRQCHIP_IRQ_MSI_LIB_H
-#define _DRIVERS_IRQCHIP_IRQ_MSI_LIB_H
+#ifndef _IRQCHIP_IRQ_MSI_LIB_H
+#define _IRQCHIP_IRQ_MSI_LIB_H
 
 #include <linux/bits.h>
 #include <linux/irqdomain.h>
@@ -24,4 +24,4 @@ bool msi_lib_init_dev_msi_info(struct device *dev, struct irq_domain *domain,
 			       struct irq_domain *real_parent,
 			       struct msi_domain_info *info);
 
-#endif /* _DRIVERS_IRQCHIP_IRQ_MSI_LIB_H */
+#endif /* _IRQCHIP_IRQ_MSI_LIB_H */
-- 
2.39.2


