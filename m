Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5472DE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 14:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v6ZalIwFfK9vUB0/HSTtySwzznHuXDMQLLMZDZH/dAc=; b=b1EXjGZPt2tetGiS21p5se5rWD
	KA8P5d5ZmcWMJkrCDp5emMLp0e+jliQLm0SlZ/A7q1Lhw6TzA6tK3PRt/ug4NzNp/x8b+dsQElabh
	MrIghbibiNflSEYLFlWTfDp0H28eHLFot+P794X+UTMjCFM+C4+O0HTgq5iumpnXwWlkvcyobAQKa
	SqiCuN4FzmCIdGmEVr3ULCFblvJWC3/xOxDS2n4sKnYpaj6ut3hgKNZmgQYRTAGRMoPMaEsdw78kW
	TEmF6hI/l8gXXYzLjUVqZwz/NGhlszvBaPWpFSReicIrKjbpGw1nU+ve8D0BlSoSMsOX7PAxwfPaF
	f8OFvIuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVAnN-00000005GgQ-45bA;
	Tue, 07 Jan 2025 14:43:01 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVAjx-00000005FiN-29vg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 14:39:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1736260769; x=1767796769;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=v6ZalIwFfK9vUB0/HSTtySwzznHuXDMQLLMZDZH/dAc=;
  b=bMuTGudGdCF+GFdN3BRpzeYX2ub3vAL583xnZ67bsh/g1m0Rfl/QNAcp
   bsBZWCTqCqw+iOvxI0xnGyPIow2HfD5HU9P/X+JZpsH6VZ9eqxQ2j5Qyb
   1Xt9JnvjhmKRJmw6Fz/d+up2EBv6+juW0Wo8EDoItc4JHmY2S2YiGYOBL
   zss84WT6eFPWKM/ceX6BrhJk9bns0/iuYzvZYX/T33kV7vh5oV7FG1Bof
   aw10cNd+H51kh/6pGFP0S3fQlAY1jhaoruGB/evGiTIi2byx7DxGOY4Ra
   ow4faNh6cRd7gnFxXWRdzOufJYwyv+nu7elXKp1bWxsm8ovcXUgcYlhBe
   g==;
X-CSE-ConnectionGUID: OLkKxxOYQ2O7L3x2p5kTEg==
X-CSE-MsgGUID: kBmI3pPLQ6y9k7ktctXARQ==
X-IronPort-AV: E=Sophos;i="6.12,295,1728943200"; 
   d="scan'208";a="40897247"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Jan 2025 15:39:27 +0100
X-CheckPoint: {677D3C9F-1F-3C670366-E45AD810}
X-MAIL-CPID: 5D665BE28A4386F0867A29349A815CCC_4
X-Control-Analysis: str=0001.0A682F27.677D3C9F.00CA,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 59956160B22;
	Tue,  7 Jan 2025 15:39:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1736260763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v6ZalIwFfK9vUB0/HSTtySwzznHuXDMQLLMZDZH/dAc=;
	b=Kz/TNRA2k3u0PyJ5oHB+nYGayQGkRTxZ/4I43G45iHR3By/K8jB9CNTC3ABHnqQ+5j4yi1
	JK0iWidsvqz2r9mSf8ykklx9V5qMaTkR7iAxw2V8CPSar/qAY4r74lKL/noQSeVcC3VVOj
	je4FFLa5DIqPgszBZ3nBkUAmqXvJnXvKX30Y1XIgBDai1BUJ6zBIZ/BlC2qN9HwAzVqHmQ
	hNivDMYEMYc6BHoSSj8KRGOVdaMfOGRVTg8i89h8UNQBaLgqsi9GP1SeITDB3QCVktFNGH
	tENFAAGPUqz8kL4ALPtJ9jxdwF68cdWI7BZbASmcBCgXIL03jobcxGjHDJ+xOQ==
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
Subject: [PATCH v2 2/4] drm/bridge: imx8qxp-ldb: Use dev_err_probe
Date: Tue,  7 Jan 2025 15:38:58 +0100
Message-Id: <20250107143900.988567-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250107143900.988567-1-alexander.stein@ew.tq-group.com>
References: <20250107143900.988567-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_063929_852572_B66C7884 
X-CRM114-Status: GOOD (  12.24  )
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
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c | 37 ++++++++----------------
 1 file changed, 12 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
index 7bce2305d6767..d5e123173f354 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
@@ -557,10 +557,8 @@ static int imx8qxp_ldb_parse_dt_companion(struct imx8qxp_ldb *imx8qxp_ldb)
 
 	imx8qxp_ldb->companion = of_drm_find_bridge(companion_port);
 	if (!imx8qxp_ldb->companion) {
-		ret = -EPROBE_DEFER;
-		DRM_DEV_DEBUG_DRIVER(dev,
-				     "failed to find bridge for companion bridge: %d\n",
-				     ret);
+		ret = dev_err_probe(dev, -EPROBE_DEFER,
+				    "failed to find bridge for companion bridge\n");
 		goto out;
 	}
 
@@ -590,22 +588,14 @@ static int imx8qxp_ldb_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	imx8qxp_ldb->clk_pixel = devm_clk_get(dev, "pixel");
-	if (IS_ERR(imx8qxp_ldb->clk_pixel)) {
-		ret = PTR_ERR(imx8qxp_ldb->clk_pixel);
-		if (ret != -EPROBE_DEFER)
-			DRM_DEV_ERROR(dev,
-				      "failed to get pixel clock: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(imx8qxp_ldb->clk_pixel))
+		return dev_err_probe(dev, PTR_ERR(imx8qxp_ldb->clk_pixel),
+				     "failed to get pixel clock\n");
 
 	imx8qxp_ldb->clk_bypass = devm_clk_get(dev, "bypass");
-	if (IS_ERR(imx8qxp_ldb->clk_bypass)) {
-		ret = PTR_ERR(imx8qxp_ldb->clk_bypass);
-		if (ret != -EPROBE_DEFER)
-			DRM_DEV_ERROR(dev,
-				      "failed to get bypass clock: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(imx8qxp_ldb->clk_bypass))
+		return dev_err_probe(dev, PTR_ERR(imx8qxp_ldb->clk_bypass),
+				     "failed to get bypass clock\n");
 
 	imx8qxp_ldb->dev = dev;
 
@@ -640,13 +630,10 @@ static int imx8qxp_ldb_probe(struct platform_device *pdev)
 	}
 
 	imx8qxp_ldb_ch->phy = devm_of_phy_get(dev, ldb_ch->np, "lvds_phy");
-	if (IS_ERR(imx8qxp_ldb_ch->phy)) {
-		ret = PTR_ERR(imx8qxp_ldb_ch->phy);
-		if (ret != -EPROBE_DEFER)
-			DRM_DEV_ERROR(dev, "failed to get channel%d PHY: %d\n",
-				      imx8qxp_ldb->active_chno, ret);
-		return ret;
-	}
+	if (IS_ERR(imx8qxp_ldb_ch->phy))
+		return dev_err_probe(dev, PTR_ERR(imx8qxp_ldb_ch->phy),
+				     "failed to get channel%d PHY\n",
+				     imx8qxp_ldb->active_chno);
 
 	ret = ldb_find_next_bridge_helper(ldb);
 	if (ret)
-- 
2.34.1


