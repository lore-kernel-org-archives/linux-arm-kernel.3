Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8055AFED2E4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 08:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E6H5rJShh9tbiCsdxR3tI58c/RB4fW7d0goDpWle4l0=; b=eM845GK+pPNNSF9S4A/vULgqF6
	pqXiR5XQcknEwK/cNLnClWA8S8Pgc6NFeyQ/+tp9zBg7LS+fgKZ//KoMQVowpE5QiyNlvYOZ1ER34
	ot1hA5G3UCetm/sDQeweBW7i2TJT4BVUW1FgLuOHA1bAdMv3vZdbkF9vfJfLATewhwzKsgRyHN6X7
	FaY+2Uyng5w6lCYECyvImI592B5g2rlkLuH4Gw4r0UcK5AVlAVu7PbHMb9gbaHouRBlao4CR7NSBd
	CcTNJF1Y6QF8SStt1Q1aONvHvvLym0I0dayU67gf8IEEl/Uw7UbgLmhPlKfPVcYPUtw+voqlZ/lQQ
	IzNWrJPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0b5M-0000000DbVi-0dQE;
	Thu, 12 Mar 2026 08:08:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0b5L-0000000DbVV-3Mya
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 08:07:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E8F4960137;
	Thu, 12 Mar 2026 08:07:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26464C4CEF7;
	Thu, 12 Mar 2026 08:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773302878;
	bh=fsk9ziY1cZxldFmz/qqIqI/KbWAai9Zln+Fuacips8M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AxuxTzNXEQJ9dwdtn1Ax40hIL9tRXOm7TpfjigtYwpD0wFUb6zExh8rV/aDYa0eOf
	 XQv9eAnVEIxCe15DgCgBJf46oziWqWKWkHxhQnaiaDx8+rx1qpY790l199Rtx+0Goo
	 Nd34Cz8rXex3hk8489LR1xQxdJekOPG415AeaRki75awvW8ZxBXaHLirZ/EXXaF4sF
	 9ECvkZ8cqxGHCxWJ2WIhXD0Nn3P0I4jxJuqPOvKgZDLVhr+gH6ymFKbVMxm0UTivof
	 N+de4Tew4Bxqnr+RPhUeCPY78K5IJoQiplnz6zzQvArF2xomgWs96EynegNhQJtb/J
	 XYl0h3anDYTPQ==
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
Subject: [RFC PATCH v3 01/12] coco: host: arm64: Add support for virtual device communication
Date: Thu, 12 Mar 2026 13:37:32 +0530
Message-ID: <20260312080743.3487326-2-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260312080743.3487326-1-aneesh.kumar@kernel.org>
References: <20260312080743.3487326-1-aneesh.kumar@kernel.org>
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

Add support for vdev_communicate with RMM.

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
 arch/arm64/include/asm/rmi_cmds.h       | 31 +++++++++++++
 arch/arm64/include/asm/rmi_smc.h        | 10 +++++
 drivers/virt/coco/arm-cca-host/rmi-da.c | 60 ++++++++++++++++++++++---
 drivers/virt/coco/arm-cca-host/rmi-da.h | 20 +++++++++
 4 files changed, 114 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/rmi_cmds.h b/arch/arm64/include/asm/rmi_cmds.h
index 339bea517760..0754d420faad 100644
--- a/arch/arm64/include/asm/rmi_cmds.h
+++ b/arch/arm64/include/asm/rmi_cmds.h
@@ -583,4 +583,35 @@ static inline unsigned long rmi_pdev_set_pubkey(unsigned long pdev_phys, unsigne
 	return res.a0;
 }
 
+static inline unsigned long rmi_vdev_communicate(unsigned long rd_phys,
+						 unsigned long pdev_phys,
+						 unsigned long vdev_phys,
+						 unsigned long vdev_comm_data_phys)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_1_1_invoke(SMC_RMI_VDEV_COMMUNICATE, rd_phys,
+			     pdev_phys, vdev_phys, vdev_comm_data_phys, &res);
+
+	return res.a0;
+}
+
+static inline unsigned long rmi_vdev_get_state(unsigned long vdev_phys, enum rmi_vdev_state *state)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_1_1_invoke(SMC_RMI_VDEV_GET_STATE, vdev_phys, &res);
+
+	*state = res.a1;
+	return res.a0;
+}
+
+static inline unsigned long rmi_vdev_abort(unsigned long vdev_phys)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_1_1_invoke(SMC_RMI_VDEV_ABORT, vdev_phys, &res);
+
+	return res.a0;
+}
 #endif /* __ASM_RMI_CMDS_H */
