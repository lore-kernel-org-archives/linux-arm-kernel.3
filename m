Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C99CD8C88
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 12:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MGJmTaj0v3fyny/5gzBI1fPt8RN2g4o65vx0LjqktFk=; b=DAXsuBFukGhpcARYoqbttBGaxg
	Fq2OrdF3GFNYngHR3Mu9OgHjIzkJwhLGMSI1c1NpFisydY+Wa3BOdTrIu+Oh5QnxW2RRyjZE6J2X1
	w3xxt51x3yvGXbvlcfgnUVh40qXAB4F0A7idCW8YY6BrLnlHmE6GSKQB5cd6z9QDUO68XgBPY0SDE
	ILkz7j1GkaY2CJHuCOrH1vKVkgBjRv0spcIRE9/UbseMwl4b+ewdGlNTmC6ijXGML77xLnv/zgT/X
	jJvE2S9mnNBePLxYQ1NUF1IAJqvSyIT0mYaOYmhPrvx7TOghmhtNICv4XSOWMvqWnONBPaK2onYYz
	m0QhHfUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWClo-00000002F0S-2x4v;
	Sun, 07 Jun 2026 12:38:28 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWClm-00000002Ezl-2K39
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Jun 2026 12:38:27 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-460166910e6so1709617f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Jun 2026 05:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780835904; x=1781440704; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MGJmTaj0v3fyny/5gzBI1fPt8RN2g4o65vx0LjqktFk=;
        b=hzDtDI+kA/x3y7oRwrWC+/Mi5+aOd0ICGAvgBYdEWhmastHDFGIjA9njjnJTa/CLny
         SP88Np7A5YVYwBtiQ9v0zRjRUPaQkLOFyhTr0yCcsR55hxqyRyaWRic9uN7jGQGoljyt
         r2J3sXboIYgpZeGzS+VN5YiXGfqEFdPxfgjBc+DIWO2vdvJxy4Q+N2vwWJ7/aAulDdT8
         VGLpmv7i5ukrxbCCG1HAaFhNMB6Snzxo8Xwar9LUFSXe3dnllApy0LGPZ9V1y5TZF6Nn
         kxIrscwlLkOqdBplrONHuPm2d2jG/DR+xl8F2udkKm9rb2C4TQ1IIqY85kor5EwkcB5C
         FcIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780835904; x=1781440704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MGJmTaj0v3fyny/5gzBI1fPt8RN2g4o65vx0LjqktFk=;
        b=f1spvrmeA2gEXbiVnIMHKPcOBPDPqenJ5UsreBgO7QdMyCq+Pz7bhZ12r+n1RB+Kzu
         kN4+6dBfQFOhqsa/ztbchOSQ3RV+iMFkizw60H4LMsYiUiK6V+C5zbs+MKxmedfPfBNx
         eZPd18fk1qRB9rLUkgdm/L9gSjMMjLhVdnSCH3eSObPd9hr0dpJhHZf+IXJtj8Mqrda4
         EbKNzMBfpfRL7lv/aocfn4xY/bmDELu3AcZ7cxrGOfDk63l5ECB4Ff2IHhqnTbbNgFSi
         +KC4N7pfomzg7vkL4Tfx2e8flDS227SVYGE1v/eyv0cPH/coWB73caBWfAlfUB4/M55p
         mqkQ==
X-Forwarded-Encrypted: i=1; AFNElJ/aPsRtrqMocgS3zO+7m88D60qZFnT/r5j3N4U6nYUxZPl+P8VZGZ5n5WLGHyKk9aH3X+TOtD5krCBzvmYXd/Gv@lists.infradead.org
X-Gm-Message-State: AOJu0YzgOdY5tQt61cwbwejMeEvO3RoS7722Bw7H2yTnBqWV/GNPNk+/
	b+5RzacOOynSqAnnv7fgCluCjcdLS2Lga9KvZO22NuCNFiMC1UM2dOLL
