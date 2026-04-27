Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33BB2FF885E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 08:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I619+lf3szyoIxCn9xc71fPNGfze/qkPuKyQem0Qxp0=; b=yz+O+C76E54Yc07aLw9gkEZClt
	FgpPVOvYIgPjVffx3zSdebkrYR6YTexYCYgW6cSmhm0zIv2GPCYKsG0hPZ9dJg8ojk9KBCjI0szg3
	J3SXjKAFhuo6qdi9z5mny98jNUFgDFcZVve3sg+ZHTnp0T/rJTv6HsVpBiLSW8FQgOCiZhlItzVgq
	VZuwsi8kHpBI0n76L0eDcvqmqoRUm4VNZS9/+byILFhhf75GF/I9dpqSe8G8crPz+mBgGl7z/VlYF
	KX0zXKW369azHaz4NMMNoe08Zp7QFIO0Sots+fUn5dQ9c5Ub1bo7n07gzjxbsIEfgm+qs3ALFcxzU
	bn9hKKrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHl5-0000000GWCK-1Q3T;
	Mon, 27 Apr 2026 08:56:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHl3-0000000GWBK-1q9m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 08:56:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D27AB61146;
	Mon, 27 Apr 2026 08:55:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E97EFC19425;
	Mon, 27 Apr 2026 08:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777280130;
	bh=Pk8JZfTBEnaEkE3defRJUW95TrTkrrF5xrtqcj+cWE8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B46pk1uQQeez0d/CD8S5fEyQhJs5rxIop80CNix5wo8uhh2H07JQq6jri/G+99lh9
	 XT/D341cEdqgWsovzqROBmTlbi/EqZXd7saUFzgF3anzlvjfhqUq3N0AtE/z7bK1QP
	 yi4LenY23M5PEItyyS+aiODhGaIcwnRwcZdKTWAFmGTGKJzZqjyaIer4R4ExJT/NjU
	 RW7xSOJiL/UAKCzxVRjdhNreICREd10sCkileFJ7MbolSVt1B+8BqyzmTRspi+mYNQ
	 kAiKx68piIHVls4vdIJTs9PlLqBn1cqwE6E3/0/h+zszhUAN7Ob6SNm7oU7HFf/C33
	 0FkzhR96r7biA==
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
Subject: [RFC PATCH v4 15/16] coco: host: arm64: Transition vdevs to TDISP RUN state
Date: Mon, 27 Apr 2026 14:23:43 +0530
Message-ID: <20260427085344.941627-16-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427085344.941627-1-aneesh.kumar@kernel.org>
References: <20260427085344.941627-1-aneesh.kumar@kernel.org>
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

Add host-side support for guest requests that move a vdev into the TDISP
RUN state.

Introduce the RMI helper for VDEV_START and a matching guest request
payload for VDEV_SET_TDI_STATE. In the host CCA TSM request handler, accept
only RHI_DA_TDI_CONFIG_RUN on the state-change path and invoke a new
cca_vdev_device_start() helper.

The start helper issues RMI_VDEV_START for the bound pdev/vdev pair and
then waits until firmware reports the vdev in the RMI_VDEV_STARTED state
before returning to the caller.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 arch/arm64/include/asm/rmi_cmds.h        | 11 +++++++++++
 arch/arm64/include/uapi/asm/rmi-da.h     |  6 ++++++
 drivers/virt/coco/arm-cca-host/arm-cca.c | 15 +++++++++++++++
 drivers/virt/coco/arm-cca-host/rmi-da.c  | 22 ++++++++++++++++++++++
 drivers/virt/coco/arm-cca-host/rmi-da.h  |  1 +
 5 files changed, 55 insertions(+)

diff --git a/arch/arm64/include/asm/rmi_cmds.h b/arch/arm64/include/asm/rmi_cmds.h
index 350fd9bc93a4..19eba97a6c7b 100644
--- a/arch/arm64/include/asm/rmi_cmds.h
+++ b/arch/arm64/include/asm/rmi_cmds.h
@@ -993,4 +993,15 @@ rmi_vdev_get_device_measurements(unsigned long rd, unsigned long pdev_phys,
 
 	return res.a0;
 }
+
+static inline unsigned long rmi_vdev_start(unsigned long rd, unsigned long pdev_phys,
+					   unsigned long vdev_phys)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_1_1_invoke(SMC_RMI_VDEV_START, rd, pdev_phys, vdev_phys, &res);
+
+	return res.a0;
+}
+
 #endif /* __ASM_RMI_CMDS_H */
