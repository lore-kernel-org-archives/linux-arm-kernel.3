Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4BA606A329
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 16:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=U4vcOjC7;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O0znDxqh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=P/AkNQwfphMcdFB+D7s/aBW66xKWMUQ8Q7dzQy7UJpE=; b=U4vcOjC7sx0Bws
	V+ksfrdoMi4Vh1NMF822HoahqBLjcM8eHyJrXc6VyH9qdtXC56cOf8i/JlV8/BjajhO99b2GFO1bz
	w7zR3u95zsCT6zx4JL4OWeidaCx533pkkyRC4Qml8faEnEcIHMQoBfQyeHn3bU4pvcugQZJjKxbFa
	o5ncZe/YCyUxK3xa9LXjGEh358DPJakI1YkEXuANRa9fJ+zYyV8TChm6ySDtGXQVl+gIveAYHHVQ0
	eNDwdlQ4cN6i7JUVJbD8cS5g+j1FBA8ypnQWjpPNmrC/k5yz2Ud8OMnRYIbNRJpTpPykyMjs+5oro
	PBBB5JcIXkfNh5OG8M0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdg6-00000005viE-0M9d;
	Wed, 04 Nov 2026 16:17:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdg4-00000005vhX-3o8P
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 16:17:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 57DE5601EF;
	Wed,  4 Nov 2026 16:17:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08CC81F00A17;
	Wed,  4 Nov 2026 16:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793809052;
	bh=P/AkNQwfphMcdFB+D7s/aBW66xKWMUQ8Q7dzQy7UJpE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=O0znDxqhlUZW1AMXKOYcAnB2EfAAEqvL1OkxoPqAKDXudVi06Vx6a0L7OQg41dKKX
	 LN368MIol11IXpbt6wd0CJlcGZQsSBpxCCuQoRQ2nDsauTjKpPPQsEQCRkv3BsnmUd
	 1s6Zup2fGZCzcUtgUYMUBnSTpGnbAz669dBwAwrvQnCGIc8UU7w0EwhwdExs+PVavR
	 oWM/517qNBq/wBKBipsgrta6dPzaoTgF7ASNrWxBDTyxGyswGCJRUCv7zwRDX6Z8lz
	 OJCDa29MRSQtAGaUo5cSqavNCagmTZ2eVpsle6lXl57i8Lq0lU194azhHTg/LzXWUu
	 wU1nz8vOCmk1w==
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
Subject: [PATCH v8 04/15] virt: coco: tsm: Require PCI operations when registering a TSM
Date: Wed,  4 Nov 2026 21:46:21 +0530
Message-ID: <20261104161632.3547423-5-aneesh.kumar@kernel.org>
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

Reject a NULL pci_ops argument in tsm_register(). Every registered TSM
then has PCI operations, so registration no longer needs separate paths
for TSMs without them.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 drivers/virt/coco/tsm-core.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/virt/coco/tsm-core.c b/drivers/virt/coco/tsm-core.c
index e370806d8436..e7807dc94807 100644
--- a/drivers/virt/coco/tsm-core.c
+++ b/drivers/virt/coco/tsm-core.c
@@ -60,9 +60,6 @@ static int tsm_register_pci(struct tsm_dev *tsm_dev, struct pci_tsm_ops *pci_ops
 {
 	int rc;
 
-	if (!pci_ops)
-		return 0;
-
 	tsm_dev->pci_ops = pci_ops;
 	rc = pci_tsm_register(tsm_dev);
 	if (rc) {
@@ -80,6 +77,9 @@ struct tsm_dev *tsm_register(struct device *parent, struct pci_tsm_ops *pci_ops)
 	struct device *dev;
 	int rc;
 
+	if (!pci_ops)
+		return ERR_PTR(-EINVAL);
+
 	if (IS_ERR(tsm_dev))
 		return tsm_dev;
 
@@ -95,14 +95,12 @@ struct tsm_dev *tsm_register(struct device *parent, struct pci_tsm_ops *pci_ops)
 
 	rc = device_add(dev);
 	if (rc) {
-		if (pci_ops)
-			pci_tsm_unregister(tsm_dev);
+		pci_tsm_unregister(tsm_dev);
 		return ERR_PTR(rc);
 	}
 
 	/* Notify TSM userspace that PCI/TSM operations are now possible. */
-	if (pci_ops)
-		kobject_uevent(&dev->kobj, KOBJ_CHANGE);
+	kobject_uevent(&dev->kobj, KOBJ_CHANGE);
 
 	return no_free_ptr(tsm_dev);
 }
-- 
2.43.0


