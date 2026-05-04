Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E5FFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 18:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NRD3zSPkIUQ4ungxg5NqoazUFkTzSmZQjo28CJJ7+f8=; b=mXpS9+J0kqKkWuZDMkr43BrVYW
	OKidwBwEcWiErvRmsnGQpz+URTEdFdsqGfvFQlpz+CHH4Epp+7nFEjlh5p3K5l+Fkb1GgvW1bEf0g
	L8xlfiTzLFR/jS2zYSpUV+l8lIeqfp/Xy1h/V5q/pD7yrvjGsYLBZMf/uJXTVbwFRGTZaQGeNmxJj
	dRmNTrT0BLqOT0QC8PObrBmbcDtk2elzQ7dGqvpUwHgWhDUpsjlAuLusZpzVb0KH7dkyzgltqtvJf
	i6Bd6XxNyYN4nBR/cf0UnGVhjjoxzrUjRpGxj0WsiJ4yk/E3ho3LiOEO34d9qxk91iuDwwe30a8VM
	Fx4o1qJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJxyH-0000000Dxx3-1rHV;
	Mon, 04 May 2026 18:24:45 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJxyB-0000000DxsA-2UE5;
	Mon, 04 May 2026 18:24:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777919074;
	bh=ZPL0/m2C5FPMkrDboCKPEVtxYEWiPUuSLnVJOAS9x2Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JINh5v7PHzTOk4WwFMRRwKsYD0iu2f1S9ZWkPcCc+AA1dbNcNblQEab8oRf22wRzw
	 YKwVzvBfMSYejLfsOYBU3KuVO/3VvEk0CM97dT7HIizUt3uSxVWELoqvvOAyhEqKAQ
	 Tr7jIXJMrEHD026rseSnW0BgxY/jI8Q09qpZp25JfW/MC51zhh4m3Iovw+ehPqZ/Pu
	 PA0yo0YS4UlCJ531HLt7lvjtCKHi8c/jo09YCZLufQph2a40vDpgpxNVZ9XW57eFID
	 ChYRAHkuYACULx3dWlN+5UiPTys+21Arw6g7a6fAWEwtVm0QsoGkNltkolSk8/D4qh
	 mG8snLKNYH6QQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 846D417E156E;
	Mon,  4 May 2026 20:24:34 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 04 May 2026 21:24:02 +0300
Subject: [PATCH 4/5] drm/rockchip: vop2: Drop redundant zero-init in
 setup_layer_mixer()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-vop2-layer-cfg-tmout-v1-4-730226a7331e@collabora.com>
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
X-CRM114-CacheID: sfid-20260504_112439_792338_A53290F3 
X-CRM114-Status: UNSURE (   9.63  )
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

The layer_sel and atv_layer_sel local variables in
rk3568_vop2_setup_layer_mixer() are unconditionally assigned from
vop2->old_layer_sel and the RK3568_OVL_LAYER_SEL register read,
respectively, before any use.

Remove the superfluous zero-initializers.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
index 1f5e8c2acecd..0849bd922ffb 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
@@ -2134,9 +2134,9 @@ static void rk3568_vop2_setup_layer_mixer(struct vop2_video_port *vp)
 {
 	struct vop2 *vop2 = vp->vop2;
 	struct drm_plane *plane;
-	u32 layer_sel = 0;
+	u32 layer_sel;
 	u32 port_sel;
-	u32 atv_layer_sel = 0;
+	u32 atv_layer_sel;
 	u8 layer_id;
 	u8 old_layer_id;
 	u8 layer_sel_id;

-- 
2.53.0


