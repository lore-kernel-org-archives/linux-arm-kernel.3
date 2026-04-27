Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB85FF8861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 08:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xkmaDiAkapPOpF/pzIARxD4B1Yn+4QqSV/fAgSS2pCY=; b=3vX+eCELWp92eGT2dkCnc+wEkP
	8icFM03lAIm2j5HQqfGWGMgayS+TrCMbgiGHgFJ0LLjpsFdpKhKv1ccGhcPiFzkqJG01Kke6XtrGZ
	24DWY4CPoOnlXxatrrdHSXSATEdRHq7T12HtsQIiyq4KCOqw05uhiYmUP/HXUZKjnSaAVi1/AYq6g
	IZ7lvpr0f39jVgggLK0pcmgvD/KGXs+5TnlwKMudfAIAx4NLSqUXBtzbE8WYEQyXBSYnsSOKcvqVr
	bmJoiwrceQGNH4WugF6m7Xh4jl9MezTl6EGMo4L926IsN7shD8cynOyzLfDZIu825As2JN49gMpLA
	lCVu5nkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHju-0000000GVBg-1gfl;
	Mon, 27 Apr 2026 08:54:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHjs-0000000GV8t-09OE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 08:54:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 672D16111B;
	Mon, 27 Apr 2026 08:54:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FBE5C2BCC7;
	Mon, 27 Apr 2026 08:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777280087;
	bh=L1kg4iW/l9CqM3IiD0aDKTGGpXD63FTQiy3LBcrx34Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tS9NIxCriwSBUb+IZxU5x5ANrjbEEOQG1BCO6hc4VsgZPhC5IL9d7gChuZjd56U0T
	 Iqcni8oqb7Wi00GvpomheAa8oMYuEibA/2qeGOAbzTIq063UHEOGLEQkUSJuMV870W
	 GMVT/+HHarhMuB7afvqWqgZt6BCEAl3b3WBj+ujJZ+OAoO7xKk95Ca0eCWk1LzZYay
	 OlzoouKlSd7xt5VM+EVEMYNAj91X05wVEY8Ea1OF7mVTnl9TibATDsxtBJusD36HKm
	 VzSLaIZMehw+ocRHbDM8U2hlz8jG5Hqeo93hn0nIqGekZ0heJPYqFvQxqBOhynU8FH
	 Ve0XLDNtwZmag==
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
Subject: [RFC PATCH v4 08/16] coco: host: arm64: Add helpers to unlock and destroy RMM vdev
Date: Mon, 27 Apr 2026 14:23:36 +0530
Message-ID: <20260427085344.941627-9-aneesh.kumar@kernel.org>
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

- define the SMCCC IDs and inline wrappers for RMI_VDEV_UNLOCK and
  RMI_VDEV_DESTROY
- extend vdev_create() to treat communication failures as fatal and
  tear down the newly created vdev
- provide vdev_unlock_and_destroy() that drives the vdev back to the
  unlocked state, issues the destroy call, and frees the delegated granule
- hook the new helper into the TSM unbind path so host cleanup always
  unlock and destroy RMM vdev and releases cached buffers

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 arch/arm64/include/asm/rmi_cmds.h        | 20 +++++++
 arch/arm64/include/asm/rmi_smc.h         |  2 +
 drivers/virt/coco/arm-cca-host/arm-cca.c | 25 +++++++++
 drivers/virt/coco/arm-cca-host/rmi-da.c  | 69 ++++++++++++++++++++++--
 drivers/virt/coco/arm-cca-host/rmi-da.h  |  3 ++
 5 files changed, 116 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/rmi_cmds.h b/arch/arm64/include/asm/rmi_cmds.h
index 03dffba763e1..aa7ef9f07517 100644
--- a/arch/arm64/include/asm/rmi_cmds.h
+++ b/arch/arm64/include/asm/rmi_cmds.h
@@ -949,4 +949,24 @@ static inline unsigned long rmi_pdev_stream_key_purge(unsigned long pdev1_phys,
 	return res.a0;
 }
 
+static inline unsigned long rmi_vdev_unlock(unsigned long rd,
+		unsigned long pdev_phys, unsigned long vdev_phys)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_1_1_invoke(SMC_RMI_VDEV_UNLOCK, rd, pdev_phys, vdev_phys, &res);
+
+	return res.a0;
+}
+
+static inline unsigned long rmi_vdev_destroy(unsigned long rd,
+		unsigned long pdev_phys, unsigned long vdev_phys)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_1_1_invoke(SMC_RMI_VDEV_DESTROY, rd, pdev_phys, vdev_phys, &res);
+
+	return res.a0;
+}
+
 #endif /* __ASM_RMI_CMDS_H */
