Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E895360A3809
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 16:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q8WaOEZ+;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lFIa5Cs6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LyppPZNwxzZCDS704wCfWMjkL1sHrZGQgJ+n1Lrwr9E=; b=q8WaOEZ+GNf4sh
	bUXo36mrWZvpylvw8DlmRdVp5V3HzPtkCWajkeocdBrrc+sVaFENQa/G0LKutBIZQiEMcWzV9ADDR
	E594IDTpDtUh7mL8ycGXB2r7osrSM9JCp1xVAhQ8gFuCazLdWN8qjTYtMFIsXzxG/RbzLs7yNIv2V
	b7rcR2IY3hEwiViox6zLYb1WH7QGhzx2kFnGISMPw+zYMifKkPmGHR5vKyDAHUIqJ06m8tBeSi0N7
	FYMC+rByGNmkvpFNiwXgGaM6yEF6F1miFe4ZwvIcD1iD1oHeQXN8l16ShkOIZ0WoeX0s+u6yWlmcR
	ENNuz4FL46tkpNLF5A+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdgj-00000005wAx-3ObI;
	Wed, 04 Nov 2026 16:18:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdgi-00000005w9h-0uqI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 16:18:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6E12860609;
	Wed,  4 Nov 2026 16:18:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20D7E1F000C1;
	Wed,  4 Nov 2026 16:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793809091;
	bh=LyppPZNwxzZCDS704wCfWMjkL1sHrZGQgJ+n1Lrwr9E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lFIa5Cs6PjeJrs6dRTVYe0S7/VMsiUwYUuy+NoOl9nl6KqLVaIG/kTfcumisaG2a6
	 W7ZW1yIwhFk8XJjaFeTv7LNCuSKa3HjAC7QKeTxug/sBmR3c8O4hv8FoK+GYn6/Wo2
	 mh4N85TefQPwKQj7N53rZcnSvTmjNr6+QL1fiLzFqhTu2R86d2WsARnhP+Y6LXNVk5
	 UoWII9n4AwUNaPcR07GOYX5zRi9XKiPw5Y+sQR7Ch4wKYtCxNZU/nYri//5CoxMEZA
	 RR845wfaDqMNNw5Shp3oJVvJxvIk/KM/xziqmpZAjuG7avR7WWnUpMFH0pCv3Gn5bt
	 2bkg1kGuKXTAA==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: iommu@lists.linux.dev
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Alex Williamson <alex@shazbot.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Joerg Roedel <joro@8bytes.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Lukas Wunner <lukas@wunner.de>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Steven Price <steven.price@arm.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Vasant Hegde <vasant.hegde@amd.com>,
	Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v8 08/15] iommufd: Add a vDEVICE operation ioctl framework
Date: Wed,  4 Nov 2026 21:46:25 +0530
Message-ID: <20261104161632.3547423-9-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104161632.3547423-1-aneesh.kumar@kernel.org>
References: <20261104161632.3547423-1-aneesh.kumar@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add IOMMU_VDEVICE_OP to execute operations on a vDEVICE using separate
request and response buffers. Each operation defines its request and
response formats, with response capacity checked before changing device
state.

Look up the vDEVICE and check its supported_ops mask before dispatching
an operation. Reject out-of-range operation numbers before testing the
corresponding bit. Backends set the mask during vdevice_init().

This patch defines no operations. The default dispatch returns
-EOPNOTSUPP; later patches can add operations independently.

Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Kevin Tian <kevin.tian@intel.com>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 drivers/iommu/iommufd/Makefile          |  1 +
 drivers/iommu/iommufd/iommufd_private.h |  1 +
 drivers/iommu/iommufd/main.c            |  3 +++
 drivers/iommu/iommufd/viommu.c          | 36 +++++++++++++++++++++++++
 include/linux/iommufd.h                 |  3 +++
 include/linux/tsm.h                     |  1 +
 include/uapi/linux/iommufd.h            | 33 +++++++++++++++++++++++
 7 files changed, 78 insertions(+)

