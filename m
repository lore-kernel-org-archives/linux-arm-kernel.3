Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F6BE69E91
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 20:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bxbi5DRYg8kZJB/UKskeRxo7UJoKhQX1P06X88swAEM=; b=D9C+ckA48MxjN2M+jwsQnyS9pG
	Umbe5KBCyG8eVbjpDAINv0ZPZw3BxlrdhZwqO6FI6kM3ekHokRd8S4hX73yr07XaEa535Synoq/Rw
	tYHPnYp4YSn4qvoasqW1LnrX3s93v9po+tzaobHw1Ktk1UNVoumRuzQUS9BtEbXyFdqCHattbmWTY
	Z4nyZ1aUi+Cu2qd0K+LTodXYqUWeuYzsGZf7NvJAGxZuiGEbgKtMF9BOgwIWtrezIqo6ak9JOs7yp
	0DdVXV31IQdadQ/tlhQd1VS1ZKKrED/QNHBxpf5gdWlrIrXyB11YSM+eqy/xE1Yz/KX4hhUnvWVjY
	Ma0h5bAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tID2x-00000007Poz-1ttP;
	Mon, 02 Dec 2024 20:29:31 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tID1p-00000007PgN-1uS9;
	Mon, 02 Dec 2024 20:28:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733171298;
	bh=rBKYTLNDOW58j3hrrUdo0WdSxf4pv9UIQrcg23u2TeI=;
	h=From:Date:Subject:To:Cc:From;
	b=PkhjGQyJ4/Fevt7ZCrl+pKRnMo03LMwldD/4TjcRFA64a1e+Yanmovbl+JYFnmBEB
	 Kcy403oV5TKa8+BiYZk4GjmpZK+9znodpZku2DRXsy7PCG2GDIhvo1ZOw5R5N8w+oj
	 nzkes2CoQicHSXlYjx7IY+O7WLgaJkLTQzLqXoT66xwhiy7B5rIwMZhKo+0+aaeyW0
	 mLf1wG+dg4PwxWhMCJv3iLBPE8cl2kh3qL+ooG7jwX28NPsHqUCrqJT5L2HLSqHauV
	 VKPBCRpeK7r95320h6FmGV0BT3zgvn/a1xNDHNFPFjfVvpm5IemPeSH1JegTYLUxY/
	 ywJbbG9T/GmEg==
Received: from localhost (unknown [86.120.21.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A3D4D17E37E4;
	Mon,  2 Dec 2024 21:28:18 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 02 Dec 2024 22:27:34 +0200
Subject: [PATCH] drm/rockchip: dw_hdmi_qp: Simplify clock handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-dw-hdmi-qp-rk-clk-bulk-v1-1-60a7cc9cd74e@collabora.com>
X-B4-Tracking: v=1; b=H4sIADUYTmcC/x2MSQqAMAwAvyI5G2irgvgV8aBttMG9xQXEvxu8D
 Mxh5oFIgSlClTwQ6OTI6yKi0wSsb5eBkJ04GGVyLUB3oXcz475hGNFOI3aHIHN9q3RhqNQ5SLw
 F6vn+x3Xzvh9C6epiaAAAAA==
X-Change-ID: 20241202-dw-hdmi-qp-rk-clk-bulk-3dfa0152e814
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_122822_476657_A4CBEBFF 
X-CRM114-Status: GOOD (  13.64  )
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

Make use of the recently introduced devm_clk_bulk_get_all_enabled()
helper to simplify the code a bit.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 28 +++++++++++++-------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index c8b362cc2b95fd490029a9c0552ad9fbc5631d17..20ecc0729db9f5e321041ae7b3349bff5246a926 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -214,17 +214,13 @@ MODULE_DEVICE_TABLE(of, dw_hdmi_qp_rockchip_dt_ids);
 static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 				    void *data)
 {
-	static const char * const clk_names[] = {
-		"pclk", "earc", "aud", "hdp", "hclk_vo1",
-		"ref" /* keep "ref" last */
-	};
 	struct platform_device *pdev = to_platform_device(dev);
 	struct dw_hdmi_qp_plat_data plat_data;
 	struct drm_device *drm = data;
 	struct drm_connector *connector;
 	struct drm_encoder *encoder;
 	struct rockchip_hdmi_qp *hdmi;
-	struct clk *clk;
+	struct clk_bulk_data *clks;
 	int ret, irq, i;
 	u32 val;
 
@@ -270,18 +266,22 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 		return PTR_ERR(hdmi->vo_regmap);
 	}
 
-	for (i = 0; i < ARRAY_SIZE(clk_names); i++) {
-		clk = devm_clk_get_enabled(hdmi->dev, clk_names[i]);
+	ret = devm_clk_bulk_get_all_enabled(hdmi->dev, &clks);
+	if (ret < 0) {
+		drm_err(hdmi, "Failed to get clocks: %d\n", ret);
+		return ret;
+	}
 
-		if (IS_ERR(clk)) {
-			ret = PTR_ERR(clk);
-			if (ret != -EPROBE_DEFER)
-				drm_err(hdmi, "Failed to get %s clock: %d\n",
-					clk_names[i], ret);
-			return ret;
+	for (i = 0; i < ret; i++) {
+		if (!strcmp(clks[i].id, "ref")) {
+			hdmi->ref_clk = clks[1].clk;
+			break;
 		}
 	}
-	hdmi->ref_clk = clk;
+	if (!hdmi->ref_clk) {
+		drm_err(hdmi, "Missing ref clock\n");
+		return -EINVAL;
+	}
 
 	hdmi->enable_gpio = devm_gpiod_get_optional(hdmi->dev, "enable",
 						    GPIOD_OUT_HIGH);

---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20241202-dw-hdmi-qp-rk-clk-bulk-3dfa0152e814


