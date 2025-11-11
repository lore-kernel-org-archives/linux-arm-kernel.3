Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55359CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 15:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=whK2dyd/4v9cobWAdSAO0OwC5a8fVmzniIpeD+bw1aM=; b=hmg2V7htY1k2mipZ77lcz3+Mxz
	D3Ig3FjbsxoTmHwsojOKF30K9mEWDWrD1zEMCslXs/Rx0/ATGZz20TC8W4kUJrrB9y9/s3J5KRR/u
	NZxXkatb6purt06ssw02MuYqWa8kKx5T7vK85GIfCh+Mmn58r5rVETZuzcRDJzmQLOuDYkDPIqoxS
	NJ2nnIv8xGQOx+NJEAVNdWUfQNwGbsaA6p4+3upGk3anOxGy75HPcM2SBYlpt6zKiOxWnleQeN2Iq
	SVgkM5SDHZ5bGjL2g7kOELwPFwcHZx230vkqkSyhQid/jm827xgMc4shbn8VB4n4iPkwDJCxoKS7N
	42IvPdJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIpxc-00000007MK9-0Hsa;
	Tue, 11 Nov 2025 15:07:08 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIpxZ-00000007MJS-3yQ1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 15:07:07 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8BA281D29;
	Tue, 11 Nov 2025 16:05:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762873502;
	bh=8ab0z0efd7h/t9/jZI966Tl0kwb7kTcwZtcQTAG26U8=;
	h=From:Date:Subject:To:Cc:From;
	b=SY9ZyJo/oCpZk1StEFEsbzrZICx+SgG+8W04Zk33YiJa+U6B223euzr/ALTt/iyU3
	 qESkUdMVVnUHR6DtkRul3YjFf8mwUgNHl4CIA1fstjcOfK8aO21GGnQAjOmANRs6GF
	 4/aRNtOskk60OtE7sN6vsy1A3Ud8kk1Lfp6psDhI=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 11 Nov 2025 17:06:41 +0200
Subject: [PATCH] dmaengine: xilinx_dma: Enable IRQs for AXIDMA in
 start_transfer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251111-xilinx-dma-fix-v1-1-066c158bc18e@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIAABRE2kC/x2MUQqAIBAFrxL73UIKCnWV6MN0q4WyUAhBvHtL8
 zcD71XIlJgyTF2FRC9nvqOI6jvwh4s7IQdx0IM2SsDCJ8eC4XK4ccHVa+ssjSsZBzJ6Ekn+D+e
 ltQ8ibdONYAAAAA==
X-Change-ID: 20251111-xilinx-dma-fix-bc26a6e9be5a
To: Vinod Koul <vkoul@kernel.org>, Michal Simek <michal.simek@amd.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Vishal Sagar <vishal.sagar@amd.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4158;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=8ab0z0efd7h/t9/jZI966Tl0kwb7kTcwZtcQTAG26U8=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpE1EQD3Na3TcGQCyk+gNyK1DTZlQgsvZeDWMo3
 qIWsGhhp0CJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaRNREAAKCRD6PaqMvJYe
 9dh8EACUAQP2hyhea7187lj/rvm8d1q44qxnmz2N76+XM/6vf5gBBY7+VH8jxEnizjHJfDDCoDR
 Q0/m7vdvRedFd0OCU7opESRUKiVgjWlTQZandFVgncmxWXoH/kPyGKRVrl/RiL7eKGg1CldIhoW
 +1WsZP3Y3SqT+rW/f0mpijlycjblGSOQzOWz85hFVK/soMsPNOBlODIvQheuKhtvuAojKg9MAlQ
 S/ga6Y/shFQuMgEHrqrlS+zrUcPir7swzyU+2MJaHtb14baZGKlof3bX+prrgfoIK/4DYPE8QZn
 qvZbI7VyruS1MlZ/T7Fz/PoVbO1Y+SSSexOMFT0/GvOaQ2HR4K7m7a7OAI02XhHOdCeouil2+bz
 9vXC7K0DQIhhYxUOvtakrXc9Sr+UbBEFfk/j8hWE3IW/x5yUQOA1HgwEgIj/ZhY2N520/XUVP4J
 iTPdpWMaaghnX9LGwR9dR62DKtPAgRtFFgZCwc/OQZ3r/jwMRQWeWXQ4prIoW/NwWN+Q/P007MF
 r3vuV1B1obpbzg1+Rh5fbQylvcM2E927ZguBYJ5704bOcJRR0fo4rniVoDYISBPNDf2d9hxs4lA
 KIjdkIE5eDgwT+IwbIIrZGOF14Taj3RUBDE2hh3RZL51mg5MLICs8IpiFcZbF81jq1NtP1vDQnK
 eOk0ZWeM1BFsW4g==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_070706_137830_D890A1AF 
