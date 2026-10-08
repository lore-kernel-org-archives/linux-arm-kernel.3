Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D7DBCA6007
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 06:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/bHTGZMzM4w6xwig+RjqaHBwjvdE8aY9v1cTkEXLvIA=; b=Ow4mjic5MybK5II8H+0luj3Wup
	joIruG/IYAKBlAZZhmOIP64Q6Mv9RHiPbEUgGk9ghhsy0yIWuGLenvCgC3pZSJ/5gpkH9LXC6uUpe
	9XJpZ77BVRM1TA9z7OY2IiVmmzM7Rd1pG/BROq/ypzi3G5RhUKy+UUBqUMA9AaGu7RqzjbWXdfmKu
	3Cdt2gVFXMXviITfu0hrLgau4CFqAKXYIdZoDftK8WLfBoBVZ1bC22QM85KluIKEdzMnWFoHU3zic
	mI1qfPgPyiq8fkqMgClpulB4cxdlleZPYnSFW0NRSDpJxIeeHvxRAf9ImzmkL7+bB4JmzfEr9RX25
	1426huIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEhAu-00000003aDz-1SJc;
	Thu, 08 Oct 2026 06:00:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEhAt-00000003aDf-1SvX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 06:00:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 47C30601DB;
	Thu,  8 Oct 2026 06:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0E511F000FF;
	Thu,  8 Oct 2026 06:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791439214;
	bh=/bHTGZMzM4w6xwig+RjqaHBwjvdE8aY9v1cTkEXLvIA=;
	h=From:To:Cc:Subject:Date;
	b=XecI8/3ZQU3h+nwgEgT8B163FnicZXb5taygrZgyqNxVgYnIX4dOYfOJLIS/BF/BY
	 fo7Tdo7rqHWJwVZPqgpY4EITNaQyRvtUytleMo6+eQ3Pngjq3Rz/kKdy68Tyzl9hwt
	 kdSQ1ymBca46zPz+539vrPXicNregsaP2vBA+ZmiAb6YeiLwUpTgmr6CZNfPDr6Ixx
	 WhXTuoP4f0jVp45a0YQ0BFU3CkkgJpB48KE/w3S3bqSUPljENxrSDi3crSwIWhW0d1
	 WYuEI+DL33qAHDCaS8K2qny9sZzoMPq7//HcMo/EK557E78ccM/N8zyny2EEaQdefU
	 EQfxHQ7qPK+SA==
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
Subject: [PATCH v7 00/16] iommufd: vIOMMUs and TSM guest requests for confidential guests
Date: Thu,  8 Oct 2026 11:29:39 +0530
Message-ID: <20261008055955.4014342-1-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This series adds IOMMUFD and PCI/TSM infrastructure for assigning PCI
devices to confidential guests. It includes the IOMMU_VDEVICE_TSM_REQ
ioctl. The Arm CCA host backend is supplied in a separate series; this
series provides the interfaces it uses.

Physical IOMMU drivers and PCI TSM backends now provide vIOMMU ops before
IOMMUFD validates the parent HWPT. These ops provide callbacks for
determining the allocation size and initializing the vIOMMU, along with
flags specifying whether a parent HWPT is required. A nesting parent is
required by default. When the selected ops set IOMMUFD_VIOMMU_NO_HWPT,
userspace must supply a zero hwpt_id, and IOMMUFD passes NULL as the parent
domain to the initialization callback. Nested HWPT and hardware queue
allocation are rejected for a vIOMMU without a parent.

IOMMUFD first queries the TSM attached to the selected PCI device. Lookup
pins the backend module before using its vIOMMU ops, and that
reference is released after the backend's vIOMMU destruction callback.
The backend must keep its TSM registered while the module is pinned.
When no TSM provides ops for the requested type, IOMMUFD falls back
to the physical IOMMU driver. An error from TSM lookup or querying its ops is
returned without falling back.

