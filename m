Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B825CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 23:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O8gZkgiDTIH7c2XQP75zrwmG5x+3MemItK06BKv1VbU=; b=qaFN0D3VmtYdiI3xePaXdDD7wI
	a3jc1Qfm9zqvMRjehJm3LSDvdjjw0AjxB3yx+IuBksIAmkRPC4+C3gDB6EQdI8xjJYYronYEFVUfQ
	4beNPMtlV8wBwZ3tiS3kGOqarkOqlGe4gUQi7SVOgiFlDGuubriRPkPPBZ4jD+DFde7tzffYbI/w+
	9w0QNGgOdJ8K8Brl1FE7hYt04e7hYfM6BItvcC/wDecsfyBdGXC6puoWS8TXLU09wC3HZgT0PErYX
	C8MyeJ4Pac92H/z1uF3KggUfvaFOs8+REhe6rpxJcxuFnT4xMUVZgQbXhiQv6UbEtQJ8rty2EG0cy
	F2mxps/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXp62-0000000ABWX-0N1E;
	Thu, 11 Jun 2026 23:46:02 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXp5q-0000000ABKy-0nUa;
	Thu, 11 Jun 2026 23:45:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781221547;
	bh=NJ5RFLXjnsliSEtUl5fK/HkHNb39TECm4kx0OPW7JYg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MJZQ+PkrKzlNA+5B7A/dEgl6YlseOQOKzf18vpQ6ycpd8k51H0cMAtZa/SU7iXG91
	 bsBqW+UNfMKfTUELDLtGZwXT9kQp9JHD0yAwGnLfOo0MduSqpbvryUnf4G5lTepNa5
	 r3XJ0NYrtXzLlv7KzZk2RJ8/ShK9K9+LX/oJggq9v9xzYh/5qiTZoVA3oPMjUIiCZ+
	 Yp4KxwrTON4r/0RRixiU2YOqQ0tjDgo0nNlXy9Zt+cdxysqy69V6RDmr+/fS9SsI5n
	 7SArujprQ/WaiT0nPGFstKiKmRc0faKnUigv+TkuDmAEa2VKFsbc+Lo4aHDdSg/SQW
	 JIavNTGTaoMGA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 23C7417E0C54;
	Fri, 12 Jun 2026 01:45:47 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 12 Jun 2026 02:45:24 +0300
Subject: [PATCH v4 5/8] phy: rockchip: samsung-hdptx: Drop TMDS rate setup
 workaround
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260612-hdptx-clk-fixes-v4-5-ce5e1d456cda@collabora.com>
References: <20260612-hdptx-clk-fixes-v4-0-ce5e1d456cda@collabora.com>
In-Reply-To: <20260612-hdptx-clk-fixes-v4-0-ce5e1d456cda@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Niederpr=C3=BCm?= <dubito@online.de>, 
 Simon Wright <simon@symple.nz>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_164550_383838_16CDE74E 
X-CRM114-Status: GOOD (  12.08  )
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
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 27 +++++------------------
 1 file changed, 6 insertions(+), 21 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 25bd821cd039..35997087d61c 100644
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
 
@@ -1716,11 +1701,11 @@ static int rk_hdptx_phy_power_on(struct phy *phy)
 			else
 				ret = rk_hdptx_tmds_ropll_mode_config(hdptx);
 		}
-
-		if (ret)
-			rk_hdptx_phy_consumer_put(hdptx, true);
 	}
 
+	if (ret)
+		rk_hdptx_phy_consumer_put(hdptx, true);
+
 	return ret;
 }
 

-- 
2.54.0


