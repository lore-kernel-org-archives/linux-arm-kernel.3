Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E611E8785A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 18:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=61jV0lxlK0q3v932mew2WnuOkes+l/wsYGLWvrcnlSs=; b=yfz40lq09R6pc4vQPdsuRLN+o4
	zvCZCOmADzTSL1r2K/j7C7J0KXmL+l9zs3zq6+2QYqvNceDzut4GBZdCimqueNelHqIXwcxlNnkvZ
	v9lzvggmDLdx4pyALMWPhE5yuCssyxvdQ+8FEwRn+5XFFqu4XgP8xh35E7TCoo/ve64czijIdz77h
	HSMTFYQjRSP/fdE51sLrTwirKqvzpF5fVwpIqoJ0+iZ6x56H8aQLTrzlDctjUM7pjydw6AARuCmvJ
	7Fcs1DfRUjz3mZpB4oXGO08zHFP5O+ZYkAILUFbK8I8gaP34zjW6/fyQjkJTVRCngvVISTbQM7B8Z
	7DQ+k0rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnLLv-00000007B4S-2SF4;
	Tue, 03 Feb 2026 18:42:19 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnLLo-00000007AsG-2QVJ;
	Tue, 03 Feb 2026 18:42:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770144126;
	bh=23Ek+D0JUr6WySL1/oiXZ9jAGAqckHYeinx/bYUytek=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LZ3YUNoIjfe62GY/PTrB0kGX8RVx27yqQB2LtH+x0ut5v9/S5oUEx6toKK2UGMfuR
	 x2zo40TJPFmc9tvZ9/JBTGMDHsbW/GgedXSHudR68//MQfEzHhTmohbv0Ofc6Oxe/5
	 yH+yTI+c5JdvAwz6gyG5ADWVwZr80UQGB46YP6/iZ85+X3o98pjMEwYOeBue/rP/gA
	 +Inh1nRmSraAfntjOag3ddsYFt6da5Pb2eDityEF45LrISsO794c8Sw52NSJRHNG50
	 g54Vxv0QAOati4yke6VOCE8VD4efUlmd23wBp2HbpRhwfDwyHOiZLBQTVTu0hpCVeo
	 D+EaZx0zi1GJw==
Received: from jupiter.universe (dyndsl-091-248-189-143.ewe-ip-backbone.de [91.248.189.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DD7B317E14F5;
	Tue,  3 Feb 2026 19:42:05 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 5232E48002C; Tue, 03 Feb 2026 19:42:05 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 03 Feb 2026 19:41:33 +0100
Subject: [PATCH 7/7] phy: rockchip: usbdp: Cleanup DP lane selection
 function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-rockchip-usbdp-cleanup-v1-7-16a6f92ed176@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1832;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=23Ek+D0JUr6WySL1/oiXZ9jAGAqckHYeinx/bYUytek=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGmCQX3cO7VLg0fclziNsqIVVJmzkjWkZbw/p
 k132EykkHZHdIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpgkF9AAoJENju1/PI
 O/qa/VsP/2A9qRkKR72MXe0pio64MaCVEoJrIbjWckqT0khGMqfW9rTW133HGYeaPEb616+Hei8
 cHhJ3wfQc/3Nb294o6HL8mFxXkMYta5h8K1m1XCT585AXWyL3z1oaC6e708Z86FiFp7gyNXxGgY
 ODyjDivQXaKlVhWWvKbyfwj8lE/DgpG7Paf7trpIhhKWDeeP4A9zSUoVz/yaOr9NE0W3cCUycw5
 Utna+Yry6RWSXa/m3gXkXhHnRFpsFv7aGEnjbPUis6N7M2b7/YH8g25jaOgVFVRHvzWre2vrYGI
 VpUJUhE5azrTX4BtPAMFXCldNmASDci1DTXjsqn5LVXbCZ+Qe9tx0cIXfcQLP3Y/F5vm6qTQcQl
 T/D6lX0+bznIceMGqZG+9k+JBjaQGO0xRW7eLcA90vlkJtFxJJ8WetSvQ51jsGLVnIdldzbqYth
 AFKjSbZYsVXCuqEio5ifeaqXyV/CocMNkVFyXGbXGVze/wQq7/marOaygQOAnRvAwX+7yAB0OPN
 QVRCnp9vjkmWK1+MibaQkCd4oTA9DP2DKb5G8RYwAA0nTeHp4dcIzxlNE1fugWV6c0E9PkmslKJ
 yjLT2hcau4ZTVhyVfPljBBSmqTIF3Qgekvspis8xok4XK2G6hnBhASFDUg7L43/yWK0RK4ug1q0
 wy6Ii/u+oqrtrx7ih5Y8nnw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_104212_775249_C7D62256 
X-CRM114-Status: UNSURE (   9.55  )
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
index 9291f56120f1..ebc11d06e5ea 100644
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
2.51.0