diff --git a/arch/arm64/include/asm/rmi_smc.h b/arch/arm64/include/asm/rmi_smc.h
index d14d13a9f169..6cd5439f56ec 100644
--- a/arch/arm64/include/asm/rmi_smc.h
+++ b/arch/arm64/include/asm/rmi_smc.h
@@ -649,6 +649,8 @@ enum rmi_vdev_state {
 	RMI_VDEV_LOCKED,
 	RMI_VDEV_STARTED,
 	RMI_VDEV_ERROR,
+	RMI_VDEV_KEY_REFRESH,
+	RMI_VDEV_KEY_PURGE,
 };
 
 #define MAX_VDEV_ADDR_RANGE 8
diff --git a/drivers/virt/coco/arm-cca-host/arm-cca.c b/drivers/virt/coco/arm-cca-host/arm-cca.c
index 5930a30dd16f..b75fa20513a9 100644
--- a/drivers/virt/coco/arm-cca-host/arm-cca.c
+++ b/drivers/virt/coco/arm-cca-host/arm-cca.c
@@ -473,12 +473,37 @@ static struct pci_tdi *cca_tsm_bind(struct pci_dev *pdev, struct kvm *kvm, u32 t
 	return &no_free_ptr(host_tdi)->tdi;
 }
 
+/*
+ * All device memory should be unmapped by now.
+ * 1. A pci device destroy will cause a driver remove (vfio) which will have
+ *    done a dmabuf based unmap
+ * 2. A vdevice/idevice destroy from VMM should have done a unmap_private_range
+ *    vm ioctl before
+ * 3. A guest unlock request should have done a rsi_invalidiate_mem_mapping
+ *    before unlock rhi
+ * 4. vfio_pci_core_close_device() should trigger tsm unbind if vdevice is not
+ *    already distroyed and that path involves vfio_pci_dma_buf_cleanup() which
+ *    should get kvm to unmap the devmap
+ */
+static void cca_tsm_unbind(struct pci_tdi *tdi)
+{
+	struct cca_host_tdi *host_tdi;
+	struct realm *realm = &tdi->kvm->arch.realm;
+
+	host_tdi = container_of(tdi, struct cca_host_tdi, tdi);
+	cca_vdev_unlock_and_destroy(realm, tdi->pdev, tdi->pdev->tsm->dsm_dev);
+	kvfree(host_tdi->interface_report);
+	kvfree(host_tdi->measurements);
+	kfree(host_tdi);
+}
+
 static struct pci_tsm_ops cca_link_pci_ops = {
 	.probe = cca_tsm_pci_probe,
 	.remove = cca_tsm_pci_remove,
 	.connect = cca_tsm_connect,
 	.disconnect = cca_tsm_disconnect,
 	.bind = cca_tsm_bind,
+	.unbind = cca_tsm_unbind,
 };
 
 static void cca_link_tsm_remove(void *tsm_dev)
