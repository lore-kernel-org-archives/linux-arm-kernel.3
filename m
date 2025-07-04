Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7555C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 14:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/7Zn0vTOTECQRxWdeg+OJmbb120QETOrZ8m33UaJC+Y=; b=Qc934up2h95/MhjLiRpw2x/tyi
	cI6z5rFSwQLTUbYCQScN6HELURJyGxtVMEn7bSRLirLkinocTv8WVSsyu9GqyEww9x2p8mlezkTMT
	OVsXLzao8S3WRmuTenBNwwmvGTQvjvXU+6QPL+q1Oc2Lg4+o/LFDlwCKSrJ/I9dsv3afF5nqY5sft
	lPK/tAitunCuvXcZm1pRsDUZ4etK7yA9KQ3siomr6hxUzUQAPxYTj4pHVIVXUzm+z7dnKwvH3ukUc
	Bv4/GWjsgF5xWMm6ek1et6mFbZEmJsvdBWEre1WtsP7Ac2h5GaFAbu6uNa/UA62WtIOvG1OEUKji3
	iTBmzB5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXhcv-0000000EhUI-3mdr;
	Fri, 04 Jul 2025 14:42:57 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXhKB-0000000Ef01-2dRL;
	Fri, 04 Jul 2025 14:23:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751639013;
	bh=OGXR5gEP7YLhkQAVGZX03J8vqkAauPCa9H/rtfzhYdg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cav4NEJRjRip5DYfML+dlFPvZ+rvsB7tHyiPmySE34h6KisgFAMKMPFzZTrVIp8nQ
	 eYl7s/fm5Q3k/pOeRP+gFMFSH2M3CxpxlWqin/JP1uI/6wQQRfHyylgBneY2bQMTkY
	 RPb9XKChIG1ihlkzTKLCBnPxlF01GfvuuQRPrkxWuTNB3cSmth6pciWUFAodldJ5iI
	 fVP6x7C8tl/NOVMkql32p+q/bAePPbBPn1TAIMkLHpRpm4Z5KaGhDpoXfkgkOayD/o
	 vrBEKPdR8LCFXXEm2bAUb8ljw0M7mO38HyBvTENvexUWnLxT3DuBEI71vMuReb2L/e
	 k2z47Gz7/XHnQ==
Received: from localhost (unknown [212.93.144.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id BF98417E0E2D;
	Fri,  4 Jul 2025 16:23:33 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 04 Jul 2025 17:23:24 +0300
Subject: [PATCH 3/5] drm/rockchip: dw_hdmi_qp: Provide ref clock rate in
 dw_hdmi_qp_plat_data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-rk3588-hdmi-cec-v1-3-2bd8de8700cd@collabora.com>
References: <20250704-rk3588-hdmi-cec-v1-0-2bd8de8700cd@collabora.com>
In-Reply-To: <20250704-rk3588-hdmi-cec-v1-0-2bd8de8700cd@collabora.com>
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
X-CRM114-CacheID: sfid-20250704_072335_944723_1B069D66 
X-CRM114-Status: GOOD (  15.39  )
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

In order to support correct initialization of the timer base in the HDMI
QP IP block, extend the platform data to provide the necessary reference
clock rate.

While at it, ensure plat_data is zero-initialized in
dw_hdmi_qp_rockchip_bind().

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 13 ++++++++++++-
 include/drm/bridge/dw_hdmi_qp.h                |  1 +
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index 126e556025961e8645f3567b4d7a1c73cc2f2e7f..8c1185490009c5f1bc658998a868f8b18dc479a3 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -431,8 +431,8 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 				    void *data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
+	struct dw_hdmi_qp_plat_data plat_data = {};
 	const struct rockchip_hdmi_qp_cfg *cfg;
-	struct dw_hdmi_qp_plat_data plat_data;
 	struct drm_device *drm = data;
 	struct drm_connector *connector;
 	struct drm_encoder *encoder;
@@ -515,6 +515,17 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 		return ret;
 	}
 
+	for (i = 0; i < ret; i++) {
+		if (!strcmp(clks[i].id, "ref")) {
+			plat_data.ref_clk_rate = clk_get_rate(clks[i].clk);
+			break;
+		}
+	}
+	if (!plat_data.ref_clk_rate) {
+		dev_err(hdmi->dev, "Missing ref clock\n");
+		return -EINVAL;
+	}
+
 	hdmi->enable_gpio = devm_gpiod_get_optional(hdmi->dev, "enable",
 						    GPIOD_OUT_HIGH);
 	if (IS_ERR(hdmi->enable_gpio)) {
diff --git a/include/drm/bridge/dw_hdmi_qp.h b/include/drm/bridge/dw_hdmi_qp.h
index b4a9b739734ec7b67013b683fe6017551aa19172..76ecf31301997718604a05f70ce9eab8695e26b5 100644
--- a/include/drm/bridge/dw_hdmi_qp.h
+++ b/include/drm/bridge/dw_hdmi_qp.h
@@ -24,6 +24,7 @@ struct dw_hdmi_qp_plat_data {
 	void *phy_data;
 	int main_irq;
 	int cec_irq;
+	unsigned long ref_clk_rate;
 };
 
 struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,

-- 
2.50.0


