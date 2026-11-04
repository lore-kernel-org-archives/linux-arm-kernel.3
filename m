Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A185606EE84
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 16:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Bmye2QW7;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YFJS4SbE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fyZRV4J6nax35QOw1ljlSPVHtJnA1c//c2H2SMY2yT0=; b=Bmye2QW7Az3Xq3
	aAUyAWaSgk1L37ATkeyop9B3ByZOo0vdc+6YbaxgFPIqfzGAveYCr3zsQjWYC/yZBsw09Z91dekEc
	UjH28gz2KF9EHZz7buaH/wgFMbzG8yzVFcrfke5c5wBBbgaVgtmzltZWtZiyfplo0CZJUcQblhf2m
	wO848yvkU4xNiddqU833tIpJwngywjt6HzASJD4CZjTDp5hYcMNV3kDb93Txw85J4wy5SpozX6k8g
	2TuQYS7/viUhDz2/UDOJDNq4ZbpUXdUIQw3UVc8Oqf3Oe48IqYNe+wk3iiq6woFmEo9z7WGnWK0jj
	lbbSHVYujDVrGdNkfBkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdfm-00000005vWc-0LGS;
	Wed, 04 Nov 2026 16:17:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdfl-00000005vW4-0MlE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 16:17:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D352340B7B;
	Wed,  4 Nov 2026 16:17:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B87091F000C1;
	Wed,  4 Nov 2026 16:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793809032;
	bh=fyZRV4J6nax35QOw1ljlSPVHtJnA1c//c2H2SMY2yT0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YFJS4SbEKuKwWiS76FBgOfVN9Pfo2nzfGuDF0zKiZyVtvf6Vuz4FHI2dpsXgHsqo6
	 KAzYakMrl2inh6VQXAS4AMPEG0Qr5Qr7qG3dEUlNTo98MPyyx3IBe6SaL3nM7ZN2Xu
	 ct7dEbNT/sqUneuGXFuHKe8JfDyFQ0e57rZT/wvx6yvbk5FfFJupyNX1DZHXP0nBQL
	 hPxJGbZ4Bl1OxjVL1SS+M7wyoHNFQNeO6s++uVCtlbXo3VHStg528CRGALMW7C7mf9
	 AlY0Z2fEbET/uz8OfsjXmutVtpIuzje6bxZcwDOfZ6RWWKCyqhYoobZ5/5/PxlyKrK
	 M/GqFlnhSO4dQ==
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
Subject: [PATCH v8 02/15] virt: coco: tsm: Remove the device from lookup before PCI teardown
Date: Wed,  4 Nov 2026 21:46:19 +0530
Message-ID: <20261104161632.3547423-3-aneesh.kumar@kernel.org>
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

PCI connect looks up a TSM by ID under pci_tsm_rwsem. Previously,
tsm_unregister() released that lock after tearing down PCI state while
the TSM was still in the class lookup. A racing connect could then
attach a new PCI context that the teardown would never see.

Remove the device from the class lookup first, then take the PCI write
lock to drain in-flight operations and destroy their contexts. Drop the
device reference only after PCI teardown completes.

Fixes: 3225f52cde56 ("PCI/TSM: Establish Secure Sessions and Link Encryption")
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 drivers/virt/coco/tsm-core.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/virt/coco/tsm-core.c b/drivers/virt/coco/tsm-core.c
index e784993353d8..f79135986102 100644
--- a/drivers/virt/coco/tsm-core.c
+++ b/drivers/virt/coco/tsm-core.c
@@ -56,26 +56,25 @@ static struct tsm_dev *alloc_tsm_dev(struct device *parent)
 	return no_free_ptr(tsm_dev);
 }
 
-static struct tsm_dev *tsm_register_pci_or_reset(struct tsm_dev *tsm_dev,
-						 struct pci_tsm_ops *pci_ops)
+static int tsm_register_pci(struct tsm_dev *tsm_dev, struct pci_tsm_ops *pci_ops)
 {
 	int rc;
 
 	if (!pci_ops)
-		return tsm_dev;
+		return 0;
 
 	tsm_dev->pci_ops = pci_ops;
 	rc = pci_tsm_register(tsm_dev);
 	if (rc) {
+		tsm_dev->pci_ops = NULL;
 		dev_err(tsm_dev->dev.parent,
 			"PCI/TSM registration failure: %d\n", rc);
-		device_unregister(&tsm_dev->dev);
-		return ERR_PTR(rc);
+		return rc;
 	}
 
 	/* Notify TSM userspace that PCI/TSM operations are now possible */
 	kobject_uevent(&tsm_dev->dev.kobj, KOBJ_CHANGE);
-	return tsm_dev;
+	return 0;
 }
 
 struct tsm_dev *tsm_register(struct device *parent, struct pci_tsm_ops *pci_ops)
@@ -96,15 +95,22 @@ struct tsm_dev *tsm_register(struct device *parent, struct pci_tsm_ops *pci_ops)
 	if (rc)
 		return ERR_PTR(rc);
 
-	return tsm_register_pci_or_reset(no_free_ptr(tsm_dev), pci_ops);
+	rc = tsm_register_pci(tsm_dev, pci_ops);
+	if (rc) {
+		device_del(dev);
+		return ERR_PTR(rc);
+	}
+	return no_free_ptr(tsm_dev);
 }
 EXPORT_SYMBOL_GPL(tsm_register);
 
 void tsm_unregister(struct tsm_dev *tsm_dev)
 {
+	/* Remove the class lookup first. */
+	device_del(&tsm_dev->dev);
 	if (tsm_dev->pci_ops)
 		pci_tsm_unregister(tsm_dev);
-	device_unregister(&tsm_dev->dev);
+	put_device(&tsm_dev->dev);
 }
 EXPORT_SYMBOL_GPL(tsm_unregister);
 
-- 
2.43.0


