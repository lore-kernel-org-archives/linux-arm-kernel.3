Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D0ADE77184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 20:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jg83Q2oVU4lXu4Mv8M8jYyiHKvWW+8+1IP4WxXXIwmQ=; b=pbsMarQoOQzNRVOkJOLtM3HgBF
	8qKVISJlY5JwlKmzqyFfwo3qVbWNEbEHfIvHWC+Ho4n9GuTLbQc0BbLVf1gbGVID8ni3QOHG9vjeT
	30W/g4ajiHFURRazpHa5QHtIZcfhmDljoed1MIifzUUgwoP01sRO1mxD0hL4vfnQ15VH719NzlBqx
	RyvsKyGJ3h/MP+PUcCrLz/0Wwpk5N8XnNXSu5Im/W+TegmsH2P+AKhPbghbODgNN6okPir3nTmLjm
	1UvE6BlDUH6Io25YVYrkt27P7CQVLZE/KmBszO/+hKOCgV0aL/rZNRPp/um13ExVpBjkvm6WYAl6/
	SxCRwdMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNe6g-0000000Ejph-2HXB;
	Tue, 17 Dec 2024 20:23:50 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNe0k-0000000Eiqo-39j7;
	Tue, 17 Dec 2024 20:17:43 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1734466644; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aqDfAGDK7mX2EqvbeqXWjB7qnHyvMZcbrIj//lpApUyMlrZfxsJuFJ9DCXAKcvq/EhH1lmWLSF6/BUaCTWM8bVZLss1B8SYeCmyIemgXkV+4op3JGzFpz8Tt+W/gP3JjzL5SJJmNFPlklvXkoG5X7eiJvlsZzN9ssQTRG2f2zm8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1734466644; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=jg83Q2oVU4lXu4Mv8M8jYyiHKvWW+8+1IP4WxXXIwmQ=; 
	b=Q/BC6FTAKoJpFiGhschv8pcnir7UdyhwCkf5Z6B8smOH3206ob3L9QI+z2sHgkJ2SGtrqSQAayGwsGykn8cfxGtOrzkvDSFXHRhFclH5AaDTkgO7fbyX/AprfxDn/Xyb3kiYQ7r6BhnTXVb2QfFvVGIDPS8bZIKtWvxQvotIAMs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=derek.foreman@collabora.com;
	dmarc=pass header.from=<derek.foreman@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1734466644;
	s=zohomail; d=collabora.com; i=derek.foreman@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=jg83Q2oVU4lXu4Mv8M8jYyiHKvWW+8+1IP4WxXXIwmQ=;
	b=eEweObNWXybKvUEAnW484esoWsyVWo/Yf0jD/TGapY6yugdr8pz71hvJ/3efwPpE
	43m6SYZzgcpi4b6z41/mj8GCS7+71PkUNfvuKiPYVz2Bx+nKYVfRi0y2Kzvni9vBvQ9
	kue/luD9beAvOMcwervCIhNI06nPyH1vjWAwqeTQ=
Received: by mx.zohomail.com with SMTPS id 1734466642641430.9536683331079;
	Tue, 17 Dec 2024 12:17:22 -0800 (PST)
From: Derek Foreman <derek.foreman@collabora.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Algea Cao <algea.cao@rock-chips.com>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Derek Foreman <derek.foreman@collabora.com>,
	kernel@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/rockchip: Don't change hdmi reference clock rate
Date: Tue, 17 Dec 2024 14:17:07 -0600
Message-ID: <20241217201708.3320673-1-derek.foreman@collabora.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_121742_827638_5FB825DE 
X-CRM114-Status: GOOD (  10.74  )
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

The code that changes hdmi->ref_clk was accidentally copied from
downstream code that sets a different clock. We don't actually
want to set any clock here at all.

Setting this clock incorrectly leads to incorrect timings for
DDC, CEC, and HDCP signal generation.

No Fixes listed, as the theoretical timing error in DDC appears to
still be within tolerances and harmless - and HDCP and CEC are not
yet supported.

Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index e498767a0a66..cebd72bf1ef2 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -54,7 +54,6 @@ struct rockchip_hdmi_qp {
 	struct regmap *regmap;
 	struct regmap *vo_regmap;
 	struct rockchip_encoder encoder;
-	struct clk *ref_clk;
 	struct dw_hdmi_qp *hdmi;
 	struct phy *phy;
 	struct gpio_desc *enable_gpio;
@@ -81,7 +80,6 @@ static void dw_hdmi_qp_rockchip_encoder_enable(struct drm_encoder *encoder)
 	if (crtc && crtc->state) {
 		rate = drm_hdmi_compute_mode_clock(&crtc->state->adjusted_mode,
 						   8, HDMI_COLORSPACE_RGB);
-		clk_set_rate(hdmi->ref_clk, rate);
 		/*
 		 * FIXME: Temporary workaround to pass pixel clock rate
 		 * to the PHY driver until phy_configure_opts_hdmi
@@ -330,17 +328,6 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 		return ret;
 	}
 
-	for (i = 0; i < ret; i++) {
-		if (!strcmp(clks[i].id, "ref")) {
-			hdmi->ref_clk = clks[1].clk;
-			break;
-		}
-	}
-	if (!hdmi->ref_clk) {
-		drm_err(hdmi, "Missing ref clock\n");
-		return -EINVAL;
-	}
-
 	hdmi->enable_gpio = devm_gpiod_get_optional(hdmi->dev, "enable",
 						    GPIOD_OUT_HIGH);
 	if (IS_ERR(hdmi->enable_gpio)) {
-- 
2.45.2


