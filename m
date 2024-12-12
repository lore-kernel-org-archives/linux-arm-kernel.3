Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4171E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 18:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mH2sHDIHNxX5nvm0uCAa4ZRouYkSHZdk/Fqj9806/G4=; b=ck45A0Fa4DUegXKNHJCkfXSeDO
	qebFfUu30DKH4Jxef6n/l26cvq7lEGogiOLoXI71yohDUsljy1VYlZgYe3FOyzw6mA2X0R4uftogw
	MAcDKnA+2hpU6hHsbWvZJxZ/I9r+dNhgby//uMAhxF8B0NYhobEEby7GaLAhmzcybDXkEZusKjxSi
	H9Qhw0xbp2xOkr0X1YS6l3z3BEopuWrCfA8Bf3LEgL3Ze8SoKe14zdDEtpOlSnUDLr4ZM7FrY7UOX
	AMZDnIcp5F0PsaScLsdhYLK34cXLAGOOTSJr3jV6XZ1hgfgD3KfKR+3Gu/voUJ2fMrLG8g7hXl3fq
	TTQuHhxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLoHW-00000001VH4-44hl;
	Thu, 12 Dec 2024 18:51:26 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnZl-00000001K1a-2R73
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:06:14 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3862a49fbdaso431166f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734026772; x=1734631572; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mH2sHDIHNxX5nvm0uCAa4ZRouYkSHZdk/Fqj9806/G4=;
        b=LcHptxyTnuuqjMrGhcjm+avICOhKYa/F+OULtWNOVoTZAKAT+STMytJ9UwPJN27GUz
         y2+fJjwCKGNOcqTkZMOzfjiFryb3YgCi48DoUjeKx0AFc0iBKWmLWJE0yJmVgrDDjuD/
         /aNIbzgJChMie2t4+3MfolkN59L75zPaWSDgrWgI7sPZW6nfEdFeN1sLjLamWL1/RS8w
         7dCABoKIc+5V/4x+C/g9nZn+qZHv3DwocWHohbKbbo9np4/IUSKKXFGuTkLtAwZKm3T8
         zI2TWotXXpj8Nbg4cvLASbGQ3z4UjUGEjAMZ7tTLm00fryDhoDrUt5qkKqEp1uIZZkS/
         hguA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734026772; x=1734631572;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mH2sHDIHNxX5nvm0uCAa4ZRouYkSHZdk/Fqj9806/G4=;
        b=u/c1bAgpbjiCJPyF5MSpUxAIwAypMsEV2/Nex3YE8xfEPXLXjmL1vza073g2CUDTLz
         K8QbTtWvrK5iq2lJWE0C8TGiZDBIZUKDEnWSoy7lN01U3Q05ycv4sohIzpvrJboAOzpL
         4if9aj5POkTXoK4doSKbZFjqerAZM/0ikGmAPyjpKTPIkKQUDo/RaAqgO3ylaD3i3Fv/
         TAZ/o9BoU8ozZNri+PYxKd4owS/x5dXWmuU9zKJNXfqStxkDrilRw+RTfzq3CXFRuN+W
         iPrrzSqTB/cxdpnaAM1Nwayt/uaHdGCxAgZwESBkU7NHLyh62iJ1n894vNmal8bsCFWW
         xflQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfbn/PB1iQAGnYGx6UKVUDRentqgh9jqW8nUyBvqj7M1fylcpLOMmnQUiOcWVlrVLj1EAYDA90qq2ErbrqRsMb@lists.infradead.org
X-Gm-Message-State: AOJu0YwTOLAjfZC+jrwYSdUlzNipLCThldoC4Akztq50hECsjEKG9VRm
	Yp0xDOPdsLyDM+oJUgVnuqkRdXcZhQTyZEcwsmXx5a9s1HZgd2/829GjJAX6yFKpH6ZsVakEG7Q
	hwFmRBIuSxQ==
X-Google-Smtp-Source: AGHT+IHYgcere8DY5zEOS+VqEf+/VNdzFtnyb9Z2He5v/bXnj5TKjXPCmvJhIeCirHysNJOzaHefewW8JahNgA==
X-Received: from wmgg16.prod.google.com ([2002:a05:600d:10:b0:434:a7ee:3c40])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:584b:0:b0:385:df84:8496 with SMTP id ffacd0b85a97d-3864ce4b01fmr5749345f8f.3.1734026771740;
 Thu, 12 Dec 2024 10:06:11 -0800 (PST)
