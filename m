Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97614CD98D9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 16:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dTSdoz6MsdqXMeN8ukkDwsmYmDzAuiKxz+7/v5rQrg0=; b=OFuM0qxf4+LBqQCgWI+YilbtAL
	tfmC67B8OASQBWPBoDkcYS5pSGoIeMWnCLLVJpaJYBVyFbQ0qbDDFa6za1jYO16MXx2GxVWhVT4gC
	ItotSj2ALAUZ6MNCcy9cTIOs3yHcol9c3CMe7WRLsIuv3WjrSkVALeame1SWDMDx2d4AG0e+X+wYn
	lQDkChkuC+K02k3rekWzILzhn/BWQW+GBHEyLq8Z4LaF+nttgek64i1qdRAcdL6JW8lmXGGbdYgZf
	8/073GtqTwpqdp9RYb123nqZtLzIVrAJUsBVG4FD33HCTAjDCwsPTDnV/MjAIZwdafh3Se/tSX+Tj
	h4eiDTIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4dy-0000000BEEt-0705;
	Fri, 12 Jun 2026 16:22:06 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4ds-0000000BE3w-2ZXh;
	Fri, 12 Jun 2026 16:22:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781281314;
	bh=Llc5oNOs5fL0NA/jBwIwMrc+QvV2dJg2k0ue+PtI3dg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FnQKFhJB5jMpH2dxnYBwNWadJiEP9+KwZ7MIpabq0ux00DzfnLdwynLdINpPqngjG
	 FbLbEzDc5T5k35XWajjAEeMjKQ66e6tkj0vFG0TTlUIW8mgjvAls+m5rFUmPZldumB
	 PQv/tPIcY3IYRo25JLM2T80nL0goMdXT05uIcN13m7Dud0iHMkWUB4AUCZibv8Jriz
	 c74+kCZz5+4XAqGdqcxtk6hkn3gDO0ZZiEK3lPlH7wok+NoxcvsftwIlSEf6+VqkVO
	 CvjM/7Dr+NiQAa1Q7h4bPgzCrXvDJjEGR6F4ytEKt8OAYyi2iFSA6PTfZXxl41/Xuv
	 vloeED/VWpjUw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 831FA17E0FD0;
	Fri, 12 Jun 2026 18:21:54 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id CFD03480038; Fri, 12 Jun 2026 18:21:53 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 12 Jun 2026 18:21:46 +0200
Subject: [PATCH v5 08/18] phy: rockchip: usbdp: Rename DP lane functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-rockchip-usbdp-cleanup-v5-8-efc83069869f@collabora.com>
References: <20260612-rockchip-usbdp-cleanup-v5-0-efc83069869f@collabora.com>
In-Reply-To: <20260612-rockchip-usbdp-cleanup-v5-0-efc83069869f@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2007;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=Llc5oNOs5fL0NA/jBwIwMrc+QvV2dJg2k0ue+PtI3dg=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGosMiEAJFRuuHMFMwK/sfeqQAnhZ+8Lh5uT8
 WesgYdzyjB9/4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqLDIhAAoJENju1/PI
 O/qarm0P/0PrTgVH4Lf0GpBOy7EMGCebhVpgzt3CZdSYGqUJ4BLdNRUWDatDFyevEdZpW9yTAx1
 XuG4x1JXbi5xRuw5RmLxWRN6Pv0uI7v9Fxw8gbg940/IV5/60utCqQABztHs5YPuiOQ3nFGEMWB
 iuhI43bLMG9Qx9pVleHLska3KejHM7+3nQ0NVyTmiNk/VUoPY9R/aAR6uYdu3gO5ZQFtEx8tUzu
 6O08RW2VP4ardvvQG/YELRA7rs59tRzJli2H1S/E6Al393FJ/U40+fzHXuLIKhge8Rly8LP2vbs
 htmzMvSUG7POuYpZR7CyPUpX/KdGGnaT3X+NC+eC8EBfSuf57cM3+tKMBELu9J40n9BQu+oFrfB
 0aVSdAACMdC2Z0Jyf2+S4Jzc+Ig9hW5xE975zEuKY4NRLflKlyqBcWBjnI4S1vLYUT3wZZ6JlfG
 h87IMSbcIY34+DSK35WM1+zmXu9I9okL2HcNRNzMzH1bNwWognVQc3zeeyd8bncpnClrvDzHHbP
 g6lwDqyQo3zoubMGkYukgXGB8rntdCvRKSGTmfFH2FYNYxMJtPuyinv3YyovSi0vpamn8mNcoIr
 LNnJlE3YU3akkntz+IRvAH1xwretkVILCYMjReGnZMCGRM81Uc22jBK4KsonLNbL0rbwXZlqxz3
 WY24mefigQtu8Z25qlDw6FA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_092200_831086_6FFB2F0C 
X-CRM114-Status: GOOD (  11.18  )
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

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index bf8394174294..6d7ca11b308e 100644
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
@@ -1072,9 +1072,9 @@ static int rk_udphy_dp_phy_power_on(struct phy *phy)
 	if (ret)
 		goto unlock;
 
-	rk_udphy_dplane_enable(udphy, udphy->dp_lanes);
+	rk_udphy_dp_lane_enable(udphy, udphy->dp_lanes);
 
-	rk_udphy_dplane_select(udphy);
+	rk_udphy_dp_lane_select(udphy);
 
 unlock:
 	mutex_unlock(&udphy->mutex);
@@ -1092,7 +1092,7 @@ static int rk_udphy_dp_phy_power_off(struct phy *phy)
 	struct rk_udphy *udphy = phy_get_drvdata(phy);
 
 	mutex_lock(&udphy->mutex);
-	rk_udphy_dplane_enable(udphy, 0);
+	rk_udphy_dp_lane_enable(udphy, 0);
 	rk_udphy_power_off(udphy, UDPHY_MODE_DP);
 	mutex_unlock(&udphy->mutex);
 

-- 
2.53.0


