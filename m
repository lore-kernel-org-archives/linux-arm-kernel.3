Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2CBFC61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 20:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cpLSBuC+E8aobgAqZmKJzRUHagXCt7KKlRBB3npOB64=; b=HhYVbnDPBCZo1t
	iKPQMF2YSXzaMTaLsdmFxQ4ZYe4NPwXVRquUfnV1NF2tyw2JVn5blIkmhzNqDx3eLsy5gedCRu13w
	1DRm3JLVpohnfDDFsvYYcn6Fe08pX3i07rsYMH//06AY9StaNO9cU8u/3mPhgj8fsntk2Y70iOlbH
	s8YT4lN0SLEmXjxj3gOGUYC+bIwszqTv5C1W4C24nyZ9HgoXn3oHPuIVyuJCDz4cN5qWMUJK3x6FV
	izzsXDlMsnqRaxdK0LA61br6YL3JXGu+y81gWoqlrSTawL9b+vnYNdGr0ekV65fepl06c37W1msDY
	T4OUg3lUWIpUF87Q7PHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyyCt-00000001SMl-49di;
	Tue, 25 Aug 2026 20:57:19 +0000
Received: from out13-173.antispamcloud.com ([185.201.17.173])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyyCn-00000001SJi-0UNb;
	Tue, 25 Aug 2026 20:57:14 +0000
Received: from s1041.use1.mysecurecloudhost.com ([192.250.231.249])
	by mx321.antispamcloud.com with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <dan@reactivated.net>)
	id 1wyyCZ-009xle-Fs; Tue, 25 Aug 2026 22:57:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=reactivated.net; s=default; h=Cc:To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cpLSBuC+E8aobgAqZmKJzRUHagXCt7KKlRBB3npOB64=; b=zQviRFtKh/8YZ2c8KHYJCFKdlY
	DCD/7IPbfV6uqnylKoOjdGkPkSu21oU2nrslqHnwJARJgNEgApiAjtSZWg2l0eFIpYhw3aAn6U7A0
	FZr9aJaWnesuv6hDVQDaXyfJi9SN+rh+NJWkS2aIAXNuqBCenLIBadlVl9equCcaob/klt/ZG33fa
	acFWy+GzTIC0KPYpG0/PBL0nyBufZdcqirBXthoYWZYMdgHRlqU82cozWwMwVPBuD0saJysP0pfXP
	5FvTKbs0Tg08JfojeKut/tfu4DcmE+E7Jo/4zrYeVlEfI3vVWP+qu+PVCCmbpod807dR3KZs/rpvj
	SnEkLWOw==;
Received: from [188.251.249.2] (port=59110 helo=[192.168.1.123])
	by s1041.use1.mysecurecloudhost.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <dan@reactivated.net>)
	id 1wyyCU-00000007Cd8-09Ur;
	Tue, 25 Aug 2026 20:56:53 +0000
From: Daniel Drake <dan@reactivated.net>
Subject: [PATCH v3 0/5] Add support for Broadcom BCM2712 IOMMU driver
 (Raspberry Pi 5)
Date: Tue, 25 Aug 2026 21:56:03 +0100
Message-Id: <20260825-bcm2712-iommu-submit-v3-0-7f143e7289b6@reactivated.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WOywrCMBBFf6VkbTSdqm1d+R/iIo+xnUVSSdKgl
 P67iStBxNVw4N5zZ2EBPWFgp2phHhMFmlyGZlMxPUo3ICeTmYGAo2hr4EpbKJcma2ceZmUpckD
 Rd32Px4Pes1y9e7zR4629XDMrGZArL50ei2zyNJDbWRki+pIfKcTJP99fpLq0/gymmgveCayFN
 gYB5dmj1JGSjGi2DiMrswk+VND+UEFWCdi36qBFY7D7Vq3r+gLlcb1fKQEAAA==
X-Change-ID: 20260712-bcm2712-iommu-submit-2e09899e65c4
To: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Daniel Drake <dan@reactivated.net>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, nick.hollinghurst@raspberrypi.com, 
 james.quinlan@broadcom.com, Jason Gunthorpe <jgg@ziepe.ca>