X-Gm-Gg: Acq92OEYDVvTIA7+CWfycnd1s9OhXIYmekTT3sl3oU90nYHtm2d7N+zTQ1YlzVA9HKM
	0RaxbW73P9Hi+rGVB0GdVP1VY7dRRpgA8RBUHQ2sz2ch5/j9yVS0hGShqSvMfByowx8lpUj7Q0t
	T0oTzWkpX59sUwkTUKsgIkVXU+urFkTJWA2iIkGRqTkgpTFgBuj8uaS76xchnOOYxCx6Lb04SIc
	+/t5Cjr2d7NeUJXv3tSH3x5/YUn4cpaFyCSaRJRmeRWHnhX/PwipZEyp+2lbrjeUjseRmsmbiAH
	y2xpVirgFOjBvUkqBI1y3xCJnt42u2daHp1rjESzTNcccXPvbnYkluywVkzh7493mLiuFnK9LT/
	8meiVhEg+4Ci5TnvWtIeffqTlNwZoFpvU0aoVvdtx6Vt/w4htl3KII6t1OfZ3E2pHdDyqAbCGbj
	G1xZZkBUhbauUS6ANDG9WMHpiWKpT1tNGr5QXqiIZGd39i5Cmfwy+2BMuCsT8w9nseruolzL/DU
	g==
X-Received: by 2002:a5d:4f11:0:b0:43c:fc5c:a9fe with SMTP id ffacd0b85a97d-460304fdf18mr12781534f8f.20.1780835904234;
        Sun, 07 Jun 2026 05:38:24 -0700 (PDT)
