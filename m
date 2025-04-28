Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B899C3ABA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 07:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=j3ziubjMM4iDinkRWPpqOq279fOOole6d1gFV+rphZk=; b=ykUe94ioFynyla
	pfoW/bg2k+LPvY7kFc3zE0O09nQKS7+DL9RXlVHCkWbCd9GYPrwgULwK6q+qHPFixZFDEacl1F5ZO
	ZmtmblMNA+zYQOzLBfTBExATmO42VufXQkc3/FmGYkwqD2Aio+HbPGxwJ8AtCJTH2nMjKHtfC9waJ
	yTH+E6LSNrWBOPGOK5oUjXmWt1/J0YqT3f0JHhgEO+q8J5bd+ZCRoGC+LmSKqGd1EIFsE+yUVFClJ
	LTNMeBmL40gHSkhvew+TlYcafIuWSHEhASj5tbK2VlHzGk6EJdL94SPx0D1zxZq32jPa8osNjxpRA
	sbPWs7ziDlSlmUW2YNhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9IqB-00000005EgA-0PEP;
	Mon, 28 Apr 2025 07:23:47 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9InL-00000005E1J-04wa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 07:20:52 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53S7Ki9O3334061
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 02:20:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745824844;
	bh=j3ziubjMM4iDinkRWPpqOq279fOOole6d1gFV+rphZk=;
	h=From:To:Subject:Date;
	b=i3mVEHrAl64u6xIjvnBtDnJ+JjrjhuXGnPUCo7pVPv03G9yjJTIsQW2bfWUFEFOTz
	 7MRUPA1U7mjppe5IllSWrJB0FIJeBtcNpWaSlxbB9VDw9T5rgF9wc7glZ+ZceRYloH
	 SP9oRM3LS9hybOrIxaGB6bxawHDfy9GumJv+Re2g=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53S7KiCC003072
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Apr 2025 02:20:44 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Apr 2025 02:20:44 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Apr 2025 02:20:44 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [172.24.227.7])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53S7KdMZ068873;
	Mon, 28 Apr 2025 02:20:40 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <s-adivi@ti.com>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <praneeth@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>, <a-chavda@ti.com>
Subject: [PATCH 0/8] dmaengine: ti: Add support for BCDMA v2 and PKTDMA v2
Date: Mon, 28 Apr 2025 12:50:24 +0530
Message-ID: <20250428072032.946008-1-s-adivi@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_002051_217684_F3F90B27 
X-CRM114-Status: GOOD (  12.43  )
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

Sai Sree Kartheek Adivi (8):
  dt-bindings: dma: ti: Add document for K3 BCDMA V2
  dt-bindings: dma: ti: Add document for K3 PKTDMA V2
  drivers: dma: ti: Refactor TI K3 UDMA driver
  dmaengine: ti: k3-psil-am62l: Add AM62Lx PSIL and PDMA data
  drivers: soc: ti: k3-ringacc: handle absence of tisci
  dmaengine: ti: New driver for K3 BCDMA_V2
  dmaengine: ti: k3-udma-v2: Add support for PKTDMA V2
  dmaengine: ti: k3-udma-v2: Update glue layer to support PKTDMA V2

 .../bindings/dma/ti/k3-bcdma-v2.yaml          |   97 +
 .../bindings/dma/ti/k3-pktdma-v2.yaml         |   73 +
 drivers/dma/ti/Kconfig                        |   14 +-
 drivers/dma/ti/Makefile                       |    4 +-
 drivers/dma/ti/k3-psil-am62l.c                |  132 +
 drivers/dma/ti/k3-psil-priv.h                 |    1 +
 drivers/dma/ti/k3-psil.c                      |    1 +
 drivers/dma/ti/k3-udma-common.c               | 2974 +++++++++++++
 drivers/dma/ti/k3-udma-glue.c                 |   91 +-
 drivers/dma/ti/k3-udma-private.c              |   48 +-
 drivers/dma/ti/k3-udma-v2.c                   | 1513 +++++++
 drivers/dma/ti/k3-udma.c                      | 3751 ++---------------
 drivers/dma/ti/k3-udma.h                      |  571 ++-
 drivers/soc/ti/k3-ringacc.c                   |  162 +-
 include/linux/soc/ti/k3-ringacc.h             |    7 +
 15 files changed, 5873 insertions(+), 3566 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dma/ti/k3-bcdma-v2.yaml
 create mode 100644 Documentation/devicetree/bindings/dma/ti/k3-pktdma-v2.yaml
 create mode 100644 drivers/dma/ti/k3-psil-am62l.c
 create mode 100644 drivers/dma/ti/k3-udma-common.c
 create mode 100644 drivers/dma/ti/k3-udma-v2.c

-- 
2.34.1


