Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1387AC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 06:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JeIAnytvxe2YyCl42o/5nXwhjEdd0ZygLFlQfAIddWE=; b=YIzVoTxRYkmI91gTgwon0B8bBh
	lFsy6MZp8FzbgyOgNR2vdGxwhhqenWYRBgWo8aRcGLUo7L6coEUo+1jCl5GvdbI8w83/oiyt9xnKl
	ofxGPdk77D1oo/zzNnZpS618cm1QJTwZqC4CzoxsQ4xx0wF7wDAIHHIWzC7fCrEdoqDLYMZaniw2A
	TXAtgfcQQhtF28OOMYXAvmFfbZ5Dwj1OcZV89JffJAEBWFxoee6t9QfNBUmHax8zCg4WuZp4KUZwH
	XcRzz4eYW3Yi+w/9IbHQzH039gIsfoUJfYrzsuDWJJlszYJgiDlUPPdkSaqLHJEb4/h+T3dNDx9q6
	DPoFjy0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuQLf-00000004ojA-3TOt;
	Tue, 18 Mar 2025 06:22:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuQJz-00000004oYT-3A4r;
	Tue, 18 Mar 2025 06:21:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=JeIAnytvxe2YyCl42o/5nXwhjEdd0ZygLFlQfAIddWE=; b=A9ivR1X6iXDL8hbKKMJ1zZGJ8R
	S4RU6TtwmvX71jnIwE1JQobMbvvL5AP41mcPqzIR93unUQ0/hMfnj7yrubP7Txx0GQrxdrZbv5K/8
	SO7hV9XxgIMpCj5U4xDBZ6a7cSSsBwsXyIbW1yJFKEVb/PWtCgbZlraWvdZv/87LbOY3ufZ0elCtK
	d2VQrQPPjQWzO6ppXWBQHHyxUySI7iqXEDNzHhbn+zwZxzhe6FtC5pHCVcFE33aRUN8JkHBaA+Z+h
	1h1GJafCM0PpAWqfIvdplF668lEGBLDPR2q22xGit5+y2D1UmBaSeht0phyah7C2tq0JGLie4gtGw
	oaUtiORw==;
Received: from m16.mail.163.com ([220.197.31.3])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuQJw-00000003gvq-188J;
	Tue, 18 Mar 2025 06:21:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=JeIAn
	ytvxe2YyCl42o/5nXwhjEdd0ZygLFlQfAIddWE=; b=QCzYi/YYsE3GHKZoE6oVc
	IhOAsmnobcdTUX6LNC2eQjxgTydY8WpgbYLrol1/1ByB3GAQdfk6y1YfWnAe6+WK
	JAklvx6E527Mvfq5tOcjPg2ZEgiuT53wOuzYKZhc/DN01lI64JW7ydfC/nzjGBHs
	CmuhsORUMTahDNftYWcEls=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3_+qpENlnvx6pAA--.16708S2;
	Tue, 18 Mar 2025 14:20:29 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	derek.foreman@collabora.com,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH] drm/rockchip: vop2: Make overlay layer select register configuration take effect by vsync
Date: Tue, 18 Mar 2025 14:20:17 +0800
Message-ID: <20250318062024.4555-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3_+qpENlnvx6pAA--.16708S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw1kWw1rAr4UJF48JFy3twb_yoW8ZF43pr
	nxAry2gFZ2kF4qqrnF9F98Zr1fJwsFya1fKF9akasruas2yw1DWwnxuas8ArsxJr17Ar4j
	k39xJrW5AF42vr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jx_-PUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0gQUXmfZEI4ElgAAsu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_062100_731259_13796C71 
X-CRM114-Status: UNSURE (   9.79  )
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

From: Andy Yan <andy.yan@rock-chips.com>

Because the layer/window enable/disable is take effect by vsync, if the
overlay configuration of these layers does not follow vsync and
takes effect immediately instead, when multiple layers are dynamically
enable/disable, inconsistent display contents may be seen on the screen.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h | 1 +
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
index 680bedbb770e..fc3ecb9fcd95 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
@@ -710,6 +710,7 @@ enum dst_factor_mode {
 
 #define VOP2_COLOR_KEY_MASK				BIT(31)
 
+#define RK3568_OVL_CTRL__LAYERSEL_REGDONE_SEL		GENMASK(31, 30)
 #define RK3568_OVL_CTRL__LAYERSEL_REGDONE_IMD		BIT(28)
 #define RK3568_OVL_CTRL__YUV_MODE(vp)			BIT(vp)
 
diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
index 0a2840cbe8e2..32c4ed685739 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
@@ -2070,7 +2070,10 @@ static void rk3568_vop2_setup_layer_mixer(struct vop2_video_port *vp)
 	struct rockchip_crtc_state *vcstate = to_rockchip_crtc_state(vp->crtc.state);
 
 	ovl_ctrl = vop2_readl(vop2, RK3568_OVL_CTRL);
-	ovl_ctrl |= RK3568_OVL_CTRL__LAYERSEL_REGDONE_IMD;
+	ovl_ctrl &= ~RK3568_OVL_CTRL__LAYERSEL_REGDONE_IMD;
+	ovl_ctrl &= ~RK3568_OVL_CTRL__LAYERSEL_REGDONE_SEL;
+	ovl_ctrl |= FIELD_PREP(RK3568_OVL_CTRL__LAYERSEL_REGDONE_SEL, vp->id);
+
 	if (vcstate->yuv_overlay)
 		ovl_ctrl |= RK3568_OVL_CTRL__YUV_MODE(vp->id);
 	else
-- 
2.43.0


