Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7B0606A337
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 16:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=faMLjHJS;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UxbUAIAm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jAWJHQIGnJ2Kk3giqYIVIkzM2se7YUrpnLQShJQtPJI=; b=faMLjHJSsTIYUI
	bQzHGGdVXhydQzV1UiGpg43Vw4aqdr695nYoPzIkrwXY4BvSfXV23dkaeP536bb+lsaCRG61mYCSv
	t1WPfwx+oM4bC4sdNJtIP0goqOkm2qRiDJDtlseoEPKwzuVluBMG6j0HLZUVNT3ijQX5wrf2G9OHA
	19liF0mUOjr09yAQiZLK/uptlpCWiiTmojuxYfj1PR8zZP9Wot/bSGxyIIsF0mRjlooFYMOKl/4pn
	IEBvPXr+wIlXZ9Hcl0XMunLIKNB+5bjdD1LYAASa3YXEsreIdnr6Ie4wU0Cng0I9Wvgw2qhIZuHoV
	krCmqxHCPBZhbjX3P0jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdgF-00000005vo2-15zr;
	Wed, 04 Nov 2026 16:17:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdgE-00000005vnO-3PIC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 16:17:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 42266609F9;
	Wed,  4 Nov 2026 16:17:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B16721F0093A;
	Wed,  4 Nov 2026 16:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793809061;
	bh=jAWJHQIGnJ2Kk3giqYIVIkzM2se7YUrpnLQShJQtPJI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UxbUAIAmYCewmxqeQMrkO9aPtyrPTCCcZXkeo2LbHTwgnwEim0uqnCZZ0qP2gwMqT
	 OTM98r0XSZj9ZqVa0qXvNXGLytyJkx8ZKDbXPgHEWS8qUJGE7vzUjeKc/l0Sw2kuIt
	 ArkZAxvPshwoct/9HcwRtkWx6IXU8oCeDmm53iE2INV+M/+azkMKHUsec7ZpyeBt5Y
	 Sa4esukhYx2VCLJDj62q4hVcM40o5MpQd4cWkPfeNcxL+1ClZ0XTwjm0zcwCBFlCFg
	 JJN+T6dcmR1nXfgfwiagp2XrZmjnsU3PyBEVpB//eD+xZJ29ZFLOeEALp8wOKng1Rt
	 zfyLQL5K36diw==
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
Subject: [PATCH v8 05/15] iommufd/device: Associate KVM file pointer with iommufd_device
Date: Wed,  4 Nov 2026 21:46:22 +0530
Message-ID: <20261104161632.3547423-6-aneesh.kumar@kernel.org>
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

From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>

TSM vDevice support needs access to the KVM associated with a VFIO device
after the device has been bound to iommufd.

Extend iommufd_device_bind() to accept the device's KVM file and store it
in the iommufd_device. The KVM file reference is owned by VFIO and is
already held for the duration of the device open path.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
[nicolinc: fix build error in iommufd_test_mock_domain()]
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
[aneesh.kumar: Switch to use kvm_file]
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Kevin Tian <kevin.tian@intel.com>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Alex Williamson <alex@shazbot.org>
Cc: kvm@vger.kernel.org
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 drivers/iommu/iommufd/device.c          | 7 ++++++-
 drivers/iommu/iommufd/iommufd_private.h | 2 ++
 drivers/iommu/iommufd/selftest.c        | 2 +-
 drivers/vfio/iommufd.c                  | 3 ++-
 include/linux/iommufd.h                 | 4 +++-
 5 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/iommufd/device.c b/drivers/iommu/iommufd/device.c
index 1b0bdf57ac8a..935f42616a65 100644
--- a/drivers/iommu/iommufd/device.c
+++ b/drivers/iommu/iommufd/device.c
@@ -295,6 +295,7 @@ static int iommufd_bind_noiommu(struct iommufd_device *idev)
  * iommufd_device_bind - Bind a physical device to an iommu fd
  * @ictx: iommufd file descriptor
  * @dev: Pointer to a physical device struct
