Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBBB60A3838
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 16:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4PUX+CHf;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jv5SHSQJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=v4eLBTIE0PrwMKmYvfQ7OJz6gyrp/0lltf8Tb/jDjzM=; b=4PUX+CHfVgYvQi
	3gR7gE/pvyIzdQE13YBMC+CR/cRMo1fs3EY/xPaNH9LFfPlBV0AW5O2gPOfROGw4aK+SSWOOqXz0u
	NESxCCMN1s8KqQUNle0HW7dlNEcRXSxSJswSIRc0n7xHgjKyX9DL4z6mEKU1JnILN6xRnKu/9TzhT
	07GHlatq9JzeZktNeY46JTm9/l++Ze8oaqlpe4oF6mg+M8zVnaVqFGupuyLA+qYaCjn6irSUJ7hai
	n9thyN1g9SzKfB0xIPSx7TBb6QRbfBviA/qTk+esJtv/94ZOAw89A1vmFpEsmptCNrL2z6yIJowoO
	xyD7W889FdB0pZIDfw/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdgs-00000005wFo-3vui;
	Wed, 04 Nov 2026 16:18:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdgr-00000005wF2-3dy6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 16:18:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 527AB60A06;
	Wed,  4 Nov 2026 16:18:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6BB51F00A23;
	Wed,  4 Nov 2026 16:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793809101;
	bh=v4eLBTIE0PrwMKmYvfQ7OJz6gyrp/0lltf8Tb/jDjzM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jv5SHSQJgij06SsT4UlYod/ZruZyBGPEjDlNluT1/qzYmqIPtjkm2fDRR34XmDZn6
	 pD1LtAuNH460X4qZWO3sySzb4NwXRh+vJIKE3aPtvmryjPTE1e3VjJv4Ca3VeX4+9r
	 DVX+rUZNG0nF1pYxPfWgbHPTjXNNUU0weLFJrFhl6akpEzuWcLdOHTX8BS29WahUX/
	 hZ0+YVZFKDqCXJH6U17HETEkqwzkpPCSpg1MIj7fqUSs2uu2p4nGz3sga4aTC33qUe
	 UB2xVJXCl/iGfqHQsaedxDzpjK/8s6pa0zVGWKwX/yXsGuVliqVpqTmtvcHKr2X1c0
	 5mm7bUsetBbyA==
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
	linux-tegra@vger.kernel.org,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v8 09/15] PCI/TSM: Remove the legacy guest request interface
Date: Wed,  4 Nov 2026 21:46:26 +0530
Message-ID: <20261104161632.3547423-10-aneesh.kumar@kernel.org>
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

Guest TSM requests can now be dispatched through the IOMMUFD
IOMMU_VDEVICE_OP ioctl. Remove the PCI-device-based guest request entry
point, its scope enum and the corresponding PCI/TSM driver callback.


Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 drivers/pci/tsm/core.c  | 60 ----------------------------------------
 include/linux/pci-tsm.h | 61 +----------------------------------------
 2 files changed, 1 insertion(+), 120 deletions(-)

diff --git a/drivers/pci/tsm/core.c b/drivers/pci/tsm/core.c
index 76ef03a1b3ec..24d4dd4f1b96 100644
--- a/drivers/pci/tsm/core.c
+++ b/drivers/pci/tsm/core.c
@@ -375,66 +375,6 @@ int pci_tsm_bind(struct pci_dev *pdev, struct kvm *kvm, u32 tdi_id)
 }
 EXPORT_SYMBOL_GPL(pci_tsm_bind);
 
