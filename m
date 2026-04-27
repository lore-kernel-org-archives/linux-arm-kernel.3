Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D5DFF8861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 08:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F/ucSin5/6hQL1+eVy9qO4IeOXlSfJxn/0vB+62e520=; b=1AcC1FTXSOtu+OOCxyiHbfjQc2
	vz6KYKfyQfxcXqbf/M2IlTnX07IeJ/P0f2MhKVEE7Qpw1DU8nd8aJ8WwchrujBZWUuKiwxFOVHKMq
	zLFbdPEzuNt0wmrFQ7qhOly2cytSRaY0NiyzqxbFxG6t9J6D88FCYQXR38A1KakJ+tmvsZd37J2zM
	RacMluSr8wflvRnvhTenf2Hvzv+0RQyTXaZuPO2Qr/0ZMTul0pdekB4Bi9TU/j1SyEFE7Bl/q2fvm
	0y7x+Qw5zrsuhEKIhPF3HgJiU1EI3KiGaKNmtwBYlxg9WD4S+Ay7ANuKLBqG/BgnuSJ2oCu3/7M50
	pha8OQjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHKn-0000000GScH-2StA;
	Mon, 27 Apr 2026 08:28:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHKl-0000000GSb8-0PF5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 08:28:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B8D9C417DB;
	Mon, 27 Apr 2026 08:28:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0599FC2BCB8;
	Mon, 27 Apr 2026 08:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777278530;
	bh=jNp9qsUFxSqnqXy8TKaLW9c3z208YtDH/OH/IkVAaus=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fFWMOqPwJi48SZarPWAHd4BJJEYN3M48EvZo/ZcW1uVch3BPU4TJTe7P4aXrMXsEa
	 B/GLlZ+TFaS6lQl4SjDQazt2Zj2yYaYDZccxBx7onPzj+9Bsnn3XB4o0RTbGNfKBPA
	 U53qyPu67sGXgYC9yzhY63cIAQcDgZRlwKXxbr+oRFQNsGfjjUQiXM0Dv9E736u8g+
	 3O0fYf98eVcVaHruaj1jQxbXNzA5N5vHymnwJ5urDXOBGbKBJReAp71jgUh0LrO3a8
	 xE+2Py6eLkY0t9J51OcqM53yGqnPAG0GeH5hRbvbfig0XdGU55wJtySce8KRQbwl2b
	 Kkp9oaP3k5q+w==
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
Subject: [RFC PATCH v4 07/11] coco: guest: arm64: Add guest APIs to read host-cached DA objects
Date: Mon, 27 Apr 2026 13:58:01 +0530
Message-ID: <20260427082805.931832-8-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427082805.931832-1-aneesh.kumar@kernel.org>
References: <20260427082805.931832-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_012851_685976_ACD6B36D 
X-CRM114-Status: GOOD (  15.86  )
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

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 arch/arm64/include/asm/rhi.h             |  8 +++
 drivers/virt/coco/arm-cca-guest/rhi-da.c | 71 ++++++++++++++++++++++++
 drivers/virt/coco/arm-cca-guest/rhi-da.h |  1 +
 drivers/virt/coco/arm-cca-guest/rsi-da.h |  2 +
 4 files changed, 82 insertions(+)

diff --git a/arch/arm64/include/asm/rhi.h b/arch/arm64/include/asm/rhi.h
index 2b56a7760904..dc7a57370945 100644
--- a/arch/arm64/include/asm/rhi.h
+++ b/arch/arm64/include/asm/rhi.h
@@ -48,6 +48,14 @@ unsigned long rhi_get_ipa_change_alignment(void);
 				 RHI_DA_FEATURE_VDEV_SET_TDI_STATE)
 #define RHI_DA_FEATURES			SMC_RHI_CALL(0x004B)
 
+#define RHI_DA_OBJECT_VCA			0x0
+#define RHI_DA_OBJECT_CERTIFICATE		0x1
+#define RHI_DA_OBJECT_MEASUREMENT		0x2
+#define RHI_DA_OBJECT_INTERFACE_REPORT		0x3
+#define RHI_DA_OBJECT_EXTENSION_EVIDENCE	0x4
+#define RHI_DA_OBJECT_SIZE		SMC_RHI_CALL(0x004C)
+#define RHI_DA_OBJECT_READ		SMC_RHI_CALL(0x004D)
+
 #define RHI_DA_VDEV_CONTINUE		SMC_RHI_CALL(0x0051)
 
 #define RHI_VDEV_MEASURE_HASH	0x0
diff --git a/drivers/virt/coco/arm-cca-guest/rhi-da.c b/drivers/virt/coco/arm-cca-guest/rhi-da.c
index d0f5ae320f83..73c599802a93 100644
--- a/drivers/virt/coco/arm-cca-guest/rhi-da.c
+++ b/drivers/virt/coco/arm-cca-guest/rhi-da.c
@@ -3,6 +3,8 @@
  * Copyright (C) 2026 ARM Ltd.
  */
 
+#include <linux/string.h>
+
 #include "rsi-da.h"
 #include "rhi-da.h"
 
@@ -283,3 +285,72 @@ int rhi_update_vdev_measurements_cache(struct pci_dev *pdev, const u8 *nonce)
 		pci_err(pdev, "failed to get device measurement (%d)\n", ret);
 	return ret;
 }
+
+int rhi_read_cached_object(int vdev_id, int da_object_type, void **object, int *object_size)
+{
+	int ret;
+	int data_size;
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
+	data_size = rhicall->gprs[1];
+	if (data_size > MAX_CACHE_OBJ_SIZE || data_size == 0)
+		return -EIO;
+
+	shared_pages = alloc_shared_pages(NUMA_NO_NODE, GFP_KERNEL, data_size);
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
+	rhicall->gprs[4] = data_size;
+	rhicall->gprs[5] = 0; /* offset to read from */
+	ret = rsi_host_call(rhicall);
+	if (ret != RSI_SUCCESS || rhicall->gprs[0] != RHI_DA_SUCCESS) {
+		free_shared_pages(shared_pages, data_size);
+		return -EIO;
+	}
+
+	if (data_size != rhicall->gprs[1]) {
+		/* Short read */
+		free_shared_pages(shared_pages, data_size);
+		return -EIO;
+	}
+
+	void *data_buf_private = kvmemdup(data_buf_shared,
+					  data_size, GFP_KERNEL);
+	/* free the shared pages irrespective of error condition */
+	free_shared_pages(shared_pages, data_size);
+	if (!data_buf_private)
+		return -ENOMEM;
+
+	*object = data_buf_private;
+	*object_size = data_size;
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
index 297cb800edc0..88067d2230ab 100644
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


