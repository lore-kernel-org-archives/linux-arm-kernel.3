Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD075C5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 15:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=29hiHpgqX9nBaht+hdLQp8DmwZW2DndJpBRtG3FNyho=; b=PiKqhHbZ1eids4dkN/viW/9Yur
	d/vm+qUgNBIK54Y8T/NruNZWQ8891MDuMCPLQneK0Vs+ODo6Le+J/eYuQMq5E1QFNYcAsJES4VDd2
	WglEfkfnAtPMw1HYdqEiGu5daBEgR3ftoESP9bFxb+ar2llHClwFtM5XG+5py8awoRi/vsJiy0ckB
	C1B+xwjz8JH5VE8yahas5ffzXB/gB9xk/AuRCk78GRrCLLC5swPBY/bwQJDSpqoeb6G20ffvltwbE
	F3pGVhRBgKDz5c885w58EueRInzGDv9WeHzuYsQZQeM25R+Dj07PuyHGDvuXYutSYmSWBCWtm77GA
	uTu0ICPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvz3f-00000006NsJ-3YYd;
	Mon, 17 Aug 2026 15:15:27 +0000
Received: from fsn-vps-1.bereza.email ([162.55.44.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvz3c-00000006NrX-1Z1d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 15:15:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bereza.email; s=mail;
	t=1786979720; bh=1497zUvLIPaY94WCQ59GMwR5OvxqFEndUqy4aycPD3c=;
	h=From:Date:Subject:To:Cc:From;
	b=VHkD5Rbc5ws3HydcpdXBVzFG+GHtChl9wfwpVXebrtNu74KkjNSKDrgd3J7W2pyE3
	 YkAE2vEAUEJ9o3RTp4gC24LEWGZA2CKFdPabN12S0XYH+jkzDulmRLLi+lK9CRljGy
	 6fGVetl9jF6HOBKn3S2cxJX0CENm7TAaaabdIVQXHqN2m2gBRcrsz91aj+9xgAyvF3
	 lfeUcsw9xytW0Vs2mn4GECFG0DmiInFKhqWZmzecMTw0klmt8/tlWpTBn14727RlBh
	 V3kgJgz1KPdZk6ChlaGhmB0wB/eJHfEKxol1z2GwC37wAnD+3cqJXJ0xj3GvtRf1vF
	 XoSoLyb5ZPFVg==
Received: from [127.0.1.1] (pd95bbad8.dip0.t-ipconnect.de [217.91.186.216])
	by fsn-vps-1.bereza.email (Postfix) with ESMTPSA id 91EC960279;
	Mon, 17 Aug 2026 17:15:20 +0200 (CEST)
From: Alex Bereza <alex@bereza.email>
Date: Mon, 17 Aug 2026 17:14:16 +0200
Subject: [PATCH] dmaengine: xilinx_dma: Fix hardware buffer descriptor
 chain after cyclic DMA
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-fix-hw-buf-desc-after-cyclic-mode-v1-1-1fe47e701d6c@bereza.email>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQ6CMBCF4auQWTtJQQXiVQyLdjqFMQqmA4Ih3
 N0Ky2/x/reCchRWuGUrRP6IytAn5KcMqLN9yyg+GQpTlKbOKwyyYDejmwJ6VkIbRo5IX3oK4Wv
 wjBSMrerzxbqrgdR5R06j/ePeHNbJPZjGfxi27QfwDVavhQAAAA==
X-Change-ID: 20260817-fix-hw-buf-desc-after-cyclic-mode-cf0a7834ab50
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Michal Simek <michal.simek@amd.com>, 
 Kedareswara rao Appana <appana.durga.rao@xilinx.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Alex Bereza <alex@bereza.email>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_081524_890567_95D6EC3A 
X-CRM114-Status: GOOD (  12.83  )
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

Using the DMA in cyclic mode modifies the hardware buffer descriptor
chain in xilinx_dma_prep_dma_cyclic so that the last descriptor used by
the cyclic transfer points back to the first descriptor, but it never
restores the original descriptor ring. This breaks using non-cyclic mode
after cyclic mode with an error like:

  xilinx-vdma 86000000.dma: Channel 00000000354d5c8d has errors 100, cdr 6de40000 tdr 6de40400

The only way to get out of this error state is to rebuild the hardware
buffer descriptor ring by releasing and re-acquiring the channel.

Fix using non-cyclic mode after cyclic mode by always restoring the
original buffer descriptor ring in the same manner as it is set up by
xilinx_dma_alloc_chan_resources().

Fixes: 23059408b6a3 ("dmaengine: xilinx_dma: Fix race condition in the driver for multiple descriptor scenario")
Signed-off-by: Alex Bereza <alex@bereza.email>
---
 drivers/dma/xilinx/xilinx_dma.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index bef2b031dba1..6d00aa97c8fc 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -756,15 +756,25 @@ xilinx_aximcdma_alloc_tx_segment(struct xilinx_dma_chan *chan)
 	return segment;
 }
 
-static void xilinx_dma_clean_hw_desc(struct xilinx_axidma_desc_hw *hw)
+static void xilinx_dma_clean_hw_desc(struct xilinx_dma_chan *chan,
+				     struct xilinx_axidma_tx_segment *segment)
 {
-	u32 next_desc = hw->next_desc;
-	u32 next_desc_msb = hw->next_desc_msb;
+	dma_addr_t next;
+	u32 i;
 
-	memset(hw, 0, sizeof(struct xilinx_axidma_desc_hw));
+	/*
+	 * Restore the buffer descriptor's next descriptor pointer to the value
+	 * set up in xilinx_dma_alloc_chan_resources(). Otherwise using the DMA
+	 * in cyclic mode leaves the next descriptor pointer altered and
+	 * prevents subsequent non-cyclic transfers.
+	 */
+	i = (segment->phys - chan->seg_p) / sizeof(*chan->seg_v);
+	next = chan->seg_p +
+	       sizeof(*chan->seg_v) * ((i + 1) % XILINX_DMA_NUM_DESCS);
 
-	hw->next_desc = next_desc;
-	hw->next_desc_msb = next_desc_msb;
+	memset(&segment->hw, 0, sizeof(segment->hw));
+	segment->hw.next_desc = lower_32_bits(next);
+	segment->hw.next_desc_msb = upper_32_bits(next);
 }
 
 static void xilinx_mcdma_clean_hw_desc(struct xilinx_aximcdma_desc_hw *hw)
@@ -786,7 +796,7 @@ static void xilinx_mcdma_clean_hw_desc(struct xilinx_aximcdma_desc_hw *hw)
 static void xilinx_dma_free_tx_segment(struct xilinx_dma_chan *chan,
 				struct xilinx_axidma_tx_segment *segment)
 {
-	xilinx_dma_clean_hw_desc(&segment->hw);
+	xilinx_dma_clean_hw_desc(chan, segment);
 
 	list_add_tail(&segment->node, &chan->free_seg_list);
 }

---
base-commit: 0d995da5fb97e8c312834575604d4423eb6225b7
change-id: 20260817-fix-hw-buf-desc-after-cyclic-mode-cf0a7834ab50

Best regards,
--  
Alex Bereza <alex@bereza.email>


