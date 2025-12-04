Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D4FD1D89F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 09:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zGD85ppqylFct/OoiQ7VLAJO/LH5DCFl+tlA0JNCPB8=; b=cdjOCrLqTjUrln1Ph3AvvBVtWb
	itLqB20j4BAZSi0SJ0zTT8mA0RU2tmm9LNxVqIdSHFRBL66ROv7fXGZ6N7k88voMTHjP7wq7MTVN/
	2g1p+71tiKfO0IP6f6cVkw7rvz1VyRkNpAcuWgxZF5AzaW2aqCcyshOAik+4KrV9MZq5JMY3bamtv
	to5EQ1u25XNN8y77i+daOYRDKTjNyC9fWUoel9CtceAAQ5TweOpaLU4M4qEScgooMFGT77nFJyBDQ
	LSBS424slTqmXKhU04FEEE22NB2qd1Egb0s5paoQBuFHw9u1G5IdKET333Ee8Qexu6wsoBUP9ZA+q
	9KdW+22w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR5v9-00000007mbv-0zFQ;
	Thu, 04 Dec 2025 09:46:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR5v8-00000007mbo-1NRw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 09:46:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 71C4D601B0;
	Thu,  4 Dec 2025 09:46:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E51CFC4CEFB;
	Thu,  4 Dec 2025 09:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764841601;
	bh=3Xo6KEFNNleLs7NQbRdlOybDeYxGnm96HhQ7ttb1sa4=;
	h=From:To:Cc:Subject:Date:From;
	b=qumC81uXbcWCwG/Jll8DFkNziiV0b8/vPnQBlJ04lGwHHzGWUFixsy1daHL5jZjcX
	 fwdaSlJ/2UV+bUwlSJ89XbTwiordBco22NN1g7Lu/FLMOLeACPJF4lIAM7SEfAe+PJ
	 vW532CoWcoOjz1dPWVHPSK+qLw5lnVYG7kURBf7/SJBthZqAYSfQPKySL4ohENGJLd
	 JdN+lRwBfBfxLjYYZXijwlyrLORrrmT1SDQYyS/9Q6urK5sySCmtUHx1I+cSSM7/PE
	 M9KiK7UAvHFmt6SS0wuCdeOCAJVch8U0PQOpRU8YhC8y7HDNdA1NvozuCVQp/24y4g
	 41l/SwBo0Zcfg==
From: Arnd Bergmann <arnd@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/imx: select DRM_DISPLAY_HELPER as needed
Date: Thu,  4 Dec 2025 10:46:26 +0100
Message-Id: <20251204094635.1030724-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Arnd Bergmann <arnd@arndb.de>

CONFIG_DRM_BRIDGE_CONNECTOR is a bool option that turns on features of
the display helpers, which are in a module controlled by the (tristate)
CONFIG_DRM_DISPLAY_HELPER. If the display helpers are in a loadable
module, a built-in driver trying to use the bridge connectors fails
to link:

x86_64-linux-ld: drivers/gpu/drm/imx/ipuv3/parallel-display.o: in function `imx_pd_bind':
parallel-display.c:(.text+0xcd): undefined reference to `drm_bridge_connector_init'
x86_64-linux-ld: drivers/gpu/drm/imx/ipuv3/imx-ldb.o: in function `imx_ldb_bind':
imx-ldb.c:(.text+0x224): undefined reference to `drm_bridge_connector_init'

Select the DRM_BRIDGE_CONNECTOR symbol as well, to ensure it's built-in
if anything needs it.

Fixes: f94b9707a1c9 ("drm/imx: parallel-display: switch to imx_legacy_bridge / drm_bridge_connector")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/imx/ipuv3/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/imx/ipuv3/Kconfig b/drivers/gpu/drm/imx/ipuv3/Kconfig
index acaf25089001..1c3825a86380 100644
--- a/drivers/gpu/drm/imx/ipuv3/Kconfig
+++ b/drivers/gpu/drm/imx/ipuv3/Kconfig
@@ -13,6 +13,7 @@ config DRM_IMX
 config DRM_IMX_PARALLEL_DISPLAY
 	tristate "Support for parallel displays"
 	depends on DRM_IMX
+	select DRM_DISPLAY_HELPER
 	select DRM_BRIDGE
 	select DRM_BRIDGE_CONNECTOR
 	select DRM_IMX_LEGACY_BRIDGE
@@ -33,6 +34,7 @@ config DRM_IMX_LDB
 	depends on DRM_IMX
 	depends on COMMON_CLK
 	select MFD_SYSCON
+	select DRM_DISPLAY_HELPER
 	select DRM_BRIDGE
 	select DRM_BRIDGE_CONNECTOR
 	select DRM_PANEL_BRIDGE
-- 
2.39.5


