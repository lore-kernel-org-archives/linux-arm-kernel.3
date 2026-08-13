Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD6A7C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 20:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lH2Bi+iTSwiQ6ko7XetyCEWRO7KFfqgRrNxUuCs8rNY=; b=IUEA8jS1jYf5JVJQjbOLElhGhp
	XENuqsPBa0p/575kcW5mte1NOHo2A72F2nS2vgB33vIF1E14shoX1xZz5Nzx+rNirlolcSCrmDkN8
	GeNLdurCOj0IUHsQq+pVvAUAapcYz2lxj+zzQzi6kzB/9NCQcZdHm/5xWXjGb9Q/lhtrlLxAhN40o
	VxgAfmnjkxBAx+up847yt5uND+us+F+twhVEFhUC5w4TsK8U3KbUL4YIVXTefO524jMsblpnXdt/o
	/oRHAXpF4Pvkwz/eB2zQlL7+NaZkC6h7hwshNe1Ptg8MLFmTeKE2MyIsHnWOQ7w9rgwluxTa+3ePt
	R95Z/mRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wucPy-00000001YJR-4AOY;
	Thu, 13 Aug 2026 20:52:51 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wucPC-00000001XHc-1s0m;
	Thu, 13 Aug 2026 20:52:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786654310;
	bh=gYo8ZdwJQt2jcl1LHnu0KFTMc5hTBvvmyiku4CyfBXg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UMtM9ZZhSeZQZbxXetA1OLiIitLFpYzg9wQrwhLhZE+ZFCk5xhWzA+tq3ofKzD82g
	 penoDL7QpAfmfxyZMSxrsILN7BkF8rMmWOSR5htPDUbWT9SWXbwSNR2eoIdSDeIXiA
	 V0AK22L0GOPFmLdF4Mmfovkv83MQ5VDbdUmS8qtV1PB6+FbkRzGla0tHhEJBXry5Lt
	 9ueSVs15BZcRoVbSa3RS4f685OYVNxfqPGnWElDmSBTMAmdHcqOu//737qck/fsNBd
	 YnmuejL0BjoR5aYhtoyeqNINxiR2q/kKcXWogKOE9Jx50oOEvN18cf9B2Vud1N0tfc
	 jns70YVD2PAbg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7F26E17E12B0;
	Thu, 13 Aug 2026 22:51:50 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id AB62D480055; Thu, 13 Aug 2026 22:51:49 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 13 Aug 2026 22:51:58 +0200
Subject: [PATCH v14 15/38] phy: rockchip: usbdp: Cleanup DP lane selection
 function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-rockchip-usbdp-cleanup-v14-15-b5ad9c68fa11@collabora.com>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
In-Reply-To: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1958;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=gYo8ZdwJQt2jcl1LHnu0KFTMc5hTBvvmyiku4CyfBXg=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp+LmQre6NY0SZpmrhoSkgK81bsYLIjNju2c
 OUMMADbwGQ5OIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqfi5kAAoJENju1/PI
 O/qajtMP/0+5WKb9MK5qbJ3cqJVR7zAat/xQVgkGpYg1c4iG6atwbcDWGiDiO+UVP4ccuu6vB1c
 b8WbBOLOB5KzDeRvbEDEFYab+V4XO/UQFqH2f4T6mSByCrfRJtkRYFG+liQP90or70jR46t0oJU
 hMNkezpESBtyvTz6NqWdIc/f/bJBTfnvpiGg/UG3G1cRBj2r0DAQQZxZDpTshHqYwxgxO7jPpxd
 SgybPgn35A0PSvLlpitynrxXcYp3B3qA25Zi4Gt3gFW92GxdoGtF3z952eXUX8Rdxn06Nt/qOCN
 fkik6rUC5WACXowcuKTln8NjgsWHmGxs+GlU/VZWVqXNqe++GeoL4urJZ//lo7rZ6jiV7lpyCQe
 sNHVgKmJB+ytq7lKhl/KwdXVDg+BIcph9C7oA7x0VP+rPW1pGaeoVPtZrgndsOnQ4TIrJ6NgXwW
 xI8+Kk9tdPR0OOUm7Ix3qiIpIjNIfQi1e+1Kd+6Dx3hY6Evow5J4PNNvnWnAj2tAuuiFXORAvjm
 euLh1otQiiYBefvhGwNDvGS/LY8z/BqntA63WFXNH/yKqgHrDBW+TlnUj4P+4C4iTk7LiCIMAlY
 wvqsmYKdsY1gD0qhdKnqhrl2CGskev4mi2NUfwc9fSSgEF18ocK4P6yiFvjZIv3Wn5XnXi2FSwg
 d1Yq0r0tN9Zgz42AGTQ4wlg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_135203_003587_5D4BBC35 
X-CRM114-Status: UNSURE (   9.89  )
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

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 05593e98c16d..eda3f7a1e267 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -548,30 +548,16 @@ static void rk_udphy_usb_bvalid_enable(struct rk_udphy *udphy, u8 enable)
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


