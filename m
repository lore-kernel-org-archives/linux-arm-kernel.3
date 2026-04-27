Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A465EFF8861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 08:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wtz6p44ZR9oWYbevzH7AgXKOemzBnxa8yL3vHE3IEEU=; b=MPNWyDAqwXrmtQuTBeu3q9T/2Y
	1YqQEaqQNJCioSpzbrIRlq+kZSMRQAAead3LdRCQukoWie0cQ1/af+TT7N5CbtCqXgxK16ot3q6cK
	x/lUbGqe4uHyoXBpcq8rhFfm1uFzsjeLJmMW8hlPKnEJWx1SPj9EVMfIZSRLU8qPjB9CpYxdW18NP
	D8Ofse0pFnXE+wtp7Yoa5a4dmVP+g2JFl2e2KCiKcDPimAfKr38N14IxPvb6SBg033pvzMjaperNd
	Lh3C0J/CT9OqXT50RIJjn/33Frsl06mUza4X9jGvLuOd+mfRMZBPph11vdDPCfP+yiNhkMr9+3XPC
	kRaZTyhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHLE-0000000GSvU-3GBi;
	Mon, 27 Apr 2026 08:29:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHLA-0000000GSrj-1NC2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 08:29:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B5EA660181;
	Mon, 27 Apr 2026 08:28:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9E03C19425;
	Mon, 27 Apr 2026 08:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777278525;
	bh=lETn6Kr3OyzzZutG3/vCFA7uINmnc95y+RJn66EJb2Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h243qLzFJ5S339UPMeg3rROQnMZbIdibcNdwFIKHzxamct4S2+cC388t517yyZllG
	 pqP1sSxWRaZDbWjozrsummi7AC1yluW5uxk9LF+4c+V88WvqNi8o8e4+gPD+HZVKDc
	 X4hQfHj3yx2Cn5kwoJkvN4v2pNWlK9TilJXpbY3sL187+xwPRkJ/TFz3Hp22BtoFyP
	 E7ZytP3oG9gxgP5kHgolNT9YQCSyqG46tW558h+BTTamwXhQ38MvgTS2T/odUHbI6L
	 T6GzY57L51s1mDJ5Ah1a0eO8hHTnt5nCzr7wIHuSPb43En8r/z3tFAiyTT38YcJP7D
	 BUlrifBNuRCnQ==
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
	Xu Yilun <yilun.xu@linux.intel.com>
Subject: [RFC PATCH v4 06/11] coco: guest: arm64: Add measurement refresh via RHI_DA_VDEV_GET_MEASUREMENTS
Date: Mon, 27 Apr 2026 13:58:00 +0530
Message-ID: <20260427082805.931832-7-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427082805.931832-1-aneesh.kumar@kernel.org>
References: <20260427082805.931832-1-aneesh.kumar@kernel.org>
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

Add guest support to request fresh device measurements using
RHI_DA_VDEV_GET_MEASUREMENTS.

Define measurement request parameters (flags + nonce), request RAW
measurements, and implement cookie-based continuation for incomplete DA
operations. Extend cca_update_device_object_cache() to refresh both
interface report and measurements.

Because RHI buffers are shared with the host, add shared-page allocation
helpers that convert pages to decrypted/shared memory before use and restore
them to encrypted/private state on free.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 arch/arm64/include/asm/rhi.h              | 11 ++++
 drivers/virt/coco/arm-cca-guest/arm-cca.c |  1 +
 drivers/virt/coco/arm-cca-guest/rhi-da.c  | 78 +++++++++++++++++++++++
 drivers/virt/coco/arm-cca-guest/rhi-da.h  |  1 +
 drivers/virt/coco/arm-cca-guest/rsi-da.c  | 42 +++++++++++-
 drivers/virt/coco/arm-cca-guest/rsi-da.h  |  2 +
 6 files changed, 134 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/rhi.h b/arch/arm64/include/asm/rhi.h
index 15946fe64484..2b56a7760904 100644
--- a/arch/arm64/include/asm/rhi.h
+++ b/arch/arm64/include/asm/rhi.h
@@ -50,6 +50,17 @@ unsigned long rhi_get_ipa_change_alignment(void);
 
 #define RHI_DA_VDEV_CONTINUE		SMC_RHI_CALL(0x0051)
 
