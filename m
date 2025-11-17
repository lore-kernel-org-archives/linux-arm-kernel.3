Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CAE2CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 18:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VXBWv8Dw5hE8mlU4Sm4VTohDwotOri7T9rWgww1xmos=; b=rzdKrgSMvgfdRBPbRD84JrA+FU
	KO0tmj/7hzMapGeGQ/siB9s21LMPB81qpmoo3M+Ci2CoammkFfFR5vJBCYiFs5uzjH3rLc0igk9Sv
	81hx8eFmOXT8jkk26gnS7QBb7kZLDTniA4EaLnzaYMQ/+SwOm38G4fTvyGMzIVo0vqT7y691po1qN
	dAF2Z5tgm2D24mpwEIQJdE+qn8Fjb/PEhbjWeB3ywJsnJkTPlFr2a/HdFQYPSBM4J3H6KMgdZFCi4
	iFjkbPr4oyUpZT3PKBqbsTvneTC3U3/BHjb9d9m9vfuxTROY6Ck9tp8ZrzAuJIyvtr6+yDENJa7f9
	pC62QFSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4HX-0000000Gdn2-3oj6;
	Mon, 17 Nov 2025 18:48:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4HL-0000000GdYd-0BlO
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 17 Nov 2025 18:48:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VXBWv8Dw5hE8mlU4Sm4VTohDwotOri7T9rWgww1xmos=; b=MyLrIhykPdhqfsMqW1Lqy78pro
	qQC+ntxMYsiArGk4WXfwjyhUr2NTf853V+5srkZKwu7zHWrk7gd9YnkwdgSem/SYeYdzqTNDi31W5
	smzIRTKqUemUQajOTEetzckU12ir1GGTRCG3DIXvji9kjcy1fK6DwMMYZ6DzgqNmUhY8HmMYdxTWe
	Jp6YvxJ0Svv9IDCWXxy7wnUmMi3m2MRxeVfq+jeZz6BSsF5IiDdEUdHnfDrPFMucHFqmiZLiGSccp
	nWwPbRp/kgiP3DHazeTSrjJ2pMZ+4DyaQnY/5ypwebZynR87iS36eKp1MQ9gYSPrHasPaqVxRA96P
	Y4SHIbNw==;
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL3Pd-00000007wb8-460S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 17:53:16 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-42b2e448bd9so2994381f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 10:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763405318; x=1764010118; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VXBWv8Dw5hE8mlU4Sm4VTohDwotOri7T9rWgww1xmos=;
        b=10W9MORMu73nCKt3WrZ08z+1fZcLyLzz1R56uE2zu4gLGIHmGqzMK16mMHhgANGpSA
         1YFlxzQ6nGefwl5XrydQ5S24ujeJnHnVNuqCHWPouCWslJMjDQ9aQA9EF9McbauGfW3F
         PYpNaxoe4Lf/aHUd5PHiAfOlw1VIQ3zTxSU0kj8PO2Ix045kz/Z+jBqVdYnYKCFOv0vW
         ioSj0Z8vV6BVjjSFNIuxisIf6WO86ZG86/s5XhlmQD2tOc3ZZTvRlG6ylFZtoy1K6Gw/
         Krse3r+sxqBC9dWKz9L04TntNOyFuvDanyipR/vgHYBWxgmaEDMV4FdwrdLbw1Vey79c
         sUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763405318; x=1764010118;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VXBWv8Dw5hE8mlU4Sm4VTohDwotOri7T9rWgww1xmos=;
        b=Qgp1iZcR8uBS9yIiSLo9hpzZ40ehQ8lX6PtQa8bahNUuOZ9wATgHxw+dCogo2pULKf
         TFfRN/bLR+LsYeChXIMIU4miWygU3m4NS5xCgJchQJovUIDrvVeq9Kne/TNfaYJoZlwk
         V01JXFFlYLlGQC1OipljjtalwYSVdutYQYlgEBc7LzW50HiWi3pjYNXQTCN838ojNbEB
         GXowvP+0+dnkNUBuW07cFTECKSCRahwRKxAPdhp2r0VbI9NKzHbyH8n/OJsReWpHtswH
         1hK631UBF6q32azt2+JvxlefE0ppJxBMgZ67BunU+WpQRjy1OOZEO93abbGpFCQ8N7Mq
         lAXQ==
X-Gm-Message-State: AOJu0YyvIcuIMFGmpsmeh9RDNpjOYA7vrBoeKnAL9u5LxdbdGQf1YnI4
	p7uyrOIlRerAXgC6hsbcj+gAtp0pTpyFXEtP7IGwaIqoHJfQ8fid4fSkSixU+OaKaKKhHEjF1JS
	pxP8Svyr7d9yCygTbsFUUwDogPJCOhAIUG1XRsUdnjxdgeQrjQDxumvpp7X1xvtei4Hzz8jJGo0
	VbRxD7a0zKzJEKG2BdLhXqJhlzy8GxuZgdqIqsZsyMuaJXwRgl0z2R7ggz1pxS2gNnPA==