diff --git a/arch/arm64/include/asm/rmi_smc.h b/arch/arm64/include/asm/rmi_smc.h
index 907e00f4855a..14a2090cbac8 100644
--- a/arch/arm64/include/asm/rmi_smc.h
+++ b/arch/arm64/include/asm/rmi_smc.h
@@ -54,6 +54,9 @@
 #define SMC_RMI_PDEV_GET_STATE		SMC_RMI_CALL(0x0178)
 #define SMC_RMI_PDEV_SET_PUBKEY		SMC_RMI_CALL(0x017b)
 #define SMC_RMI_PDEV_STOP		SMC_RMI_CALL(0x017c)
+#define SMC_RMI_VDEV_ABORT		SMC_RMI_CALL(0x0185)
+#define SMC_RMI_VDEV_COMMUNICATE	SMC_RMI_CALL(0x0186)
+#define SMC_RMI_VDEV_GET_STATE		SMC_RMI_CALL(0x0189)
 
 #define RMI_ABI_MAJOR_VERSION	1
 #define RMI_ABI_MINOR_VERSION	0
@@ -445,4 +448,11 @@ struct rmi_public_key_params {
 	};
 };
 
+enum rmi_vdev_state {
+	RMI_VDEV_NEW,
+	RMI_VDEV_UNLOCKED,
+	RMI_VDEV_LOCKED,
+	RMI_VDEV_STARTED,
+	RMI_VDEV_ERROR,
+};
 #endif /* __ASM_RMI_SMC_H */
diff --git a/drivers/virt/coco/arm-cca-host/rmi-da.c b/drivers/virt/coco/arm-cca-host/rmi-da.c
index 029758ada136..af0632544911 100644
--- a/drivers/virt/coco/arm-cca-host/rmi-da.c
+++ b/drivers/virt/coco/arm-cca-host/rmi-da.c
@@ -11,6 +11,8 @@
 #include <crypto/internal/rsa.h>
 #include <keys/asymmetric-type.h>
 #include <keys/x509-parser.h>
+#include <linux/kvm_types.h>
+#include <asm/kvm_rmi.h>
 
 #include "rmi-da.h"
 
@@ -209,6 +211,7 @@ static int _do_dev_communicate(enum dev_comm_type type, struct pci_tsm *tsm)
 	int nbytes, cp_len;
 	struct cache_object **cache_objp, *cache_obj;
 	struct cca_host_pf0_dsc *pf0_dsc = to_cca_pf0_dsc(tsm->dsm_dev);
+	struct cca_host_tdi *host_tdi = to_cca_host_tdi(tsm->pdev);
 	struct cca_host_comm_data *comm_data = to_cca_comm_data(tsm->pdev);
 	struct rmi_dev_comm_enter *io_enter = &comm_data->io_params->enter;
 	struct rmi_dev_comm_exit *io_exit = &comm_data->io_params->exit;
@@ -219,7 +222,11 @@ static int _do_dev_communicate(enum dev_comm_type type, struct pci_tsm *tsm)
 		rmi_ret = rmi_pdev_communicate(virt_to_phys(pf0_dsc->rmm_pdev),
 					       virt_to_phys(comm_data->io_params));
 	else
-		rmi_ret = RMI_ERROR_INPUT;
+		rmi_ret = rmi_vdev_communicate(virt_to_phys(host_tdi->realm->rd),
+					       virt_to_phys(pf0_dsc->rmm_pdev),
+					       virt_to_phys(host_tdi->rmm_vdev),
+					       virt_to_phys(comm_data->io_params));
+
 	if (rmi_ret != RMI_SUCCESS) {
 		if (rmi_ret == RMI_BUSY)
 			return -EBUSY;
@@ -236,6 +243,12 @@ static int _do_dev_communicate(enum dev_comm_type type, struct pci_tsm *tsm)
 		case RMI_DEV_CERTIFICATE:
 			cache_objp = &pf0_dsc->cert_chain.cache;
 			break;
+		case RMI_DEV_INTERFACE_REPORT:
+			cache_objp = &host_tdi->interface_report;
+			break;
+		case RMI_DEV_MEASUREMENTS:
+			cache_objp = &host_tdi->measurements;
+			break;
 		default:
 			return -EINVAL;
 		}
