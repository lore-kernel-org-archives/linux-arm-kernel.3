Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F4ECD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 10:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FihbsDKmbfZYS2x1I7qLn22gV2Wg4JsMlwLFDqu72f4=; b=XzmUdEkDU+wNNL37geECFdaOnc
	U+1b/mGxWLvGu4m3aRe+R92S0z/AGdoiwEcfHNkrvzk8Ec8qJEqxUlu4IwFOu4cXQd0OjrbiCRS+f
	sR9/SJnHehimk4D00ZOCyxgFP3dcl0iF8+zZOFcT6tl6edLPamS6JQRWbtknd7FmKm9wOrtWB19UP
	hroywYNR+SlV6VxT6ZqSsCJxE/3t9MQWvuIkhxr7bkZUBOtT0liCVKV5tyav2qrN2/G0htPkcgyBb
	T6faKYfuOhWwXVgem+OGE6bj5J7GsEGTF8gAsTMcjZhjXsbBfDhv8mozffg/QIyPAVCn+mZpY9NTI
	xnBMhmtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUMe7-0000000Cnjd-0bAN;
	Tue, 02 Jun 2026 10:46:55 +0000
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUMe3-0000000CnhS-39AK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 10:46:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780397209; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=FihbsDKmbfZYS2x1I7qLn22gV2Wg4JsMlwLFDqu72f4=;
	b=mDfAYT5mA/bQuB+v9/0C1+Fw0ph9hmXgOwvmVjonGefOevVDppwHhds6uRlwpvNTHy09lFG9y8HG0jc8hpQufd2gH7pqmt4uQMn2APC/C0RpeAU0K2+2IuIKlYZkM/uiojSknOiHCvsFHbBT36PYY+g/rGm0M/QGnioZCDpyrOU=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R441e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=guanghuifeng@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0X44E9.j_1780397197;