diff --git a/drivers/iommu/iommufd/Makefile b/drivers/iommu/iommufd/Makefile
index 67207914bb6e..2b0ab70ab236 100644
--- a/drivers/iommu/iommufd/Makefile
+++ b/drivers/iommu/iommufd/Makefile
@@ -11,6 +11,7 @@ iommufd-y := \
 	viommu.o
 
 iommufd-$(CONFIG_IOMMUFD_NOIOMMU) += hwpt_noiommu.o
+
 iommufd-$(CONFIG_IOMMUFD_TEST) += selftest.o
 
 obj-$(CONFIG_IOMMUFD) += iommufd.o
diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
index 63a6dcee21dc..0b336d6430f1 100644
--- a/drivers/iommu/iommufd/iommufd_private.h
+++ b/drivers/iommu/iommufd/iommufd_private.h
@@ -730,6 +730,7 @@ void iommufd_vdevice_destroy(struct iommufd_object *obj);
 void iommufd_vdevice_abort(struct iommufd_object *obj);
 int iommufd_hw_queue_alloc_ioctl(struct iommufd_ucmd *ucmd);
 void iommufd_hw_queue_destroy(struct iommufd_object *obj);
+int iommufd_vdevice_op_ioctl(struct iommufd_ucmd *ucmd);
 
 #ifdef CONFIG_IOMMUFD_TEST
 int iommufd_test(struct iommufd_ucmd *ucmd);
diff --git a/drivers/iommu/iommufd/main.c b/drivers/iommu/iommufd/main.c
index 9a921b153162..e3a49897dac5 100644
--- a/drivers/iommu/iommufd/main.c
+++ b/drivers/iommu/iommufd/main.c
@@ -453,6 +453,7 @@ union ucmd_buffer {
 	struct iommu_veventq_alloc veventq;
 	struct iommu_vfio_ioas vfio_ioas;
 	struct iommu_viommu_alloc viommu;
+	struct iommu_vdevice_op vdevice_op;
 #ifdef CONFIG_IOMMUFD_TEST
 	struct iommu_test_cmd test;
 #endif
@@ -516,6 +517,8 @@ static const struct iommufd_ioctl_op iommufd_ioctl_ops[] = {
 		 __reserved),
 	IOCTL_OP(IOMMU_VIOMMU_ALLOC, iommufd_viommu_alloc_ioctl,
 		 struct iommu_viommu_alloc, out_viommu_id),
+	IOCTL_OP(IOMMU_VDEVICE_OP, iommufd_vdevice_op_ioctl,
+		 struct iommu_vdevice_op, resp_uptr),
 #ifdef CONFIG_IOMMUFD_TEST
 	IOCTL_OP(IOMMU_TEST_CMD, iommufd_test, struct iommu_test_cmd, last),
 #endif
diff --git a/drivers/iommu/iommufd/viommu.c b/drivers/iommu/iommufd/viommu.c
index 0dbd382eeb98..cdbb597f3588 100644
--- a/drivers/iommu/iommufd/viommu.c
+++ b/drivers/iommu/iommufd/viommu.c
@@ -1,7 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /* Copyright (c) 2024, NVIDIA CORPORATION & AFFILIATES
  */
+#include <linux/bits.h>
 #include <linux/file.h>
+#include <linux/cleanup.h>
+#include <linux/tsm.h>
+
 #include "iommufd_private.h"
 
 void iommufd_viommu_destroy(struct iommufd_object *obj)
@@ -121,6 +125,38 @@ int iommufd_viommu_alloc_ioctl(struct iommufd_ucmd *ucmd)
 	return rc;
 }
 
