Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 254D0D232C7
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 00:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D/VSrq7csKTtY4ym1mmKLQ17C8VC9XmKyawZ0uQoYIU=; b=BU7vJaCzJxG0m88/abYNvJZqqt
	I8ljwJfsIyHUe5iCiSDHtInOiJN6B97U4/r57+Yh+2QuGUgkjLQh5HjUBIWx4Kt78iTYAtsQaZAYZ
	+MarxANq64mbva3U5VMdWesLP289dk8NYEgfxZLFdURj1/kdYWVF8780gTR3Oihw7JrH3DUeoDOFf
	kLsYCPcGEjzytkNy/ZCp9KtD61Skun99YEr07kgNdfHTvR/CB4OhBWiBaQpBqjeQtEKPzY6FNiua1
	++peP0ZHBXJlvHSVyXNbP1WcO2tM7wDJS8odM/Vm4FWAkN39XdVoMfEfgVPi4UuNYIhLiCwWM4sOe
	M2G6To8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve0qB-000000013Bm-2PCr;
	Fri, 09 Jan 2026 00:58:59 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve0q9-000000013BN-0NFU;
	Fri, 09 Jan 2026 00:58:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=D/
	VSrq7csKTtY4ym1mmKLQ17C8VC9XmKyawZ0uQoYIU=; b=EWua2mP/i+cn9EoUdD
	M2DobcKCUb/bjH31GRxuLpB5Ya8TnOtnxisj7Pbx0Iwdzv7Tp9lk8q8139pzRJ9q
	oGYdC1efn4a+yXuGwkzOqHXQJ9q2p1nxHuGPTnlA/Aq0NTQEsUNEMLvR2aV05w3o
	J9Z2i+44mQWmvE52s/YiyDYEQ=
Received: from ProDesk-480.. (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wCn4bSuUmBphHPcFA--.19981S2;
	Fri, 09 Jan 2026 08:58:26 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	airlied@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	simona@ffwll.ch,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH] drm/rockchip: vop2: Add mode valid callback for crtc
Date: Fri,  9 Jan 2026 08:58:07 +0800
Message-ID: <20260109005821.225235-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCn4bSuUmBphHPcFA--.19981S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFykGr1kGFy5KF1DtryUAwb_yoW8Wr4kpa
	17JrWYgr48KFZFgFn7JF1qkr1akw1ayayxJrs3Ww13ZFyftr4DX3WrCryDCry3XF17Ga43
	KFnrtFW5AF1I9w7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jr5r7UUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbCxhIzkWlgUrJa3AAA3Z
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_165857_562601_8EE4AA45 
X-CRM114-Status: UNSURE (   8.46  )
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

Filter the mode that can't output by the crtc.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 498df0ce4680..74fba29bfff3 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1439,6 +1439,17 @@ static void vop2_crtc_disable_vblank(struct drm_crtc *crtc)
 	vop2_crtc_disable_irq(vp, VP_INT_FS_FIELD);
 }
 
+static enum drm_mode_status vop2_crtc_mode_valid(struct drm_crtc *crtc,
+						 const struct drm_display_mode *mode)
+{
+	struct vop2_video_port *vp = to_vop2_video_port(crtc);
+
+	if (mode->hdisplay > vp->data->max_output.width)
+		return MODE_BAD_HVALUE;
+
+	return MODE_OK;
+}
+
 static bool vop2_crtc_mode_fixup(struct drm_crtc *crtc,
 				 const struct drm_display_mode *mode,
 				 struct drm_display_mode *adj_mode)
@@ -1884,6 +1895,7 @@ static void vop2_crtc_atomic_flush(struct drm_crtc *crtc,
 
 static const struct drm_crtc_helper_funcs vop2_crtc_helper_funcs = {
 	.mode_fixup = vop2_crtc_mode_fixup,
+	.mode_valid = vop2_crtc_mode_valid,
 	.atomic_check = vop2_crtc_atomic_check,
 	.atomic_begin = vop2_crtc_atomic_begin,
 	.atomic_flush = vop2_crtc_atomic_flush,
-- 
2.43.0

base-commit: 84f1d42065381b7c3fbdeefe917e5e24ec0c6d87
branch: rk3576-dp-upstream


