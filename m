Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B61C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 05:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=thXEi42zzT+vMpTeFbti/z/XwFIVsRaaywxBqv7gdEs=; b=cU1P+pTMQZp7P9cUrVMeu99gzs
	rvCeG3v/30g/FkJSE5gkvCm0xJOdXcnEvBgGo0wn2PDTJxW0X1a74I9FhVlwmvFp0XphdDH/9VmtY
	X6i+1zVBCh3e4BuXAYwpv9ysR1Eyd+tY+utqnSPUifj4PtJO7ITLQyjPi1NkEsWi8LJ2UPkBOf2JJ
	L/uRBXtiw45dWsOj0BINwvS0U9PrvISRn0+m/iQPdeq3Jn13Wfo6I9ss+s7o+SzWjh9uF15k8jple
	JY3BGVLgfk/vHzO5AG1EIfgNKqaF+1wv5ovXqlHqiuJN7N67QNdAqPV9Had1NYOoCI45UAT0YBwa9
	kVRFVVag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubuuv-00000006obD-3V2j;
	Wed, 16 Jul 2025 05:42:57 +0000
Received: from mta-64-228.siemens.flowmailer.net ([185.136.64.228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubusR-00000006o1k-0EUy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 05:40:24 +0000
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 2025071605401897d9018816d6742925
        for <linux-arm-kernel@lists.infradead.org>;
        Wed, 16 Jul 2025 07:40:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=huaqian.li@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=thXEi42zzT+vMpTeFbti/z/XwFIVsRaaywxBqv7gdEs=;
 b=gg0dJzJNg2YH/f3t2xpZg6J1D4TmNWJNBEveOqWVVgsYy7mHibAbKiOh6piLUwZsQ1guSV
 +EOKfX2a0fvH/jKEaWosn6w5kGEJ4Qerbs2D8meqoTeuAunF75Rh3UwOJbgNqMPY6abKbxrp
 A4BwUdxYKHhIBOxM8yumVFyhW9Yo7HufqCTakM4himCsVM1tGrvUZtM9BtTabj+exWb2EYsq
 0yVOn+RN6on4++hfDblgpoamDkU269/FP8jGH20aj6ozwO+kf3aUhjnl3t7YcnyDAImwnS/7
 2WaE+QHPUIYjccf7+hhpaNR548PD4raFyUVB2KgiTMFj58mnhbrdNf9g==;
From: huaqian.li@siemens.com
To: s-vadapalli@ti.com
Cc: baocheng.su@siemens.com,
	bhelgaas@google.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	diogo.ivo@siemens.com,
	helgaas@kernel.org,
	huaqian.li@siemens.com,
	jan.kiszka@siemens.com,
	kristo@kernel.org,
	krzk+dt@kernel.org,
	kw@linux.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	lpieralisi@kernel.org,
	nm@ti.com,
	robh@kernel.org,
	ssantosh@kernel.org,
	vigneshr@ti.com
Subject: [PATCH v9 (RESEND) 0/7] soc: ti: Add and use PVU on K3-AM65 for DMA isolation
Date: Wed, 16 Jul 2025 13:39:43 +0800
Message-Id: <20250716053950.199079-1-huaqian.li@siemens.com>
In-Reply-To: <e21c6ead-2bcb-422b-a1b9-eb9dd63b7dc7@ti.com>
References: <e21c6ead-2bcb-422b-a1b9-eb9dd63b7dc7@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-959203:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_224023_518876_6080374A 
X-CRM114-Status: GOOD (  18.50  )
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

From: Li Hua Qian <huaqian.li@siemens.com>

[Resending v9 due to formatting issue in previous cover letter]

Changes in v9:
 - Update commit message (patch 4) to remove ambiguous extension claims
   based on upstream feedback

Changes in v8:
 - remove patch 8 from this series to simplify the patchset
 - fix dt_bindings_check warnings (patch 2), 'memory-region' must
   not be a required property

Changes in v7:
 - add schema expressing dependency as suggested on pci-host bindings
 - resolve review comments on pci-keystone driver
 - add a new patch to make IO_TLB_SEGSIZE configurable
 - improve patches based on checkpath.pl

Changes in v6:
 - make restricted DMA memory-region available to all pci-keystone
   devices, moving property to unconditional section (patch 2)

Changes in v5:
 - resolve review comments on pci-host bindings
 - reduce DMA memory regions to 1 - swiotlb does not support more
 - move activation into overlay (controlled via firmware)
 - use ks_init_vmap helper instead of loop in
   rework ks_init_restricted_dma
 - add more comments to pci-keystone
 - use 2 chained TLBs of PVU to support maximum of swiotlb (320 MB)

Changes in v4:
 - reorder patch queue, moving all DTS changes to the back
 - limit activation to IOT2050 Advanced variants
 - move DMA pool to allow firmware-based expansion it up to 512M

Changes in v3:
 - fix ti,am654-pvu.yaml according to review comments
 - address review comments on ti,am65-pci-host.yaml
 - differentiate between different compatibles in ti,am65-pci-host.yaml
 - move pvu nodes to k3-am65-main.dtsi
 - reorder patch series, pulling bindings and generic DT bits to the front

Changes in v2:
 - fix dt_bindings_check issues (patch 1)
 - address first review comments (patch 2)
 - extend ti,am65-pci-host bindings for PVU (new patch 3)

Only few of the K3 SoCs have an IOMMU and, thus, can isolate the system
against DMA-based attacks of external PCI devices. The AM65 is without
an IOMMU, but it comes with something close to it: the Peripheral
Virtualization Unit (PVU).

The PVU was originally designed to establish static compartments via a
hypervisor, isolate those DMA-wise against each other and the host and
even allow remapping of guest-physical addresses. But it only provides
a static translation region, not page-granular mappings. Thus, it cannot
be handled transparently like an IOMMU.

Now, to use the PVU for the purpose of isolated PCI devices from the
Linux host, this series takes a different approach. It defines a
restricted-dma-pool for the PCI host, using swiotlb to map all DMA
buffers from a static memory carve-out. And to enforce that the devices
actually follow this, a special PVU soc driver is introduced. The driver
permits access to the GIC ITS and otherwise waits for other drivers that
detect devices with constrained DMA to register pools with the PVU.

For the AM65, the first (and possibly only) driver where this is
introduced is the pci-keystone host controller. Finally, this series
provides a DT overlay for the IOT2050 Advanced devices (all have
MiniPCIe or M.2 extension slots) to make use of this protection scheme.
Application of this overlay will be handled by firmware.

Due to the cross-cutting nature of these changes, multiple subsystems
are affected. However, I wanted to present the whole thing in one series
to allow everyone to review with the complete picture in hands. If
preferred, I can also split the series up, of course.

Jan

Jan Kiszka (7):
  dt-bindings: soc: ti: Add AM65 peripheral virtualization unit
  dt-bindings: PCI: ti,am65: Extend for use with PVU
  soc: ti: Add IOMMU-like PVU driver
  PCI: keystone: Add support for PVU-based DMA isolation on AM654
  arm64: dts: ti: k3-am65-main: Add PVU nodes
  arm64: dts: ti: k3-am65-main: Add VMAP registers to PCI root complexes
  arm64: dts: ti: iot2050: Add overlay for DMA isolation for devices
    behind PCI RC

 .../bindings/pci/ti,am65-pci-host.yaml        |  28 +-
 .../bindings/soc/ti/ti,am654-pvu.yaml         |  51 ++
 arch/arm64/boot/dts/ti/Makefile               |   5 +
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi      |  38 +-
 ...am6548-iot2050-advanced-dma-isolation.dtso |  33 ++
 drivers/pci/controller/dwc/pci-keystone.c     | 106 ++++
 drivers/soc/ti/Kconfig                        |   4 +
 drivers/soc/ti/Makefile                       |   1 +
 drivers/soc/ti/ti-pvu.c                       | 500 ++++++++++++++++++
 include/linux/ti-pvu.h                        |  32 ++
 10 files changed, 791 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/ti/ti,am654-pvu.yaml
 create mode 100644 arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-dma-isolation.dtso
 create mode 100644 drivers/soc/ti/ti-pvu.c
 create mode 100644 include/linux/ti-pvu.h

-- 
2.34.1


