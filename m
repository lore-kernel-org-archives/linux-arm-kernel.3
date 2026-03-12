Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24FC7FED2E4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 08:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E6NIerxBsrN8edPNxuGTvOMV6ADgBB5S+NzUOWgIyjA=; b=dtbQMVHrKYisZpSk2OD9oW1pao
	ml4RrL+YL2rqtv3+9OpXyKNWEfgX3ezbitG5k3IQu2Gsv62XnnfNIYNY7/q5Nz8ssAEh9GgEVPgfn
	Amuk0mwvwJBaKfISGbUPCiPri5C0X8pm+x84QwXIdW/4toc6/VBgdadnt5BC2bXS8a9gcy0XjXVho
	f+qTD5/HedqLZrcDmi0rXEI9etBmjoAo/QITrHk+BYbvKKFwS+CW1aALTXTXvFukA3RMHI+RhMwp4
	gxVMBRn1u+NnPOMKpcb7r9WvZgXtcMoV2y31JIr55hoeZjT2ISZFEC/48FG753zyRqECb/51FzZRA
	chpBNnQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0b5U-0000000DbZT-48Xo;
	Thu, 12 Mar 2026 08:08:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0b5R-0000000DbXU-1cnu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 08:08:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C6163443B4;
	Thu, 12 Mar 2026 08:08:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4957DC4AF0B;
	Thu, 12 Mar 2026 08:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773302884;
	bh=+ZVFRyet64MOMZyoMy8l00TcGwMuXrXVv4w3tq8rz+A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U/dZk9Z8ZHyQrD8ocJ/RcVnNYYQ7V3IMxNANFhgWSSESmV927lGjMUiESpRzf5iR+
	 hyS9itwt7m6N3vErX0ycpyfWPW16A41lNC0fisanhSStYpavjLwuawarThrZqYIR0x
	 pUbghGw7PgySg90QyArktmCijW502ZZfkAQnwEH21P7EVA5LAz4m+6QjQtHMgN5pfB
	 Ne89N+/PmNwsP6Ae7UBLuYEUiJZsKnQMjf8ODYP74tVX4BOVowQ8kv0IjzI5AhrRmv
	 GpaRfgbFR5Q31NnXZRluAL5+tR9Tu+fY7s88YYnU30jNJDvu6DXo8Wswg9/bjj58nX
	 s513Rji2dGLhA==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Dan Williams <dan.j.williams@intel.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Steven Price <steven.price@arm.com>
Subject: [RFC PATCH v3 02/12] coco: host: arm64: Add support for RMM vdev objects
Date: Thu, 12 Mar 2026 13:37:33 +0530
Message-ID: <20260312080743.3487326-3-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260312080743.3487326-1-aneesh.kumar@kernel.org>
References: <20260312080743.3487326-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_010805_477896_8F80B1B2 
X-CRM114-Status: GOOD (  21.49  )
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

Cc: Marc Zyngier <maz@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Alexey Kardashevskiy <aik@amd.com>
Cc: Samuel Ortiz <sameo@rivosinc.com>
Cc: Xu Yilun <yilun.xu@linux.intel.com>
Cc: Suzuki K Poulose <Suzuki.Poulose@arm.com>
Cc: Steven Price <steven.price@arm.com>
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 arch/arm64/include/asm/rmi_cmds.h        |  25 ++++++
 arch/arm64/include/asm/rmi_smc.h         |  24 +++++
 drivers/virt/coco/arm-cca-host/arm-cca.c |  25 ++++++
 drivers/virt/coco/arm-cca-host/rmi-da.c  | 110 ++++++++++++++++++++++-
 drivers/virt/coco/arm-cca-host/rmi-da.h  |   2 +
 5 files changed, 185 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/rmi_cmds.h b/arch/arm64/include/asm/rmi_cmds.h
index 0754d420faad..2a86de5eb160 100644
--- a/arch/arm64/include/asm/rmi_cmds.h
+++ b/arch/arm64/include/asm/rmi_cmds.h
@@ -614,4 +614,29 @@ static inline unsigned long rmi_vdev_abort(unsigned long vdev_phys)
 
 	return res.a0;
 }
+
+static inline unsigned long rmi_vdev_create(unsigned long rd,
+					    unsigned long pdev_phys,
+					    unsigned long vdev_phys,
+					    unsigned long vdev_params_phys)
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
+					  unsigned long pdev_phys,
+					  unsigned long vdev_phys)
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
index 14a2090cbac8..20c36a01df94 100644
--- a/arch/arm64/include/asm/rmi_smc.h
+++ b/arch/arm64/include/asm/rmi_smc.h
@@ -56,8 +56,11 @@
 #define SMC_RMI_PDEV_STOP		SMC_RMI_CALL(0x017c)
 #define SMC_RMI_VDEV_ABORT		SMC_RMI_CALL(0x0185)
 #define SMC_RMI_VDEV_COMMUNICATE	SMC_RMI_CALL(0x0186)
+#define SMC_RMI_VDEV_CREATE		SMC_RMI_CALL(0x0187)
 #define SMC_RMI_VDEV_GET_STATE		SMC_RMI_CALL(0x0189)
 
+#define SMC_RMI_VDEV_LOCK		SMC_RMI_CALL(0x01D2)
+
 #define RMI_ABI_MAJOR_VERSION	1
 #define RMI_ABI_MINOR_VERSION	0
 
@@ -455,4 +458,25 @@ enum rmi_vdev_state {
 	RMI_VDEV_STARTED,
 	RMI_VDEV_ERROR,
 };
