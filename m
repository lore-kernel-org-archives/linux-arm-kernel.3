Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02ACAFF885E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 08:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xhwCNidudwnOCBO6crXrBOfj6BdeLRjx93te08MVXlY=; b=uJf6xqUAuNYWUNskxlJCd86e/i
	vphGcblYP1VY5V0AOU0IQ6m0LPyxTJ6KxWGmTEUgf3eLGvtztzoGZ30WZuFgWR7xw1+hGGaMCDHpn
	BTfrB/OJEAuoAbLx0ZOAohPAV6/HfvRnJWp1f2eEWp1U/auKMX5z/eQZWDKJ2apdz2rsCnknSlvh/
	IzD480grdmStRN63o+qFbH94Hm/ZA81XmEbA38BPmC4kdXYxzf+f578dc8EFUfitIQMnEEiIR7xXR
	18wtWzKse4gdbWYkfRW8JO54hdHCz0LgxU9ekAr5kan1sWZ6RBXor8XRXmOz5Nt3P5ZZ+U18UHTLK
	WD001irA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHL9-0000000GSrC-1t7q;
	Mon, 27 Apr 2026 08:29:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHL7-0000000GSos-0xJA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 08:29:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 74E3243DBE;
	Mon, 27 Apr 2026 08:29:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77652C19425;
	Mon, 27 Apr 2026 08:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777278552;
	bh=yxjevm5oUKp+Ad1dbtRsU+HvpruAP9tlDylolCjcQ68=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BdZ6qEdV33fGBqfrtAflGDSklSvA6FcI9KLrVk1QUhbCkYpPMy/ZkPSrpPVgc6/um
	 lUREXGnjfWyG88dp9nr3czFBv/PMa5A1EIs4YjlhdPVar1qCP/MKls/M2vcLSyUalq
	 Lfyp3BlIQhmP/P133zjsn7g9O7o6/RkRmK7gu8UL9lu0APc/s6VN2UpmEYV8no7JrS
	 G4FXJQS+WpeqV6ym/+UCkV47BKJfAab7qruaGsBbPyxjcsBIjMlntgUPsGNT1FXcGy
	 7nMV1b1pQFrtsP4TtOjzMy0pzSqqDJD7NixxXxu3D6LR86pV4YKNpBGilq8VsVOdIs
	 Lv4QSltx5nDZQ==
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
	Xu Yilun <yilun.xu@linux.intel.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [RFC PATCH v4 11/11] coco: guest: arm64: Enable vdev DMA after attestation
Date: Mon, 27 Apr 2026 13:58:05 +0530
Message-ID: <20260427082805.931832-12-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427082805.931832-1-aneesh.kumar@kernel.org>
References: <20260427082805.931832-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_012913_359903_88CC9D6B 
X-CRM114-Status: GOOD (  12.98  )
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

- define SMC_RSI_VDEV_DMA_ENABLE and add wrapper in rsi_cmds.h
- invoke the new helper from the guest accept path once the device
  passes attestation, rolling back to TDI_LOCKED on failure

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 arch/arm64/include/asm/rsi_cmds.h        | 16 ++++++++++++++++
 arch/arm64/include/asm/rsi_smc.h         |  2 ++
 drivers/virt/coco/arm-cca-guest/rsi-da.c | 14 ++++++++++++++
 3 files changed, 32 insertions(+)

diff --git a/arch/arm64/include/asm/rsi_cmds.h b/arch/arm64/include/asm/rsi_cmds.h
index f72d8e0cd422..1e0d1cd8841a 100644
--- a/arch/arm64/include/asm/rsi_cmds.h
+++ b/arch/arm64/include/asm/rsi_cmds.h
@@ -226,4 +226,20 @@ static inline unsigned long rsi_vdev_get_info(unsigned long vdev_id,
 	return res.a0;
 }
 
+static inline unsigned long __rsi_vdev_dma_enable(unsigned long vdev_id,
+						  unsigned long flags,
+						  unsigned long non_ats_plane,
+						  unsigned long lock_nonce,
+						  unsigned long meas_nonce,
+						  unsigned long report_nonce)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_1_1_invoke(SMC_RSI_VDEV_DMA_ENABLE, vdev_id, flags,
+			     non_ats_plane, lock_nonce,
+			     meas_nonce, report_nonce, &res);
+
+	return res.a0;
+}
+
 #endif /* __ASM_RSI_CMDS_H */
diff --git a/arch/arm64/include/asm/rsi_smc.h b/arch/arm64/include/asm/rsi_smc.h
index 99b34b37b693..1d98a3b47c89 100644
--- a/arch/arm64/include/asm/rsi_smc.h
+++ b/arch/arm64/include/asm/rsi_smc.h
@@ -186,6 +186,8 @@ struct realm_config {
  */
 #define SMC_RSI_IPA_STATE_GET			SMC_RSI_FID(0x198)
 
+#define SMC_RSI_VDEV_DMA_ENABLE			SMC_RSI_FID(0x19C)
+
 #define RSI_VDEV_REPORT_FORMAT_TDISP 0x1
 struct rsi_vdevice_info {
 	union {
diff --git a/drivers/virt/coco/arm-cca-guest/rsi-da.c b/drivers/virt/coco/arm-cca-guest/rsi-da.c
index 7c2b28fa43a1..77267479df19 100644
--- a/drivers/virt/coco/arm-cca-guest/rsi-da.c
+++ b/drivers/virt/coco/arm-cca-guest/rsi-da.c
@@ -231,9 +231,17 @@ int cca_verify_digests(u64 hash_algo,
 	return 0;
 }
 
+static inline int rsi_vdev_enable_dma(int vdev_id, struct dsm_device_info *dev_info)
+{
+	/* No ATS support */
+	return __rsi_vdev_dma_enable(vdev_id, 0, 0, dev_info->lock_nonce,
+				     dev_info->meas_nonce, dev_info->report_nonce);
+}
+
 int cca_device_accept(struct pci_dev *pdev, unsigned long lock_nonce)
 {
 	int ret;
+	int vdev_id = rsi_vdev_id(pdev);
 	struct cca_guest_dsc *dsc = to_cca_guest_dsc(pdev);
 
 	if (lock_nonce != dsc->dev_info.lock_nonce) {
@@ -270,6 +278,12 @@ int cca_device_accept(struct pci_dev *pdev, unsigned long lock_nonce)
 		return ret;
 	}
 
+	if (rsi_vdev_enable_dma(vdev_id, &dsc->dev_info)) {
+		rhi_vdev_set_tdi_state(pdev, RHI_DA_TDI_CONFIG_LOCKED);
+		pci_err(pdev, "failed to enable DMA from the device\n");
+		return -EIO;
+	}
+
 	dsc->pci.mmio = no_free_ptr(tsm_mmio);
 	return 0;
 }
-- 
2.43.0


