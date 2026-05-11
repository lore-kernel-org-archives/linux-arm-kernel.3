Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D764CD4850
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 18:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u40LkZ1LW9iLxAv/KruLht7Fmefwl+X3xj4LFEv2z04=; b=Ezdr3NJunPPj/gFrwopjU2L4xe
	sh0bVVfP3++K1aBfRyD/Bf0jKA5fA95F2Mwi3Gf77iYS0pez7zhso4NTVUMRbgkXopagcMk5w8x0H
	Vh3eTBuT0bABbuVSbZ0nP/GrAy1qzr5hZp8QPK2EbAG/W4pjJtJmKnABqP8oRbtwze5P52mb5sN2t
	myn8IvijDVAzTbt4PTT8y7FcObS/MG9Lw5NIxiUUNu4D3WZe2RNDgs2WY9PEiEUtU5Jxzs5NNV19t
	orewCc3pp1wlqqjU4LGGghYAK2vKLbpX8HSfSJwaHpqIp/GP4RXGTuV7IWHzmshy9BtsX5rNjxzLv
	FpRHGNjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMVG1-0000000ETyj-1PkF;
	Mon, 11 May 2026 18:21:33 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMVFu-0000000ETr1-0fWj;
	Mon, 11 May 2026 18:21:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778523683;
	bh=L7rMVkvvxJbzvZ5JGWq6mRL5pKl06LbYIIuk0BWekVM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kvR0t4zYIEP2N2j0KTBid0A4RXag9H79L9POxawz+t3RB1+e90JmLePPbzFTNNMAx
	 4W3y6cyFy51ZzShbRMywfo0gTNloaNHK8c20j8hh69pOmv/mjzghxjNpekkOptrJWF
	 3sKtRg8dsETXXkIznUdrtMbemnRei5eKcpzOWxZFUlZIQUsPMFp2GWMwN9WOXMiy18
	 Vs8biu3OoJ3RnMd/wrKS4mNPb0Jnl5ROv1AJAS4e9n5MrQmcw7lKnVLHzXHF7oM7Id
	 xM2Lko5+d6b9V7CP9vbkxENNqiLgJCxos1fQ89/v+XfEioc9DugxpCXa7FAwWRIHky
	 wxHObjK500NPA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 045A117E1537;
	Mon, 11 May 2026 20:21:22 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 11 May 2026 21:21:17 +0300
Subject: [PATCH v2 3/6] phy: rockchip: samsung-hdptx: Drop TMDS rate setup
 workaround
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260511-hdptx-clk-fixes-v2-3-664e41379cab@collabora.com>
References: <20260511-hdptx-clk-fixes-v2-0-664e41379cab@collabora.com>
In-Reply-To: <20260511-hdptx-clk-fixes-v2-0-664e41379cab@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Niederpr=C3=BCm?= <dubito@online.de>, 
 Simon Wright <simon@symple.nz>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_112126_366646_9A404930 
X-CRM114-Status: GOOD (  11.91  )
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

While at it, get rid of the extra call to rk_hdptx_phy_consumer_put() by
moving the statement at the end of the function.

Tested-by: Thomas Niederprüm <dubito@online.de>
Tested-by: Simon Wright <simon@symple.nz>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 26 ++++++-----------------
 1 file changed, 6 insertions(+), 20 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 12c259d9544c..b5354a24b6eb 100644
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
@@ -1701,9 +1685,10 @@ static int rk_hdptx_phy_power_on(struct phy *phy)
 		rk_hdptx_dp_pll_init(hdptx);
 
 		ret = rk_hdptx_dp_aux_init(hdptx);
-		if (ret)
-			rk_hdptx_phy_consumer_put(hdptx, true);
 	} else {
+		dev_dbg(hdptx->dev, "%s rate=%llu bpc=%u\n", __func__,
+			hdptx->hdmi_cfg.rate, hdptx->hdmi_cfg.bpc);
+
 		if (hdptx->pll_config_dirty)
 			ret = rk_hdptx_pll_cmn_config(hdptx);
 
@@ -1715,11 +1700,12 @@ static int rk_hdptx_phy_power_on(struct phy *phy)
 				ret = rk_hdptx_frl_lcpll_mode_config(hdptx);
 			else
 				ret = rk_hdptx_tmds_ropll_mode_config(hdptx);
-		} else {
-			rk_hdptx_phy_consumer_put(hdptx, true);
 		}
 	}
 
+	if (ret)
+		rk_hdptx_phy_consumer_put(hdptx, true);
+
 	return ret;
 }
 

-- 
2.53.0


