Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC893FED2E7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 08:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sj7BPS+Rahan0inSWk1AURyzIdFtNyda7fyde8iyOjE=; b=BNn3Tel4XkkEFkEXRH0ra4JY7u
	2FcvMPfEXSOt+eZ0RCjeTpR6MVWrshvShiPRScNFgEX9ApG6bXC3UWSZ5js/RFq9/UxIhokfV2fs9
	M3qrjVAj93RhrzGosm/nDlUBXIM6xWx+rTbvj+0Wjd2rLCcNZQGRTmNoAthxzFWQGxb6yURUKlneY
	142dEPV2tKJX1HKb0UkUyLn4AHKHuxRwa/wm2Fbd1389bCFy6xMeizpFxt3iOkseMUYJrVzE7Z/Qy
	9blZxpQGQOwuA7gCMQNYTsFYo9+S0XHMBPLZPLZTGS8B25XDqX/CntONNpgaMjtv76knOOmNZS4A2
	3nG+PtmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0b37-0000000DaaR-3bRK;
	Thu, 12 Mar 2026 08:05:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0b31-0000000DaYG-1phb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 08:05:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A704560137;
	Thu, 12 Mar 2026 08:05:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE2A8C4AF09;
	Thu, 12 Mar 2026 08:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773302734;
	bh=9Cr+mReEZvMBuHZp4clR6ZSndmPb9mcsBiEseyuxWms=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oXVxVMQxCduNc2I91MGGi3RycxHfo5dMp1rAlFL4MvN7T7HdF7hSXTNbKVLoa34yc
	 ohaj5swzo08JD7nbS+V9GUo7fhlOJPbaQREt8oqAS4L/WJ1fDMXzHP0A8uBqlIT4X8
	 FKOM3mzWd3pazwKTW9aYRl2CDQAUDz3D6Yy0srtUOykQeBeVfXTOPRmqZhutCFxy4s
	 4DrZ/08ulfjsUlNYaTtM9eTezFGg7wV15bI+3DU++VxGzSYDPBTUbhy+84Lqgr5LpY
	 gzJSnEdj2NA+A1sqCmkacGjvGnC5lkUB4dEekb//dOAqukJ26dPTbBpdNr7BafA6+S
	 XlrKjwjzxlUlA==
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
Subject: [RFC PATCH v3 07/11] coco: guest: arm64: Add guest APIs to read host-cached DA objects
Date: Thu, 12 Mar 2026 13:34:38 +0530
Message-ID: <20260312080442.3485633-8-aneesh.kumar@kernel.org>
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

Introduce guest-side helpers to read host-cached DA objects
(certificate, VCA, interface report, and measurements).

Add RHI_DA_OBJECT_SIZE and RHI_DA_OBJECT_READ definitions, then implement
rhi_read_cached_object() that:
- queries object size from host
- validates size against MAX_CACHE_OBJ_SIZE
- allocates a shared buffer
- issues OBJECT_READ into shared memory
- copies data into private memory and frees shared pages

Export the helper for later evidence-collection and verification code.

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
 arch/arm64/include/asm/rhi.h             |  7 +++
 drivers/virt/coco/arm-cca-guest/rhi-da.c | 64 ++++++++++++++++++++++++
 drivers/virt/coco/arm-cca-guest/rhi-da.h |  1 +
 drivers/virt/coco/arm-cca-guest/rsi-da.h |  2 +
 4 files changed, 74 insertions(+)

diff --git a/arch/arm64/include/asm/rhi.h b/arch/arm64/include/asm/rhi.h
index d4759f410a17..8f9ea4a4bb7c 100644
--- a/arch/arm64/include/asm/rhi.h
+++ b/arch/arm64/include/asm/rhi.h
@@ -48,6 +48,13 @@ unsigned long rhi_get_ipa_change_alignment(void);
 				 RHI_DA_FEATURE_VDEV_SET_TDI_STATE)
 #define RHI_DA_FEATURES			SMC_RHI_CALL(0x004B)
 
+#define RHI_DA_OBJECT_CERTIFICATE		0x1
+#define RHI_DA_OBJECT_MEASUREMENT		0x2
+#define RHI_DA_OBJECT_INTERFACE_REPORT		0x3
+#define RHI_DA_OBJECT_VCA			0x4
+#define RHI_DA_OBJECT_SIZE		SMC_RHI_CALL(0x004C)
+#define RHI_DA_OBJECT_READ		SMC_RHI_CALL(0x004D)
+
 #define RHI_DA_VDEV_CONTINUE		SMC_RHI_CALL(0x0051)
 #define RHI_VDEV_MEASURE_HASH	0x0
 #define RHI_VDEV_MEASURE_RAW	0x1
