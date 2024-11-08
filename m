Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08CEFD5C0C8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 14:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2nN4JqEDzQF8CCUgP/ziSYmPd1Oo8YRgapLVQ+6WIcU=; b=jobdTtwt9t92XzEwejm2QFmSuB
	KJw4VZqKYOhdWii5JsGw19aXLXFMkg6M6gAxkJZbpjqlwaNhjbOFGFrIBz/K4nClpbz1wJZbfh/5E
	XACAAYY7ubnmi7sGwXlSI5INbP2s9Scpc3DN0i5ewvv91Vz9u2ZgZZFln2W2nxrPqz6P7nrFprhiv
	uUZ3v54OIHQas0d18UKQ+GfAWqyocSAT1sCzP0NjQ1uZ2RfxhHGxuDTZqPtJPHbJOWSVA7lCzMSlW
	yLR3DxtBEUGDMoWrJ2Z8Aka0o6GAaOV777l5IHYJtef9GVg5SUA2AYVODZVjYQ9+uRkpMSHD0SfGl
	z/S7yegA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9PqL-0000000ApVh-3tjA;
	Fri, 08 Nov 2024 14:20:09 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9PR7-0000000Alcu-2ZQe;
	Fri, 08 Nov 2024 13:54:07 +0000
From: Dragan Simic <dsimic@manjaro.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1731074042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2nN4JqEDzQF8CCUgP/ziSYmPd1Oo8YRgapLVQ+6WIcU=;
	b=o61aKxCdcZBd2XTmhnBPl8aecZCjt/wzStVNMVp/TwEhp49T8em57HVwDE216g+2p498NR
	cjiRwrOWiUxW8F5n0ju2oFnbFykdcrWmmCA9xAhO2i0Y3byW5NmliccfnEgzF3XSewx+ie
	uhwX45ih8uZHZbOJkWaeCLeTkfJxAxHcoQJ8sd6/nSEOhdkrERTDbXeu0E2pGJaeBUJL6z
	QXIIRKarHHyoHNpRGq+lOG8otxJw+xMaAq6wauxLydTRxceNzwhJ34W5vS0SIxLJoSQavV
	u0um4SRYHG86KeUR9Xv1E7QOlWqWXbTRhHOJlLpqHLYD2rOIJqYk/rWwgbBE+g==
To: linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Cc: heiko@sntech.de,
	hjc@rock-chips.com,
	andy.yan@rock-chips.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] drm/rockchip: dsi: Perform trivial code cleanups
Date: Fri,  8 Nov 2024 14:53:57 +0100
Message-Id: <35555b58a7284450fb16281514e4e6a3eb9c7b82.1731073565.git.dsimic@manjaro.org>
In-Reply-To: <cover.1731073565.git.dsimic@manjaro.org>
References: <cover.1731073565.git.dsimic@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_055405_835262_B938ED9F 
X-CRM114-Status: UNSURE (   9.91  )
X-CRM114-Notice: Please train this message.
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

Perform a few trivial code cleanups, to make one logged message a bit more
consistent with the other logged messages by capitalizing its first word, and
to avoid line wrapping by using the 100-column width better.

No intended functional changes are introduced by these code cleanups.

Signed-off-by: Dragan Simic <dsimic@manjaro.org>
---
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index 58a44af0e9ad..f451e70efbdd 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -1379,7 +1379,7 @@ static int dw_mipi_dsi_rockchip_probe(struct platform_device *pdev)
 	}
 
 	if (!dsi->cdata) {
-		DRM_DEV_ERROR(dev, "no dsi-config for %s node\n", np->name);
+		DRM_DEV_ERROR(dev, "No dsi-config for %s node\n", np->name);
 		return -EINVAL;
 	}
 
@@ -1408,19 +1408,16 @@ static int dw_mipi_dsi_rockchip_probe(struct platform_device *pdev)
 			dsi->pllref_clk = NULL;
 		} else {
 			ret = PTR_ERR(dsi->pllref_clk);
-			DRM_DEV_ERROR(dev,
-				      "Unable to get pll reference clock: %d\n",
-				      ret);
+			DRM_DEV_ERROR(dev, "Unable to get pll reference clock: %d\n", ret);
 			return ret;
 		}
 	}
 
 	if (dsi->cdata->flags & DW_MIPI_NEEDS_PHY_CFG_CLK) {
 		dsi->phy_cfg_clk = devm_clk_get(dev, "phy_cfg");
 		if (IS_ERR(dsi->phy_cfg_clk)) {
 			ret = PTR_ERR(dsi->phy_cfg_clk);
-			DRM_DEV_ERROR(dev,
-				      "Unable to get phy_cfg_clk: %d\n", ret);
+			DRM_DEV_ERROR(dev, "Unable to get phy_cfg_clk: %d\n", ret);
 			return ret;
 		}
 	}
@@ -1465,8 +1462,7 @@ static int dw_mipi_dsi_rockchip_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->dmd)) {
 		ret = PTR_ERR(dsi->dmd);
 		if (ret != -EPROBE_DEFER)
-			DRM_DEV_ERROR(dev,
-				      "Failed to probe dw_mipi_dsi: %d\n", ret);
+			DRM_DEV_ERROR(dev, "Failed to probe dw_mipi_dsi: %d\n", ret);
 		return ret;
 	}
 

