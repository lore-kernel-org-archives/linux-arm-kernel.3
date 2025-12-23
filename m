Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F83E6FE29
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 19:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ogsvJnrz5+4wwhi5M/n1nJduu1aZPFElPtW6tj7eqUE=; b=VhBbr2IYIpYJjau76kalZPvPq+
	xq3kNKUBCNeUtuwF9T6g3l/wbH2YhJ9gCy4JzFFCGvAhC+DeqCmXIbQGSAZ8bT/84geRBQCMqdBHD
	QqMG/IFZgO48PpdLsxqhF3B757gPyUjyM5lJu2Wy3D6+Vkfk/HTV4IXwJvYKa+oXwG/eZMYwptcOY
	H/VLXgU80oyPCMZ2RsKyIFdMQ3yONHz2n/wZQ868sfhurynSZ/Fj+7rPuaIn75KElT+8swhC2IjCp
	YS8iqS5+4LfahcxDJb1iF/+NSDHizIQw2spmh2j7N9YaASLgWRbe9XE+4JAWxk4c23UhbU7/8KDXU
	Xcg/HEeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY8M2-0000000G0oU-1rXI;
	Tue, 23 Dec 2025 19:47:34 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY8Lz-0000000G0jU-3M7g;
	Tue, 23 Dec 2025 19:47:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1766519249;
	bh=jN8/NC5326wJRY+/4zQLxUhorij6o1FPPSbWvSuyvLA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BGjPC9jwiNxilGSOYgbkz73hNCSc1woCbCmyX3BPr5umfL2Yv8ibZiYSqfAa4wKOn
	 P/1Qrg+tl8l68ixXqWSCJXXmf+uwjMnkJxh+fAQv1itvYy9U2AboZcVSSzZwhNQAfJ
	 RvQzbPKBsRjSjMk+TmSL4u88HA+xnvGKaKSTjDejZn8n3mmYuYfZKSqXKbDKquCwyG
	 vvPv5pgkND+2M8WB8bpeDtSQ8eMdQKn2GXG+VLRJNXT3Tq23fybdJhIq7dGJaXr6l8
	 bPUZJsqJ7mg2D+0Bo5g6K3dRkEDBzosvJ/9hPGyZ0qNAH77EGazZXRJDlvo7rXLpIY
	 1+CaSniI+g/rA==
Received: from [127.0.1.1] (unknown [IPv6:2804:1b1:f803:74:81c8:6a7a:6e11:8f81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ACB4217E3690;
	Tue, 23 Dec 2025 20:47:24 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 23 Dec 2025 16:44:52 -0300
Subject: [PATCH 11/11] drm/mediatek: Check 3x3 Matrix colorop has DATA set
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-mtk-ovl-pre-blend-colorops-v1-11-0cb99bd0ab33@collabora.com>
References: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
In-Reply-To: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 daniels@collabora.com, ariel.dalessandro@collabora.com, 
 kernel@collabora.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_114732_025092_0BED8364 
X-CRM114-Status: GOOD (  10.80  )
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

Add an atomic check hook for the CRTC and use it to verify that any 3x3
Matrix colorop, which requires the DATA property to be set, does in fact
have it set.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_crtc.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index f7db235d986f..1a55d5df6dbe 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -897,6 +897,31 @@ static void mtk_crtc_atomic_flush(struct drm_crtc *crtc,
 	mtk_crtc_update_config(mtk_crtc, !!mtk_crtc->event);
 }
 
+static int mtk_crtc_atomic_check(struct drm_crtc *crtc,
+				 struct drm_atomic_state *state)
+{
+	struct drm_colorop_state *new_colorop_state;
+	struct drm_colorop *colorop;
+	int i;
+
+	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
+		switch (colorop->type) {
+		case DRM_COLOROP_CTM_3X3:
+			if (!new_colorop_state->bypass && !new_colorop_state->data) {
+				drm_dbg_atomic(crtc->dev,
+					       "Missing required DATA property for COLOROP:%d\n",
+					       colorop->base.id);
+				return -EINVAL;
+			}
+			break;
+		default:
+			break;
+		}
+	}
+
+	return 0;
+}
+
 static const struct drm_crtc_funcs mtk_crtc_funcs = {
 	.set_config		= drm_atomic_helper_set_config,
 	.page_flip		= drm_atomic_helper_page_flip,
@@ -914,6 +939,7 @@ static const struct drm_crtc_helper_funcs mtk_crtc_helper_funcs = {
 	.mode_valid	= mtk_crtc_mode_valid,
 	.atomic_begin	= mtk_crtc_atomic_begin,
 	.atomic_flush	= mtk_crtc_atomic_flush,
+	.atomic_check	= mtk_crtc_atomic_check,
 	.atomic_enable	= mtk_crtc_atomic_enable,
 	.atomic_disable	= mtk_crtc_atomic_disable,
 };

-- 
2.51.0


