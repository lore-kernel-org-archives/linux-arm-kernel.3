Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62555C2A062
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Jan 2026 21:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F2V5ptOG/OSrQxpQxBR9vp2eUi6mQ1sEOZ5f+v4+ETo=; b=lAo/P0z3y5T10mN8s2cyQIcPWK
	Glj4DtXc3yxXa+3gFFBTbnFThXB99pFGfXGJ8qROwyLOe0At/mgI0D9ASIAIApsYci7m8Ke8S+2wE
	pzNcmOb0HECF4ncdMNGMzmfR73ZGkbs1Bob2I68+ioBS1cLTMUz2/JHXz9gzTD0JHqPqOwvHeoJsX
	CP8Yvohk5nk9f5X3utRNNYlFzBimynqFwqWuyiTvevu80aS9xFQ7C8lRBXuk2kROXxKdcPJafmdmz
	z3+WSyW3QUR0W6VwlYUQ4kS7STRXwP9YHgUrb1mCdfI1wvyz8Gs8D2JiPQicuIEeJLpDI+8lSAZuL
	EPHotGwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcVn2-0000000ATao-40gY;
	Sun, 04 Jan 2026 21:37:33 +0000
Received: from mout-p-202.mailbox.org ([80.241.56.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcVn0-0000000ATaO-1Uax
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Jan 2026 21:37:31 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dkrPJ3MR3z9t6y;
	Sun,  4 Jan 2026 22:37:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767562644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=F2V5ptOG/OSrQxpQxBR9vp2eUi6mQ1sEOZ5f+v4+ETo=;
	b=eDMNEcb3IB8WSnKLI4oDXY36itZPosnOUPuuEjLSAjYPckXTAV6x1paAfLi9m4WA6MHhWv
	qIzkXvQMlRHf3sHa+lSgVPHMj/72UClLmN9JOT5MMi0/H1qgv57cPUp9it/idmQHzeJNMp
	Qvre3qG+27LATqVjiRf7oy3ddC11EK8n58M/ARJbA1jEbZ1IEhAjP9mHfr2E5jGzBDWyoU
	ROX0ELAg0i3tAKAjAnUXa0mSdx8AbFpPWjUx7jNOgTLzfKH4JbB5xqddxAGZFGEIEAt1p4
	Ym+ORFezYOnz4IvzSwr0xpoDMwoYf3cYC4M954PC/ef5lD9125vR4Ilnb1K2QA==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767562641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=F2V5ptOG/OSrQxpQxBR9vp2eUi6mQ1sEOZ5f+v4+ETo=;
	b=cwq0F/N4btyasfbpeGahGUTV8M2V6HQlEL4Iv41s/13SF58JHHhveRPe7DA+WMiIRFaZBE
	fZE2C01qSPa0W1+uuJaXG8T5BQV5S8BCoQ3rPD/NjxAFnKv1hHyoop9rFxgOfSBMeFMJPT
	y0mW7LbF5b1TrQsAaL2f6by06nEmmotwsAJ/r1I0gEoGe8zTdY+QLpbIuK8iesBcJxypF6
	Nya6mthA+oBGgt6LuHIDdLigkj6Xk4XC3MjKrOoMVT4ReW5vCyMW8FJPXtp6AnqbE6YHLc
	hXKG72Jx9YNqnRobPDxReAEzny/5nzt0ruL61JByF/YWerkXfwNB/dGYydMKmw==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Liu Ying <victor.liu@nxp.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3] drm/bridge: fsl-ldb: Parse register offsets from DT
Date: Sun,  4 Jan 2026 22:36:55 +0100
Message-ID: <20260104213712.128982-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 45dc74af1c849cb0d34
X-MBO-RS-META: qoxrmye94k13yy8yo3ohm8y8f6dfdsmn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_133730_638788_31DEE7E0 
X-CRM114-Status: GOOD (  20.63  )
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

The DT bindings for this bridge describe register offsets for the LDB,
parse the register offsets from DT instead of hard-coding them in the
driver. No functional change.

The LDB was always meant to parse the 'reg' offsets out of the DT, it
only went somewhat wrong in the process and we ended up with hard-coded
reg<->compatible mapping. It was never intended to be that way, so fix
it.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
---
V2: - Switch to of_property_read_reg()
    - Parse single-register LDB variants from DT too
V3: - Update commit message
    - Drop "likely" from the comment
---
 drivers/gpu/drm/bridge/fsl-ldb.c | 58 ++++++++++++++++++++------------
 1 file changed, 36 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index 5c3cf37200bce..aa352c70b9ab2 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -8,6 +8,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
@@ -61,24 +62,13 @@ enum fsl_ldb_devtype {
 };
 
 struct fsl_ldb_devdata {
-	u32 ldb_ctrl;
-	u32 lvds_ctrl;
 	bool lvds_en_bit;
-	bool single_ctrl_reg;
 };
 
 static const struct fsl_ldb_devdata fsl_ldb_devdata[] = {
-	[IMX6SX_LDB] = {
-		.ldb_ctrl = 0x18,
-		.single_ctrl_reg = true,
-	},
-	[IMX8MP_LDB] = {
-		.ldb_ctrl = 0x5c,
-		.lvds_ctrl = 0x128,
-	},
+	[IMX6SX_LDB] = { },
+	[IMX8MP_LDB] = { },
 	[IMX93_LDB] = {
-		.ldb_ctrl = 0x20,
-		.lvds_ctrl = 0x24,
 		.lvds_en_bit = true,
 	},
 };
@@ -90,8 +80,11 @@ struct fsl_ldb {
 	struct clk *clk;
 	struct regmap *regmap;
 	const struct fsl_ldb_devdata *devdata;
+	u64 ldb_ctrl;
+	u64 lvds_ctrl;
 	bool ch0_enabled;
 	bool ch1_enabled;
+	bool single_ctrl_reg;
 };
 
 static bool fsl_ldb_is_dual(const struct fsl_ldb *fsl_ldb)
@@ -204,15 +197,15 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
 		reg |=	(fsl_ldb->ch0_enabled ? LDB_CTRL_DI0_VSYNC_POLARITY : 0) |
 			(fsl_ldb->ch1_enabled ? LDB_CTRL_DI1_VSYNC_POLARITY : 0);
 
-	regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->ldb_ctrl, reg);
+	regmap_write(fsl_ldb->regmap, fsl_ldb->ldb_ctrl, reg);
 
