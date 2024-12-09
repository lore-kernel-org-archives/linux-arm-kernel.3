Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12773E77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 12:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7X6o0hpzj2530qDO1Llbx05J6NTctHz1/3MyYnTP84U=; b=OrNGl3lFGTTGVQ/MaHqLexuA0j
	VRugDqMkIHlF2PdpnBhQwLqpRcSnaibyYgV3aZeKH8rAKusdxIfPDhDDGfrhAGyEOIO7Qs00jfZoM
	nAhWtnv2KLj9XHmv1H0NS7aOvQu9Rbmjs2xBdDerjyv/Q1wqq323wd0qgV3QIiir85Bc24L7oMTf2
	kQQ8nPzwR3k8jQT/I6aQpUl0VwVa6Id0TYsLivdQeH63KBqpupkaeh+AnZblAfRD99UVS6Ru2Ms/Y
	p6XW5DhdC4gXeQeT8qvd93uVMFLNyDIo9JacH+maOZ7Yg6siKXsHjKeZpX9rosYNTxP72F1977F9R
	Bhn6isOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKcvg-00000007hFs-0SvZ;
	Mon, 09 Dec 2024 12:32:00 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKctz-00000007gdH-3H7S;
	Mon, 09 Dec 2024 12:30:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=7X6o0
	hpzj2530qDO1Llbx05J6NTctHz1/3MyYnTP84U=; b=B0G1QN62PrVfCuzlO4ilx
	UfQvObXYIcHzTqcufrmCp70HvxRHAQwQ0TvyOQcZ56Jbd9XFe3+1CeBOfFu4dw5g
	0uzsFWeTA9csdet55GFzKx8ij2ILJ/GFh1uSplFd4S5Fy7pWnnFVg9/vuosAjMmT
	0zaLucOAZp7wE79BJ7X+BQ=
Received: from ProDesk.. (unknown [58.22.7.114])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgD3Woe44lZnubZICA--.5849S12;
	Mon, 09 Dec 2024 20:29:58 +0800 (CST)
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
Subject: [PATCH v5 07/18] drm/rockchip: vop2: Check linear format for Cluster windows on rk3566/8
Date: Mon,  9 Dec 2024 20:29:20 +0800
Message-ID: <20241209122943.2781431-11-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241209122943.2781431-1-andyshrk@163.com>
References: <20241209122943.2781431-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PCgvCgD3Woe44lZnubZICA--.5849S12
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zr4kKw1ktFWfAFWkXw1rXrb_yoW8Ar45pF
	ZrCrZ0gr4UGrWjgr97JrsxCr4akwn2kay7Jrn3Gw13tFyxtr1DJwn8CF97Cr43Ary7C342
	yF1ftryDWFW2vr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jsa9-UUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqQuwXmdW3c3W3QAAsm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_043016_191850_B1C00AFB 
X-CRM114-Status: GOOD (  10.34  )
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

The Cluster windows on rk3566/8 only support afbc mode.

Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")
Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v5:
- Added in V5

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index d7ddeec27c7d..bd8db45eeba6 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1165,6 +1165,7 @@ static int vop2_plane_atomic_check(struct drm_plane *plane,
 	struct vop2_video_port *vp;
 	struct vop2 *vop2;
 	const struct vop2_data *vop2_data;
+	struct vop2_win *win;
 	struct drm_rect *dest = &pstate->dst;
 	struct drm_rect *src = &pstate->src;
 	int min_scale = FRAC_16_16(1, 8);
@@ -1178,6 +1179,7 @@ static int vop2_plane_atomic_check(struct drm_plane *plane,
 	vp = to_vop2_video_port(crtc);
 	vop2 = vp->vop2;
 	vop2_data = vop2->data;
+	win = to_vop2_win(plane);
 
 	cstate = drm_atomic_get_existing_crtc_state(pstate->state, crtc);
 	if (WARN_ON(!cstate))
@@ -1215,6 +1217,16 @@ static int vop2_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 	}
 
+	if (vop2->data->soc_id == 3568 || vop2->data->soc_id == 3566) {
+		if (vop2_cluster_window(win)) {
+			if (!rockchip_afbc(plane, fb->modifier)) {
+				drm_err(vop2->drm, "Unsupported linear format for %s\n", win->data->name);
+				return -EINVAL;
+			}
+		}
+
+	}
+
 	/*
 	 * Src.x1 can be odd when do clip, but yuv plane start point
 	 * need align with 2 pixel.
-- 
2.34.1


