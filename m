Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2844FC531FA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 19:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yKjkPtrUBZ5+zvs2t6cDMrRrrTm2aCL7JoP0BW8mVVM=; b=kyTZ9G+FFK4Bnt4eNoF3hswWUJ
	Sh85oNz+sWT9V+sXguh3BrguUpj+bCt2d27/gVMuRgdUGnSsASQa98Zzt2S6RQTMOHyHA3WCU3spt
	7DZ8qZqcoGt0N5UghStkvVYc8xgU+9pl5Ue4LqFaXC0CAXMYyO16whf3i+saoqagDUQEjwlT6yo0Z
	UuwSuKUcE+urFvKWQ1I9+lTO5J2Drc1nCikd5gu5krmK5XTmvqagQSb6jxWlzu91sajRGfz363198
	vU2y8SCqcmVgDMwzmLW52B14KZS1WoO0W3GS2n6UbJy9hziPxImxCvIKoWQZtrKR2kkiEDNc3fbZE
	rnvU78XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmzJG-0000000Ez6T-0gb5;
	Thu, 23 Jul 2026 19:42:22 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmzIo-0000000EykL-3tMC;
	Thu, 23 Jul 2026 19:41:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784835711;
	bh=FA6gjb7yFKww1Ld0T7YnzSA/v31jHcXY9TgmognE7xI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LQSFi6NUPLkoLFJprgnNXsnuPUlUhF2CcJo4R1InI8d2146/7s0p4EszApB3rAUuM
	 6VJGB/yMKpX0Rt52z5DCrhtGj8bB+PLWK99B76YD756NSixPzW7iz6IzQXodGjbXUs
	 AQCEcOplFzd81kKwE4a4HDjZZtXa42BV4PhOpKhYh4KHazUK5Rzi+7h8EmpTui7Ljo
	 sJCC1qUdln/c6rOPBVmL7cDdwKVOVWAmnyc/yo+Tkza30dmEYO78hwi8n6ofs51Da5
	 cpvkMH4jmDggDX/yU7xXww5vnJH5nvOHKmBO9yeP0hJGQghbyBPthFllWNRISQnW3C
	 +9SfkOLtjNDIw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0B08F17E124A;
	Thu, 23 Jul 2026 21:41:51 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 23 Jul 2026 22:41:49 +0300
Subject: [PATCH v5 06/10] phy: rockchip: samsung-hdptx: Drop TMDS rate
 setup workaround
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260723-hdptx-clk-fixes-v5-6-8e786067865f@collabora.com>
References: <20260723-hdptx-clk-fixes-v5-0-8e786067865f@collabora.com>
In-Reply-To: <20260723-hdptx-clk-fixes-v5-0-8e786067865f@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Niederpr=C3=BCm?= <dubito@online.de>, 
 Simon Wright <simon@symple.nz>, Diederik de Haas <diederik@cknow-tech.com>, 
 Andy Yan <andy.yan@rock-chips.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_124155_126838_3831FE66 
X-CRM114-Status: GOOD (  10.22  )
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

Since commit ba9c2fe18c17 ("drm/rockchip: dw_hdmi_qp: Switch to
phy_configure()") the TMDS rate setup doesn't rely anymore on the
unconventional usage of the bus width, instead it is managed exclusively
through the HDMI PHY configuration API.

Drop the now obsolete workaround to retrieve the TMDS character rate via
phy_get_bus_width() during power_on().

Tested-by: Thomas Niederprüm <dubito@online.de>
Tested-by: Simon Wright <simon@symple.nz>
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS
Reviewed-by: Andy Yan <andy.yan@rock-chips.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 792eb57755eb..31abff5ada9e 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -1660,22 +1660,6 @@ static int rk_hdptx_phy_power_on(struct phy *phy)
 	enum phy_mode mode = phy_get_mode(phy);
 	int ret, lane;
 
-	if (mode != PHY_MODE_DP) {
-		if (!hdptx->hdmi_cfg.rate && hdptx->hdmi_cfg.mode != PHY_HDMI_MODE_FRL) {
-			/*
-			 * FIXME: Temporary workaround to setup TMDS char rate
-			 * from the RK DW HDMI QP bridge driver.
-			 * Will be removed as soon the switch to the HDMI PHY
-			 * configuration API has been completed on both ends.
-			 */
-			hdptx->hdmi_cfg.rate = phy_get_bus_width(hdptx->phy) & 0xfffffff;
-			hdptx->hdmi_cfg.rate *= 100;
-		}
-
-		dev_dbg(hdptx->dev, "%s rate=%llu bpc=%u\n", __func__,
-			hdptx->hdmi_cfg.rate, hdptx->hdmi_cfg.bpc);
-	}
-
 	ret = rk_hdptx_phy_consumer_get(hdptx);
 	if (ret)
 		return ret;
@@ -1704,6 +1688,9 @@ static int rk_hdptx_phy_power_on(struct phy *phy)
 		if (ret)
 			rk_hdptx_phy_consumer_put(hdptx, true);
 	} else {
+		dev_dbg(hdptx->dev, "%s rate=%llu bpc=%u\n", __func__,
+			hdptx->hdmi_cfg.rate, hdptx->hdmi_cfg.bpc);
+
 		if (hdptx->pll_config_dirty)
 			ret = rk_hdptx_pll_cmn_config(hdptx);
 

-- 
2.55.0


