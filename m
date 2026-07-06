Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D74C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 06:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D8wm8Qiid14jSIYOVluI1+tJsGYMTl3nXbbBAT6YG0Q=; b=S/ocQJZHKtfNWh7sD/DPgcaV4j
	b/4jS5CsZJmI/hIU1H4hyLbJWJVjZcmP46Jm1TXRdrutu3pHfu6QVRII3TYLHmLm4JtMeG5ocSzyM
	5jydu35Sp6Iz4X5F0i166imfKgTmqV3PELb/YnT1ZamhrKyS9ZSbEcKPxo7a9HKORqSSKaxjh8V+A
	EBaKQNMebmycj5LMQfFMPXjNI+73D5G+46hlF3LpSsG+rdF4BujHwK0Iv+Km+JhdaUz8L8YgM8oar
	5tapVDLyWbb+zc02vTQc51EyqQX+4/vm6mik8hu/MoPEkfJNaWWxJSyz1JdgGdeCSYUeFRBWHM+GE
	ZJiC/Olg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgd1L-0000000Be5Q-4Aj0;
	Mon, 06 Jul 2026 06:41:35 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgd1I-0000000Be4p-3cnO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 06:41:34 +0000
X-UUID: b69ecaaa790511f1aa26b74ffac11d73-20260706
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:d20ce86f-3bbb-488a-9048-541473a1002f,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e7bac3a,CLOUDID:a415efcf5264c8eaf3c6ec4dda9f1c01,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b69ecaaa790511f1aa26b74ffac11d73-20260706
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1445086435; Mon, 06 Jul 2026 14:41:27 +0800
From: Hongling Zeng <zenghongling@kylinos.cn>
To: vkoul@kernel.org,
	Frank.Li@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhongling0719@126.com,
	Hongling Zeng <zenghongling@kylinos.cn>,
	stable@vger.kernel.org
Subject: [PATCH] dmaengine: sun6i: Fix physical channel index in interrupt handler
Date: Mon,  6 Jul 2026 14:41:23 +0800
Message-Id: <20260706064123.66035-1-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_234133_216960_77CE6DF4 
X-CRM114-Status: GOOD (  10.81  )
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

The interrupt handler iterates over register banks in the outer loop
(i = 0, 1, ...), where each bank covers DMA_IRQ_CHAN_NR (8) channels.
However, the physical channel lookup uses only the inner loop index j,
ignoring the bank offset i.

This means for SoCs with more than 8 DMA channels, interrupts from
physical channels 8 and above are incorrectly routed to physical
channels 0-7. This can falsely complete descriptors for unrelated
channels, potentially causing silent memory corruption.

Fix by using the absolute channel index (i * DMA_IRQ_CHAN_NR + j).

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Cc: stable@vger.kernel.org
Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
---
 drivers/dma/sun6i-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index a6487971ad09..fcc88a74d821 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -559,7 +559,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 		writel(status, sdev->base + DMA_IRQ_STAT(i));
 
 		for (j = 0; (j < DMA_IRQ_CHAN_NR) && status; j++) {
-			pchan = sdev->pchans + j;
+			pchan = sdev->pchans + i * DMA_IRQ_CHAN_NR + j;
 			vchan = pchan->vchan;
 			if (vchan && (status & vchan->irq_type)) {
 				if (vchan->cyclic) {
-- 
2.25.1


