Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8DE7F53D6C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 22:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pW+gaXWnu4rY+78vLjdac4WvIiFC+ddEjlcgIq0JPlo=; b=ZP94bY1acAjbNSARNAna3pAdJA
	YmXqfJo2QDEgz8vWmLRYw305fcw8ebLEVKDG+RuU3f4fa8qsEMaj+UWo75uGbfRrw1jlcNEgBMd00
	B2HC/RY5FxJvW9lbJgL92rdgh3ixXLtiSdds1zcwsoLCruIRZETJhay3bjtNA88oDao8meDcH15cR
	rBjqDgkOXfQQPnUwsK3lWna4XNNQ954j1AnVs+UJSQCBxYa1z2FEukC/Ze5XnJRCEuBhpShquTBtW
	hIu3rIFlCqiBEA5zAMBdAUeXzVy+UTF09sPaW8U799/Tz0gf9j/lzY8INNuLIqUTgR//OEcKhdO+w
	s9JgX/Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2GFu-00000004zme-1eTh;
	Mon, 16 Mar 2026 22:17:46 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2GFr-00000004zjw-2frU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 22:17:44 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A2BDB10D588;
	Mon, 16 Mar 2026 23:17:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1773699452; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=pW+gaXWnu4rY+78vLjdac4WvIiFC+ddEjlcgIq0JPlo=;
	b=L27GwRybH/qL7GbagjOIdGeFJZz4zheAGeJ5G9wKjx/SPDdzmDESFyDQOyqwiWOtXzIcz7
	iLw2EeY8eRP9AlqLWe5Hd1haenZ3l7hK4I31WdfVaQXzXYj9OF/RFykEY0pYA5/mJuctTl
	TtQlJclIdtT7QwzZYgvHUQBWs6ZoJPHXavQANHeEE5hvWG2kdODiZRg2TobZoIP6HA+tZb
	o9dwKDh6xk2spzqTXFpM0yRTn98ZKP3H0BVGUnG9S4eIDXUQ5Qpf5ExZqK7CxznkI00I6g
	INtonFI8jwRs8LUDolzeH5PWnIIsqm25XoTY357+gLVVXBmLmwWjK0exlWR6ow==
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
Subject: [PATCH] dmaengine: xilinx: xilinx_dma: Fix dma_device directions
Date: Mon, 16 Mar 2026 23:16:54 +0100
Message-ID: <20260316221728.160139-1-marex@nabladev.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_151743_892259_9D271063 
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

Unlike chan->direction , struct dma_device .directions field is a
bitfield. Turn chan->direction into a bitfield to make it compatible
with struct dma_device .directions .

Fixes: 7e01511443c3 ("dmaengine: xilinx_dma: Set dma_device directions")
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
 drivers/dma/xilinx/xilinx_dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index 7f240fdfe8bb1..6e8e348973a9e 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -3045,7 +3045,7 @@ static int xilinx_dma_chan_probe(struct xilinx_dma_device *xdev,
 		return -EINVAL;
 	}
 
-	xdev->common.directions |= chan->direction;
+	xdev->common.directions |= BIT(chan->direction);
 
 	/* Request the interrupt */
 	chan->irq = of_irq_get(node, chan->tdest);
-- 
2.51.0


