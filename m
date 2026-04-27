Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A505AFF8861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 08:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FEa14pz0qHbe/LT4cTtGn1KC1+/TEI3SrRyxEQhKJA8=; b=GbnC5UyzaDNtx62b0+ibU0JGT4
	gPObsV9/uu3+EMwVftpoHeVPq3k9jATxcgglfqqskDwf9qliXMGNwdexWFpKkJCYzARUs+zSMTIRJ
	Z1+09AEI76qzMAJfUdD6ia5BhFS8VVk5pPK3LA9RC/mZEZLB+VUvq7i1I5Jyjtu9ZeSTDRd4MBAtB
	XmmKf+nRfiyB9b29bdlRUXRNeVSNzzO6KiedLEq7gPMzS3/BGX9ILeFWKVilLbR3FU0l+y8nQUT9g
	hlt7vmaRbKfaKFRDDptN6XiP/gjyd0KKPHIJo5jQbc6Xk7pNbIl3GQdBV4TNfSQONHrxmZyfmQiga
	CebXw1yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHkK-0000000GVYK-1RDm;
	Mon, 27 Apr 2026 08:55:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHkG-0000000GVVP-29Hv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 08:55:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 163E04431C;
	Mon, 27 Apr 2026 08:55:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56E9FC19425;
	Mon, 27 Apr 2026 08:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777280112;
	bh=Tq4CxRDJdaH+m3uL502YRMjO72r5e9mBflofkb6jCis=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nA1h5xRUfjyTzQyZVmudAzodQSUPMQd7/pT9UrZujLOo60qRNaSbbAhGaXFU1prfS
	 Xz908KJD03TWvPwgINFkA/yBDEz7jZhOagdepyz93p5f53Nl76/gRCcekOsY+cLspv
	 UXOIPEkLHW/ev+/kXyzezW3rVIWXOGNiA6s2bLMqDnerYbNwCFgU4gHJz056RT4MlS
	 j1lRSXgowtKUw5QlQ1AeUo66M2w1Miq/xBEktvs7nzjbhA9tSIBKiDg6cOz0hPQ44X
	 iWE3B0j6b9+DEoxdXdXsCgn0Br2DBebCnVoFJAhsyRrFwA13XkVX3MOrRcm73uF9O/
	 VY4EfbxxvozDg==
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
Subject: [RFC PATCH v4 12/16] coco: host: arm64: Fetch device measurements via RMI
Date: Mon, 27 Apr 2026 14:23:40 +0530
Message-ID: <20260427085344.941627-13-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427085344.941627-1-aneesh.kumar@kernel.org>
References: <20260427085344.941627-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_015512_623932_85940F0F 
X-CRM114-Status: GOOD (  19.68  )
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

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 arch/arm64/include/asm/rmi_cmds.h        | 12 +++++
 arch/arm64/include/asm/rmi_smc.h         | 13 +++++
 arch/arm64/include/uapi/asm/rmi-da.h     |  8 +++
 drivers/virt/coco/arm-cca-host/arm-cca.c | 16 ++++++
 drivers/virt/coco/arm-cca-host/rmi-da.c  | 68 ++++++++++++++++++++++++
 drivers/virt/coco/arm-cca-host/rmi-da.h  |  1 +
 6 files changed, 118 insertions(+)

diff --git a/arch/arm64/include/asm/rmi_cmds.h b/arch/arm64/include/asm/rmi_cmds.h
index b3c04029bb47..350fd9bc93a4 100644
--- a/arch/arm64/include/asm/rmi_cmds.h
+++ b/arch/arm64/include/asm/rmi_cmds.h
@@ -981,4 +981,16 @@ static inline unsigned long rmi_vdev_get_interface_report(unsigned long rd,
 	return res.a0;
 }
 
+static inline unsigned long
+rmi_vdev_get_device_measurements(unsigned long rd, unsigned long pdev_phys,
+				 unsigned long vdev_phys,
+				 unsigned long param_phys)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_1_1_invoke(SMC_RMI_VDEV_GET_MEASUREMENTS,
+			     rd, pdev_phys, vdev_phys, param_phys, &res);
+
+	return res.a0;
+}
 #endif /* __ASM_RMI_CMDS_H */
