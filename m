Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B00F606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 16:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZAuOizBI;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KDhS5/q5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4rzUBJL6PXaRCv36yl9YaPhsjxgZ5+9Zl3Ygdn8k8k4=; b=ZAuOizBIa+Z7hw
	/UUvSga3PmDnGnTiACwsQwBJl3dJMw5NNRiMf/HQsTMleQcJcPhwpSy9d44EMqTWbpJnt+HmPDfU8
	iS8X9NYW8b2rQGL9mmCSsWdZKNLclTE6z0ECJ9DxdVsyAkagTh+0Kt4U9CZdE278nNprTuRYMAUJY
	HfGPkSALyulxjrPg+A8Qy/rqihNFjJ68iczCv95hG2+nfLpf9VNag+FRzhD3LvxtpsoPVCsPlU01G
	gC2Kk6frqAE3ednPyRj4rz41i1pHJ3pgP1e4Ft9I2sxDKzDyYBweFSQWQq4uAb8buW4XKE3+aPGMd
	ws4u0doTDGafcnHukC8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdfy-00000005vdk-3kdq;
	Wed, 04 Nov 2026 16:17:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdfv-00000005vbO-0o5J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 16:17:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A11F1601EF;
	Wed,  4 Nov 2026 16:17:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 637D71F00A02;
	Wed,  4 Nov 2026 16:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793809042;
	bh=4rzUBJL6PXaRCv36yl9YaPhsjxgZ5+9Zl3Ygdn8k8k4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KDhS5/q5x835aCyV/6T100kf/ekvWjZ7bvn3PAGajQ2aZnaVNM3eSP008KZqVF64F
	 HOpfwstGOE+8mtolfDL2onDXvp5/M1C+5plvUQhPok4nQPnL7HstZt6osLFiJJVmfz
	 sqNRcCEIQMKl05vekrRd9dT0o91oBJ/MY4xsrvEmdRZCa/vyCaqCPcG3wTEcw7LQXY
	 re96evTrihl/N9Qg8sPVD43kL4cNPfRgFBntVKQOBILga7i5okac2y0Rl0tLDnxQBo
	 6Q+31hO9vHKxZz4IH0yMjr4epL2EWliHGvMB+Qveif+g0/57GGXEgAE/z+XESFe//4
	 xin8p4JMwvQiw==
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
Subject: [PATCH v8 03/15] virt: coco: tsm: Complete PCI registration before publishing the device
Date: Wed,  4 Nov 2026 21:46:20 +0530
Message-ID: <20261104161632.3547423-4-aneesh.kumar@kernel.org>
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

tsm_register() calls device_add() before initializing and validating the
PCI operations. This makes the new TSM discoverable through the class
lookup while PCI registration can still fail. This ordering was introduced
by commit 3225f52cde56 ("PCI/TSM: Establish Secure Sessions and Link
Encryption").

An existing link TSM can keep the PCI connect attribute visible during
registration of another TSM. A concurrent write naming the new TSM can
therefore reach it through:

  connect_store()
    find_tsm_dev()
      class_find_device()
    is_link_tsm()
    pci_tsm_connect()

If the new backend supplies both link and device security operations,
pci_tsm_register() rejects it before taking pci_tsm_rwsem. The registration
thread then follows:

  tsm_register()
    tsm_register_pci()
      pci_tsm_register() -> -EINVAL
      tsm_dev->pci_ops = NULL
    device_del()
    put_tsm_dev() [cleanup guard]

If connect has already attached a PCI context, its temporary device
reference does not protect the stored tsm_dev pointer after the call
returns. Registration cleanup can then free a TSM still referenced by
that context. The original tsm_register_pci_or_reset() error path also
had this problem: device_unregister() removed the class device and dropped
its reference without tearing down an attached PCI context.

Commit 37a73b0448ad ("tsm: Remove the device from lookup before PCI
teardown") subsequently added the unlocked pci_ops reset shown above.
That reset can also race with the connect path's accesses to pci_ops.

Complete PCI registration before device_add() publishes the class device.
On PCI registration failure, the TSM remains undiscoverable. If
device_add() fails instead, unregister the PCI operations to roll back
the counters and PCI sysfs visibility before releasing the device.

With pci_ops initialized before device_add(), the class PCI attributes
are created with the correct visibility, so remove the subsequent sysfs
group update. Keep the PCI change notification after successful device
publication.

Fixes: 3225f52cde56 ("PCI/TSM: Establish Secure Sessions and Link Encryption")
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 drivers/virt/coco/tsm-core.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/virt/coco/tsm-core.c b/drivers/virt/coco/tsm-core.c
index f79135986102..e370806d8436 100644
--- a/drivers/virt/coco/tsm-core.c
+++ b/drivers/virt/coco/tsm-core.c
@@ -71,9 +71,6 @@ static int tsm_register_pci(struct tsm_dev *tsm_dev, struct pci_tsm_ops *pci_ops
 			"PCI/TSM registration failure: %d\n", rc);
 		return rc;
 	}
-
-	/* Notify TSM userspace that PCI/TSM operations are now possible */
-	kobject_uevent(&tsm_dev->dev.kobj, KOBJ_CHANGE);
 	return 0;
 }
 
@@ -91,15 +88,22 @@ struct tsm_dev *tsm_register(struct device *parent, struct pci_tsm_ops *pci_ops)
 	if (rc)
 		return ERR_PTR(rc);
 
-	rc = device_add(dev);
+	/* Complete PCI registration before exposing the TSM to class lookup. */
+	rc = tsm_register_pci(tsm_dev, pci_ops);
 	if (rc)
 		return ERR_PTR(rc);
 
-	rc = tsm_register_pci(tsm_dev, pci_ops);
+	rc = device_add(dev);
 	if (rc) {
-		device_del(dev);
+		if (pci_ops)
+			pci_tsm_unregister(tsm_dev);
 		return ERR_PTR(rc);
 	}
+
+	/* Notify TSM userspace that PCI/TSM operations are now possible. */
+	if (pci_ops)
+		kobject_uevent(&dev->kobj, KOBJ_CHANGE);
+
 	return no_free_ptr(tsm_dev);
 }
 EXPORT_SYMBOL_GPL(tsm_register);
-- 
2.43.0


