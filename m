Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF02EE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 18:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YdMuO2gtmeL3RMqWaakXFL6M4DlcZZq40B5WqzcNta4=; b=YXSODuyGnswbJs83Me96l2HsVt
	o59GyISzPpIctCLr5ZIkyse4F7OsRkQEwLD6yXa8bXlg8m2nAKzxUxvJ1Bu5PEkWedhaIvsdwtW4b
	oqSQwt7k5twU6l0i7k+5i3DVkDS1F1WuaojA96430iTbinAWac2VXZ8DJicddJbuGupCwPBFv2Xhq
	TPof/0IJbG7DobsTq3tZM4qImm1V7O7agoSPfBr3oVFIJ/E0tZFelb/1uDKw/5QXRfr2LDtMeIRK/
	D3FS6ePlqWB1xYKng8e5GNs58ZgN2U/iV4pMkRF0eHvFTjyXuM6ThgWmLLXdkonboOFtqGs9ghzpg
	odp5Eqbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnzl-00000001R99-27lz;
	Thu, 12 Dec 2024 18:33:05 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnZB-00000001Jo3-1Cws
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:05:38 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43582d49dacso8227685e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734026735; x=1734631535; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YdMuO2gtmeL3RMqWaakXFL6M4DlcZZq40B5WqzcNta4=;
        b=hklB+DA0lyvhkIfd6xCjC3n7S44L1KnX4vQhqf6fYY9quKm4eH7TY8NVCMiLTkttCd
         t1vxVImNCeAMi4lkmUFGVZ0idDu4qz9YOC2nP3Z9u00wByKCNFDrKBlSgkyjQzs3FR+x
         Ak7he7/SAWFy/WPtThK637HGp+ktlVT9OwXIqNIEnFOR/eacbZ7fniXHuPeaijSLTQrk
         zHrp65sgzTsq2k8dLjWK5rIfQBEt2oNrhXgWLu0xN22tlIF3etgSky4Xv/AWKgMly7MR
         UhnOtI+CSqhk+TCHgLhkLmOtNP5ssfgZTtQkplxg60sNQONgzPCxOFq3alNKJURYFaXj
         xw3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734026735; x=1734631535;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YdMuO2gtmeL3RMqWaakXFL6M4DlcZZq40B5WqzcNta4=;
        b=N7crvTzUtJNxQXhmfTi1g0YCUbh27oE2W8mUFfh4HH9yYla3rvCJU8tmjNRvsxQMif
         LV8xVyB+6YFJQ7Rt547Ei2RCLbUitmheuhpWmc6CWtIfcRMRPaNc+31+DGs1fETy8UWx
         d5UQgcF+wdOGLojzWLGqY3mRpMzYnxagFbH3D1MviTD6Oj5aPIzomBQx5wUrUY5vFaOF
         aVvzh0YVID6MnGSSRd1tDQ9GYT4DNm8wqEmNtIUEzKcOcEECPQXfnWzbqeMEZrUpFexD
         oMHDZFluRbieXh3HrCTLNsq0Di6uftACIUVrMZ8ghQNvel9kJdAmOpOgmQLO215fLWKk
         GxUw==
X-Forwarded-Encrypted: i=1; AJvYcCWwqhrsxzCavlcObIfCcy8sQCf1+7Oux6tVb7DR34p+PFw8NOVXihSwx9dZiiWckoSvDzxG1pj0s3RDFuFBfoUI@lists.infradead.org
X-Gm-Message-State: AOJu0YwfOHl1dyeP+OMTmjYPV4uZK2/afkpcTH2K/1d3WPO8eBWgCyFB
	ZXgjbpW4KGtKMtY/Y2xI83kVaA2JWNuxw4KbGRQRbpylC7xUC91LmwjpiqYGNliNGSttUp+nJaP
	Q1RRtDteRYQ==
