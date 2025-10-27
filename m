Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 363DCCCF9EF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 22:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PNoGXa8DGf3d1zglmfUnlyu0kd1YK1VK/3S+7wfc+Ks=; b=FlcJuv1a6UeIwRmDiCs5zMS2bH
	787VlrMdAiXeu1OTwj2E/0DEngTXuRYjvZE9BS/oCqEZV0JHWFtO0+ui074QH9Krt1TWlnfRN4kPs
	1ZS6GhluTHVPsQtQ/vKiKkgQgmMRlyPxuFVHvxnf6Vss1rGt06GbZZB2QG0b0lkFHQgJbcYt1U5RK
	rYipxovXbjmpG8k597bBkcJrcXCq66M6DUfHsmohFLgwm4WmVP2PT0fwxDm1/juPah/NF0n696SUq
	52poqx/xwHUaXXzpmQes9PrZjgx1cFoLR40HUepc5bh4ysDenfImo0K5+Cv+x3+hmQS8DApngaSCw
	zxznkWGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVgB-0000000Ervp-0WDi;
	Mon, 27 Oct 2025 22:27:07 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVg4-0000000ErrU-3Y4o;
	Mon, 27 Oct 2025 22:27:02 +0000
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi [82.203.161.16])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 5CD0B19A2;
	Mon, 27 Oct 2025 23:25:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761603910;
	bh=Tl8MZUMZp7jla1zpWzpw3mApleIVFgmxEnRsDh+ZjEs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T1QJEk/H1QNweG/LbaYxMNhJXFEtps0BFWR83uHG4Cnha3p3/l0iK5DRdairvSbwQ
	 cPi7zb/RyzoQajf1Wl3NKyOGzAfGuC0KFARwJocO6HGiTg7wCukmqEC1cDt3ghYvVX
	 FNx7tycfue2/Pv2zzHBjMWpzUUNhU7Gavz7LVYL4=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v3 2/2] drm/rockchip: dw_hdmi_qp: Fixup usage of enable_gpio member in main struct
Date: Tue, 28 Oct 2025 00:26:41 +0200
Message-ID: <20251027222641.25066-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251027222641.25066-1-laurent.pinchart@ideasonboard.com>
References: <20251027222641.25066-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_152701_027421_822C09D6 
X-CRM114-Status: GOOD (  15.00  )
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

From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

The name of the enable_gpio member in struct rockchip_hdmi_qp is too
generic, as initially "borrowed" from downstream BSP code. Moreover,
this hasn't been really in use so far, since there is neither a DT
providing an "enable-gpios" property to any of the "hdmi" nodes, nor a
binding documenting it.

The actual purpose of this GPIO line is to control the voltage bias for
the HDMI TX data lines when switching between TMDS and FRL operating
modes.

A previous patch introduced the "frl-enable-gpios" property of the
RK3588 HDMI TX Controller binding, hence pass the updated string to
devm_gpiod_get_optional(), rename the struct member accordingly and set
it to a low level.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v2:

- Rename tmds-enable to frl-enable
- Acquire the GPIO with GPIOD_OUT_LOW
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index 931343b072ad..36363136a695 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -92,7 +92,7 @@ struct rockchip_hdmi_qp {
 	struct rockchip_encoder encoder;
 	struct dw_hdmi_qp *hdmi;
 	struct phy *phy;
-	struct gpio_desc *enable_gpio;
+	struct gpio_desc *frl_enable_gpio;
 	struct delayed_work hpd_work;
 	int port_id;
 	const struct rockchip_hdmi_qp_ctrl_ops *ctrl_ops;
@@ -118,7 +118,7 @@ static void dw_hdmi_qp_rockchip_encoder_enable(struct drm_encoder *encoder)
 	unsigned long long rate;
 
 	/* Unconditionally switch to TMDS as FRL is not yet supported */
-	gpiod_set_value(hdmi->enable_gpio, 1);
+	gpiod_set_value(hdmi->frl_enable_gpio, 0);
 
 	if (crtc && crtc->state) {
 		rate = drm_hdmi_compute_mode_clock(&crtc->state->adjusted_mode,
@@ -515,11 +515,11 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 	plat_data.ref_clk_rate = clk_get_rate(ref_clk);
 	clk_put(ref_clk);
 
-	hdmi->enable_gpio = devm_gpiod_get_optional(hdmi->dev, "enable",
-						    GPIOD_OUT_HIGH);
-	if (IS_ERR(hdmi->enable_gpio))
-		return dev_err_probe(hdmi->dev, PTR_ERR(hdmi->enable_gpio),
-				     "Failed to request enable GPIO\n");
+	hdmi->frl_enable_gpio = devm_gpiod_get_optional(hdmi->dev, "frl-enable",
+							GPIOD_OUT_LOW);
+	if (IS_ERR(hdmi->frl_enable_gpio))
+		return dev_err_probe(hdmi->dev, PTR_ERR(hdmi->frl_enable_gpio),
+				     "Failed to request FRL enable GPIO\n");
 
 	hdmi->phy = devm_of_phy_get_by_index(dev, dev->of_node, 0);
 	if (IS_ERR(hdmi->phy))
-- 
Regards,

Laurent Pinchart


