Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E59C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 07:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7CLXLC7MVj4scEsCPqw9iSgDh+If7rXEteChEkvr7gM=; b=SgQnkbRf2+UoOv
	gEeMZcOsK78noF5kqQGVrAug+goOFQKHzTP+v/bhw3qs2EBcR2dMmz+i6ea2qkWOfTIbuZG+Ks5S+
	Vp66TRxsZtZOzkRFGk96JcWGLjoW+km2yVllkCUycf/EC/hDgh58t1+/J5jLyF+WFMS+JCE4Jqghc
	WYNmfZRm0oxWduN6RxpIKUfFPwpNthLCehLXgjffig10UdERnZ/BcMXXTvoSLSeE3MA+5gxXsSZ10
	a4h5JIDAVPpB6GSa6Dmhfx4G82vrEtbI9NrwPtF0FohRJ+IWSMTNnyzwv5qxon8mEkc8UNBiQUUIp
	P6N9U8u6rKYEMZnT9mcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPcCF-0000000CPzE-1MAh;
	Thu, 12 Jun 2025 07:17:59 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPcA7-0000000CPSm-2WdU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 07:15:49 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55C7FZo62800406;
	Thu, 12 Jun 2025 02:15:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749712535;
	bh=7CLXLC7MVj4scEsCPqw9iSgDh+If7rXEteChEkvr7gM=;
	h=From:To:Subject:Date;
	b=P5uJgp4ER1EQO32MzEzXkJYFlCNlt6N49nGJbeOLzYSNRrUb2l6Kxd/4qdg69dqta
	 5GDulYGBGThjE6YyWo+ClOwtvqJiEMMWO/YyDi8kP/1TH8Cr6MYyO+c3OjKYevzH8p
	 eRQ5zFdAyEOudGUdDPACQnwkAjFWXPHtYnXOQF1E=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55C7FZNK1618419
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 12 Jun 2025 02:15:35 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 12
 Jun 2025 02:15:34 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 12 Jun 2025 02:15:34 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [172.24.227.7])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55C7FTKM1608959;
	Thu, 12 Jun 2025 02:15:30 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
        Santosh
 Shilimkar <ssantosh@kernel.org>,
        Sai Sree Kartheek Adivi <s-adivi@ti.com>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <praneeth@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>, <a-chavda@ti.com>,
        <p-mantena@ti.com>
Subject: [PATCH v2 00/17] dmaengine: ti: Add support for BCDMA v2 and PKTDMA v2
Date: Thu, 12 Jun 2025 12:45:04 +0530
Message-ID: <20250612071521.3116831-1-s-adivi@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_001547_772852_642871AD 
X-CRM114-Status: GOOD (  15.68  )
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

This series adds support for the BCDMA_V2 and PKTDMA_V2 which is
introduced in AM62L.

The key differences between the existing DMA and DMA V2 are:
- Absence of TISCI: Instead of configuring via TISCI calls, direct
  register writes are required.
- Autopair: There is no longer a need for PSIL pair and instead AUTOPAIR
  bit needs to set in the RT_CTL register.
- Static channel mapping: Each channel is mapped to a single peripheral.
- Direct IRQs: There is no INT-A and interrupt lines from DMA are
  directly connected to GIC.
- Remote side configuration handled by DMA. So no need to write to PEER
  registers to START / STOP / PAUSE / TEARDOWN.

Changes from v1 to v2:
- Split refactoring of k3-udma driver into multiple commits
- Fix bcdma v2 and pktdma v2 dt-binding examples
- Fix compatibles in k3-udma-v2.c
- move udma_is_desc_really_done to k3-udma-common.c as the difference
  between k3-udma and k3-udma-v2 implementation is minor.
- remove udma_ prefix to function pointers in udma_dev
- reorder the commits to first refactor the existing code completely and
  then introduce k3-udma-v2 related commits.
- remove redundant includes in k3-udma-common.c
- remove ti_sci_ dependency for k3_ringacc in Kconfig
- refactor setup_resources functions to remove ti_sci_ code from common
  logic.
link to v1: https://lore.kernel.org/linux-arm-kernel/20250428072032.946008-1-s-adivi@ti.com/

Sai Sree Kartheek Adivi (17):
  dmaengine: ti: k3-udma: move macros to header file
  dmaengine: ti: k3-udma: move structs and enums to header file
  dmaengine: ti: k3-udma: move static inline helper functions to header
    file
  dmaengine: ti: k3-udma: move descriptor management to k3-udma-common.c
  dmaengine: ti: k3-udma: move ring management functions to
    k3-udma-common.c
  dmaengine: ti: k3-udma: Add variant-specific function pointers to
    udma_dev
  dmaengine: ti: k3-udma: move udma utility functions to
    k3-udma-common.c
  dmaengine: ti: k3-udma: move resource management functions to
    k3-udma-common.c
  dmaengine: ti: k3-udma: refactor resource setup functions
  dmaengine: ti: k3-udma: move inclusion of k3-udma-private.c to
    k3-udma-common.c
  drivers: soc: ti: k3-ringacc: handle absence of tisci
  dt-bindings: dma: ti: Add document for K3 BCDMA V2
  dt-bindings: dma: ti: Add document for K3 PKTDMA V2
  dmaengine: ti: k3-psil-am62l: Add AM62Lx PSIL and PDMA data
  dmaengine: ti: k3-udma-v2: New driver for K3 BCDMA_V2
  dmaengine: ti: k3-udma-v2: Add support for PKTDMA V2
  dmaengine: ti: k3-udma-v2: Update glue layer to support PKTDMA V2

 .../bindings/dma/ti/k3-bcdma-v2.yaml          |   97 +
 .../bindings/dma/ti/k3-pktdma-v2.yaml         |   73 +
 drivers/dma/ti/Kconfig                        |   14 +-
 drivers/dma/ti/Makefile                       |    6 +-
 drivers/dma/ti/k3-psil-am62l.c                |  132 +
 drivers/dma/ti/k3-psil-priv.h                 |    1 +
 drivers/dma/ti/k3-psil.c                      |    1 +
 drivers/dma/ti/k3-udma-common.c               | 2556 ++++++++++++++
 drivers/dma/ti/k3-udma-glue.c                 |   91 +-
 drivers/dma/ti/k3-udma-private.c              |   48 +-
 drivers/dma/ti/k3-udma-v2.c                   | 1479 ++++++++
 drivers/dma/ti/k3-udma.c                      | 3088 +----------------
 drivers/dma/ti/k3-udma.h                      |  583 ++++
 drivers/soc/ti/Kconfig                        |    1 -
 drivers/soc/ti/k3-ringacc.c                   |  183 +-
 include/linux/soc/ti/k3-ringacc.h             |   20 +
 16 files changed, 5336 insertions(+), 3037 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dma/ti/k3-bcdma-v2.yaml
 create mode 100644 Documentation/devicetree/bindings/dma/ti/k3-pktdma-v2.yaml
 create mode 100644 drivers/dma/ti/k3-psil-am62l.c
 create mode 100644 drivers/dma/ti/k3-udma-common.c
 create mode 100644 drivers/dma/ti/k3-udma-v2.c


base-commit: 475c850a7fdd0915b856173186d5922899d65686
-- 
2.34.1