-	if (fsl_ldb->devdata->single_ctrl_reg)
+	if (fsl_ldb->single_ctrl_reg)
 		return;
 
 	/* Program LVDS_CTRL */
 	reg = LVDS_CTRL_CC_ADJ(2) | LVDS_CTRL_PRE_EMPH_EN |
 	      LVDS_CTRL_PRE_EMPH_ADJ(3) | LVDS_CTRL_VBG_EN;
-	regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->lvds_ctrl, reg);
+	regmap_write(fsl_ldb->regmap, fsl_ldb->lvds_ctrl, reg);
 
 	/* Wait for VBG to stabilize. */
 	usleep_range(15, 20);
@@ -220,7 +213,7 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
 	reg |=	(fsl_ldb->ch0_enabled ? LVDS_CTRL_CH0_EN : 0) |
 		(fsl_ldb->ch1_enabled ? LVDS_CTRL_CH1_EN : 0);
 
-	regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->lvds_ctrl, reg);
+	regmap_write(fsl_ldb->regmap, fsl_ldb->lvds_ctrl, reg);
 }
 
 static void fsl_ldb_atomic_disable(struct drm_bridge *bridge,
@@ -231,12 +224,12 @@ static void fsl_ldb_atomic_disable(struct drm_bridge *bridge,
 	/* Stop channel(s). */
 	if (fsl_ldb->devdata->lvds_en_bit)
 		/* Set LVDS_CTRL_LVDS_EN bit to disable. */
-		regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->lvds_ctrl,
+		regmap_write(fsl_ldb->regmap, fsl_ldb->lvds_ctrl,
 			     LVDS_CTRL_LVDS_EN);
 	else
-		if (!fsl_ldb->devdata->single_ctrl_reg)
-			regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->lvds_ctrl, 0);
-	regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->ldb_ctrl, 0);
+		if (!fsl_ldb->single_ctrl_reg)
+			regmap_write(fsl_ldb->regmap, fsl_ldb->lvds_ctrl, 0);
+	regmap_write(fsl_ldb->regmap, fsl_ldb->ldb_ctrl, 0);
 
 	clk_disable_unprepare(fsl_ldb->clk);
 }
@@ -296,7 +289,7 @@ static int fsl_ldb_probe(struct platform_device *pdev)
 	struct device_node *remote1, *remote2;
 	struct drm_panel *panel;
 	struct fsl_ldb *fsl_ldb;
-	int dual_link;
+	int dual_link, idx, ret;
 
 	fsl_ldb = devm_drm_bridge_alloc(dev, struct fsl_ldb, bridge, &funcs);
 	if (IS_ERR(fsl_ldb))
@@ -309,6 +302,27 @@ static int fsl_ldb_probe(struct platform_device *pdev)
 	fsl_ldb->dev = &pdev->dev;
 	fsl_ldb->bridge.of_node = dev->of_node;
 
+	/* No "reg-names" property means single-register LDB */
+	idx = of_property_match_string(dev->of_node, "reg-names", "ldb");
+	if (idx < 0) {
+		fsl_ldb->single_ctrl_reg = true;
+		idx = 0;
+	}
+
+	ret = of_property_read_reg(dev->of_node, idx, &fsl_ldb->ldb_ctrl, NULL);
+	if (ret)
+		return ret;
+
+	if (!fsl_ldb->single_ctrl_reg) {
+		idx = of_property_match_string(dev->of_node, "reg-names", "lvds");
+		if (idx < 0)
+			return idx;
+
+		ret = of_property_read_reg(dev->of_node, idx, &fsl_ldb->lvds_ctrl, NULL);
+		if (ret)
+			return ret;
+	}
+
 	fsl_ldb->clk = devm_clk_get(dev, "ldb");
 	if (IS_ERR(fsl_ldb->clk))
 		return PTR_ERR(fsl_ldb->clk);
-- 
2.51.0


