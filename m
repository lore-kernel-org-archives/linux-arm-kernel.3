Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E5E2CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 06:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D1pm1QgD/dXjIHVXNpMU0Nrkwm99aWIpMPtr64kDXpc=; b=JlNBh+uHuK0i3C4DDESdMh4VWF
	ygm1q4JZS0N+1vZvAlBgC95s8/zG2Wqsxm7I59LcFe/Ey1RGvD9uIm3cNPyaxShzjh4wCE13KAU/5
	nGcFo2ch3wnTdHrxve1mTME4RVRotvAqVMQFNoAbNQ3twiYcSaptFyPl6/VCEygfOgEvFbMIQj9tn
	QzZCA/mKRr+6zS5imoZOy0q2tDHkXWky+HrAgaV1WA3SA9uiQQVFvj9b7Xy1I9FoBwNaiZuoVhdCr
	B6HpPXJMUmwvD3U9qiJJCHuuogQPXcV03K0g8enVUf2cl4zb1j3OI6TAF/wt/4Rf8f9a5MJ/PKSvm
	LRp3erXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXZ23-00000008oWR-0W6I;
	Thu, 11 Jun 2026 06:36:51 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXZ20-00000008oW0-14Ls
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 06:36:50 +0000
X-UUID: e4893022655f11f1aa26b74ffac11d73-20260611
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:dd46af78-ef48-42df-b0aa-f7aa64b8b7cc,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:01b8394cc7936b409385b5ef72af8116,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e4893022655f11f1aa26b74ffac11d73-20260611
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1353217616; Thu, 11 Jun 2026 14:36:35 +0800
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
Subject: [PATCH] dmaengine: sun6i-dma: Fix use-after-free in error handling paths
Date: Thu, 11 Jun 2026 14:36:31 +0800
Message-Id: <20260611063631.96566-1-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_233648_632270_7F216248 
X-CRM114-Status: UNSURE (   8.06  )
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

In error handling paths, the for loop frees v_lli in the loop body,
then accesses v_lli->v_lli_next and v_lli->p_lli_next in the
increment expression, which is use-after-free.

Fix by saving both the next virtual and physical pointers before
freeing the current node.

Fixes: 555859308723 ("dmaengine: Add driver for Allwinner sun6i DMA")
Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
---
 drivers/dma/sun6i-dma.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index a9a254dbf8cb..eb9c4ae87ac8 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -788,9 +788,15 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_slave_sg(
 	return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
 
 err_lli_free:
-	for (p_lli = txd->p_lli, v_lli = txd->v_lli; v_lli;
-	     p_lli = v_lli->p_lli_next, v_lli = v_lli->v_lli_next)
+	p_lli = txd->p_lli;
+	v_lli = txd->v_lli;
+	while (v_lli) {
+		struct sun6i_dma_lli *next_v_lli = v_lli->v_lli_next;
+		dma_addr_t next_p_lli = v_lli->p_lli_next;
 		dma_pool_free(sdev->pool, v_lli, p_lli);
+		v_lli = next_v_lli;
+		p_lli = next_p_lli;
+	}
 	kfree(txd);
 	return NULL;
 }
@@ -869,9 +875,15 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
 	return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
 
 err_lli_free:
-	for (p_lli = txd->p_lli, v_lli = txd->v_lli; v_lli;
-	     p_lli = v_lli->p_lli_next, v_lli = v_lli->v_lli_next)
+	p_lli = txd->p_lli;
+	v_lli = txd->v_lli;
+	while (v_lli) {
+		struct sun6i_dma_lli *next_v_lli = v_lli->v_lli_next;
+		dma_addr_t next_p_lli = v_lli->p_lli_next;
 		dma_pool_free(sdev->pool, v_lli, p_lli);
+		v_lli = next_v_lli;
+		p_lli = next_p_lli;
+	}
 	kfree(txd);
 	return NULL;
 }
-- 
2.25.1


