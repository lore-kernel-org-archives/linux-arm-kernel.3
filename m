Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC31FED2E7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 08:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QWaGXvAuYI3HzviDHK/FN4kW46TUJb+EOrmt+eU/ucg=; b=NFpVtfJGPId3mBsDMoSO4zjtjF
	Gg5bXOwx9D8TZFOiBBf32ZyLPmxrpch++aCplLg0BTOHnVChflVkpE4cwLtCF2b/5ulL1+iWnSYl4
	c4yryqNFVQBmfY1G3vnBkWO5lYQXdGk1ONbBudxmSBaQeBsS6QuGPvrgR2ZP3enbLgLTO2+xvXjYP
	taLra1Ziq2QW6VEcDAJMDanmO0BrJ/KNr3uAtgfg6rmjh+/syxLnhlNKKnLxoIaa76SbYncTNvE3m
	slRlPxhSypP0x1lrgJom1KFCMMZZA014ywgvLO8K9CrLH9EKprzlnhHE1v4x7tmdeK1ZhNz7uadZc
	1ECYRHLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0b5y-0000000Dbso-0lkx;
	Thu, 12 Mar 2026 08:08:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0b5v-0000000DbqZ-1qXU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 08:08:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 222F842DCB;
	Thu, 12 Mar 2026 08:08:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9550BC116C6;
	Thu, 12 Mar 2026 08:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773302915;
	bh=d4thES9+ZsXUkdEOJXvna7XEYtT9O2beRtvexnrHJQk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JaeF2F/xBenbeI3tvbQ9KYuXDtXv4aJMEbnkG1Gg2vInkXkXX+WUfpuMKUgmCtPDd
	 ObQfX5KTUiNW1iCqnn3whbw2/cTC2gHZrm8syCJ2SVCoAqS7gAsc9P9ezDKhLu0cBK
	 fhetjJFiE14A2vUt0U7cXQsDTbGMsbFTNipac2GCR9w0LkyMsq83F3KFq1uz49QvV1
	 bdzTH+qb2/fzhmHSfDXk9hy9YjGSMyoARirRDgKwL5hGUbwjMOq1CCLUc6O3L22WTG
	 nmCNJNVl8tbtl1rZ4CHi/KjKAmOCc/2OuOdS2+se+JVdu7XwpfkehNtaJL0+wcmmC4
	 HIUOD0BbkHbUw==
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
Subject: [RFC PATCH v3 07/12] coco: host: arm64: Fetch device measurements via RMI
Date: Thu, 12 Mar 2026 13:37:38 +0530
Message-ID: <20260312080743.3487326-8-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260312080743.3487326-1-aneesh.kumar@kernel.org>
References: <20260312080743.3487326-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_010835_527638_D2ABA606 
X-CRM114-Status: GOOD (  21.22  )
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

- define __RHI_DA_VDEV_GET_MEASUREMENTS for guest requests and
  expose the RMI SMC ID/wrapper for RMI_VDEV_GET_DEV_MEASUREMENTS
- teach the CCA host driver to handle the new guest request by fetching
  the device measurements from RMM using rmi_vdev_get_device_measurements()
  and refreshing the cached buffer
- add a helper that submits a DOE work to pull the latest device
  measurements into the cache

This lets guests request up-to-date device measurements via RHI

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
 arch/arm64/include/asm/rhi.h             |  1 +
 arch/arm64/include/asm/rmi_cmds.h        | 12 +++++
 arch/arm64/include/asm/rmi_smc.h         | 15 +++++-
 arch/arm64/include/uapi/asm/rmi-da.h     |  6 +++
 drivers/virt/coco/arm-cca-host/arm-cca.c | 16 ++++++
 drivers/virt/coco/arm-cca-host/rmi-da.c  | 69 ++++++++++++++++++++++++
 drivers/virt/coco/arm-cca-host/rmi-da.h  |  1 +
 7 files changed, 119 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/rhi.h b/arch/arm64/include/asm/rhi.h
