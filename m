Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D4F6083613
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 16:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LiIBGsUC;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oP08gSAg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VGKK2dwD8JErHY7gJcu4ftdMWMNAKpXhVOt2LCLmgU4=; b=LiIBGsUCYjarlV
	+bSx05EIT9tsIUXWsb4kop3FRx8DWyjwomfXajQ5xcOmjv36vJdTvYSrxHd9IITb6vxQSuWjt1ENn
	cEU2jqudPD7Q/jB38/pxwAGneM1qELpsuX8Lb2cs2GQdXdDWG2rsaHlDPuwLW6W0rezq5bytt/OSM
	l5yO2BsrBVPD+k6/u/V3svYIQDyVN7QyKzOYGPUQPV9M076Vxr4kR++aV/rnib98nIrocsSeYQXGB
	uA3fI0hZdrkSNIsyZioEGjHpXBMWgout73zhkIp3xi5nv68myhG5yn1OdD9wZYZKXj7gkw9RllsNZ
	jQ9y7KmnalDjStRN+v0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdgP-00000005vvL-1vO4;
	Wed, 04 Nov 2026 16:17:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdgO-00000005vun-1igy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 16:17:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D70C560609;
	Wed,  4 Nov 2026 16:17:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 965731F000C1;
	Wed,  4 Nov 2026 16:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793809071;
	bh=VGKK2dwD8JErHY7gJcu4ftdMWMNAKpXhVOt2LCLmgU4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oP08gSAgNqQs4+z0Z/ic597TFyebKNExzmblVKBV201uyjllm8kaMQmqa///ddNIo
	 CfcoYbtcE7MFftJ9KmT83HCNZM5H+BsDJrjFC59Y7jkBDPRwnyUmJZdZLXrOT2JQtn
	 IxoLFuybcDThsMNBhA4sDE1riUv121s+ZFSqYD4d0XglW8IHknIeDu0lYX7PhmCLLN
	 C6I0oFWX4LPOHy32lv3CQk2CHA43hbRAB49oCuDFr/glIP3y+MXAri42VMNldNiR3W
	 rqs4XK0AhkqfwB9Kz/goqMYKQ2oIi7NdoMUztp03ueIVkEBtiHP+lbojWI+suWPeDX
	 +DYWwXiB/Efaw==
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
Subject: [PATCH v8 06/15] iommufd/device: Hold a KVM file reference for the device lifetime
Date: Wed,  4 Nov 2026 21:46:23 +0530
Message-ID: <20261104161632.3547423-7-aneesh.kumar@kernel.org>
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

The KVM file stored in an iommufd_device currently relies on the
reference held by VFIO while the device is open. Normally, unbind waits
for outstanding device references before VFIO drops its KVM reference.
However, REMOVE_WAIT only waits for 60 seconds. If that timeout expires,
the device object remains in the iommufd xarray.

For example, an IOMMU_GET_HW_INFO ioctl can hold a device reference while
blocked on a userspace buffer fault:

  iommufd_fops_ioctl()
    iommufd_get_hw_info()
      iommufd_get_device()
        iommufd_get_object()
          iommufd_lock_obj()       /* takes users and wait_cnt refs */
      copy_to_user() / clear_user() /* may block before putting refs */

A concurrent final release of the VFIO device file takes this path:

  vfio_device_fops_release()
    vfio_df_unbind_iommufd()
      vfio_df_close()
        vfio_df_device_last_close()
          vfio_df_iommufd_unbind()
            vfio_iommufd_physical_unbind()
              iommufd_device_unbind()
                iommufd_object_destroy_user()
                  iommufd_object_remove(..., REMOVE_WAIT)
                    iommufd_object_dec_wait() /* timeout: -EBUSY */
                  WARN_ON(ret)
      vfio_device_put_kvm()
        fput(device->kvm)

iommufd_object_destroy_user() warns on -EBUSY but does not propagate it:
iommufd_device_unbind() returns void. Thus VFIO close effectively ignores
the unbind failure and proceeds to drop its KVM file reference even
though the iommufd_device is still alive and its ID remains usable.

Once the remaining KVM file references are released, a later ioctl on
the still-open iommufd can access the stale pointer:

  iommufd_fops_ioctl()
    iommufd_viommu_alloc_ioctl()
      iommufd_get_device()         /* finds the surviving device ID */
      get_file(idev->kvm_file)     /* accesses the freed KVM file */

Take a KVM file reference when binding the device and release it when
the iommufd_device is actually destroyed. Release it before the igroup
check in the destructor so that bind failure cleanup is covered too.
Document the ownership in the bind API and device structure.

Fixes: d8bb80c8f0e5 ("iommufd/device: Associate KVM file pointer with iommufd_device")
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 drivers/iommu/iommufd/device.c          | 11 +++++++++--
 drivers/iommu/iommufd/iommufd_private.h |  2 +-
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/iommufd/device.c b/drivers/iommu/iommufd/device.c
index 935f42616a65..cd49acf5bd3f 100644
--- a/drivers/iommu/iommufd/device.c
+++ b/drivers/iommu/iommufd/device.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /* Copyright (c) 2021-2022, NVIDIA CORPORATION & AFFILIATES
  */
+#include <linux/file.h>
 #include <linux/iommu.h>
 #include <linux/iommufd.h>
 #include <linux/pci-ats.h>
@@ -212,6 +213,9 @@ void iommufd_device_destroy(struct iommufd_object *obj)
 	struct iommufd_device *idev =
 		container_of(obj, struct iommufd_device, obj);
 
+	if (idev->kvm_file)
+		fput(idev->kvm_file);
+
 	/* igroup is NULL when destroy called during bind error cleanup */
 	if (!idev->igroup)
 		return;
@@ -306,6 +310,9 @@ static int iommufd_bind_noiommu(struct iommufd_device *idev)
  *
  * Binding a PCI device places the entire RID under iommufd control.
  *
+ * If @kvm_file is provided, a reference is held until the device object is
+ * destroyed.
+ *
  * The caller must undo this with iommufd_device_unbind()
  */
 struct iommufd_device *iommufd_device_bind(struct iommufd_ctx *ictx,
@@ -322,8 +329,8 @@ struct iommufd_device *iommufd_device_bind(struct iommufd_ctx *ictx,
 
 	idev->ictx = ictx;
 	idev->dev = dev;
-	/* VFIO holds the file reference while the device is open. */
-	idev->kvm_file = kvm_file;
+	/* Hold the VM file for the lifetime of this object. */
+	idev->kvm_file = kvm_file ? get_file(kvm_file) : NULL;
 
 	if (!iommufd_device_is_noiommu(idev))
 		rc = iommufd_bind_iommu(idev);
diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
index 2560b4faa6f9..63a6dcee21dc 100644
--- a/drivers/iommu/iommufd/iommufd_private.h
+++ b/drivers/iommu/iommufd/iommufd_private.h
@@ -509,7 +509,7 @@ struct iommufd_device {
 	struct list_head group_item;
 	/* always the physical device */
 	struct device *dev;
-	/* ..and the VM file if available */
+	/* Owned reference to the VM file, if available */
 	struct file *kvm_file;
 	bool enforce_cache_coherency;
 	struct iommufd_vdevice *vdev;
-- 
2.43.0


