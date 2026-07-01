Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4010DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 23:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5gM2SAK733paqDeavrynuI4WOcaA+ExN2iFE2VDLmAg=; b=hSlfpVZ4uoa4Ns0Z3Bg0HMxtRq
	cKdY7ZbHGVmipSo9cq/etjFJ2KdLnoBOZQ83GColfdHBjyeVtV//7Kd78Zr+qp7mYtPIDU4733jbP
	/SJB/jbUJxIGkTCFfOJLF4q8rKbeQx08prM018gP76vDHExLRuLNoc17o4SSpDgKotmJw50zvy2bQ
	hgIZiIFriHPBsgzO8FID538Z/2vt27mkxs0J0lrJuxPwb66SDkuwbpSxT7pQJQuipwQFV176ztBRt
	80+1cgevpXcqCGVM2rKaj/iZiBkGMXAF2szKhHwWxOE2oF/09pWpk7FegzAXCCaa1xF6y8Be+iESy
	SIZf+sag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4TY-00000003Abh-41wG;
	Wed, 01 Jul 2026 23:36:17 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4TI-000000039sB-49B7;
	Wed, 01 Jul 2026 23:36:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782948949;
	bh=HgvCiSF6+HBl1ARUC+1/hn82j4mjb1gI150BiAa3wPc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jQXZhI2F19+oNO5OTfyvbIgRjOTRRyepGicrMXucZ3j6qN/FhWGXk5GvcWKM5CrWD
	 VY6cq5oBcvEhEICHyZu2fiFKU9sOiRCYI16Zh6BSmc8HI42uyoRNVd8t3ScCkwEjfW
	 kOQOyeFcY2bRZEhXe9o8B+DpJ6UsDj9ds7NZfGihukNpp073TMFJLbxA/qpYyGxImo
	 l2IUhxoIM8PRBxesLdAXGa5Ckm8BncJzf0CffrYZb2tg9upX/3LNv3SFqChqaMOsuV
	 99icaamdBgdPAxW/YaZvSDShU9Aa7dr7q79R4YmanGXy8hjBI5bJLuC4lT6KfWLMl0
	 5QsEJENeuUOjQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A1EF417E35CD;
	Thu,  2 Jul 2026 01:35:49 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id C4527480061; Thu, 02 Jul 2026 01:35:48 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 02 Jul 2026 01:35:54 +0200
Subject: [PATCH v9 16/38] phy: rockchip: usbdp: Cleanup DP lane selection
 function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-rockchip-usbdp-cleanup-v9-16-e31efbb62d2e@collabora.com>
References: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
In-Reply-To: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1889;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=HgvCiSF6+HBl1ARUC+1/hn82j4mjb1gI150BiAa3wPc=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpFpFPhr6P5DH9X4SAWGs08kT5cI59v70Kop
 L8K86P2KPMuBokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqRaRTAAoJENju1/PI
 O/qaMuQQAIAD3pNVdDoe1r8m+0WUzJkMml1+HvXbVbFkWN7uFQmILJHOcpGC9IYz9Mxu8ZgPVxQ
 XyR2QfX6wwgcw67GExh4rIUkrr403KP4sRKxaNUWhIrfBy+Eyh74LtVNTph8zTxBqIsvsIWY8lJ
 wYBuYyhwf5a78Xr/ggYKgXqsN1iV8WubWy01g4rL+sjmu/uBpSioL2fNtftw5PXRW8dRmqiW4x6
 wq702EKBzMIpS6mPjls0wH/HnCjMJ2260Ju9LziZh2V2HBkajEjb+hyLd7v5ahnZ6zMqgAUv9tg
 k3Rln3sITR90SBMPr6D3XLZZtyX7AmXVdMPvAO9pUW0LgUxASw0cYBzi2m6uzcTBxLzf+OCpRir
 RikfBzpdVTdHfhuUZXwJUQe7ttswNFdx2RAwFfjEShPbxgr6J9h18wm9TbZKBCNFwR0FfV7zAMA
 87RZsP48k+BumWrsqNY2n1i849I7ujuFlXUTv0tE3WaH0Exnf4DirMEcwAwS3uHom+GI5EeK9o6
 zXBjsDhZqH731Z3AaGyFILflrFDRpSiHAjp2ifYcz1VpUi8R7DgzY9jsEwSRfgKo4/sOkj2y3kK
 YehWAOh/ppGZXSrXMiWZAdf/xRPOAUDYg9ERg5uRqW7BJF3bd0UzakAeC1eVp5Tdpk8EpAqKuYs
 swfj06E1RppmwyT4dWu8ntw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_163601_223397_1BB00FAA 
X-CRM114-Status: GOOD (  10.52  )
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
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 3124bcfed031..5d3db696d51f 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -553,30 +553,16 @@ static void rk_udphy_usb_bvalid_enable(struct rk_udphy *udphy, u8 enable)
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