Date: Thu, 12 Dec 2024 18:04:06 +0000
In-Reply-To: <20241212180423.1578358-1-smostafa@google.com>
Mime-Version: 1.0
References: <20241212180423.1578358-1-smostafa@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212180423.1578358-43-smostafa@google.com>
Subject: [RFC PATCH v2 42/58] iommu/arm-smmu-v3-kvm: Add host driver for pKVM
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
X-CRM114-CacheID: sfid-20241212_100613_618324_B20733CA 
X-CRM114-Status: GOOD (  19.23  )
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

Under protected KVM (pKVM), the host does not have access to guest or
hypervisor memory. This means that devices owned by the host must be
isolated by the SMMU, and the hypervisor is in charge of the SMMU.

Introduce the host component that replaces the normal SMMUv3 driver when
pKVM is enabled, and sends configuration and requests to the actual
driver running in the hypervisor (EL2).

Rather than rely on regular driver probe, pKVM directly calls
kvm_arm_smmu_v3_init(), which synchronously finds all SMMUs and hands
them to the hypervisor. If the regular driver is enabled, it will not
find any free SMMU to drive once it gets probed.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/Makefile        |  6 ++
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c   | 64 +++++++++++++++++++
 2 files changed, 70 insertions(+)
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c

diff --git a/drivers/iommu/arm/arm-smmu-v3/Makefile b/drivers/iommu/arm/arm-smmu-v3/Makefile
index 515a84f14783..7a182adbebc1 100644
--- a/drivers/iommu/arm/arm-smmu-v3/Makefile
+++ b/drivers/iommu/arm/arm-smmu-v3/Makefile
@@ -6,3 +6,9 @@ arm_smmu_v3-$(CONFIG_ARM_SMMU_V3_SVA) += arm-smmu-v3-sva.o
 arm_smmu_v3-$(CONFIG_TEGRA241_CMDQV) += tegra241-cmdqv.o
 
 obj-$(CONFIG_ARM_SMMU_V3_KUNIT_TEST) += arm-smmu-v3-test.o
+
+obj-$(CONFIG_ARM_SMMU_V3_PKVM) += arm_smmu_v3_kvm.o
+ccflags-$(CONFIG_ARM_SMMU_V3_PKVM) += -Iarch/arm64/kvm/
+arm_smmu_v3_kvm-objs-y += arm-smmu-v3-kvm.o
+arm_smmu_v3_kvm-objs-y += arm-smmu-v3-common.o
+arm_smmu_v3_kvm-objs := $(arm_smmu_v3_kvm-objs-y)
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
new file mode 100644
index 000000000000..8cea33d15e08
--- /dev/null
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * pKVM host driver for the Arm SMMUv3
+ *
+ * Copyright (C) 2022 Linaro Ltd.
+ */
+#include <asm/kvm_mmu.h>
+
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+
+#include <kvm/arm_smmu_v3.h>
+
+#include "arm-smmu-v3.h"
+
+extern struct kvm_iommu_ops kvm_nvhe_sym(smmu_ops);
+
+static int kvm_arm_smmu_probe(struct platform_device *pdev)
+{
+	return -ENOSYS;
+}
+
+static void kvm_arm_smmu_remove(struct platform_device *pdev)
+{
+}
+
+static const struct of_device_id arm_smmu_of_match[] = {
+	{ .compatible = "arm,smmu-v3", },
+	{ },
+};
+
+static struct platform_driver kvm_arm_smmu_driver = {
+	.driver = {
+		.name = "kvm-arm-smmu-v3",
+		.of_match_table = arm_smmu_of_match,
+	},
+	.remove = kvm_arm_smmu_remove,
+};
+
+static int kvm_arm_smmu_v3_init_drv(void)
+{
+	return platform_driver_probe(&kvm_arm_smmu_driver, kvm_arm_smmu_probe);
+}
+
+static void kvm_arm_smmu_v3_remove_drv(void)
+{
+	platform_driver_unregister(&kvm_arm_smmu_driver);
+}
+
+struct kvm_iommu_driver kvm_smmu_v3_ops = {
+	.init_driver = kvm_arm_smmu_v3_init_drv,
+	.remove_driver = kvm_arm_smmu_v3_remove_drv,
+};
+
+static int kvm_arm_smmu_v3_register(void)
+{
+	if (!is_protected_kvm_enabled())
+		return 0;
+
+	return kvm_iommu_register_driver(&kvm_smmu_v3_ops,
+					kern_hyp_va(lm_alias(&kvm_nvhe_sym(smmu_ops))));
+};
+
+core_initcall(kvm_arm_smmu_v3_register);
-- 
2.47.0.338.g60cca15819-goog