-/**
- * pci_tsm_guest_req() - helper to marshal guest requests to the TSM driver
- * @pdev: @pdev representing a bound tdi
- * @scope: caller asserts this passthrough request is limited to TDISP operations
- * @req_in: Input payload forwarded from the guest
- * @in_len: Length of @req_in
- * @req_out: Output payload buffer response to the guest
- * @out_len: Length of @req_out on input, bytes filled in @req_out on output
- * @tsm_code: Optional TSM arch specific result code for the guest TSM
- *
- * This is a common entry point for requests triggered by userspace KVM-exit
- * service handlers responding to TDI information or state change requests. The
- * scope parameter limits requests to TDISP state management, or limited debug.
- * This path is only suitable for commands and results that are the host kernel
- * has no use, the host is only facilitating guest to TSM communication.
- *
- * Returns 0 on success and -error on failure and positive "residue" on success
- * but @req_out is filled with less then @out_len, or @req_out is NULL and a
- * residue number of bytes were not consumed from @req_in.  On success or
- * failure @tsm_code may be populated with a TSM implementation specific result
- * code for the guest to consume.
- *
- * Context: Caller is responsible for calling this within the pci_tsm_bind()
- * state of the TDI.
- */
-ssize_t pci_tsm_guest_req(struct pci_dev *pdev, enum pci_tsm_req_scope scope,
-			  sockptr_t req_in, size_t in_len, sockptr_t req_out,
-			  size_t out_len, u64 *tsm_code)
-{
-	struct pci_tsm_pf0 *tsm_pf0;
-	struct pci_tdi *tdi;
-	int rc;
-
-	/* Forbid requests that are not directly related to TDISP operations */
-	if (scope > PCI_TSM_REQ_STATE_CHANGE)
-		return -EINVAL;
-
-	ACQUIRE(rwsem_read_intr, lock)(&pci_tsm_rwsem);
-	if ((rc = ACQUIRE_ERR(rwsem_read_intr, &lock)))
-		return rc;
-
-	if (!pdev->tsm)
-		return -ENXIO;
-
-	if (!is_link_tsm(pdev->tsm->tsm_dev))
-		return -ENXIO;
-
-	tsm_pf0 = to_pci_tsm_pf0(pdev->tsm);
-	ACQUIRE(mutex_intr, ops_lock)(&tsm_pf0->lock);
-	if ((rc = ACQUIRE_ERR(mutex_intr, &ops_lock)))
-		return rc;
-
-	tdi = pdev->tsm->tdi;
-	if (!tdi)
-		return -ENXIO;
-	return to_pci_tsm_ops(pdev->tsm)->guest_req(tdi, scope, req_in, in_len,
-						    req_out, out_len, tsm_code);
-}
-EXPORT_SYMBOL_GPL(pci_tsm_guest_req);
-
 static void pci_tsm_unbind_all(struct pci_dev *pdev)
 {
 	pci_tsm_walk_fns_reverse(pdev, __pci_tsm_unbind, NULL);
diff --git a/include/linux/pci-tsm.h b/include/linux/pci-tsm.h
index a6435aba03f9..6fe3d0ea875f 100644
--- a/include/linux/pci-tsm.h
+++ b/include/linux/pci-tsm.h
@@ -3,12 +3,10 @@
 #define __PCI_TSM_H
 #include <linux/mutex.h>
 #include <linux/pci.h>
-#include <linux/sockptr.h>
 
 struct pci_tsm;
 struct tsm_dev;
 struct kvm;
-enum pci_tsm_req_scope;
 
 /*
  * struct pci_tsm_ops - manage confidential links and security state
@@ -34,14 +32,13 @@ struct pci_tsm_ops {
 	 * @disconnect: teardown the secure link
 	 * @bind: bind a TDI in preparation for it to be accepted by a TVM
 	 * @unbind: remove a TDI from secure operation with a TVM
-	 * @guest_req: marshal TVM information and state change requests
 	 *
 	 * Context: @probe, @remove, @connect, and @disconnect run under
 	 * pci_tsm_rwsem held for write to sync with TSM unregistration and
 	 * mutual exclusion of @connect and @disconnect. @connect and
 	 * @disconnect additionally run under the DSM lock (struct
 	 * pci_tsm_pf0::lock) as well as @probe and @remove of the subfunctions.
-	 * @bind, @unbind, and @guest_req run under pci_tsm_rwsem held for read
+	 * @bind and @unbind run under pci_tsm_rwsem held for read
 	 * and the DSM lock.
 	 */
 	struct_group_tagged(pci_tsm_link_ops, link_ops,
@@ -53,11 +50,6 @@ struct pci_tsm_ops {
 		struct pci_tdi *(*bind)(struct pci_dev *pdev,
 					struct kvm *kvm, u32 tdi_id);
 		void (*unbind)(struct pci_tdi *tdi);
-		ssize_t (*guest_req)(struct pci_tdi *tdi,
-				     enum pci_tsm_req_scope scope,
-				     sockptr_t req_in, size_t in_len,
-				     sockptr_t req_out, size_t out_len,
-				     u64 *tsm_code);
 	);
 
 	/*
@@ -159,46 +151,6 @@ static inline bool is_pci_tsm_pf0(struct pci_dev *pdev)
 	return PCI_FUNC(pdev->devfn) == 0;
 }
 
-/**
- * enum pci_tsm_req_scope - Scope of guest requests to be validated by TSM
- *
- * Guest requests are a transport for a TVM to communicate with a TSM + DSM for
- * a given TDI. A TSM driver is responsible for maintaining the kernel security
- * model and limit commands that may affect the host, or are otherwise outside
- * the typical TDISP operational model.
- */
-enum pci_tsm_req_scope {
-	/**
-	 * @PCI_TSM_REQ_INFO: Read-only, without side effects, request for
-	 * typical TDISP collateral information like Device Interface Reports.
-	 * No device secrets are permitted, and no device state is changed.
-	 */
-	PCI_TSM_REQ_INFO = 0,
-	/**
-	 * @PCI_TSM_REQ_STATE_CHANGE: Request to change the TDISP state from
-	 * UNLOCKED->LOCKED, LOCKED->RUN, or other architecture specific state
-	 * changes to support those transitions for a TDI. No other (unrelated
-	 * to TDISP) device / host state, configuration, or data change is
-	 * permitted.
-	 */
-	PCI_TSM_REQ_STATE_CHANGE = 1,
-	/**
-	 * @PCI_TSM_REQ_DEBUG_READ: Read-only request for debug information
-	 *
-	 * A method to facilitate TVM information retrieval outside of typical
-	 * TDISP operational requirements. No device secrets are permitted.
-	 */
-	PCI_TSM_REQ_DEBUG_READ = 2,
-	/**
-	 * @PCI_TSM_REQ_DEBUG_WRITE: Device state changes for debug purposes
-	 *
-	 * The request may affect the operational state of the device outside of
-	 * the TDISP operational model. If allowed, requires CAP_SYS_RAW_IO, and
-	 * will taint the kernel.
-	 */
-	PCI_TSM_REQ_DEBUG_WRITE = 3,
-};
-
 #ifdef CONFIG_PCI_TSM
 int pci_tsm_register(struct tsm_dev *tsm_dev);
 void pci_tsm_unregister(struct tsm_dev *tsm_dev);
@@ -213,9 +165,6 @@ int pci_tsm_bind(struct pci_dev *pdev, struct kvm *kvm, u32 tdi_id);
 void pci_tsm_unbind(struct pci_dev *pdev);
 void pci_tsm_tdi_constructor(struct pci_dev *pdev, struct pci_tdi *tdi,
 			     struct kvm *kvm, u32 tdi_id);
-ssize_t pci_tsm_guest_req(struct pci_dev *pdev, enum pci_tsm_req_scope scope,
-			  sockptr_t req_in, size_t in_len, sockptr_t req_out,
-			  size_t out_len, u64 *tsm_code);
 #else
 static inline int pci_tsm_register(struct tsm_dev *tsm_dev)
 {
@@ -231,13 +180,5 @@ static inline int pci_tsm_bind(struct pci_dev *pdev, struct kvm *kvm, u64 tdi_id
 static inline void pci_tsm_unbind(struct pci_dev *pdev)
 {
 }
-static inline ssize_t pci_tsm_guest_req(struct pci_dev *pdev,
-					enum pci_tsm_req_scope scope,
-					sockptr_t req_in, size_t in_len,
-					sockptr_t req_out, size_t out_len,
-					u64 *tsm_code)
-{
-	return -ENXIO;
-}
 #endif
 #endif /*__PCI_TSM_H */
-- 
2.43.0


