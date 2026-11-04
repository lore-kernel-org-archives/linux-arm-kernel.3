Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59C1606A335
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 16:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MjxUxgv4;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jQWEuxC8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=w1153b7+iXzUGHv9GmufoFZyKQiQ/VWXmJs2EbxJutI=; b=MjxUxgv4Q7peoARJuumEYQm1sj
	XQuKYwJWCEPp5YwphBk/V+i2q7R/hAjggey35OqiaNcBcJ0V/b53Jg8+RC+KygQqZV5zfRug+1Led
	8YDUKljd+tC8iOyvVqQcUPBxKzwj6J6SpAo81/XdI9IphzRF7bwZ4V7QXhEkS2qr912HYvoXrjnOv
	wzFMuCRUsM81+gmEFsFBkUYKGGxCs8boIXAgh6dvzrRMITGNdg2zKb5LxGl0Oz309SBb6oKYnUe4T
	9e0og33kvlwAWDsi7lsnku0dxi9h3qtyAbqpiogttgXBCP8g3rMW1vfPyCUxPDL1LLFuv1/Nw06/g
	CsLCkeBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdfV-00000005vM1-2ssM;
	Wed, 04 Nov 2026 16:16:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdfS-00000005vKV-0LZG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 16:16:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 81FC2439DA;
	Wed,  4 Nov 2026 16:16:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66AAA1F000C1;
	Wed,  4 Nov 2026 16:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793809013;
	bh=w1153b7+iXzUGHv9GmufoFZyKQiQ/VWXmJs2EbxJutI=;
	h=From:To:Cc:Subject:Date;
	b=jQWEuxC8rNwMhqVxtl2Dsh+PIQxpeOKLDf6h61k0h4eD/XNwa6Gn9tc/l1V03Djcp
	 n16QJ+1DtSPgDoQ60hHevspCAkKjoQA/m0ezI8FxJG4jPlw96ZYQ039b+qAqGrEB+c
	 h1jXqEbyLMBFlinxx7MLdTGTT8Pa1ndufMnJutqIwSLlpOEBOg9zGdKt50TJwxFA2D
	 zIuHurrk3R376zMyL4ON3QR9nhv+zws1xnjuToG0lqJ+cFLhRBRFJZT9nm2rRsAAlP
	 oxPdpnfESirkHL0tMyEmzhyWKW8DEeMOJ+17/v0rp/MKv/HuS26T8K9qH+nYoiWJ86
	 2Fg2PVHogTT9Q==
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
Subject: [PATCH v8 00/15] iommufd: TSM-backed virtual IOMMUs for confidential guests
Date: Wed,  4 Nov 2026 21:46:17 +0530
Message-ID: <20261104161632.3547423-1-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds IOMMUFD and PCI/TSM infrastructure for assigning PCI
devices to confidential guests. A TEE Security Manager (TSM) can provide a
virtual IOMMU (vIOMMU), and an IOMMUFD vDEVICE object represents a physical
device within that virtual IOMMU.

The series adds a common framework for operations on vDEVICE objects and
updates lifetime management to keep the VM and device-security resources
available while those objects are in use.

The Arm CCA backend is provided in a separate series, together with
operations for TEE Device Interface Security Protocol (TDISP) state changes
and access to cached device-attestation objects.

The full series, including the Arm CCA backend, is available at:

  https://git.gitlab.arm.com/linux-arm/linux-cca.git cca/topics/7.4/tdisp-host

Notes:
* Codex was used to assist with commit message formatting and code
  rearrangement.

Changes from v7:
https://lore.kernel.org/all/20261008055955.4014342-1-aneesh.kumar@kernel.org
* Replace IOMMU_VDEVICE_TSM_REQ with the common IOMMU_VDEVICE_OP ioctl
  framework. Keep operation definitions and callbacks in the Arm CCA
  backend series.
* Replace architecture-specific request dispatch, TSM result codes and
  buffer-residue returns with operation-specific request/response formats,
  a zero-success return convention and resp_len for response lengths.
