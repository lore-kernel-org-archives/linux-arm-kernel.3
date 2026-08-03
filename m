Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64843C55843
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 18:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EhalWNPNNaVNvVNEfLqt0f6sYZPJr9kPUBMyPAnKJWY=; b=3A9XjJ10Hq8dN55RTRD/azPqRE
	ZcqFY9Y1soJMY91rw+dWzGFqskJDEuajSQaas2EkcVd6/hgCywjzC54QReW0gWXxzD6eHhCfkI+Os
	tK5mYT6riMVqAlDaSLyAjAiaqoQDGX95h9ZortOO9LGqqOymO3OJF333mmTbhvfUVSAOgvtOcdbqk
	yiYlHdM7Ccp82X0L3H0W63vt38sYCChA8POzo0X2kQ4at+ozBqhB3nP/gWCH+e44lKjwPMDk1oLG5
	WsQluQHHe3OddIsBmBWgLgVjkyBknJm4W0I6eP8fxl/rS8CEdOHIGcdfxVPoXRfM0y9RsgBpfYXPJ
	1CtjGtvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqx2X-00000000Ifn-04cK;
	Mon, 03 Aug 2026 18:05:29 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqx2I-00000000I3V-2rJt;
	Mon, 03 Aug 2026 18:05:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785780304;
	bh=8QSlSuWPiGUI9AoT3cgCttdenutXBFd4174AAf6FMNQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GPK5u8x7ivnJImWzJ6RaMDQYWb7AFxErHP/Tvo+ENejQvg4F86iph2muOFonrSUUt
	 nS69yWW81u1DouzN5kARgD2ppfF8Jywe++OZLBnn7Rwa8HqOybLUzNZYPxC8eoYx6C
	 o+KdEPoo36skYpq5OGGPVHkjCmWbZIJafF6fXxp8ljaEZpWEcx6lXnU22suFua4GTK
	 wWvv3NdC3hl4W24DobIq9uPu+cjSSsrbBUO4JEdS+aDxwkyhosvWvvSHmPI06nfl7h
	 I1wCCOkgPrnu6koF13zAxK8vGJbG5j5BOPUDkn3cYvNbyBh8Jg+gC0mamEFW9F67ir
	 6bb6HEzTUrqSQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 77CF917E1229;
	Mon, 03 Aug 2026 20:05:04 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 78096480061; Mon, 03 Aug 2026 20:05:03 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Mon, 03 Aug 2026 20:05:17 +0200
Subject: [PATCH v9 16/22] drm/rockchip: dw_dp: Add runtime PM support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-synopsys-dw-dp-improvements-v9-16-2e6e46135312@collabora.com>
References: <20260803-synopsys-dw-dp-improvements-v9-0-2e6e46135312@collabora.com>
In-Reply-To: <20260803-synopsys-dw-dp-improvements-v9-0-2e6e46135312@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Alexey Charkov <alchark@flipper.net>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2728;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=8QSlSuWPiGUI9AoT3cgCttdenutXBFd4174AAf6FMNQ=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpw2E+r/JK6rbBd1bJ9mvGx4sWIcG9hMWAzL
 ogdh+35JamkGokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqcNhPAAoJENju1/PI
 O/qaOZUP/3b9R5tMruY8nj7UyEnLFf4P8GQHm7Ep5EgQsyOlEZ/c08WCzZKziN+BpV43pBcbL/E
 Gmj0Ck0vagJwKBChFdc8mD9+BTAfqNCL4t0yPatigmgdXdim2x5Tomb0qEyc3ZvIW2atTrSLdWU
 jjiZ+mryQ1Cw21axGGSYUmcXQOjcjW+VJRA+eShVu1IBlxPAIcgL7N0RWCJxODCsTzfjx6Z9ExM
 +a9i6oj2AWNzysU019JxLTYRftHETmONWCQkGWP8+oAVX/a7UfuBvXozWj6JFwKLUVTBT+IXV4d
 lXOkafIRhvo9FAyyBu8ujX68nh252ccrtzVENanrztK49CVRkyWbloD/NLGbPXTbcNrdZSFibP4
 t1IuAQnXggGvB0HhD57VMAYRXG+/nKSFLekF/ByM2vD0gb6PxaSUvlNIwjZZ3rHy7aUNS1OmkRZ
 UjQTnX4/1PDnohzW4nn+u+2H+A9bKJK8CiXrNGZkOCl0HoNj6zQPMO/KmOqQ537SmQnz/NxH92w
 qKKCKCM9cIuwUC0ny1HMa2CZ9ihoBvHFgybMv5aMFZKJgmL0GCmK9vOuy05NJkBrJdsYIBQcYW1
 hio64vXAaHSpP9KrNdWYDVO9rsd03D/i/XMcnjrVL3jJw+NsHX0d9cXhHftBAAXbjdI8psWBiWo
 MQggY0cR0vavULlUqTO0qaw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_110515_074857_A59C8300 
