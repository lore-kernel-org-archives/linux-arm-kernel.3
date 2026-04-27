Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 708D6FF8862
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 08:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QUGlcPuLO/CkzLab2ChySpGNiwb6n8ozAz0WAliLZ4w=; b=Wzlsbhhg7ctd4cgbEAH5SEL6U9
	7jK3M6Xq5LFyTZTXC/ZY3LFSko2OtCQv+ZOZKhuC5AZglReumB931uhN5NFzrFFKMPgfl2rcnrVK3
	7J7qCloDbX/kszUIIxLW2F7ulSjOGcEjd5TitzTH7EwQVGbsgMaHyNgGBWN0iufNn40SBsarBy3cj
	5qXqeFMKcQOvF27n+V91WCl0bogG29ANeuQm5yyN0iKc3YbLXidFBV4jT+jwoqaQiysMhZ5eIrS48
	wgdEmgiiiGehKjswCGFSf5l9Vpw7yVw0wVEtmOLbL5UXrKU7nUXhFwqxgR/EHmeO9RxEapRPc4C/s
	dWWc3Qww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHKX-0000000GSW5-47XC;
	Mon, 27 Apr 2026 08:28:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHKV-0000000GSUr-1MUE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 08:28:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EEDED440F1;
	Mon, 27 Apr 2026 08:28:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39541C2BCB4;
	Mon, 27 Apr 2026 08:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777278514;
	bh=jWDox4PMeXivGPI3967QCwIkfrrCveT4HT7lOBVxKvQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UyW/3dlOMlRwKnrOYnLbYnIDHNXE7tD9O4VWiIfBYUg35tWP0ARIVH1awxO2vHjin
	 DqBizOBPL6vdSGnIEJvtkIVrKEftfehCRX1UhXBZhS6KH7KeRi677YK99/JyPzsFkr
	 YLR1cWGLVX4zz+Msl2nq1rUCSr6c9s38+DGkNXKJTKMgK/waqwzMNVoyvkqyacom/k
	 lT5gOAe+8NtlcPP4RMG+ZpueZI/3FJXf6+glp6YpK6kQkut5NtEJKj1Ckaj1b98Ert
	 iCCWivn83c/f7ZKhPxswIbODnxApI9YoSHGxen3zgAho8kRw6aMF9WJt+VKZZOLsHS
	 7LL7Wanik2fGQ==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jonathan Cameron <jic23@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>
Subject: [RFC PATCH v4 04/11] coco: guest: arm64: Support guest-initiated TDI lock/unlock transitions
Date: Mon, 27 Apr 2026 13:57:58 +0530
Message-ID: <20260427082805.931832-5-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427082805.931832-1-aneesh.kumar@kernel.org>
References: <20260427082805.931832-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_012835_405572_C3F1FEB1 
X-CRM114-Status: GOOD (  17.25  )
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

Add guest helpers to drive TDI state transitions through RHI:
- cca_device_lock() -> RHI_DA_TDI_CONFIG_LOCKED
- cca_device_unlock() -> RHI_DA_TDI_CONFIG_UNLOCKED

Use these helpers in the PCI TSM lock/unlock callbacks so a successful
lock path returns a live pci_tsm handle and unlock transitions the device
back to unlocked state.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 drivers/virt/coco/arm-cca-guest/Makefile  |  2 +-
 drivers/virt/coco/arm-cca-guest/arm-cca.c |  9 ++++--
 drivers/virt/coco/arm-cca-guest/rsi-da.c  | 34 +++++++++++++++++++++++
 drivers/virt/coco/arm-cca-guest/rsi-da.h  |  3 ++
 4 files changed, 45 insertions(+), 3 deletions(-)
 create mode 100644 drivers/virt/coco/arm-cca-guest/rsi-da.c

diff --git a/drivers/virt/coco/arm-cca-guest/Makefile b/drivers/virt/coco/arm-cca-guest/Makefile
index 65c4cc52c154..11db7af095c9 100644
--- a/drivers/virt/coco/arm-cca-guest/Makefile
+++ b/drivers/virt/coco/arm-cca-guest/Makefile
@@ -2,4 +2,4 @@
 obj-$(CONFIG_ARM_CCA_GUEST) += arm-cca-guest.o
 
 arm-cca-guest-y +=  arm-cca.o
-arm-cca-guest-$(CONFIG_PCI_TSM) +=  rhi-da.o
+arm-cca-guest-$(CONFIG_PCI_TSM) +=  rhi-da.o rsi-da.o
diff --git a/drivers/virt/coco/arm-cca-guest/arm-cca.c b/drivers/virt/coco/arm-cca-guest/arm-cca.c
index 0c12aae85e6d..d4880ca59fc5 100644
--- a/drivers/virt/coco/arm-cca-guest/arm-cca.c
+++ b/drivers/virt/coco/arm-cca-guest/arm-cca.c
@@ -211,14 +211,19 @@ static struct pci_tsm *cca_tsm_lock(struct tsm_dev *tsm_dev, struct pci_dev *pde
 	if (ret)
 		return ERR_PTR(ret);
 
-	/* For now always return an error */
-	return ERR_PTR(-EIO);
+	ret = cca_device_lock(pdev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return &no_free_ptr(cca_dsc)->pci.base_tsm;
 }
 
 static void cca_tsm_unlock(struct pci_tsm *tsm)
 {
 	struct cca_guest_dsc *cca_dsc = to_cca_guest_dsc(tsm->pdev);
 
+	cca_device_unlock(tsm->pdev);
+
 	kfree(cca_dsc);
 }
 
diff --git a/drivers/virt/coco/arm-cca-guest/rsi-da.c b/drivers/virt/coco/arm-cca-guest/rsi-da.c
new file mode 100644
index 000000000000..2c3017933fb0
--- /dev/null
+++ b/drivers/virt/coco/arm-cca-guest/rsi-da.c
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 ARM Ltd.
+ */
+
+#include <linux/pci.h>
+#include <asm/rsi_cmds.h>
+
+#include "rsi-da.h"
+#include "rhi-da.h"
+
+int cca_device_lock(struct pci_dev *pdev)
+{
+	int ret;
+
+	ret = rhi_vdev_set_tdi_state(pdev, RHI_DA_TDI_CONFIG_LOCKED);
+	if (ret) {
+		pci_err(pdev, "failed to lock the device (%d)\n", ret);
+		return ret;
+	}
+	return 0;
+}
+
+int cca_device_unlock(struct pci_dev *pdev)
+{
+	int ret;
+
+	ret = rhi_vdev_set_tdi_state(pdev, RHI_DA_TDI_CONFIG_UNLOCKED);
+	if (ret) {
+		pci_err(pdev, "failed to unlock the device (%d)\n", ret);
+		return ret;
+	}
+	return 0;
+}
diff --git a/drivers/virt/coco/arm-cca-guest/rsi-da.h b/drivers/virt/coco/arm-cca-guest/rsi-da.h
index 858bfdaf59c9..06fcea95d888 100644
--- a/drivers/virt/coco/arm-cca-guest/rsi-da.h
+++ b/drivers/virt/coco/arm-cca-guest/rsi-da.h
@@ -32,4 +32,7 @@ static inline int rsi_vdev_id(struct pci_dev *pdev)
 	       PCI_DEVID(pdev->bus->number, pdev->devfn);
 }
 
+int cca_device_lock(struct pci_dev *pdev);
+int cca_device_unlock(struct pci_dev *pdev);
+
 #endif
-- 
2.43.0