* Hold a KVM file reference for the full iommufd_device lifetime and
  require matching device/vIOMMU KVM associations for vDEVICE allocation.
* Hold TSM device and user references as well as the backend module
  reference for the vIOMMU lifetime. Make unregister reject new users
  and wait for existing users before tearing down PCI connections.
* Coordinate DSM removal with TSM unregister so the completion used to
  wait for users remains valid throughout teardown.
* Complete PCI registration before publishing the TSM device and roll
  back PCI registration if publication fails. Require PCI operations
  when registering a TSM.
* Move PCI/TSM core code into drivers/pci/tsm/core.c.
* Temporarily disable AMD vIOMMU allocation while its interfaces are updated.

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

Aneesh Kumar K.V (Arm) (13):
  PCI/TSM: Move core code into its own directory
  virt: coco: tsm: Remove the device from lookup before PCI teardown
  virt: coco: tsm: Complete PCI registration before publishing the
    device
  virt: coco: tsm: Require PCI operations when registering a TSM
  iommufd/device: Hold a KVM file reference for the device lifetime
  iommufd: Add a vDEVICE operation ioctl framework
  PCI/TSM: Remove the legacy guest request interface
  PCI/TSM: Add vIOMMU-bound device contexts
  iommufd/viommu: Select vIOMMU operations before allocation
  iommufd/viommu: Allow PCI TSM backends to provide vIOMMU operations
  iommufd/viommu: Allow vIOMMUs without a parent HWPT
  PCI/TSM: Wait for device contexts before removing a DSM
  PCI/TSM: Wait for users during unregister

Nicolin Chen (1):
  iommufd/viommu: Keep a reference to the KVM file

Shameer Kolothum (1):
  iommufd/device: Associate KVM file pointer with iommufd_device

 Documentation/ABI/testing/sysfs-bus-pci       |  15 +-
 Documentation/driver-api/pci/tsm.rst          |   2 +-
 Documentation/userspace-api/iommufd.rst       |  44 +-
 MAINTAINERS                                   |   2 +-
 drivers/crypto/ccp/sev-dev-tsm.c              |   4 +-
 drivers/iommu/amd/iommu.c                     |   3 +-
 drivers/iommu/amd/iommufd.c                   |  18 +-
 drivers/iommu/amd/iommufd.h                   |  11 +-
 drivers/iommu/amd/nested.c                    |   4 +-
 .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     |  37 +-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |   7 +-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  16 +-
 .../iommu/arm/arm-smmu-v3/tegra241-cmdqv.c    |  24 +-
 drivers/iommu/iommufd/Makefile                |   1 +
 drivers/iommu/iommufd/device.c                |  14 +-
 drivers/iommu/iommufd/hw_pagetable.c          |  14 +-
 drivers/iommu/iommufd/iommufd_private.h       |   3 +
 drivers/iommu/iommufd/main.c                  |   3 +
 drivers/iommu/iommufd/selftest.c              |  33 +-
 drivers/iommu/iommufd/viommu.c                | 155 +++++--
 drivers/pci/Makefile                          |   2 +-
 drivers/pci/tsm/Makefile                      |   7 +
 drivers/pci/{tsm.c => tsm/core.c}             | 434 ++++++++++--------
 drivers/vfio/iommufd.c                        |   3 +-
 drivers/virt/coco/tsm-core.c                  | 202 +++++++-
 include/linux/iommu.h                         |  20 +-
 include/linux/iommufd.h                       |  29 +-
 include/linux/pci-tsm.h                       | 154 +++----
 include/linux/tsm.h                           |  41 +-
 include/uapi/linux/iommufd.h                  |  36 +-
 30 files changed, 884 insertions(+), 454 deletions(-)
 create mode 100644 drivers/pci/tsm/Makefile
 rename drivers/pci/{tsm.c => tsm/core.c} (71%)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0