diff --git a/arch/arm64/include/asm/rmi_smc.h b/arch/arm64/include/asm/rmi_smc.h
index 6cd5439f56ec..29dbe4e0dfb0 100644
--- a/arch/arm64/include/asm/rmi_smc.h
+++ b/arch/arm64/include/asm/rmi_smc.h
@@ -674,4 +674,17 @@ struct rmi_vdev_params {
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
index 8d36a4c59849..97648928f763 100644
--- a/arch/arm64/include/uapi/asm/rmi-da.h
+++ b/arch/arm64/include/uapi/asm/rmi-da.h
@@ -21,4 +21,12 @@ struct arm64_vdev_object_read_guest_req {
 /* No arguments to this guest request */
 #define __RHI_DA_VDEV_UPDATE_INTERFACE_REPORT 0x3
 
+struct arm64_vdev_device_measurement_guest_req {
+	__u32 req_type;
+	__u32 reserved;
+	__aligned_u64 flags;
+	__aligned_u64 nonce;
+};
+#define __RHI_DA_VDEV_UPDATE_MEASUREMENTS	0x4
+
 #endif
diff --git a/drivers/virt/coco/arm-cca-host/arm-cca.c b/drivers/virt/coco/arm-cca-host/arm-cca.c
index 2955993d29ac..855427935f2d 100644
--- a/drivers/virt/coco/arm-cca-host/arm-cca.c
+++ b/drivers/virt/coco/arm-cca-host/arm-cca.c
@@ -565,6 +565,22 @@ static ssize_t cca_tsm_guest_req(struct pci_tdi *tdi, enum pci_tsm_req_scope sco
 		{
 			return cca_vdev_update_interface_report(pdev);
 		}
+		case __RHI_DA_VDEV_UPDATE_MEASUREMENTS:
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
+			ret = cca_vdev_update_device_measurements(pdev,
+								  req_obj.flags,
+								  (u8 *)req_obj.nonce);
+			return ret;
+		}
 		default:
 			return -EINVAL;
 		}
diff --git a/drivers/virt/coco/arm-cca-host/rmi-da.c b/drivers/virt/coco/arm-cca-host/rmi-da.c
index 1862e4ff8cbb..ec7701ff7e03 100644
--- a/drivers/virt/coco/arm-cca-host/rmi-da.c
+++ b/drivers/virt/coco/arm-cca-host/rmi-da.c
@@ -1309,3 +1309,71 @@ int cca_vdev_update_interface_report(struct pci_dev *pdev)
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
+	flush_work(&comm_work.work);
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
+int cca_vdev_update_device_measurements(struct pci_dev *pdev, unsigned long flags, u8 *nonce)
+{
+	struct realm *realm;
+	phys_addr_t rd_phys;
+	phys_addr_t rmm_pdev_phys;
+	phys_addr_t rmm_vdev_phys;
+	struct cca_host_tdi *host_tdi;
+	struct cca_host_pdev_dsc *pdev_dsc;
+
+	host_tdi = to_cca_host_tdi(pdev);
+	rmm_vdev_phys = virt_to_phys(host_tdi->rmm_vdev);
+	realm = &host_tdi->tdi.kvm->arch.realm;
+	rd_phys = virt_to_phys(realm->rd);
+
+	pdev_dsc = to_cca_pdev_dsc(pdev->tsm->dsm_dev);
+	rmm_pdev_phys = virt_to_phys(pdev_dsc->rmm_pdev);
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
index b114bf4d4202..621e0858f0c6 100644
--- a/drivers/virt/coco/arm-cca-host/rmi-da.h
+++ b/drivers/virt/coco/arm-cca-host/rmi-da.h
@@ -249,5 +249,6 @@ int cca_vdev_get_object_size(struct pci_dev *pdev, int type);
 int cca_vdev_read_cached_object(struct pci_dev *pdev, int type, unsigned long offset,
 		unsigned long max_len, void __user *user_buf);
 int cca_vdev_update_interface_report(struct pci_dev *pdev);
+int cca_vdev_update_device_measurements(struct pci_dev *pdev, unsigned long flags, u8 *nonce);
 
 #endif
-- 
2.43.0


