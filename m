Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A43FED767E9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 17:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rNPcUKdGGxyVAjLTUAVNJvowXUyU1UZgOz+u8/qucgg=; b=VhSXyhQ+DRO6XEUbWZbmXbbeqA
	2pb12KJmqetzKGSPbWZmNj1WRC253zdVAPMDzNC+mH6c68ZPBRYnGFYz5HQxL3KfQFpBXN/V+OXAa
	WiOmuI0Npff7SQF/DM0uMwt2xCZ1Dnt+Wx+D6SxI/pTR2uiB+hJn9nA/2R2XwbKHW6iDGVbU/5dOA
	f4P4c7TzYAtBKCnPEoJHKztKA+EVicqJ+ixTDDBpVsQx/LkLPW5kMZ5sEbMenbpA/Q/spQ3/tyVQS
	1smZ/MnMfkV2tnjEHbK61JCit+LZqylXbPWSUHj2+cdGy4qeliPYj1KCZjKFwpdhYAro0NhcRKNXb
	zdAp3E8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6YXD-00000004HD8-0CeU;
	Thu, 31 Oct 2024 17:00:35 +0000
Received: from phobos.denx.de ([85.214.62.61])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6YVX-00000004H0t-1lNg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 16:58:52 +0000
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 5A7CE892B5;
	Thu, 31 Oct 2024 17:58:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1730393928;
	bh=rNPcUKdGGxyVAjLTUAVNJvowXUyU1UZgOz+u8/qucgg=;
	h=From:To:Cc:Subject:Date:From;
	b=e/KVZ0d5hriqIOOnMRtFr+JjxtQMCsMib6CaeN8DeHUAt0tBFrgLJqcTZgQI9txxv
	 NgkDS8PY1emtfD885Ya51vF//LwD5DO6iA8o311SOEpOSloZ8ttWrmoWwhdq+a8qH1
	 Dtb7VyuZfQiWArb1ABVg4cEymhZPMO8bdq4vSHm+1AxggXh+ZIVG4cQVnhxi9Dy7UD
	 IjwJt7BG691JTgO1xQUMT7KtC8RlW+Lq9wcFawDA58p46FCTvMFXaPAr+MaLnzz/1z
	 w51rFbjbOCE4b6MNuDwrL76l0PZH+PCufIVlHKMU7jOMOaInl9ZvB1qpiz8oHzAmrR
	 oPo2el9xfsp1g==
From: Marek Vasut <marex@denx.de>
To: dmaengine@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Michal Simek <michal.simek@amd.com>,
	Peter Korsgaard <peter@korsgaard.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Vinod Koul <vkoul@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dmaengine: xilinx_dma: Fix freeup active list based on descriptor completion bit
Date: Thu, 31 Oct 2024 17:58:20 +0100
Message-ID: <20241031165835.55065-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_095851_629158_EC69AB0B 
X-CRM114-Status: GOOD (  13.33  )
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

The xilinx_dma is completely broken since the referenced commit,
because if the (seg->hw.status & XILINX_DMA_BD_COMP_MASK) is not
set for whatever reason, the current descriptor is never moved to
the done list, and the DMA stops moving data.

Isolate the newly added check to DMA which does implement irq_delay,
that way the new check is matching what is likely some new bit in a
new core, without breaking the DMA for older versions of the same
core.

Fixes: 7bcdaa658102 ("dmaengine: xilinx_dma: Freeup active list based on descriptor completion bit")
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
 drivers/dma/xilinx/xilinx_dma.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index 1bdd57de87a6e..48647c8a64a5b 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -1718,7 +1718,8 @@ static void xilinx_dma_complete_descriptor(struct xilinx_dma_chan *chan)
 		return;
 
 	list_for_each_entry_safe(desc, next, &chan->active_list, node) {
-		if (chan->xdev->dma_config->dmatype == XDMA_TYPE_AXIDMA) {
+		if (chan->xdev->dma_config->dmatype == XDMA_TYPE_AXIDMA &&
+		    chan->irq_delay) {
 			struct xilinx_axidma_tx_segment *seg;
 
 			seg = list_last_entry(&desc->segments,
-- 
2.45.2