Vdevice contexts replace the legacy PCI/TSM bind and unbind interface.
Context acquisition verifies that the device's current TSM matches the
vIOMMU's TSM. An explicit sysfs disconnect returns EBUSY while contexts
remain active. Guest requests are dispatched through the vIOMMU ops.

IOMMU_VDEVICE_TSM_REQ checks the guest architecture and the vdevice's
supported-operation mask before forwarding userspace buffers to the
backend. Request and response lengths are limited to INT_MAX so a
successful residue fits in the ioctl return value. The backend supplies
the architecture-specific request handling and TSM result code.

Notes:
* Codex was used to assist with commit message formatting and code
  rearrangement.
* This series also includes patches from the following series to provide
  the dependencies needed for Sashiko to review the combined changes:
  https://lore.kernel.org/all/20260928-vfio-v4-0-e32e226d5932@linux.ibm.com

Changes from v6:
https://lore.kernel.org/all/20260917140159.1163281-1-aneesh.kumar@kernel.org
* Replace the IOMMUFD provider registry with per-device TSM operation lookup.
* Move vIOMMU allocation size and initialization into the selected vIOMMU ops.
* Select parent HWPT policy from the vIOMMU ops flags.
* Pin a vIOMMU's TSM backend module through vIOMMU destruction.

Changes from v5:
https://lore.kernel.org/all/20260525154816.1029642-1-aneesh.kumar@kernel.org
* Replace the TSM bind/unbind interface with reference-counted contexts.
* Add the IOMMUFD vIOMMU provider abstraction.
* Route TSM guest requests through vIOMMU ops.

Changes from v4:
https://lore.kernel.org/all/20260427061005.901854-1-aneesh.kumar@kernel.org
* Switch VFIO/iommufd to use struct file *kvm_file instead of relying on
  kvm->users_count references.
* Define TSM request scope values globally in iommufd.
* Rename the ioctl to IOMMU_VDEVICE_TSM_REQ.
* Address other review feedback.

Changes from v2:
https://lore.kernel.org/all/20260309111704.2330479-1-aneesh.kumar@kernel.org
* Bump the series revision to v4 to keep it in sync with the dependent CCA DA
  patchsets. There was no v3 posting.
* Drop [PATCH v2 1/3] iommufd/viommu: Allow associating a KVM VM fd with a
  vIOMMU
* Add two new patches to associate a struct kvm * with iommufd objects:
  iommufd/device: Associate a kvm pointer to iommufd_device
  iommufd/viommu: Associate a kvm pointer to iommufd_viommu
* Address review feedback

Changes from v1:
https://lore.kernel.org/all/20250728135216.48084-8-aneesh.kumar@kernel.org
* Rebase onto the latest kernel
* Address review feedback
* Drop the TSM map ioctl; the KVM prefault patch will be used instead to
  ensure that private memory is preallocated

Cc: Alex Williamson <alex@shazbot.org>
Cc: Alexey Kardashevskiy <aik@amd.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com> 
CC: Jacob Pan <jacob.pan@linux.microsoft.com> 
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Jonathan Cameron <jic23@kernel.org>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Kevin Tian <kevin.tian@intel.com>
Cc: Krishna Reddy <vdumpa@nvidia.com>
Cc: Lukas Wunner <lukas@wunner.de>
Cc: Nicolin Chen <nicolinc@nvidia.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Samuel Ortiz <sameo@rivosinc.com>
Cc: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Cc: Steven Price <steven.price@arm.com>
Cc: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Thierry Reding <thierry.reding@kernel.org>
Cc: Vasant Hegde <vasant.hegde@amd.com>
Cc: Will Deacon <will@kernel.org>
Cc: Xu Yilun <yilun.xu@linux.intel.com>
Cc: kvm@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-coco@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Cc: linux-pci@vger.kernel.org
Cc: linux-tegra@vger.kernel.org

