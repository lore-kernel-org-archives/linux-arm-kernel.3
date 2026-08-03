Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E02C55179
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 13:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CCj7IW5Aa2am7Gl4nZV44pjH05umJpKr4DiD60ke+gQ=; b=y6bq296dN11v94tkW0NRLT5I2T
	CWHiFFQqFlpyZl904ntHAc8aNfpgh/D+NXLB6CT73blEKcvXViDC0E10x4da62jt7q7cI3SYiur2E
	cw/2pL9H5+R8bA+DZ+Xj6Aobuwkr8McKuuW+WdwIMSvXLwFEfUiOLxgAzl6PgP5BPNLd7qp30/x68
	vGfMVE/0zdhDHbf90WaglOsshv7ovcTTtvETBbBei2eQUSab8xSd2lJWpBt+J+M6hlullaEYl9eF2
	FGSep1iJH0/9PckvWJBm9d5RroT7+QGRhcT5re0p9nXhCXmRqsXbuuIMkmlaQhRkBjC5uJ7RtNVv1
	RVlhHx7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqsb1-0000000H9Bu-1etv;
	Mon, 03 Aug 2026 13:20:47 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqsay-0000000H9BJ-3DCc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 13:20:46 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6446A5B3;
	Mon,  3 Aug 2026 15:19:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1785763172;
	bh=N/Q2BZs2GsIvqmqEPKL4yjBnHG0dhXCSTr4QUD4HJ4c=;
	h=From:Date:Subject:To:Cc:From;
	b=lJKkTeeUY4c+U6weXKsg8d6C5yARqgzNmC8jbA8RcMdsHjvCzO1zwH0LjZjRnx0Ez
	 ALErel+OgcmDNwLK08ojO3333+U9ipNX3kAZd/bcX9i48Ckd+0/EONr7n3utARp1Tf
	 y7h1WNYyVrh7kHN2qEsS132Sj1c70oPjMf2CyIGk=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 03 Aug 2026 16:20:05 +0300
Subject: [PATCH] dmaengine: xilinx_dma: Use readl_poll_timeout() instead of
 atomic variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-xilinx-dma-poll-fix-v1-1-892302c4847d@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIAISVcGoC/yXMQQ5AMBCF4avIrE1SpIiriEUxGKmSFmki7q5Yf
 i95/wWOLJODKrrA0smOVxOQxBF0kzIjIffBkIo0F6XI0LNm47FfFG6r1jiwx0SqVspcFYMsITw
 3S2H+qnXz2x3tTN3+puC+H3t1F0t3AAAA
X-Change-ID: 20260803-xilinx-dma-poll-fix-15ab556a7f58
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Michal Simek <michal.simek@amd.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Vishal Sagar <vishal.sagar@amd.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1752;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=N/Q2BZs2GsIvqmqEPKL4yjBnHG0dhXCSTr4QUD4HJ4c=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqcJWlpXPCpymGRS5mHpwrq8lQsKiORGsxwzJEh
 AKxs7O5PA+JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCanCVpQAKCRD6PaqMvJYe
 9RUDD/9axI59nT6bxN31t6u9c53RZg+Q4UaDJqwJJFKrUVNyGlLRGWwc7OcoWfedos0jQqd+O92
 TbBY5JoPl55RtRCz11ggHIWs4o8c46dsg/XPr+R2+TeNYwgoH/a1qXkIqbPSF99PCVRP8enBGuA
 jhVfTzOfvxAwnM/qEpcIcmituVdTq2dLuQLccU3QfhC+c13uQ7n4YvkjpmZwT8AOASrFgxoYDIP
 pOC2jG65aHgoxFLvqJydejSrMBkzn72Z8FCdkKfrf7H8XzpEcbtw0mDRYVrKroMvEnBOxPhOyii
 5jHlcWRCd/mBa9j99I01P58FtiZjIsHwhO+5zHarSKMU5PQbq9wjKkG+P68tfHLQPJMJlj/4dHL
 s6R+YCCbdsikBdPalmziaZ1SDNWuBjtV7WfdoqZeNsLUVMd5YtemgtcRJzqmlfFdNmYbr2Zrzpj
 c62KTeBRtcSa49IwEB69hKQD1YzkEuPsQYyjfnio+pdmv44NldlZe4P6TkrASMlM9wlAvPINegC
 s7ryooJW9g3sNXcFKdgRjDXfqG6uBkM7YIorSzi4B8NCgZMi9u9lmUos25/4lHAw/HkKxdmASBD
 E839ChlYwOCFerIm+gvOXJynbtc/XIjtRkte/DXb3l+MLDl1qYVkzUzSEwSqGKNbIEhWXrSKVPD
 c0vTxOpmg+hBxdg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_062044_959679_98713355 
X-CRM114-Status: UNSURE (   9.58  )
X-CRM114-Notice: Please train this message.
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

All callers of xilinx_dma_poll_timeout() pass a zero delay and a 1
second timeout (XILINX_DMA_LOOP_COUNT). With a zero delay,
readl_poll_timeout_atomic() does not measure wall clock time, and the
actual timeout can be much more than 1 second.

This is very visible when a channel reset never completes, e.g. with a
VDMA whose stream-side clock isn't running. Probe appears to hang, and
only minutes later fails with:

  xilinx-vdma a0050000.dma: reset timeout, cr 4, sr 0
  xilinx-vdma a0050000.dma: Reset channel failed

Switch to readl_poll_timeout(), which checks the deadline against
ktime_get().

Calling xilinx_dma_poll_timeout() from atomic context is still safe even
after this change, as readl_poll_timeout() with zero delay never sleeps.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/dma/xilinx/xilinx_dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index 404235c17353..6e8c786147f7 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -530,7 +530,7 @@ struct xilinx_dma_device {
 #define to_dma_tx_descriptor(tx) \
 	container_of(tx, struct xilinx_dma_tx_descriptor, async_tx)
 #define xilinx_dma_poll_timeout(chan, reg, val, cond, delay_us, timeout_us) \
-	readl_poll_timeout_atomic(chan->xdev->regs + chan->ctrl_offset + reg, \
+	readl_poll_timeout(chan->xdev->regs + chan->ctrl_offset + reg, \
 				  val, cond, delay_us, timeout_us)
 
 /* IO accessors */

---
base-commit: f5098b6bae761e346ebcd9da7f95622c04733cff
change-id: 20260803-xilinx-dma-poll-fix-15ab556a7f58

Best regards,
--  
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>