@@ -337,9 +350,11 @@ static int _do_dev_communicate(enum dev_comm_type type, struct pci_tsm *tsm)
 static int do_dev_communicate(enum dev_comm_type type,
 				struct pci_tsm *tsm, unsigned long error_state)
 {
-	int ret, state = error_state;
+	int ret, state;
+	unsigned long rmi_ret;
 	struct rmi_dev_comm_enter *io_enter;
 	struct cca_host_pf0_dsc *pf0_dsc = to_cca_pf0_dsc(tsm->dsm_dev);
+	struct cca_host_tdi *host_tdi = to_cca_host_tdi(tsm->pdev);
 
 	io_enter = &pf0_dsc->comm_data.io_params->enter;
 	io_enter->resp_len = 0;
@@ -349,16 +364,23 @@ static int do_dev_communicate(enum dev_comm_type type,
 	if (ret) {
 		if (type == PDEV_COMMUNICATE)
 			rmi_pdev_abort(virt_to_phys(pf0_dsc->rmm_pdev));
+		else
+			rmi_vdev_abort(virt_to_phys(host_tdi->rmm_vdev));
+
+		state = error_state;
 	} else {
 		/*
 		 * Some device communication error will transition the
 		 * device to error state. Report that.
 		 */
-		if (type == PDEV_COMMUNICATE) {
-			if (rmi_pdev_get_state(virt_to_phys(pf0_dsc->rmm_pdev),
-					       (enum rmi_pdev_state *)&state))
-				state = error_state;
-		}
+		if (type == PDEV_COMMUNICATE)
+			rmi_ret = rmi_pdev_get_state(virt_to_phys(pf0_dsc->rmm_pdev),
+						     (enum rmi_pdev_state *)&state);
+		else
+			rmi_ret = rmi_vdev_get_state(virt_to_phys(host_tdi->rmm_vdev),
+						     (enum rmi_vdev_state *)&state);
+		if (rmi_ret)
+			state = error_state;
 	}
 
 	if (state == error_state)
@@ -637,3 +659,27 @@ void cca_pdev_stop_and_destroy(struct pci_dev *pdev)
 		free_page((unsigned long)pf0_dsc->rmm_pdev);
 	pf0_dsc->rmm_pdev = NULL;
 }
+
+static int wait_for_vdev_state(struct pci_tsm *tsm, enum rmi_vdev_state target_state)
+{
+	return wait_for_dev_state(VDEV_COMMUNICATE, tsm, target_state, RMI_VDEV_ERROR);
+}
+
+static __maybe_unused void vdev_state_transition_workfn(struct work_struct *work)
+{
+	unsigned long state;
+	struct pci_tsm *tsm;
+	struct dev_comm_work *setup_work;
+	struct cca_host_pf0_dsc *pf0_dsc;
+
+	setup_work = container_of(work, struct dev_comm_work, work);
+	tsm = setup_work->tsm;
+
+	pf0_dsc = to_cca_pf0_dsc(tsm->dsm_dev);
+	guard(mutex)(&pf0_dsc->object_lock);
+
+	state = wait_for_vdev_state(tsm, setup_work->target_state);
+	WARN_ON(state != setup_work->target_state);
+
+	complete(&setup_work->complete);
+}
diff --git a/drivers/virt/coco/arm-cca-host/rmi-da.h b/drivers/virt/coco/arm-cca-host/rmi-da.h
index 38550103c2a5..914a3c297c24 100644
--- a/drivers/virt/coco/arm-cca-host/rmi-da.h
+++ b/drivers/virt/coco/arm-cca-host/rmi-da.h
@@ -82,6 +82,16 @@ struct cca_host_fn_dsc {
 
 enum dev_comm_type {
 	PDEV_COMMUNICATE = 0x1,
+	VDEV_COMMUNICATE = 0x2,
+};
+
+struct cca_host_tdi {
+	struct pci_tdi tdi;
+	struct realm *realm;
+	void *rmm_vdev;
+	/* protected by cca_host_pf0_dsc.object_lock */
+	struct cache_object *interface_report;
+	struct cache_object *measurements;
 };
 
 static inline struct cca_host_pf0_dsc *to_cca_pf0_dsc(struct pci_dev *pdev)
@@ -116,6 +126,16 @@ static inline struct cca_host_comm_data *to_cca_comm_data(struct pci_dev *pdev)
 	return NULL;
 }
 
+static inline struct cca_host_tdi *to_cca_host_tdi(struct pci_dev *pdev)
+{
+	struct pci_tsm *tsm = pdev->tsm;
+
+	if (!tsm || !tsm->tdi)
+		return NULL;
+
+	return container_of(tsm->tdi, struct cca_host_tdi, tdi);
+}
+
 int cca_pdev_create(struct pci_dev *pdev);
 int cca_pdev_ide_setup(struct pci_dev *pdev);
 void cca_pdev_stop_and_destroy(struct pci_dev *pdev);
-- 
2.43.0


