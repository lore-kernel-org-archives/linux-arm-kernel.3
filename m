Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D95FF8865
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 06:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V+zp4s2QzLHuAkdatef8LP6ZHvaDtoyCXwG1S8asaJY=; b=pTZFRnBdLkqb1v0lftmH2r41xh
	6+qMi57TR2Ze1QAHF/j777esl9cbY7CbanWKm1C2BgiPEbQ6XxjLgjsNWZlYVBBvYAZctSxtmEmU8
	4MIIfrqFMduxpPfzkjMixPDkxNCYcfefZl/uaLo/buSPmade68HmYByM6DUAmYbKjXXj/mq+WEsVp
	fCfrDeZZjhZJUJBvCIozawopJ8w/NrG1PK3OVXseBt1Ioz7is+TXFpYjTwkR1k1YUJeRsmwD8rGNa
	PTPbj0dZLlGQi1rfb13AzPreomaabNhcoZimuWtP3h/xlJSM6WsHu9DCog6OOmWmL9P2k9SJMTfyw
	02gL9jaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHFoq-0000000GI5N-2CHW;
	Mon, 27 Apr 2026 06:51:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHFop-0000000GI50-2Jmg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 06:51:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EE3086014C;
	Mon, 27 Apr 2026 06:51:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5B94C19425;
	Mon, 27 Apr 2026 06:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777272706;
	bh=dXVSkfXFOX78UgFW20dAcjZ+t2/MgDkcG0mnxyEG+AU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mFMorngmP4n5ZNy59e3IGxRAEDoS87uDWsQmaaz5+/VD+zWcsl4HMCvZ7Th6x8GJB
	 GRmg23kXm7dLPZbtGEe41W+f0Qcd5o+OoJeaEYqDKzRB+a8YAVwTqD6HSd/4iknAQR
	 GqDBUIgwKqpaL19dOiR5KuztnLN7wslU2QjDqr93RdWFpcSaFrh47SssUI42eusN45
	 mp4rLdqz8lno314NIGzq0CZ1j2xeN4CDnsJl8EgBTUsnwiT4vDlssxotLGKFnnz5Qo
	 qlWZLb8ijM5TtYw8WvFamxtsAaqR72iaJEjDij2hKXvRYq3PwfJISqq1CSxr4OnnZP
	 57PTXkN8WYQ+w==
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
Subject: [RFC PATCH v4 02/14] coco: host: arm64: Create RMM pdev objects for PCI endpoints
Date: Mon, 27 Apr 2026 12:21:09 +0530
Message-ID: <20260427065121.916615-3-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427065121.916615-1-aneesh.kumar@kernel.org>
References: <20260427065121.916615-1-aneesh.kumar@kernel.org>
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

Add the RMI definitions needed for pdev management, including the pdev
state enum, parameter layout, and helpers for RMI_PDEV_CREATE and
RMI_PDEV_GET_STATE.

Introduce a host-side pdev descriptor and cca_pdev_create() to
allocate and delegate the backing granule, populate the pdev parameters
from the PCI endpoint, and issue RMI_PDEV_CREATE to the RMM.

The new helper stores the created RMM pdev handle in the PF0 endpoint
descriptor preparing the device for later IDE/TDISP setup.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 arch/arm64/include/asm/rmi_cmds.h       |  10 ++
 arch/arm64/include/asm/rmi_smc.h        |  49 ++++++++
 drivers/virt/coco/arm-cca-host/Makefile |   2 +-
 drivers/virt/coco/arm-cca-host/rmi-da.c | 151 ++++++++++++++++++++++++
 drivers/virt/coco/arm-cca-host/rmi-da.h |  26 ++++
 5 files changed, 237 insertions(+), 1 deletion(-)
 create mode 100644 drivers/virt/coco/arm-cca-host/rmi-da.c

diff --git a/arch/arm64/include/asm/rmi_cmds.h b/arch/arm64/include/asm/rmi_cmds.h
index 2901fc84d245..d23a0590c7ee 100644
--- a/arch/arm64/include/asm/rmi_cmds.h
+++ b/arch/arm64/include/asm/rmi_cmds.h
@@ -726,4 +726,14 @@ static inline int rmi_rtt_unmap_unprotected(unsigned long rd,
 	return res.a0;
 }
 
+static inline unsigned long rmi_pdev_get_state(unsigned long pdev_phys, enum rmi_pdev_state *state)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_1_1_invoke(SMC_RMI_PDEV_GET_STATE, pdev_phys, &res);
+
+	*state = res.a1;
+	return res.a0;
+}
+
 #endif /* __ASM_RMI_CMDS_H */
diff --git a/arch/arm64/include/asm/rmi_smc.h b/arch/arm64/include/asm/rmi_smc.h
index 109d6cc6ef37..94bcaf3e7e68 100644
--- a/arch/arm64/include/asm/rmi_smc.h
+++ b/arch/arm64/include/asm/rmi_smc.h
@@ -429,4 +429,53 @@ struct rec_run {
 	struct rec_exit exit;
 };
 
