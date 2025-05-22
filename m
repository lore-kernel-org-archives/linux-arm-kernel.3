Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E58FEC54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 08:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d6+8TKL9ybPi8GR52+9DRexy0HiUe+IYVYfqzERk5rg=; b=s+eR1SpS7JdQmTAGSMNben3Xl8
	C1qyyxYVGWSSrp5eoyyO+GinSM/notNHVyhAScVTA5Uu846bdHVmj5HtFRKf/QbgS50T9yoWv9FXQ
	lvkpjctkaTCV60kJ/MpF3CIPvc5Uh9eHAlHYvFh8fSysW/GnxIKKBt/G/xvW83/Fd4UXke5xp6Rtv
	6IVQaFPRTtHQdrr5jb/g4nx1AJlzMnqwN+gtR6Ju/2BrG+4kcr5CDxOCNWTxWQ8CYjlPzYuO5O4Ke
	4ZK6C9G1PcPeCHF3BXjB8bCNeeK5fwyDBdctUExMgku1ZnZznONEBktg/IeZe9Unc3PInZPSce2uo
	z10+Z0wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI1m4-00000000OdB-03Bu;
	Thu, 22 May 2025 08:59:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI1ej-00000000MnD-3lX7;
	Thu, 22 May 2025 08:52:02 +0000
X-UUID: 0231a67236ea11f08d385d50fb11b32d-20250522
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=d6+8TKL9ybPi8GR52+9DRexy0HiUe+IYVYfqzERk5rg=;
	b=tdFOBWq3xnxVgWEXWcV+6sdoZjQXxGwkO0qzWu2vzQuwiZwrRJ3UZM2RLWqJueGlbDUlAIADjdokuqFzZHNBmvPWVZadxfMxfKybNOear7sDzb7J5B6OQdKujL9BvLnea55NcTl02xjL+0TYlAlNlUZNDGdFvf5bCueV2/rXPfE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:9a3eae55-57b6-48d0-92e8-8b0cd9a3ed92,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:122c29f1-2ded-45ed-94e2-b3e9fa87100d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 0231a67236ea11f08d385d50fb11b32d-20250522
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 846204219; Thu, 22 May 2025 01:51:53 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 22 May 2025 16:51:50 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 22 May 2025 16:51:50 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Nancy Lin
	<nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Paul-PL
 Chen <paul-pl.chen@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
	Zhenxing Qin <zhenxing.qin@mediatek.com>, Sirius Wang
	<sirius.wang@mediatek.com>, Xavier Chang <xavier.chang@mediatek.com>, Fei
 Shao <fshao@chromium.org>, Chen-yu Tsai <wenst@chromium.org>,
	<dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH] drm/mediatek: Add wait_event_timeout when disabling plane
Date: Thu, 22 May 2025 16:34:24 +0800
Message-ID: <20250522085149.3361598-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_015201_942861_C0003F1C 
X-CRM114-Status: GOOD (  16.01  )
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
---
 drivers/gpu/drm/mediatek/mtk_crtc.c  | 30 ++++++++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_crtc.h  |  1 +
 drivers/gpu/drm/mediatek/mtk_plane.c |  5 +++++
 3 files changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 8f6fba4217ec..944a3d1e5ec9 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -719,6 +719,36 @@ int mtk_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *plane,
 	return 0;
 }
 
+void mtk_crtc_plane_disable(struct drm_crtc *crtc, struct drm_plane *plane)
+{
+	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
+	struct mtk_plane_state *plane_state = to_mtk_plane_state(plane->state);
+	int i;
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
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	/* wait for planes to be disabled by cmdq */
+	if (mtk_crtc->cmdq_client.chan)
+		wait_event_timeout(mtk_crtc->cb_blocking_queue,
+				   mtk_crtc->cmdq_vblank_cnt == 0,
+				   msecs_to_jiffies(500));
+#endif
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


