Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E773C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 21:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=arZ4Phoc4QRHLAgOYAvWa44V8ixn492Zd9/qUyKIGVo=; b=U39l8cflzcfyCKH+vk1I55NFHJ
	PgvGOfCM1JVTQ3n0aqo3saOfr1S5HwFxcEXAbSPe7+96yoSkooEzTA0R5zabNKOd0foL5Mt2rBm1I
	MeCOnvOzxfAHS8G+2NiLsFZVDaAW+eQs7hcPEM1q5Ic82Gv69sOVXSErKtcxCW1umJepII/3wVBTy
	Z0KgCdUzoqJzMqqCRkwzZvZo3cdTFxNGq3qkagcUaU41OEX9ns7K4CLNNTBakxXpC2HGdmTWGlgaP
	BEMqtxYM6trGLYB6o7VZeBtfZtEel3U5LZZZ5q3lyKhL9vgG6/ceqU+RJ37ykgyQPjIhOZBggoZv/
	gqwymBfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpZfC-00000006HqC-0zqq;
	Tue, 04 Mar 2025 21:18:54 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpZUh-00000006GV9-1BFY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 21:08:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741122482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=arZ4Phoc4QRHLAgOYAvWa44V8ixn492Zd9/qUyKIGVo=;
	b=hyJyoH01Zx/UJAvtR6mFGbdcNGfn6PCg2L7AtfEs1+XvR5pMXundvLeBI8lpPtz/CAzCw6
	3Gj0blE/rmIsEcYahwUo+o3OW/9cgWFd5cNMT9xnrXWZlqx0u4Nzq4P3AaTj1qL0czyzzd
	CMTLHUEqpTfSlK6LVHLpEHIFnAgn86Y=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-59-zoPGBDoAMrigwwTW2qD1iw-1; Tue,
 04 Mar 2025 16:06:31 -0500
X-MC-Unique: zoPGBDoAMrigwwTW2qD1iw-1
X-Mimecast-MFC-AGG-ID: zoPGBDoAMrigwwTW2qD1iw_1741122387
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 017EB180099D;
	Tue,  4 Mar 2025 21:06:27 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.107])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A1411180035F;
	Tue,  4 Mar 2025 21:06:20 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 04 Mar 2025 16:05:35 -0500
Subject: [PATCH v5 5/7] drm/sti: move to devm_platform_ioremap_resource()
 usage
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-mem-fixes-v1-5-fb3dab8d901f@redhat.com>
References: <20250304-mem-fixes-v1-0-fb3dab8d901f@redhat.com>
In-Reply-To: <20250304-mem-fixes-v1-0-fb3dab8d901f@redhat.com>
To: Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>, 
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>, 
 Marek Vasut <marex@denx.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-tegra@vger.kernel.org, linux-doc@vger.kernel.org, 
 Anusha Srivatsa <asrivats@redhat.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741122340; l=9164;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=OciEGN0PmQ5giMoZ/vtKKE95gSivISgO/bMA/S68d1g=;
 b=pTj0/PXEB22n1FQLUFIR8/LAGy1sIrANZpDm5HxggUTcvee4ua1syGzPNDCXXuVF8uYVzrV0g
 CW9SR7c/ykUDW1xoVMHHFjUE9sXUTfTT+8rzenx7K3T3io+nJmqDqip
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_130803_524979_13313AF1 
X-CRM114-Status: GOOD (  16.06  )
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

Replace platform_get_resource/_byname + devm_ioremap
with just devm_platform_ioremap_resource()

Used Coccinelle to do this change. SmPl patch:

@rule@
identifier res;
expression ioremap;
identifier pdev;
constant mem;
expression name;
@@
-struct resource *res;
...
-res = platform_get_resource_byname(pdev,mem,name);
<...
-if (!res) {
-...
-}
...>
-ioremap = devm_ioremap(...);
+ioremap = devm_platform_ioremap_resource_byname(pdev,name);

and
@rule_2@
identifier res;
expression ioremap;
identifier pdev;
@@
-struct resource *res;
...
-res = platform_get_resource(pdev,...);
<...
-if (!res) {
-...
-}
...>
-ioremap = devm_ioremap(...);
+ioremap = devm_platform_ioremap_resource(pdev,0);

v2: Fix compilation error.
v3: Handle returns properly since the new API return error pointers
and not NULL

Cc: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Cc: Alain Volmat <alain.volmat@foss.st.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>(v2)
Acked-by: Raphael Gallais-Pou <rgallaispou@gmail.com>(v2)
Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/sti/sti_compositor.c | 14 +++-----------
 drivers/gpu/drm/sti/sti_dvo.c        | 14 +++-----------
 drivers/gpu/drm/sti/sti_hda.c        | 13 +++----------
 drivers/gpu/drm/sti/sti_hdmi.c       | 15 +++------------
 drivers/gpu/drm/sti/sti_hqvdp.c      | 14 +++-----------
 drivers/gpu/drm/sti/sti_tvout.c      | 14 +++-----------
 drivers/gpu/drm/sti/sti_vtg.c        | 14 +++-----------
 7 files changed, 21 insertions(+), 77 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_compositor.c b/drivers/gpu/drm/sti/sti_compositor.c