+enum rmi_pdev_state {
+	RMI_PDEV_NEW,
+	RMI_PDEV_NEEDS_KEY,
+	RMI_PDEV_HAS_KEY,
+	RMI_PDEV_READY,
+	RMI_PDEV_STOPPED,
+	RMI_PDEV_ERROR,
+};
+
+#define RMI_PDEV_FLAGS_SPDM		BIT(0)
+#define RMI_PDEV_FLAGS_CATEGORY_MASK	GENMASK(2, 1)
+#define RMI_PDEV_FLAGS_CATEGORY_SHIFT	1
+#define RMI_PDEV_FLAGS_P2P		BIT(3)
+
+#define RMI_PDEV_FLAGS_CATEGORY_ROOT_PORT	0x0
+#define RMI_PDEV_FLAGS_CATEGORY_OFF_CHIP_EP	0x1
+#define RMI_PDEV_FLAGS_CATEGORY_ON_CHIP_EP	0x2
+#define RMI_PDEV_FLAGS_CATEGORY_CMEM		0x3
+
+#define RMI_HASH_SHA_256	0x0
+#define RMI_HASH_SHA_512	0x1
+#define RMI_HASH_SHA_384	0x2
+
+struct rmi_pdev_params {
+	union {
+		struct {
+			u64 flags;
+			u64 pdev_id;
+			//u64 rc_id;
+			u64 routing_id;
+			u64 id_index;
+			union {
+				u16 rid_base;
+				u8 padding1[8];
+			};
+			union {
+				u16 rid_top;
+				u8 padding2[8];
+			};
+			union {
+				u8 hash_algo;
+				u8 padding3[8];
+			};
+			u64 max_vdevs_order;
+		};
+		u8 padding5[0x1000];
+	};
+};
+
 #endif /* __ASM_RMI_SMC_H */
diff --git a/drivers/virt/coco/arm-cca-host/Makefile b/drivers/virt/coco/arm-cca-host/Makefile
index c236827f002c..d48e8940af46 100644
--- a/drivers/virt/coco/arm-cca-host/Makefile
+++ b/drivers/virt/coco/arm-cca-host/Makefile
@@ -2,4 +2,4 @@
 #
 obj-$(CONFIG_ARM_CCA_HOST) += arm-cca-host.o
 
