Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4805AD591A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 16:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hZTh8rx5jaZIu1JmpI1tEkcFD/loPvXAusXPhPMmzCQ=; b=Z28PVr25Voe0a1JA5m/PmRGrko
	ck1OhmHC+pkmOyjRTPounXlzYYT+1gBXGvUDOiOIUSSkMVFcQ8wPK1xmyQUuwjG7D7jfurRFq8NVE
	t6in1yPBgXO7mCg9+zT7MZOf7sMLNrFj6ZywadEFBkW3ZxoDYIia053QYftZCRpYaDdpH3Owrl01f
	pps10Qmyy6tWLyTW/t789vfpVo2QAiL0lpoLfNCQn+f8aHfBseKIWY/hnyEOHI+HAiItPrr+5FAQL
	hsPq2zfJACAUV90xUJgpcRKK7hOBULpmxBIRqNpkjIv0WO5XeGGjl1rjvOiSRf1cT3OY3wgHhWP6P
	/3IXMNwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDREt-0000000D3Bh-3vLl;
	Tue, 19 Nov 2024 16:38:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDRDx-0000000D2wq-1Kfp;
	Tue, 19 Nov 2024 16:37:10 +0000
X-UUID: 821b8c54a69411ef9048ed6ed365623b-20241119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=hZTh8rx5jaZIu1JmpI1tEkcFD/loPvXAusXPhPMmzCQ=;
	b=eOqDrsvoXTr/gXyZ80o8bgCtG8w4FM0cs9z1zaoIrIy3nuY62RhH454pShgpz4qH7kXP55HiXfBHeSz6/w4+rhtHBLzUPoXYuDpc47Yjne5KdalE5a85NCWCnxe2YWzjsxcmenJZ+gS4l2OYXU0+E8NUnn2rw3Ju8bTJPP+XRpU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:339b7bfe-a0fe-4a43-ac07-1ac09a7a5884,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:572ee55c-f18b-4d56-b49c-93279ee09144,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 821b8c54a69411ef9048ed6ed365623b-20241119
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1426992218; Tue, 19 Nov 2024 09:37:03 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Nov 2024 00:37:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Nov 2024 00:37:00 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shawn Sung <shawn.sung@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, "Nancy
 Lin" <nancy.lin@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Fei Shao
	<fshao@chromium.org>
Subject: [PATCH v2] drm/mediatek: Move mtk_crtc_finish_page_flip() to ddp_cmdq_cb()
Date: Wed, 20 Nov 2024 00:36:58 +0800
Message-ID: <20241119163658.31405-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--8.676900-8.000000
X-TMASE-MatchedRID: 8X2PBhRYyqJSa+wzDj9ksangbqTYC4GHt07/cudGAnu6pZ/o2Hu2YQTm
	MKJk1G078AKeCfcnVWUQ3Uikp7+aiv+rTYoF7KeeL3ulviDkcK0kMBkEieOjZqpEew2E+iO0CV5
	GGxwE9Vw/rxdBgA9yKjyPpWYsRYoZAM0/G7XUdePil2r2x2PwtWKaLwu81+avv8D7QPW2jo9SXT
	dIhjp97ZbQdE1tv0FOgDLqnrRlXrZ8nn9tnqel2DsAVzN+Ov/sdkdKgE1mb6Vc4GDdqUVFL4VfS
	4blFaAN8O+qXv6oinTxvX8/wgJcbw==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.676900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 422B217728EE5DF2CA476245A65AC1711B409E304104063999E2915D8500F1402000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_083709_359580_D0D9A558 
X-CRM114-Status: GOOD (  13.02  )
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
 drivers/gpu/drm/mediatek/mtk_crtc.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index eb0e1233ad04..0d57863c075a 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -109,15 +109,19 @@ static void mtk_crtc_finish_page_flip(struct mtk_crtc *mtk_crtc)
 static void mtk_drm_finish_page_flip(struct mtk_crtc *mtk_crtc)
 {
 	unsigned long flags;
+	struct drm_crtc *crtc = &mtk_crtc->base;
+	struct mtk_drm_private *priv = crtc->dev->dev_private;
 
 	drm_crtc_handle_vblank(&mtk_crtc->base);
 
-	spin_lock_irqsave(&mtk_crtc->config_lock, flags);
-	if (!mtk_crtc->config_updating && mtk_crtc->pending_needs_vblank) {
-		mtk_crtc_finish_page_flip(mtk_crtc);
-		mtk_crtc->pending_needs_vblank = false;
+	if (priv->data->shadow_register) {
+		spin_lock_irqsave(&mtk_crtc->config_lock, flags);
+		if (!mtk_crtc->config_updating && mtk_crtc->pending_needs_vblank) {
+			mtk_crtc_finish_page_flip(mtk_crtc);
+			mtk_crtc->pending_needs_vblank = false;
+		}
+		spin_unlock_irqrestore(&mtk_crtc->config_lock, flags);
 	}
-	spin_unlock_irqrestore(&mtk_crtc->config_lock, flags);
 }
 
 static void mtk_crtc_destroy(struct drm_crtc *crtc)
@@ -284,10 +288,8 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 	state = to_mtk_crtc_state(mtk_crtc->base.state);
 
 	spin_lock_irqsave(&mtk_crtc->config_lock, flags);
-	if (mtk_crtc->config_updating) {
-		spin_unlock_irqrestore(&mtk_crtc->config_lock, flags);
+	if (mtk_crtc->config_updating)
 		goto ddp_cmdq_cb_out;
-	}
 
 	state->pending_config = false;
 
@@ -315,10 +317,15 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
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
-- 
2.43.0


