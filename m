Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37438CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 09:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ozvdDO6U8Pr0UJd+XXyZInVWzYkM6wiyBMc/QUd9Gl4=; b=yezm45Rol/8rEgAMThZrMW5cfg
	ay5D9o7bGRXJoSXc5GA2Vhji2cRPq6Y1dSdwC80F9mnP/MfB8OqrnrML2udWe+tMaZrSuOijasVCL
	qaTZc4No3H9SKa/SV0QGbrymtC7kFnyegpvFXo6GiFch4MX+Q0dFIhdn+Fp/0YoRwrffCVDL9kHxQ
	35MnZJxbV+eta5PwJ59M0Jx+QEc6C1iDb4v11H9MVNb+Wfj9A0708YK6I0XHGlBGSDE911Q5Wru3w
	SvlBQ0kvIahLilrO7Cy0es6rJCeyUND+yn4BmKXS80VuQ3cbQzykpnjX8tBnHcksI4GcR7lu9Qyjp
	iS0OYHlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqTch-00000007W3k-319X;
	Mon, 25 Aug 2025 09:36:19 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqT0q-00000007Pt3-2ZMa;
	Mon, 25 Aug 2025 08:57:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756112231;
	bh=WIKih/lv5pN3+A825AnO1OKYgzDPIJjlzykTE0eLhGA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=N4iqcTjB0LjkPpxBf3Vis8ao9PAbSyEXaP5kCIZqa1j/dINPD+bc8AB18qrFyd/Qw
	 tGz2GEIEbiexEhin6paMid2dXM6ifWn4BiFPvnddIpuL4spnizncZHJl1HKhas+ZXo
	 5NPOfArbfyrQRm6i23p7FoL3Iu6gLihNHHguIbYfXJS0JcpDbrndJzhBpSjGogYOcY
	 fKTUDTHVrCrhB8dqYWefdH5ElDWvGZjGMKfZRUQxqUxvNx6TqQjvmAlBMfCs3BdevU
	 GASEs6qBL0l8/i9SNUF0FzJDn5a2cduiuRVtZA8ulyodsMr6I6nLsH5QpCcLkcexDr
	 ZyAgHkYCdsa8w==
Received: from localhost (unknown [82.79.138.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id E899C17E056F;
	Mon, 25 Aug 2025 10:57:10 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 25 Aug 2025 11:56:43 +0300
Subject: [PATCH v3 3/6] drm/rockchip: dw_hdmi_qp: Improve error handling
 with dev_err_probe()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-rk3588-hdmi-cec-v3-3-95324fb22592@collabora.com>
References: <20250825-rk3588-hdmi-cec-v3-0-95324fb22592@collabora.com>
In-Reply-To: <20250825-rk3588-hdmi-cec-v3-0-95324fb22592@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_015712_827957_FA312B6F 
X-CRM114-Status: GOOD (  13.25  )
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

The error handling in dw_hdmi_qp_rockchip_bind() is quite inconsistent,
i.e. in some cases the error code is not included in the message, while
in some other cases there is no check for -EPROBE_DEFER.

Since this is part of the probe path, address the aforementioned issues
by switching to dev_err_probe(), which also reduces the code a bit.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 62 ++++++++++----------------
 1 file changed, 24 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index 7d531b6f4c098c6c548788dad487ce4613a2f32b..4e7794aa2dded4c124963eaa7f5158bde9bbbdb6 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -457,10 +457,8 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 		return -ENODEV;
 
 	if (!cfg->ctrl_ops || !cfg->ctrl_ops->io_init ||
-	    !cfg->ctrl_ops->irq_callback || !cfg->ctrl_ops->hardirq_callback) {
-		dev_err(dev, "Missing platform ctrl ops\n");
-		return -ENODEV;
-	}
+	    !cfg->ctrl_ops->irq_callback || !cfg->ctrl_ops->hardirq_callback)
+		return dev_err_probe(dev, -ENODEV, "Missing platform ctrl ops\n");
 
 	hdmi->ctrl_ops = cfg->ctrl_ops;
 	hdmi->dev = &pdev->dev;
@@ -473,10 +471,9 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 			break;
 		}
 	}
