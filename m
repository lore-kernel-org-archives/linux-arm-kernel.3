Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 812D8E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 08:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=25xcwdNxX/lfe8oSFBT2V+pmo+tcl2WqIZwouNsSlgo=; b=E6GPq7YT5bbW2cfPnh6t2X/8Yg
	CIBYvnHS6zClGyrU6yNV3oR2BBjcrq5cJAciWqIbH4N1GZqCpEhAmtuKckK0bte9egXXMbI1o2RXo
	Iz8feqGsfvu9mKeb1c8x/iyORsa7y1ULAzdVC+vb2YyfJTELRyJJExTxBmwaTUl42jaRlDOGinGam
	z9nzVza3Qgg1Q2vOxaoq5g16whcMuHLtUqLoGU7nCgGddTJZ4jbJJf/GHKk87W5XwoGx0IbiiFPge
	MY0wLdd8CTVSBJPc3x1zpTtLBJ83bmr7oO/A0f/AIhugTG3hcLzvovsMMP5RbeLpGXBhBRULHSxjX
	Kj2IvWoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMNOu-00000005zJA-0n4S;
	Sat, 14 Dec 2024 08:21:24 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMNJb-00000005xaC-13u2;
	Sat, 14 Dec 2024 08:15:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=25xcw
	dNxX/lfe8oSFBT2V+pmo+tcl2WqIZwouNsSlgo=; b=OtIxROwWMXDb1NcskdTg5
	1ZzA2jxrTuRCX7kj3a1zSxiMCJB28fYP7JfFuqxH84WlNGpUVv7LMVGM21XQfOJj
	d0SkOzzpWw2lNn36OubxsRmzfoKVudgmk7MspPOqM11oumQn2uwzoDNDT7LGzyao
	Ua3cFOcO725QLh7V5hZsUQ=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD3vwGjPl1n3T_wAQ--.16730S4;
	Sat, 14 Dec 2024 16:15:37 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com,
	krzk+dt@kernel.org,
	s.hauer@pengutronix.de,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	derek.foreman@collabora.com,
	detlev.casanova@collabora.com,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v6 02/16] drm/rockchip: vop2: Fix the windows switch between different layers
Date: Sat, 14 Dec 2024 16:15:10 +0800
Message-ID: <20241214081529.3330243-3-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241214081529.3330243-1-andyshrk@163.com>
References: <20241209122943.2781431-1-andyshrk@163.com>
 <20241214081529.3330243-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3vwGjPl1n3T_wAQ--.16730S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxZw4fWF4DAFW5Zr1xXFyxKrg_yoW5try8pF
	15Xryagw4DKFs0qrnrtr48uF15A397Ga17X3Wxtw1fCa48tr1DGan8AF9ayr1UGFn3uryj
	yr13ur98uFWUtF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jTPfdUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiMxq1XmddNBynbwABsZ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_001555_868733_714CEAA8 
X-CRM114-Status: GOOD (  14.62  )
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

From: Andy Yan <andy.yan@rock-chips.com>

Every layer of vop2 should bind a window, and we also need to make
sure that this window is not used by other layer.

0x5 is a reserved layer sel value on rk3568, but it will select
Cluster3 on rk3588, configure unused layers to 0x5  will lead
alpha blending error on rk3588.

When we bind a window from layerM to layerN, we move the old window
on layerN to layerM.

Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")
Tested-by: Derek Foreman <derek.foreman@collabora.com>
Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v6:
- Limit line length not exceeds 100

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 47 ++++++++++++++------
 1 file changed, 34 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 698e40cea3fa..81207a79530c 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -2541,7 +2541,10 @@ static void vop2_setup_layer_mixer(struct vop2_video_port *vp)
 	struct drm_plane *plane;
 	u32 layer_sel = 0;
 	u32 port_sel;
-	unsigned int nlayer, ofs;
+	u8 layer_id;
+	u8 old_layer_id;
+	u8 layer_sel_id;
+	unsigned int ofs;
 	u32 ovl_ctrl;
 	int i;
 	struct vop2_video_port *vp0 = &vop2->vps[0];
@@ -2585,9 +2588,30 @@ static void vop2_setup_layer_mixer(struct vop2_video_port *vp)
 	for (i = 0; i < vp->id; i++)
 		ofs += vop2->vps[i].nlayers;
 
-	nlayer = 0;
 	drm_atomic_crtc_for_each_plane(plane, &vp->crtc) {
 		struct vop2_win *win = to_vop2_win(plane);
+		struct vop2_win *old_win;
+
+		layer_id = (u8)(plane->state->normalized_zpos + ofs);
+
+		/*
+		 * Find the layer this win bind in old state.
+		 */
+		for (old_layer_id = 0; old_layer_id < vop2->data->win_size; old_layer_id++) {
+			layer_sel_id = (layer_sel >> (4 * old_layer_id)) & 0xf;
+			if (layer_sel_id == win->data->layer_sel_id)
+				break;
+		}
+
+		/*
+		 * Find the win bind to this layer in old state
+		 */
+		for (i = 0; i < vop2->data->win_size; i++) {
+			old_win = &vop2->win[i];
+			layer_sel_id = (layer_sel >> (4 * layer_id)) & 0xf;
+			if (layer_sel_id == old_win->data->layer_sel_id)
+				break;
+		}
 
 		switch (win->data->phys_id) {
 		case ROCKCHIP_VOP2_CLUSTER0:
@@ -2632,17 +2656,14 @@ static void vop2_setup_layer_mixer(struct vop2_video_port *vp)
 			break;
 		}
 
-		layer_sel &= ~RK3568_OVL_LAYER_SEL__LAYER(plane->state->normalized_zpos + ofs,
-							  0x7);
-		layer_sel |= RK3568_OVL_LAYER_SEL__LAYER(plane->state->normalized_zpos + ofs,
-							 win->data->layer_sel_id);
-		nlayer++;
-	}
-
-	/* configure unused layers to 0x5 (reserved) */
-	for (; nlayer < vp->nlayers; nlayer++) {
-		layer_sel &= ~RK3568_OVL_LAYER_SEL__LAYER(nlayer + ofs, 0x7);
-		layer_sel |= RK3568_OVL_LAYER_SEL__LAYER(nlayer + ofs, 5);
+		layer_sel &= ~RK3568_OVL_LAYER_SEL__LAYER(layer_id, 0x7);
+		layer_sel |= RK3568_OVL_LAYER_SEL__LAYER(layer_id, win->data->layer_sel_id);
+		/*
+		 * When we bind a window from layerM to layerN, we also need to move the old
+		 * window on layerN to layerM to avoid one window selected by two or more layers.
+		 */
+		layer_sel &= ~RK3568_OVL_LAYER_SEL__LAYER(old_layer_id, 0x7);
+		layer_sel |= RK3568_OVL_LAYER_SEL__LAYER(old_layer_id, old_win->data->layer_sel_id);
 	}
 
 	vop2_writel(vop2, RK3568_OVL_LAYER_SEL, layer_sel);
-- 
2.34.1


