Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D4CCD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 03:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jy4pVzo10VoRMdYrLizzXkeLdpLNx+P37Z0kjmNSZAU=; b=0nm06Mkwn3BAc6LWxlHus68S9S
	S4ubiRuQMtAxWCGMoi315w/v4Smbw80DqY+KykdScJc71DzaDCe3lqbnzy0AqBYpwOnPylxN5H/Lx
	Q3BLAqw8ORJtcGtejiinZ5AgKK+/xzKOm7FcqIS8A5MYyL1mVFylvge0CMiXzyNOnlk9df57qyNjR
	+JWHXm5M+uUwyelIvY7LuQuXIpE3gFfZQENZdwct122344fp0l4z8gt/bQShcd8ifcFNQOBqhvCKX
	pcNw6QfzFRCmZb46ywPxrafrFBaf7x9J0YwFC/2c6+CDveoG4tVdn8tAfBDo6ZOijg8bNCavA3zaN
	5QGxHt3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZKWT-0000000F9Vl-17PE;
	Tue, 16 Jun 2026 03:31:33 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZKWP-0000000F9Ux-36c1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 03:31:31 +0000
X-UUID: d922ccde693311f1aa26b74ffac11d73-20260616
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:a41df261-ddae-454f-8e05-8bdf533db092,IP:0,U
	RL:0,TC:0,Content:-5,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-30
X-CID-META: VersionHash:e7bac3a,CLOUDID:dd2cfc02ff709e3f057f61824139d4d7,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:2,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d922ccde693311f1aa26b74ffac11d73-20260616
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 404894445; Tue, 16 Jun 2026 11:31:23 +0800
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
	Hongling Zeng <zenghongling@kylinos.cn>
Subject: [PATCH] dmaengine: sun6i-dma: Fix memory leak in sun6i_dma_terminate_all
Date: Tue, 16 Jun 2026 11:31:16 +0800
Message-Id: <20260616033116.23490-1-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_203130_115124_8293BF0D 
X-CRM114-Status: GOOD (  10.20  )
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

When terminating a non-cyclic DMA transfer, the active descriptor
is not properly reclaimed. The descriptor is removed from the
desc_issued list in sun6i_dma_start_desc(), but in
sun6i_dma_terminate_all(), only cyclic transfer descriptors are
added to the desc_completed list before cleanup.

For non-cyclic transfers, pchan->desc is set to NULL without first
adding the descriptor back to a list that vchan_get_all_descriptors()
can collect. This causes the descriptor and its associated LLI chain
to be permanently leaked.

Fix by ensuring both cyclic and non-cyclic active descriptors are
added to the desc_completed list before setting pchan->desc to NULL.

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
---
 drivers/dma/sun6i-dma.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 7a79f346250a..97730ba6c874 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -946,16 +946,14 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 
 	spin_lock_irqsave(&vchan->vc.lock, flags);
 
-	if (vchan->cyclic) {
-		vchan->cyclic = false;
-		if (pchan && pchan->desc) {
-			struct virt_dma_desc *vd = &pchan->desc->vd;
-			struct virt_dma_chan *vc = &vchan->vc;
+	if (pchan && pchan->desc) {
+		struct virt_dma_desc *vd = &pchan->desc->vd;
+		struct virt_dma_chan *vc = &vchan->vc;
 
-			list_add_tail(&vd->node, &vc->desc_completed);
-		}
+		list_add_tail(&vd->node, &vc->desc_completed);
 	}
 
+	vchan->cyclic = false;
 	vchan_get_all_descriptors(&vchan->vc, &head);
 
 	if (pchan) {
-- 
2.25.1


