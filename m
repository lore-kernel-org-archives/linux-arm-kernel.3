Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D131FF8874
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 16:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7I0CikoW/Uh6HxO7gA1Etcib4aUiExb0DVV7lXNCR4I=; b=UdhxdkaToBiF+CzH3zBKeSVhY5
	eIlf95aAb1hMJ7wPreqH9G0TwhaT39Eajx3kJm2fhQTuQW3w+6P85Xw0w/PUoPIsZegZXbnD9NEFC
	4E/IYzNcJ82GNPvopjNk51O+P1wApxuufBKt+3BRpBSAZIVUridxYTCXGwbJGIZN5DelOfknFCr71
	eoFSTylnbhgakRCNscIbVBObB2PBT7OdCl0L7wHgGJdvJWYMIu56vDuXn5Yc9giVCcKe/zh37Nujr
	ttD0lfHV6AMJGiTbQM1xLFsfm0MRnuJTs7oHUqygTE2metHmYG2odTHMk4aYY7XCasenwRD3gR9DP
	hXzqR5cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHl4f-00000001sqI-463a;
	Tue, 28 Apr 2026 16:14:13 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHl4b-00000001shY-1zmn;
	Tue, 28 Apr 2026 16:14:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777392842;
	bh=R0XOPqv8eiGOecv3syiCrtkuFgE7i0W5yOkkzmXW81o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=G/h+70jdn6Ul1cBNr1qYdBgAsoVur3WzJqhtJRImIhyZJ5tT6+V5JMj9Qg1O7M560
	 CFj5PVla0gedIYVD4d51xw+JBwjwPlwoAesP7eYrnSObHZTF0LRHAC6Y8irlE0sxMY
	 H3WLk1qQxcqblhfBLChv7IMU9P8QQUuX4rbkN+nTU0tKrO4ySgShlBa5N/S+yS1hup
	 LN6CBqpwBY8he5HA7Gh8Wvu+N+1OKZqsuK7VGbnrh9o5lkZW/loCsTkqELCYEkLS13
	 DWzowdyoukdJBoRMA6wNMidAJicttiC2SyMJuGseGx+EMlJj1yhXPw95AxxKL+vsCx
	 ELcuUSkAHfPNg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 40A0017E1584;
	Tue, 28 Apr 2026 18:14:02 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 8E8FB48004E; Tue, 28 Apr 2026 18:14:01 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 28 Apr 2026 18:13:49 +0200
Subject: [PATCH v4 10/16] phy: rockchip: usbdp: Cleanup DP lane selection
 function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-rockchip-usbdp-cleanup-v4-10-7775671ece22@collabora.com>
References: <20260428-rockchip-usbdp-cleanup-v4-0-7775671ece22@collabora.com>
In-Reply-To: <20260428-rockchip-usbdp-cleanup-v4-0-7775671ece22@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1832;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=R0XOPqv8eiGOecv3syiCrtkuFgE7i0W5yOkkzmXW81o=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGnw3MnMoM2ETRknEAFMzdGLUCkYpjQ0JeJnU
 cGBq/Rlx/v0CIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJp8NzJAAoJENju1/PI
 O/qaMSAP/1v8tDrHW5gPY6ZZd1M8Iw5rOtpMS8VAr4znEpcRNzlJpToFT2yIkzqUnj4TqMVRRlr
 RllfdRzVEIVByqTF1OvSlP3nFGAvZvlIT35uQvF6r/wh1W+2VlWCTJhYQh7xZmAGQ9yPpY3BQcF
 i5FVxqwn9VxLGD1UHQnnY8TgyaW1sYTJS7SMSAHHGAeye04ma1AX8JhTgRQeOSB04/4gEHsyBbj
 utVrMPxkRUlwX4dyecx8JnZdJmfmGtv24OgUc6gD1Liml/hNgGN90WOawy5K0/JHW3+1Gb78ZGy
 o7X/79YvjFisc9tqzmiU4/IrTr8ywdSr6sZMkKZ2iAnn2jCcQ+oPF0e0ps1rRkLIKX0rmZSZD39
 RaLtrdW1F+x6c+5/EGNBrEdQIU/PXJjZRfOnGXcW6yjkRHLLZsptayCd6pXnd9+8Ts+GAuAvhrs
 h455Pjz2pu8H/b5+Z90DGjviG2Zvy/pRY39R6a7cXEro4BzG0QeMDuscRtsN6Ihb0rmq22I7XRF
 Ttqf/u43eeVRB0+PmlUtuIl6Ps9++86ot8FmaxVQTNUjnFryijO/VROwaWoCU5vj4O53CVDueYT
 OBbbtGmuRK/6sOQkdWtxZTo4POTD9oEm+GZw9kGBg8MpGlBkNsvhzrwnU1sIREy6Cc6dbHh+Q+S
 In8ic3A/GgNG+H5eG45Y1GQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_091409_755294_21A5D8FF 
X-CRM114-Status: UNSURE (   9.97  )
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

Use FIELD_PREP_WM16() helpers to simplify the DP lane selection
logic.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 1bfc365e2b2c..beab20e4c512 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -550,30 +550,16 @@ static void rk_udphy_usb_bvalid_enable(struct rk_udphy *udphy, u8 enable)
 static void rk_udphy_dp_lane_select(struct rk_udphy *udphy)
 {
 	const struct rk_udphy_cfg *cfg = udphy->cfgs;
-	u32 value = 0;
-
-	switch (udphy->dp_lanes) {
-	case 4:
-		value |= 3 << udphy->dp_lane_sel[3] * 2;
-		value |= 2 << udphy->dp_lane_sel[2] * 2;
-		fallthrough;
-
-	case 2:
-		value |= 1 << udphy->dp_lane_sel[1] * 2;
-		fallthrough;
+	u32 value = FIELD_PREP_WM16(DP_LANE_SEL_ALL, 0);
+	int i;
 
-	case 1:
-		value |= 0 << udphy->dp_lane_sel[0] * 2;
-		break;
+	for (i = 0; i < udphy->dp_lanes; i++)
+		value |= field_prep(DP_LANE_SEL_N(udphy->dp_lane_sel[i]), i);
 
-	default:
-		break;
-	}
+	value |= FIELD_PREP_WM16(DP_AUX_DIN_SEL, udphy->dp_aux_din_sel);
+	value |= FIELD_PREP_WM16(DP_AUX_DOUT_SEL, udphy->dp_aux_dout_sel);
 
-	regmap_write(udphy->vogrf, cfg->vogrfcfg[udphy->id].dp_lane_reg,
-		     ((DP_AUX_DIN_SEL | DP_AUX_DOUT_SEL | DP_LANE_SEL_ALL) << 16) |
-		     FIELD_PREP(DP_AUX_DIN_SEL, udphy->dp_aux_din_sel) |
-		     FIELD_PREP(DP_AUX_DOUT_SEL, udphy->dp_aux_dout_sel) | value);
+	regmap_write(udphy->vogrf, cfg->vogrfcfg[udphy->id].dp_lane_reg, value);
 }
 
 static void rk_udphy_dp_lane_enable(struct rk_udphy *udphy, int dp_lanes)

-- 
2.53.0