X-Mailer: b4 0.14.3
X-Get-Message-Sender-Via: s1041.use1.mysecurecloudhost.com: authenticated_id: dan@reactivated.net
X-Authenticated-Sender: s1041.use1.mysecurecloudhost.com: dan@reactivated.net
X-Originating-IP: 192.250.231.249
X-Spampanel-Domain: s1041.use1.mysecurecloudhost.com
X-Spampanel-Username: 192.250.231.249
Authentication-Results: antispamcloud.com; auth=pass smtp.auth=192.250.231.249@s1041.use1.mysecurecloudhost.com
X-Spampanel-Outgoing-Class: ham
X-Spampanel-Outgoing-Evidence: Combined (0.02)
X-Recommended-Action: accept
X-Filter-ID: 9kzQTOBWQUFZTohSKvQbgI7ZDo5ubYELi59AwcWUnuWxZ4z+K0SsYecKmajJkiE5AtPVUGUwc9xb
 PbXl/pDNKyu2SmbhJN1U9FKs8X3+Nt06bFpPrNOlRAlE9AVLwR4uGVjKNnzF3nQoDoQtBifM84JL
 M0i5ZAms0EHrvcCaVIPIVc5Lh/a+JJ7Yb1vIHS6xGnT3EFAinyrilm9zau/FuzkQt9Nb4Ml7QXdk
 EetczWD7cCGtDjbxRVgnsKOrWMc2eB7itP8hgjDRserKv4bhb7ubyJcscJCC/8jhyq4eIIJWBb39
 uS1TjWG2Inx+Ts2QrtVmombMJ4e2pn5C0yBMHZ0fE47nEjvubMSTLAkKCKclZzoe+TZdeH39wA4E
 grA4pE2PuLHIFQdBY9qb1rRWgyz0f29FZkQs6Ir87R/YNAvbL7gn7cg/ncKT4Jhi7JGPV79+HhQj
 j2AkH4u5UFkTRlo13ce3Xej5zrLrDlrUb7wmoTKWTVsGGMhZRVCmIRoJlMi/vZEx6aInmoMMyr/s
 33Zt4GdNYyTX/X7B7SUQQSH/yZziw75by+iTgiMl2eZTwNNf3jVZ1t7MNzi+9mtXdcYdtz+LilaI
 cRzxSHsPf1xNvqoyeBHMAjnky60rsebZhbzbGoNZT29rPE3j/qXkv6fJ1NxNL0a1F3E3IuEAfWN3
 Vz3dprvOo8bxk32TaLk+n9x3u48OEqFYZkyf93j/Tr3oNoAKhBiuiLbPDtvi8Zmjo8/hf0s0lXyi
 VqJUFyRb3DYt+BDEJR1lgqmSCJDhQgPn3YWDL9HoZ+Axl9bXFVtcV6NNppLNhvVDbxsrIWXcWBsS
 3EZt9a+xyS/dOq7TUh0rsY4ll3PXMYLHfwOJg3lOWq9P2Hf7Hk2+luVK+SZvXFWCX8oNdggW7HE9
 XDTdSVKZQSfWLE7Y3p8Q274BB9VTYi2bf0F0JzgUQ/o6tR7CTmlEmFHXDY79bcwVYi8aCQo9dvH5
 wp0vjpaZ/24EttsutrsiZf2yiLmsJOFZ0cTaGZTlEmqqp+HcDRtShrxrNA4br2+mEmVJrJM4fd19
 PqjIyvGxWL1rN3cWjPD5viEZJolz8ClgrSFC0qV2pwUtO92lcKbdXd1aPKEJfyZsBP+3ojxAc8lp
 0sobbdB+F7B3Y8TjGBGmQjnZT0wGxghmQiiyHai0+C+cV2SwXGGBGRJoh9VoIekQHpwUfpYnEThm
 JIBq/vl4T589Eoyw88oKK0Ika8ptpD+DyUmjOrd9V8gCfM5qYM66Aew3AIgW0Z3i/nvATdPRNfRC
 ogKUBoiGk7+7TY+LxsYMBY14CoC2k4ZFj2kpuIv/9gSqTljzmaSLiwQzKw+6v3CaIMG6s7LqJEBr
 r4RYD5fnTwa0tMnLz6SKQpgZ8zVbGmL5ozttECcg597p245AIcvvY28Ycjy4wSMSEK+PR5fTi3Gd
 QSRgcacLvwDFqMcy5VN+FffUOcZk02F0dRgAVZw81E22mZaseAdYAUt3zF2gN7skM/50TVH1H/aA
 warQpYDOYx/6JtUORHHV0k7mR0VPG9HQWV7dXfBjXbvxH2nMLfV+SMGovieHnQDrcLDN17YMjSrM
 Y2oTcPJOcrZu7OKsSObGAqhi7iERbInMiTBIUBbQ/Dy6Ip5s2Cc9h6F0bzi9eJvFy172Pif4H4Ku
 78pBi/ZAqnPyI/BjXbvxH2nMLfV+SMGovie1ATPpp8i1sHWZQrJ+tLuI
X-Report-Abuse-To: spam@quarantine16.antispamcloud.com
X-Complaints-To: abuse@master.antispamcloud.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_135713_326965_85DD781B 
X-CRM114-Status: GOOD (  21.09  )
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

Hi,

This series adds a driver for the Broadcom BCM2712 IOMMU found on
Raspberry Pi 5, and hooks up the display controller IOMMU for efficient
management of graphics memory. This is adapted from the downstream driver
from Raspberry Pi (original author Nick Hollinghurst), with main changes:
 - In page mapping mode, operate the translation aperture from address 0,
   with no bypass window. More like a IOMMU and less like a GART.
 - Implement the page table management using generic_pt
 - Support 4MB hugepage mapping in top level page table
 - Implement brcm,iommu-cache as standards-compliant DT property
 - Drop the dma-iova-offset hack, used to work around some issue seen with
   dma-ranges. This will need to be investigated separately and solved
   properly. (It's not needed for display controller iommu support included
   here.)
 - Misc simplifications/standardisations/cleanups
 
