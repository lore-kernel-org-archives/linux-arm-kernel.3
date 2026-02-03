Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD28EE87849
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 16:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4YNTaowixnozBp6OgMoCK33IRiaDQ/kgBlgssEsqiwo=; b=YAbVETz3AopvYOKAXhZJLUCPoK
	xlo/jP/rE+CADkUiXpAno4bwx9JUC2SSSwb0iVaIQiwpZiuuwlquRwuVdbPGi9aO/pQaKpe29xlPs
	vt9v0U9zHbnlQw8ln6q7vX4OS+7gQEJPTcF+/2pDaHGxRCC67LzbWjcVG0UnV9OQLwf7ihb7kBRL9
	pRos3WKb4bFykGju2HR30OAMpolPOeX+Djp+fUeUWeSlqc9/y/5B+W5BwEa6aUC2uac4aFszIWrcM
	cW3JPPTfyg68wjvqz+qD4klvSV/vrW++G5P6uI7O0t96OE+Mkw4ispiBxkQy172WHGJDeiDwhFqxo
	x4VL5Wvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJY2-00000006xuq-00oJ;
	Tue, 03 Feb 2026 16:46:42 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJXx-00000006xsE-3UgQ;
	Tue, 03 Feb 2026 16:46:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770137194;
	bh=kL9kNvqSXpOVHTWoVnZEkOBC5bbK790jsX9GDjm0yZg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SmdDJkl6OaIB5sdX5xGivZrL2b4hCZ9JGmmngEIkpnKg0sT1PGapaWDC1pZAgCG6c
	 5oXyzbH9g8sKtaXNcVnQLe+OGebbd3kutsBSqJqWdyQv8BU1TwFgdhp1W4LYBpFvjK
	 EDQDsqU4RQdE1pUrMu0MvSiCq477ThoIztg92VlE0F3wPjhyliyt+1Bmd2O+cQpVbN
	 axkWI8g6mIv++wsx0raFfyZMRNR7fLFTiFo8YrcslvT2HR4/X7duvWGpjfIlIWt/O4
	 uvCbmBScZcvTeofb7pyJCzXrKih1mD8MA+18YVB/rYbigXLgEA2x5K1Jup57iPjbww
	 xfZykvdeKvPgg==