index 063f82d23d80c4ba83624a0066a18416a2b37351..8c529b0cca8b48fca532cd15e1f36fbe5bcbc71e 100644
--- a/drivers/gpu/drm/sti/sti_compositor.c
+++ b/drivers/gpu/drm/sti/sti_compositor.c
@@ -177,7 +177,6 @@ static int sti_compositor_probe(struct platform_device *pdev)
 	struct device_node *np = dev->of_node;
 	struct device_node *vtg_np;
 	struct sti_compositor *compo;
-	struct resource *res;
 	unsigned int i;
 
 	compo = devm_kzalloc(dev, sizeof(*compo), GFP_KERNEL);
@@ -194,17 +193,10 @@ static int sti_compositor_probe(struct platform_device *pdev)
 
 	memcpy(&compo->data, of_match_node(compositor_of_match, np)->data,
 	       sizeof(struct sti_compositor_data));
-
-	/* Get Memory ressources */
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (res == NULL) {
-		DRM_ERROR("Get memory resource failed\n");
-		return -ENXIO;
-	}
-	compo->regs = devm_ioremap(dev, res->start, resource_size(res));
-	if (compo->regs == NULL) {
+	compo->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(compo->regs)) {
 		DRM_ERROR("Register mapping failed\n");
-		return -ENXIO;
+		return PTR_ERR(compo->regs);
 	}
 
 	/* Get clock resources */
diff --git a/drivers/gpu/drm/sti/sti_dvo.c b/drivers/gpu/drm/sti/sti_dvo.c
index 4dcddd02629b6a1052be8fb8333bd3aa17c083c5..74a1eef4674eeabc445b53b380e325f785242024 100644
--- a/drivers/gpu/drm/sti/sti_dvo.c
+++ b/drivers/gpu/drm/sti/sti_dvo.c
@@ -511,7 +511,6 @@ static int sti_dvo_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct sti_dvo *dvo;
-	struct resource *res;
 	struct device_node *np = dev->of_node;
 
 	DRM_INFO("%s\n", __func__);
@@ -523,16 +522,9 @@ static int sti_dvo_probe(struct platform_device *pdev)
 	}
 
 	dvo->dev = pdev->dev;
-
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dvo-reg");
-	if (!res) {
-		DRM_ERROR("Invalid dvo resource\n");
-		return -ENOMEM;
-	}
-	dvo->regs = devm_ioremap(dev, res->start,
-			resource_size(res));
-	if (!dvo->regs)
-		return -ENOMEM;
+	dvo->regs = devm_platform_ioremap_resource_byname(pdev, "dvo-reg");
+	if (IS_ERR(dvo->regs))
+		return PTR_ERR(dvo->regs);
 
 	dvo->clk_pix = devm_clk_get(dev, "dvo_pix");
 	if (IS_ERR(dvo->clk_pix)) {
diff --git a/drivers/gpu/drm/sti/sti_hda.c b/drivers/gpu/drm/sti/sti_hda.c
index 14fdc00d2ba03d4f96ba407ac8e576decb6f32c0..eedccdf70833145d8cc316588915db2c766bb31a 100644
--- a/drivers/gpu/drm/sti/sti_hda.c
+++ b/drivers/gpu/drm/sti/sti_hda.c
@@ -750,16 +750,9 @@ static int sti_hda_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	hda->dev = pdev->dev;
-
-	/* Get resources */
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "hda-reg");
-	if (!res) {
-		DRM_ERROR("Invalid hda resource\n");
-		return -ENOMEM;
-	}
-	hda->regs = devm_ioremap(dev, res->start, resource_size(res));
-	if (!hda->regs)
-		return -ENOMEM;
+	hda->regs = devm_platform_ioremap_resource_byname(pdev, "hda-reg");
+	if (IS_ERR(hda->regs))
+		return PTR_ERR(hda->regs);
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
 			"video-dacs-ctrl");
diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
index 164a34d793d86f114394048667ae3189e1c39242..37b8d619066ef14a2def26e2e4f90a9c2194238d 100644
--- a/drivers/gpu/drm/sti/sti_hdmi.c
+++ b/drivers/gpu/drm/sti/sti_hdmi.c
@@ -1380,7 +1380,6 @@ static int sti_hdmi_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct sti_hdmi *hdmi;
 	struct device_node *np = dev->of_node;
