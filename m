Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA99C83F20
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Jul 2025 11:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ai364oIW0GIV6B01LL+dC4X0QE3Rv5aY/QRzCb2lB/Y=; b=Fx19qXExMnXP2Rta4jFzOaCURA
	hiuTxBuw9OW6ZvLE151S91rFy97JMLQVjdtcEvqIZounpFxqb8CpfxM0hc1sMlQiutiyv1OJKBBDR
	nEq2S+aWxNhyic/imZ5495XyN/4jRzFAaF4FkGr8ixi6U1CJxyT/Ua1vo2VvswJ/BDKoOAbvnZoLS
	jrlK9xpEjXje4tK7QD6D4mlAlZWuHyJnP8mW3LeuwSqHNNBy+BWeZ87w+XHb+YRWT8xuAV92/kxtO
	p9nGDOfVY6hhrZDUmiQtcA/rsiktqVC5MEmcRBAzzwDqyaLl86ljLbuf1R847NhNavYx6RqB0p9M/
	nyMPP09g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaYmN-0000000GcM1-2hjD;
	Sat, 12 Jul 2025 11:52:31 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaYjy-0000000GcEb-3C43
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Jul 2025 11:50:04 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 3C1D825D28;
	Sat, 12 Jul 2025 13:49:58 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UdEQUmxa2Ljx; Sat, 12 Jul 2025 13:49:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1752320997; bh=S+tYkmbasYOAVw0o6YkfoWz4FtmHaFsF4csZGWOvnmk=;
	h=From:Date:Subject:To:Cc;
	b=IAslfoZLT3WCtll3Oqe0CeZ14PDMLkGO+Mkzk+z9CLeJ9LNnX9w8mT+z/85MxOvya
	 F0fBcPK6ZCCyHEZHD+skxRk0J3rrJyWj3NuBbHYp7s7OnT4IGbdq6BC3huxAGyD+Mq
	 piYjNY+QfL6zgFBqY5zMvTBrfLXFMfWLRiSBjmhvzRM+mou1OhgdJ+8zLlDoCspGt3
	 ZRWCSNaQUAOJuJvR7L8vmPAOJMUFuD4NJVzDamzwMLVHJV/7VINa624PryIQoq2djV
	 6BVztx3RX2wPI5X/RJjmxaOkjNUMRCg3AEYo+viyXjckO5MMf9VZ18m2e4Nsn653i+
	 bARP1Jm/ZwsBA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sat, 12 Jul 2025 17:19:30 +0530
Subject: [PATCH] iommu/exynos: add support for reserved regions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250712-exynos-sysmmu-resv-regions-v1-1-e79681fcab1a@disroot.org>
X-B4-Tracking: v=1; b=H4sIAMlLcmgC/x2MMQqAMAwAvyKZDWjAUv2KOIiNNYNVGhRF/LvB5
 eCGuweUs7BCVzyQ+RSVLZnUZQHTMqbIKMEcqKKmctQiX3faFPXWdT0ws56GaJWic/VM3reBQgM
 22DPPcv3zfnjfDywU1kRsAAAA
X-Change-ID: 20250629-exynos-sysmmu-resv-regions-661f2889d2d5
To: Marek Szyprowski <m.szyprowski@samsung.com>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752320988; l=1824;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=S+tYkmbasYOAVw0o6YkfoWz4FtmHaFsF4csZGWOvnmk=;
 b=XrB80dr8a+JpILdcBo5C8ky8eoGj9SFiZjVCtse37Zu1p3PeiZQKE+VHre362XvQFhPjcTFZo
 rQBP0wI1zv3AWTuPsfcXTXWutuy7l58dImvg6ZriUEHbco9XIsfAiW1
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_045003_206756_45F03882 
X-CRM114-Status: GOOD (  12.15  )
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

The bootloader configures a reserved memory region for framebuffer,
which is protected by the IOMMU. The kernel-side driver is oblivious as
of which memory region is set up by the bootloader. In such case, the
IOMMU tries to reference the reserved region - which is not reserved in
the kernel anymore - and it results in an unrecoverable page fault. More
information about it is provided in [1].

Add support for reserved regions using iommu_dma_get_resv_regions().
For OF supported boards, this requires defining the region in the
iommu-addresses property of the IOMMU owner's node.

Link: https://lore.kernel.org/r/544ad69cba52a9b87447e3ac1c7fa8c3@disroot.org [1]
Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/iommu/exynos-iommu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index b62a8f35c3e8516ead6a41f92dc7c8dc057986a8..b6edd178fe25e7c258cc82c47e9170fb4db74064 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -22,6 +22,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
 
+#include "dma-iommu.h"
 #include "iommu-pages.h"
 
 typedef u32 sysmmu_iova_t;
@@ -1479,6 +1480,7 @@ static const struct iommu_ops exynos_iommu_ops = {
 	.device_group = generic_device_group,
 	.probe_device = exynos_iommu_probe_device,
 	.release_device = exynos_iommu_release_device,
+	.get_resv_regions = iommu_dma_get_resv_regions,
 	.of_xlate = exynos_iommu_of_xlate,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
 		.attach_dev	= exynos_iommu_attach_device,

---
base-commit: a62b7a37e6fcf4a675b1548e7c168b96ec836442
change-id: 20250629-exynos-sysmmu-resv-regions-661f2889d2d5

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>


