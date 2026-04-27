Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EF1FF8861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 08:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ail2lVL3dWEqgRxZp5PukiHL/0s3kbhlmerEN0zncxU=; b=jgPrV33ZrC7DnjQDIjkF7+Aiyo
	MbG+4Aaa7Vi2gF5wKlBcAH1ZVDGDIvGUGZCPUvi1ACUFoK3hj2q18KUvKr8/hXJG5EGyoMCct4YJs
	EzC3vS+cj616kdDDiZM8EcV3gPGACWZ4F1NRyruxrSZTsk5b6tOIc6waYW1Grsv0V1cNrQuSy3zfc
	OJTuh9K+d7rUVtKS/fkdGH+1datGy8MVrE5JJ3zAYEuzqu1AEpoVwV0vi5VwdnEeWhS81Oxr6w4x7
	rL1AUBfLB4WxXYs7o+7nTdFlIzShxesTohEUtcAw3pdSNRGcwgOXBNRgZJRBEv7R/ujx4DIgs730B
	zDG3pt8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHjh-0000000GUzV-31Ru;
	Mon, 27 Apr 2026 08:54:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHjf-0000000GUxr-0Lh1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 08:54:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B09AF4097E;
	Mon, 27 Apr 2026 08:54:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2204C19425;
	Mon, 27 Apr 2026 08:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777280074;
	bh=HoP5ReyaifPvF79Qumt8YpJX3hht02/hAu43N/E/zHs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eiBH86U2DNdf4f0du7Ehk0tKslaUzKD0QpK0j8ABwIj2d5UMNOdmNT9UZzAHe5dLd
	 S+PEeDwN7vUfqXkLSS8wfmoKha0tkkuZuElKXA5Qx2ymyXGINUJza3eFXxBomYHk+i
	 8N4VF3JPCmU1jn8L6xlAlQ2+I89GxXTPcTqjbITevunyEfIgDyFJY1u3OOJZHZMeZ5
	 U1ZhlWyZRXx0yjdrpG0i0Ns1vh0DDvocOadPdjQ/eMDBFvKSP7PHLjTDMmQuTqAAWe
	 Z73xgePhYYQ0wO5Jv9VA5b8s/wSNgmkMd+KlrHngwZih3atyCDryxQxI6wwKZYPizz
	 +VXVfxdG+GbrQ==
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
	Joerg Roedel <joro@8bytes.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Pranjal Shrivastava <praan@google.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>
Subject: [RFC PATCH v4 06/16] coco: host: arm64: Add support for RMM vdev objects
Date: Mon, 27 Apr 2026 14:23:34 +0530
Message-ID: <20260427085344.941627-7-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427085344.941627-1-aneesh.kumar@kernel.org>
References: <20260427085344.941627-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_015435_164791_FA50785B 
X-CRM114-Status: GOOD (  20.63  )
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

An RMM vdev object represents the binding between a device function and
a Realm. For example, a vdev can represent a physical function of a PCIe
device or a virtual function of a multi-function PCIe device. Each vdev
is associated with one pdev.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 arch/arm64/include/asm/rmi_cmds.h        |  22 +++++
 arch/arm64/include/asm/rmi_smc.h         |  22 +++++
 drivers/virt/coco/arm-cca-host/arm-cca.c |  27 +++++-
 drivers/virt/coco/arm-cca-host/rmi-da.c  | 104 +++++++++++++++++++++++
 drivers/virt/coco/arm-cca-host/rmi-da.h  |   2 +
 5 files changed, 176 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/rmi_cmds.h b/arch/arm64/include/asm/rmi_cmds.h
index 2925abde3882..242ce2fac14e 100644
--- a/arch/arm64/include/asm/rmi_cmds.h
+++ b/arch/arm64/include/asm/rmi_cmds.h
@@ -903,4 +903,26 @@ static inline unsigned long rmi_vdev_abort(unsigned long vdev_phys)
 	return res.a0;
 }
 
+static inline unsigned long rmi_vdev_create(unsigned long rd,
+		unsigned long pdev_phys, unsigned long vdev_phys,
+		unsigned long vdev_params_phys)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_1_1_invoke(SMC_RMI_VDEV_CREATE, rd, pdev_phys,
+			     vdev_phys, vdev_params_phys, &res);
+
+	return res.a0;
+}
+
+static inline unsigned long rmi_vdev_lock(unsigned long rd,
+		unsigned long pdev_phys, unsigned long vdev_phys)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_1_1_invoke(SMC_RMI_VDEV_LOCK, rd, pdev_phys, vdev_phys, &res);
+
+	return res.a0;
+}
+
 #endif /* __ASM_RMI_CMDS_H */
