Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B809CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 00:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0DUbn/wqWwuCR6HZ/LenGNGmR0LYQCTbBGnL69vaB1Y=; b=vr+pEEuWDIwkGgYQvPaPAmokOo
	UJ3GoplZ26vzhguHsKoW32XGL+Q1ysTHjPZLVLwAjtq5dlftEzlJl4cYbMfgofKQaj/seuuQFja+D
	gz4SPmrt6j8IC7SfL5HOnl+4hfls+Qr6U1ABjMuFyE7njqsBfj868k2oEx25ptTA0Xa+9QRAHBKj8
	qAih+MWudkP/r5kB3dnfkeZBzx+RPDKx6Opysvs+EWsGgNMh6ONymwm39pnB4UEWI2Qp54+QNHyAu
	Rgvw28lvI65aXfJcm0P/3plq8t+XRO4SIW7xctduEsJKppGz1r73opR+ilznhf0yvNSgfhaZkC8b/
	JPKY67nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz2lV-0000000FqoB-0EIE;
	Thu, 18 Sep 2025 00:44:49 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz2lP-0000000Fqgf-2EH5;
	Thu, 18 Sep 2025 00:44:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758156281;
	bh=1tGHh9D4SKDvEOmsISHVmpQ1zNxKTXUO5Zxk4dBMT/E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=g312YVYfu09+uwmwFU7QBJm+XK9nAAXqkUpbMbVdfdo6ibFximu3Tqt0z41m/ZuCb
	 e2RoDBpVYGRMaBtM2IOGTQ04gqY2OW5WKaTGZnEuWt7hIAllB7abjdt/Ef5PSJB7tl
	 9iIfZP5fqmKR0Q1bM3L9QO/LGoVTGYb/6BEfI3V1yCAWdLjTrt5JR4W+p2POc1w6ty
	 JaNbP6Qm4ZPBEJ0JRDoaBR25mYXPKqAq6fa7pMT/glRRIV46LoPbXpBbUnuSb8V3tW
	 dMeuiKjJ4The2yyeJay3cb9PUAna6xUU/vkbvl3i+H//am5r8q3z6efJeWhvrrfmJ/
	 yIEuILXanZPwQ==
Received: from [127.0.1.1] (unknown [IPv6:2600:4041:5b1a:9400:62f0:406e:ac79:4a96])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 12D7F17E0DC2;
	Thu, 18 Sep 2025 02:44:34 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Wed, 17 Sep 2025 20:43:20 -0400
Subject: [PATCH RFC v2 11/20] drm/colorop: Export drm_colorop_cleanup() so
 drivers can extend it
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-mtk-post-blend-color-pipeline-v2-11-ac4471b44758@collabora.com>
References: <20250917-mtk-post-blend-color-pipeline-v2-0-ac4471b44758@collabora.com>
In-Reply-To: <20250917-mtk-post-blend-color-pipeline-v2-0-ac4471b44758@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>
Cc: Alex Hung <alex.hung@amd.com>, wayland-devel@lists.freedesktop.org, 
 harry.wentland@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com, 
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com, 
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com, 
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org, 
 xaver.hugl@gmail.com, victoria@system76.com, uma.shankar@intel.com, 
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, 
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com, 
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com, 
 mcanal@igalia.com, kernel@collabora.com, daniels@collabora.com, 
 leandro.ribeiro@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_174443_768612_5B6468A6 
X-CRM114-Status: UNSURE (   9.73  )
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

Export drm_colorop_cleanup() so drivers subclassing drm_colorop can
reuse this function in subclass cleanup routines.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/gpu/drm/drm_colorop.c | 3 ++-
 include/drm/drm_colorop.h     | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index b0c3216f4dac22f3408cbd537a20f38d03abc0a7..83deb2bc6f50fe030664548365d22de9b45f486b 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -187,7 +187,7 @@ static int drm_crtc_colorop_init(struct drm_device *dev,
  *
  * @colorop: The drm_colorop object to be cleaned
  */
-static void drm_colorop_cleanup(struct drm_colorop *colorop)
+void drm_colorop_cleanup(struct drm_colorop *colorop)
 {
 	struct drm_device *dev = colorop->dev;
 	struct drm_mode_config *config = &dev->mode_config;
@@ -202,6 +202,7 @@ static void drm_colorop_cleanup(struct drm_colorop *colorop)
 
 	kfree(colorop->state);
 }
+EXPORT_SYMBOL(drm_colorop_cleanup);
 
 /**
  * drm_colorop_pipeline_destroy - Helper for color pipeline destruction
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index e7d1e5e95a901b1bd91fd8580e2fcb367c0253ce..f7472ece00cdb09ae204d0c2339eb35c3246874e 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -375,6 +375,7 @@ static inline struct drm_colorop *drm_colorop_find(struct drm_device *dev,
 	return mo ? obj_to_colorop(mo) : NULL;
 }
 
+void drm_colorop_cleanup(struct drm_colorop *colorop);
 void drm_colorop_pipeline_destroy(struct drm_device *dev);
 
 int drm_crtc_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,

-- 
2.50.1


