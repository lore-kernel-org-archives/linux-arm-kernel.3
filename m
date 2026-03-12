Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35DFAFED2E7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 08:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iV78Ujur/ULPTdzjh0AHrze0o2YHupfT2sIt3kU50eQ=; b=N1HBsAB2+TWsEHrDJ+c3z3fmlM
	aLo0saii1B3nsH7o/lTrhGbqtkCn0IQTYbwYQCiGL+NEr+DLTqgFWg2iU6/4/Na1tdTRgIt8zeM3o
	pTeqmOXC1OFXeXeBPr8GZG9ZZcV0+usHedwAkRZkO/ZgurfIwZ+jChkSZKEtgX8kMgv3NtuuRt18L
	Y/+cP/QHz8OUuhZ2zKUgsEKPRW8v+R4NKPSKanGh488rat2VTx4tMjOqdnjmB6K/ETpL3OZF2vP7M
	s3wiB3UCHy69VVK8GJuf3aXSVQqcuonuG0WqdmTFP6Ue4RkPV2TGaIgwhNS7tYlDDPFWDmCyY+iti
	e3KxYjPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0b5q-0000000DbnG-3WWp;
	Thu, 12 Mar 2026 08:08:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0b5p-0000000DblY-3Om3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 08:08:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3FC6860054;
	Thu, 12 Mar 2026 08:08:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD475C2BCAF;
	Thu, 12 Mar 2026 08:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773302908;
	bh=+yNnfpjqO4SRVmlPnho03o+dxHxLszjLp9xfVGhQhOo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BjT9GOYSQUtov9p25h5UWB6THM0IIH4vgwGaDIiwlYv8OSfzqofaei/rkQS+DCgvf
	 FNq+MJGUAhTTcHeAk6o4Rj0/fKcTNO7n0MmhWq97OAGY6Quzfhc/BXJBnLwcrZQmAD
	 3NfbKEbUtJ8xmEGycOYJc7ADXVF/m9yHizeJlR8wEQnSoqBsbMUHXJh0aGjzHbuM4C
	 L1RHFEBIICvxPuwApDqQiSE2e16jRxneNtsUHrTE7So6ef8eUbuo+QSxac1JAgemmI
	 SJ4ecE1LSqTPQbSlSzqjm69owd1Gp5vIRSkPMzSExq60Tw7J587nH6cDsraTRNEBoe
	 wF7kQB5WmyrUw==
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
Subject: [RFC PATCH v3 06/12] coco: host: arm64: Fetch interface report via RMI
Date: Thu, 12 Mar 2026 13:37:37 +0530
Message-ID: <20260312080743.3487326-7-aneesh.kumar@kernel.org>
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

- define `__RHI_DA_VDEV_GET_INTERFACE_REPORT` for guest requests and
  expose the RMI SMC ID/wrapper for `RMI_VDEV_GET_INTERFACE_REPORT`
- teach the CCA host driver to handle the new guest request by fetching
  the report from RMM using `rmi_vdev_get_interface_report()` and
  refreshing the cached buffer
- add a helper that submits a DOE work to pull the latest report into
  the cache

This lets guests request up-to-date interface reports via RHI

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
 arch/arm64/include/asm/rmi_cmds.h        | 12 ++++++
 arch/arm64/include/asm/rmi_smc.h         |  1 +
 drivers/virt/coco/arm-cca-host/arm-cca.c |  4 ++
 drivers/virt/coco/arm-cca-host/rmi-da.c  | 55 +++++++++++++++++++++++-
 drivers/virt/coco/arm-cca-host/rmi-da.h  |  1 +
 6 files changed, 73 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/rhi.h b/arch/arm64/include/asm/rhi.h
index 3c84fedba4ab..edb23614cdeb 100644
--- a/arch/arm64/include/asm/rhi.h
+++ b/arch/arm64/include/asm/rhi.h
@@ -82,5 +82,6 @@ enum rhi_tdi_state {
 /* guest request operation nr */
 #define __RHI_DA_OBJECT_SIZE		0x1
 #define __RHI_DA_OBJECT_READ		0x2
+#define __RHI_DA_VDEV_GET_INTERFACE_REPORT 0x3
 
 #endif
diff --git a/arch/arm64/include/asm/rmi_cmds.h b/arch/arm64/include/asm/rmi_cmds.h
index 5964549aca23..ea9d4ec21e0e 100644
--- a/arch/arm64/include/asm/rmi_cmds.h
+++ b/arch/arm64/include/asm/rmi_cmds.h
@@ -661,4 +661,16 @@ static inline unsigned long rmi_vdev_destroy(unsigned long rd,
 	return res.a0;
 }
 
+static inline unsigned long rmi_vdev_get_interface_report(unsigned long rd,
+					     unsigned long pdev_phys,
+					     unsigned long vdev_phys)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_1_1_invoke(SMC_RMI_VDEV_GET_INTERFACE_REPORT,
+			     rd, pdev_phys, vdev_phys, &res);
+
+	return res.a0;
+}
+
 #endif /* __ASM_RMI_CMDS_H */