diff --git a/drivers/virt/coco/arm-cca-guest/rhi-da.c b/drivers/virt/coco/arm-cca-guest/rhi-da.c
index 5130d4911f3a..c9b05fddccb9 100644
--- a/drivers/virt/coco/arm-cca-guest/rhi-da.c
+++ b/drivers/virt/coco/arm-cca-guest/rhi-da.c
@@ -3,6 +3,8 @@
  * Copyright (C) 2026 ARM Ltd.
  */
 
+#include <linux/string.h>
+
 #include "rsi-da.h"
 #include "rhi-da.h"
 
@@ -279,3 +281,65 @@ int rhi_update_vdev_measurements_cache(struct pci_dev *pdev, const u8 *nonce)
 	return ret;
 }
 
+int rhi_read_cached_object(int vdev_id, int da_object_type, void **object, int *object_size)
+{
+	int ret;
+	int max_data_len;
+	void *data_buf_shared;
+	struct page *shared_pages;
+
+	*object_size = 0;
+	*object = NULL;
+
+	struct rsi_host_call *rhicall __free(kfree) =
+		kmalloc(sizeof(struct rsi_host_call), GFP_KERNEL);
+	if (!rhicall)
+		return -ENOMEM;
+
+	rhicall->imm = 0;
+	rhicall->gprs[0] = RHI_DA_OBJECT_SIZE;
+	rhicall->gprs[1] = vdev_id;
+	rhicall->gprs[2] = da_object_type;
+
+	ret = rsi_host_call(rhicall);
+	if (ret != RSI_SUCCESS)
+		return -EIO;
+
+	if (rhicall->gprs[0] != RHI_DA_SUCCESS)
+		return -EIO;
+
+	/* validate against the max cache object size used on host. */
+	max_data_len = rhicall->gprs[1];
+	if (max_data_len > MAX_CACHE_OBJ_SIZE || max_data_len == 0)
+		return -EIO;
+
+	shared_pages = alloc_shared_pages(NUMA_NO_NODE, GFP_KERNEL, max_data_len);
+	if (!shared_pages)
+		return -ENOMEM;
+
+	data_buf_shared = page_address(shared_pages);
+
+	rhicall->imm = 0;
+	rhicall->gprs[0] = RHI_DA_OBJECT_READ;
+	rhicall->gprs[1] = vdev_id;
+	rhicall->gprs[2] = da_object_type;
+	rhicall->gprs[3] = virt_to_phys(data_buf_shared);
+	rhicall->gprs[4] = max_data_len;
+	rhicall->gprs[5] = 0; /* offset within the data buffer */
+	ret = rsi_host_call(rhicall);
+	if (ret != RSI_SUCCESS || rhicall->gprs[0] != RHI_DA_SUCCESS) {
+		free_shared_pages(shared_pages, max_data_len);
+		return -EIO;
+	}
+
+	void *data_buf_private = kvmemdup(data_buf_shared,
+					  max_data_len, GFP_KERNEL);
+	/* free the shared pages irrespective of error condition */
+	free_shared_pages(shared_pages, max_data_len);
+	if (!data_buf_private)
+		return -ENOMEM;
+
+	*object = data_buf_private;
+	*object_size = max_data_len;
+	return 0;
+}
diff --git a/drivers/virt/coco/arm-cca-guest/rhi-da.h b/drivers/virt/coco/arm-cca-guest/rhi-da.h
index d32ccc48c0d0..f7655d7ecf18 100644
--- a/drivers/virt/coco/arm-cca-guest/rhi-da.h
+++ b/drivers/virt/coco/arm-cca-guest/rhi-da.h
@@ -13,4 +13,5 @@ bool rhi_has_da_support(void);
 int rhi_vdev_set_tdi_state(struct pci_dev *pdev, enum rhi_tdi_state target_state);
 int rhi_update_vdev_interface_report_cache(struct pci_dev *pdev);
 int rhi_update_vdev_measurements_cache(struct pci_dev *pdev, const u8 *nonce);
+int rhi_read_cached_object(int vdev_id, int da_object_type, void **object, int *object_size);
 #endif
diff --git a/drivers/virt/coco/arm-cca-guest/rsi-da.h b/drivers/virt/coco/arm-cca-guest/rsi-da.h
index 2e3440f7c849..f28dc44b5cd2 100644
--- a/drivers/virt/coco/arm-cca-guest/rsi-da.h
+++ b/drivers/virt/coco/arm-cca-guest/rsi-da.h
@@ -10,6 +10,8 @@
 #include <linux/pci-tsm.h>
 #include <asm/rsi_smc.h>
 
+#define MAX_CACHE_OBJ_SIZE	SZ_16M
+
 struct cca_guest_dsc {
 	struct pci_tsm_devsec pci;
 };
-- 
2.43.0


