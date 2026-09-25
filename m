Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8DD4C98318
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 01:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tsGiZAY40ILBDkcC5GrUE+7G9t9ArWuC4UK+LzuL0LU=; b=neY1pVKk0Ie+QqcQNBF2vpvdxl
	cIbJuXeYv69LTFVgYMN8jGVbmtlHEC2AKkRybaeQk15nThhj2mbSPPEu+Rgl7dzW0ajwxuG4h3s/3
	eBSfJq9DRtd4LgWDx+ey7ZJco4na8z2aLwIGjCva9SDZioBg7Tb6gGYS4n6bxrw0rigU0gAlgq2EX
	5p6hK62aryWtIC9g6MkR5cgJ+dtE6KMl5v5kl9bNTttZdC0eVc3UKdaESSLw69Ou019FeBarfjKUR
	sPjstfg06tlhcE9CddIva0LvDESis5X8YH4WQ0dmvkJVXGyYXtMO11CUMtJ/RIexCPQ/l5KpmjXDg
	a47t4zQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9uV3-0000000CU4r-2F32;
	Fri, 25 Sep 2026 01:13:17 +0000
Received: from mail-pg1-x547.google.com ([2607:f8b0:4864:20::547])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9uV0-0000000CU3J-11Ff
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 01:13:16 +0000
Received: by mail-pg1-x547.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso355836a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 18:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790298792; x=1790903592; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tsGiZAY40ILBDkcC5GrUE+7G9t9ArWuC4UK+LzuL0LU=;
        b=oyQC2slNdx1nfFj/JGvSlpYVA0Sp7FtK7yRcXKdNC6kIn4oJqJyl/9kV5qAE9GB/Lq
         514ZGZxCokM1lArKAyLLiG8VmlNBFcBcYEuYiyrskUBp+Q8Nqsuo7gvxrSzRDnKZZlmi
         FNVbD75xDXv4FKx/I39+C2Al5C3pSdDYHBUA0cQLca2KCytEN6L1L5PYqFiHo13Zf1c6
         +x6eJpwOs+J+T2LL9FfRnnWGqC5TfqIzGfAAJ/56keBSXcuOKK2EUu1m249v4le91VTV
         WiUTnvt5AAODg7+L2oIJIKszPyTC4bcUOt+WHUyhK57/OGcgu8Drh0fTQUa9FERifa6y
         mQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790298792; x=1790903592;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tsGiZAY40ILBDkcC5GrUE+7G9t9ArWuC4UK+LzuL0LU=;
        b=xispDLjzU2ei8k7Gm4vd+GwtuWTPXc7Sk1K9Jdz5VbMPZ/JXzKjFm7gSg2duzBDELr
         DCt/4Ryx469QS/f7SX2BOBkYlkkBMsPqERbuyfLjRidKuoPQUTSPu/FtOMWIWpCr3Sqj
         t1uA0RRpMkPWFT8I8gncmiyWqjV5KKDaJs4Vi0EwIE3Fmda9ecdHeHg3JWIW6o1UvXsU
         OBw7+iElJNT7A/5jyoNkwCubGlAo58RByOLizXqmuUgaH2sRQ+FKoijSXdBmKV5TnUQV
         trF8H53ZSesP3iAExxDHNEiDCNGizOpIKauRaVS/CcPGJgmJRs+/GPcVd0R1OLb6ZBs/
         eM1w==
X-Forwarded-Encrypted: i=1; AKwUvBwl8Z59wS0Xr8LxVyV5odKQo7KGjFikT11sP7LxJLhmxOl8NrMJjQgKS53aLnLtuApMT0WTHAc6zGT6632cNrNe@lists.infradead.org
X-Gm-Message-State: AFuF++kvurLvNNY/AqVCpnhGNnXGw7ygUbOtQEt3JcPSEbzBji8w6L/7
	BZD/wN5vnf138khnyUtni9UyH1JlHrlH52fSvem+4vWBoM+g11J4KA339+2UjaiRaS/LR6bdCBa
	/LOH0/ng1009ZVQ==
