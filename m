Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5407CFF8861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 08:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=560bJDme2eC9ETREQzXfWq6AoQZHjCd+IDTKi0mt4Jk=; b=im5I5FCQfGcYLlxCF/L/jOTAwf
	LssgkJwLpp07teIYy6d7fnTITIexpczbPotoZla24+JyQfIJDdgFAewB01BmlemJV1kDqTIel2/nF
	ZqDAaPRl7TMxRrf99ubguGGuy/EnX6tqLr8buMRti0GdEgX9iLLH58T9WardLGbceoTdrrKSvpeb/
	UCE/z4DyQhIr8vkHGcChKO5mrSE4C4Le55bmSDxis8FQvU7KEjzeWpqsYfJu6BlI1x1oNGatdqZFT
	e+UAep5JwBQmI7WNkGqJGq9He4ZpIdfTDgLkeDJ5GRYU91pgfsS9ftjqkYtDGLRWwPxj0pQgv0zg6
	/thQuWPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHKH-0000000GSOo-2amb;
	Mon, 27 Apr 2026 08:28:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHKF-0000000GSOE-44ST
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 08:28:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 585D060145;
	Mon, 27 Apr 2026 08:28:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A6E4C19425;
	Mon, 27 Apr 2026 08:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777278499;
	bh=lybotH1aprjln0PLII4oso8/TTzjYe9+EWScaClR5DE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gCMJTZ3TQERWQUjQsDMdBEVxy2QmSCgZ1Bl9vYWTEHDOVB3aUEgwAUHIFg4BBG1wx
	 Sl0y92uqSbGpQnuFRBtt+lJ0o66xN67YrE0w2OE8f6TnH/5wpOvjns7TXDm8nlHGR1
	 T1gs/rZK6sPpq5oQjQoVZg9/ZGfTrh6jG5VutKuUlBd49sTRJWnh4mZB6tUoLHaCMh
	 jl8s2GBHuPmcxThc/jXdZJf1in7Ydx6s0aS/6a9MHG/Qpq3l2LCsh5ctql9xrrEb1w
	 A8hKYWBv7MRDr77R6nl4RcnzxgANJVBGXbfccyrPgXde4B4DnMr1lF97Ed9ljuneG+
	 XvAyETZstrtLA==
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
Subject: [RFC PATCH v4 01/11] coco: guest: arm64: Guest TSM callback and realm device lock support
Date: Mon, 27 Apr 2026 13:57:55 +0530
Message-ID: <20260427082805.931832-2-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427082805.931832-1-aneesh.kumar@kernel.org>
References: <20260427082805.931832-1-aneesh.kumar@kernel.org>
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

Register the TSM callback when the DA feature is supported by RSI. The
build order is also adjusted so that the TSM class is created before the
arm-cca-guest driver is initialized.

In addition, add support for the TDISP lock sequence. Writing a TSM
(TEE Security Manager) device name from `/sys/class/tsm` into `tsm/lock`
triggers the realm device lock operation.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 arch/arm64/include/asm/rsi.h              |  1 +
 arch/arm64/include/asm/rsi_cmds.h         | 17 +++++++
 arch/arm64/include/asm/rsi_smc.h          |  1 +
 arch/arm64/kernel/rsi.c                   | 10 ++++
 drivers/virt/coco/Makefile                |  2 +-
 drivers/virt/coco/arm-cca-guest/Kconfig   |  5 ++
 drivers/virt/coco/arm-cca-guest/arm-cca.c | 60 ++++++++++++++++++++++-
 drivers/virt/coco/arm-cca-guest/rsi-da.h  | 35 +++++++++++++
 8 files changed, 129 insertions(+), 2 deletions(-)
 create mode 100644 drivers/virt/coco/arm-cca-guest/rsi-da.h

diff --git a/arch/arm64/include/asm/rsi.h b/arch/arm64/include/asm/rsi.h
index 34c8f649fe48..f5288551ae77 100644
--- a/arch/arm64/include/asm/rsi.h
+++ b/arch/arm64/include/asm/rsi.h
@@ -68,5 +68,6 @@ static inline int rsi_set_memory_range_shared(phys_addr_t start,
 				    RSI_CHANGE_DESTROYED);
 }
 
+bool rsi_has_da_feature(void);
 unsigned long realm_get_hyp_pagesize(void);
 #endif /* __ASM_RSI_H_ */
diff --git a/arch/arm64/include/asm/rsi_cmds.h b/arch/arm64/include/asm/rsi_cmds.h
index a341ce0eeda1..596bdc356f1a 100644
--- a/arch/arm64/include/asm/rsi_cmds.h
+++ b/arch/arm64/include/asm/rsi_cmds.h
@@ -169,4 +169,21 @@ static inline unsigned long rsi_host_call(struct rsi_host_call *rhi_call)
 	return res.a0;
 }
 