index edb23614cdeb..a18ad7bbc028 100644
--- a/arch/arm64/include/asm/rhi.h
+++ b/arch/arm64/include/asm/rhi.h
@@ -83,5 +83,6 @@ enum rhi_tdi_state {
 #define __RHI_DA_OBJECT_SIZE		0x1
 #define __RHI_DA_OBJECT_READ		0x2
 #define __RHI_DA_VDEV_GET_INTERFACE_REPORT 0x3
+#define __RHI_DA_VDEV_GET_MEASUREMENTS	0x4
 
 #endif
diff --git a/arch/arm64/include/asm/rmi_cmds.h b/arch/arm64/include/asm/rmi_cmds.h
index ea9d4ec21e0e..aad245675c7d 100644
--- a/arch/arm64/include/asm/rmi_cmds.h
+++ b/arch/arm64/include/asm/rmi_cmds.h
@@ -673,4 +673,16 @@ static inline unsigned long rmi_vdev_get_interface_report(unsigned long rd,
 	return res.a0;
 }
 
+static inline unsigned long
+rmi_vdev_get_device_measurements(unsigned long rd, unsigned long pdev_phys,
+				 unsigned long vdev_phys,
+				 unsigned long param_phys)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_1_1_invoke(SMC_RMI_VDEV_GET_DEV_MEASUREMENTS,
+			     rd, pdev_phys, vdev_phys, param_phys, &res);
+
+	return res.a0;
+}
 #endif /* __ASM_RMI_CMDS_H */
diff --git a/arch/arm64/include/asm/rmi_smc.h b/arch/arm64/include/asm/rmi_smc.h
index b3239f51de22..36c3db8b821d 100644
--- a/arch/arm64/include/asm/rmi_smc.h
+++ b/arch/arm64/include/asm/rmi_smc.h
@@ -61,7 +61,7 @@
 #define SMC_RMI_VDEV_GET_STATE		SMC_RMI_CALL(0x0189)
 #define SMC_RMI_VDEV_UNLOCK		SMC_RMI_CALL(0x018A)
 #define SMC_RMI_VDEV_GET_INTERFACE_REPORT SMC_RMI_CALL(0x01D0)
-
+#define SMC_RMI_VDEV_GET_DEV_MEASUREMENTS	SMC_RMI_CALL(0x01D1)
 #define SMC_RMI_VDEV_LOCK		SMC_RMI_CALL(0x01D2)
 
 #define RMI_ABI_MAJOR_VERSION	1
@@ -482,4 +482,17 @@ struct rmi_vdev_params {
 	};
 };
 
+#define RMI_VDEV_MEASURE_HASH	0x0
+#define RMI_VDEV_MEASURE_RAW	0x1
+struct rmi_vdev_measurement_params {
+	union {
+		u64 flags;
+		u8 padding0[256];
+	};
+	union {
+		u8 nonce[32];
+		u8 padding1[256];
+	};
+};
+
 #endif /* __ASM_RMI_SMC_H */
diff --git a/arch/arm64/include/uapi/asm/rmi-da.h b/arch/arm64/include/uapi/asm/rmi-da.h
index 8743d9a2e5f7..1c21a5e78eb5 100644
--- a/arch/arm64/include/uapi/asm/rmi-da.h
+++ b/arch/arm64/include/uapi/asm/rmi-da.h
@@ -16,4 +16,10 @@ struct arm64_vdev_object_read_guest_req {
 	__aligned_u64 offset;
 };
 
+struct arm64_vdev_device_measurement_guest_req {
+	__u32 req_type;
+	__aligned_u64 flags;
+	__aligned_u64 nonce;
+};
+
 #endif
diff --git a/drivers/virt/coco/arm-cca-host/arm-cca.c b/drivers/virt/coco/arm-cca-host/arm-cca.c
index de3c239345a8..ba2751eb06f7 100644
--- a/drivers/virt/coco/arm-cca-host/arm-cca.c
+++ b/drivers/virt/coco/arm-cca-host/arm-cca.c
@@ -346,6 +346,22 @@ static ssize_t cca_tsm_guest_req(struct pci_tdi *tdi, enum pci_tsm_req_scope sco
 		{
 			return cca_vdev_get_interface_report(pdev);
 		}
+		case __RHI_DA_VDEV_GET_MEASUREMENTS:
+		{
+			int ret;
+			struct arm64_vdev_device_measurement_guest_req req_obj;
+
+			if (req_len != sizeof(req_obj))
+				return -EINVAL;
+
+			if (copy_from_user((void *)&req_obj, req.user, req_len))
+				return -EFAULT;
+
+			ret = cca_vdev_get_device_measurements(pdev,
+							       req_obj.flags,
+							       (u8 *)req_obj.nonce);
+			return ret;
+		}
 		default:
 			return -EINVAL;
 		}
