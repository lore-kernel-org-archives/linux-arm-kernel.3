Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08357CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 15:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RvkO+y14NMb6z4vGqoWJi7g9KwkBNoDEzCeK4sEpHZA=; b=3ita4+7jdGSGKVQC4Avz50u6+2
	NG2LeMJFIzPv241P4nRKIWbtX15HrwQ87vKE6BVJNXsJ6NFO4vrFbu09sBq1SVqBsQa0enZ/Q3YkF
	okgxUNbZtN0E5W4T9VqjqMxbfKhL5bTiUyDv0axPL1kI23JKFdTvbNxrcu0bAd0ShhZIFs/D46fjy
	eXZBK0Rca8OjTR9hvJuAfTbjP4RnoHTTRqIT2F5XUhlvov86UE+t8Gwg3eQElS5m8gAdNmYKdJMfB
	ef8bZsg4qenKsL7Af5tkjOTvCWPWnmpH9mQjWvRGc6Dc0/Qjl6BgHDLO3APiqYeUqOZ+0rSPnAeHZ
	SbSMJccQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnMo-0000000FMYt-0RyS;
	Wed, 03 Jun 2026 15:18:50 +0000
Received: from out30-98.freemail.mail.aliyun.com ([115.124.30.98])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnMl-0000000FMUR-2b7a
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 15:18:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780499921; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=RvkO+y14NMb6z4vGqoWJi7g9KwkBNoDEzCeK4sEpHZA=;
	b=U+cwcbwaB/pLR3+UlFlMHMEUdUWnqO3u5qMlr6DnUa6rrz9RjNwBXjNdTuoqlfpZXn6gNJLSKa16GDZgrPt+CaKjqUpymk9ykXIMBBcuEhSNqneSCAXzz+OEGhWw9p3l5Tf+tH5cU/4Hcz/s6VrM7oENb1G0/oB1WyjG+Ik0cbg=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R631e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=guanghuifeng@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0X47fQu8_1780499884;