+/**
+ * rsi_features() - Read feature register
+ * @index: Feature register index
+ * @out: Feature register value is written to this pointer
+ *
+ * Return: RSI return code
+ */
+static inline unsigned long rsi_features(unsigned long index, u64 *out)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_1_1_invoke(SMC_RSI_FEATURES, index, &res);
+
+	*out = res.a1;
+	return res.a0;
+}
+
 #endif /* __ASM_RSI_CMDS_H */
diff --git a/arch/arm64/include/asm/rsi_smc.h b/arch/arm64/include/asm/rsi_smc.h
index 9ee8b5c7612e..4af4638fdd49 100644
--- a/arch/arm64/include/asm/rsi_smc.h
+++ b/arch/arm64/include/asm/rsi_smc.h
@@ -53,6 +53,7 @@
  */
 #define SMC_RSI_ABI_VERSION	SMC_RSI_FID(0x190)
 
+#define RSI_FEATURE_REGISTER_0_DA		BIT(0)
 /*
  * Read feature register.
  *
diff --git a/arch/arm64/kernel/rsi.c b/arch/arm64/kernel/rsi.c
index e49318469632..a3cd27bf82e8 100644
--- a/arch/arm64/kernel/rsi.c
+++ b/arch/arm64/kernel/rsi.c
@@ -17,6 +17,7 @@
 #include <asm/rhi.h>
 
 static struct realm_config config;
+static u64 rsi_feat_reg0;
 static unsigned long ipa_change_alignment = PAGE_SIZE;
 
 unsigned long prot_ns_shared;
@@ -25,6 +26,12 @@ EXPORT_SYMBOL(prot_ns_shared);
 DEFINE_STATIC_KEY_FALSE_RO(rsi_present);
 EXPORT_SYMBOL(rsi_present);
 
+bool rsi_has_da_feature(void)
+{
+	return u64_get_bits(rsi_feat_reg0, RSI_FEATURE_REGISTER_0_DA);
+}
+EXPORT_SYMBOL_GPL(rsi_has_da_feature);
+
 bool cc_platform_has(enum cc_attr attr)
 {
 	switch (attr) {
@@ -160,6 +167,9 @@ void __init arm64_rsi_init(void)
 	if (!ipa_change_alignment)
 		return;
 
+	if (WARN_ON(rsi_features(0, &rsi_feat_reg0)))
+		return;
+
 	prot_ns_shared = __phys_to_pte_val(BIT(config.ipa_bits - 1));
 
 	if (arm64_ioremap_prot_hook_register(realm_ioremap_hook))
diff --git a/drivers/virt/coco/Makefile b/drivers/virt/coco/Makefile
index b323b0ae4f82..4f7e30f5aeb8 100644
--- a/drivers/virt/coco/Makefile
+++ b/drivers/virt/coco/Makefile
@@ -7,6 +7,6 @@ obj-$(CONFIG_ARM_PKVM_GUEST)	+= pkvm-guest/
 obj-$(CONFIG_SEV_GUEST)		+= sev-guest/
 obj-$(CONFIG_INTEL_TDX_GUEST)	+= tdx-guest/
 obj-$(CONFIG_INTEL_TDX_HOST)	+= tdx-host/
-obj-$(CONFIG_ARM_CCA_GUEST)	+= arm-cca-guest/
 obj-$(CONFIG_TSM) 		+= tsm-core.o
 obj-$(CONFIG_TSM_GUEST)		+= guest/
+obj-$(CONFIG_ARM_CCA_GUEST)	+= arm-cca-guest/
diff --git a/drivers/virt/coco/arm-cca-guest/Kconfig b/drivers/virt/coco/arm-cca-guest/Kconfig
index a42359a90558..5f7f284dae1a 100644
--- a/drivers/virt/coco/arm-cca-guest/Kconfig
+++ b/drivers/virt/coco/arm-cca-guest/Kconfig
@@ -1,11 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
 config ARM_CCA_GUEST
 	tristate "Arm CCA Guest driver"
 	depends on ARM64
+	select PCI_TSM if PCI
 	select TSM_REPORTS
 	select AUXILIARY_BUS
 	help
 	  The driver provides userspace interface to request and
 	  attestation report from the Realm Management Monitor(RMM).
+	  If the DA feature is supported, it also register with TSM framework.
 
 	  If you choose 'M' here, this module will be called
 	  arm-cca-guest.
diff --git a/drivers/virt/coco/arm-cca-guest/arm-cca.c b/drivers/virt/coco/arm-cca-guest/arm-cca.c
index 7daada072cc0..6f13c54fab73 100644
--- a/drivers/virt/coco/arm-cca-guest/arm-cca.c
+++ b/drivers/virt/coco/arm-cca-guest/arm-cca.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2023 ARM Ltd.
+ * Copyright (C) 2023-2026 ARM Ltd.
  */
 
 #include <linux/auxiliary_bus.h>
