Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E4CCAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 22:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DbXAa8qTsxyq1mEKjnb+++zhRcJBDvgJFncuYVQDFFE=; b=sx1osCz8jr5I21l14Pb0iB0+x1
	qwWTljwa2RkK/qrjQEZq8yQvoH3hJgdfogrJ55Z0m7oasI6kP9c7XRb7ULgK+DXEcYSiU3X23dY2K
	2cBEpc/sNdF8Rs3gDtsE1nE8+l6fVJYAqA1QvOasbyhon48Wgrt16wYMCVK62WY+EhDzWHKBY64SA
	o338pUQj6FZnd9WX2EyYz9lMdq2DZwkVNuTiGTCiAHjFE1q2vx/JLglyoUkvj0XkZsdfCKgyK8uV4
	Wcyc69vblFCOib1zbe9zZ4BxS075KDEEfEr7uyzRITloMF+66tiktlFuYA0l9Ad0qmr4BwcFtiS7h
	JWPFJkQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v06S9-0000000628V-2b4b;
	Sat, 20 Sep 2025 22:53:13 +0000
Received: from pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.83.148.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v06S7-0000000628A-0hlp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 22:53:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1758408791; x=1789944791;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DbXAa8qTsxyq1mEKjnb+++zhRcJBDvgJFncuYVQDFFE=;
  b=XXHTW6vMirXyJcfJDU/ZNdnA4ZeoZCHNgEK8tGYwMGnyAD3CUrBS650k
   Zi6rFsgg02F/cbbGfq62NjghX2oN6cbBH/vUdopysLP5vR+vxvX6xj0Jv
   pHEC7d6EGqF5aBVCxP+kDLlHW8CntXx4rcv8p0da7XCRSDWEqrLm5eB3r
   9EbB/130gJtOAuOqGXuMvhBSAm2isua684/YmCzdw6OaLsXBx/Im8AuLD
   ukJ/L6CiryJgid95S1O2uqFDjXP+nurvBK09CIKQA+Y3VYU46dkLowJAL
   goPzoXfoeji85BPjRu+HzNeJWdiV+L9LpXzCpR1Qz1e1YsdLjeRc1IVm1
   w==;
X-CSE-ConnectionGUID: zMA0ONwqTy6JSTQNaePjXQ==
X-CSE-MsgGUID: 3Ci37821TSaw+QF3eJWciQ==
X-IronPort-AV: E=Sophos;i="6.18,282,1751241600"; 
   d="scan'208";a="3249959"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2025 22:53:10 +0000
Received: from EX19MTAUWB001.ant.amazon.com [10.0.38.20:4911]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.11.168:2525] with esmtp (Farcaster)
 id 920169d4-e150-49a4-9281-68b82a9564ae; Sat, 20 Sep 2025 22:53:09 +0000 (UTC)
X-Farcaster-Flow-ID: 920169d4-e150-49a4-9281-68b82a9564ae
Received: from EX19D032UWA003.ant.amazon.com (10.13.139.37) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Sat, 20 Sep 2025 22:53:09 +0000
Received: from dev-dsk-ravib-2a-f2262d1b.us-west-2.amazon.com (10.169.187.85)
 by EX19D032UWA003.ant.amazon.com (10.13.139.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Sat, 20 Sep 2025 22:53:09 +0000
From: Ravi Kumar Bandi <ravib@amazon.com>
To: <mani@kernel.org>, <thippeswamy.havalige@amd.com>
CC: <lpieralisi@kernel.org>, <bhelgaas@google.com>,
	<linux-pci@vger.kernel.org>, <kwilczynski@kernel.org>, <robh@kernel.org>,
	<ravib@amazon.com>, <michal.simek@amd.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<stable@vger.kernel.org>
Subject: [PATCH v2] PCI: xilinx-xdma: Enable INTx interrupts
Date: Sat, 20 Sep 2025 22:52:32 +0000
Message-ID: <20250920225232.18757-1-ravib@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <C47CF283-C0C4-4ACF-BE07-3E87153D6EC6@amazon.com>
References: <C47CF283-C0C4-4ACF-BE07-3E87153D6EC6@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.169.187.85]
X-ClientProxiedBy: EX19D043UWA003.ant.amazon.com (10.13.139.31) To
 EX19D032UWA003.ant.amazon.com (10.13.139.37)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_155311_249964_426BE74D 
X-CRM114-Status: GOOD (  10.50  )
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

The pcie-xilinx-dma-pl driver does not enable INTx interrupts
after initializing the port, preventing INTx interrupts from
PCIe endpoints from flowing through the Xilinx XDMA root port
bridge. This issue affects kernel 6.6.0 and later versions.

This patch allows INTx interrupts generated by PCIe endpoints
to flow through the root port. Tested the fix on a board with
two endpoints generating INTx interrupts. Interrupts are
properly detected and serviced. The /proc/interrupts output
shows:

[...]
32:        320          0  pl_dma:RC-Event  16 Level     400000000.axi-pcie, azdrv
52:        470          0  pl_dma:RC-Event  16 Level     500000000.axi-pcie, azdrv
[...]

Changes since v1::
- Fixed commit message per reviewer's comments

Fixes: 8d786149d78c ("PCI: xilinx-xdma: Add Xilinx XDMA Root Port driver")
Cc: stable@vger.kernel.org
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