diff --git a/arch/arm64/include/asm/rmi_smc.h b/arch/arm64/include/asm/rmi_smc.h
index 72e4a53b74b0..d14d13a9f169 100644
--- a/arch/arm64/include/asm/rmi_smc.h
+++ b/arch/arm64/include/asm/rmi_smc.h
@@ -650,4 +650,26 @@ enum rmi_vdev_state {
 	RMI_VDEV_STARTED,
 	RMI_VDEV_ERROR,
 };
+
+#define MAX_VDEV_ADDR_RANGE 8
+
+struct rmi_vdev_params {
+	union {
+		struct {
+			u64 flags;
+			u64 vdev_id;
+			u64 tdi_id;
+			u64 padding1;
+			u64 vsmmu_addr;
+			u64 vsid;
+			u64 num_addr_range;
+		};
+		u8 padding2[0x200];
+	};
+	union { /* 0x200 */
+		struct rmi_addr_range addr_range[MAX_VDEV_ADDR_RANGE];
+		u8 padding3[0x1000 - 0x200];
+	};
+};
+
 #endif /* __ASM_RMI_SMC_H */
diff --git a/drivers/virt/coco/arm-cca-host/arm-cca.c b/drivers/virt/coco/arm-cca-host/arm-cca.c
index 8b1182620872..5930a30dd16f 100644
--- a/drivers/virt/coco/arm-cca-host/arm-cca.c
+++ b/drivers/virt/coco/arm-cca-host/arm-cca.c
@@ -12,7 +12,8 @@
 #include <linux/vmalloc.h>
 #include <linux/cleanup.h>
 #include <linux/pci-doe.h>
-
+#include <linux/pci.h>
+#include <linux/kvm_host.h>
 
 #include "rmi-da.h"
 
@@ -449,11 +450,35 @@ static void cca_tsm_disconnect(struct pci_dev *pdev)
 	}
 }
 
+static struct pci_tdi *cca_tsm_bind(struct pci_dev *pdev, struct kvm *kvm, u32 tdi_id)
+{
+	void *rmm_vdev;
+	struct pci_dev *dsm_dev = pdev->tsm->dsm_dev;
+	struct realm *realm = &kvm->arch.realm;
+
+	struct cca_host_tdi *host_tdi __free(kfree) =
+		kzalloc(sizeof(struct cca_host_tdi), GFP_KERNEL);
+	if (!host_tdi)
+		return ERR_PTR(-ENOMEM);
+
+	pci_tsm_tdi_constructor(pdev, &host_tdi->tdi, kvm, tdi_id);
+	/* Assign the tdi such that vdev_create can use that to lookup */
+	pdev->tsm->tdi = &host_tdi->tdi;
+	rmm_vdev = cca_vdev_create(realm, pdev, dsm_dev, tdi_id);
+	if (IS_ERR_OR_NULL(rmm_vdev)) {
+		pdev->tsm->tdi = NULL;
+		return rmm_vdev;
+	}
+
+	return &no_free_ptr(host_tdi)->tdi;
+}
+
 static struct pci_tsm_ops cca_link_pci_ops = {
 	.probe = cca_tsm_pci_probe,
 	.remove = cca_tsm_pci_remove,
 	.connect = cca_tsm_connect,
 	.disconnect = cca_tsm_disconnect,
+	.bind = cca_tsm_bind,
 };
 
 static void cca_link_tsm_remove(void *tsm_dev)
diff --git a/drivers/virt/coco/arm-cca-host/rmi-da.c b/drivers/virt/coco/arm-cca-host/rmi-da.c
index d61c3191c038..84f0b2211cd1 100644
--- a/drivers/virt/coco/arm-cca-host/rmi-da.c
+++ b/drivers/virt/coco/arm-cca-host/rmi-da.c
@@ -934,3 +934,107 @@ int cca_pdev_disconnect_stream(struct pci_dev *pdev1,
 
 	return submit_stream_work(pdev1, pdev2, stream_handle);
 }
