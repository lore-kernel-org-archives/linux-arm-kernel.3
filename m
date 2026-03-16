Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3290AF30275
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 22:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6thiR54CY8QtVoPqPm+NGB5mFkJooDA5caJGg49p0mE=; b=mAEkJPde0TAPHnN0zcAMQFKf1g
	Z8RZJWwXtv96shIMcSrLOuHB4aM2lRASLfb3WTqPhi1tOSxEqPfr+Ciq+V8e1KnyoqZcti+8reJvr
	nvr5DFSTaEq+DhVLTm3Z7nwq7GbjlQjo3ouilkIeJpXdLCRS12jT1zdJ/NCH4BDiHJRHvzTRiCnCG
	hvcg61utPaCKzd8khMz2EO52C4CXIOUmwYGgU7RkWq8uxA4sfdIWpJ5XMiEREl8BfOvmQ2kTlVe9e
	/1xZ5/2GXx35ZUzC9pMcuPStDivGtFfn9QKAvIkSuqpkkk9C805Gyh3Y4W0rlr20GRbLIRgjBqBLG
	64duj79w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2GHs-00000005060-3SQD;
	Mon, 16 Mar 2026 22:19:48 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2GHq-0000000505d-3IST
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 22:19:47 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C4E7810D3F8;
	Mon, 16 Mar 2026 23:19:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1773699584; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=6thiR54CY8QtVoPqPm+NGB5mFkJooDA5caJGg49p0mE=;
	b=aL50Bc4Gt/6D9g+t/299iADka6rEAQLrLZeyg/UrQc1URI5rzXtLHNaqt+3lS9K8ysyMpQ
	w1myUIjUl1BTBbNaeZPm7i83Ao1sMeagd3UmHyhEa0owg+Mo3ePztDXQ+d5t7kseC0q6o+
	n6WkhuQMK8URqzdqrpKLIQUiOWYntbQKCnyllBIrBfmbM8xMjPnHqhI+MF+dJlRQhQkyOD
	W6Ib3Q7kN0GIRAMAMh68Tc67T6orAJJgp/1/tZ2jVNYtGOnj8TwYpPOl0XoQD8K8w/6I6E
	ILifXcvCeyOc2O8btZ6nv1IWgmWCB5q38r33/kRT2VFbmLQCWDq0LeCbhA9O5g==
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
Subject: [PATCH] dmaengine: xilinx: xilinx_dma: Fix residue calculation for cyclic DMA
Date: Mon, 16 Mar 2026 23:18:57 +0100
Message-ID: <20260316221943.160375-1-marex@nabladev.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_151946_967836_F734F5E3 
X-CRM114-Status: GOOD (  15.32  )
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

The cyclic DMA calculation is currently entirely broken and reports
residue only for the first segment. The problem is twofold.

First, when the first descriptor finishes, it is moved from active_list
to done_list, but it is never returned back into the active_list. The
xilinx_dma_tx_status() expects the descriptor to be in the active_list
to report any meaningful residue information, which never happens after
the first descriptor finishes. Fix this up in xilinx_dma_start_transfer()
and if the descriptor is cyclic, lift it from done_list and place it back
into active_list list.

Second, the segment .status fields of the descriptor remain dirty. Once
the DMA did one pass on the descriptor, the .status fields are populated
with data by the DMA, but the .status fields are not cleared before reuse
during the next cyclic DMA round. The xilinx_dma_get_residue() recognizes
that as if the descriptor was complete and had 0 residue, which is bogus.
Reinitialize the status field before placing the descriptor back into the
active_list.

Fixes: c0bba3a99f07 ("dmaengine: vdma: Add Support for Xilinx AXI Direct Memory Access Engine")
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
 drivers/dma/xilinx/xilinx_dma.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index 6b0927e3d684b..6e8e348973a9e 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -1564,8 +1564,29 @@ static void xilinx_dma_start_transfer(struct xilinx_dma_chan *chan)
 	if (chan->err)
 		return;
 
-	if (list_empty(&chan->pending_list))
+	if (list_empty(&chan->pending_list)) {
+		if (chan->cyclic) {
+			struct xilinx_dma_tx_descriptor *desc;
+			struct list_head *entry;
+
+			desc = list_last_entry(&chan->done_list,
+					       struct xilinx_dma_tx_descriptor, node);
+			list_for_each(entry, &desc->segments) {
+				struct xilinx_axidma_tx_segment *axidma_seg;
+				struct xilinx_axidma_desc_hw *axidma_hw;
+				axidma_seg = list_entry(entry,
+							struct xilinx_axidma_tx_segment,
+							node);
+				axidma_hw = &axidma_seg->hw;
+				axidma_hw->status = 0;
+			}
+
+			list_splice_tail_init(&chan->done_list, &chan->active_list);
+			chan->desc_pendingcount = 0;
+			chan->idle = false;
+		}
 		return;
+	}
 
 	if (!chan->idle)
 		return;
-- 
2.51.0


