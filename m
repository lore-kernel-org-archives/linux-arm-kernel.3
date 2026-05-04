Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB96ECD3440
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 18:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iKriQo5m7HjY+AD1PkYVQlRLW+9C+YpqAKnWo3v81DI=; b=mGF2SSvukI3+18Z1jWdruiDl7P
	iPcTSxe6MZab2GTHe+eZdNUMm3/JzGxB/Z6s9is5dr/CvDg5FZ6FzCkm0j7rCEHhypzWxtyMtifxg
	Css2mQjCV+uKjr8k1Pho7Z2pt/izebyqjQWSW79s31lSq6zJebTkJcKPKxpF+0DYu6T6qq96fvXrY
	ONUoEUhxE2PbSX2WEEKvnKOK4mmEzYCG2ytvJ4nIa6F0wJSR1+cvg3l1bxbs8Ia/xds2qv59SJ/zu
	95SqRasm9EugBbIM9a1Bpna3omFr9HSHaS7CBB1SJeYIy6qzzC6UUqwOzE5hYtcmXNXnLi8uaiNio
	KiSWONxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJxyI-0000000Dxxz-153t;
	Mon, 04 May 2026 18:24:46 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJxyB-0000000DxsP-3fvF;
	Mon, 04 May 2026 18:24:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777919075;
	bh=jHuSqMydnxiUHThU8cOES4vmkolWOAEvO+AN9naJXTY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=B/09ckXKQzf514XPJzFyIS/PKyLlXbepjl2xTrXGkkHHYMpE4F7AHWq97nKrUrxfW
	 iSihq+CPx6i1tIWvXrI5os7Q3U0NxwmmQpPZJOIvEx/aehD4ofPVpzgvPHPka/r/qR
	 lkW6QSpfW+3LWDOF7eQH/Ix2qF2b+hbYYHTDaJR2py4+JZcg6LzrRLPoCjxR7+fheW
	 EshtPwH8zVszmo1gahnwHZcmkzIFVM2GxM1hoNYf+tfmBr2nP877lwiHEd2jcElQ7b
	 4urbsWKZ8UmLt6UtTnocb9I3ZO0uvYFGgMVz3+2MIwMeyFY6JqxHFx23UDdiGmI0Nl
	 +ImcDG8l8v3lw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5B70117E1582;
	Mon,  4 May 2026 20:24:35 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 04 May 2026 21:24:03 +0300
Subject: [PATCH 5/5] drm/rockchip: vop2: Use vop2->old_layer_sel directly
 in wait_for_layer_cfg_done()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-vop2-layer-cfg-tmout-v1-5-730226a7331e@collabora.com>
References: <20260504-vop2-layer-cfg-tmout-v1-0-730226a7331e@collabora.com>
In-Reply-To: <20260504-vop2-layer-cfg-tmout-v1-0-730226a7331e@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_112440_061451_33DE885C 
X-CRM114-Status: UNSURE (   9.22  )
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

After the old_layer_sel local was removed, the only caller of
rk3568_vop2_wait_for_layer_cfg_done() already passes vop2->old_layer_sel
as the expected value.

Drop the redundant parameter and read the member directly inside the
function.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
index 0849bd922ffb..1d8473a6dfd1 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
@@ -2115,7 +2115,7 @@ static u32 rk3568_vop2_read_layer_cfg(struct vop2 *vop2)
 	return vop2_readl(vop2, RK3568_OVL_LAYER_SEL);
 }
 
-static void rk3568_vop2_wait_for_layer_cfg_done(struct vop2 *vop2, u32 cfg)
+static void rk3568_vop2_wait_for_layer_cfg_done(struct vop2 *vop2)
 {
 	u32 atv_layer_cfg;
 	int ret;
@@ -2124,10 +2124,10 @@ static void rk3568_vop2_wait_for_layer_cfg_done(struct vop2 *vop2, u32 cfg)
 	 * Spin until the previous layer configuration is done.
 	 */
 	ret = readx_poll_timeout_atomic(rk3568_vop2_read_layer_cfg, vop2, atv_layer_cfg,
-					atv_layer_cfg == cfg, 10, 50 * 1000);
+					atv_layer_cfg == vop2->old_layer_sel, 10, 50 * 1000);
 	if (ret)
 		drm_err_ratelimited(vop2->drm, "wait layer cfg done timeout: 0x%x--0x%x\n",
-				    atv_layer_cfg, cfg);
+				    atv_layer_cfg, vop2->old_layer_sel);
 }
 
 static void rk3568_vop2_setup_layer_mixer(struct vop2_video_port *vp)
@@ -2292,7 +2292,7 @@ static void rk3568_vop2_setup_layer_mixer(struct vop2_video_port *vp)
 		 * Changes of other VPs' overlays have not taken effect
 		 */
 		if (cfg_done)
-			rk3568_vop2_wait_for_layer_cfg_done(vop2, vop2->old_layer_sel);
+			rk3568_vop2_wait_for_layer_cfg_done(vop2);
 	}
 
 	if (layer_sel != vop2->old_layer_sel || port_sel != vop2->old_port_sel)

-- 
2.53.0