X-Received: from pgbfq7.prod.google.com ([2002:a05:6a02:2987:b0:cc4:b1e4:46a3])
 (user=skhawaja job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:4329:b0:3d2:5eb3:596 with SMTP id adf61e73a8af0-3de0e73d6cfmr3866075637.16.1790298791917;
 Thu, 24 Sep 2026 18:13:11 -0700 (PDT)
Date: Fri, 25 Sep 2026 01:13:04 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260925011308.3381953-1-skhawaja@google.com>
Subject: [RFC PATCH 0/3] iommu/arm-smmu-v3: Add support for hitless replace of
 CD entries
From: Samiullah Khawaja <skhawaja@google.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: Samiullah Khawaja <skhawaja@google.com>, Robin Murphy <robin.murphy@arm.com>, 
	Kevin Tian <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, David Matlack <dmatlack@google.com>, 
	Lu Baolu <baolu.lu@linux.intel.com>, Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_181314_290917_4DF7730E 
X-CRM114-Status: GOOD (  18.66  )
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

This patch series adds support for replacing IOMMU domains with S1 page
tables hitlessly, that is without disrupting the ongoing DMAs. This is
one of the dependencies of the Liveupdate IOMMU support for Arm SMMUv3.

S1 domains are programmed by CD entries in the CD table. During a new
domain attach these are updated using arm_smmu_write_cd_entry(). Since
ASID and TTB0 are in different 64-bit words, arm_smmu_write_cd_entry()
considers it a non-hitless update and sets V=0. This means such an
update is disruptive and would generate translation faults if there are
ongoing DMAs.

Replace the CD entries by using an unused temporary ASID in the
following sequence to allow hitless replacement of CD entry,

- Update the CD entry with temporary ASID.
- Update the CD entry with the target TTB0.
- Invalidate the temporary ASID.
- Update the CD entry with target ASID.
- Invalidate and release the temporary ASID.

The series adds a vfio selftest that triggers a continuous DMA and does
the hwpt replace while the DMA is ongoing. Since domain replacement is a
race with the translation requests, the test does it multiple times to
capture the small window where IOMMU faults can occur.

Without this change we can observe the SMMU faults in the kernel logs
and with it the SMMU faults do not occur.

This is only tested on qemu with the emulated SMMUv3 and an out of tree
NVMe vfio selftest driver, not on real hardware. Following are not
covered and can be done later,

- S2 domains have the same problem, S2VMID is in STE qword 2 and S2TTB is
  in qword 3. These need the same handling with a temporary VMID.
- ATS is not tested, the test environment runs with pci=noats.

Testing:

Without Fix:

  TAP version 13
  1..2
  # Starting 2 tests from 2 test cases.
  #  RUN           vfio_iommufd_replace_hwpt_test.domain_replace.memcpy ...
  [   33.267749] vfio-pci 0000:00:0a.0: enabling device (0000 -> 0002)
  [   33.270709] vfio-pci 0000:00:0a.0: resetting
  [   33.385682] vfio-pci 0000:00:0a.0: reset done
  [   37.128021] arm-smmu-v3 9050000.smmuv3: event 0x0a received:
  [   37.131885] arm-smmu-v3 9050000.smmuv3:      0x000000500000000a
  [   37.134585] arm-smmu-v3 9050000.smmuv3:      0x0000000000000000
  [   37.136961] arm-smmu-v3 9050000.smmuv3:      0x0000000000000000
  [   37.139631] arm-smmu-v3 9050000.smmuv3:      0x0000000000000000
  [   37.142188] arm-smmu-v3 9050000.smmuv3: event: C_BAD_CD client: 0000:00:0a.0 sid: 0x50 ssid: 0x0

  ...
  ...

With Fix:

  TAP version 13
  1..2
  # Starting 2 tests from 2 test cases.
  #  RUN           vfio_iommufd_replace_hwpt_test.domain_replace.memcpy ...
  [   33.418253] vfio-pci 0000:00:0a.0: enabling device (0000 -> 0002)
  [   33.421218] vfio-pci 0000:00:0a.0: resetting
  [   33.539750] vfio-pci 0000:00:0a.0: reset done
  #            OK  vfio_iommufd_replace_hwpt_test.domain_replace.memcpy
  ok 1 vfio_iommufd_replace_hwpt_test.domain_replace.memcpy
  #  RUN           vfio_iommufd_replace_hwpt_test.noreplace.memcpy ...
  [   88.416453] vfio-pci 0000:00:0a.0: resetting
  [   88.531989] vfio-pci 0000:00:0a.0: reset done
  #            OK  vfio_iommufd_replace_hwpt_test.noreplace.memcpy
  ok 2 vfio_iommufd_replace_hwpt_test.noreplace.memcpy

Looking forward to your feedback on this.

Dependencies:
The patch series includes a patch from the vfio selftest multi iommu
series as it is required for the hwpt_replace vfio selftest. It is part
of this series since the original code doesn't apply cleanly on the
base.
https://lore.kernel.org/all/20260505221518.619123-1-skhawaja@google.com/

Related Work:
Liveupdate IOMMU patch series:
https://lore.kernel.org/all/20260921004834.2601285-1-skhawaja@google.com/
Liveupdate IOMMU feature patchset breakdown:
https://docs.google.com/document/d/1enDn-uPE9U77U-xHEnzn6HHGKiePSAtMIP8EDU3NO0M

Samiullah Khawaja (3):
  vfio: selftests: Add support of creating iommus from iommufd
  vfio: selftests: Add iommufd hwpt replace test
  iommu/arm-smmu-v3: Add support for hitless replace of S1 domains

 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  66 ++++++-
 tools/testing/selftests/vfio/Makefile         |   1 +
 .../vfio/lib/include/libvfio/iommu.h          |   2 +
 .../lib/include/libvfio/vfio_pci_device.h     |   2 +
 tools/testing/selftests/vfio/lib/iommu.c      |  60 +++++-
 .../selftests/vfio/lib/vfio_pci_device.c      |  25 ++-
 .../vfio/vfio_iommufd_hwpt_replace_test.c     | 171 ++++++++++++++++++
 7 files changed, 316 insertions(+), 11 deletions(-)
 create mode 100644 tools/testing/selftests/vfio/vfio_iommufd_hwpt_replace_test.c


base-commit: 3d7783543c2646af69ad65825e810060494bea21
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


