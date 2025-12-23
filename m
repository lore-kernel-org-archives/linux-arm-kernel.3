Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D2BE6FE23
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 18:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ijsNqJ/70EN71R3BVRUG56ZJmjfyXgVIF1SuaeXTr7g=; b=kSmIctvHhmH7HfuP4KxQaP2bzT
	35oDnrbhp0sa0NbDzW1E1P004B9jhu//3XbXWt7kc1uTfD9rh4/xZELSIhEom9ZQF8FTXAkPZQW/x
	SGR6aOcznNWOIL59cjvSgGvEhwk/AGnfoAm01kvynFYxjWjrnBql2JApP+5qpuz22XLqrixKunmP0
	Fsa+JxZQkAweGTMprs8exWDoBr459hY+ikRRvW8ZgT7OBdvu41HDh7SPHLMsjJSDQWZT8M030qWMz
	qN8om4BO5ACIVt4EpX1AqVxe67oa0qvsnaZkdFfm4NJoB/LkboOfLELxljhdMWlUNeLYRh4Wqpgcv
	2XB+zngw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY6ju-0000000Fuil-3JIm;
	Tue, 23 Dec 2025 18:04:06 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY6jl-0000000FuXn-2BDS;
	Tue, 23 Dec 2025 18:04:04 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1766513025; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TEjXMV0etinSW8M8AxxxrGyPGZqXkIJC5ciStPwfiaMK69nPBU0emQVwkht0I1TaKgWMMQR4MqOP67rOziGhMLeYyMxh7DjXsrf74z2GBLsTdmYVNjj+UsdOwYwH9KZyjcfwTQNJN6Tmqxmg8O2+jhpz9nbn6nYZjPz1Zlsbtxs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1766513025; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ijsNqJ/70EN71R3BVRUG56ZJmjfyXgVIF1SuaeXTr7g=; 
	b=igCjyftLnsb/a8I7NqQotyrFgC0Fn+Mq2xXwQPOXTY9tAaqKQfb4F5ugUfbFBS2mB7vhRkYXlj+d2vOCSbvwLyH/YOUc63PVtZtoJT8t4vX956QOQDaqyDa8jIJAXAm1ytr5prJV6PwY8O/PDatgQH/ZNsyBOT1OU9eUPQqQl6A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766513025;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=ijsNqJ/70EN71R3BVRUG56ZJmjfyXgVIF1SuaeXTr7g=;
	b=X1zc5Jl80gzBsx3JUoeDBMHldCMk3ju/4A+LL9yd5gMN6qcWUgPIuCmhm2X0Mw30
	KAHtB4EUAHqI2Exkor/1kTksQ05XK4SNRb9P62mRUUmBm2e9AgRFeFjM4kaFIW7pMX9
	CazMthSD4jhJpBTq71U+nOpcTkVSwoqsQdbCgSag=
Received: by mx.zohomail.com with SMTPS id 1766513023665673.0680314256373;
	Tue, 23 Dec 2025 10:03:43 -0800 (PST)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Date: Tue, 23 Dec 2025 15:01:38 -0300
Subject: [PATCH v3 18/21] drm/vkms: Rename existing color pipeline helpers
 to contain "plane"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-mtk-post-blend-color-pipeline-v3-18-7d969f9a37a0@collabora.com>
References: <20251223-mtk-post-blend-color-pipeline-v3-0-7d969f9a37a0@collabora.com>
In-Reply-To: <20251223-mtk-post-blend-color-pipeline-v3-0-7d969f9a37a0@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766512902; l=2834;
 i=ariel.dalessandro@collabora.com; s=20251223; h=from:subject:message-id;
 bh=KYz5wMMzVLd2SIZeeSoKXiwrpNlBnDQ02lbiiWEro+k=;
 b=TxDXkdnWnCgHcCuWU/72ICAoXziIPVRr27YV5VQDtSLTm9PhA3UQU05rUsSDEkXnyNifvJIkU
 I37enLuFXh8CBR6smYEZSSrsGDuipiSs5Vv+oAwLOraxTcUPwd9RWGQ
X-Developer-Key: i=ariel.dalessandro@collabora.com; a=ed25519;
 pk=QZRL9EsSBV3/FhDHi9L/7ZTz2dwa7iyqgl+y1UYaQXQ=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_100357_619962_0B94AF90 
X-CRM114-Status: GOOD (  11.32  )
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

From: "Nícolas F. R. A. Prado" <nfraprado@collabora.com>

Rename the existing color pipeline helpers so they contain "plane" in
the name to make them clearly distinguishable from the crtc helpers when
they're introduced.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Co-developed-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_colorop.c | 7 ++++---
 drivers/gpu/drm/vkms/vkms_drv.h     | 2 +-
 drivers/gpu/drm/vkms/vkms_plane.c   | 2 +-
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c b/drivers/gpu/drm/vkms/vkms_colorop.c
index 5c3ffc78aea06..dd6120434690e 100644
--- a/drivers/gpu/drm/vkms/vkms_colorop.c
+++ b/drivers/gpu/drm/vkms/vkms_colorop.c
@@ -14,7 +14,8 @@ static const u64 supported_tfs =
 
 #define MAX_COLOR_PIPELINE_OPS 4
 
-static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
+static int vkms_initialize_plane_color_pipeline(struct drm_plane *plane,
+						struct drm_prop_enum_list *list)
 {
 	struct drm_colorop *ops[MAX_COLOR_PIPELINE_OPS];
 	struct drm_device *dev = plane->dev;
@@ -101,13 +102,13 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
 	return ret;
 }
 
-int vkms_initialize_colorops(struct drm_plane *plane)
+int vkms_initialize_plane_colorops(struct drm_plane *plane)
 {
 	struct drm_prop_enum_list pipeline;
 	int ret;
 
 	/* Add color pipeline */
-	ret = vkms_initialize_color_pipeline(plane, &pipeline);
+	ret = vkms_initialize_plane_color_pipeline(plane, &pipeline);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 0933e4ce0ff03..bdeb52623f4d6 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -324,6 +324,6 @@ void vkms_writeback_row(struct vkms_writeback_job *wb, const struct line_buffer
 int vkms_enable_writeback_connector(struct vkms_device *vkmsdev, struct vkms_output *vkms_out);
 
 /* Colorops */
-int vkms_initialize_colorops(struct drm_plane *plane);
+int vkms_initialize_plane_colorops(struct drm_plane *plane);
 
 #endif /* _VKMS_DRV_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 19fe6acad306e..82be1b862c1da 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -247,7 +247,7 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 					  DRM_COLOR_YCBCR_FULL_RANGE);
 
 	if (vkms_config_plane_get_default_pipeline(plane_cfg))
-		vkms_initialize_colorops(&plane->base);
+		vkms_initialize_plane_colorops(&plane->base);
 
 	return plane;
 }

-- 
2.51.0


