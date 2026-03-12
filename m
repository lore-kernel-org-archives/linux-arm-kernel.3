Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A8C1FED2E7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 08:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ohPPvSnL8wv4sEGIbRfQcM/qe+dcps+NlAQbs0sYPA=; b=K/i3lassRfrIphV6O432MrSj9Z
	ygkIaRINf4NXJvwelNfRGtJVmVyZ72gtw/GWm1IJbA+08XWqeopW5TaJCAtR/GRnA+UYcYvg22ttF
	Lq2F4BL1Yi3A9bc32FGa3PAGq9MeaL7NTRG+nFGlEipD8x4FNNn1bQveXP++vS1oT1k2HT1aWH7hC
	7tCV08LrjyWIwUaifKdXKE/DbmRxtqt2s6oWsZ1QbegPYglnAh33RKiVk/VBJu8nOTU27DG/6bp29
	PbAOCmxfaZRjVrtH1vhQkeeaHJq/og4OlQx2smBkPwjtHtMjNhgI538wBpJrj+XSml2iJ5N/BSw+y
	i3MNWWEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0b2u-0000000DaUE-0Z94;
	Thu, 12 Mar 2026 08:05:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0b2p-0000000DaS2-0uvy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 08:05:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 630186057A;
	Thu, 12 Mar 2026 08:05:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F514C19424;
	Thu, 12 Mar 2026 08:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773302722;
	bh=DkO/R9INwpiXbkUZ7Y5YuPYANwhfaZ7AaTmvxjGcFgQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j7OS/fOD5rRJj4PQUyc6TU63NPlqG8LagC0g8p6Q7VgXvfTSOO0b73Mtb1zr6Tail
	 LpClAXyZevOqBY6TVbSkhmgKu6vkTIWY++E3ANvLX/p62wmMmAlVk+cgl8KNE4DdIe
	 B40bsk56OWtwYCi7Uw6HP/K93IPbmbn22wDUpthopZLY0yIMBUk9HeatzGMiLmHCKl
	 GJqYCMFEfPAxJweFaUfgJoaavlO9sDhb2+R55DCJaXl9b+PEpVSqx2JOWdTm1sIbP3
	 TexFIi8OfO2+UGT5YCSbze2EsUTq5cJsOb7yIMvApiHPj02uGmJVib6Fx6+OZR0hjP
	 5tMtp6+ebLEig==
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
Subject: [RFC PATCH v3 05/11] coco: guest: arm64: Refresh interface-report cache during device lock
Date: Thu, 12 Mar 2026 13:34:36 +0530
Message-ID: <20260312080442.3485633-6-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260312080442.3485633-1-aneesh.kumar@kernel.org>
References: <20260312080442.3485633-1-aneesh.kumar@kernel.org>
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

Add support for RHI_DA_VDEV_GET_INTERFACE_REPORT and use it to refresh the
host-side cached interface report when a device is locked.

Implement rhi_update_vdev_interface_report_cache() with busy retry and
cookie-based CONTINUE handling for incomplete operations. Surface the flow
through cca_update_device_object_cache(), and call it from the lock path so
the interface report is fetched before lock succeeds.

On refresh failure, unwind by unlocking the device and returning the error.

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
 arch/arm64/include/asm/rhi.h              |  1 +
 drivers/virt/coco/arm-cca-guest/arm-cca.c |  6 ++++
 drivers/virt/coco/arm-cca-guest/rhi-da.c  | 44 +++++++++++++++++++++++
 drivers/virt/coco/arm-cca-guest/rhi-da.h  |  1 +
 drivers/virt/coco/arm-cca-guest/rsi-da.c  | 13 +++++++
 drivers/virt/coco/arm-cca-guest/rsi-da.h  |  1 +
 6 files changed, 66 insertions(+)

diff --git a/arch/arm64/include/asm/rhi.h b/arch/arm64/include/asm/rhi.h
index 029ccd77cfbf..076aecbce1c5 100644
--- a/arch/arm64/include/asm/rhi.h
+++ b/arch/arm64/include/asm/rhi.h
@@ -49,6 +49,7 @@ unsigned long rhi_get_ipa_change_alignment(void);
 #define RHI_DA_FEATURES			SMC_RHI_CALL(0x004B)
 
 #define RHI_DA_VDEV_CONTINUE		SMC_RHI_CALL(0x0051)
