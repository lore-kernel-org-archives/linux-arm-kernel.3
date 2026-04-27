Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3434FF8861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 08:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JD3aB2fSkBp0yYWaau8EIRlpmOc3Z2RtcZjPf+utyjk=; b=EDchdconS6ke20uJkXfEBUmnrx
	P8Cnud+tGFw76xWQMyBV1hRUPNSP2YwrZfD1o5oPhzd3+wLvYpHEjPGnr4+5f+MWQc44zY7h34LiL
	mrpFMj6Y454ncEOcpuQOF/yGq6zVZiLItnzQCdJeQQ9hUQ0cRJCjyYLUWIGs6eut5pc68v0wLWaXl
	p302XMOHsprSzeo9UGwfEgakE0mgT8NqmWvya0n6j54nWbMFLmr1/Gls7kbrFAFkgQ0noex2dPciy
	8Sm4cbbVyBKiWbUmZ+0DDkYn+zc372Q5/e1XfKmDngSLjlL5chAlde16oCl/HrM8eRjjUfPS39yfS
	bjM5TWkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHk2-0000000GVIu-3vMX;
	Mon, 27 Apr 2026 08:54:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHjx-0000000GVEg-3UD8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 08:54:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7160943ECE;
	Mon, 27 Apr 2026 08:54:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3517C2BCB4;
	Mon, 27 Apr 2026 08:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777280093;
	bh=akRHKPpwP0Keb8Cw+nrNL5vDKueX0ZffUjJeuchV62o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dwsVc26Yxm+WwPUISGblrpOpc8ZD3m+PtODyezcu55Wv3ajEF/+uiDCjdsjBE/alT
	 jCYZSOtJryXS9h2S2+qAY+AGysn9K4u+Ba3JKk5ZO37OivumnXDWIGjnmJaCAC47aH
	 eXsyDAgAfv1Ps4jMf8adIE1pRiQllX8MZ83L7kTSBbZ5NlAzv6BlFihXWd3/dqE8tn
	 bnGI1r6GDsMAtRIhvtT3yDT1NHn53zjKEmShbMBqrYZqeAVUYgRs/eIpEc7eIJV2mG
	 a1sArosFbsKWO1ypUsfvbDfD1UpYazjf7LnBBZpL4MUaj1n9vdEAlb3nnI/7pa9Lox
	 tn1HVLt2hML7A==
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
Subject: [RFC PATCH v4 09/16] coco: host: arm64: Add support for da object read RHI handling
Date: Mon, 27 Apr 2026 14:23:37 +0530
Message-ID: <20260427085344.941627-10-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427085344.941627-1-aneesh.kumar@kernel.org>
References: <20260427085344.941627-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_015453_957250_F3458D80 
X-CRM114-Status: GOOD (  22.33  )
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

Device assignment-related RHI calls result in a REC exit, which is
handled by the tsm guest_request callback.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 arch/arm64/include/uapi/asm/rmi-da.h     | 21 ++++++
 drivers/virt/coco/arm-cca-host/arm-cca.c | 74 ++++++++++++++++++
 drivers/virt/coco/arm-cca-host/rmi-da.c  | 95 ++++++++++++++++++++++++
 drivers/virt/coco/arm-cca-host/rmi-da.h  |  3 +
 4 files changed, 193 insertions(+)
 create mode 100644 arch/arm64/include/uapi/asm/rmi-da.h

diff --git a/arch/arm64/include/uapi/asm/rmi-da.h b/arch/arm64/include/uapi/asm/rmi-da.h
new file mode 100644
index 000000000000..5ec3413dce94
--- /dev/null
+++ b/arch/arm64/include/uapi/asm/rmi-da.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+
+#ifndef _UAPI__ASM_RMI_DA_H
+#define _UAPI__ASM_RMI_DA_H
+
+#include <linux/types.h>
+
+struct arm64_vdev_object_size_guest_req {
+	__u32 req_type;
+	__u32 object_type;
+};
+#define __RHI_DA_OBJECT_SIZE		0x1
+
+struct arm64_vdev_object_read_guest_req {
+	__u32 req_type;
+	__u32 object_type;
+	__aligned_u64 offset;
+};
+#define __RHI_DA_OBJECT_READ		0x2
+
+#endif
diff --git a/drivers/virt/coco/arm-cca-host/arm-cca.c b/drivers/virt/coco/arm-cca-host/arm-cca.c
index b75fa20513a9..4bf1f1b394af 100644
--- a/drivers/virt/coco/arm-cca-host/arm-cca.c
+++ b/drivers/virt/coco/arm-cca-host/arm-cca.c
@@ -14,6 +14,7 @@
 #include <linux/pci-doe.h>
 #include <linux/pci.h>
 #include <linux/kvm_host.h>