diff --git a/drivers/virt/coco/arm-cca-host/rmi-da.c b/drivers/virt/coco/arm-cca-host/rmi-da.c
index 128079d5b993..ef25392562e0 100644
--- a/drivers/virt/coco/arm-cca-host/rmi-da.c
+++ b/drivers/virt/coco/arm-cca-host/rmi-da.c
@@ -1018,15 +1018,25 @@ void *cca_vdev_create(struct realm *realm, struct pci_dev *pdev,
 	host_tdi->rmm_vdev = rmm_vdev;
 	host_tdi->realm = realm;
 
-	submit_vdev_state_transition_work(pdev, RMI_VDEV_UNLOCKED);
+	ret = submit_vdev_state_transition_work(pdev, RMI_VDEV_UNLOCKED);
+	/* failure is treated as rmi_vdev_create failure */
+	if (ret)
+		goto err_vdev_comm;
 
-	ret = rmi_vdev_lock(rd_phys, rmm_pdev_phys, rmm_vdev_phys);
+	if (rmi_vdev_lock(rd_phys, rmm_pdev_phys, rmm_vdev_phys)) {
+		ret = -ENXIO;
+		goto err_vdev_comm;
+	}
 
-	submit_vdev_state_transition_work(pdev, RMI_VDEV_LOCKED);
+	ret = submit_vdev_state_transition_work(pdev, RMI_VDEV_LOCKED);
+	if (ret)
+		goto err_vdev_comm;
 
 	free_page((unsigned long)params);
 	return rmm_vdev;
 
+err_vdev_comm:
+	rmi_vdev_destroy(rd_phys, rmm_pdev_phys, rmm_vdev_phys);
 err_vdev_create:
 	free_page((unsigned long)params);
 err_params_alloc:
@@ -1073,3 +1083,56 @@ int cca_pdev_purge_stream_key(struct pci_dev *pdev1,
 
 	return submit_stream_work(pdev1, pdev2, stream_handle);
 }
+
+void cca_vdev_unlock_and_destroy(struct realm *realm,
+		struct pci_dev *pdev, struct pci_dev *pf0_dev)
+{
+	int ret;
+	phys_addr_t rmm_pdev_phys;
+	phys_addr_t rmm_vdev_phys;
+	struct cca_host_pdev_dsc *pdev_dsc;
+	struct cca_host_tdi *host_tdi;
+	phys_addr_t rd_phys = virt_to_phys(realm->rd);
+
+	host_tdi = to_cca_host_tdi(pdev);
+	rmm_vdev_phys = virt_to_phys(host_tdi->rmm_vdev);
+
+	pdev_dsc = to_cca_pdev_dsc(pf0_dev);
+	rmm_pdev_phys = virt_to_phys(pdev_dsc->rmm_pdev);
+	if (rmi_vdev_unlock(rd_phys, rmm_pdev_phys, rmm_vdev_phys)) {
+		pci_err(pdev, "failed to unlock vdev\n");
+		goto unlock_err;
+	}
+
+	if (rmm_has_reg2_feature(RMI_FEATURE_REGISTER_2_VDEV_KROU)) {
+		struct pci_dev *rp = pcie_find_root_port(pf0_dev);
+		struct cca_host_pf0_ep_dsc *pf0_ep_dsc = to_cca_pf0_ep_dsc(pf0_dev);
+
+		ret = submit_vdev_state_transition_work(pdev, RMI_VDEV_KEY_REFRESH);
+		if (ret)
+			pci_err(pdev, "failed to transition vdev to KEY_REFRESH state (%d)\n", ret);
+
+		ret = cca_pdev_refresh_stream_key(pf0_dev, rp, pf0_ep_dsc->stream_handle);
+		if (ret)
+			pci_err(pf0_dev, "failed to refresh pdev stream key (%d)\n", ret);
+
+		ret = cca_pdev_purge_stream_key(pf0_dev, rp, pf0_ep_dsc->stream_handle);
+		if (ret)
+			pci_err(pf0_dev, "failed to purge pdev stream key (%d)\n", ret);
+	}
+
+	ret = submit_vdev_state_transition_work(pdev, RMI_VDEV_UNLOCKED);
+	if (ret)
+		pci_err(pdev, "failed to unlock vdev (%d)\n", ret);
+
+unlock_err:
+	/* Try to destroy even in case of error */
+	if (rmi_vdev_destroy(rd_phys, rmm_pdev_phys, rmm_vdev_phys))
+		pci_err(pdev, "failed to destroy vdev\n");
+
+	if (!rmi_undelegate_page(rmm_vdev_phys))
+		free_page((unsigned long)host_tdi->rmm_vdev);
+
+	host_tdi->rmm_vdev = NULL;
+	host_tdi->realm = NULL;
+}
diff --git a/drivers/virt/coco/arm-cca-host/rmi-da.h b/drivers/virt/coco/arm-cca-host/rmi-da.h
index d6cdbc638d6d..97f7eaf1f779 100644
--- a/drivers/virt/coco/arm-cca-host/rmi-da.h
+++ b/drivers/virt/coco/arm-cca-host/rmi-da.h
@@ -15,6 +15,7 @@
 #include <linux/wait.h>
 #include <asm/rmi_cmds.h>
 #include <asm/rmi_smc.h>
+#include <asm/rhi.h>
 
 #define MAX_CACHE_OBJ_SIZE	SZ_16M
 #define CACHE_CHUNK_SIZE	SZ_4K
@@ -239,5 +240,7 @@ int cca_pdev_refresh_stream_key(struct pci_dev *pdev1,
 		struct pci_dev *pdev2, unsigned long stream_handle);
 int cca_pdev_purge_stream_key(struct pci_dev *pdev1,
 		struct pci_dev *pdev2, unsigned long stream_handle);
+void cca_vdev_unlock_and_destroy(struct realm *realm, struct pci_dev *pdev,
+		struct pci_dev *pf0_dev);
 
 #endif
-- 
2.43.0


