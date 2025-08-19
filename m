Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ADCDCA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 00:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e98f0DNE5CRlyU4NM0kgE4ri91mOXmN3Zo8dZtJNlTc=; b=AWMhvIonR+QCNYJHA6Lmpv7Tat
	a2DBEeXWZtcS0WuBJKAF8ZlXKr7Jfj6JY0wF9eFyCiqjJaDGOTUENIzt+zIhNE1Eg+0uEEKbB0702
	0KvI9dffQvxTvedUIy27zvSa49pG1hwLXgf/GzEMN9FdKI8MfBR9sK4Mkob6JPgROxxHrcGDjZPvC
	79FmNa1Ahqe1L6ZMZg99Uyp2FZv3rtWD0wubH5aQIK9O57eHAjEZpYS9xxHpeOpQ6P9mc5jGi6N/2
	IvsfWxqvfZHPH9w7upabb/XoE+mJjwwnE6sZjOTgEuyW0vMSvlfJLp0j+UOY78oHKifb84mQFzQbV
	u/pK1Dmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoWJZ-0000000Buxt-1ocC;
	Wed, 20 Aug 2025 00:04:29 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoUFy-0000000BfSR-1lQu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 21:52:39 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-afcb7a2ba1dso474659566b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 14:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755640356; x=1756245156; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=e98f0DNE5CRlyU4NM0kgE4ri91mOXmN3Zo8dZtJNlTc=;
        b=XzgVzDDWA0HIh0udYmmm0wMO1b86GZIMovy6iFzBsvZrsvAxllZlmiCmJfw1z6CnrX
         wQKHgyCLEWrifgLwxBsmU0OWgT92rDy4B/gseBl1sJ64K6xgETHkMInKIq3xhsx/mjZs
         6UXwZSr7oCQPittjswEEmvS4DpAGHBGQPjtW4dfmE2cwkx8X8jTyV4hc5fjhHrcidKiT
         1aqL1GEid3pkp2k0r9l9HUkVmXTjaX3elMSKiMZgnnLMcXQRBDdQ9s6NX41EdqaJdc7V
         D62JLMoTMfdcKeV0DmuxdGKxSSr/P05zRIfREuSxDxI+3FuQEl1zHFMQumBp3AGHw3d4
         ZPfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755640356; x=1756245156;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e98f0DNE5CRlyU4NM0kgE4ri91mOXmN3Zo8dZtJNlTc=;
        b=otDN6TW7l/Du8YyoF5HSFzVevV2XCQvJb/le4+v+2/M0Jw/X8FpxHP+XChnAyYs96x
         8/eXq03PjjWJ/cVZMeFgtNymul5iak6H8UB+29Cs/jS4gmCWqmoXQ5Ig2t6tUj/vWN0m
         GWxlPETP+B3EY0omLIxaqRxUnZmmO2dlYSjKlnQZqID0IBDOFBfwZgVxo0C66FgfJH4p
         I3g5T5S5G0VpqRbedKZt9KVjwHtwBq2nyAChGT5jDc+35w4A+Mt6qO/faK+lFVjcmQfx
         evTl/nNyFxF9MHxgZsDy/1xfbR2dXhGEXWWRq26RurCvUscsRQaks6EhtWruoXOSZQlR
         OmWw==
X-Forwarded-Encrypted: i=1; AJvYcCVLW8uh73bhxThrJz7SL5HMhCH7peEYXTlcCXuhN+D724NfK98+sCHaeaww2g9T8MnhQVoNJIER0ijnLBClTLK4@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+ImAyEyatOMhiZ6Z2m8RJE6szqGkcbhmGuQWxcyXJYzNuK9yZ
	I4ITMjdj9KlvcNMTd0+rBTZEPZacpjRKdQ7llVmY8IYQo6RpZQGYm42lqBZW87RZzUYG0Bt3YOO
	6MyZAcZFew7JAZQ==
X-Google-Smtp-Source: AGHT+IHCyvZOecVyOHzeGqtTcsp9WMNtt0BHBZO+OkO4882nr2LShFVO1rZjvNy7Rv+QSkccbtheqDZoV50swQ==
X-Received: from edbek21.prod.google.com ([2002:a05:6402:3715:b0:61a:1a2c:d08e])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:7f8e:b0:af9:1122:6af0 with SMTP id a640c23a62f3a-afdf01cfa9dmr47797666b.30.1755640356474;
 Tue, 19 Aug 2025 14:52:36 -0700 (PDT)
Date: Tue, 19 Aug 2025 21:51:41 +0000
In-Reply-To: <20250819215156.2494305-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250819215156.2494305-1-smostafa@google.com>
X-Mailer: git-send-email 2.51.0.rc1.167.g924127e9c0-goog
Message-ID: <20250819215156.2494305-14-smostafa@google.com>
Subject: [PATCH v4 13/28] iommu/arm-smmu-v3-kvm: Add SMMUv3 driver
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, robin.murphy@arm.com, jean-philippe@linaro.org, 
	qperret@google.com, tabba@google.com, jgg@ziepe.ca, mark.rutland@arm.com, 
	praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_145238_461829_C7375AC1 
X-CRM114-Status: GOOD (  16.93  )
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
index 393ff143f0be..c71c96262378 100644
--- a/arch/arm64/kvm/hyp/nvhe/Makefile
+++ b/arch/arm64/kvm/hyp/nvhe/Makefile
@@ -31,6 +31,11 @@ hyp-obj-y += ../vgic-v3-sr.o ../aarch32.o ../vgic-v2-cpuif-proxy.o ../entry.o \
 hyp-obj-$(CONFIG_LIST_HARDENED) += list_debug.o
 hyp-obj-y += $(lib-objs)
 
+HYP_SMMU_V3_DRV_PATH = ../../../../../drivers/iommu/arm/arm-smmu-v3
+
+hyp-obj-$(CONFIG_ARM_SMMU_V3_PKVM) += $(HYP_SMMU_V3_DRV_PATH)/pkvm/arm-smmu-v3.o \
+	$(HYP_SMMU_V3_DRV_PATH)/arm-smmu-v3-common-hyp.o
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
2.51.0.rc1.167.g924127e9c0-goog


