Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B791D767F1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 17:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RGjnkOVVS4NDxcQ+kwEob4qlblcbsVxOufgw7Bg+4Sg=; b=ym+h/CUJCXCfP+ugz40EBN2v8i
	dPtHFns4D3kN/r5r0r4Nwjsz8XNvvynKQTJmRRFvjqvkq0UtZc+GFdUPDfzpvgo5+h15JESNQBqpU
	grLkLPIR6s5oBH9cvlV4Gmn0StU9pgVdA/gd1GWPA+p7a+08fOCxFqP+1S1+bcZ6YyWpZJEFQseY5
	y1dS2AQsRZlNxLjc80XLblpmGfXdt5Fq2oOzEF+Tlmch8jLsDEsMQOhfepr189qAE2nITc7sEwbJJ
	0LbSXlNoHfyUy5e3bevqH59w9mRWUg/eEis1SNIi9NQBjlRsGL7ghT9gT+z1KdG/t5iqnKDGQIL/Y
	z6AcgJ1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Yjk-00000004JPk-14Ad;
	Thu, 31 Oct 2024 17:13:32 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Yi4-00000004JAM-4BqU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 17:11:50 +0000
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 7534188E0F;
	Thu, 31 Oct 2024 18:11:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1730394705;
	bh=RGjnkOVVS4NDxcQ+kwEob4qlblcbsVxOufgw7Bg+4Sg=;
	h=From:To:Cc:Subject:Date:From;
	b=Aw4PvA1CgYnP0YOZDvR2KMlCeM9u3OQkDWe113KcdMOMaF8RmrIzpDsT24s5vU7oC
	 cfA5BwEE0mWaDyp0iCsSWoAmg4Ew4EGeHO/Ar2+UeZvKqtQiqQcboTsNQKSJZtggXt
	 o8EUGl7mcp+5CI9kGDl8IFBhgvnAtZQHodhDKSTX2RZoSxCfGjOoTYajCT4dxGLe5g
	 v70DudY+apXooGPzQ2heVtl9Rpfp/DVeODA/p/MdhrcJDi0lK8cbwW5+0rYUxW8YS8
	 DD7F6obKtKNldfUIR8YmSLy9Ywdn0dHp0P6ccOwmcGZanqSQMWJ+PsRZeFHHecTKeV
	 MeC6kSFSnpU/Q==
From: Marek Vasut <marex@denx.de>
To: dmaengine@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Michal Simek <michal.simek@amd.com>,
	Peter Korsgaard <peter@korsgaard.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Vinod Koul <vkoul@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dmaengine: xilinx_dma: Configure parking registers only if parking enabled
Date: Thu, 31 Oct 2024 18:11:04 +0100
Message-ID: <20241031171132.56861-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_101149_205719_2EDE8811 
X-CRM114-Status: GOOD (  10.65  )
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

The VDMA can work in two modes, parking or circular. Do not program the
parking mode registers in case circular mode is used, it is useless.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: "Uwe Kleine-König" <u.kleine-koenig@baylibre.com>
Cc: Michal Simek <michal.simek@amd.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: dmaengine@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/dma/xilinx/xilinx_dma.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index 48647c8a64a5b..87db381ff1286 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -1404,16 +1404,18 @@ static void xilinx_vdma_start_transfer(struct xilinx_dma_chan *chan)
 
 	dma_ctrl_write(chan, XILINX_DMA_REG_DMACR, reg);
 
-	j = chan->desc_submitcount;
-	reg = dma_read(chan, XILINX_DMA_REG_PARK_PTR);
-	if (chan->direction == DMA_MEM_TO_DEV) {
-		reg &= ~XILINX_DMA_PARK_PTR_RD_REF_MASK;
-		reg |= j << XILINX_DMA_PARK_PTR_RD_REF_SHIFT;
-	} else {
-		reg &= ~XILINX_DMA_PARK_PTR_WR_REF_MASK;
-		reg |= j << XILINX_DMA_PARK_PTR_WR_REF_SHIFT;
+	if (config->park) {
+		j = chan->desc_submitcount;
+		reg = dma_read(chan, XILINX_DMA_REG_PARK_PTR);
+		if (chan->direction == DMA_MEM_TO_DEV) {
+			reg &= ~XILINX_DMA_PARK_PTR_RD_REF_MASK;
+			reg |= j << XILINX_DMA_PARK_PTR_RD_REF_SHIFT;
+		} else {
+			reg &= ~XILINX_DMA_PARK_PTR_WR_REF_MASK;
+			reg |= j << XILINX_DMA_PARK_PTR_WR_REF_SHIFT;
+		}
+		dma_write(chan, XILINX_DMA_REG_PARK_PTR, reg);
 	}
-	dma_write(chan, XILINX_DMA_REG_PARK_PTR, reg);
 
 	/* Start the hardware */
 	xilinx_dma_start(chan);
-- 
2.45.2


