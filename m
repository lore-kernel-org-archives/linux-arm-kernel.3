Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F2CC624D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 17:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fSeUUKA3nTNwfm5ENMRqiqkBfeuykmsZI1m8L1YBJzE=; b=gjG61Sr4b49+GL
	7mJ4jnk7VjU2+EL5yYQA9xtcIkjYgf5U49VoEpTBddrDdMEdpH85XwJ0+tCNElyRcRc1R2fOO6wiD
	CW3qJnFSmGsHWUP9Ies0aJyrB5xMmaTKdP7+afB6/rLSlFTMtHrKKix/u+fuxhTiav7ZDgQqX9rWA
	5aTu9YTifQP6mwNT276nspJw2P32OUiOdJQ6FA37jtDer/D/d7Wn495vDV6NvxGn06z1xqnYCq96G
	AjgwxOi3t7FQLXU989IVgq2uJEDmbeGXkzEKtxhtj7i1Z0KORoB4tmqTBfI94GyA1WTL2AfPKuIHv
	T1hRXtMlo1ctvHjCV6lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1pDu-0000000FVta-0UXH;
	Wed, 02 Sep 2026 17:58:10 +0000
Received: from out12-31.antispamcloud.com ([185.201.16.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1pDm-0000000FVq2-3Cx7;
	Wed, 02 Sep 2026 17:58:04 +0000
Received: from s1041.use1.mysecurecloudhost.com ([192.250.231.249])
	by mx322.antispamcloud.com with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <dan@reactivated.net>)
	id 1x1pDa-009oKX-Qv; Wed, 02 Sep 2026 19:57:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=reactivated.net; s=default; h=Cc:To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=fSeUUKA3nTNwfm5ENMRqiqkBfeuykmsZI1m8L1YBJzE=; b=fELHqsIUWMrHInzAHXuTJQYrEJ
	S2gGss9JvWFOiUnjKU1DyuvjzfwkbeDzNaBsDE2BpUt1/ox9ifhJ+/7odArQP/35lTWB4pP0hs//O
	lXxwa1ZA0Mmx1oKUeba40ZUjYOobi8Pp6Phq8XlN4bW9Mb1OXbSXzEFf/pb0p1mcn2o0EQ/W92HJ/
	aHiXdNvV40UMV5PACfhMcthhzm69VF22yLHblP3qdZiu3Zn614f9JnezGzmAqwuGj+dPmVRMlKVmV
	DKDCM56xQXaU9S60Ryvk+woe9egO9ASWj+bTkxK9A/JLLv8biqX6mwaMmRcL2m/RzVbTMPpXjyTVs
	egORjy1Q==;
Received: from [188.251.249.2] (port=45118 helo=[192.168.1.123])
	by s1041.use1.mysecurecloudhost.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <dan@reactivated.net>)
	id 1x1pDQ-0000000F9KQ-0DV1;
	Wed, 02 Sep 2026 17:57:44 +0000
From: Daniel Drake <dan@reactivated.net>
Subject: [PATCH v4 0/5] Add support for Broadcom BCM2712 IOMMU driver
 (Raspberry Pi 5)
Date: Wed, 02 Sep 2026 18:57:02 +0100
Message-Id: <20260902-bcm2712-iommu-submit-v4-0-9dbb657578c1@reactivated.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XOy24DIQwF0F+JWJcWPA+YrvofURc8nIwXMBUQ1
 Ciafy9k00pt1JV1Jd9j31jGRJjZ6+HGElbKtMUWxqcDc6uJZ+TkW2YgYBZKArcuQJ+0hXDh+WI
 DFQ4oFr0sOE9uZK36kfBEn3f2+N6yNRm5TSa6tWNbojPFl2BywdT3V8plS9f7F1X21j8Hq+SCa
 4FSOO8R0LwlNK5QNQX9c8TC+tkKPyhQDyholIBR2cmJwaP+mxq+KQ3TA2polDrJcUAFerHzb2r
 f9y8lXj93dAEAAA==
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
 james.quinlan@broadcom.com, Jason Gunthorpe <jgg@ziepe.ca>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Get-Message-Sender-Via: s1041.use1.mysecurecloudhost.com: authenticated_id: dan@reactivated.net
