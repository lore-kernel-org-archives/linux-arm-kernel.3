Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C7E0C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 13:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WuZX7Ld13ojOYCTY0ar+bokEZLNX0F8BwuavdUHGtR8=; b=s7Bwptc8FK9TV/wsnChr9fIBUF
	MHd9x1Ik2ldEiHhdCH1Y736eMEQ1lLg9+UyLEbxRfID7hjKaG9dBB+mIlIwyHKaWhv+wtQ3m+pV1C
	8DsmQ1NDyhdV0sxU+XoFgmGfi0u/SyI9EQooN+QtVrhsKrsHX0TlMs+AYNYrUgxr3hfEga57r7gBE
	GDz+k/zgdLPvmcdFoZRxaRlcY49CS30BoZ0hMOtInz5ovO3qVoV1W3fYHVie79OsVqTk3uQEOuW4O
	LzszFHDs5bZrGdP+HPf5QGXukEZPfJzVOcx/J7ttSMSnhRC1s9H8PhNQ3OC0NBgJ6gDLgSgLKkuxN
	UeNb2QJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6q0E-00000009KT4-3YrC;
	Wed, 16 Sep 2026 13:48:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6pzf-00000009K4t-3DPe
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 16 Sep 2026 13:48:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=WuZX7Ld13ojOYCTY0ar+bokEZLNX0F8BwuavdUHGtR8=; b=pdFGwnrCaFcReJD45+h0caHnjM
	rBvUC+PzquoW2LyjM13z1GOnKQxUjFdBwNI6wvCU9t9jl7VN7DMReA4L7Gu7DAJ2uiSRFYQ3MRpdN
	MyZ2IxN6JOSoCkCPSq+jzPgxS7Xiwo1+/C2IVlZqvlvbkKze3YtckbNYQp9g9SJe15GNri9rNHcmj
	+C9WXf9VXn+uEdzOUJ369Fq59YkQ1GHcG3zh1cuyPKzUmK3F7uZh3ZG7lQUZPZ03capIChE6G98mO
	gkgev9pu2zp9hS1Hf8HExhJsXpnk9y3V/pYEiYwK45XSoCZOo4FPkXu3Hb4OXi+2FhGm9bPnnKF6P
	1dUBnbDw==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6pzb-00000007wCn-2FJK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 13:48:10 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EB31A1A07A8;
	Wed, 16 Sep 2026 13:48:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B9F0660337;
	Wed, 16 Sep 2026 13:48:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8B57111C7B031;
	Wed, 16 Sep 2026 15:47:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789566480; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WuZX7Ld13ojOYCTY0ar+bokEZLNX0F8BwuavdUHGtR8=;
	b=QGALR/4FPgZgsJZy9ShvO3e3wFndnrRlRApyWADH7o1KovktZ6gvPgK5F3GcNw7Xi4G2vp
	jDl32gEpAtULcO8jsBkGW+p7uDlw04AuoovRFl1g/lx8/75D5MKKLRDH7kwUVFAKp6ithU
	HsjCJjTIVNmRSKBUP6bM2vX7HQXd/kqGyPzL6AO4iI+iB8TusNMlHxNFUkb36uwwAwc8uN
	SCVmLoMR/scL/Jz4EBOAuzAQD02IYoVrIYq1MNN03qOCft36nfQHBx5Wm8NopxtVSHKIC0
	+7q6jNwndNZrUZpcLnB+S5CsGCAtKzdXd2tLF5blJtYK8fz7pJolZTed0/UZHQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 16 Sep 2026 15:45:41 +0200
Subject: [PATCH v3 17/19] drm/omap: dss: don't create a panel_bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-drm-bridge-every-panel-v3-17-83afb4f1a707@bootlin.com>
References: <20260916-drm-bridge-every-panel-v3-0-83afb4f1a707@bootlin.com>
In-Reply-To: <20260916-drm-bridge-every-panel-v3-0-83afb4f1a707@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
 Paul Kocialkowski <paulk@sys-base.io>, Linus Walleij <linusw@kernel.org>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, Sean Paul <sean@poorly.run>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Albert Esteve <aesteve@redhat.com>, 
 Anusha Srivatsa <asrivats@redhat.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mips@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, asahi@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-tegra@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_144807_709784_3E33DE27 