+
+static unsigned long pci_get_tdi_id(struct pci_dev *pdev)
+{
+	/* requester segment is marked reserved. */
+	return pci_dev_id(pdev);
+}
+
+static void init_vdev_params_mmio_range(struct pci_dev *pdev,
+		struct rmi_vdev_params *params)
+{
+	int index = 0;
+
+	for (int i = 0; i < PCI_STD_NUM_BARS; i++) {
+		struct resource *res = &pdev->resource[i];
+
+		if (!(res->flags & IORESOURCE_MEM))
+			continue;
+
+		if (resource_size(res) == 0)
+			continue;
+
+		index = insert_addr_range_sorted(params->addr_range, index,
+						 res->start, res->end + 1);
+	}
+
+	params->num_addr_range = index;
+}
+
+
+void *cca_vdev_create(struct realm *realm, struct pci_dev *pdev,
+		struct pci_dev *pf0_dev, u32 guest_rid)
+{
+	phys_addr_t rd_phys = virt_to_phys(realm->rd);
+	struct rmi_vdev_params *params = NULL;
+	struct cca_host_pdev_dsc *pdev_dsc;
+	struct cca_host_tdi *host_tdi;
+	phys_addr_t rmm_pdev_phys;
+	phys_addr_t rmm_vdev_phys;
+	bool should_free = true;
+	void *rmm_vdev;
+	int ret;
+
+	pdev_dsc = to_cca_pdev_dsc(pf0_dev);
+	if (!pdev_dsc->rmm_pdev) {
+		ret = -EINVAL;
+		goto err_out;
+	}
+
+	rmm_vdev = (void *)get_zeroed_page(GFP_KERNEL);
+	if (!rmm_vdev) {
+		ret =  -ENOMEM;
+		goto err_out;
+	}
+
+	rmm_vdev_phys = virt_to_phys(rmm_vdev);
+	if (rmi_delegate_page(rmm_vdev_phys)) {
+		ret = -ENXIO;
+		goto err_granule_delegate;
+	}
+
+	params = (struct rmi_vdev_params *)get_zeroed_page(GFP_KERNEL);
+	if (!params) {
+		ret = -ENOMEM;
+		goto err_params_alloc;
+	}
+
+	params->flags = 0;
+	params->vdev_id = guest_rid;
+	params->tdi_id = pci_get_tdi_id(pdev);
+
+	init_vdev_params_mmio_range(pdev, params);
+
+	rmm_pdev_phys = virt_to_phys(pdev_dsc->rmm_pdev);
+	if (rmi_vdev_create(rd_phys, rmm_pdev_phys,
+			    rmm_vdev_phys, virt_to_phys(params))) {
+		ret = -ENXIO;
+		goto err_vdev_create;
+	}
+
+	/* setup host_tdi before call to device communicate */
+	host_tdi = to_cca_host_tdi(pdev);
+	host_tdi->rmm_vdev = rmm_vdev;
+	host_tdi->realm = realm;
+
+	submit_vdev_state_transition_work(pdev, RMI_VDEV_UNLOCKED);
+
+	ret = rmi_vdev_lock(rd_phys, rmm_pdev_phys, rmm_vdev_phys);
+
+	submit_vdev_state_transition_work(pdev, RMI_VDEV_LOCKED);
+
+	free_page((unsigned long)params);
+	return rmm_vdev;
+
+err_vdev_create:
+	free_page((unsigned long)params);
+err_params_alloc:
+	if (rmi_undelegate_page(rmm_vdev_phys))
+		should_free = false;
+err_granule_delegate:
+	if (should_free)
+		free_page((unsigned long)rmm_vdev);
+err_out:
+	return ERR_PTR(ret);
+}
diff --git a/drivers/virt/coco/arm-cca-host/rmi-da.h b/drivers/virt/coco/arm-cca-host/rmi-da.h
index 88fa428f788e..cd13cbf650d5 100644
--- a/drivers/virt/coco/arm-cca-host/rmi-da.h
+++ b/drivers/virt/coco/arm-cca-host/rmi-da.h
@@ -233,5 +233,7 @@ int cca_pdev_stream_connect(struct pci_dev *pdev1, struct pci_dev *pdev2,
 		unsigned long *stream_handle);
 int cca_pdev_disconnect_stream(struct pci_dev *pdev1,
 		struct pci_dev *pdev2, unsigned long stream_handle);
+void *cca_vdev_create(struct realm *realm, struct pci_dev *pdev,
+		struct pci_dev *pf0_dev, u32 guest_rid);
 
 #endif
-- 
2.43.0


