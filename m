Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC998FF8865
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 06:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S31DLFl9voZ/kk20I8XZsErTLXMABHt6IJwJVmMufmo=; b=VyTuryhQO/ugE0apTCHcgbykOi
	BFxdff9naHQWJDE7ocFAtFBaWPgqT2/tRyEHArgumUalANTjZyfnijpzXoI0Hy5aGYfo9lEK8qqa6
	L904JbaT1xWssIZLHfqGBQda+2ZfcR8JaejD6Bo4PWyBMu+HuBBFx0Oy+dmhxHrzmfDRCYc0Ptcvb
	6z/vr9YKjRlyMHumGflUD7L+bQ6VodNp+30pFebNIblmX1IxK7DA5PnV99pqDVMFo9SgMq4fhDFrM
	DqBoAOwgS6lYHl6YZFY50X3v7+iaqwFT3KesNnLO3LAcMOlyO+Z/P6mUhoa8Xcv/7Cq2YtTfX/ONV
	PmrIKfmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHFpx-0000000GItX-3hH9;
	Mon, 27 Apr 2026 06:52:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHFpo-0000000GIj7-1lau
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 06:52:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E19E443A5D;
	Mon, 27 Apr 2026 06:52:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05037C2BCC4;
	Mon, 27 Apr 2026 06:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777272767;
	bh=437kH86jrTn4c1Epnw3resuWckEvIYjsHBmw7fIP+EI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VsTz+yqzRX5JWFXZZf9VJOF0bKQiZOVuDoPji4g1OmLkdzebLsB7i4cbYXSfeRtx5
	 OvMcZDNbo6zJY/e2lIT01+Bq+26mBgFksiGi8UW5EOedPKDFI91fFD7iaz4icdS5+G
	 ZpcA79VuLeFLsJ38vg5yj29PUrrMYXmVYk8dQUqDt4UwvojIoCZT7Q+6pDc6w7n6wz
	 v4STTOPn8lwri6ZSGF3vcDKCEaEYx2hg2GSCjn79CvQR7ueHMn9Ho7H86liZ0QGP9D
	 aqz/pQ5iYC7EngUQpuaUrOpKeS7Wt417IWVlBkqqJATaz1pd0FTczxlP79EkIgqfZ2
	 Uf6XsOqxcIqXg==
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
Subject: [RFC PATCH v4 13/14] PCI/TSM: Move CMA DOE mailbox discovery out of pci_tsm_pf0_constructor()
Date: Mon, 27 Apr 2026 12:21:20 +0530
Message-ID: <20260427065121.916615-14-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427065121.916615-1-aneesh.kumar@kernel.org>
References: <20260427065121.916615-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_235249_398675_58745034 
X-CRM114-Status: GOOD (  15.76  )
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

pci_tsm_pf0_constructor() currently looks up a CMA DOE mailbox and
fails PF0 initialization when one is not present. That is too strict
for all link TSM drivers.

Move CMA DOE mailbox discovery into the low-level PF0 probe callbacks
so each driver can decide whether a mailbox is mandatory.

Keep SEV-TIO and TDX requiring a CMA mailbox, while allowing the
arm-cca host path to proceed on PF0 devices that do not support IDE
and therefore have no DOE-based SPDM path.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 drivers/crypto/ccp/sev-dev-tsm.c         | 13 +++++++++++++
 drivers/pci/tsm/core.c                   | 14 ++++++++------
 drivers/virt/coco/arm-cca-host/arm-cca.c | 16 +++++++++++++---
 drivers/virt/coco/tdx-host/tdx-host.c    | 13 +++++++++++++
 4 files changed, 47 insertions(+), 9 deletions(-)

