Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 536B7C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 19:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c9jYddvCz41uASA7Sa8Gd38u2bIDrZAA55dbZYiHYK0=; b=vU4xnrZVKcINwCKfXxjELGEyki
	1FQi45Pv5R/Nsj33z2dGytOwK9VJKvFE9YsYFrus+1rzNIgMbp5tS1mVXYTxHie/JdD1Wojav1M1t
	b3aWJYfVD3ezEfj46WslMJhOXZYHAGKMqRvjw0NW4aFz772ob+189w+WioUdg2xqoffWDw2geXIHd
	58GfEle/j1KoisS5gJT/JVCONb2O55s6w9fgrm42CAvo5uNyDEsQdVwnup+O49Lp9k+Dq0bjQQypd
	O4GD7SmoLZ8z6RIDVNW7USsnWDss83vJ3/zB7hHpQoCJMKXrAABOofOS81+OENMuGpBIlsVnK4nFn
	ImK9FNjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugTik-0000000FHux-3Jfg;
	Mon, 28 Jul 2025 19:41:14 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugS2o-0000000F8xB-0c3D
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 17:53:51 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3b782c29be3so1499410f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 10:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753725228; x=1754330028; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=c9jYddvCz41uASA7Sa8Gd38u2bIDrZAA55dbZYiHYK0=;
        b=YKPWMx79tje41FwFdUQf0Y45rDp28+csL6/SQlFgxkwiquZmut4k3q6e9VCoE3LNXm
         dexyBZakwnHDdOofL0v5P6YTogsNGcBwjx3GfBAB61ZtBKPzSvJUNSSx1jay4XU18t3G
         YUBwbbK9NlRwQPJwFlVT+nRjUnUo31mve82002hbdyU9siM6bonwKEcDiIb3ueydSdbN
         GhhTMVTcYVHaQEH4OKv6x43eVrpd/ENaUoZZyNY5ITdT7w7qY5zjC6/iWbdX+QHjvYHu
         IhHj+vNiaPCoyQ/00J1OFNsGaA15B/slLt2fGC/L7NQ5Eg9fjJM1rZb0loCm7+HXZHY4
         CdDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753725228; x=1754330028;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c9jYddvCz41uASA7Sa8Gd38u2bIDrZAA55dbZYiHYK0=;
        b=Y7W5dZiP/FAibQZkJd9Htag9Eo8O9YGzj36j93J3+Q8hA4vAslSpT9leZkGEH1l/mG
         o165GMj0x39inh6nmkHK1I8n1rLlnCp+qnZ3nm/vu388APos1v4WTNtBglBYCrTgY0cM
         VfnVxBCfijTncYybdSz9eKKxhwC+uv7muzw1MKhskKa8oR9UlqllDcn+s6E3VfVPoxm2
         nX5yV4YhLIm5yTJ3OTf5VPd12iJTslKuA1hu7tDh4pu/vPPKQEWuZX/h1FVOCrXr4cY5
         CKyUvW/+woOJUT9Gl3WQKvvt5VCTauU55eU6qB2rKcAi94WBPzAoc56qSFMpFLD7Sns1
         1c5w==
X-Forwarded-Encrypted: i=1; AJvYcCVV2Ve2oX7GfU5Mbbtcg+Ny/IdDuCef2jPTNFO3OzsxIa1EGClAoJ3SrsQgmTgrsdX1j3yynXudnZfG+kPvvtYj@lists.infradead.org
X-Gm-Message-State: AOJu0YyBqaFsx3wFK7ZBl2580crd1PqYw7y4+baW02ea2TndZ0COylU9
	jk0QPiwbO2zG+/1+Yw7iVnb8iMYmYZWC+sySSxJT1pxZyFUMSwatJyHuI8BENLh2MKzFtVgDRmE
	C85SKtZTAkPQVjg==
X-Google-Smtp-Source: AGHT+IEIq4MuTZmAyjvY5ywUEpjJvcVv09tn1ZoK52Hz7k9v+do6OvW02sN+sKfvQsmRTrBRzkW0d1TsmWpcEQ==
X-Received: from wmbhh14.prod.google.com ([2002:a05:600c:530e:b0:455:76a8:b3a])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:adf:a3d0:0:b0:3b7:899c:e867 with SMTP id ffacd0b85a97d-3b7899ceb31mr1880112f8f.59.1753725228115;
 Mon, 28 Jul 2025 10:53:48 -0700 (PDT)
Date: Mon, 28 Jul 2025 17:53:05 +0000
In-Reply-To: <20250728175316.3706196-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250728175316.3706196-1-smostafa@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250728175316.3706196-19-smostafa@google.com>
Subject: [PATCH v3 18/29] iommu/arm-smmu-v3-kvm: Add SMMUv3 driver
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
X-CRM114-CacheID: sfid-20250728_105350_195677_A438AF83 
X-CRM114-Status: GOOD (  17.04  )
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
 drivers/iommu/arm/Kconfig                     |  9 +++++++
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 24 +++++++++++++++++++
 .../iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h  | 16 +++++++++++++
 4 files changed, 54 insertions(+)
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
index ef42bbe07dbe..bcf4001521ad 100644
--- a/drivers/iommu/arm/Kconfig
+++ b/drivers/iommu/arm/Kconfig
@@ -142,3 +142,12 @@ config QCOM_IOMMU
 	select ARM_DMA_USE_IOMMU
 	help
 	  Support for IOMMU on certain Qualcomm SoCs.
+
+config ARM_SMMU_V3_PKVM
+	bool "ARM SMMUv3 support for protected Virtual Machines"
+	depends on KVM && ARM64
+	help
+	  Enable a SMMUv3 driver in the KVM hypervisor, to protect VMs against
+	  memory accesses from devices owned by the host.
+
+	  Say Y here if you intend to enable KVM in protected mode.
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
new file mode 100644
index 000000000000..2f43804e08e0
--- /dev/null
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
@@ -0,0 +1,24 @@
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
+/* Shared with the kernel driver in EL1 */
+struct kvm_iommu_ops smmu_ops = {
+	.init				= smmu_init,
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
2.50.1.552.g942d659e1b-goog


