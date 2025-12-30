Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E19E95A95
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 14:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2vhf7ztBfShzmmae6xik6EvvfNbaqdJFeiliqG6UgYY=; b=QSRy8YMx2VAaL3Jd225DC6SzVY
	NnFfcOThE3WZIiPgOKIkMTtfjExr2/deDP/EnCoxmZKuE160fd0bi9/eM209+O8A0eclnB5xHPILQ
	+A4b2oOZycB1g35X4SynnENFHdLNX88jmKeU13zIvczV9b2kQV7zgUazUN+16RKIPemIy9AKYipw1
	IK1Gcxrw9pp9v7TGZKMiM+Cguis/cq8Yd9un4ulrqj2rtYh7nRxJJ/eV/8nPXTuDmTqcsb3eMP43b
	699GGIOp++bgqd5Tt0wVGkkwtJRYrtquvzKRWD4nE1AxZrvrrAGWT1/sf0USNrem5McccRYozApa3
	+fKQ7C7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaaKM-00000004tkX-30ZE;
	Tue, 30 Dec 2025 14:03:58 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaaKL-00000004thR-0WVH;
	Tue, 30 Dec 2025 14:03:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767103433;
	bh=8znKm4tlbIYhdYcckfvwcGyuwybXFTON9zwc8N6bIic=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lmbQoavrlIm15+Amp4DI3XQat3GPgt6YXkrYSHkQKm+CyNzEugh0rRDS4oWxdNxpP
	 Sx2fcCdxEgIU2mucChAYAy5281KY87zwVPfdVHH0AdwkDHTMHJnM+n2U8NpPJfrpOU
	 JcHIM2iMDEpuFwkj+xTWDZV80vGfgagZbaE8+Ys+4TmrSr7SLwEe1WnoWCmRJ3oeAO
	 q16LGzwjqaAZR9J2pHoE2FmuDLN7uBSSe1certtjonRZiJDunZlAb5jaKF00MeFban
	 9adqFE8nbhZyjz5KRSmP/TdHZDN/BLrFmqTRcoN8cZmWB01zEr/fqGBIGLK8ro8TpY
	 Qsy9jCcBX2cpw==
Received: from [127.0.1.1] (unknown [IPv6:2804:1b1:f803:a1ec:e46f:3b67:baf0:3d70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 783B817E127C;
	Tue, 30 Dec 2025 15:03:48 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 30 Dec 2025 11:03:04 -0300
Subject: [PATCH RFC 4/6] drm/mediatek: ovl: Disallow AFBC buffers with
 width over 1920
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251230-mtk-afbc-fixes-v1-4-6c0247b66e32@collabora.com>
References: <20251230-mtk-afbc-fixes-v1-0-6c0247b66e32@collabora.com>
In-Reply-To: <20251230-mtk-afbc-fixes-v1-0-6c0247b66e32@collabora.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Justin Green <greenjustin@chromium.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, ariel.dalessandro@collabora.com, 
 daniels@collabora.com, kernel@collabora.com, Nancy.Lin@mediatek.com, 
 Jason-JH.Lin@mediatek.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_060357_349321_2CB7FED2 
X-CRM114-Status: UNSURE (   9.86  )
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

AFBC buffers with width over 1920 are not supported by OVL. If
attempted, the image displayed contains many artifacts.

Add this restriction to the layer check callback so such configurations
are not allowed.

NOTE: This doesn't seem to be a good way to handle this restriction, as
when tested with Weston, it simply fails to render, rather than fallback
to not using the modifier:

[19:09:03.857] atomic: couldn't commit new state: Invalid argument
[19:09:03.857] repaint-flush failed: Invalid argument

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index c6a00c2256dd..196b874057ba 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -368,6 +368,13 @@ int mtk_ovl_layer_check(struct device *dev, unsigned int idx,
 	if (state->fb->format->is_yuv && (state->rotation & ~DRM_MODE_ROTATE_0))
 		return -EINVAL;
 
+	/*
+	 * AFBC buffers with width > 1920 are not supported and produce
+	 * artifacts, so should be disabled.
+	 */
+	if (state->fb->modifier != DRM_FORMAT_MOD_LINEAR && state->fb->width > 1920)
+		return -EINVAL;
+
 	return 0;
 }
 

-- 
2.51.0