-	struct resource *res;
 	struct device_node *ddc;
 	int ret;
 
@@ -1399,17 +1398,9 @@ static int sti_hdmi_probe(struct platform_device *pdev)
 	}
 
 	hdmi->dev = pdev->dev;
-
-	/* Get resources */
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "hdmi-reg");
-	if (!res) {
-		DRM_ERROR("Invalid hdmi resource\n");
-		ret = -ENOMEM;
-		goto release_adapter;
-	}
-	hdmi->regs = devm_ioremap(dev, res->start, resource_size(res));
-	if (!hdmi->regs) {
-		ret = -ENOMEM;
+	hdmi->regs = devm_platform_ioremap_resource_byname(pdev, "hdmi-reg");
+	if (IS_ERR(hdmi->regs)) {
+		ret = PTR_ERR(hdmi->regs);
 		goto release_adapter;
 	}
 
diff --git a/drivers/gpu/drm/sti/sti_hqvdp.c b/drivers/gpu/drm/sti/sti_hqvdp.c
index 0f658709c9d0d398c4eed65202443db9d0b41f8c..03684062309bbb9915d47fa6e6475cbb6c7beaaa 100644
--- a/drivers/gpu/drm/sti/sti_hqvdp.c
+++ b/drivers/gpu/drm/sti/sti_hqvdp.c
@@ -1356,7 +1356,6 @@ static int sti_hqvdp_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *vtg_np;
 	struct sti_hqvdp *hqvdp;
-	struct resource *res;
 
 	DRM_DEBUG_DRIVER("\n");
 
@@ -1367,17 +1366,10 @@ static int sti_hqvdp_probe(struct platform_device *pdev)
 	}
 
 	hqvdp->dev = dev;
-
-	/* Get Memory resources */
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		DRM_ERROR("Get memory resource failed\n");
-		return -ENXIO;
-	}
-	hqvdp->regs = devm_ioremap(dev, res->start, resource_size(res));
-	if (!hqvdp->regs) {
+	hqvdp->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(hqvdp->regs)) {
 		DRM_ERROR("Register mapping failed\n");
-		return -ENXIO;
+		return PTR_ERR(hqvdp->regs);
 	}
 
 	/* Get clock resources */
diff --git a/drivers/gpu/drm/sti/sti_tvout.c b/drivers/gpu/drm/sti/sti_tvout.c
index af6c06f448c4819def8cc0d0836e30f991529690..6a464b035de800509fb6dc7c8780b5e1128643c1 100644
--- a/drivers/gpu/drm/sti/sti_tvout.c
+++ b/drivers/gpu/drm/sti/sti_tvout.c
@@ -838,7 +838,6 @@ static int sti_tvout_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *node = dev->of_node;
 	struct sti_tvout *tvout;
-	struct resource *res;
 
 	DRM_INFO("%s\n", __func__);
 
@@ -850,16 +849,9 @@ static int sti_tvout_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	tvout->dev = dev;
-
-	/* get memory resources */
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "tvout-reg");
-	if (!res) {
-		DRM_ERROR("Invalid glue resource\n");
-		return -ENOMEM;
-	}
-	tvout->regs = devm_ioremap(dev, res->start, resource_size(res));
-	if (!tvout->regs)
-		return -ENOMEM;
+	tvout->regs = devm_platform_ioremap_resource_byname(pdev, "tvout-reg");
+	if (IS_ERR(tvout->regs))
+		return PTR_ERR(tvout->regs);
 
 	/* get reset resources */
 	tvout->reset = devm_reset_control_get(dev, "tvout");
diff --git a/drivers/gpu/drm/sti/sti_vtg.c b/drivers/gpu/drm/sti/sti_vtg.c
index 5ba469b711b5318e9e9e6d8df127fb8933d1fac1..ee81691b32036d209020498511841f6da053e17d 100644
--- a/drivers/gpu/drm/sti/sti_vtg.c
+++ b/drivers/gpu/drm/sti/sti_vtg.c
@@ -380,23 +380,15 @@ static int vtg_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct sti_vtg *vtg;
-	struct resource *res;
 	int ret;
 
 	vtg = devm_kzalloc(dev, sizeof(*vtg), GFP_KERNEL);
 	if (!vtg)
 		return -ENOMEM;
-
-	/* Get Memory ressources */
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		DRM_ERROR("Get memory resource failed\n");
-		return -ENOMEM;
-	}
-	vtg->regs = devm_ioremap(dev, res->start, resource_size(res));
-	if (!vtg->regs) {
+	vtg->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(vtg->regs)) {
 		DRM_ERROR("failed to remap I/O memory\n");
-		return -ENOMEM;
+		return PTR_ERR(vtg->regs);
 	}
 
 	vtg->irq = platform_get_irq(pdev, 0);

-- 
2.48.1