Aneesh Kumar K.V (Arm) (8):
  tsm: Remove the device from lookup before PCI teardown
  iommufd: Add the vdevice TSM request ioctl
  PCI/TSM: Remove the legacy guest request interface
  PCI/TSM: Add vIOMMU-bound contexts for vdevices
  iommufd/viommu: Select vIOMMU operations before allocation
  iommufd/viommu: Allow PCI TSM backends to provide vIOMMU operations
  iommufd: Allow vIOMMUs without a parent HWPT
  PCI/TSM: wait for vdevice contexts before removing a DSM

Nicolin Chen (1):
  iommufd/viommu: Keep a reference to the KVM file

Shameer Kolothum (1):
  iommufd/device: Associate KVM file pointer with iommufd_device

Steffen Eiden (6):
  KVM: Introduce file_to_kvm_<arch>() infrastructure
  KVM: Add file back-pointer to struct kvm
  KVM: x86: Use file_to_kvm_x86() in SEV
  KVM/vfio: Use file-based reference counting for KVM
  KVM: Restrict kvm_get_kvm/kvm_put_kvm export to internal KVM modules
  KVM: Remove unused file_is_kvm

 Documentation/ABI/testing/sysfs-bus-pci       |  17 +-
 Documentation/userspace-api/iommufd.rst       |  44 ++-
 arch/s390/include/asm/kvm_host_s390.h         |   4 +-
 arch/s390/kvm/s390/pci.c                      |   9 +-
 arch/x86/include/asm/kvm_host.h               |   2 +
 arch/x86/include/asm/kvm_page_track.h         |  10 +-
 arch/x86/kvm/Makefile                         |   4 +-
 arch/x86/kvm/mmu/page_track.c                 |  22 +-
 arch/x86/kvm/svm/sev.c                        |   8 +-
 drivers/iommu/amd/iommu.c                     |   3 +-
 drivers/iommu/amd/iommufd.c                   |  18 +-
 drivers/iommu/amd/iommufd.h                   |  11 +-
 drivers/iommu/amd/nested.c                    |   4 +-
 .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     |  37 +-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |   7 +-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  16 +-
 .../iommu/arm/arm-smmu-v3/tegra241-cmdqv.c    |  24 +-
 drivers/iommu/iommufd/Makefile                |   2 +
 drivers/iommu/iommufd/device.c                |   7 +-
 drivers/iommu/iommufd/hw_pagetable.c          |  14 +-
 drivers/iommu/iommufd/iommufd_private.h       |  10 +
 drivers/iommu/iommufd/main.c                  |   3 +
 drivers/iommu/iommufd/selftest.c              |  33 +-
 drivers/iommu/iommufd/tsm.c                   |  80 ++++
 drivers/iommu/iommufd/viommu.c                | 117 ++++--
 drivers/pci/tsm.c                             | 362 ++++++++----------
 drivers/s390/crypto/vfio_ap_ops.c             |  20 +-
 drivers/vfio/group.c                          |  11 +-
 drivers/vfio/iommufd.c                        |   3 +-
 drivers/vfio/vfio.h                           |  12 +-
 drivers/vfio/vfio_main.c                      |  57 +--
 drivers/virt/coco/tsm-core.c                  |  55 ++-
 include/linux/iommu.h                         |  20 +-
 include/linux/iommufd.h                       |  35 +-
 include/linux/kvm_host.h                      |  19 +-
 include/linux/pci-tsm.h                       | 153 ++++----
 include/linux/tsm.h                           |  46 +++
 include/linux/vfio.h                          |   5 +-
 include/uapi/linux/iommufd.h                  |  85 +++-
 virt/kvm/kvm_main.c                           |  21 +-
 virt/kvm/vfio.c                               |  13 +-
 41 files changed, 893 insertions(+), 530 deletions(-)
 create mode 100644 drivers/iommu/iommufd/tsm.c


base-commit: 551c722f40809618230001baccf219193e22fc5a
-- 
2.43.0


