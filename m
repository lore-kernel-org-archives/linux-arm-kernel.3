Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B462C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 12:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nqHVGMxhDg52YSCi1jgl7ccHJpCWVWC3C9YGgQGOt9A=; b=ivRWXMVsA2apfmceZxhgSnvQSS
	r3N4siFasP+b3wvvo6C3fFxx+TDqgUmTVROfPeOoPOHmat1AFUUQPimM++jhpfhmJcnJKSdgmfEKI
	E/Dhq0aD5iOnze3qQZQZlRch4n2JFGJY4JqW7R0sSeF4yQbFKr5zfzNcCgm4HYCmwRxnfK1reuBpF
	pjWTKxr/lPryEWpJ+V1bElEcHxaMuHLhDS84SyWyYZy68Ev+8dlKJZ9TucX0JNe/3pr5kHRdTf04Y
	ip6m0WSQrlmrNXwDBNZYdq3eytCVDyRTR7GmX5L3gTEyQOUmWGM5iFIxg7XnJP80r1TQsmHFuxEsC
	y4lrgfyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU2bp-00000005XOA-2o2c;
	Tue, 24 Jun 2025 12:18:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU1tA-00000005RGq-1n9r;
	Tue, 24 Jun 2025 11:32:33 +0000
X-UUID: e7e1f0b450ee11f09eb0dd999d3936bf-20250624
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=nqHVGMxhDg52YSCi1jgl7ccHJpCWVWC3C9YGgQGOt9A=;
	b=Gq40pf+SfwLUvv9DiX3g+fwWPt6caPt6bBMiwRseDJBIzc9jWlOz9bZtaP3qfSwo/HlYOLrfzOdc9sfppRN4Y7dC40//bhrcjaosr0sFgNYlKQnY9O+BPRFPTOz+RW6Rg3uPU3gUYV47caj8iH7V9wIRffY53MTAeAmmL4mTA9k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:cc951a3e-07fc-45d6-ae9f-190012713afc,IP:0,UR
	L:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-30
X-CID-META: VersionHash:9eb4ff7,CLOUDID:42e82582-cc21-4267-87cf-e75829fa6365,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:2,IP:nil
	,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e7e1f0b450ee11f09eb0dd999d3936bf-20250624
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1066440267; Tue, 24 Jun 2025 04:32:27 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 24 Jun 2025 19:32:23 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 24 Jun 2025 19:32:23 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, David Airlie <airlied@gmail.com>
CC: Philipp Zabel <p.zabel@pengutronix.de>, Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>, Jason-JH Lin
	<jason-jh.lin@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Paul-PL Chen <paul-pl.chen@mediatek.com>,
	Yongqiang Niu <yongqiang.niu@mediatek.com>, Zhenxing Qin
	<zhenxing.qin@mediatek.com>, Xiandong Wang <xiandong.wang@mediatek.com>,
	Sirius Wang <sirius.wang@mediatek.com>, Xavier Chang
	<xavier.chang@mediatek.com>, Jarried Lin <jarried.lin@mediatek.com>, Fei Shao
	<fshao@chromium.org>, Chen-yu Tsai <wenst@chromium.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2] drm/mediatek: Add wait_event_timeout when disabling plane
Date: Tue, 24 Jun 2025 19:31:41 +0800
Message-ID: <20250624113223.443274-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_043232_484044_4FC1A314 
X-CRM114-Status: GOOD (  17.02  )
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

Our hardware registers are set through GCE, not by the CPU.
DRM might assume the hardware is disabled immediately after calling
atomic_disable() of drm_plane, but it is only truly disabled after the
GCE IRQ is triggered.

Additionally, the cursor plane in DRM uses async_commit, so DRM will
not wait for vblank and will free the buffer immediately after calling
atomic_disable().

To prevent the framebuffer from being freed before the layer disable
settings are configured into the hardware, which can cause an IOMMU
fault error, a wait_event_timeout has been added to wait for the
ddp_cmdq_cb() callback,indicating that the GCE IRQ has been triggered.

Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")
Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_crtc.c  | 31 ++++++++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_crtc.h  |  1 +
 drivers/gpu/drm/mediatek/mtk_plane.c |  5 +++++
 3 files changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 8f6fba4217ec..0c856cc679de 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -719,6 +719,37 @@ int mtk_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *plane,
 	return 0;
 }
 
+void mtk_crtc_plane_disable(struct drm_crtc *crtc, struct drm_plane *plane)
+{
+	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
+	struct mtk_plane_state *plane_state = to_mtk_plane_state(plane->state);
+	int i;
+
+	/* no need to wait for disabling the plane by CPU */
+	if (!mtk_crtc->cmdq_client.chan)
+		return;
+
+	if (!mtk_crtc->enabled)
+		return;
+
+	/* set pending plane state to disabled */
+	for (i = 0; i < mtk_crtc->layer_nr; i++) {
+		struct drm_plane *mtk_plane = &mtk_crtc->planes[i];
+		struct mtk_plane_state *mtk_plane_state = to_mtk_plane_state(mtk_plane->state);
+
+		if (mtk_plane->index == plane->index) {
+			memcpy(mtk_plane_state, plane_state, sizeof(*plane_state));
+			break;
+		}
+	}
+	mtk_crtc_update_config(mtk_crtc, false);
+
+	/* wait for planes to be disabled by CMDQ */
+	wait_event_timeout(mtk_crtc->cb_blocking_queue,
+			   mtk_crtc->cmdq_vblank_cnt == 0,
+			   msecs_to_jiffies(500));
+}
+
 void mtk_crtc_async_update(struct drm_crtc *crtc, struct drm_plane *plane,
 			   struct drm_atomic_state *state)
 {
diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.h b/drivers/gpu/drm/mediatek/mtk_crtc.h
index 388e900b6f4d..828f109b83e7 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.h
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.h
@@ -21,6 +21,7 @@ int mtk_crtc_create(struct drm_device *drm_dev, const unsigned int *path,
 		    unsigned int num_conn_routes);
 int mtk_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *plane,
 			 struct mtk_plane_state *state);
+void mtk_crtc_plane_disable(struct drm_crtc *crtc, struct drm_plane *plane);
 void mtk_crtc_async_update(struct drm_crtc *crtc, struct drm_plane *plane,
 			   struct drm_atomic_state *plane_state);
 struct device *mtk_crtc_dma_dev_get(struct drm_crtc *crtc);
diff --git a/drivers/gpu/drm/mediatek/mtk_plane.c b/drivers/gpu/drm/mediatek/mtk_plane.c
index 655106bbb76d..59edbe26f01e 100644
--- a/drivers/gpu/drm/mediatek/mtk_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_plane.c
@@ -285,9 +285,14 @@ static void mtk_plane_atomic_disable(struct drm_plane *plane,
 	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
 									   plane);
 	struct mtk_plane_state *mtk_plane_state = to_mtk_plane_state(new_state);
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
+									   plane);
+
 	mtk_plane_state->pending.enable = false;
 	wmb(); /* Make sure the above parameter is set before update */
 	mtk_plane_state->pending.dirty = true;
+
+	mtk_crtc_plane_disable(old_state->crtc, plane);
 }
 
 static void mtk_plane_atomic_update(struct drm_plane *plane,
-- 
2.43.0