Received: from tiolaptop.tail72d7bd.ts.net ([194.35.121.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344558sm42201706f8f.18.2026.06.07.05.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 05:38:23 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
To: heiko@sntech.de
Cc: airlied@gmail.com,
	andy.yan@rock-chips.com,
	diogompaissilva@gmail.com,
	dri-devel@lists.freedesktop.org,
	hjc@rock-chips.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de
Subject: [PATCH v2] drm/rockchip: dsi: Open-code drm_simple_encoder_init()
Date: Sun,  7 Jun 2026 14:37:40 +0200
Message-ID: <20260607123739.393974-2-diogompaissilva@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <5277524.h16uAIiOU7@phil>
References: <5277524.h16uAIiOU7@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_053826_702459_2F58B950 
X-CRM114-Status: GOOD (  15.49  )
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

Simple KMS helper are deprecated since they only add an intermediate
layer between drivers and the atomic modesetting.
This patch removes the dependency on drm_simple_encoder_init from rockchip
DRM drivers by inlining this helper.

Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c  | 9 ++++++---
 drivers/gpu/drm/rockchip/cdn-dp-core.c           | 9 ++++++---
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c  | 9 +++++++--
 drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c | 8 ++++++--
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c      | 8 ++++++--
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c   | 8 ++++++--
 drivers/gpu/drm/rockchip/rk3066_hdmi.c           | 8 ++++++--
 drivers/gpu/drm/rockchip/rockchip_lvds.c         | 9 +++++++--
 drivers/gpu/drm/rockchip/rockchip_rgb.c          | 8 ++++++--
 9 files changed, 56 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 96bd3dd239d2..ca6701319f2f 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -30,7 +30,6 @@
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "rockchip_drm_drv.h"
 
@@ -317,6 +316,10 @@ rockchip_dp_drm_encoder_atomic_check(struct drm_encoder *encoder,
 	return 0;
 }
 
+static const struct drm_encoder_funcs rockchip_dp_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static const struct drm_encoder_helper_funcs rockchip_dp_encoder_helper_funcs = {
 	.mode_fixup = rockchip_dp_drm_encoder_mode_fixup,
 	.mode_set = rockchip_dp_drm_encoder_mode_set,
@@ -369,8 +372,8 @@ static int rockchip_dp_drm_create_encoder(struct rockchip_dp_device *dp)
 							     dev->of_node);
 	DRM_DEBUG_KMS("possible_crtcs = 0x%x\n", encoder->possible_crtcs);
 
-	ret = drm_simple_encoder_init(drm_dev, encoder,
-				      DRM_MODE_ENCODER_TMDS);
+	ret = drm_encoder_init(drm_dev, encoder, &rockchip_dp_encoder_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
 	if (ret) {
 		DRM_ERROR("failed to initialize encoder with drm\n");
 		return ret;
diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index 177e30445ee8..060ffca1f3d8 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -23,7 +23,6 @@
 #include <drm/drm_of.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "cdn-dp-core.h"
 #include "cdn-dp-reg.h"
@@ -671,6 +670,10 @@ static int cdn_dp_encoder_atomic_check(struct drm_encoder *encoder,
 	return 0;
 }
 
+static const struct drm_encoder_funcs cdn_dp_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static const struct drm_encoder_helper_funcs cdn_dp_encoder_helper_funcs = {
 	.atomic_check = cdn_dp_encoder_atomic_check,
 };
@@ -988,8 +991,8 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
 							     dev->of_node);
 	DRM_DEBUG_KMS("possible_crtcs = 0x%x\n", encoder->possible_crtcs);
 
-	ret = drm_simple_encoder_init(drm_dev, encoder,
-				      DRM_MODE_ENCODER_TMDS);
+	ret = drm_encoder_init(drm_dev, encoder, &cdn_dp_encoder_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
 	if (ret) {
 		DRM_ERROR("failed to initialize encoder with drm\n");
 		return ret;
diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index 3547d91b25d3..a09b382d208e 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -25,7 +25,6 @@
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
 #include <drm/drm_print.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "rockchip_drm_drv.h"
 
@@ -825,6 +824,10 @@ static void dw_mipi_dsi_encoder_enable(struct drm_encoder *encoder)
 	clk_disable_unprepare(dsi->grf_clk);
 }
 
+static const struct drm_encoder_funcs dw_mipi_dsi_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static const struct drm_encoder_helper_funcs
 dw_mipi_dsi_encoder_helper_funcs = {
 	.atomic_check = dw_mipi_dsi_encoder_atomic_check,
@@ -840,7 +843,9 @@ static int rockchip_dsi_drm_create_encoder(struct dw_mipi_dsi_rockchip *dsi,
 	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm_dev,
 							     dsi->dev->of_node);
 
-	ret = drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_DSI);
+	ret = drm_encoder_init(drm_dev, encoder,
+				&dw_mipi_dsi_encoder_funcs,
+				DRM_MODE_ENCODER_DSI, NULL);
 	if (ret) {
 		DRM_ERROR("Failed to initialize encoder with drm\n");
 		return ret;
diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c
index 0aea764e29b2..687afc5590cd 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c
@@ -23,7 +23,6 @@
 #include <drm/bridge/dw_mipi_dsi2.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include <uapi/linux/videodev2.h>
 
@@ -275,6 +274,10 @@ dw_mipi_dsi2_encoder_atomic_check(struct drm_encoder *encoder,
 	return 0;
 }
 
+static const struct drm_encoder_funcs dw_mipi_dsi2_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static const struct drm_encoder_helper_funcs
 dw_mipi_dsi2_encoder_helper_funcs = {
 	.atomic_enable = dw_mipi_dsi2_encoder_atomic_enable,
@@ -290,7 +293,8 @@ static int rockchip_dsi2_drm_create_encoder(struct dw_mipi_dsi2_rockchip *dsi2,
 	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm_dev,
 							     dsi2->dev->of_node);
 
-	ret = drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_DSI);
+	ret = drm_encoder_init(drm_dev, encoder, &dw_mipi_dsi2_encoder_funcs,
+			       DRM_MODE_ENCODER_DSI, NULL);
 	if (ret) {
 		dev_err(dsi2->dev, "Failed to initialize encoder with drm\n");
 		return ret;
diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 0dc1eb5d2ae3..906264d65db3 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -16,7 +16,6 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "rockchip_drm_drv.h"
 
@@ -322,6 +321,10 @@ dw_hdmi_rockchip_encoder_atomic_check(struct drm_encoder *encoder,
 	return 0;
 }
 
+static const struct drm_encoder_funcs dw_hdmi_rockchip_encoder_funcs = {
+	.destroy    = drm_encoder_cleanup,
+};
+
 static const struct drm_encoder_helper_funcs dw_hdmi_rockchip_encoder_helper_funcs = {
 	.mode_fixup = dw_hdmi_rockchip_encoder_mode_fixup,
 	.mode_set   = dw_hdmi_rockchip_encoder_mode_set,
@@ -604,7 +607,8 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
 	}
 
 	drm_encoder_helper_add(encoder, &dw_hdmi_rockchip_encoder_helper_funcs);
-	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
+	drm_encoder_init(drm, encoder, &dw_hdmi_rockchip_encoder_funcs,
+			 DRM_MODE_ENCODER_TMDS, NULL);
 
 	platform_set_drvdata(pdev, hdmi);
 
diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index 1a09bcc96c3e..ed665352618f 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -23,7 +23,6 @@
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "rockchip_drm_drv.h"
 
@@ -160,6 +159,10 @@ dw_hdmi_qp_rockchip_encoder_atomic_check(struct drm_encoder *encoder,
 	return ret;
 }
 
+static const struct drm_encoder_funcs dw_hdmi_qp_rockchip_encoder_funcs = {
+	.destroy	= drm_encoder_cleanup,
+};
+
 static const struct
 drm_encoder_helper_funcs dw_hdmi_qp_rockchip_encoder_helper_funcs = {
 	.enable		= dw_hdmi_qp_rockchip_encoder_enable,
@@ -586,7 +589,8 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 		return ret;
 
 	drm_encoder_helper_add(encoder, &dw_hdmi_qp_rockchip_encoder_helper_funcs);
-	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
+	drm_encoder_init(drm, encoder, &dw_hdmi_qp_rockchip_encoder_funcs,
+			 DRM_MODE_ENCODER_TMDS, NULL);
 
 	platform_set_drvdata(pdev, hdmi);
 
diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index 9066ee2d1dff..a21df6f380f5 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -12,7 +12,6 @@
 #include <drm/drm_of.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include <linux/clk.h>
 #include <linux/mfd/syscon.h>
@@ -454,6 +453,10 @@ rk3066_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 	return 0;
 }
 
+static const struct drm_encoder_funcs rk3066_hdmi_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static const
 struct drm_encoder_helper_funcs rk3066_hdmi_encoder_helper_funcs = {
 	.atomic_check   = rk3066_hdmi_encoder_atomic_check,
@@ -696,7 +699,8 @@ rk3066_hdmi_register(struct drm_device *drm, struct rk3066_hdmi *hdmi)
 		return -EPROBE_DEFER;
 
 	drm_encoder_helper_add(encoder, &rk3066_hdmi_encoder_helper_funcs);
-	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
+	drm_encoder_init(drm, encoder, &rk3066_hdmi_encoder_funcs,
+			 DRM_MODE_ENCODER_TMDS, NULL);
 
 	hdmi->bridge.driver_private = hdmi;
 	hdmi->bridge.funcs = &rk3066_hdmi_bridge_funcs;
diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
index 75f898a10cbc..c3b30c622873 100644
--- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
+++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
@@ -24,7 +24,6 @@
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "rockchip_drm_drv.h"
 #include "rockchip_lvds.h"
@@ -427,6 +426,10 @@ static void px30_lvds_encoder_disable(struct drm_encoder *encoder)
 	drm_panel_unprepare(lvds->panel);
 }
 
+static const struct drm_encoder_funcs rockchip_lvds_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static const
 struct drm_encoder_helper_funcs rk3288_lvds_encoder_helper_funcs = {
 	.enable = rk3288_lvds_encoder_enable,
@@ -594,7 +597,9 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
 	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm_dev,
 							     dev->of_node);
 
-	ret = drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_LVDS);
+	ret = drm_encoder_init(drm_dev, encoder,
+				      &rockchip_lvds_encoder_funcs,
+				      DRM_MODE_ENCODER_LVDS, NULL);
 	if (ret < 0) {
 		drm_err(drm_dev,
 			"failed to initialize encoder: %d\n", ret);
diff --git a/drivers/gpu/drm/rockchip/rockchip_rgb.c b/drivers/gpu/drm/rockchip/rockchip_rgb.c
index 5c0c6e2cc28d..b5b8322a1260 100644
--- a/drivers/gpu/drm/rockchip/rockchip_rgb.c
+++ b/drivers/gpu/drm/rockchip/rockchip_rgb.c
@@ -17,7 +17,6 @@
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "rockchip_drm_drv.h"
 #include "rockchip_rgb.h"
@@ -65,6 +64,10 @@ rockchip_rgb_encoder_atomic_check(struct drm_encoder *encoder,
 	return 0;
 }
 
+static const struct drm_encoder_funcs rockchip_rgb_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static const
 struct drm_encoder_helper_funcs rockchip_rgb_encoder_helper_funcs = {
 	.atomic_check = rockchip_rgb_encoder_atomic_check,
@@ -127,7 +130,8 @@ struct rockchip_rgb *rockchip_rgb_init(struct device *dev,
 	encoder = &rgb->encoder.encoder;
 	encoder->possible_crtcs = drm_crtc_mask(crtc);
 
-	ret = drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_NONE);
+	ret = drm_encoder_init(drm_dev, encoder, &rockchip_rgb_encoder_funcs,
+			       DRM_MODE_ENCODER_NONE, NULL);
 	if (ret < 0) {
 		DRM_DEV_ERROR(drm_dev->dev,
 			      "failed to initialize encoder: %d\n", ret);
-- 
2.51.2