X-CRM114-Status: GOOD (  22.07  )
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

A single AXIDMA controller can have one or two channels. When it has two
channels, the reset for both are tied together: resetting one channel
resets the other as well. This creates a problem where resetting one
channel will reset the registers for both channels, including clearing
interrupt enable bits for the other channel, which can then lead  to
timeouts as the driver is waiting for an interrupt which never comes.

The driver currently has a probe-time work around for this: when a
channel is created, the driver also resets and enables the
interrupts. With two channels the reset for the second channel will
clear the interrupt enables for the first one. The work around in the
driver is just to manually enable the interrupts again in
xilinx_dma_alloc_chan_resources().

This workaround only addresses the probe-time issue. When channels are
reset at runtime (e.g., in xilinx_dma_terminate_all() or during error
recovery), there's no corresponding mechanism to restore the other
channel's interrupt enables. This leads to one channel having its
interrupts disabled while the driver expects them to work, causing
timeouts and DMA failures.

A proper fix is a complicated matter, as we should not reset the other
channel when it's operating normally. So, perhaps, there should be some
kind of synchronization for a common reset, which is not trivial to
implement. To add to the complexity, the driver also supports other DMA
types, like VDMA, CDMA and MCDMA, which don't have a shared reset.

However, when the two-channel AXIDMA is used in the (assumably) normal
use case, providing DMA for a single memory-to-memory device, the common
reset is a bit smaller issue: when something bad happens on one channel,
or when one channel is terminated, the assumption is that we also want
to terminate the other channel. And thus resetting both at the same time
is "ok".

With that line of thinking we can implement a bit better work around
than just the current probe time work around: let's enable the
AXIDMA interrupts at xilinx_dma_start_transfer() instead.
This ensures interrupts are enabled whenever a transfer starts,
regardless of any prior resets that may have cleared them.

This approach is also more logical: enable interrupts only when needed
for a transfer, rather than at resource allocation time, and, I think,
all the other DMA types should also use this model, but I'm reluctant to
do such changes as I cannot test them.

The reset function still enables interrupts even though it's not needed
for AXIDMA anymore, but it's common code for all DMA types (VDMA, CDMA,
MCDMA), so leave it unchanged to avoid affecting other variants.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/dma/xilinx/xilinx_dma.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index a34d8f0ceed8..50dd93ce6741 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -1216,14 +1216,6 @@ static int xilinx_dma_alloc_chan_resources(struct dma_chan *dchan)
 
 	dma_cookie_init(dchan);
 
-	if (chan->xdev->dma_config->dmatype == XDMA_TYPE_AXIDMA) {
-		/* For AXI DMA resetting once channel will reset the
-		 * other channel as well so enable the interrupts here.
-		 */
-		dma_ctrl_set(chan, XILINX_DMA_REG_DMACR,
-			      XILINX_DMA_DMAXR_ALL_IRQ_MASK);
-	}
-
 	if ((chan->xdev->dma_config->dmatype == XDMA_TYPE_CDMA) && chan->has_sg)
 		dma_ctrl_set(chan, XILINX_DMA_REG_DMACR,
 			     XILINX_CDMA_CR_SGMODE);
@@ -1572,6 +1564,7 @@ static void xilinx_dma_start_transfer(struct xilinx_dma_chan *chan)
 			     head_desc->async_tx.phys);
 	reg  &= ~XILINX_DMA_CR_DELAY_MAX;
 	reg  |= chan->irq_delay << XILINX_DMA_CR_DELAY_SHIFT;
+	reg |= XILINX_DMA_DMAXR_ALL_IRQ_MASK;
 	dma_ctrl_write(chan, XILINX_DMA_REG_DMACR, reg);
 
 	xilinx_dma_start(chan);

---
base-commit: e5f0a698b34ed76002dc5cff3804a61c80233a7a
change-id: 20251111-xilinx-dma-fix-bc26a6e9be5a

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>


