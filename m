Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6253CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 19:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UmGkLkUQ2OBcSbG6md+QsXMIvhO3Z1B18TnRIJUa2Cc=; b=SoNcpN9r0QR3a8GuHLeSFkVWYe
	fTK7FU+4pj6xG2MHYe0gilgKQL8KQluuaHBys2hgGtxpg2Fgs3fVXrG4jRQrKJ1vnOV5AJF9FN1ga
	7x79XT+Xs7dEbWPsCzV2SuVfAoOdZpc4SxVOthN5AlUGiAswcC9mwdZJw9WAuq1IGqX/32MvGKWwX
	sZn31qD8tRGvGYmz03Y/2UG56qBPyho5GyCEmGlVnBXJkHWSI+p9lwrcdsYG736TY9eUejnh/TLFy
	41JXaIjbVoOiOACwRtEazQYm4TA3mvpldQWS6R5/w8AffQj4mqURirNMYj+oZrI7STlolI9zjhZf5
	/ROGlZVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuG1M-0000000E3sf-2iu6;
	Thu, 04 Sep 2025 19:53:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuBx5-0000000CYsi-0tbC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 15:32:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5176544391;
	Thu,  4 Sep 2025 15:32:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 958DAC4CEF1;
	Thu,  4 Sep 2025 15:32:38 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
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
Cc: dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] drm/bridge: imx8qxp-ldb: Remove dummy Runtime PM callback
Date: Thu,  4 Sep 2025 17:32:36 +0200
Message-ID: <c7436cda28409f0080dca6cd2ca13f142d6dc489.1756999913.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_083243_269039_D36D044F 
X-CRM114-Status: GOOD (  10.55  )
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

Since commit 63d00be69348fda4 ("PM: runtime: Allow unassigned
->runtime_suspend|resume callbacks"), unassigned
.runtime_{suspend,resume}() callbacks are treated the same as dummy
callbacks that just return zero.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
index 5d272916e200980f..1225029689271e2f 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
@@ -683,11 +683,6 @@ static void imx8qxp_ldb_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-static int imx8qxp_ldb_runtime_suspend(struct device *dev)
-{
-	return 0;
-}
-
 static int imx8qxp_ldb_runtime_resume(struct device *dev)
 {
 	struct imx8qxp_ldb *imx8qxp_ldb = dev_get_drvdata(dev);
@@ -700,7 +695,7 @@ static int imx8qxp_ldb_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops imx8qxp_ldb_pm_ops = {
-	RUNTIME_PM_OPS(imx8qxp_ldb_runtime_suspend, imx8qxp_ldb_runtime_resume, NULL)
+	RUNTIME_PM_OPS(NULL, imx8qxp_ldb_runtime_resume, NULL)
 };
 
 static const struct of_device_id imx8qxp_ldb_dt_ids[] = {
-- 
2.43.0