-arm-cca-host-y	+=  arm-cca.o
+arm-cca-host-y	+=  arm-cca.o rmi-da.o
diff --git a/drivers/virt/coco/arm-cca-host/rmi-da.c b/drivers/virt/coco/arm-cca-host/rmi-da.c
new file mode 100644
index 000000000000..8fb5d286fd82
--- /dev/null
+++ b/drivers/virt/coco/arm-cca-host/rmi-da.c
@@ -0,0 +1,151 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 ARM Ltd.
+ */
+
+#include <linux/pci.h>
+#include <linux/pci-ecam.h>
+#include <asm/rmi_cmds.h>
+
+#include "rmi-da.h"
+
+static int pci_ide_segment(struct pci_dev *pdev)
+{
+	if (pdev->fm_enabled)
+		return pci_domain_nr(pdev->bus);
+	return 0;
+}
+
+static unsigned int pci_get_max_rid(struct pci_dev *pdev)
+{
+	int fn;
+	int max_rid;
+	int slot = PCI_SLOT(pdev->devfn);
+
+	for (fn = 0; fn < 8; fn++) {
+		struct pci_dev *fn_dev;
+
+		fn_dev = pci_get_slot(pdev->bus, PCI_DEVFN(slot, fn));
+		if (!fn_dev)
+			continue;
+
+		max_rid = PCI_DEVFN(slot, fn);
+		pci_dev_put(fn_dev);
+	}
+	return max_rid;
+}
+
+static int init_pdev_params(struct pci_dev *pdev, struct rmi_pdev_params *params)
+{
+	int rid;
+	unsigned long category;
+	struct pci_config_window *cfg = pdev->bus->sysdata;
+
+	/* check we are ECAM compliant */
+	if (!pdev->bus->ops->map_bus)
+		return -EINVAL;
+
+	switch (pci_pcie_type(pdev)) {
+	case PCI_EXP_TYPE_ENDPOINT: {
+		struct cca_host_pf0_ep_dsc *pf0_ep_dsc = to_cca_pf0_ep_dsc(pdev);
+
+		/* Endpoint needs DOE mailbox */
+		if (!pf0_ep_dsc->pci.doe_mb)
+			return -EINVAL;
+
+		params->flags = RMI_PDEV_FLAGS_SPDM;
+		category = RMI_PDEV_FLAGS_CATEGORY_OFF_CHIP_EP;
+		break;
+	}
+	default:
+		return -EINVAL;
+	}
+
+	params->flags |= (category << RMI_PDEV_FLAGS_CATEGORY_SHIFT);
+	/* assign the ep device with RMM */
+	rid = pci_dev_id(pdev);
+	params->pdev_id = cfg->res.start | rid;
+	// ecam window base FIXME!!
+	//params->pdev_id = rid;
+	//params->rc_id = cfg->res.start;
+	params->routing_id = pci_ide_segment(pdev);
+	/* slot number for certificate chain default to zero */
+	params->id_index = 0;
+	params->hash_algo = RMI_HASH_SHA_256;
+	/* no multi function device here. */
+	params->rid_base = rid;
+	params->rid_top = pci_get_max_rid(pdev) + 1;
+	// FIXME!! what is this?
+	params->max_vdevs_order = 10;
+	return 0;
+}
+
+static inline int rmi_pdev_create(unsigned long pdev_phys,
+		unsigned long pdev_params_phys, unsigned long *rmi_ret)
+{
+
+	struct rmi_sro_state *sro __free(sro) =
+		rmi_sro_init(SMC_RMI_PDEV_CREATE, pdev_phys, pdev_params_phys);
+	if (!sro)
+		return -ENOMEM;
+
+	*rmi_ret = rmi_sro_execute(sro);
+
+	return 0;
+}
+
+int cca_pdev_create(struct pci_dev *pci_dev)
+{
+	int ret;
+	void *rmm_pdev;
+	bool should_free = true;
+	phys_addr_t rmm_pdev_phys;
+	struct rmi_pdev_params *params;
+	struct cca_host_pdev_dsc *pdev_dsc = to_cca_pdev_dsc(pci_dev);
+
+	rmm_pdev = (void *)get_zeroed_page(GFP_KERNEL);
+	if (!rmm_pdev)
+		return -ENOMEM;
+
+	rmm_pdev_phys = virt_to_phys(rmm_pdev);
+	if (rmi_delegate_page(rmm_pdev_phys)) {
+		ret = -EIO;
+		goto err_granule_delegate;
+	}
+
+	params = (struct rmi_pdev_params *)get_zeroed_page(GFP_KERNEL);
+	if (!params) {
+		ret = -ENOMEM;
+		goto err_param_alloc;
+	}
+
+	ret = init_pdev_params(pci_dev, params);
+	if (ret)
+		goto err_init_pdev_params;
+
+	{
+		unsigned long rmi_ret;
+
+		ret = rmi_pdev_create(rmm_pdev_phys, virt_to_phys(params),
+				      &rmi_ret);
+		if (ret || rmi_ret) {
+			if (!ret)
+				ret = -EIO;
+			goto err_init_pdev_params;
+		}
+	}
+
+	pdev_dsc->rmm_pdev = rmm_pdev;
+	free_page((unsigned long)params);
+	return 0;
+
+err_init_pdev_params:
+	free_page((unsigned long)params);
+err_param_alloc:
+	if (rmi_undelegate_page(rmm_pdev_phys))
+		should_free = false;
+err_granule_delegate:
+	if (should_free)
+		free_page((unsigned long)rmm_pdev);
+	return ret;
+}
diff --git a/drivers/virt/coco/arm-cca-host/rmi-da.h b/drivers/virt/coco/arm-cca-host/rmi-da.h
index 4abc7ad159e5..de67f10ce20e 100644
--- a/drivers/virt/coco/arm-cca-host/rmi-da.h
+++ b/drivers/virt/coco/arm-cca-host/rmi-da.h
@@ -12,13 +12,26 @@
 #include <asm/rmi_cmds.h>
 #include <asm/rmi_smc.h>
 
+/**
+ * struct cca_host_pdev_dsc - Common RMM pdev context
+ * @rmm_pdev: Delegated page backing the RMM pdev object
+ * @object_lock: Serializes access to the RMM pdev object and PF0/TDI caches
+ */
+struct cca_host_pdev_dsc {
+	void *rmm_pdev;
+	/* lock kept here to simplify the generic lock/unlock paths. */
+	struct mutex object_lock;
+};
+
 /**
  * struct cca_host_pf0_ep_dsc - PF0 endpoint device security context.
  * @pci: Physical Function 0 TDISP link context
+ * @pdev: pdev communication context
  * @sel_stream: Selective IDE Stream descriptor
  */
 struct cca_host_pf0_ep_dsc {
 	struct pci_tsm_pf0 pci;
+	struct cca_host_pdev_dsc pdev;
 	struct pci_ide *sel_stream;
 };
 
@@ -43,4 +56,17 @@ static inline struct cca_host_fn_dsc *to_cca_fn_dsc(struct pci_dev *pdev)
 	return container_of(tsm, struct cca_host_fn_dsc, pci);
 }
 
+static inline struct cca_host_pdev_dsc *to_cca_pdev_dsc(struct pci_dev *pdev)
+{
+	struct cca_host_pf0_ep_dsc *pf0_ep_dsc;
+
+	pf0_ep_dsc = to_cca_pf0_ep_dsc(pdev);
+	if (pf0_ep_dsc)
+		return &pf0_ep_dsc->pdev;
+
+	return NULL;
+}
+
+int cca_pdev_create(struct pci_dev *pdev);
+
 #endif
-- 
2.43.0


