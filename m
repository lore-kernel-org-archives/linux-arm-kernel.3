Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 407C7CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 02:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lxdfaZr2JZcxcbENyNEoTyV9AqrlxHsPutGkwbvtR8E=; b=24C/LfcaDWUtS6eJcFT+0nv/cO
	rX4gYizHHe6YNfM2yNun1tgbzSxZQeRqkwQnCucFL59hgnFEZq+JCZOlii3iS4OKUQO9pIL3/lKKQ
	itmR/hTGLxp5BQLjQrAF6JX4PjtL9SLLEY1CiF6UulBFZR0KTKHxrIEo6cAbtYo1EXDN64jm4pl0/
	QOayU/Ef/FsuSZVQYPnHoBzxXG4Fl39mcdMlbGaxNyiPAPxbKiAUkCzS7ZxWefnBpaSvw4CaXZ5l5
	4826BCxJ39XzvsnsjQn3HcUzoDWoTMpHpCf+t2VR+OWGAfIIJMkIOO/fIvTD1z9vVanP+mhyYtSRs
	ZMRuwVqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa29D-00000000Vp3-0IBb;
	Thu, 18 Jun 2026 02:06:27 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa298-00000000Vod-43FX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 02:06:24 +0000
X-UUID: 48f843406aba11f1aa26b74ffac11d73-20260618
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:3447f558-cb2a-4200-bc7d-813d76b2e642,IP:0,U
	RL:0,TC:0,Content:-25,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-50
X-CID-META: VersionHash:e7bac3a,CLOUDID:40eccdfd8f6688da07010ec25dd2ccf2,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:2,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 48f843406aba11f1aa26b74ffac11d73-20260618
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1779771522; Thu, 18 Jun 2026 10:06:14 +0800
From: Hongling Zeng <zenghongling@kylinos.cn>
To: vkoul@kernel.org,
	Frank.Li@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	mripard@kernel.org,
	arnd@arndb.de
Cc: dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhongling0719@126.com,
	Hongling Zeng <zenghongling@kylinos.cn>,
	Frank Li <Frank.li@oss.nxp.com>
Subject: [PATCH v4] dmaengine: sun6i-dma: Fix memory leak in sun6i_dma_terminate_all
Date: Thu, 18 Jun 2026 10:06:09 +0800
Message-Id: <20260618020609.1155962-1-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_190623_358706_9BEA2DA3 
X-CRM114-Status: GOOD (  10.16  )
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

When terminating DMA transfers, active descriptors are not properly
reclaimed. Only cyclic descriptors were handled, leaving non-cyclic
descriptors and their LLI chains to be permanently leaked.

Fix by using vchan_terminate_vdesc() which handles both cyclic and
non-cyclic descriptors by adding them to desc_terminated queue for
proper cleanup.

Add pchan->desc != pchan->done check to prevent double-adding completed
descriptors, which would corrupt the list.

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Suggested-by: Frank Li <Frank.li@oss.nxp.com>

---
 Change in v2;
 -Add pchan->desc != pchan->done check to prevent race condition
  where completed descriptors could be double-added to desc_completed
  list, causing list corruption
---
 Change in v3:
 -Fix by using vchan_terminate_vdesc() as suggested by Frank Li
---
 Change in v4:
 -Correct the commit message
---
 drivers/dma/sun6i-dma.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 7a79f346250a..134ae840f176 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -946,16 +946,13 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 
 	spin_lock_irqsave(&vchan->vc.lock, flags);
 
-	if (vchan->cyclic) {
-		vchan->cyclic = false;
-		if (pchan && pchan->desc) {
-			struct virt_dma_desc *vd = &pchan->desc->vd;
-			struct virt_dma_chan *vc = &vchan->vc;
-
-			list_add_tail(&vd->node, &vc->desc_completed);
-		}
+	if (pchan && pchan->desc && pchan->desc != pchan->done) {
+		struct virt_dma_desc *vd = &pchan->desc->vd;
+		
+		vchan_terminate_vdesc(vd);
 	}
 
+	vchan->cyclic = false;
 	vchan_get_all_descriptors(&vchan->vc, &head);
 
 	if (pchan) {
-- 
2.25.1


