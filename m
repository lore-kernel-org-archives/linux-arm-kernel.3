Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B90BD5E13D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 18:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p42FxQU8XqxcY65o1OnImzYH+JEKXNJxWyr+WpaPWLo=; b=geq8aOLQrQxZIFnW6qQ2vzYmwy
	Ldn5xhAczV3h+ugCYxVAVVZWlJyYPGsCcXwyeiJL+BzTK9OgvCknX/zLQu0FmgoNTAK2RFijmPRy5
	jgTkpS0aatdnnIUC0nIq47N9+XLowsCBYGu76fkkEKEzmH5r96y4TOeg2qLZgS+WD1fOAmIe4bHal
	OMi36x3Iqwhicz07q4hNetmQz87d50f9R8TG22ovU5M5FCyV0XE4G8TUwxDvd9j5NamK5c+5aYFXh
	leFkJZT4x6vOy4SAjXXAduQI0FSpo6yLmdor6i8WjjR2XSnIRzlpN092koApw5kstrr8DZUrGdVMn
	HvRwcFYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZMF-00000005fUO-3vDa;
	Tue, 16 Dec 2025 18:01:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZM5-00000005fGq-2eIh;
	Tue, 16 Dec 2025 18:01:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=p42FxQU8XqxcY65o1OnImzYH+JEKXNJxWyr+WpaPWLo=; b=oTpw6g8zoxq8gY4zrBZ6m6xv16
	M9ULm8lPRrDdZwxo4k4OAjQ/dRShCArux+LhR7GvT6ih0ckdFEeLNuM5eCgtF2UCfIJ3Xy/otgr2y
	AHEvEP29qyG4LKuCAz9mUfKaOMXHDVuN7zRT1XMHd0GgRgnlSpvLn5bMSiDESVmNZd7Q09kkgMvxn
	xFzMo/iJrCHV+lHPhNh0UfRDuDQ57wBrXuc9GKjk4rg9ZiLJ8jRW6fYuFerotFUm0yjm/FF6+nc+C
	qY8wTFTfbALMqUVSLF+pemR1Jk7w2SJtMsuqBOcqTwbI+XvFNOhzAdGwPE4ApQwPliSCKratDDIyq
	86BMHeBA==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYUV-00000005JtW-0vbZ;
	Tue, 16 Dec 2025 17:05:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BB3044E419EA;
	Tue, 16 Dec 2025 18:00:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 89DC26071C;
	Tue, 16 Dec 2025 18:00:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3F936119A980D;
	Tue, 16 Dec 2025 19:00:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765908052; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=p42FxQU8XqxcY65o1OnImzYH+JEKXNJxWyr+WpaPWLo=;
	b=BXpy6V5ifmnqjhEvL2Dlo+mKFPGcFwkNcjDzXWr8/+InGvoya8cb03w6VBniXNPHPw0PTz
	Nm/6aOLeDqbCuKklh0a23yEtPU/8ucfZfgydkx1tK1IvWqMqMSeJWPWoeUt3x/cYGHYL/c
	VdryylHllkVQCy1XVhzdpQYH+kpg2Tc1/W31YrZncrBhRCmjUxec4dvSYAqPUxdSXQpvqr
	2jLfdb4h9h7HvUv8zK9i3Iu8IoEcqr7LNcCAe0wlP636xfdXTrx0y+JtYIV+9LePz4FO+P
	IdO5NuL3+vSTmZhr2x/JYv37IGs+wsMlDitzXgfT+LWPCghQorbVduONPsNGpg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 16 Dec 2025 18:58:51 +0100
Subject: [PATCH v3 18/22] drm/bridge: imx8qxp-pixel-link: simplify logic to
 find next bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-18-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Alexey Brodkin <abrodkin@synopsys.com>, 
 Phong LE <ple@baylibre.com>, Liu Ying <victor.liu@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_170539_411797_A1687730 
X-CRM114-Status: GOOD (  15.40  )
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

imx8qxp_pixel_link_find_next_bridge() uses a sophisticated logic to find
the preferred next bridge, using an array with two supporting index
variables. This is more sophisticated than required because we only ever
need a pointer to the "current" bridge and to the "best so far" bridge.

Additionally this logic is going to make the addition of proper refcounting
quite complex.

Rewrite the logic using two drm_bridge pointers, which is by itself
slightly simpler and is a preparation step for introducing bridge
refcounting in a later commit.

Also reword a comment to make it clearer.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
index e5943506981d..53016f0d53a0 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
@@ -261,12 +261,10 @@ imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 {
 	struct device_node *np = pl->dev->of_node;
 	struct device_node *port, *remote;
-	struct drm_bridge *next_bridge[PL_MAX_NEXT_BRIDGES];
+	struct drm_bridge *selected_bridge = NULL;
 	u32 port_id;
 	bool found_port = false;
-	int reg, ep_cnt = 0;
-	/* select the first next bridge by default */
-	int bridge_sel = 0;
+	int reg;
 
 	for (port_id = 1; port_id <= PL_MAX_MST_ADDR + 1; port_id++) {
 		port = of_graph_get_port_by_id(np, port_id);
@@ -300,24 +298,25 @@ imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 			continue;
 		}
 
-		next_bridge[ep_cnt] = of_drm_find_bridge(remote);
-		if (!next_bridge[ep_cnt]) {
+		struct drm_bridge *next_bridge = of_drm_find_bridge(remote);
+		if (!next_bridge) {
 			of_node_put(remote);
 			return ERR_PTR(-EPROBE_DEFER);
 		}
 
-		/* specially select the next bridge with companion PXL2DPI */
-		if (of_property_present(remote, "fsl,companion-pxl2dpi"))
-			bridge_sel = ep_cnt;
-
-		ep_cnt++;
+		/*
+		 * Select the next bridge with companion PXL2DPI if
+		 * present, otherwise default to the first bridge
+		 */
+		if (!selected_bridge || of_property_present(remote, "fsl,companion-pxl2dpi"))
+			selected_bridge = next_bridge;
 
 		of_node_put(remote);
 	}
 
 	pl->mst_addr = port_id - 1;
 
-	return next_bridge[bridge_sel];
+	return selected_bridge;
 }
 
 static int imx8qxp_pixel_link_bridge_probe(struct platform_device *pdev)

-- 
2.52.0