diff --git a/arch/arm64/include/uapi/asm/rmi-da.h b/arch/arm64/include/uapi/asm/rmi-da.h
index 572afb4095f2..c0cfcadfae47 100644
--- a/arch/arm64/include/uapi/asm/rmi-da.h
+++ b/arch/arm64/include/uapi/asm/rmi-da.h
@@ -38,4 +38,10 @@ struct arm64_vdev_device_memmap_guest_req {
 };
 #define __REC_DA_VDEV_MAP		0x5
 
+struct arm64_vdev_set_tdi_state_guest_req {
+	__u32 req_type;
+	__u32 tdi_state;
+};
+#define __RHI_DA_VDEV_SET_TDI_STATE	0x6
+
 #endif
diff --git a/drivers/virt/coco/arm-cca-host/arm-cca.c b/drivers/virt/coco/arm-cca-host/arm-cca.c
index 66e0acadf743..3a682352fb68 100644
--- a/drivers/virt/coco/arm-cca-host/arm-cca.c
+++ b/drivers/virt/coco/arm-cca-host/arm-cca.c
@@ -608,6 +608,21 @@ static ssize_t cca_tsm_guest_req(struct pci_tdi *tdi, enum pci_tsm_req_scope sco
 						   req_obj.gpa_top,
 						   req_obj.pa_base);
 		}
+		case __RHI_DA_VDEV_SET_TDI_STATE:
+		{
+			struct arm64_vdev_set_tdi_state_guest_req req_obj;
+
+			if (req_len != sizeof(req_obj))
+				return -EINVAL;
+
+			if (copy_from_user((void *)&req_obj, req.user, req_len))
+				return -EFAULT;
+
+			if (req_obj.tdi_state != RHI_DA_TDI_CONFIG_RUN)
+				return -EINVAL;
+
+			return cca_vdev_device_start(pdev);
+		}
 		default:
 			return -EINVAL;
 		}
diff --git a/drivers/virt/coco/arm-cca-host/rmi-da.c b/drivers/virt/coco/arm-cca-host/rmi-da.c
index 543c40fb1160..60b750c961ea 100644
--- a/drivers/virt/coco/arm-cca-host/rmi-da.c
+++ b/drivers/virt/coco/arm-cca-host/rmi-da.c
@@ -1398,3 +1398,25 @@ int cca_vdev_device_map(struct pci_dev *pdev, unsigned long gpa_base,
 	return realm_dev_mem_map(kvm, rmm_pdev_phys, rmm_vdev_phys,
 				 gpa_base, gpa_top, pa_base);
 }
+
+int cca_vdev_device_start(struct pci_dev *pdev)
+{
+	phys_addr_t rmm_pdev_phys;
+	phys_addr_t rmm_vdev_phys;
+	struct cca_host_pdev_dsc *pdev_dsc;
+	struct cca_host_tdi *host_tdi;
+	struct realm *realm;
+	phys_addr_t rd_phys;
+
+	host_tdi = to_cca_host_tdi(pdev);
+	rmm_vdev_phys = virt_to_phys(host_tdi->rmm_vdev);
+	realm = &host_tdi->tdi.kvm->arch.realm;
+	rd_phys = virt_to_phys(realm->rd);
+
+	pdev_dsc = to_cca_pdev_dsc(pdev->tsm->dsm_dev);
+	rmm_pdev_phys = virt_to_phys(pdev_dsc->rmm_pdev);
+
+	if (rmi_vdev_start(rd_phys, rmm_pdev_phys, rmm_vdev_phys))
+		return -ENXIO;
+	return submit_vdev_state_transition_work(pdev, RMI_VDEV_STARTED);
+}
diff --git a/drivers/virt/coco/arm-cca-host/rmi-da.h b/drivers/virt/coco/arm-cca-host/rmi-da.h
index 3dfb6b3cc2ef..3082166038c3 100644
--- a/drivers/virt/coco/arm-cca-host/rmi-da.h
+++ b/drivers/virt/coco/arm-cca-host/rmi-da.h
@@ -252,5 +252,6 @@ int cca_vdev_update_interface_report(struct pci_dev *pdev);
 int cca_vdev_update_device_measurements(struct pci_dev *pdev, unsigned long flags, u8 *nonce);
 int cca_vdev_device_map(struct pci_dev *pdev, unsigned long gpa_base,
 		unsigned long gpa_top, unsigned long pa_base);
+int cca_vdev_device_start(struct pci_dev *pdev);
 
 #endif
-- 
2.43.0


