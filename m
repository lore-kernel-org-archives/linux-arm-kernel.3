Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E9E5F506F6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 22:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yesz3TLnlVcpzCTRtmZKcz16YVTRA/sjUd1tdRoIf5k=; b=YMzdoxJHX57E4W34ScAUK2scl0
	ChtDLtP8zAOlWQm1f/AJdFSTVNYPvf/UEXStOfu2pJvHeXH4DD3OAmsSFxGniKCimAGxEGmpjckUo
	McgePckLAHf2lXyRxC4lIk6LhuyTHkDiIfNLpRZWJzRC8LLQNME3hCDPUqHdgK/f8tQZtnA+pqXaO
	q1C1Fz+ERHe3KxLri2daRd+Dff3xwCKHl5lm1p00PNXokw5+it/jTmzwj8/vUCBJ3eMbKPxei9Thp
	d5BcM2KvA6+BhjGI4lbgFrsKT2S67kod3QU12QgiNkGNzUrf6ETTUsgGIKDHoXbRk14CVZuGyVg1l
	HiBRvYdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2GNV-000000050QX-2oX0;
	Mon, 16 Mar 2026 22:25:37 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2GNT-000000050QB-09kJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 22:25:36 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1B30110B833;
	Mon, 16 Mar 2026 23:25:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1773699932; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=yesz3TLnlVcpzCTRtmZKcz16YVTRA/sjUd1tdRoIf5k=;
	b=OD5qwL8vL4+FKjs+8oJ/v/K668ZcXnGbLdVGAvQOgeD6r4R4pncUXU6CY9lEtVG7RboCsw
	4/k2Vyh1SrCzYLbjfffTk7Hjx4j3vLFZ2visF3HuwL2p/pM5JSK45+4Gc2LvmJ8aPOwzG4
	ZqDMAZTHptjw0h6uB4iC2uJFbX5Foj3hQbBCIkKQfdDJ6Meez/jrFPaCRshE2yfdiql1/9
	okgNhFQGYl2rID/PKdLvfd7GFIkBLSlpHEPkCf4NzEMN4TWeJ0QNTJJkGg7lC9MdAR1zpp
	Xlm6iSDClHYM1XgOgLwrn6n5F+KdMFUzE5+HlGUgzek6c+te2xVh/tFMmpGhqQ==
From: Marek Vasut <marex@nabladev.com>
To: dmaengine@vger.kernel.org
Cc: Marek Vasut <marex@nabladev.com>,
	Michal Simek <michal.simek@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Rahul Navale <rahul.navale@ifm.com>,
	Sasha Levin <sashal@kernel.org>,
	Suraj Gupta <suraj.gupta2@amd.com>,
	Thomas Gessler <thomas.gessler@brueckmann-gmbh.de>,
	Vinod Koul <vkoul@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dmaengine: xilinx: xilinx_dma: Fix unmasked residue subtraction
Date: Mon, 16 Mar 2026 23:25:24 +0100
Message-ID: <20260316222530.163815-1-marex@nabladev.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_152535_226430_EB194049 
X-CRM114-Status: GOOD (  10.15  )
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

The segment .control and .status fields both contain top bits which are
not part of the buffer size, the buffer size is located only in the bottom
max_buffer_len bits. To avoid interference from those top bits, mask out
the size using max_buffer_len first, and only then subtract the values.

Fixes: a575d0b4e663 ("dmaengine: xilinx_dma: Introduce xilinx_dma_get_residue")
Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Michal Simek <michal.simek@amd.com>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: Rahul Navale <rahul.navale@ifm.com>
Cc: Sasha Levin <sashal@kernel.org>
Cc: Suraj Gupta <suraj.gupta2@amd.com>
Cc: Thomas Gessler <thomas.gessler@brueckmann-gmbh.de>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: dmaengine@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/dma/xilinx/xilinx_dma.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index 6e8e348973a9e..4f88ba92bd2d8 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -997,16 +997,16 @@ static u32 xilinx_dma_get_residue(struct xilinx_dma_chan *chan,
 					      struct xilinx_cdma_tx_segment,
 					      node);
 			cdma_hw = &cdma_seg->hw;
-			residue += (cdma_hw->control - cdma_hw->status) &
-				   chan->xdev->max_buffer_len;
+			residue += (cdma_hw->control & chan->xdev->max_buffer_len) -
+			           (cdma_hw->status & chan->xdev->max_buffer_len);
 		} else if (chan->xdev->dma_config->dmatype ==
 			   XDMA_TYPE_AXIDMA) {
 			axidma_seg = list_entry(entry,
 						struct xilinx_axidma_tx_segment,
 						node);
 			axidma_hw = &axidma_seg->hw;
-			residue += (axidma_hw->control - axidma_hw->status) &
-				   chan->xdev->max_buffer_len;
+			residue += (axidma_hw->control & chan->xdev->max_buffer_len) -
+			           (axidma_hw->status & chan->xdev->max_buffer_len);
 		} else {
 			aximcdma_seg =
 				list_entry(entry,
@@ -1014,8 +1014,8 @@ static u32 xilinx_dma_get_residue(struct xilinx_dma_chan *chan,
 					   node);
 			aximcdma_hw = &aximcdma_seg->hw;
 			residue +=
-				(aximcdma_hw->control - aximcdma_hw->status) &
-				chan->xdev->max_buffer_len;
+				(aximcdma_hw->control & chan->xdev->max_buffer_len) -
+				(aximcdma_hw->status & chan->xdev->max_buffer_len);
 		}
 	}
 
-- 
2.51.0


