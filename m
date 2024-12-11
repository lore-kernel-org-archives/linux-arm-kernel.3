Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92791E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 03:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KnNV5c6i3ecUY3j6qPPx9bNvIFKxnCwlFH5YIesd2rs=; b=4yUCxQayoH8lOi3Slea8d/Hwry
	xS5nzWLlG/9xxAbNJKiDJILjaS+kdVFVliZSTSupNu4EI0uAInS/z9neStTmLJsQ+hOpWceZErzr5
	5csx8T9s5DpPlOh6fMAgnMudydalDWRd9/6T5HCgZJtGNaiFV3I7ZEfjBk2UzNA72ssUtPnFq5rVM
	wsZZYT86DIwta5Vqu3/K5Sprblk5Xhk+3ZWHE+P3T3cuVBNZD6c3+wWHzktxhsLDrtxN+IBSA9X3L
	EuR9zIeF5rnsEgt1+IjF/LjR300K0KJABpA51HdcPfi1+Uayfq+IKB9WYbPEs6EP0gLKNUvfFuzn6
	FCaKgzkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLDiW-0000000DhNZ-0Ydf;
	Wed, 11 Dec 2024 03:48:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLDh9-0000000DgyO-3Pcn;
	Wed, 11 Dec 2024 03:47:29 +0000
X-UUID: a219095cb77211ef82ff63e91e7eb18c-20241210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=KnNV5c6i3ecUY3j6qPPx9bNvIFKxnCwlFH5YIesd2rs=;
	b=R3Cpr8vefDH4HVdyK9O6mPyGzzdHzpdcK9aAGJm5DT83azdXkDxZgTh3DaH9upu9iScK3R1LJgqVWDQ+TmHwL1lW7kqmaqu0xMeWxin5tcP+GGKo2IbCWnh1dwt9LhwSYZMOZ/TXCSWE3R9B19IWoWse7SmnmMRwhead33kI/Tk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:cfc4f8e6-1055-4db7-ae09-c94e738f6576,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:e6cb2dc1-1c82-4420-82d9-d6eb228f5c4a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a219095cb77211ef82ff63e91e7eb18c-20241210
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1720189126; Tue, 10 Dec 2024 20:47:24 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 11 Dec 2024 11:47:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 11 Dec 2024 11:47:16 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<fshao@chromium.org>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, "Singo
 Chang" <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, "Shawn
 Sung" <shawn.sung@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4] drm/mediatek: Move mtk_crtc_finish_page_flip() to ddp_cmdq_cb()
Date: Wed, 11 Dec 2024 11:47:16 +0800
Message-ID: <20241211034716.29241-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--9.420600-8.000000
X-TMASE-MatchedRID: tjEGPsGKY1JSa+wzDj9ksangbqTYC4GHt07/cudGAnu6pZ/o2Hu2YQTm
	MKJk1G078AKeCfcnVWUQ3Uikp7+aiv+rTYoF7KeeL3ulviDkcK0kMBkEieOjZqpEew2E+iO0CV5
	GGxwE9Vw/rxdBgA9yKjyPpWYsRYoZAM0/G7XUdePil2r2x2PwtWKaLwu81+avv8D7QPW2jo8IqG
	5TetjhMNNQo22x5OZQhtfOGOSyK2kfE8yM4pjsDwtuKBGekqUpI/NGWt0UYPBS3O7QoagJjZ6/z
	6PhY0H+FA2ABySRYhQv0CV5/kAJ/mmlO+ipwTmd
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--9.420600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 04C59D807B4B50C41741B7F8389D91AAF15E934165643F680D599E0CD010D9452000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_194727_864480_44A7317C 
X-CRM114-Status: GOOD (  12.30  )
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

mtk_crtc_finish_page_flip() is used to notify userspace that a
page flip has been completed, allowing userspace to free the frame
buffer of the last frame and commit the next frame.

In MediaTek's hardware design for configuring display hardware by using
GCE, `DRM_EVENT_FLIP_COMPLETE` should be notified to userspace after
GCE has finished configuring all display hardware settings for each
atomic_commit().

Currently, mtk_crtc_finish_page_flip() cannot guarantee that GCE has
configured all the display hardware settings of the last frame.
Therefore, to increase the accuracy of the timing for notifying
`DRM_EVENT_FLIP_COMPLETE` to userspace, mtk_crtc_finish_page_flip()
should be moved to ddp_cmdq_cb().

Fixes: 7f82d9c43879 ("drm/mediatek: Clear pending flag when cmdq packet is done")
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_crtc.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index eb0e1233ad04..5674f5707cca 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -112,6 +112,11 @@ static void mtk_drm_finish_page_flip(struct mtk_crtc *mtk_crtc)
 
 	drm_crtc_handle_vblank(&mtk_crtc->base);
 
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	if (mtk_crtc->cmdq_client.chan)
+		return;
+#endif
+
 	spin_lock_irqsave(&mtk_crtc->config_lock, flags);
 	if (!mtk_crtc->config_updating && mtk_crtc->pending_needs_vblank) {
 		mtk_crtc_finish_page_flip(mtk_crtc);
@@ -284,10 +289,8 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 	state = to_mtk_crtc_state(mtk_crtc->base.state);
 
 	spin_lock_irqsave(&mtk_crtc->config_lock, flags);
-	if (mtk_crtc->config_updating) {
-		spin_unlock_irqrestore(&mtk_crtc->config_lock, flags);
+	if (mtk_crtc->config_updating)
 		goto ddp_cmdq_cb_out;
-	}
 
 	state->pending_config = false;
 
@@ -315,10 +318,15 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 		mtk_crtc->pending_async_planes = false;
 	}
 
-	spin_unlock_irqrestore(&mtk_crtc->config_lock, flags);
-
 ddp_cmdq_cb_out:
 
+	if (mtk_crtc->pending_needs_vblank) {
+		mtk_crtc_finish_page_flip(mtk_crtc);
+		mtk_crtc->pending_needs_vblank = false;
+	}
+
+	spin_unlock_irqrestore(&mtk_crtc->config_lock, flags);
+
 	mtk_crtc->cmdq_vblank_cnt = 0;
 	wake_up(&mtk_crtc->cb_blocking_queue);
 }
@@ -606,13 +614,18 @@ static void mtk_crtc_update_config(struct mtk_crtc *mtk_crtc, bool needs_vblank)
 		 */
 		mtk_crtc->cmdq_vblank_cnt = 3;
 
+		spin_lock_irqsave(&mtk_crtc->config_lock, flags);
+		mtk_crtc->config_updating = false;
+		spin_unlock_irqrestore(&mtk_crtc->config_lock, flags);
+
 		mbox_send_message(mtk_crtc->cmdq_client.chan, cmdq_handle);
 		mbox_client_txdone(mtk_crtc->cmdq_client.chan, 0);
 	}
-#endif
+#else
 	spin_lock_irqsave(&mtk_crtc->config_lock, flags);
 	mtk_crtc->config_updating = false;
 	spin_unlock_irqrestore(&mtk_crtc->config_lock, flags);
+#endif
 
 	mutex_unlock(&mtk_crtc->hw_lock);
 }
-- 
2.43.0


