Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B11CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 00:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S6aNogRZU01lG2jgfYudxLT3/g3byrmCnQphS3ZIwlo=; b=ji5MIdT0SA1Xi9VdOPhLbGh5yY
	HRAFO6vcYpGjI3g7wiD5VmptV/3oAPwAEW1ElDGxufClTS+gFyFvfRfvwN0TEnCphKfhiT9MucuQ4
	Y009Vzkc6uAnE3E2MeKMtnKeXllkZPwhzbxMH+0Htytu5Z9RERNFGzDW3QtIwYbB27fYdG4Y2YXzv
	5MveRMv4cdEfE5rntp9mzsiDzq7xyKVOmjNWDUvXRA4YEQ8wd1rQC8Rhea6YxTClCbjPmcaTwWh8P
	sXzEPTcUnZceGpbB/v5cYlYZLLm9Ro7oU64PeyFQcfBr98n7AOpKSwbnS6sL6AGFr4Iwh1b2zPkEq
	9FsIYYhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz2mL-0000000FrjM-3uDN;
	Thu, 18 Sep 2025 00:45:42 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz2mG-0000000Frbr-1ipQ;
	Thu, 18 Sep 2025 00:45:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758156334;
	bh=63UDJCYYZKejAD7rK2QDvVeqxIbIk1HH1HrY2XmPNcY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gMnWRuD1d7y9DpYWtVcKimU7+BVJRWJcbw0dTD7po+g0dP72VKp94T1tb4BJsX0TO
	 9lbZBqZKrFzfVK1g+nTfEw0l7aWzHtbFvViS6jYG1O1KCYyzKE11qp5MpOwSvMo3Gi
	 1rwLkXcU4PJ4FdUFNf6CpJdxNKK0al9RiUciQe4J3r50qM6eJTXxVbE+jL3Sb7pGnl
	 oCdMnWBVl3XsFgBDj1VssPOZjHYwhBI3VQ0TlX9bGtEx/ySw1og6NR/hN3oTcqSauY
	 NPYeERo7HpawHISGmsgH0kosefSYvZiQyQK+pwqZEejdWN2gQWXCmQHdpzjzlX0nd+
	 340M0jWplCqhw==
Received: from [127.0.1.1] (unknown [IPv6:2600:4041:5b1a:9400:62f0:406e:ac79:4a96])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AE29617E13B2;
	Thu, 18 Sep 2025 02:45:27 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Wed, 17 Sep 2025 20:43:27 -0400
Subject: [PATCH RFC v2 18/20] drm/vkms: Prepare pre_blend_color_transform()
 for post-blend pipelines
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-mtk-post-blend-color-pipeline-v2-18-ac4471b44758@collabora.com>
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
X-CRM114-CacheID: sfid-20250917_174536_662162_384DE0C3 
X-CRM114-Status: GOOD (  11.40  )
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

As a preparatory step for supporting post-blend color pipelines in VKMS,
rename pre_blend_color_transform() to color_transform() and make it take
the first colorop instead of a plane state, so it can be shared by both
pre- and post-blend color pipeline code paths.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 31b1dd3cd115d930ec3ed498403a8f44208d76c3..05e1551d6330e4dc14563d3a399b3544d11c6576 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -189,13 +189,13 @@ static void apply_colorop(struct pixel_argb_s32 *pixel, struct drm_colorop *colo
 	}
 }
 
-static void pre_blend_color_transform(const struct vkms_plane_state *plane_state,
-				      struct line_buffer *output_buffer)
+static void color_transform(struct drm_colorop *first_colorop,
+			    struct line_buffer *output_buffer)
 {
 	struct pixel_argb_s32 pixel;
 
 	for (size_t x = 0; x < output_buffer->n_pixels; x++) {
-		struct drm_colorop *colorop = plane_state->base.base.color_pipeline;
+		struct drm_colorop *colorop = first_colorop;
 
 		/*
 		 * Some operations, such as applying a BT709 encoding matrix,
@@ -449,7 +449,7 @@ static void blend_line(struct vkms_plane_state *current_plane, int y,
 	 */
 	current_plane->pixel_read_line(current_plane, src_x_start, src_y_start, direction,
 				       pixel_count, &stage_buffer->pixels[dst_x_start]);
-	pre_blend_color_transform(current_plane, stage_buffer);
+	color_transform(current_plane->base.base.color_pipeline, stage_buffer);
 	pre_mul_alpha_blend(stage_buffer, output_buffer,
 			    dst_x_start, pixel_count);
 }

-- 
2.50.1