Received: from VM20241011-104.tbsite.net(mailfrom:guanghuifeng@linux.alibaba.com fp:SMTPD_---0X47fQu8_1780499884 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 03 Jun 2026 23:18:38 +0800
From: Guanghui Feng <guanghuifeng@linux.alibaba.com>
To: jgg@ziepe.ca
Cc: adrian.larumbe@collabora.com,
	airlied@gmail.com,
	alex@shazbot.org,
	alikernel-developer@linux.alibaba.com,
	baolu.lu@linux.intel.com,
	boris.brezillon@collabora.com,
	dri-devel@lists.freedesktop.org,
	dwmw2@infradead.org,
	iommu@lists.linux.dev,
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
Subject: [PATCH v3 00/32] iommu: introduce iova_to_phys_length and remove iova_to_phys
Date: Wed,  3 Jun 2026 23:17:32 +0800
Message-ID: <20260603151804.1963871-1-guanghuifeng@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
References: <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_081848_213602_BC8686CE 
X-CRM114-Status: GOOD (  15.53  )
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

This series introduces a new iova_to_phys_length() interface to the IOMMU
subsystem, migrates all drivers and callers to it, and finally removes the
legacy iova_to_phys() interface.

Motivation
==========

The existing iommu_iova_to_phys() returns only the physical address for a
given IOVA. Callers that need to walk a range of IOVA space (most notably
VFIO and IOMMUFD during unmap) have no way to learn the size of the mapping
backing an IOVA, so they are forced to iterate in fixed PAGE_SIZE steps.
When the underlying mapping uses large pages (e.g. 2MB or 1GB), this results
in a separate page table walk for every 4KB, which is highly inefficient for
large regions.

iommu_iova_to_phys_length() returns both the physical address and the page
size of the PTE backing the IOVA in a single page table walk. Callers can
then advance by the actual mapping granularity instead of PAGE_SIZE,
dramatically reducing the number of page table walks during teardown of
large mappings.

The new helper translates a missing mapping to PHYS_ADDR_MAX (rather than 0)
so that a zero physical address can be distinguished from a translation
failure, and the legacy iommu_iova_to_phys() is reimplemented on top of it.

Approach
========

The series is structured to keep the tree bisectable at every step: the new
interface is added first with a fallback to the legacy callback, every
driver and caller is migrated, and only then is the old interface removed.

  - Core and page table layer (patches 1-5):
    Add iova_to_phys_length to iommu_domain_ops and io_pgtable_ops, the
    core iommu_iova_to_phys_length() helper with a fallback to the legacy
    iova_to_phys, and implement it in the io-pgtable arm, arm-v7s and dart
    formats as well as the generic_pt framework.

  - Driver migration (patches 6-22):
    Implement iova_to_phys_length in all remaining IOMMU drivers:
    arm-smmu-v3, arm-smmu, qcom_iommu, apple-dart, ipmmu-vmsa, mtk_iommu,
    exynos, fsl_pamu, msm, mtk_v1, omap, rockchip, s390, sprd, sun50i,
    tegra-smmu and virtio.

  - Caller migration (patches 23-28):
    Switch VFIO and IOMMUFD to iova_to_phys_length for efficient,
    granularity-aware unmap, update the iommufd selftest, migrate the
    DRM panfrost and panthor drivers, and switch the io-pgtable selftests
    to the new interface.

  - Removal (patches 29-32):
    Drop the now-unused iova_to_phys wrappers from the io-pgtable arm,
    arm-v7s and dart formats, and finally remove iova_to_phys from
    iommu_domain_ops and io_pgtable_ops.

No functional change is intended for translation results; the change is
purely about exposing mapping size and using it to make range operations
more efficient.

Guanghui Feng (32):
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
  vfio: use iova_to_phys_length for efficient unmap
  iommufd: use iova_to_phys_length for efficient unmap
  iommufd/selftest: switch to iommu_iova_to_phys_length
  drm/panfrost: switch to iova_to_phys_length
  drm/panthor: switch to iova_to_phys_length
  iommu/io-pgtable: selftests switch to iova_to_phys_length
  iommu/io-pgtable-arm: remove deprecated iova_to_phys wrapper
  iommu/io-pgtable-arm-v7s: remove deprecated iova_to_phys wrapper
  iommu/io-pgtable-dart: remove deprecated iova_to_phys wrapper
  iommu: remove iova_to_phys from domain_ops and io_pgtable_ops

 drivers/gpu/drm/panfrost/panfrost_mmu.c       |  2 +-
 drivers/gpu/drm/panthor/panthor_mmu.c         |  2 +-
 drivers/iommu/apple-dart.c                    | 11 +--
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 10 ++-
 .../iommu/arm/arm-smmu/arm-smmu-qcom-debug.c  |  2 +-
 drivers/iommu/arm/arm-smmu/arm-smmu.c         | 13 +--
 drivers/iommu/arm/arm-smmu/qcom_iommu.c       | 11 +--
 drivers/iommu/exynos-iommu.c                  | 20 +++--
 drivers/iommu/fsl_pamu_domain.c               | 26 +++++-
 drivers/iommu/generic_pt/iommu_pt.h           | 84 ++++++++++++++-----
 drivers/iommu/io-pgtable-arm-selftests.c      | 12 +--
 drivers/iommu/io-pgtable-arm-v7s.c            | 25 +++---
 drivers/iommu/io-pgtable-arm.c                | 16 ++--
 drivers/iommu/io-pgtable-dart.c               | 21 +++--
 drivers/iommu/iommu.c                         | 38 +++++++--
 drivers/iommu/iommufd/pages.c                 | 74 +++++++++++++---
 drivers/iommu/iommufd/selftest.c              |  2 +-
 drivers/iommu/ipmmu-vmsa.c                    | 10 ++-
 drivers/iommu/msm_iommu.c                     | 21 +++--
 drivers/iommu/mtk_iommu.c                     | 11 ++-
 drivers/iommu/mtk_iommu_v1.c                  | 13 ++-
 drivers/iommu/omap-iommu.c                    | 29 ++++---
 drivers/iommu/rockchip-iommu.c                | 10 ++-
 drivers/iommu/s390-iommu.c                    | 18 ++--
 drivers/iommu/sprd-iommu.c                    | 17 ++--
 drivers/iommu/sun50i-iommu.c                  | 14 ++--
 drivers/iommu/tegra-smmu.c                    | 11 ++-
 drivers/iommu/virtio-iommu.c                  | 12 ++-
 drivers/vfio/vfio_iommu_type1.c               | 27 ++++--
 include/linux/generic_pt/iommu.h              | 13 +--
 include/linux/io-pgtable.h                    | 11 ++-
 include/linux/iommu.h                         | 12 ++-
 32 files changed, 423 insertions(+), 175 deletions(-)

-- 
2.43.7


