Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94670D2AB14
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 10:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ckN+CI+XvxtAc4aLpkYX8g6tnnWLc/g+v0ub9LUeR+c=; b=m2cDE6s9sjg25JN+LkWM7Dr6QB
	AfvRXrAucvJOD5peHX0cOC9BbojrARf8/7E80wffkGR3BCfOYCkYih/GCgigbBTqCtoZd3VmDeZGH
	gal3IvVcMhxLib088+VPDWD/f96qwMDQt64Q4wTz9WGT7fsExlfmBmREP4R2f61GVD64a1yBx6dOu
	ZDHbtEhItcTMIjY5HNGMnt64SwmdoX1RNQQrF3FVe9vbDMkaeuj0VxeCnPIOMCu7m4XhLSLh1nbfv
	Gr8Wb7w4R1sEfIY1+K3tj/zO/I5mudqS+dbHBtZ9rgsn4zz4zL2iMrFTcH8tM/S91/JqlY1+FZE/z
	L4MQsDOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5jHM-0000000E08Q-3I8M;
	Tue, 29 Oct 2024 10:16:48 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5iww-0000000DwGG-1nOH;
	Tue, 29 Oct 2024 09:55:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=ckN+C
	I+XvxtAc4aLpkYX8g6tnnWLc/g+v0ub9LUeR+c=; b=W0qonfrOL+NbdHPQ8X6c9
	+RplHHZiTzZ2/IyVI30ClQ0uVBhaNDVzbCtGnZgaufUAhOlgG1JldzF+tj6EfRdt
	tMtpdP/UMuOBo+4CcbF2QJ0Q+swOh8mhIOXjTo3CL+N55IaYw+xJbqXFvSCV+Y3r
	bW+JnlMbaIto/56yaKZjC0=
Received: from ProDesk.. (unknown [58.22.7.114])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3nxoCsSBn8+3dEA--.3291S6;
	Tue, 29 Oct 2024 17:55:23 +0800 (CST)
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
	minhuadotchen@gmail.com,
	detlev.casanova@collabora.com,
	Andy Yan <andy.yan@rock-chips.com>,
	Michael Riesch <michael.riesch@wolfvision.net>
Subject: [PATCH v4 04/14] drm/rockchip: vop2: Fix the windows switch between different layers
Date: Tue, 29 Oct 2024 17:54:57 +0800
Message-ID: <20241029095513.391006-5-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241029095513.391006-1-andyshrk@163.com>
References: <20241029095513.391006-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3nxoCsSBn8+3dEA--.3291S6
X-Coremail-Antispam: 1Uf129KBjvJXoWxZw4fWF4DAFW7Gw15KryfWFg_yoW5ZFy3pF
	15WrWjgw4UKFsIqr9rtr48uF4ayws7Gay7W3Z7tw1rGFyrtr1DJwn8Cr9ayryUGFn3uryY
	yr1j9r909FWqyr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jF2NtUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiMwqHXmcgqJmjwgACs1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_025542_837401_AC12122D 
X-CRM114-Status: GOOD (  15.01  )
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
Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Tested-by: Derek Foreman <derek.foreman@collabora.com>
Tested-by: Michael Riesch <michael.riesch@wolfvision.net> # on RK3568
Tested-by: Detlev Casanova <detlev.casanova@collabora.com>
---

(no changes since v1)

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 38 +++++++++++++++-----
 1 file changed, 29 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index c50d93df84046..4776a227e62c8 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -2364,7 +2364,9 @@ static void vop2_setup_layer_mixer(struct vop2_video_port *vp)
 	struct drm_plane *plane;
 	u32 layer_sel = 0;
 	u32 port_sel;
-	unsigned int nlayer, ofs;
+	u8 old_layer_id;
+	u8 layer_sel_id;
+	unsigned int ofs;
 	u32 ovl_ctrl;
 	int i;
 	struct vop2_video_port *vp0 = &vop2->vps[0];
@@ -2408,9 +2410,28 @@ static void vop2_setup_layer_mixer(struct vop2_video_port *vp)
 	for (i = 0; i < vp->id; i++)
 		ofs += vop2->vps[i].nlayers;
 
-	nlayer = 0;
 	drm_atomic_crtc_for_each_plane(plane, &vp->crtc) {
 		struct vop2_win *win = to_vop2_win(plane);
+		struct vop2_win *old_win;
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
+			layer_sel_id = (layer_sel >> (4 * (plane->state->normalized_zpos + ofs))) & 0xf;
+			if (layer_sel_id == old_win->data->layer_sel_id)
+				break;
+		}
 
 		switch (win->data->phys_id) {
 		case ROCKCHIP_VOP2_CLUSTER0:
@@ -2459,13 +2480,12 @@ static void vop2_setup_layer_mixer(struct vop2_video_port *vp)
 							  0x7);
 		layer_sel |= RK3568_OVL_LAYER_SEL__LAYER(plane->state->normalized_zpos + ofs,
 							 win->data->layer_sel_id);
-		nlayer++;
-	}
-
-	/* configure unused layers to 0x5 (reserved) */
-	for (; nlayer < vp->nlayers; nlayer++) {
-		layer_sel &= ~RK3568_OVL_LAYER_SEL__LAYER(nlayer + ofs, 0x7);
-		layer_sel |= RK3568_OVL_LAYER_SEL__LAYER(nlayer + ofs, 5);
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


