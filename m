Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC9C6E6FE29
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 19:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QGnF4tvIiZgsyxM67mH6bugdnjxLvTzAmKSx2XLMRwA=; b=khNYgl9TNnO+TF62ehVv8ruFc6
	niepZCZe+D2KqNggj0WdF1yL6B19f/gYXddZtuHdMMV9ocrE7D+5+guk4rs5/O1DUu2H474k1BVzv
	yBOi9N/BLgYSa39hdcwDX18dSSC9mzh2sR1BcWXM443oXxoiV6rYqKng3RHXiZKSP+FlQ6vuogvVY
	Ni7vK2XQc8xlR+d8gsnFBQQcx1qHrXLVyLbVX+ayicRXZcr1erm5ke3o5wVa3J6WkXaJsL2bt3F3d
	uN254d58ByNy6gdKhFg7r4OiqJb2QlQsdgkREUDDmr10WhRFAQRTVwtmqQA8hOC++mI683l7+ByJB
	MxmZwUmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY8LD-0000000G02w-3B8z;
	Tue, 23 Dec 2025 19:46:43 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY8L9-0000000Fzzt-41Wv;
	Tue, 23 Dec 2025 19:46:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1766519197;
	bh=8FoqfaoY+0Hw91SrzejtYpeqb9eQRxsYLDoEUKDQmRg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CKwn8j98/eXjlM0Ifa8ou8K0lQ+DeRRMAJNQQnj6je8r9dTbq0u97I7W3mxqp3y+M
	 zVK7oMG2LcmwDIKs/q3xadWc5f2FU53m5eilfZgdIQaHmKMgZdiYSPtuxoF2E2oBjG
	 nbSGwJcsWlow9I/ycaxGanCQSOPMTWykXxEK/OvKr+74ZM5attCvrtm0sof8SiHCF/
	 XIU0PeyjelILXKuTDxx9PPcl2H/7PZBqZ/rOJ3/5z1pBVmMHBtWBf1Dy1QGZ8Ujgbc
	 N3osY6Tu5GlncJIENBAt736XKJyr6gdMTz355lSfHI0E9OoYaYGpSGK0rGfNmrZjMI
	 PE11IV+cbA3+w==
Received: from [127.0.1.1] (unknown [IPv6:2804:1b1:f803:74:81c8:6a7a:6e11:8f81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4AC1E17E12EB;
	Tue, 23 Dec 2025 20:46:32 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 23 Dec 2025 16:44:43 -0300
Subject: [PATCH 02/11] drm/mediatek: Initialize colorops when creating
 plane
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-mtk-ovl-pre-blend-colorops-v1-2-0cb99bd0ab33@collabora.com>
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
X-CRM114-CacheID: sfid-20251223_114640_157130_E7F0A5FA 
X-CRM114-Status: GOOD (  10.89  )
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

During initialization of a plane, if the DDP component supplying it
defines a plane_colorops_init() hook, call it to initialize the color
pipeline on the plane.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_crtc.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 22f255c3ddd3..f7db235d986f 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -985,8 +985,10 @@ static int mtk_crtc_init_comp_planes(struct drm_device *drm_dev,
 	int i, ret;
 
 	for (i = 0; i < num_planes; i++) {
+		struct drm_plane *plane = &mtk_crtc->planes[mtk_crtc->layer_nr];
+
 		ret = mtk_plane_init(drm_dev,
-				&mtk_crtc->planes[mtk_crtc->layer_nr],
+				plane,
 				BIT(pipe),
 				mtk_crtc_plane_type(mtk_crtc->layer_nr, num_planes),
 				mtk_ddp_comp_supported_rotations(comp),
@@ -997,6 +999,12 @@ static int mtk_crtc_init_comp_planes(struct drm_device *drm_dev,
 		if (ret)
 			return ret;
 
+		if (comp->funcs && comp->funcs->plane_colorops_init) {
+			ret = comp->funcs->plane_colorops_init(comp->dev, plane);
+			if (ret)
+				return ret;
+		}
+
 		mtk_crtc->layer_nr++;
 	}
 	return 0;

-- 
2.51.0