diff --git a/drivers/crypto/ccp/sev-dev-tsm.c b/drivers/crypto/ccp/sev-dev-tsm.c
index b07ae529b591..a7506cbbe392 100644
--- a/drivers/crypto/ccp/sev-dev-tsm.c
+++ b/drivers/crypto/ccp/sev-dev-tsm.c
@@ -217,6 +217,19 @@ static struct pci_tsm *tio_pf0_probe(struct pci_dev *pdev, struct sev_device *se
 	if (rc)
 		return NULL;
 
+	/* if device have ide cap, setup doe mailbox */
+	if (pdev->ide_cap) {
+		struct pci_doe_mb *doe_mb;
+
+		doe_mb = pci_find_doe_mailbox(pdev, PCI_VENDOR_ID_PCI_SIG,
+					      PCI_DOE_FEATURE_CMA);
+		if (!doe_mb)
+			return NULL;
+		dsm->tsm.doe_mb = doe_mb;
+	} else {
+		return NULL;
+	}
+
 	pci_dbg(pdev, "TSM enabled\n");
 	dsm->sev = sev;
 	return &no_free_ptr(dsm)->tsm.base_tsm;
diff --git a/drivers/pci/tsm/core.c b/drivers/pci/tsm/core.c
index bb440135b8f7..900306a43161 100644
--- a/drivers/pci/tsm/core.c
+++ b/drivers/pci/tsm/core.c
@@ -1236,12 +1236,14 @@ int pci_tsm_pf0_constructor(struct pci_dev *pdev, struct pci_tsm_pf0 *tsm,
 			    struct tsm_dev *tsm_dev)
 {
 	mutex_init(&tsm->lock);
-	tsm->doe_mb = pci_find_doe_mailbox(pdev, PCI_VENDOR_ID_PCI_SIG,
-					   PCI_DOE_FEATURE_CMA);
-	if (!tsm->doe_mb) {
-		pci_warn(pdev, "TSM init failure, no CMA mailbox\n");
-		return -ENODEV;
-	}
+
+	/*
+	 * Note, low-level TSM driver responsible for determining if it wants to
+	 * proceed with a device that has no DOE mailbox. TSM may have an
+	 * alternate method for coordinating TDISP.
+	 */
+	if (!tsm->doe_mb)
+		pci_dbg(pdev, "no CMA mailbox\n");
 
 	return pci_tsm_link_constructor(pdev, &tsm->base_tsm, tsm_dev);
 }
diff --git a/drivers/virt/coco/arm-cca-host/arm-cca.c b/drivers/virt/coco/arm-cca-host/arm-cca.c
index 0b1200f591ab..265aa0cb612a 100644
--- a/drivers/virt/coco/arm-cca-host/arm-cca.c
+++ b/drivers/virt/coco/arm-cca-host/arm-cca.c
@@ -11,6 +11,8 @@
 #include <linux/tsm.h>
 #include <linux/vmalloc.h>
 #include <linux/cleanup.h>
+#include <linux/pci-doe.h>
+
 
 #include "rmi-da.h"
 
@@ -35,14 +37,22 @@ static struct pci_tsm *cca_tsm_pci_probe(struct tsm_dev *tsm_dev, struct pci_dev
 		return &no_free_ptr(fn_dsc)->pci;
 	}
 
-	if (!pdev->ide_cap)
-		return NULL;
-
 	struct cca_host_pf0_ep_dsc *pf0_ep_dsc __free(kfree) =
 		kzalloc(sizeof(*pf0_ep_dsc), GFP_KERNEL);
 	if (!pf0_ep_dsc)
 		return NULL;
 
+	/* if device have ide cap, setup doe mailbox */
+	if (pdev->ide_cap) {
+		struct pci_doe_mb *doe_mb;
+
+		doe_mb = pci_find_doe_mailbox(pdev, PCI_VENDOR_ID_PCI_SIG,
+					      PCI_DOE_FEATURE_CMA);
+		if (!doe_mb)
+			return NULL;
+		pf0_ep_dsc->pci.doe_mb = doe_mb;
+	}
+
 	ret = pci_tsm_pf0_constructor(pdev, &pf0_ep_dsc->pci, tsm_dev);
 	if (ret)
 		return NULL;
diff --git a/drivers/virt/coco/tdx-host/tdx-host.c b/drivers/virt/coco/tdx-host/tdx-host.c
index ea7c2167660f..4947b9bc2359 100644
--- a/drivers/virt/coco/tdx-host/tdx-host.c
+++ b/drivers/virt/coco/tdx-host/tdx-host.c
@@ -634,6 +634,19 @@ static struct pci_tsm *tdx_link_pf0_probe(struct tsm_dev *tsm_dev,
 	spdm_conf->vmm_spdm_cap = SPDM_CAP_KEY_UPD;
 	spdm_conf->certificate_slot_mask = 0xff;
 
+	/* if device have ide cap, setup doe mailbox */
+	if (pdev->ide_cap) {
+		struct pci_doe_mb *doe_mb;
+
+		doe_mb = pci_find_doe_mailbox(pdev, PCI_VENDOR_ID_PCI_SIG,
+					      PCI_DOE_FEATURE_CMA);
+		if (!doe_mb)
+			return NULL;
+		tlink->pci.doe_mb = doe_mb;
+	} else {
+		return NULL;
+	}
+
 	tlink->in_msg = no_free_ptr(in_msg);
 	tlink->out_msg = no_free_ptr(out_msg);
 	tlink->spdm_conf = no_free_ptr(spdm_conf);
-- 
2.43.0


