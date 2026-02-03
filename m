Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF1FE8785B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 18:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rc9oPF6IGU3th3J4Y1/XVKY/YybCD2Oia+jKf4DRBB0=; b=qs1nVw16q/Dwyvy+VkCPitHFjW
	LHAEXR0Fzk8aNOyENvvKU9MUVoeTcjNF5SU6AZyYaILn0+hK5fqrd3QcYyy55GZzbQwqE3RJ3VuvU
	nnKSA12aJiJeo6sKGvy7ORVI3NRne+/gbZbW1LU8X2dIsKyJ4XjIi75I7pqSk6vxGpXymcZ/j4DXs
	RxEhI0eg0iMQeNYzEKK3Lf3NKOWA6qo4/KBP77DTfU1E8tApCzPFWAnu37NFP20dhTHfqMvXE90aA
	JA05Waz0peNxIiD3rQ7jUSWVfoh7OloeVf5Ch9WuaCDfdwbs/rqWgg9y6Pr/jxgsA4p+vLbd/LiS8
	HQaMUpaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnLLs-00000007B0N-3nxl;
	Tue, 03 Feb 2026 18:42:16 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnLLo-00000007As6-22DD;
	Tue, 03 Feb 2026 18:42:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770144125;
	bh=b711gc4PFK5EzBAqbufG8O3Glxj/rw5vhAJhbZn59Jg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HySFaQGkzh6MS/GFfqOo7Pf9B8Q60D+QyTuK5Aq25iBiVGIZZlZYeAX2rU1lRqAAJ
	 C++jBJL9AuWVNNypXc8oOoW7k94fVhCMAgKkg0VGRYIFvWW24tgLeXUEAH+2GLhH2G
	 SjBVxJfaL/vyteM9/1JnveaI/f/ziU3s7ttLTXE0EEwAECRb39cX3zbbRWpGqpw7pR
	 4TSQs1tg3Lchkcd5DwHc5uQmnhqpeTqRJoehSEAju9fTK6PmrKjlCxsTyBnSCiDkCX
	 at25/0h+rXa34DIs6Dk5evBYui6AOboeWVf3XUo0f+zwtgUaitCsZqxqi4dfseCotl
	 VfPtNVpE9y4ow==
Received: from jupiter.universe (dyndsl-091-248-189-143.ewe-ip-backbone.de [91.248.189.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D414C17E14F1;
	Tue,  3 Feb 2026 19:42:05 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 4F62C48002A; Tue, 03 Feb 2026 19:42:05 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 03 Feb 2026 19:41:31 +0100
Subject: [PATCH 5/7] phy: rockchip: usbdp: Rename DP lane functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-rockchip-usbdp-cleanup-v1-5-16a6f92ed176@collabora.com>
References: <20260203-rockchip-usbdp-cleanup-v1-0-16a6f92ed176@collabora.com>
In-Reply-To: <20260203-rockchip-usbdp-cleanup-v1-0-16a6f92ed176@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1950;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=b711gc4PFK5EzBAqbufG8O3Glxj/rw5vhAJhbZn59Jg=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGmCQX2ozhMASnQ2pYoJAZy+lKBqnYNKWp38m
 kxR7fXndYd5jIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpgkF9AAoJENju1/PI
 O/qaeN8P/ictD1F9ixC+DKx3PW89zPjOjISBEbkQ2OurKReKo63MMcITfHxW/C7gCLzJuPwrK92
 51DiCIKimvID9KkEr+f9PyC5JToLDJ2ge/XP1EMmMlSRvDvgPk6d9JjDUa9Np25Zko60iauGMV1
 DJ8w4vunULfrd0NF1ZhmKZlNsYKn4yemkDX3SC/DD74hx/iTXZfSpd0PqdNBuD6eerFnSuqkaAm
 +6pEHfpVPioEpQADDXfEYAeQLv/dE/3ToAyn4FQmo8ak7nQVMB+Ze1YdyF8fB6n89mxVDEhx2mv
 7+jHl5ybLcSgfqAZBhUo/hxMT5qgGMqwqHzGXVYYkDRdEvX0FxeLpAGF/vX+WCjqw8AKr4y4vFG
 1vinBwQzJn/mT94vYFmHZLjm9prxk8exEFIqBgczpov4dgjruvBsQa81PbvMCgtEJ2zPueXNl1s
 ApRuwlhomb2iMpySrqOzOai3xTzcUKtqs0oq2YxnicYeNzM+tAspcOXrvTyLW3ssPgcAMDnnd8W
 0DQF+mjoxSVqnTdmbYp32whBO2vlfZA1NlAOwOcnpXM08/6s3QBbBmI+StbPXlrXGiVLAYjnYJn
 jhKxX45AEwKvk2GmrHt7rGcGo+5pYKyLJCRXLb0IGI7qqJXWiT1mv2HHHtjidxUzUFMhqN86D9I
 GSKu4CK9fTuk4Oc4vsAkuTw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_104212_701350_2C34AC1F 
X-CRM114-Status: GOOD (  11.05  )
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

The common prefix for DisplayPort related functions is rk_udphy_dp_
(with a final _), so update the two DP lane functions to follow that
scheme.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 29cf3f3bcec4..4388105dd8ce 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -547,7 +547,7 @@ static void rk_udphy_usb_bvalid_enable(struct rk_udphy *udphy, u8 enable)
  * ---------------------------------------------------------------------------
  */
 
-static void rk_udphy_dplane_select(struct rk_udphy *udphy)
+static void rk_udphy_dp_lane_select(struct rk_udphy *udphy)
 {
 	const struct rk_udphy_cfg *cfg = udphy->cfgs;
 	u32 value = 0;
@@ -576,7 +576,7 @@ static void rk_udphy_dplane_select(struct rk_udphy *udphy)
 		     FIELD_PREP(DP_AUX_DOUT_SEL, udphy->dp_aux_dout_sel) | value);
 }
 
-static void rk_udphy_dplane_enable(struct rk_udphy *udphy, int dp_lanes)
+static void rk_udphy_dp_lane_enable(struct rk_udphy *udphy, int dp_lanes)
 {
 	u32 val = 0;
 	int i;
@@ -1074,9 +1074,9 @@ static int rk_udphy_dp_phy_power_on(struct phy *phy)
 	if (ret)
 		goto unlock;
 
-	rk_udphy_dplane_enable(udphy, udphy->dp_lanes);
+	rk_udphy_dp_lane_enable(udphy, udphy->dp_lanes);
 
-	rk_udphy_dplane_select(udphy);
+	rk_udphy_dp_lane_select(udphy);
 
 unlock:
 	mutex_unlock(&udphy->mutex);
@@ -1094,7 +1094,7 @@ static int rk_udphy_dp_phy_power_off(struct phy *phy)
 	struct rk_udphy *udphy = phy_get_drvdata(phy);
 
 	mutex_lock(&udphy->mutex);
-	rk_udphy_dplane_enable(udphy, 0);
+	rk_udphy_dp_lane_enable(udphy, 0);
 	rk_udphy_power_off(udphy, UDPHY_MODE_DP);
 	mutex_unlock(&udphy->mutex);
 

-- 
2.51.0


