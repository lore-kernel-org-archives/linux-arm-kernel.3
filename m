Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 680F7E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 14:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J1yM4GW4YkH4sSr6aDIK6r6U62z1pZvrPK786Xfjgcc=; b=EgjRPYLfa/fNx7Z907jmypDfq8
	Ktp+zkvz5Axdv9KGoYV8B2lyhE4+pH6OTgdneVhhNWMEl8Oyl3tI9uhl7URTZzvkoRm4AUbJ+L0OE
	Vbl/w3oWtj0dkxaRRk8f7L3thlz0MvTVI6x7XluyFicQgEK9VgMPOP/D+JGnDdJXpWWT8DNFLE0Gb
	UzhwFah6JGwyW0LdVLGhqDjQd0XB8/7tlonpum8y0dyyYiiPcldYI4v/R+wFU0H6Y6671Ez6Oerq2
	7uMnIVGsqFszf4MM6MbcBQpfrgUgiXJQZza+mOoSHydu0xddYOfLgC5N+3dBl3ZXcIP6ugiXF9Xm5
	iITCerAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVAmD-00000005GKg-1UJh;
	Tue, 07 Jan 2025 14:41:49 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVAjr-00000005Fds-16Xi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 14:39:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1736260763; x=1767796763;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=J1yM4GW4YkH4sSr6aDIK6r6U62z1pZvrPK786Xfjgcc=;
  b=doI0a3x0pSRJj9JqnBlbxJgDJtnvb8vnm68n75PYUoc0kjivXrXRe3MK
   7DCiYPA2uiSFWniRnAjRtLh64II0pO/Vbwe0DZfzndcGoujizVsSU1ynh
   TmiUX5qGAI6wxTHn1nluFHk8kWneca+90ZfNQI5KsTB90AKjPrPj/Ijtk
   /LCKBzhQOKyOEpb9ftN0l+cog61UCYQFcjtEzbwZxGnRggBFXLGrJl9IS
   Zf2x42rOAkzohW613vEsUM3RCt3XrPD568mHK0jRgtK7bNkXO8s7eL7fk
   1KPqzjCazgyGLVAy6NMH2RdB0hceTQ4yX9vPvkSVSmDsVzEI9bgu3drv3
   A==;
X-CSE-ConnectionGUID: QyWCmoWdR92sY8SQ4BDnPQ==
X-CSE-MsgGUID: d1obu0ihSym4Fk1pIal47Q==
X-IronPort-AV: E=Sophos;i="6.12,295,1728943200"; 
   d="scan'208";a="40897242"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Jan 2025 15:39:21 +0100
X-CheckPoint: {677D3C99-4B-9B2B6168-EB6F31C5}
X-MAIL-CPID: AF5E493BE366F514177D66585BB4F2B7_5
X-Control-Analysis: str=0001.0A682F20.677D3C9A.001E,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A593A160B22;
	Tue,  7 Jan 2025 15:39:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1736260757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J1yM4GW4YkH4sSr6aDIK6r6U62z1pZvrPK786Xfjgcc=;
	b=akmXuBPKfC17Ejx73+QbFvd05OTCIsI5Dt+hgvY83nLqR4nzyp502jEuUCNexo9oc/i2Ro
	eq6T4ruk2tSVjGYgPC/Tm7Y2jbGe4yqfm9dYCdHMWjBO9tIfVEFjNWS0rB4kV/BCygFWE/
	1YTfIfmwx7aWVM/Sg40deUJLtk71JVSvue1EiO7rWpeqa3hp34cqcmJmuhBsm95g0keP3Z
	k2R7R34HKxMaNHDVIsUtjm1kE4UAI8zfTTfFaj57JI5HukXGkF1Yx01W0QWF8kEGO8l8z5
	M8CUzn75n1WAm2zG17icnbnMRCQW8WFYcKTNVQcQeOvExjM7nZk/Rwm4mfUfTQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Liu Ying <victor.liu@nxp.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] drm/bridge: imx8qxp-pxl2dpi: Use dev_err_probe
Date: Tue,  7 Jan 2025 15:38:57 +0100
Message-Id: <20250107143900.988567-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250107143900.988567-1-alexander.stein@ew.tq-group.com>
References: <20250107143900.988567-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_063923_637864_842486E2 
X-CRM114-Status: GOOD (  11.69  )
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

This simplifies the code and gives additional information upon deferral.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c | 26 ++++++--------------
 1 file changed, 7 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
index 65cf3a6c8ec69..038eaff889bb7 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
@@ -398,20 +398,12 @@ static int imx8qxp_pxl2dpi_bridge_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	p2d->regmap = syscon_node_to_regmap(np->parent);
-	if (IS_ERR(p2d->regmap)) {
-		ret = PTR_ERR(p2d->regmap);
-		if (ret != -EPROBE_DEFER)
-			DRM_DEV_ERROR(dev, "failed to get regmap: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(p2d->regmap))
+		return dev_err_probe(dev, ret, "failed to get regmap\n");
 
 	ret = imx_scu_get_handle(&p2d->ipc_handle);
-	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			DRM_DEV_ERROR(dev, "failed to get SCU ipc handle: %d\n",
-				      ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get SCU ipc handle\n");
 
 	p2d->dev = dev;
 
@@ -422,13 +414,9 @@ static int imx8qxp_pxl2dpi_bridge_probe(struct platform_device *pdev)
 	}
 
 	p2d->next_bridge = imx8qxp_pxl2dpi_find_next_bridge(p2d);
-	if (IS_ERR(p2d->next_bridge)) {
-		ret = PTR_ERR(p2d->next_bridge);
-		if (ret != -EPROBE_DEFER)
-			DRM_DEV_ERROR(dev, "failed to find next bridge: %d\n",
-				      ret);
-		return ret;
-	}
+	if (IS_ERR(p2d->next_bridge))
+		return dev_err_probe(dev, PTR_ERR(p2d->next_bridge),
+				     "failed to find next bridge\n");
 
 	ret = imx8qxp_pxl2dpi_set_pixel_link_sel(p2d);
 	if (ret)
-- 
2.34.1


