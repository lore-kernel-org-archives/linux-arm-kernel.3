Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D862CCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 23:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KfKALAbjgmpFUExvcy5RcZ+OJFmwCOtZwZQBuvDSCqI=; b=feh7ZH9iv21ikg/j6g3xp5dLjy
	CQ6AhS0UbcfnzRf0sfqskKeOMLehHAstBz+cdwPURErCIPntKwS4pGYFaXBgC6txDOmONtMrPe53F
	CEp+5OlcBk0xpc0oRJuwgEnpBY340a5cNZ+cb24rMBJHI7nimxk6h3IeDrVCkAr6kpzrZzf6Dn+5z
	qWZVnMHWUNdfb44Hc1PbbgilEK0evlzJvIOwSkgUZ3KdA0iusOEsaQi3VBfwVqvSHLb6cY7gK2YKt
	wb4JfJygBcF4VoEBTNFiHaCpEmbhn1UpCRkhuOqWfkYFvF6+MT3kqRf/jlIVsow+6Sk/P/7g7EYsE
	hZTOdVzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzkIZ-00000004JFW-1OWf;
	Fri, 19 Sep 2025 23:13:51 +0000
Received: from pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.12.53.23])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzkIX-00000004JEp-0wHo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 23:13:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1758323629; x=1789859629;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KfKALAbjgmpFUExvcy5RcZ+OJFmwCOtZwZQBuvDSCqI=;
  b=lX/e/bPMpu6PBguWUJzvv9Frb3RY2QOinBxXhnWFupzUJ3YhA1yMqLmW
   fkcutSwj+Ry6WsBJD2zvV9AxQuvPvrVz3VHyDSb5pU3v/u7hluyyyFqzu
   g2YUwcXmRlycbDI5Iuns48TyTzH1KSEaJPTPIVGYtQlS1XOTBWmt+HzIr
   W/WiDseVUXUjTnoFsPUvlueKmOuGrRZ1fiStV9Z5va5MzfFSBpgsae/w2
   2r3Yx3GdotPZ7RlROuYX42JuBTlXlQbn3d2UmIiGMJUvTDyNtKrrN8u09
   9cDjbz5aocPLbkGuD/rnpRX8KVBXBxd5weCGOGIKjlFhiZSMBD/C6s0MF
   g==;
X-CSE-ConnectionGUID: svCWeSlkSVC/dSz++PPR0A==
X-CSE-MsgGUID: h8bxUliVSJGGD7+tUhRflA==
X-IronPort-AV: E=Sophos;i="6.18,279,1751241600"; 
   d="scan'208";a="3213750"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 23:13:46 +0000
Received: from EX19MTAUWC002.ant.amazon.com [10.0.21.151:10324]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.32.53:2525] with esmtp (Farcaster)
 id e14a9c00-d7d3-4833-b24c-5d2c4ebae526; Fri, 19 Sep 2025 23:13:46 +0000 (UTC)
X-Farcaster-Flow-ID: e14a9c00-d7d3-4833-b24c-5d2c4ebae526
Received: from EX19D032UWA003.ant.amazon.com (10.13.139.37) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Fri, 19 Sep 2025 23:13:45 +0000
Received: from dev-dsk-ravib-2a-f2262d1b.us-west-2.amazon.com (10.169.187.85)
 by EX19D032UWA003.ant.amazon.com (10.13.139.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Fri, 19 Sep 2025 23:13:45 +0000
From: Ravi Kumar Bandi <ravib@amazon.com>
To: <lpieralisi@kernel.org>, <mani@kernel.org>, <bhelgaas@google.com>,
	<linux-pci@vger.kernel.org>
CC: <kwilczynski@kernel.org>, <robh@kernel.org>, <michal.simek@amd.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] PCI: xilinx-xdma: Enable legacy interrupts
Date: Fri, 19 Sep 2025 23:13:30 +0000
Message-ID: <20250919231330.886-1-ravib@amazon.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.169.187.85]
X-ClientProxiedBy: EX19D044UWB002.ant.amazon.com (10.13.139.188) To
 EX19D032UWA003.ant.amazon.com (10.13.139.37)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_161349_317269_2060B855 
X-CRM114-Status: GOOD (  10.78  )
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

Starting with kernel 6.6.0, legacy interrupts from PCIe endpoints
do not flow through the Xilinx XDMA root port bridge because
interrupts are not enabled after initializing the port.

This issue is seen after XDMA driver received support for QDMA and
underwent relevant code restructuring of old xdma-pl driver to
xilinx-dma-pl (ref commit: 8d786149d78c).

This patch re-enables legacy interrupts to use with PCIe endpoints
with legacy interrupts. Tested the fix on a board with two endpoints
generating legacy interrupts. Interrupts are properly detected and
serviced. The /proc/interrupts output shows:
[...]
32:        320          0  pl_dma:RC-Event  16 Level     400000000.axi-pcie, azdrv
52:        470          0  pl_dma:RC-Event  16 Level     500000000.axi-pcie, azdrv
[...]

Signed-off-by: Ravi Kumar Bandi <ravib@amazon.com>
---
 drivers/pci/controller/pcie-xilinx-dma-pl.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/pci/controller/pcie-xilinx-dma-pl.c b/drivers/pci/controller/pcie-xilinx-dma-pl.c
index b037c8f315e4..cc539292d10a 100644
--- a/drivers/pci/controller/pcie-xilinx-dma-pl.c
+++ b/drivers/pci/controller/pcie-xilinx-dma-pl.c
@@ -659,6 +659,12 @@ static int xilinx_pl_dma_pcie_setup_irq(struct pl_dma_pcie *port)
 		return err;
 	}
 
+	/* Enable interrupts */
+	pcie_write(port, XILINX_PCIE_DMA_IMR_ALL_MASK,
+		   XILINX_PCIE_DMA_REG_IMR);
+	pcie_write(port, XILINX_PCIE_DMA_IDRN_MASK,
+		   XILINX_PCIE_DMA_REG_IDRN_MASK);
+
 	return 0;
 }
 
-- 
2.47.3