+#include <asm/rmi-da.h>
 
 #include "rmi-da.h"
 
@@ -497,6 +498,78 @@ static void cca_tsm_unbind(struct pci_tdi *tdi)
 	kfree(host_tdi);
 }
 
+static ssize_t cca_tsm_guest_req(struct pci_tdi *tdi, enum pci_tsm_req_scope scope,
+		sockptr_t req, size_t req_len, sockptr_t resp,
+		size_t resp_len, u64 *tsm_code)
+{
+	struct pci_dev *pdev = tdi->pdev;
+
+	if (req.is_kernel || resp.is_kernel)
+		return -EINVAL;
+
+	switch (scope) {
+	case PCI_TSM_REQ_INFO: {
+		u32 req_type;
+
+		if (get_user(req_type, (u32 __user *)req.user))
+			return -EFAULT;
+
+		switch (req_type) {
+		case __RHI_DA_OBJECT_SIZE: {
+			int object_size;
+			struct arm64_vdev_object_size_guest_req req_obj;
+
+			if (req_len != sizeof(req_obj))
+				return -EINVAL;
+
+			if (copy_from_user((void *)&req_obj, req.user, req_len))
+				return -EFAULT;
+			object_size = cca_vdev_get_object_size(pdev, req_obj.object_type);
+			if (object_size > 0) {
+				if (resp_len < sizeof(object_size))
+					return -EINVAL;
+				if (copy_to_user(resp.user, &object_size, sizeof(object_size)))
+					return -EFAULT;
+
+				if (resp_len != sizeof(object_size))
+					return resp_len - sizeof(object_size);
+				return 0;
+			}
+			/* error */
+			return object_size;
+		}
+		case __RHI_DA_OBJECT_READ:
+		{
+			int len;
+			struct arm64_vdev_object_read_guest_req req_obj;
+
+			if (req_len != sizeof(req_obj))
+				return -EINVAL;
+
+			if (copy_from_user((void *)&req_obj, req.user, req_len))
+				return -EFAULT;
+
+			len = cca_vdev_read_cached_object(pdev,
+							  req_obj.object_type,
+							  req_obj.offset,
+							  resp_len, resp.user);
+			if (len > 0) {
+				if (resp_len != len)
+					return resp_len - len;
+				return 0;
+			}
+			/* error */
+			return len;
+		}
+		default:
+			return -EINVAL;
+		}
+	}
+	default:
+		return -EINVAL;
+	}
+}
+
 static struct pci_tsm_ops cca_link_pci_ops = {
 	.probe = cca_tsm_pci_probe,
 	.remove = cca_tsm_pci_remove,
@@ -504,6 +577,7 @@ static struct pci_tsm_ops cca_link_pci_ops = {
 	.disconnect = cca_tsm_disconnect,
 	.bind = cca_tsm_bind,
 	.unbind = cca_tsm_unbind,
+	.guest_req = cca_tsm_guest_req,
 };
 
 static void cca_link_tsm_remove(void *tsm_dev)
diff --git a/drivers/virt/coco/arm-cca-host/rmi-da.c b/drivers/virt/coco/arm-cca-host/rmi-da.c
index ef25392562e0..3db42c21dab0 100644
--- a/drivers/virt/coco/arm-cca-host/rmi-da.c
+++ b/drivers/virt/coco/arm-cca-host/rmi-da.c
@@ -12,6 +12,7 @@
 #include <keys/asymmetric-type.h>
 #include <keys/x509-parser.h>
 #include <linux/kvm_types.h>
+#include <linux/kvm_host.h>
 #include <asm/kvm_rmi.h>
 
 #include "rmi-da.h"
@@ -1136,3 +1137,97 @@ void cca_vdev_unlock_and_destroy(struct realm *realm,
 	host_tdi->rmm_vdev = NULL;
 	host_tdi->realm = NULL;
 }
+
+int cca_vdev_get_object_size(struct pci_dev *pdev, int type)
+{
+	long len;
+	struct cca_host_tdi *host_tdi;
+	struct cca_host_pf0_ep_dsc *pf0_ep_dsc;
+	struct pci_tsm *tsm = pdev->tsm;
+	struct cca_host_pdev_dsc *pdev_dsc;
+
+	if (!tsm)
+		return -EINVAL;
+
+	pdev_dsc = to_cca_pdev_dsc(tsm->dsm_dev);
+	pf0_ep_dsc = to_cca_pf0_ep_dsc(tsm->dsm_dev);
+	host_tdi = to_cca_host_tdi(pdev);
+
+	guard(mutex)(&pdev_dsc->object_lock);
+	/* Determine the buffer that should be used */
+	if (type == RHI_DA_OBJECT_INTERFACE_REPORT) {
+		if (!host_tdi->interface_report)
+			return -EINVAL;
+		len = host_tdi->interface_report->offset;
+	} else if (type == RHI_DA_OBJECT_MEASUREMENT) {
+		if (!host_tdi->measurements)
+			return -EINVAL;
+		len = host_tdi->measurements->offset;
+	} else if (type == RHI_DA_OBJECT_CERTIFICATE) {
+		if (!pf0_ep_dsc->cert_chain.cache)
+			return -EINVAL;
+		len = pf0_ep_dsc->cert_chain.cache->offset;
+	} else if (type == RHI_DA_OBJECT_VCA) {
+		if (!pf0_ep_dsc->vca)
+			return -EINVAL;
+		len = pf0_ep_dsc->vca->offset;
+	} else {
+		return -EINVAL;
+	}
+
+	return len;
+}
+
+int cca_vdev_read_cached_object(struct pci_dev *pdev, int type,
+		unsigned long offset, unsigned long max_len,
+		void __user *user_buf)
+{
+	void *buf;
+	unsigned long len;
+	struct cca_host_tdi *host_tdi;
+	struct cca_host_pf0_ep_dsc *pf0_ep_dsc;
+	struct pci_tsm *tsm = pdev->tsm;
+	struct cca_host_pdev_dsc *pdev_dsc;
+
+	if (!tsm)
+		return -EINVAL;
+
+	pdev_dsc = to_cca_pdev_dsc(tsm->dsm_dev);
+	pf0_ep_dsc = to_cca_pf0_ep_dsc(tsm->dsm_dev);
+	host_tdi = to_cca_host_tdi(pdev);
+
+	guard(mutex)(&pdev_dsc->object_lock);
+	/* Determine the buffer that should be used */
+	if (type == RHI_DA_OBJECT_INTERFACE_REPORT) {
+		if (!host_tdi->interface_report)
+			return -EINVAL;
+		len = host_tdi->interface_report->offset;
+		buf = host_tdi->interface_report->buf;
+	} else if (type == RHI_DA_OBJECT_MEASUREMENT) {
+		if (!host_tdi->measurements)
+			return -EINVAL;
+		len = host_tdi->measurements->offset;
+		buf = host_tdi->measurements->buf;
+	} else if (type == RHI_DA_OBJECT_CERTIFICATE) {
+		if (!pf0_ep_dsc->cert_chain.cache)
+			return -EINVAL;
+		len = pf0_ep_dsc->cert_chain.cache->offset;
+		buf = pf0_ep_dsc->cert_chain.cache->buf;
+	} else if (type == RHI_DA_OBJECT_VCA) {
+		if (!pf0_ep_dsc->vca)
+			return -EINVAL;
+		len = pf0_ep_dsc->vca->offset;
+		buf = pf0_ep_dsc->vca->buf;
+	} else {
+		return -EINVAL;
+	}
+
+	/* Assume that the buffer is large enough for the whole report */
+	if (max_len < len)
+		return -E2BIG;
+
+	if (copy_to_user(user_buf, buf + offset, len))
+		return -EIO;
+
+	return len;
+}
diff --git a/drivers/virt/coco/arm-cca-host/rmi-da.h b/drivers/virt/coco/arm-cca-host/rmi-da.h
index 97f7eaf1f779..4f1a61a5dcfa 100644
--- a/drivers/virt/coco/arm-cca-host/rmi-da.h
+++ b/drivers/virt/coco/arm-cca-host/rmi-da.h
@@ -242,5 +242,8 @@ int cca_pdev_purge_stream_key(struct pci_dev *pdev1,
 		struct pci_dev *pdev2, unsigned long stream_handle);
 void cca_vdev_unlock_and_destroy(struct realm *realm, struct pci_dev *pdev,
 		struct pci_dev *pf0_dev);
+int cca_vdev_get_object_size(struct pci_dev *pdev, int type);
+int cca_vdev_read_cached_object(struct pci_dev *pdev, int type, unsigned long offset,
+		unsigned long max_len, void __user *user_buf);
 
 #endif
-- 
2.43.0


