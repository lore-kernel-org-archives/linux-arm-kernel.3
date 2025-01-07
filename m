Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF139E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 14:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0iI7T0R6eCAxaxyKlzF/ND6AcM0EauPs1fZKfAI3pZM=; b=117WRk4pAt9sEGGtsJq06wKt2L
	4yEwn9L2Qwderp+0BdvQmi9/qkAwz1s4ON9KBz4gv6vIbVFIy/V0ixfXkUYPYWebclLDeG+XSpKZV
	/zAZry9eVkC9KIWN+aj8AGF1FmuLlsKBInjcIavEfjzvLObhd/lvkFKS2VPeFO6hAvbwIKXfeVejn
	R6RKnc0AJUQl9Ygw4mRblXqVyOBRt4z+1ymjJ1U8C57rCo1wS/MIdXNIOJ2IMx+ewprcDSacL2voW
	wtD6+Dtn6sIp8UrfuDlYv4tCDzndmO5qEJzyEJ1dkDh9/jyPrwtTQ2nJVZKWm/lxw9pDleCiK//+g
	8WwJTtng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVApj-00000005HM0-14Qz;
	Tue, 07 Jan 2025 14:45:27 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVAk7-00000005FiN-40RX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 14:39:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1736260780; x=1767796780;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0iI7T0R6eCAxaxyKlzF/ND6AcM0EauPs1fZKfAI3pZM=;
  b=gEOG+cXWPNt+itM76HGpJWvgZWia6KbiaChICUwvjKPHUENrPC7Cq0M0
   sVihrAEjRoSD+T1Ml2TiXz0Ov6qrkFPedMTjOw/n+n3enUPpYnEZOlkE4
   5UssG+qffxvpHZaZkzHHkuUee0g+enUwcAVtAtm6QILFXAeQbGEEAc574
   xiFH8EypcKsIRYoDLst6FNthMyjz222sexXQsp5TyEu2wVJHUKduNwm21
   jEY5ID1c18Mo10pVSL+V3QfW70gLc2Fbm0DskIXaPo0yofxIYEPEqFlxM
   pVbBwxxlJfr5FwLO1hf3KMyKMk/kHjDBtpq5Ej50E6nZGmDiVQ3F7186u
   Q==;
X-CSE-ConnectionGUID: odyyrwlQR9WlvSB13BRqAw==
X-CSE-MsgGUID: PbEUURTTTSyZGDyba87qpA==
X-IronPort-AV: E=Sophos;i="6.12,295,1728943200"; 
   d="scan'208";a="40897254"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Jan 2025 15:39:39 +0100
X-CheckPoint: {677D3CAB-12-31397509-E321C4C4}
X-MAIL-CPID: 562AC94789849B901363AA16315BFA9E_0
X-Control-Analysis: str=0001.0A682F26.677D3CAB.0077,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D8806160B22;
	Tue,  7 Jan 2025 15:39:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1736260774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0iI7T0R6eCAxaxyKlzF/ND6AcM0EauPs1fZKfAI3pZM=;
	b=QS2VxVpTVdB1WaEfGv+GWDm26X5wPDOXJYAeb5LFd6sdrOCKvcrAsiQFkkTKTIwhf9Om84
	cLyNjddXLlyONdDEl5jW2W3gtmgcTh+iQt+QArc0fEpAnPk2n3D3eNwjqMSTbwmoQa6trn
	TGdOicsp3Is0Mw5xurF9t1BUZn612LRJNc0RbM+67sIbLELBy+J78juLWh3IIWl/R285nm
	AuW4GY6vTWvxpSRdwXfO503WYUbC9rqoAGFBC+GWnG99fUgRpGSA+yFzW6ReazhvqJ6va1
	r51N/cjz1WleLpweyKC/tYovISHm7yiCsq7fCQlu20hyvaobUqHl3cXibN/oTw==
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
Subject: [PATCH v2 4/4] drm/bridge: imx8qxp-pixel-link: Use dev_err_probe
Date: Tue,  7 Jan 2025 15:39:00 +0100
Message-Id: <20250107143900.988567-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250107143900.988567-1-alexander.stein@ew.tq-group.com>
References: <20250107143900.988567-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_063940_346034_1F0CFBA1 
X-CRM114-Status: GOOD (  11.29  )
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
 .../gpu/drm/bridge/imx/imx8qxp-pixel-link.c   | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
index 4b0715ed6f38c..6391038f3949f 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
@@ -333,12 +333,9 @@ static int imx8qxp_pixel_link_bridge_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	ret = imx_scu_get_handle(&pl->ipc_handle);
-	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			DRM_DEV_ERROR(dev, "failed to get SCU ipc handle: %d\n",
-				      ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to get SCU ipc handle\n");
 
 	ret = of_property_read_u8(np, "fsl,dc-id", &pl->dc_id);
 	if (ret) {
@@ -374,13 +371,9 @@ static int imx8qxp_pixel_link_bridge_probe(struct platform_device *pdev)
 		return ret;
 
 	pl->next_bridge = imx8qxp_pixel_link_find_next_bridge(pl);
-	if (IS_ERR(pl->next_bridge)) {
-		ret = PTR_ERR(pl->next_bridge);
-		if (ret != -EPROBE_DEFER)
-			DRM_DEV_ERROR(dev, "failed to find next bridge: %d\n",
-				      ret);
-		return ret;
-	}
+	if (IS_ERR(pl->next_bridge))
+		return dev_err_probe(dev, PTR_ERR(pl->next_bridge),
+				     "failed to find next bridge\n");
 
 	platform_set_drvdata(pdev, pl);
 
-- 
2.34.1


