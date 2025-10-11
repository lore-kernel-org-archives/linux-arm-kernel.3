Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A876CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Oct 2025 17:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1rU2uW428ktg/uxsgiMNm1NL8lLaVYtjPeqSyv7MQiE=; b=q1kEHmyE38kc9GUf5ZW7xhdowV
	bi+DKoKczEtlF6+t0IJr3R/Ycp2x98e8l/9rrkyDqhspwAR3Peqb2GJCJFhqomoClmnPXipkOvECs
	2fEbPDZ1q+hMyKcE3kQ+etGWblfUMYzoDuDKhtDQ/7BwDnwypbCzlg0CCT3Wdit7+Jkj0cy5ntSXB
	bvfqtslSbRcwscpz7DzYgchzXIvPEL88EyxSv8NogXTzRcu2KvufA7B+0mHoxyqnNOGU+zEYluO4q
	9ol1KJvHiE/YThLm4lJ/4F3oe8y1anyGtDYTThaUeP5HaV+e8vqVYtXjoTTXpbf7267qDx0DwDEw+
	x3Ek3RZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7d0e-0000000ANsv-45PL;
	Sat, 11 Oct 2025 17:03:56 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7d0Z-0000000ANiE-39t6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Oct 2025 17:03:54 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4ckVLt0Nlbz9shj;
	Sat, 11 Oct 2025 19:03:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760202230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1rU2uW428ktg/uxsgiMNm1NL8lLaVYtjPeqSyv7MQiE=;
	b=C/8zFjj05BpbotuwML1zjgnFQOx9AkrTIlEAocFvOizE/MwvYbr82jfyLiycql1Y6d0RUt
	bOHqXJ9EGjv4sR/IKIqOvUTkggYjiKDGEOdOpJrD0LFFVYpX6QhmVwgvpbBr1yNGcFZB7o
	NwSycCSyWwKf2/rDiD/23c9yq1GBGMZM6cDQr7mpi//DkdjdIjKaAEPRlp753LvHUnlKNl
	7T7ejTM1nPuEYcUAvhmlpOAiLhYvR/WnNz1H7egbsvkB8rDs/fKGUxpJfab4ld/tDIHlKk
	HmxyAzFQGEaLOIpo/JH+NWUuwhyeZE4V1tY/FmF7KY3X/kdbAJwwlBHsfEGfMg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=Rirzo6Jk;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760202228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1rU2uW428ktg/uxsgiMNm1NL8lLaVYtjPeqSyv7MQiE=;
	b=Rirzo6JkXei6eUVVxdZkoz8wvLiS90hNJP6Nsn8pVR0M8eR+CRQ6FpnwItkcoQO/dg6jiT
	8ert0iRpFvSKFSlQcn/vve9mIzlw+Ua3QyVIiFtsgtZa1oF4c7q2A3M0ZkhigscJUQeeSo
	KKQuuElaSxtFqfVoKmJUrm2+bBQvVHdvM8XYXdPgIVwqlPuFfsb9HStntZ6vdzJsbTKaaU
	Cu4BZH2XSejHIZ8zJAjIWC1K1SVxfKFFtbKO0RAYKBIEoOP42oQiB1s4wez8D74yHn9j5/
	/NCzJZ5MbB6w3GEdxeGKXhLqS4fLNEpbCNB2RZzBBMA3GLLtZ8VxObba8RetJw==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Liu Ying <victor.liu@nxp.com>,
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
Subject: [PATCH 20/39] drm/imx: dc: Configure display CSR clock feed select
Date: Sat, 11 Oct 2025 18:51:35 +0200
Message-ID: <20251011170213.128907-21-marek.vasut@mailbox.org>
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: p5ockmyrs7gnzi5p6cb89izymgsh9ses
X-MBO-RS-ID: 14437a3bb9e69744023
X-Rspamd-Queue-Id: 4ckVLt0Nlbz9shj
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251011_100352_041074_9B1294AC 
X-CRM114-Status: GOOD (  12.50  )
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

Configure DISPLAY_CSR clock feed selector on i.MX95 accordingly
for either DSI and LVDS serializers. This is especially important
to make LVDS displays operational, the default selector setting
of 0 only works for DSI serializer.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Liu Ying <victor.liu@nxp.com>
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
 drivers/gpu/drm/imx/dc/dc-drv.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/imx/dc/dc-drv.c b/drivers/gpu/drm/imx/dc/dc-drv.c
index 2717c92aba6c5..dec8ad19bad42 100644
--- a/drivers/gpu/drm/imx/dc/dc-drv.c
+++ b/drivers/gpu/drm/imx/dc/dc-drv.c
@@ -7,6 +7,7 @@
 #include <linux/component.h>
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
+#include <linux/mfd/syscon.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -29,8 +30,15 @@
 #include "dc-drv.h"
 #include "dc-pe.h"
 
+#define DISPLAY_ENGINES_CLOCK_CONTROL	0x00
+#define  DISP_CLK1_SEL			GENMASK(3, 2)
+#define  DISP_CLK0_SEL			GENMASK(1, 0)
+#define  DISP_CLK_SEL_CCM		0
+#define  DISP_CLK_SEL_LVDS		2
+
 struct dc_priv {
 	struct drm_device *drm;
+	struct regmap *regmap;
 	struct clk_bulk_data *clk_cfg;
 	int clk_cfg_count;
 };
@@ -119,6 +127,17 @@ static int dc_drm_bind(struct device *dev)
 	if (ret)
 		return ret;
 
+	if (priv->regmap) {
+		regmap_write_bits(priv->regmap, DISPLAY_ENGINES_CLOCK_CONTROL,
+				  DISP_CLK0_SEL | DISP_CLK1_SEL,
+				  FIELD_PREP(DISP_CLK0_SEL,
+				             ((dc_drm->encoder[0].encoder_type == DRM_MODE_ENCODER_DSI) ?
+					     DISP_CLK_SEL_CCM : DISP_CLK_SEL_LVDS)) |
+				  FIELD_PREP(DISP_CLK1_SEL,
+				             ((dc_drm->encoder[1].encoder_type == DRM_MODE_ENCODER_DSI) ?
+					     DISP_CLK_SEL_CCM : DISP_CLK_SEL_LVDS)));
+	}
+
 	ret = drm_dev_register(drm, 0);
 	if (ret) {
 		dev_err(dev, "failed to register drm device: %d\n", ret);
@@ -157,6 +176,7 @@ static const struct component_master_ops dc_drm_ops = {
 static int dc_probe(struct platform_device *pdev)
 {
 	struct component_match *match = NULL;
+	struct device_node *np = pdev->dev.of_node;
 	struct dc_priv *priv;
 	int ret;
 
@@ -170,6 +190,12 @@ static int dc_probe(struct platform_device *pdev)
 				     "failed to get cfg clock\n");
 	priv->clk_cfg_count = ret;
 
+	if (of_device_is_compatible(np, "fsl,imx95-dc")) {
+		priv->regmap = syscon_regmap_lookup_by_phandle(np, "fsl,syscon");
+		if (IS_ERR(priv->regmap))
+			return dev_err_probe(&pdev->dev, PTR_ERR(priv->regmap), "failed to get regmap\n");
+	}
+
 	dev_set_drvdata(&pdev->dev, priv);
 
 	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
-- 
2.51.0