X-CRM114-Status: GOOD (  14.09  )
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

Now a panel_bridge is automatically created for every drm_panel and the
panel-bridge API is just a deprecated wrapper to access it.

Update and simplify the code by just getting a reference to the
already-existing bridge using of_drm_get_bridge_by_endpoint().

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/omapdrm/dss/omapdss.h |  1 -
 drivers/gpu/drm/omapdrm/dss/output.c  | 42 ++++-------------------------------
 2 files changed, 4 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index 4c22c09c93d5..e3e685c931f1 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -204,7 +204,6 @@ struct omap_dss_device {
 	struct dss_device *dss;
 	struct drm_bridge *bridge;
 	struct drm_bridge *next_bridge;
-	struct drm_panel *panel;
 
 	struct list_head list;
 
diff --git a/drivers/gpu/drm/omapdrm/dss/output.c b/drivers/gpu/drm/omapdrm/dss/output.c
index 6e9bc605ee22..36d37deac802 100644
--- a/drivers/gpu/drm/omapdrm/dss/output.c
+++ b/drivers/gpu/drm/omapdrm/dss/output.c
@@ -12,7 +12,6 @@
 #include <linux/of_graph.h>
 
 #include <drm/drm_bridge.h>
-#include <drm/drm_panel.h>
 
 #include "dss.h"
 #include "omapdss.h"
@@ -20,40 +19,16 @@
 int omapdss_device_init_output(struct omap_dss_device *out,
 			       struct drm_bridge *local_bridge)
 {
-	struct device_node *remote_node;
+	struct drm_bridge *bridge;
 	int ret;
 
-	remote_node = of_graph_get_remote_node(out->dev->of_node,
-					       out->of_port, 0);
-	if (!remote_node) {
+	bridge = of_drm_get_bridge_by_endpoint(out->dev->of_node, out->of_port, 0);
+	if (IS_ERR(bridge)) {
 		dev_dbg(out->dev, "failed to find video sink\n");
 		return 0;
 	}
 
-	out->panel = of_drm_find_panel(remote_node);
-	if (IS_ERR(out->panel))
-		out->panel = NULL;
-
-	if (!out->panel)
-		out->bridge = of_drm_find_and_get_bridge(remote_node);
-
-	of_node_put(remote_node);
-
-	if (out->panel) {
-		struct drm_bridge *bridge;
-
-		bridge = drm_panel_bridge_add(out->panel);
-		drm_panel_put(out->panel);
-		if (IS_ERR(bridge)) {
-			dev_err(out->dev,
-				"unable to create panel bridge (%ld)\n",
-				PTR_ERR(bridge));
-			ret = PTR_ERR(bridge);
-			goto error;
-		}
-
-		out->bridge = drm_bridge_get(bridge);
-	}
+	out->bridge = bridge;
 
 	if (local_bridge) {
 		if (!out->bridge) {
@@ -65,11 +40,6 @@ int omapdss_device_init_output(struct omap_dss_device *out,
 		out->bridge = drm_bridge_get(local_bridge);
 	}
 
-	if (!out->bridge) {
-		ret = -EPROBE_DEFER;
-		goto error;
-	}
-
 	return 0;
 
 error:
@@ -79,10 +49,6 @@ int omapdss_device_init_output(struct omap_dss_device *out,
 
 void omapdss_device_cleanup_output(struct omap_dss_device *out)
 {
-	if (out->bridge && out->panel)
-		drm_panel_bridge_remove(out->next_bridge ?
-					out->next_bridge : out->bridge);
-
 	drm_bridge_put(out->next_bridge);
 	drm_bridge_put(out->bridge);
 }

-- 
2.55.0


