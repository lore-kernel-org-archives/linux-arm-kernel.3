Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C40BECCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Oct 2025 17:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FcmxGZfVXlAxAmbZndHwXiE2+MRphh16xcBVRBH91MQ=; b=MRcoruW9TW7V96THMc6m+ER8kG
	Ilq0SDudDFJv+WYdsuEZtCIShLFuAPva0beyxxEHjBAJpk6Z6BCtYMlQTLdJulyA+eNG5XIKgj5nP
	cb/i+cVnMvef0dACAMgmG+RGDszf2bTsdHyg97pS+LE6ao/3Sp80N6zIJblIv9zWb2tdCYwO/JnlC
	9Htz5oR/h1gXk58sM3NkYrphD5jY/7AvL3xSOJGZFF4lY8t0SCJbsp23zEBy3Y0uwtiwHjgWjLxMn
	BgPWBMaAWw2xXedzmRChq+mdHAFRloqFbSyComxvollV/9SQZu3rHnUlpRgpQkTl31joQXnBrwjHY
	jh17ZgXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7d00-0000000AMwZ-437r;
	Sat, 11 Oct 2025 17:03:16 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7czx-0000000AMrV-3yBD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Oct 2025 17:03:15 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4ckVL82gQZz9sm3;
	Sat, 11 Oct 2025 19:03:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760202192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FcmxGZfVXlAxAmbZndHwXiE2+MRphh16xcBVRBH91MQ=;
	b=wZaPXCytsM0gkA7hR0Lx4WtNd2DymKkEszSVVhPx5dd0Ybta6FZZvwc1c9VRN4aiKm4YME
	ihGZL67JmP1gDm7ICM1xfFHM60bwh3NxgzTsJfZ2rWSCgAf+fTI17O/2xZhoA0Yiq527HD
	a/ABfzvm4gycxL+G/ndE3IN6v/lUg8hikQsOYykRzRMnsMzDLvnj4maMM8iZpw/MGffdCX
	r2VbzDGHmpFKjONI0MnvI56zybYov2Vt4vc6T0he1M907t3tNd7bru5GksidSfiHPQYhWg
	+gHK5d+ECdTBkBdGmAJm0IlTIckAOb48smwFXw0Kxa23vOo6ipxl9cltvEu+5w==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760202190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FcmxGZfVXlAxAmbZndHwXiE2+MRphh16xcBVRBH91MQ=;
	b=s3Dk/z9ISBuqX1fq5gFMYVQfXUR/4Qp/dyy9SSFlGzvPHPG0MB/jhvfHHdSBmjsux0mipm
	Zpip2yHNZfBo1QZLAWBlwASXd1cpiZbH52FhoDeeNgXk3tTtrE51HA14VdYN7pzOITCNG+
	pzRUkfqpFbE3A4cT1S2Q0mQ3GEplOiKBgqR7c+gD/JK+sMAOH5cky50/BsXU2r31FJBMjw
	TrJvfi3/O6bedwkQ7hlkgrrYnGKlRByh3teuJE5ULRYzlMsIyeEEHRFpktFkUIqx7eGoli
	lxr+ZfYBjRttgN6aWdU/7SOT2MVEmoae38mFGls/gtNfF1iAtPX1K+SYrw3l+w==
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
Subject: [PATCH 07/39] drm/imx: dc: cf: Pass struct dc_subdev_info via OF match data
Date: Sat, 11 Oct 2025 18:51:22 +0200
Message-ID: <20251011170213.128907-8-marek.vasut@mailbox.org>
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: r3mc7ja9o8w6zpoyn4yuogbufr6b17ok
X-MBO-RS-ID: 5d6088cbaac08c1efdd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251011_100314_143716_738B84D7 
X-CRM114-Status: GOOD (  14.52  )
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

Pass the struct dc_subdev_info as OF match data into the driver,
so the driver can use the match data to correct map addresses to
IDs. This is a preparatory patch for i.MX95 addition. No functional
change.

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
 drivers/gpu/drm/imx/dc/dc-cf.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-cf.c b/drivers/gpu/drm/imx/dc/dc-cf.c
index 6cb83182a3668..1d3602c5d4230 100644
--- a/drivers/gpu/drm/imx/dc/dc-cf.c
+++ b/drivers/gpu/drm/imx/dc/dc-cf.c
@@ -10,6 +10,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 
 #include "dc-drv.h"
@@ -24,7 +25,13 @@
 #define CONSTANTCOLOR		0x10
 #define  BLUE(x)		FIELD_PREP(GENMASK(15, 8), (x))
 
-static const struct dc_subdev_info dc_cf_info[] = {
+struct dc_cf_subdev_match_data {
+	enum dc_link_id			link_cf4;
+	enum dc_link_id			link_cf5;
+	const struct dc_subdev_info	*info;
+};
+
+static const struct dc_subdev_info dc_cf_info_imx8qxp[] = {
 	{ .reg_start = 0x56180960, .id = 0, },
 	{ .reg_start = 0x561809e0, .id = 1, },
 	{ .reg_start = 0x561809a0, .id = 4, },
@@ -32,6 +39,12 @@ static const struct dc_subdev_info dc_cf_info[] = {
 	{ /* sentinel */ },
 };
 
+static const struct dc_cf_subdev_match_data dc_cf_match_data_imx8qxp = {
+	.link_cf4 = LINK_ID_CONSTFRAME4_MX8QXP,
+	.link_cf5 = LINK_ID_CONSTFRAME5_MX8QXP,
+	.info = dc_cf_info_imx8qxp,
+};
+
 static const struct regmap_range dc_cf_regmap_ranges[] = {
 	regmap_reg_range(STATICCONTROL, CONSTANTCOLOR),
 };
@@ -85,6 +98,8 @@ void dc_cf_init(struct dc_cf *cf)
 
 static int dc_cf_bind(struct device *dev, struct device *master, void *data)
 {
+	const struct dc_cf_subdev_match_data *dc_cf_match_data = device_get_match_data(dev);
+	const struct dc_subdev_info *dc_cf_info = dc_cf_match_data->info;
 	struct platform_device *pdev = to_platform_device(dev);
 	struct dc_drm_device *dc_drm = data;
 	struct resource *res_pec;
@@ -123,11 +138,11 @@ static int dc_cf_bind(struct device *dev, struct device *master, void *data)
 		dc_drm->cf_cont[1] = cf;
 		break;
 	case 4:
-		cf->link = LINK_ID_CONSTFRAME4_MX8QXP;
+		cf->link = dc_cf_match_data->link_cf4;
 		dc_drm->cf_safe[0] = cf;
 		break;
 	case 5:
-		cf->link = LINK_ID_CONSTFRAME5_MX8QXP;
+		cf->link = dc_cf_match_data->link_cf5;
 		dc_drm->cf_safe[1] = cf;
 		break;
 	}
@@ -157,7 +172,7 @@ static void dc_cf_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id dc_cf_dt_ids[] = {
-	{ .compatible = "fsl,imx8qxp-dc-constframe" },
+	{ .compatible = "fsl,imx8qxp-dc-constframe", .data = &dc_cf_match_data_imx8qxp },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dc_cf_dt_ids);
-- 
2.51.0