Received: from jupiter.universe (dyndsl-091-248-189-143.ewe-ip-backbone.de [91.248.189.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7692517E14D8;
	Tue,  3 Feb 2026 17:46:34 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 134CE480026; Tue, 03 Feb 2026 17:46:34 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 03 Feb 2026 17:46:24 +0100
Subject: [PATCH v2 02/10] ASoC: rockchip: spdif: Move DT compatible table
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-rockchip-spdif-cleanup-and-bsp-sync-v2-2-4412016cf577@collabora.com>
References: <20260203-rockchip-spdif-cleanup-and-bsp-sync-v2-0-4412016cf577@collabora.com>
In-Reply-To: <20260203-rockchip-spdif-cleanup-and-bsp-sync-v2-0-4412016cf577@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Alexey Charkov <alchark@gmail.com>, 
 Sjoerd Simons <sjoerd.simons@collabora.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3102;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=kL9kNvqSXpOVHTWoVnZEkOBC5bbK790jsX9GDjm0yZg=;
 b=owJ4nAFsApP9kA0DAAoB2O7X88g7+poByyZiAGmCJmktJo4NHOcyG3Dl6iUdAhqQQtSzGBW7n
 0uoPRTCGokqjIkCMgQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpgiZpAAoJENju1/PI
 O/qaaVsP92jEScDntHiO/GZ0jdwzx3WlhlhIDAvOU0LpoW//NRlHvQmwIeL5tSIy0uFvqIwoUDv
 xKxBgBMI8GfSOL7PN/Q+s/6djx7WY1Qoz84Otb1N8XgdSxyLhKB9mH6Jlr65GXGPypgg1qisklX
 enFK0g1CxLD4XKre4PW6vsj4E8TwsH4vfT7eSDnVXhuCFua2FMiIK6Dm8HxYsNab89A46zOKUwG
 Fku82u2OOeT8989JzrJ3FM0MJdcO3JCqkEdFxBznU9sJR8M8l2XylwfTfGuBnGibPAuXCc0JjSu
 kWpXRgGwjNg3iHHgWMNu7IhG5KNy6YNOnEO56VuA++rvj6nRAxzRVz/XtDCeat7Qb0ICdzA/Gqp
 2BVsD1x/hJ8fDPeFEgJMqmP87H994XNmdxXgo27OyGxhEecXnTqn0c8IYZTJpdSrRpmRCJioopR
 nC78QzQiGqz8mbAYK1R9OrPB9f6XSTTAX+VuIb+EeVOHzAhlh6EN+nbx2GO5y6OpPgJ2ZO/LSZX
 czXyWK3H3P6Kt9v2PX5uS+BBMNjxhhUJ8lcjqq+36LD3qpWWZoy2r1rGQcfIo9ubKso8On9IFRa
 nr7RPhtKpXqxeQpTCOy0VsnQkcItLY0H5yq5RnMa5vvk/wh2fbmbtioiRMNqk9BOCK6/6dEpVeN
 XZkegABkDVBg70mW7oyJz
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_084638_787006_BBEEE08C 
X-CRM114-Status: GOOD (  14.50  )
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

Move rk_spdif_match DT compatible table to the usual place before the
platform-driver struct definition and drop the useless of_match_ptr(),
since it is fine to reference the DT id table even when OF support is
disabled (which makes the driver useless anyways).

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 sound/soc/rockchip/rockchip_spdif.c | 48 ++++++++++++++++++-------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_spdif.c b/sound/soc/rockchip/rockchip_spdif.c
index 23f14274a6e0..331a23d5173f 100644
--- a/sound/soc/rockchip/rockchip_spdif.c
+++ b/sound/soc/rockchip/rockchip_spdif.c
@@ -40,29 +40,6 @@ struct rk_spdif_dev {
 	struct regmap *regmap;
 };
 
-static const struct of_device_id rk_spdif_match[] __maybe_unused = {
-	{ .compatible = "rockchip,rk3066-spdif",
-	  .data = (void *)RK_SPDIF_RK3066 },
-	{ .compatible = "rockchip,rk3188-spdif",
-	  .data = (void *)RK_SPDIF_RK3188 },
-	{ .compatible = "rockchip,rk3228-spdif",
-	  .data = (void *)RK_SPDIF_RK3366 },
-	{ .compatible = "rockchip,rk3288-spdif",
-	  .data = (void *)RK_SPDIF_RK3288 },
-	{ .compatible = "rockchip,rk3328-spdif",
-	  .data = (void *)RK_SPDIF_RK3366 },
-	{ .compatible = "rockchip,rk3366-spdif",
-	  .data = (void *)RK_SPDIF_RK3366 },
-	{ .compatible = "rockchip,rk3368-spdif",
-	  .data = (void *)RK_SPDIF_RK3366 },
-	{ .compatible = "rockchip,rk3399-spdif",
-	  .data = (void *)RK_SPDIF_RK3366 },
-	{ .compatible = "rockchip,rk3568-spdif",
-	  .data = (void *)RK_SPDIF_RK3366 },
-	{},
-};
-MODULE_DEVICE_TABLE(of, rk_spdif_match);
-
 static int rk_spdif_runtime_suspend(struct device *dev)
 {
 	struct rk_spdif_dev *spdif = dev_get_drvdata(dev);
@@ -377,12 +354,35 @@ static const struct dev_pm_ops rk_spdif_pm_ops = {
 	RUNTIME_PM_OPS(rk_spdif_runtime_suspend, rk_spdif_runtime_resume, NULL)
 };
 
+static const struct of_device_id rk_spdif_match[] = {
+	{ .compatible = "rockchip,rk3066-spdif",
+	  .data = (void *)RK_SPDIF_RK3066 },
+	{ .compatible = "rockchip,rk3188-spdif",
+	  .data = (void *)RK_SPDIF_RK3188 },
+	{ .compatible = "rockchip,rk3228-spdif",
+	  .data = (void *)RK_SPDIF_RK3366 },
+	{ .compatible = "rockchip,rk3288-spdif",
+	  .data = (void *)RK_SPDIF_RK3288 },
+	{ .compatible = "rockchip,rk3328-spdif",
+	  .data = (void *)RK_SPDIF_RK3366 },
+	{ .compatible = "rockchip,rk3366-spdif",
+	  .data = (void *)RK_SPDIF_RK3366 },
+	{ .compatible = "rockchip,rk3368-spdif",
+	  .data = (void *)RK_SPDIF_RK3366 },
+	{ .compatible = "rockchip,rk3399-spdif",
+	  .data = (void *)RK_SPDIF_RK3366 },
+	{ .compatible = "rockchip,rk3568-spdif",
+	  .data = (void *)RK_SPDIF_RK3366 },
+	{},
+};
+MODULE_DEVICE_TABLE(of, rk_spdif_match);
+
 static struct platform_driver rk_spdif_driver = {
 	.probe = rk_spdif_probe,
 	.remove = rk_spdif_remove,
 	.driver = {
 		.name = "rockchip-spdif",
-		.of_match_table = of_match_ptr(rk_spdif_match),
+		.of_match_table = rk_spdif_match,
 		.pm = pm_ptr(&rk_spdif_pm_ops),
 	},
 };

-- 
2.51.0