@@ -15,6 +15,10 @@
 
 #include <asm/rsi.h>
 
+#ifdef CONFIG_PCI_TSM
+#include "rsi-da.h"
+#endif
+
 /**
  * struct arm_cca_token_info - a descriptor for the token buffer.
  * @challenge:		Pointer to the challenge data
@@ -192,6 +196,53 @@ static void unregister_cca_tsm_report(void *data)
 	tsm_report_unregister(&arm_cca_tsm_report_ops);
 }
 
+#ifdef CONFIG_PCI_TSM
+static struct pci_tsm *cca_tsm_lock(struct tsm_dev *tsm_dev, struct pci_dev *pdev)
+{
+	int ret;
+
+	struct cca_guest_dsc *cca_dsc __free(kfree) =
+		kzalloc_obj(struct cca_guest_dsc);
+	if (!cca_dsc)
+		return ERR_PTR(-ENOMEM);
+
+	ret = pci_tsm_devsec_constructor(pdev, &cca_dsc->pci, tsm_dev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	/* For now always return an error */
+	return ERR_PTR(-EIO);
+}
+
+static void cca_tsm_unlock(struct pci_tsm *tsm)
+{
+	struct cca_guest_dsc *cca_dsc = to_cca_guest_dsc(tsm->pdev);
+
+	kfree(cca_dsc);
+}
+
+static struct pci_tsm_ops cca_devsec_pci_ops = {
+	.lock = cca_tsm_lock,
+	.unlock = cca_tsm_unlock,
+};
+
+static void cca_devsec_tsm_remove(void *tsm_dev)
+{
+	tsm_unregister(tsm_dev);
+}
+
+static int cca_devsec_tsm_register(struct auxiliary_device *adev)
+{
+	struct tsm_dev *tsm_dev;
+
+	tsm_dev = tsm_register(&adev->dev, &cca_devsec_pci_ops);
+	if (IS_ERR(tsm_dev))
+		return PTR_ERR(tsm_dev);
+
+	return devm_add_action_or_reset(&adev->dev, cca_devsec_tsm_remove, tsm_dev);
+}
+#endif /* CONFIG_PCI_TSM */
+
 static int cca_devsec_tsm_probe(struct auxiliary_device *adev,
 		const struct auxiliary_device_id *id)
 {
@@ -212,6 +263,12 @@ static int cca_devsec_tsm_probe(struct auxiliary_device *adev,
 		return ret;
 	}
 
+#ifdef CONFIG_PCI_TSM
+	/* Allow tsm report even if tsm_register fails */
+	if (rsi_has_da_feature())
+		cca_devsec_tsm_register(adev);
+#endif
+
 	return 0;
 }
 
@@ -227,5 +284,6 @@ static struct auxiliary_driver cca_devsec_tsm_driver = {
 };
 module_auxiliary_driver(cca_devsec_tsm_driver);
 MODULE_AUTHOR("Sami Mujawar <sami.mujawar@arm.com>");
+MODULE_AUTHOR("Aneesh Kumar <aneesh.kumar@kernel.org>");
 MODULE_DESCRIPTION("Arm CCA Guest TSM Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/virt/coco/arm-cca-guest/rsi-da.h b/drivers/virt/coco/arm-cca-guest/rsi-da.h
new file mode 100644
index 000000000000..858bfdaf59c9
--- /dev/null
+++ b/drivers/virt/coco/arm-cca-guest/rsi-da.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2026 ARM Ltd.
+ */
+
+#ifndef _VIRT_COCO_RSI_DA_H_
+#define _VIRT_COCO_RSI_DA_H_
+
+#include <linux/pci.h>
+#include <linux/pci-tsm.h>
+#include <asm/rsi_smc.h>
+
+struct cca_guest_dsc {
+	struct pci_tsm_devsec pci;
+};
+
+static inline struct cca_guest_dsc *to_cca_guest_dsc(struct pci_dev *pdev)
+{
+	struct pci_tsm *tsm = pdev->tsm;
+
+	if (!tsm)
+		return NULL;
+	return container_of(tsm, struct cca_guest_dsc, pci.base_tsm);
+}
+
+/*
+ * Linux use device requester id as the vdev id.
+ */
+static inline int rsi_vdev_id(struct pci_dev *pdev)
+{
+	return (pci_domain_nr(pdev->bus) << 16) |
+	       PCI_DEVID(pdev->bus->number, pdev->devfn);
+}
+
+#endif
-- 
2.43.0


