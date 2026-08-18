Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE700C5DF70
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 07:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3vXD3oP+NaPEQZkc5X/mkWOQBq7GDYQ5wXqGGnSOQSk=; b=0+MnNWdokbwnuSY3Ld7JDC0Pk0
	1f6lSm7038+HG3kSu+lLuZPoP+5Ky3DTBdhhc917+4WoP1W6ZvPRuUYRZ0d7GvBf+ML8grlMSnCJM
	uek981U4fo3gYD/fCA8KBYYQlXw6aWNFplEAGSo8CFhp3jZ1JyPbt9X3iqwrtK80qYE4/9BLZ3lTj
	o5qLcY3yZ7DxmX25Fx+kZBgsQutc9EkqRkvFvl0fxthUwZERw3GRx4O62kOVukkhmFaacONBA18Zu
	0wVfm4n6aQpzuXTSjqo+sz/GqFWgZUWKPK/NkD2lKL+5IeKhptxEKqJuKeOfxGbNJNgYI46jXufk5
	4fLvB3mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwENU-00000007SxK-3QJD;
	Tue, 18 Aug 2026 07:36:56 +0000
Received: from fsn-vps-1.bereza.email ([162.55.44.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwENR-00000007Sun-08sG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 07:36:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bereza.email; s=mail;
	t=1787038609; bh=doyszLS/JeBqn3eOxUcYgttaAt25EhFLmRESRf01uzM=;
	h=From:Date:Subject:To:Cc:From;
	b=E0P2hKAbaRCKq192Wz5OtnCPzSbzePLIbaeKcLNaI0WViksm7mPDAxrGPXXz0ORPZ
	 Gti/i2B6UKjaJzGAStHlbPdY8vvGdi0I1XmsR8xltU717ZYaLBWG7iXh4c2mk+ckbG
	 MCNgIxYRdiw9j9X3Whfzx5B7An8JH+BMYso94mSb63zhKPJiaqRzNmfDg8NPGBbqTO
	 tBDykLkKHrVj4svt/bUsBPjZZHG6iiXyNmtaibkBEOo5BDq2AS6JKhGpuN//kCSLNM
	 olFxdEQZ2pTFvsVjN9QUVqFPXCUXF8GCNLZp6Yx4trctTYsopwNG8t44hVSs123Ga9
	 oPlnjq9ZY9qtQ==
Received: from [127.0.1.1] (pd95bbad8.dip0.t-ipconnect.de [217.91.186.216])
	by fsn-vps-1.bereza.email (Postfix) with ESMTPSA id E1D786027C;
	Tue, 18 Aug 2026 09:36:48 +0200 (CEST)
From: Alex Bereza <alex@bereza.email>
Date: Tue, 18 Aug 2026 09:36:29 +0200
Subject: [PATCH v2] dmaengine: xilinx_dma: Fix hardware buffer descriptor
 chain after cyclic DMA
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-fix-hw-buf-desc-after-cyclic-mode-v2-1-530ff44c6a81@bereza.email>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOSw6CMBCGr0K6dkxBpMSV9zAs2ulUxvAwLaBIu
 LsFT2D+1Zf8r0UE8kxBXJJFeJo4cN9FyA6JwFp3dwK2kUUms0KWqQLHb6hfYEYHlgKCdgN5wBk
 bRmh7S4BOalWecm3OUsSep6cY2jdu1Y/DaB6Ew1a8OWoOQ+/n/cSUbr5/9qYUohzlipRMbYFXQ
 54++kit5kZU67p+AQcjqTvnAAAA
X-Change-ID: 20260817-fix-hw-buf-desc-after-cyclic-mode-cf0a7834ab50
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Michal Simek <michal.simek@amd.com>, 
 Kedareswara rao Appana <appana.durga.rao@xilinx.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Alex Bereza <alex@bereza.email>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_003653_529315_494D9E1A 
X-CRM114-Status: GOOD (  14.22  )
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
Changes in v2:
- Use pointer arithmetic instead of potential 64 bit division in
  xilinx_dma_clean_hw_desc() as suggested by Frank Li
  <Frank.Li@kernel.org> and sashiko-bot - Thanks!
- Link to v1: https://patch.msgid.link/20260817-fix-hw-buf-desc-after-cyclic-mode-v1-1-1fe47e701d6c@bereza.email

To: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>
To: Michal Simek <michal.simek@amd.com>
To: Kedareswara rao Appana <appana.durga.rao@xilinx.com>
Cc: dmaengine@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/dma/xilinx/xilinx_dma.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index bef2b031dba1..650e078fcdb7 100644
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
+	i = segment - chan->seg_v;
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