-	if (hdmi->port_id < 0) {
-		dev_err(hdmi->dev, "Failed to match HDMI port ID\n");
-		return hdmi->port_id;
-	}
+	if (hdmi->port_id < 0)
+		return dev_err_probe(hdmi->dev, hdmi->port_id,
+				     "Failed to match HDMI port ID\n");
 
 	plat_data.phy_ops = cfg->phy_ops;
 	plat_data.phy_data = hdmi;
@@ -497,39 +494,30 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 
 	hdmi->regmap = syscon_regmap_lookup_by_phandle(dev->of_node,
 						       "rockchip,grf");
-	if (IS_ERR(hdmi->regmap)) {
-		dev_err(hdmi->dev, "Unable to get rockchip,grf\n");
-		return PTR_ERR(hdmi->regmap);
-	}
+	if (IS_ERR(hdmi->regmap))
+		return dev_err_probe(hdmi->dev, PTR_ERR(hdmi->regmap),
+				     "Unable to get rockchip,grf\n");
 
 	hdmi->vo_regmap = syscon_regmap_lookup_by_phandle(dev->of_node,
 							  "rockchip,vo-grf");
-	if (IS_ERR(hdmi->vo_regmap)) {
-		dev_err(hdmi->dev, "Unable to get rockchip,vo-grf\n");
-		return PTR_ERR(hdmi->vo_regmap);
-	}
+	if (IS_ERR(hdmi->vo_regmap))
+		return dev_err_probe(hdmi->dev, PTR_ERR(hdmi->vo_regmap),
+				     "Unable to get rockchip,vo-grf\n");
 
 	ret = devm_clk_bulk_get_all_enabled(hdmi->dev, &clks);
-	if (ret < 0) {
-		dev_err(hdmi->dev, "Failed to get clocks: %d\n", ret);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(hdmi->dev, ret, "Failed to get clocks\n");
 
 	hdmi->enable_gpio = devm_gpiod_get_optional(hdmi->dev, "enable",
 						    GPIOD_OUT_HIGH);
-	if (IS_ERR(hdmi->enable_gpio)) {
-		ret = PTR_ERR(hdmi->enable_gpio);
-		dev_err(hdmi->dev, "Failed to request enable GPIO: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(hdmi->enable_gpio))
+		return dev_err_probe(hdmi->dev, PTR_ERR(hdmi->enable_gpio),
+				     "Failed to request enable GPIO\n");
 
 	hdmi->phy = devm_of_phy_get_by_index(dev, dev->of_node, 0);
-	if (IS_ERR(hdmi->phy)) {
-		ret = PTR_ERR(hdmi->phy);
-		if (ret != -EPROBE_DEFER)
-			dev_err(hdmi->dev, "failed to get phy: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(hdmi->phy))
+		return dev_err_probe(hdmi->dev, PTR_ERR(hdmi->phy),
+				     "Failed to get phy\n");
 
 	cfg->ctrl_ops->io_init(hdmi);
 
@@ -558,17 +546,15 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 
 	hdmi->hdmi = dw_hdmi_qp_bind(pdev, encoder, &plat_data);
 	if (IS_ERR(hdmi->hdmi)) {
-		ret = PTR_ERR(hdmi->hdmi);
 		drm_encoder_cleanup(encoder);
-		return ret;
+		return dev_err_probe(hdmi->dev, PTR_ERR(hdmi->hdmi),
+				     "Failed to bind dw-hdmi-qp");
 	}
 
 	connector = drm_bridge_connector_init(drm, encoder);
-	if (IS_ERR(connector)) {
-		ret = PTR_ERR(connector);
-		dev_err(hdmi->dev, "failed to init bridge connector: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(connector))
+		return dev_err_probe(hdmi->dev, PTR_ERR(connector),
+				     "Failed to init bridge connector\n");
 
 	return drm_connector_attach_encoder(connector, encoder);
 }

-- 
2.50.1