+#define RHI_VDEV_MEASURE_HASH	0x0
+#define RHI_VDEV_MEASURE_RAW	0x1
+struct rhi_vdev_measurement_params {
+	union {
+		u64 flags;
+		u8 padding0[0x100];
+	};
+	u8 nonce[32];
+};
+#define RHI_DA_VDEV_GET_MEASUREMENTS	SMC_RHI_CALL(0x0052)
+
 #define RHI_DA_VDEV_GET_INTERFACE_REPORT SMC_RHI_CALL(0x0053)
 
 enum rhi_tdi_state {
diff --git a/drivers/virt/coco/arm-cca-guest/arm-cca.c b/drivers/virt/coco/arm-cca-guest/arm-cca.c
index 411cbbaa5d26..0f9cfb329a06 100644
--- a/drivers/virt/coco/arm-cca-guest/arm-cca.c
+++ b/drivers/virt/coco/arm-cca-guest/arm-cca.c
@@ -215,6 +215,7 @@ static struct pci_tsm *cca_tsm_lock(struct tsm_dev *tsm_dev, struct pci_dev *pde
 	if (ret)
 		return ERR_PTR(ret);
 
+	/* collect evidence without nonce */
 	ret = cca_update_device_object_cache(pdev, NULL);
 	if (ret) {
 		cca_device_unlock(pdev);
diff --git a/drivers/virt/coco/arm-cca-guest/rhi-da.c b/drivers/virt/coco/arm-cca-guest/rhi-da.c
index 5078136a4cc6..d0f5ae320f83 100644
--- a/drivers/virt/coco/arm-cca-guest/rhi-da.c
+++ b/drivers/virt/coco/arm-cca-guest/rhi-da.c
@@ -205,3 +205,81 @@ int rhi_update_vdev_interface_report_cache(struct pci_dev *pdev)
 
 	return ret;
 }
+
+static inline int rhi_vdev_get_measurements(unsigned long vdev_id,
+		phys_addr_t vdev_meas_phys, unsigned long *cookie)
+{
+	unsigned long ret;
+
+	struct rsi_host_call *rhi_call __free(kfree) =
+		kmalloc(sizeof(*rhi_call), GFP_KERNEL);
+	if (!rhi_call)
+		return -ENOMEM;
+
+	rhi_call->imm = 0;
+	rhi_call->gprs[0] = RHI_DA_VDEV_GET_MEASUREMENTS;
+	rhi_call->gprs[1] = vdev_id;
+	rhi_call->gprs[2] = vdev_meas_phys;
+
+	ret = rsi_host_call(rhi_call);
+	if (ret != RSI_SUCCESS)
+		return -EIO;
+
+	*cookie = rhi_call->gprs[1];
+	return map_rhi_da_error(rhi_call->gprs[0]);
+}
+
+static inline struct rhi_vdev_measurement_params *alloc_vdev_meas_params(void)
+{
+	struct page *pages;
+
+	pages = alloc_shared_pages(NUMA_NO_NODE, GFP_KERNEL,
+				   sizeof(struct rhi_vdev_measurement_params));
+	if (!pages)
+		return NULL;
+	return page_address(pages);
+}
+
+static inline void vdev_meas_params_free(struct rhi_vdev_measurement_params *params)
+{
+	struct page *pages = virt_to_page(params);
+
+	free_shared_pages(pages, sizeof(struct rhi_vdev_measurement_params));
+}
+
+DEFINE_FREE(vdev_meas_params_free, struct rhi_vdev_measurement_params *, if (_T) vdev_meas_params_free(_T))
+int rhi_update_vdev_measurements_cache(struct pci_dev *pdev, const u8 *nonce)
+{
+	int ret;
+	unsigned long cookie;
+	int vdev_id = rsi_vdev_id(pdev);
+	phys_addr_t vdev_meas_phys;
+
+	struct rhi_vdev_measurement_params *dev_meas __free(vdev_meas_params_free) =
+		alloc_vdev_meas_params();
+	if (!dev_meas)
+		return -ENOMEM;
+
+	vdev_meas_phys = virt_to_phys(dev_meas);
+	/* request for raw bitstream */
+	dev_meas->flags = RHI_VDEV_MEASURE_RAW;
+	if (nonce)
+		memcpy(dev_meas->nonce, nonce, 32);
+
+	for (;;) {
+		ret = rhi_vdev_get_measurements(vdev_id, vdev_meas_phys, &cookie);
+		if (ret != -EBUSY)
+			break;
+		cond_resched();
+	}
+
+	while (ret == RHI_DA_INCOMPLETE) {
+		if (should_abort_rhi_call_loop(vdev_id))
+			return -EINTR;
+		ret = rhi_vdev_continue(vdev_id, cookie);
+	}
+
+	if (ret)
+		pci_err(pdev, "failed to get device measurement (%d)\n", ret);
+	return ret;
+}
diff --git a/drivers/virt/coco/arm-cca-guest/rhi-da.h b/drivers/virt/coco/arm-cca-guest/rhi-da.h
index 8b7faf4d1c8a..d32ccc48c0d0 100644
--- a/drivers/virt/coco/arm-cca-guest/rhi-da.h
+++ b/drivers/virt/coco/arm-cca-guest/rhi-da.h
@@ -12,4 +12,5 @@ struct pci_dev;
 bool rhi_has_da_support(void);
 int rhi_vdev_set_tdi_state(struct pci_dev *pdev, enum rhi_tdi_state target_state);
 int rhi_update_vdev_interface_report_cache(struct pci_dev *pdev);
+int rhi_update_vdev_measurements_cache(struct pci_dev *pdev, const u8 *nonce);
 #endif
diff --git a/drivers/virt/coco/arm-cca-guest/rsi-da.c b/drivers/virt/coco/arm-cca-guest/rsi-da.c
index 6c78f0e2f3a1..9f9e54174813 100644
--- a/drivers/virt/coco/arm-cca-guest/rsi-da.c
+++ b/drivers/virt/coco/arm-cca-guest/rsi-da.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/pci.h>
+#include <linux/mem_encrypt.h>
 #include <asm/rsi_cmds.h>
 
 #include "rsi-da.h"
@@ -33,6 +34,45 @@ int cca_device_unlock(struct pci_dev *pdev)
 	return 0;
 }
 
+struct page *alloc_shared_pages(int nid, gfp_t gfp_mask, unsigned long min_size)
+{
+	int ret;
+	struct page *page;
+	/* We should normalize the size based on hypervisor page size */
+	int page_order = get_order(min_size);
+
+	page = alloc_pages_node(nid, gfp_mask | __GFP_ZERO, page_order);
+	if (!page)
+		return NULL;
+
+	ret = set_memory_decrypted((unsigned long)page_address(page),
+				   1 << page_order);
+	/*
+	 * If set_memory_decrypted() fails then we don't know what state the
+	 * page is in, so we can't free it. Instead we leak it.
+	 * set_memory_decrypted() will already have WARNed.
+	 */
+	if (ret)
+		return NULL;
+
+	return page;
+}
+
+int free_shared_pages(struct page *page, unsigned long size)
+{
+	int ret;
+	/* We should normalize the size based on hypervisor page size */
+	int page_order = get_order(size);
+
+	ret = set_memory_encrypted((unsigned long)page_address(page), 1 << page_order);
+	/* If we fail to mark it encrypted don't free it back */
+	if (ret)
+		return ret;
+
+	__free_pages(page, page_order);
+	return 0;
+}
+
 int cca_update_device_object_cache(struct pci_dev *pdev, const u8 *nonce)
 {
 	int ret;
@@ -43,5 +83,5 @@ int cca_update_device_object_cache(struct pci_dev *pdev, const u8 *nonce)
 		return ret;
 	}
 
-	return 0;
+	return rhi_update_vdev_measurements_cache(pdev, nonce);
 }
diff --git a/drivers/virt/coco/arm-cca-guest/rsi-da.h b/drivers/virt/coco/arm-cca-guest/rsi-da.h
index dda8026a1c3f..297cb800edc0 100644
--- a/drivers/virt/coco/arm-cca-guest/rsi-da.h
+++ b/drivers/virt/coco/arm-cca-guest/rsi-da.h
@@ -35,5 +35,7 @@ static inline int rsi_vdev_id(struct pci_dev *pdev)
 int cca_device_lock(struct pci_dev *pdev);
 int cca_device_unlock(struct pci_dev *pdev);
 int cca_update_device_object_cache(struct pci_dev *pdev, const u8 *nonce);
+struct page *alloc_shared_pages(int nid, gfp_t gfp_mask, unsigned long min_size);
+int free_shared_pages(struct page *page, unsigned long min_size);
 
 #endif
-- 
2.43.0


