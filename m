Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D9DFCD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 21:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/mgJaxjsUKNCc5mQk0mLWPO6Egk9qnKCndvJ4uafpjo=; b=IqpI1zaK45v24EsvfvqYr4JjVU
	0NPC17IWh6XIY4ylPK/egNLaJfoJJ65zX7zq/dKqsT+TvGPusKqz+JHKmPFeZmG6+Xv/Alb92e3dW
	mFKrG5hROElOZd3OL/PYuNxhRIsLZ1lB8iKlASONaEmkMhYRHTWu1yslaHSntM+mBzNAkPcQD4OOJ
	Pu0wytMUYjhe2q7xVjGXeLubaQ3egSW/SJafTa52IWtZ53g4jEmO3E6ATCVYm3Yu4MABkny6hJEu2
	TFfGrFNPXm1CgOnzwqyEud6/OtBUviWXZe7CnlFpxvLdNHJJkIP7A+6zrULWpi1ZXBKURGtMuYj0I
	exvE+BVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY9o2-0000000Bd5n-0K2U;
	Fri, 12 Jun 2026 21:52:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY9o0-0000000Bd5P-3InK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 21:52:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3D3E160008;
	Fri, 12 Jun 2026 21:52:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C08051F000E9;
	Fri, 12 Jun 2026 21:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781301167;
	bh=/mgJaxjsUKNCc5mQk0mLWPO6Egk9qnKCndvJ4uafpjo=;
	h=From:To:Cc:Subject:Date;
	b=CT98+UyTiOHRp1+zzntxdqkhzI0whaW/wo5sNpx0259IEDY1UFCVpwEuvuVTDkBiI
	 b1F2kt80KbMkA4pWRR8JvBs8jYvGU7mFyC1mf4+N+2akzT0JUT6xj7b2H0w9EF8F6k
	 ASv9qXLK7L1nhYnNaOtU0ExoOYFRYJlG1FXURJmQ3XwwKrWvTrcNJDxC8L1RukFr9O
	 aNOOL0nBUEjBz6RmSNx1vwlD/az1WfHeeyYRVkCxaBPGV1FLsorOPJC8+S5orfrJ8U
	 EjuDvcwHzqc4gzlN/EDR1EGP79Xo+gyiqKubtM8FfpmsHpumjW/OdNhSG9kQu3h4sD
	 lRsEeZvt/OLCw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Michal Simek <michal.simek@amd.com>
Cc: dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dmaengine: xilinx: Treat "xlnx,flush-fsync" as a flag
Date: Fri, 12 Jun 2026 16:52:32 -0500
Message-ID: <20260612215233.1887921-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The Xilinx DMA binding documents "xlnx,flush-fsync" as a boolean flag.
The driver read it as an integer cell and warned when it was absent,
which does not match the documented property encoding.

Use the boolean helper so the driver follows the binding. Leave
"xlnx,irq-delay" as an 8-bit property read because the hardware field
is 8 bits wide.

Assisted-by: Codex:gpt-5-5
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/dma/xilinx/xilinx_dma.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index 404235c17353..cbb23fd6e096 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -3262,11 +3262,8 @@ static int xilinx_dma_probe(struct platform_device *pdev)
 			goto disable_clks;
 		}
 
-		err = of_property_read_u32(node, "xlnx,flush-fsync",
-					   &xdev->flush_on_fsync);
-		if (err < 0)
-			dev_warn(xdev->dev,
-				 "missing xlnx,flush-fsync property\n");
+		xdev->flush_on_fsync =
+			of_property_read_bool(node, "xlnx,flush-fsync");
 	}
 
 	err = of_property_read_u32(node, "xlnx,addrwidth", &addr_width);
-- 
2.53.0