The IOMMU works strictly with 4KB pages. This means that unfortunately
when the kernel is compiled with PAGE_SIZE=16KB (the Raspberry Pi 5
kernel default), 12KB is wasted in each page that is allocated for page
tables. I plan to address this in followup work.

It has been tested on Raspberry Pi 5 using a 3D-accelerated graphical
environment which causes plenty of IOMMU maps & unmaps.

Thanks for the review comments and discussion. Further feedback and
testing welcome!

Changes in v3:
- Switch from a aperture and bypass window GART-like approach
  to IOMMU-like 0-based translation
- Add 3 SW bits which seem unused (per the chipset docs); drop patch
  for NO_SW_BIT handling. This reduces the claimed address space, so I had
  to tweak a iommu_pt test accordingly.
- Disallow domain sharing across multiple hardware IOMMU instances
- Clear and flush local MMU TLB during domain attach
- Handle unattached domains safely during TLB sync
- Set cache platform driver data late during probe to prevent race condition
- Improved handling of cache flush timeouts
- Use format string for device name in iommu_device_sysfs_add()
- Use cleanup.h helpers for scope management
- Expand DT binding descriptions for IOMMU and IOMMUC
- Add iommus property to HVS display node in DT
- Drop iommuc back-compat with current RPi DT
- Link to v2: https://lore.kernel.org/r/20260727-bcm2712-iommu-submit-v2-0-0247b5c03de8@reactivated.net

Changes in v2:
- Use iommu_fwspec in xlate & probe_device
- Add blocked_domain support
- Simplify page size configuration between iommu driver and format
- Introduce PT_FEAT_NO_SW_BIT flag to allow formats to explicitly opt-in to
  a defensive flushing algorithm when no sw bit is available
- Implement 4MB pages at Level 1; this is more efficient and means the
  "allow full-table contiguous leaves in unit tests" commit has been
  dropped because it is no longer needed.
- Hardcode the aperture in an unused part of the address space, removing
  it from DT (it's a software-specific decision, not an attribute of the
  hardware), adding more explanatory comments
- Use pt_full_va_prefix to have the PT format operate within the aperture
  space, enabling use of IOMMU_PT_DOMAIN_OPS
- Add more dt-bindings explanation to brcm,iommu-cache and drop docs
  around the cache property used in RPi firmware (the driver still supports
  this however, for fw compat reasons)
- Correct iommu device address in bcm2712.dtsi
- Link to v1: https://lore.kernel.org/r/20260712-bcm2712-iommu-submit-v1-0-80e10cdde2ea@reactivated.net

---
Daniel Drake (5):
      iommu_pt: Fix test_pgsize_boundary() failure on narrow-OA formats
      dt-bindings: iommu: Add Broadcom BCM2712 IOMMU
      iommu/generic_pt: Add Broadcom BCM2712 page table format
      iommu: Add Broadcom BCM2712 IOMMU driver
      arm64: dts: broadcom: bcm2712: Add GPU IOMMU and IOMMU cache nodes

 .../bindings/iommu/brcm,bcm2712-iommu.yaml         |  52 ++
 .../bindings/iommu/brcm,bcm2712-iommuc.yaml        |  38 ++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi          |  15 +
 drivers/iommu/Kconfig                              |  15 +
 drivers/iommu/Makefile                             |   1 +
 drivers/iommu/bcm2712-iommu-cache.c                |  83 +++
 drivers/iommu/bcm2712-iommu-cache.h                |   9 +
 drivers/iommu/bcm2712-iommu.c                      | 556 +++++++++++++++++++++
 drivers/iommu/generic_pt/.kunitconfig              |   1 +
 drivers/iommu/generic_pt/Kconfig                   |  10 +
 drivers/iommu/generic_pt/fmt/Makefile              |   2 +
 drivers/iommu/generic_pt/fmt/bcm2712.h             | 288 +++++++++++
 drivers/iommu/generic_pt/fmt/defs_bcm2712.h        |  18 +
 drivers/iommu/generic_pt/fmt/iommu_bcm2712.c       |   6 +
 drivers/iommu/generic_pt/kunit_iommu_pt.h          |   2 +-
 include/linux/generic_pt/common.h                  |   6 +
 include/linux/generic_pt/iommu.h                   |  12 +
 17 files changed, 1113 insertions(+), 1 deletion(-)
---
base-commit: 47096fc3d064a07c0842f748b99ebf01be120f2b
change-id: 20260712-bcm2712-iommu-submit-2e09899e65c4

Best regards,
-- 
Daniel Drake <dan@reactivated.net>


