Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DAA6C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 21:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CFcCMfK9kRbxA/PdPW3zdXiOiPSBPDlYqROSR09dnjM=; b=cReLjmQoasGvhN/XH98Y1d8XN3
	CeUXLfSz9yKsMBERSeslyMUxXi45okQK85WFKzzm4OQpaEnNlouRuq431Tn2vbNwp7bYm3300DGoC
	M2aelGMXm0fh+Dxo5hS2aPMBkM2AJM8NE7AZen0LP8AGbdjqPQll+6CYQJkD2j8o/BUh1q6Sw9kf6
	FG8TNP+foNM1epeEWplFw7nRHx0lEREh4QB2NLaVuvXqbjY9cO8gJGGM2zB57+Vg24zpZry5UbQmi
	lIwAYPyNz5+XWTXOnXAy5XJYyfiJMgaLqEUvhjhVKnRIVr8nU/tHpOt6jCifCNfNgoWyxCZkPVth6
	ytga8Ziw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpZaZ-00000006HEQ-29HQ;
	Tue, 04 Mar 2025 21:14:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpZUU-00000006GSG-3Gzp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 21:07:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741122468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CFcCMfK9kRbxA/PdPW3zdXiOiPSBPDlYqROSR09dnjM=;
	b=a+ZZK+20NjjFkvtvHci2O/H2EuDFfQEom00rHPY1f2/51BZZmpivyJ2AGXOU6BOmnCCy8h
	O6wlqUgoCKsAe+sOmJ3yhQrG05kqRhTu/oBzAOMfgu4aDmr5x98DSQnqCqVcC0n7iCNh2T
	qdDXt7rfceGzA0xMi3AuOGlJkmJyIE4=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-171-72bfiqqMOMyR2qhrhalNTg-1; Tue,
 04 Mar 2025 16:06:25 -0500
X-MC-Unique: 72bfiqqMOMyR2qhrhalNTg-1
X-Mimecast-MFC-AGG-ID: 72bfiqqMOMyR2qhrhalNTg_1741122381
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5580D1944F05;
	Tue,  4 Mar 2025 21:06:20 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.107])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 53ECE1800361;
	Tue,  4 Mar 2025 21:06:12 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 04 Mar 2025 16:05:34 -0500
Subject: [PATCH v5 4/7] drm/sprd: move to devm_platform_ioremap_resource()
 usage
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-mem-fixes-v1-4-fb3dab8d901f@redhat.com>
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
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741122340; l=2864;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=e7EAZ+KmeNfJYACxac/4HIs+1oMWt3cBSpu13fis9p8=;
 b=ys/SsEsGmjzQgZea8LqbK2IhVs/FOKEF4L1GqDD5qjRUNKHNm91m1YLg4jFnTkR1dD3lLNNAL
 HGHnws6i/2dCqW2OhErTnr6CHplGcJYBRtOI1xOmBwTrTcoixbwqQZE
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_130750_947722_F4D02573 
X-CRM114-Status: GOOD (  13.10  )
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

Replace platform_get_resource + devm_ioremap
with just devm_platform_ioremap_resource()

Used Coccinelle to do this change. SmPl patch:
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

v2: Address the return handling properly since
the new API returns error pointers and not NULL.

Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
Reviewed-by: Chunyan Zhang <zhang.lyra@gmail.com>(v1)
Reviewed-by: Maxime Ripard <mripard@kernel.org>(v1)
---
 drivers/gpu/drm/sprd/sprd_dpu.c | 13 +++----------
 drivers/gpu/drm/sprd/sprd_dsi.c | 13 +++----------
 2 files changed, 6 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/sprd/sprd_dpu.c b/drivers/gpu/drm/sprd/sprd_dpu.c
index cb2816985305fd19eac27413c214681a5a1e9ffa..a3447622a33cd612e34be038e833222567bdcd2c 100644
--- a/drivers/gpu/drm/sprd/sprd_dpu.c
+++ b/drivers/gpu/drm/sprd/sprd_dpu.c
@@ -784,19 +784,12 @@ static int sprd_dpu_context_init(struct sprd_dpu *dpu,
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct dpu_context *ctx = &dpu->ctx;
-	struct resource *res;
 	int ret;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(dev, "failed to get I/O resource\n");
-		return -EINVAL;
-	}
-
-	ctx->base = devm_ioremap(dev, res->start, resource_size(res));
-	if (!ctx->base) {
+	ctx->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(ctx->base)) {
 		dev_err(dev, "failed to map dpu registers\n");
-		return -EFAULT;
+		return PTR_ERR(ctx->base);
 	}
 
 	ctx->irq = platform_get_irq(pdev, 0);
diff --git a/drivers/gpu/drm/sprd/sprd_dsi.c b/drivers/gpu/drm/sprd/sprd_dsi.c
index 8fc26479bb6bce0aa94914f49d0986a7e19326c1..23b0e1dc547a5023ee6ad7d5e1c49e2cec986bf0 100644
--- a/drivers/gpu/drm/sprd/sprd_dsi.c
+++ b/drivers/gpu/drm/sprd/sprd_dsi.c
@@ -901,18 +901,11 @@ static int sprd_dsi_context_init(struct sprd_dsi *dsi,
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct dsi_context *ctx = &dsi->ctx;
-	struct resource *res;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(dev, "failed to get I/O resource\n");
-		return -EINVAL;
-	}
-
-	ctx->base = devm_ioremap(dev, res->start, resource_size(res));
-	if (!ctx->base) {
+	ctx->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(ctx->base)) {
 		drm_err(dsi->drm, "failed to map dsi host registers\n");
-		return -ENXIO;
+		return PTR_ERR(ctx->base);
 	}
 
 	ctx->regmap = devm_regmap_init(dev, &regmap_tst_io, dsi, &byte_config);

-- 
2.48.1