+
+#define MAX_VDEV_AUX_GRANULES	32
+
+struct rmi_vdev_params {
+	union {
+		struct {
+			u64 flags;
+			u64 vdev_id;
+			u64 tdi_id;
+			u64 num_aux;
+		};
+		u8 padding1[0x100];
+	};
+	union {	/* 0x100 */
+		struct {
+			unsigned long aux[MAX_VDEV_AUX_GRANULES];
+		};
+		u8 padding2[0x900];
+	};
+};
+
 #endif /* __ASM_RMI_SMC_H */
diff --git a/drivers/virt/coco/arm-cca-host/arm-cca.c b/drivers/virt/coco/arm-cca-host/arm-cca.c
index 987c1be566ba..ae62749f36e8 100644
--- a/drivers/virt/coco/arm-cca-host/arm-cca.c
+++ b/drivers/virt/coco/arm-cca-host/arm-cca.c
@@ -12,6 +12,7 @@
 #include <linux/vmalloc.h>
 #include <linux/cleanup.h>
 #include <linux/kvm_host.h>
+#include <linux/pci.h>
 
 #include "rmi-da.h"
 
@@ -229,11 +230,35 @@ static void cca_tsm_disconnect(struct pci_dev *pdev)
 	clear_bit(stream_id, cca_stream_ids);
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
index af0632544911..336a4f5a832d 100644
--- a/drivers/virt/coco/arm-cca-host/rmi-da.c
+++ b/drivers/virt/coco/arm-cca-host/rmi-da.c
@@ -665,7 +665,7 @@ static int wait_for_vdev_state(struct pci_tsm *tsm, enum rmi_vdev_state target_s
 	return wait_for_dev_state(VDEV_COMMUNICATE, tsm, target_state, RMI_VDEV_ERROR);
 }
 
-static __maybe_unused void vdev_state_transition_workfn(struct work_struct *work)
+static void vdev_state_transition_workfn(struct work_struct *work)
 {
 	unsigned long state;
 	struct pci_tsm *tsm;
@@ -683,3 +683,111 @@ static __maybe_unused void vdev_state_transition_workfn(struct work_struct *work
 
 	complete(&setup_work->complete);
 }
+
+static int submit_vdev_state_transition_work(struct pci_dev *pdev, int target_state)
+{
+	enum rmi_vdev_state state;
+	struct dev_comm_work comm_work;
+	struct cca_host_comm_data *comm_data = to_cca_comm_data(pdev);
+	struct cca_host_tdi *host_tdi = to_cca_host_tdi(pdev);
+
+	INIT_WORK_ONSTACK(&comm_work.work, vdev_state_transition_workfn);
+	init_completion(&comm_work.complete);
+	comm_work.tsm = pdev->tsm;
+	comm_work.target_state = target_state;
+
+	queue_work(comm_data->work_queue, &comm_work.work);
+
+	wait_for_completion(&comm_work.complete);
+	destroy_work_on_stack(&comm_work.work);
+
+	/* check if we reached target state */
+	if (rmi_vdev_get_state(virt_to_phys(host_tdi->rmm_vdev), &state))
+		return -ENXIO;
+
+	if (state != target_state)
+		/* Protocol didn't take it to expected target state */
+		return -EPROTO;
+	return 0;
+}
+
+static unsigned long pci_get_tdi_id(struct pci_dev *pdev)
+{
+	/* requester segment is marked reserved. */
+	return pci_dev_id(pdev);
+}
+
+void *cca_vdev_create(struct realm *realm, struct pci_dev *pdev,
+		      struct pci_dev *pf0_dev, u32 guest_rid)
+{
+	phys_addr_t rd_phys = virt_to_phys(realm->rd);
+	struct rmi_vdev_params *params = NULL;
+	struct cca_host_pf0_dsc *pf0_dsc;
+	struct cca_host_tdi *host_tdi;
+	phys_addr_t rmm_pdev_phys;
+	phys_addr_t rmm_vdev_phys;
+	bool should_free = true;
+	void *rmm_vdev;
+	int ret;
+
+	pf0_dsc = to_cca_pf0_dsc(pf0_dev);
+	if (!pf0_dsc->rmm_pdev) {
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
+	if (rmi_granule_delegate(rmm_vdev_phys)) {
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
+	params->num_aux = 0;
+
+	rmm_pdev_phys = virt_to_phys(pf0_dsc->rmm_pdev);
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
+	if (rmi_granule_undelegate(rmm_vdev_phys))
+		should_free = false;
+err_granule_delegate:
+	if (should_free)
+		free_page((unsigned long)rmm_vdev);
+err_out:
+	return ERR_PTR(ret);
+}
diff --git a/drivers/virt/coco/arm-cca-host/rmi-da.h b/drivers/virt/coco/arm-cca-host/rmi-da.h
index 914a3c297c24..e92078ae9a90 100644
--- a/drivers/virt/coco/arm-cca-host/rmi-da.h
+++ b/drivers/virt/coco/arm-cca-host/rmi-da.h
@@ -139,4 +139,6 @@ static inline struct cca_host_tdi *to_cca_host_tdi(struct pci_dev *pdev)
 int cca_pdev_create(struct pci_dev *pdev);
 int cca_pdev_ide_setup(struct pci_dev *pdev);
 void cca_pdev_stop_and_destroy(struct pci_dev *pdev);
+void *cca_vdev_create(struct realm *realm, struct pci_dev *pdev,
+		      struct pci_dev *pf0_dev, u32 guest_rid);
 #endif
-- 
2.43.0