+ * @kvm_file: VM file if device belongs to a KVM VM
  * @id: Output ID number to return to userspace for this device
  *
  * A successful bind establishes an ownership over the device and returns
@@ -308,7 +309,9 @@ static int iommufd_bind_noiommu(struct iommufd_device *idev)
  * The caller must undo this with iommufd_device_unbind()
  */
 struct iommufd_device *iommufd_device_bind(struct iommufd_ctx *ictx,
-					   struct device *dev, u32 *id)
+					   struct device *dev,
+					   struct file *kvm_file,
+					   u32 *id)
 {
 	struct iommufd_device *idev;
 	int rc;
@@ -319,6 +322,8 @@ struct iommufd_device *iommufd_device_bind(struct iommufd_ctx *ictx,
 
 	idev->ictx = ictx;
 	idev->dev = dev;
+	/* VFIO holds the file reference while the device is open. */
+	idev->kvm_file = kvm_file;
 
 	if (!iommufd_device_is_noiommu(idev))
 		rc = iommufd_bind_iommu(idev);
diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
index eb2e85b27e42..2560b4faa6f9 100644
--- a/drivers/iommu/iommufd/iommufd_private.h
+++ b/drivers/iommu/iommufd/iommufd_private.h
@@ -509,6 +509,8 @@ struct iommufd_device {
 	struct list_head group_item;
 	/* always the physical device */
 	struct device *dev;
+	/* ..and the VM file if available */
+	struct file *kvm_file;
 	bool enforce_cache_coherency;
 	struct iommufd_vdevice *vdev;
 	bool destroying;
diff --git a/drivers/iommu/iommufd/selftest.c b/drivers/iommu/iommufd/selftest.c
index 25387969ab75..b17cca7096b6 100644
--- a/drivers/iommu/iommufd/selftest.c
+++ b/drivers/iommu/iommufd/selftest.c
@@ -1071,7 +1071,7 @@ static int iommufd_test_mock_domain(struct iommufd_ucmd *ucmd,
 		goto out_sobj;
 	}
 
-	idev = iommufd_device_bind(ucmd->ictx, &sobj->idev.mock_dev->dev,
+	idev = iommufd_device_bind(ucmd->ictx, &sobj->idev.mock_dev->dev, NULL,
 				   &idev_id);
 	if (IS_ERR(idev)) {
 		rc = PTR_ERR(idev);
diff --git a/drivers/vfio/iommufd.c b/drivers/vfio/iommufd.c
index e9893d34d07b..3beb1b1bae36 100644
--- a/drivers/vfio/iommufd.c
+++ b/drivers/vfio/iommufd.c
@@ -123,7 +123,8 @@ int vfio_iommufd_physical_bind(struct vfio_device *vdev,
 {
 	struct iommufd_device *idev;
 
-	idev = iommufd_device_bind(ictx, vdev->dev, out_device_id);
+	idev = iommufd_device_bind(ictx, vdev->dev, vdev->kvm,
+				   out_device_id);
 	if (IS_ERR(idev))
 		return PTR_ERR(idev);
 	vdev->iommufd_device = idev;
diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
index 3087f5b2def8..b03ce0187454 100644
--- a/include/linux/iommufd.h
+++ b/include/linux/iommufd.h
@@ -59,7 +59,9 @@ struct iommufd_object {
 };
 
 struct iommufd_device *iommufd_device_bind(struct iommufd_ctx *ictx,
-					   struct device *dev, u32 *id);
+					   struct device *dev,
+					   struct file *kvm_file,
+					   u32 *id);
 void iommufd_device_unbind(struct iommufd_device *idev);
 
 int iommufd_device_attach(struct iommufd_device *idev, ioasid_t pasid,
-- 
2.43.0