diff --git a/drivers/virt/coco/arm-cca-host/rmi-da.c b/drivers/virt/coco/arm-cca-host/rmi-da.c
index 48a18905bb55..58a20877c6b6 100644
--- a/drivers/virt/coco/arm-cca-host/rmi-da.c
+++ b/drivers/virt/coco/arm-cca-host/rmi-da.c
@@ -1009,3 +1009,72 @@ int cca_vdev_get_interface_report(struct pci_dev *pdev)
 	/* get and update the interface report cache. */
 	return vdev_update_interface_report_cache(pdev);
 }
+
+static int vdev_update_device_measurements_cache(struct pci_dev *pdev)
+{
+	struct dev_comm_work comm_work;
+	struct cca_host_tdi *host_tdi = to_cca_host_tdi(pdev);
+	struct cca_host_comm_data *comm_data = to_cca_comm_data(pdev);
+
+	INIT_WORK_ONSTACK(&comm_work.work, vdev_fetch_object_workfn);
+	init_completion(&comm_work.complete);
+	comm_work.tsm = pdev->tsm;
+	if (host_tdi->measurements) {
+		comm_work.cache_buf = host_tdi->measurements->buf;
+		comm_work.cache_offset = &host_tdi->measurements->offset;
+		comm_work.cache_size = host_tdi->measurements->size;
+	} else {
+		comm_work.cache_buf = NULL;
+		comm_work.cache_offset = NULL;
+		comm_work.cache_size = 0;
+	}
+
+	queue_work(comm_data->work_queue, &comm_work.work);
+	wait_for_completion(&comm_work.complete);
+	destroy_work_on_stack(&comm_work.work);
+
+	if (comm_work.cache_size == 0)
+		return -ENXIO;
+	return 0;
+}
+
+static inline void vdev_measurement_param_free(struct rmi_vdev_measurement_params *param)
+{
+	return free_page((unsigned long)param);
+}
+DEFINE_FREE(measurement_param_free, struct rmi_vdev_measurement_params *, if (_T) vdev_measurement_param_free(_T))
+
+int cca_vdev_get_device_measurements(struct pci_dev *pdev, unsigned long flags, u8 *nonce)
+{
+	struct realm *realm;
+	phys_addr_t rd_phys;
+	phys_addr_t rmm_pdev_phys;
+	phys_addr_t rmm_vdev_phys;
+	struct cca_host_tdi *host_tdi;
+	struct cca_host_pf0_dsc *pf0_dsc;
+
+	host_tdi = to_cca_host_tdi(pdev);
+	rmm_vdev_phys = virt_to_phys(host_tdi->rmm_vdev);
+	realm = &host_tdi->tdi.kvm->arch.realm;
+	rd_phys = virt_to_phys(realm->rd);
+
+	pf0_dsc = to_cca_pf0_dsc(pdev->tsm->dsm_dev);
+	rmm_pdev_phys = virt_to_phys(pf0_dsc->rmm_pdev);
+
+	struct rmi_vdev_measurement_params *params __free(measurement_param_free) =
+		(struct rmi_vdev_measurement_params *)get_zeroed_page(GFP_KERNEL_ACCOUNT);
+	if (!params)
+		return -ENOMEM;
+
+	params->flags = flags;
+
+	if (copy_from_user(params->nonce, nonce, sizeof(params->nonce)))
+		return -EFAULT;
+
+	if (rmi_vdev_get_device_measurements(rd_phys, rmm_pdev_phys,
+					     rmm_vdev_phys, virt_to_phys(params)))
+		return -ENXIO;
+
+	/* get and update the interface report cache. */
+	return vdev_update_device_measurements_cache(pdev);
+}
diff --git a/drivers/virt/coco/arm-cca-host/rmi-da.h b/drivers/virt/coco/arm-cca-host/rmi-da.h
index 662cedd23c42..6304cee85874 100644
--- a/drivers/virt/coco/arm-cca-host/rmi-da.h
+++ b/drivers/virt/coco/arm-cca-host/rmi-da.h
@@ -151,4 +151,5 @@ int cca_vdev_get_object_size(struct pci_dev *pdev, int type);
 int cca_vdev_read_cached_object(struct pci_dev *pdev, int type, unsigned long offset,
 				unsigned long max_len, void __user *user_buf);
 int cca_vdev_get_interface_report(struct pci_dev *pdev);
+int cca_vdev_get_device_measurements(struct pci_dev *pdev, unsigned long flags, u8 *nonce);
 #endif
-- 
2.43.0