X-Google-Smtp-Source: AGHT+IFhLgvU2Rm+DNubCv6JNasQpuX6sd+/DiydVh4HkRumx8mqOJN1mpnAimZm+KH9fDL3y3s/kc2a4/LuEQ==
X-Received: from wmso20.prod.google.com ([2002:a05:600c:5114:b0:436:1abf:b8fe])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5028:b0:435:172:5052 with SMTP id 5b1f17b1804b1-4362282768bmr38379225e9.1.1734026735825;
 Thu, 12 Dec 2024 10:05:35 -0800 (PST)
Date: Thu, 12 Dec 2024 18:03:49 +0000
In-Reply-To: <20241212180423.1578358-1-smostafa@google.com>
Mime-Version: 1.0
References: <20241212180423.1578358-1-smostafa@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212180423.1578358-26-smostafa@google.com>
Subject: [RFC PATCH v2 25/58] KVM: arm64: iommu: Add SMMUv3 driver
From: Mostafa Saleh <smostafa@google.com>
To: iommu@lists.linux.dev, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, robdclark@gmail.com, joro@8bytes.org, 
	robin.murphy@arm.com, jean-philippe@linaro.org, jgg@ziepe.ca, 
	nicolinc@nvidia.com, vdonnefort@google.com, qperret@google.com, 
	tabba@google.com, danielmentz@google.com, tzukui@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_100537_326395_DF1DE183 
X-CRM114-Status: GOOD (  16.13  )
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
 arch/arm64/kvm/hyp/nvhe/Makefile            |  2 ++
 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c | 22 +++++++++++++++++++++
 drivers/iommu/Kconfig                       |  9 +++++++++
 include/kvm/arm_smmu_v3.h                   | 18 +++++++++++++++++
 4 files changed, 51 insertions(+)
 create mode 100644 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c
 create mode 100644 include/kvm/arm_smmu_v3.h

diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
index d846962e7246..edfd8a11ac90 100644
--- a/arch/arm64/kvm/hyp/nvhe/Makefile
+++ b/arch/arm64/kvm/hyp/nvhe/Makefile
@@ -16,6 +16,8 @@ hyp-obj-$(CONFIG_TRACING) += clock.o events.o trace.o
 hyp-obj-$(CONFIG_MODULES) += modules.o
 hyp-obj-y += $(lib-objs)
 
+hyp-obj-$(CONFIG_ARM_SMMU_V3_PKVM) += iommu/arm-smmu-v3.o
+
 $(obj)/hyp.lds: $(src)/hyp.lds.S FORCE
 	$(call if_changed_dep,cpp_lds_S)
 
diff --git a/arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c b/arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c
new file mode 100644
index 000000000000..d2a570c9f3ec
--- /dev/null
+++ b/arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * pKVM hyp driver for the Arm SMMUv3
+ *
+ * Copyright (C) 2022 Linaro Ltd.
+ */
+#include <asm/kvm_hyp.h>
+#include <kvm/arm_smmu_v3.h>
+#include <nvhe/iommu.h>
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
diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index b3aa1f5d5321..fea5d6a8b90b 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -437,6 +437,15 @@ config TEGRA241_CMDQV
 	  CMDQ-V extension.
 endif
 
+config ARM_SMMU_V3_PKVM
+	bool "ARM SMMUv3 support for protected Virtual Machines"
+	depends on KVM && ARM64
+	help
+	  Enable a SMMUv3 driver in the KVM hypervisor, to protect VMs against
+	  memory accesses from devices owned by the host.
+
+	  Say Y here if you intend to enable KVM in protected mode.
+
 config S390_IOMMU
 	def_bool y if S390 && PCI
 	depends on S390 && PCI
diff --git a/include/kvm/arm_smmu_v3.h b/include/kvm/arm_smmu_v3.h
new file mode 100644
index 000000000000..521028b3ff71
--- /dev/null
+++ b/include/kvm/arm_smmu_v3.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __KVM_ARM_SMMU_V3_H
+#define __KVM_ARM_SMMU_V3_H
+
+#include <asm/kvm_asm.h>
+#include <kvm/iommu.h>
+
+struct hyp_arm_smmu_v3_device {
+	struct kvm_hyp_iommu	iommu;
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
2.47.0.338.g60cca15819-goog