+#define RHI_DA_VDEV_GET_INTERFACE_REPORT SMC_RHI_CALL(0x0053)
 
 enum rhi_tdi_state {
 	RHI_DA_TDI_CONFIG_UNLOCKED,
diff --git a/drivers/virt/coco/arm-cca-guest/arm-cca.c b/drivers/virt/coco/arm-cca-guest/arm-cca.c
index 5e3a66315c70..cb9f389be8b8 100644
--- a/drivers/virt/coco/arm-cca-guest/arm-cca.c
+++ b/drivers/virt/coco/arm-cca-guest/arm-cca.c
@@ -215,6 +215,12 @@ static struct pci_tsm *cca_tsm_lock(struct tsm_dev *tsm_dev, struct pci_dev *pde
 	if (ret)
 		return ERR_PTR(ret);
 
+	ret = cca_update_device_object_cache(pdev, NULL);
+	if (ret) {
+		cca_device_unlock(pdev);
+		return ERR_PTR(ret);
+	}
+
 	return &no_free_ptr(cca_dsc)->pci.base_tsm;
 }
 
diff --git a/drivers/virt/coco/arm-cca-guest/rhi-da.c b/drivers/virt/coco/arm-cca-guest/rhi-da.c
index 0a04c0ec9320..4597fb87044e 100644
--- a/drivers/virt/coco/arm-cca-guest/rhi-da.c
+++ b/drivers/virt/coco/arm-cca-guest/rhi-da.c
@@ -156,3 +156,47 @@ int rhi_vdev_set_tdi_state(struct pci_dev *pdev, enum rhi_tdi_state target_state
 
 	return ret;
 }
+
+static inline int rhi_vdev_get_interface_report(unsigned long vdev_id,
+						unsigned long *cookie)
+{
+	unsigned long ret;
+
+	struct rsi_host_call *rhi_call __free(kfree) =
+		kmalloc(sizeof(struct rsi_host_call), GFP_KERNEL);
+	if (!rhi_call)
+		return -ENOMEM;
+
+	rhi_call->imm = 0;
+	rhi_call->gprs[0] = RHI_DA_VDEV_GET_INTERFACE_REPORT;
+	rhi_call->gprs[1] = vdev_id;
+
+	ret = rsi_host_call(rhi_call);
+	if (ret != RSI_SUCCESS)
+		return -EIO;
+
+	*cookie = rhi_call->gprs[1];
+	return map_rhi_da_error(rhi_call->gprs[0]);
+}
+
+int rhi_update_vdev_interface_report_cache(struct pci_dev *pdev)
+{
+	int ret;
+	unsigned long cookie;
+	int vdev_id = rsi_vdev_id(pdev);
+
+	for (;;) {
+		ret = rhi_vdev_get_interface_report(vdev_id, &cookie);
+		if (ret != -EBUSY)
+			break;
+		cond_resched();
+	}
+
+	while (ret == E_INCOMPLETE) {
+		if (should_abort_rhi_call_loop(vdev_id))
+			return -EINTR;
+		ret = rhi_vdev_continue(vdev_id, cookie);
+	}
+
+	return ret;
+}
diff --git a/drivers/virt/coco/arm-cca-guest/rhi-da.h b/drivers/virt/coco/arm-cca-guest/rhi-da.h
index 43c1cda8738d..8b7faf4d1c8a 100644
--- a/drivers/virt/coco/arm-cca-guest/rhi-da.h
+++ b/drivers/virt/coco/arm-cca-guest/rhi-da.h
@@ -11,4 +11,5 @@
 struct pci_dev;
 bool rhi_has_da_support(void);
 int rhi_vdev_set_tdi_state(struct pci_dev *pdev, enum rhi_tdi_state target_state);
+int rhi_update_vdev_interface_report_cache(struct pci_dev *pdev);
 #endif
diff --git a/drivers/virt/coco/arm-cca-guest/rsi-da.c b/drivers/virt/coco/arm-cca-guest/rsi-da.c
index 2c3017933fb0..6c78f0e2f3a1 100644
--- a/drivers/virt/coco/arm-cca-guest/rsi-da.c
+++ b/drivers/virt/coco/arm-cca-guest/rsi-da.c
@@ -32,3 +32,16 @@ int cca_device_unlock(struct pci_dev *pdev)
 	}
 	return 0;
 }
+
+int cca_update_device_object_cache(struct pci_dev *pdev, const u8 *nonce)
+{
+	int ret;
+
+	ret = rhi_update_vdev_interface_report_cache(pdev);
+	if (ret) {
+		pci_err(pdev, "failed to get interface report (%d)\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
diff --git a/drivers/virt/coco/arm-cca-guest/rsi-da.h b/drivers/virt/coco/arm-cca-guest/rsi-da.h
index 3619a75e160e..9ab3408d6354 100644
--- a/drivers/virt/coco/arm-cca-guest/rsi-da.h
+++ b/drivers/virt/coco/arm-cca-guest/rsi-da.h
@@ -34,4 +34,5 @@ static inline int rsi_vdev_id(struct pci_dev *pdev)
 
 int cca_device_lock(struct pci_dev *pdev);
 int cca_device_unlock(struct pci_dev *pdev);
+int cca_update_device_object_cache(struct pci_dev *pdev, const u8 *nonce);
 #endif
-- 
2.43.0