X-CRM114-Status: GOOD (  15.83  )
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

Add support for runtime PM to the Rockchip RK3576/3588 Synopsys
DesignWare DisplayPort driver.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_dp-rockchip.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
index d516b3910b51..dde3881efad8 100644
--- a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
@@ -12,6 +12,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/videodev2.h>
 
@@ -194,7 +195,7 @@ static int dw_dp_rockchip_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct rockchip_dw_dp *dp;
 	struct resource *res;
-	int id;
+	int id, ret;
 
 	plat_data_const = device_get_match_data(dev);
 	if (!plat_data_const)
@@ -231,16 +232,21 @@ static int dw_dp_rockchip_probe(struct platform_device *pdev)
 	if (IS_ERR(dp->vo_grf))
 		return PTR_ERR(dp->vo_grf);
 
+	plat_data->autosuspend_delay = 500;
 	plat_data->max_link_rate = plat_data_const->max_link_rate;
 	plat_data->pixel_mode = plat_data_const->pixel_mode;
 	plat_data->hpd_sw_sel = dw_dp_rockchip_hpd_sw_sel;
 	plat_data->hpd_sw_cfg = dw_dp_rockchip_hpd_sw_cfg;
 	plat_data->data = dp;
 
-	dp->base = dw_dp_probe(pdev, plat_data);
+	dp->base = dw_dp_alloc(pdev, plat_data);
 	if (IS_ERR(dp->base))
 		return PTR_ERR(dp->base);
 
+	ret = dw_dp_probe(dp->base);
+	if (ret)
+		return ret;
+
 	return component_add(&pdev->dev, &dw_dp_rockchip_component_ops);
 }
 
@@ -249,6 +255,24 @@ static void dw_dp_rockchip_remove(struct platform_device *pdev)
 	component_del(&pdev->dev, &dw_dp_rockchip_component_ops);
 }
 
+static int dw_dp_rockchip_runtime_suspend(struct device *dev)
+{
+	struct rockchip_dw_dp *dp = dev_get_drvdata(dev);
+
+	return dw_dp_runtime_suspend(dp->base);
+}
+
+static int dw_dp_rockchip_runtime_resume(struct device *dev)
+{
+	struct rockchip_dw_dp *dp = dev_get_drvdata(dev);
+
+	return dw_dp_runtime_resume(dp->base);
+}
+
+static const struct dev_pm_ops dw_dp_pm_ops = {
+	RUNTIME_PM_OPS(dw_dp_rockchip_runtime_suspend, dw_dp_rockchip_runtime_resume, NULL)
+};
+
 static const struct rockchip_dw_dp_plat_data rk3588_dp_plat_data = {
 	.num_ctrls = 2,
 	.ctrl_ids = {0xfde50000, 0xfde60000},
@@ -283,5 +307,6 @@ struct platform_driver dw_dp_driver = {
 	.driver = {
 		.name = "dw-dp",
 		.of_match_table = dw_dp_of_match,
+		.pm = pm_ptr(&dw_dp_pm_ops),
 	},
 };

-- 
2.53.0


