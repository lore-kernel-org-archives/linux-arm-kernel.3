Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 395D5C88E63
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 19:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NfuBhi93xftDhshvbIutU6M31n4jH/ZjDQQ4jx2k6og=; b=xjHIL3Dlhlo9lMdJ0QdJ9eorwC
	5pANYD8P65Rwi2kzv8TGlXq5+4YJfBUp+X3qBAbF3Zi4+7yh5aqp1vXZthRjct6SFAuo2hvLlp3GX
	RqtNwnBupDhllVoJl1Ccs4W0dXkCY9gFJdg1V9p0buKSglp0t+WxZiojGdJ8QlOb9LJM4Gwm3XW9i
	V4E/ywWk7F2ApVs9MKDWnLLGNU2NpTtbejWiMJxnvQb1aLoawCSXf46MUhw6wHZbhR+1wWPlX09cD
	KVGzo3fazHs0Y40WCNRdYHJRxMV8I4l0i7pX01Mc6waMcQDmRZH+1Ut/EOvb/IZ/etx7jauvOT+Al
	sWE6OP4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5pQr-00000001wpi-0QxC;
	Sun, 13 Sep 2026 19:00:05 +0000
Received: from mail-pj2-x05.google.com ([2607:f8b0:4864:39::5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5pQn-00000001wmI-2H3q
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 19:00:04 +0000
Received: by mail-pj2-x05.google.com with SMTP id d9443c01a7336-2d952ac253dso15530845ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 12:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789326001; x=1789930801; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NfuBhi93xftDhshvbIutU6M31n4jH/ZjDQQ4jx2k6og=;
        b=XKiHiArtGJ7IiF/7LbOoqAywiQnj4GCehasrPWuKyk99HStqW7pS9qJPSFiyaPbojT
         +t6UUTRd4Qmz51DjSyoVgOmEa9SVd2lic4MuL8w96C6yMcgXHnun05//uwnV54egVtKu
         7Lu+iCSX/RdkTYAufwUK4jeFiF3OB16/69Gkb/vEmv/JGfq/xXaBi6iwBtzKo8Ai9wcM
         l6hNmHDgSVGNyM5RtxP3HXldiCy0EELdrociXIy23GAhZlC0yvGmRICMtTzaet+fgM3h
         DIO69iPhqDyGNF3OIGnmuxJcJiwBY/Tlzmkkcr2eklvIXUhFZp/mtjTUgIcE7qrE4gna
         UUxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789326001; x=1789930801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NfuBhi93xftDhshvbIutU6M31n4jH/ZjDQQ4jx2k6og=;
        b=Pkmcchf57QGCMmpU4Pu5N9HmgxO0hqL0yLq6FyMkxa7Z7pJhKy38vh0XliRw+7nT3q
         0QK4e8cL9FdVJirtRiSzTfcNDWYc+SEYjW98xMS6XR/TRmR3P8OUO/l3dGJMmFFTHTJ5
         jZyjO9ot1oILD/DQzTdyfVWP23dCUXzsSkTOadyYyMwlgfkllLLCCGbIS/ZpRPMeo8bD
         D98g6xgB2gf6MHb9Og08i2jwS9SvBlunnvPzQ7oHELR7BpHDVs6TdLMTFXSgiq1tLy9a
         DFrYWuAKjd3bp0X6mFFGEXhjiSz+NC/w+P/h2RxvwR8PnnPEBqwB+fr8SoyU8xsMbKzh
         Bk3g==
X-Forwarded-Encrypted: i=1; AKwUvBxPxoZCv6ghup0QPb4zdt2jilYDY7CN1oU7zM3rPd3d+pbzksO9NzsPAl3R9N1JJLcsdf2VLe1Ougaxb4AQqEGa@lists.infradead.org
X-Gm-Message-State: AFuF++lvOr0RU8hvMQDIeWuKv9LvELbl1b0iaurjz/PLJhTkSGoi4e6m
	Xh3oQuRsp8UsFFVbvK4py61XYysZt9Fcot2Vr9trtTL2x25yV+p6lMMW
X-Gm-Gg: AYBFou1gE9r2qUNaGTxqo5x8uHKjPKILM1igEIqe/ffm/q8WDdQIruHdeV6JxyTreiF
	XytYmjBIp3QGhDBvgF+NkzIuKlHa34eu3Tf2VSqyhobRaPzCn2/pbJTd0EaLtQ1eCNPPhBsKcMU
	Xh4t6ia0vN4U90GmvYO/dwQaAF4xZa67PsjTtDJp4ZOmlXoDZdYIddST12rI7hljIccDpVg01x3
	rKsskSR6thubUXxlU6nPcLr4jWxh2sDfdYp6O7850aMxKKiWDdcrkuboIWaRmWZEJg/Zz0ZdG3X
	UFp+3ZHe5I7au1k7IEJGnIgG8j00bGolIrayAISBouupVm26tfbfze4z2zydf0WXuDYuoZU/yoY
	agvjYS22jzpqZc9FzH3Ze+BMkpqMWUz3b/lEmw193Dl4CliMuCz97GS6Khx77Wwh5AH76Nduq+f
	f7tYz4UCxOxva3KlhMyGISd1fXrwe7SIVEPqblsl1AE17mmgU/1oG3BT682ok+PJykjRQ0yA==
X-Received: by 2002:a17:902:ef4d:b0:2d9:3850:2741 with SMTP id d9443c01a7336-2dd4ba93866mr153810795ad.0.1789326000804;
        Sun, 13 Sep 2026 12:00:00 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cca6b7bsm36808655ad.3.2026.09.13.11.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 11:59:59 -0700 (PDT)
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
Subject: [PATCH net-next v5 03/11] phy: rockchip: naneng-combphy: add SGMII MAC selection for RK3568
Date: Mon, 14 Sep 2026 02:58:38 +0800
Message-ID: <20260913185849.907479-4-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260913185849.907479-1-coiaprant@gmail.com>
References: <20260913185849.907479-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_120001_645149_89F19861 
X-CRM114-Status: GOOD (  16.30  )
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