+int iommufd_vdevice_op_ioctl(struct iommufd_ucmd *ucmd)
+{
+	struct iommu_vdevice_op *cmd = ucmd->cmd;
+	struct iommufd_object *obj;
+	struct iommufd_vdevice *vdev;
+	int ret;
+
+	if (cmd->reserved)
+		return -EINVAL;
+
+	obj = iommufd_get_object(ucmd->ictx, cmd->vdevice_id,
+				 IOMMUFD_OBJ_VDEVICE);
+	if (IS_ERR(obj))
+		return PTR_ERR(obj);
+	vdev = container_of(obj, struct iommufd_vdevice, obj);
+
+	if (cmd->op >= BITS_PER_TYPE(vdev->supported_ops) ||
+	    !(vdev->supported_ops & BIT_ULL(cmd->op))) {
+		ret = -EOPNOTSUPP;
+		goto out_put_object;
+	}
+
+	switch (cmd->op) {
+	default:
+		ret = -EOPNOTSUPP;
+	}
+
+out_put_object:
+	iommufd_put_object(ucmd->ictx, obj);
+	return ret;
+}
+
 void iommufd_vdevice_abort(struct iommufd_object *obj)
 {
 	struct iommufd_vdevice *vdev =
diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
index c15d80f611b9..d1fd7888fc91 100644
--- a/include/linux/iommufd.h
+++ b/include/linux/iommufd.h
@@ -125,6 +125,9 @@ struct iommufd_vdevice {
 	 */
 	u64 virt_id;
 
+	/* Supported vDEVICE operations; set by vdevice_init(). */
+	u64 supported_ops;
+
 	/* Clean up all driver-specific parts of an iommufd_vdevice */
 	void (*destroy)(struct iommufd_vdevice *vdev);
 };
diff --git a/include/linux/tsm.h b/include/linux/tsm.h
index 381c53244c83..19dedf971f14 100644
--- a/include/linux/tsm.h
+++ b/include/linux/tsm.h
@@ -6,6 +6,7 @@
 #include <linux/types.h>
 #include <linux/uuid.h>
 #include <linux/device.h>
+#include <uapi/linux/iommufd.h>
 
 #define TSM_REPORT_INBLOB_MAX 64
 #define TSM_REPORT_OUTBLOB_MAX SZ_16M
diff --git a/include/uapi/linux/iommufd.h b/include/uapi/linux/iommufd.h
index 010f47f7d3d2..3f7422e7cd91 100644
--- a/include/uapi/linux/iommufd.h
+++ b/include/uapi/linux/iommufd.h
@@ -58,6 +58,7 @@ enum {
 	IOMMUFD_CMD_VEVENTQ_ALLOC = 0x93,
 	IOMMUFD_CMD_HW_QUEUE_ALLOC = 0x94,
 	IOMMUFD_CMD_IOAS_NOIOMMU_GET_PA = 0x95,
+	IOMMUFD_CMD_VDEVICE_OP = 0x96,
 };
 
 /**
@@ -1398,4 +1399,36 @@ struct iommu_hw_queue_alloc {
 	__aligned_u64 length;
 };
 #define IOMMU_HW_QUEUE_ALLOC _IO(IOMMUFD_TYPE, IOMMUFD_CMD_HW_QUEUE_ALLOC)
+
+/**
+ * struct iommu_vdevice_op - ioctl(IOMMU_VDEVICE_OP)
+ * @size: sizeof(struct iommu_vdevice_op)
+ * @vdevice_id: vDEVICE ID returned by IOMMU_VDEVICE_ALLOC
+ * @op: Operation number; no operations are currently defined
+ * @req_len: Size in bytes of the request at @req_uptr
+ * @resp_len: Response buffer capacity in bytes on input; bytes written on success
+ * @reserved: Must be zero
+ * @req_uptr: Userspace pointer to the operation-specific request
+ * @resp_uptr: Userspace pointer to the operation-specific response buffer
+ *
+ * Execute an operation on a vDEVICE. Each operation defines its request and
+ * response formats. Requests may be extended by appending fields; bytes beyond
+ * the kernel's supported request size must be zero. Response capacity must be
+ * checked before changing device state. The ioctl returns 0 on success or a
+ * negative error code.
+ *
+ * No operations are currently supported; the ioctl returns -EOPNOTSUPP.
+ */
+struct iommu_vdevice_op {
+	__u32 size;
+	__u32 vdevice_id;
+	__u32 op;
+	__u32 req_len;
+	__u32 resp_len;
+	__u32 reserved;
+	__aligned_u64 req_uptr;
+	__aligned_u64 resp_uptr;
+};
+
+#define IOMMU_VDEVICE_OP _IO(IOMMUFD_TYPE, IOMMUFD_CMD_VDEVICE_OP)
 #endif
-- 
2.43.0


