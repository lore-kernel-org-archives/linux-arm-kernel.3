Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C290C982D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 20:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Rz7MTGiT2Oa/TzTvQEqnIct/KOrKk64RBkMgo9sxQM=; b=i3s9aDiXn/Ii0GypDWKKuzvDv2
	LSMpjOx/uZ/RYuZT1DF+8Db1D79oUUrqlLz2dknryxwwyE+M8BISHlQo9UNaCcXdzRU7AiIAbxUZg
	h0hAdCYrmRGMLfdjO/oH4R1pL0ai4blN+Q6vx8kw4TFY2ngsX/1SELkDlb2g5fIZAeZU5LSCZ2fTR
	+3Scgz2PT2yyEX3afasRI7eXqJrqWIZohN+ysbPF+K0M+zmUukLndHFnVJ5GV42ZpThXpsQGQYi9O
	u84eMXFC1LCmUxYq4NhddBvJbIDOLnTElGfMiDm2UTKgdWg3jMEonQdQ3mO6NtPHrkgyd1WD9/sEj
	BbxIz46Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7J17-0000000CSfJ-2SR2;
	Thu, 17 Sep 2026 20:47:37 +0000
Received: from mail-pj2-x0b.google.com ([2607:f8b0:4864:39::b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7J13-0000000CSbm-3n9M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 20:47:35 +0000
Received: by mail-pj2-x0b.google.com with SMTP id 98e67ed59e1d1-398a384b5f7so56268a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 13:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789678053; x=1790282853; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Rz7MTGiT2Oa/TzTvQEqnIct/KOrKk64RBkMgo9sxQM=;
        b=LwuOT4pLaLcaWj46933wZGFKnhjnbLBu/XaisxUkQwompIp8xfgvji2Mv7b/j39DRp
         //B0HdJOvAkSzhk2voUN9TAXvwAFKmqc5lf1+/MahQ209sBynDQ6Dcywglb0QiSc8Cyi
         UbFvl8WgRBGlsB1NTwsvpLlkeItKxdE8LeImr0j6YsIAK1ipyBdqZbr8hbxOn4zhM/gG
         DcPcWEKqrPsouw0JreAWyRyCksysjb07Cfa2vsJKn/p3qoTSTSgFfq+YSUSghckWDXps
         fAR8FTz/NB0LPXHPcLhFASwETcvOWAeyuKa9BZHG6Bp+qxEKJLo3KlmTe338GHvPVL7U
         kpmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789678053; x=1790282853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Rz7MTGiT2Oa/TzTvQEqnIct/KOrKk64RBkMgo9sxQM=;
        b=tyqlA084zYuq5FbhZkDmpWs1NUQjQe1t8mS1vakMzBVwobjHM5ZfEKm2EUxCTVlT+q
         mSChPjy4obRVtWpjUt6/bszDTnCrqwxD3JnqkFwIFzu45PyAkV8O+no/OVFiW8//SR6N
         /wygHNLfjG29iDue5/OcS/YhAQGjxXlSFOCTRYpNsDCxDOngMa234Vpn/zm0vSawu+9N
         ZrZ7KwL8blGkNNMSCgNwhqFQBsA7Fmqq7so1Z+nAHfE8MawSqGJKGssTdt62AIHbIlTk
         0z8a1onQDoyFwW7VH1I3+AYPXPAd74zuNSRLsMQIY/JHAKZjny2QmnhX1xj3/Xf5eHME
         jO3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwvaQIrA6AdwNUb4OrZJRuZtYk8u8fCmH5DBjsC4uWaUoFkXcovfdRH/CecQ3HWGfbASkPdEL4TBYTzs5w4rF8p@lists.infradead.org
X-Gm-Message-State: AFuF++lL3UBUNw0DONg9Ke0hHDkdifeHz/QuCbmR5ZNwy8Viuo7ZnLxY
	g6Uy8RYMa+7hRZTmfaGsC4WoXBrFKndenncprQCxX4g//dtGLHeWS7vA
X-Gm-Gg: AYBFou1howNohKVGJjweCHafkYsqyJOxx1SMuvR+JPQN2M+UjFyWAzjTB7ubaYPWchK
	JuJpZBi/nxVZvdErNt3BiVofYg8fJK3oHPkgCruCwFvvaATjzYXOSkaRpnff4SghWtR+f2M2VEA
	r3o7xvVqWD4qzE6WJoi7zXMqG161Nu9I2SYUNAUY4MNIMMMoD8b7dFdsmlw6tSTlWYKwyH4tMJr
	zZI5Sos+bR7oKctz6cxafR0gngld8YSMNtJLQYDtxmu7s4tjjpsAtcO4IsZRS5i8yt9fPU3LiLK
	B6oaP6zQDyZWgGyriW5ZCIbXohA/xRZvsNYzEb6HZ5cJpcOcSqOdL/tSE6FjLXm1jfNnPfItH03
	KE9KYpXpUpuuBxizQyh1fqmvPaq1jzhTgNpnkG2+gkvBQgkuTVtD43VqqxAwr03oEZ6gS9WMAUF
	FibVEAx78tvduLMO/yB6MoT8XPcoETexVbepCt3+sSu337bwJqu69Zwe6MC8yjRaAQl4G4yA==
X-Received: by 2002:a17:90b:56c5:b0:39d:f95d:bd08 with SMTP id 98e67ed59e1d1-39e55008a3amr1261148a91.14.1789678053238;
        Thu, 17 Sep 2026 13:47:33 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e50a4bc22sm1232196a91.17.2026.09.17.13.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 13:47:32 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Vinod Koul <vkoul@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Coia Prant <coiaprant@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next v7 03/11] phy: rockchip: naneng-combphy: add SGMII MAC selection for RK3568
Date: Fri, 18 Sep 2026 04:46:14 +0800
Message-ID: <20260917204624.2427486-4-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917204624.2427486-1-coiaprant@gmail.com>
References: <20260917204624.2427486-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_134733_964096_D05EBF05 
X-CRM114-Status: GOOD (  16.76  )
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

On RK3568, the SGMII interface can be routed to either GMAC0 or
GMAC1 via the GRF register pipe_sgmii_mac_sel.

Add support for this selection by introducing
the "rockchip,sgmii-mac-sel" DT property.

From the RK3568 TRM (Part1, Page 229), the PIPE_GRF_XPCS_CON0
bit 1 (pipe_sgmii_mac_sel) is defined as:

    0: SGMII routed to GMAC0
    1: SGMII routed to GMAC1

The hardware reset value is 1 (GMAC1). If the property is set to 0,
the driver routes SGMII to GMAC0; if set to 1 (or omitted), it
remains at GMAC1.

This is necessary for boards such as the Ariaboard Photonicat, which
uses the SGMII interface connected to GMAC0.

Out-of-range values are rejected by dtschema, so the driver does not
duplicate the range check.

Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TRM%20Part1%20V1.1-20210301.pdf (Page 229)
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 drivers/phy/rockchip/phy-rockchip-naneng-combphy.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
index 7843356a4dd47..7b867e7520064 100644
--- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
@@ -186,6 +186,7 @@ struct rockchip_combphy_grfcfg {
 	struct combphy_reg pipe_xpcs_phy_ready;
 	struct combphy_reg pipe_pcie1l0_sel;
 	struct combphy_reg pipe_pcie1l1_sel;
+	struct combphy_reg pipe_sgmii_mac_sel;
 	struct combphy_reg u3otg0_port_en;
 	struct combphy_reg u3otg1_port_en;
 };
@@ -212,6 +213,7 @@ struct rockchip_combphy_priv {
 	bool enable_ssc;
 	bool ext_refclk;
 	struct clk *refclk;
+	u32 sgmii_mac_sel;
 };
 
 static void rockchip_combphy_updatel(struct rockchip_combphy_priv *priv,
@@ -375,6 +377,9 @@ static int rockchip_combphy_parse_dt(struct device *dev, struct rockchip_combphy
 
 	priv->ext_refclk = device_property_present(dev, "rockchip,ext-refclk");
 
+	priv->sgmii_mac_sel = 1;
+	device_property_read_u32(dev, "rockchip,sgmii-mac-sel", &priv->sgmii_mac_sel);
+
 	priv->phy_rst = devm_reset_control_get_exclusive(dev, "phy");
 	/* fallback to old behaviour */
 	if (PTR_ERR(priv->phy_rst) == -ENOENT)
@@ -873,6 +878,8 @@ static int rk3568_combphy_cfg(struct rockchip_combphy_priv *priv)
 		break;
 
 	case PHY_TYPE_SGMII:
+		rockchip_combphy_param_write(priv->pipe_grf, &cfg->pipe_sgmii_mac_sel,
+					     priv->sgmii_mac_sel > 0);
 		rockchip_combphy_param_write(priv->pipe_grf, &cfg->pipe_xpcs_phy_ready, true);
 		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_phymode_sel, true);
 		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_sel_qsgmii, true);
@@ -984,6 +991,7 @@ static const struct rockchip_combphy_grfcfg rk3568_combphy_grfcfgs = {
 	.con3_for_sata		= { 0x000c, 15, 0, 0x00, 0x4407 },
 	/* pipe-grf */
 	.pipe_con0_for_sata	= { 0x0000, 15, 0, 0x00, 0x2220 },
+	.pipe_sgmii_mac_sel	= { 0x0040, 1, 1, 0x00, 0x01 },
 	.pipe_xpcs_phy_ready	= { 0x0040, 2, 2, 0x00, 0x01 },
 	.u3otg0_port_en		= { 0x0104, 15, 0, 0x0181, 0x1100 },
 	.u3otg1_port_en		= { 0x0144, 15, 0, 0x0181, 0x1100 },
-- 
2.47.3


