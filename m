Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A8D7CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 09:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wXubRgIQov6KKC0DBoFpb8dlsukOt/+vAZvDFHs1O38=; b=u/KU5doSmDfqo1dWXdhSuggkam
	V7W/m5rQ0793m9Ehd1mMG4VQ0RXQMqh3HT+Pl+TQL+iWgFyXVUerLqDIOCUNKQ+F99ixkhNP9WDqh
	V2Tltstmq0gATwRqRdVtJ5sTmMyx34T1qrBM4mMQeFpxK05BpA71d3Z/151KmCClQHgwzXTOxDbFR
	f1cD8+Msj9PfjOvX6aNGWzreiT7qjuzr0wjf4SQIXWQ63oo1C1xxHewYz+OuqASw0nEugZsB5//cw
	/JpHsO145foparN/8LQLLZO2lxwYLeZWIxa21xYtOJnsMJKF2Y3lNexfJ3YSPQCaVJDrl/kcRackz
	GwjjCZ8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTcbO-00000009R0B-0B2L;
	Sun, 31 May 2026 09:37:02 +0000
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTcbK-00000009Qwt-0SwG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 09:37:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780220210; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=wXubRgIQov6KKC0DBoFpb8dlsukOt/+vAZvDFHs1O38=;
	b=R/e9efho6H/2+1/0QbqnqKW+BC+58aqt93rIFoT4gPj1jKHgTT3/bj7uN+0ywCT4bDOmQMfosSXvo037vrl7mHx0DV3a2b/VtK7BBOD+4xSySVjb0DJzuMcD+PVlkokUbPVjPJnaFlGdKjGO/Yesw5H3QxWtKQaCAttPBdaGz2U=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R831e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=guanghuifeng@linux.alibaba.com;NM=1;PH=DS;RN=27;SR=0;TI=SMTPD_---0X3tRVlc_1780220197;
Received: from VM20241011-104.tbsite.net(mailfrom:guanghuifeng@linux.alibaba.com fp:SMTPD_---0X3tRVlc_1780220197 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sun, 31 May 2026 17:36:46 +0800
From: Guanghui Feng <guanghuifeng@linux.alibaba.com>
To: boris.brezillon@collabora.com,
	robh@kernel.org,
	steven.price@arm.com,
	adrian.larumbe@collabora.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	liviu.dudau@arm.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	alex@shazbot.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	jgg@ziepe.ca,
	kevin.tian@intel.com,
	baolu.lu@linux.intel.com,
	suravee.suthikulpanit@amd.com,
	dwmw2@infradead.org
Cc: xlpang@linux.alibaba.com,
	oliver.yang@linux.alibaba.com,
	shiyu.zsq@linux.alibaba.com,
	wei.guo.simon@linux.alibaba.com
Subject: [PATCH 0/9] iommu: introduce iova_to_phys_length for efficient IOVA-to-physical translation
Date: Sun, 31 May 2026 17:36:28 +0800
Message-ID: <20260531093637.3893199-1-guanghuifeng@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260529115116.GR2487554@ziepe.ca>
References: <20260529115116.GR2487554@ziepe.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_023658_846539_29A4E441 
X-CRM114-Status: GOOD (  11.17  )
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

This series introduces a new iova_to_phys_length() interface across the
IOMMU subsystem that returns both the physical address and the PTE mapping
page size in a single page-table walk.

Motivation:

The existing iova_to_phys() only returns a physical address without any
information about the page size of the underlying PTE mapping. Callers
like VFIO and iommufd that need to traverse IOVA ranges are forced to
walk one PAGE_SIZE step at a time, even when the IOMMU has mapped large
regions using 2MB or 1GB huge pages. This results in O(n) page-table
walks where O(1) would suffice per mapping entry.

Approach:

The new callback .iova_to_phys_length returns the physical address and
sets *mapped_length to the PTE page size (e.g. 4KB, 2MB, 1GB). This
allows callers to skip ahead by the actual mapping granularity.

The migration follows an add-migrate-remove pattern to ensure every
commit in this series compiles independently (bisectable):

  1. Add the new interface with fallback to legacy iova_to_phys
  2. Migrate all IOMMU drivers (io-pgtable, generic_pt, per-SoC)
  3. Migrate callers (VFIO, iommufd, DRM)
  4. Remove the deprecated iova_to_phys from ops structs

Performance impact:

For VFIO unmap of a 2MB region mapped with 2MB pages, this reduces
page-table walks from 512 (PAGE_SIZE steps) to 1 (one per 2MB PTE),
a ~512x improvement in that path.

Guanghui Feng (9):
  iommu: introduce iova_to_phys_length in iommu_domain_ops
  iommu/io-pgtable: introduce iova_to_phys_length in io_pgtable_ops
  iommu/generic_pt: implement iova_to_phys_length
  iommu/arm-smmu: implement iova_to_phys_length
  iommu: apple-dart/ipmmu/mtk_iommu implement iova_to_phys_length
  iommu: direct page-table drivers implement iova_to_phys_length
  vfio/iommufd: use iova_to_phys_length for efficient unmap
  drm/gpu, iommu/io-pgtable: switch to iova_to_phys_length
  iommu: remove deprecated iova_to_phys from domain_ops and
    io_pgtable_ops

 drivers/gpu/drm/panfrost/panfrost_mmu.c       |  2 +-
 drivers/gpu/drm/panthor/panthor_mmu.c         |  2 +-
 drivers/iommu/apple-dart.c                    | 11 +--
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 10 ++-
 .../iommu/arm/arm-smmu/arm-smmu-qcom-debug.c  |  2 +-
 drivers/iommu/arm/arm-smmu/arm-smmu.c         | 13 ++--
 drivers/iommu/arm/arm-smmu/qcom_iommu.c       | 11 +--
 drivers/iommu/exynos-iommu.c                  | 21 ++++--
 drivers/iommu/fsl_pamu_domain.c               | 26 ++++++-
 drivers/iommu/generic_pt/iommu_pt.h           | 49 ++++++++-----
 drivers/iommu/io-pgtable-arm-selftests.c      | 12 ++--
 drivers/iommu/io-pgtable-arm-v7s.c            | 25 ++++---
 drivers/iommu/io-pgtable-arm.c                | 14 ++--
 drivers/iommu/io-pgtable-dart.c               | 17 +++--
 drivers/iommu/iommu.c                         | 30 +++++++-
 drivers/iommu/iommufd/pages.c                 | 71 +++++++++++++++----
 drivers/iommu/iommufd/selftest.c              |  2 +-
 drivers/iommu/ipmmu-vmsa.c                    | 12 ++--
 drivers/iommu/msm_iommu.c                     | 25 +++++--
 drivers/iommu/mtk_iommu.c                     | 12 ++--
 drivers/iommu/mtk_iommu_v1.c                  | 15 +++-
 drivers/iommu/omap-iommu.c                    | 32 ++++++---
 drivers/iommu/rockchip-iommu.c                | 11 ++-
 drivers/iommu/s390-iommu.c                    | 15 ++--
 drivers/iommu/sprd-iommu.c                    | 13 +++-
 drivers/iommu/sun50i-iommu.c                  | 13 +++-
 drivers/iommu/tegra-smmu.c                    | 12 +++-
 drivers/iommu/virtio-iommu.c                  | 13 +++-
 drivers/vfio/vfio_iommu_type1.c               | 24 +++++--
 include/linux/generic_pt/iommu.h              | 13 ++--
 include/linux/io-pgtable.h                    | 10 ++-
 include/linux/iommu.h                         | 12 +++-
 32 files changed, 404 insertions(+), 146 deletions(-)

-- 
2.43.7