X-Authenticated-Sender: s1041.use1.mysecurecloudhost.com: dan@reactivated.net
X-Originating-IP: 192.250.231.249
X-Spampanel-Domain: s1041.use1.mysecurecloudhost.com
X-Spampanel-Username: 192.250.231.249
Authentication-Results: antispamcloud.com; auth=pass smtp.auth=192.250.231.249@s1041.use1.mysecurecloudhost.com
X-Spampanel-Outgoing-Class: ham
X-Spampanel-Outgoing-Evidence: SB/global_tokens (0.00692368605726)
X-Recommended-Action: accept
X-Filter-ID: 9kzQTOBWQUFZTohSKvQbgI7ZDo5ubYELi59AwcWUnuU6IoMZj0ku3K1HgThUUXgPtBBzBbzlGD49
 sIXR0NIg/Cu2SmbhJN1U9FKs8X3+Nt06bFpPrNOlRAlE9AVLwR4uGVjKNnzF3nQoDoQtBifM84JL
 M0i5ZAms0EHrvcCaVIOQFUySu9ARleHX62tRH9C5GnT3EFAinyrilm9zau/FuzkQt9Nb4Ml7QXdk
 EetczWBpY9ovdkP9RmEvieRDWoEFGZ7f+7oeClYYrL6OxfWC1jM0MOKiGRkxO3FaI58br05WBb39
 uS1TjWG2Inx+Ts2QrtVmombMJ4e2pn5C0yBMHZ0fE47nEjvubMSTLAkKCKefuLbx+lGq0svfyhth
 j0R6Iny++hg9dJLqN5zmWqF/oHgMZXS6X/fIHYslsKU0yPHM4JpSMI47HiFQBsGlm5AyJ9N3+CB9
 4aFbAhtG8w3Ly5ZVKmISsN3IhGLWYd0758XIiXx6YYOeazosCcxmb7RWPITtorGl87DPy4ds+UWq
 MS944fSN2oL9lcmwHl4R430gWQeQATOYm6ySgXONX819+8b0aQ27w+hy2d/X8QeMESKGfu1osKm2
 z/Bdw0WxPvopVqK+B3hjSiRP+JZcbkTFzNuDg9qhrek1VDTOXu3/5XoFh6RYK1/+a9o0ZH3bf8f8
 xcFeTwPmaNR5BFrITq53GE8UfvLOtVSfYvM2D2LXw9qhHVjuF0QV44wjOm4hi9B7sw5YCbsONrFQ
 WlQL6bayw8t26zvWPQFaoPrSpXmTFh32t1ZYEmdcjX8wYIo2PJ6ZWoal85B1uSKsQvqgKX57+mzi
 mzSSBDh/9T7i+I1Xis3FgAfjcrAC8tdf23eCIzSdDUG3JlDn+YPgrv/L9kYIY6/c3932aFiFp+4w
 26sCeFNiLZt/QXQnOBRD+jq1HsIm8VQhYAy23VHBYHJQltbzHyxxk8Sjs3o9/k8nLBnptMQCOWuC
 bp8r+cerZqUKxFfVRXLKIImNTAr8iSBcPgsmF70Rz40u8PylAVmBlaDrHdDswAAELtTYsl4eOccq
 tK3P9P7Dwawiagy4cvFL3pjltGILrmkElozHQFHLOT6kywhk7Qhq1ru3jSBu1ukDxYBdCKDGFJnk
 5eJFcFklVb9231/E3ahF5MMcDI7KdpjQKdEz/+/QkUVhwSqO+QS+xjCZ3JKVmi72ocgY5kMQSjs7
 CnU3Vkswnvz2sY575f5VZdC7A9EkfupFeybqiokSL/UoBa9Z74L1QD5u7fk/CB2ffOy/knOaqu9M
 jU02vQscbIqmk3QOioOvfgVRYRzDfnj2cyXvG6T1rC4we7GtQUEfApXkqR1zbB61q8XRB6X1AhY+
 C3NKVBiu9E09fH2QcWWDSTfRyaGsL+KZNwpYGCN6yCqJqJMY7uMzxq3+Ecx6Ww+vAj0HbLbveTIz
 fDDueIdjUxTaa0dmGx2m78JeU6J5dQk8TiQJh7U9utxWE7LPn/i77ggylKR9SqeqhKXDH+fel0T7
 gNOckPwEpnIVjB7SPAlbDjazCbhs7qBpykynMlI8ehauFjA7dVMOTKcW5c6UnY64mAykh3LBvXwi
 LIjlrjIuKSKddsFYTaIZy4Zvun7pGU7uz9Qh2BYl/pOFic8JjqapLpwrwdUQz9MPWEmV3jR5NeVa
 JQBh0uawl0Cg8hPs+cRD5TJxNzOPadp3mtqXN3cCIyIm263/n4zqghav48Y+3YiJRbPwEKhVXmMF
 SH7pGU7uz9Qh2BYl/pOFic/qXKRF3uOx1VRdI9vLlOBy9jihx+Za/cV70jOJzN2r4A==
X-Report-Abuse-To: spam@quarantine16.antispamcloud.com
X-Complaints-To: abuse@master.antispamcloud.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_105802_959467_5445A59C 
X-CRM114-Status: GOOD (  22.18  )
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

Changes in v4:
- Add Jim Quinlan and Florian Fainelli as bindings maintainers
- Replace MMU register access macros with static inline functions
- Clear illegal address register and flush caches on blocking domain attach
- Add __must_hold annotations in TLB helpers
- Use BIT() macro for MMUC_CONTROL definitions
- Link to v3: https://lore.kernel.org/r/20260825-bcm2712-iommu-submit-v3-0-7f143e7289b6@reactivated.net

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

 .../bindings/iommu/brcm,bcm2712-iommu.yaml         |  54 ++
 .../bindings/iommu/brcm,bcm2712-iommuc.yaml        |  40 ++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi          |  15 +
 drivers/iommu/Kconfig                              |  15 +
 drivers/iommu/Makefile                             |   1 +
 drivers/iommu/bcm2712-iommu-cache.c                |  84 +++
 drivers/iommu/bcm2712-iommu-cache.h                |   9 +
 drivers/iommu/bcm2712-iommu.c                      | 577 +++++++++++++++++++++
 drivers/iommu/generic_pt/.kunitconfig              |   1 +
 drivers/iommu/generic_pt/Kconfig                   |  10 +
 drivers/iommu/generic_pt/fmt/Makefile              |   2 +
 drivers/iommu/generic_pt/fmt/bcm2712.h             | 288 ++++++++++
 drivers/iommu/generic_pt/fmt/defs_bcm2712.h        |  18 +
 drivers/iommu/generic_pt/fmt/iommu_bcm2712.c       |   6 +
 drivers/iommu/generic_pt/kunit_iommu_pt.h          |   2 +-
 include/linux/generic_pt/common.h                  |   6 +
 include/linux/generic_pt/iommu.h                   |  12 +
 17 files changed, 1139 insertions(+), 1 deletion(-)
---
base-commit: 786262be6048deab760f68c8acc2c85607165894
change-id: 20260712-bcm2712-iommu-submit-2e09899e65c4

Best regards,
-- 
Daniel Drake <dan@reactivated.net>