X-Google-Smtp-Source: AGHT+IHQBDWwjO/s1zZNuEFY1oL5kAjhY98F1o68vfkU7yeDw2zqyTvhCAFTbYHvFaunhrv4os5cxfn9oBJJZA==
X-Received: from wrxe9.prod.google.com ([2002:a05:6000:1209:b0:428:563f:ce93])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:615:b0:42b:3a1b:f71a with SMTP id ffacd0b85a97d-42b5934e2b6mr13388046f8f.23.1763405318003;
 Mon, 17 Nov 2025 10:48:38 -0800 (PST)
Date: Mon, 17 Nov 2025 18:47:59 +0000
In-Reply-To: <20251117184815.1027271-1-smostafa@google.com>
Mime-Version: 1.0
References: <20251117184815.1027271-1-smostafa@google.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251117184815.1027271-13-smostafa@google.com>
Subject: [PATCH v5 12/27] iommu/arm-smmu-v3-kvm: Add SMMUv3 driver
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org, jgg@ziepe.ca, 
	praan@google.com, danielmentz@google.com, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_175314_164262_BF2D08C0 
X-CRM114-Status: GOOD (  16.60  )
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

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

Add the skeleton for an Arm SMMUv3 driver at EL2.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/nvhe/Makefile              |  5 ++++
 drivers/iommu/arm/Kconfig                     |  9 ++++++
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 29 +++++++++++++++++++
 .../iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h  | 16 ++++++++++
 4 files changed, 59 insertions(+)
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h

diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
index 8210788d6f88..197685817546 100644
--- a/arch/arm64/kvm/hyp/nvhe/Makefile
+++ b/arch/arm64/kvm/hyp/nvhe/Makefile
@@ -32,6 +32,11 @@ hyp-obj-y += ../../../kernel/smccc-call.o
 hyp-obj-$(CONFIG_LIST_HARDENED) += list_debug.o
 hyp-obj-y += $(lib-objs)
 
+HYP_SMMU_V3_DRV_PATH = ../../../../../drivers/iommu/arm/arm-smmu-v3
+
+hyp-obj-$(CONFIG_ARM_SMMU_V3_PKVM) += $(HYP_SMMU_V3_DRV_PATH)/pkvm/arm-smmu-v3.o \
+	$(HYP_SMMU_V3_DRV_PATH)/arm-smmu-v3-common-lib.o
+
 ##
 ## Build rules for compiling nVHE hyp code
 ## Output of this folder is `kvm_nvhe.o`, a partially linked object
diff --git a/drivers/iommu/arm/Kconfig b/drivers/iommu/arm/Kconfig
index ef42bbe07dbe..7eeb94d2499d 100644
--- a/drivers/iommu/arm/Kconfig
+++ b/drivers/iommu/arm/Kconfig
@@ -142,3 +142,12 @@ config QCOM_IOMMU
 	select ARM_DMA_USE_IOMMU
 	help
 	  Support for IOMMU on certain Qualcomm SoCs.
+
+config ARM_SMMU_V3_PKVM
+	bool "ARM SMMUv3 support for protected Virtual Machines"
+	depends on KVM && ARM64 && ARM_SMMU_V3=y
+	help
+	  Enable a SMMUv3 driver in the KVM hypervisor, to protect VMs against
+	  memory accesses from devices owned by the host.
+
+	  Say Y here if you intend to enable KVM in protected mode.
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
new file mode 100644
index 000000000000..fa8b71152560
--- /dev/null
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * pKVM hyp driver for the Arm SMMUv3
+ *
+ * Copyright (C) 2022 Linaro Ltd.
+ */
+#include <asm/kvm_hyp.h>
+
+#include <nvhe/iommu.h>
+
+#include "arm_smmu_v3.h"
+
+size_t __ro_after_init kvm_hyp_arm_smmu_v3_count;
+struct hyp_arm_smmu_v3_device *kvm_hyp_arm_smmu_v3_smmus;
+
+static int smmu_init(void)
+{
+	return -ENOSYS;
+}
+
+static void smmu_host_stage2_idmap(phys_addr_t start, phys_addr_t end, int prot)
+{
+}
+
+/* Shared with the kernel driver in EL1 */
+struct kvm_iommu_ops smmu_ops = {
+	.init				= smmu_init,
+	.host_stage2_idmap		= smmu_host_stage2_idmap,
+};
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
new file mode 100644
index 000000000000..f6ad91d3fb85
--- /dev/null
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __KVM_ARM_SMMU_V3_H
+#define __KVM_ARM_SMMU_V3_H
+
+#include <asm/kvm_asm.h>
+
+struct hyp_arm_smmu_v3_device {
+};
+
+extern size_t kvm_nvhe_sym(kvm_hyp_arm_smmu_v3_count);
+#define kvm_hyp_arm_smmu_v3_count kvm_nvhe_sym(kvm_hyp_arm_smmu_v3_count)
+
+extern struct hyp_arm_smmu_v3_device *kvm_nvhe_sym(kvm_hyp_arm_smmu_v3_smmus);
+#define kvm_hyp_arm_smmu_v3_smmus kvm_nvhe_sym(kvm_hyp_arm_smmu_v3_smmus)
+
+#endif /* __KVM_ARM_SMMU_V3_H */
-- 
2.52.0.rc1.455.g30608eb744-goog