diff --git a/arch/arm64/include/asm/rmi_smc.h b/arch/arm64/include/asm/rmi_smc.h
index 95ddbc6dd1e0..b3239f51de22 100644
--- a/arch/arm64/include/asm/rmi_smc.h
+++ b/arch/arm64/include/asm/rmi_smc.h
@@ -60,6 +60,7 @@
 #define SMC_RMI_VDEV_DESTROY		SMC_RMI_CALL(0x0188)
 #define SMC_RMI_VDEV_GET_STATE		SMC_RMI_CALL(0x0189)
 #define SMC_RMI_VDEV_UNLOCK		SMC_RMI_CALL(0x018A)
+#define SMC_RMI_VDEV_GET_INTERFACE_REPORT SMC_RMI_CALL(0x01D0)
 
 #define SMC_RMI_VDEV_LOCK		SMC_RMI_CALL(0x01D2)
 
diff --git a/drivers/virt/coco/arm-cca-host/arm-cca.c b/drivers/virt/coco/arm-cca-host/arm-cca.c
index 8678acd84d7d..de3c239345a8 100644
--- a/drivers/virt/coco/arm-cca-host/arm-cca.c
+++ b/drivers/virt/coco/arm-cca-host/arm-cca.c
@@ -342,6 +342,10 @@ static ssize_t cca_tsm_guest_req(struct pci_tdi *tdi, enum pci_tsm_req_scope sco
 			/* error */
 			return len;
 		}
+		case __RHI_DA_VDEV_GET_INTERFACE_REPORT:
+		{
+			return cca_vdev_get_interface_report(pdev);
+		}
 		default:
 			return -EINVAL;
 		}
diff --git a/drivers/virt/coco/arm-cca-host/rmi-da.c b/drivers/virt/coco/arm-cca-host/rmi-da.c
index 123cda44535c..48a18905bb55 100644
--- a/drivers/virt/coco/arm-cca-host/rmi-da.c
+++ b/drivers/virt/coco/arm-cca-host/rmi-da.c
@@ -839,7 +839,7 @@ void cca_vdev_unlock_and_destroy(struct realm *realm,
 	host_tdi->realm = NULL;
 }
 
-static void __maybe_unused vdev_fetch_object_workfn(struct work_struct *work)
+static void vdev_fetch_object_workfn(struct work_struct *work)
 {
 	int state;
 	struct pci_tsm *tsm;
@@ -956,3 +956,56 @@ int cca_vdev_read_cached_object(struct pci_dev *pdev, int type,
 
 	return len;
 }
+
+static int vdev_update_interface_report_cache(struct pci_dev *pdev)
+{
+	struct dev_comm_work comm_work;
+	struct cca_host_tdi *host_tdi = to_cca_host_tdi(pdev);
+	struct cca_host_comm_data *comm_data = to_cca_comm_data(pdev);
+
+	INIT_WORK_ONSTACK(&comm_work.work, vdev_fetch_object_workfn);
+	init_completion(&comm_work.complete);
+	comm_work.tsm = pdev->tsm;
+	if (host_tdi->interface_report) {
+		comm_work.cache_buf = host_tdi->interface_report->buf;
+		comm_work.cache_offset = &host_tdi->interface_report->offset;
+		comm_work.cache_size = host_tdi->interface_report->size;
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
+int cca_vdev_get_interface_report(struct pci_dev *pdev)
+{
+	phys_addr_t rmm_pdev_phys;
+	phys_addr_t rmm_vdev_phys;
+	struct cca_host_pf0_dsc *pf0_dsc;
+	struct cca_host_tdi *host_tdi;
+	struct realm *realm;
+	phys_addr_t rd_phys;
+
+	host_tdi = to_cca_host_tdi(pdev);
+	rmm_vdev_phys = virt_to_phys(host_tdi->rmm_vdev);
+	realm = &host_tdi->tdi.kvm->arch.realm;
+	rd_phys = virt_to_phys(realm->rd);
+
+	pf0_dsc = to_cca_pf0_dsc(pdev->tsm->dsm_dev);
+	rmm_pdev_phys = virt_to_phys(pf0_dsc->rmm_pdev);
+
+	if (rmi_vdev_get_interface_report(rd_phys,
+					  rmm_pdev_phys, rmm_vdev_phys))
+		return -ENXIO;
+
+	/* get and update the interface report cache. */
+	return vdev_update_interface_report_cache(pdev);
+}
diff --git a/drivers/virt/coco/arm-cca-host/rmi-da.h b/drivers/virt/coco/arm-cca-host/rmi-da.h
index c4f31986389c..662cedd23c42 100644
--- a/drivers/virt/coco/arm-cca-host/rmi-da.h
+++ b/drivers/virt/coco/arm-cca-host/rmi-da.h
@@ -150,4 +150,5 @@ void cca_vdev_unlock_and_destroy(struct realm *realm, struct pci_dev *pdev,
 int cca_vdev_get_object_size(struct pci_dev *pdev, int type);
 int cca_vdev_read_cached_object(struct pci_dev *pdev, int type, unsigned long offset,
 				unsigned long max_len, void __user *user_buf);
+int cca_vdev_get_interface_report(struct pci_dev *pdev);
 #endif
-- 
2.43.0


