Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0230C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 13:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5FzjIfalSmPM9xnhTVftMKTZvSCsBQQA1SqUiDaI2Zs=; b=IVgSQzIWmo46ngFgbl6FxwghpH
	97Z6GA95BAmGXHQkZCeLq8dH+eu53fRJiIwzsCSd4CHEBH8Bd4ozfDOxBRkIA01Vx/qgFLtbJVmsj
	xNhn5e24uyMC8bkt7Mh6QHleXgcb/bxFrBBe8PG0ARwozVD8Y2xVKr2p4mBtNR0LOcUO1cJ+z49c1
	2hihTpx6U6iUdwtVeaGYpwKaqg/a0UhrUrt4384m11XLpPDryxTRKkWnqX/7hAVuAI8TzRu2ykcqp
	szjGz+RbYl78xnrCKnptsKvmmFmgYLmBRKoxANFdGARcpIxNJNMyKJBZNKzKrRZZu+Ol+TxfcpPqp
	2q6SCyUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuWbk-00000005xsI-3ZIE;
	Tue, 18 Mar 2025 13:03:48 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuWC0-00000005tjg-3cNQ;
	Tue, 18 Mar 2025 12:37:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742301431;
	bh=CbGJo3fnaG0dnRvI8ahS/cX5JHOWrCA6Qvj9/K2MTY8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=D00NnSNlUIZ1TW/XHgDI7suSO3lILHI5JbBf1Bb09Nvs6/O5SpqX19no2TZ9BdqaT
	 dv2Y7l+VkMfei6PXdLI3FxSnABlWeM4dlM7NKq1I/4l8mEx75p2K1zRSx6Ym0kGgrb
	 oumvZs8xNe8iX3wq6ypyfM91leO1DZvyBO8XnYCb+HCLBS6sVXZyMdUgWJcZfZjSTl
	 VqHC8J4UYlr6kGIqI4XsZf4t+r7gAUiNrdx9BFxUkPGx4sTQSwLpbOTYZjXAsrvSXR
	 2TPiFF5Ynkyw+ItYTxwgy0mLYbHXlswP8ou2u5Izt9aVm/xzPgvO4WUnoB28czipDf
	 uuWQbx9PI9xoQ==
Received: from localhost (unknown [84.232.140.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 374E117E1578;
	Tue, 18 Mar 2025 13:37:11 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 18 Mar 2025 14:35:46 +0200
Subject: [PATCH v6 12/14] phy: rockchip: samsung-hdptx: Rename ambiguous
 rk_hdptx_phy->rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-phy-sam-hdptx-bpc-v6-12-8cb1678e7663@collabora.com>
References: <20250318-phy-sam-hdptx-bpc-v6-0-8cb1678e7663@collabora.com>
In-Reply-To: <20250318-phy-sam-hdptx-bpc-v6-0-8cb1678e7663@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Algea Cao <algea.cao@rock-chips.com>, Sandor Yu <Sandor.yu@nxp.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Maxime Ripard <mripard@kernel.org>, kernel@collabora.com, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_053713_075752_87A750EA 
X-CRM114-Status: GOOD (  10.68  )
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

The main purpose of the ->rate member of struct rk_hdptx_phy is to
implement rk_hdptx_phy_clk_recalc_rate() by providing the actual rate
programmed in hardware.  Hence the current naming is too generic and
rather ambiguous.

Improve clarity by renaming ->rate to ->hw_rate.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 2feb46f6d4e5bd2f43140e465cc25d2b0c363df4..a19a89233d808e2b38f6e7e58a1dc38ddd7cadd3 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -401,7 +401,7 @@ struct rk_hdptx_phy {
 
 	/* clk provider */
 	struct clk_hw hw;
-	unsigned long rate;
+	unsigned long hw_rate;
 	bool restrict_rate_change;
 
 	atomic_t usage_count;
@@ -1030,7 +1030,7 @@ static int rk_hdptx_ropll_tmds_cmn_config(struct rk_hdptx_phy *hdptx,
 
 	ret = rk_hdptx_post_enable_pll(hdptx);
 	if (!ret)
-		hdptx->rate = rate;
+		hdptx->hw_rate = rate;
 
 	return ret;
 }
@@ -1830,7 +1830,7 @@ static int rk_hdptx_phy_clk_prepare(struct clk_hw *hw)
 {
 	struct rk_hdptx_phy *hdptx = to_rk_hdptx_phy(hw);
 
-	return rk_hdptx_phy_consumer_get(hdptx, hdptx->rate);
+	return rk_hdptx_phy_consumer_get(hdptx, hdptx->hw_rate);
 }
 
 static void rk_hdptx_phy_clk_unprepare(struct clk_hw *hw)
@@ -1845,7 +1845,7 @@ static unsigned long rk_hdptx_phy_clk_recalc_rate(struct clk_hw *hw,
 {
 	struct rk_hdptx_phy *hdptx = to_rk_hdptx_phy(hw);
 
-	return hdptx->rate;
+	return hdptx->hw_rate;
 }
 
 static long rk_hdptx_phy_clk_round_rate(struct clk_hw *hw, unsigned long rate,

-- 
2.48.1