Received: from VM20241011-104.tbsite.net(mailfrom:guanghuifeng@linux.alibaba.com fp:SMTPD_---0X44E9.j_1780397197 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 02 Jun 2026 18:46:47 +0800
From: Guanghui Feng <guanghuifeng@linux.alibaba.com>
To: adrian.larumbe@collabora.com,
	airlied@gmail.com,
	alex@shazbot.org,
	baolu.lu@linux.intel.com,
	boris.brezillon@collabora.com,
	dri-devel@lists.freedesktop.org,
	dwmw2@infradead.org,
	iommu@lists.linux.dev,
	jgg@ziepe.ca,
	joro@8bytes.org,
	kevin.tian@intel.com,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	liviu.dudau@arm.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	oliver.yang@linux.alibaba.com,
	robh@kernel.org,
	robin.murphy@arm.com,
	shiyu.zsq@linux.alibaba.com,
	steven.price@arm.com,
	suravee.suthikulpanit@amd.com,
	tzimmermann@suse.de,
	wei.guo.simon@linux.alibaba.com,
	will@kernel.org,
	xlpang@linux.alibaba.com
Cc: alikernel-developer@linux.alibaba.com
Subject: [PATCH v2 00/30] iommu: introduce iova_to_phys_length for efficient IOVA-to-physical translation
Date: Tue,  2 Jun 2026 18:46:07 +0800
Message-ID: <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260531093637.3893199-1-guanghuifeng@linux.alibaba.com>
References: <20260531093637.3893199-1-guanghuifeng@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_034652_645031_0D188592 
X-CRM114-Status: GOOD (  11.55  )
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

This series introduces the iova_to_phys_length interface across the IOMMU
subsystem. The new callback returns both the physical address and the PTE
mapping size in a single page table walk, enabling callers such as iommufd
and VFIO to traverse IOVA space efficiently by actual mapping granularity
instead of fixed PAGE_SIZE steps.

Motivation
==========

The current iova_to_phys interface only returns a physical address with no
indication of the mapping page size. This forces callers to iterate one
PAGE_SIZE at a time when collecting PFNs or unmapping IOVA ranges, which is
extremely inefficient for large mappings (e.g., 2MB or 1GB huge pages
require 512 or 262144 page-table walks respectively).

The new iova_to_phys_length interface solves this by providing the
contiguous mapping size alongside the physical address in a single walk.

Design
======

Core layer (patch 1):
  - Adds iova_to_phys_length to iommu_domain_ops
  - iommu_iova_to_phys_length() detects invalid states by checking
    ops->iova_to_phys_length (not domain->type), returns PHYS_ADDR_MAX
    on error
  - iommu_iova_to_phys() is preserved as a thin wrapper calling
    iova_to_phys_length internally, converting PHYS_ADDR_MAX back to 0
    for historical API compatibility

io-pgtable backends (patches 2-4):
  - ARM LPAE, ARM v7s, and DART each implement iova_to_phys_length
    returning phys + page size, with PHYS_ADDR_MAX for error paths
  - The old iova_to_phys is kept temporarily as a wrapper

generic_pt framework (patch 5):
  - Implements iova_to_phys_length using pt_entry_oa_lg2sz() which
    already accounts for contiguous PTE hints, returning the correct
    mapping size in a single leaf-entry lookup

Per-driver migration (patches 6-22):
  - Each IOMMU driver (arm-smmu-v3, arm-smmu, qcom, apple-dart,
    ipmmu-vmsa, mtk, exynos, fsl_pamu, msm, omap, rockchip, s390,
    sprd, sun50i, tegra-smmu, virtio) implements iova_to_phys_length
    in its own atomic commit
  - All error paths return PHYS_ADDR_MAX

Caller conversion (patches 23-25):
  - iommufd/pages.c uses iova_to_phys_length to batch PFN collection
    by actual mapping granularity
  - VFIO type1 uses iova_to_phys_length for efficient unmap traversal
  - drm/panfrost and drm/panthor switch to the new interface

Cleanup (patches 26-30):
  - io-pgtable selftests switch to iova_to_phys_length
  - Remove deprecated iova_to_phys wrappers from io-pgtable backends
  - Remove iova_to_phys from iommu_domain_ops and io_pgtable_ops

Changes in v2:
  - Use PHYS_ADDR_MAX (~(phys_addr_t)0) as error return instead of 0
    throughout the entire call chain, per review feedback (Jason)
  - Detect invalid domain states by checking ops->iova_to_phys_length
    rather than domain->type == IOMMU_DOMAIN_BLOCKED (Jason)
  - iommu_iova_to_phys() wrapper converts PHYS_ADDR_MAX -> 0 to
    maintain historical semantic for existing callers
  - generic_pt: use pt_entry_oa_lg2sz() which already handles
    contiguous PTE hints natively (Jason)
  - All drivers updated to return PHYS_ADDR_MAX for error/fault paths
    instead of 0

Guanghui Feng (30):
  iommu: introduce iova_to_phys_length in iommu_domain_ops
  iommu/io-pgtable-arm: introduce iova_to_phys_length in io_pgtable_ops
  iommu/io-pgtable-arm-v7s: introduce iova_to_phys_length in
    io_pgtable_ops
  iommu/io-pgtable-dart: introduce iova_to_phys_length in io_pgtable_ops
  iommu/generic_pt: implement iova_to_phys_length
  iommu/arm-smmu-v3: implement iova_to_phys_length
  iommu/arm-smmu: implement iova_to_phys_length
  iommu/qcom_iommu: implement iova_to_phys_length
  iommu/apple-dart: implement iova_to_phys_length
  iommu/ipmmu-vmsa: implement iova_to_phys_length
  iommu/mtk_iommu: implement iova_to_phys_length
  iommu/exynos: implement iova_to_phys_length
  iommu/fsl_pamu: implement iova_to_phys_length
  iommu/msm: implement iova_to_phys_length
  iommu/mtk_v1: implement iova_to_phys_length
  iommu/omap: implement iova_to_phys_length
  iommu/rockchip: implement iova_to_phys_length
  iommu/s390: implement iova_to_phys_length
  iommu/sprd: implement iova_to_phys_length
  iommu/sun50i: implement iova_to_phys_length
  iommu/tegra-smmu: implement iova_to_phys_length
  iommu/virtio: implement iova_to_phys_length
  vfio/iommufd: use iova_to_phys_length for efficient unmap
  drm/panfrost: switch to iova_to_phys_length
  drm/panthor: switch to iova_to_phys_length
  iommu/io-pgtable: selftests switch to iova_to_phys_length
  iommu/io-pgtable-arm: remove deprecated iova_to_phys wrapper
  iommu/io-pgtable-arm-v7s: remove deprecated iova_to_phys wrapper
  iommu/io-pgtable-dart: remove deprecated iova_to_phys wrapper
  iommu: remove iova_to_phys from domain_ops and io_pgtable_ops

 drivers/gpu/drm/panfrost/panfrost_mmu.c       |  2 +-
 drivers/gpu/drm/panthor/panthor_mmu.c         |  2 +-
 drivers/iommu/apple-dart.c                    | 13 ++--
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 12 ++-
 .../iommu/arm/arm-smmu/arm-smmu-qcom-debug.c  |  2 +-
 drivers/iommu/arm/arm-smmu/arm-smmu.c         | 15 ++--
 drivers/iommu/arm/arm-smmu/qcom_iommu.c       | 13 ++--
 drivers/iommu/exynos-iommu.c                  | 23 ++++--
 drivers/iommu/fsl_pamu_domain.c               | 28 ++++++-
 drivers/iommu/generic_pt/iommu_pt.h           | 57 ++++++++------
 drivers/iommu/io-pgtable-arm-selftests.c      | 12 +--
 drivers/iommu/io-pgtable-arm-v7s.c            | 27 ++++---
 drivers/iommu/io-pgtable-arm.c                | 16 ++--
 drivers/iommu/io-pgtable-dart.c               | 21 ++++--
 drivers/iommu/iommu.c                         | 32 +++++++-
 drivers/iommu/iommufd/pages.c                 | 75 ++++++++++++++++---
 drivers/iommu/iommufd/selftest.c              |  2 +-
 drivers/iommu/ipmmu-vmsa.c                    | 12 ++-
 drivers/iommu/msm_iommu.c                     | 29 +++++--
 drivers/iommu/mtk_iommu.c                     | 14 +++-
 drivers/iommu/mtk_iommu_v1.c                  | 16 +++-
 drivers/iommu/omap-iommu.c                    | 34 ++++++---
 drivers/iommu/rockchip-iommu.c                | 13 +++-
 drivers/iommu/s390-iommu.c                    | 21 ++++--
 drivers/iommu/sprd-iommu.c                    | 20 +++--
 drivers/iommu/sun50i-iommu.c                  | 17 +++--
 drivers/iommu/tegra-smmu.c                    | 14 +++-
 drivers/iommu/virtio-iommu.c                  | 15 +++-
 drivers/vfio/vfio_iommu_type1.c               | 26 +++++--
 include/linux/generic_pt/iommu.h              | 13 ++--
 include/linux/io-pgtable.h                    | 10 ++-
 include/linux/iommu.h                         | 12 ++-
 32 files changed, 443 insertions(+), 175 deletions(-)

-- 
2.43.7


